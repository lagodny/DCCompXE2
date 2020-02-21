unit aOPCFlowTransmitter;

interface

uses
  SysUtils, Classes, Controls, aOPCDataObject,Graphics;

type
  TaOPCFlowTransmitter = class(TaOPCDataObject)
  private
    { Private declarations }
  protected
    procedure Paint;override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property Height default 16;
    property Width default 16;

    { Published declarations }
  end;

implementation

{ TaOPCFlowTransmitter }

constructor TaOPCFlowTransmitter.Create(AOwner: TComponent);
begin
  inherited;
  Width := 16;
  Height:= 20;
  ColorActive:=clLime;
  ColorNotActive:=clGray;
end;

procedure TaOPCFlowTransmitter.Paint;
begin
  Canvas.Brush.Color:=TColor($4444aa);
  Canvas.FillRect(Rect((Width div 16)*4,0,(Width div 16)*12,Height));

  if Active then
    Canvas.Brush.Color:=ColorActive
  else
    Canvas.Brush.Color:=ColorNotActive;
    Canvas.FillRect(Rect(0,0,(Width div 16)*4,Height));
    Canvas.FillRect(Rect((Width div 16)*12,0,Width,Height));
  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Width:=1;
  Canvas.MoveTo(0,0);
  Canvas.LineTo(Width-1,0);
  Canvas.LineTo(Width-1,Height-1);
  Canvas.LineTo(0,Height-1);
  Canvas.LineTo(0,0);

end;

end.
