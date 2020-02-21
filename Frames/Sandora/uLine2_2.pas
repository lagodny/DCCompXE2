unit uLine2_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCGifImage, aOPCDataObject,
  aOPCImage, aOPCImageList, aCustomOPCSource, aOPCProvider,
  StrUtils, aOPCLabel, StdCtrls, aOPCGauge, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  TLine2_2 = class(TaOPCFrame)
    OPCImageListPipe: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    aOPCImageList1: TaOPCImageList;
    Image1: TImage;
    MR001: TaOPCGifImage;
    MR005: TaOPCGifImage;
    MR010: TaOPCGifImage;
    MR015: TaOPCGifImage;
    MR020: TaOPCGifImage;
    MR021: TaOPCGifImage;
    M191: TaOPCGifImage;
    MR040: TaOPCGifImage;
    M050: TaOPCImage;
    MR005m: TaOPCImage;
    MR001m: TaOPCImage;
    MR021m: TaOPCImage;
    LLA090: TaOPCGifImage;
    LLH091: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    P070: TaOPCGifImage;
    P080: TaOPCGifImage;
    VT060: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage26: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage2: TaOPCImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage12: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage14: TaOPCImage;
    aOPCImage15: TaOPCImage;
    aOPCImage16: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    aOPCImage20: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage28: TaOPCImage;
    VT060Out: TaOPCImage;
    MR021Out: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    MR040Out: TaOPCImage;
    aOPCImage34: TaOPCImage;
    Par: TaOPCImage;
    aOPCImage36: TaOPCImage;
    aOPCImage144: TaOPCImage;
    aOPCImage37: TaOPCImage;
    aOPCImage38: TaOPCImage;
    P70_80: TaOPCImage;
    P080In: TaOPCImage;
    P070Pin2: TaOPCImage;
    MR010Out2: TaOPCImage;
    P080Out: TaOPCImage;
    P070Pin1: TaOPCImage;
    Condensat: TaOPCImage;
    aOPCImage46: TaOPCImage;
    aOPCImage47: TaOPCImage;
    aOPCImage48: TaOPCImage;
    MR10_15: TaOPCImage;
    aOPCImage50: TaOPCImage;
    MR015Out2: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage9: TaOPCImage;
    M191Out: TaOPCImage;
    aOPCImage52: TaOPCImage;
    MR010Out1: TaOPCImage;
    MR015Out1: TaOPCImage;
    In1_L: TaOPCImage;
    _In1: TaOPCImage;
    aOPCImage57: TaOPCImage;
    MR020Out: TaOPCImage;
    pMR001_1: TaOPCProvider;
    pMR001_2: TaOPCProvider;
    pMR005_1: TaOPCProvider;
    pMR005_2: TaOPCProvider;
    aOPCGifImage12: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    In1_r: TaOPCImage;
    pHR0000: TaOPCProvider;
    pP070_1: TaOPCProvider;
    pP070_2: TaOPCProvider;
    MR030: TaOPCGifImage;
    pMR030: TaOPCProvider;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCGifImage1: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage5: TaOPCGifImage;
    aOPCGifImage6: TaOPCGifImage;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCGifImage9: TaOPCGifImage;
    aOPCGifImage10: TaOPCGifImage;
    aOPCGifImage11: TaOPCGifImage;
    aOPCGifImage13: TaOPCGifImage;
    aOPCGifImage14: TaOPCGifImage;
    aOPCGifImage15: TaOPCGifImage;
    aOPCGifImage16: TaOPCGifImage;
    aOPCGifImage17: TaOPCGifImage;
    aOPCLabel5: TaOPCLabel;
    procedure MR030MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MR040Change(Sender: TObject);
    procedure aOPCImage38Change(Sender: TObject);
    procedure P080Change(Sender: TObject);
    procedure pP070_1Change(Sender: TObject);
    procedure P070Change(Sender: TObject);
    procedure MR021mChange(Sender: TObject);
    procedure MR010Out2Change(Sender: TObject);
    procedure MR015Change(Sender: TObject);
    procedure MR010Change(Sender: TObject);
    procedure _In1Change(Sender: TObject);
    procedure pMR005_1Change(Sender: TObject);
    procedure pMR001_1Change(Sender: TObject);
    procedure P070MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VT060Change(Sender: TObject);
    procedure M166MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnOut1Chang: TValueChange;
    function GetKostochka: string;
    procedure SetKostochka(const Value: string);
    function GetIn1: string;
    procedure SetIn1(const Value: string);
  protected
    procedure SetAllowClick(const Value: boolean);override;

    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
  published
    property In1:string read GetIn1 write SetIn1;
    property Kostochka:string read GetKostochka write SetKostochka;
    property OnOut1Chang:TValueChange read FOnOut1Chang write FOnOut1Chang;
 end;

var
  Line2_2: TLine2_2;

implementation

{$R *.dfm}

procedure TLine2_2.aOPCImage38Change(Sender: TObject);
begin
  P70_80.Value := IfThen(P070Pin2.IsActive or P080In.IsActive,'2','0')
end;

function TLine2_2.GetIn1: string;
begin
  Result := _In1.Value;
end;

function TLine2_2.GetKostochka: string;
begin
  Result := pHR0000.Value;
end;

function TLine2_2.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(M191.OPCSource);
end;

procedure TLine2_2.M166MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TLine2_2.MR010Change(Sender: TObject);
begin
  MR010Out1.Value := IfThen(MR010.IsActive,'2','0');
  MR010Out2.Value := IfThen(MR010.IsActive,'2','0');
end;

procedure TLine2_2.MR010Out2Change(Sender: TObject);
begin
  MR10_15.Value := IfThen(MR010Out2.IsActive or MR015Out2.IsActive,'2','0');
end;

procedure TLine2_2.MR015Change(Sender: TObject);
begin
  MR015Out1.Value := IfThen(MR015.IsActive,'2','0');
  MR015Out2.Value := IfThen(MR015.IsActive,'2','0');
end;

procedure TLine2_2.MR021mChange(Sender: TObject);
begin
  MR020Out.Value := IfThen(MR021m.IsActive,'2','0');
end;

procedure TLine2_2.MR030MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if AllowClick then
  begin
    if Button = mbLeft then
      pMR030.Value := '1'
    else
      pMR030.Value := '0';
  end;
end;

procedure TLine2_2.MR040Change(Sender: TObject);
begin
  MR040Out.Value := IfThen(MR040.IsActive,'3','0')
end;

procedure TLine2_2.P070Change(Sender: TObject);
begin
  P070Pin1.Value := IfThen(P070.IsActive,'2','0');
end;

procedure TLine2_2.P070MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;
begin
  if Sender is TaOPCImage then
  begin
    if AllowClick then
    begin
      i:=StrToIntDef((Sender as TaOPCImage).Value,0);
      if Button = mbLeft then
        i:=(i+1) mod 3
      else
        i:=(i-1) mod 3;

      if i<0 then i:=0;
      (Sender as TaOPCImage).Value := IntToStr(i);
    end;
  end;
end;

procedure TLine2_2.P080Change(Sender: TObject);
begin
  P080In.Value := IfThen(P080.IsActive,'2','0');
end;

procedure TLine2_2.pMR001_1Change(Sender: TObject);
begin
  if (pMR001_1.Value = '1') then
    MR001m.Value := '1'
  else if (pMR001_2.Value = '1') then
    MR001m.Value := '2'
  else
    MR001m.Value := '0';

end;

procedure TLine2_2.pMR005_1Change(Sender: TObject);
begin
  if (pMR005_1.Value = '1') then
    MR005m.Value := '1'
  else if (pMR005_2.Value = '1') then
    MR005m.Value := '2'
  else
    MR005m.Value := '0';
end;

procedure TLine2_2.pP070_1Change(Sender: TObject);
begin
  if pP070_1.Value = '1' then
    P070.Value := '1'
  else if pP070_2.Value = '1' then
      P070.Value := '2'
  else
    P070.Value := '0';
end;

procedure TLine2_2.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
  //gbMode.Visible := AllowClick;
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

procedure TLine2_2.SetIn1(const Value: string);
begin
  _In1.Value := Value;
end;

procedure TLine2_2.SetKostochka(const Value: string);
begin
  pHR0000.Value := Value;
end;

procedure TLine2_2.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TLine2_2.VT060Change(Sender: TObject);
begin
  VT060Out.Value := IfThen(VT060.IsActive,Par.Value,'0');

  if pMR030.Value = '1' then
  begin
    if (not VT060.IsActive) and (not LLA090.IsActive) then
      MR030.Value := '1'
    else if (not VT060.IsActive) and LLA090.IsActive then
      MR030.Value := '2'
    else
      MR030.Value := '3';
  end
  else
    MR030.Value := '0';
end;

procedure TLine2_2._In1Change(Sender: TObject);
begin
  if pHR0000.Value = '1' then
  begin
    In1_L.Value := _In1.Value;
    In1_r.Value := '0';
  end
  else
  begin
    In1_R.Value := _In1.Value;
    In1_L.Value := '0';
  end;
end;

end.
