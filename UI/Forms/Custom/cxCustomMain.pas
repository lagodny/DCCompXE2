unit cxCustomMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList,
  Vcl.ImgList, Vcl.StdActns, Vcl.AppEvnts, Vcl.Touch.GestureMgr,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppRegistryStorage,
  //SpTBXItem, TB2Dock, TB2Toolbar, TB2Item, SpTBXMDIMRU, SpTBXTabs,
  //llTaskBar,
  //CepStyleActnCtrls,
  mORMot, mORMoti18n, SynCommons,
  uBaseForm, uBaseFormInterface,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar,
  dxBarExtItems, dxBar, cxClasses,
  dxBarBuiltInMenu, dxTabbedMDI,
  dxRibbonForm, dxSkinsForm,
  dxSkinsCore, dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter, cxPC,
  dxSkinscxPCPainter;

resourcestring
  sVer = 'Ver: %d';
  sNewVersionNotFound = 'New version not found';

type
  //TcxCustomMainForm = class(TForm, IMainForm)
  TcxCustomMainForm = class(TdxRibbonForm, IMainForm)
    RegistryStorage: TJvAppRegistryStorage;
    FormStorage: TJvFormStorage;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    ApplicationEvents1: TApplicationEvents;
    aUploadSetup: TAction;
    aDownloadSetup: TAction;
    aShowInstruction: TAction;
    aWindowCloseAll: TAction;
    GestureManager: TGestureManager;
    dxStatusBar1: TdxStatusBar;
    dxBarManager1: TdxBarManager;
    dxbMain: TdxBar;
    siLanguage: TdxBarSubItem;
    siHelp: TdxBarSubItem;
    biVer: TdxBarStatic;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    dxSkinController1: TdxSkinController;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure aUploadSetupExecute(Sender: TObject);
    procedure aDownloadSetupExecute(Sender: TObject);
    procedure aChecklNewVerExecute(Sender: TObject);
    procedure tbItemVerClick(Sender: TObject);
    procedure mVersionsHistoryClick(Sender: TObject);
    procedure aWindowCloseAllExecute(Sender: TObject);
  private
    procedure LanguageClick(Sender: TObject);
    procedure MakeLanguageMenu(const MsgPath: TFileName; Menu: TdxBarSubItem);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // ���������� IMainForm
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

implementation

{$R *.dfm}

{.$define EXTRACTALLRESOURCES}
{.$define USEFORMCREATEHOOK}

uses
  JvVersionInfo, JclFileUtils, mORMotUILogin, uFormsManager,
  //uSettings, uProjectData, uCommonData, uResources, uKeys,
  uDCCommonProc
  //,uDCModel, uSCSModel
  //,uCustomAuthDialog
;

//procedure i18nAddLanguageMenu(const MsgPath: TFileName; Menu: TdxBarSubItem);
//var i, index: integer;
//    MenuItem: TdxBarButton;
//    List: TStringList;
//begin
//  List := TStringList.Create;
//  try
//    index := i18nAddLanguageItems(MsgPath,List);
//    for i := 0 to List.Count-1 do begin
//      MenuItem := TdxBarButton.Create(Menu); //(Menu.Owner);
//      MenuItem.ButtonStyle := bsChecked;
//      MenuItem.Caption := List[i];
//      MenuItem.Tag := PtrInt(List.Objects[i]);
//      MenuItem.GroupIndex := 1;
//      //MenuItem.OnClick := Language.LanguageClick;
//      if i=index then
//        MenuItem.Down := True; // mark current language selection
//      Menu.ItemLinks.Add(MenuItem);
//    end;
//  finally
//    List.Free;
//  end;
//  if Menu.ItemLinks.Count > 0 then
//    Menu.Visible := ivAlways
//  else
//    Menu.Visible := ivNever;
//end;

procedure TcxCustomMainForm.ApplicationEvents1Hint(Sender: TObject);
begin
  //tbiHint.Caption
  dxStatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TcxCustomMainForm.aDownloadSetupExecute(Sender: TObject);
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

procedure TcxCustomMainForm.aChecklNewVerExecute(Sender: TObject);
begin
  if not CheckNewVer then
    MessageDlg(sNewVersionNotFound, mtInformation, [mbOK], 0);
end;

procedure TcxCustomMainForm.aUploadSetupExecute(Sender: TObject);
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

function TcxCustomMainForm.Authorize: Boolean;
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

procedure TcxCustomMainForm.aWindowCloseAllExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
end;

function TcxCustomMainForm.CheckNewVer: Boolean;
var
  //aRowID: Integer;
  //aServerVer,
  aClientVer: Integer;
  vi: TjvVersionInfo;
  //aFileName: string;
//  aSetupBlob: TSQLRawBlob;
begin
  Result := False;

  // ������� ������ ���������
  vi := TjvVersionInfo.Create(AppFileName);
  try
    aClientVer := StrToInt(StringReplace(vi.ProductVersion, '.', '', [rfReplaceAll]));
    biVer.Caption := Format(sVer, [aClientVer]);
  finally
    vi.Free;
  end;
//
//  // ��������� ������ �� �������
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
//  // ��������� ������ ��������� � �������
//  aFileName := PathGetTempPath + ExtractFileName(cDCCnfgSetup) + '.exe';
//
//  // �������� ������������� ������ � ���������
//  if not TryStrToInt(U2S(Settings.Client.OneFieldValue(TSQLDCStorage, 'RowID', 'Ident=?', [cDCCnfgSetup])), aRowID) then
//    Exit;
//
//  // ��������� ������ �� ����� � ��������� � ����
//  if Settings.Client.RetrieveBlob(TSQLDCStorage, aRowID, 'Data', aSetupBlob) then
//    FileFromString(aSetupBlob, aFileName);
//
//
//  // ��������� ��� ������� �� ����� � ���������
//  if FileExists(aFileName) then
//  begin
//    ExecuteFile(aFileName, Format('/SILENT', []), ExtractFilePath(aFileName), SW_SHOWNORMAL);
////    ExecuteFile(aFileName, Format('/SILENT u=%s p=%s', [aUser, aPassword]), ExtractFilePath(aFileName), SW_SHOWNORMAL);
//
//    Application.Terminate;
//  end;
//
end;

constructor TcxCustomMainForm.Create(AOwner: TComponent);
begin
  inherited;
  TFormsManager.Instance(Self);
end;

destructor TcxCustomMainForm.Destroy;
begin
  // ������� ��� �����
  while MDIChildCount > 0 do
    MDIChildren[0].Free;

  // 1. ��������� ��������� ����� (�������� � ��.)
  SaveSettings;

  // 2. ��������� ����� ��������� (������, ������������ � ��.)
//  Settings.Save;

  inherited;
end;

function TcxCustomMainForm.DoAuthentificationFailed(Retry: integer; var aUserName, aPassword: string; out aPasswordHashed: boolean): boolean;
//var
//  saveAF: TOnAuthentificationFailed;
begin
  Result := False;
//  aPasswordHashed := False;

//  Settings.Client.OnAuthentificationFailed := nil;
//  try
//    // �� ��� ���� ������������
//    if Settings.IsAuthorized then
//    begin
//      // ��������� ������������ ������ � ������ ���� ��� � �������
//      if Settings.Client.SetUser(S2U(Settings.LastUserName), S2U(Settings.LastPassword)) then
//        Exit(True);
//    end;
//
//    // ���-�� ����� �� ��� - ����� ������
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
//class procedure TcxCustomMainForm.DoIdleProcess(Sender: TSynBackgroundThreadAbstract; ElapsedMS: Integer);
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

procedure TcxCustomMainForm.DoSetUser(Sender: TSQLRestClientURI);
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

procedure TcxCustomMainForm.FormCreate(Sender: TObject);
begin
//  CommonData := TCommonData.Create(Self);
//
//  // ��������� ������������ ���� ����� ��������� �����
//  RegistryStorage.Root := TKeys.Forms;

{$ifdef EXTRACTALLRESOURCES}
  // ��� �� ����� ���-�� ������, ���� �� ������ ��������� �������
  Exit;
{$endif}

//  DisableAero := True;
{.$IFDEF EXPRESSSKINS}
  TdxSkinController.Create(Self);
{.$ENDIF}


  // ��������� ���������
  LoadSettings;

  // ����������������
  if not Init then
  begin
    Application.ShowMainForm := False;
    Application.Terminate;
    Exit;
  end;

  // �������������� ��������� �����������
  InitLanguages;

  // ��������� ������� ����� ������
  if not CheckNewVer then
    Exit;
end;

function TcxCustomMainForm.Init: Boolean;
//var
//  aProject: string;
//  aProjects: TStrings;
//  i: Integer;
//  isOK: Boolean;
begin
  Result := True;

//  Result := False;

//  CommonData.ShowStatus('�����������');
//  try
//    // ��������� ��������� ������ �� ������� ���������� � ������������
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
//    // ��������� ����������� � �������
//    if not Settings.Client.ServerTimeStampSynchronize then
//    begin
//      isOK := False;
//
//      // �������������� �������
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

procedure TcxCustomMainForm.InitChild(aObject: TObject);
var
  f: TBaseForm;
begin
  if not (aObject is TBaseForm) then
    Exit;

  f := TBaseForm(aObject);
  f.FormStorage.AppStorage := RegistryStorage;
  f.SetUserShowHint(ShowHint);
  //f.Touch.GestureManager := GestureManager;
end;

procedure TcxCustomMainForm.InitLanguages;
begin
  // �������������� ����
  MakeLanguageMenu('', siLanguage);
end;

procedure TcxCustomMainForm.LoadSettings;
begin

end;

procedure TcxCustomMainForm.LanguageClick(Sender: TObject);
// called with MenuItem.Tag = language ID
var
  LangIndex: TLanguages;
begin
  if Sender.InheritsFrom(TdxBarButton) then
    LangIndex := TLanguages(TdxBarButton(Sender).Tag)
  else
    Exit;

  if (LangIndex = LANGUAGE_NONE) or (LangIndex = CurrentLanguage.Index) then
    exit;

  // Registry Values for i18n unit
  MessageBox(Application.Handle, pointer(i18nLanguageToRegistry(LangIndex)), nil, MB_OK or MB_ICONINFORMATION);
end;

procedure TcxCustomMainForm.MakeLanguageMenu(const MsgPath: TFileName; Menu: TdxBarSubItem);
var
  i, index: integer;
  MenuItem: TdxBarButton;
  List: TStringList;
begin
  List := TStringList.Create;
  try
    index := i18nAddLanguageItems(MsgPath, List);
    for i := 0 to List.Count - 1 do
    begin
      MenuItem := TdxBarButton.Create(Menu); //(Menu.Owner);
      MenuItem.ButtonStyle := bsChecked;
      MenuItem.Caption := List[i];
      MenuItem.Tag := PtrInt(List.Objects[i]);
      MenuItem.GroupIndex := 1;
      MenuItem.OnClick := LanguageClick;
      if i = index then
        MenuItem.Down := True; // mark current language selection
      Menu.ItemLinks.Add(MenuItem);
    end;
  finally
    List.Free;
  end;
  if Menu.ItemLinks.Count > 0 then
    Menu.Visible := ivAlways
  else
    Menu.Visible := ivNever;
end;

procedure TcxCustomMainForm.SaveSettings;
begin

end;

procedure TcxCustomMainForm.tbItemVerClick(Sender: TObject);
begin
  CheckNewVer;
end;

procedure TcxCustomMainForm.UpdateUI;
begin
//  if not Assigned(Settings.Client.DCSessionUser) then
//    Exit;

  // �����������
//  aOpenUsers.Visible := Settings.Client.GetTableRight(TSQLDCAuthUser, soUpdate);
//  aOpenUserGroups.Visible := Settings.Client.GetTableRight(TSQLDCAuthGroup, soUpdate);;

end;

procedure TcxCustomMainForm.mVersionsHistoryClick(Sender: TObject);
//var
//  aHistoryFileName: string;
begin
//  aHistoryFileName := ProjectData.AbsFileName('Version.txt');
//  if FileExists(aHistoryFileName) then
//    ExecuteFile(aHistoryFileName, '', ExtractFilePath(aHistoryFileName), SW_SHOWNORMAL);
end;

end.

