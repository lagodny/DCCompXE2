unit uPulpP1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCGifImage, aOPCDataObject, aOPCImage,
  aOPCImageList, aCustomOPCSource, aOPCProvider, aOPCGauge, StdCtrls, StrUtils,
  aOPCLabel, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  TPulpP1 = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    aOPCImage14: TaOPCImage;
    aOPCImage26: TaOPCImage;
    PlataA5: TaOPCImage;
    PlataA6: TaOPCImage;
    PlataA7: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage7: TaOPCImage;
    CipPipe2: TaOPCImage;
    PlataA4: TaOPCImage;
    PlataA3: TaOPCImage;
    PlataA2: TaOPCImage;
    PlataA1: TaOPCImage;
    PlataA8: TaOPCImage;
    PlataA0: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    CipPipe1: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage27: TaOPCImage;
    PR410Out: TaOPCImage;
    P292In: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    v433Out: TaOPCImage;
    V433In: TaOPCImage;
    CipPipe3: TaOPCImage;
    aOPCImage36: TaOPCImage;
    aOPCImage39: TaOPCImage;
    aOPCImage40: TaOPCImage;
    _Out3: TaOPCImage;
    _Out4: TaOPCImage;
    aOPCImage43: TaOPCImage;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    P432: TaOPCGifImage;
    P292: TaOPCGifImage;
    aOPCImageListBat: TaOPCImageList;
    v433: TaOPCImage;
    aOPCImage44: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    PlataA_1: TaOPCImage;
    PR410_1: TaOPCGifImage;
    PR410_2: TaOPCGifImage;
    PR270_1: TaOPCGifImage;
    PR270_2: TaOPCGifImage;
    P432In: TaOPCImage;
    PT431: TaOPCGauge;
    PTxxx: TaOPCGauge;
    ModeProd: TaOPCProvider;
    ModeCip: TaOPCProvider;
    CipStart: TaOPCProvider;
    PlataA_2: TaOPCImage;
    PlataA_3: TaOPCImage;
    gbPlataA: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    gbCip: TGroupBox;
    cbProd: TCheckBox;
    cbCip: TCheckBox;
    cbCipStart: TCheckBox;
    pPlataA1: TaOPCProvider;
    pPlataA2: TaOPCProvider;
    pLine1: TaOPCProvider;
    pHotBreak: TaOPCProvider;
    pLine2: TaOPCProvider;
    pPR410_1: TaOPCProvider;
    pPR410_1k: TaOPCProvider;
    aOPCLabel11: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    Label1: TLabel;
    Label2: TLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCImageListSignal: TaOPCImageList;
    aOPCGifImage1: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage6: TaOPCGifImage;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCGifImage9: TaOPCGifImage;
    pPR410_2: TaOPCProvider;
    procedure PR270_1Change(Sender: TObject);
    procedure PlataA3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pPR410_1Change(Sender: TObject);
    procedure pLine2Change(Sender: TObject);
    procedure pLine1Change(Sender: TObject);
    procedure pHotBreakChange(Sender: TObject);
    procedure pPlataA2Change(Sender: TObject);
    procedure _Out4Change(Sender: TObject);
    procedure _Out3Change(Sender: TObject);
    procedure PlataA6Change(Sender: TObject);
    procedure PlataA5Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure PlataA_1Change(Sender: TObject);
    procedure V433InChange(Sender: TObject);
    procedure CipStartChange(Sender: TObject);
    procedure cbCipStartClick(Sender: TObject);
    procedure cbCipClick(Sender: TObject);
    procedure cbProdClick(Sender: TObject);
    procedure P292Change(Sender: TObject);
    procedure ModeCipChange(Sender: TObject);
    procedure PlataA7Change(Sender: TObject);
    procedure PR410_1Change(Sender: TObject);
    procedure aOPCImage71MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnOut1Chang: TValueChange;
    FOnOut3Chang: TValueChange;
    FOnOut4Chang: TValueChange;
    FOnOut2Chang: TValueChange;
    FOnPR270Chang: TValueChange;
    { Private declarations }
  protected
    procedure SetAllowClick(const Value: boolean);override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    { Public declarations }
  published
    property OnOut1Chang:TValueChange read FOnOut1Chang write FOnOut1Chang;
    property OnOut2Chang:TValueChange read FOnOut2Chang write FOnOut2Chang;
    property OnOut3Chang:TValueChange read FOnOut3Chang write FOnOut3Chang;
    property OnOut4Chang:TValueChange read FOnOut4Chang write FOnOut4Chang;

    property OnPR270Chang:TValueChange read FOnPR270Chang write FOnPR270Chang;
  end;

var
  PulpP1: TPulpP1;

implementation

{$R *.dfm}

procedure TPulpP1._Out3Change(Sender: TObject);
begin
  if Assigned(OnOut3Chang) then
    OnOut3Chang(_Out3.Value)
end;

procedure TPulpP1._Out4Change(Sender: TObject);
begin
  if Assigned(OnOut4Chang) then
    OnOut4Chang(_Out4.Value)
end;

procedure TPulpP1.aOPCImage71MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TPulpP1.PlataA_1Change(Sender: TObject);
var
  s:string;
  v:integer;
begin
  v := StrToIntDef(PlataA_1.Value,-1);
  case v of
    0:
    begin
      PlataA5.Value := PlataA1.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataA6.Value := PlataA1.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataA7.Value := PlataA1.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataA8.Value := PlataA1.Value;
      s:=s+'8';
    end;
  end;

  v := StrToIntDef(PlataA_2.Value,-1);
  case v of
    0:
    begin
      PlataA5.Value := PlataA2.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataA6.Value := PlataA2.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataA7.Value := PlataA2.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataA8.Value := PlataA2.Value;
      s:=s+'8';
    end;
    4:
    begin
      PlataA0.Value := PlataA2.Value;
      s:=s+'0';
    end;
  end;

  v := StrToIntDef(PlataA_3.Value,-1);
  case v of
    0:
    begin
      PlataA5.Value := PlataA3.Value;
      s:=s+'5';
    end;
    1:
    begin
      PlataA6.Value := PlataA3.Value;
      s:=s+'6';
    end;
    2:
    begin
      PlataA7.Value := PlataA3.Value;
      s:=s+'7';
    end;
    3:
    begin
      PlataA8.Value := PlataA3.Value;
      s:=s+'8';
    end;
  end;

  if pos('0',s)=0 then
    PlataA0.Value := '0';
  if pos('5',s)=0 then
    PlataA5.Value := '0';
  if pos('6',s)=0 then
    PlataA6.Value := '0';
  if pos('7',s)=0 then
    PlataA7.Value := '0';
  if pos('8',s)=0 then
    PlataA8.Value := '0';

end;

procedure TPulpP1.pLine1Change(Sender: TObject);
begin
  PlataA3.Value := IfThen(pLine1.Value = '1','2','0');
end;

procedure TPulpP1.pLine2Change(Sender: TObject);
begin
  PlataA1.Value := IfThen(pLine2.Value = '1','2','0');
end;

procedure TPulpP1.pPlataA2Change(Sender: TObject);
var
  v:integer;
  CaseVar:integer;
begin
  v := StrToIntDef(pPlataA1.Value,0);

  CaseVar := v and $0F;
  case CaseVar of
    1:PlataA_1.Value := '0';
    2:PlataA_1.Value := '1';
    4:PlataA_1.Value := '2';
    8:PlataA_1.Value := '3';
    else PlataA_1.Value := '';
  end;

  CaseVar := (v and $F0) shr 4;
  case CaseVar of
    0:
    begin
      if pPlataA2.Value = '1' then
        PlataA_2.Value := '4'
    end;
    1:PlataA_2.Value := '0';
    2:PlataA_2.Value := '1';
    4:PlataA_2.Value := '2';
    8:PlataA_2.Value := '3';
    else PlataA_2.Value := '';
  end;

  CaseVar := (v and $0F00) shr 8;
  case CaseVar of
    1:PlataA_3.Value := '0';
    2:PlataA_3.Value := '1';
    4:PlataA_3.Value := '2';
    8:PlataA_3.Value := '3';
    else PlataA_3.Value := '';
  end;

end;

procedure TPulpP1.pPR410_1Change(Sender: TObject);
begin
  PR410_1.Value := IfThen(pPR410_1k.Value = '0','2',pPR410_1.Value);
  PR410_2.Value := IfThen(pPR410_1k.Value = '0','2',pPR410_2.Value);

end;

procedure TPulpP1.cbCipClick(Sender: TObject);
begin
  if cbCip.Checked then
    ModeCip.value := '1'
  else
    ModeCip.value := '0'

end;

procedure TPulpP1.cbCipStartClick(Sender: TObject);
begin
  if cbCipStart.Checked then
    CipStart.value := '1'
  else
    CipStart.value := '0'
end;

procedure TPulpP1.cbProdClick(Sender: TObject);
begin
  if cbProd.Checked then
    ModeProd.value := '1'
  else
    ModeProd.value := '0'
end;

procedure TPulpP1.CipStartChange(Sender: TObject);
begin
  if CipStart.Value = '1' then
    CipPipe1.Value := '4'
  else
    CipPipe1.Value := '0'

end;

procedure TPulpP1.ComboBox1Change(Sender: TObject);
begin
  PlataA_1.Value := IntToStr(ComboBox1.ItemIndex)
end;

procedure TPulpP1.ComboBox2Change(Sender: TObject);
begin
  PlataA_2.Value := IntToStr(ComboBox2.ItemIndex)
end;

procedure TPulpP1.ComboBox3Change(Sender: TObject);
begin
  PlataA_3.Value := IntToStr(ComboBox3.ItemIndex)
end;

function TPulpP1.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(ModeCip.OPCSource);
end;

procedure TPulpP1.ModeCipChange(Sender: TObject);
begin
  if P432.IsActive then
  begin
    if ModeProd.Value = '1' then
      P432In.Value := '2'
    else if ModeCip.Value = '1' then
      P432In.Value := '4'
    else
      P432In.Value := '0'
  end
  else
    P432In.Value := '0';

  if ModeCip.Value = '1' then
  begin
    CipPipe1.Visible := true;
    CipPipe2.Visible := true;
    CipPipe3.Visible := true;
  end
  else
  begin
    CipPipe1.Visible := false;
    CipPipe2.Visible := false;
    CipPipe3.Visible := false;
  end;
end;

procedure TPulpP1.P292Change(Sender: TObject);
begin
  if P292.IsActive then
    P292In.Value := '2'
  else
    P292In.Value := '0';

end;

procedure TPulpP1.pHotBreakChange(Sender: TObject);
begin
  PlataA2.Value := IfThen(pHotBreak.Value = '1','2','0');
end;

procedure TPulpP1.PlataA3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TaOPCImage then
  begin
    if AllowClick then
    begin
      if Button = mbLeft then
        (Sender as TaOPCImage).Value := '2'
      else
        (Sender as TaOPCImage).Value := '0';
    end;
  end;
end;

procedure TPulpP1.PlataA5Change(Sender: TObject);
begin
  if Assigned(OnOut1Chang) then
    OnOut1Chang(PlataA5.Value)
end;

procedure TPulpP1.PlataA6Change(Sender: TObject);
begin
  if Assigned(OnOut2Chang) then
    OnOut2Chang(PlataA6.Value)
end;

procedure TPulpP1.PlataA7Change(Sender: TObject);
begin
  if PlataA7.IsActive then
    PR270_1.Value := '1'
  else
    PR270_1.Value := '0'
end;

procedure TPulpP1.PR270_1Change(Sender: TObject);
begin
  if Assigned(OnPR270Chang) then
    OnPR270Chang(PR270_1.Value)
end;

procedure TPulpP1.PR410_1Change(Sender: TObject);
begin
  if PlataA8.IsActive and (PR410_1.value = '1') and (PR410_2.value = '1') then
    PR410Out.Value := PlataA8.Value
  else
    PR410Out.Value := '0';
end;

procedure TPulpP1.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
  gbPlataA.Visible := AllowClick;
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

procedure TPulpP1.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i: Integer;
begin
  if (OPCSource = Value) or (ComponentCount = 0) then
    exit;
{
  ModeProd.OPCSource  := Value;
  ModeCip.OPCSource   := Value;
  CipStart.OPCSource  := Value;
  pPlataA1.OPCSource  := Value;
  pPlataA2.OPCSource  := Value;
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

procedure TPulpP1.V433InChange(Sender: TObject);
begin
  if v433.IsActive then
    v433Out.Value := V433In.Value
  else
    v433Out.Value := '0';
end;

end.
