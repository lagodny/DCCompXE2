{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uHoleFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape, Menus;

type
  TfrHole = class(TaOPCFrame)
    Panel1: TPanel;
    lHoleName: TaOPCLabel;
    Potok: TaOPCLabel;
    ModeImage: TaOPCImage;
    StartImage: TaOPCImage;
    D1: TaOPCImage;
    HoleTime: TaOPCLabel;
    Prior: TaOPCLabel;
    PopupMenu: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    N131: TMenuItem;
    N141: TMenuItem;
    N151: TMenuItem;
    N161: TMenuItem;
    Counter: TaOPCLabel;
    MLabel: TaOPCLabel;
    Label3: TaOPCLabel;
    Antena: TaOPCImage;
    NoAnswer: TaOPCProvider;
    Comm: TaOPCProvider;
    Manhole: TaOPCImage;
    Dry: TaOPCImage;
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure ModeImageDblClick(Sender: TObject);
    procedure ModeImageChange(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure NoAnswerChange(Sender: TObject);
  private
    function  GetImageMode: TPhysID;
    procedure SetImageMode(const Value: TPhysID);
    function  GetImageStart: TPhysID;
    procedure SetImageStart(const Value: TPhysID);
    function  GetImageD1: TPhysID;
    procedure SetImageD1(const Value: TPhysID);
    function  GetImageManhole: TPhysID;
    procedure SetImageManhole(const Value: TPhysID);
    function  GetImageDry: TPhysID;
    procedure SetImageDry(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);

    function  GetHoleName: string;
    procedure SetHoleName(const Value: string);
    function  GetSensorPotok: TPhysID;
    procedure SetSensorPotok(const Value: TPhysID);
    function  GetSensorCounter: TPhysID;
    procedure SetSensorCounter(const Value: TPhysID);
    function  GetSensorTime: TPhysID;
    procedure SetSensorTime(const Value: TPhysID);
    function  GetSensorPrior: TPhysID;
    procedure SetSensorPrior(const Value: TPhysID);
    function  GetSensorNoAnswer: TPhysID;
    procedure SetSensorNoAnswer(const Value: TPhysID);
    function  GetSensorComm: TPhysID;
    procedure SetSensorComm(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property PotokID : TPhysID read GetSensorPotok write SetSensorPotok;
    property CounterID : TPhysID read GetSensorCounter write SetSensorCounter;
    property TimeID : TPhysID read GetSensorTime write SetSensorTime;
    property PriorID : TPhysID read GetSensorPrior write SetSensorPrior;
    property NoAnswerID : TPhysID read GetSensorNoAnswer write SetSensorNoAnswer;
    property CommID : TPhysID read GetSensorComm write SetSensorComm;
    property HoleName : string read GetHoleName write SetHoleName;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property ModeID : TPhysID read GetImageMode write SetImageMode;
    property StartID : TPhysID read GetImageStart write SetImageStart;
    property D1ID : TPhysID read GetImageD1 write SetImageD1;
    property ManholeID : TPhysID read GetImageManhole write SetImageManhole;
    property DryID : TPhysID read GetImageDry write SetImageDry;
  end;

implementation

uses
  uStrUtils, Math, DateUtils, aOPCLog;

{$R *.dfm}

procedure TfrHole.SetOPCSource(const Value: TaCustomMultiOPCSource);
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


procedure TfrHole.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

        if ObjectName = 'Поток воды' then
          PotokID          := id
        else if ObjectName = 'Счетчик воды' then
          CounterID        := id
        else if ObjectName = 'Время наработки насоса' then
          TimeID           := id
        else if ObjectName = 'Приоритет' then
          PriorID          := id
        else if ObjectName = 'Режим работы' then
          ModeID           := id
        else if ObjectName = 'Пуск в ручном режиме' then
          StartID          := id
        else if ObjectName = 'DO1 (насос)' then
          D1ID             := id
        else if ObjectName = 'Количество без ответов означает, что модуль отсутствует' then
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

function TfrHole.GetHoleName: string;
begin
  Result:=lHoleName.Caption;
end;

procedure TfrHole.SetHoleName(const Value: string);
begin
  lHoleName.Caption:=Value;
end;

procedure TfrHole.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrHole.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrHole.SetID(const Value: TPhysID);
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

        if ObjectName = 'Поток воды' then
          PotokID            := Data.Strings[0]
        else if ObjectName = 'Счетчик воды' then
          CounterID          := Data.Strings[0]
        else if ObjectName = 'Время наработки насоса' then
          TimeID             := Data.Strings[0]
        else if ObjectName = 'Приоритет' then
          PriorID            := Data.Strings[0]
        else if ObjectName = 'Режим работы' then
          ModeID             := Data.Strings[0]
        else if ObjectName = 'Пуск в ручном режиме' then
          StartID            := Data.Strings[0]
        else if ObjectName = 'DO1 (насос)' then
          D1ID               := Data.Strings[0]
        else if ObjectName = 'Количество без ответов означает, что модуль отсутствует' then
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

function TfrHole.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(Potok.OPCSource as TaCustomMultiOPCSource);
end;

function TfrHole.GetSensorPotok: TPhysID;
begin
  Result := Potok.PhysID;
end;

procedure TfrHole.SetSensorPotok(const Value: TPhysID);
begin
  Potok.PhysID := Value;
end;

function TfrHole.GetSensorCounter: TPhysID;
begin
  Result := Counter.PhysID;
end;

procedure TfrHole.SetSensorCounter(const Value: TPhysID);
begin
  Counter.PhysID := Value;
end;

function TfrHole.GetSensorTime: TPhysID;
begin
  Result := HoleTime.PhysID;
end;

procedure TfrHole.SetSensorTime(const Value: TPhysID);
begin
  HoleTime.PhysID := Value;
end;

function TfrHole.GetSensorPrior: TPhysID;
begin
  Result := Prior.PhysID;
end;

procedure TfrHole.SetSensorPrior(const Value: TPhysID);
begin
  Prior.PhysID := Value;
end;

function TfrHole.GetSensorNoAnswer: TPhysID;
begin
  Result := NoAnswer.PhysID;
end;

procedure TfrHole.SetSensorNoAnswer(const Value: TPhysID);
begin
  NoAnswer.PhysID := Value;
end;

function TfrHole.GetSensorComm: TPhysID;
begin
  Result := Comm.PhysID;
end;

procedure TfrHole.SetSensorComm(const Value: TPhysID);
begin
  Comm.PhysID := Value;
end;

procedure TfrHole.ModeImageChange(Sender: TObject);
begin
  inherited;
  if ModeImage.Value = '1' then StartImage.Visible := false
  else StartImage.Visible := true;
end;

procedure TfrHole.ModeImageDblClick(Sender: TObject);
var
  v:string;
begin
  inherited;
  v := (Sender as TaOPCImage).Value;
  if v = '0' then v := '1'
  else if v = '1' then v := '0';
  TaOPCSource((Sender as TaOPCImage).OPCSource).SetSensorValue((Sender as TaOPCImage).PhysID, v, 0);
end;

procedure TfrHole.N11Click(Sender: TObject);
var
  mi: TMenuItem;
begin
  inherited;
  mi := Sender as TMenuItem;
  Prior.Caption := mi.Caption;
  TaOPCSource(Prior.OPCSource).SetSensorValue(Prior.PhysID, mi.Caption, 0);
end;

procedure TfrHole.NoAnswerChange(Sender: TObject);
begin
  inherited;
  if ((NoAnswer.Value <> '') and (Comm.Value <> '')) then
  begin
    if strtoint(NoAnswer.Value) >= strtoint(Comm.Value) then Antena.Value := '1'
    else if strtoint(NoAnswer.Value) <= strtoint(Comm.Value) then Antena.Value := '0';
  end;
end;

function TfrHole.GetOPCImageList: TaOPCImageList;
begin
  Result := ModeImage.OPCImageList;
end;

procedure TfrHole.SetImageList(const Value: TaOPCImageList);
begin
  ModeImage.OPCImageList := Value;
  StartImage.OPCImageList := Value;
  D1.OPCImageList := Value;
  Antena.OPCImageList := Value;
  Manhole.OPCImageList := Value;
  Dry.OPCImageList := Value;
end;

procedure TfrHole.SetImageMode(const Value: TPhysID);
begin
  ModeImage.PhysID := Value;
end;

function TfrHole.GetImageMode: TPhysID;
begin
  Result := ModeImage.PhysID;
end;

procedure TfrHole.SetImageStart(const Value: TPhysID);
begin
  StartImage.PhysID := Value;
end;

function TfrHole.GetImageStart: TPhysID;
begin
  Result := StartImage.PhysID;
end;

procedure TfrHole.SetImageD1(const Value: TPhysID);
begin
  D1.PhysID := Value;
end;

function TfrHole.GetImageD1: TPhysID;
begin
  Result := D1.PhysID;
end;

function TfrHole.GetImageManhole: TPhysID;
begin
  Result := Manhole.PhysID;
end;

procedure TfrHole.SetImageManhole(const Value: TPhysID);
begin
  Manhole.PhysID := Value;
end;

function TfrHole.GetImageDry: TPhysID;
begin
  Result := Dry.PhysID;
end;

procedure TfrHole.SetImageDry(const Value: TPhysID);
begin
  Dry.PhysID := Value;
end;

initialization
  RegisterClasses([TfrHole]);
end.
