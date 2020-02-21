unit uBaseDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ActnList,
  JvComponentBase, JvFormPlacement,
  uBaseForm, uBaseFormInterface, uFormsManager;

type
  TBaseDialog = class(TBaseForm)
    ActionList1: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aSave: TAction;
    pButton: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    bSave: TButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private

  public
    procedure Save; virtual;
  end;

//var
//  BaseDialog: TBaseDialog;

implementation

uses
  SynCommons;

{$R *.dfm}

{ TBaseDialog }

procedure TBaseDialog.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TBaseDialog.aOKExecute(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TBaseDialog.aSaveExecute(Sender: TObject);
begin
  Save;
end;

procedure TBaseDialog.Save;
begin
  ViewToModel;
  NotifySubscriber(noDataChanged, 0, GetData);
end;

end.
