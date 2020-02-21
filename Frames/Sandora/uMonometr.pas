unit uMonometr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, aOPCLabel, aOPCSource,
  aCustomOPCSource, aOPCTCPSource, aOPCDataObject, uOPCFrame;

type
  TMonometr = class(TaOPCFrame)
    Image: TImage;
    LMAX: TLabel;
    LMIN: TLabel;
    CBErrorList: TComboBox;
    ErrWarning: TShape;
    BLogClear: TButton;
    LValue: TaOPCLabel;
    procedure BLogClearClick(Sender: TObject);
    procedure LValueChange(Sender: TObject);
  private
    { Private declarations }
    RealError: integer;
    TimeErr: TTime;
    ErrLogStr: string;
    F_ID: string;
    F_Value: double;
    F_OldValue: double;
    F_MaxValue: double;
    F_MinValue: double;
    function GetPressureID: TPhysID;
    procedure SetPressureID(const Value: TPhysID);
    procedure SetMaxValue(const Value: double);
    procedure SetMinValue(const Value: double);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function  GetOPCSource: TaCustomMultiOPCSource;override;
    procedure CheckError(out result:boolean);
  public
    { Public declarations }
    constructor Create(aowner:Tcomponent);override;
    property ID: string read F_ID write F_ID;
    property Value: double read F_Value write F_Value;
  published
    property MaxValue: double read F_MaxValue write SetMaxValue;
    property MinValue: double read F_MinValue write SetMinValue;
    property PressureID : TPhysID read GetPressureID write SetPressureID;

end;

implementation

{$R *.dfm}

constructor TMonometr.Create(aowner:Tcomponent);
begin
 inherited;
 LValue.PhysID := F_ID;
 LMAX.Caption := FloatToStr(F_MaxValue);
 LMIN.Caption := FloatToStr(F_MinValue);
end;



procedure TMonometr.CheckError(out Result:boolean);
begin
 Result:=false;
 if F_Value >= F_MaxValue
  then
   begin
    Result:=true;
    if RealError <> 1
     then
      begin
       ErrWarning.Brush.Color:=clRed;
       ErrWarning.Visible:=true;
       TimeErr:= Time;
       ErrLogStr:=('>Max');
      end
   end
  else if F_Value <= F_MinValue
  then
   begin
    Result:=true;
    if RealError <> 1
     then
      begin
       ErrWarning.Brush.Color:=clBlue;
       ErrWarning.Visible:=true;
       TimeErr:= Time;
       ErrLogStr:=('<Min');
      end
   end;
 if (RealError = 1) and (not result)
  then
   begin
    RealError:=0;
     CBErrorList.Items.Append(TimeToStr(TimeErr)+'-'+TimeToStr(Time)+'::'+ErrLogStr);
     CBErrorList.ItemIndex:=CBErrorList.Items.Count-1;
      if not BLogClear.Enabled then BLogClear.Enabled:=true;
    ErrWarning.Visible:=false;
   end;
 if result then RealError:=1;
end;

procedure TMonometr.BLogClearClick(Sender: TObject);
begin
 CBErrorList.Clear;
 BLogClear.Enabled:=false;
end;

procedure TMonometr.LValueChange(Sender: TObject);
var
 err: boolean;
begin
 if TryStrToFloat(LValue.Value, F_Value)
  then
   begin
    F_OldValue:=F_Value;
    CheckError(err);
   end
  else
   begin
    LValue.Value:=FloatToStr(F_OldValue);
    CBErrorList.Items.Append(TimeToStr(Time)+'::ERRORS');
    CBErrorList.ItemIndex:=CBErrorList.Items.Count-1;
    if not BLogClear.Enabled then BLogClear.Enabled:=true;
   end;
end;

procedure TMonometr.SetOPCSource(const Value: TaCustomMultiOPCSource);
begin
  LValue.OPCSource := Value;
end;

function TMonometr.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=TaCustomMultiOPCSource(LValue.OPCSource)
end;

function TMonometr.GetPressureID: TPhysID;
begin
  Result := LValue.PhysID;
end;

procedure TMonometr.SetPressureID(const Value: TPhysID);
begin
  LValue.PhysID := Value;
end;


procedure TMonometr.SetMaxValue(const Value: double);
begin
  F_MaxValue := Value;
  LMAX.Caption := FloatToStr(Value);
  LValueChange(Self);
end;

procedure TMonometr.SetMinValue(const Value: double);
begin
  F_MinValue := Value;
  LMIN.Caption := FloatToStr(Value);
  LValueChange(Self);

end;


end.

