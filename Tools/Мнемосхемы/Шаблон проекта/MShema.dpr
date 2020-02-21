program MShema;

uses
  Forms,
  uMain in 'uMain.pas' {fmMnemoShema1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMnemoShema1, fmMnemoShema1);
  {$IFDEF VER185}
  //Application.MainFormOnTaskbar := True;
  {$ENDIF}
  Application.Run;
end.
