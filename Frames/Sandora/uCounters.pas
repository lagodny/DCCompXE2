{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2006 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uCounters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, IniFiles,
  uOPCObjects,
  aCustomOPCSource,aOPCImage,aOPCLookupList,aOPCImageList, uOPCFrame,
  uCounterFrame;

type
  TaOPCFrame = class(TFrame)
    frCounter1: TfrCounter;
    frCounter2: TfrCounter;
    frCounter3: TfrCounter;
    frCounter4: TfrCounter;
    frCounter5: TfrCounter;
    frCounter13: TfrCounter;
    frCounter14: TfrCounter;
    frCounter15: TfrCounter;
    frCounter16: TfrCounter;
    frCounter17: TfrCounter;
    frCounter6: TfrCounter;
    frCounter7: TfrCounter;
    frCounter8: TfrCounter;
    frCounter9: TfrCounter;
    frCounter10: TfrCounter;
    frCounter18: TfrCounter;
    frCounter19: TfrCounter;
    frCounter20: TfrCounter;
    frCounter21: TfrCounter;
    frCounter22: TfrCounter;
    frCounter11: TfrCounter;
    frCounter12: TfrCounter;
    frCounter23: TfrCounter;
    frCounter24: TfrCounter;
  private
    FAllowClick: boolean;
    FDragImages: TDragImageList;
  protected
    function GetDragImages: TDragImageList; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;


    procedure SetAllowClick(const Value: boolean);virtual;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);virtual;abstract;
    function GetOPCSource: TaCustomMultiOPCSource;virtual;abstract;
  public
    FMouseDownX, FMouseDownY: Integer;
    destructor Destroy;override;

    procedure CheckForNewLookup(aCustomIniFile:TCustomIniFile);virtual;
    procedure ClearAnimateComp;
    procedure StopAnimate;
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);virtual;
  published
    property AllowClick:boolean read FAllowClick write SetAllowClick;
    property OPCSource:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
  end;

  TaOPCFrameClass = class of TaOPCFrame;


implementation

{$R *.dfm}

{ TaOPCFrame }

procedure TaOPCFrame.CheckForNewLookup(aCustomIniFile: TCustomIniFile);
var
  i:integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TaOPCLookupList then
    begin
      if Assigned(TaOPCLookupList(Components[i]).OPCSource) and
        (TaOPCLookupList(Components[i]).TableName<>'') then
        TaOPCLookupList(Components[i]).CheckForNewLookup(aCustomIniFile);
    end;
end;

procedure TaOPCFrame.ClearAnimateComp;
var
  i:integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TaOPCImage then
      if TaOPCImage(Components[i]).PhysID <> '' then
        TaOPCImage(Components[i]).Value := '';
end;

destructor TaOPCFrame.Destroy;
begin
  FDragImages.Free;
  inherited;
end;

function TaOPCFrame.GetDragImages: TDragImageList;
var
  i: integer;
  B: TBitmap;
  aCanvas: TCanvas;
begin
  if not Assigned(FDragImages) then
    FDragImages := TDragImageList.Create(nil);
  Result := FDragImages;
  Result.Clear;
  B := TBitmap.Create;
  try
    B.Height := Height ;
    B.Width  := Width;
    B.Canvas.Brush.Color := clLime;
    B.Canvas.FillRect(B.Canvas.ClipRect);

    aCanvas := TCanvas.Create;
    try
      aCanvas.Handle := GetDC(Handle);

      B.Canvas.CopyRect(Rect(0,0,Width,Height),aCanvas,Rect(0,0,Width,Height));
    finally
      aCanvas.Free;
    end;
    //B.Canvas.Rectangle(0,0,Width,Height);
    Result.Width := B.Width;
    Result.Height := B.Height;
    i:= Result.AddMasked(B, clLime);
    Result.SetDragImage(i, FMouseDownX, FMouseDownY);
  finally
    B.Free;
  end
end;

procedure TaOPCFrame.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
begin

end;

procedure TaOPCFrame.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  FMouseDownX := X;
  FMouseDownY := Y; 
  inherited;
end;

procedure TaOPCFrame.SetAllowClick(const Value: boolean);
begin
  FAllowClick := Value;
end;

procedure TaOPCFrame.StopAnimate;
var
  i:integer;
begin
  for i := ComponentCount - 1 downto 0  do
    if Components[i] is TaOPCImageList then
      Components[i].Free;
end;

end.
