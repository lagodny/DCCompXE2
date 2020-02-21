unit uCustomAuthDialog;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs, Messages;

resourcestring
  sPasswordHasChanged = 'Password has changed.';
  sFailedToChangePassword = 'Failed to change password';
  sChangePasswordError = 'Failed to change password: %s';

type
  TDoChangePassword = function(UserName, OldPassword, NewPassword: string): Boolean of object;

  TCustomAuthDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    lUser: TLabel;
    lPassword: TLabel;
    cbUserName: TComboBox;
    ePassword: TEdit;
    bChangePassword: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bChangePasswordMouseEnter(Sender: TObject);
    procedure bChangePasswordMouseLeave(Sender: TObject);
    procedure bChangePasswordClick(Sender: TObject);
  private
    FShowOnTaskBar: Boolean;
    FOnChangePassword: TDoChangePassword;
    function GetPassword: string;
    function GetUserName: string;
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMSyscommand(var Message: TWmSysCommand); message WM_SYSCOMMAND;
  public
    constructor CreateAndShowOnTaskBar(AOwner: TComponent);

    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;

    property OnChangePassword: TDoChangePassword read FOnChangePassword write FOnChangePassword;
  end;

var
  CustomAuthDialog: TCustomAuthDialog;

implementation

uses
  uCustomAuthChangePassword,
  mORMoti18n;

{$R *.dfm}


procedure TCustomAuthDialog.bChangePasswordClick(Sender: TObject);
var
  PasswordForm: TCustomAuthChangePassword;
begin
  if not Assigned(FOnChangePassword) then
    Exit;

  PasswordForm := TCustomAuthChangePassword.Create(nil);
  try
    PasswordForm.eUser.Text := cbUserName.Text;
    PasswordForm.eOldPassword.Text := ePassword.Text;
    if PasswordForm.ShowModal = mrOk then
    begin
      try
        if OnChangePassword(PasswordForm.eUser.Text, PasswordForm.eOldPassword.Text, PasswordForm.eNewPassword.Text) then
        begin
          ePassword.Text := PasswordForm.eNewPassword.Text;
          ShowMessage(sPasswordHasChanged);
        end
        else
          ShowMessage(sFailedToChangePassword);
      except
        on e: Exception do
          MessageDlg(
            Format(sChangePasswordError, [e.Message]),
            mtError, [mbOK], 0);
      end;
    end;
  finally
    PasswordForm.Free;
  end;
end;

procedure TCustomAuthDialog.bChangePasswordMouseEnter(Sender: TObject);
begin
  bChangePassword.Font.Color := clHighlight;
  bChangePassword.Font.Style := [fsUnderline];
end;

procedure TCustomAuthDialog.bChangePasswordMouseLeave(Sender: TObject);
begin
  bChangePassword.Font.Color := clGrayText;
  bChangePassword.Font.Style := [];
end;

constructor TCustomAuthDialog.CreateAndShowOnTaskBar(AOwner: TComponent);
begin
  FShowOnTaskBar := true;
  inherited Create(AOwner);
end;

procedure TCustomAuthDialog.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  // http://www.transl-gunsmoker.ru/2009/03/windows-vista-delphi-1.html
  // для каждой формы, для которой мы хотим иметь кнопку на панели задач
  // нам нужно переопределить CreateParams
  if FShowOnTaskBar then
    Params.ExStyle := Params.ExStyle and not WS_EX_TOOLWINDOW or WS_EX_APPWINDOW;
end;

procedure TCustomAuthDialog.FormShow(Sender: TObject);
begin
  Language.FormTranslateOne(self);

  if cbUserName.Text = '' then
    ActiveControl := cbUserName
  else
  begin
    ActiveControl := ePassword;
    ePassword.SelectAll;
  end;

  bChangePassword.Visible := Assigned(bChangePassword.OnClick);



  //Application.BringToFront;
  //SetForegroundWindow(Application.Handle);
end;

function TCustomAuthDialog.GetPassword: string;
begin
  Result := ePassword.Text;
end;

function TCustomAuthDialog.GetUserName: string;
begin
  Result := cbUserName.Text;
end;

procedure TCustomAuthDialog.SetPassword(const Value: string);
begin
  ePassword.Text := Value;
end;

procedure TCustomAuthDialog.SetUserName(const Value: string);
begin
  cbUserName.Text := Value;
end;

procedure TCustomAuthDialog.WMSyscommand(var Message: TWmSysCommand);
begin
  // http://www.transl-gunsmoker.ru/2009/03/windows-vista-delphi-1.html
  // для каждой формы, которая имеет кнопку в панели задач и может
  // минимизироваться, нам надо обрабатывать оконное сообщение WM_SYSCOMMAND
  case (Message.CmdType and $FFF0) of
    SC_MINIMIZE:
      begin
        ShowWindow(Handle, SW_MINIMIZE);
        Message.Result := 0;
      end;
    SC_RESTORE:
      begin
        ShowWindow(Handle, SW_RESTORE);
        Message.Result := 0;
      end;
  else
    inherited;
  end;
end;

end.

