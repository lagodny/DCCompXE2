{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uLimonPK2Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape;

type
  TfrLimon = class(TaOPCFrame)
    Panel1: TPanel;
    lTankName: TaOPCLabel;
    lTK: TaOPCLabel;
    lTKCaption: TaOPCLabel;
    lSv: TaOPCLabel;
    lSVCaption: TaOPCLabel;
    gMassa: TaOPCGauge;
    Shape1: TaOPCShape;
    LevelDown: TaOPCImage;
    LevelUp: TaOPCImage;
    pStep: TaOPCProvider;
    BlendStart: TaOPCImage;
    BlendStop: TaOPCImage;
    Clear: TaOPCImage;
    DrenagStart: TaOPCImage;
    DrenagStartStek: TaOPCImage;
    DrenagStop: TaOPCImage;
    DrenagStopStek: TaOPCImage;
    MoykaStart: TaOPCImage;
    MoykaStop: TaOPCImage;
    QualityStart: TaOPCImage;
    QualityStop: TaOPCImage;
    Service: TaOPCImage;
    Stiril: TaOPCImage;
    LevelMiddle: TaOPCImage;
    Tank: TaOPCImage;
    procedure pStepChange(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure lSvDblClick(Sender: TObject);
    procedure lTKDblClick(Sender: TObject);
    procedure UpdateTankStatus(Sender: TObject);
  private
    FTankMinMassa: integer;
    function  GetProvaider: TPhysID;
    procedure SetProvaider(const Value: TPhysID);
    function  GetImageLevelDown: TPhysID;
    procedure SetImageLevelDown(const Value: TPhysID);
    function  GetImageLevelUp: TPhysID;
    procedure SetImageLevelUp(const Value: TPhysID);
    function  GetImageLevelMiddle: TPhysID;
    procedure SetImageLevelMiddle(const Value: TPhysID);
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
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);
    function  GetImageTank: string;
    procedure SetImageTank(const Value: string);

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
    property SensorSV : TPhysID read GetSensorSV write SetSensorSV;
    property SensorTK : TPhysID read GetSensorTK write SetSensorTK;
    property TankName : string read GetTankName write SetTankName;
    property TankImage : string read GetImageTank write SetImageTank;
    property TankMaxMassa : TPhysID read GetTankMaxMassa write SetTankMaxMassa;
    property TankMinMassa : integer read FTankMinMassa write SetTankMinMassa;
    property CaptionColor: TColor read GetCaptionColor write SetCaptionColor;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property LevelDownID : TPhysID read GetImageLevelDown write SetImageLevelDown;
    property LevelMiddleID : TPhysID read GetImageLevelMiddle write SetImageLevelMiddle;
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
    property ProvaiderID : TPhysID read GetProvaider write SetProvaider;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

procedure TfrLimon.UpdateTankStatus(Sender: TObject);
begin
  try
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

procedure TfrLimon.SetOPCSource(const Value: TaCustomMultiOPCSource);
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


procedure TfrLimon.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

        if ObjectName = 'Brix' then
          SensorSV          := id
        else if ObjectName = 'Кислотность' then
          SensorTK          := id
        else if ObjectName = 'Уровень' then
          TankMaxMassa      := id
        else if ObjectName = 'Низкий уровень' then
          LevelDownID      := id
        else if ObjectName = 'Высокий уровень' then
          LevelUpID      := id
        else if ObjectName = 'Средний уровень' then
          LevelMiddleID      := id
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
        end;

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

function TfrLimon.GetTankName: string;
begin
  Result:=lTankName.Caption;
end;

procedure TfrLimon.SetTankName(const Value: string);
begin
  lTankName.Caption:=Value;
end;

procedure TfrLimon.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrLimon.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrLimon.SetTankMaxMassa(const Value: TPhysID);
begin
  gMassa.PhysID := Value;
end;

function TfrLimon.GetTankMaxMassa: TPhysID;
begin
  Result := gMassa.PhysID;
end;

procedure TfrLimon.SetID(const Value: TPhysID);
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

      if ObjectName = 'Brix' then
        SensorSV          := Data.Strings[0]
      else if ObjectName = 'Кислотность' then
        SensorTK          := Data.Strings[0]
      else if ObjectName = 'Уровень' then
        TankMaxMassa      := Data.Strings[0]
      else if ObjectName = 'Низкий уровень' then
        LevelDownID      := Data.Strings[0]
      else if ObjectName = 'Высокий уровень' then
        LevelUpID      := Data.Strings[0]
      else if ObjectName = 'Средний уровень' then
        LevelMiddleID      := Data.Strings[0]
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
      end;
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrLimon.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(gMassa.OPCSource as TaCustomMultiOPCSource);
end;

function TfrLimon.GetSensorSV: TPhysID;
begin
  Result := lSv.PhysID;
end;

procedure TfrLimon.SetSensorSV(const Value: TPhysID);
begin
  lSv.PhysID := Value;
  lSv.Visible := lSv.PhysID<>'';
  lSVCaption.Visible := lSv.PhysID<>'';
  lSv.Cursor := IfThen(lSv.PhysID<>'',crHandPoint,crDefault);
end;

procedure TfrLimon.lSvDblClick(Sender: TObject);
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

procedure TfrLimon.SetCaptionColor(const Value: TColor);
begin
  Shape1.Brush.Color := Value;
end;

function TfrLimon.GetCaptionColor: TColor;
begin
  Result := Shape1.Brush.Color;
end;

procedure TfrLimon.SetTankMinMassa(const Value: integer);
begin
  FTankMinMassa := Value;
end;

procedure TfrLimon.lTKDblClick(Sender: TObject);
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

function TfrLimon.GetSensorTK: TPhysID;
begin
  Result := lTK.PhysID;
end;

procedure TfrLimon.SetSensorTK(const Value: TPhysID);
begin
  lTK.PhysID := Value;
  lTK.Visible := lTK.PhysID<>'';
  lTKCaption.Visible := lTK.PhysID<>'';
  lTK.Cursor := IfThen(lTK.PhysID<>'',crHandPoint,crDefault);
end;

function TfrLimon.GetOPCImageList: TaOPCImageList;
begin
  Result := LevelDown.OPCImageList;
end;

procedure TfrLimon.SetImageList(const Value: TaOPCImageList);
begin
  LevelDown.OPCImageList := Value;
  LevelUp.OPCImageList := Value;
  LevelMiddle.OPCImageList := Value;
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
  Tank.OPCImageList := Value;
end;

procedure TfrLimon.pStepChange(Sender: TObject);
begin
  inherited;
  if ((pStep.Value = '20') and  (MoykaStop.Value = '1'))
    then DrenagStop.Value := '1'
    else DrenagStop.Value := '0';
  if ((pStep.Value = '20') and  (MoykaStart.Value = '1'))
    then DrenagStart.Value := '1'
    else DrenagStart.Value := '0';
end;

procedure TfrLimon.SetImageLevelDown(const Value: TPhysID);
begin
  LevelDown.PhysID := Value;
end;

function TfrLimon.GetImageLevelDown: TPhysID;
begin
  Result := LevelDown.PhysID;
end;

procedure TfrLimon.SetImageLevelUp(const Value: TPhysID);
begin
  LevelUp.PhysID := Value;
end;

function TfrLimon.GetImageLevelUp: TPhysID;
begin
  Result := LevelUp.PhysID;
end;

procedure TfrLimon.SetImageQualityStop(const Value: TPhysID);
begin
  QualityStop.PhysID := Value;
end;

function TfrLimon.GetImageQualityStop: TPhysID;
begin
  Result := QualityStop.PhysID;
end;

procedure TfrLimon.SetImageQualityStart(const Value: TPhysID);
begin
  QualityStart.PhysID := Value;
end;

function TfrLimon.GetImageQualityStart: TPhysID;
begin
  Result := QualityStart.PhysID;
end;

procedure TfrLimon.SetImageService(const Value: TPhysID);
begin
  Service.PhysID := Value;
end;

function TfrLimon.GetImageService: TPhysID;
begin
  Result := Service.PhysID;
end;

procedure TfrLimon.SetImageBlendStop(const Value: TPhysID);
begin
  BlendStop.PhysID := Value;
end;

function TfrLimon.GetImageBlendStop: TPhysID;
begin
  Result := BlendStop.PhysID;
end;

procedure TfrLimon.SetImageBlendStart(const Value: TPhysID);
begin
  BlendStart.PhysID := Value;
end;

function TfrLimon.GetImageBlendStart: TPhysID;
begin
  Result := BlendStart.PhysID;
end;

procedure TfrLimon.SetImageDrenagStopStek(const Value: TPhysID);
begin
  DrenagStopStek.PhysID := Value;
end;

function TfrLimon.GetImageDrenagStopStek: TPhysID;
begin
  Result := DrenagStopStek.PhysID;
end;

procedure TfrLimon.SetImageDrenagStartStek(const Value: TPhysID);
begin
  DrenagStartStek.PhysID := Value;
end;

function TfrLimon.GetImageDrenagStartStek: TPhysID;
begin
  Result := DrenagStartStek.PhysID;
end;

procedure TfrLimon.SetImageMoykaStart(const Value: TPhysID);
begin
  MoykaStart.PhysID := Value;
end;

function TfrLimon.GetImageMoykaStart: TPhysID;
begin
  Result := MoykaStart.PhysID;
end;

procedure TfrLimon.SetImageMoykaStop(const Value: TPhysID);
begin
  MoykaStop.PhysID := Value;
end;

function TfrLimon.GetImageMoykaStop: TPhysID;
begin
  Result := MoykaStop.PhysID;
end;

procedure TfrLimon.SetImageClear(const Value: TPhysID);
begin
  Clear.PhysID := Value;
  Stiril.PhysID := Value;
end;

function TfrLimon.GetImageClear: TPhysID;
begin
  Result := Clear.PhysID;
end;

procedure TfrLimon.SetImageStiril(const Value: TPhysID);
begin
//  Stiril.PhysID := Value;
end;

function TfrLimon.GetImageStiril: TPhysID;
begin
  Result := Stiril.PhysID;
end;

procedure TfrLimon.SetProvaider(const Value: TPhysID);
begin
  pStep.PhysID := Value;
end;

function TfrLimon.GetProvaider: TPhysID;
begin
  Result := pStep.PhysID;
end;

procedure TfrLimon.SetImageLevelMiddle(const Value: TPhysID);
begin
  LevelMiddle.PhysID := Value;
end;

function TfrLimon.GetImageLevelMiddle: TPhysID;
begin
  Result := LevelMiddle.PhysID;
end;

function TfrLimon.GetImageTank: string;
begin
  Result:=Tank.Value;
end;

procedure TfrLimon.SetImageTank(const Value: string);
begin
  Tank.Value := '1';
end;

initialization
  RegisterClasses([TfrLimon]);
end.
