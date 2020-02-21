{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2011 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}
{$I OPC.INC}

unit uOPCMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, aOPCProvider, aOPCCinema, aOPCAuthorization,
  ExtCtrls,Registry, ActnList, Menus, ComCtrls,
  aCustomOPCSource, aOPCSource, aOPCTCPSource,aOPCLookupList,
  About,
  WinHelpViewer, StdActns, aCustomOPCTCPSource, aOPCTCPSource_V30;


type
  TfmOPCMainForm = class(TForm)
    aOPCSource: TaOPCTCPSource_V30;
    aOPCAuthorization: TaOPCAuthorization;
    MainMenu: TMainMenu;
    ActionList: TActionList;
    aPrint: TAction;
    mPrint: TMenuItem;
    StatusBar: TStatusBar;
    PrintDialog1: TPrintDialog;
    aAbout: TAction;
    mAbout: TMenuItem;
    mAboutProgramm: TMenuItem;
    HelpContents1: THelpContents;
    N9: TMenuItem;
    procedure aOPCSourceRequest(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aPrintExecute(Sender: TObject);
    procedure aOPCSourceActivate(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure aOPCSourceError(Sender: TObject; MessageStr: string);
  private
    FSavedStatus: string;
    FRestartApp: string;
    FCurrentMoment: TDateTime;
    FOnChangeStatus: TNotifyEvent;
    procedure SetStatus(const Value: string);
    function GetStatus: string;
    function GetCurrentMoment: TDateTime;
    procedure SetCurrentMoment(const Value: TDateTime);
    procedure SetError(const Value: string);
    function GetAllowClick: boolean;
    procedure SetAllowClick(const Value: boolean);
  protected
    FDesignFormCaption: string;

    DevelopInfo: TDevelopInfo;

    Scale:integer;
    OldScale:integer;

    function GetVersion:string;virtual;
    function GetFormCaption:string;virtual;
    function GetIniFileName:TFileName;virtual;
    function GetRegistryKey:string;virtual;
    procedure LoadSettings;virtual;
    procedure SaveSettings;virtual;
    procedure LoadLookups;virtual;
    procedure CustomLoadSettings;virtual;
    procedure CustomSaveSettings;virtual;
  public
    property OnChangeStatus:TNotifyEvent read FOnChangeStatus
      write FOnChangeStatus;
    property Status:string read GetStatus write SetStatus;
    property CurrentMoment : TDateTime read GetCurrentMoment
      write SetCurrentMoment;
    property Error:string write SetError;
    property AllowClick:boolean read GetAllowClick
      write SetAllowClick;
  end;

var
  fmOPCMainForm: TfmOPCMainForm;

implementation

uses
  uOPCFrame,
  IniFiles,
  {$IFDEF JVCL30} 
    jvVersionInfo,
  {$ENDIF} 
  {$IFDEF JVCL20}   
    jvVerInf,	 
  {$ENDIF}
  uCinemaControlForm,
  uOPCCash,
  uAppStorage;

{$R *.dfm}

{ TfmOPCMainForm }

procedure TfmOPCMainForm.LoadSettings;
var
  Registry:TRegistry;
  IniFile:TIniFile;
begin
  IniFile := TIniFile.Create(GetIniFileName);
  try
    with IniFile do
    begin
      FRestartApp:= ReadString('Common','RestartApp','Restart.exe');
      aOPCSource.RemoteMachine:= ReadString('Common','RemoteMashine',aOPCSource.RemoteMachine);
      aOPCSource.Port:= ReadInteger('Common','Port',aOPCSource.Port);
      aOPCSource.TimeOut:= ReadInteger('Common','TimeOut',aOPCSource.TimeOut);
      aOPCSource.Interval:= ReadInteger('Common','Interval',aOPCSource.Interval);
      aOPCSource.PacketUpdate := ReadBool('Common','PacketUpdate',false);
    end;
  finally
    IniFile.Free;
  end;

  Scale := 100;

  aOPCAuthorization.User :=
    AppStorage(GetRegistryKey).ReadString('Connection','User','');
  SetBounds(
    AppStorage.ReadInteger('Position','Left',Left),
    AppStorage.ReadInteger('Position','Top',Top),
    AppStorage.ReadInteger('Position','Width',Width),
    AppStorage.ReadInteger('Position','Height',Height)
    );
  WindowState := TWindowState(
    AppStorage.ReadInteger('Position','WindowState',Ord(WindowState)));

  try
    CustomLoadSettings;
  except
  end;

end;

procedure TfmOPCMainForm.FormCreate(Sender: TObject);
var
  CustomIniFile:TRegistryIniFile;
begin
  FDesignFormCaption := Caption;
  aOPCSource.Description := GetFormCaption;
  //OPCCash.Path := ExtractFileDir(Application.ExeName)+'\Cash\';

  with DevelopInfo do
  begin
    ApplicationName := FDesignFormCaption;
    Version := GetVersion;
    Company := '';
    Department := '';
    Developers := 'Alex A. Lagodny';
    WebSite := '';
    MailTo := 'a.lagodny@gmail.com';
    Title := '';
  end;

  LoadSettings;
  try
    aOPCAuthorization.ReadCommandLine;
    if not aOPCAuthorization.CheckPermissions then
    begin
//      CustomIniFile := TRegistryIniFile.Create(GetRegistryKey);
//      try
//        aOPCAuthorization.CheckForNewUsers(CustomIniFile);
//      finally
//        FreeAndNil(CustomIniFile);
//      end;

      if not aOPCAuthorization.Execute then
      begin
        aOPCSource.Connected := false;
        Application.Terminate;
        Application.ShowMainForm:=false;
        abort;
      end;
    end;
  except
    on e:Exception do
    begin
      Error := e.Message;
    end;
  end;
  LoadLookups;

  Caption := GetFormCaption;
  Application.Title := Caption;
  Application.HelpFile := ChangeFileExt(Application.ExeName,'.hlp');

  BringToFront;
end;

function TfmOPCMainForm.GetVersion: string;
var
  vi:TjvVersionInfo;
begin
  Result := '';
  vi:=TjvVersionInfo.Create(AppFileName);
  try
    Result := vi.FileVersion;
  finally
    vi.Free;
  end;
end;

function TfmOPCMainForm.GetIniFileName: TFileName;
begin
  Result := ChangeFileExt(Application.ExeName,'.ini');
end;

function TfmOPCMainForm.GetRegistryKey: string;
var
  fn:string;
begin
  fn := ExtractFileName(Application.ExeName);
  fn := ChangeFileExt(fn,'');
  Result := '\Software\Monitoring\'+fn;
end;

function TfmOPCMainForm.GetFormCaption: string;
begin
  Result := Format('%s %s %s',[FDesignFormCaption,
    GetVersion,aOPCSource.User]);
end;

procedure TfmOPCMainForm.SaveSettings;
begin
  try
    AppStorage.WriteString('Connection','User',aOPCAuthorization.User);

    AppStorage.WriteInteger('Position','Left',Left);
    AppStorage.WriteInteger('Position','Top', Top);
    AppStorage.WriteInteger('Position','Width', Width);
    AppStorage.WriteInteger('Position','Height',Height);

    AppStorage.WriteInteger('Position','WindowState',ord(WindowState));
    CustomSaveSettings;
  except
  end;
end;

procedure TfmOPCMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aOPCSource.Connected := false;
  SaveSettings;
end;

procedure TfmOPCMainForm.SetStatus(const Value: string);
begin
  StatusBar.Panels[0].Text := Value;
  if Assigned(FOnChangeStatus) then
    FOnChangeStatus(Self);
end;

function TfmOPCMainForm.GetStatus: string;
begin
  Result := StatusBar.Panels[0].Text;
end;

function TfmOPCMainForm.GetCurrentMoment: TDateTime;
begin
  Result := FCurrentMoment;
end;

procedure TfmOPCMainForm.SetCurrentMoment(const Value: TDateTime);
begin
  FCurrentMoment := Value;
  StatusBar.Panels[1].Text := DateTimeToStr(FCurrentMoment);
end;

procedure TfmOPCMainForm.aPrintExecute(Sender: TObject);
begin
  if PrintDialog1.Execute then
    Print;
end;

procedure TfmOPCMainForm.SetError(const Value: string);
begin
  StatusBar.Panels[2].Text := Value;
end;

procedure TfmOPCMainForm.aOPCSourceActivate(Sender: TObject);
begin
  Error := '';
end;

procedure TfmOPCMainForm.aOPCSourceError(Sender: TObject; MessageStr: string);
begin
  Error := MessageStr;
end;

procedure TfmOPCMainForm.CustomLoadSettings;
begin

end;

procedure TfmOPCMainForm.CustomSaveSettings;
begin

end;

function TfmOPCMainForm.GetAllowClick: boolean;
begin
end;

procedure TfmOPCMainForm.SetAllowClick(const Value: boolean);
begin
end;

procedure TfmOPCMainForm.aAboutExecute(Sender: TObject);
begin
{  ShowMessage(FDesignFormCaption+' '+
    GetVersion+#13#10+
    aOPCSource.User+#13#10+
    #13#10+
    'ООО Сандора'+#13#10+
    'Отдел ИТ'+#13#10+
    'Лагодный А.А');
}
{
  with TAboutForm.Create(self) do
  begin
    try
      ApplicationName.Caption := FDesignFormCaption;
      Version.Caption := GetVersion;
      User.Caption := aOPCAuthorization.User;
      ShowModal;
    finally
      Free;
    end;
  end;
}
  ShowAbout(DevelopInfo, aOPCAuthorization.User);

end;

procedure TfmOPCMainForm.aOPCSourceRequest(Sender: TObject);
begin
  CurrentMoment := Now;
end;

procedure TfmOPCMainForm.LoadLookups;
var
  i:integer;
  Lookup:TaOPCLookupList;
  CustomIniFile:TCustomIniFile;
begin
  CustomIniFile := TRegistryIniFile.Create(GetRegistryKey);
  try
    for i:=0 to ComponentCount-1 do
    begin
      if Components[i] is TaOPCLookupList then
      begin
        Lookup := TaOPCLookupList(Components[i]);
        if Assigned(Lookup.OPCSource) then
          Lookup.CheckForNewLookup(CustomIniFile);
      end;
    end;
  finally
    FreeAndNil(CustomIniFile);
  end;
end;

end.
