unit uCursorSaver;

interface

uses
  Forms, Controls;

type
  ICursorSaver = interface

  end;

  TCursorSaver = class(TInterfacedObject, ICursorSaver)
  private
    FSavedCursor: TCursor;
  public
    constructor Create(aCursor: TCursor = crHourGlass);
    destructor Destroy; override;
  end;

implementation

{ TCursorSaver }

constructor TCursorSaver.Create(aCursor: TCursor);
begin
  FSavedCursor := Screen.Cursor;

  if FSavedCursor <> crHourGlass then
    Screen.Cursor := aCursor;
end;

destructor TCursorSaver.Destroy;
begin
  if FSavedCursor <> crHourGlass then
    Screen.Cursor := FSavedCursor;

  inherited;
end;

end.
