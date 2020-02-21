unit uCustomMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ImgList, Vcl.StdActns, Vcl.AppEvnts,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  SpTBXItem, TB2Dock, TB2Toolbar, TB2Item, SpTBXMDIMRU, SpTBXTabs,
  llTaskBar,
  //CepStyleActnCtrls,
  mORMot, mORMoti18n, SynCommons,
  uBaseForm, uBaseFormInterface, Vcl.Touch.GestureMgr;

resourcestring
  sVer = 'Ver: %d';
  sNewVersionNotFound = 'New version not found';


type
  TCustomMainForm = class(TForm, IMainForm)
    RegistryStorage: TJvAppRegistryStorage;
    FormStorage: TJvFormStorage;
    ActionList1: TActionList;
    SpTBXDock1: TSpTBXDock;
    tbPanel: TSpTBXToolbar;
    WindowBar: TllTaskBar;
    StatusBar: TSpTBXStatusBar;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    tbiHint: TSpTBXLabelItem;
    ApplicationEvents1: TApplicationEvents;
    aUploadSetup: TAction;
    aDownloadSetup: TAction;
    iCurrentUser: TTBItem;
    SpTBXRightAlignSpacerItem1: TSpTBXRightAlignSpacerItem;
    MainMenu1: TMainMenu;
    miLanguage: TMenuItem;
    Windows1: TMenuItem;
    Cascade1: TMenuItem;
    mTileHorizontal: TMenuItem;
    mTileVertical: TMenuItem;
    mMinimizeAll: TMenuItem;
    smiHelp: TMenuItem;
    SpTBXRightAlignSpacerItem2: TSpTBXRightAlignSpacerItem;
    tbItemVer: TSpTBXLabelItem;
    aShowInstruction: TAction;
    aWindowCloseAll: TAction;
    N1: TMenuItem;
    CloseAll1: TMenuItem;
    GestureManager: TGestureManager;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure aUploadSetupExecute(Sender: TObject);
    procedure aDownloadSetupExecute(Sender: TObject);
    procedure aChecklNewVerExecute(Sender: TObject);
    procedure tbItemVerClick(Sender: TObject);
    procedure mVersionsHistoryClick(Sender: TObject);
    procedure aWindowCloseAllExecute(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // реализация IMainForm
    procedure InitChild(aObject: TObject);

    procedure SaveSettings; virtual;
    procedure LoadSettings; virtual;

    function CheckNewVer: Boolean; virtual;

    function Authorize: Boolean; virtual;
    function DoAuthentificationFailed(Retry: integer; var aUserName, aPassword: string; out aPasswordHashed: boolean): boolean; virtual;
    procedure DoSetUser(Sender: TSQLRestClientURI); virtual;

    function Init: Boolean; virtual;
    procedure InitLanguages; virtual;

    procedure UpdateUI; virtual;
  end;

//var
//  CustomMainForm: TCustomMainForm;

implementation

{$R *.dfm}

{.$define EXTRACTALLRESOURCES}
{.$define USEFORMCREATEHOOK}


uses
  JvVersionInfo, JclFileUtils,
  mORMotUILogin,

  uFormsManager,
  //uSettings, uProjectData, uCommonData, uResources, uKeys,
  uDCCommonProc
  //,uDCModel, uSCSModel
  //,uCustomAuthDialog
  ;



procedure TCustomMainForm.ApplicationEvents1Hint(Sender: TObject);
begin
  tbiHint.Caption := Application.Hint;
end;


procedure TCustomMainForm.aDownloadSetupExecute(Sender: TObject);
//var
//  aDCCnfgSetupID: Integer;
//  aSetupBlob: TSQLRawBlob;
begin
//  with TSaveDialog.Create(Self) do
//  begin
//    if Execute(Self.Handle) then
//    begin
//      if TryStrToInt(U2S(Settings.Client.OneFieldValue(TSQLDCStorage, 'RowID', 'Ident=?', [S2U(cDCCnfgSetup)])), aDCCnfgSetupID) then
//      begin
//        if Settings.Client.RetrieveBlob(TSQLDCStorage, aDCCnfgSetupID, 'Data', aSetupBlob) then
//          FileFromString(aSetupBlob, FileName);
//      end;
//    end;
//  end;
end;

procedure TCustomMainForm.aChecklNewVerExecute(Sender: TObject);
begin
  if not CheckNewVer then
    MessageDlg(sNewVersionNotFound,  mtInformation, [mbOK], 0);
end;

procedure TCustomMainForm.aUploadSetupExecute(Sender: TObject);
//var
//  aVerNo: string;
//  aData: TSQLDCStorage;
begin
//  with TOpenDialog.Create(Self) do
//  begin
//    if Execute(Self.Handle) then
//    begin
//      if FileExists(FileName) then
//      begin
//        aData := TSQLDCStorage.Create;
//        try
//          if not Settings.Client.Retrieve(FormatUTF8('Ident=?', [], [cDCCnfgSetup]), aData) then
//          begin
//            aData.Ident := cDCCnfgSetup;
//            aData.VerNo := 1;
//            //aData.IDValue :=
//            if Settings.Client.Add(aData, True) = 0 then
//            begin
//              ShowLastClientError(Settings.Client, 'Cannot create DCStorage rec for Ident = ' + cDCCnfgSetup);
//              Exit;
//            end;
//
//
//          end;
//
//          if not InputQuery(sVersionNo, IntToStr(aData.VerNo), aVerNo) then
//            Exit;
//
//          aData.VerNo := StrToInt(aVerNo);
//          aData.Data := StringFromFile(FileName);
//
//          Settings.Client.AddOrUpdate(aData);
//          Settings.Client.UpdateBlobFields(aData);
//
//        finally
//          aData.Free;
//        end;
//
//      end;
//    end;
//  end;
end;

function TCustomMainForm.Authorize: Boolean;
begin
  Result := False;


//  Settings.Client.OnAuthentificationFailed := nil;
//  AuthDialog := TAuthDialog.CreateAndShowOnTaskBar(nil);
//  try
//    Settings.Client.FillUsers(AuthDialog.cbUserName.Items);
//    AuthDialog.UserName := Settings.LastUserName;
//    AuthDialog.OnChangePassword := Settings.Client.ChangeUserPassword;
//
//    repeat
//      if AuthDialog.ShowModal <> mrOk then
//        Exit;
//
//      Result := Settings.Client.SetUser(S2U(AuthDialog.UserName), S2U(AuthDialog.Password));
//      if not Result then
//      begin
//        //ShowLastClientError(settings.Client, 'Authtorize error!')
//        //ShowMessage(Settings.Client.LastErrorMessage);
//
//        ShowLastClientError(Settings.Client, 'User name or password is invalid');
//        Settings.IsAuthorized := False;
//      end
//      else
//      begin
//        Settings.LastUserName := AuthDialog.UserName;
//        Settings.LastPassword := AuthDialog.Password;
//        Settings.IsAuthorized := True;
//
//        //Settings.Client.RegisterServices;
//      end;
//
//    until (Result);
//
//  finally
//    FreeAndNil(AuthDialog);
//    Settings.Client.OnAuthentificationFailed := DoAuthentificationFailed;
//  end;
end;

procedure TCustomMainForm.aWindowCloseAllExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
end;

function TCustomMainForm.CheckNewVer: Boolean;
var
  //aRowID: Integer;
  //aServerVer,
  aClientVer: Integer;
  vi: TjvVersionInfo;
  //aFileName: string;
//  aSetupBlob: TSQLRawBlob;
begin
  Result := False;

  // текущая версия программы
  vi := TjvVersionInfo.Create(AppFileName);
  try
    aClientVer := StrToInt(StringReplace(vi.ProductVersion, '.', '', [rfReplaceAll]));
    tbItemVer.Caption := Format(sVer, [aClientVer]);
  finally
    vi.Free;
  end;
//
//  // доступная версия на сервере
//  if not TryStrToInt(U2S(Settings.Client.OneFieldValue(TSQLDCStorage, 'VerNo', 'Ident=?', [cDCCnfgSetup])), aServerVer) then
//    Exit;
//
//
//  if aServerVer <= aClientVer then
//    Exit;
//
//  tbItemVer.FontSettings.Color := clBlue;
//  tbItemVer.Hint := Format(sNewVersionAvailable, [aServerVer]);
//  Result := True;
//
//  if MessageBox(
//    Application.Handle,
//    PChar(Format(sNewVersionAvailable, [aServerVer])),
//    PChar(Application.Title),
//    MB_YESNO + MB_ICONQUESTION) <> mrYes then
//    Exit;
//
//  // загружаем мастер установки с сервера
//  aFileName := PathGetTempPath + ExtractFileName(cDCCnfgSetup) + '.exe';
//
//  // получаем идентификатор записи в хранилище
//  if not TryStrToInt(U2S(Settings.Client.OneFieldValue(TSQLDCStorage, 'RowID', 'Ident=?', [cDCCnfgSetup])), aRowID) then
//    Exit;
//
//  // загружаем данные из блоба и сохраняем в файл
//  if Settings.Client.RetrieveBlob(TSQLDCStorage, aRowID, 'Data', aSetupBlob) then
//    FileFromString(aSetupBlob, aFileName);
//
//
//  // проверяем его наличие на диске и запускаем
//  if FileExists(aFileName) then
//  begin
//    ExecuteFile(aFileName, Format('/SILENT', []), ExtractFilePath(aFileName), SW_SHOWNORMAL);
////    ExecuteFile(aFileName, Format('/SILENT u=%s p=%s', [aUser, aPassword]), ExtractFilePath(aFileName), SW_SHOWNORMAL);
//
//    Application.Terminate;
//  end;
//
end;

constructor TCustomMainForm.Create(AOwner: TComponent);
begin
  inherited;

  TFormsManager.Instance(Self);
end;

destructor TCustomMainForm.Destroy;
begin
  // убиваем все формы
  while MDIChildCount > 0 do
    MDIChildren[0].Free;

  // 1. сохраняем настройки формы (интервал и пр.)
  SaveSettings;

  // 2. сохраняем общие настройки (проект, пользователь и пр.)
//  Settings.Save;

  inherited;
end;

function TCustomMainForm.DoAuthentificationFailed(Retry: integer; var aUserName, aPassword: string; out aPasswordHashed: boolean): boolean;
//var
//  saveAF: TOnAuthentificationFailed;
begin
  Result := False;
//  aPasswordHashed := False;

//  Settings.Client.OnAuthentificationFailed := nil;
//  try
//    // мы уже были авторизованы
//    if Settings.IsAuthorized then
//    begin
//      // проверяем существующие данные и уходим если все в порядке
//      if Settings.Client.SetUser(S2U(Settings.LastUserName), S2U(Settings.LastPassword)) then
//        Exit(True);
//    end;
//
//    // что-то пошло не так - нужен диалог
//    AuthDialog := TAuthDialog.CreateAndShowOnTaskBar(nil);
//    try
//      AuthDialog.UserName := Settings.LastUserName;
//      if AuthDialog.ShowModal <> mrOk then
//        Exit(False);
//
//      Settings.LastUserName := AuthDialog.UserName;
//      Settings.LastPassword := AuthDialog.Password;
//    finally
//      FreeAndNil(AuthDialog);
//    end;
//
//
//  finally
//    aUserName := Settings.LastUserName;
//    aPassword := Settings.LastPassword;
//
//    Settings.Client.OnAuthentificationFailed := DoAuthentificationFailed;
//  end;
//  Result := (Retry > 0); // and Authorize;
end;

//var
//  OnIdleProcessCursor: TCursor = crNone;
//
//class procedure TCustomMainForm.DoIdleProcess(Sender: TSynBackgroundThreadAbstract; ElapsedMS: Integer);
//begin
//  //Application.ProcessMessages;
//  if (ElapsedMS>OnIdleProcessCursorChangeTimeout) and (OnIdleProcessCursor=crNone) then begin
//    OnIdleProcessCursor := Screen.Cursor;
//    Screen.Cursor := crHourGlass;
//  end else
//  if (ElapsedMS<0) and (OnIdleProcessCursor<>crNone) then begin
//    Screen.Cursor := OnIdleProcessCursor;
//    OnIdleProcessCursor := crNone;
//  end;
//end;

procedure TCustomMainForm.DoSetUser(Sender: TSQLRestClientURI);
begin
//  Settings.Client.InitDCSessionUser;
//  if Settings.Client.DCSessionUser <> nil then
//  begin
//    iCurrentUser.Caption := U2S(Settings.Client.DCSessionUser.LogonName);
//    iCurrentUser.Hint := U2S(Settings.Client.DCSessionUser.DisplayName);
//  end
//  else
//  begin
//    iCurrentUser.Caption := 'Logon';
//    iCurrentUser.Hint := '';
//  end;

  UpdateUI;

end;

procedure TCustomMainForm.FormCreate(Sender: TObject);
begin
//  CommonData := TCommonData.Create(Self);
//
//  // параметры расположения форм будут храниться здесь
//  RegistryStorage.Root := TKeys.Forms;

{$ifdef EXTRACTALLRESOURCES}
  // нам не нужно что-то делать, если мы просто извлекаем ресурсы
  Exit;
{$endif}

  // инициализируемся
  if not Init then
  begin
    Application.ShowMainForm := False;
    Application.Terminate;
    Exit;
  end;

  // инициализируем доступные локализации
  InitLanguages;

  // проверяем наличие новой версии
  if not CheckNewVer then
    Exit;
end;

procedure TCustomMainForm.FormShow(Sender: TObject);
begin
  //Language.FormTranslateOne(self);
{$ifdef EXTRACTALLRESOURCES}
  ExtractAllResources(
    // first, all enumerations to be translated
    //[TypeInfo(TCuteEvent),TypeInfo(TCuteAction),TypeInfo(TPreviewAction)],
    [],
    // then some class instances (including the TSQLModel will handle all TSQLRecord)
    [Settings.Client.Model],
    // some custom classes or captions
    [],[]);
  ShowMessage('All resources have extracted!');
  Close;
{$else}
  //i18nLanguageToRegistry(lngRussian);
  //i18nLanguageToRegistry(lngFrench);
{$endif}
  Application.BringToFront;
  SetForegroundWindow(Application.Handle);
end;


function TCustomMainForm.Init: Boolean;
//var
//  aProject: string;
//  aProjects: TStrings;
//  i: Integer;
//  isOK: Boolean;
begin
  Result := True;

//  Result := False;

//  CommonData.ShowStatus('Подключение');
//  try
//    // проверяем командную строку на наличие информации о подключениях
//    Settings.CheckCommandLine;
//
//    if Settings.LastProject <> '' then
//      aProject := Settings.LastProject
//    else
//      aProject := ChangeFileExt(Application.ExeName, '.ini');
//
//    ProjectData.Load(aProject);
//    Settings.Load;
//
//    Settings.ServerHost := ProjectData.ServerHost;
//    Settings.ServerPort := ProjectData.ServerPort;
//    Settings.ServerHttps := ProjectData.ServerHttps;
//
//
//    Settings.Client.OnAuthentificationFailed := DoAuthentificationFailed;
//    Settings.Client.OnSetUser := DoSetUser;
//
//    // проверяем подключение к серверу
//    if not Settings.Client.ServerTimeStampSynchronize then
//    begin
//      isOK := False;
//
//      // альтернативные проекты
//      if ProjectData.AltProjects.Count > 0 then
//      begin
//        if MessageBox(Handle,
//          'Server is not available. Do you want to check connection to other servers?',
//          'Question', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
//          Exit;
//
//
//        aProjects := TStringList.Create;
//        try
//          aProjects.Assign(ProjectData.AltProjects);
//          for i := 0 to aProjects.Count - 1 do
//          begin
//            ProjectData.Load(aProjects.ValueFromIndex[i]);
//            Settings.ServerHost := ProjectData.ServerHost;
//            Settings.ServerPort := ProjectData.ServerPort;
//
//            if Settings.Client.ServerTimeStampSynchronize then
//            begin
//              isOK := True;
//              ProjectData.AltProjects := aProjects;
//              ProjectData.Save(aProject);
//              Break;
//            end;
//          end;
//        finally
//          aProjects.Free;
//        end;
//      end;
//
//      if not isOK then
//      begin
//        ShowMessage(sServerIsNotAvailable);
//        Exit;
//      end;
//    end;
//
//    Result := Authorize;
//  finally
//    CommonData.HideStatus;
//  end;
end;

procedure TCustomMainForm.InitChild(aObject: TObject);
var
  f: TBaseForm;
begin
  if not (aObject is TBaseForm) then
    Exit;

  f := TBaseForm(aObject);
  f.FormStorage.AppStorage := RegistryStorage;
  f.Touch.GestureManager := GestureManager;
end;

procedure TCustomMainForm.InitLanguages;
begin
  // инициализируем меню
  i18nAddLanguageMenu('', miLanguage);
end;

procedure TCustomMainForm.LoadSettings;
begin

end;


procedure TCustomMainForm.SaveSettings;
begin

end;

procedure TCustomMainForm.tbItemVerClick(Sender: TObject);
begin
  CheckNewVer;
end;

procedure TCustomMainForm.UpdateUI;
begin
//  if not Assigned(Settings.Client.DCSessionUser) then
//    Exit;

  // специальные
//  aOpenUsers.Visible := Settings.Client.GetTableRight(TSQLDCAuthUser, soUpdate);
//  aOpenUserGroups.Visible := Settings.Client.GetTableRight(TSQLDCAuthGroup, soUpdate);;

end;

procedure TCustomMainForm.mVersionsHistoryClick(Sender: TObject);
//var
//  aHistoryFileName: string;
begin
//  aHistoryFileName := ProjectData.AbsFileName('Version.txt');
//  if FileExists(aHistoryFileName) then
//    ExecuteFile(aHistoryFileName, '', ExtractFilePath(aHistoryFileName), SW_SHOWNORMAL);
end;

end.
