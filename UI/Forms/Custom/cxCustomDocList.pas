unit cxCustomDocList;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.Menus,
  Data.DB, Datasnap.DBClient,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  JvComponentBase, JvFormPlacement,
  //TB2Dock, TB2Toolbar, SpTBXItem, TB2Item,
  SynCommons, mORMot, mORMotMidasVCL,
  uCustomList,
  uAppStorage, uCustomRec, uBaseForm,
  uOPCInterval, uOPCIntervalForm, cxGridCustomPopupMenu, cxGridPopupMenu, cxNavigator, cxDBNavigator, dxBar, dxBarExtItems,
  dxSkinsCore, dxSkinscxPCPainter, dxSkinsdxBarPainter, cxDataControllerConditionalFormattingRulesManagerDialog, dxBarBuiltInMenu,
  dxDateRanges;

type

  TCustomDocList = class(TCustomList)
    aInterval: TAction;
    dxBarFilter: TdxBar;
    dxbInterval: TdxBarButton;
    siInterval: TdxBarSubItem;
    dxbToday: TdxBarButton;
    dxbYesterday: TdxBarButton;

    procedure FormCreate(Sender: TObject);
    procedure DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DataSetBeforeDelete(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
//    procedure smiIntervalInitPopup(Sender: TObject; PopupView: TTBView);
    procedure aIntervalExecute(Sender: TObject);
    procedure iTodayClick(Sender: TObject);
//    procedure GridViewKeyPress(Sender: TObject; var Key: Char);
    procedure siIntervalPopup(Sender: TObject);
  private
    FDisplayInterval: TOPCInterval;
    procedure SetDisplayInterval(const Value: TOPCInterval);
    procedure DoDblClickOrEnter;
  protected
    function GetSQL: string; virtual;
    procedure DoChangeInterval(Sender: TObject); virtual;

    procedure LoadSettings; override;
    procedure SaveSettings; override;
  public
    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace; aInitLookups: Boolean = True); override;
    property DisplayInterval: TOPCInterval read FDisplayInterval write SetDisplayInterval;
  end;

implementation

uses
  uFormsManager, uBaseFormInterface,
//  uTimeUtils,
  uResources,
  uSettings;
//  uCommonData,
//  uViewDataInterface;

{$R *.dfm}

{ TDocForm }


procedure TCustomDocList.DataSetBeforeDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  if not Settings.Client.GetTableRight(RecordClass[0], soDelete) then
  begin
    MessageDlg(sNoRightToDeleteDocument, mtInformation, [mbOk], 0);
    Abort;
  end
  else
    Settings.Client.Delete(RecordClass[0], DataSet.FieldByName('ID').AsInteger);
end;

procedure TCustomDocList.DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
begin
  FillDataSet(cdsReplace);
  Abort;
end;

//procedure TCustomDocList.DoAfterEditDoc(aID: Integer);
//begin
//  if aID <> 0 then
//  begin
//    FillDataSet(cdsReplace);
//    DataSet.Locate('ID', VarArrayOf([aID]), []);
//  end;
//end;

procedure TCustomDocList.DoChangeInterval(Sender: TObject);
begin
  FillDataSet(cdsReplace);
  dxbInterval.Caption := DisplayInterval.AsText;
end;

procedure TCustomDocList.DoDblClickOrEnter;
begin
  if DataSet.State in [dsEdit] then
    Exit;

  case OpenFormType of
    ftList:
      aEditExecute(Self);

    ftSelect, ftSelectModal:
    begin
      NotifySubscriber(noItemSelected, DataSet['ID'], '');
      if OpenFormType = ftSelectModal then
        ModalResult := mrOk;
    end;

    ftDialog, ftDialogModal: ;
  end;
end;

procedure TCustomDocList.siIntervalPopup(Sender: TObject);
var
  i: integer;
  b: TdxBarButton;
begin
  //ShowMessage(IntToStr(siInterval.ItemLinks.Count));
  for i := 0 to siInterval.ItemLinks.Count - 1 do
  begin
    if not (siInterval.ItemLinks[i].Item is TdxBarButton) then
      Continue;

    b := TdxBarButton(siInterval.ItemLinks[i].Item);
    b.Down := b.Tag = Ord(DisplayInterval.ShiftKind);
  end;
end;

procedure TCustomDocList.FillDataSet(aMode: TClientDataSetMode; aInitLookups: Boolean);
var
  b: TBookmark;
  //aTable: TSQLTable;
  Resp: RawUTF8;
  //vd: IViewData;
  s: string;
  //aParams: TDocVariantData;
begin
  if DataSetIsLoading then
    Exit;

  if aInitLookups then
    InitLookups;

  DataSetIsLoading := True;
  try
    // формируем запрос
    s := GetSQL;
    // получаем данные с сервера
    Resp := Settings.Client.ViewData.SelectSQL(s);
    //aTable := Settings.Client.ExecuteList(RecordClass, s);

    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet;

    DataSet.LogChanges := False;

//    if aMode in [cdsReplace, cdsAppend] then
//    begin
//      // обновляем данные - сохраняем позицию
//      b := DataSet.Bookmark;
//      ToClientDataSet(DataSet, aTable, Settings.Client, aMode);
//      try
//        DataSet.Bookmark := b;
//      except
//        on e: EDatabaseError do
//          DataSet.First;
//      end;
//    end
//    else
//    begin
//      // заполняем новыми данными
//      ToClientDataSet(DataSet, aTable, Settings.Client, cdsReplace);
//      DataSource.DataSet := DataSet;
//    end;

    if aMode in [cdsReplace, cdsAppend] then
    begin
      // обновляем данные - сохраняем позицию
      b := DataSet.Bookmark;
      JSONToClientDataSet(DataSet, Resp);
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
      JSONToClientDataSet(DataSet, Resp);
      DataSource.DataSet := DataSet;
    end;
  finally
    DataSetIsLoading := False;
  end;
end;

procedure TCustomDocList.iTodayClick(Sender: TObject);
begin
  DisplayInterval.Kind := ikInterval;
  DisplayInterval.ShiftKind := TShiftKind((Sender as TComponent).Tag);
end;

procedure TCustomDocList.LoadSettings;
begin
  inherited;
  DisplayInterval.Load(AppStorage, Name + '\DisplayInterval');
  dxbInterval.Caption := DisplayInterval.AsText;
end;

procedure TCustomDocList.SaveSettings;
begin
  inherited;
  DisplayInterval.Save(AppStorage, Name + '\DisplayInterval');
end;

procedure TCustomDocList.SetDisplayInterval(const Value: TOPCInterval);
begin
  FDisplayInterval.Assign(Value);
end;

procedure TCustomDocList.aIntervalExecute(Sender: TObject);
begin
  ShowIntervalForm(DisplayInterval, 0);
end;

procedure TCustomDocList.FormCreate(Sender: TObject);
begin
  FDisplayInterval := TOPCInterval.Create;
  FDisplayInterval.Kind := ikShift;
  FDisplayInterval.TimeShift := 2;
  FDisplayInterval.TimeShiftUnit := tsuDay;
  FDisplayInterval.EnableTime := False;

  inherited;

  FDisplayInterval.OnChanged := DoChangeInterval;
end;

procedure TCustomDocList.FormDestroy(Sender: TObject);
begin
  inherited;

  FDisplayInterval.Free;
end;

function TCustomDocList.GetSQL: string;
begin
  Result := Format(SelectSql, [
    DateTimeToIso8601(DisplayInterval.Date1, True),
    DateTimeToIso8601(DisplayInterval.Date2 - 1/SecsPerDay, True)]);
end;

//procedure TCustomDocList.GridViewKeyPress(Sender: TObject; var Key: Char);
//begin
//  if Key = Chr(VK_RETURN) then
//    aEditExecute(Self);
//end;

end.
