unit aOPCSwitch;

interface

uses
  SysUtils, Classes, Controls, Graphics,
  AOPCDataObject;

type
  TaOPCSwitch = class(TAOPCDataObject)
  private
    { Private declarations }
  protected
    procedure PaintPosition;
    procedure Paint; override;
  public
    procedure SetBounds(aLeft, aTop, aWidth, aHeight : integer);override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Height default 41;
    property Width default 41;
    property ColorActive  default clBlack;
    property ColorNotActive  default clBlack;

    { Published declarations }
  end;

implementation

{ TaOPCSwitch }

constructor TaOPCSwitch.Create(AOwner: TComponent);
begin
  inherited;
  ColorActive := clBlack;
  ColorNotActive := clBlack;
  SetBounds(Left,Top,41,41);
end;

destructor TaOPCSwitch.Destroy;
begin

  inherited;
end;

procedure TaOPCSwitch.Paint;
var
  h,w:integer;
  h3,w3,h10,w10:integer;
begin
  inherited;
  Canvas.Pen.Color:=ColorNotActive;
  Canvas.Pen.Width:=1;
  h:=Height - Canvas.Pen.Width;
  w:=Width - Canvas.Pen.Width;
  h10:= h div 10;
  w10:= w div 10;
  h3:= h div 3;
  w3:= w div 3;
  with Canvas do
  begin
  // [- left
    MoveTo(w10,h3);
    LineTo(0,h3);
    LineTo(0,h-h3);
    LineTo(w10,h-h3);
    MoveTo(w10,h div 2 - h10);
    LineTo(w10,h div 2 + h10);
    MoveTo(w10,h div 2);
    LineTo(w3,h div 2);
  // -] right
    MoveTo(w-w10,h3);
    LineTo(w,h3);
    LineTo(w,h-h3);
    LineTo(w-w10,h-h3);
    MoveTo(w-w10,h div 2 - h10);
    LineTo(w-w10,h div 2 + h10);
    MoveTo(w-w10,h div 2);
    LineTo(w-w3,h div 2);
  // up
    MoveTo(w3,h10);
    LineTo(w3,0);
    LineTo(w-w3,0);
    LineTo(w-w3,h10);
    MoveTo(w div 2 - w10,h10);
    LineTo(w div 2 + w10,h10);
    MoveTo(w div 2,h10);
    LineTo(w div 2,h3);
  // down
    MoveTo(w3,h-h10);
    LineTo(w3,h);
    LineTo(w-w3,h);
    LineTo(w-w3,h-h10);
    MoveTo(w div 2 - w10,h-h10);
    LineTo(w div 2 + w10,h-h10);
    MoveTo(w div 2,h-h10);
    LineTo(w div 2,h-h3);

  end;    // with
  PaintPosition;
end;

procedure TaOPCSwitch.PaintPosition;
var
  h,w:integer;
begin
  Canvas.Pen.Width:=3;
  h:=Height-1;
  w:=Width -1;
  Canvas.Pen.Color:=ColorActive;
  if IsActive then
  begin
    Canvas.MoveTo(w div 3,h div 2);
    Canvas.LineTo(w div 2,h div 3);
    Canvas.MoveTo(w - w div 3,h div 2);
    Canvas.LineTo(w div 2,h - h div 3);
  end
  else
  begin
    Canvas.MoveTo(w div 3,h div 2);
    Canvas.LineTo(w div 2,h - h div 3);
    Canvas.MoveTo(w - w div 3,h div 2);
    Canvas.LineTo(w div 2,h div 3);
  end;
    
end;

procedure TaOPCSwitch.SetBounds(aLeft, aTop, aWidth, aHeight: integer);
begin
  inherited;

end;

end.
