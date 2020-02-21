unit uCustomDocList;

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
  TB2Dock, TB2Toolbar, SpTBXItem, TB2Item,
  SynCommons, mORMot, mORMotMidasVCL,
  uCustomList,
  uAppStorage, uCustomRec, uBaseForm, uCuteModel,
  uOPCInterval, uOPCIntervalForm, cxGridCustomPopupMenu, cxGridPopupMenu;

type

  TCustomDocList = class(TCustomList)
    dTop: TSpTBXDock;
    tbDoc: TSpTBXToolbar;
    aNew: TAction;
    aEdit: TAction;
    tbiNew: TSpTBXItem;
    tbiEdit: TSpTBXItem;
    tbiSep1: TSpTBXSeparatorItem;
    tbiUpdate: TSpTBXItem;
    pmiNew: TMenuItem;
    pmiEdit: TMenuItem;
    aInterval: TAction;
    SpTBXItem41: TSpTBXItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    smiInterval: TSpTBXSubmenuItem;
    iWeek: TSpTBXItem;
    pmiDiv1: TMenuItem;
    aDelete: TAction;
    pmiRefresh: TMenuItem;
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure DataSetBeforeGetRecords(Sender: TObject; var OwnerData: OleVariant);
    procedure DataSetBeforeDelete(DataSet: TDataSet);
    procedure ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure smiIntervalInitPopup(Sender: TObject; PopupView: TTBView);
    procedure aIntervalExecute(Sender: TObject);
    procedure iTodayClick(Sender: TObject);
    procedure GridViewKeyPress(Sender: TObject; var Key: Char);
    procedure ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure FillDataSet(aMode: TClientDataSetMode=cdsReplace); override;
    property DisplayInterval: TOPCInterval read FDisplayInterval write SetDisplayInterval;
  end;

implementation

uses
  uFormsManager, uBaseFormInterface,
  uTimeUtils,
  uSettings, uCommonData, uViewDataInterface;

{$R *.dfm}

{ TDocForm }

procedure TCustomDocList.aEditExecute(Sender: TObject);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialog, DataSet.FieldByName('Id').AsInteger)
  else
  begin
    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, DataSet.FieldByName('Id').AsInteger)
    else
      ShowEditDlg(DataSet.FieldByName('Id').AsInteger);
  end;
end;

procedure TCustomDocList.aNewExecute(Sender: TObject);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialog, 0)
  else
  begin
    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, 0)
    else
      ShowEditDlg(0);
  end;
end;

procedure TCustomDocList.aRefreshExecute(Sender: TObject);
begin
  FillDataSet(cdsReplace);
end;

procedure TCustomDocList.DataSetBeforeDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

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
  smiInterval.Caption := DisplayInterval.AsText;
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

procedure TCustomDocList.FillDataSet(aMode: TClientDataSetMode);
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

  InitLookups;
  DataSetIsLoading := True;
  try
    // формируем запрос
    s := GetSQL;
    // получаем данные с сервера
    Resp := Settings.Client.ViewData.SelectSQL(s);
    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet;

    DataSet.LogChanges := False;

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
  smiInterval.Caption := DisplayInterval.AsText;
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

procedure TCustomDocList.smiIntervalInitPopup(Sender: TObject; PopupView: TTBView);
var
  i: integer;
  aItem: TTBCustomItem;
begin
  for i := 0 to smiInterval.Count - 1 do
  begin
    aItem := smiInterval.Items[i];
    if aItem.Tag = Ord(DisplayInterval.ShiftKind) then
      aItem.Checked := True
    else
      aItem.Checked := False;
  end;
end;

procedure TCustomDocList.FormCreate(Sender: TObject);
begin
  FDisplayInterval := TOPCInterval.Create;
  FDisplayInterval.Kind := ikShift;
  FDisplayInterval.TimeShift := 2;
  FDisplayInterval.TimeShiftUnit := tsuDay;
  FDisplayInterval.EnableTime := False;

  inherited;


  InitCustomProps;
//  FillDataSet(cdsNew);

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

procedure TCustomDocList.ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DoDblClickOrEnter;
  //aEditExecute(Self);
end;

procedure TCustomDocList.ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      DoDblClickOrEnter;
  end;
end;

procedure TCustomDocList.GridViewKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
    aEditExecute(Self);
end;

end.
