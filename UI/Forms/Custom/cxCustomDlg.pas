unit cxCustomDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ActnList,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  dxLayoutControlAdapters, dxLayoutContainer, cxClasses, cxButtons, dxLayoutControl,
  JvComponentBase, JvFormPlacement,
  uBaseForm, uBaseFormInterface;

type
  TCustomDlg = class(TBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    bOK: TcxButton;
    bCancel: TcxButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    lgButtons: TdxLayoutGroup;
    lgButtonsRight: TdxLayoutGroup;
    liOK: TdxLayoutItem;
    liCancel: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    lgMain: TdxLayoutGroup;
    ActionList1: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aSave: TAction;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  protected
    procedure PerformNext; virtual;
  public
    procedure Save; virtual;
  end;

//var
//  CustomDlg: TCustomDlg;

implementation

{$R *.dfm}

{ TCustomDlg }

procedure TCustomDlg.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TCustomDlg.aOKExecute(Sender: TObject);
begin
  Save;
  Close;
  PerformNext;
end;

procedure TCustomDlg.aSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TCustomDlg.PerformNext;
begin

end;

procedure TCustomDlg.Save;
begin
  ViewToModel;
  CheckModel;
  WriteModel;

  NotifySubscriber(noDataChanged, 0, GetData);
end;

end.
