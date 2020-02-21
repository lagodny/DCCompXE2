unit uDataProc;

interface

uses
  Classes,
  System.SysUtils,
  System.Math,
  Vcl.Controls,
  Vcl.Menus,
  DB, Datasnap.DBClient,
  cxEdit, cxTextEdit,
  cxDBLookupComboBox,
  cxButtonEdit,
  cxDropDownEdit,
  cxTL,
  cxGridTableView, cxGridDBTableView, cxGridDBBandedTableView, cxGridCustomTableView, cxGridDBDataDefinitions,
  SynCommons, SynTable,
  mORMot, mORMotMidasVCL;

const
  cNullStr = '<Null>';

type
  ECheckDataException = class(Exception)

  end;

procedure CheckEditValue(aControl: TWinControl; aCondition: Boolean; aMessage: string);

function GetCSVDataSetFields(DataSet: TDataSet; aForUpdate: Boolean = False): string;

function Remove_AS(aStr: string): string;
function Remove_BeforeAS(aStr: string): string;
function SQL2IndexFieldsNames(aStr: string): string;

procedure RestPostRecord(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; IsDelta: Boolean);

// сохранить изменения в DataSet с установкой поля Doc в значение равное DocID
function RestPostDocPart(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; aDocID: Integer): Integer;

// сохранить изменения в DataSet с установкой поля переданного в aFieldName в значение равное aFieldValue
// вернуть количество обработанных записей
function RestPostDelta(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; aFieldName: string; aFieldValue: Variant): Integer;


procedure RestGetDocPart(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  //ListView: TcxGridDBTableView;
  aDocID: Integer);

procedure RestGetDocListView(Client: TSQLRestClient; RecordClass: TSQLRecordClass; ListView: TcxGridDBTableView; aDocID: Integer);

procedure RestGetListFmt(Client: TSQLRestClient;
  const Tables: array of TSQLRecordClass; const SQLSelect: RawUTF8; const SQLWhereFormat: RawUTF8; const Args: array of const;
  DataSet: TClientDataSet; aMode: TClientDataSetMode = cdsReplace);



procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  const Tables: array of TSQLRecordClass;
  var aDataSet: TClientDataSet; var aDataSource: TDataSource;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string = '';
  aClearKey: string = 'Del'; aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False); overload;

procedure InitLookupProp(
  aDataSet: TClientDataSet; aDataSource: TDataSource;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string = '';
  aClearKey: string = 'Del'; aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False); overload;


procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  const Tables: array of TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string = '';
  aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False; aClearKey: string = 'Del';
  aAddFields: string = ''); overload;

procedure RecalcIDtoRefRecordID(
  aClient: TSQLRestClient;
  const aTable: TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties);

procedure InitEnumLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  aEnum: PEnumType;
  //const Tables: array of TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False; aClearKey: string = 'Del'); overload;

procedure InitLookupPropFromJSON(
  aOwner: TComponent;
  aJSON: RawJSON;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False; aClearKey: string = 'Del');


// InitEnumpComboBoxProp(PTypeInfo(TypeInfo(TSCSObjectKind))^.EnumBaseType, cbKind.Properties);
procedure InitEnumpComboBoxProp(aEnum: PEnumType; aLookupProp: TcxCustomComboBoxProperties);

procedure InitLookupPropFromString(aOwner: TComponent; aLookupProp: TcxLookupComboBoxProperties; aStr: string);


procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  aModel: TSQLModel;
  //const Tables: array of TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False; aClearKey: string = 'Del'); overload;


// по ID ищем Title используя ListSource колонки
function LookupTitle(aCol: TcxGridColumn; aID: Integer; aKey: string = 'ID'; aResult: string = 'Title'): string;
// по Title ищем ID используя ListSource колонки
function LookupID(aCol: TcxGridColumn; aTitle: string; aKey: string = 'Title'; aResult: string = 'ID'): string;
function LookupBack(aCol: TcxGridColumn; aValue: string): string;

procedure CloneRecord(AView: TcxGridTableView; ARecordIndexToClone: Integer; aIDCol: TcxGridDBColumn = nil);

function GetDetailView(aView: TcxGridTableView): TcxGridTableView;

function GetSelectedIDs(aView: TcxGridTableView; aIDColIndex: Integer): TIntegerDynArray;

procedure CopyValuesToClipboard(aView: TcxGridTableView);
procedure PasteValuesFromClipboard(aView: TcxGridTableView);

procedure TL_CopyValuesToClipboard(aTL: TcxCustomTreeList);
procedure TL_PasteValuesFromClipboard(aTL: TcxCustomTreeList);


function GetTimeInPeriod(aTime: TDateTime; aPeriodStart, aPeriodStop: TDateTime): TDateTime;


function VarToID(v: Variant): TID;

function VarToIntDef0(v: Variant): Integer;





implementation

uses
  System.Variants, System.StrUtils,
  Winapi.Windows, Vcl.Clipbrd,
  mORMoti18n, mORMotUILogin,
  UIEdit;
  //, mORMotUIEdit;

function GetTimeInPeriod(aTime: TDateTime; aPeriodStart, aPeriodStop: TDateTime): TDateTime;
begin
  if (aTime >= aPeriodStart) and (aTime <= aPeriodStop) then
    Result := aTime
  else
  begin
    Result := Trunc(aPeriodStart) + Frac(aTime);
    if Result < aPeriodStart then
      Result := Result + 1;
  end;
end;

procedure CheckEditValue(aControl: TWinControl; aCondition: Boolean; aMessage: string);
begin
  if not aCondition then
  begin
    if aControl.CanFocus then
      aControl.SetFocus;
    raise ECheckDataException.Create(aMessage);
  end;
end;

function GetCSVDataSetFields(DataSet: TDataSet; aForUpdate: Boolean): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to DataSet.Fields.Count - 1 do
  begin
    if (DataSet.Fields[i].FieldKind <> fkData) then
      Continue;

    if aForUpdate and DataSet.Fields[i].ReadOnly then
      Continue;

    Result := Result + DataSet.Fields[i].FieldName + ',';
  end;

  if (Length(Result) > 0) and (Result[Length(Result)] = ',') then
    Result := Copy(Result, 1, Length(Result) - 1);
end;

function Remove_AS(aStr: string): string;
var
  p1, p2: Integer;
begin
  p1 := Pos(' as ', aStr);
  if p1 <= 0 then
    Exit(aStr);

  p2 := System.StrUtils.PosEx(',', aStr, p1);
  if p2 <= 0 then
    p2 := Length(aStr) + 1;

  Result := Copy(aStr, 1, p1 - 1) + Copy(aStr, p2, Length(aStr));

  Result := Remove_AS(Result);
end;

function Remove_BeforeAS(aStr: string): string;
const
  cAS = ' as ';
var
  p1, p2: Integer;
begin
  // 12345678901234567890
  // t1.e as e, t2.k as k
  //     ^    ^
  //     p1   p2
  //     5    0
  p1 := Pos(cAS, aStr);
  if p1 <= 0 then
    Exit(aStr);

  p2 := PosEx(',', aStr, p1);
  if p2 <= 0 then
    p2 := Length(aStr) + 1;

  Result := Copy(aStr, p1 + Length(cAS), p2 - p1 - Length(cAS));
  if p2 <> Length(aStr) + 1 then
    Result := Result + ',' + Remove_BeforeAS(Copy(aStr, p2 + 1, Length(aStr)));

end;

function SQL2IndexFieldsNames(aStr: string): string;
begin
  Result := StringReplace(Remove_BeforeAS(aStr), ',', ';', [rfReplaceAll]);
  Result := StringReplace(Result, 'RowID', 'ID', [rfReplaceAll]);
end;

procedure RestPostRecord(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; IsDelta: Boolean);
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
  aDC: TcxGridDBDataController;
  cds: TClientDataSet;

  // (aField: TField; aModifiedFields: TSQLFieldBits; aIndex: Integer)
  procedure UpdateModifiedFields;
  begin
    if IsDelta then
    begin
      if not VarIsClear(aField.NewValue) then
        Include(ModifiedFields, i);
    end
    else
    begin
      if (DataSet.State in [dsInsert])
        or (aField.Value <> aField.OldValue) then
        Include(ModifiedFields, i);
    end;

////    if (IsDelta and (not aField.IsNull))
//    if (IsDelta and (not VarIsClear(aField.NewValue)))
//      or (not IsDelta and (aField.Value <> aField.OldValue))
//      then
//      Include(ModifiedFields, i);
  end;
begin
  if not Assigned(Client) then
    Exit;

  aRecord := RecordClass.Create;
  try
    aRecord.IDValue := DataSet.FieldByName('ID').AsInteger;

    fillchar(ModifiedFields, sizeof(ModifiedFields), 0);
    aClassType := PPointer(aRecord)^;
    for i := 0 to aClassType.RecordProps.Fields.Count - 1 do
    begin
      P := aClassType.RecordProps.Fields.List[i];
      if (P.SQLFieldType in [
          {sftRecord,} {sftTID, }sftBlob, sftBlobDynArray, sftBlobCustom, sftUTF8Custom,
          sftModTime, sftCreateTime, sftMany]) then
        Continue;

      aField := DataSet.FindField(U2S(p.Name));
      if not Assigned(aField) then
        Continue;

      //if aField.Value = aField.OldValue then
      //  Continue;

      case P.SQLFieldType of
        sftDateTime, sftDateTimeMS:
        begin
          P.SetValue(aRecord, pointer(DateTimeToIso8601Text(aField.AsDateTime, 'T', true)), true);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftTimeLog, sftModTime:
        begin
          TimeLog.From(aField.AsDateTime);
          P.SetValue(aRecord, pointer(Int64ToUtf8(TimeLog.Value)), false);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftUnixTime:
        begin
          P.SetValue(aRecord, pointer(Int64ToUtf8(DateTimeToUnixTime(aField.AsDateTime))), false);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftUnixMSTime:
        begin
          P.SetValue(aRecord, pointer(Int64ToUtf8(DateTimeToUnixMSTime(aField.AsDateTime))), false);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftFloat:
        begin
          P.SetValue(aRecord, Pointer(DoubleToStr(aField.AsFloat)), False);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftTID, sftRecord:
        begin
          P.SetValue(aRecord, Pointer(Int64ToUTF8(integer(aField.AsInteger))), False);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftInteger, sftID, sftEnumerate:
        begin
          P.SetValue(aRecord, Pointer(Int32ToUTF8(integer(aField.AsInteger))), False);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end;

        sftAnsiText, sftUTF8Text, sftUTF8Custom:
        begin
          U := S2U(aField.AsString);
          P.SetValue(aRecord, pointer(U), true); // do conversion for every string type
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
          //p.SetVariant(aRecord, aField.AsVariant);
        end;

        sftBoolean:
        begin
          P.SetValue(aRecord, pointer(Int32ToUTF8(integer(aField.AsBoolean))), false);
          //Include(ModifiedFields, i);
          UpdateModifiedFields;
        end

        else
          raise Exception.CreateFmt('Cannot perform type %s', [GetCaptionFromEnum(TypeInfo(TSQLFieldType), Ord(P.SQLFieldType))]);

      end;
    end;

    // perform all registered filtering
    aRecord.Filter(ModifiedFields);

    // perform content validation
    FieldIndex := -1;
    ErrMsg := aRecord.Validate(Client, ModifiedFields, @FieldIndex);
    if ErrMsg <> '' then
    begin
      // invalid field content -> show message, focus component and abort saving
      if FieldIndex < aClassType.RecordProps.Fields.Count then
      begin
        P := aClassType.RecordProps.Fields.List[FieldIndex];
        if Assigned(ListView) then
        begin
          for i := 0 to ListView.ColumnCount - 1 do
          begin
            if ListView.Columns[i] is TcxGridDBColumn then
              if SameText(TcxGridDBColumn(ListView.Columns[i]).DataBinding.FieldName, U2S(p.Name)) then
              begin
                ListView.Columns[i].Focused := True;
                Break;
              end;
          end;
        end;
        //Application.ProcessMessages;
        mORMotUILogin.ShowMessage(ErrMsg, Format(sInvalidFieldN, [p.Name]), true);
      end
      else
        mORMotUILogin.ShowMessage(ErrMsg, Format(sInvalidFieldN, ['?']), true);

      Abort;
    end
    else
    begin
      if aRecord.ID = 0 then
      begin
        aRecord.IDValue := Client.Add(aRecord, ModifiedFields);

        // на входе у нас Delta, тогда к исходным данным добираемся через ListView
        if IsDelta then
        begin
          if Assigned(ListView) then
          begin
            if ListView is TcxGridDBTableView then
              aDC := TcxGridDBTableView(ListView).DataController
            else if ListView is TcxGridDBBandedTableView then
              aDC := TcxGridDBBandedTableView(ListView).DataController
            else
              raise Exception.Create('ListView is not TcxGridDBTableView or TcxGridDBBandedTableView');
          end
          else
            raise Exception.Create('ListView is nil');

          if Assigned(aDC.DataSource)
            and Assigned(aDC.DataSource.DataSet)
            and (aDC.DataSource.DataSet is TClientDataSet) then
          begin
            cds := TClientDataSet(aDC.DataSource.DataSet);
            if Assigned(cds.FieldByName('ID')) then
            begin
              if cds.Locate('ID', DataSet.FieldByName('ID').AsInteger, []) then
              begin
                cds.LogChanges := False;
                if (cds.State in dsEditModes) then
                begin
                  cds.FieldByName('ID').AsInteger := aRecord.ID
                end
                else
                begin
                  cds.Edit;
                  cds.FieldByName('ID').AsInteger := aRecord.ID;
                  cds.Post;
                end;
                cds.LogChanges := True;
              end;
            end;
          end;
        end
        else
        begin
          //TClientDataSet(DataSet).AppendData();
          // работаем с DataSet-ом
          if Assigned(DataSet.FieldByName('ID')) then
          begin
            if (DataSet.State in dsEditModes) then
            begin
              DataSet.FieldByName('ID').AsInteger := aRecord.ID
            end
            else
            begin
              DataSet.Edit;
              DataSet.FieldByName('ID').AsInteger := aRecord.ID;
              DataSet.Post;
            end;
          end;
        end;
      end
      else
        Client.Update(aRecord, ModifiedFields);
    end;
  finally
    aRecord.Free;
  end;
end;

function RestPostDocPart(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; aDocID: Integer): Integer;
begin
  Result := RestPostDelta(Client, RecordClass, DataSet, ListView, 'Doc', aDocID);
end;
//var
//  i: Integer;
//  d: TClientDataSet;
//  aIDValue: Integer;
//begin
//  if DataSet.State in dsEditModes then
//    DataSet.Post;
//
//  if DataSet.ChangeCount = 0 then
//    Exit;
//
//  d := TClientDataSet.Create(nil);
//  try
//    d.Data := DataSet.Delta;
//
//    d.First;
//    while not d.Eof do
//    begin
//      case d.UpdateStatus of
//        // это оригинал измененной записи (следующая - изменения)
//        usUnmodified:
//        begin
//          // запоминаем ID - он будет использован при обновлении
//          aIDValue := d.FieldByName('ID').AsInteger;
//        end;
//
//        // это изменения или новая запись
//        usModified, usInserted:
//        begin
//          // предобработка
//          d.Edit;
//          d.FieldByName('Doc').AsInteger := aDocID;
//          case d.UpdateStatus of
//            usModified: d.FieldByName('ID').AsInteger := aIDValue;
//            usInserted: d.FieldByName('ID').AsInteger := 0;
//          end;
//          d.Post;
//
//          uDataProc.RestPostRecord(Client, RecordClass, d, ListView, True);
//        end;
//
//        // эта запись была удалена
//        usDeleted:
//        begin
//          Client.Delete(RecordClass, d.FieldByName('ID').AsInteger);
//        end;
//      end;
//
//      d.Next;
//    end;
//
//    DataSet.MergeChangeLog;
//  finally
//    d.Free;
//  end;
//end;

function RestPostDelta(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  ListView: TcxGridTableView; aFieldName: string; aFieldValue: Variant): Integer;
var
  d: TClientDataSet;
  aIDValue: Integer;
begin
  Result := 0;
  if DataSet.State in dsEditModes then
    DataSet.Post;

  if DataSet.ChangeCount = 0 then
    Exit;

  d := TClientDataSet.Create(nil);
  try
    d.Data := DataSet.Delta;

    d.First;
    while not d.Eof do
    begin
      case d.UpdateStatus of
        // это оригинал измененной записи (следующая - изменения)
        usUnmodified:
        begin
          // запоминаем ID - он будет использован при обновлении
          aIDValue := d.FieldByName('ID').AsInteger;
        end;

        // это изменения или новая запись
        usModified, usInserted:
        begin
          // предобработка
          d.Edit;

          if aFieldName <> '' then
            d.FieldByName(aFieldName).AsVariant := aFieldValue;

          case d.UpdateStatus of
            usModified: d.FieldByName('ID').AsInteger := aIDValue;
            usInserted: d.FieldByName('ID').AsInteger := 0;
          end;
          d.Post;

          uDataProc.RestPostRecord(Client, RecordClass, d, ListView, True);
          Inc(Result);
        end;

        // эта запись была удалена
        usDeleted:
        begin
          Client.Delete(RecordClass, d.FieldByName('ID').AsInteger);
          Inc(Result);
        end;
      end;

      d.Next;
    end;

    DataSet.MergeChangeLog;
  finally
    d.Free;
  end;
end;

procedure RestGetDocPart(Client: TSQLRestClient; RecordClass: TSQLRecordClass; DataSet: TClientDataSet;
  //ListView: TcxGridDBTableView;
  aDocID: Integer);
var
  b: TBookmark;
  aTable: TSQLTable;
  saveLogChanges: Boolean;
begin
  // получаем данные с сервера
  aTable := Client.List([RecordClass],
    S2U(GetCSVDataSetFields(DataSet)),
    FormatUTF8('Doc = ?', [], [aDocID]));
  try
    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet;

    // запоминаем режим логирования
    saveLogChanges := DataSet.LogChanges;
    try
      DataSet.LogChanges := False;
      b := DataSet.Bookmark;
      ToClientDataSet(DataSet, aTable, Client, cdsReplace);
      try
        DataSet.Bookmark := b;
      except
      end;
    finally
      // восстанавливаем режим логирования
      DataSet.LogChanges := saveLogChanges;
    end;
  finally
    aTable.Free;
  end;
end;

procedure RestGetListFmt(Client: TSQLRestClient;
  const Tables: array of TSQLRecordClass; const SQLSelect: RawUTF8; const SQLWhereFormat: RawUTF8; const Args: array of const;
  DataSet: TClientDataSet; aMode: TClientDataSetMode);
var
  b: TBookmark;
  aTable: TSQLTable;
begin
  // получаем данные с сервера
  aTable := Client.ListFmt(Tables, SQLSelect, SQLWhereFormat, Args);
  try
    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet;

    DataSet.LogChanges := False;
    b := DataSet.Bookmark;
    ToClientDataSet(DataSet, aTable, Client, aMode);
    try
      DataSet.Bookmark := b;
    except
    end;
    DataSet.LogChanges := True;
  finally
    aTable.Free;
  end;
end;

procedure RestGetDocListView(Client: TSQLRestClient; RecordClass: TSQLRecordClass; ListView: TcxGridDBTableView; aDocID: Integer);
//procedure RestGetDocListView(Client: TSQLRestClient; RecordClass: TSQLRecordClass; ListView: TcxGridTableView; aDocID: Integer);
var
  r: Integer;
  b: TBookmark;
  aTable: TSQLTable;
  aDataSet: TClientDataSet;
  aDC: TcxGridDBDataController;
begin
  Assert(Assigned(ListView));
  Assert(ListView.DataController is TcxGridDBDataController);
  aDC := TcxGridDBDataController(ListView.DataController);
  Assert(Assigned(aDC.DataSource));
  Assert(Assigned(aDC.DataSource.DataSet));
  Assert(aDC.DataSource.DataSet is TClientDataSet);

  aDataSet := TClientDataSet(aDC.DataSource.DataSet);

  // получаем данные с сервера
  aTable := Client.List([RecordClass],
    S2U(GetCSVDataSetFields(aDataSet)),
    FormatUTF8('Doc = ?', [], [aDocID]));
  try
    r := ListView.Controller.TopRowIndex;
    aDataSet.DisableControls;
    try
      // открываем, если закрыта
      if not aDataSet.Active then
        aDataSet.CreateDataSet;

      aDataSet.LogChanges := False;
      b := aDataSet.Bookmark;
      ToClientDataSet(aDataSet, aTable, Client, cdsReplace);
      try
        aDataSet.Bookmark := b;
      except
//        on e: Exception do
//          ShowMessage(e.Message);
      end;
      aDataSet.LogChanges := True;
    finally
      aDataSet.EnableControls;
    end;
    ListView.Controller.TopRowIndex := r;

  finally
    aTable.Free;
  end;
end;


function VarToID(v: Variant): TID;
begin
  if VarIsNull(v) then
    Result := 0
  else
    Result := TID(v);
end;

function VarToIntDef0(v: Variant): Integer;
begin
  if VarIsNull(v) or VarIsEmpty(v) then
    Result := 0
  else
    Result := Integer(v);
end;


procedure CloneRecord(AView: TcxGridTableView; ARecordIndexToClone: Integer; aIDCol: TcxGridDBColumn);
var
  I: Integer;
  ANewIndex: Integer;
begin
  AView.DataController.Append;//Insert;
  ANewIndex := AView.DataController.FocusedRecordIndex;

  if ARecordIndexToClone >= ANewIndex then
    Inc(ARecordIndexToClone);

  for I := 0 to AView.ColumnCount - 1 do
  begin
    // пропускаем ID, чтобы понимать, что это новая запись
    if (AView.Columns[I] is TcxGridDBColumn) and (TcxGridDBColumn(AView.Columns[I]).DataBinding.FieldName = 'ID') then
      Continue;

    if AView.Columns[I] = aIDCol then
      Continue;


    AView.Columns[I].EditValue := AView.DataController.Values[ARecordIndexToClone, I];
  end;
//    AView.DataController.Values[ANewIndex, I] := AView.DataController.Values[ARecordIndexToClone, I];

//  if Assigned(aIDCol) then
//    aIDCol.EditValue := GetTickCount64;

  AView.DataController.Post(True);
end;

function GetDetailView(aView: TcxGridTableView): TcxGridTableView;
var
  aRec: TcxCustomGridRecord;
begin
  Result := nil;
  if not Assigned(aView) then
    Exit;

  aRec := aView.Controller.FocusedRecord;
  if not Assigned(aRec) then
    Exit;

  if not (aRec is TcxGridMasterDataRow) then
    Exit;


  Result := TcxGridTableView(TcxGridMasterDataRow(aRec).ActiveDetailGridView);
end;


function GetSelectedIDs(aView: TcxGridTableView; aIDColIndex: Integer): TIntegerDynArray;
var
  aID: Integer;
  i, j: Integer;
  aList: TList;
  aWrapper: TDynArray;
begin
  aWrapper.Init(TypeInfo(TIntegerDynArray), Result);

  for i := 0 to aView.Controller.SelectedRecordCount - 1 do
  begin
    if aView.Controller.SelectedRecords[i] is TcxGridGroupRow then
    begin
      // обработаем группу
      aList := TList.Create;
      try
        // получаем список всех элементов группы (номера записей)
        aView.DataController.Groups.LoadRecordIndexesByRowIndex(aList, aView.Controller.SelectedRecords[i].RecordIndex);

        for j := 0 to aList.Count - 1 do
        begin
          aID := aView.DataController.Values[Integer(aList[j]), aIDColIndex];
          aWrapper.Add(aID);
        end;
      finally
        aList.Free;
      end;
    end

    else if aView.Controller.SelectedRecords[i] is TcxGridDataRow then
    begin
      aID := aView.Controller.SelectedRecords[i].Values[aIDColIndex];
      aWrapper.Add(aID);
    end;
  end;
end;

procedure TL_CopyValuesToClipboard(aTL: TcxCustomTreeList);
var
  ANode: TcxTreeListNode;
  AText: string;

  function NodeToText(aNode: TcxTreeListNode): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 0 to aTL.VisibleColumnCount - 1 do
    begin
      if I > 0 then
        Result := Result + #9;
      Result := Result + VarToStr(aTL.VisibleColumns[I].Values[aNode]);//DisplayTexts[ANode];
    end;
  end;
begin
  if not Assigned(aTL) then
    Exit;

  AText := '';
  ANode := aTL.Root.GetFirstChild;
  while ANode <> nil do
  begin
    if ANode.Selected then
    begin
      if AText <> '' then
        AText := AText + #13#10;
      AText := AText + NodeToText(ANode);
    end;
    ANode := ANode.GetNext;
  end;

  Clipboard.AsText := aText;
end;


procedure CopyValuesToClipboard(aView: TcxGridTableView);
var
  iRow, iCol: Integer;
  aStr: string;
  v: Variant;
  vStr: string;
begin
  if not Assigned(aView) then
    Exit;

  aView.BeginUpdate();
  try
    aStr := '';
    for iRow := 0 to aView.Controller.SelectedRowCount - 1 do
    begin
      if aView.Controller.SelectedColumnCount > 0 then
      begin
        for iCol := 0 to aView.Controller.SelectedColumnCount - 1 do
        begin
          v := aView.DataController.Values[
              aView.Controller.SelectedRows[iRow].RecordIndex,
              aView.Controller.SelectedColumns[iCol].Index];
          if VarIsNull(v) then
            vStr := cNullStr
          else
            vStr := VarToStr(v);

          aStr := aStr + vStr + #9;
        end;
      end
      else
      begin
        for iCol := 0 to aView.ColumnCount - 1 do
        begin
          // копируем Все Видимые колонки
          if aView.Columns[iCol].Visible then
          begin
            v := aView.DataController.Values[
                aView.Controller.SelectedRows[iRow].RecordIndex,
                aView.Columns[iCol].Index];
            if VarIsNull(v) then
              vStr := cNullStr
            else
              vStr := VarToStr(v);

            aStr := aStr + vStr + #9;
          end;
        end;
      end;
      aStr := aStr + #13#10;
    end;
    Clipboard.AsText := aStr;
  finally
    aView.EndUpdate;
  end;
end;

procedure TL_PasteValuesFromClipboard(aTL: TcxCustomTreeList);
var
  //ANode: TcxTreeListNode;
  sLines, sCols: TStringList;
  i, iLine, iLineStart: Integer;
  aColIndex, aRowIndex: Integer;
begin
  if not Clipboard.HasFormat(CF_TEXT) then
    Exit;

  if Clipboard.AsText = '' then
    Exit;

  if aTL.VisibleColumnCount = 0 then
    Exit;

  sLines := TStringList.Create;
  sCols := TStringList.Create;
  try
    sLines.LineBreak := #13#10;
    sLines.Text := Clipboard.AsText;

    if sLines.Count = 0 then
      Exit;

    sCols.LineBreak := #9;
    sCols.Text := sLines.Strings[0];

    if sCols.Count = 0 then
      Exit;

    // проверим, не содержит ли первая строка имени колоноки
    if (aTL.VisibleColumns[0].Caption.Text = sCols[0]) then
      iLineStart := 1
    else
      iLineStart := 0;

    aTL.BeginUpdate;
    try
      //ANode := aTL.FocusedNode;
      for iLine := iLineStart to sLines.Count - 1 do
      begin
        if not Assigned(aTL.FocusedNode) then
          Break;

        aTL.Edit;
        sCols.Text := sLines.Strings[iLine];
        for i := 0 to Min(sCols.Count - 1, aTL.VisibleColumnCount - 1) do
        begin
          if aTL.VisibleColumns[i].Options.Editing then
          begin
            if sCols[i] = cNullStr then
              aTL.VisibleColumns[i].Values[aTL.FocusedNode] := null
            else
              aTL.VisibleColumns[i].Values[aTL.FocusedNode] := sCols[i];
          end;
        end;
        aTL.Post;

        aTL.FocusedNode := aTL.FocusedNode.GetNextVisible;
      end;

      //aTL.FocusedNode := aNode;
    finally
      aTL.EndUpdate;
    end;
  finally
    sCols.Free;
    sLines.Free;
  end;

end;

procedure PasteValuesFromClipboard(aView: TcxGridTableView);
var
  sLines, sCols: TStringList;
  i, iLine, iLineStart: Integer;
  aFocusedRowIndex: Integer;
  aColIndex, aRowIndex: Integer;
  v: Variant;
  aCol: TcxGridColumn;
  aNeedAppend: Boolean;
begin
  if not Clipboard.HasFormat(CF_TEXT) then
    Exit;

  if Clipboard.AsText = '' then
    Exit;

  sLines := TStringList.Create;
  sCols := TStringList.Create;
  try
    sLines.LineBreak := #13#10;
    sLines.Text := Clipboard.AsText;

    if sLines.Count = 0 then
      Exit;

    sCols.LineBreak := #9;
    sCols.Text := sLines.Strings[0];

    // проверим, не содержит ли первая строка имени колоноки
    if (sCols.Count = 0) or (aView.Controller.FocusedColumn.Caption = sCols[0]) then
      iLineStart := 1
    else
      iLineStart := 0;

    aNeedAppend := (sLines.Count - iLineStart) > (aView.DataController.RowCount - aView.Controller.FocusedRowIndex);

    if not aNeedAppend then
      aView.BeginUpdate;
    try
      aFocusedRowIndex := aView.Controller.FocusedRowIndex;

      for iLine := iLineStart to sLines.Count - 1 do
      begin
        sCols.Text := sLines.Strings[iLine];

        aColIndex := aView.Controller.FocusedColumn.VisibleIndex;

        for i := 0 to sCols.Count - 1 do
        begin
          aCol := aView.VisibleColumns[aColIndex];

          if aCol.Editable then
          begin
            if sCols[i] = cNullStr then
              aCol.EditValue := Null
            else
              aCol.EditValue := sCols[i];
          end;

          aColIndex := aColIndex + 1;
        end;

        // переходим к следующей строке, если нужно
        if iLine < sLines.Count - 1 then
        begin
          if aView.Controller.FocusedRowIndex >= aView.DataController.RowCount - 1 then
            aView.DataController.Append
          else
            aView.Controller.FocusedRowIndex := aView.Controller.FocusedRowIndex + 1;
        end
        else
          aView.DataController.Post;
      end;

      aView.Controller.FocusedRowIndex := aFocusedRowIndex;
    finally
      if not aNeedAppend then
        aView.EndUpdate;
    end;
  finally
    sCols.Free;
    sLines.Free;
  end;
end;


function LookupTitle(aCol: TcxGridColumn; aID: Integer; aKey: string = 'ID'; aResult: string = 'Title'): string;
begin
  Result := VarToStrDef(
    TcxLookupComboBoxProperties(aCol.Properties).ListSource.DataSet.Lookup(
      aKey, VarArrayOf([aID]), aResult), '')
end;

function LookupID(aCol: TcxGridColumn; aTitle: string; aKey: string = 'Title'; aResult: string = 'ID'): string;
begin
  Result := VarToStrDef(
    TcxLookupComboBoxProperties(aCol.Properties).ListSource.DataSet.Lookup(
      aKey, VarArrayOf([aTitle]), aResult), '')
end;

function LookupBack(aCol: TcxGridColumn; aValue: string): string;
var
  aProp: TcxLookupComboBoxProperties;
begin
  aProp := TcxLookupComboBoxProperties(aCol.Properties);
  Result := VarToStrDef(
    aProp.ListSource.DataSet.Lookup(aProp.ListFieldNames, aValue, aProp.KeyFieldNames), '');
end;

procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  aModel: TSQLModel;
  //const Tables: array of TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean; aDropDownSizeble: Boolean; aClearKey: string); overload;
var
  aDataSet: TClientDataSet;
  aDataSource: TDataSource;
  i, aTitleWidth: Integer;
begin
  if not Assigned(aLookupProp) then
    Exit;

  // мы можем получить aDataSource из aLookupProp
  aDataSource := aLookupProp.ListSource;
  if Assigned(aDataSource) then
    aDataSet := TClientDataSet(aDataSource.DataSet)
  else
    aDataSet := nil;

  if Assigned(aDataSet) then
  begin
    if aDataSet.RecordCount > 0 then
      Exit
    else
      FreeAndNil(aDataSet);
  end;

  // добавляем данные в таблицу

  // 1. расчитаем ширину колонки
  aTitleWidth := 0;
  for i := 0 to aModel.TablesMax do
    if Length(aModel.Tables[i].CaptionName) > aTitleWidth then
      aTitleWidth := Length(aModel.Tables[i].CaptionName);

  // 2. создает датасет
  aDataSet := TClientDataSet.Create(aOwner);
  aDataSet.FieldDefs.Add(aKeyFields, ftInteger, 0);
  aDataSet.FieldDefs.Add(aListFields, ftWideString, aTitleWidth);
  aDataSet.CreateDataSet;

  // 3. заполняем датасет
  for i := 0 to aModel.TablesMax do
    aDataSet.AppendRecord([i, aModel.Tables[i].CaptionName]);

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := Remove_BeforeAS(aKeyFields);
  aLookupProp.ListFieldNames := StringReplace(Remove_BeforeAS(aListFields), ',', ';', [rfReplaceAll]);
//  aLookupProp.KeyFieldNames := aKeyFields;
//  aLookupProp.ListFieldNames := aListFields;

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];
end;


procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  const Tables: array of TSQLRecordClass;
  var aDataSet: TClientDataSet; var aDataSource: TDataSource;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string;
  aClearKey: string; aDropDownAutoSize: Boolean; aDropDownSizeble: Boolean);
var
  aTable: TSQLTable;
begin
  if Assigned(aDataSet) then
    FreeAndNil(aDataSet);

  // получаем данные
  aTable := aClient.List(Tables,
    S2U(aKeyFields + ',' + aListFields),
    S2U(aWhere + ' order by ' + Remove_AS(aListFields)));
  try
    aDataSet := ToClientDataSet(aOwner, aTable);
  finally
    aTable.Free;
  end;

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := Remove_BeforeAS(aKeyFields);
  aLookupProp.ListFieldNames := StringReplace(Remove_BeforeAS(aListFields), ',', ';', [rfReplaceAll]);
//  aLookupProp.KeyFieldNames := aKeyFields;
//  aLookupProp.ListFieldNames := aListFields;

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;

procedure InitLookupProp(
  aDataSet: TClientDataSet; aDataSource: TDataSource;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string = '';
  aClearKey: string = 'Del'; aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False); overload;
begin
  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := aKeyFields;
  aLookupProp.ListFieldNames := aListFields;

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;

procedure InitLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  const Tables: array of TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string; aWhere: string;
  aDropDownAutoSize: Boolean; aDropDownSizeble: Boolean; aClearKey: string;
  aAddFields: string);
var
  aTable: TSQLTable;
  aDataSet: TClientDataSet;
  aDataSource: TDataSource;
begin
  if not Assigned(aLookupProp) then
    Exit;

  // мы можем получить aDataSource из aLookupProp
  aDataSource := aLookupProp.ListSource;
  if Assigned(aDataSource) then
    aDataSet := TClientDataSet(aDataSource.DataSet)
  else
    aDataSet := nil;

  if Assigned(aDataSet) then
    FreeAndNil(aDataSet);

  if (aAddFields <> '') and (Copy(aAddFields, 1, 1)<>',') then
    aAddFields := ',' + aAddFields;

  // получаем данные
  aTable := aClient.List(Tables,
    S2U(aKeyFields + ',' + aListFields + aAddFields),
    S2U(aWhere + ' order by ' + Remove_AS(aListFields)));
  try
    aDataSet := ToClientDataSet(aOwner, aTable);
    TClientDataSet(aDataSet).IndexFieldNames := SQL2IndexFieldsNames(aListFields + ',' + aKeyFields);
  finally
    aTable.Free;
  end;

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := Remove_BeforeAS(aKeyFields);
  aLookupProp.ListFieldNames := StringReplace(Remove_BeforeAS(aListFields), ',', ';', [rfReplaceAll]);

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;

procedure RecalcIDtoRefRecordID(
  aClient: TSQLRestClient;
  const aTable: TSQLRecordClass;
  aLookupProp: TcxLookupComboBoxProperties);
var
  ds: TDataSet;
begin
  ds := aLookupProp.ListSource.DataSet;
  ds.DisableControls;
  try
    ds.First;
    while not ds.Eof do
    begin
      ds.Edit;
      ds.FieldByName('ID').AsInteger := aClient.Model.RecordReference(aTable, ds.FieldByName('ID').AsInteger);
      ds.Post;
      ds.Next;
    end;
  finally
    ds.EnableControls;
  end;
end;


procedure InitEnumpComboBoxProp(aEnum: PEnumType; aLookupProp: TcxCustomComboBoxProperties);
begin
  if not Assigned(aLookupProp) then
    Exit;

  aEnum^.AddCaptionStrings(aLookupProp.Items);
end;

procedure InitLookupPropFromString(aOwner: TComponent; aLookupProp: TcxLookupComboBoxProperties; aStr: string);
var
  aDataSet: TClientDataSet;
  aDataSource: TDataSource;
  sl: TStrings;
  i: Integer;
  w: Integer;
begin
  if not Assigned(aLookupProp) then
    Exit;

  // мы можем получить aDataSource из aLookupProp
  aDataSource := aLookupProp.ListSource;
  if Assigned(aDataSource) then
    aDataSet := TClientDataSet(aDataSource.DataSet)
  else
    aDataSet := nil;

  if Assigned(aDataSet) then
  begin
    if aDataSet.RecordCount > 0 then
      Exit
    else
      FreeAndNil(aDataSet);
  end;

  // добавляем данные в таблицу
  sl := TStringList.Create;
  try
    //aEnum^.AddCaptionStrings(sl);
    sl.Text := aStr;

    w := 0;
    for i := 0 to sl.Count - 1 do
      if w < Length(sl[i]) then
        w := Length(sl[i]);

    aDataSet := TClientDataSet.Create(aOwner);
    aDataSet.FieldDefs.Add('ID', ftInteger, 0);
    aDataSet.FieldDefs.Add('Title', ftWideString, w);
    aDataSet.CreateDataSet;
    aDataSet.IndexFieldNames := 'ID';

    for i := 0 to sl.Count - 1 do
      aDataSet.AppendRecord([sl.Names[i], sl.ValueFromIndex[i]]);
  finally
    sl.Free;
  end;

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := 'ID';
  aLookupProp.ListFieldNames := 'Title';

//  aLookupProp.ClearKey := TextToShortCut(aClearKey);
//  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
//  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;

procedure InitEnumLookupProp(
  aOwner: TComponent;
  aClient: TSQLRestClient;
  aEnum: PEnumType;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean; aDropDownSizeble: Boolean; aClearKey: string); overload;
var
  aDataSet: TClientDataSet;
  aDataSource: TDataSource;
  sl: TStrings;
  i: Integer;
  w: Integer;
begin
  if not Assigned(aLookupProp) then
    Exit;

  // мы можем получить aDataSource из aLookupProp
  aDataSource := aLookupProp.ListSource;
  if Assigned(aDataSource) then
    aDataSet := TClientDataSet(aDataSource.DataSet)
  else
    aDataSet := nil;

  if Assigned(aDataSet) then
  begin
    if aDataSet.RecordCount > 0 then
      Exit
    else
      FreeAndNil(aDataSet);
  end;

  // добавляем данные в таблицу
  sl := TStringList.Create;
  try
    aEnum^.AddCaptionStrings(sl);

    w := 0;
    for i := 0 to sl.Count - 1 do
      if w < Length(sl[i]) then
        w := Length(sl[i]);

    aDataSet := TClientDataSet.Create(aOwner);
    aDataSet.FieldDefs.Add(aKeyFields, ftInteger, 0);
    aDataSet.FieldDefs.Add(aListFields, ftWideString, w);
    aDataSet.CreateDataSet;
    aDataSet.IndexFieldNames := aListFields;

    for i := 0 to sl.Count - 1 do
      aDataSet.AppendRecord([i, sl[i]]);
  finally
    sl.Free;
  end;

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := aKeyFields;
  aLookupProp.ListFieldNames := aListFields;

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;

procedure InitLookupPropFromJSON(
  aOwner: TComponent;
  aJSON: RawJSON;
  aLookupProp: TcxLookupComboBoxProperties;
  aKeyFields: string; aListFields: string;
  aDropDownAutoSize: Boolean = False; aDropDownSizeble: Boolean = False; aClearKey: string = 'Del');
var
  aTable: TSQLTableJSON;
  aDataSet: TClientDataSet;
  aDataSource: TDataSource;
begin
  if not Assigned(aLookupProp) then
    Exit;

  // мы можем получить aDataSource из aLookupProp
  aDataSource := aLookupProp.ListSource;
  if Assigned(aDataSource) then
    aDataSet := TClientDataSet(aDataSource.DataSet)
  else
    aDataSet := nil;

  if Assigned(aDataSet) then
    FreeAndNil(aDataSet);

  // получаем данные
  aTable := TSQLTableJSON.Create('', aJSON);
  try
    aDataSet := ToClientDataSet(aOwner, aTable);
    TClientDataSet(aDataSet).IndexFieldNames := SQL2IndexFieldsNames(aListFields + ',' + aKeyFields);
  finally
    aTable.Free;
  end;

  if not Assigned(aDataSource) then
    aDataSource := TDataSource.Create(aOwner);
  aDataSource.DataSet := aDataSet;

  aLookupProp.ListOptions.ShowHeader := False;
  aLookupProp.ListSource := aDataSource;
  aLookupProp.KeyFieldNames := Remove_BeforeAS(aKeyFields);
  aLookupProp.ListFieldNames := StringReplace(Remove_BeforeAS(aListFields), ',', ';', [rfReplaceAll]);

  aLookupProp.ClearKey := TextToShortCut(aClearKey);
  aLookupProp.DropDownAutoSize := aDropDownAutoSize;
  aLookupProp.DropDownSizeable := aDropDownSizeble;

  aLookupProp.IncrementalFiltering := True;
  aLookupProp.IncrementalFilteringOptions := [ifoUseContainsOperator, ifoHighlightSearchText];

end;


end.
