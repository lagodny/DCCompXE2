unit uTouchMode;

interface

uses
  System.Classes,
  Vcl.Forms, Vcl.Controls,
  cxGridCustomView, cxGridTableView;

procedure SetTouchMode(aForm: TForm);

implementation

procedure SetTouchMode(aForm: TForm);
var
  i: Integer;
  aElement: TComponent;
begin
  for i := 0 to aForm.ComponentCount - 1 do
  begin
    aElement := aForm.Components[i];
    if aElement is TcxGridTableView then
    begin
      // делаем строки высотой в 35px
      TcxGridTableView(aElement).OptionsView.DataRowHeight := 35;
    end;

  end;
end;

end.
