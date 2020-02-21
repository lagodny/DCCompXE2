unit uCustomRefList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ActnList, Vcl.Menus, Datasnap.DBClient,
  JvComponentBase, JvFormPlacement, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, cxNavigator, TB2Dock, SpTBXItem, cxDBNavigator, TB2Item,
  TB2Toolbar, dxBarExtItems, dxBar, dxSkinsCore, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu;

type
  TCustomRefList = class(TCustomList)
    procedure FormShow(Sender: TObject);
  end;

implementation

uses
  uBaseForm, uBaseFormInterface, uFormsManager,
  mORMot,
  uSettings;

{$R *.dfm}


procedure TCustomRefList.FormShow(Sender: TObject);
begin
  inherited;
  //ListView.OptionsBehavior.IncSearch := OpenFormType in [ftSelect, ftSelectModal];
end;

end.
