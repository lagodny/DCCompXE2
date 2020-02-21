unit uBoilerFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uOPCFrame, aOPCImageList, aOPCLabel, Vcl.ExtCtrls,
  aCustomOPCSource, aOPCSource,
  aOPCShape, aOPCImage, aOPCDataObject, aOPCGauge, aOPCImage2In;

type
  TFusionPlant = (none, npl, gpp);

  TBoilerFrame = class(TaOPCFrame)
    Water: TaOPCGauge;
    FireCamera: TaOPCImage;
    Boiler: TaOPCImage;
    lConduction: TaOPCLabel;
    sWaterLevelBorder: TaOPCShape;
    sCondautionBorder: TaOPCShape;
    lConductionUnit: TaOPCLabel;
    lWaterLevel: TaOPCLabel;
    lWaterLevelUnit: TaOPCLabel;
    sPressureborder: TaOPCShape;
    lPressure: TaOPCLabel;
    lPressureUnit: TaOPCLabel;
    gPower: TaOPCGauge;
    K_Title: TaOPCBlinkLabel;
    Fire: TaOPCImage2In;
    ImagesBoiler: TaOPCImageList;
    Alarm: TaOPCImage;
    p_par: TaOPCImage;
    lPower: TaOPCLabel;
    lPowerUnit: TaOPCLabel;
    sPowerBorder: TaOPCShape;
    procedure lPressureDrawLabel(Sender: TObject; aCanvas: TCanvas; var aText: string; var aHandled: Boolean);
    procedure AddToChart(Sender: TObject);
    procedure WaterChange(Sender: TObject);
  private
    FBoilerNo: Integer;
    FOnAddToChart: TNotifyEvent;
    FPlant: TFusionPlant;
    procedure SetBoilerNo(const Value: Integer);
    function GetAllowAnimate: Boolean;
    procedure SetAllowAnimate(const Value: Boolean);
    procedure SetPlant(const Value: TFusionPlant);

    procedure UpdateIDs;
  protected
    procedure SetID(const Value: TPhysID); override;
    procedure ClearIDs; override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource); override;
    function GetOPCSource: TaCustomMultiOPCSource; override;

  public

  published
    property Plant: TFusionPlant read FPlant write SetPlant;
    property BoilerNo: Integer read FBoilerNo write SetBoilerNo;
    property AllowAnimate: Boolean read GetAllowAnimate write SetAllowAnimate;

    property OnAddToChart: TNotifyEvent read FOnAddToChart write FOnAddToChart;
  end;

var
  BoilerFrame: TBoilerFrame;

implementation

uses
  JclSysInfo,
  aOPCConsts;

{$R *.dfm}

{ TaOPCFrame1 }

procedure TBoilerFrame.AddToChart(Sender: TObject);
begin
  if Sender is TaCustomOPCDataObject then
  begin
    // режим симуляции : включаем/выключаем
    if AllowClick then
    begin
      if TaCustomOPCDataObject(Sender).Value = '1' then
        TaCustomOPCDataObject(Sender).Value := '0'
      else if TaCustomOPCDataObject(Sender).Value = '0' then
        TaCustomOPCDataObject(Sender).Value := '1';
    end
    else
    begin
//      Main.AddSerie(TaCustomOPCDataObject(Sender), True, not JclSysInfo.GetKeyState(VK_CONTROL))
      if Assigned(OnAddToChart) then
        OnAddToChart(Sender);
    end;

  end;
end;

procedure TBoilerFrame.ClearIDs;
begin
  lPressure.PhysID := '';
  lWaterLevel.PhysID := '';
  lConduction.PhysID := '';
  gPower.PhysID := '';

  Fire.PhysID := '';
  Alarm.PhysID := '';


  Water.PhysID := lWaterLevel.PhysID;
end;

function TBoilerFrame.GetAllowAnimate: Boolean;
begin
  Result := Fire.Animate;
end;

function TBoilerFrame.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(lWaterLevel.OPCSource);
end;

procedure TBoilerFrame.lPressureDrawLabel(Sender: TObject; aCanvas: TCanvas; var aText: string; var aHandled: Boolean);
begin
  inherited;

  aHandled := False;
  if not (Sender is TaOPCLabel) then
    Exit;

  if TaOPCLabel(Sender).ErrorCode = 0 then
    Exit;

  aCanvas.Brush.Color := сOPCErrorBrushColor;
  aCanvas.Font.Style := aCanvas.Font.Style + [fsStrikeOut];
  aCanvas.Font.Color := cOPCErrorFontColor;

end;

procedure TBoilerFrame.SetAllowAnimate(const Value: Boolean);
begin
  Fire.Animate := Value;
  Alarm.Animate := Value;
end;

procedure TBoilerFrame.SetBoilerNo(const Value: Integer);
begin
  if FBoilerNo = Value then
    Exit;

  FBoilerNo := Value;
  UpdateIDs;
{
  case Plant of
    npl: // Северный - Котлярово (Шевченково)
    begin
      case Value of
        1:
        begin
          lPressure.PhysID := '16';
          lWaterLevel.PhysID := '17';
          lConduction.PhysID := '18';
          gPower.PhysID := '19';

          Alarm.PhysID := '22';
          Fire.PhysID := '101';
          Fire.PhysID2 := '102';
          p_par.PhysID := '102';

          K_Title.Caption := 'K1';
        end;

        2:
        begin
          lPressure.PhysID := '25';
          lWaterLevel.PhysID := '26';
          lConduction.PhysID := '27';
          gPower.PhysID := '28';

          Alarm.PhysID := '31';
          Fire.PhysID := '107';
          Fire.PhysID2 := '108';
          p_par.PhysID := '108';

          K_Title.Caption := 'K2';
        end;

        3:
        begin
          lPressure.PhysID := '34';
          lWaterLevel.PhysID := '35';
          lConduction.PhysID := '36';
          gPower.PhysID := '37';

          Alarm.PhysID := '40';
          Fire.PhysID := '113';
          Fire.PhysID2 := '114';
          p_par.PhysID := '114';

          K_Title.Caption := 'K3';
        end;

        4:
        begin
          lPressure.PhysID := '';
          lWaterLevel.PhysID := '44';
          lConduction.PhysID := '';
          gPower.PhysID := '';

          Alarm.PhysID := '45';
          Fire.PhysID := '46';
          Fire.PhysID2 := '46';
          p_par.PhysID := '46';

          K_Title.Caption := 'K4';
        end;
      end;
    end;

    gpp: // Южный - Голая Пристань
    begin
      case Value of
        1:
        begin
          lPressure.PhysID := '16';
          lWaterLevel.PhysID := '17';
          lConduction.PhysID := '18';
          gPower.PhysID := '19';

          Alarm.PhysID := '22';
          Fire.PhysID := '101';
          Fire.PhysID2 := '102';
          p_par.PhysID := '102';

          K_Title.Caption := 'K1';
        end;

        2:
        begin
          lPressure.PhysID := '25';
          lWaterLevel.PhysID := '26';
          lConduction.PhysID := '27';
          gPower.PhysID := '28';

          Alarm.PhysID := '31';
          Fire.PhysID := '107';
          Fire.PhysID2 := '108';
          p_par.PhysID := '108';

          K_Title.Caption := 'K2';
        end;

        3:
        begin
          lPressure.PhysID := '34';
          lWaterLevel.PhysID := '35';
          lConduction.PhysID := '36';
          gPower.PhysID := '37';

          Alarm.PhysID := '40';
          Fire.PhysID := '113';
          Fire.PhysID2 := '114';
          p_par.PhysID := '114';

          K_Title.Caption := 'K3';
        end;

        4:
        begin
          lPressure.PhysID := '';
          lWaterLevel.PhysID := '44';
          lConduction.PhysID := '';
          gPower.PhysID := '';

          Alarm.PhysID := '45';
          Fire.PhysID := '46';
          Fire.PhysID2 := '46';
          p_par.PhysID := '46';

          K_Title.Caption := 'K4';
        end;
      end;
    end;
  end;

  Water.PhysID := lWaterLevel.PhysID;

  // скроем незадействованные измерения
  lConduction.Visible := lConduction.PhysID <> '';
  lConductionUnit.Visible := lConduction.Visible;
  sCondautionBorder.Visible := lConduction.Visible;

  lPressure.Visible := lPressure.PhysID <> '';
  lPressureUnit.Visible := lPressure.Visible;
  sPressureborder.Visible := lPressure.Visible;

  gPower.Visible := gPower.PhysID <> '';

  lPressure.Params.Text := Format('serie=К%d - Давление ,bar', [BoilerNo]);
  lWaterLevel.Params.Text := Format('serie=К%d - Уровень воды,%%', [BoilerNo]);
  lConduction.Params.Text := Format('serie=К%d - Проводимость,mS/cm', [BoilerNo]);
  gPower.Params.Text := Format('serie=К%d - Нагрузка,%%', [BoilerNo]);
  lPower.Params.Text := Format('serie=К%d - Нагрузка,%%', [BoilerNo]);

  Alarm.Params.Text := Format('serie=К%d - Авария', [BoilerNo]);

  Fire.Params.Clear;
  Fire.Params.Add(Format('serie=К%d - Запуск горелки', [BoilerNo]));
  Fire.Params.Add(Format('serie2=К%d - Горелка в работе', [BoilerNo]));

  lPower.Visible := gPower.Visible;
  lPowerUnit.Visible := gPower.Visible;
  sPowerBorder.Visible := gPower.Visible;
  lPower.PhysID := gPower.PhysID;
}
end;

procedure TBoilerFrame.SetID(const Value: TPhysID);
begin
  inherited;
end;

procedure TBoilerFrame.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      if TaCustomOPCDataObject(Components[i]).PhysID <> '' then
        TaCustomOPCDataObject(Components[i]).OPCSource := Value;

    if Components[i] is TaOPCFrame then
      TaOPCFrame(Components[i]).OPCSource := Value;
  end;
end;

procedure TBoilerFrame.SetPlant(const Value: TFusionPlant);
begin
  if FPlant = Value then
    Exit;

  FPlant := Value;
  UpdateIDs;
end;

procedure TBoilerFrame.UpdateIDs;
begin
  case Plant of
    npl: // Северный - Котлярово (Шевченково)
    begin
      case BoilerNo of
        1:
        begin
          lPressure.PhysID := '16';
          lWaterLevel.PhysID := '17';
          lConduction.PhysID := '18';
          gPower.PhysID := '19';

          Alarm.PhysID := '22';
          Fire.PhysID := '101';
          Fire.PhysID2 := '102';
          p_par.PhysID := '102';

          K_Title.Caption := 'K1';
        end;

        2:
        begin
          lPressure.PhysID := '25';
          lWaterLevel.PhysID := '26';
          lConduction.PhysID := '27';
          gPower.PhysID := '28';

          Alarm.PhysID := '31';
          Fire.PhysID := '107';
          Fire.PhysID2 := '108';
          p_par.PhysID := '108';

          K_Title.Caption := 'K2';
        end;

        3:
        begin
          lPressure.PhysID := '34';
          lWaterLevel.PhysID := '35';
          lConduction.PhysID := '36';
          gPower.PhysID := '37';

          Alarm.PhysID := '40';
          Fire.PhysID := '113';
          Fire.PhysID2 := '114';
          p_par.PhysID := '114';

          K_Title.Caption := 'K3';
        end;

        4:
        begin
          lPressure.PhysID := '';
          lWaterLevel.PhysID := '44';
          lConduction.PhysID := '';
          gPower.PhysID := '';

          Alarm.PhysID := '45';
          Fire.PhysID := '46';
          Fire.PhysID2 := '46';
          p_par.PhysID := '46';

          K_Title.Caption := 'K4';
        end;
      end;
    end;

    gpp: // Южный - Голая Пристань
    begin
      case BoilerNo of
        1:
        begin
//          lPressure.PhysID := '1766';
//          lWaterLevel.PhysID := '1767';
//          lConduction.PhysID := '1768';
          lPressure.PhysID := '2149';
          lWaterLevel.PhysID := '2150';
          lConduction.PhysID := '2151';
          gPower.PhysID := '2152';

          Alarm.PhysID := '2155';
          Fire.PhysID := '2172';
          Fire.PhysID2 := '2172';
          p_par.PhysID := '2173';

          K_Title.Caption := 'K1';
        end;

        2:
        begin
          lPressure.PhysID := '2074';
          lWaterLevel.PhysID := '2075';
          lConduction.PhysID := '2076';
          gPower.PhysID := '2077';

          Alarm.PhysID := '2080';
          Fire.PhysID := '2087';
          Fire.PhysID2 := '2088';
          p_par.PhysID := '2088';

          K_Title.Caption := 'K2';
        end;

        3:
        begin
          lPressure.PhysID := '2102';
          lWaterLevel.PhysID := '2103';
          lConduction.PhysID := '2104';
          gPower.PhysID := '2105';

          Alarm.PhysID := '2108';
          Fire.PhysID := '2125';
          Fire.PhysID2 := '2126';
          p_par.PhysID := '2126';

          K_Title.Caption := 'K3';
        end;

        4:
        begin
          lPressure.PhysID := '2448';
          lWaterLevel.PhysID := '2449';
          lConduction.PhysID := '3268';
          gPower.PhysID := '3269';

          Alarm.PhysID := '';
          Fire.PhysID := '2436'; //'2439';
          Fire.PhysID2 := '2436';
          p_par.PhysID := '';

          K_Title.Caption := 'K4';
        end;
      end;
    end;
  end;

  Water.PhysID := lWaterLevel.PhysID;

  // скроем незадействованные измерения
  lConduction.Visible := lConduction.PhysID <> '';
  lConductionUnit.Visible := lConduction.Visible;
  sCondautionBorder.Visible := lConduction.Visible;

  lPressure.Visible := lPressure.PhysID <> '';
  lPressureUnit.Visible := lPressure.Visible;
  sPressureborder.Visible := lPressure.Visible;

  gPower.Visible := gPower.PhysID <> '';

  lWaterLevel.Visible := lWaterLevel.PhysID <> '';
  lWaterLevelUnit.Visible := lWaterLevel.Visible;
  sWaterLevelBorder.Visible := lWaterLevel.Visible;


  lPressure.Params.Text := Format('serie=К%d - Давление ,bar', [BoilerNo]);
  lWaterLevel.Params.Text := Format('serie=К%d - Уровень воды,%%', [BoilerNo]);
  lConduction.Params.Text := Format('serie=К%d - Проводимость,mS/cm', [BoilerNo]);
  gPower.Params.Text := Format('serie=К%d - Нагрузка,%%', [BoilerNo]);
  lPower.Params.Text := Format('serie=К%d - Нагрузка,%%', [BoilerNo]);

  Alarm.Params.Text := Format('serie=К%d - Авария', [BoilerNo]);

  Fire.Params.Clear;
  Fire.Params.Add(Format('serie=К%d - Запуск горелки', [BoilerNo]));
  Fire.Params.Add(Format('serie2=К%d - Горелка в работе', [BoilerNo]));

  lPower.Visible := gPower.Visible;
  lPowerUnit.Visible := gPower.Visible;
  sPowerBorder.Visible := gPower.Visible;
  lPower.PhysID := gPower.PhysID;

end;

procedure TBoilerFrame.WaterChange(Sender: TObject);
begin
  case Water.Ranges.Check(Water.Value) of
    rcrOk, rcrConvertError:
    begin
      Water.ForeColor := $00FFDD97;
      lWaterLevel.Color := $00FDFBB0;  // ее родной цвет
    end;

    rcrWarnLowLevel, rcrWarnHighLevel:
    begin
      Water.ForeColor := $00BBFFFF;
      lWaterLevel.Color := $00BBFFFF;
    end;

    rcrAlarmLowLevel, rcrAlarmHighLevel:
    begin
      Water.ForeColor := $007D7DFF;
      lWaterLevel.Color := $007D7DFF;
    end;
  end;
  lWaterLevelUnit.Color := lWaterLevel.Color;
end;

end.
