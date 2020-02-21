unit ucxCustomGroupListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucxCustomListFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, dxBarBuiltInMenu, Vcl.Menus, cxGridCustomPopupMenu,
  cxGridPopupMenu, Datasnap.DBClient, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  // 1. добавляет GroupID, по которому производится отбор
  // 2. включает режим редактирования на месте (EditInLine := True)
  // наследники должны реализовать метод UpdateWhere
  TcxCustomGroupListFrame = class(TcxCustomListFrame)
    fr_miShowAll: TMenuItem;
    fr_div3: TMenuItem;
    procedure PopupMenuPopup(Sender: TObject);
    procedure fr_miShowAllClick(Sender: TObject);
  private
    FGroupID: Integer;
    FShowAll: Boolean;
    procedure SetGroupID(const Value: Integer);
    procedure SetShowAll(const Value: Boolean);
  protected
    procedure EditRecord(aID: Integer); override;

    procedure UpdateWhere; virtual;
    procedure InitCustomProps; override;
  public
    procedure Init(aData: string); override;
    procedure InitGroup(aGroup: Integer); virtual;

    property GroupID: Integer read FGroupID write SetGroupID;
    property ShowAll: Boolean read FShowAll write SetShowAll;
  end;

implementation

uses
  uFormsManager,
  SynCommons, mORMot;

{$R *.dfm}

{ TcxCustomGroupListFrame }

procedure TcxCustomGroupListFrame.EditRecord(aID: Integer);
var
  aData: Variant;
  aFormClass: TFormClass;
begin
  if aID = 0 then
  begin
    TDocVariant.New(aData);
    aData.ID := 0;
    aData.GroupID := GroupID;
    OpenEditFormByData(aData);
  end
  else
    inherited EditRecord(aID);
end;

procedure TcxCustomGroupListFrame.fr_miShowAllClick(Sender: TObject);
begin
  ShowAll := fr_miShowAll.Checked;
end;

procedure TcxCustomGroupListFrame.Init(aData: string);
begin
  Data := _Json(StringToUTF8(aData));
  GroupID := Data.GroupID;
  InitLookups;
  FillDataSet;
end;

procedure TcxCustomGroupListFrame.InitCustomProps;
begin
  inherited;
  EditInLine := True;
end;

procedure TcxCustomGroupListFrame.InitGroup(aGroup: Integer);
begin
  FGroupID := aGroup;
  UpdateWhere;
  InitLookups;
  FillDataSet;
end;

procedure TcxCustomGroupListFrame.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  fr_miShowAll.Checked := ShowAll;
end;

procedure TcxCustomGroupListFrame.SetGroupID(const Value: Integer);
begin
  if FGroupID <> Value then
  begin
    FGroupID := Value;
    UpdateWhere;
  end;
end;

procedure TcxCustomGroupListFrame.SetShowAll(const Value: Boolean);
begin
  if FShowAll <> Value then
  begin
    FShowAll := Value;
    UpdateWhere;
    FillDataSet;
  end;

end;

procedure TcxCustomGroupListFrame.UpdateWhere;
begin

end;

end.
