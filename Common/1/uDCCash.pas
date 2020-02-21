unit uDCCash;

interface

type
  TaDCCash = class
  private
    FPath: string;
    FActive: boolean;
    procedure SetPath(const Value: string);
  public
    property Path: string read FPath write SetPath;
    property Active:boolean read FActive;
  end;

var
  OPCCash : TaDCCash;

implementation

uses
  Windows, ShlObj, SysUtils, ActiveX;

{ TaOPCCash }

function PidlToPath(IdList: PItemIdList): string;
begin
  SetLength(Result, MAX_PATH);
  if SHGetPathFromIdList(IdList, PChar(Result)) then
    SetLength(Result, StrLen(PChar(Result)))
  else
    Result := '';
end;

function PidlFree(var IdList: PItemIdList): Boolean;
var
  Malloc: IMalloc;
begin
  Result := False;
  if IdList = nil then
    Result := True
  else
  begin
    if Succeeded(SHGetMalloc(Malloc)) and (Malloc.DidAlloc(IdList) > 0) then
    begin
      Malloc.Free(IdList);
      IdList := nil;
      Result := True;
    end;
  end;
end;



function GetSpecialFolderLocation(const Folder: Integer): string;
var
  FolderPidl: PItemIdList;
begin
  if Succeeded(SHGetSpecialFolderLocation(0, Folder, FolderPidl)) then
  begin
    Result := PidlToPath(FolderPidl);
    PidlFree(FolderPidl);
  end
  else
    Result := '';
end;


procedure TaDCCash.SetPath(const Value: string);
begin
  FPath := Value;
  FActive := DirectoryExists(FPath);
end;

initialization
  OPCCash := TaDCCash.Create;
  //OPCCash.Path := GetSpecialFolderLocation(CSIDL_PERSONAL)+'\OPCCash';
  OPCCash.Path := GetSpecialFolderLocation(CSIDL_APPDATA)+'\OPCCash';
  if not DirectoryExists(OPCCash.Path) then
    CreateDir(OPCCash.Path);


finalization
  FreeAndNil(OPCCash);

end.
