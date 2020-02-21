{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uConcentratPK2Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape,
  aOPCLog;

type
  TfrConcentrat = class(TaOPCFrame)
    Panel1: TPanel;
    lTankName: TaOPCLabel;
    lTK: TaOPCLabel;
    lTKCaption: TaOPCLabel;
    lSv: TaOPCLabel;
    lSVCaption: TaOPCLabel;
    lTemperature: TaOPCLabel;
    lProduct: TaOPCLabel;
    lMassa: TaOPCLabel;
    gMassa: TaOPCGauge;
    Shape1: TaOPCShape;
    lTemperatureCapture: TLabel;
    LevelUp: TaOPCImage;
    LevelDown: TaOPCImage;
    pStep: TaOPCProvider;
    Clear: TaOPCImage;
    DrenagStart: TaOPCImage;
    DrenagStop: TaOPCImage;
    MoykaStart: TaOPCImage;
    MoykaStop: TaOPCImage;
    Service: TaOPCImage;
    Stiril: TaOPCImage;
    MoykaHand: TaOPCImage;
    uStat: TaOPCProvider;
    MoykaRed: TaOPCImage;
    Tank: TaOPCImage;
    BlendStart: TaOPCImage;
    procedure uStatChange(Sender: TObject);
    procedure pStepChange(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure lSvDblClick(Sender: TObject);
    procedure lTKDblClick(Sender: TObject);
    procedure lProductDblClick(Sender: TObject);
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
    function  GetImageBlendStart: TPhysID;
    procedure SetImageBlendStart(const Value: TPhysID);

    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetLookupList: taOPCLookupList;
    function  GetSensorMassa: TPhysID;
    procedure SetSensorMassa(const Value: TPhysID);
    function  GetSensorProduct: TPhysID;
    procedure SetSensorProduct(const Value: TPhysID);
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
    function  GetSensorTK: TPhysID;
    procedure SetSensorTK(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property SensorProduct : TPhysID read GetSensorProduct write SetSensorProduct;
    property SensorMassa : TPhysID read GetSensorMassa write SetSensorMassa;
    property SensorTemperatura : TPhysID read GetSensorTemperatura write SetSensorTemperatura;
    property SensorSV : TPhysID read GetSensorSV write SetSensorSV;
    property SensorTK : TPhysID read GetSensorTK write SetSensorTK;
    property TankName : string read GetTankName write SetTankName;
    property TankImage : string read GetImageTank write SetImageTank;
    property TankMaxMassa : TPhysID read GetTankMaxMassa write SetTankMaxMassa;
    property TankMinMassa : integer read FTankMinMassa write SetTankMinMassa;
    property ID : TPhysID read FID write SetID stored false;
    property CaptionColor: TColor read GetCaptionColor write SetCaptionColor;
    property BlendStartID : TPhysID read GetImageBlendStart write SetImageBlendStart;

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
  uStrUtils, ChoiceProduct, Math, DateUtils;

{$R *.dfm}

procedure TfrConcentrat.lProductDblClick(Sender: TObject);
var
  ItInd, i : integer;
  cp : TChoiceProductForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
begin
//Проверяем подключение к источнику данных и списку элементов
  if (OPCLookupList = nil) or
     (OPCSource = nil) or
     not (OPCSource is TaOPCSource) then
     exit;
//Устанавливаем источник данных
  aOPCSource := TaOPCSource(OPCSource);

  cp:=TChoiceProductForm.Create(nil);
  try
    ItInd := lProduct.LookupList.Items.IndexOfName(lProduct.Value);
    for i := 0 to lProduct.LookupList.Items.Count - 1 do
    begin
      cp.ListBox1.Items.Add(lProduct.LookupList.Items.ValueFromIndex[i]);
    end;
    cp.ListBox1.ItemIndex := ItInd;
    if cp.ShowModal = mrOk then
    begin
      if cp.rbNow.Checked then
        dt:=0
      else
        dt:=Trunc(cp.dtpDate.DateTime) + frac(cp.dtpTime.DateTime);

      aNewValue := lProduct.LookupList.Items.Names[cp.ListBox1.ItemIndex];
      aOPCSource.SetSensorValue(lProduct.PhysID, aNewValue, dt);
      if (aNewValue = '0') and (cp.rbNow.Checked) then
      begin
        aOPCSource.SetSensorValue(SensorSV, '0', 0);
        aOPCSource.SetSensorValue(SensorTK, '0', 0);
      end;
    end;
  finally
    cp.Free;
  end;
end;

procedure TfrConcentrat.UpdateTankStatus(Sender: TObject);
begin
  try
//Устанавливаем дату начала использования продукта
    lProduct.Hint := lProduct.Caption + #10 + 'c ' + DateTimeToStr(lProduct.Moment);
//Скрываем даннык с датчиков если продукта нет
    if lProduct.Value = '0' then
    begin
      lTankName.Color    := $00E1E1E1;
      gMassa.BackColor   := $00EAEAEA;
      lSv.Visible        := false;
      lTK.Visible        := false;
      lSVCaption.Visible := false;
      lTKCaption.Visible := false;
    end
//Иначе отображаем данные
    else
    begin
      lTankName.Color           := clSkyBlue;
      gMassa.BackColor          := clWhite;
      lSv.Visible               := SensorSV<>'';
      lTK.Visible               := SensorTK<>'';
      lSVCaption.Visible        := SensorSV<>'';
      lTKCaption.Visible        := SensorTK<>'';
    end;
  except
    on e : Exception do
      OPCLog.WriteToLog('UpdateTankStatus: ' + e.Message);
  end;

end;

procedure TfrConcentrat.uStatChange(Sender: TObject);
begin
  inherited;
//Проверяем состояние емкости
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

procedure TfrConcentrat.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
//Устанавливаем компонентам источник данных
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
    else if Components[i] is TaOPCProvider then
      TaOPCProvider(Components[i]).OPCSource := Value;
  end;
end;

procedure TfrConcentrat.SetOPCLookupList(const Value: taOPCLookupList);
begin
  lProduct.LookupList := Value;
end;

function TfrConcentrat.GetLookupList: taOPCLookupList;
begin
  Result := lProduct.LookupList;
end;

procedure TfrConcentrat.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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
        else if ObjectName = 'Материал' then
          SensorProduct     := id
        else if ObjectName = 'Температура' then
          SensorTemperatura := id
        else if ObjectName = 'Brix' then
          SensorSV          := id
        else if ObjectName = 'Кислотность' then
          SensorTK          := id
        else if ObjectName = 'Уровень' then
          TankMaxMassa      := id
        else if ObjectName = 'Низкий уровень' then
          LevelDownID      := id
        else if ObjectName = 'Высокий уровень' then
          LevelUpID      := id
        else if ObjectName = 'Мешалка' then
          BlendStartID      := id
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

function TfrConcentrat.GetSensorMassa: TPhysID;
begin
  Result:=lMassa.PhysID;
end;

function TfrConcentrat.GetSensorProduct: TPhysID;
begin
  Result:=lProduct.PhysID;
end;

function TfrConcentrat.GetSensorTemperatura: TPhysID;
begin
  Result:=lTemperature.PhysID;
end;

function TfrConcentrat.GetTankName: string;
begin
  Result:=lTankName.Caption;
end;

procedure TfrConcentrat.SetTankName(const Value: string);
begin
  lTankName.Caption:=Value;
end;

procedure TfrConcentrat.SetSensorMassa(const Value: TPhysID);
begin
  lMassa.PhysID:=Value;
end;

procedure TfrConcentrat.SetSensorProduct(const Value: TPhysID);
begin
  lProduct.PhysID:=Value;
end;

procedure TfrConcentrat.SetSensorTemperatura(const Value: TPhysID);
begin
  lTemperature.PhysID:=Value;
end;


procedure TfrConcentrat.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrConcentrat.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrConcentrat.SetTankMaxMassa(const Value: TPhysID);
begin
  gMassa.PhysID := Value;
end;

function TfrConcentrat.GetTankMaxMassa: TPhysID;
begin
  Result := gMassa.PhysID;
end;

procedure TfrConcentrat.SetID(const Value: TPhysID);
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
      else if ObjectName = 'Материал' then
        SensorProduct     := Data.Strings[0]
      else if ObjectName = 'Температура' then
        SensorTemperatura := Data.Strings[0]
      else if ObjectName = 'Brix' then
        SensorSV          := Data.Strings[0]
      else if ObjectName = 'Кислотность' then
        SensorTK          := Data.Strings[0]
      else if ObjectName = 'Уровень' then
        TankMaxMassa      := Data.Strings[0]
      else if ObjectName = 'Низкий уровень' then
        LevelDownID      := Data.Strings[0]
      else if ObjectName = 'Высокий уровень' then
        LevelUpID      := Data.Strings[0]
      else if ObjectName = 'Мешалка' then
        BlendStartID      := Data.Strings[0]
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

function TfrConcentrat.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(gMassa.OPCSource as TaCustomMultiOPCSource);
end;

function TfrConcentrat.GetSensorSV: TPhysID;
begin
  Result := lSv.PhysID;
end;

procedure TfrConcentrat.SetSensorSV(const Value: TPhysID);
begin
  lSv.PhysID := Value;
  lSv.Visible := lSv.PhysID<>'';
  lSVCaption.Visible := lSv.PhysID<>'';
  lSv.Cursor := IfThen(lSv.PhysID<>'',crHandPoint,crDefault);
end;

procedure TfrConcentrat.lSvDblClick(Sender: TObject);
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

procedure TfrConcentrat.SetCaptionColor(const Value: TColor);
begin
  Shape1.Brush.Color := Value;
end;

function TfrConcentrat.GetCaptionColor: TColor;
begin
  Result := Shape1.Brush.Color;
end;

procedure TfrConcentrat.SetTankMinMassa(const Value: integer);
begin
  FTankMinMassa := Value;
end;

procedure TfrConcentrat.lTKDblClick(Sender: TObject);
var
  v:string;
  dt:TDateTime;
begin
  if (OPCSource=nil) or (lTK.PhysID='')
    or not (OPCSource is TaOPCSource) then
    exit;

  v:=lTK.Value;
  if InputQuery('Укажите титруемую кислотность',
    'Укажите титруемую кислотность',v) then
  begin
    dt:=0;
    v:=StringReplace(v,'.',',',[]);
    TaOPCSource(lTK.OPCSource).SetSensorValue(lTK.PhysID,
      v, dt);
  end;
end;

function TfrConcentrat.GetSensorTK: TPhysID;
begin
  Result := lTK.PhysID;
end;

procedure TfrConcentrat.SetSensorTK(const Value: TPhysID);
begin
  lTK.PhysID := Value;
  lTK.Visible := lTK.PhysID<>'';
  lTKCaption.Visible := lTK.PhysID<>'';
  lTK.Cursor := IfThen(lTK.PhysID<>'',crHandPoint,crDefault);
end;

function TfrConcentrat.GetOPCImageList: TaOPCImageList;
begin
  Result := LevelDown.OPCImageList;
end;

procedure TfrConcentrat.SetImageList(const Value: TaOPCImageList);
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
  BlendStart.OPCImageList := Value;
  Clear.OPCImageList := Value;
  Stiril.OPCImageList := Value;
  Tank.OPCImageList := Value;
end;

procedure TfrConcentrat.pStepChange(Sender: TObject);
begin
  inherited;
  if ((pStep.Value = '20') and (MoykaStop.Value = '1'))
     then DrenagStop.Value := '1'
     else DrenagStop.Value := '0';
  if ((pStep.Value = '20') and (MoykaStart.Value = '1'))
    then DrenagStart.Value := '1'
    else DrenagStart.Value := '0';
end;

procedure TfrConcentrat.SetImageLevelDown(const Value: TPhysID);
begin
  LevelDown.PhysID := Value;
end;

function TfrConcentrat.GetImageLevelDown: TPhysID;
begin
  Result := LevelDown.PhysID;
end;

procedure TfrConcentrat.SetImageLevelUp(const Value: TPhysID);
begin
  LevelUp.PhysID := Value;
end;

function TfrConcentrat.GetImageLevelUp: TPhysID;
begin
  Result := LevelUp.PhysID;
end;

procedure TfrConcentrat.SetImageService(const Value: TPhysID);
begin
  Service.PhysID := Value;
end;

function TfrConcentrat.GetImageService: TPhysID;
begin
  Result := Service.PhysID;
end;

procedure TfrConcentrat.SetImageMoykaStart(const Value: TPhysID);
begin
  MoykaStart.PhysID := Value;
end;

function TfrConcentrat.GetImageMoykaStart: TPhysID;
begin
  Result := MoykaStart.PhysID;
end;

procedure TfrConcentrat.SetImageMoykaStop(const Value: TPhysID);
begin
  MoykaStop.PhysID := Value;
end;

function TfrConcentrat.GetImageMoykaStop: TPhysID;
begin
  Result := MoykaStop.PhysID;
end;

procedure TfrConcentrat.SetImageMoykaHand(const Value: TPhysID);
begin
  MoykaHand.PhysID := Value;
end;

function TfrConcentrat.GetImageMoykaHand: TPhysID;
begin
  Result := MoykaHand.PhysID;
end;

procedure TfrConcentrat.SetProvaider(const Value: TPhysID);
begin
  pStep.PhysID := Value;
end;

function TfrConcentrat.GetProvaider: TPhysID;
begin
  Result := pStep.PhysID;
end;

procedure TfrConcentrat.SetProvaiderNew(const Value: TPhysID);
begin
  uStat.PhysID := Value;
end;

function TfrConcentrat.GetProvaiderNew: TPhysID;
begin
  Result := uStat.PhysID;
end;

function TfrConcentrat.GetImageTank: string;
begin
  Result:=Tank.Value;
end;

procedure TfrConcentrat.SetImageTank(const Value: string);
begin
  Tank.Value := '1';
end;

procedure TfrConcentrat.SetImageBlendStart(const Value: TPhysID);
begin
  BlendStart.PhysID := Value;
end;

function TfrConcentrat.GetImageBlendStart: TPhysID;
begin
  Result := BlendStart.PhysID;
end;

initialization
  RegisterClasses([TfrConcentrat]);
end.
