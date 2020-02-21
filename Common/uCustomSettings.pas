unit uCustomSettings;

interface

type
  TCustomSettings = class
  private
    FAutoUpdateProgramm: Boolean;
    FLastUserName: string;
    FLastProject: string;
    FSectionHome: string;
    FSectionMain: string;
    procedure SetAutoUpdateProgramm(const Value: Boolean);
    procedure SetLastProject(const Value: string);
    procedure SetLastUserName(const Value: string);
    function GetCurrentVersion: Integer;
  public
    constructor Create(aSection: string); virtual;
    destructor Destroy; override;

    procedure Save; virtual;
    procedure Load; virtual;
    procedure CheckCommandLine;

    property SectionHome: string read FSectionHome;
    property SectionMain: string read FSectionMain;

    // Обновление
    property AutoUpdateProgramm: Boolean read FAutoUpdateProgramm write SetAutoUpdateProgramm;

    property LastProject: string read FLastProject write SetLastProject;
    property LastUserName: string read FLastUserName write SetLastUserName;

    property CurrentVersion: Integer read GetCurrentVersion;
  end;

implementation

uses
  System.SysUtils,
  JvVersionInfo,
  uAppStorage,
  uCommandLine;

{ TCustomSettings }

procedure TCustomSettings.CheckCommandLine;
var
  aUserName: string;
  aProjectFileName: string;
begin
  // определяем имя файла проекта (может быть передано в командной строке)
  aProjectFileName := CommandLineStrings.Values[sCommandLineProject];

  if (aProjectFileName = '') and (CommandLineStrings.Count > 0) then
  begin
    // имя файла проекта может быть передано в первом параметре командной строки
    aProjectFileName := CommandLineStrings.Strings[0];
    if not FileExists(aProjectFileName) then
      aProjectFileName := '';
  end;

  if (aProjectFileName <> '') and FileExists(aProjectFileName) then
    LastProject := aProjectFileName;


  // имя пользователя также может быть передано в командной строке
  aUserName := CommandLineStrings.Values[sCommandLineUser];
  if aUserName <> '' then
    LastUserName := aUserName;
end;

constructor TCustomSettings.Create(aSection: string);
begin
  FSectionHome := aSection;
  FSectionMain := FSectionHome + '\Main';

  AppStorageKind := skRegistry;
  AppStorage(aSection);
end;

destructor TCustomSettings.Destroy;
begin

  inherited;
end;

function TCustomSettings.GetCurrentVersion: Integer;
var
  vi: TjvVersionInfo;
begin
  vi := TjvVersionInfo.Create(AppFileName);
  try
    Result := StrToInt(StringReplace(vi.ProductVersion, '.', '', [rfReplaceAll]))
  finally
    vi.Free;
  end;
end;

procedure TCustomSettings.Load;
begin
  LastProject := AppStorage.ReadString(SectionMain, 'LastProject', '');
  LastUserName := AppStorage.ReadString(SectionMain, 'LastUserName', '');
  AutoUpdateProgramm := AppStorage.ReadBool(SectionMain, 'AutoUpdateProgramm', True);
end;

procedure TCustomSettings.Save;
begin
  AppStorage.WriteString(SectionMain, 'LastProject', LastProject);
  AppStorage.WriteString(SectionMain, 'LastUserName', LastUserName);
  AppStorage.WriteBool(SectionMain, 'AutoUpdateProgramm', AutoUpdateProgramm);
end;

procedure TCustomSettings.SetAutoUpdateProgramm(const Value: Boolean);
begin
  FAutoUpdateProgramm := Value;
end;

procedure TCustomSettings.SetLastProject(const Value: string);
begin
  FLastProject := Value;
end;

procedure TCustomSettings.SetLastUserName(const Value: string);
begin
  FLastUserName := Value;
end;

end.
