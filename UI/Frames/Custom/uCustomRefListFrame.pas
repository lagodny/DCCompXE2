unit uCustomRefListFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCustomListFrame, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, Data.DB, cxDBData, cxGridCustomPopupMenu, cxGridPopupMenu,
  Datasnap.DBClient, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxNavigator, cxLabel, dxSkinsCore, dxSkinscxPCPainter;

type
  TCustomRefListFrame = class(TCustomListFrame)
    colNo: TcxGridDBColumn;
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
  end;

implementation

{$R *.dfm}

{ TCustomRefListFrame }


procedure TCustomRefListFrame.colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := IntToStr(ARecord.Index + 1);
end;

end.
