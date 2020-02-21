unit uPulpP2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, aOPCDataObject, aOPCImage, ExtCtrls, aOPCImageList,
  aOPCGauge, aOPCGifImage, StdCtrls, aCustomOPCSource, aOPCProvider, StrUtils,
  aOPCLabel, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  TPulpP2 = class(TaOPCFrame)
    OPCImageListPipe: TaOPCImageList;
    Image1: TImage;
    aOPCImage14: TaOPCImage;
    Cip: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    Cip1: TaOPCImage;
    Cip11: TaOPCImage;
    Cip12: TaOPCImage;
    V263In: TaOPCImage;
    V263Out: TaOPCImage;
    PR240Out: TaOPCImage;
    _in1: TaOPCImage;
    aOPCImage12: TaOPCImage;
    _in2: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage16: TaOPCImage;
    PR210Out: TaOPCImage;
    P232In: TaOPCImage;
    P261In: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    P262Out: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage28: TaOPCImage;
    PlataB4: TaOPCImage;
    PlataB3: TaOPCImage;
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
    aOPCImage43: TaOPCImage;
    aOPCImage44: TaOPCImage;
    aOPCImage45: TaOPCImage;
    aOPCImage46: TaOPCImage;
    aOPCImage47: TaOPCImage;
    aOPCImage48: TaOPCImage;
    aOPCImage50: TaOPCImage;
    aOPCImage51: TaOPCImage;
    PlataB1: TaOPCImage;
    PlataB2: TaOPCImage;
    PlataB5: TaOPCImage;
    PlataB6: TaOPCImage;
    PlataB7: TaOPCImage;
    PlataB8: TaOPCImage;
    aOPCImage58: TaOPCImage;
    aOPCImage59: TaOPCImage;
    aOPCImage60: TaOPCImage;
    aOPCImage61: TaOPCImage;
    aOPCImage62: TaOPCImage;
    aOPCImage63: TaOPCImage;
    PlataB9: TaOPCImage;
    aOPCImage65: TaOPCImage;
    _in3: TaOPCImage;
    _In4: TaOPCImage;
    V233Out: TaOPCImage;
    v233In: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    p262: TaOPCGifImage;
    p232: TaOPCGifImage;
    PT261: TaOPCGauge;
    PT231: TaOPCGauge;
    aOPCGauge3: TaOPCGauge;
    aOPCGauge4: TaOPCGauge;
    aOPCGauge5: TaOPCGauge;
    aOPCImageListBat: TaOPCImageList;
    V263: TaOPCImage;
    V233: TaOPCImage;
    Cip21: TaOPCImage;
    Cip22: TaOPCImage;
    aOPCImageListPlataB: TaOPCImageList;
    PlataB_1: TaOPCImage;
    PR240_1: TaOPCGifImage;
    PR240_2: TaOPCGifImage;
    PR210_1: TaOPCGifImage;
    PR210_2: TaOPCGifImage;
    PlataB_2: TaOPCImage;
    PlataB_3: TaOPCImage;
    PlataB_4: TaOPCImage;
    CipStart1: TaOPCProvider;
    ModeCip1: TaOPCProvider;
    ModeCip2: TaOPCProvider;
    cipStart2: TaOPCProvider;
    gbPlataB: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    gbCip1: TGroupBox;
    cbCip1: TCheckBox;
    cbCipStart1: TCheckBox;
    gbCip2: TGroupBox;
    cbCip2: TCheckBox;
    cbCipStart2: TCheckBox;
    pPlataB1: TaOPCProvider;
    pPlataB2: TaOPCProvider;
    pPR240_1: TaOPCProvider;
    pPR240_1k: TaOPCProvider;
    pPR240_2k: TaOPCProvider;
    pPR240_2: TaOPCProvider;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    Label1: TLabel;
    aOPCLabel2: TaOPCLabel;
    Label2: TLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    aOPCLabel6: TaOPCLabel;
    aOPCImageListSignal: TaOPCImageList;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage1: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    aOPCGifImage5: TaOPCGifImage;
    aOPCGifImage6: TaOPCGifImage;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCGifImage9: TaOPCGifImage;
    aOPCGifImage10: TaOPCGifImage;
    aOPCGifImage11: TaOPCGifImage;
    aOPCGifImage12: TaOPCGifImage;
    aOPCGifImage13: TaOPCGifImage;
    aOPCGifImage14: TaOPCGifImage;
    aOPCImageListPipe1: TaOPCImageList;
    aOPCImage131: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage10: TaOPCImage;
    P232Out: TaOPCImage;
    pPR210_1: TaOPCProvider;
    pPR210_1k: TaOPCProvider;
    pPR210_2: TaOPCProvider;
    pPR210_2k: TaOPCProvider;
    procedure pPR210_1Change(Sender: TObject);
    procedure pPR210_2Change(Sender: TObject);
    procedure pPR240_2Change(Sender: TObject);
    procedure pPR240_1kChange(Sender: TObject);
    procedure pPlataB2Change(Sender: TObject);
    procedure PlataB6Change(Sender: TObject);
    procedure PlataB5Change(Sender: TObject);
    procedure V263Change(Sender: TObject);
    procedure V233Change(Sender: TObject);
    procedure cbCipStart2Click(Sender: TObject);
    procedure cbCipStart1Click(Sender: TObject);
    procedure cbCip2Click(Sender: TObject);
    procedure cbCip1Click(Sender: TObject);
    procedure ModeCip2Change(Sender: TObject);
    procedure _in1Change(Sender: TObject);
    procedure _in2Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PlataB4Change(Sender: TObject);
    procedure aOPCImage73MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnOut6Chang: TValueChange;
    FOnOut5Chang: TValueChange;
    function GetIn1: string;
    function GetIn2: string;
    function GetIn3: string;
    function GetIn4: string;
    procedure SetIn1(const Value: string);
    procedure SetIn2(const Value: string);
    procedure SetIn3(const Value: string);
    procedure SetIn4(const Value: string);
    { Private declarations }
  protected
    procedure SetAllowClick(const Value: boolean);override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    { Public declarations }
  published
    property In1:string read GetIn1 write SetIn1;
    property In2:string read GetIn2 write SetIn2;
    property In3:string read GetIn3 write SetIn3;
    property In4:string read GetIn4 write SetIn4;

    property OnOut5Chang:TValueChange read FOnOut5Chang write FOnOut5Chang;
    property OnOut6Chang:TValueChange read FOnOut6Chang write FOnOut6Chang;
  end;

var
  PulpP2: TPulpP2;

implementation

{$R *.dfm}

procedure TPulpP2.aOPCImage73MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TPulpP2.V233Change(Sender: TObject);
begin
  V233Out.Value := IfThen(V233.IsActive, v233In.Value, '0');
end;

procedure TPulpP2.V263Change(Sender: TObject);
begin
  V263Out.Value := IfThen(V263.IsActive, v263In.Value, '0');

end;

procedure TPulpP2.cbCip1Click(Sender: TObject);
begin
  if cbCip1.Checked then
    ModeCip1.Value := '1'
  else
  begin
    ModeCip1.Value := '0';
    cbCipStart1.Checked := false;
    cbCipStart1Click(self);
  end;
end;

procedure TPulpP2.cbCip2Click(Sender: TObject);
begin
  if cbCip2.Checked then
    ModeCip2.Value := '1'
  else
  begin
    ModeCip2.Value := '0';
    cbCipStart2.Checked := false;
    cbCipStart2Click(self);
  end;
end;

procedure TPulpP2.cbCipStart1Click(Sender: TObject);
begin
  if cbCipStart1.Checked then
  begin
    CipStart1.Value := '1';
    if cbCipStart2.Checked then
    begin
      cbCipStart2.Checked := false;
      cbCipStart2Click(self);
    end;
  end
  else
  begin
    CipStart1.Value := '0';
    if cbCip1.Checked then
    begin
      cbCip1.Checked := false;
      cbCip1Click(self);
    end;
  end;
end;

procedure TPulpP2.cbCipStart2Click(Sender: TObject);
begin
  if cbCipStart2.Checked then
  begin
    CipStart2.Value := '1';
    if cbCipStart1.Checked then
    begin
      cbCipStart1.Checked := false;
      cbCipStart1Click(self);
    end;
  end
  else
  begin
    if cbCip2.Checked then
    begin
      CipStart2.Value := '0';
      cbCip2.Checked := false;
      cbCip2Click(self);
    end;
  end;
end;

procedure TPulpP2.ComboBox1Change(Sender: TObject);
begin
  PlataB_1.Value := IntToStr(ComboBox1.ItemIndex)
end;

procedure TPulpP2.ComboBox2Change(Sender: TObject);
begin
  PlataB_2.Value := IntToStr(ComboBox2.ItemIndex)
end;

procedure TPulpP2.ComboBox3Change(Sender: TObject);
begin
  PlataB_3.Value := IntToStr(ComboBox3.ItemIndex)
end;

procedure TPulpP2.ComboBox4Change(Sender: TObject);
begin
  PlataB_4.Value := IntToStr(ComboBox4.ItemIndex)
end;

function TPulpP2.GetIn1: string;
begin
  Result := _in1.Value;
end;

function TPulpP2.GetIn2: string;
begin
  Result := _in2.Value;
end;

function TPulpP2.GetIn3: string;
begin
  Result := _in3.Value;
end;

function TPulpP2.GetIn4: string;
begin
  Result := _in4.Value;
end;

function TPulpP2.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(ModeCip1.OPCSource);
end;

procedure TPulpP2._in1Change(Sender: TObject);
begin
  if _In1.IsActive and (PR240_1.value = '1') and (PR240_2.value = '1') then
    PR240Out.Value := _In1.Value
  else
    PR240Out.Value := '0';
end;

procedure TPulpP2._in2Change(Sender: TObject);
begin
  if _In2.IsActive and (PR210_1.value = '1') and (PR210_2.value = '1') then
    PR210Out.Value := _In2.Value
  else
    PR210Out.Value := '0';
end;

procedure TPulpP2.ModeCip2Change(Sender: TObject);
begin
  if ModeCip1.Value='1' then
  begin
    Cip11.Visible := true;
    Cip12.Visible := true;
    P262Out.Value := IfThen(p262.IsActive, '4', '0');
  end
  else
  begin
    Cip11.Visible := false;
    Cip12.Visible := false;
    P262Out.Value := IfThen(p262.IsActive, '2', '0');
  end;
  if ModeCip2.Value='1' then
  begin
    Cip21.Visible := true;
    Cip22.Visible := true;
    P232Out.Value := IfThen(p232.IsActive, '4', '0');
  end
  else
  begin
    Cip21.Visible := false;
    Cip22.Visible := false;
    P232Out.Value := IfThen(p232.IsActive, '2', '0');
  end;
  Cip1.Visible := Cip21.Visible or Cip11.Visible;

  if (CipStart1.Value = '1') or (cipStart2.Value = '1') then
  begin
    Cip.Value := '4';
    if CipStart1.Value = '1' then
    begin
      Cip21.Visible := false;
      Cip22.Visible := false;
    end
    else
    begin
      Cip11.Visible := false;
      Cip12.Visible := false;
    end;
  end
  else
    Cip.Value := '0';

  if cip12.Visible then
    V263In.Value := Cip12.Value
  else
    V263In.Value := '0';

  if cip22.Visible then
    V233In.Value := Cip22.Value
  else
    V233In.Value := '0';

end;

procedure TPulpP2.PlataB4Change(Sender: TObject);
var
  s:string;
  v:integer;
begin
  v := StrToIntDef(PlataB_1.Value,-1);
  case v of
    0:
    begin
      PlataB5.Value := PlataB1.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataB6.Value := PlataB1.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataB7.Value := PlataB1.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataB8.Value := PlataB1.Value;
      s:=s+'8';
    end;
    4:
    begin
      PlataB9.Value := PlataB1.Value;
      s:=s+'9';
    end;
  end;

  v := StrToIntDef(PlataB_2.Value,-1);
  case v of
    0:
    begin
      PlataB5.Value := PlataB2.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataB6.Value := PlataB2.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataB7.Value := PlataB2.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataB8.Value := PlataB2.Value;
      s:=s+'8';
    end;
    4:
    begin
      PlataB9.Value := PlataB2.Value;
      s:=s+'9';
    end;
  end;

  v := StrToIntDef(PlataB_3.Value,-1);
  case v of
    0:
    begin
      PlataB5.Value := PlataB3.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataB6.Value := PlataB3.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataB7.Value := PlataB3.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataB8.Value := PlataB3.Value;
      s:=s+'8';
    end;
    4:
    begin
      PlataB9.Value := PlataB3.Value;
      s:=s+'9';
    end;
  end;

  v := StrToIntDef(PlataB_4.Value,-1);
  case v of
    0:
    begin
      PlataB5.Value := PlataB4.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataB6.Value := PlataB4.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataB7.Value := PlataB4.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataB8.Value := PlataB4.Value;
      s:=s+'8';
    end;
    4:
    begin
      PlataB9.Value := PlataB4.Value;
      s:=s+'9';
    end;
  end;

  if pos('5',s)=0 then
    PlataB5.Value := '0';
  if pos('6',s)=0 then
    PlataB6.Value := '0';
  if pos('7',s)=0 then
    PlataB7.Value := '0';
  if pos('8',s)=0 then
    PlataB8.Value := '0';
  if pos('9',s)=0 then
    PlataB9.Value := '0';
end;

procedure TPulpP2.PlataB5Change(Sender: TObject);
begin
  if Assigned(OnOut5Chang) then
    OnOut5Chang(PlataB5.Value)
end;

procedure TPulpP2.PlataB6Change(Sender: TObject);
begin
  if Assigned(OnOut6Chang) then
    OnOut6Chang(PlataB6.Value)
end;

procedure TPulpP2.pPlataB2Change(Sender: TObject);
var
  v:integer;
  CaseVar:integer;
begin
  v := StrToIntDef(pPlataB1.Value,0);

  CaseVar := v and $1F;
  case CaseVar of
    1:PlataB_1.Value := '0';
    2:PlataB_1.Value := '1';
    4:PlataB_1.Value := '2';
    8:PlataB_1.Value := '3';
    16:PlataB_1.Value := '4';
    else PlataB_1.Value := '';
  end;

  CaseVar := (v  shr 5) and $1F;
  case CaseVar of
    1:PlataB_2.Value := '0';
    2:PlataB_2.Value := '1';
    4:PlataB_2.Value := '2';
    8:PlataB_2.Value := '3';
    16:PlataB_2.Value := '4';
    else PlataB_2.Value := '';
  end;

  CaseVar := (v  shr 10) and $1F;
  case CaseVar of
    1:PlataB_3.Value := '0';
    2:PlataB_3.Value := '1';
    4:PlataB_3.Value := '2';
    8:PlataB_3.Value := '3';
    16:PlataB_3.Value := '4';
    else PlataB_3.Value := '';
  end;

  v := StrToIntDef(pPlataB2.Value,0);
  CaseVar := v and $1F;
  case CaseVar of
    1:PlataB_4.Value := '0';
    2:PlataB_4.Value := '1';
    4:PlataB_4.Value := '2';
    8:PlataB_4.Value := '3';
    16:PlataB_4.Value := '4';
    else PlataB_4.Value := '';

  end;
end;

procedure TPulpP2.pPR210_1Change(Sender: TObject);
begin
  PR210_1.Value := IfThen(pPR210_1k.Value = '0','2',pPR210_1.Value);
end;

procedure TPulpP2.pPR210_2Change(Sender: TObject);
begin
  PR210_2.Value := IfThen(pPR210_2k.Value = '0','2',pPR210_2.Value);
end;

procedure TPulpP2.pPR240_1kChange(Sender: TObject);
begin
  PR240_1.Value := IfThen(pPR240_1k.Value = '0','2',pPR240_1.Value);
end;

procedure TPulpP2.pPR240_2Change(Sender: TObject);
begin
  PR240_2.Value := IfThen(pPR240_2k.Value = '0','2',pPR240_2.Value);
end;

procedure TPulpP2.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
  gbPlataB.Visible := AllowClick;
  gbCip1.Visible := AllowClick;
  gbCip2.Visible := AllowClick;
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

procedure TPulpP2.SetIn1(const Value: string);
begin
  _in1.Value := Value;
end;

procedure TPulpP2.SetIn2(const Value: string);
begin
  _in2.Value := Value;
end;

procedure TPulpP2.SetIn3(const Value: string);
begin
  _in3.Value := Value;
end;

procedure TPulpP2.SetIn4(const Value: string);
begin
  _In4.Value := Value;
end;

procedure TPulpP2.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;
  {
  ModeCip1.OPCSource   := Value;
  CipStart1.OPCSource  := Value;

  ModeCip2.OPCSource   := Value;
  CipStart2.OPCSource  := Value;
  }
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

end.
