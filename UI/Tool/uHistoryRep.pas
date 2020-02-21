unit uHistoryRep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, JvComponentBase, JvFormPlacement, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, Datasnap.DBClient, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutContainer, dxLayoutControl,
  SynCommons,
  mORMot, cxMemo;

type
  THistoryRep = class(TBaseForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    ListGrid: TcxGrid;
    ListView: TcxGridDBTableView;
    ListLevel: TcxGridLevel;
    sHistory: TDataSource;
    dsHistory: TClientDataSet;
    dsHistoryTimestamp: TDateTimeField;
    dsHistoryIdentifier: TIntegerField;
    dsHistoryValue: TWideStringField;
    ListViewTimestamp: TcxGridDBColumn;
    ListViewIdentifier: TcxGridDBColumn;
    ListViewValue: TcxGridDBColumn;
    dsHistoryEvent: TWideStringField;
    ListViewEvent: TcxGridDBColumn;
  private
//    FRecord: TSQLRecord;
//    FRecordClass: TSQLRecordClass;
  public
    procedure LoadHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
    class procedure ShowHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
  end;

implementation

uses
  uFormsManager;

{$R *.dfm}

{ THistoryRep }

procedure THistoryRep.LoadHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
var
  i: Integer;
  aHist: TSQLRecordHistory;

  aRec: TSQLRecord;
  aEvent: TSQLHistoryEvent; // will be either heAdd, heUpdate or heDelete
  aTimestamp: TModTime;
begin
  //FRecordClass := aRecordClass;
  aRec := aRecordClass.Create;
  aHist := TSQLRecordHistory.CreateHistory(aClient, aRecordClass, aID);
  try
    if not dsHistory.Active then
      dsHistory.CreateDataSet
    else
      dsHistory.EmptyDataSet;

    dsHistory.LogChanges := False;

    for i := 0 to aHist.HistoryCount-1 do
    begin
      aHist.HistoryGet(i,aEvent,aTimestamp, aRec);
      dsHistory.Append;
      dsHistoryTimestamp.AsDateTime := TTimeLogBits(aTimestamp).ToDateTime;
      dsHistoryEvent.AsString := GetEnumName(TypeInfo(TSQLHistoryEvent),ord(aEvent))^;
      dsHistoryIdentifier.AsInteger := aRec.ID;
      dsHistoryValue.AsString := aRec.GetJSONValues(true,true,soSelect);
      dsHistory.Post;
//      'Event: ',GetEnumName(TypeInfo(TSQLHistoryEvent),ord(aEvent))^);
//      writeln('Timestamp: ',);
//      writeln('Identifier: ',aRec.ID);
//      writeln('Value: ',aRec.GetJSONValues(true,true,soSelect));
    end;

  finally
    aHist.Free;
    aRec.Free;
  end;
end;

class procedure THistoryRep.ShowHistory(aClient: TSQLRest; aRecordClass: TSQLRecordClass; aID: TID);
var
  f: THistoryRep;
begin
  f := THistoryRep(TFormsManager.Instance.CreateNewFormRes(THistoryRep));
//  f := THistoryRep.CreateStyled(Application.MainForm);
//  f := T
  try
    f.LoadHistory(aClient, aRecordClass, aID);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

end.
