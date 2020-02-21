unit uSt1P1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls,
  aCustomOPCSource,
  aOPCDataObject, aOPCImage,
  aOPCImageList, aOPCGifImage, GIFImage, aOPCProvider, StdCtrls, aOPCLabel,
  aOPCGauge;

type
  TSt1P1 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    v102Out1: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage16: TaOPCImage;
    v102In1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage11: TaOPCImage;
    Out1: TaOPCImage;
    CoolWater: TaOPCImage;
    In2: TaOPCImage;
    v328Out: TaOPCImage;
    v123Out: TaOPCImage;
    v109Out: TaOPCImage;
    aOPCImage20: TaOPCImage;
    v109In: TaOPCImage;
    v440Out: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    M9In: TaOPCImage;
    M9Out: TaOPCImage;
    aOPCImage27: TaOPCImage;
    v441Out: TaOPCImage;
    Par: TaOPCImage;
    aOPCImage31: TaOPCImage;
    v201In: TaOPCImage;
    m4Out: TaOPCImage;
    m4In: TaOPCImage;
    aOPCImage35: TaOPCImage;
    aOPCImage36: TaOPCImage;
    aOPCImage41: TaOPCImage;
    aOPCImage42: TaOPCImage;
    aOPCImage43: TaOPCImage;
    aOPCImage44: TaOPCImage;
    v103Out: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage40: TaOPCImage;
    aOPCImage45: TaOPCImage;
    v102Out2: TaOPCImage;
    aOPCImage47: TaOPCImage;
    aOPCImage48: TaOPCImage;
    aOPCImage49: TaOPCImage;
    aOPCImage50: TaOPCImage;
    aOPCImage51: TaOPCImage;
    aOPCImage52: TaOPCImage;
    aOPCImage53: TaOPCImage;
    aOPCImage54: TaOPCImage;
    aOPCImage55: TaOPCImage;
    aOPCImage56: TaOPCImage;
    aOPCImage57: TaOPCImage;
    aOPCImage58: TaOPCImage;
    aOPCImage59: TaOPCImage;
    aOPCImage60: TaOPCImage;
    aOPCImage61: TaOPCImage;
    aOPCImage62: TaOPCImage;
    aOPCImage63: TaOPCImage;
    aOPCImage64: TaOPCImage;
    aOPCImage65: TaOPCImage;
    aOPCImage66: TaOPCImage;
    aOPCImage68: TaOPCImage;
    aOPCImage69: TaOPCImage;
    v110In: TaOPCImage;
    aOPCImage71: TaOPCImage;
    m3Out: TaOPCImage;
    m2Out: TaOPCImage;
    aOPCImage74: TaOPCImage;
    m6Out: TaOPCImage;
    aOPCImage76: TaOPCImage;
    aOPCImage77: TaOPCImage;
    v663In: TaOPCImage;
    v104Out: TaOPCImage;
    v104In: TaOPCImage;
    v100Out1: TaOPCImage;
    aOPCImage82: TaOPCImage;
    M7Out: TaOPCImage;
    Product: TaOPCImage;
    v100Out2: TaOPCImage;
    v106Out1: TaOPCImage;
    aOPCImage87: TaOPCImage;
    v101Out: TaOPCImage;
    V106In1: TaOPCImage;
    v110Out: TaOPCImage;
    v666In: TaOPCImage;
    v666Out: TaOPCImage;
    aOPCImage93: TaOPCImage;
    M8In: TaOPCImage;
    M10Out: TaOPCImage;
    aOPCImage96: TaOPCImage;
    aOPCImage97: TaOPCImage;
    v669In: TaOPCImage;
    m8Out: TaOPCImage;
    v669Out: TaOPCImage;
    aOPCImage101: TaOPCImage;
    v120Out: TaOPCImage;
    M10In: TaOPCImage;
    aOPCImage104: TaOPCImage;
    V106In2: TaOPCImage;
    v663Out: TaOPCImage;
    v124Out: TaOPCImage;
    v120In: TaOPCImage;
    aOPCImage111: TaOPCImage;
    v327Out: TaOPCImage;
    V785Out2: TaOPCImage;
    v751In: TaOPCImage;
    v751Out: TaOPCImage;
    v750In: TaOPCImage;
    aOPCImage117: TaOPCImage;
    v327In: TaOPCImage;
    aOPCImage119: TaOPCImage;
    PlateOut1: TaOPCImage;
    PlateIn1: TaOPCImage;
    PlateIn2: TaOPCImage;
    PlateOut2: TaOPCImage;
    aOPCImage124: TaOPCImage;
    v201Out: TaOPCImage;
    V106Out2: TaOPCImage;
    aOPCImage127: TaOPCImage;
    v102In2: TaOPCImage;
    v785Out: TaOPCImage;
    aOPCImage130: TaOPCImage;
    aOPCImage131: TaOPCImage;
    aOPCImage132: TaOPCImage;
    aOPCImage133: TaOPCImage;
    v668Out: TaOPCImage;
    aOPCImage135: TaOPCImage;
    v661Out: TaOPCImage;
    m8In1: TaOPCImage;
    Water: TaOPCImage;
    v673Out: TaOPCImage;
    aOPCImage67: TaOPCImage;
    v661In: TaOPCImage;
    Water1: TaOPCImage;
    v112In: TaOPCImage;
    v112Out: TaOPCImage;
    m2In: TaOPCImage;
    v785In: TaOPCImage;
    aOPCImage146: TaOPCImage;
    aOPCImage147: TaOPCImage;
    aOPCImage148: TaOPCImage;
    aOPCImage149: TaOPCImage;
    aOPCImage150: TaOPCImage;
    M7In: TaOPCImage;
    aOPCImage152: TaOPCImage;
    aOPCImage153: TaOPCImage;
    v750Out: TaOPCImage;
    m4: TaOPCGifImage;
    m2: TaOPCGifImage;
    v100: TaOPCImage;
    V666: TaOPCImage;
    v441: TaOPCImage;
    M9: TaOPCImage;
    M10: TaOPCImage;
    M3: TaOPCImage;
    m8: TaOPCImage;
    M6: TaOPCImage;
    v751: TaOPCImage;
    v785: TaOPCImage;
    v752: TaOPCImage;
    v673: TaOPCImage;
    v440: TaOPCImage;
    v750: TaOPCImage;
    v328: TaOPCImage;
    aOPCImage107: TaOPCImage;
    aOPCImage105: TaOPCImage;
    v663: TaOPCImage;
    v110: TaOPCImage;
    aOPCImage155: TaOPCImage;
    v103: TaOPCImage;
    aOPCImage157: TaOPCImage;
    v101: TaOPCImage;
    aOPCImage158: TaOPCImage;
    v123: TaOPCImage;
    aOPCImage159: TaOPCImage;
    v109: TaOPCImage;
    aOPCImage160: TaOPCImage;
    v669: TaOPCImage;
    aOPCImage161: TaOPCImage;
    v661: TaOPCImage;
    aOPCImage164: TaOPCImage;
    v327: TaOPCImage;
    aOPCImage165: TaOPCImage;
    v112: TaOPCImage;
    aOPCImage166: TaOPCImage;
    V106: TaOPCImage;
    v102: TaOPCImage;
    v104: TaOPCImage;
    v124: TaOPCImage;
    v674: TaOPCImage;
    v107: TaOPCImage;
    v668: TaOPCImage;
    v120: TaOPCImage;
    v201: TaOPCImage;
    aOPCImageListTO: TaOPCImageList;
    aOPCImage169: TaOPCImage;
    aOPCImage170: TaOPCImage;
    aOPCImage171: TaOPCImage;
    aOPCImage172: TaOPCImage;
    aOPCImage173: TaOPCImage;
    aOPCImage174: TaOPCImage;
    aOPCImage175: TaOPCImage;
    aOPCImage176: TaOPCImage;
    aOPCImage177: TaOPCImage;
    aOPCImage178: TaOPCImage;
    TO_Heating_Shell: TaOPCImage;
    aOPCImage179: TaOPCImage;
    aOPCImage180: TaOPCImage;
    aOPCImage181: TaOPCImage;
    aOPCImage182: TaOPCImage;
    Plate: TaOPCImage;
    m7: TaOPCGifImage;
    aOPCImage29: TaOPCImage;
    V104Out1: TaOPCImage;
    V752Out: TaOPCImage;
    Cross: TaOPCImage;
    v107Out: TaOPCImage;
    m7ToPlate: TaOPCImage;
    m4Out2: TaOPCImage;
    v123In: TaOPCImage;
    v124In: TaOPCImage;
    lLevelInD: TaOPCLabel;
    pX9: TaOPCProvider;
    pX1: TaOPCProvider;
    aOPCGauge1: TaOPCGauge;
    aOPCGauge2: TaOPCGauge;
    lBT: TaOPCLabel;
    lX2: TaOPCLabel;
    lX4: TaOPCLabel;
    lX3: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    aOPCLabel4: TaOPCLabel;
    pLT2: TaOPCProvider;
    pPT2: TaOPCProvider;
    procedure pLT2Change(Sender: TObject);
    procedure V666Change(Sender: TObject);
    procedure WaterChange(Sender: TObject);
    procedure m8Change(Sender: TObject);
    procedure v102In1Change(Sender: TObject);
    procedure v103Change(Sender: TObject);
    procedure v104Change(Sender: TObject);
    procedure V106MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure V106Change(Sender: TObject);
    procedure v100Change(Sender: TObject);
    procedure v101Change(Sender: TObject);
    procedure v101OutChange(Sender: TObject);
    procedure v120Change(Sender: TObject);
    procedure v785Change(Sender: TObject);
    procedure v751Change(Sender: TObject);
    procedure v441Change(Sender: TObject);
    procedure v440Change(Sender: TObject);
    procedure M9Change(Sender: TObject);
    procedure M10Change(Sender: TObject);
    procedure v750Change(Sender: TObject);
    procedure v752Change(Sender: TObject);
    procedure V752OutChange(Sender: TObject);
    procedure m2Change(Sender: TObject);
    procedure v109Change(Sender: TObject);
    procedure M3Change(Sender: TObject);
    procedure v112Change(Sender: TObject);
    procedure v107Change(Sender: TObject);
    procedure v107OutChange(Sender: TObject);
    procedure v110Change(Sender: TObject);
    procedure PlateChange(Sender: TObject);
    procedure v669Change(Sender: TObject);
    procedure m7Change(Sender: TObject);
    procedure M6Change(Sender: TObject);
    procedure v661Change(Sender: TObject);
    procedure v668Change(Sender: TObject);
    procedure v663Change(Sender: TObject);
    procedure M7OutChange(Sender: TObject);
    procedure m4Change(Sender: TObject);
    procedure v201Change(Sender: TObject);
    procedure m4OutChange(Sender: TObject);
    procedure v327Change(Sender: TObject);
    procedure v328Change(Sender: TObject);
    procedure aOPCImage111Change(Sender: TObject);
    procedure v123Change(Sender: TObject);
    procedure pX9Change(Sender: TObject);
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
    property Pin1:TaOPCImage read Out1 write Out1;
    property Pin2:TaOPCImage read In2 write In2;
  end;

var
  St1P1: TSt1P1;

implementation

uses StrUtils;

{$R *.dfm}

{ TSt1P1 }

constructor TSt1P1.Create(AOwner: TComponent);
begin
  inherited;
  Out1.SetSubComponent(true);
  In2.SetSubComponent(true);
  Product.Value := '2';
  Water.Value   := '3';
  Water1.Value  := '3';
  CoolWater.Value := '3';
  Par.Value     := '1';
end;

function TSt1P1.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=TaCustomMultiOPCSource(pX1.OPCSource);
end;

procedure TSt1P1.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;

  pX9.OPCSource := Value;
  pX1.OPCSource := Value;
  
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      if (TaCustomOPCDataObject(Components[i]).GraphicOPCSource = nil) and
        (TaCustomOPCDataObject(Components[i]).PhysID <> '') then
        TaCustomOPCDataObject(Components[i]).OPCSource := Value;
    end
//    else if (Components[i] is TaOPCLabel) then
//      TaOPCLabel(Components[i]).OPCSource := Value
//    else if (Components[i] is TaOPCGifAnimator) then
//      TaOPCGifAnimator(Components[i]).OPCSource := Value
    else if (Components[i] is TaOPCProvider) then
      TaOPCProvider(Components[i]).OPCSource := Value;
{
    else if (Components[i] is TaOPCLookupList) then
          begin
            if Value is TaOPCSource then
              TaOPCLookupList(Components[i]).OPCSource := TaOPCSource(Value);
          end
    else if (Components[i] is TaOPCGauge) then
      TaOPCGauge(Components[i]).OPCSource := Value;
}
  end;
end;

procedure TSt1P1.V666Change(Sender: TObject);
begin
  v666Out.Value := IfThen(V666.IsActive,v666In.Value,'0');
end;

procedure TSt1P1.WaterChange(Sender: TObject);
begin
  v673Out.Value := IfThen(V673.IsActive,Water.Value,'0');
end;

procedure TSt1P1.m8Change(Sender: TObject);
begin
  m8In1.Value := IfThen(m8.IsActive,m8In.Value,'0');
  m8Out.Value := IfThen(m8.IsActive,m8In.Value,'0');
end;

procedure TSt1P1.v102In1Change(Sender: TObject);
begin
  v102Out1.Value := IfThen(v102.IsActive,'0',v102In1.Value);
  v102Out2.Value := IfThen(not v102.IsActive,v102In2.Value,
    IfThen(v102In1.IsActive,v102In1.Value,v102In2.Value));
end;

procedure TSt1P1.v103Change(Sender: TObject);
begin
  v103Out.Value := IfThen(v103.IsActive,'0',v102Out1.Value);
end;

procedure TSt1P1.v104Change(Sender: TObject);
begin
  v104Out1.Value := IfThen(v104.IsActive,'0',v104In.Value);
  v104Out.Value := IfThen(v104.IsActive,v104In.Value,'0');

end;

procedure TSt1P1.V106MouseDown(Sender: TObject;
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

procedure TSt1P1.V106Change(Sender: TObject);
begin
  V106Out1.Value := IfThen(not V106.IsActive,V106In1.Value,
    IfThen(V106In2.IsActive,V106In2.Value,V106In1.Value));
  V106Out2.Value := IfThen(V106.IsActive,'0',V106In2.Value);
end;

procedure TSt1P1.v100Change(Sender: TObject);
begin
  V100Out1.Value := IfThen(V100.IsActive,Water1.Value,'0');
end;

procedure TSt1P1.v101Change(Sender: TObject);
begin
  V101Out.Value := IfThen(V101.IsActive,v100Out1.Value,'0');

end;

procedure TSt1P1.v101OutChange(Sender: TObject);
begin
  v102In2.Value := IfThen(v101Out.IsActive,v101Out.Value,V104Out1.Value);
end;

procedure TSt1P1.v120Change(Sender: TObject);
begin
  v120Out.Value := IfThen(v120.IsActive,'0',v120In.Value);
  v124In.Value := IfThen(v120.IsActive,v123Out.Value,'0');
end;

procedure TSt1P1.v785Change(Sender: TObject);
begin
  v785Out.Value := IfThen(v785.IsActive,v785In.Value,'0');
end;

procedure TSt1P1.v751Change(Sender: TObject);
begin
  v751Out.Value := IfThen(v751.IsActive,v751In.Value,'0');
end;

procedure TSt1P1.v441Change(Sender: TObject);
begin
  v441Out.Value := IfThen(v441.IsActive,Par.Value,'0');
end;

procedure TSt1P1.v440Change(Sender: TObject);
begin
  v440Out.Value := IfThen(v440.IsActive,v441Out.Value,'0');
end;

procedure TSt1P1.M9Change(Sender: TObject);
begin
  M9In.Value := IfThen(M9.IsActive,'1','0');
end;

procedure TSt1P1.M10Change(Sender: TObject);
begin
  M10Out.Value := IfThen(M10.IsActive,M10In.Value,'0');
end;

procedure TSt1P1.v750Change(Sender: TObject);
begin
  v750Out.Value := IfThen(v750.IsActive,v750In.Value,'0');
end;

procedure TSt1P1.v752Change(Sender: TObject);
begin
  v752Out.Value := IfThen(v752.IsActive,v750Out.Value,'0');

end;

procedure TSt1P1.V752OutChange(Sender: TObject);
begin
  Cross.Value := IfThen(V752Out.IsActive,V752Out.Value,V785Out2.Value);
end;

procedure TSt1P1.m2Change(Sender: TObject);
begin
  m2Out.Value := IfThen(m2.IsActive,m2In.Value,'0');
end;

procedure TSt1P1.v109Change(Sender: TObject);
begin
  v109Out.Value := IfThen(v109.IsActive,v109In.Value,'0');
end;

procedure TSt1P1.M3Change(Sender: TObject);
begin
  m3Out.Value := IfThen(m3.IsActive,v109Out.Value,'0');

end;

procedure TSt1P1.v112Change(Sender: TObject);
begin
  v112Out.Value := IfThen(v112.IsActive,v112In.Value,'0');

end;

procedure TSt1P1.v107Change(Sender: TObject);
begin
  V107Out.Value := IfThen(v107.IsActive,m3Out.Value,'0');
end;

procedure TSt1P1.v107OutChange(Sender: TObject);
begin
  PlateIn1.Value := IfThen(v107Out.IsActive,v107Out.Value,m2Out.Value);
end;

procedure TSt1P1.v110Change(Sender: TObject);
begin
  V110Out.Value := IfThen(v110.IsActive,'0',v110In.Value);
end;

procedure TSt1P1.PlateChange(Sender: TObject);
begin
  PlateOut1.Value := IfThen(Plate.IsActive,PlateIn1.Value,'0');
  PlateOut2.Value := IfThen(Plate.IsActive,PlateIn2.Value,PlateIn1.Value);
end;

procedure TSt1P1.v669Change(Sender: TObject);
begin
  v669Out.Value := IfThen(v669.IsActive,v669In.Value,'0');
end;

procedure TSt1P1.m7Change(Sender: TObject);
begin
  M7Out.Value := IfThen(m7.IsActive,m7In.Value,'0');
end;

procedure TSt1P1.M6Change(Sender: TObject);
begin
  M6Out.Value := IfThen(m6.IsActive,v669Out.Value,'0');
end;

procedure TSt1P1.v661Change(Sender: TObject);
begin
  v661Out.Value := IfThen(v661.IsActive,v661In.Value,'0');
end;

procedure TSt1P1.v668Change(Sender: TObject);
begin
  v668Out.Value := IfThen(v668.IsActive,m6Out.Value,'0');
end;

procedure TSt1P1.v663Change(Sender: TObject);
begin
  v663Out.Value := IfThen(v663.IsActive,'0',v663In.Value);
end;

procedure TSt1P1.M7OutChange(Sender: TObject);
begin
  m7ToPlate.Value := IfThen(M7Out.IsActive,M7Out.Value,v668Out.Value);
end;

procedure TSt1P1.m4Change(Sender: TObject);
begin
  m4Out.Value := IfThen(m4.IsActive,m4In.Value,'0');
end;

procedure TSt1P1.v201Change(Sender: TObject);
begin
  v201In.Value := IfThen(v201.IsActive,PlateOut2.Value,'0');
end;

procedure TSt1P1.m4OutChange(Sender: TObject);
begin
  m4Out2.Value := IfThen(m4Out.IsActive,m4Out.Value,v201Out.Value);
end;

procedure TSt1P1.v327Change(Sender: TObject);
begin
  v327Out.Value := IfThen(v327.IsActive,v327In.Value,'0');
end;

procedure TSt1P1.v328Change(Sender: TObject);
begin
  v328Out.Value := IfThen(v328.IsActive,'0',In2.Value);
end;

procedure TSt1P1.aOPCImage111Change(Sender: TObject);
begin
  v123In.Value := IfThen(v328Out.IsActive,v328Out.Value,v327Out.Value);
end;

procedure TSt1P1.v123Change(Sender: TObject);
begin
  v123Out.Value := IfThen(v123.IsActive,'0',v123In.Value);
end;

procedure TSt1P1.SetStep(const Value: integer);
begin
  FStep := Value;
  case FStep of
    1:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '1';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '1';
      v328.Value := '1';
      v441.Value := '0';
      v440.Value := '0';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '0';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '0';
      v674.Value := '1';
      v751.Value := '0';
      v752.Value := '0';
      v785.Value := '1';
      v750.Value := '0';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '0';
      m9.Value := '1';
      m10.Value := '0';

  //    v1300.Value := '1';
  //    v1100.Value := '1';
    end;
    2:
    begin
      v101.Value := '1';

      v100.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '0';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '1';
      v328.Value := '1';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '0';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '0';
      v674.Value := '1';
      v751.Value := '0';
      v752.Value := '0';
      v785.Value := '1';
      v750.Value := '0';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '0';
      m9.Value := '1';
      m10.Value := '0';

      v101.Value := '0';

    end;
    3:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '0';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '1';
      v328.Value := '1';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '0';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '0';
      v674.Value := '1';
      v751.Value := '0';
      v752.Value := '0';
      v785.Value := '1';
      v750.Value := '0';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '0';
      m9.Value := '1';
      m10.Value := '0';

      v101.Value := '0';

    end;
    4:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '0';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '1';
      v328.Value := '1';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1';

      v101.Value := '0';

    end;
    5:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '0';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1';
      v101.Value := '0';

    end;
    6:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '1';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '1';
      v328.Value := '1';
      v441.Value := '0';
      v440.Value := '0';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '0';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '1';
      v750.Value := '1';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '0';
      m9.Value := '1';
      m10.Value := '1';

    end;
    7:
    begin
      v100.Value := '0';
      v101.Value := '0';
      v102.Value := '1';
      v103.Value := '1';
      v104.Value := '1';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1'

    end;
    8:
    begin
      v100.Value := '0';
      v101.Value := '0';
      v102.Value := '1';
      v103.Value := '1';
      v104.Value := '1';
      V106.Value := '1';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '0;
  //    v1100.Value := '0;

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1'

    end;
    9:
    begin
      v100.Value := '1';
      v101.Value := '1';
      v102.Value := '0';
      v103.Value := '1';
      v104.Value := '1';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '0;
  //    v1100.Value := '0;

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1'

    end;
    10:
    begin
      v100.Value := '0';
      v101.Value := '0';
      v102.Value := '1';
      v103.Value := '1';
      v104.Value := '1';
      V106.Value := '1';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '1';
      v124.Value := '1';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '1';
      v440.Value := '1';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '1';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '1';
      v674.Value := '1';
      v751.Value := '1';
      v752.Value := '1';
      v785.Value := '0';
      v750.Value := '1';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '1';
      m3.Value := '0';
      m4.Value := '1';
      M6.Value := '0';
      m7.Value := '1';
      m8.Value := '1';
      m9.Value := '1';
      m10.Value := '1'

    end
    else
    begin
      v100.Value := '0';
      v101.Value := '0';
      v102.Value := '0';
      v103.Value := '0';
      v104.Value := '0';
      V106.Value := '0';
      v107.Value := '0';
      v109.Value := '0';
      v110.Value := '0';
      v123.Value := '0';
      v112.Value := '0';
      v120.Value := '0';
      v124.Value := '0';
      v201.Value := '0';
      v327.Value := '0';
      v328.Value := '0';
      v441.Value := '0';
      v440.Value := '0';
      v661.Value := '0';
      v663.Value := '0';
      V666.Value := '0';
      v668.Value := '0';
      v669.Value := '0';
      v673.Value := '0';
      v674.Value := '0';
      v751.Value := '0';
      v752.Value := '0';
      v785.Value := '0';
      v750.Value := '0';
  //    v1300.Value := '1';
  //    v1100.Value := '1';

      m2.Value := '0';
      m3.Value := '0';
      m4.Value := '0';
      M6.Value := '0';
      m7.Value := '0';
      m8.Value := '0';
      m9.Value := '0';
      m10.Value := '0';
    end;
  end;
end;

procedure TSt1P1.pLT2Change(Sender: TObject);
var
  aLT2,aPT2:Extended;
begin
  aLT2 := StrToFloatDef(pLT2.Value,0);
  aPT2 := StrToFloatDef(pPT2.Value,0);
  lLevelInD.Value := FloatToStr((aLT2-aPT2)*10);
end;

procedure TSt1P1.pX9Change(Sender: TObject);
begin
  lLevelInD.Value := IntToStr(
    StrToIntDef(pX9.Value,0)-StrToIntDef(pX1.Value,0));
end;

end.
