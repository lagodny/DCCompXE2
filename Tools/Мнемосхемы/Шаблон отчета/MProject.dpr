program MProject;

uses
  Forms,
  uMain in 'uMain.pas' {fmOPCMainForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmOPCMainForm1, fmOPCMainForm1);
  Application.Run;
end.
