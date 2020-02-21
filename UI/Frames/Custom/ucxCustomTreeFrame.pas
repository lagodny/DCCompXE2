unit ucxCustomTreeFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, Datasnap.DBClient,
  //uCustomRec,
  ucxCustomDataFrame,
  SynCommons, mORMot, mORMotMidasVCL,
  //mORMot
  UIEdit,
  cxNavigator, dxSkinsCore, dxSkinscxPCPainter, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL,
  cxDataControllerConditionalFormattingRulesManagerDialog, Vcl.Menus;

type
  TcxCustomTreeFrame = class(TcxCustomDataFrame)
    tlStructure: TcxDBTreeList;
    PopupMenu: TPopupMenu;
    fr_TL_miCopy: TMenuItem;
    fr_TL_miCopyValues: TMenuItem;
    fr_TL_miPaste: TMenuItem;
    N1: TMenuItem;
    fr_TL_miEditInline: TMenuItem;
    procedure tlStructureKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DataSetAfterDelete(DataSet: TDataSet);
    procedure DataSetBeforeEdit(DataSet: TDataSet);
    procedure tlStructureDblClick(Sender: TObject);
    procedure fr_TL_miCopyClick(Sender: TObject);
    procedure fr_TL_miEditInlineClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure fr_TL_miCopyValuesClick(Sender: TObject);
    procedure fr_TL_miPasteClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  protected
    function IsRoot: Boolean;
    procedure PostRecord; override;
    procedure FocusRecord; override;
  end;

implementation

uses
  uFormsManager, uBaseFormInterface,
  uDataProc,
  uSettings;

{$R *.dfm}

{ TCustomTreeFrame }

constructor TcxCustomTreeFrame.Create(AOwner: TComponent);
begin
  inherited;
  Root := 'Root';
  EditInLine := True;
end;

procedure TcxCustomTreeFrame.DataSetAfterDelete(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  inherited;
  if Assigned(Parent) and (Parent is TForm) then
    TForm(Parent).FocusControl(tlStructure);
end;

procedure TcxCustomTreeFrame.DataSetBeforeEdit(DataSet: TDataSet);
begin
  if DataSetIsLoading then
    Exit;

  if IsRoot then
    Abort;

  inherited;
end;

procedure TcxCustomTreeFrame.FocusRecord;
begin
  tlStructure.SetFocus; // Focused := True;
  if Assigned(tlStructure.FocusedNode) then
    tlStructure.FocusedNode.MakeVisible;
end;

procedure TcxCustomTreeFrame.fr_TL_miCopyClick(Sender: TObject);
begin
  tlStructure.CopySelectedToClipboard;
end;

procedure TcxCustomTreeFrame.fr_TL_miCopyValuesClick(Sender: TObject);
begin
  TL_CopyValuesToClipboard(tlStructure);
end;

procedure TcxCustomTreeFrame.fr_TL_miEditInlineClick(Sender: TObject);
begin
  EditInLine := fr_TL_miEditInline.Checked;
end;

procedure TcxCustomTreeFrame.fr_TL_miPasteClick(Sender: TObject);
var
  aSaveEditInline: Boolean;
begin
  aSaveEditInline := EditInLine;
  try
    EditInLine := True;
    TL_PasteValuesFromClipboard(tlStructure);
  finally
    EditInLine := aSaveEditInline;
  end;
end;

function TcxCustomTreeFrame.IsRoot: Boolean;
begin
  Result := False;
  if DataSet.Eof then
    Exit;

  Result :=
    not DataSet.FieldByName(tlStructure.DataController.KeyField).IsNull
    and (DataSet.FieldByName(tlStructure.DataController.KeyField).AsInteger = 0);
end;

procedure TcxCustomTreeFrame.PopupMenuPopup(Sender: TObject);
begin
  fr_TL_miEditInline.Checked := EditInLine;
end;

procedure TcxCustomTreeFrame.PostRecord;
begin
  if IsRoot then
    Abort;

  if not Assigned(Settings.Client) then
    Exit;

  //RestPostRecord(Settings.Client, FRecordClass[0], DataSet, nil, True);
  RestPostRecord(Settings.Client, FRecordClass[0], DataSet, nil, False);
end;


procedure TcxCustomTreeFrame.tlStructureDblClick(Sender: TObject);
begin
  if Assigned(tlStructure.HitTest.HitNode) then
    DoDblClickOrEnter;
end;

procedure TcxCustomTreeFrame.tlStructureKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      if Assigned(tlStructure.FocusedNode) then
        DoDblClickOrEnter;
      //Key := 0;
    end;
  end;
end;

end.
