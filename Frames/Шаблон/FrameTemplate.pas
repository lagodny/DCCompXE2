unit FrameTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, ExtCtrls, aOPCGifImage, aOPCDataObject,
  aOPCImage, aOPCImageList, JvGIF, aCustomOPCSource, aOPCProvider,
  StrUtils, aOPCLabel, StdCtrls, aOPCGauge;

type
  TValueChange = procedure (aValue:string) of object;

  TTemplate = class(TaOPCFrame)
    OPCImageListPipe: TaOPCImageList;
    OPCImageValve: TaOPCImageList;
    OPCImageListGif: TaOPCImageList;
    aOPCImageList1: TaOPCImageList;
    Image1: TImage;
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
  Template: TTemplate;

implementation

{$R *.dfm}

function TTemplate.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(M166.OPCSource);
end;

function TTemplate.GetP181: string;
begin
end;

procedure TTemplate.M166MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TTemplate.SetAllowClick(const Value: boolean);
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

procedure TTemplate.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TTemplate.SetP181(const Value: string);
begin
end;

end.
