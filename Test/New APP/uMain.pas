unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomMain, Vcl.Menus, Vcl.AppEvnts, Vcl.StdActns, Vcl.ActnList, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppRegistryStorage, TB2Item, SpTBXItem, llTaskBar, TB2Dock, TB2Toolbar;

type
  TMainForm = class(TCustomMainForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
