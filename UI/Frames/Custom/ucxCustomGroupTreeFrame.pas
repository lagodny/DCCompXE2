unit ucxCustomGroupTreeFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucxCustomTreeFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  Datasnap.DBClient, cxInplaceContainer, cxTLData, cxDBTL, Vcl.Menus;

type
  TcxCustomGroupTreeFrame = class(TcxCustomTreeFrame)
    procedure tlStructureDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  private
    function GetGroupID: Integer;
    procedure SetGroupID(const Value: Integer);
  protected
    FGroupID: Integer;
    procedure DoDataLoaded; override;
  public
    procedure Init(aData: string); override;
    property GroupID: Integer read GetGroupID write SetGroupID;
  end;

implementation

uses
  SynCommons;

{$R *.dfm}

{ TcxCustomGroupTreeFrame }

procedure TcxCustomGroupTreeFrame.DoDataLoaded;
begin
  if FGroupID = 0 then
    Exit;

  DataSet.Locate('ID', FGroupID, []);
  if Assigned(tlStructure.FocusedNode) then
    tlStructure.FocusedNode.MakeVisible;
end;

function TcxCustomGroupTreeFrame.GetGroupID: Integer;
begin
  if not DataSet.Eof then
  begin
    if DataSet.State in [dsInsert] then
      Result := -1
    else
      Result := DataSetID.AsInteger
  end
  else
    Result := 0;
end;

procedure TcxCustomGroupTreeFrame.Init(aData: string);
begin
  Data := _Json(StringToUTF8(aData));
  Root := Data.Root;
end;

procedure TcxCustomGroupTreeFrame.SetGroupID(const Value: Integer);
begin
  if FGroupID = Value then
    Exit;

  FGroupID := Value;
  if DataSet.Eof then
    Exit;

  DataSet.Locate('ID', Value, []);
  if Assigned(tlStructure.FocusedNode) then
    tlStructure.FocusedNode.MakeVisible;
end;

procedure TcxCustomGroupTreeFrame.tlStructureDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  Accept := Source = tlStructure;
end;

end.
