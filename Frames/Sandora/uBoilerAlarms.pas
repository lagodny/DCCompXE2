unit uBoilerAlarms;

interface

uses
  Windows, MMSystem, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, aOPCLabel, aOPCSource,
  aCustomOPCSource, aOPCTCPSource, aOPCDataObject, uOPCFrame, jpeg;

type
  TChangeErrorEvent = procedure(Sender: TObject; aErrorDetected : boolean) of object;

  TBoilerAlarms = class(TaOPCFrame)
    Panel1: TPanel;
    LMax: TaOPCBlinkLabel;
    LMin: TaOPCBlinkLabel;
    LValue: TaOPCBlinkLabel;
    lName: TaOPCBlinkLabel;
    cbAlarm: TCheckBox;
    procedure LValueChange(Sender: TObject);
    procedure cbAlarmClick(Sender: TObject);
  private
    { Private declarations }
    F_Value: double;
    F_OldValue: double;
    FMinValue: extended;
    FMaxValue: extended;
    FErrorSound: string;
    FTimer: TTimer;
    FTimerInterval: integer;
    FOnChangeError: TChangeErrorEvent;
    function GetValueID: TPhysID;
    procedure SetValueID(const Value: TPhysID);
    procedure SetMinValue(const Value: extended);
    procedure SetMaxValue(const Value: extended);
    procedure SetTimerInterval(const Value: integer);
    procedure SetErrorSound(const Value: string);
    function GetError: boolean;
    procedure DoTimer(Sender: TObject);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function  GetOPCSource: TaCustomMultiOPCSource;override;
    procedure CheckError;
  public
    { Public declarations }
    constructor Create(aowner:Tcomponent);override;
    property Value: double read F_Value write F_Value;
  published
    property ValueID : TPhysID read GetValueID write SetValueID;
    property MinValue: extended read FMinValue write SetMinValue;
    property MaxValue: extended read FMaxValue write SetMaxValue;
    property TimerInterval: integer read FTimerInterval write SetTimerInterval;
    property Error: boolean read GetError;
    property ErrorSound : string read FErrorSound write SetErrorSound;
    property OnChangeError: TChangeErrorEvent read FOnChangeError write FOnChangeError;
end;

implementation

{$R *.dfm}

constructor TBoilerAlarms.Create(aowner:Tcomponent);
begin
  inherited;
  SetValueID(ValueID);
end;

procedure TBoilerAlarms.DoTimer(Sender: TObject);
begin
  if Assigned(FOnChangeError) then
  begin
    FOnChangeError(Self, true);
  end
  else begin
    if FErrorSound = '' then
      windows.Beep(1500, 200)
    else
    begin
      MMSystem.PlaySound(PAnsiChar(FErrorSound), 0,
        SND_ALIAS or SND_ASYNC or SND_NODEFAULT {or SND_NOSTOP }or SND_NOWAIT);
    end;
  end;
  FTimer.Enabled := false;
end;

procedure TBoilerAlarms.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i : integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaOPCBlinkLabel then TaOPCBlinkLabel(Components[i]).OPCSource:=Value
  end;
end;

function TBoilerAlarms.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (LValue.OPCSource as TaCustomMultiOPCSource);
end;

function TBoilerAlarms.GetValueID: TPhysID;
begin
  Result := LValue.PhysID;
end;

procedure TBoilerAlarms.LValueChange(Sender: TObject);
begin
  if LValue.Value = '' then exit;
  
  if TryStrToFloat(LValue.Value, F_Value) then
  begin
    F_OldValue := F_Value;
    CheckError;
  end
  else LValue.Value := FloatToStr(F_OldValue);
end;

procedure TBoilerAlarms.SetValueID(const Value: TPhysID);
begin
  LValue.PhysID := Value;
end;

procedure TBoilerAlarms.SetMinValue(const Value: extended);
begin
  FMinValue := Value;
  LMin.Value := floattostr(FMinValue);
end;

procedure TBoilerAlarms.SetTimerInterval(const Value: integer);
begin
  FTimerInterval := Value;
end;

procedure TBoilerAlarms.SetMaxValue(const Value: extended);
begin
  FMaxValue := Value;
  LMax.Value := floattostr(FMaxValue);
end;

function TBoilerAlarms.GetError: boolean;
begin
//  Result := LValue.Blink;
end;

procedure TBoilerAlarms.SetErrorSound(const Value: string);
begin
  FErrorSound := Value;
end;

procedure TBoilerAlarms.cbAlarmClick(Sender: TObject);
begin
  CheckError;
end;

procedure TBoilerAlarms.CheckError;
var
  ErrorDetected: boolean;
begin
  ErrorDetected := ((F_Value < FMinValue) or (F_Value > FMaxValue)) and
                   ((not cbAlarm.Checked) and (LValue.Value <> ''));
  if not ErrorDetected then
  begin
    if FTimer <> nil then
    begin
      FreeAndNil(FTimer);
      LValue.Blink := False;
      LMax.Blink := False;
      LMin.Blink := False;
      if Assigned(FOnChangeError) then
        FOnChangeError(Self, false)
      else
        MMSystem.PlaySound('', 0,
          SND_ALIAS or SND_ASYNC or SND_NODEFAULT {or SND_NOSTOP }or SND_NOWAIT)
    end;
  end
  else begin
    if (F_Value < FMinValue) then
    begin
      LValue.Blink := True;
      LMin.Blink := True;
      LMax.Blink := False;

    end
    else if (F_Value > FMaxValue) then
    begin
      LValue.Blink := True;
      LMax.Blink := True;
      LMin.Blink := False;

    end;
    if FTimer <> nil then exit
    else begin
      FTimer := TTimer.Create(Self);
      FTimer.Interval := FTimerInterval;
      FTimer.OnTimer := DoTimer;
      FTimer.Enabled := True;
    end;
  end;
end;

end.

