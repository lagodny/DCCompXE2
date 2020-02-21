{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2005 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uT1Frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aCustomOPCSource, aOPCSource, aOPCTCPSource, ExtCtrls,
  aOPCSwitch, aOpcPump, aOPCLabel,
  StdCtrls, aOPCValve, aOPCDataObject, aOPCPipe, Gauges, aOPCGauge,
  aOPCProvider, aOPCLookupList, aOPCGifAnimator, JvxAnimate, JvGIFCtrl,
  uOPCFrame;

type
  TfrT1 = class(TaOPCFrame)
    Panel1: TPanel;
    T2: TaOPCGauge;
    T1: TaOPCGauge;
    aOPCPipe1: TaOPCPipe;
    k3: TaOPCValve;
    aOPCPipe3: TaOPCPipe;
    k5: TaOPCValve;
    aOPCPipe4: TaOPCPipe;
    aOPCPipe5: TaOPCPipe;
    aOPCPipe6: TaOPCPipe;
    k4: TaOPCValve;
    aOPCPipe7: TaOPCPipe;
    k2: TaOPCValve;
    aOPCPipe8: TaOPCPipe;
    aOPCPipe9: TaOPCPipe;
    aOPCPipe11: TaOPCPipe;
    aOPCPipe12: TaOPCPipe;
    aOPCPipe13: TaOPCPipe;
    k6: TaOPCValve;
    k7: TaOPCValve;
    aOPCPipe14: TaOPCPipe;
    aOPCPipe15: TaOPCPipe;
    aOPCPipe16: TaOPCPipe;
    aOPCPipe17: TaOPCPipe;
    k11: TaOPCValve;
    aOPCPipe18: TaOPCPipe;
    aOPCPipe19: TaOPCPipe;
    aOPCPipe20: TaOPCPipe;
    aOPCPipe21: TaOPCPipe;
    k9: TaOPCValve;
    k10: TaOPCValve;
    k14: TaOPCValve;
    k12: TaOPCValve;
    k13: TaOPCValve;
    aOPCPipe22: TaOPCPipe;
    aOPCPipe23: TaOPCPipe;
    aOPCPipe24: TaOPCPipe;
    aOPCPipe25: TaOPCPipe;
    aOPCPipe26: TaOPCPipe;
    aOPCPipe27: TaOPCPipe;
    k1: TaOPCValve;
    aOPCPipe28: TaOPCPipe;
    aOPCPipe29: TaOPCPipe;
    aOPCPipe30: TaOPCPipe;
    k8: TaOPCValve;
    aOPCPipe31: TaOPCPipe;
    aOPCPipe32: TaOPCPipe;
    aOPCPipe33: TaOPCPipe;
    aOPCPipe34: TaOPCPipe;
    aOPCPipe35: TaOPCPipe;
    aOPCPipe36: TaOPCPipe;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    aOPCPipe38: TaOPCPipe;
    aOPCPipe10: TaOPCPipe;
    aOPCPipe2: TaOPCPipe;
    aOPCGauge1: TaOPCGauge;
    aOPCLabel1: TaOPCLabel;
    aOPCGauge2: TaOPCGauge;
    aOPCLabel2: TaOPCLabel;
    aOPCPipe39: TaOPCPipe;
    aOPCPipe40: TaOPCPipe;
    aOPCGauge3: TaOPCGauge;
    aOPCLabel3: TaOPCLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pd1: TaOPCPipe;
    pd2: TaOPCPipe;
    aOPCPipe48: TaOPCPipe;
    aOPCPipe49: TaOPCPipe;
    aOPCPipe51: TaOPCPipe;
    aOPCPipe52: TaOPCPipe;
    p1: TaOPCPump;
    aOPCPipe44: TaOPCPipe;
    aOPCPipe59: TaOPCPipe;
    aOPCPipe61: TaOPCPipe;
    Label10: TLabel;
    OPCGifAnimator1: TaOPCGifAnimator;
    aOPCPipe62: TaOPCPipe;
    Shape1: TShape;
    aOPCPipe63: TaOPCPipe;
    Shape2: TShape;
    OPCGifAnimator2: TaOPCGifAnimator;
    Label11: TLabel;
    Label12: TLabel;
    aOPCPipe64: TaOPCPipe;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    lMode: TaOPCLabel;
    llT1Mode: TaOPCLookupList;
    k15: TaOPCValve;
    aOPCPipe65: TaOPCPipe;
    aOPCPipe66: TaOPCPipe;
    k16: TaOPCValve;
    k21: TaOPCValve;
    aOPCPipe50: TaOPCPipe;
    k22: TaOPCValve;
    aOPCPipe69: TaOPCPipe;
    aOPCPipe70: TaOPCPipe;
    aOPCPipe71: TaOPCPipe;
    aOPCPipe72: TaOPCPipe;
    aOPCPipe73: TaOPCPipe;
    aOPCPipe74: TaOPCPipe;
    aOPCPipe75: TaOPCPipe;
    aOPCPipe76: TaOPCPipe;
    aOPCPipe77: TaOPCPipe;
    k19: TaOPCValve;
    k18: TaOPCValve;
    aOPCPipe78: TaOPCPipe;
    k20: TaOPCValve;
    aOPCPipe79: TaOPCPipe;
    aOPCPipe80: TaOPCPipe;
    k17: TaOPCValve;
    aOPCPipe41: TaOPCPipe;
    aOPCPipe42: TaOPCPipe;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure k3Change(Sender: TObject);
    procedure k15Change(Sender: TObject);
    procedure lModeDblClick(Sender: TObject);
    procedure k8Change(Sender: TObject);
  private
    FTankID:      integer;
    FKeyEnterID:  TPhysID;
    FWorkModeID:  TPhysID;
    procedure ClearPhysID;
    procedure SetTankID(const Value: integer);
    function GetTankName: string;
    procedure SetTankName(const Value: string);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    destructor Destroy;override;
  published
    property OPCSource;//:TaOPCSource read GetOPCSource write SetOPCSource;
    property TankName : string read GetTankName write SetTankName;
    property TankID : integer read FTankID write SetTankID stored false;
  end;

function GetBufStart(Buffer: PChar; var Level: Integer): PChar;

implementation

uses Math;

{$R *.dfm}

function GetBufStart(Buffer: PChar; var Level: Integer): PChar;
begin
  Level := 0;
  while Buffer^ in [' ', #9] do
  begin
    Inc(Buffer);
    Inc(Level);
  end;
  Result := Buffer;
end;


procedure TfrT1.FrameMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrT1.k3Change(Sender: TObject);
begin
  aOPCPipe9.Active:=k1.Active or k2.Active or k3.Active;
end;

procedure TfrT1.k15Change(Sender: TObject);
begin
  if k15.IsActive or k16.IsActive then
    aOpcPipe48.Value:='1'
  else
    aOpcPipe48.Value:='0';

end;

procedure TfrT1.lModeDblClick(Sender: TObject);
var
  v:string;
  tmpOPCSource:TaOPCSource;
begin
  if OPCSource = nil then
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

procedure TfrT1.k8Change(Sender: TObject);
begin
  if k8.IsActive or k19.IsActive then
    aOPCPipe51.Value:='1'
  else
    aOPCPipe51.Value:='0';

end;

procedure TfrT1.SetTankID(const Value: integer);
var
  s:TMemoryStream;
  Params:TStringList;
  Data:TStringList;

  List: TStringList;
  ALevel, i: Integer;
  SensorName: string;
  EquipmentName : string;
  MaxVal : integer;
begin
  if (FTankID<>Value) then
  begin
    try
      if OPCSource=nil then
      begin
        TankName:='Не указан источник OPCSource';
        exit;
      end;
      if not (OPCSource is TaOPCSource) then
      begin
        TankName:='Указан неверный источник OPCSource';
        exit;
      end;

      ClearPhysID;
      FTankID := Value;
      s := TMemoryStream.Create;
      Params := TStringList.Create;
      Params.Values['TankID']:=IntToStr(FTankID);
      TaOPCSource(OPCSource).GetSensorsTree(s,Params);

      Data := TStringList.Create;
      List := TStringList.Create;
      List.LoadFromStream(s);
      for i := 0 to List.Count - 1 do
      begin
        Data.Delimiter     := ';';
        Data.DelimitedText := GetBufStart(PChar(List[i]), ALevel);
        if ALevel=1 then
          TankName := Data.DelimitedText
        else if ALevel=2 then
          EquipmentName := AnsiLowerCase(Data.DelimitedText)
        else if ALevel=3 then
        begin
          if Data.Count>1 then
          begin
            SensorName := AnsiLowerCase(Data.Values['Name']);
            MaxVal := StrToInt(Data.Values['Max']);

            if EquipmentName = 'вода' then
            begin
              if SensorName = 'поток' then
              begin
                aOPCGauge2.PhysID   := Data.Values['ID'];
                aOPCGauge2.MaxValue := MaxVal;
                aOPCLabel2.PhysID   := Data.Values['ID'];
              end;
            end
            else if EquipmentName = 'сахар' then
            begin
              if SensorName = 'поток' then
              begin
                aOPCGauge3.PhysID   := Data.Values['ID'];
                aOPCGauge3.MaxValue := MaxVal;
                aOPCLabel3.PhysID   := Data.Values['ID'];
              end;
            end
            else if EquipmentName = 'концентрат' then
            begin
              if SensorName = 'поток' then
              begin
                aOPCGauge1.PhysID   := Data.Values['ID'];
                aOPCGauge1.MaxValue := MaxVal;
                aOPCLabel1.PhysID   := Data.Values['ID'];
              end;
            end
            else if EquipmentName = 'уровень' then
            begin
              if SensorName = 'уровень1' then
              begin
                T1.PhysID           := Data.Values['ID'];
                T1.MaxValue         := MaxVal;
                aOPCLabel4.PhysID   := Data.Values['ID'];
              end;
              if SensorName = 'уровень2' then
              begin
                T2.PhysID           := Data.Values['ID'];
                T2.MaxValue         := MaxVal;
                aOPCLabel5.PhysID   := Data.Values['ID'];
              end;
            end
            else if EquipmentName = 'контролер' then
            begin
              if SensorName = 'режим работы' then
                lMode.PhysID           := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Режим работы (з)') then
                FWorkModeID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Реле М1') then
                OPCGifAnimator1.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Реле М2') then
                OPCGifAnimator2.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 1') then
                k1.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 2') then
                k2.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 3') then
                k3.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 4') then
                k4.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 5') then
                k5.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 6') then
                k6.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 7') then
                k7.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 8') then
                k8.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 9') then
                k9.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 10') then
                k10.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 11') then
                k11.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 12') then
                k12.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 13') then
                k13.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 14') then
                k14.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 15') then
                k15.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 16') then
                k16.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 17') then
                k17.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 18') then
                k18.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 19') then
                k19.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 20') then
                k20.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 21') then
                k21.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Клапан 22') then
                k22.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Кнопка Ввод') then
                FKeyEnterID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Предельный датчик 1') then
                pd1.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Предельный датчик 2') then
                pd2.PhysID := Data.Values['ID']
              else if SensorName = AnsiLowerCase('Реле PUMP1') then
                p1.PhysID := Data.Values['ID']
            end;
          end;
        end;
      end;
    finally
      FreeAndNil(Data);
      FreeAndNil(Params);
      FreeAndNil(s);
    end;
  end;
end;

function TfrT1.GetTankName: string;
begin
  Result:=Caption;
end;

procedure TfrT1.SetTankName(const Value: string);
begin
  Caption:=Value;
end;

function TfrT1.GetOPCSource: TaCustomMultiOPCSource;
begin
  if (lMode.OPCSource<>nil) and (lMode.OPCSource is TaCustomMultiOPCSource) then
    Result:=TaCustomMultiOPCSource(lMode.OPCSource)
  else
    Result:=nil;
end;

destructor TfrT1.Destroy;
begin
  OPCSource := nil;
  inherited;
end;

procedure TfrT1.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaOPCValve) then
      TaOPCValve(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCLabel) then
      TaOPCLabel(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCGifAnimator) then
      TaOPCGifAnimator(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCProvider) then
      TaOPCProvider(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;
  end;

  if (Value <> nil) and (Value is TaOPCSource) then
  begin
    llT1Mode.OPCSource := TaOPCSource(Value);
    if TaOPCSource(OPCSource).Connected then
      llT1Mode.LoadLookup;
  end
  else
    llT1Mode.OPCSource := nil;

  p1.OPCSource := Value;
  pd1.OPCSource:=Value;
  pd2.OPCSource:=Value;
end;

procedure TfrT1.ClearPhysID;
var
  i:integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
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
    else if (Components[i] is TaOPCGifAnimator) then
    begin
      TaOPCGifAnimator(Components[i]).PhysID := '';
      TaOPCGifAnimator(Components[i]).Value := '0';
    end
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

end.
