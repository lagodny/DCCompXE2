program TestMessureBandTool;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form8},
  uChartFrame in '..\..\Source\uChartFrame.pas' {ChartFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
