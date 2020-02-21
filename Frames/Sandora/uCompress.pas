unit uCompress;

interface

uses
  Windows, MMSystem, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, aOPCLabel, aOPCSource,
  aCustomOPCSource, aOPCTCPSource, aOPCDataObject, uOPCFrame, jpeg, aOPCShape;

type
  TCompressor = class(TaOPCFrame)
    Panel1: TPanel;
    LValue: TaOPCBlinkLabel;
    aOPCShape1: TaOPCShape;
    procedure LValueChange(Sender: TObject);
  private
    F_Value: double;
    F_OldValue: double;
    FErrorSound: string;
    FOnChangeError: TNotifyEvent;
    FMinPressure: extended;
    function GetPressureID: TPhysID;
    procedure SetPressureID(const Value: TPhysID);
    procedure SetErrorSound(const Value: string);
    function GetError: boolean;
    procedure SetMinPressure(const Value: extended);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function  GetOPCSource: TaCustomMultiOPCSource;override;
    procedure CheckError;
  public
    constructor Create(aowner:Tcomponent);override;
    property Value: double read F_Value write F_Value;
  published
    property PressureID : TPhysID read GetPressureID write SetPressureID;
    property ErrorSound : string read FErrorSound write SetErrorSound;
    property MinPressure: extended read FMinPressure write SetMinPressure;

    property Error: boolean read GetError;

    property OnChangeError: TNotifyEvent read FOnChangeError write FOnChangeError;
end;

implementation

{$R *.dfm}

constructor TCompressor.Create(aowner:Tcomponent);
begin
  inherited;
  SetPressureID(PressureID);
end;

procedure TCompressor.CheckError;
var
  ErrorDetected: boolean;
begin
  ErrorDetected := (F_Value < FMinPressure);
//  if ErrorDetected then
//  begin
//    if FErrorSound = '' then
//      windows.Beep(2000, 1000)
//    else
//    begin
//      MMSystem.PlaySound(PAnsiChar(FErrorSound), 0,
//        SND_ALIAS or SND_ASYNC or SND_NODEFAULT {or SND_NOSTOP }or SND_NOWAIT);
//    end;
//  end
//  else
//    MMSystem.PlaySound('', 0,
//      SND_ALIAS or SND_ASYNC or SND_NODEFAULT {or SND_NOSTOP }or SND_NOWAIT);
  if ErrorDetected <> Error then
  begin
    LValue.Blink := ErrorDetected;
    if Assigned(FOnChangeError) then
      FOnChangeError(Self);
  end;
end;

procedure TCompressor.LValueChange(Sender: TObject);
begin
  if TryStrToFloat(LValue.Value, F_Value) then
  begin
    F_OldValue := F_Value;
    CheckError;
  end
  else LValue.Value := FloatToStr(F_OldValue);
end;

procedure TCompressor.SetErrorSound(const Value: string);
begin
  FErrorSound := Value;
end;

procedure TCompressor.SetMinPressure(const Value: extended);
begin
  FMinPressure := Value;
end;

procedure TCompressor.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i : integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaOPCLabel then
      TaOPCLabel(Components[i]).OPCSource:=Value
  end;
end;

function TCompressor.GetError: boolean;
begin
  Result := LValue.Blink;
end;

function TCompressor.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (LValue.OPCSource as TaCustomMultiOPCSource);
end;

function TCompressor.GetPressureID: TPhysID;
begin
  Result := LValue.PhysID;
end;

procedure TCompressor.SetPressureID(const Value: TPhysID);
begin
  LValue.PhysID := Value;
end;

end.

