{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2005 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSt3P2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aCustomOPCSource, aOPCSource, aOPCTCPSource, aOPCDataObject,
  aOPCImage, aOPCImageList, ExtCtrls, StdCtrls, aOPCLabel,
  aOPCProvider,
  uOPCFrame, GIFImage;

type
  TSt3P2 = class(TaOPCFrame)
    Background: TImage;
    OPCImageList: TaOPCImageList;
    OPCImageListPipe: TaOPCImageList;
    OPCImageListUgol: TaOPCImageList;
    aOPCImageListPipe1: TaOPCImageList;
    OPCImageListValve: TaOPCImageList;
    OPCImageListFC: TaOPCImageList;
    Panel1: TPanel;
    V311: TaOPCImage;
    V301: TaOPCImage;
    V661: TaOPCImage;
    V321: TaOPCImage;
    VT712: TaOPCImage;
    VT672: TaOPCImage;
    Vt687: TaOPCImage;
    P694: TaOPCImage;
    P601: TaOPCImage;
    Holder: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage12: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage16: TaOPCImage;
    aOPCImage17: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    v321In: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage26: TaOPCImage;
    v1: TaOPCImage;
    aOPCImage28: TaOPCImage;
    aOPCImage29: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    CoolWater: TaOPCImage;
    In13: TaOPCImage;
    aOPCImage34: TaOPCImage;
    aOPCImage35: TaOPCImage;
    aOPCImage36: TaOPCImage;
    aOPCImage37: TaOPCImage;
    aOPCImage38: TaOPCImage;
    Vt712_1: TaOPCImage;
    aOPCImage40: TaOPCImage;
    Vt672In: TaOPCImage;
    aOPCImage42: TaOPCImage;
    aOPCImage44: TaOPCImage;
    aOPCImage45: TaOPCImage;
    aOPCImage46: TaOPCImage;
    v3In: TaOPCImage;
    v321Out1: TaOPCImage;
    aOPCImage49: TaOPCImage;
    aOPCImage50: TaOPCImage;
    Vt672Out: TaOPCImage;
    aOPCImage52: TaOPCImage;
    aOPCImage53: TaOPCImage;
    aOPCImage54: TaOPCImage;
    Out3: TaOPCImage;
    In1: TaOPCImage;
    aOPCImage57: TaOPCImage;
    aOPCImage58: TaOPCImage;
    P694In: TaOPCImage;
    p694Out: TaOPCImage;
    aOPCImage61: TaOPCImage;
    P601In: TaOPCImage;
    P601Out: TaOPCImage;
    Out4: TaOPCImage;
    Out2: TaOPCImage;
    aOPCImage67: TaOPCImage;
    In12: TaOPCImage;
    Vt687Out: TaOPCImage;
    Vt687In: TaOPCImage;
    Out21: TaOPCImage;
    aOPCImage72: TaOPCImage;
    aOPCImage73: TaOPCImage;
    aOPCImage74: TaOPCImage;
    V311In: TaOPCImage;
    V311Out: TaOPCImage;
    v2In: TaOPCImage;
    v321Out: TaOPCImage;
    aOPCImage79: TaOPCImage;
    aOPCImage80: TaOPCImage;
    V301In: TaOPCImage;
    v301Out: TaOPCImage;
    Vt712_0: TaOPCImage;
    aOPCImage85: TaOPCImage;
    aOPCImage86: TaOPCImage;
    aOPCImage87: TaOPCImage;
    aOPCImage88: TaOPCImage;
    aOPCImage89: TaOPCImage;
    aOPCImage90: TaOPCImage;
    aOPCImage91: TaOPCImage;
    V661Out: TaOPCImage;
    aOPCImage93: TaOPCImage;
    V661In: TaOPCImage;
    Out22: TaOPCImage;
    ModeProvider: TaOPCProvider;
    v2: TaOPCImage;
    v3: TaOPCImage;
    v4: TaOPCImage;
    Vt672Out1: TaOPCImage;
    Revers: TaOPCProvider;
    TT711: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    aOPCLabel6: TaOPCLabel;
    aOPCLabel7: TaOPCLabel;
    aOPCLabel8: TaOPCLabel;
    Label1: TaOPCLabel;
    Label2: TaOPCLabel;
    aOPCLabel9: TaOPCLabel;
    aOPCLabel10: TaOPCLabel;
    aOPCImageListTO: TaOPCImageList;
    aOPCImage1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage32: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage41: TaOPCImage;
    aOPCImage43: TaOPCImage;
    aOPCImage47: TaOPCImage;
    aOPCImage48: TaOPCImage;
    aOPCImage51: TaOPCImage;
    aOPCImage55: TaOPCImage;
    aOPCImage56: TaOPCImage;
    aOPCImage59: TaOPCImage;
    aOPCImage60: TaOPCImage;
    aOPCImage62: TaOPCImage;
    aOPCImage63: TaOPCImage;
    aOPCImage64: TaOPCImage;
    aOPCImage65: TaOPCImage;
    TO_Heating_Shell: TaOPCImage;
    TO_Preheating_Shell: TaOPCImage;
    aOPCImage70: TaOPCImage;
    aOPCImage71: TaOPCImage;
    aOPCImage66: TaOPCImage;
    aOPCImage69: TaOPCImage;
    aOPCImage75: TaOPCImage;
    aOPCImage76: TaOPCImage;
    Vt712In: TaOPCImage;
    procedure ModeProviderChange(Sender: TObject);
    procedure VT712Change(Sender: TObject);
    procedure V661Change(Sender: TObject);
    procedure P694Change(Sender: TObject);
    procedure V661MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TO_FCInChange(Sender: TObject);
    procedure Vt687InChange(Sender: TObject);
    procedure V311Change(Sender: TObject);
    procedure Vt672InChange(Sender: TObject);
    procedure V321Change(Sender: TObject);
    procedure v321Out1Change(Sender: TObject);
    procedure v1Change(Sender: TObject);
    procedure P694InChange(Sender: TObject);
    procedure P601Change(Sender: TObject);
    procedure Out21Change(Sender: TObject);
    procedure p694OutChange(Sender: TObject);
  private
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Pin1:TaOPCImage read In1 write In1;
    property Pin2:TaOPCImage read Out2 write Out2;
    property Pin3:TaOPCImage read Out3 write Out3;
    property Pin4:TaOPCImage read Out4 write Out4;

  end;

var
  St3P2: TSt3P2;

implementation

uses StrUtils;

{$R *.dfm}


procedure TSt3P2.ModeProviderChange(Sender: TObject);
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

procedure TSt3P2.VT712Change(Sender: TObject);
begin
  if Revers.Value = '1' then
  begin
    if VT712.IsActive then
    begin
      vt712_1.Value := Out2.Value;
      Vt712_0.Value := '0';
      Out4.Value := Out2.Value;
      In1.Value := Out3.Value;
    end
    else
    begin
      vt712_0.Value := Out2.Value;
      In1.Value := Out2.Value;
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
  V661Change(Sender);
end;

procedure TSt3P2.V661Change(Sender: TObject);
begin
  V661Out.Value := IfThen(V661.IsActive,V661In.Value,'0');
end;

procedure TSt3P2.P694Change(Sender: TObject);
begin
{
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
  }
end;


procedure TSt3P2.V661MouseDown(Sender: TObject; Button: TMouseButton;
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

function TSt3P2.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (V661.OPCSource as TaCustomMultiOPCSource);
end;

procedure TSt3P2.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

constructor TSt3P2.Create(AOwner: TComponent);
begin
  inherited;
  In1.SetSubComponent(true);
  Out2.SetSubComponent(true);
  Out3.SetSubComponent(true);
  Out4.SetSubComponent(true);
  CoolWater.Value := '3';
  P694In.Value := '1';
  Vt687In.Value := '1';
end;

procedure TSt3P2.TO_FCInChange(Sender: TObject);
begin
{
  if Revers.Value <> '1' then
  begin
    if Out4.IsActive then
      Out2.Value := Out4.Value
    else
      Out2.Value := Vt712_0.Value;
  end;
  }
end;

procedure TSt3P2.Vt687InChange(Sender: TObject);
begin
  VT687Out.Value := IfThen(Vt687.IsActive,Vt687In.Value,'0');
end;

procedure TSt3P2.V311Change(Sender: TObject);
begin
  V311Out.Value := IfThen(V311.IsActive,V311In.Value,'0');
end;

procedure TSt3P2.Vt672InChange(Sender: TObject);
begin
  VT672Out.Value := IfThen(VT672.IsActive,VT672In.Value,'0');

end;

procedure TSt3P2.V321Change(Sender: TObject);
begin
  V321Out.Value := IfThen(V321.IsActive,V321In.Value,'0');
end;

procedure TSt3P2.v321Out1Change(Sender: TObject);
begin
  if v321Out1.IsActive then
    v3In.Value := v321Out1.Value
  else
    v3In.Value := Vt672Out1.Value;
end;

procedure TSt3P2.v1Change(Sender: TObject);
begin
  if v1.IsActive then
    v2.Value := v1.Value
  else
  begin
    if V301.IsActive then
    begin
      v2.Value := IfThen(v2In.IsActive,v2In.Value,v3In.Value);
    end
    else
      v2.Value := '0';
  end;
  v3.Value := IfThen(v2.IsActive,v2.Value,v2In.Value);
  v4.Value := IfThen(v3.IsActive,v3.Value,v3In.Value);
  V301Out.Value := IfThen(V301.IsActive,V301In.Value,'0');
end;

procedure TSt3P2.P694InChange(Sender: TObject);
begin
  p694Out.Value := IfThen(P694.IsActive,P694In.Value,'0');
end;

procedure TSt3P2.P601Change(Sender: TObject);
begin
  p601Out.Value := IfThen(P601.IsActive,P601In.Value,'0');
end;

procedure TSt3P2.Out21Change(Sender: TObject);
begin
  if Revers.Value<>'1' then
    Out2.Value := IfThen(Out21.IsActive,Out21.Value,Out22.Value);
end;

procedure TSt3P2.p694OutChange(Sender: TObject);
begin
  if (ModeProvider.Value = '1') or (ModeProvider.Value = '2') then
  begin
    TO_Heating_Shell.Value := IfThen(p694Out.IsActive,'1','0');
    TO_Preheating_Shell.Value := IfThen(p601Out.IsActive,'1','0');
  end
  else
  begin
    TO_Heating_Shell.Value := IfThen(p694Out.IsActive,'2','0');
    TO_Preheating_Shell.Value := IfThen(p601Out.IsActive,'2','0');
  end;

end;

end.
