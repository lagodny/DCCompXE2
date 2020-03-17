unit LA.Frame.CustomDocPart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucxCustomListFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, dxBarBuiltInMenu, Vcl.Menus, cxGridCustomPopupMenu,
  cxGridPopupMenu, Datasnap.DBClient, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  // 1. добавляет DocID, по которому производится отбор
  // 2. включает режим редактирования на месте (EditInLine := True)
  // наследники должны реализовать метод UpdateWhere
  TcxCustomDocPartFrame = class(TcxCustomListFrame)
    fr_div3: TMenuItem;
  private
    FDocID: Integer;
    procedure SetDocID(const Value: Integer);
  protected
    procedure EditRecord(aID: Integer); override;

    procedure UpdateWhere; virtual;
    procedure InitCustomProps; override;
  public
    procedure Init(aData: string); override;
    procedure InitDoc(aDoc: Integer); virtual;

    property DocID: Integer read FDocID write SetDocID;
  end;

implementation

uses
  uFormsManager,
  SynCommons, mORMot;

{$R *.dfm}

{ TcxCustomGroupListFrame }

procedure TcxCustomDocPartFrame.EditRecord(aID: Integer);
var
  aData: Variant;
  aFormClass: TFormClass;
begin
  if aID = 0 then
  begin
    TDocVariant.New(aData);
    aData.ID := 0;
    aData.GroupID := DocID;
    OpenEditFormByData(aData);
  end
  else
    inherited EditRecord(aID);
end;

procedure TcxCustomDocPartFrame.Init(aData: string);
begin
  Data := _Json(StringToUTF8(aData));
  DocID := Data.GroupID;
  InitLookups;
  FillDataSet;
end;

procedure TcxCustomDocPartFrame.InitCustomProps;
begin
  inherited;
  EditInLine := True;
end;

procedure TcxCustomDocPartFrame.InitDoc(aDoc: Integer);
begin
  FDocID := aDoc;
  UpdateWhere;
  InitLookups;
  FillDataSet;
end;

procedure TcxCustomDocPartFrame.SetDocID(const Value: Integer);
begin
  if FDocID <> Value then
  begin
    FDocID := Value;
    UpdateWhere;
  end;
end;

procedure TcxCustomDocPartFrame.UpdateWhere;
begin

end;

end.
