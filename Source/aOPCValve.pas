unit aOPCValve;

interface

uses
  SysUtils, Classes, Controls, Graphics,
  AOPCDataObject;

type
  TValveKind = (vkSimple, vkPneumo, vkHand);
  TOPCDirection = (vdLeft, vdRight, vdUp, vdDown);

  TaOPCValve = class(TAOPCDataObject)
  private
    fKind: TValveKind;
    fDirection: TOPCDirection;
    procedure SetKind(const Value: TValveKind);
    procedure SetDirection(const Value: TOPCDirection);
    { Private declarations }
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property ColorActive default clLime;
    property ColorNotActive default clWhite;
    property Width default 17;
    property Height default 25;
    property Kind:TValveKind read fKind write SetKind default vkPneumo;
    property Direction:TOPCDirection read fDirection write SetDirection default vdLeft;
    { Published declarations }
  end;

implementation

uses Types;

{ TaOPCValve }

constructor TaOPCValve.Create(AOwner: TComponent);
begin
  inherited;
  Height:=25;
  Width:=17;
  ColorActive:=clLime;
  ColorNotActive:=clWhite;
end;

procedure TaOPCValve.Paint;
var
  h,w,XCenter,YCenter:integer;
  RColor, GColor, aColor : TColor;
  Points:array [0..2] of TPoint;
begin
  inherited;
  h:=Height-Canvas.Pen.Width;
  w:=Width-Canvas.Pen.Width;
  XCenter := w div 2;
  YCenter := h div 2;

  aColor := ColorNotActive;
  if IsActive then
  begin
    if (Direction = vdLeft) or (Direction = vdDown) then
    begin
      RColor:=aColor;
      GColor:=ColorActive;
    end
    else
    begin
      RColor:=ColorActive;
      GColor:=aColor;
    end
  end
  else
  begin
    RColor:=aColor;
    GColor:=aColor;
  end;

  case Direction of    //
    vdLeft,vdRight :
    begin
      Canvas.Brush.Color:=GColor;
      Points[0]:=Point(0,YCenter);
      Points[1]:=Point(0,h);
      Points[2]:=Point(XCenter,YCenter+YCenter div 2);
      Canvas.Polygon(Points);
      Canvas.Brush.Color:=RColor;
      Points[0]:=Point(w,YCenter);
      Points[1]:=Point(w,h);
      Points[2]:=Point(XCenter,YCenter+YCenter div 2);
      Canvas.Polygon(Points);
      if Kind<>vkSimple then
      begin
        Canvas.MoveTo(XCenter,YCenter+YCenter div 2);
        Canvas.LineTo(XCenter,YCenter-YCenter div 2);
      end;

      Canvas.Brush.Color:=aColor;
      case Kind of    //
        vkHand:
        begin
          Canvas.MoveTo(XCenter div 2,YCenter div 2);
          Canvas.LineTo(w - XCenter div 2,YCenter div 2);
        end;
        vkPneumo:
          Canvas.Rectangle(XCenter div 2,0,XCenter+XCenter div 2,YCenter);
      end;
    end;
    vdUp,vdDown:
    begin
      Canvas.Brush.Color:=GColor;
      Points[0]:=Point(0,0);
      Points[1]:=Point(XCenter,0);
      Points[2]:=Point(XCenter-XCenter div 2,YCenter);
      Canvas.Polygon(Points);
      Canvas.Brush.Color:=RColor;
      Points[0]:=Point(0,h);
      Points[1]:=Point(XCenter,h);
      Points[2]:=Point(XCenter-XCenter div 2,YCenter);
      Canvas.Polygon(Points);
      if Kind<>vkSimple then
      begin
        Canvas.MoveTo(XCenter-XCenter div 2,YCenter);
        Canvas.LineTo(XCenter+XCenter div 2,YCenter);
      end;
      Canvas.Brush.Color:=aColor;
      case Kind of
        vkHand:
        begin
          Canvas.MoveTo(XCenter+XCenter div 2,YCenter div 2);
          Canvas.LineTo(XCenter+XCenter div 2,YCenter+YCenter div 2);
        end;
        vkPneumo:
          Canvas.Rectangle(XCenter,YCenter div 2,w,YCenter+YCenter div 2);
          //Canvas.FillRect(Rect(XCenter,YCenter div 2,w,YCenter+YCenter div 2));
      end;
    end;
  end;    // case
end;

procedure TaOPCValve.SetDirection(const Value: TOPCDirection);
begin
  fDirection := Value;
  Invalidate;
end;

procedure TaOPCValve.SetKind(const Value: TValveKind);
begin
  fKind := Value;
  Invalidate;
end;

end.
