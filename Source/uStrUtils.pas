unit uStrUtils;

interface

function GetStrStart(str: string; var Level: Integer): string;
function GetBufStart(Buffer: PChar; var Level: Integer): PChar;
function ExtractData(var str:string):string;
function IsNumericDisplayFormat(aDisplayFormat: string):boolean;

implementation

uses
  System.SysUtils;

function GetStrStart(str: string; var Level: Integer): string;
var
  i: Integer;
begin
  Level := 0;
  i := 1;
  if Length(str) = 0 then
    Exit;

  while str[i] <> '@' do
    inc(i);

  Inc(i);
  while CharInSet(str[i], [' ', #9]) do
  begin
    Inc(i);
    Inc(Level);
  end;

  Result := Copy(str, i, Length(str));
end;

function GetBufStart(Buffer: PChar; var Level: Integer): PChar;
//var
//  Flag:boolean;
begin
  Level := 0;
  while Buffer^<>'@' do
    Inc(Buffer);

  Inc(Buffer);
  while CharInSet(Buffer^, [' ', #9]) do
  begin
    Inc(Buffer);
    Inc(Level);
  end;
  Result := Buffer;
end;

function ExtractData(var str:string):string;
const
  Delimiter = '@';
var
  p:integer;
begin
  p:=pos(Delimiter,str);
  if p=0 then
  begin
    Result:=str;
    str:='';
  end
  else
  begin
    Result := copy(str,1,p-1);
    str := copy(str,p+1,length(str));
  end;
end;

function IsNumericDisplayFormat(aDisplayFormat: string):boolean;
var
  i: integer;
begin
  Result := true;
  for i := 1 to Length(aDisplayFormat) do
  begin
    if not CharInSet(aDisplayFormat[i], ['0'..'9','#','.',',',' ']) then
    begin
      Result := false;
      exit;
    end;
  end;

end;



end.
