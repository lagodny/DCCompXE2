program NewApp;

uses
  Vcl.Forms,
  uCustomMain in '..\..\Forms\Custom\uCustomMain.pas' {CustomMainForm},
  uMain in 'uMain.pas' {MainForm},
  uBaseFormInterface in '..\..\Forms\Custom\uBaseFormInterface.pas',
  uFormsManager in '..\..\Forms\Custom\uFormsManager.pas',
  uCustomAuthDialog in '..\..\Forms\Custom\uCustomAuthDialog.pas' {CustomAuthDialog},
  uCustomAuthChangePassword in '..\..\Forms\Custom\uCustomAuthChangePassword.pas' {CustomAuthChangePassword},
  uBaseForm in '..\..\Forms\Custom\uBaseForm.pas' {BaseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
