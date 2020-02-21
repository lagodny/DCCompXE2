unit uPulpP3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCDataObject, aOPCImage, aOPCImageList,
  aOPCGifImage, StdCtrls, StrUtils, aCustomOPCSource, aOPCProvider, aOPCLabel,
  GIFImage, aOPCGauge;

type
  TPulpP3 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    aOPCImage14: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    P462Out: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage12: TaOPCImage;
    P312Out: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage16: TaOPCImage;
    aOPCImage17: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    Cool: TaOPCImage;
    Ret1: TaOPCImage;
    aOPCImage27: TaOPCImage;
    V329Out: TaOPCImage;
    V329In: TaOPCImage;
    V479In: TaOPCImage;
    V328In: TaOPCImage;
    V478In: TaOPCImage;
    V479Out: TaOPCImage;
    V478Out: TaOPCImage;
    V328Out: TaOPCImage;
    VP471Out: TaOPCImage;
    aOPCImage38: TaOPCImage;
    aOPCImage39: TaOPCImage;
    _In6: TaOPCImage;
    P473Out: TaOPCImage;
    P323Out: TaOPCImage;
    VP321Out: TaOPCImage;
    _In5: TaOPCImage;
    V316In: TaOPCImage;
    V316Out: TaOPCImage;
    aOPCImage47: TaOPCImage;
    Plata3B: TaOPCImage;
    Plata3C: TaOPCImage;
    Plata3D: TaOPCImage;
    Plata3E: TaOPCImage;
    Plata3F: TaOPCImage;
    Plata3G: TaOPCImage;
    aOPCImage54: TaOPCImage;
    aOPCImage55: TaOPCImage;
    V466Out: TaOPCImage;
    V466IN: TaOPCImage;
    aOPCImage58: TaOPCImage;
    aOPCImage59: TaOPCImage;
    aOPCImage60: TaOPCImage;
    aOPCImage61: TaOPCImage;
    aOPCImage62: TaOPCImage;
    Ret2: TaOPCImage;
    aOPCImage64: TaOPCImage;
    aOPCImage65: TaOPCImage;
    aOPCImage66: TaOPCImage;
    aOPCImage67: TaOPCImage;
    Cip: TaOPCImage;
    aOPCImage69: TaOPCImage;
    aOPCImage70: TaOPCImage;
    aOPCImage71: TaOPCImage;
    aOPCImage72: TaOPCImage;
    aOPCImage73: TaOPCImage;
    P323In: TaOPCImage;
    aOPCImage76: TaOPCImage;
    Plata3Y: TaOPCImage;
    aOPCImage78: TaOPCImage;
    aOPCImage79: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    P473: TaOPCGifImage;
    P323: TaOPCGifImage;
    OPCImageListGif: TaOPCImageList;
    aOPCImage80: TaOPCImage;
    aOPCImage81: TaOPCImage;
    aOPCImage82: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    VP321: TaOPCImage;
    Vp471: TaOPCImage;
    V328: TaOPCImage;
    V478: TaOPCImage;
    V466: TaOPCImage;
    V316: TaOPCImage;
    P462: TaOPCImage;
    P312: TaOPCImage;
    V329: TaOPCImage;
    V479: TaOPCImage;
    aOPCImageListPlata3: TaOPCImageList;
    Plata3_1: TaOPCImage;
    Plata3_2: TaOPCImage;
    CipStart1: TaOPCProvider;
    cipStart2: TaOPCProvider;
    aOPCImage3: TaOPCImage;
    aOPCImage2: TaOPCImage;
    Ret: TaOPCImage;
    gbPlata3: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    gbCip: TGroupBox;
    cbCipStart2: TCheckBox;
    cbCipStart1: TCheckBox;
    pPlata3: TaOPCProvider;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    LT320: TaOPCGauge;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCImageListSignal: TaOPCImageList;
    aOPCGifImage10: TaOPCGifImage;
    aOPCGifImage1: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage5: TaOPCGifImage;
    aOPCGifImage6: TaOPCGifImage;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCGifImage9: TaOPCGifImage;
    aOPCGifImage11: TaOPCGifImage;
    aOPCGifImage12: TaOPCGifImage;
    aOPCGifImage13: TaOPCGifImage;
    aOPCGifImage14: TaOPCGifImage;
    procedure pPlata3Change(Sender: TObject);
    procedure Ret1Change(Sender: TObject);
    procedure cbCipStart2Click(Sender: TObject);
    procedure cbCipStart1Click(Sender: TObject);
    procedure CipStart1Change(Sender: TObject);
    procedure P462Change(Sender: TObject);
    procedure P312Change(Sender: TObject);
    procedure V316InChange(Sender: TObject);
    procedure V466INChange(Sender: TObject);
    procedure V479InChange(Sender: TObject);
    procedure V329Change(Sender: TObject);
    procedure V328InChange(Sender: TObject);
    procedure V478Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Plata3_2Change(Sender: TObject);
    procedure P312MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    function GetIn5: string;
    function GetIn6: string;
    procedure SetIn5(const Value: string);
    procedure SetIn6(const Value: string);
    { Private declarations }
  protected
    procedure SetAllowClick(const Value: boolean);override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;

  public
    { Public declarations }
  published
    property In5:string read GetIn5 write SetIn5;
    property In6:string read GetIn6 write SetIn6;
  end;

var
  PulpP3: TPulpP3;

implementation

{$R *.dfm}

procedure TPulpP3.P312Change(Sender: TObject);
begin
  P312Out.Value := IfThen(P312.IsActive,'1','0')
end;

procedure TPulpP3.P312MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TPulpP3.P462Change(Sender: TObject);
begin
  P462Out.Value := IfThen(P462.IsActive,'1','0')
end;

procedure TPulpP3.Ret1Change(Sender: TObject);
begin
  if Ret1.IsActive or Ret2.IsActive then
    Ret.Value := '3'
  else
    Ret.Value := '0';

end;

procedure TPulpP3.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
  gbPlata3.Visible := AllowClick;
  gbCip.Visible := AllowClick;

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

procedure TPulpP3.SetIn5(const Value: string);
begin
  _In5.Value := Value;
end;

procedure TPulpP3.SetIn6(const Value: string);
begin
  _In6.Value := Value;
end;

procedure TPulpP3.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;
  {
  CipStart1.OPCSource  := Value;
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

procedure TPulpP3.cbCipStart1Click(Sender: TObject);
begin
  if cbCipStart1.Checked then
  begin
    CipStart1.Value := '1';
    cbCipStart2.Checked := false;
    cbCipStart2Click(self);
  end
  else
    cipStart1.Value := '0';
end;

procedure TPulpP3.cbCipStart2Click(Sender: TObject);
begin
  if cbCipStart2.Checked then
  begin
    CipStart2.Value := '1';
    cbCipStart1.Checked := false;
    cbCipStart1Click(self);
  end
  else
    cipStart2.Value := '0';
end;

procedure TPulpP3.CipStart1Change(Sender: TObject);
begin
  if (CipStart1.Value = '1') or (cipStart2.Value = '1') then
    Cip.Value := '4'
  else
    Cip.Value := '0';

  if P473.IsActive then
  begin
    if cipStart2.Value = '1' then
      P473Out.Value := '4'
    else
      P473Out.Value := '2';
  end
  else
    P473Out.Value := '0';

  if P323.IsActive then
  begin
    if cipStart1.Value = '1' then
      P323Out.Value := '4'
    else
      P323Out.Value := '2';
  end
  else
    P323Out.Value := '0';

end;

procedure TPulpP3.ComboBox1Change(Sender: TObject);
begin
  Plata3_1.Value := IntToStr(ComboBox1.ItemIndex)
end;

procedure TPulpP3.ComboBox2Change(Sender: TObject);
begin
  Plata3_2.Value := IntToStr(ComboBox2.ItemIndex)
end;

function TPulpP3.GetIn5: string;
begin
  Result := _In5.Value;
end;

function TPulpP3.GetIn6: string;
begin
  Result := _In6.Value;
end;

function TPulpP3.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(CipStart1.OPCSource);
end;

procedure TPulpP3.Plata3_2Change(Sender: TObject);
var
  s:string;
  v:integer;
begin
  v := StrToIntDef(Plata3_1.Value,-1);
  case v of
    0:
    begin
      Plata3D.Value := Plata3B.Value;
      s:=s+'D';
    end;
    1:
    begin
      Plata3E.Value := Plata3B.Value;
      s:=s+'E';
    end;
    2:
    begin
      Plata3F.Value := Plata3B.Value;
      s:=s+'F';
    end;
    3:
    begin
      Plata3G.Value := Plata3B.Value;
      s:=s+'G';
    end;
    4:
    begin
      Plata3Y.Value := Plata3B.Value;
      s:=s+'Y';
    end;
  end;

  v := StrToIntDef(Plata3_2.Value,-1);
  case v of
    0:
    begin
      Plata3D.Value := Plata3C.Value;
      s:=s+'D';
    end;
    1:
    begin
      Plata3E.Value := Plata3C.Value;
      s:=s+'E';
    end;
    2:
    begin
      Plata3F.Value := Plata3C.Value;
      s:=s+'F';
    end;
    3:
    begin
      Plata3G.Value := Plata3C.Value;
      s:=s+'G';
    end;
    4:
    begin
      Plata3Y.Value := Plata3C.Value;
      s:=s+'Y';
    end;
  end;


  if pos('D',s)=0 then
    Plata3D.Value := '0';
  if pos('E',s)=0 then
    Plata3E.Value := '0';
  if pos('F',s)=0 then
    Plata3F.Value := '0';
  if pos('G',s)=0 then
    Plata3G.Value := '0';
  if pos('Y',s)=0 then
    Plata3Y.Value := '0';
end;

procedure TPulpP3.pPlata3Change(Sender: TObject);
var
  v:integer;
  CaseVar:integer;
begin
  v := StrToIntDef(pPlata3.Value,0);

  CaseVar := (v shr 4) and $1F;
  case CaseVar of
    1:Plata3_1.Value := '0';
    2:Plata3_1.Value := '1';
    4:Plata3_1.Value := '2';
    8:Plata3_1.Value := '3';
    16:Plata3_1.Value := '4';
    else Plata3_1.Value := '';
  end;

  CaseVar := (v shr 9) and $1F;
  case CaseVar of
    1:Plata3_2.Value := '0';
    2:Plata3_2.Value := '1';
    4:Plata3_2.Value := '2';
    8:Plata3_2.Value := '3';
    16:Plata3_2.Value := '4';
    else Plata3_2.Value := '';
  end;

end;

procedure TPulpP3.V316InChange(Sender: TObject);
begin
  V316Out.Value := IfThen(V316.IsActive, V316In.Value, '0');
end;

procedure TPulpP3.V328InChange(Sender: TObject);
begin
  V328Out.Value := IfThen(V328.IsActive, V328In.Value, '0');
end;

procedure TPulpP3.V329Change(Sender: TObject);
begin
  V329Out.Value := IfThen(V329.IsActive, V329In.Value, '0');
end;

procedure TPulpP3.V466INChange(Sender: TObject);
begin
  V466Out.Value := IfThen(V466.IsActive, V466In.Value, '0');
end;

procedure TPulpP3.V478Change(Sender: TObject);
begin
  V478Out.Value := IfThen(V478.IsActive, V478In.Value, '0');
end;

procedure TPulpP3.V479InChange(Sender: TObject);
begin
  V479Out.Value := IfThen(V479.IsActive, V479In.Value, '0');
end;

end.
