{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uCupagPK2Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape;
//const
//  p = 10000;

type
  TfrCupag = class(TaOPCFrame)
    Panel1: TPanel;
    lTankName: TaOPCLabel;
    lTK: TaOPCLabel;
    lTKCaption: TaOPCLabel;
    lSv: TaOPCLabel;
    lSVCaption: TaOPCLabel;
    lProduct: TaOPCLabel;
    lMassa: TaOPCLabel;
    gMassa: TaOPCGauge;
    Shape1: TaOPCShape;
    LevelDown: TaOPCImage;
    LevelUp: TaOPCImage;
    QualityStop: TaOPCImage;
    QualityStart: TaOPCImage;
    Service: TaOPCImage;
    ReceptStart: TaOPCImage;
    BlendStop: TaOPCImage;
    BlendStart: TaOPCImage;
    DrenagStop: TaOPCImage;
    DrenagStart: TaOPCImage;
    DrenagStopStek: TaOPCImage;
    DrenagStartStek: TaOPCImage;
    MoykaStart: TaOPCImage;
    MoykaStop: TaOPCImage;
    Clear: TaOPCImage;
    Stiril: TaOPCImage;
    ReceptStop: TaOPCImage;
    pStep: TaOPCProvider;
    Tank: TaOPCImage;
    procedure pStepChange(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure lSvDblClick(Sender: TObject);
    procedure lTKDblClick(Sender: TObject);
    procedure lProductDblClick(Sender: TObject);
    procedure UpdateTankStatus(Sender: TObject);
  private
    FfrWidth, FfrHeigth: integer;
//    FfrScale: integer;
    FTankMinMassa: integer;
    function  GetProvaider: TPhysID;
    procedure SetProvaider(const Value: TPhysID);
    function  GetImageLevelDown: TPhysID;
    procedure SetImageLevelDown(const Value: TPhysID);
    function  GetImageLevelUp: TPhysID;
    procedure SetImageLevelUp(const Value: TPhysID);
    function  GetImageQualityStop: TPhysID;
    procedure SetImageQualityStop(const Value: TPhysID);
    function  GetImageQualityStart: TPhysID;
    procedure SetImageQualityStart(const Value: TPhysID);
    function  GetImageService: TPhysID;
    procedure SetImageService(const Value: TPhysID);
    function  GetImageBlendStop: TPhysID;
    procedure SetImageBlendStop(const Value: TPhysID);
    function  GetImageBlendStart: TPhysID;
    procedure SetImageBlendStart(const Value: TPhysID);
    function  GetImageDrenagStopStek: TPhysID;
    procedure SetImageDrenagStopStek(const Value: TPhysID);
    function  GetImageDrenagStartStek: TPhysID;
    procedure SetImageDrenagStartStek(const Value: TPhysID);
    function  GetImageMoykaStart: TPhysID;
    procedure SetImageMoykaStart(const Value: TPhysID);
    function  GetImageMoykaStop: TPhysID;
    procedure SetImageMoykaStop(const Value: TPhysID);
    function  GetImageClear: TPhysID;
    procedure SetImageClear(const Value: TPhysID);
    function  GetImageStiril: TPhysID;
    procedure SetImageStiril(const Value: TPhysID);
    function  GetImageReceptStop: TPhysID;
    procedure SetImageReceptStop(const Value: TPhysID);
    function  GetImageReceptStart: TPhysID;
    procedure SetImageReceptStart(const Value: TPhysID);
    function  GetImageTank: string;
    procedure SetImageTank(const Value: string);

    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetLookupList: taOPCLookupList;
    function  GetSensorMassa: TPhysID;
    procedure SetSensorMassa(const Value: TPhysID);
    function  GetSensorProduct: TPhysID;
    procedure SetSensorProduct(const Value: TPhysID);
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
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    constructor Create(AOwner: TComponent); override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property SensorProduct : TPhysID read GetSensorProduct write SetSensorProduct;
    property SensorMassa : TPhysID read GetSensorMassa write SetSensorMassa;
    property SensorSV : TPhysID read GetSensorSV write SetSensorSV;
    property SensorTK : TPhysID read GetSensorTK write SetSensorTK;
    property TankName : string read GetTankName write SetTankName;
    property TankImage : string read GetImageTank write SetImageTank;
    property TankMaxMassa : TPhysID read GetTankMaxMassa write SetTankMaxMassa;
    property TankMinMassa : integer read FTankMinMassa write SetTankMinMassa;
    property CaptionColor: TColor read GetCaptionColor write SetCaptionColor;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property LevelDownID : TPhysID read GetImageLevelDown write SetImageLevelDown;
    property LevelUpID : TPhysID read GetImageLevelUp write SetImageLevelUp;
    property QualityStopID : TPhysID read GetImageQualityStop write SetImageQualityStop;
    property QualityStartID : TPhysID read GetImageQualityStart write SetImageQualityStart;
    property ServiceID : TPhysID read GetImageService write SetImageService;
    property BlendStopID : TPhysID read GetImageBlendStop write SetImageBlendStop;
    property BlendStartID : TPhysID read GetImageBlendStart write SetImageBlendStart;
    property DrenagStopStekID : TPhysID read GetImageDrenagStopStek write SetImageDrenagStopStek;
    property DrenagStartStekID : TPhysID read GetImageDrenagStartStek write SetImageDrenagStartStek;
    property MoykaStartID : TPhysID read GetImageMoykaStart write SetImageMoykaStart;
    property MoykaStopID : TPhysID read GetImageMoykaStop write SetImageMoykaStop;
    property ClearID : TPhysID read GetImageClear write SetImageClear;
    property StirilID : TPhysID read GetImageStiril write SetImageStiril;
    property ReceptStopID : TPhysID read GetImageReceptStop write SetImageReceptStop;
    property ReceptStartID : TPhysID read GetImageReceptStart write SetImageReceptStart;
    property ProvaiderID : TPhysID read GetProvaider write SetProvaider;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

procedure TfrCupag.lProductDblClick(Sender: TObject);
var
  ItInd, i : integer;
  cp : TChoiceProductForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
begin
  if (OPCLookupList = nil) or (OPCSource = nil) or
    not (OPCSource is TaOPCSource) then
    exit;

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

procedure TfrCupag.UpdateTankStatus(Sender: TObject);
begin
  try
    lProduct.Hint := lProduct.Caption + #10 + 'c ' + DateTimeToStr(lProduct.Moment);

    if lProduct.Value = '0' then
    begin
      lTankName.Color    := $00E1E1E1;
      gMassa.BackColor   := $00EAEAEA;
      lSv.Visible        := false;
      lTK.Visible        := false;
      lSVCaption.Visible := false;
      lTKCaption.Visible := false;
    end
    else
    begin
      lTankName.Color           :=clSkyBlue;
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

procedure TfrCupag.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TfrCupag.SetOPCLookupList(const Value: taOPCLookupList);
begin
  lProduct.LookupList := Value;
end;

function TfrCupag.GetLookupList: taOPCLookupList;
begin
  Result := lProduct.LookupList;
end;

procedure TfrCupag.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

        if ObjectName      = 'Уровень' then
          SensorMassa       := id
        else if ObjectName = 'Материал' then
          SensorProduct     := id
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
        else if ObjectName = 'Подтверждение качества остановлено' then
          QualityStopID      := id
        else if ObjectName = 'Подтверждение качества запущено' then
          QualityStartID      := id
        else if ObjectName = 'Сервис' then
          ServiceID      := id
        else if ObjectName = 'Перемешивание остановлено' then
          BlendStopID      := id
        else if ObjectName = 'Перемешивание запущено' then
          BlendStartID      := id
        else if ObjectName = 'Шаг' then
          ProvaiderID       := id
        else if ObjectName = 'Очередь остановлена' then
          DrenagStopStekID      := id
        else if ObjectName = 'Очередь запущена' then
          DrenagStartStekID      := id
        else if ObjectName = 'Мойка запущена' then
          MoykaStartID      := id
        else if ObjectName = 'Мойка остановлена' then
          MoykaStopID      := id
        else if ObjectName = 'Состояние объекта' then
        begin
          ClearID      := id;
          StirilID      := id;
        end
        else if ObjectName = 'Выполнение рецепта приостановлено' then
          ReceptStopID      := id
        else if ObjectName = 'Выполнение рецепта запущено' then
          ReceptStartID      := id;

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
  Init(aOPCObject, true);
//  Tank.Value := '1';
  FID := IntToStr(aId);
end;

constructor TfrCupag.Create(AOwner: TComponent);
begin
  inherited;
  FfrWidth:=Width;
  FfrHeigth:=Height;
//  FfrScale:=p;
end;

function TfrCupag.GetSensorMassa: TPhysID;
begin
  Result:=lMassa.PhysID;
end;

function TfrCupag.GetSensorProduct: TPhysID;
begin
  Result:=lProduct.PhysID;
end;

function TfrCupag.GetTankName: string;
begin
  Result:=lTankName.Caption;
end;

procedure TfrCupag.SetSensorMassa(const Value: TPhysID);
begin
  lMassa.PhysID:=Value;
  gMassa.PhysID:=Value;
end;

procedure TfrCupag.SetSensorProduct(const Value: TPhysID);
begin
  lProduct.PhysID:=Value;
end;

procedure TfrCupag.SetTankName(const Value: string);
begin
  lTankName.Caption:=Value;
end;

procedure TfrCupag.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrCupag.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrCupag.SetTankMaxMassa(const Value: TPhysID);
begin
  gMassa.PhysID := lMassa.PhysID;
end;

function TfrCupag.GetTankMaxMassa: TPhysID;
begin
  Result := gMassa.PhysID;
end;

procedure TfrCupag.SetID(const Value: TPhysID);
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
//  Tank.Value := '1';
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

      if ObjectName      = 'Уровень' then
        SensorMassa       := Data.Strings[0]
      else if ObjectName = 'Материал' then
        SensorProduct     := Data.Strings[0]
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
      else if ObjectName = 'Подтверждение качества остановлено' then
        QualityStopID      := Data.Strings[0]
      else if ObjectName = 'Подтверждение качества запущено' then
        QualityStartID      := Data.Strings[0]
      else if ObjectName = 'Сервис' then
        ServiceID      := Data.Strings[0]
      else if ObjectName = 'Перемешивание остановлено' then
        BlendStopID      := Data.Strings[0]
      else if ObjectName = 'Перемешивание запущено' then
        BlendStartID      := Data.Strings[0]
      else if ObjectName = 'Шаг' then
        ProvaiderID     :=  Data.Strings[0]
      else if ObjectName = 'Очередь остановлена' then
        DrenagStopStekID      := Data.Strings[0]
      else if ObjectName = 'Очередь запущена' then
        DrenagStartStekID      := Data.Strings[0]
      else if ObjectName = 'Мойка запущена' then
        MoykaStartID      := Data.Strings[0]
      else if ObjectName = 'Мойка остановлена' then
        MoykaStopID      := Data.Strings[0]
      else if ObjectName = 'Состояние объекта' then
      begin
        ClearID      := Data.Strings[0];
        StirilID     := Data.Strings[0];
      end
      else if ObjectName = 'Выполнение рецепта приостановлено' then
        ReceptStopID      := Data.Strings[0]
      else if ObjectName = 'Выполнение рецепта запущено' then
        ReceptStartID      := Data.Strings[0];
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrCupag.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(gMassa.OPCSource as TaCustomMultiOPCSource);
end;

function TfrCupag.GetSensorSV: TPhysID;
begin
  Result := lSv.PhysID;
end;

procedure TfrCupag.SetSensorSV(const Value: TPhysID);
begin
  lSv.PhysID := Value;
  lSv.Visible := lSv.PhysID<>'';
  lSVCaption.Visible := lSv.PhysID<>'';
  lSv.Cursor := IfThen(lSv.PhysID<>'',crHandPoint,crDefault);
end;

procedure TfrCupag.lSvDblClick(Sender: TObject);
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

procedure TfrCupag.SetCaptionColor(const Value: TColor);
begin
  Shape1.Brush.Color := Value;
end;

function TfrCupag.GetCaptionColor: TColor;
begin
  Result := Shape1.Brush.Color;
end;

procedure TfrCupag.SetTankMinMassa(const Value: integer);
begin
  FTankMinMassa := Value;
end;

procedure TfrCupag.lTKDblClick(Sender: TObject);
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

function TfrCupag.GetSensorTK: TPhysID;
begin
  Result := lTK.PhysID;
end;

procedure TfrCupag.SetSensorTK(const Value: TPhysID);
begin
  lTK.PhysID := Value;
  lTK.Visible := lTK.PhysID<>'';
  lTKCaption.Visible := lTK.PhysID<>'';
  lTK.Cursor := IfThen(lTK.PhysID<>'',crHandPoint,crDefault);
end;

function TfrCupag.GetOPCImageList: TaOPCImageList;
begin
  Result := LevelDown.OPCImageList;
end;

procedure TfrCupag.SetImageList(const Value: TaOPCImageList);
begin
  LevelDown.OPCImageList := Value;
  LevelUp.OPCImageList := Value;
  QualityStop.OPCImageList := Value;
  QualityStart.OPCImageList := Value;
  Service.OPCImageList := Value;
  BlendStop.OPCImageList := Value;
  BlendStart.OPCImageList := Value;
  DrenagStop.OPCImageList := Value;
  DrenagStart.OPCImageList := Value;
  DrenagStopStek.OPCImageList := Value;
  DrenagStartStek.OPCImageList := Value;
  MoykaStart.OPCImageList := Value;
  MoykaStop.OPCImageList := Value;
  Clear.OPCImageList := Value;
  Stiril.OPCImageList := Value;
  ReceptStop.OPCImageList := Value;
  ReceptStart.OPCImageList := Value;
  Tank.OPCImageList := Value;
end;

procedure TfrCupag.pStepChange(Sender: TObject);
begin
  inherited;
  if ((pStep.Value = '20') and  (MoykaStop.Value = '1'))
    then DrenagStop.Value := '1'
    else DrenagStop.Value := '0';
  if ((pStep.Value = '20') and  (MoykaStart.Value = '1'))
    then DrenagStart.Value := '1'
    else DrenagStart.Value := '0';
end;

procedure TfrCupag.SetImageLevelDown(const Value: TPhysID);
begin
  LevelDown.PhysID := Value;
end;

function TfrCupag.GetImageLevelDown: TPhysID;
begin
  Result := LevelDown.PhysID;
end;

procedure TfrCupag.SetImageLevelUp(const Value: TPhysID);
begin
  LevelUp.PhysID := Value;
end;

function TfrCupag.GetImageLevelUp: TPhysID;
begin
  Result := LevelUp.PhysID;
end;

procedure TfrCupag.SetImageQualityStop(const Value: TPhysID);
begin
  QualityStop.PhysID := Value;
end;

function TfrCupag.GetImageQualityStop: TPhysID;
begin
  Result := QualityStop.PhysID;
end;

procedure TfrCupag.SetImageQualityStart(const Value: TPhysID);
begin
  QualityStart.PhysID := Value;
end;

function TfrCupag.GetImageQualityStart: TPhysID;
begin
  Result := QualityStart.PhysID;
end;

procedure TfrCupag.SetImageService(const Value: TPhysID);
begin
  Service.PhysID := Value;
end;

function TfrCupag.GetImageService: TPhysID;
begin
  Result := Service.PhysID;
end;

procedure TfrCupag.SetImageBlendStop(const Value: TPhysID);
begin
  BlendStop.PhysID := Value;
end;

function TfrCupag.GetImageBlendStop: TPhysID;
begin
  Result := BlendStop.PhysID;
end;

procedure TfrCupag.SetImageBlendStart(const Value: TPhysID);
begin
  BlendStart.PhysID := Value;
end;

function TfrCupag.GetImageBlendStart: TPhysID;
begin
  Result := BlendStart.PhysID;
end;

procedure TfrCupag.SetImageDrenagStopStek(const Value: TPhysID);
begin
  DrenagStopStek.PhysID := Value;
end;

function TfrCupag.GetImageDrenagStopStek: TPhysID;
begin
  Result := DrenagStopStek.PhysID;
end;

procedure TfrCupag.SetImageDrenagStartStek(const Value: TPhysID);
begin
  DrenagStartStek.PhysID := Value;
end;

function TfrCupag.GetImageDrenagStartStek: TPhysID;
begin
  Result := DrenagStartStek.PhysID;
end;

procedure TfrCupag.SetImageMoykaStart(const Value: TPhysID);
begin
  MoykaStart.PhysID := Value;
end;

function TfrCupag.GetImageMoykaStart: TPhysID;
begin
  Result := MoykaStart.PhysID;
end;

procedure TfrCupag.SetImageMoykaStop(const Value: TPhysID);
begin
  MoykaStop.PhysID := Value;
end;

function TfrCupag.GetImageMoykaStop: TPhysID;
begin
  Result := MoykaStop.PhysID;
end;

procedure TfrCupag.SetImageClear(const Value: TPhysID);
begin
  Clear.PhysID := Value;
  Stiril.PhysID := Value;
end;

function TfrCupag.GetImageClear: TPhysID;
begin
  Result := Clear.PhysID;
end;

procedure TfrCupag.SetImageStiril(const Value: TPhysID);
begin
//  Stiril.PhysID := Value;
end;

function TfrCupag.GetImageStiril: TPhysID;
begin
  Result := Stiril.PhysID;
end;

procedure TfrCupag.SetImageReceptStop(const Value: TPhysID);
begin
  ReceptStop.PhysID := Value;
end;

function TfrCupag.GetImageReceptStop: TPhysID;
begin
  Result := ReceptStop.PhysID;
end;

procedure TfrCupag.SetImageReceptStart(const Value: TPhysID);
begin
  ReceptStart.PhysID := Value;
end;

function TfrCupag.GetImageReceptStart: TPhysID;
begin
  Result := ReceptStart.PhysID;
end;

procedure TfrCupag.SetProvaider(const Value: TPhysID);
begin
  pStep.PhysID := Value;
end;

function TfrCupag.GetProvaider: TPhysID;
begin
  Result := pStep.PhysID;
end;

function TfrCupag.GetImageTank: string;
begin
  Result:=Tank.Value;
end;

procedure TfrCupag.SetImageTank(const Value: string);
begin
  Tank.Value := '1';
end;

initialization
  RegisterClasses([TfrCupag]);
end.
