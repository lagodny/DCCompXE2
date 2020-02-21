{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uAnticeptPK2Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape;

type
  TfrAnt = class(TaOPCFrame)
    Panel1: TPanel;
    Massa: TaOPCLabel;
    Blend: TaOPCImage;
    Outing: TaOPCImage;
    Fill: TaOPCImage;
    CIP: TaOPCImage;
    Cool: TaOPCImage;
    St: TaOPCImage;
    aOPCShape1: TaOPCShape;
    aOPCLabel1: TaOPCLabel;
    WorkStatus: TaOPCLabel;
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure WorkStatusChange(Sender: TObject);
  private
    function  GetTankName: string;
    procedure SetTankName(const Value: string);
    function  GetImageCIP: TPhysID;
    procedure SetImageCIP(const Value: TPhysID);
    function  GetImageSt: TPhysID;
    procedure SetImageSt(const Value: TPhysID);
    function  GetImageFill: TPhysID;
    procedure SetImageFill(const Value: TPhysID);
    function  GetImageOuting: TPhysID;
    procedure SetImageOuting(const Value: TPhysID);
    function  GetImageBlend: TPhysID;
    procedure SetImageBlend(const Value: TPhysID);
    function  GetImageCool: TPhysID;
    procedure SetImageCool(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);

    function  GetWorkStatus: TPhysID;
    procedure SetWorkStatus(const Value: TPhysID);
    function  GetMassa: TPhysID;
    procedure SetMassa(const Value: TPhysID);
    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetLookupList: taOPCLookupList;
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property MassaID : TPhysID read GetMassa write SetMassa;
    property WorkStatusID : TPhysID read GetWorkStatus write SetWorkStatus;

    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property TankName : string read GetTankName write SetTankName;
    property CIPID : TPhysID read GetImageCIP write SetImageCIP;
    property StID : TPhysID read GetImageSt write SetImageSt;
    property FillID : TPhysID read GetImageFill write SetImageFill;
    property OutingID : TPhysID read GetImageOuting write SetImageOuting;
    property BlendID : TPhysID read GetImageBlend write SetImageBlend;
    property CoolID : TPhysID read GetImageCool write SetImageCool;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

procedure TfrAnt.SetOPCSource(const Value: TaCustomMultiOPCSource);
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


procedure TfrAnt.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

        if ObjectName = 'Вес' then
          MassaID      := id
        else if ObjectName = 'Режим работы' then
        begin
          CIPID      := id;
          StID      := id;
          FillID      := id;
          OutingID      := id;
          BlendID      := id;
          CoolID      := id;
          WorkStatusID := id;
        end;
     end;
    end;
  end;

begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  TankName := aOPCObject.Name;
//  Tank.Value := '1';

  Init(aOPCObject, true);

  FID := IntToStr(aId);
end;

procedure TfrAnt.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrAnt.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrAnt.WorkStatusChange(Sender: TObject);
begin
  inherited;
  Massa.Hint := WorkStatus.Caption + #10 + 'c ' + DateTimeToStr(WorkStatus.Moment);
end;

procedure TfrAnt.SetMassa(const Value: TPhysID);
begin
  Massa.PhysID := Value;
end;

function TfrAnt.GetMassa: TPhysID;
begin
  Result := Massa.PhysID;
end;

procedure TfrAnt.SetWorkStatus(const Value: TPhysID);
begin
  WorkStatus.PhysID := Value;
end;

function TfrAnt.GetWorkStatus: TPhysID;
begin
  Result := WorkStatus.PhysID;
end;

function TfrAnt.GetTankName: string;
begin
  Result:=Panel1.Hint;
end;

procedure TfrAnt.SetTankName(const Value: string);
begin
  Panel1.Hint:=Value;
  aOPCLabel1.Caption := Value;
end;

procedure TfrAnt.SetID(const Value: TPhysID);
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
        TankName := ObjectName;

      if Data.Strings[1] = '1' then
        Continue; // это не датчик

      if ObjectName = 'Вес' then
        MassaID      := Data.Strings[0]
      else if ObjectName = 'Режим работы' then
      begin
          CIPID      := Data.Strings[0];
          StID      := Data.Strings[0];
          FillID      := Data.Strings[0];
          OutingID      := Data.Strings[0];
          BlendID      := Data.Strings[0];
          CoolID      := Data.Strings[0];
          WorkStatusID := Data.Strings[0];
      end;
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrAnt.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(Massa.OPCSource as TaCustomMultiOPCSource);
end;

function TfrAnt.GetOPCImageList: TaOPCImageList;
begin
  Result := CIP.OPCImageList;
end;

procedure TfrAnt.SetImageList(const Value: TaOPCImageList);
begin
  CIP.OPCImageList := Value;
  St.OPCImageList := Value;
  Fill.OPCImageList := Value;
  Outing.OPCImageList := Value;
  Blend.OPCImageList := Value;
  Cool.OPCImageList := Value;
end;

procedure TfrAnt.SetImageCIP(const Value: TPhysID);
begin
  CIP.PhysID := Value;
  St.PhysID := Value;
  Fill.PhysID := Value;
  Outing.PhysID := Value;
  Blend.PhysID := Value;
  Cool.PhysID := Value;
end;

function TfrAnt.GetImageCIP: TPhysID;
begin
  Result := CIP.PhysID;
end;

procedure TfrAnt.SetImageSt(const Value: TPhysID);
begin
//  Steril.PhysID := Value;
end;

function TfrAnt.GetImageSt: TPhysID;
begin
  Result := St.PhysID;
end;

procedure TfrAnt.SetImageFill(const Value: TPhysID);
begin
//  Fill.PhysID := Value;
end;

function TfrAnt.GetImageFill: TPhysID;
begin
  Result := Fill.PhysID;
end;

procedure TfrAnt.SetImageOuting(const Value: TPhysID);
begin
//  Outing.PhysID := Value;
end;

function TfrAnt.GetImageOuting: TPhysID;
begin
  Result := Outing.PhysID;
end;

procedure TfrAnt.SetImageBlend(const Value: TPhysID);
begin
//  Blend.PhysID := Value;
end;

function TfrAnt.GetImageBlend: TPhysID;
begin
  Result := Blend.PhysID;
end;

procedure TfrAnt.SetImageCool(const Value: TPhysID);
begin
//  Cool.PhysID := Value;
end;

function TfrAnt.GetImageCool: TPhysID;
begin
  Result := Cool.PhysID;
end;

procedure TfrAnt.SetOPCLookupList(const Value: taOPCLookupList);
begin
  WorkStatus.LookupList := Value;
end;

function TfrAnt.GetLookupList: taOPCLookupList;
begin
  Result := WorkStatus.LookupList;
end;

initialization
  RegisterClasses([TfrAnt]);
end.
