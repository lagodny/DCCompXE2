unit uCustomList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, JvComponentBase, JvFormPlacement, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Datasnap.DBClient,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Grids,
  Vcl.DBGrids, Vcl.ActnList, Vcl.Menus,
  uCustomRec,
  SynCommons,
  mORMot, mORMotMidasVCL,
  cxGridCustomPopupMenu, cxGridPopupMenu
  ;

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
    aRefresh: TAction;
    aApplyData: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    aCancel: TAction;
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
  private
    FDataSetIsLoading: Boolean;
    procedure SetRecordClass(const Value: TCustomRecordClassArray);
    procedure SetSelectSql(const Value: RawUTF8);
    procedure SetWhereSql(const Value: RawUTF8);
    procedure SetUpdateSql(const Value: RawUTF8);
  protected
    FRecordClass: TCustomRecordClassArray;
    FSelectSql: RawUTF8;
    FUpdateSql: RawUTF8;
    FWhereSql: RawUTF8;
    FDlgClass: TCustomRecClass;

    procedure ReadModel(aID: Integer); override;

    // необходимо переопределить у наследников
    procedure InitCustomProps; virtual;
    procedure PostRecord; virtual;

    procedure DoPostRecord;

    function DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean; override;

  public
    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace); virtual;

    property DataSetIsLoading: Boolean read FDataSetIsLoading write FDataSetIsLoading;

    property RecordClass: TCustomRecordClassArray read FRecordClass write SetRecordClass;
    property UpdateSql: RawUTF8 read FUpdateSql write SetUpdateSql;
    property SelectSql: RawUTF8 read FSelectSql write SetSelectSql;
    property WhereSql: RawUTF8 read FWhereSql write SetWhereSql;

    property DlgClass: TCustomRecClass read FDlgClass;

    procedure ShowEditDlg(aID: Integer);

  end;

//var
//  RefList: TCustomList;

implementation

{$R *.dfm}

uses
  mORMoti18n, mORMotUIEdit, mORMotUILogin,
  uSettings,
  uDelta;

procedure TCustomList.aApplyDataExecute(Sender: TObject);
begin
  inherited;
  DataSet.ApplyUpdates(0);
end;

procedure TCustomList.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCustomList.aRefreshExecute(Sender: TObject);
begin
  FillDataSet(cdsReplace);
end;

procedure TCustomList.FillDataSet(aMode: TClientDataSetMode);
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
  inherited;

  InitCustomProps;

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

procedure TCustomList.IniTCustomProps;
begin
//  FRecordClass := TSQLPlant;
//  FSelectSql := 'ID, Title';
end;

procedure TCustomList.PostRecord;
begin
//  Нужно переопределить у наследников
  DoPostRecord;
end;

procedure TCustomList.ReadModel(aID: Integer);
begin
  FillDataSet(cdsNew);

  if Length(FRecordClass) = 1 then
    DataSet.ReadOnly := not Settings.Client.GetTableRight(FRecordClass[0], soUpdate);

  if aID <> 0 then
    if DataSet.Locate('ID', aID, []) then
      ListView.Focused := True;
end;

procedure TCustomList.DataSetAfterDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  FocusControl(ListGrid);
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

procedure TCustomList.DoPostRecord;
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
  aRecord := RecordClass[0].Create;
  try
    aRecord.IDValue := DataSet.FieldByName('ID').AsInteger;

    fillchar(ModifiedFields, sizeof(ModifiedFields), 0);
    aClassType := PPointer(aRecord)^;
    for i := 0 to aClassType.RecordProps.Fields.Count - 1 do
    begin
      P := aClassType.RecordProps.Fields.List[i];
      if (P.SQLFieldTypeStored in [
          sftRecord, sftTID, sftBlob, sftBlobDynArray, sftBlobCustom, sftUTF8Custom,
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

        sftInteger, sftID, sftEnumerate:
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

procedure TCustomList.SetWhereSql(const Value: RawUTF8);
begin
  FWhereSql := Value;
end;

procedure TCustomList.ShowEditDlg(aID: Integer);
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

initialization
  RegisterClasses([TCustomList]);
  RegisterClasses([TActionList, TAction]);
  RegisterClasses([TDataSource, TClientDataSet]);
  RegisterClasses([TcxGrid, TcxGridDBTableView, TcxGridLevel, TcxGridPopupMenu]);


end.
