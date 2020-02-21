unit uLine1_1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCGifImage, aOPCDataObject,
  aOPCImage, aOPCImageList, aCustomOPCSource, aOPCProvider,
  StrUtils, aOPCLabel, StdCtrls, aOPCGauge, GIFImage;

type
  TValueChange = procedure (aValue:string) of object;

  TLine1_1 = class(TaOPCFrame)
    OPCImageListPipe: TaOPCImageList;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    aOPCImageList1: TaOPCImageList;
    Image1: TImage;
    M166: TaOPCImage;
    M114Out: TaOPCImage;
    aOPCImage26: TaOPCImage;
    aOPCImage7: TaOPCImage;
    aOPCImage25: TaOPCImage;
    aOPCImage27: TaOPCImage;
    aOPCImage30: TaOPCImage;
    aOPCImage31: TaOPCImage;
    aOPCImage8: TaOPCImage;
    aOPCImage12: TaOPCImage;
    aOPCImage1: TaOPCImage;
    aOPCImage23: TaOPCImage;
    aOPCImage2: TaOPCImage;
    M162Out: TaOPCImage;
    M162: TaOPCImage;
    M162In: TaOPCImage;
    aOPCImage16: TaOPCImage;
    aOPCImage9: TaOPCImage;
    aOPCImage24: TaOPCImage;
    MR164: TaOPCImage;
    aOPCGifImage15: TaOPCGifImage;
    aOPCGifImage16: TaOPCGifImage;
    MR151: TaOPCGifImage;
    MR167: TaOPCGifImage;
    aOPCGifImage12: TaOPCGifImage;
    M171: TaOPCGifImage;
    MR161: TaOPCGifImage;
    aOPCGifImage3: TaOPCGifImage;
    LSL163: TaOPCGifImage;
    aOPCImage3: TaOPCImage;
    aOPCImage4: TaOPCImage;
    _Out1: TaOPCImage;
    aOPCGifImage1: TaOPCGifImage;
    MR181: TaOPCGifImage;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCGifImage7: TaOPCGifImage;
    aOPCGifImage9: TaOPCGifImage;
    aOPCGifImage10: TaOPCGifImage;
    aOPCGifImage11: TaOPCGifImage;
    aOPCGifImage13: TaOPCGifImage;
    aOPCGifImage14: TaOPCGifImage;
    aOPCGifImage17: TaOPCGifImage;
    aOPCGifImage18: TaOPCGifImage;
    aOPCGifImage8: TaOPCGifImage;
    aOPCGifImage19: TaOPCGifImage;
    aOPCGifImage20: TaOPCGifImage;
    aOPCGifImage21: TaOPCGifImage;
    aOPCGifImage22: TaOPCGifImage;
    MR141: TaOPCGifImage;
    MR131: TaOPCGifImage;
    MR110: TaOPCGifImage;
    MR120: TaOPCGifImage;
    aOPCGifImage2: TaOPCGifImage;
    aOPCGifImage4: TaOPCGifImage;
    procedure M162Change(Sender: TObject);
    procedure MR181Change(Sender: TObject);
    procedure _Out1Change(Sender: TObject);
    procedure M166MouseDown(Sender: TObject; Button: TMouseButton;
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
  Line1_1: TLine1_1;

implementation

{$R *.dfm}

function TLine1_1.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(M166.OPCSource);
end;

function TLine1_1.GetP181: string;
begin
end;

procedure TLine1_1.M162Change(Sender: TObject);
begin
  M162In.Value := IfThen(M162.IsActive,'3','0');
end;

procedure TLine1_1.M166MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TLine1_1.MR181Change(Sender: TObject);
begin
  _Out1.Value := IfThen(MR181.IsActive,'2','0');
end;

procedure TLine1_1.SetAllowClick(const Value: boolean);
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

procedure TLine1_1.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TLine1_1.SetP181(const Value: string);
begin
end;

procedure TLine1_1._Out1Change(Sender: TObject);
begin
  if Assigned(OnOut1Chang) then
    OnOut1Chang(_Out1.Value);
end;

end.
