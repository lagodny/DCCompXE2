unit ucxCustomDataFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Data.DB, Datasnap.DBClient,
  uBaseForm, uBaseFormInterface,
  SynCommons, mORMot, mORMotMidasVCL;

resourcestring
  sNoRecord = 'No record';
  sNoRecordToEdit = 'No record to edit';
  sNoIDField = 'No ID field';
  sIDFieldIsNull = 'ID field is NULL';


type
  TOnNewSQLRecord = procedure (aRecord: TSQLRecord) of object;

  TcxCustomDataFrame = class(TBaseFrame)
    DataSource: TDataSource;
    DataSet: TClientDataSet;
    DataSetID: TIntegerField;
    procedure DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DataSetBeforeInsert(DataSet: TDataSet);
    procedure DataSetBeforePost(DataSet: TDataSet);
    procedure DataSetBeforeDelete(DataSet: TDataSet);
    procedure DataSetBeforeEdit(DataSet: TDataSet);
  private
    FWhereSql: RawUTF8;
    FUpdateSql: RawUTF8;
    FSelectSql: RawUTF8;
    FEditInLine: Boolean;
    FDataSetIsLoading: Boolean;
    FData: Variant;
    FRoot: string;
    FOnNewSQLRecord: TOnNewSQLRecord;
    function GetSelectSql: RawUTF8;
    procedure SetEditInLine(const Value: Boolean);
    procedure SetRecordClass(const Value: TSQLRecordClassDynArray);
    procedure SetSelectSql(const Value: RawUTF8);
    procedure SetUpdateSql(const Value: RawUTF8);
    procedure SetWhereSql(const Value: RawUTF8);
    procedure SetRoot(const Value: string);
    procedure SetDataSetIsLoading(const Value: Boolean);
    function GetDefRecClass: TSQLRecordClass;
    procedure SetDefRecClass(const Value: TSQLRecordClass);
  protected
    FRecordClass: TSQLRecordClassDynArray;

    procedure ReadModel(aID: Integer); override;

    procedure NewRecord; virtual;

    function GetCurrentRecordID: Integer;

    procedure EditRecord(aID: Integer); virtual;
    procedure EditCurrentRecord; virtual;

    procedure CloneRecord(aID: Integer); virtual;
    procedure CloneCurrentRecord; virtual;

    procedure DoDataLoaded; virtual;

    procedure DoDblClickOrEnter;

    // Нужно переопределить у наследников
    procedure PostRecord; virtual;
    procedure FocusRecord; virtual;
  public
    procedure ShowEditDlg(aID: Integer);
    procedure ShowEditDlgByClass(aID: Integer; aClass: TSQLRecordClass);

    procedure OpenEditFormByID(aID: Integer);
    procedure OpenEditFormByData(aData: string);

    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace; aInitLookups: Boolean = True); virtual;

    property DefRecClass: TSQLRecordClass read GetDefRecClass write SetDefRecClass;
    property RecordClass: TSQLRecordClassDynArray read FRecordClass write SetRecordClass;
    property UpdateSql: RawUTF8 read FUpdateSql write SetUpdateSql;
    property SelectSql: RawUTF8 read GetSelectSql write SetSelectSql;
    property WhereSql: RawUTF8 read FWhereSql write SetWhereSql;

    property EditInLine: Boolean read FEditInLine write SetEditInLine;
    property DataSetIsLoading: Boolean read FDataSetIsLoading write SetDataSetIsLoading;

    property Data: Variant read FData write FData;
    property Root: string read FRoot write SetRoot;
  published
    property OnNewSQLRecord: TOnNewSQLRecord read FOnNewSQLRecord write FOnNewSQLRecord;
  end;

implementation

uses
  mORMoti18n,
  //mORMotUIEdit,
  UIEdit,
  mORMotUILogin,
  uFormsManager,
  uSettings,
  //ucxGridProc,
  uDataProc, uDelta;


{$R *.dfm}

{ TCustomDataFrame }

procedure TcxCustomDataFrame.CloneCurrentRecord;
begin
  CloneRecord(GetCurrentRecordID);
end;

procedure TcxCustomDataFrame.CloneRecord(aID: Integer);
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

procedure TcxCustomDataFrame.DataSetBeforeDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  Settings.Client.Delete(RecordClass[0], DataSetID.AsInteger);
end;

procedure TcxCustomDataFrame.DataSetBeforeEdit(DataSet: TDataSet);
begin
  if DataSetIsLoading or EditInLine then
    Exit;

  EditCurrentRecord;
  Abort;
end;

procedure TcxCustomDataFrame.DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  FillDataSet(cdsReplace);
  Abort;
end;

procedure TcxCustomDataFrame.DataSetBeforeInsert(DataSet: TDataSet);
begin
  if DataSetIsLoading or EditInLine then
    Exit;

  NewRecord;
  Abort;
end;

procedure TcxCustomDataFrame.DataSetBeforePost(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  PostRecord;
end;

procedure TcxCustomDataFrame.DoDataLoaded;
begin

end;

procedure TcxCustomDataFrame.DoDblClickOrEnter;
begin
  if DataSet.State in [dsEdit] then
    Exit;

  case GetOpenFormType of
    ftList, ftDialog:
    begin
      if EditInLine then
        Exit;

      if not DataSet.Eof then
        OpenEditFormByID(DataSetID.AsInteger)
      else
        OpenEditFormByID(0);
    end;

    ftSelect, ftSelectModal:
    begin
      if DataSet.State in dsEditModes then
        DataSet.Post;

      NotifySubscriber(noItemSelected, DataSet['ID'], '');
      if (GetOpenFormType = ftSelectModal) and (Owner is TForm) then
        TForm(Owner).ModalResult := mrOk;
    end;

    ftDialogModal: ;
  end;


end;

procedure TcxCustomDataFrame.EditCurrentRecord;
begin
  EditRecord(GetCurrentRecordID);
end;

procedure TcxCustomDataFrame.EditRecord(aID: Integer);
var
  aFormClass: TFormClass;
begin
  aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
  if Assigned(aFormClass) then
    TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, aID, GetFormGUID)
  else
    ShowEditDlg(aID);
end;

procedure TcxCustomDataFrame.FillDataSet(aMode: TClientDataSetMode; aInitLookups: Boolean);
var
  b: TBookmark;
  aTable: TSQLTable;
  procedure AppendRoot(aRootTitle: string);
  var
    aField: TField;
  begin
    if aRootTitle = '' then
//      aRootTitle := 'Root';
      Exit;

    if not (Assigned(DataSet.FindField('ID')) and Assigned(DataSet.FindField('Title')) and Assigned(DataSet.FindField('Parent'))) then
      Exit;

    DataSet.Append;
    DataSet.FieldByName('ID').AsInteger := 0;
    DataSet.FieldByName('Title').AsString := aRootTitle;
    DataSet.FieldByName('Parent').AsInteger := -1;
    DataSet.Post;
  end;
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

    DataSet.LogChanges := False;
    DataSet.DisableControls;

    if aMode in [cdsReplace, cdsAppend] then
    begin
      // обновляем данные - сохраняем позицию
      b := DataSet.Bookmark;
      DataSet.EmptyDataSet;
      AppendRoot(Root);
      ToClientDataSet(DataSet, aTable, Settings.Client, cdsAppend);
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
      DataSet.EmptyDataSet;
      AppendRoot(Root);
      ToClientDataSet(DataSet, aTable, Settings.Client, cdsAppend);
      DataSource.DataSet := DataSet;
    end;
    DataSet.EnableControls;
  finally
    DataSetIsLoading := False;
    aTable.Free;
  end;
  //RefDataSet.LogChanges := True;
end;

procedure TcxCustomDataFrame.FocusRecord;
begin

end;

function TcxCustomDataFrame.GetCurrentRecordID: Integer;
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

function TcxCustomDataFrame.GetDefRecClass: TSQLRecordClass;
begin
  if Length(FRecordClass) > 0 then
    Result := FRecordClass[0]
  else
    Result := nil;
end;

function TcxCustomDataFrame.GetSelectSql: RawUTF8;
begin
  if FSelectSql = '' then
    FSelectSql := uDataProc.GetCSVDataSetFields(DataSet);

  Result := FSelectSql;
end;

procedure TcxCustomDataFrame.NewRecord;
begin
  EditRecord(0);
end;

procedure TcxCustomDataFrame.OpenEditFormByData(aData: string);
var
  aFormClass: TFormClass;
begin
  aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
  if Assigned(aFormClass) then
    TFormsManager.Instance.OpenDataForm(FRecordClass[0], ftDialog, aData, GetFormGUID)
  else
    ShowEditDlg(StrToIntDef(aData, 0));
end;

procedure TcxCustomDataFrame.OpenEditFormByID(aID: Integer);
var
  aFormClass: TFormClass;
begin
  aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
  if Assigned(aFormClass) then
    TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, aID, GetFormGUID)
  else
    ShowEditDlg(aID);
end;

procedure TcxCustomDataFrame.PostRecord;
begin
//  Нужно переопределить у наследников
//  if not Assigned(Settings.Client) then
//    Exit;
//
//  RestPostRecord(Settings.Client, FRecordClass[0], DataSet, ListView, False);
end;

procedure TcxCustomDataFrame.ReadModel(aID: Integer);
begin
  if not Assigned(Settings.Client) then
    Exit;

  FillDataSet(cdsNew);

  if Length(FRecordClass) = 1 then
    DataSet.ReadOnly := not Settings.Client.GetTableRight(FRecordClass[0], soUpdate);

  if aID <> 0 then
    if DataSet.Locate('ID', aID, []) then
      FocusRecord;
//      ListView.Focused := True;
end;

procedure TcxCustomDataFrame.SetDataSetIsLoading(const Value: Boolean);
begin
  if FDataSetIsLoading = Value then
    Exit;

  FDataSetIsLoading := Value;
  if not FDataSetIsLoading then
    DoDataLoaded;
end;

procedure TcxCustomDataFrame.SetDefRecClass(const Value: TSQLRecordClass);
begin
  if Length(FRecordClass) = 0 then
    SetLength(FRecordClass, 1);
  FRecordClass[0] := Value;
end;

procedure TcxCustomDataFrame.SetEditInLine(const Value: Boolean);
begin
  FEditInLine := Value;
end;

procedure TcxCustomDataFrame.SetRecordClass(const Value: TSQLRecordClassDynArray);
begin
  FRecordClass := Value;
end;

procedure TcxCustomDataFrame.SetRoot(const Value: string);
begin
  FRoot := Value;
end;

procedure TcxCustomDataFrame.SetSelectSql(const Value: RawUTF8);
begin
  FSelectSql := Value;
end;

procedure TcxCustomDataFrame.SetUpdateSql(const Value: RawUTF8);
begin
  FUpdateSql := Value;
end;

procedure TcxCustomDataFrame.SetWhereSql(const Value: RawUTF8);
begin
  FWhereSql := Value;
end;

procedure TcxCustomDataFrame.ShowEditDlg(aID: Integer);
begin
  ShowEditDlgByClass(aID, RecordClass[0]);
end;

procedure TcxCustomDataFrame.ShowEditDlgByClass(aID: Integer; aClass: TSQLRecordClass);
var
  r: TSQLRecord;
  f: TRecordEditForm;
begin
  if not Assigned(Settings.Client) then
    Exit;

  r := aClass.Create();
  f := TRecordEditForm.Create(self);
  try
    if not Settings.Client.Retrieve(aID, r) then
      if Assigned(OnNewSQLRecord) then
        OnNewSQLRecord(r);

    f.SetRecord(Settings.Client, r);
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

end.
