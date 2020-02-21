{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2005 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSt3P1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, aOPCDataObject, aOPCImage, aOPCImageList, aCustomOPCSource,
  aOPCSource, aOPCTCPSource, ExtCtrls, 
  StdCtrls, Menus,Math,StrUtils, aOPCProvider,
  aOPCGifImage, aOPCLabel, aOPCGauge,
  uOPCFrame, GIFImage;

type
  TSt3P1 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    OPCImageValve: TaOPCImageList;
    V591In: TaOPCImage;
    Plata3Out: TaOPCImage;
    aOPCImage14: TaOPCImage;
    V584Out: TaOPCImage;
    aOPCImage8: TaOPCImage;
    V565Out1: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    V563In: TaOPCImage;
    aOPCImage12: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage17: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    V591Out: TaOPCImage;
    aOPCImage27: TaOPCImage;
    P561Out2: TaOPCImage;
    Tank1Out: TaOPCImage;
    V551In2: TaOPCImage;
    aOPCImage33: TaOPCImage;
    P586Out: TaOPCImage;
    P581Out: TaOPCImage;
    v585Out2: TaOPCImage;
    v534In1: TaOPCImage;
    Plata3In: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage40: TaOPCImage;
    aOPCImage41: TaOPCImage;
    P561In: TaOPCImage;
    V562In: TaOPCImage;
    V566In1: TaOPCImage;
    aOPCImage45: TaOPCImage;
    Out2: TaOPCImage;
    V551In1: TaOPCImage;
    v556Out1: TaOPCImage;
    V559In: TaOPCImage;
    aOPCImage57: TaOPCImage;
    aOPCImage58: TaOPCImage;
    V544Out: TaOPCImage;
    V585In2: TaOPCImage;
    V585Out1: TaOPCImage;
    V585In1: TaOPCImage;
    V514In: TaOPCImage;
    V514Out: TaOPCImage;
    P527Out: TaOPCImage;
    P530Out: TaOPCImage;
    aOPCImage67: TaOPCImage;
    V593Out: TaOPCImage;
    aOPCImage73: TaOPCImage;
    V551Out: TaOPCImage;
    V592In: TaOPCImage;
    V592Out: TaOPCImage;
    aOPCImage79: TaOPCImage;
    V552Out: TaOPCImage;
    v565In: TaOPCImage;
    P561Out1: TaOPCImage;
    VP528Out: TaOPCImage;
    P527In: TaOPCImage;
    V515In: TaOPCImage;
    V584In: TaOPCImage;
    V517In: TaOPCImage;
    aOPCImage89: TaOPCImage;
    V559Out2: TaOPCImage;
    v542Out: TaOPCImage;
    V546In: TaOPCImage;
    V546Out: TaOPCImage;
    V516In: TaOPCImage;
    V516Out: TaOPCImage;
    aOPCImage97: TaOPCImage;
    V563Out: TaOPCImage;
    v565Out2: TaOPCImage;
    V544in: TaOPCImage;
    V557Out1: TaOPCImage;
    PlataDInput1: TaOPCImage;
    V574Out: TaOPCImage;
    V556In: TaOPCImage;
    V557Out2: TaOPCImage;
    aOPCImage106: TaOPCImage;
    V557IN: TaOPCImage;
    v552Out1: TaOPCImage;
    aOPCImage109: TaOPCImage;
    aOPCImage110: TaOPCImage;
    aOPCImage111: TaOPCImage;
    aOPCImage113: TaOPCImage;
    aOPCImage114: TaOPCImage;
    V571In: TaOPCImage;
    aOPCImage120: TaOPCImage;
    aOPCImage124: TaOPCImage;
    aOPCImage128: TaOPCImage;
    aOPCImage129: TaOPCImage;
    aOPCImage130: TaOPCImage;
    V591: TaOPCImage;
    v542: TaOPCImage;
    V517: TaOPCImage;
    V584: TaOPCImage;
    V515: TaOPCImage;
    V546: TaOPCImage;
    V516: TaOPCImage;
    V563: TaOPCImage;
    V592: TaOPCImage;
    V566: TaOPCImage;
    V562: TaOPCImage;
    V518: TaOPCImage;
    V544: TaOPCImage;
    V514: TaOPCImage;
    V554: TaOPCImage;
    v552: TaOPCImage;
    v534: TaOPCImage;
    v551: TaOPCImage;
    v565: TaOPCImage;
    V559: TaOPCImage;
    V556: TaOPCImage;
    V557: TaOPCImage;
    V593: TaOPCImage;
    V585: TaOPCImage;
    VP528: TaOPCImage;
    V574: TaOPCImage;
    MR511: TaOPCImage;
    P561: TaOPCImage;
    Tank2Out: TaOPCImage;
    Plata3: TaOPCImage;
    aOPCImage156: TaOPCImage;
    V517Out: TaOPCImage;
    P561In2: TaOPCImage;
    V562Out: TaOPCImage;
    ModeProvider: TaOPCProvider;
    VP528In: TaOPCImage;
    P527: TaOPCGifImage;
    OPCImageListGif: TaOPCImageList;
    P586: TaOPCGifImage;
    P581: TaOPCGifImage;
    P530: TaOPCGifImage;
    V566In2: TaOPCImage;
    V562In2: TaOPCImage;
    Out5: TaOPCImage;
    VP528In1: TaOPCImage;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    aOPCLabel6: TaOPCLabel;
    aOPCImage11: TaOPCImage;
    aOPCImage26: TaOPCImage;
    Tank2Level: TaOPCGauge;
    aOPCLabel7: TaOPCLabel;
    Panel1: TPanel;
    aOPCLabel10: TaOPCLabel;
    aOPCLabel11: TaOPCLabel;
    aOPCImage37: TaOPCImage;
    Water: TaOPCImage;
    v542In: TaOPCImage;
    aOPCImage42: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    V559Out1: TaOPCImage;
    aOPCImage16: TaOPCImage;
    V552In: TaOPCImage;
    V574In: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage28: TaOPCImage;
    V591Out1: TaOPCImage;
    TT705: TaOPCLabel;
    aOPCImage29: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    aOPCImage34: TaOPCImage;
    aOPCLabel12: TaOPCLabel;
    procedure P581Change(Sender: TObject);
    procedure V585Change(Sender: TObject);
    procedure V518InChange(Sender: TObject);
    procedure P561Change(Sender: TObject);
    procedure V563InChange(Sender: TObject);
    procedure V563OutChange(Sender: TObject);
    procedure V562OutChange(Sender: TObject);
    procedure V546Change(Sender: TObject);
    procedure V516InChange(Sender: TObject);
    procedure V515InChange(Sender: TObject);
    procedure V562InChange(Sender: TObject);
    procedure V593Change(Sender: TObject);
    procedure V559InChange(Sender: TObject);
    procedure V574MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ModeProviderChange(Sender: TObject);
    procedure V592InChange(Sender: TObject);
    procedure Plata3Change(Sender: TObject);
    procedure V591InChange(Sender: TObject);
    procedure V514Change(Sender: TObject);
    procedure V557Change(Sender: TObject);
    procedure V556Change(Sender: TObject);
    procedure v552Change(Sender: TObject);
    procedure V551In2Change(Sender: TObject);
    procedure v565InChange(Sender: TObject);
    procedure v542Change(Sender: TObject);
    procedure v574Change(Sender: TObject);
    procedure VP574Change(Sender: TObject);
    procedure v565Out2Change(Sender: TObject);
    procedure VP528InChange(Sender: TObject);
    procedure P527InChange(Sender: TObject);
    procedure V566In2Change(Sender: TObject);
    procedure V514OutChange(Sender: TObject);
    procedure P530Change(Sender: TObject);
    procedure P530OutChange(Sender: TObject);
    procedure Tank2OutChange(Sender: TObject);
    procedure V584Change(Sender: TObject);
    procedure V517InChange(Sender: TObject);
    procedure PlataDInput1Change(Sender: TObject);
    procedure V591OutChange(Sender: TObject);
  private
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Pin5:TaOPCImage read Out5 write Out5;
    property Pin1:TaOPCImage read PlataDInput1 write PlataDInput1;
    property Pin2:TaOPCImage read V551In1 write V551In1;
    property Revers:TaOPCImage read v565 write v565;

  end;

var
  Form1: TSt3P1;

implementation

{$R *.dfm}

procedure TSt3P1.P581Change(Sender: TObject);
begin
  P581Out.Value := IfThen(P581.IsActive,'1','0');
  P586Out.Value := IfThen(P586.IsActive,'1','0');
  if p581.IsActive or P586Out.IsActive then
    V585In2.Value := '1'
  else
    V585In2.Value := '0';
end;

procedure TSt3P1.V585Change(Sender: TObject);
var
  m:integer;
begin
  m := IfThen(V585.IsActive,1,0)+
    2*IfThen(V585In1.IsActive,1,0)+
    4*IfThen(V585In2.IsActive,1,0);

  case m of    //
    0,1:
    begin
      v585Out1.Value := '0';
      v585Out2.Value := '0';
    end;
    2:
    begin
      v585Out1.Value := '0';
      v585Out2.Value := '3';
    end;
    3:
    begin
      v585Out1.Value := '3';
      v585Out2.Value := '0';
    end;
    4:
    begin
      v585Out1.Value := '0';
      v585Out2.Value := '4';
    end;
    5:
    begin
      v585Out1.Value := '4';
      v585Out2.Value := '0';
    end;
    6:
    begin
      v585Out1.Value := '0';
      v585Out2.Value := '5';
    end;
    7:
    begin
      v585Out1.Value := '4';
      v585Out2.Value := '0';
    end;
  end;
end;

procedure TSt3P1.V518InChange(Sender: TObject);
begin
  P561Out2.Value := IfThen(V518.IsActive,P561Out1.Value,'0');
end;

procedure TSt3P1.P561Change(Sender: TObject);
begin
  P561Out1.Value := IfThen(P561.IsActive,P561In.Value,'0');
end;

procedure TSt3P1.V563InChange(Sender: TObject);
begin
  V563In.Value := IfThen(V563.IsActive,v552Out1.Value,'0');
  V563Out.Value := V563In.Value
end;

procedure TSt3P1.V563OutChange(Sender: TObject);
begin
  P561In.Value := IfThen(V563Out.IsActive,V563Out.Value,P561In2.Value);
end;

procedure TSt3P1.V562OutChange(Sender: TObject);
begin
  P561In2.Value := IfThen(V546Out.IsActive,V546Out.Value,V562Out.Value);
end;

procedure TSt3P1.V546Change(Sender: TObject);
begin
  V546Out.Value := IfThen(V546.IsActive,V546In.Value,'0');
end;

procedure TSt3P1.V516InChange(Sender: TObject);
begin
  V516Out.Value := IfThen(not V516.IsActive,V516In.Value,'0');
end;

procedure TSt3P1.V515InChange(Sender: TObject);
begin
  if V544.IsActive then
    V544Out.Value := V544in.Value
  else
  begin
    V544Out.Value := IfThen(V515.IsActive,V514Out.Value,'0');
  end;
  VP528In.Value := IfThen(V514Out.IsActive,V514Out.Value,V515In.Value);

  V514OutChange(self);

end;


procedure TSt3P1.V562InChange(Sender: TObject);
begin
  V562Out.Value := IfThen(V562.IsActive,V562In.Value,'0');
end;

procedure TSt3P1.V593Change(Sender: TObject);
begin
  if V518.IsActive then
  begin
    V593Out.Value := P561Out1.Value;
    P561Out2.Value := P561Out1.Value;
  end
  else
  begin
    P561Out2.Value := '0';
    if V593.IsActive then
      V593Out.Value := Water.Value
    else
      V593Out.Value := '0';
  end;

  //V593Out.Value := IfThen(V593.IsActive,V593In.Value,'0');
end;

procedure TSt3P1.V559InChange(Sender: TObject);
begin
  if V559.IsActive then
  begin
    V559Out1.Value := '0';
    V559Out2.Value := V559In.Value;
  end
  else
  begin
    V559Out1.Value := V559In.Value;
    V559Out2.Value := '0';
  end;
end;

procedure TSt3P1.V574MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TSt3P1.ModeProviderChange(Sender: TObject);
var
  mode:integer;
begin
  mode := StrToIntDef(ModeProvider.Value,0);
  case mode of
    0,1,2:    Tank2Out.Value := '0';
    4:        Tank2Out.Value := '2';
    8,32,128: Tank2Out.Value := '3';
    16,64:    Tank2Out.Value := '4'
    else
      Tank2Out.Value := '0';
  end;

  if mode = 1 then
    Tank1Out.Value := '1'
  else
    Tank1Out.Value := '3';

  Plata3Change(self);
  V551In2Change(self);
end;

procedure TSt3P1.V592InChange(Sender: TObject);
begin
  V592Out.Value := IfThen(not V592.IsActive,V592In.Value,'0');
end;

procedure TSt3P1.Plata3Change(Sender: TObject);
begin
  if Plata3.IsActive then
    Plata3Out.Value := Plata3In.Value
  else
  begin
    if ModeProvider.Value = '4' then
      Plata3Out.Value := '2'
    else
      Plata3Out.Value := '0';
  end;
end;

procedure TSt3P1.V591InChange(Sender: TObject);
begin
  V591Out.Value := IfThen(V591.IsActive,V591In.Value,'0');
end;

procedure TSt3P1.V514Change(Sender: TObject);
begin
  V514Out.Value := IfThen(v514.IsActive,V514In.Value,'0');
end;

procedure TSt3P1.V557Change(Sender: TObject);
begin
  if v557.IsActive then
  begin
    V557Out2.Value := '0';
    V557Out1.Value := V557IN.Value;
  end
  else
  begin
    V557Out1.Value := '0';
    V557Out2.Value := V557IN.Value;
  end;
end;

procedure TSt3P1.V556Change(Sender: TObject);
begin
  if V556.IsActive then
  begin
    v556Out1.Value := '0';
    V557IN.Value := V556In.Value;
  end
  else
  begin
    v556Out1.Value := V556In.Value;
    V557IN.Value := '0';
  end;

end;

procedure TSt3P1.v552Change(Sender: TObject);
begin
  v552Out.Value := IfThen(v552.IsActive,v552In.Value,'0');
  V556In.Value  := IfThen(v552.IsActive,'0',V552In.Value)
end;

procedure TSt3P1.V551In2Change(Sender: TObject);
begin
  if v551.IsActive then
  begin
    v551Out.Value := '0';
    if Revers.IsActive then
      V551In1.Value := V551In2.Value;
  end
  else
  begin
    if Revers.IsActive then
      V551In1.Value := '0';
    v551Out.Value := V551In1.Value;
    v565InChange(Self);
  end
end;

procedure TSt3P1.v565InChange(Sender: TObject);
begin
  if v565.IsActive then
  begin
    V565Out1.Value := v565In.Value;
    v565Out2.Value := '0';
  end
  else
  begin
    V565Out2.Value := v565In.Value;
    v565Out1.Value := '0';
  end;
end;

procedure TSt3P1.v542Change(Sender: TObject);
begin
  v542Out.Value := IfThen(v542.IsActive,v542In.Value,'0');
end;

procedure TSt3P1.v574Change(Sender: TObject);
begin
  V574Out.Value := IfThen(v574.IsActive,V574In.Value,'0');
end;

procedure TSt3P1.VP574Change(Sender: TObject);
begin
  V574Out.Value := IfThen(V574.IsActive,v574In.Value,'0');
end;

procedure TSt3P1.v565Out2Change(Sender: TObject);
begin
  if v566.IsActive then
  begin
    V566In1.Value := v565Out2.Value;
    V566In2.Value := '0';
  end
  else
  begin
    V566In2.Value := v565Out2.Value;
    V566In1.Value := '0';
  end;
end;

procedure TSt3P1.VP528InChange(Sender: TObject);
begin
  VP528Out.Value := IfThen(VP528.IsActive,VP528In.Value,'0');
end;

procedure TSt3P1.P527InChange(Sender: TObject);
begin
  P527Out.Value := IfThen((P527.IsActive) and (P527In.IsActive),
    P527In.Value,VP528Out.Value);
end;

procedure TSt3P1.V566In2Change(Sender: TObject);
begin
  if V562.IsActive and v534.IsActive and Revers.IsActive then
  begin
    V562In2.Value := PlataDInput1.Value;
    //v534In1.Value := PlataDInput1.Value;
    V562In.Value := V562In2.Value;
  end
  else
  begin
    V562In2.Value := V566In2.Value;
    //v534In1.Value := '0';
    V562In.Value := '0';
  end;
{
    V562In2.Value := V551In1.Value;
    v534In1.Value := V551In1.Value;
    V562In.Value := V551In1.Value;
  end
  else
  begin
    V562In2.Value := V566In2.Value;
    v534In1.Value := V566In2.Value;
    V562In.Value := '0';
  end;
}  
end;

procedure TSt3P1.V514OutChange(Sender: TObject);
begin
  if V514Out.IsActive then
    V515In.Value := V514Out.Value
  else
    V515In.Value := IfThen(V515.IsActive,V544Out.Value,'0');
end;

procedure TSt3P1.P530Change(Sender: TObject);
begin
  P530Out.Value := IfThen(P530.IsActive,P527Out.Value,'0');

  //V554Change(self);
end;

procedure TSt3P1.P530OutChange(Sender: TObject);
begin
  if Revers.IsActive then
  begin
    PlataDInput1Change(Sender);
  end
  else
  begin
    if v534.IsActive then
      PlataDInput1.Value := IfThen(P530Out.IsActive,P530Out.Value,v534In1.Value)
    else
      PlataDInput1.Value := P530Out.Value;
  end;
end;

procedure TSt3P1.Tank2OutChange(Sender: TObject);
var
  v:integer;
begin
  v:=StrToIntDef(Tank2Out.Value,0);
  case v of
    0: Tank2Level.ForeColor := clGray;
    1: Tank2Level.ForeColor := clRed;
    2: Tank2Level.ForeColor := $80FF80;
    3: Tank2Level.ForeColor := $FFFF80;
    4: Tank2Level.ForeColor := $30A8F8;
  end;
end;

function TSt3P1.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (Plata3.OPCSource as TaCustomMultiOPCSource);
end;

procedure TSt3P1.SetOPCSource(const Value: TaCustomMultiOPCSource);
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
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;
  end;

end;

procedure TSt3P1.V584Change(Sender: TObject);
begin
  V584Out.Value := IfThen(V584.IsActive,V584In.Value,'0');
end;

constructor TSt3P1.Create(AOwner: TComponent);
begin
  inherited;
  V551In1.SetSubComponent(true);
  PlataDInput1.SetSubComponent(true);
  Out5.SetSubComponent(true);
  v565.SetSubComponent(True);
  Water.Value := '3';
end;

procedure TSt3P1.V517InChange(Sender: TObject);
begin
  V517Out.Value := IfThen(V517.IsActive,V517In.Value,'0');
end;

procedure TSt3P1.PlataDInput1Change(Sender: TObject);
begin
  if Revers.IsActive then
    V566In2Change(Sender);
end;

procedure TSt3P1.V591OutChange(Sender: TObject);
begin
  V591Out1.Value := IfThen(V591Out.IsActive,V591Out.Value,V559Out1.Value); 
end;

end.


