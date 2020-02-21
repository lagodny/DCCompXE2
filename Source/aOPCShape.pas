unit aOPCShape;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls;

type
  TaOPCShape = class(TShape)
  private
    OriginalLeft,OriginalTop,OriginalWidth,OriginalHeight: integer;
  protected
    Scale : extended;
    procedure Loaded; override;
    procedure ChangeScale(M, D: Integer); override;
  public
    procedure UpdateOriginalPosition;
  published
    { Published declarations }
  end;

implementation

uses
  Math;

{ TaOPCShape }

procedure TaOPCShape.ChangeScale(M, D: Integer);
begin
  if M <> D then
  begin
    if SameValue(D/M,Scale,0.001) then
    begin
      Scale := 1;
      SetBounds(OriginalLeft,OriginalTop,OriginalWidth,OriginalHeight);
    end
    else
    begin
      Scale := Scale * M/D;
      SetBounds(Round(OriginalLeft*Scale),Round(OriginalTop*Scale),
        Round(OriginalWidth*Scale),Round(OriginalHeight*Scale));
    end;
  end;
end;

procedure TaOPCShape.Loaded;
begin
  inherited;
  UpdateOriginalPosition;
end;

procedure TaOPCShape.UpdateOriginalPosition;
begin
  OriginalLeft := Left;
  OriginalTop  := Top;
  OriginalWidth := Width;
  OriginalHeight := Height;
  Scale := 1;
end;

end.
