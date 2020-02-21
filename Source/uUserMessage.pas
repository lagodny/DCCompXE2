unit uUserMessage;

interface

uses
  Classes, SysUtils;

type
  TUserMessage = class
  public
    SenderGUID: string;
    SenderAddr: string;
    SenderUserName: string;
    //Time: TDateTime;
    Text: string;

    constructor Create(aText: string); overload;

    function ToText: string;
    procedure InitFromText(aText: string);
  end;

  TUserMessageList = class(TThreadList)
  private
    function GetCount: Integer;
  public
    destructor Destroy; override;

    procedure ClearMessages;

    procedure AddMessage(aMessage: TUserMessage);
    procedure DeleteMessage(aIndex: Integer);
    function GetMessage(aIndex: Integer): TUserMessage;

    property Count: Integer read GetCount;
  end;


implementation

uses
  StrUtils;

{ TUserMessage }

const
  cUserMsgDelim = ';';

constructor TUserMessage.Create(aText: string);
begin
  inherited Create;
  InitFromText(aText);
end;

procedure TUserMessage.InitFromText(aText: string);
var
  p: integer;

  function GetToken(aText: string; aDelim: string; var aPos: integer): string;
  var
    p: Integer;
  begin
    Result := '';
    p := PosEx(aDelim, aText, aPos);
    if p > 0 then
    begin
      Result := Copy(aText, aPos, p - aPos);
      aPos := p + Length(aDelim);
    end
    else
    begin
      Result := Copy(aText, aPos, Length(aText) - aPos + 1);
      aPos := Length(aText) + 1;
    end;
  end;


begin
  p := 1;
  SenderGUID := GetToken(aText, cUserMsgDelim, p);
  SenderAddr := GetToken(aText, cUserMsgDelim, p);
  SenderUserName := GetToken(aText, cUserMsgDelim, p);
  Text := GetToken(aText, cUserMsgDelim, p);
end;

function TUserMessage.ToText: string;
begin
  Result :=
    //FormatDateTime(Time) + cUserMsgDelim +
    SenderGUID + cUserMsgDelim +
    SenderAddr + cUserMsgDelim +
    SenderUserName + cUserMsgDelim +
    Text;
end;

{ TUserMessageList }

procedure TUserMessageList.AddMessage(aMessage: TUserMessage);
var
  aList: TList;
begin
  if not Assigned(aMessage) then
    Exit;
    
  aList := LockList;
  try
    aList.Add(aMessage);
  finally
    UnlockList;
  end;
end;

procedure TUserMessageList.ClearMessages;
var
  i: integer;
  aList: TList;
begin
  aList := LockList;
  try
    for i := aList.Count - 1 downto 0 do
      TUserMessage(aList.Items[i]).Free;
    aList.Clear;
  finally
    UnlockList;
  end;
end;

procedure TUserMessageList.DeleteMessage(aIndex: Integer);
var
  aList: TList;

begin
  aList := LockList;
  try
    TUserMessage(aList[aIndex]).Free;
    aList.Delete(aIndex);
  finally
    UnlockList;
  end;
end;

destructor TUserMessageList.Destroy;
begin
  ClearMessages;
  
  inherited;
end;

function TUserMessageList.GetCount: Integer;
var
  aList: TList;
begin
  aList := LockList;
  try
    Result := aList.Count;
  finally
    UnlockList;
  end;
end;

function TUserMessageList.GetMessage(aIndex: Integer): TUserMessage;
var
  aList: TList;
begin
  aList := LockList;
  try
    if (aIndex >= 0) and (aIndex < aList.Count) then
      Result := TUserMessage(aList[aIndex])
    else
      Result := nil;
  finally
    UnlockList;
  end;

end;


end.
