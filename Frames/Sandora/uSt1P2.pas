unit uSt1P2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, aOPCDataObject, aOPCImage, aOPCImageList,
  ExtCtrls, aOPCGauge, aOPCLabel, StdCtrls,
  aCustomOPCSource, aOPCSource, aOPCProvider, aOPCLookupList, aOPCTCPSource,
  GIFImage;

type
  TSt1P2 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    Out2: TaOPCImage;
    aOPCImage111: TaOPCImage;
    aOPCImage49: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage13: TaOPCImage;
    v1100In1: TaOPCImage;
    v1300In: TaOPCImage;
    aOPCImage16: TaOPCImage;
    aOPCImage17: TaOPCImage;
    v91Out: TaOPCImage;
    V91In: TaOPCImage;
    aOPCImage23: TaOPCImage;
    In1: TaOPCImage;
    V92Out: TaOPCImage;
    Par: TaOPCImage;
    v1100Out: TaOPCImage;
    aOPCImage28: TaOPCImage;
    v94Out1: TaOPCImage;
    V91In1: TaOPCImage;
    V1100In: TaOPCImage;
    aOPCImage33: TaOPCImage;
    v94Out: TaOPCImage;
    v1300Out: TaOPCImage;
    v94In: TaOPCImage;
    aOPCImage38: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage30: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    V94: TaOPCImage;
    v91: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage36: TaOPCImage;
    V90C: TaOPCImage;
    v92: TaOPCImage;
    OPCImageList: TaOPCImageList;
    aOPCImage42: TaOPCImage;
    V1300: TaOPCImage;
    v1100: TaOPCImage;
    T1: TaOPCImage;
    ContFillT1: TaOPCGauge;
    TankFillT1: TaOPCGauge;
    T2: TaOPCImage;
    ContFillT2: TaOPCGauge;
    TankFillT2: TaOPCGauge;
    Label1: TLabel;
    aOPCLabel14: TaOPCLabel;
    TT711: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    aOPCLabel19: TaOPCLabel;
    aOPCLabel20: TaOPCLabel;
    aOPCLabel6: TaOPCLabel;
    aOPCLabel7: TaOPCLabel;
    aOPCLabel8: TaOPCLabel;
    aOPCLabel9: TaOPCLabel;
    aOPCLabel10: TaOPCLabel;
    aOPCLabel21: TaOPCLabel;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel12: TaOPCLabel;
    Proizv: TaOPCProvider;
    T1Valve: TaOPCProvider;
    T2Valve: TaOPCProvider;
    Drums1: TaOPCProvider;
    Drums2: TaOPCProvider;
    llProduct: TaOPCLookupList;
    llOperator: TaOPCLookupList;
    aOPCImage24: TaOPCImage;
    GroupBox1: TGroupBox;
    Bags1: TaOPCLabel;
    Conts1: TaOPCLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Bags2: TaOPCLabel;
    aOPCLabel16: TaOPCLabel;
    Conts2: TaOPCLabel;
    BackPanel: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    aOPCLabel15: TaOPCLabel;
    aOPCLabel13: TaOPCLabel;
    llPriPackages: TaOPCLookupList;
    aOPCLabel17: TaOPCLabel;
    procedure aOPCLabel13DblClick(Sender: TObject);
    procedure aOPCImage21MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure V94Change(Sender: TObject);
    procedure v91Change(Sender: TObject);
    procedure V1300Change(Sender: TObject);
    procedure v1100Change(Sender: TObject);
    procedure ProizvChange(Sender: TObject);
  private
    FStep: integer;
    procedure SetStep(const Value: integer);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Step:integer read FStep write SetStep stored false;
    property Pin1:TaOPCImage read In1 write In1;
    property Pin2:TaOPCImage read Out2 write Out2;
  end;

var
  St1P2: TSt1P2;

implementation

uses StrUtils,
  UnitChoiceValue;

{$R *.dfm}

procedure TSt1P2.aOPCImage21MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TaOPCImage then
  begin
    //if ssCtrl in Shift then
    if AllowClick then
    begin
      if Button = mbLeft then
        (Sender as TaOPCImage).Value := '1'
      else
        (Sender as TaOPCImage).Value := '0';
    end;
  end;
end;

procedure TSt1P2.aOPCLabel13DblClick(Sender: TObject);
var
  ChoiceValueForm:TChoiceValue;
  aLabel:TaOPCLabel;
begin
  //if not AllowClick then exit;
  if not (Sender is TaOPCLabel) then exit;

  aLabel := TaOPCLabel(Sender);
  if not (aLabel.OPCSource is TaOPCSource) then exit;
  if not Assigned(aLabel.LookupList) then exit;

  ChoiceValueForm := TChoiceValue.Create(nil);
  try
    ChoiceValueForm.sl := TStringList(aLabel.LookupList.Items);
    ChoiceValueForm.Edit.Text := aLabel.Value;
    ChoiceValueForm.ShowModal;
    if ChoiceValueForm.ModalResult = mrOk then
      TaOPCSource(aLabel.OPCSource).SetSensorValue(aLabel.PhysID,ChoiceValueForm.Edit.Text);
  finally
    ChoiceValueForm.Free;
  end;
end;

constructor TSt1P2.Create(AOwner: TComponent);
begin
  inherited;
  In1.SetSubComponent(true);
  Out2.SetSubComponent(true);
  Par.Value := '1';
end;

function TSt1P2.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (V94.OPCSource as TaCustomMultiOPCSource);
end;


procedure TSt1P2.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      if (TaCustomOPCDataObject(Components[i]).GraphicOPCSource = nil) and
        (TaCustomOPCDataObject(Components[i]).PhysID <> '') then
        TaCustomOPCDataObject(Components[i]).OPCSource := Value;
    end
    else if (Components[i] is TaOPCLabel) then
      TaOPCLabel(Components[i]).OPCSource := Value
//    else if (Components[i] is TaOPCGifAnimator) then
//      TaOPCGifAnimator(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCProvider) then
      TaOPCProvider(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCLookupList) then
          begin
            if (Value is TaOPCSource) and (TaOPCLookupList(Components[i]).TableName<>'') then
              TaOPCLookupList(Components[i]).OPCSource := TaOPCSource(Value);
          end
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;
  end;
end;

procedure TSt1P2.V94Change(Sender: TObject);
begin
  v94Out1.Value := IfThen(V94.IsActive,v94In.Value,
    IfThen(not V92.IsActive,Par.Value,'0'));
  v94Out.Value := IfThen((v91.IsActive and V94.IsActive),'0',v94In.Value);
end;

procedure TSt1P2.v91Change(Sender: TObject);
begin
  v94Out.Value := IfThen((v91.IsActive and V94.IsActive),'0',v94In.Value);
  V91In1.Value := IfThen(v91.IsActive,v94Out1.Value,'0');
  v91Out.Value := IfThen(not v91.IsActive,V91In.Value,
    IfThen(V91In1.IsActive,V91In1.Value,V91In.Value));

end;

procedure TSt1P2.V1300Change(Sender: TObject);
begin
  v1300Out.Value := IfThen(V1300.IsActive,v1300In.Value,'0');
end;

procedure TSt1P2.v1100Change(Sender: TObject);
begin
  v1100Out.Value := IfThen(V1100.IsActive,v1100In.Value,v1100In1.Value);
end;

procedure TSt1P2.ProizvChange(Sender: TObject);
begin
  if (Proizv.Value <> '1') or ((T1Valve.Value <> '1') and (T2Valve.Value <> '1')) then
  begin
    T1.Visible := false;
    T2.Visible := false;
    TankFillT1.Visible := false;
    TankFillT2.Visible := false;
    ContFillT1.Visible := false;
    ContFillT2.Visible := false;
  end
  else
  begin
    T1.Visible := (T1Valve.Value = '1');
    T2.Visible := (T2Valve.Value = '1');
    if T1Valve.Value = '1' then
    begin
      TankFillT1.Visible := (Drums1.Value = '1');
      ContFillT1.Visible := (Drums1.Value <> '1');
    end
    else
    begin
      TankFillT1.Visible := false;
      ContFillT1.Visible := false;
    end;
    if T2Valve.Value = '1' then
    begin
      TankFillT2.Visible := (Drums2.Value = '1');
      ContFillT2.Visible := (Drums2.Value <> '1');
    end
    else
    begin
      TankFillT2.Visible := false;
      ContFillT2.Visible := false;
    end;
  end;
  Bags1.Visible := (Drums1.Value = '1');
  Bags2.Visible := (Drums2.Value = '1');
  Conts1.Visible := not Bags1.Visible;
  Conts2.Visible := not Bags2.Visible;

end;


procedure TSt1P2.SetStep(const Value: integer);
begin
  FStep := Value;
  case FStep of
    1..7,10:
    begin
      v1300.Value := '1';
      v1100.Value := '1';
    end;
    8,9:
    begin
      v1300.Value := '0';
      v1100.Value := '0';
    end;
  end;
end;

end.
