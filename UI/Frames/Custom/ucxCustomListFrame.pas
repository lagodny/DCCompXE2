unit ucxCustomListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucxCustomDataFrame, Data.DB, Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxDataControllerConditionalFormattingRulesManagerDialog,
  dxBarBuiltInMenu, Vcl.Menus,
  Vcl.Clipbrd;

type
  TcxCustomListFrame = class(TcxCustomDataFrame)
    ListGrid: TcxGrid;
    ListView: TcxGridDBTableView;
    ListLevel: TcxGridLevel;
    cxGridPopupMenu1: TcxGridPopupMenu;
    PopupMenu: TPopupMenu;
    fr_miCopy: TMenuItem;
    fr_miPaste: TMenuItem;
    fr_miCopyValues: TMenuItem;
    fr_div1: TMenuItem;
    miEditInline: TMenuItem;
    fr_miClone: TMenuItem;
    fr_div2: TMenuItem;
    fr_miHistory: TMenuItem;
    procedure DataSetAfterDelete(DataSet: TDataSet);
    procedure ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fr_miPasteClick(Sender: TObject);
    procedure fr_miCopyValuesClick(Sender: TObject);
    procedure fr_miCopyClick(Sender: TObject);
    procedure miEditInlineClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure fr_miCloneClick(Sender: TObject);
    procedure fr_miHistoryClick(Sender: TObject);
  protected
    procedure CopyValues;
    procedure PasteValues;

    procedure InitRights; override;
    procedure InitCustomProps; override;

    procedure PostRecord; override;
    procedure FocusRecord; override;
  end;

implementation

uses
  SynCommons,
  mORMot,
//  uDCRecordHistoryView,
//  DC.mORMot.Model,
  uBaseFormInterface, uFormsManager,
  uSettings,
  uDataProc;

{$R *.dfm}

procedure TcxCustomListFrame.CopyValues;
begin
  CopyValuesToClipboard(ListView);
end;

procedure TcxCustomListFrame.DataSetAfterDelete(DataSet: TDataSet);
var
  aParentForm: TCustomForm;
begin
  if DataSetIsLoading then
    Exit;

  inherited;

  aParentForm := GetParentForm(Parent);
  if Assigned(aParentForm) then
    aParentForm.FocusControl(ListGrid);

//  if Assigned(Parent) and (Parent is TForm) then
//    TForm(Parent).FocusControl(ListGrid);
end;

procedure TcxCustomListFrame.FocusRecord;
begin
  ListView.Focused := True;
end;

procedure TcxCustomListFrame.InitCustomProps;
begin
  inherited;

  SelectSql := GetCSVDataSetFields(DataSet);
  UpdateSql := GetCSVDataSetFields(DataSet, True);
end;

procedure TcxCustomListFrame.InitRights;
var
  aRights: TSQLOccasions;
begin
  inherited;

  if (Settings.Client <> nil) and (Length(FRecordClass) > 0) then
  begin
    aRights := Settings.Client.GetTableRights(DefRecClass);

    DataSet.ReadOnly := not (soUpdate in aRights);

//    ListNavigator.Buttons.Insert.Enabled := soInsert in aRights;
//    ListNavigator.Buttons.Append.Enabled := soInsert in aRights;
//    ListNavigator.Buttons.Delete.Enabled := soDelete in aRights;
//    ListNavigator.Buttons.Edit.Enabled := soUpdate in aRights;

    ListView.OptionsData.Inserting := ListView.OptionsData.Inserting and (soInsert in aRights);
    ListView.OptionsData.Appending := ListView.OptionsData.Appending and (soInsert in aRights);
    ListView.OptionsData.Editing := ListView.OptionsData.Editing and (soUpdate in aRights);
    ListView.OptionsData.Deleting := ListView.OptionsData.Deleting and (soDelete in aRights);
  end;
end;

procedure TcxCustomListFrame.ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  AHitTest: TcxCustomGridHitTest;
begin
  DoDblClickOrEnter;
end;

procedure TcxCustomListFrame.ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  aSaveEditInline: Boolean;
begin
  case Key of
    VK_RETURN:
    begin
      if Assigned(ListView.Controller.FocusedRecord) then
        DoDblClickOrEnter;
      //Key := 0;
    end;
  end;

//  if ssCtrl in Shift then
//  begin
//    case Key of
//      Ord('V'):
//      begin
//        aSaveEditInline := EditInLine;
//        try
//          EditInLine := True;
//          PasteValuesFromClipboard(ListView);
//        finally
//          EditInLine := aSaveEditInline;
//        end;
//      end;
//    end;
//  end;
end;

procedure TcxCustomListFrame.fr_miCopyValuesClick(Sender: TObject);
begin
  CopyValues;
end;

procedure TcxCustomListFrame.fr_miHistoryClick(Sender: TObject);
var
  aData: Variant;
begin
  TDocVariant.New(aData);
  aData.RecordID := Settings.Client.Model.RecordReference(RecordClass[0], DataSetID.AsInteger);

//  TFormsManager.Instance.OpenDataFormByClass(THierarchyDialog, ftDialogModal, aData, FormGUID);
  TFormsManager.Instance.OpenDataForm(Settings.Client.GetHistoryClass, ftList, aData, GetFormGUID);
//  TDCRecordHistoryView.ShowHistory(Settings.Client, DefRecClass, GetCurrentRecordID);
end;

procedure TcxCustomListFrame.fr_miCloneClick(Sender: TObject);
begin
  CloneCurrentRecord;
end;

procedure TcxCustomListFrame.fr_miCopyClick(Sender: TObject);
begin
  ListView.CopyToClipboard(False);
end;

procedure TcxCustomListFrame.miEditInlineClick(Sender: TObject);
begin
  EditInLine := miEditInline.Checked;
end;

procedure TcxCustomListFrame.fr_miPasteClick(Sender: TObject);
begin
  PasteValues;
end;

procedure TcxCustomListFrame.PasteValues;
var
  aSaveEditInline: Boolean;
begin
  aSaveEditInline := EditInLine;
  try
    EditInLine := True;
    PasteValuesFromClipboard(ListView);
  finally
    EditInLine := aSaveEditInline;
  end;
end;

procedure TcxCustomListFrame.PopupMenuPopup(Sender: TObject);
begin
  miEditInline.Checked := EditInLine;

  fr_miPaste.Enabled := Clipboard.HasFormat(CF_TEXT) and not DataSet.ReadOnly;
  fr_miCopy.Enabled := ListView.Controller.SelectedRowCount > 0;
  fr_miCopyValues.Enabled := fr_miCopy.Enabled;
  fr_miClone.Enabled := fr_miCopy.Enabled and not DataSet.ReadOnly;

  fr_miHistory.Visible := Settings.Client.Model.GetTableIndex(Settings.Client.GetHistoryClass) > -1;
end;

procedure TcxCustomListFrame.PostRecord;
begin
  RestPostRecord(Settings.Client, FRecordClass[0], DataSet, ListView, False);
end;

end.
