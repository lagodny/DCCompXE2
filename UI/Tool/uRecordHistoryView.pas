unit uRecordHistoryView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, dxBarBuiltInMenu, dxBar, dxBarExtItems, cxClasses, cxGridCustomPopupMenu, cxGridPopupMenu, Vcl.ActnList,
  Vcl.Menus, Datasnap.DBClient, JvComponentBase, JvFormPlacement, cxDBNavigator, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  SynCommons, mORMot;

type
  TRecordHistoryView = class(TCustomList)
    DataSetTimestamp: TDateTimeField;
    DataSetIdentifier: TIntegerField;
    DataSetEvent: TWideStringField;
    DataSetValue: TWideStringField;
    ListViewTimestamp: TcxGridDBColumn;
    ListViewEvent: TcxGridDBColumn;
    ListViewIdentifier: TcxGridDBColumn;
    ListViewValue: TcxGridDBColumn;
  protected
    procedure LoadSettings; override;
  public
    procedure LoadHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);

    class procedure ShowHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
  end;


implementation

uses
  uFormsManager;


{$R *.dfm}

{ TRecordHistory }

procedure TRecordHistoryView.LoadHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
var
  i: Integer;
  aHist: TSQLRecordHistory;

  aRec: TSQLRecord;
  aEvent: TSQLHistoryEvent; // will be either heAdd, heUpdate or heDelete
  aTimestamp: TModTime;
begin
  aRec := aRecordClass.Create;
  aHist := TSQLRecordHistory.CreateHistory(aClient, aRecordClass, aID);

  DataSetIsLoading := True;
  try
    // открываем, если закрыта
    if not DataSet.Active then
      DataSet.CreateDataSet
    else
      DataSet.EmptyDataSet;

    DataSet.LogChanges := False;

    for i := 0 to aHist.HistoryCount-1 do
    begin
      aHist.HistoryGet(i,aEvent,aTimestamp, aRec);

      DataSet.Append;
      DataSetTimestamp.AsDateTime := TTimeLogBits(aTimestamp).ToDateTime;
      DataSetEvent.AsString := GetEnumName(TypeInfo(TSQLHistoryEvent),ord(aEvent))^;
      DataSetIdentifier.AsInteger := aRec.ID;
      DataSetValue.AsString := UTF8ToString((aRec.GetJSONValues(True, True, soSelect)));
      DataSet.Post;
    end;
  finally
    DataSetIsLoading := False;
    aHist.Free;
    aRec.Free;
  end;
end;

procedure TRecordHistoryView.LoadSettings;
begin
  FListViewVer := 2;
  inherited;
end;

class procedure TRecordHistoryView.ShowHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
var
  f: TRecordHistoryView;
begin
  f := TRecordHistoryView(TFormsManager.Instance.CreateNewFormRes(TRecordHistoryView));
  try
    f.LoadHistory(aClient, aRecordClass, aID);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

end.
