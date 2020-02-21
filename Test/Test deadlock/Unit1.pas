unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, aCustomOPCSource, aOPCSource, aCustomOPCTCPSource, aOPCTCPSource_V30,
  aOPCDataObject, aOPCLabel, aOPCGauge;

type
  TForm1 = class(TForm)
    Button1: TButton;
    aOPCLabel1: TaOPCLabel;
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    aOPCGauge1: TaOPCGauge;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  l: TaOPCLabel;
begin
  for i := 0 to 200 do
  begin
    l := TaOPCLabel.Create(Self);
    l.PhysID := IntToStr(i+1);
    l.OPCSource := aOPCTCPSource_V301;
    l.Parent := Self;
    l.Left := 0;
    l.Top := 0;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s: TStream;
begin
  s := TMemoryStream.Create;
  try
    aOPCTCPSource_V301.FillHistory(s, '5', Now - 1, 0);
  finally
    s.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i: Integer;
  l: TaOPCGauge;
begin
  for i := 0 to 200 do
  begin
    l := TaOPCGauge.Create(Self);
    l.PhysID := IntToStr(i+1);
    l.OPCSource := aOPCTCPSource_V301;
    l.Parent := Self;
    l.Left := 0;
    l.Top := 0;
  end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    aOPCLabel1.OPCSource := aOPCTCPSource_V301
  else
    aOPCLabel1.OPCSource := nil;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  aOPCTCPSource_V301.Active := CheckBox2.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  aOPCTCPSource_V301.Active := True;
end;

end.
