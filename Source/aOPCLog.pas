unit aOPCLog;

interface

uses
  Windows, SysUtils, Classes, SyncObjs;

type


  TOPCLog = class
  private
    FDebug: boolean;
    csLogFile: TCriticalSection;
  public
    // ���� ������� ��� �����
    Active: boolean;

    // ���� ��������������� ���������� �������
    //    - UserName
    //    - LoginName
    //    - ComputerName
    // ��� �����������
    AutoFillOnAuthorize: boolean;

    // ��� ��� �����
    LogFileName: string;

    // ��� ������������, ������� �������� �����������
    UserName: string;
    // ��� ������������ ������
    LoginName: string;

    // ��� ����������, � �������� ������������ � �������
    ComputerName: string;
    // IP ����� ����� ����������
    IPAdress: string;

    // ������������ ������ ��� ����� ����� ���� �� �����������������
    // � ������ ������������ � ����� ������ ��� ����
    MaxSize: integer;

    // ������� ����������� ���������� ���������� (0..10)
    // ��� ������ ��� ����� ��������� ���
    DetailLevel: integer;

    // ������ � ������� �������� ������ ����� ������� OPCLog
    constructor Create;
    destructor Destroy;override;

    // ������� ������ aMessage � ��� ����
    procedure WriteToLog(aMessage:string; aShift: string = '  '; aShowAll: Boolean = False);
    procedure WriteToLogFmt(const aMessage:string;const Args:array of TVarRec);
    procedure WriteToLogFmtDbg(const aMessage:string;const Args:array of TVarRec;
      aDetailLevel: integer = 0);
  end;

{
  ����� ������������ ��� ����������� ����������
  ������� ������� ������ � �������
  �������������� �������� OPCLog � ����� ���������� ��� ���������
  �������� �������� ��� ���������� � ������� ������
}

  function OPCLog: TOPCLog; // ������� ���������� ��� Singleton


implementation

uses
  System.StrUtils,
  uStrFunc;

var
  FOPCLog: TOPCLog;

// ***************************
function OPCLog:TOPCLog;
begin
  if not Assigned(FOPCLog) then
    Result := TOPCLog.Create
  else
    Result := FOPCLog;
end;
// **********************


{ TOPCLog }

constructor TOPCLog.Create;
begin
  FOPCLog := inherited Create;

  csLogFile := TCriticalSection.Create;
  DetailLevel := 10; // ������� ����������� ���������� ���������� (0..10)
                    // ��� ���� ��� ����� ��������� ����������

  FDebug  := true; // ����� ������� - ������� WriteToLogFmtDbg ����� ��������
  MaxSize := 500; // Kb
  LogFileName := ExtractFilePath(ParamStr(0))+'\OPCLog.log';
  AutoFillOnAuthorize := true;
  Active := true;
end;

destructor TOPCLog.Destroy;
begin
  FOPCLog := nil;
  csLogFile.Free;
  inherited;
end;


procedure TOPCLog.WriteToLog(aMessage: string; aShift: string = '  '; aShowAll: Boolean = False);
var
  aMsg: string;
  LogFileName1: string;
  LogFileStream: TFileStream;

  Encoding: TEncoding;
  Buffer, Preamble: TBytes;

//  function ReplaceNonPrintingSymbol(s: String): String;
//  var
//    i: integer;
//    L: integer;
//  begin
//    L := Length(s);
//    SetLength(Result, L);
//    for i := 1 to L do
//    begin
//      if CharInSet(s[i], [#0..#31]) then
//        Result[i] := ' '
//      else
//        Result[i] := s[i];
//    end;
//  end;

begin
  LogFileStream := nil;
  Encoding := TEncoding.Default;

  if Assigned(csLogFile) then
    csLogFile.Enter;
  try
    try
      try
        LogFileStream := TFileStream.Create(LogFileName, fmOpenWrite + fmShareDenyNone);
        LogFileStream.Position := LogFileStream.Size;
      except
        LogFileStream := TFileStream.Create(LogFileName, fmCreate);
        FreeAndNil(LogFileStream);

        LogFileStream := TFileStream.Create(LogFileName, fmOpenWrite + fmShareDenyNone);
        Preamble := Encoding.GetPreamble;
        if Length(Preamble) > 0 then
          LogFileStream.WriteBuffer(Preamble[0], Length(Preamble));
      end;

      if (LogFileStream.Size div 1024) > MaxSize then
      begin
        FreeAndNil(LogFileStream);

        LogFileName1 := LogFileName + '1';
        if FileExists(LogFileName1) then
          System.SysUtils.DeleteFile(LogFileName1);

        RenameFile(LogFileName, LogFileName1);

        LogFileStream := TFileStream.Create(LogFileName, fmCreate);
        FreeAndNil(LogFileStream);

        LogFileStream := TFileStream.Create(LogFileName, fmOpenWrite + fmShareDenyNone);
        Preamble := Encoding.GetPreamble;
        if Length(Preamble) > 0 then
          LogFileStream.WriteBuffer(Preamble[0], Length(Preamble));

      end;

      if aMessage <> '' then
      begin

        aMsg :=
          FormatDateTime('dd.MM.yyyy hh:mm:ss:zzz', Now) + #09 +
          UserName          + #09 +
          LoginName         + #09 +
          ComputerName      + #09 +
          IPAdress          + #09 +
          aShift            +
          IfThen(aShowAll, aMessage, RemoveNonprintingSymbols(aMessage)) + #13#10;
      end
      else
        aMsg := #13#10;

      Buffer := Encoding.GetBytes(aMsg);
      LogFileStream.Write(Buffer[0], Length(Buffer));

      //LogFileStream.Write(PAnsiChar(aMsg)^, Length(aMsg));
    except
      FreeAndNil(LogFileStream);
    end;
  finally
    FreeAndNil(LogFileStream);  
    if Assigned(csLogFile) then
      csLogFile.Leave;
  end;
end;

procedure TOPCLog.WriteToLogFmt(const aMessage: string;
  const Args: array of TVarRec);
begin
  WriteToLog(Format(aMessage,Args));
end;

procedure TOPCLog.WriteToLogFmtDbg(const aMessage: string;
  const Args: array of TVarRec; aDetailLevel: integer = 0);
begin
  if FDebug and (DetailLevel >= aDetailLevel) then
    WriteToLogFmt(aMessage,Args);
end;

initialization

finalization
  FreeAndNil(FOPCLog);


end.
