{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{            ПАРА КУПАЖНЫХ ЕМКОСТЕЙ ПК №1               }
{                                                       }
{*******************************************************}

unit uCupagTankFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aCustomOPCSource, aOPCSource, aOPCTCPSource, ExtCtrls,
  aOPCSwitch, aOpcPump, aOPCLabel,
  StdCtrls, aOPCValve, aOPCDataObject, aOPCPipe, aOPCGauge,
  aOPCProvider, aOPCLookupList,
  uOPCFrame, aOPCImage, aOPCImageList,
  uOPCObjects, aOPCImage2In;

type
  TfrCupagTank = class(TaOPCFrame)
    Panel1: TPanel;
    T2: TaOPCGauge;
    T1: TaOPCGauge;
    Label1: TaOPCLabel;
    Label2: TaOPCLabel;
    Label3: TaOPCLabel;
    gConcentrat: TaOPCGauge;
    lConcentrat: TaOPCLabel;
    gWater: TaOPCGauge;
    lWater: TaOPCLabel;
    gShuger: TaOPCGauge;
    lShuger: TaOPCLabel;
    Label4: TaOPCLabel;
    Label5: TaOPCLabel;
    Label6: TaOPCLabel;
    Label7: TaOPCLabel;
    Label10: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    lMode: TaOPCBlinkLabel;
    llT1Mode: TaOPCLookupList;
    aOPCImageListPipe: TaOPCImageList;
    k2In: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImageListUgol: TaOPCImageList;
    k14Out: TaOPCImage;
    k11Out: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    k2Out: TaOPCImage;
    r1: TaOPCImage;
    aOPCImage13: TaOPCImage;
    k8In: TaOPCImage;
    k7In: TaOPCImage;
    k7Out: TaOPCImage;
    aOPCImageListValve: TaOPCImageList;
    K6: TaOPCImage2In;
    K7: TaOPCImage2In;
    K9: TaOPCImage2In;
    k10: TaOPCImage2In;
    k6In: TaOPCImage;
    k6Out: TaOPCImage;
    aOPCImage23: TaOPCImage;
    k1In: TaOPCImage;
    K1: TaOPCImage2In;
    k1Out: TaOPCImage;
    K2: TaOPCImage2In;
    k3Out: TaOPCImage;
    K3: TaOPCImage2In;
    k3In: TaOPCImage;
    aOPCImage27: TaOPCImage;
    K8: TaOPCImage2In;
    k8Out: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage28: TaOPCImage;
    aOPCImage29: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    r2: TaOPCImage;
    aOPCImage34: TaOPCImage;
    aOPCImage35: TaOPCImage;
    k17Out: TaOPCImage;
    aOPCImage37: TaOPCImage;
    aOPCImage38: TaOPCImage;
    aOPCImage39: TaOPCImage;
    k9In: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage41: TaOPCImage;
    Back: TaOPCImage;
    K14: TaOPCImage2In;
    k10Out: TaOPCImage;
    K13: TaOPCImage2In;
    k5In: TaOPCImage;
    K5: TaOPCImage2In;
    k5Out: TaOPCImage;
    K4: TaOPCImage2In;
    k4In: TaOPCImage;
    k4Out: TaOPCImage;
    aOPCImage54: TaOPCImage;
    k13Out: TaOPCImage;
    K11: TaOPCImage2In;
    k9Out: TaOPCImage;
    k11In: TaOPCImage;
    aOPCImage60: TaOPCImage;
    K12: TaOPCImage2In;
    k12In: TaOPCImage;
    k12Out: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    aOPCImage63: TaOPCImage;
    k13In: TaOPCImage;
    k14In: TaOPCImage;
    aOPCImage64: TaOPCImage;
    M1: TaOPCImage;
    M2: TaOPCImage;
    K22: TaOPCImage2In;
    K16: TaOPCImage2In;
    pd2Out: TaOPCImage;
    k22In: TaOPCImage;
    k16In: TaOPCImage;
    k15Out: TaOPCImage;
    k22Out: TaOPCImage;
    K15: TaOPCImage2In;
    pd1Out: TaOPCImage;
    k15In: TaOPCImage;
    k21In: TaOPCImage;
    k21: TaOPCImage2In;
    k21Out: TaOPCImage;
    p1Out: TaOPCImage;
    K17: TaOPCImage2In;
    k17In: TaOPCImage;
    K18: TaOPCImage2In;
    K19: TaOPCImage2In;
    k18In: TaOPCImage;
    k19Out: TaOPCImage;
    P1: TaOPCImage;
    k20: TaOPCImage2In;
    k20Out: TaOPCImage;
    k20In: TaOPCImage;
    k18Out: TaOPCImage;
    p1In: TaOPCImage;
    pd1: TaOPCImage;
    pd2: TaOPCImage;
    k16Out: TaOPCImage;
    PWater: TaOPCProvider;
    pConcentrat: TaOPCProvider;
    pShuger: TaOPCProvider;
    s2: TaOPCImage;
    s1: TaOPCImage;
    pMode: TaOPCProvider;
    Label9: TaOPCLabel;
    lRA: TaOPCLabel;
    llRA: TaOPCLookupList;
    lCaption: TaOPCLabel;
    procedure Panel1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lModeChange(Sender: TObject);
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lModeDblClick(Sender: TObject);
    procedure K17Change(Sender: TObject);
    procedure k18OutChange(Sender: TObject);
    procedure k20Change(Sender: TObject);
    procedure K18Change(Sender: TObject);
    procedure k19OutChange(Sender: TObject);
    procedure pd1OutChange(Sender: TObject);
    procedure aOPCImage13Change(Sender: TObject);
    procedure k10Change(Sender: TObject);
    procedure K12Change(Sender: TObject);
    procedure K11Change(Sender: TObject);
    procedure K13Change(Sender: TObject);
    procedure K14Change(Sender: TObject);
    procedure K6Change(Sender: TObject);
    procedure K7Change(Sender: TObject);
    procedure K8Change(Sender: TObject);
    procedure K1Change(Sender: TObject);
    procedure K3Change(Sender: TObject);
    procedure K3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure K2Change(Sender: TObject);
    procedure K4Change(Sender: TObject);
    procedure K5Change(Sender: TObject);
    procedure pd2Change(Sender: TObject);
    procedure pd1Change(Sender: TObject);
    procedure K16Change(Sender: TObject);
    procedure k21Change(Sender: TObject);
    procedure K15Change(Sender: TObject);
    procedure k15OutChange(Sender: TObject);
    procedure K22Change(Sender: TObject);
    procedure PWaterChange(Sender: TObject);
    procedure pConcentratChange(Sender: TObject);
    procedure pShugerChange(Sender: TObject);
    procedure lConcentratMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k9OutChange(Sender: TObject);
    procedure k10OutChange(Sender: TObject);
    procedure p1OutChange(Sender: TObject);
  private
    FKeyEnterID:  TPhysID;
    FWorkModeID:  TPhysID;
    function GetTankName: string;
    procedure SetTankName(const Value: string);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    procedure ClearPhysID;
    destructor Destroy;override;
  published
    property OPCSource;//:TaOPCSource read GetOPCSource write SetOPCSource;
    property TankName : string read GetTankName write SetTankName;
  end;

function GetBufStart(Buffer: PChar; var Level: Integer): PChar;

implementation

uses
  Math, StrUtils,
  uStrUtils,
  aOPCLog;

{$R *.dfm}

function GetBufStart(Buffer: PChar; var Level: Integer): PChar;
begin
  Level := 0;
  while Buffer^ in ['@',' ', #9] do
  begin
    Inc(Buffer);
    if Buffer^ <> '@' then
      Inc(Level);
  end;
  Result := Buffer;
end;


procedure TfrCupagTank.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssCtrl in Shift) then
  begin
    if (Button=mbLeft) then
      ScaleBy(9,10)
    else if Button=mbRight then
      ScaleBy(10,9);
  end;
end;

procedure TfrCupagTank.lModeChange(Sender: TObject);
begin
  lMode.Blink := true;
end;

procedure TfrCupagTank.lModeDblClick(Sender: TObject);
var
  v:string;
  tmpOPCSource:TaOPCSource;
begin
  if (OPCSource = nil) or not (OPCSource is TaOPCSource) then
    exit;
  v:=lMode.Value;
  if InputQuery('Введите номер режима',
    'Введите номер режима',v) then
  begin
    tmpOPCSource := OPCSource as TaOPCSource;
    tmpOPCSource.SetSensorValue(FWorkModeID,v);
    tmpOPCSource.SetSensorValue(FKeyEnterID,'1')
  end;

end;

procedure TfrCupagTank.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  OPCChildsList : TOPCObjectList;
  aOPCObject  : TOPCObject;
  ParentName : string;
  SensorName : string;
  MaxVal : integer;
  id : string;
  i: Integer;
begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  TankName := aOPCObject.Name;
  MaxVal := 20000;
  OPCChildsList := TOPCObjectList.Create(false);
  try
    aOPCObject.FillChildsList(OPCChildsList);
    for i := 0 to OPCChildsList.Count - 1 do
    begin
      aOPCObject := TOPCObject(OPCChildsList.Items[i]);
      if Assigned(aOPCObject.Parent) then
      begin
        ParentName := AnsiLowerCase(aOPCObject.Parent.Name);
        SensorName := AnsiLowerCase(aOPCObject.Name);
        id := aOPCObject.IdStr;
        if ParentName = 'вода' then
        begin
          if SensorName = 'поток' then
          begin
            gWater.MaxValue := MaxVal;
            PWater.PhysID   := id;
          end;
        end
        else if ParentName = 'сахар' then
        begin
          if SensorName = 'поток' then
          begin
            gShuger.MaxValue := MaxVal;
            pShuger.PhysID   := id;
          end;
        end
        else if ParentName = 'концентрат' then
        begin
          if SensorName = 'поток' then
          begin
            gShuger.MaxValue    := MaxVal;
            pConcentrat.PhysID  := id;
          end;
        end
        else if ParentName = 'уровень' then
        begin
          if SensorName = 'уровень1' then
          begin
            T1.PhysID           := id;
            T1.MaxValue         := MaxVal;
            aOPCLabel4.PhysID   := id;
          end;
          if SensorName = 'уровень2' then
          begin
            T2.PhysID           := id;
            T2.MaxValue         := MaxVal;
            aOPCLabel5.PhysID   := id;
          end;
        end
        else if ParentName = 'контроллер' then
        begin
          if SensorName = 'режим работы' then
            pMode.PhysID  := id
          else if SensorName = AnsiLowerCase('Режим работы (з)') then
            FWorkModeID   := id
          else if SensorName = AnsiLowerCase('Реле М1') then
            m1.PhysID     := id
          else if SensorName = AnsiLowerCase('Реле М2') then
            m2.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 1') then
            k1.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 2') then
            k2.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 3') then
            k3.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 4') then
            k4.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 5') then
            k5.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 6') then
            k6.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 7') then
            k7.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 8') then
            k8.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 9') then
            k9.PhysID     := id
          else if SensorName = AnsiLowerCase('Клапан 10') then
            k10.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 11') then
            k11.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 12') then
            k12.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 13') then
            k13.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 14') then
            k14.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 15') then
            k15.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 16') then
            k16.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 17') then
            k17.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 18') then
            k18.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 19') then
            k19.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 20') then
            k20.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 21') then
            k21.PhysID    := id
          else if SensorName = AnsiLowerCase('Клапан 22') then
            k22.PhysID    := id
          else if SensorName = AnsiLowerCase('Кнопка Ввод') then
            FKeyEnterID   := id
          else if SensorName = AnsiLowerCase('Кнопка Р/А') then
            lRA.PhysID    := id
          else if SensorName = AnsiLowerCase('Предельный датчик 1') then
            pd1.PhysID    := id
          else if SensorName = AnsiLowerCase('Предельный датчик 2') then
            pd2.PhysID    := id
          else if SensorName = AnsiLowerCase('Реле PUMP1') then
            p1.PhysID     := id
        end;
      end;
    end;
  finally
    FreeAndNil(OPCChildsList);
  end;
  FID := IntToStr(aId);

end;

procedure TfrCupagTank.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;
  id         : string;
  ObjectName : string;
  SensorName : string;

  ParentList : TStringList;
  ParentName : string;

  Data: TStrings;
  MaxVal: integer;
begin
  if (FID = Value) or
    (not Assigned(OPCSource)) or
    (not (OPCSource is TaOPCSource)) then
    exit;

  MaxVal := 20000;

  ParentList := TStringList.Create;
  try
    aOPCSource := TaOPCSource(OPCSource);
    ClearPhysID;
    FID := Value;
    aOPCSource.FNameSpaceCash.Clear;
    aOPCSource.FNameSpaceTimeStamp := 0;
    aOPCSource.GetNameSpace(StrToIntDef(Value,0));
    for i := 0 to aOPCSource.FNameSpaceCash.Count - 1 do
    begin
      CurrStr := GetBufStart(PChar(aOPCSource.FNameSpaceCash[i]), ALevel);
      ObjectName := AnsiLowerCase(ExtractData(CurrStr));

      Data := TStringList.Create;
      try
        while CurrStr<>'' do
          Data.Add(ExtractData(CurrStr));

        id := Data[0];
        if FID = id then
          TankName := AnsiUpperCase(ObjectName);

        if Data.Strings[1] = '1' then
        begin
          if ALevel > ParentList.Count then
            ParentList.Add(ObjectName)
          else
            ParentList[ALevel-1] := ObjectName;
        end
        else
        begin
          // проверим наличие имени родителя требуемого уровня в списке
          if (ALevel-1) > ParentList.Count then
          begin
            OPCLog.WriteToLogFmt(
              'TfrCupagTank.SetID: (ALevel-1) > ParentList.Count (%d > %d)',
              [ALevel-1, ParentList.Count]);
            Continue;
          end;
          // -1 список с нуля, а уровень с единицы
          // -1 родителя берем на уровень выше уровень датчика
          ParentName    := ParentList.Strings[ALevel - 1 - 1];

          SensorName    := ObjectName;
          if ParentName = 'вода' then
          begin
            if SensorName = 'поток' then
            begin
              gWater.MaxValue := MaxVal;
              PWater.PhysID   := id;
            end;
          end
          else if ParentName = 'сахар' then
          begin
            if SensorName = 'поток' then
            begin
              gShuger.MaxValue := MaxVal;
              pShuger.PhysID   := id;
            end;
          end
          else if ParentName = 'концентрат' then
          begin
            if SensorName = 'поток' then
            begin
              gShuger.MaxValue    := MaxVal;
              pConcentrat.PhysID  := id;
            end;
          end
          else if ParentName = 'уровень' then
          begin
            if SensorName = 'уровень1' then
            begin
              T1.PhysID           := id;
              T1.MaxValue         := MaxVal;
              aOPCLabel4.PhysID   := id;
            end;
            if SensorName = 'уровень2' then
            begin
              T2.PhysID           := id;
              T2.MaxValue         := MaxVal;
              aOPCLabel5.PhysID   := id;
            end;
          end
          else if ParentName = 'контроллер' then
          begin
            if SensorName = 'режим работы' then
              pMode.PhysID  := id
            else if SensorName = AnsiLowerCase('Режим работы (з)') then
              FWorkModeID   := id
            else if SensorName = AnsiLowerCase('Реле М1') then
              m1.PhysID     := id
            else if SensorName = AnsiLowerCase('Реле М2') then
              m2.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 1') then
              k1.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 2') then
              k2.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 3') then
              k3.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 4') then
              k4.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 5') then
              k5.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 6') then
              k6.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 7') then
              k7.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 8') then
              k8.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 9') then
              k9.PhysID     := id
            else if SensorName = AnsiLowerCase('Клапан 10') then
              k10.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 11') then
              k11.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 12') then
              k12.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 13') then
              k13.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 14') then
              k14.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 15') then
              k15.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 16') then
              k16.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 17') then
              k17.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 18') then
              k18.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 19') then
              k19.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 20') then
              k20.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 21') then
              k21.PhysID    := id
            else if SensorName = AnsiLowerCase('Клапан 22') then
              k22.PhysID    := id
            else if SensorName = AnsiLowerCase('Кнопка Ввод') then
              FKeyEnterID   := id
            else if SensorName = AnsiLowerCase('Кнопка Р/А') then
              lRA.PhysID    := id
            else if SensorName = AnsiLowerCase('Предельный датчик 1') then
              pd1.PhysID    := id
            else if SensorName = AnsiLowerCase('Предельный датчик 2') then
              pd2.PhysID    := id
            else if SensorName = AnsiLowerCase('Реле PUMP1') then
              p1.PhysID     := id
          end
          else if ParentName = 'out' then
          begin
            if SensorName = AnsiLowerCase('Клапан 1') then
              k1.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 2') then
              k2.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 3') then
              k3.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 4') then
              k4.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 5') then
              k5.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 6') then
              k6.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 7') then
              k7.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 8') then
              k8.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 9') then
              k9.PhysID2     := id
            else if SensorName = AnsiLowerCase('Клапан 10') then
              k10.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 11') then
              k11.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 12') then
              k12.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 13') then
              k13.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 14') then
              k14.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 15') then
              k15.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 16') then
              k16.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 17') then
              k17.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 18') then
              k18.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 19') then
              k19.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 20') then
              k20.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 21') then
              k21.PhysID2    := id
            else if SensorName = AnsiLowerCase('Клапан 22') then
              k22.PhysID2    := id
          end;

        end;
      finally
        FreeAndNil(Data);
      end;
    end;
  finally
    ParentList.Free;
  end;
end;

function TfrCupagTank.GetTankName: string;
begin
  Result:=Caption;
end;

procedure TfrCupagTank.SetTankName(const Value: string);
begin
  lCaption.Caption:=Value;
end;

function TfrCupagTank.GetOPCSource: TaCustomMultiOPCSource;
begin
  if (pConcentrat.OPCSource<>nil) and (pConcentrat.OPCSource is TaCustomMultiOPCSource) then
    Result:=TaCustomMultiOPCSource(pConcentrat.OPCSource)
  else
    Result:=nil;
end;

destructor TfrCupagTank.Destroy;
begin
  OPCSource := nil;
  inherited;
end;

procedure TfrCupagTank.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      if (TaCustomOPCDataObject(Components[i]).GraphicOPCSource = nil)
        { and (TaCustomOPCDataObject(Components[i]).PhysID <> '')} then
        TaCustomOPCDataObject(Components[i]).OPCSource := Value;
    end
//    else if (Components[i] is TaOPCLabel) then
//      TaOPCLabel(Components[i]).OPCSource := Value
//    else if (Components[i] is TaOPCGifAnimator) then
//      TaOPCGifAnimator(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCProvider) then
      TaOPCProvider(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;
  end;

  gConcentrat.OPCSource := pConcentrat;
  gShuger.OPCSource := pShuger;
  gWater.OPCSource := PWater;

  lConcentrat.OPCSource := pConcentrat;
  lShuger.OPCSource := pShuger;
  lWater.OPCSource := PWater;
  lMode.OPCSource := pMode;

{
  if (Value <> nil) and (Value is TaOPCSource) then
  begin
    llT1Mode.OPCSource := TaOPCSource(Value);
    if TaOPCSource(OPCSource).Connected then
      llT1Mode.GetLookup;
  end
  else
    llT1Mode.OPCSource := nil;
}
end;

procedure TfrCupagTank.ClearPhysID;
var
  i:integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i].Tag = 1 then
      Continue;
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      TaCustomOPCDataObject(Components[i]).PhysID := '';
      TaCustomOPCDataObject(Components[i]).Value := '0';
    end
    else if (Components[i] is TaOPCLabel) then
    begin
      TaOPCLabel(Components[i]).PhysID := '';
      TaOPCLabel(Components[i]).Caption := '';
    end
//    else if (Components[i] is TaOPCGifAnimator) then
//    begin
//      TaOPCGifAnimator(Components[i]).PhysID := '';
//      TaOPCGifAnimator(Components[i]).Value := '0';
//    end
    else if (Components[i] is TaOPCProvider) then
    begin
      TaOPCProvider(Components[i]).PhysID := '';
      TaOPCProvider(Components[i]).Value := '';
    end
    else if (Components[i] is TaOPCGauge) then
    begin
      TaOPCGauge(Components[i]).PhysID := '';
      TaOPCGauge(Components[i]).Progress := 0;
    end;
  end;

end;

procedure TfrCupagTank.K17Change(Sender: TObject);
begin
  k17Out.Value := IfThen(k17.IsActive,k17In.Value,'0');
end;

procedure TfrCupagTank.k18OutChange(Sender: TObject);
begin
  k20In.Value := IfThen(k17Out.IsActive,k17Out.Value,k18Out.Value);
end;

procedure TfrCupagTank.k20Change(Sender: TObject);
begin
  k20Out.Value := IfThen(k20.IsActive,k20In.Value,'0');
end;

procedure TfrCupagTank.K18Change(Sender: TObject);
begin
  k18Out.Value := IfThen(k18.IsActive,k18In.Value,'0');
  k19Out.Value := IfThen(k19.IsActive,k18In.Value,'0');
end;

procedure TfrCupagTank.k19OutChange(Sender: TObject);
begin
  p1In.Value := IfThen(k19Out.IsActive,k19Out.Value,k8Out.Value);

end;

procedure TfrCupagTank.pd1OutChange(Sender: TObject);
begin
  k21In.Value := IfThen(k21.IsActive,pd1Out.Value,'0');
  k19Out.Value := IfThen(k19.IsActive,k18In.Value,'0');

end;

procedure TfrCupagTank.aOPCImage13Change(Sender: TObject);
begin
  r1.Value := IfThen(k1Out.IsActive,k1Out.Value,
    IfThen(k2Out.IsActive,K2Out.Value,k3Out.Value));
end;

procedure TfrCupagTank.k10Change(Sender: TObject);
begin
  k9Out.Value := IfThen(k9.IsActive,k9In.Value,'0');
  k10Out.Value := IfThen(k10.IsActive,k9In.Value,'0');
end;

procedure TfrCupagTank.K12Change(Sender: TObject);
begin
  k12Out.Value := IfThen(k12.IsActive,k12In.Value,'0');
end;

procedure TfrCupagTank.K11Change(Sender: TObject);
begin
  k11Out.Value := IfThen(k11.IsActive,k11In.Value,'0');
end;

procedure TfrCupagTank.K13Change(Sender: TObject);
begin
  k13Out.Value := IfThen(k13.IsActive,k13In.Value,'0');
end;

procedure TfrCupagTank.K14Change(Sender: TObject);
begin
  k14Out.Value := IfThen(k14.IsActive,k14In.Value,'0');
end;

procedure TfrCupagTank.K6Change(Sender: TObject);
begin
  k6Out.Value := IfThen(k6.IsActive,k6In.Value,'0');
end;

procedure TfrCupagTank.K7Change(Sender: TObject);
begin
  k7Out.Value := IfThen(k7.IsActive,k7In.Value,'0');
end;

procedure TfrCupagTank.K8Change(Sender: TObject);
begin
  k8Out.Value := IfThen(k8.IsActive,k8In.Value,'0');

end;

procedure TfrCupagTank.K1Change(Sender: TObject);
begin
  k1Out.Value := IfThen(k1.IsActive,k1In.Value,'0');
end;

procedure TfrCupagTank.K3Change(Sender: TObject);
begin
  k3Out.Value := IfThen(k3.IsActive,k3In.Value,'0');

end;

procedure TfrCupagTank.K3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TaOPCImage then
  begin
    if AllowClick then
    begin
      if Button = mbLeft then
        (Sender as TaOPCImage).Value := '11'
      else
        (Sender as TaOPCImage).Value := '00';
    end;
  end;
end;

procedure TfrCupagTank.K2Change(Sender: TObject);
begin
  k2Out.Value := IfThen(k2.IsActive,k2In.Value,'0');
end;

procedure TfrCupagTank.K4Change(Sender: TObject);
begin
  k4Out.Value := IfThen(k4.IsActive,k4In.Value,'0');
end;

procedure TfrCupagTank.K5Change(Sender: TObject);
begin
  k5Out.Value := IfThen(k5.IsActive,k5In.Value,'0');
end;

procedure TfrCupagTank.pd2Change(Sender: TObject);
begin
  pd2Out.Value := IfThen(pd2.IsActive,'1','0');
end;

procedure TfrCupagTank.pd1Change(Sender: TObject);
begin
  pd1Out.Value := IfThen(pd1.IsActive,'1','0');
end;

procedure TfrCupagTank.K16Change(Sender: TObject);
begin
  k16Out.Value := IfThen(k16.IsActive,k16In.Value,'0');
end;

procedure TfrCupagTank.k21Change(Sender: TObject);
begin
  k21Out.Value := IfThen(k21.IsActive,k21In.Value,'0');
end;

procedure TfrCupagTank.K15Change(Sender: TObject);
begin
  k15Out.Value := IfThen(k15.IsActive,k15In.Value,'0');
end;

procedure TfrCupagTank.k15OutChange(Sender: TObject);
begin
  r2.Value := IfThen(k15Out.IsActive,k15Out.Value,k16Out.Value);
end;

procedure TfrCupagTank.K22Change(Sender: TObject);
begin
  k22Out.Value := IfThen(k22.IsActive,k22In.Value,'0');
end;

procedure TfrCupagTank.PWaterChange(Sender: TObject);
begin
  k3In.Value := IfThen(StrToFloatDef(PWater.Value,0)>0,'1','0');
end;

procedure TfrCupagTank.pConcentratChange(Sender: TObject);
begin
  k1In.Value := IfThen(StrToFloatDef(pConcentrat.Value,0)>0,'2','0');
end;

procedure TfrCupagTank.pShugerChange(Sender: TObject);
begin
  k2In.Value := IfThen(StrToFloatDef(pShuger.Value,0)>0,'3','0');
end;

procedure TfrCupagTank.lConcentratMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  OPCSource:TaCustomOPCSource;
begin
  if Sender is TaOPCLabel then
  begin
    OPCSource := TaOPCLabel(Sender).OPCSource;
    //if ssCtrl in Shift then
    if OPCSource is TaOPCProvider then
    begin
      if Button = mbLeft then
        (OPCSource as TaOPCProvider).Value := '1000'
      else
        (OPCSource as TaOPCProvider).Value := '0';
    end;
  end;
  if Button = mbLeft then

end;

procedure TfrCupagTank.k9OutChange(Sender: TObject);
begin
  s1.Value := IfThen(k6Out.IsActive,k6Out.Value,k9Out.Value);
end;

procedure TfrCupagTank.k10OutChange(Sender: TObject);
begin
  s2.Value := IfThen(k7Out.IsActive,k7Out.Value,k10Out.Value);
end;

procedure TfrCupagTank.p1OutChange(Sender: TObject);
var
  m:integer;
begin
  m:=StrToIntDef(pMode.Value,0);
  case m of
    0,1,2,3,4,8 : Back.Value := '0';
    5,6,7       : Back.Value := p1Out.Value;
  end;
end;

procedure TfrCupagTank.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrCupagTank.Panel1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

initialization
  RegisterClasses([TfrCupagTank]);

end.
