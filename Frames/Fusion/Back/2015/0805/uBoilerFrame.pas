unit uBoilerFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uOPCFrame, aOPCImageList, aOPCLabel, Vcl.ExtCtrls,
  aCustomOPCSource,
  aOPCShape, aOPCImage, aOPCDataObject, aOPCGauge;

type
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
    Fire: TaOPCImage;
    ImagesBoiler: TaOPCImageList;
    Alarm: TaOPCImage;
    p_par: TaOPCImage;
    procedure lPressureDrawLabel(Sender: TObject; aCanvas: TCanvas; var aText: string; var aHandled: Boolean);
    procedure AddToChart(Sender: TObject);
  private
    FBoilerNo: Integer;
    FOnAddToChart: TNotifyEvent;
    procedure SetBoilerNo(const Value: Integer);
    function GetAllowAnimate: Boolean;
    procedure SetAllowAnimate(const Value: Boolean);
    { Private declarations }
  protected
    procedure SetID(const Value: TPhysID); override;
    procedure ClearIDs; override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource); override;
    function GetOPCSource: TaCustomMultiOPCSource; override;

  public

  published
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
  FBoilerNo := Value;

  case Value of
    1:
    begin
      lPressure.PhysID := '16';
      lWaterLevel.PhysID := '17';
      lConduction.PhysID := '18';
      gPower.PhysID := '19';

      Alarm.PhysID := '22';
      Fire.PhysID := '23';

      K_Title.Caption := 'K1';
    end;

    2:
    begin
      lPressure.PhysID := '25';
      lWaterLevel.PhysID := '26';
      lConduction.PhysID := '27';
      gPower.PhysID := '28';

      Alarm.PhysID := '31';
      Fire.PhysID := '32';

      K_Title.Caption := 'K2';
    end;

    3:
    begin
      lPressure.PhysID := '34';
      lWaterLevel.PhysID := '35';
      lConduction.PhysID := '36';
      gPower.PhysID := '37';

      Alarm.PhysID := '40';
      Fire.PhysID := '41';

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

      K_Title.Caption := 'K4';
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

  lPressure.Params.Text := Format('serie=Давление К%d', [BoilerNo]);
  lWaterLevel.Params.Text := Format('serie=Уровень воды К%d', [BoilerNo]);
  lConduction.Params.Text := Format('serie=Проводимость К%d', [BoilerNo]);

  Alarm.Params.Text := Format('serie=Авария К%d', [BoilerNo]);
  Fire.Params.Text := Format('serie=К%d горелка работает', [BoilerNo]);

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

end.
