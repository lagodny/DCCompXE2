unit uHotBreak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCDataObject, aOPCImage, aOPCImageList,
  aOPCGifImage, aCustomOPCSource, aOPCProvider,
  StrUtils, aOPCGauge, aOPCLabel, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  THotBreak = class(TaOPCFrame)
    Image1: TImage;
    OPCImageListPipe: TaOPCImageList;
    Par: TaOPCImage;
    VT161Out: TaOPCImage;
    _In1: TaOPCImage;
    aOPCImage5: TaOPCImage;
    aOPCImage6: TaOPCImage;
    aOPCImage10: TaOPCImage;
    aOPCImage11: TaOPCImage;
    aOPCImage12: TaOPCImage;
    aOPCImage13: TaOPCImage;
    aOPCImage14: TaOPCImage;
    P181In: TaOPCImage;
    aOPCImage16: TaOPCImage;
    T_Hot_Out: TaOPCImage;
    aOPCImage18: TaOPCImage;
    aOPCImage19: TaOPCImage;
    P171Out: TaOPCImage;
    aOPCImage21: TaOPCImage;
    aOPCImage22: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage24: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage28: TaOPCImage;
    aOPCImage29: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage32: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    P173: TaOPCImage;
    P171: TaOPCImage;
    Vt161: TaOPCImage;
    HotBreakProd: TaOPCImage;
    T1: TaOPCImage;
    P181: TaOPCGifImage;
    P151: TaOPCGifImage;
    aOPCLabel3: TaOPCLabel;
    LT157: TaOPCGauge;
    aOPCLabel7: TaOPCLabel;
    aOPCGifImage20: TaOPCGifImage;
    aOPCGifImage1: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    aOPCGifImage5: TaOPCGifImage;
    aOPCLabel4: TaOPCLabel;
    procedure _In1Change(Sender: TObject);
    procedure P171Change(Sender: TObject);
    procedure HotBreakProdChange(Sender: TObject);
    procedure Vt161MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Vt161Change(Sender: TObject);
  private
    FOnP181Chang: TValueChange;
    function GetIn1: string;
    procedure SetIn1(const Value: string);
  protected
    procedure SetAllowClick(const Value: boolean);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
  published
    property OnP181Chang:TValueChange read FOnP181Chang write FOnP181Chang;
    property In1:string read GetIn1 write SetIn1;
  end;

var
  HotBreak: THotBreak;

implementation

{$R *.dfm}

function THotBreak.GetIn1: string;
begin
  Result := _In1.Value;
end;

function THotBreak.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(Vt161.OPCSource);
end;

procedure THotBreak.HotBreakProdChange(Sender: TObject);
begin
  Vt161Change(self);
end;

procedure THotBreak.P171Change(Sender: TObject);
begin
  P171Out.Value := IfThen(P171.IsActive,'3','0');
end;

procedure THotBreak.SetAllowClick(const Value: boolean);
var
  I: Integer;
  aObject:TaCustomOPCDataObject;
begin
  inherited;
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

procedure THotBreak.SetIn1(const Value: string);
begin
  _In1.Value := Value;
end;

procedure THotBreak.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure THotBreak.Vt161Change(Sender: TObject);
var
  r:integer;
begin
  VT161Out.Value := IfThen(Vt161.IsActive,Par.Value,'0');
  r:=0;
  if (not Vt161.IsActive) and (not P151.IsActive) then
    r := 0;
  if Vt161.IsActive and P151.IsActive and (HotBreakProd.Value = '1') then
    r := 1;
  if (not Vt161.IsActive) and P151.IsActive and (HotBreakProd.Value = '1') then
    r := 2;

  if (not Vt161.IsActive) and P151.IsActive and (HotBreakProd.Value = '0') then
    r := 3;

  if Vt161.IsActive and P151.IsActive and (HotBreakProd.Value = '0') then
    r := 4;

  T1.Value := IntToStr(r);

end;

procedure THotBreak.Vt161MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure THotBreak._In1Change(Sender: TObject);
begin
  P181In.Value := IfThen(P181.IsActive,_In1.Value,'0');
  if Assigned(OnP181Chang) then
    OnP181Chang(P181.Value);

end;

end.
