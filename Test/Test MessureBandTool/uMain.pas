unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uOPCFrame, uChartFrame, aCustomOPCSource, aOPCSource, aCustomOPCTCPSource,
  aOPCTCPSource_V30;

type
  TForm8 = class(TForm)
    ChartFrame1: TChartFrame;
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormCreate(Sender: TObject);
begin
  aOPCTCPSource_V301.Active := True;
  ChartFrame1.AddSerieByParam('4', [], aOPCTCPSource_V301, 'test', clRed, True, '').DisplayFormat := '# ##0';
end;

end.
