unit uCustomHistoryList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  Data.DB, cxDBData, dxBarBuiltInMenu, dxBar, dxBarExtItems, cxClasses, cxGridCustomPopupMenu, cxGridPopupMenu, Vcl.ActnList,
  Vcl.Menus, Datasnap.DBClient, JvComponentBase, JvFormPlacement, cxDBNavigator, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  SynCommons,
  uOPCInterval, uOPCIntervalForm;

type
  TCustomHistroyList = class(TCustomList)
    aInterval: TAction;
    dxbInterval: TdxBarButton;
    procedure aIntervalExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDisplayInterval: TOPCInterval;
    FRecordID: Integer;
    procedure SetDisplayInterval(const Value: TOPCInterval);
    procedure SetRecordID(const Value: Integer);
  protected
    procedure LoadSettings; override;
    procedure SaveSettings; override;

    procedure DoChangeInterval(Sender: TObject); virtual;
    procedure DoFilterChanged; virtual;

    function GetWhereSql: RawUTF8; override;
    procedure InitFromData(aData: string); override;
  public
    property RecordID: Integer read FRecordID write SetRecordID;
    property DisplayInterval: TOPCInterval read FDisplayInterval write SetDisplayInterval;
  end;


implementation

uses
  uAppStorage;


{$R *.dfm}

procedure TCustomHistroyList.aIntervalExecute(Sender: TObject);
begin
  ShowIntervalForm(DisplayInterval, 0);
end;

procedure TCustomHistroyList.DoChangeInterval(Sender: TObject);
begin
  aInterval.Caption := DisplayInterval.AsText;
  DoFilterChanged;
end;

procedure TCustomHistroyList.DoFilterChanged;
begin
  FillDataSet;
  UpdateUI;
end;

procedure TCustomHistroyList.FormCreate(Sender: TObject);
begin
  FDisplayInterval := TOPCInterval.Create;
  FDisplayInterval.Kind := ikShift;
  FDisplayInterval.TimeShift := 2;
  FDisplayInterval.TimeShiftUnit := tsuDay;
  FDisplayInterval.EnableTime := False;

  inherited;

  FDisplayInterval.OnChanged := DoChangeInterval;
end;

procedure TCustomHistroyList.FormDestroy(Sender: TObject);
begin
  inherited;
  FDisplayInterval.Free;
end;

function TCustomHistroyList.GetWhereSql: RawUTF8;
begin
  if RecordID = 0 then
    Result := FormatUTF8('Timestamp BETWEEN ? AND ?', [],
      [TimeLogFromDateTime(DisplayInterval.Date1), TimeLogFromDateTime(DisplayInterval.Date2)])
  else
    Result := FormatUTF8('ModifiedRecord=?', [], [RecordID]);
end;

procedure TCustomHistroyList.InitFromData(aData: string);
var
  v: Variant;
begin
  v := _Json(StringToUTF8(aData));
  FRecordID := VariantToInt64Def(v.RecordID, 0);
  DataToControls(FRecordID);
end;

//procedure TCustomHistroyList.InitLookups;
//begin
//  inherited;
//  InitEnumLookupProp(Self, Settings.Client,
//    PTypeInfo(TypeInfo(TSQLHistoryEvent))^.EnumBaseType,
//    TcxLookupComboBoxProperties(ListViewEvent.Properties), 'ID', 'Title');
//end;

procedure TCustomHistroyList.LoadSettings;
begin
  inherited;
  DisplayInterval.Load(AppStorage, Name + '\DisplayInterval');
  aInterval.Caption := DisplayInterval.AsText;
end;

procedure TCustomHistroyList.SaveSettings;
begin
  inherited;
  DisplayInterval.Save(AppStorage, Name + '\DisplayInterval');
end;

procedure TCustomHistroyList.SetDisplayInterval(const Value: TOPCInterval);
begin
  FDisplayInterval.Assign(Value);
end;

procedure TCustomHistroyList.SetRecordID(const Value: Integer);
begin
  if FRecordID <> Value then
  begin
    FRecordID := Value;
    DoFilterChanged;
  end;
end;

end.
