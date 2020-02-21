unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aCustomOPCSource, aOPCSource, aCustomOPCTCPSource, aOPCTCPSource_V30, aOPCTCPSource_V32,
  aOPCDataObject, aOPCLabel, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    aOPCTCPSource_V321: TaOPCTCPSource_V32;
    aOPCLabel1: TaOPCLabel;
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    Button1: TButton;
    Button2: TButton;
    mPerm: TMemo;
    ePeoject: TEdit;
    bTestPerm: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bTestPermClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.bTestPermClick(Sender: TObject);
begin
  aOPCTCPSource_V321.SetProjectPermission(StrToInt(ePeoject.Text), mPerm.Lines.Text);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  aOPCTCPSource_V321.Active := True;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ShowMessage(FormatFloat('0000', 1));
end;

end.
