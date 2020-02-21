unit uCustomDocRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls,
  uCustomRec;

type
  TDocEditMode = (demReadOlny, demRestrictedEdit, demFullEdit);

  TCustomDocRec = class(TCustomRec)
  private
    FEditMode: TDocEditMode;
    procedure SetEditMode(const Value: TDocEditMode);
    { Private declarations }
  public
    property EditMode: TDocEditMode read FEditMode write SetEditMode;
  end;



//var
//  CustomDocRec: TCustomDocRec;

implementation

{$R *.dfm}

{ TCustomDocRec }

procedure TCustomDocRec.SetEditMode(const Value: TDocEditMode);
begin
  if FEditMode <> Value then
  begin
    FEditMode := Value;
    UpdateUI;
  end;
end;

end.
