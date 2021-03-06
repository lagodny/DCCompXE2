unit uTanks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, GifImage,
  aCustomOPCSource, aOPCSource, aOPCTCPSource, uTankFrame, aOPCLookupList,
  uOPCFrame, aOPCImageList, ExtCtrls, aOPCDataObject, aOPCImage;

type
  TfrTanks = class(TaOPCFrame)
    aOPCImageList1: TaOPCImageList;
    frTankTP2: TfrTank;
    frTankTM1: TfrTank;
    frTankTM2: TfrTank;
    frTankTM3: TfrTank;
    frTankTA4: TfrTank;
    frTankTA3: TfrTank;
    frTankTA2: TfrTank;
    frTankTP6: TfrTank;
    frTankTK4: TfrTank;
    frTankTK3: TfrTank;
    frTankTK2: TfrTank;
    frTankTP4: TfrTank;
    frTankTA1: TfrTank;
    frTankTM4: TfrTank;
    frTankTP5: TfrTank;
    frTankTK1: TfrTank;
    frTankTP3: TfrTank;
    frTankTP1: TfrTank;
    frTankTA6: TfrTank;
    frTankTA5: TfrTank;
    frTank1: TfrTank;
    frTank2: TfrTank;
    frTank3: TfrTank;
    frTank4: TfrTank;
  private
    FAllowAnimation: boolean;
    FShowMixerStateLine: boolean;
    procedure SetOPCLookupList(const Value: TaOPCLookupList);
    procedure SetAllowAnimation(const Value: boolean);
    procedure SetShowMixerStateLine(const Value: boolean);

  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;

  public
    procedure CheckStoreTime;
    //property OPCSource : TaCustomMultiOPCSource write SetOPCSource;
    property OPCLookupList : TaOPCLookupList write SetOPCLookupList;
    property AllowAnimation: boolean read FAllowAnimation write SetAllowAnimation;
    property ShowMixerStateLine: boolean read FShowMixerStateLine write SetShowMixerStateLine;
  end;

implementation

{$R *.dfm}

{ TfrTanks }

procedure TfrTanks.CheckStoreTime;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TfrTank then
      TfrTank(Components[i]).CheckStoreTime;
  end;
end;

function TfrTanks.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := frTankTP2.OPCSource
end;

procedure TfrTanks.SetAllowAnimation(const Value: boolean);
var
  i:integer;
begin
  if FAllowAnimation=Value then
    exit;

  FAllowAnimation := Value;

  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TfrTank then
    begin
//      if FAllowAnimation then
//        TfrTank(Components[i]).OPCImageList := aOPCImageList1
//      else
//        TfrTank(Components[i]).OPCImageList := nil;
      TfrTank(Components[i]).AlowAnimation := Value;
    end;
  end;
end;

procedure TfrTanks.SetOPCLookupList(const Value: TaOPCLookupList);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TfrTank then
      TfrTank(Components[i]).OPCLookupList:=Value;
  end;
end;

procedure TfrTanks.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TfrTank then
      TfrTank(Components[i]).OPCSource:=Value;
  end;
end;

procedure TfrTanks.SetShowMixerStateLine(const Value: boolean);
var
  i:integer;
begin
  if FShowMixerStateLine = Value then
    exit;

  FShowMixerStateLine := Value;

  for i:=0 to ComponentCount-1 do
  begin
    if Components[i] is TfrTank then
      TfrTank(Components[i]).ShowMixerStateLine := Value;
  end;
end;

initialization
  RegisterClasses([TfrTanks]);


end.
