unit uCustomList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Grids,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, Vcl.ActnList, Vcl.Menus,
  Data.DB, Datasnap.DBClient,
  uBaseForm, uBaseFormInterface,
  JvComponentBase, JvFormPlacement,
  cxGraphics, cxControls, cxLookAndFeels, cxDBData,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  //uCustomRec,
  SynCommons, mORMot, mORMotMidasVCL,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxNavigator,
  //TB2Dock, SpTBXItem, TB2Item, TB2Toolbar,
  cxDBNavigator, dxBarExtItems, dxBar, dxSkinsCore, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu

  , uClientIntf
  ;

resourcestring
  sNoRecordToEdit = 'No record to edit';
  sNoIDField = 'No ID field';
  sIDFieldIsNull = 'ID field is NULL';

type
  TCustomRecordClassArray =  array of TSQLRecordClass;

  TCustomList = class(TBaseForm)
    DataSource: TDataSource;
    ListGrid: TcxGrid;
    ListView: TcxGridDBTableView;
    ListLevel: TcxGridLevel;
    DataSet: TClientDataSet;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    aNew: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aSelect: TAction;
    aRefresh: TAction;
    aApplyData: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    aCancel: TAction;
    dxBarManager1: TdxBarManager;
    dxBarNavigator: TdxBar;
    dxcNavigator: TdxBarControlContainerItem;
    ListNavigator: TcxDBNavigator;
    dxBarButton1: TdxBarButton;
    pmiSelect: TMenuItem;
    pmiDivSelect: TMenuItem;
    pmiCopyText: TMenuItem;
    pmiCopyValues: TMenuItem;
    pmiPasteValues: TMenuItem;
    pmiDivClipboard: TMenuItem;
    pmiClone: TMenuItem;
    pmiDivClone: TMenuItem;
    aEditInline: TAction;
    pmiEditInline: TMenuItem;
    divParams: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DataSetBeforePost(DataSet: TDataSet);
    procedure aRefreshExecute(Sender: TObject);
    procedure DataSetBeforeDelete(DataSet: TDataSet);
    procedure DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DataSetBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure aApplyDataExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DataSetAfterDelete(DataSet: TDataSet);
    procedure ListNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
    procedure ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure ListViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit;
      var Key: Word; Shift: TShiftState);
    procedure aSelectExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pmiCopyValuesClick(Sender: TObject);
    procedure pmiPasteValuesClick(Sender: TObject);
    procedure pmiCopyTextClick(Sender: TObject);
    procedure pmiCloneClick(Sender: TObject);
    procedure aEditInlineExecute(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
  private
    FDataSetIsLoading: Boolean;
    FEditInLine: Boolean;
    FClient: IClient;
    procedure SetRecordClass(const Value: TCustomRecordClassArray);
    procedure SetSelectSql(const Value: RawUTF8);
    procedure SetWhereSql(const Value: RawUTF8);
    procedure SetUpdateSql(const Value: RawUTF8);
    procedure SetEditInLine(const Value: Boolean);
    function GetDefRecClass: TSQLRecordClass;
    procedure SetDefRecClass(const Value: TSQLRecordClass);


  protected
    FListViewVer: Integer;

    FRecordClass: TCustomRecordClassArray;
    FSelectSql: RawUTF8;
    FUpdateSql: RawUTF8;
    FWhereSql: RawUTF8;
    //FDlgClass: TCustomRecClass;

    function GetSelectSql: RawUTF8; virtual;
    function GetWhereSql: RawUTF8; virtual;

    function GetCurrentRecordID: Integer; virtual;
    procedure CloneRecord(aID: Integer); virtual;
    procedure CloneCurrentRecord; virtual;

    procedure CopyValues;
    procedure PasteValues;

    procedure DoDblClickOrEnter;

    procedure LoadSettings; override;
    procedure SaveSettings; override;

    procedure ReadModel(aID: Integer); override;

    // необходимо переопределить у наследников
    procedure InitCustomProps; virtual;

    procedure NewRecord; virtual;
    procedure EditRecord(aID: Integer); virtual;
    procedure EditCurrentRecord; virtual;
    procedure PostRecord; virtual;

    procedure DoPostRecord_Old;

    function DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean; override;

  public
    procedure SetUserShowHint(aValue: Boolean); override;

    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace; aInitLookups: Boolean = False); virtual;

    property DataSetIsLoading: Boolean read FDataSetIsLoading write FDataSetIsLoading;

    property Client: IClient read FClient write FClient;

    property DefRecClass: TSQLRecordClass read GetDefRecClass write SetDefRecClass;
    property RecordClass: TCustomRecordClassArray read FRecordClass write SetRecordClass;
    property UpdateSql: RawUTF8 read FUpdateSql write SetUpdateSql;
    property SelectSql: RawUTF8 read GetSelectSql write SetSelectSql;
    property WhereSql: RawUTF8 read GetWhereSql write SetWhereSql;

    //property DlgClass: TCustomRecClass read FDlgClass;
    property EditInLine: Boolean read FEditInLine write SetEditInLine;

    procedure ShowEditDlg(aID: Integer);
    procedure ShowEditDlgByClass(aID: Integer; aClass: TSQLRecordClass; aReadOnly: Boolean);

  end;

//var
//  RefList: TCustomList;

implementation

{$R *.dfm}

uses
  SynTable,
  mORMoti18n,
  //mORMotUIEdit,
  UIEdit,
  mORMotUILogin,
  uAppStorage,
  uFormsManager,
  uSettings,
  ucxCustomDataFrame,
  ucxGridProc, uDataProc, uDelta;


procedure TCustomList.aApplyDataExecute(Sender: TObject);
begin
  inherited;
  DataSet.ApplyUpdates(0);
end;

procedure TCustomList.aCancelExecute(Sender: TObject);
begin
  if DataSet.State in dsEditModes then
  begin
    DataSet.Cancel;
    Exit;
  end;

  ModalResult := mrCancel;
end;

procedure TCustomList.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  aSelect.Enabled := not DataSet.Eof;
end;

procedure TCustomList.aEditExecute(Sender: TObject);
begin
  EditCurrentRecord;
end;

procedure TCustomList.aEditInlineExecute(Sender: TObject);
begin
  EditInLine := aEditInline.Checked;
end;

procedure TCustomList.aNewExecute(Sender: TObject);
begin
  EditRecord(0);
end;

procedure TCustomList.aRefreshExecute(Sender: TObject);
begin
  FillDataSet(cdsReplace);
end;

procedure TCustomList.aSelectExecute(Sender: TObject);
begin
  DoDblClickOrEnter;
end;

procedure TCustomList.pmiCloneClick(Sender: TObject);
begin
  CloneCurrentRecord;
end;

procedure TCustomList.pmiCopyTextClick(Sender: TObject);
begin
  ListView.CopyToClipboard(False);
end;

procedure TCustomList.CloneCurrentRecord;
begin
  CloneRecord(GetCurrentRecordID);
end;

procedure TCustomList.CloneRecord(aID: Integer);
var
  aNewID: Integer;
  aRecord: TSQLRecord;
begin
  aRecord := FRecordClass[0].Create(Settings.Client, aID);
  try
    aRecord.IDValue := 0;
    aNewID := Settings.Client.Add(aRecord, True);
    FillDataSet;
    DataSet.Locate('ID', aNewID, []);
  finally
    aRecord.Free;
  end;
end;

procedure TCustomList.CopyValues;
begin
  CopyValuesToClipboard(ListView);
end;

procedure TCustomList.pmiCopyValuesClick(Sender: TObject);
begin
  CopyValues;
end;

procedure TCustomList.FillDataSet(aMode: TClientDataSetMode; aInitLookups: Boolean);
var
  b: TBookmark;
  aTable: TSQLTable;
begin
  if DataSetIsLoading then
    Exit;

  if aInitLookups then
    InitLookups;

  // получаем данные с сервера
  if not Assigned(Settings.Client) then
    Exit;

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
      //ToClientDataSet(RefDataSet, aTable, Settings.Client, aMode);
      DataSource.DataSet := DataSet;
    end;
  finally
    DataSetIsLoading := False;
    aTable.Free;
  end;
  //RefDataSet.LogChanges := True;
end;

procedure TCustomList.FormActivate(Sender: TObject);
begin
  inherited;
  ActionList.State := asNormal;
end;

procedure TCustomList.FormCreate(Sender: TObject);
begin
  //FListViewVer := 1;

  inherited;

  InitCustomProps;

  if (Settings.Client <> nil) and (Length(FRecordClass) > 0) then
  begin
    DataSet.ReadOnly := not Settings.Client.GetTableRight(FRecordClass[0], soUpdate);

    aNew.Enabled := Settings.Client.GetTableRight(FRecordClass[0], soInsert);
    aEdit.Enabled := Settings.Client.GetTableRight(FRecordClass[0], soUpdate);
    aDelete.Enabled := Settings.Client.GetTableRight(FRecordClass[0], soDelete);

    ListNavigator.Buttons.Insert.Enabled := aNew.Enabled;
    ListNavigator.Buttons.Append.Enabled := aNew.Enabled;
    ListNavigator.Buttons.Delete.Enabled := aDelete.Enabled;
    ListNavigator.Buttons.Edit.Enabled := aEdit.Enabled;

    ListView.OptionsData.Inserting := ListView.OptionsData.Inserting and aNew.Enabled;
    ListView.OptionsData.Appending := ListView.OptionsData.Appending and aNew.Enabled;
    ListView.OptionsData.Editing := ListView.OptionsData.Editing and aEdit.Enabled;
    ListView.OptionsData.Deleting := ListView.OptionsData.Deleting and aDelete.Enabled;
  end;

  ShowHint := Application.ShowHint;

//  FillDataSet(cdsNew);
//
//  if Length(FRecordClass) = 1 then
//    DataSet.ReadOnly := not Settings.Client.GetTableRight(FRecordClass[0], soUpdate);
//
//  if ID <> 0 then
//    DataSet.Locate('ID', ID, []);
end;

procedure TCustomList.FormDeactivate(Sender: TObject);
begin
  inherited;
  ActionList.State := asSuspended;
end;

procedure TCustomList.FormShow(Sender: TObject);
begin
  aSelect.Visible := OpenFormType in [ftSelect, ftSelectModal];
end;

function TCustomList.GetCurrentRecordID: Integer;
var
  aIDField: TField;
begin
  if DataSet.Eof then
    raise Exception.Create(sNoRecord);

  aIDField := DataSet.FieldByName('ID');
  if not Assigned(aIDField) then
    raise Exception.Create(sNoIDField);

  if aIDField.IsNull then
    raise Exception.Create(sIDFieldIsNull);

  Result := aIDField.AsInteger;
end;

function TCustomList.GetDefRecClass: TSQLRecordClass;
begin
  if Length(FRecordClass) > 0 then
    Result := FRecordClass[0]
  else
    Result := nil;
end;

function TCustomList.GetSelectSql: RawUTF8;
begin
  if FSelectSql = '' then
    FSelectSql := uDataProc.GetCSVDataSetFields(DataSet);

  Result := FSelectSql;
end;

function TCustomList.GetWhereSql: RawUTF8;
begin
  Result := FWhereSql;
end;

procedure TCustomList.IniTCustomProps;
begin
//  FRecordClass := TSQLPlant;
//  FSelectSql := 'ID, Title';
  FSelectSql := GetCSVDataSetFields(DataSet);
end;

procedure TCustomList.ListNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  if EditInLine then
  begin
    ADone := False;
    Exit;
  end;

  if AButtonIndex = NBDI_EDIT then
  begin
    EditCurrentRecord;
    ADone := True;
  end
  else if AButtonIndex = NBDI_INSERT then
  begin
    NewRecord;
    ADone := True;
  end;
end;

procedure TCustomList.ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DoDblClickOrEnter;
end;

procedure TCustomList.ListViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      DoDblClickOrEnter;
  end;
end;

procedure TCustomList.ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      DoDblClickOrEnter;
  end;
end;

procedure TCustomList.LoadSettings;
begin
  inherited;
  EditInLine := AppStorage.ReadBool(FormSectionName, 'EditInLine', EditInLine);
  LoadGridSettings(ListView, FormSectionName, FListViewVer);
end;

procedure TCustomList.NewRecord;
begin
  EditRecord(0);
end;

procedure TCustomList.PasteValues;
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

procedure TCustomList.pmiPasteValuesClick(Sender: TObject);
begin
  PasteValues;
end;

procedure TCustomList.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  aEditInline.Checked := EditInLine;
end;

procedure TCustomList.PostRecord;
begin
//  Нужно переопределить у наследников
//  DoPostRecord;
  if not Assigned(Settings.Client) then
    Exit;

  RestPostRecord(Settings.Client, FRecordClass[0], DataSet, ListView, False);
end;

procedure TCustomList.ReadModel(aID: Integer);
begin
  if not Assigned(Settings.Client) then
    Exit;

  FillDataSet(cdsNew);

//  if Length(FRecordClass) = 1 then
//    DataSet.ReadOnly := not Settings.Client.GetTableRight(FRecordClass[0], soUpdate);

  if aID <> 0 then
    if DataSet.Locate('ID', aID, []) then
      ListView.Focused := True;
end;

procedure TCustomList.DataSetAfterDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  if ListGrid.CanFocusEx then
    ListGrid.SetFocus;
end;

procedure TCustomList.DataSetBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
var
  cds: TClientDataSet;
begin
  inherited;
  cds := TClientDataSet.Create(nil);
  try
  //  ShowMessage(OwnerData);
    TDeltaForm.ShowDelta(DataSet);
    cds.Data := DataSet.Delta;
    //ShowMessage(IntToStr(cds.RecordCount));
  finally
    cds.Free;
  end;
  //OwnerData := null;
  Abort;
end;

procedure TCustomList.DataSetBeforeDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  if not Assigned(Settings.Client) then
    Exit;

  Settings.Client.Delete(RecordClass[0], DataSet.FieldByName('ID').AsInteger);
end;

procedure TCustomList.DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  FillDataSet(cdsReplace);
  Abort;
end;

procedure TCustomList.DataSetBeforePost(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  PostRecord;
end;

procedure TCustomList.DoDblClickOrEnter;
begin
  if DataSet.State in [dsEdit] then
    Exit;

  case OpenFormType of
    ftList:
      if not EditInLine then
        EditRecord(DataSet.FieldByName('ID').AsInteger);
      //aEditExecute(Self);

    ftSelect, ftSelectModal:
    begin
      if DataSet.State in dsEditModes then
        DataSet.Post;

//      NotifySubscriber(noItemSelected, DataSet['ID'], '');
      NotifySubscriber(noItemSelected, DataSet['ID'], GetData);
      if OpenFormType = ftSelectModal then
        ModalResult := mrOk;
    end;

    ftDialog, ftDialogModal: ;
  end;
end;

function TCustomList.DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean;
begin
  Result := False;
  case aOperation of
    noRefresh:
    begin
      FillDataSet(cdsReplace);
      Exit(True);
    end;

    noItemSelected: ;
    noNone: ;
  end;
end;

procedure TCustomList.DoPostRecord_Old;
var
  aClassType: TSQLRecordClass;
  P: TSQLPropInfo;
  TimeLog: TTimeLogBits;
  ModifiedFields: TSQLFieldBits;
  U: RawUTF8;
  FieldIndex: Integer;
  ErrMsg: string;

  i: Integer;
  aRecord: TSQLRecord;
  aField: TField;
begin
  if not Assigned(Settings.Client) then
    Exit;

  aRecord := RecordClass[0].Create;
  try
    aRecord.IDValue := DataSet.FieldByName('ID').AsInteger;

    fillchar(ModifiedFields, sizeof(ModifiedFields), 0);
    aClassType := PPointer(aRecord)^;
    for i := 0 to aClassType.RecordProps.Fields.Count - 1 do
    begin
      P := aClassType.RecordProps.Fields.List[i];
      if (P.SQLFieldTypeStored in [
          sftRecord, {sftTID, }sftBlob, sftBlobDynArray, sftBlobCustom, sftUTF8Custom,
          sftModTime, sftCreateTime, sftMany]) then
        Continue;

      aField := DataSet.FindField(U2S(p.Name));
      if not Assigned(aField) then
        Continue;

      case P.SQLFieldTypeStored of
        sftDateTime, sftDateTimeMS:
        begin
          P.SetValue(aRecord, pointer(DateTimeToIso8601Text(aField.AsDateTime, 'T', true)), true);
          Include(ModifiedFields, i);
        end;

        sftTimeLog, sftModTime:
        begin
          TimeLog.From(aField.AsDateTime);
          P.SetValue(aRecord, pointer(Int64ToUtf8(TimeLog.Value)), false);
          Include(ModifiedFields, i);
        end;

        sftUnixTime:
        begin
          P.SetValue(aRecord, pointer(Int64ToUtf8(DateTimeToUnixTime(aField.AsDateTime))), false);
          Include(ModifiedFields, i);
        end;

        sftUnixMSTime:
        begin
          P.SetValue(aRecord, pointer(Int64ToUtf8(DateTimeToUnixMSTime(aField.AsDateTime))), false);
          Include(ModifiedFields, i);
        end;

        sftFloat:
        begin
          P.SetValue(aRecord, Pointer(DoubleToStr(aField.AsFloat)), False);
          Include(ModifiedFields, i);
        end;

        sftInteger, sftID, sftTID, sftEnumerate:
        begin
          P.SetValue(aRecord, Pointer(Int32ToUTF8(integer(aField.AsInteger))), False);
          Include(ModifiedFields, i);
        end;

        sftAnsiText, sftUTF8Text, sftUTF8Custom:
        begin
          U := S2U(aField.AsString);
          P.SetValue(aRecord, pointer(U), true); // do conversion for every string type
          Include(ModifiedFields, i);
          //p.SetVariant(aRecord, aField.AsVariant);
        end;

        sftBoolean:
        begin
          P.SetValue(aRecord, pointer(Int32ToUTF8(integer(aField.AsBoolean))), false);
          Include(ModifiedFields, i);
        end

        else
          raise Exception.CreateFmt('Cannot perform type %s', [GetCaptionFromEnum(TypeInfo(TSQLFieldType), Ord(P.SQLFieldTypeStored))]);

      end;
    end;

    // perform all registered filtering
    aRecord.Filter(ModifiedFields);

    // perform content validation
    FieldIndex := -1;
    ErrMsg := aRecord.Validate(Settings.Client, ModifiedFields, @FieldIndex);
    if ErrMsg <> '' then
    begin
      // invalid field content -> show message, focus component and abort saving
      if FieldIndex < aClassType.RecordProps.Fields.Count then
      begin
        P := aClassType.RecordProps.Fields.List[FieldIndex];
        for i := 0 to ListView.ColumnCount - 1 do
        begin
          if ListView.Columns[i] is TcxGridDBColumn then
            if SameText(TcxGridDBColumn(ListView.Columns[i]).DataBinding.FieldName, U2S(p.Name)) then
            begin
              ListView.Columns[i].Focused := True;
              Break;
            end;
        end;
        Application.ProcessMessages;
        mORMotUILogin.ShowMessage(ErrMsg, Format(sInvalidFieldN, [p.Name]), true);
      end
      else
        mORMotUILogin.ShowMessage(ErrMsg, Format(sInvalidFieldN, ['?']), true);

      Abort;
    end
    else
    begin
      //Settings.Client.AddOrUpdate(aRecord);
      if aRecord.ID = 0 then
        Settings.Client.Add(aRecord, ModifiedFields)
      else
        Settings.Client.Update(aRecord, ModifiedFields);

    end;
  finally
    aRecord.Free;
  end;
end;

procedure TCustomList.EditCurrentRecord;
var
  aIDField: TField;
begin
  if DataSet.Eof then
    raise Exception.Create(sNoRecordToEdit);

  aIDField := DataSet.FieldByName('ID');
  if not Assigned(aIDField) then
    raise Exception.Create(sNoIDField);

  if aIDField.IsNull then
    raise Exception.Create(sIDFieldIsNull);

  EditRecord(aIDField.AsInteger);
end;

procedure TCustomList.EditRecord(aID: Integer);
var
  aFormClass: TFormClass;
  aEditMode: TOpenEditMode;
begin
  if aEdit.Enabled then
    aEditMode := oemEdit
  else
    aEditMode := oemView;

  aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
  if Assigned(aFormClass) then
    TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, aID, FormGUID, aEditMode)
  else
    ShowEditDlg(aID);
end;

procedure TCustomList.SaveSettings;
begin
  inherited;
  AppStorage.WriteBool(FormSectionName, 'EditInLine', EditInLine);
  SaveGridSettings(ListView, FormSectionName);
end;

procedure TCustomList.SetDefRecClass(const Value: TSQLRecordClass);
begin
  if Length(FRecordClass) = 0 then
    SetLength(FRecordClass, 1);
  FRecordClass[0] := Value;
end;

procedure TCustomList.SetEditInLine(const Value: Boolean);
begin
  FEditInLine := Value;
end;

procedure TCustomList.SetRecordClass(const Value: TCustomRecordClassArray);
begin
  FRecordClass := Value;
end;

procedure TCustomList.SetSelectSql(const Value: RawUTF8);
begin
  FSelectSql := Value;
end;

procedure TCustomList.SetUpdateSql(const Value: RawUTF8);
begin
  FUpdateSql := Value;
end;

procedure TCustomList.SetUserShowHint(aValue: Boolean);
begin
  inherited;
  ListView.OptionsBehavior.NavigatorHints := aValue;
  ListView.OptionsBehavior.CellHints := aValue;
  ListView.OptionsBehavior.ColumnHeaderHints := aValue;

  dxBarManager1.ShowHint := aValue;
  ListNavigator.ShowHint := aValue;
end;

procedure TCustomList.SetWhereSql(const Value: RawUTF8);
begin
  FWhereSql := Value;
end;

procedure TCustomList.ShowEditDlg(aID: Integer);
//var
//  r: TSQLRecord;
//  f: TRecordEditForm;
begin
  ShowEditDlgByClass(aID, RecordClass[0], not aEdit.Enabled);
//  if not Assigned(Settings.Client) then
//    Exit;
//
//  r := RecordClass[0].Create();
//  f := TRecordEditForm.Create(self);
//  try
//    Settings.Client.Retrieve(aID, r);
//    f.SetRecord(Settings.Client, r);
//    if f.ShowModal = mrOk then
//    begin
//      Settings.Client.AddOrUpdate(r);
//      FillDataSet(cdsReplace);
//    end;
//  finally
//    f.Free;
//    r.Free;
//  end;
end;

procedure TCustomList.ShowEditDlgByClass(aID: Integer; aClass: TSQLRecordClass; aReadOnly: Boolean);
var
  r: TSQLRecord;
  f: TRecordEditForm;
begin
  if not Assigned(Settings.Client) then
    Exit;

  r := aClass.Create();
  f := TRecordEditForm.Create(self);
  try
    Settings.Client.Retrieve(aID, r);
    f.SetRecord(Settings.Client, r);
    f.BtnSave.Enabled := not aReadOnly;

    if f.ShowModal = mrOk then
    begin
      Settings.Client.AddOrUpdate(r);
      FillDataSet(cdsReplace);
    end;
  finally
    f.Free;
    r.Free;
  end;
end;

initialization
  RegisterClasses([TCustomList]);
  RegisterClasses([TActionList, TAction]);
  RegisterClasses([TDataSource, TClientDataSet]);
  RegisterClasses([TcxGrid, TcxGridDBTableView, TcxGridLevel, TcxGridPopupMenu]);


end.
