unit uDCLocalizer;

interface

uses
  Winapi.Windows,
  uDCLang;

type
  TDCLocalizer = class
  private
    class var FLanguage: TUserLanguage;
    class procedure SetLanguage(const Value: TUserLanguage); static;
  public
    class property Language: TUserLanguage read FLanguage write SetLanguage default langRU;
    class function GetStringRes(idx: DWORD): WideString;
  end;

implementation

function GetSystemLang: TUserLanguage;
var
  aSystemLang: string;
begin
  if GetThreadLocale = 1049 then
    aSystemLang := 'RU'
  else
    aSystemLang := 'EN';

  Result := StrToLanguage(aSystemLang);

end;

{ TDCLocalizer }

class function TDCLocalizer.GetStringRes(idx: DWORD): WideString;
begin
  Result := uDCLang.GetStringRes(idx, Ord(Language));
end;

class procedure TDCLocalizer.SetLanguage(const Value: TUserLanguage);
begin
  FLanguage := Value;
end;

initialization
  TDCLocalizer.Language := GetSystemLang;

end.
