unit aOPCPump;

interface
uses
  SysUtils, Windows, Messages, Classes,
  Graphics, Controls, Forms, Dialogs, AOPCDataObject;

type
  TaOPCPump = class (TaOPCDataObject)
  private
    fPen:TPen;
    fBrush:TBrush;
    fDirection: TOPCDirection;
    fPoints : array [0..2] of TPoint;
    procedure ComputerPoints;
    procedure SetBrush(const Value: TBrush);
    procedure SetPen(const Value: TPen);
    procedure SetDirection(const Value: TOPCDirection);
  protected
    procedure Paint; override;
  public
    procedure SetBounds(aLeft, aTop, aWidth, aHeight : integer);override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Height default 17;
    property Width default 17;
    property Pen : TPen read fPen write SetPen;
    property Brush : TBrush read fBrush write SetBrush;
    property ColorActive default clLime;
    property Direction:TOPCDirection read fDirection write SetDirection default vdLeft;
  end;

implementation

{ TaOPCPump }

procedure TaOPCPump.ComputerPoints;
var
  w,h:integer;
  a,b:double;
begin
  w:=Width-1;
  h:=Height-1;
  case Direction of    //
    vdLeft:
    begin
      fPoints[0]:=Point(1,h div 2);
      a:=w*0.75-1;
      b:=a*0.57735;
      fPoints[1]:=Point(trunc(a),trunc(h/2-b));
      fPoints[2]:=Point(trunc(a),trunc(h/2+b));
    end;
    vdRight:
    begin
      fPoints[0]:=Point(w-1,h div 2);
      a:=w*0.75-1;
      b:=a*0.57735;
      fPoints[1]:=Point(w-1-trunc(a),trunc(h/2-b));
      fPoints[2]:=Point(w-1-trunc(a),trunc(h/2+b));
    end;

    vdUp:
    begin
      fPoints[0]:=Point(w div 2,1);
      a:=h*0.75-1;
      b:=a*0.57735;
      fPoints[1]:=Point(trunc(h/2-b),trunc(a));
      fPoints[2]:=Point(trunc(h/2+b),trunc(a));
    end;

    vdDown:
    begin
      fPoints[0]:=Point(w div 2,h-2);
      a:=h*0.75-1;
      b:=a*0.57735;
      fPoints[1]:=Point(trunc(h/2-b),h-1-trunc(a));
      fPoints[2]:=Point(trunc(h/2+b),h-1-trunc(a));
    end;

  end;    // case
end;

constructor TaOPCPump.Create(AOwner: TComponent);
begin
  inherited;
  SetBounds(Left,Top,17,17);
  fPen:=TPen.Create;
  fBrush:=TBrush.Create;
  fPen.OnChange:=RepaintRequest;
  fBrush.OnChange:=RepaintRequest;
  ColorActive:=clLime;
  ComputerPoints;
end;

destructor TaOPCPump.Destroy;
begin
  fPen.Free;
  fBrush.Free;
  inherited;
end;

procedure TaOPCPump.Paint;
var
  h,w:integer;

begin
  inherited;
  Canvas.Pen:=Pen;
  Canvas.Brush:=Brush;
  h:=Height - Canvas.Pen.Width;
  w:=Width - Canvas.Pen.Width;
  Canvas.Ellipse(0,0,w,h);
  if IsActive then
    Canvas.Brush.Color:=ColorActive;
  Canvas.Polygon(fPoints);
end;

procedure TaOPCPump.SetBounds(aLeft, aTop, aWidth, aHeight: integer);
var
  aSize:integer;
begin
  if aWidth<aHeight then
    aSize:=aWidth
  else
    aSize:=aHeight;

  inherited SetBounds(aLeft,aTop,aSize,aSize);
  ComputerPoints;
end;

procedure TaOPCPump.SetBrush(const Value: TBrush);
begin
  fBrush.Assign(Value);
  Invalidate;
end;

procedure TaOPCPump.SetDirection(const Value: TOPCDirection);
begin
  fDirection := Value;
  ComputerPoints;
  Invalidate;
end;

procedure TaOPCPump.SetPen(const Value: TPen);
begin
  fPen.Assign(Value);
  Invalidate;
end;

end.
