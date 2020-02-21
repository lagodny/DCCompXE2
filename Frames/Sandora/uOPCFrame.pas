{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2013 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uOPCFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, IniFiles,
  uDCObjects,
  aCustomOPCSource,aOPCImage,aOPCLookupList,aOPCImageList;

type
  TaOPCFrame = class(TFrame)
  private
    OriginalLeft,OriginalTop,OriginalWidth,OriginalHeight:integer;

    FAllowClick: boolean;
    FDragImages: TDragImageList;
  protected
    FID: TPhysID;
    Scale : extended;
    procedure ChangeScale(M, D: Integer); override;
    procedure Loaded; override;

    function GetDragImages: TDragImageList; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

    procedure SetAllowClick(const Value: boolean);virtual;
    // методы для переопределения в наследниках
    procedure SetID(const Value: TPhysID);virtual;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);virtual;abstract;
    function GetOPCSource: TaCustomMultiOPCSource;virtual;abstract;
  public
    FMouseDownX, FMouseDownY: Integer;
    procedure UpdateOriginalPosition;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;

    procedure CheckForNewLookup(aCustomIniFile:TCustomIniFile);virtual;
    procedure ClearAnimateComp;
    procedure StopAnimate;
    procedure LocalInit(aId:integer; aOPCObjects:TDCObjectList);virtual;
  published
    property ID : TPhysID read FID write SetID stored false;
    property AllowClick:boolean read FAllowClick write SetAllowClick;
    property OPCSource:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
  end;

  TaOPCFrameClass = class of TaOPCFrame;


implementation

uses
  math;

{$R *.dfm}

{ TaOPCFrame }

procedure TaOPCFrame.ChangeScale(M, D: Integer);
begin
  inherited;
{
  DisableAlign;
  try
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
  finally
    EnableAlign;
  end;
 }
end;

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

constructor TaOPCFrame.Create(AOwner: TComponent);
begin
  inherited;

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

procedure TaOPCFrame.Loaded;
begin
  inherited;
  UpdateOriginalPosition;
end;

procedure TaOPCFrame.LocalInit(aId: integer; aOPCObjects: TDCObjectList);
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

procedure TaOPCFrame.SetID(const Value: TPhysID);
begin
  FID := Value;
end;

procedure TaOPCFrame.StopAnimate;
var
  i:integer;
begin
  for i := ComponentCount - 1 downto 0  do
    if Components[i] is TaOPCImageList then
      Components[i].Free;
end;

procedure TaOPCFrame.UpdateOriginalPosition;
begin
  OriginalLeft := Left;
  OriginalTop  := Top;
  OriginalWidth := Width;
  OriginalHeight := Height;
  Scale := 1;
end;

end.
