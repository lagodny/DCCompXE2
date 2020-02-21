{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSaxarPK2Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape;

type
  TfrSaxar = class(TaOPCFrame)
    Panel1: TPanel;
    lTankName: TaOPCLabel;
    lSv: TaOPCLabel;
    lSVCaption: TaOPCLabel;
    lTemperature: TaOPCLabel;
    lMassa: TaOPCLabel;
    gMassa: TaOPCGauge;
    Shape1: TaOPCShape;
    lTemperatureCapture: TLabel;
    pStep: TaOPCProvider;
    uStat: TaOPCProvider;
    LevelUp: TaOPCImage;
    LevelDown: TaOPCImage;
    Clear: TaOPCImage;
    DrenagStart: TaOPCImage;
    DrenagStop: TaOPCImage;
    MoykaHand: TaOPCImage;
    MoykaRed: TaOPCImage;
    MoykaStart: TaOPCImage;
    MoykaStop: TaOPCImage;
    Service: TaOPCImage;
    Stiril: TaOPCImage;
    Tank: TaOPCImage;
    procedure uStatChange(Sender: TObject);
    procedure pStepChange(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure lSvDblClick(Sender: TObject);
    procedure UpdateTankStatus(Sender: TObject);
  private
    FTankMinMassa: integer;
    function  GetProvaider: TPhysID;
    procedure SetProvaider(const Value: TPhysID);
    function  GetProvaiderNew: TPhysID;
    procedure SetProvaiderNew(const Value: TPhysID);
    function  GetImageLevelDown: TPhysID;
    procedure SetImageLevelDown(const Value: TPhysID);
    function  GetImageLevelUp: TPhysID;
    procedure SetImageLevelUp(const Value: TPhysID);
    function  GetImageService: TPhysID;
    procedure SetImageService(const Value: TPhysID);
    function  GetImageMoykaStart: TPhysID;
    procedure SetImageMoykaStart(const Value: TPhysID);
    function  GetImageMoykaStop: TPhysID;
    procedure SetImageMoykaStop(const Value: TPhysID);
    function  GetImageMoykaHand: TPhysID;
    procedure SetImageMoykaHand(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);
    function  GetImageTank: string;
    procedure SetImageTank(const Value: string);

    function  GetSensorMassa: TPhysID;
    procedure SetSensorMassa(const Value: TPhysID);
    function  GetSensorTemperatura: TPhysID;
    procedure SetSensorTemperatura(const Value: TPhysID);
    function  GetTankName: string;
    procedure SetTankName(const Value: string);
    function  GetTankMaxMassa: TPhysID;
    procedure SetTankMaxMassa(const Value: TPhysID);
    function  GetSensorSV: TPhysID;
    procedure SetSensorSV(const Value: TPhysID);
    function  GetCaptionColor: TColor;
    procedure SetCaptionColor(const Value: TColor);
    procedure SetTankMinMassa(const Value: integer);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property SensorMassa : TPhysID read GetSensorMassa write SetSensorMassa;
    property SensorTemperatura : TPhysID read GetSensorTemperatura write SetSensorTemperatura;
    property SensorSV : TPhysID read GetSensorSV write SetSensorSV;
    property TankName : string read GetTankName write SetTankName;
    property TankImage : string read GetImageTank write SetImageTank;
    property TankMaxMassa : TPhysID read GetTankMaxMassa write SetTankMaxMassa;
    property TankMinMassa : integer read FTankMinMassa write SetTankMinMassa;
    property CaptionColor: TColor read GetCaptionColor write SetCaptionColor;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property LevelDownID : TPhysID read GetImageLevelDown write SetImageLevelDown;
    property LevelUpID : TPhysID read GetImageLevelUp write SetImageLevelUp;
    property ServiceID : TPhysID read GetImageService write SetImageService;
    property MoykaStartID : TPhysID read GetImageMoykaStart write SetImageMoykaStart;
    property MoykaStopID : TPhysID read GetImageMoykaStop write SetImageMoykaStop;
    property MoykaHandID : TPhysID read GetImageMoykaHand write SetImageMoykaHand;
    property ProvaiderID : TPhysID read GetProvaider write SetProvaider;
    property ProvaiderNewID : TPhysID read GetProvaiderNew write SetProvaiderNew;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

procedure TfrSaxar.UpdateTankStatus(Sender: TObject);
begin
  try
    lTankName.Color           :=clSkyBlue;
    gMassa.BackColor          := clWhite;
    lSv.Visible               := SensorSV<>'';
    lSVCaption.Visible        := SensorSV<>'';
  except
    on e : Exception do
      OPCLog.WriteToLog('UpdateTankStatus: ' + e.Message);
  end;

end;

procedure TfrSaxar.uStatChange(Sender: TObject);
begin
  inherited;
  if ((uStat.Value = '50') and (MoykaHand.Value = '0'))
    then MoykaRed.Value := '1'
    else MoykaRed.Value := '0';
  if ((uStat.Value = '60') and (MoykaHand.Value = '0'))
    then Clear.Value := '1'
    else Clear.Value := '0';
  if (uStat.Value = '61')
    then Stiril.Value := '1'
    else Stiril.Value := '0';
end;

procedure TfrSaxar.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TfrSaxar.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

        if ObjectName      = 'Вес' then
          SensorMassa       := id
        else if ObjectName = 'Температура' then
          SensorTemperatura := id
        else if ObjectName = 'Brix' then
          SensorSV          := id
        else if ObjectName = 'Вес' then
          TankMaxMassa      := id
        else if ObjectName = 'Низкий уровень' then
          LevelDownID      := id
        else if ObjectName = 'Высокий уровень' then
          LevelUpID      := id
        else if ObjectName = 'Сервис' then
          ServiceID      := id
        else if ObjectName = 'Шаг' then
          ProvaiderID       := id
        else if ObjectName = 'Мойка запущена' then
          MoykaStartID      := id
        else if ObjectName = 'Мойка остановлена' then
          MoykaStopID      := id
        else if ObjectName = 'Ручная мойка' then
          MoykaHandID      := id
        else if ObjectName = 'Состояние объекта' then
          ProvaiderNewId := id;

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

  TankName := aOPCObject.Name;
  Tank.Value := '1';

  Init(aOPCObject, true);

  FID := IntToStr(aId);
end;

function TfrSaxar.GetSensorMassa: TPhysID;
begin
  Result:=lMassa.PhysID;
end;

function TfrSaxar.GetSensorTemperatura: TPhysID;
begin
  Result:=lTemperature.PhysID;
end;

function TfrSaxar.GetTankName: string;
begin
  Result:=lTankName.Caption;
end;

procedure TfrSaxar.SetSensorMassa(const Value: TPhysID);
begin
  lMassa.PhysID:=Value;
  gMassa.PhysID:=Value;
end;

procedure TfrSaxar.SetSensorTemperatura(const Value: TPhysID);
begin
  lTemperature.PhysID:=Value;
end;

procedure TfrSaxar.SetTankName(const Value: string);
begin
  lTankName.Caption:=Value;
end;

procedure TfrSaxar.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrSaxar.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrSaxar.SetTankMaxMassa(const Value: TPhysID);
begin
  gMassa.PhysID := lMassa.PhysID;
end;

function TfrSaxar.GetTankMaxMassa: TPhysID;
begin
  Result := gMassa.PhysID;
end;

procedure TfrSaxar.SetID(const Value: TPhysID);
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
  Tank.Value := '1';
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

      if ObjectName      = 'Вес' then
        SensorMassa       := Data.Strings[0]
      else if ObjectName = 'Температура' then
        SensorTemperatura := Data.Strings[0]
      else if ObjectName = 'Brix' then
        SensorSV          := Data.Strings[0]
      else if ObjectName = 'Вес' then
        TankMaxMassa      := Data.Strings[0]
      else if ObjectName = 'Низкий уровень' then
        LevelDownID      := Data.Strings[0]
      else if ObjectName = 'Высокий уровень' then
        LevelUpID      := Data.Strings[0]
      else if ObjectName = 'Сервис' then
        ServiceID      := Data.Strings[0]
      else if ObjectName = 'Шаг' then
        ProvaiderID     :=  Data.Strings[0]
      else if ObjectName = 'Мойка запущена' then
        MoykaStartID      := Data.Strings[0]
      else if ObjectName = 'Мойка остановлена' then
        MoykaStopID      := Data.Strings[0]
      else if ObjectName = 'Ручная мойка' then
        MoykaHandID      := Data.Strings[0]
      else if ObjectName = 'Состояние объекта' then
        ProvaiderNewId := Data.Strings[0];
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrSaxar.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(gMassa.OPCSource as TaCustomMultiOPCSource);
end;

function TfrSaxar.GetSensorSV: TPhysID;
begin
  Result := lSv.PhysID;
end;

procedure TfrSaxar.SetSensorSV(const Value: TPhysID);
begin
  lSv.PhysID := Value;
  lSv.Visible := lSv.PhysID<>'';
  lSVCaption.Visible := lSv.PhysID<>'';
  lSv.Cursor := IfThen(lSv.PhysID<>'',crHandPoint,crDefault);
end;

procedure TfrSaxar.lSvDblClick(Sender: TObject);
var
  v:string;
  dt:TDateTime;
begin
  if (OPCSource=nil) or (lSv.PhysID='')
    or not (OPCSource is TaOPCSource) then
    exit;

  v:=lSv.Value;
  if InputQuery('Укажите содержание с/в,%',
    'Укажите содержание с/в,%',v) then
  begin
    dt:=0;
    v:=StringReplace(v,'.',',',[]);
    TaOPCSource(lSv.OPCSource).SetSensorValue(lSv.PhysID,
      v, dt);
  end;

end;

procedure TfrSaxar.SetCaptionColor(const Value: TColor);
begin
  Shape1.Brush.Color := Value;
end;

function TfrSaxar.GetCaptionColor: TColor;
begin
  Result := Shape1.Brush.Color;
end;

procedure TfrSaxar.SetTankMinMassa(const Value: integer);
begin
  FTankMinMassa := Value;
end;

function TfrSaxar.GetOPCImageList: TaOPCImageList;
begin
  Result := LevelDown.OPCImageList;
end;

procedure TfrSaxar.SetImageList(const Value: TaOPCImageList);
begin
  LevelDown.OPCImageList := Value;
  LevelUp.OPCImageList := Value;
  Service.OPCImageList := Value;
  DrenagStop.OPCImageList := Value;
  DrenagStart.OPCImageList := Value;
  MoykaStart.OPCImageList := Value;
  MoykaStop.OPCImageList := Value;
  MoykaRed.OPCImageList := Value;
  MoykaHand.OPCImageList := Value;
  Clear.OPCImageList := Value;
  Stiril.OPCImageList := Value;
  Tank.OPCImageList := Value;
end;

procedure TfrSaxar.pStepChange(Sender: TObject);
begin
  inherited;
  if ((pStep.Value = '20') and (MoykaStop.Value = '1'))
    then DrenagStop.Value := '1'
    else DrenagStop.Value := '0';
  if ((pStep.Value = '20') and (MoykaStart.Value = '1'))
    then DrenagStart.Value := '1'
    else DrenagStart.Value := '0';
end;

procedure TfrSaxar.SetImageLevelDown(const Value: TPhysID);
begin
  LevelDown.PhysID := Value;
end;

function TfrSaxar.GetImageLevelDown: TPhysID;
begin
  Result := LevelDown.PhysID;
end;

procedure TfrSaxar.SetImageLevelUp(const Value: TPhysID);
begin
  LevelUp.PhysID := Value;
end;

function TfrSaxar.GetImageLevelUp: TPhysID;
begin
  Result := LevelUp.PhysID;
end;

procedure TfrSaxar.SetImageService(const Value: TPhysID);
begin
  Service.PhysID := Value;
end;

function TfrSaxar.GetImageService: TPhysID;
begin
  Result := Service.PhysID;
end;

procedure TfrSaxar.SetImageMoykaStart(const Value: TPhysID);
begin
  MoykaStart.PhysID := Value;
end;

function TfrSaxar.GetImageMoykaStart: TPhysID;
begin
  Result := MoykaStart.PhysID;
end;

procedure TfrSaxar.SetImageMoykaStop(const Value: TPhysID);
begin
  MoykaStop.PhysID := Value;
end;

function TfrSaxar.GetImageMoykaStop: TPhysID;
begin
  Result := MoykaStop.PhysID;
end;

procedure TfrSaxar.SetImageMoykaHand(const Value: TPhysID);
begin
  MoykaHand.PhysID := Value;
end;

function TfrSaxar.GetImageMoykaHand: TPhysID;
begin
  Result := MoykaHand.PhysID;
end;

procedure TfrSaxar.SetProvaider(const Value: TPhysID);
begin
  pStep.PhysID := Value;
end;

function TfrSaxar.GetProvaider: TPhysID;
begin
  Result := pStep.PhysID;
end;

procedure TfrSaxar.SetProvaiderNew(const Value: TPhysID);
begin
  uStat.PhysID := Value;
end;

function TfrSaxar.GetProvaiderNew: TPhysID;
begin
  Result := uStat.PhysID;
end;

function TfrSaxar.GetImageTank: string;
begin
  Result:=Tank.Value;
end;

procedure TfrSaxar.SetImageTank(const Value: string);
begin
  Tank.Value := '1';
end;

initialization
  RegisterClasses([TfrSaxar]);
end.
