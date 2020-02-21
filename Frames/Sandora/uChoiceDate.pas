unit uChoiceDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TChoiceDateForm = class(TForm)
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Label1: TLabel;
    DateTimePicker: TDateTimePicker;
    procedure DateTimePickerDblClick(Sender: TObject);
    procedure DateTimePickerChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TChoiceDateForm.DateTimePickerChange(Sender: TObject);
begin
//  ModalResult:=mrOk;
end;

procedure TChoiceDateForm.DateTimePickerDblClick(Sender: TObject);
begin
//  ModalResult:=mrOk;
end;

end.
