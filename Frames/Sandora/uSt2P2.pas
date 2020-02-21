{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSt2P2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aCustomOPCSource, aOPCSource, aOPCTCPSource, aOPCDataObject,
  aOPCImage, aOPCImageList, ExtCtrls, StdCtrls, aOPCLabel,
  aOPCProvider,
  uOPCFrame, GIFImage;

type
  TSt2P2 = class(TaOPCFrame)
    Background: TImage;
    OPCImageList: TaOPCImageList;
    V661: TaOPCImage;
    V600: TaOPCImage;
    V654: TaOPCImage;
    VT672: TaOPCImage;
    Holder: TaOPCImage;
    P653: TaOPCImage;
    P694: TaOPCImage;
    P601: TaOPCImage;
    VT685: TaOPCImage;
    VT687: TaOPCImage;
    VT712: TaOPCImage;
    V677: TaOPCImage;
    TT711: TaOPCLabel;
    TT705: TaOPCLabel;
    TT692: TaOPCLabel;
    TT714: TaOPCLabel;
    TO_B_1: TaOPCImage;
    TO_B_3: TaOPCImage;
    TO_B_2: TaOPCImage;
    TO_B_4: TaOPCImage;
    TO_S_1: TaOPCImage;
    TO_S_2: TaOPCImage;
    TO_1_C: TaOPCImage;
    TO_2_C: TaOPCImage;
    TO_FC: TaOPCImage;
    PlataD: TaOPCImage;
    PlataE: TaOPCImage;
    OPCImageListPipe: TaOPCImageList;
    aOPCImage1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    OPCImageListUgol: TaOPCImageList;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImageListPipe1: TaOPCImageList;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    PlataDInput5: TaOPCImage;
    PlataDOut3: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage15: TaOPCImage;
    B1Out: TaOPCImage;
    Vt712In: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    Vt712_0: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage26: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage28: TaOPCImage;
    aOPCImage29: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    aOPCImage33: TaOPCImage;
    aOPCImage34: TaOPCImage;
    aOPCImage35: TaOPCImage;
    aOPCImage36: TaOPCImage;
    aOPCImage37: TaOPCImage;
    aOPCImage38: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage40: TaOPCImage;
    aOPCImage41: TaOPCImage;
    aOPCImage42: TaOPCImage;
    aOPCImage43: TaOPCImage;
    aOPCImage44: TaOPCImage;
    aOPCImage45: TaOPCImage;
    aOPCImage46: TaOPCImage;
    aOPCImage47: TaOPCImage;
    aOPCImage48: TaOPCImage;
    aOPCImage49: TaOPCImage;
    aOPCImage50: TaOPCImage;
    aOPCImage51: TaOPCImage;
    aOPCImage52: TaOPCImage;
    PlataDOut2: TaOPCImage;
    PlataDInput1: TaOPCImage;
    aOPCImage55: TaOPCImage;
    aOPCImage56: TaOPCImage;
    aOPCImage57: TaOPCImage;
    aOPCImage58: TaOPCImage;
    aOPCImage59: TaOPCImage;
    aOPCImage60: TaOPCImage;
    aOPCImage61: TaOPCImage;
    Vt712_1: TaOPCImage;
    aOPCImage63: TaOPCImage;
    Out4: TaOPCImage;
    aOPCImage65: TaOPCImage;
    CoolWater: TaOPCImage;
    aOPCImage67: TaOPCImage;
    aOPCImage68: TaOPCImage;
    VT602Input: TaOPCImage;
    aOPCImage70: TaOPCImage;
    aOPCImage71: TaOPCImage;
    aOPCImage72: TaOPCImage;
    aOPCImage73: TaOPCImage;
    aOPCImage74: TaOPCImage;
    aOPCImage75: TaOPCImage;
    aOPCImage76: TaOPCImage;
    aOPCImage77: TaOPCImage;
    aOPCImage78: TaOPCImage;
    aOPCImage79: TaOPCImage;
    TO_B_3Input: TaOPCImage;
    aOPCImage81: TaOPCImage;
    aOPCImage82: TaOPCImage;
    aOPCImage83: TaOPCImage;
    aOPCImage84: TaOPCImage;
    PlataDInput6: TaOPCImage;
    TO_2_COut: TaOPCImage;
    aOPCImage87: TaOPCImage;
    aOPCImage88: TaOPCImage;
    aOPCImage89: TaOPCImage;
    aOPCImage90: TaOPCImage;
    aOPCImage91: TaOPCImage;
    aOPCImage92: TaOPCImage;
    aOPCImage93: TaOPCImage;
    aOPCImage94: TaOPCImage;
    aOPCImage95: TaOPCImage;
    P653Out: TaOPCImage;
    aOPCImage97: TaOPCImage;
    aOPCImage98: TaOPCImage;
    aOPCImage99: TaOPCImage;
    aOPCImage100: TaOPCImage;
    aOPCImage101: TaOPCImage;
    aOPCImage102: TaOPCImage;
    aOPCImage103: TaOPCImage;
    aOPCImage104: TaOPCImage;
    aOPCImage105: TaOPCImage;
    aOPCImage106: TaOPCImage;
    aOPCImage107: TaOPCImage;
    aOPCImage108: TaOPCImage;
    aOPCImage109: TaOPCImage;
    aOPCImage110: TaOPCImage;
    aOPCImage111: TaOPCImage;
    aOPCImage112: TaOPCImage;
    aOPCImage113: TaOPCImage;
    aOPCImage114: TaOPCImage;
    aOPCImage115: TaOPCImage;
    aOPCImage116: TaOPCImage;
    aOPCImage117: TaOPCImage;
    aOPCImage118: TaOPCImage;
    aOPCImage119: TaOPCImage;
    aOPCImage120: TaOPCImage;
    aOPCImage121: TaOPCImage;
    aOPCImage122: TaOPCImage;
    PlataEOut2: TaOPCImage;
    PlataEOut4: TaOPCImage;
    TO_1_COut: TaOPCImage;
    aOPCImage126: TaOPCImage;
    aOPCImage127: TaOPCImage;
    aOPCImage128: TaOPCImage;
    aOPCImage129: TaOPCImage;
    aOPCImage130: TaOPCImage;
    aOPCImage131: TaOPCImage;
    aOPCImage132: TaOPCImage;
    aOPCImage133: TaOPCImage;
    aOPCImage134: TaOPCImage;
    aOPCImage135: TaOPCImage;
    aOPCImage136: TaOPCImage;
    aOPCImage137: TaOPCImage;
    Out3: TaOPCImage;
    aOPCImage139: TaOPCImage;
    aOPCImage140: TaOPCImage;
    aOPCImage142: TaOPCImage;
    aOPCImage143: TaOPCImage;
    aOPCImage144: TaOPCImage;
    aOPCImage145: TaOPCImage;
    aOPCImage146: TaOPCImage;
    aOPCImage147: TaOPCImage;
    aOPCImage148: TaOPCImage;
    aOPCImage149: TaOPCImage;
    aOPCImage150: TaOPCImage;
    aOPCImage151: TaOPCImage;
    aOPCImage152: TaOPCImage;
    aOPCImage153: TaOPCImage;
    aOPCImage154: TaOPCImage;
    Out2: TaOPCImage;
    aOPCImage156: TaOPCImage;
    aOPCImage157: TaOPCImage;
    aOPCImage158: TaOPCImage;
    aOPCImage159: TaOPCImage;
    PlataEIn: TaOPCImage;
    aOPCImage161: TaOPCImage;
    aOPCImage162: TaOPCImage;
    V677Out: TaOPCImage;
    aOPCImage164: TaOPCImage;
    aOPCImage165: TaOPCImage;
    aOPCImage166: TaOPCImage;
    aOPCImage167: TaOPCImage;
    aOPCImage168: TaOPCImage;
    aOPCImage169: TaOPCImage;
    aOPCImage170: TaOPCImage;
    aOPCImage171: TaOPCImage;
    aOPCImage172: TaOPCImage;
    aOPCImage173: TaOPCImage;
    PlataDOut4: TaOPCImage;
    aOPCImage175: TaOPCImage;
    aOPCImage176: TaOPCImage;
    ModeProvider: TaOPCProvider;
    XCD1_2: TaOPCProvider;
    XCD4_5: TaOPCProvider;
    XCE1_4: TaOPCProvider;
    XCD1_3: TaOPCProvider;
    XCD4_6: TaOPCProvider;
    XCE1_2: TaOPCProvider;
    XCE3_4: TaOPCProvider;
    TO_FCIn: TaOPCImage;
    B1: TaOPCImage;
    OPCImageListValve: TaOPCImageList;
    aOPCImage53: TaOPCImage;
    B2Out: TaOPCImage;
    B2: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage62: TaOPCImage;
    aOPCImage85: TaOPCImage;
    aOPCImage86: TaOPCImage;
    aOPCImage96: TaOPCImage;
    aOPCImage123: TaOPCImage;
    aOPCImage12: TaOPCImage;
    OPCImageListFC: TaOPCImageList;
    aOPCLabel1: TaOPCLabel;
    aOPCImage16: TaOPCImage;
    Revers: TaOPCProvider;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    procedure ModeProviderChange(Sender: TObject);
    procedure XCD1_2Change(Sender: TObject);
    procedure XCD1_3Change(Sender: TObject);
    procedure PlataDChange(Sender: TObject);
    procedure VT712Change(Sender: TObject);
    procedure PlataDInput1Change(Sender: TObject);
    procedure TO_2_CChange(Sender: TObject);
    procedure P653Change(Sender: TObject);
    procedure V677Change(Sender: TObject);
    procedure V661Change(Sender: TObject);
    procedure P694Change(Sender: TObject);
    procedure PlataEOut2Change(Sender: TObject);
    procedure TO_1_CChange(Sender: TObject);
    procedure PlataEOut4Change(Sender: TObject);
    procedure V661MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure PlataEInChange(Sender: TObject);
    procedure TO_FCInChange(Sender: TObject);
  private
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Pin1:TaOPCImage read PlataDInput1 write PlataDInput1;
    property Pin2:TaOPCImage read Out2 write Out2;
    property Pin3:TaOPCImage read Out3 write Out3;
    property Pin4:TaOPCImage read Out4 write Out4;

  end;

var
  St2P2: TSt2P2;

implementation

uses StrUtils;

{$R *.dfm}


procedure TSt2P2.ModeProviderChange(Sender: TObject);
//var
//  mode:integer;
begin
{
  mode := StrToInt(ModeProvider.Value);
  case mode of    //
    0:        PlataDInput1.Value := '0';
    1,2:      PlataDInput1.Value := '1';
    4:        PlataDInput1.Value := '2';
    8,32,128: PlataDInput1.Value := '3';
    16,64:    PlataDInput1.Value := '4';
  end;    // case

  if (not (csLoading in ComponentState)) then
  begin
    VT712Change(self);
    V661Change(self);
    P694Change(self);
    //PlataDChange(self);
  end;
}  
end;

procedure TSt2P2.XCD1_2Change(Sender: TObject);
begin
  if (XCD1_2.Value='1') and (XCD4_5.Value='1') and (XCE1_4.Value='1') then
    PlataD.Value := '0';

end;

procedure TSt2P2.XCD1_3Change(Sender: TObject);
begin
  if (XCD1_3.Value='1') and (XCD4_6.Value='1') and (XCE1_2.Value='1')
     and (XCE3_4.Value='1') then
    PlataD.Value := '1';

end;

procedure TSt2P2.PlataDChange(Sender: TObject);
begin
  if PlataD.IsActive then  // большой
  begin
    PlataDOut2.Value := '0';
    TO_S_1.Value     := '0';
    PlataDOut3.Value := PlataDInput1.Value;
    TO_B_1.Value     := ModeProvider.Value;
    TO_2_C.Value     := ModeProvider.Value;
    TO_2_CChange(self);
    B1.Value         := '1';
    B2.Value         := '0';
  end
  else       // малый круг
  begin
    PlataDOut2.Value := PlataDInput1.Value;
    TO_S_1.Value     := ModeProvider.Value;
    PlataDOut3.Value := '0';
    TO_B_1.Value     := '0';
    TO_2_C.Value     := '0';
    PlataEOut4.Value := Vt712_1.Value;
    B1.Value         := '0';
    B2.Value         := '1';
  end;
  P694Change(self);
end;

procedure TSt2P2.VT712Change(Sender: TObject);
begin
  if Revers.Value = '1' then
  begin
    if VT712.IsActive then
    begin
      vt712_1.Value := Out2.Value;
      Vt712_0.Value := '0';
      Out4.Value := Out2.Value;
      PlataDInput1.Value := Out3.Value;
    end
    else
    begin
      vt712_0.Value := Out2.Value;
      PlataDInput1.Value := Out2.Value;
      Vt712_1.Value := '0';
      Out4.Value := '0';
    end;
  end
  else
  begin
    if VT712.IsActive then
    begin
      Vt712_0.Value := '0';
      Vt712_1.Value := Vt712In.Value;
    end
    else
    begin
      Out3.Value := '0';
      Vt712_0.Value := Vt712In.Value;
      Vt712_1.Value := '0';
    end;
  end;
  PlataDChange(self);
end;

procedure TSt2P2.PlataDInput1Change(Sender: TObject);
begin
  VT712Change(Sender);
end;

procedure TSt2P2.TO_2_CChange(Sender: TObject);
begin
  if (TO_2_C.Value = '2') and (PlataEOut2.IsActive) Then
    TO_2_COut.Value := '3'
  else
    TO_2_COut.Value := PlataEOut2.Value;

  PlataEOut4.Value := TO_2_COut.Value;

end;


procedure TSt2P2.P653Change(Sender: TObject);
begin
  P653Out.Value := IfThen(P653.IsActive,'3','0');
end;

procedure TSt2P2.V677Change(Sender: TObject);
begin
  V677Out.Value := IfThen(V677.IsActive,'3','0');

end;

procedure TSt2P2.V661Change(Sender: TObject);
begin
  if (V661.IsActive) then
  begin
    if (ModeProvider.Value = '4') then
      TO_FC.Value := '5'
    else if (ModeProvider.Value = '2') then
      TO_FC.Value := '3';
  end
  else
    TO_FC.Value := ModeProvider.Value;
end;

procedure TSt2P2.P694Change(Sender: TObject);
begin
  if P694.IsActive then
  begin
    TO_B_3Input.Value := PlataD.Value;
    B1Out.Value := B1.Value;
    B2Out.Value := B2.Value;
    VT602Input.Value := '1';
  end
  else
  begin
    B1Out.Value := '0';
    B2Out.Value := '0';
    VT602Input.Value := '0';
    TO_B_3Input.Value := '0';
  end;
end;


procedure TSt2P2.PlataEOut2Change(Sender: TObject);
begin
  TO_2_CChange(self);
end;

procedure TSt2P2.TO_1_CChange(Sender: TObject);
begin
  if (TO_1_C.Value = '2') and (PlataEOut4.IsActive) Then
    TO_1_COut.Value := '3'
  else
    TO_1_COut.Value := PlataEOut4.Value;
end;

procedure TSt2P2.PlataEOut4Change(Sender: TObject);
begin
  TO_1_CChange(self);
end;

procedure TSt2P2.V661MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
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

function TSt2P2.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (VT685.OPCSource as TaCustomMultiOPCSource);
end;

procedure TSt2P2.SetOPCSource(const Value: TaCustomMultiOPCSource);
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
      TaOPCProvider(Components[i]).OPCSource := Value;
//    else if (Components[i] is TaOPCGauge) then
//      TaOPCGauge(Components[i]).OPCSource := Value;
  end;

end;

constructor TSt2P2.Create(AOwner: TComponent);
begin
  inherited;
  PlataDInput1.SetSubComponent(true);
  Out2.SetSubComponent(true);
  Out3.SetSubComponent(true);
  Out4.SetSubComponent(true);
  CoolWater.Value := '3';
end;

procedure TSt2P2.CheckBox1Click(Sender: TObject);
begin
  Revers.Value := IfThen(TCheckBox(sender).Checked,'1','0');
end;

procedure TSt2P2.PlataEInChange(Sender: TObject);
begin
  if PlataE.IsActive then
    PlataEOut2.Value := Vt712_1.Value
  else
    PlataEOut2.Value := '0';
end;

procedure TSt2P2.TO_FCInChange(Sender: TObject);
begin
  if Revers.Value <> '1' then
  begin
    if Out4.IsActive then
      Out2.Value := Out4.Value
    else
      Out2.Value := Vt712_0.Value;
  end;
end;

end.
