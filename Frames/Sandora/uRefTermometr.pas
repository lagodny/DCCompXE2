unit uRefTermometr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, aOPCLabel, aOPCSource,
  aCustomOPCSource, aOPCTCPSource, aOPCDataObject, uOPCFrame, jpeg;

type
  TTermometr = class(TaOPCFrame)
    Panel1: TPanel;
    Shape1: TShape;
    ErrWarning: TShape;
    LMAX: TaOPCLabel;
    LMIN: TaOPCLabel;
    LValue: TaOPCBlinkLabel;
    procedure LMINChange(Sender: TObject);
    procedure LMAXChange(Sender: TObject);
    procedure LMINDblClick(Sender: TObject);
    procedure LMAXDblClick(Sender: TObject);
    procedure LValueChange(Sender: TObject);
  private
    { Private declarations }
    RealError: integer;
    F_Value: double;
    F_OldValue: double;
    F_MaxValue: double;
    F_MinValue: double;
    F_OldMaxValue: double;
    F_OldMinValue: double;
    function GetPressureID: TPhysID;
    procedure SetPressureID(const Value: TPhysID);
    procedure SetMaxValueID(const Value: TPhysID);
    procedure SetMinValueID(const Value: TPhysID);
    function GetMaxValueID: TPhysID;
    function GetMinValueID: TPhysID;
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function  GetOPCSource: TaCustomMultiOPCSource;override;
    procedure CheckError(out result:boolean);
  public
    { Public declarations }
    constructor Create(aowner:Tcomponent);override;
    property Value: double read F_Value write F_Value;
  published
    property MaxValue   : TPhysID read GetMaxValueID write SetMaxValueID;
    property MinValue   : TPhysID read GetMinValueID write SetMinValueID;
    property PressureID : TPhysID read GetPressureID write SetPressureID;

end;

implementation

{$R *.dfm}

constructor TTermometr.Create(aowner:Tcomponent);
begin
  inherited;
  SetPressureID(PressureID);
  SetMaxValueID(MaxValue);
  SetMinValueID(MinValue);
end;

procedure TTermometr.CheckError(out Result:boolean);
begin
  Result:=false;
  if F_Value > F_MaxValue
  then begin
    Result:=true;
    if RealError <> 1 then
    begin
      ErrWarning.Brush.Color:=clRed;
      LValue.BlinkColor := clRed;
      LValue.Blink := True;
    end
  end
  else if F_Value < F_MinValue then
  begin
    Result:=true;
    if RealError <> 1 then
    begin
      ErrWarning.Brush.Color:=clBlue;
      LValue.BlinkColor := clBlue;
      LValue.Blink := True;
    end
  end;
  if (RealError = 1) and (not result) then
  begin
    RealError:=0;
    ErrWarning.Brush.Color:=clSilver;
    LValue.Blink := false;
  end;
  if result then RealError:=1;
end;

procedure TTermometr.LMAXChange(Sender: TObject);
var
  err: boolean;
begin
  inherited;
  if TryStrToFloat(LMAX.Value, F_MaxValue)
  then begin
    F_OldMaxValue := F_MAXValue;
    CheckError(err);
  end
  else LMAX.Value := FloatToStr(F_OldMAXValue);
end;

procedure TTermometr.LMAXDblClick(Sender: TObject);
var
  v  : string;
  dt : TDateTime;
begin
  inherited;
  if (OPCSource=nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  v := LMax.Value;
  if InputQuery('”кажите максимальное значение температуры',
    '”кажите максимальное значение температуры', v) then
  begin
    dt:=0;
    v := StringReplace(v,'.',',',[]);
    TaOPCSource(LMax.OPCSource).SetSensorValue(LMax.PhysID, v, dt);
  end;
  LMAXChange(Self);
end;

procedure TTermometr.LMINChange(Sender: TObject);
var
  err: boolean;
begin
  inherited;
  if TryStrToFloat(LMIN.Value, F_MInValue) then
  begin
    F_OldMInValue := F_MINValue;
    CheckError(err);
  end
  else LMIN.Value := FloatToStr(F_OldMINValue);
end;

procedure TTermometr.LMINDblClick(Sender: TObject);
var
  v  : string;
  dt : TDateTime;
begin
  inherited;
  if (OPCSource=nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  v := LMin.Value;
  if InputQuery('”кажите минимальное значение температуры',
    '”кажите минимальное значение температуры', v) then
  begin
    dt := 0;
    v := StringReplace(v,'.',',',[]);
    TaOPCSource(LMin.OPCSource).SetSensorValue(LMin.PhysID, v, dt);
  end;
  LMINChange(Self);
end;

procedure TTermometr.LValueChange(Sender: TObject);
var
  err: boolean;
begin
  if TryStrToFloat(LValue.Value, F_Value) then
  begin
    F_OldValue := F_Value;
    CheckError(err);
  end
  else LValue.Value := FloatToStr(F_OldValue);
end;

procedure TTermometr.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i : integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaOPCLabel then
      TaOPCLabel(Components[i]).OPCSource:=Value
  end;
end;

function TTermometr.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (LValue.OPCSource as TaCustomMultiOPCSource);
end;

function TTermometr.GetPressureID: TPhysID;
begin
  Result := LValue.PhysID;
end;

procedure TTermometr.SetPressureID(const Value: TPhysID);
begin
  LValue.PhysID := Value;
end;

function TTermometr.GetMaxValueID: TPhysID;
begin
  Result := LMAX.PhysID;
end;

function TTermometr.GetMinValueID: TPhysID;
begin
  Result := LMIN.PhysID;
end;

procedure TTermometr.SetMaxValueID(const Value: TPhysID);
begin
  LMAX.PhysID := Value;
  LValueChange(Self);
  LMAXChange(Self);
end;

procedure TTermometr.SetMinValueID(const Value: TPhysID);
begin
  LMIN.PhysID := Value;
  LValueChange(Self);
  LMINChange(Self);
end;

end.

