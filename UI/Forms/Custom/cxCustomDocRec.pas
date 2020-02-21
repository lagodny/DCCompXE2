unit cxCustomDocRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxCustomRec, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, cxButtons, dxLayoutControl, dxBar, dxSkinsCore, dxSkinsdxBarPainter;

type
  //TDocEditMode = (demReadOlny, demRestrictedEdit, demFullEdit);

  TcxCustomDocRec = class(TcxCustomRec)
  private
//    FEditMode: TDocEditMode;
//    procedure SetEditMode(const Value: TDocEditMode);
    { Private declarations }
  public
//    property EditMode: TDocEditMode read FEditMode write SetEditMode;
  end;



//var
//  CustomDocRec: TcxCustomDocRec;

implementation

{$R *.dfm}

{ TcxCustomDocRec }

//procedure TcxCustomDocRec.SetEditMode(const Value: TDocEditMode);
//begin
//  if FEditMode <> Value then
//  begin
//    FEditMode := Value;
//    UpdateUI;
//  end;
//end;

end.
