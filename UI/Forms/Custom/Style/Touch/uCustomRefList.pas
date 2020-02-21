unit uCustomRefList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, Vcl.ActnList, Vcl.Menus, Datasnap.DBClient,
  JvComponentBase, JvFormPlacement, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TCustomRefList = class(TCustomList)
    aEdit: TAction;
    aNew: TAction;
    New1: TMenuItem;
    Edit1: TMenuItem;
    N2: TMenuItem;
    aDelete: TAction;
    procedure aNewExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);

    procedure ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure ListViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit;
      var Key: Word; Shift: TShiftState);
  private
    procedure DoDblClickOrEnter;
  public
//    procedure ShowEditDlg(aID: Integer);
  end;

//var
//  RefList: TRefList;

implementation

uses
  uBaseForm, uBaseFormInterface, uFormsManager,
  mORMot, mORMotUIEdit,
  uSettings,
  uMain;

{$R *.dfm}

procedure TCustomRefList.aEditExecute(Sender: TObject);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    //MainForm.OpenForm(FDlgClass, DataSet.FieldByName('Id').AsInteger, Self, False)
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialog, DataSet.FieldByName('Id').AsInteger)
  else
  begin
    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialog, DataSet.FieldByName('Id').AsInteger)
    else
    begin
      //DataSet.Edit;
      ShowEditDlg(DataSet.FieldByName('Id').AsInteger);
    end;
  end;
end;

procedure TCustomRefList.aNewExecute(Sender: TObject);
var
  aFormClass: TFormClass;
begin
  if Assigned(FDlgClass) then
    TFormsManager.Instance.OpenFormByClass(FDlgClass, ftDialogModal, 0)
  else
  begin
    aFormClass := TFormsManager.Instance.FindFormClass(FRecordClass[0], ftDialog);
    if Assigned(aFormClass) then
      TFormsManager.Instance.OpenForm(FRecordClass[0], ftDialogModal, 0)
    else
    begin
      //DataSet.Edit;
      ShowEditDlg(0);
    end;
  end;
end;

procedure TCustomRefList.DoDblClickOrEnter;
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

procedure TCustomRefList.ListViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  DoDblClickOrEnter;
end;

procedure TCustomRefList.ListViewEditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      DoDblClickOrEnter;
      //Key := 0;
    end;
  end;
end;

procedure TCustomRefList.ListViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

//procedure TCustomRefList.ShowEditDlg(aID: Integer);
//var
//  r: TSQLRecord;
//  f: TRecordEditForm;
//begin
//  r := RecordClass[0].Create();
//  f := TRecordEditForm.Create(self);
//  try
//    Settings.Client.Retrieve(aID, r);
//    f.SetRecord(Settings.Client, r);
//    if f.ShowModal = mrOk then
//      Settings.Client.AddOrUpdate(r);
//  finally
//    f.Free;
//    r.Free;
//  end;
//end;

end.
