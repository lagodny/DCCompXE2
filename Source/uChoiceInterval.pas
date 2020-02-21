unit uChoiceInterval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TChoiceInterval = class(TForm)
    GroupBox1: TGroupBox;
    dtFrom: TDateTimePicker;
    Label1: TLabel;
    tmFrom: TDateTimePicker;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    tmTo: TDateTimePicker;
    bOk: TButton;
    bCancel: TButton;
  private
    function GetDate1: TDateTime;
    function GetDate2: TDateTime;
    procedure SetDate1(const Value: TDateTime);
    procedure SetDate2(const Value: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    property Date1:TDateTime read GetDate1 write SetDate1;
    property Date2:TDateTime read GetDate2 write SetDate2;
  end;

var
  ChoiceInterval: TChoiceInterval;

implementation

{$R *.dfm}

{ TCinemaPropertyForm }

function TChoiceInterval.GetDate1: TDateTime;
begin
  Result := Trunc(dtFrom.DateTime) + Frac(tmFrom.DateTime);
end;

function TChoiceInterval.GetDate2: TDateTime;
begin
  Result := Trunc(dtTo.DateTime) + Frac(tmTo.DateTime);
end;

procedure TChoiceInterval.SetDate1(const Value: TDateTime);
begin
  dtFrom.Date := Trunc(Value);
  tmFrom.Time := Frac(Value);
end;

procedure TChoiceInterval.SetDate2(const Value: TDateTime);
begin
  dtTo.Date := Trunc(Value);
  tmTo.Time := Frac(Value);
end;

end.
