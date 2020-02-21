unit aOPCAuthorization;

interface

uses
  SysUtils, Classes, Windows, Forms, IniFiles,
  aOPCSource, aOPCLog;

const
  EncryptKey = 77;

type
  TAuthorizeResult = (arNone, arOK, arIgnore, arCancel);
  TOnAuthorizeExceptionAction = (aeaIgnore, aeaCancel, aeaRetry);
  TOnAuthorizeException = function(aException: Exception): TOnAuthorizeExceptionAction of object;

  TaOPCAuthorization = class(TComponent)
  private
    FUser: string;
    FPermissions: string;
    FOPCSource: TaOPCSource;
    FPassword: string;
    //FOnAuthorizeException: TOnAuthorizeException;
    procedure SetUser(const Value: string);
    procedure SetPermissions(const Value: string);
    procedure SetOPCSource(const Value: TaOPCSource);
    procedure SetPassword(const Value: string);
    function GetEncryptedPassword: string;
    procedure SetEncryptedPassword(const Value: string);

    function Encrypt(Value: string): string;
  protected
    FTimeStamp: TDateTime;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    property Permissions: string read FPermissions write SetPermissions;
    property EncryptedPassword: string read GetEncryptedPassword write SetEncryptedPassword;

    function Execute(aParent: TCustomForm = nil; aShowInTaskBar: boolean = false): boolean;
    function ExecuteEx(aParent: TCustomForm = nil; aShowInTaskBar: boolean = false): TAuthorizeResult;

    function CheckPermissions: boolean;
    procedure ReadCommandLine;
    procedure ReadCommandLineExt;
  published
    property OPCSource: TaOPCSource read FOPCSource write SetOPCSource;

    property User: string read FUser write SetUser;
    property Password: string read FPassword write SetPassword;
  end;

implementation

uses
  Controls, Dialogs, Password,
  Math,
  uOPCCash;

function TaOPCAuthorization.CheckPermissions: boolean;
begin
  Result := false;
  try
    Permissions := '';
    if User <> '' then
      Permissions := OPCSource.GetUserPermission(User, Password, '');
    Result := Permissions <> '';
  except
    on e: Exception do
      ;
  end;
end;

function TaOPCAuthorization.Encrypt(Value: string): string;
var
  i: integer;
begin
  Result := Value;
  for i := 1 to Length(Result) do
    Result[i] := Chr(Ord(Result[i]) xor ((i + EncryptKey) mod 255));
end;

function TaOPCAuthorization.Execute(aParent: TCustomForm; aShowInTaskBar: boolean): boolean;
var
  //i: integer;
  UserChoice: TUserChoice;
begin
  Result := False;

  if aShowInTaskBar then
    UserChoice := TUserChoice.CreateAndShowOnTaskBar(nil)
  else
    UserChoice := TUserChoice.Create(nil);

  try
    UserChoice.OPCSource := OPCSource;
      UserChoice.ComboBox1.Items.Text := OPCSource.GetUsers;

    UserChoice.ComboBox1.Text := User;

    while not Result do
    begin
      UserChoice.Edit1.Text := '';

      if Assigned(aParent) then
        UserChoice.PopupParent := aParent;

      if UserChoice.ShowModal = mrOk then
      begin
        try
          User := UserChoice.ComboBox1.Text;
          Password := UserChoice.Edit1.Text;
          Result := OPCSource.Login(User, Password);
          if not Result then
            MessageDlg(
              Format('У пользователя %s недостаточно прав для работы с системой!', [User]),
              mtError, [mbOK], 0);

        except
          on e: Exception do
            MessageDlg(e.Message, mtError, [mbOK], 0);
        end;
      end
      else
      begin
        Permissions := '';
        Break;
      end;
    end;
  finally
    UserChoice.Free;
  end;

end;

function TaOPCAuthorization.ExecuteEx(aParent: TCustomForm; aShowInTaskBar: boolean): TAuthorizeResult;
var
  //i: integer;
  UserChoice: TUserChoice;
begin
  Result := arNone;

  if aShowInTaskBar then
    UserChoice := TUserChoice.CreateAndShowOnTaskBar(nil)
  else
    UserChoice := TUserChoice.Create(nil);

  try
    UserChoice.OPCSource := OPCSource;
    UserChoice.ComboBox1.Items.Text := OPCSource.GetUsers;

    UserChoice.ComboBox1.Text := User;

    repeat
      UserChoice.Edit1.Text := '';

      if Assigned(aParent) then
        UserChoice.PopupParent := aParent;

      if UserChoice.ShowModal = mrOk then
      begin
        try
          User := UserChoice.ComboBox1.Text;
          Password := UserChoice.Edit1.Text;

          if OPCSource.Login(User, Password) then
            // все в порядке - уходим
            Result := arOK
          else
            raise Exception.CreateFmt('У пользователя %s недостаточно прав для работы с системой!', [User]);

        except
          on e: Exception do
          begin
            // не удалось авторизоваться: спросим у пользователя, что будем делать?
            case MessageDlg(e.Message, mtError, mbAbortRetryIgnore, 0) of
              mrAbort: Result := arCancel;
              mrRetry: Result := arNone;
              mrIgnore: Result := arIgnore;
            end;

            //  MessageDlg(e.Message, mtError, [mbOK], 0);
          end;
        end;
      end

      else
      begin
        Permissions := '';
        Result := arCancel;
        //break;
      end;

    // будем повторять, пока результать неопределен
    until (Result <> arNone)

  finally
    UserChoice.Free;
  end;

end;

function TaOPCAuthorization.GetEncryptedPassword: string;
begin
  Result := Encrypt(Password);
end;


procedure TaOPCAuthorization.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FOPCSource) then
    FOPCSource := nil;
end;

// чтение параметров коммандной строки /uUser /pPassword
procedure TaOPCAuthorization.ReadCommandLine;
var
  i: integer;
  ch: string;
begin
  for i := 0 to ParamCount do
  begin
    ch := copy(LowerCase(ParamStr(i)), 1, 2);
    if ch = '-u' then
      User := Copy(ParamStr(i), 3, length(ParamStr(i)))
    else if ch = '-p' then
      Password := Copy(ParamStr(i), 3, length(ParamStr(i)));
  end;
end;

procedure TaOPCAuthorization.ReadCommandLineExt;
var
  i: Integer;
  s: TStringList;
  ch: string;
begin

  s := TStringList.Create;
  try
    for i := 1 to ParamCount do
      s.Add(ParamStr(i));

    // отработаем старый вариант
    // -u<user> -p<password>
    for i := 0 to s.Count - 1 do
    begin
      ch := LowerCase(Copy(s[i], 1, 2));

      if (ch = '-u') or (ch = '/u') or (ch = '\u') then
        User := Copy(s[i], 3, length(s[i]))
      else if (ch = '-p') or (ch = '/p') or (ch = '\p') then
        Password := Copy(s[i], 3, length(s[i]))
    end;

    // отработаем новый вариант
    // user=<user>   password=<password>  u=<user>  p=<password>

    // имя пользователя
    if s.Values['user'] <> '' then
      User := s.Values['user']
    else if s.Values['u'] <> '' then
      User := s.Values['u'];

    // пароль
    if s.Values['password'] <> '' then
      Password := s.Values['password']
    else if s.Values['p'] <> '' then
      Password := s.Values['p'];
  finally
    s.Free;
  end;

end;

procedure TaOPCAuthorization.SetEncryptedPassword(const Value: string);
begin
  Password := Encrypt(Value);
end;

procedure TaOPCAuthorization.SetOPCSource(const Value: TaOPCSource);
begin
  FOPCSource := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
end;

procedure TaOPCAuthorization.SetPassword(const Value: string);
begin
  FPassword := Value;
  if FOPCSource <> nil then
    FOPCSource.Password := Value;
end;

procedure TaOPCAuthorization.SetPermissions(const Value: string);
begin
  FPermissions := Value;
end;

procedure TaOPCAuthorization.SetUser(const Value: string);
begin
  FUser := Value;
  if FOPCSource <> nil then
    FOPCSource.User := Value;
end;

end.

