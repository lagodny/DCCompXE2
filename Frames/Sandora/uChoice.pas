unit uChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TChoiceForm = class(TForm)
    ButtonOK: TButton;
    ButtonCancel: TButton;
    ComboBox: TComboBox;
    Label1: TLabel;
    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  ChoiceAlarmForm: TChoiceAlarmForm;

function CreateChoice(aCaption,aPrompt:string; aStrings: TStrings): TChoiceForm;

implementation

{$R *.dfm}

function CreateChoice(aCaption,aPrompt:string; aStrings: TStrings): TChoiceForm;
var
  i:integer;
begin
  Result := TChoiceForm.Create(nil);
  Result.Caption := aCaption;
  Result.Label1.Caption := aPrompt;
  Result.ComboBox.Items.Clear;
  for i := 0 to aStrings.Count - 1 do
    Result.ComboBox.Items.Add(aStrings.ValueFromIndex[i]);
end;

procedure TChoiceForm.ComboBoxChange(Sender: TObject);
begin
  ButtonOK.Enabled := (trim(ComboBox.Text) <> '');
end;

procedure TChoiceForm.ComboBoxDblClick(Sender: TObject);
begin
  if ButtonOK.Enabled = true then ModalResult:=mrOk;
end;

end.
