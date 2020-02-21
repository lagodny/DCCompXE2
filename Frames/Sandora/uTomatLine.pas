unit uTomatLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCGifImage, aOPCDataObject,
  aOPCImage, aOPCImageList, aCustomOPCSource, aOPCProvider,
  StrUtils, aOPCLabel, StdCtrls, aOPCGauge, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  TTomatLine = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    aOPCImage1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    Apple2: TaOPCImage;
    Tomato1: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage12: TaOPCImage;
    P111Out: TaOPCImage;
    P111In: TaOPCImage;
    aOPCImage16: TaOPCImage;
    P131Out: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    P31Out: TaOPCImage;
    _Out1: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage26: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    Apple1: TaOPCImage;
    Tomato2: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    P131: TaOPCGifImage;
    P31: TaOPCGifImage;
    aOPCImage5: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    M114Out: TaOPCImage;
    P111: TaOPCImage;
    M114: TaOPCImage;
    MR11In: TaOPCImage;
    MR101: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage5: TaOPCGifImage;
    aOPCGifImage6: TaOPCGifImage;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCImage13: TaOPCImage;
    aOPCImage144: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage17: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    P131In: TaOPCImage;
    aOPCImage29: TaOPCImage;
    P31In: TaOPCImage;
    MR113: TaOPCImage;
    aOPCGifImage9: TaOPCGifImage;
    MR11: TaOPCGifImage;
    MR112: TaOPCGifImage;
    aOPCGifImage11: TaOPCGifImage;
    aOPCGifImage12: TaOPCGifImage;
    aOPCGifImage1: TaOPCGifImage;
    Cicle_Tomato: TaOPCProvider;
    PlataA0: TaOPCImage;
    HotBreakCip: TaOPCProvider;
    _P181: TaOPCProvider;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    M21: TaOPCGifImage;
    LT134: TaOPCGauge;
    LT34: TaOPCGauge;
    aOPCLabel6: TaOPCLabel;
    Label1: TLabel;
    aOPCLabel7: TaOPCLabel;
    Label2: TLabel;
    gbMOde: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage10: TaOPCGifImage;
    aOPCGifImage13: TaOPCGifImage;
    aOPCGifImage14: TaOPCGifImage;
    aOPCGifImage15: TaOPCGifImage;
    aOPCGifImage16: TaOPCGifImage;
    aOPCGifImage17: TaOPCGifImage;
    aOPCGifImage18: TaOPCGifImage;
    aOPCGifImage19: TaOPCGifImage;
    aOPCGifImage20: TaOPCGifImage;
    aOPCGifImage21: TaOPCGifImage;
    aOPCGifImage22: TaOPCGifImage;
    aOPCGifImage23: TaOPCGifImage;
    aOPCGifImage24: TaOPCGifImage;
    aOPCGifImage25: TaOPCGifImage;
    aOPCGifImage26: TaOPCGifImage;
    aOPCGifImage27: TaOPCGifImage;
    aOPCGifImage28: TaOPCGifImage;
    aOPCGifImage29: TaOPCGifImage;
    aOPCGifImage30: TaOPCGifImage;
    gLT102: TaOPCGauge;
    LT102: TaOPCLabel;
    procedure LT102Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure P31Change(Sender: TObject);
    procedure P131Change(Sender: TObject);
    procedure PlataA0Change(Sender: TObject);
    procedure HotBreakCipChange(Sender: TObject);
    procedure Cicle_TomatoChange(Sender: TObject);
    procedure _Out1Change(Sender: TObject);
    procedure P31OutChange(Sender: TObject);
    procedure P111Change(Sender: TObject);
    procedure M114MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnOut1Chang: TValueChange;
    function GetP181: string;
    procedure SetP181(const Value: string);
  protected
    procedure SetAllowClick(const Value: boolean);override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
  published
    property P181:string read GetP181 write SetP181;
    property OnOut1Chang:TValueChange read FOnOut1Chang write FOnOut1Chang;
 end;

var
  TomatLine: TTomatLine;

implementation

{$R *.dfm}

procedure TTomatLine.CheckBox1Click(Sender: TObject);
begin
  Cicle_Tomato.Value := IfThen(CheckBox1.Checked,'1','0')
end;

procedure TTomatLine.CheckBox2Click(Sender: TObject);
begin
  HotBreakCip.Value := IfThen(CheckBox2.Checked,'1','0')
end;

procedure TTomatLine.Cicle_TomatoChange(Sender: TObject);
begin
  Tomato1.Visible := (Cicle_Tomato.Value = '1');
  Tomato2.Visible := Tomato1.Visible;
  Apple1.Visible := not Tomato1.Visible;
  Apple2.Visible := not Tomato1.Visible;

  if (Cicle_Tomato.Value = '1') then
  begin
    P131In.Value := PlataA0.Value;
    P31In.Value := '0';
  end
  else
  begin
    P31In.Value := PlataA0.Value;
    P131In.Value := '0';
  end
end;

function TTomatLine.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(M114.OPCSource);
end;

function TTomatLine.GetP181: string;
begin
  Result := _P181.Value;
end;

procedure TTomatLine.HotBreakCipChange(Sender: TObject);
begin
  if (HotBreakCip.Value = '1') and (_P181.Value = '1') then
    PlataA0.Value :='4'
  else
    PlataA0.Value :='0';

  if P131.IsActive then
  begin
    if HotBreakCip.Value = '1' then
      P131Out.Value := '4'
    else
      P131Out.Value := '2';
  end
  else
    P131Out.Value := '0';

  if P31.IsActive then
  begin
    if HotBreakCip.Value = '1' then
      P31Out.Value := '4'
    else
      P31Out.Value := '2';
  end
  else
    P31Out.Value := '0';

end;

procedure TTomatLine.LT102Change(Sender: TObject);
begin
  gLT102.Value := IntToStr(1000-StrToIntDef(LT102.Value,0));
end;

procedure TTomatLine.M114MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TaOPCImage then
  begin
    if AllowClick then
    begin
      if Button = mbLeft then
        (Sender as TaOPCImage).Value := '1'
      else
        (Sender as TaOPCImage).Value := '0';
    end;
  end;
end;

procedure TTomatLine.P111Change(Sender: TObject);
begin
  P111In.Value := IfThen(P111.IsActive,'3','0')
end;

procedure TTomatLine.P131Change(Sender: TObject);
begin
  HotBreakCipChange(Self);
end;

procedure TTomatLine.P31Change(Sender: TObject);
begin
  HotBreakCipChange(Self);
end;

procedure TTomatLine.P31OutChange(Sender: TObject);
begin
  _Out1.Value := IfThen(P31Out.IsActive,P31Out.Value,P131Out.Value);  
end;

procedure TTomatLine.PlataA0Change(Sender: TObject);
begin
  Cicle_TomatoChange(self);
end;

procedure TTomatLine.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
  gbMode.Visible := AllowClick;
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject) then
    begin
      aObject := TaCustomOPCDataObject(Components[i]);
      if AllowClick then
      begin
        if Assigned(aObject.OnMouseDown) then
          aObject.Cursor := crHandPoint;
      end
      else
        aObject.Cursor := crDefault;
    end;
  end;
end;

procedure TTomatLine.SetOPCSource(const Value: TaCustomMultiOPCSource);
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
    else
    begin
      if (Components[i] is TaOPCProvider) then
      begin
        if (TaOPCProvider(Components[i]).PhysID <> '') then
          TaOPCProvider(Components[i]).OPCSource := Value;
      end;
    end;
  end;
end;

procedure TTomatLine.SetP181(const Value: string);
begin
  _P181.Value := Value;
end;

procedure TTomatLine._Out1Change(Sender: TObject);
begin
  if Assigned(OnOut1Chang) then
    OnOut1Chang(_Out1.Value);
end;

end.
