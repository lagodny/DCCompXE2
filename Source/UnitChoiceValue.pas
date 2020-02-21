unit UnitChoiceValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TChoiceValue = class(TForm)
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    Edit: TEdit;
    Label1: TLabel;
    ComboBox: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure ComboBoxChange(Sender: TObject);
  private
    { Private declarations }
  public
    sl:TStrings;
    { Public declarations }
  end;

function OPCChoiceValue(aCaption:string;aItems:TStrings;aValue:string;var aNewValue:string):boolean;

var
  ChoiceValue: TChoiceValue;

implementation

{$R *.dfm}
function OPCChoiceValue(aCaption:string;aItems:TStrings;aValue:string;var aNewValue:string):boolean;
var
  ChoiceValueForm:TChoiceValue;
begin
  ChoiceValueForm := TChoiceValue.Create(nil);
  try
    if aCaption <> '' then
      ChoiceValueForm.Caption := aCaption;
    ChoiceValueForm.sl := aItems;
    ChoiceValueForm.Edit.Text := aValue;
    ChoiceValueForm.ShowModal;
    if ChoiceValueForm.ModalResult = mrOk then
    begin
      aNewValue := ChoiceValueForm.Edit.Text;
      Result := true;
    end;
  finally
    ChoiceValueForm.Free;
  end;
end;


procedure TChoiceValue.FormShow(Sender: TObject);
var
  I: Integer;
begin
  if sl<>nil then
  begin
    for I := 0 to sl.Count - 1 do
      ComboBox.Items.Add(sl.ValueFromIndex[i]);
    EditChange(Sender);
  end;
  ComboBox.Visible := (ComboBox.Items.Count<>0);
end;

procedure TChoiceValue.EditChange(Sender: TObject);
var
  aIndex : integer;
begin
  if sl<>nil then
  begin
    aIndex := sl.IndexOfName(Edit.Text);
    if aIndex >= 0 then
      ComboBox.ItemIndex := ComboBox.Items.IndexOf(sl.ValueFromIndex[aIndex]);
  end;
end;

procedure TChoiceValue.ComboBoxChange(Sender: TObject);
var
  sId:string;
begin
  if sl<>nil then
  begin
    if ComboBox.ItemIndex>=0 then
    begin
      sId:=sl.Names[ComboBox.ItemIndex];
      Edit.Text:=sId;
    end;
  end;
end;

end.
