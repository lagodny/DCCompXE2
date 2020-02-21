unit uDCLang;

{$R Res\English.RES}
{$R Res\Russion.RES}


interface

uses
  Windows;

const
  // кнопки диалоговых окон
  idxButton_OK = 7100;
  idxButton_Cancel = 7101;
  idxButton_Help = 7102;

  idxStream_NotCreated = 7001;
  idxTCPCommand_OperationCanceledByUser = 8001;

  // состояние подключения
  idxConnection_Authorization = 9001;
  idxConnection_LoadNameSpace = 9002;
  idxConnection_LoadLookups = 9003;

  // окно авторизации
  idxAuthorizeDlg_Caption = 9010;
  idxAuthorizeDlg_User = 9011;
  idxAuthorizeDlg_Password = 9012;
  idxAuthorizeDlg_ChangePassword = 9013;

  // окно смены пароля
  idxChangePasswordDlg_Caption = 9020;
  idxChangePasswordDlg_User = 9021;
  idxChangePasswordDlg_OldPassword = 9022;
  idxChangePasswordDlg_NewPassword = 9023;
  idxChangePasswordDlg_Confirmation = 9024;

  idxChangePasswordMsg_PasswordNotSame = 9030;
  idxChangePasswordMsg_PasswordChangedSuccessfuly = 9031;
  idxChangePasswordMsg_UnableChangePassword = 9032;

  // OPC Interval
  idxInterval_skToday = 9100;
  idxInterval_skYesterday = 9101;
  idxInterval_skWeek = 9102;
  idxInterval_skLastWeek = 9103;
  idxInterval_skMonth = 9104;
  idxInterval_skLastMonth = 9105;
  idxInterval_skTomorrow = 9106;
  idxInterval_skNextWeek = 9107;
  idxInterval_skNext12Hours = 9108;
  idxInterval_skNextDay = 9109;

  idxInterval_LastHours = 9110;
  idxInterval_LastDays = 9111;

  idxInterval_skYear = 9112;
  idxInterval_skLastYear = 9113;

  idxInterval_tsuHour = 9120;
  idxInterval_tsuDay = 9121;

  // OPC Interval Frame
  idxIntervalFrame_ForLast = 9150;
  idxIntervalFrame_ForDay = 9151;
  idxIntervalFrame_ForMonth = 9152;
  idxIntervalFrame_ForPeriod = 9153;

  idxIntervalFrame_Date1From = 9160;
  idxIntervalFrame_Date2To = 9161;

  idxIntervalFrame_gbInterval = 9162;

  idxIntervalForm_Caption = 9180;

  idxUpdate_Available = 10000;
  idxUpdate_NoUpdateAvailable = 10001;
  idxUpdate_UnableDownloadNewVersion = 10002;
  idxUpdate_SetupSuccesfullyLoaded = 10003;
  idxUpdate_SetupDownloading = 10004;



type
  TUserLanguage = (
    langRU = LANG_RUSSIAN,
    langEN = LANG_ENGLISH,
    langUnknown = LANG_NEUTRAL);

function StrToLanguage(str: string; aDef: TUserLanguage = langRU): TUserLanguage;
function LanguageToStr(aLanguage: TUserLanguage): string;

function GetStringRes(idx: DWORD; wLang: Word): WideString;


implementation

uses
//  Windows,
  SysUtils;

function StrToLanguage(str: string; aDef: TUserLanguage = langRU): TUserLanguage;
var
  aSTR: string;
begin
  aSTR := UpperCase(str);
  if aSTR = 'EN' then
    Result := langEN
  else if aSTR = 'RU' then
    Result := langRU
  else
    Result := aDef;
end;

function LanguageToStr(aLanguage: TUserLanguage): string;
begin
  case aLanguage of
    langRU: Result := 'RU';
    langEN: Result := 'EN';
    langUnknown: Result := '??';
  end;
end;

function GetStringRes(idx: DWORD; wLang: Word): WideString;
var
  hFindRes: Cardinal;
  hLoadRes: Cardinal;
  nBlockID, nItemID: DWORD;
  pRes: Pointer;
  i, j: Integer;
  dwSize: Cardinal;
  nLen: Integer;
  iStr: Cardinal;
const
  NO_OF_STRINGS_PER_BLOCK = 16;
begin
  Result := EmptyStr;
  nBlockID := (idx shr 4) + 1;
  nItemID := 16 - (nBlockID shl 4 - idx);
  hFindRes := FindResourceEx(HInstance, RT_STRING, MAKEINTRESOURCEW(nBlockID), wLang);
  if hFindRes = 0 then Exit;
  hLoadRes := LoadResource(HInstance, hFindRes);
  if hLoadRes = 0 then Exit;
  pRes := LockResource(hLoadRes);
  if pRes = nil then Exit;
  dwSize := SizeofResource(HInstance, hFindRes);
  if dwSize = 0 then Exit;
  iStr := 0;
  for i := 0 to NO_OF_STRINGS_PER_BLOCK - 1 do
  begin
    nLen := PWord(pRes)^;
    Inc(DWord(pRes), 2);
    if pRes = nil then
      Exit;
    if iStr = nItemID then
    begin
      SetLength(Result, nLen);
      for j := 1 to nLen do
      begin
        Result[j] := PWideChar(pRes)^;
        Inc(DWord(pRes), 2);
      end;
      UnlockResource(hLoadRes);
      Exit;
    end
    else
      Inc(DWord(pRes), nLen * 2);
    inc(iStr);
  end;
end;


end.
