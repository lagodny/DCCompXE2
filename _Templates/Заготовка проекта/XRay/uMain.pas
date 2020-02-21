unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage, Vcl.ActnList,
  Vcl.Menus;

type
  TMainForm = class(TForm)
    RegistryStorage: TJvAppRegistryStorage;
    FormStorage: TJvFormStorage;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    aTeamViewer: TAction;
    N1: TMenuItem;
    eamViewer1: TMenuItem;
    aMakeReport: TAction;
    aSelectPeriod: TAction;
    procedure aTeamViewerExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  uDCCommonProc;

{$R *.dfm}

procedure TMainForm.aTeamViewerExecute(Sender: TObject);
var
  aExeName: string;
begin
  aExeName := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'TV\TeamViewer.exe';
  ExecuteFile(aExeName, '', ExtractFilePath(aExeName), SW_SHOWNORMAL);
end;

end.
