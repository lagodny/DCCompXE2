{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uHoleAlarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape, Menus;

type
  TfrHoleAlarm = class(TaOPCFrame)
    Panel1: TPanel;
    lHoleName: TaOPCBlinkLabel;
    Antena: TaOPCImage;
    NoAnswer: TaOPCProvider;
    Comm: TaOPCProvider;
    Manhole: TaOPCImage;
    Dry: TaOPCImage;
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure NoAnswerChange(Sender: TObject);
    procedure ManholeChange(Sender: TObject);
    procedure DryChange(Sender: TObject);
  private
    F_ManholeValue: double;
    F_ManholeOldValue: double;
    F_DryValue: double;
    F_DryOldValue: double;
    FOnChangeManholeError: TNotifyEvent;
    FOnChangeDryError: TNotifyEvent;
    FMError: integer;
    FDError: integer;
    bDryValue: boolean;
    bManholeValue: boolean;
    function GetManholeError: boolean;
    function GetDryError: boolean;
    function  GetImageManhole: TPhysID;
    procedure SetImageManhole(const Value: TPhysID);
    function  GetImageDry: TPhysID;
    procedure SetImageDry(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);

    function  GetHoleName: string;
    procedure SetHoleName(const Value: string);
    function  GetSensorNoAnswer: TPhysID;
    procedure SetSensorNoAnswer(const Value: TPhysID);
    function  GetSensorComm: TPhysID;
    procedure SetSensorComm(const Value: TPhysID);
    procedure SetMError(const Value: integer);
    procedure SetDError(const Value: integer);
  protected
    procedure CheckManholeError;
    procedure CheckDryError;
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    property ManholeValue: double read F_ManholeValue write F_ManholeValue;
    property DryValue: double read F_DryValue write F_DryValue;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property NoAnswerID : TPhysID read GetSensorNoAnswer write SetSensorNoAnswer;
    property CommID : TPhysID read GetSensorComm write SetSensorComm;
    property HoleName : string read GetHoleName write SetHoleName;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property ManholeID : TPhysID read GetImageManhole write SetImageManhole;
    property DryID : TPhysID read GetImageDry write SetImageDry;

    property ManholeError: boolean read GetManholeError;
    property DryError: boolean read GetDryError;
    property OnChangeManholeError: TNotifyEvent read FOnChangeManholeError write FOnChangeManholeError;
    property OnChangeDryError: TNotifyEvent read FOnChangeDryError write FOnChangeDryError;

    property MError: integer read FMError write SetMError;
    property DError: integer read FDError write SetDError;
  end;

implementation

uses
  uStrUtils, Math, DateUtils, aOPCLog;

{$R *.dfm}

procedure TfrHoleAlarm.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
    else if Components[i] is TaOPCProvider then
      TaOPCProvider(Components[i]).OPCSource := Value;
  end;
end;

procedure TfrHoleAlarm.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;

  procedure Init(aOPCObject:TOPCObject; aRecurcive:boolean = true);
  var
    i: Integer;
    ObjectName: string;
    id : string;
  begin
    for i := 0 to aOPCObject.Childs.Count - 1 do
    begin
      if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
      begin
        ObjectName := TOPCObject(aOPCObject.Childs[i]).Name;
        id         := TOPCObject(aOPCObject.Childs[i]).IdStr;

        if ObjectName = 'Количество без ответов означает, что модуль отсутствует' then
          CommID           := id
        else if ObjectName = 'Счетчик (нет ответов)' then
          NoAnswerID       := id
        else if ObjectName = 'DI2 - Крышка люка' then
          ManholeID       := id
        else if ObjectName = 'DI1 - Вода в приямке или сухой ход' then
          DryID       := id;

        // отработаем эти же проверки для дочерних элементов, если
        // задан рекурсивный способ проверки
        if aRecurcive and (TOPCObject(aOPCObject.Childs[i]).Childs.Count > 0) then
          Init(TOPCObject(aOPCObject.Childs[i]));
     end;
    end;
  end;

begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  HoleName := aOPCObject.Name;

  Init(aOPCObject, true);

  FID := IntToStr(aId);
end;

procedure TfrHoleAlarm.ManholeChange(Sender: TObject);
begin
  if TryStrToFloat(Manhole.Value, F_ManholeValue) then
  begin
    F_ManholeOldValue := F_ManholeValue;
    CheckManholeError;
  end
  else Manhole.Value := FloatToStr(F_ManholeOldValue);
end;

procedure TfrHoleAlarm.DryChange(Sender: TObject);
begin
  if TryStrToFloat(Dry.Value, F_DryValue) then
  begin
    F_DryOldValue := F_DryValue;
    CheckDryError;
  end
  else Dry.Value := FloatToStr(F_DryOldValue);
end;

function TfrHoleAlarm.GetManholeError: boolean;
begin
  Result := bManholeValue;
end;

procedure TfrHoleAlarm.CheckManholeError;
var
  ErrorDetected: boolean;
begin
  ErrorDetected := (F_ManholeValue = 1);

  if ErrorDetected <> ManholeError then
//  if ErrorDetected = true then
  begin
    bManholeValue := ErrorDetected;
    if Assigned(FOnChangeManholeError) then
      FOnChangeManholeError(Self);
  end
end;

function TfrHoleAlarm.GetDryError: boolean;
begin
  Result := bDryValue;
end;

procedure TfrHoleAlarm.CheckDryError;
var
  ErrorDetected: boolean;
begin
  ErrorDetected := (F_DryValue = 1);

  if ErrorDetected <> DryError then
//  if ErrorDetected = true then
  begin
    bDryValue := ErrorDetected;
    if Assigned(FOnChangeDryError) then
      FOnChangeDryError(Self);
  end
end;

procedure TfrHoleAlarm.SetMError(const Value: integer);
begin
  FMError := Value;
end;

procedure TfrHoleAlarm.SetDError(const Value: integer);
begin
  FDError := Value;
end;

function TfrHoleAlarm.GetHoleName: string;
begin
  Result:=lHoleName.Caption;
end;

procedure TfrHoleAlarm.SetHoleName(const Value: string);
begin
  lHoleName.Caption := Value;
end;

procedure TfrHoleAlarm.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  p := (Sender as TControl).ClientToParent(Point(x,y),Self);
  FMouseDownX := p.X;
  FMouseDownY := p.Y;
  if Assigned(OnMouseDown) then
    OnMouseDown(Self,Button, Shift, FMouseDownX, FMouseDownY);
end;

procedure TfrHoleAlarm.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrHoleAlarm.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;
  ObjectName : string;
  Data: TStrings;
begin
  if (FID = Value) or
    (not Assigned(OPCSource)) or
    (not (OPCSource is TaOPCSource)) then
    exit;
  aOPCSource := TaOPCSource(OPCSource);
  FID := Value;
  aOPCSource.FNameSpaceCash.Clear;
  aOPCSource.FNameSpaceTimeStamp := 0;
  aOPCSource.GetNameSpace(StrToIntDef(Value,0));
  for i := 0 to aOPCSource.FNameSpaceCash.Count - 1 do
  begin
    CurrStr := GetBufStart(PChar(aOPCSource.FNameSpaceCash[i]), ALevel);
    ObjectName := ExtractData(CurrStr);

    Data := TStringList.Create;
    try
      while CurrStr<>'' do
        Data.Add(ExtractData(CurrStr));

      if FID = Data.Strings[0] then
        HoleName := ObjectName;

      if Data.Strings[1] = '1' then
        Continue; // это не датчик

        if ObjectName = 'Количество без ответов означает, что модуль отсутствует' then
          CommID             := Data.Strings[0]
        else if ObjectName = 'Счетчик (нет ответов)' then
          NoAnswerID         := Data.Strings[0]
        else if ObjectName = 'DI2 - Крышка люка' then
          ManholeID         := Data.Strings[0]
        else if ObjectName = 'DI1 - Вода в приямке или сухой ход' then
          DryID         := Data.Strings[0];

    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrHoleAlarm.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(Manhole.OPCSource as TaCustomMultiOPCSource);
end;

function TfrHoleAlarm.GetSensorNoAnswer: TPhysID;
begin
  Result := NoAnswer.PhysID;
end;

procedure TfrHoleAlarm.SetSensorNoAnswer(const Value: TPhysID);
begin
  NoAnswer.PhysID := Value;
end;

function TfrHoleAlarm.GetSensorComm: TPhysID;
begin
  Result := Comm.PhysID;
end;

procedure TfrHoleAlarm.SetSensorComm(const Value: TPhysID);
begin
  Comm.PhysID := Value;
end;

procedure TfrHoleAlarm.NoAnswerChange(Sender: TObject);
begin
  inherited;
  if ((NoAnswer.Value <> '') and (Comm.Value <> '')) then
  begin
    if strtoint(NoAnswer.Value) >= strtoint(Comm.Value) then Antena.Value := '1'
    else if strtoint(NoAnswer.Value) <= strtoint(Comm.Value) then Antena.Value := '0';
  end;
end;

function TfrHoleAlarm.GetOPCImageList: TaOPCImageList;
begin
  Result := Antena.OPCImageList;
end;

procedure TfrHoleAlarm.SetImageList(const Value: TaOPCImageList);
begin
  Antena.OPCImageList := Value;
  Manhole.OPCImageList := Value;
  Dry.OPCImageList := Value;
end;

function TfrHoleAlarm.GetImageManhole: TPhysID;
begin
  Result := Manhole.PhysID;
end;

procedure TfrHoleAlarm.SetImageManhole(const Value: TPhysID);
begin
  Manhole.PhysID := Value;
end;

function TfrHoleAlarm.GetImageDry: TPhysID;
begin
  Result := Dry.PhysID;
end;

procedure TfrHoleAlarm.SetImageDry(const Value: TPhysID);
begin
  Dry.PhysID := Value;
end;

initialization
  RegisterClasses([TfrHoleAlarm]);
end.
