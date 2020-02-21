unit uCustomListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, Datasnap.DBClient,
  uCustomRec,
  SynCommons, mORMot, mORMotMidasVCL, UIEdit, cxNavigator, dxSkinsCore, dxSkinscxPCPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu;

type
  TCustomRecordClassArray =  array of TSQLRecordClass;

  TCustomListFrame = class(TBaseFrame)
    DataSet: TClientDataSet;
    DataSource: TDataSource;
    cxGridPopupMenu1: TcxGridPopupMenu;
    ListGrid: TcxGrid;
    ListView: TcxGridDBTableView;
    ListLevel: TcxGridLevel;
    procedure DataSetAfterDelete(DataSet: TDataSet);
    procedure DataSetBeforeDelete(DataSet: TDataSet);
    procedure DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DataSetBeforePost(DataSet: TDataSet);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure DataSetBeforeInsert(DataSet: TDataSet);
  private
    FWhereSql: RawUTF8;
    FDataSetIsLoading: Boolean;
    FUpdateSql: RawUTF8;
    FSelectSql: RawUTF8;
    FDlgClass: TCustomRecClass;
    FData: Variant;
    procedure SetRecordClass(const Value: TCustomRecordClassArray);
    procedure SetSelectSql(const Value: RawUTF8);
    procedure SetUpdateSql(const Value: RawUTF8);
    procedure SetWhereSql(const Value: RawUTF8);

    procedure ShowEditDlg(aID: Integer);
    procedure DoDblClickOrEnter;
    procedure OpenEditFormByID(aID: Integer);
    procedure OpenEditFormByData(aData: string);
  protected
    FRecordClass: TCustomRecordClassArray;
    procedure PostRecord; virtual;
  public
    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace);

    property DataSetIsLoading: Boolean read FDataSetIsLoading write FDataSetIsLoading;

    property RecordClass: TCustomRecordClassArray read FRecordClass write SetRecordClass;
    property UpdateSql: RawUTF8 read FUpdateSql write SetUpdateSql;
    property SelectSql: RawUTF8 read FSelectSql write SetSelectSql;
    property WhereSql: RawUTF8 read FWhereSql write SetWhereSql;

    property DlgClass: TCustomRecClass read FDlgClass;

    property Data: Variant read FData write FData;
  end;

//var
//  CustomListFrame: TCustomListFrame;

implementation

uses
  uFormsManager, uBaseFormInterface,
  uSettings;

{$R *.dfm}

{ TCustomListFrame }

procedure TCustomListFrame.DataSetAfterDelete(DataSet: TDataSet);
begin
  if Assigned(Parent) and (Parent is TForm) then
    TForm(Parent).FocusControl(ListGrid);
end;

procedure TCustomListFrame.DataSetBeforeDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  Settings.Client.Delete(RecordClass[0], DataSet.FieldByName('ID').AsInteger);
end;

procedure TCustomListFrame.DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  FillDataSet(cdsReplace);
  Abort;
end;

procedure TCustomListFrame.DataSetBeforeInsert(DataSet: TDataSet);
var
  aData: Variant;
begin
  if DataSetIsLoading then
    Exit;

  TDocVariant.New(aData);
  aData.ID := 0;
  aData.Client := FData.Client;
//  OpenEditFormByID(0);
  OpenEditFormByData(aData);
  Abort;
end;

procedure TCustomListFrame.DataSetBeforePost(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  PostRecord;
end;

procedure TCustomListFrame.DoDblClickOrEnter;
//var
//  aFormClass: TFormClass;
//  aSubscriber: string;
//  aIntf: IBaseForm;
begin
  if not DataSet.Eof then
    OpenEditFormByID(DataSet.FieldByName('ID').AsInteger)
  else
    OpenEditFormByID(0);
{
  if Assigned(FDlgClass) then
    //MainForm.OpenForm(FDlgClass, DataSet.FieldByName('Id').AsInteger, Self, False)
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialog, DataSet.FieldByName('Id').AsInteger)
  else
  begin
    if Assigned(Owner) and (Supports(Owner, IBaseForm, aIntf)) then
      aSubscriber := aIntf.GetFormGUID
    else
      aSubscriber := '';

    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, DataSet.FieldByName('Id').AsInteger, aSubscriber)
    else
    begin
      //DataSet.Edit;
      ShowEditDlg(DataSet.FieldByName('Id').AsInteger);
    end;
  end;
}
end;

procedure TCustomListFrame.FillDataSet(aMode: TClientDataSetMode);
var
  b: TBookmark;
  aTable: TSQLTable;
begin
  if DataSetIsLoading then
    Exit;

  InitLookups;

  // получаем данные с сервера
  aTable := Settings.Client.List(RecordClass, SelectSql, WhereSql);


  // чтобы не реагирвоть на Post и Insert отмечаем, что мы в режиме загрузки
  DataSetIsLoading := True;
  try
    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet;
      //RefDataSet.Open;

    DataSet.LogChanges := False;

    if aMode in [cdsReplace, cdsAppend] then
    begin
      // обновляем данные - сохраняем позицию
      b := DataSet.Bookmark;
      ToClientDataSet(DataSet, aTable, Settings.Client, aMode);
      try
        DataSet.Bookmark := b;
      except
        on e: EDatabaseError do
          DataSet.First;
      end;
    end
    else
    begin
      // заполняем новыми данными
      ToClientDataSet(DataSet, aTable, Settings.Client, cdsReplace);
      DataSource.DataSet := DataSet;
    end;
  finally
    DataSetIsLoading := False;
    aTable.Free;
  end;
  //RefDataSet.LogChanges := True;
end;

procedure TCustomListFrame.ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DoDblClickOrEnter;
end;

procedure TCustomListFrame.ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if ListView.Controller.FocusedRecord is TcxGridDataRow then
        DoDblClickOrEnter;
      //Key := 0;
    end;
  end;
end;

procedure TCustomListFrame.OpenEditFormByData(aData: string);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    TFormsManager.Instance.OpenDataFormByClass(FDlgClass, ftDialog, aData, GetFormGUID)
  else
  begin

    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenDataForm(FRecordClass[0], ftDialog, aData, GetFormGUID)
    else
    begin
      //DataSet.Edit;
      ShowEditDlg(StrToIntDef(aData, 0));
    end;
  end;
end;

procedure TCustomListFrame.OpenEditFormByID(aID: Integer);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialog, aID, GetFormGUID)
  else
  begin

    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, aID, GetFormGUID)
    else
    begin
      //DataSet.Edit;
      ShowEditDlg(aID);
    end;
  end;
end;

procedure TCustomListFrame.PostRecord;
begin

end;

procedure TCustomListFrame.SetRecordClass(const Value: TCustomRecordClassArray);
begin
  FRecordClass := Value;
end;

procedure TCustomListFrame.SetSelectSql(const Value: RawUTF8);
begin
  FSelectSql := Value;
end;

procedure TCustomListFrame.SetUpdateSql(const Value: RawUTF8);
begin
  FUpdateSql := Value;
end;

procedure TCustomListFrame.SetWhereSql(const Value: RawUTF8);
begin
  FWhereSql := Value;
end;

procedure TCustomListFrame.ShowEditDlg(aID: Integer);
var
  r: TSQLRecord;
  f: TRecordEditForm;
begin
  r := RecordClass[0].Create();
  f := TRecordEditForm.Create(self);
  try
    Settings.Client.Retrieve(aID, r);
    f.SetRecord(Settings.Client, r);
    if f.ShowModal = mrOk then
      Settings.Client.AddOrUpdate(r);
  finally
    f.Free;
    r.Free;
  end;
end;

end.
