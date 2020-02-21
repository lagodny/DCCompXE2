unit uCustomAuthChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

resourcestring
  sPasswordMismatch = 'Password mismatch';


type
  TCustomAuthChangePassword = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    lUser: TLabel;
    lOldPassword: TLabel;
    lNewPassword: TLabel;
    lConfirmation: TLabel;
    eUser: TEdit;
    eNewPassword: TMaskEdit;
    eConfirmation: TMaskEdit;
    eOldPassword: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure bOkClick(Sender: TObject);
  end;

//var
//  fChangePassword: TfChangePassword;

implementation

uses
  mORMoti18n;


{$R *.dfm}

procedure TCustomAuthChangePassword.FormShow(Sender: TObject);
begin
  Language.FormTranslateOne(self);

  if eUser.Text <> '' then
    ActiveControl := eOldPassword;
end;

procedure TCustomAuthChangePassword.bOkClick(Sender: TObject);
begin
  if eNewPassword.Text <> eConfirmation.Text then
  begin
    ShowMessage(sPasswordMismatch);
    ActiveControl := eNewPassword;
  end
  else
    ModalResult := mrOk;
end;

end.
