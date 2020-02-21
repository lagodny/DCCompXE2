unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, aOPCDataObject, aOPCStateLine, aOPCGauge, aCustomOPCSource, aOPCSource,
  aCustomOPCTCPSource, aOPCTCPSource_V30, aOPCImageList, aOPCImage, uOPCFrame, uBoilerFrame;

type
  TForm5 = class(TForm)
    aOPCStateLine1: TaOPCStateLine;
    Button1: TButton;
    aOPCGauge1: TaOPCGauge;
    aOPCImage1: TaOPCImage;
    aOPCImageList1: TaOPCImageList;
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    CheckBox1: TCheckBox;
    BoilerFrame1: TBoilerFrame;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
const
  h = 1/HoursPerDay;
begin
  aOPCStateLine1.StateColors.Clear;
  aOPCStateLine1.StateColors.Add('1=clred');
  aOPCStateLine1.StateColors.Add('2=clBlue');
  aOPCStateLine1.StateColors.Add('3=clGreen');
  aOPCStateLine1.StateColors.Add('4=clYellow');

  aOPCStateLine1.Clear;
  aOPCStateLine1.Interval.SetInterval(Now - 1, Now);

  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1-2, '1', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1-1, '1', 0);

  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1, '1', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1+h, '2', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1+2*h, '3', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1+3*h, '2', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1+5*h, '1', 0);
  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date1+6*h, '1', 0);
//  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date2, '1', 0);
//
//  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date2+1, '1', 0);
//  aOPCStateLine1.AddXY(aOPCStateLine1.Interval.Date2+2, '2', 0);

  aOPCStateLine1.Repaint;
end;

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
  aOPCTCPSource_V301.Active := CheckBox1.Checked;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  BoilerFrame1.Fire.PhysID := '32';
  BoilerFrame1.Fire.States.Clear;
BoilerFrame1.Fire.States.Add('0=');
BoilerFrame1.Fire.States.Add('120=2');
  BoilerFrame1.OPCSource := aOPCTCPSource_V301;
end;

end.
