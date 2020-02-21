unit aOPCPipe;

interface

uses
  SysUtils, Classes, Controls, Graphics,
  AOPCDataObject;

type
  TaOPCPipe = class(TAOPCDataObject)
  private
    fPipeWidth: integer;
    fPipePosition: TOPCPosition;
    procedure SetPipeWidth(const Value: integer);
    procedure SetPipePosition(const Value: TOPCPosition);
    { Private declarations }
  protected
    procedure Paint; override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    property Height default 15;
    property Width default 100;
    property PipeWidth:integer read fPipeWidth write SetPipeWidth default 3;
    property PipePosition : TOPCPosition read fPipePosition write SetPipePosition default vpHorizontal;
    { Published declarations }
  end;

implementation

{ TaOPCPipe }

constructor TaOPCPipe.Create(AOwner: TComponent);
begin
  inherited;
  Width:=100;
  Height:=15;
  PipeWidth:=3;
  PipePosition:=vpHorizontal;
  ColorActive:=clBlue;
  ColorNotActive:=clBlack;
end;

procedure TaOPCPipe.Paint;
var
  w,h:integer;
  w2,h2:integer;
  pw2:Integer;
begin
  Canvas.Pen.Width:=PipeWidth;
  if IsActive then
    Canvas.Pen.Color:=ColorActive
  else
    Canvas.Pen.Color:=ColorNotActive;

  pw2:=0;//PipeWidth div 2;
  w:=Width;
  h:=Height;
  w2:=Width div 2 + pw2;
  h2:=Height div 2 + pw2;
  case PipePosition of    //
    vpHorizontal:
    begin
      Canvas.MoveTo(0,h2);
      Canvas.LineTo(w,h2);
    end;
    vpVertical:
    begin
      Canvas.MoveTo(w2,0);
      Canvas.LineTo(w2,h);
    end;
    vpLeftDiagonal:
    begin
      Canvas.MoveTo(0,0);
      Canvas.LineTo(w,h);
    end;
    vpRightDiagonal:
    begin
      Canvas.MoveTo(0,h);
      Canvas.LineTo(w,0);
    end;
  end;    // case
end;

procedure TaOPCPipe.SetPipePosition(const Value: TOPCPosition);
begin
  if fPipePosition<>Value then
  begin
    fPipePosition := Value;
    Invalidate;
  end;
end;

procedure TaOPCPipe.SetPipeWidth(const Value: integer);
begin
  if fPipeWidth<>Value then
  begin
    fPipeWidth := Value;
    Invalidate;
  end;
end;

end.
