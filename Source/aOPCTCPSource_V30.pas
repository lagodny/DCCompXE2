unit aOPCTCPSource_V30;

interface

uses
  Classes, SysUtils,
  uDCLang,
  aOPCSource,
  uDCObjects, uUserMessage, aCustomOPCSource, aCustomOPCTCPSource;

const
  cPV30_BlockSize = 64*1024;

type
  TaOPCTCPSource_V30 = class(TaCustomOPCTCPSource)
  private
    FEncrypt: Boolean;
    FServerSettingsIsLoaded: Boolean;

    procedure UpdateEncrypted(aLock: Boolean);
    procedure UpdateComressionLevel(aLock: Boolean);
    procedure UpdateLanguage(aLock: Boolean);

    procedure SetConnectionParams;
    procedure GetServerSettings;

    function GenerateCryptKey(aCharCount: Integer): RawByteString;
  protected
    function GetOpcFS: TFormatSettings; override;

    function GetEncrypt: boolean; override;
    procedure SetEncrypt(const Value: Boolean); override;

    procedure SetLanguage(const Value: TUserLanguage); override;

    procedure TryConnect; override;
    procedure Authorize(aUser: string; aPassword: string); override;
    procedure SetCompressionLevel(const Value: integer); override;

    procedure DoCommand(aCommand: string);
    procedure DoCommandFmt(aCommand: string; const Args: array of TVarRec);
    procedure CheckCommandResult;

    procedure LockAndConnect;

    procedure LockAndDoCommand(aCommand: string);
    procedure LockAndDoCommandFmt(aCommand: string; const Args: array of TVarRec);

    function LockDoCommandReadLn(aCommand: string): string;
    function LockDoCommandReadLnFmt(aCommand: string; const Args: array of TVarRec): string;

    function LockAndGetStringsCommand(aCommand: string): string;

    function ExtractValue(var aValues: string;
      var aValue: string; var aErrorCode: integer; var aErrorStr: string; var aMoment: TDateTime): Boolean; override;

  public
    constructor Create(aOwner: TComponent); override;

    function GetUsers: string; override;
    function Login(const aUserName, aPassword: string): Boolean; override;

    function GetUserPermission(const aUser, aPassword, aObject: String): String; override;

    function GetClientList: string; override;
    function GetThreadList: string; override;
    function GetThreadProp(aThreadName: string): string; override;
    function SetThreadState(ConnectionName: string; aNewState: boolean): string; override;
    function SetThreadLock(ConnectionName: string; aLockState: boolean): string; override;

    function SendModBusEx(aConnectionName: string; aRequest: string;
      aRetByteCount: integer; aTimeOut: integer): string; override;

    function LoadLookup(aName: string; var aTimeStamp: TDateTime): string; override;
    function GetNameSpace(aObjectID: string = ''; aLevelCount: Integer = 0): Boolean; override;

    procedure FillNameSpaceStrings(aNameSpace: TStrings; aRootID: string = ''; aLevelCount: Integer = 0;
      aKinds: TDCObjectKindSet = []); override;

    procedure ChangePassword(aUser, aOldPassword, aNewPassword: string); override;

    procedure GetFile(aFileName: string; var aStream: TMemoryStream); override;
    procedure UploadFile(aFileName: string); override;

    //function GetSensorProperties(id: string): TSensorProperties; override;
    function GetSensorPropertiesEx(id: string): string; override;
    function SetSensorPropertiesEx(id: string; sl: TStrings): string; override;

    function GetGroupProperties(id: string): string; override;
    function SetGroupProperties(id: string; sl: TStrings): string; override;

    function GetDeviceProperties(id: string): string; override;
    function SetDeviceProperties(id: string; sl: TStrings): string; override;

    procedure FillHistory(aStream: TStream; SensorID: string;
      Date1: TDateTime; Date2: TDateTime = 0;
      aDataKindSet: TDataKindSet = [dkValue];
      aCalcLeftVal: Boolean = True; aCalcRightVal: Boolean = True); override;

    procedure FillHistoryCSV(aStrings: TStrings; SensorID: string;
      Date1: TDateTime; Date2: TDateTime = 0;
      aDataKindSet: TDataKindSet = [dkValue];
      aCalcLeftVal: Boolean = True; aCalcRightVal: Boolean = True);


    procedure FillHistoryTable(aStream: TStream; SensorIDs: string;
      Date1: TDateTime; Date2: TDateTime = 0;
      aCalcLeftVal: Boolean = True; aCalcRightVal: Boolean = True);

    function DelSensorValue(PhysID: string; Moment: TDateTime): string; override;
    function DelSensorValues(PhysID: string; Date1, Date2: TDateTime): string; override;

    function GetValue(PhysID: string): string; override;
    function GetValueText(PhysID: string): string;

    function SetSensorValue(PhysID, Value: string; Moment: TDateTime = 0): string; override;
    function GetSensorValue(PhysID: String; var ErrorCode: integer; var ErrorString: String; var Moment: TDateTime): string; override;
    function GetSensorValueText(PhysID: String; var ErrorCode: integer; var ErrorString: String; var Moment: TDateTime): string;

    function GetSensorValueOnMoment(PhysID: String; var Moment: TDateTime): string; override;

    function GetPermissions(PhysIDs: string): string; override;

    function GetSensorsValues(PhysIDs: String): string; override;
    procedure FillSensorsValuesStream(var aValuesStream: TMemoryStream); override;

    function GetSensorsReadError: string; override;
    function CalcVolume(aSensorID: integer; aDate1, aDate2: TDateTime): extended; override;
    function GetTimes(aSensorID: Integer; aDate1, aDate2: TDateTime): string; override;
    function GetStatistic(aSensorID: string; aDate1, aDate2: TDateTime): string; override;

    procedure SendUserMessage(aUserGUID: string; aMessage: string); override;
    function GetMessage: TUserMessage; override;  

    procedure DisconnectUser(aUserGUID: string); override;

    procedure DownloadSetup(aFileName: string; aStream: TStream); override; // aProgressNotify: TOPCProgressNotify = nil);
	
    procedure UpdateDescription; override;

    procedure ReloadRoles;
    function GetAccessToCommand(aCommand: string): string;

    function GetUserObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable): string;

    function GetObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable): string;
    procedure SetObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable; aUserPermitions: string);

    procedure GetSchedule(aSensorID: string; aStream: TStream);

    //procedure AddSCSTracker(aParams:

  published
    property Encrypt: Boolean read FEncrypt write SetEncrypt default False;
    property ProtocolVersion default 30;

    property UpdateMode default umStreamPacket;
  end;


implementation

uses
  SynCommons,
  Math,
  FGInt, FGIntPrimeGeneration, FGIntRSA,
  flcStdTypes, flcCipherRSA,
  IdGlobal, IdException,
  DateUtils, StrUtils,
  uStrFunc, aOPCLog,
  uDCLocalizer,
  aOPCConsts;

{ TaOPCTCPSource_V30 }

procedure TaOPCTCPSource_V30.Authorize(aUser, aPassword: string);
begin
  DoCommandFmt('Login %s;%s;1', [aUser, StrToHex(aPassword, '')]);
  ReadLn; // ���������� �����������

  if OPCLog.AutoFillOnAuthorize then
  begin
    OPCLog.LoginName := GetLocalUserName;
    OPCLog.UserName := aUser;
    OPCLog.ComputerName := GetComputerName;
    OPCLog.IPAdress := Connection.Socket.Binding.IP;
  end;

end;

function TaOPCTCPSource_V30.CalcVolume(aSensorID: integer; aDate1, aDate2: TDateTime): extended;
begin
//  // ����� �������������� ���� (DateToServer) ���������� ����������� �����������
//  LockAndConnect;
//
//  LockAndDoCommandFmt('CalcVolume %d;%s;%s',
//    [aSensorID, DateTimeToStr(DateToServer(aDate1), OpcFS), DateTimeToStr(DateToServer(aDate2), OpcFS)]);
//  Result := StrToFloat(ReadLn, OpcFS);

  LockConnection('CalcVolume');
  try
    try
	    DoConnect;
      DoCommandFmt('CalcVolume %d;%s;%s',
        [aSensorID, DateTimeToStr(DateToServer(aDate1), OpcFS), DateTimeToStr(DateToServer(aDate2), OpcFS)]);

      Result := StrToFloat(ReadLn, OpcFS);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('CalcVolume');
  end;

end;

procedure TaOPCTCPSource_V30.ChangePassword(aUser, aOldPassword, aNewPassword: string);
begin
  LockAndDoCommandFmt('ChangePassword %s;%s;%s;1',
    [aUser, StrToHex(aOldPassword, ''), StrToHex(aNewPassword, '')]);
end;

procedure TaOPCTCPSource_V30.CheckCommandResult;
var
  aStatus: string;
begin
  aStatus := ReadLn;
  if aStatus = sError then
    raise EOPCTCPCommandException.Create(ReadLn)
  else if aStatus <> sOk then
    raise EOPCTCPUnknownAnswerException.Create('������������ ����� �� �������');
end;

constructor TaOPCTCPSource_V30.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  ProtocolVersion := 30;
  Connection.Intercept := Intercept;
  UpdateMode := umStreamPacket;  
end;

function TaOPCTCPSource_V30.DelSensorValue(PhysID: string; Moment: TDateTime): string;
begin
  Result := '';
  LockConnection('DelSensorValue');
  try
    try
      DoConnect;
      DoCommandFmt('DeleteValue %s;%s', [PhysID, FloatToStr(DateToServer(Moment), OpcFS)]);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('DelSensorValue');
  end;
end;

function TaOPCTCPSource_V30.DelSensorValues(PhysID: string; Date1, Date2: TDateTime): string;
begin
  Result := '';
  LockConnection('DelSensorValues');
  try
    try
      DoConnect;
      DoCommandFmt('DeleteValues %s;%s;%s', [PhysID, FloatToStr(DateToServer(Date1), OpcFS), FloatToStr(DateToServer(Date2), OpcFS)]);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('DelSensorValues');
  end;

end;

procedure TaOPCTCPSource_V30.DisconnectUser(aUserGUID: string);
begin
  LockAndDoCommandFmt('DisconnectUser %s', [aUserGUID]);
end;

procedure TaOPCTCPSource_V30.DoCommand(aCommand: string);
begin
  SendCommand(aCommand);
  CheckCommandResult;
end;

procedure TaOPCTCPSource_V30.DoCommandFmt(aCommand: string; const Args: array of TVarRec);
begin
  SendCommandFmt(aCommand, Args);
  CheckCommandResult;
end;

procedure TaOPCTCPSource_V30.DownloadSetup(aFileName: string; aStream: TStream);
var
  aSize: Integer;
  aBlockSize: Integer;
  aCanceled: Boolean;
begin
  Assert(Assigned(aStream), TDCLocalizer.GetStringRes(idxStream_NotCreated));

  LockConnection('DownloadSetup');
  try
    DoConnect;
    DoCommandFmt('DownloadSetup %s', [aFileName]);
    aSize := StrToInt(ReadLn);

    aCanceled := False;
    aStream.Position := 0;
    aBlockSize := Min(cTCPMaxBlockSize, aSize - aStream.Position);
    while aStream.Position < aSize do
    begin
      ReadStream(aStream, aBlockSize);
      if Assigned(OnProgress) then
      begin
        OnProgress(aStream.Position, aSize, aCanceled);
        if aCanceled then
          Break;
      end;
      aBlockSize := Min(cTCPMaxBlockSize, aSize - aStream.Position);
    end;
  finally
    UnLockConnection('DownloadSetup');
  end;

  if aCanceled then
  begin
    Disconnect;
    Reconnect;
    raise EOPCTCPOperationCanceledException.Create(
      TDCLocalizer.GetStringRes(idxTCPCommand_OperationCanceledByUser));
  end;

end;

function TaOPCTCPSource_V30.ExtractValue(var aValues, aValue: string; var aErrorCode: integer; var aErrorStr: string;
  var aMoment: TDateTime): Boolean;
var
  i, p1: integer;
  s: string;
  aState: (sValue, sErrorCode, sErrorStr, sMoment, sEOL);
  aStrLength: integer;
begin
  // ��������� ����� ����:
  //
  // Value;ErrorCode;ErrorStr;Moment<EOL>
  // Value;ErrorCode;ErrorStr;Moment<EOL>
  // <EOL>
  // ...
  // Value;ErrorCode;ErrorStr;Moment<EOL>
  //
  // ������� �� ��������� ������ ����������� ������

  i := 1;
  aStrLength := Length(aValues);

  Assert(aStrLength > 0, '�������� ������ ������');

  Result := aValues[i] <> #13;
  if Result then
  begin
    p1 := 1;
    aState := sValue;

    while aState <> sEOL do
    begin
      // EOL = CR + LF  (#13 + #10)
      if (i > aStrLength) or (CharInSet(aValues[i], [';', #13])) then
      begin
        s := Copy(aValues, p1, i - p1);
        p1 := i + 1;
        case aState of
          sValue:       // ��������
            aValue := s;
          sErrorCode:   // ��� ������
            aErrorCode := StrToIntDef(s, 0);
          sErrorStr:    // ������
            aErrorStr := s;
          sMoment:      // ������ �������
            aMoment := StrToDateTimeDef(s, DateToClient(aMoment), OpcFS);
        end;
        Inc(aState);
      end;
      Inc(i);
    end;
    aValues := Copy(aValues, i + 1 {LF}, aStrLength);
  end
  else
    aValues := Copy(aValues, i + 2 {CRLF}, aStrLength);

  
end;

procedure TaOPCTCPSource_V30.FillNameSpaceStrings(aNameSpace: TStrings; aRootID: string; aLevelCount: Integer;
  aKinds: TDCObjectKindSet);
var
  Stream: TMemoryStream;
  aStreamSize: integer;
begin
  Assert(Assigned(aNameSpace));

  aNameSpace.Clear;
  LockConnection('GetNameSpace');
  try
    try
      DoConnect;
      DoCommandFmt('GetNameSpace ObjectID=%s;TimeStamp=%s;LevelCount=%d', [aRootID, '0', aLevelCount]);
      // ������ ���� ��������� ��������
      ReadLn;
      // ������ ������ ������
      aStreamSize := StrToInt(ReadLn);
      if aStreamSize = 0 then
        Exit;

      Stream := TMemoryStream.Create;
      try
        ReadStream(Stream, aStreamSize, False);
        Stream.Position := 0;
        aNameSpace.LoadFromStream(Stream);
      finally
        FreeAndNil(Stream);
      end;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetNameSpace');
  end;
end;

procedure TaOPCTCPSource_V30.FillHistory(aStream: TStream; SensorID: string; Date1, Date2: TDateTime;
  aDataKindSet: TDataKindSet; aCalcLeftVal, aCalcRightVal: Boolean);
begin
  Assert(Assigned(aStream), '�� ������ �����');

  LockConnection('FillHistory');
  try
    try
      DoConnect;

      DoCommand('GetHistory ' +
        SensorID + ';' +
        DateTimeToStr(DateToServer(Date1), OpcFS) + ';' +
        DateTimeToStr(DateToServer(Date2), OpcFS) + ';' +
        BoolToStr(dkState in aDataKindSet) + ';' +
        BoolToStr(dkValue in aDataKindSet) + ';' +
        BoolToStr(dkUser in aDataKindSet) + ';' +
        BoolToStr(aCalcLeftVal) + ';' +
        BoolToStr(aCalcRightVal)
        );

      ReadStream(aStream);

	    // ��������� ���� � ���� ��������
      HistoryDateToClient(aStream, aDataKindSet);

      aStream.Position := 0;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('FillHistory');
  end;
end;

procedure TaOPCTCPSource_V30.FillHistoryCSV(aStrings: TStrings; SensorID: string; Date1, Date2: TDateTime;
  aDataKindSet: TDataKindSet; aCalcLeftVal, aCalcRightVal: Boolean);
begin
  Assert(Assigned(aStrings), '�� ������ �������������� TStrings');

  LockConnection('FillHistoryCSV');
  try
    try
      DoConnect;

      DoCommand('GetHistoryCSV ' +
        SensorID + ';' +
        //DateTimeToStr(DateToServer(Date1), OpcFS) + ';' +
        //DateTimeToStr(DateToServer(Date2), OpcFS) + ';' +
        UTF8ToString(DateTimeToIso8601(DateToServer(Date1), True)) + ';' +
        UTF8ToString(DateTimeToIso8601(DateToServer(Date2), True)) + ';' +
        BoolToStr(dkState in aDataKindSet) + ';' +
        BoolToStr(dkValue in aDataKindSet) + ';' +
        BoolToStr(dkUser in aDataKindSet) + ';' +
        BoolToStr(aCalcLeftVal) + ';' +
        BoolToStr(aCalcRightVal)
        );

      //ReadStream(aStream);
      Connection.IOHandler.ReadStrings(aStrings);

	    // ��������� ���� � ���� ��������
      //HistoryDateToClient(aStream, aDataKindSet);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('FillHistory');
  end;
end;

procedure TaOPCTCPSource_V30.FillHistoryTable(aStream: TStream; SensorIDs: string; Date1, Date2: TDateTime; aCalcLeftVal,
  aCalcRightVal: Boolean);
begin
  Assert(Assigned(aStream), '�� ������ �����');

  LockConnection('FillHistoryTable');
  try
    try
      DoConnect;

      DoCommand('GetHistoryTable ' +
        SensorIDs + ';' +
        DateTimeToStr(DateToServer(Date1), OpcFS) + ';' +
        DateTimeToStr(DateToServer(Date2), OpcFS) + ';' +
        BoolToStr(aCalcLeftVal) + ';' +
        BoolToStr(aCalcRightVal)
        );

      ReadStream(aStream);
      aStream.Position := 0;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('FillHistory');
  end;
end;

procedure TaOPCTCPSource_V30.FillSensorsValuesStream(var aValuesStream: TMemoryStream);
var
  i: integer;
  PhysID: integer;
  Stream: TMemoryStream;
  aByteCount: integer;
begin
  aValuesStream.Clear;
  //if FPhysIDs = '' then
  //  Exit;

  LockConnection('FillSensorsValuesStream');
  try
    try
      DoConnect;
      if FDataLinkGroupsChanged then
      begin
        Stream := TMemoryStream.Create;
        try
          for i := 0 to DataLinkGroups.Count - 1 do
          begin
            PhysID := StrToIntDef(TOPCDataLinkGroup(DataLinkGroups.Items[i]).PhysID, 0);
            Stream.Write(PhysID, SizeOf(PhysID));
          end;
          Stream.Position := 0;

          OpenWriteBuffer;
          try
            SendCommandFmt('GetStreamValues %d', [DataLinkGroups.Count]);
            WriteStream(Stream, True, False);
          finally
            CloseWriteBuffer;
          end;
          CheckCommandResult;

          // �������, ��� �� �������� ������� ����� ������ ������������� ��������
          FDataLinkGroupsChanged := false;
        finally
          Stream.Free;
        end;
      end
//      if FPhysIDsChanged then
//        DoCommandFmt('GetStreamValues %s', [FPhysIDs])
      else
        DoCommand('GetStreamValues');

      aByteCount := StrToInt(ReadLn);

      ReadStream(aValuesStream, aByteCount);
	  ValuesDateToClient(aValuesStream);
      aValuesStream.Position := 0;

    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('FillSensorsValuesStream');
  end;
end;

function TaOPCTCPSource_V30.GenerateCryptKey(aCharCount: Integer): RawByteString;
var
  i: integer;
begin
  Randomize;

  Result := '';
  for i := 1 to aCharCount do
    Result := Result + ByteChar(Random(256));
end;

function TaOPCTCPSource_V30.GetAccessToCommand(aCommand: string): string;
begin
  Result := LockDoCommandReadLnFmt('GetAccessToCommand %s', [aCommand]);
end;

function TaOPCTCPSource_V30.GetClientList: string;
begin
  Result := LockAndGetStringsCommand('GetClientList');
end;		

function TaOPCTCPSource_V30.GetDeviceProperties(id: string): string;
begin
  Result := LockAndGetStringsCommand(Format('GetDeviceProperties %s', [id]));
end;


function TaOPCTCPSource_V30.GetEncrypt: boolean;
begin
  Result := FEncrypt;
end;

procedure TaOPCTCPSource_V30.GetFile(aFileName: string; var aStream: TMemoryStream);
var
  aSize: integer;
  aBlockSize: Integer;
  aCanceled: Boolean;
begin
  Assert(Assigned(aStream), '�� ������ �����');

  LockConnection('GetFile');
  try
    DoConnect;
    DoCommandFmt('GetFile %s', [Trim(aFileName)]);
    aSize := StrToInt(ReadLn);

    aCanceled := False;
    aStream.Position := 0;
    aBlockSize := Min(cPV30_BlockSize, aSize - aStream.Position);
    while aStream.Position < aSize do
    begin
      ReadStream(aStream, aBlockSize);
      if Assigned(OnProgress) then
      begin
        OnProgress(aStream.Position, aSize, aCanceled);
        if aCanceled then
          Break;
      end;
      aBlockSize := Min(cPV30_BlockSize, aSize - aStream.Position);
    end;
  finally
    UnLockConnection('GetFile');
  end;

  if aCanceled then
  begin
    Disconnect;
    Reconnect;
    raise EOPCTCPOperationCanceledException.Create('���������� �������� �������������');
  end;

end;

function TaOPCTCPSource_V30.GetGroupProperties(id: string): string;
begin
  Result := LockAndGetStringsCommand(Format('GetGroupProperties %s', [id]));
end;

function TaOPCTCPSource_V30.GetMessage: TUserMessage;
var
  aMessageStr: string;
  aMessageLength: integer;
begin
  Result := nil;

  // ������� 0 ������ �� ������������ ����� �����������
  if ServerVer = 0 then
    Exit;

  LockConnection('GetMessage');
  try
    try
      DoConnect;
      //OPCLog.WriteToLogFmt('%d: GetMessage DoConnect OK.', [GetCurrentThreadId]);

      DoCommand('GetMessage');
      //OPCLog.WriteToLogFmt('%d: GetMessage DoCommand OK.', [GetCurrentThreadId]);

      aMessageLength := StrToInt(ReadLn);
      if aMessageLength = 0 then
        Exit;

      aMessageStr := ReadString(aMessageLength);
      //OPCLog.WriteToLogFmt('%d: GetMessage ReadString OK: %s.', [GetCurrentThreadId, aMessageStr]);

      Result := TUserMessage.Create(aMessageStr);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetMessage');
  end;
end;

function TaOPCTCPSource_V30.GetNameSpace(aObjectID: string; aLevelCount: Integer): boolean;
var
  Stream: TMemoryStream;
  dt: TDateTime;
  dtStr: string;
  aStreamSize: integer;
begin
  Result := false;
  LockConnection('GetNameSpace');
  try
    try
      DoConnect;

      if (aObjectID <> FNameSpaceParentID) or
        not (FileExists(GetNameSpaceFileName)) then
        FNameSpaceTimeStamp := 0;

      dtStr := FloatToStr(FNameSpaceTimeStamp, OpcFS);
      DoCommandFmt('GetNameSpace ObjectID=%s;TimeStamp=%s;LevelCount=%d', [aObjectID, dtStr, aLevelCount]);

      dt := StrToDateTimeDef(ReadLn, 0, OpcFS);
      aStreamSize := StrToInt(ReadLn);
      if aStreamSize = 0 then
        Exit;

      Stream := TMemoryStream.Create;
      try
        ReadStream(Stream, aStreamSize, False);

        Stream.Position := 0;
        FNameSpaceCash.LoadFromStream(Stream);
        FNameSpaceTimeStamp := dt;
        FNameSpaceParentID := aObjectID;
        Result := true;
      finally
        FreeAndNil(Stream);
      end;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetNameSpace');
  end;
end;

function TaOPCTCPSource_V30.GetObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable): string;
begin
  Result := LockAndGetStringsCommand(Format('GetObjectPermission %d;%d;1', [aObjectID, Ord(aObjectTable)]));
end;

function TaOPCTCPSource_V30.GetOpcFS: TFormatSettings;
begin
  if not FServerSettingsIsLoaded then
    DoConnect;

  Result := inherited GetOpcFS;
end;

function TaOPCTCPSource_V30.GetPermissions(PhysIDs: string): string;
begin
  Result := LockAndGetStringsCommand('GetPermissions ' + PhysIDs);
end;

function TaOPCTCPSource_V30.GetThreadList: string;
begin
  Result := LockAndGetStringsCommand('GetThreadList');
end;

function TaOPCTCPSource_V30.GetThreadProp(aThreadName: string): string;
begin
  Result := LockAndGetStringsCommand(Format('GetThreadProp %s', [aThreadName]));
end;

function TaOPCTCPSource_V30.GetTimes(aSensorID: Integer; aDate1, aDate2: TDateTime): string;
begin
  Result := LockAndGetStringsCommand(
    Format('GetTimes %d;%s;%s',
      [aSensorID, DateTimeToStr(DateToServer(aDate1), OpcFS), DateTimeToStr(DateToServer(aDate2), OpcFS)]));
end;

function TaOPCTCPSource_V30.GetUsers: string;
begin
  Result := LockAndGetStringsCommand('GetUsers');
end;

function TaOPCTCPSource_V30.GetValue(PhysID: string): string;
var
  aStr: String;
  aErrorCode: Integer;
  aErrorString: string;
  aMoment: TDateTime;
begin
  LockConnection('GetValue');
  try
    try
      DoConnect;
      DoCommandFmt('GetValue %s', [PhysID]);
      aStr := ReadLn;
      ExtractValue(aStr, Result, aErrorCode, aErrorString, aMoment);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetValue');
  end;
end;

function TaOPCTCPSource_V30.GetValueText(PhysID: string): string;
var
  aStr: String;
  aErrorCode: Integer;
  aErrorString: string;
  aMoment: TDateTime;
begin
  LockConnection('GetValue');
  try
    try
      DoConnect;
      DoCommandFmt('GetValue %s;1', [PhysID]);
      aStr := ReadLn;
      ExtractValue(aStr, Result, aErrorCode, aErrorString, aMoment);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetValue');
  end;
end;

//function TaOPCTCPSource_V30.GetSensorProperties(id: string): TSensorProperties;
//var
//  s: TStrings;
//begin
//  s := TStringList.Create;
//  try
//    s.Text := LockAndGetStringsCommand(Format('GetSensorProperties %s', [id]));
//
//    with Result do
//    begin
//      Name := s.Values[sSensorName];          // ������������ �������
//      NameEn := s.Values[sSensorNameEn];      // ������������ ������� (���������)
//      FullName := s.Values[sSensorFullName];  // ������ ������������ �������
//
//      ThreadName := s.Values[sSensorConnectionName];    // ��� ������ ����� ������
//      EquipmentPath := s.Values[sSensorControllerAddr]; // ����� �����������
//      Path := s.Values[sSensorAddr];                    // ����� ������� (����,�������)
//
//      Id := s.Values[sSensorID];                        // ������������� ������� �� �������
//      UnitName := s.Values[sSensorUnitName];            // ������� ���������
//      DisplayFormat := s.Values[sSensorDisplayFormat];  // ������ ������������� ���������
//
//      CorrectM := s.Values[sSensorCorrectMul];  // ����������� ���������
//      Correct := s.Values[sSensorCorrectAdd];   // ��������� ����������
//
//      Delta := s.Values[sSensorCompression_DeadSpace];      // ������ ���� (�������� ������)
//      Precision := s.Values[sSensorCompression_Precision];  // �������� (������ ����� �������)
//      UpdateInterval := s.Values[sSensorUpdateInterval];    // �������� ����������
//      MinReadInterval := s.Values[sSensorMinReadInterval];  // ����������� �������� ����� ������� ���������
//      Vn := '0';//s.Values[sSensor]; // ����������� �������� ��������� ���������
//
//      RefTableName := s.Values[sSensorRefTableName];  // ������ �� ���������� ����������� ��������
//      RefAutoFill := s.Values[sSensorRefAutoFill];    // ����� ��������������� ���������� �����������
//
//      UpdateDBInterval := s.Values[sSensorDataBuffer_DataWriter_UpdateDBInterval]; // �������� ������ � ��
//      FuncName := s.Values[sSensorFuncName]; // ������������ ������� ���������� �������� �������
//    end;
//
//  finally
//    s.Free;
//  end;
//end;

procedure TaOPCTCPSource_V30.GetSchedule(aSensorID: string; aStream: TStream);
var
  aSize: Int64;
begin
  Assert(Assigned(aStream), TDCLocalizer.GetStringRes(idxStream_NotCreated));

  LockConnection('GetSchedule');
  try
    DoConnect;
    DoCommandFmt('GetSchedule %s', [aSensorID]);
    aSize := StrToInt(ReadLn);

    ReadStream(aStream, aSize);
    aStream.Position := 0;
  finally
    UnLockConnection('GetSchedule');
  end;
end;

function TaOPCTCPSource_V30.GetSensorPropertiesEx(id: string): string;
begin
  Result := LockAndGetStringsCommand(Format('GetSensorProperties %s', [id]));
end;

function TaOPCTCPSource_V30.GetSensorsReadError: string;
begin
  Result := LockAndGetStringsCommand('GetSensorsReadError');
end;

function TaOPCTCPSource_V30.GetSensorsValues(PhysIDs: String): string;
begin
  Result := LockAndGetStringsCommand(Format('GetValues %s', [PhysIDs]));
end;

function TaOPCTCPSource_V30.GetSensorValue(PhysID: String; var ErrorCode: integer; var ErrorString: String;
  var Moment: TDateTime): string;
var
  aStr: String;
begin
  LockConnection('GetSensorValue');
  try
    try
      DoConnect;
      DoCommandFmt('GetValue %s', [PhysID]);
      aStr := ReadLn;
      ExtractValue(aStr, Result, ErrorCode, ErrorString, Moment);
      Moment := DateToClient(Moment);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetSensorValue');
  end;
end;

function TaOPCTCPSource_V30.GetSensorValueOnMoment(PhysID: String; var Moment: TDateTime): string;
begin
  LockConnection('GetSensorValueOnMoment');
  try
    try
      DoConnect;
      DoCommandFmt('GetValueOnMoment %s;%s', [PhysID, DateTimeToStr(DateToServer(Moment), OpcFS)]);
      Result := ReadLn; // ��������
      ReadLn;           // ������
      Moment := DateToClient(StrToDateTime(ReadLn, OpcFS)); // ������ �������
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetSensorValueOnMoment');
  end;
end;

function TaOPCTCPSource_V30.GetSensorValueText(PhysID: String; var ErrorCode: integer; var ErrorString: String;
  var Moment: TDateTime): string;
var
  aStr: String;
begin
  LockConnection('GetSensorValue');
  try
    try
      DoConnect;
      DoCommandFmt('GetValue %s;1', [PhysID]);
      aStr := ReadLn;
      ExtractValue(aStr, Result, ErrorCode, ErrorString, Moment);
      Moment := DateToClient(Moment);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetSensorValue');
  end;
end;

procedure TaOPCTCPSource_V30.GetServerSettings;
var
  aCount: Integer;
  s: TStrings;
  i: Integer;
begin
  try
	  DoCommand('GetServerSettings');
	  aCount := StrToInt(ReadLn);
	
	  s := TStringList.Create;
	  try
	    for i := 1 to aCount do
	      s.Add(ReadLn);
	
	    with FOpcFS do
	    begin
	      ThousandSeparator := s.Values['ThousandSeparator'][1];
	      DecimalSeparator := s.Values['DecimalSeparator'][1];
	      TimeSeparator := s.Values['TimeSeparator'][1];
	      ListSeparator := s.Values['ListSeparator'][1];
	
	      CurrencyString := s.Values['CurrencyString'];
	      ShortDateFormat := s.Values['ShortDateFormat'];
	      LongDateFormat := s.Values['LongDateFormat'];
	      TimeAMString := s.Values['TimeAMString'];
	      TimePMString := s.Values['TimePMString'];
	      ShortTimeFormat := s.Values['ShortTimeFormat'];
	      LongTimeFormat := s.Values['LongTimeFormat'];
	
	      DateSeparator := s.Values['DateSeparator'][1];

        FServerSettingsIsLoaded := True;
	    end;
	
	    FServerVer := StrToInt(s.Values['ServerVer']);
	    FServerEnableMessage := StrToBool(s.Values['EnableMessage']);
	    FServerSupportingProtocols := s.Values['SupportingProtocols'];
      FServerOffsetFromUTC := StrToTimeDef(s.Values['OffsetFromUTC'], ClientOffsetFromUTC);
      
      FMonitoringVerID := s.Values['MonitoringVerID'];
	  finally
	    s.Free;
	  end;

  except
    on e: EIdException do
      if ProcessTCPException(e) then
        raise;
  end;
end;

function TaOPCTCPSource_V30.GetStatistic(aSensorID: string; aDate1, aDate2: TDateTime): string;
begin
  Result := LockAndGetStringsCommand(
    Format('GetStatistic %s;%s;%s',
      [aSensorID, DateTimeToStr(DateToServer(aDate1), OpcFS), DateTimeToStr(DateToServer(aDate2), OpcFS)]));
end;

function TaOPCTCPSource_V30.LoadLookup(aName: string; var aTimeStamp: TDateTime): string;
var
  aByteCount: integer;
  dtStr: string;
  dt: TDateTime;
begin
  Result := '';
  LockConnection('LoadLookup');
  try
    try
      DoConnect;
      DoCommandFmt('GetLookupTimeStamp %s', [aName]);
      dtStr := ReadLn;
      dt := StrToDateTimeDef(dtStr, 0, OpcFS);
      
      if Abs(dt - aTimeStamp) > 1 / 24 / 60 / 60 then // > 1 �������
      begin
        aTimeStamp := dt;
        DoCommandFmt('GetLookup %s', [aName]);

        ReadLn;                           // ���������� ����� ������
        aByteCount := StrToInt(ReadLn);   // ���������� ���� ������

        // ������ ������
        Result := ReadString(aByteCount);
      end;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LoadLookup');
  end;
end;

procedure TaOPCTCPSource_V30.LockAndConnect;
begin
  LockConnection('LockAndConnect');
  try
    try
	    DoConnect;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LockAndConnect');
  end;
end;

procedure TaOPCTCPSource_V30.LockAndDoCommand(aCommand: string);
begin
  LockConnection('LockAndDoCommand: ' + aCommand);
  try
    try
	    DoConnect;
	    DoCommand(aCommand);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LockAndDoCommand: ' + aCommand);
  end;
end;

procedure TaOPCTCPSource_V30.LockAndDoCommandFmt(aCommand: string; const Args: array of TVarRec);
begin
  LockAndDoCommand(Format(aCommand, Args));
//  LockConnection;
//  try
//    try
//	    DoConnect;
//	    DoCommandFmt(aCommand, Args);
//    except
//      on e: EIdException do
//        if ProcessTCPException(e) then
//          raise;
//    end;
//  finally
//    UnLockConnection;
//  end;
end;

function TaOPCTCPSource_V30.LockAndGetStringsCommand(aCommand: string): string;
var
  aByteCount: integer;
begin
  // � ��������� V30 ������ ������� �������� � ����� ������ �����
  // ������ ��������� �������� EOL = CR+LF
  // ������ ������ �� ����� �������:
  // ok<EOL>
  // <LineCount><EOL> - ���������� �����
  // <ByteCount><EOL> - ���������� ���� ������� � ������� ������� ������ ������ � ���������� LF ���������
  // ������ 1<EOL>
  // ������ 2<EOL>
  // ...
  // ������ N<EOL>

  Result := '';
  LockConnection('LockAndGetStringsCommand: ' + aCommand);
  try
    try
      DoConnect;
      DoCommand(aCommand);
      ReadLn;                           // ���������� ����� ������
      aByteCount := StrToInt(ReadLn);   // ���������� ���� ������

      // ������ ������
      Result := ReadString(aByteCount);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LockAndGetStringsCommand: ' + aCommand);
  end;
end;

function TaOPCTCPSource_V30.LockDoCommandReadLn(aCommand: string): string;
begin
  LockConnection('LockDoCommandReadLn');
  try
    try
	    DoConnect;
	    DoCommand(aCommand);
      Result := ReadLn;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LockDoCommandReadLn');
  end;
end;

function TaOPCTCPSource_V30.LockDoCommandReadLnFmt(aCommand: string; const Args: array of TVarRec): string;
begin
  LockConnection('LockDoCommandReadLnFmt');
  try
    try
	    DoConnect;
	    DoCommandFmt(aCommand, Args);
      Result := ReadLn;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('LockDoCommandReadLnFmt');
  end;
end;

function TaOPCTCPSource_V30.Login(const aUserName, aPassword: string): Boolean;
begin
  Result := GetUserPermission(aUserName, aPassword, '') <> '';
end;

procedure TaOPCTCPSource_V30.ReloadRoles;
begin
  LockAndDoCommand('ReloadRoles');
end;

function TaOPCTCPSource_V30.GetUserObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable): string;
begin
  LockConnection('GetUserObjectPermission');
  try
    DoConnect;
    DoCommandFmt('GetUserObjectPermission %d;%d', [aObjectID, Ord(aObjectTable)]);

    Result := ReadLn;
  finally
    UnLockConnection('GetUserObjectPermission');
  end;
end;

function TaOPCTCPSource_V30.GetUserPermission(const aUser, aPassword, aObject: String): String;
begin
  Result := '';
  LockConnection('GetUserPermission');
  try
    try
      DoConnect;
      DoCommandFmt('GetUserPermission %s;%s;%s;1', [aUser, StrToHex(aPassword, ''), aObject]);
      Result := ReadLn;
      Authorize(aUser, aPassword);
      User := aUser;
      Password := aPassword;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('GetUserPermission');
  end;
end;

function TaOPCTCPSource_V30.SendModBusEx(aConnectionName, aRequest: string; aRetByteCount, aTimeOut: integer): string;
begin
  Result := '';
  LockConnection('SendModBusEx');
  try
    try
      DoConnect;
      SendCommandFmt('SendModBus %s;%s;%d;%d', [aConnectionName, aRequest, aRetByteCount, aTimeOut]);
      Result := ReadLn;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnlockConnection('SendModBusEx');
  end;
end;
procedure TaOPCTCPSource_V30.SendUserMessage(aUserGUID, aMessage: string);
begin
  // ������� 0 ������ �� ������������ ����� �����������
  if ServerVer = 0 then
    Exit;

  LockConnection('SendUserMessage');
  try
    DoConnect;
    DoCommandFmt('SendMessage %s;%s', [aUserGUID, StrToHex(aMessage, '')]);
  finally
    UnLockConnection('SendUserMessage');
  end;
end;

procedure TaOPCTCPSource_V30.SetCompressionLevel(const Value: integer);
begin
  if CompressionLevel = Value then
    exit;

  inherited SetCompressionLevel(Value);
  UpdateComressionLevel(Active);
end;

procedure TaOPCTCPSource_V30.SetConnectionParams;
const
  cStringEncoding = '';  //'UTF8';
  { TODO : ���������, ������ �� �������� �������� ������ �������������, ���� ����� UTF8 }
  //cStringEncoding = 'UTF8';
begin
  try
	  DoCommandFmt('SetConnectionParams '+
	    'ProtocolVersion=%d;'+
	    //'CompressionLevel=%d;'+
	    'EnableMessage=%d;'+
	    'Description=%s;'+
	    'SystemLogin=%s;'+
	    'HostName=%s;'+
	    'MaxLineLength=%d;'+
      'Language=%s;'+
      'StringEncoding=%s',
	    [ ProtocolVersion,
	      //CompressionLevel,
	      Ord(EnableMessage),
	      Description,
	      GetLocalUserName,
	      GetComputerName,
	      Connection.IOHandler.MaxLineLength,
        LanguageToStr(Language),
        cStringEncoding
	      ]
	    );

      if (ServerVer >= 3) and (cStringEncoding = 'UTF8') then
        Connection.IOHandler.DefStringEncoding := IndyTextEncoding_UTF8;
  except
    on e: EIdException do
      if ProcessTCPException(e) then
        raise;
  end;
end;  

function TaOPCTCPSource_V30.SetDeviceProperties(id: string; sl: TStrings): string;
var
  s: string;
  i: Integer;
begin
  Result := '';
  LockConnection;
  try
    try
      s := Format('SetDeviceProperties %s', [id]);
      for i := 0 to sl.Count - 1 do
        s := s + ';' + sl.Names[i] + '=' + StrToHex(sl.ValueFromIndex[i], '');

      DoConnect;
      DoCommand(s);

      Result := sOk;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection;
  end;
end;

procedure TaOPCTCPSource_V30.SetEncrypt(const Value: Boolean);
begin
  if Encrypt = Value then
    exit;

  FEncrypt := Value;

  UpdateEncrypted(Active);
end;  

function TaOPCTCPSource_V30.SetGroupProperties(id: string; sl: TStrings): string;
var
  s: string;
  i: Integer;
begin
  Result := '';
  LockConnection;
  try
    try
      s := Format('SetGroupProperties %s', [id]);
      for i := 0 to sl.Count - 1 do
        s := s + ';' + sl.Names[i] + '=' + StrToHex(sl.ValueFromIndex[i], '');

      DoConnect;
      DoCommand(s);

      // ���������� ������������� ������������ �������
      Result := sOk;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection;
  end;
end;

procedure TaOPCTCPSource_V30.SetLanguage(const Value: TUserLanguage);
begin
  if Language = Value then
    Exit;

  inherited SetLanguage(Value);

  UpdateLanguage(Active);
end;

procedure TaOPCTCPSource_V30.SetObjectPermission(aObjectID: Integer; aObjectTable: TDCObjectTable; aUserPermitions: string);
begin
  LockAndDoCommandFmt('SetObjectPermission %d;%d;%s;1', [aObjectID, Ord(aObjectTable), EncodeStr(aUserPermitions)]);
end;

function TaOPCTCPSource_V30.SetSensorPropertiesEx(id: string; sl: TStrings): string;
var
  s: string;
  i: Integer;
begin
  Result := '';
  LockConnection;
  try
    try
      if ServerVer > 1 then
      begin
        s := Format('SetSensorProperties.1 %s', [id]);
        for i := 0 to sl.Count - 1 do
          s := s + ';' + sl.Names[i] + '=' + StrToHex(sl.ValueFromIndex[i], '');
      end
      else
      begin
	      s := Format('SetSensorProperties %s', [id]);
	      for i := 0 to sl.Count - 1 do
	        s := s + ';' + sl[i];
      end;

      DoConnect;
      DoCommand(s);

      // ���������� ������������� ������������ �������
      Result := sOk;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection;
  end;
end;

function TaOPCTCPSource_V30.SetSensorValue(PhysID, Value: string; Moment: TDateTime): string;
begin
  Result := '';
  LockConnection('SetSensorValue');
  try
    try
      DoConnect;
      if ServerVer > 1 then
      begin
        // �������� �������� HEX �������
        DoCommandFmt('SetValue.1 %s;%s;%s', [PhysID, StrToHex(Value), FloatToStr(DateToServer(Moment), OpcFS)])
      end
      else                                     
      begin
        // ������ �������: ����� ��������, ���� �������� �������� ;
        DoCommandFmt('SetValue %s;%s;%s', [PhysID, Value, FloatToStr(DateToServer(Moment), OpcFS)]);
      end;
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
    end;
  finally
    UnLockConnection('SetSensorValue');
  end;
end;

function TaOPCTCPSource_V30.SetThreadLock(ConnectionName: string; aLockState: boolean): string;
begin
  LockAndDoCommandFmt('SetThreadLock %s;%s', [ConnectionName, BoolToStr(aLockState)]);
end;

function TaOPCTCPSource_V30.SetThreadState(ConnectionName: string; aNewState: boolean): string;
begin
  LockAndDoCommandFmt('SetThreadState %s;%s', [ConnectionName, BoolToStr(aNewState)]);
end;

procedure TaOPCTCPSource_V30.TryConnect;
begin
  Intercept.CryptKey := '';
  Intercept.CompressionLevel := 0;

  inherited TryConnect;

  GetServerSettings;
  SetConnectionParams;

  if Encrypt then
    UpdateEncrypted(False);
  if CompressionLevel > 0 then
    UpdateComressionLevel(False);

  if User <> '' then
  begin
    try
      Authorize(User, Password);
    except
      on e: EIdException do
        if ProcessTCPException(e) then
          raise;
      on e: Exception do
        ;
    end;
  end;
end;

procedure TaOPCTCPSource_V30.UpdateComressionLevel(aLock: Boolean);
begin
  if Connected then
  begin
    if aLock then
      LockConnection('UpdateComressionLevel');
    try
      try
	      DoCommandFmt('SetConnectionParams CompressionLevel=%d', [CompressionLevel]);
      except
        on e: EIdException do
          if ProcessTCPException(e) then
            raise;
      end;
    finally
      if aLock then
        UnLockConnection('UpdateComressionLevel');
    end;
  end;

  Intercept.CompressionLevel := CompressionLevel;
end;

procedure TaOPCTCPSource_V30.UpdateDescription;
begin
  try
    DoCommandFmt('SetConnectionParams '+
      'Description=%s',
      [Description]
      );
  except
    on e: EIdException do
      if ProcessTCPException(e) then
        raise;
  end;

end;

procedure TaOPCTCPSource_V30.UpdateEncrypted(aLock: Boolean);
var
  aCode: AnsiString;
  aCryptKey: AnsiString;
  aRSA_e, aRSA_n: TFGInt;
  aModulus, aExponent: string;
  aPub: TRSAPublicKey;
begin
  if Encrypt then
    aCryptKey := GenerateCryptKey(16)
  else
    aCryptKey := '';

  if Connected then
  begin
    if aLock then
      LockConnection('UpdateEncrypted');
    try
      try
        if FServerVer >= 4 then
        begin
          // ����� ������ RSA
          DoCommand('GetPublicKey2');
          aModulus := ReadLn;
          aExponent := ReadLn;

          RSAPublicKeyInit(aPub);
          RSAPublicKeyAssignHex(aPub, 256, aModulus, aExponent);
          aCode := RSAEncryptStr(rsaetPKCS1, aPub, aCryptKey);
          RSAPublicKeyFinalise(aPub);

          DoCommandFmt('SetCryptKey2 %s', [StrToHex(aCode, '')]);
        end
        else
        begin
          DoCommand('GetPublicKey');
          Base10StringToFGInt(ReadLn, aRSA_e);
          Base10StringToFGInt(ReadLn, aRSA_n);

          FGIntRSA.RSAEncrypt(aCryptKey, aRSA_e, aRSA_n, aCode);

          DoCommandFmt('SetCryptKey %s', [StrToHex(aCode, '')]);
        end;
      except
        on e: EIdException do
          if ProcessTCPException(e) then
            raise;
      end;
    finally
      if aLock then
        UnLockConnection('UpdateEncrypted');
    end;
  end;
  Intercept.CryptKey := aCryptKey;
end;

procedure TaOPCTCPSource_V30.UpdateLanguage(aLock: Boolean);
begin
  if Connected then
  begin
    if aLock then
      LockConnection('UpdateLanguage');
    try
      try
	      DoCommandFmt('SetConnectionParams Language=%s', [LanguageToStr(Language)]);
      except
        on e: EIdException do
          if ProcessTCPException(e) then
            raise;
      end;
    finally
      if aLock then
        UnLockConnection('UpdateLanguage');
    end;
  end;
end;

procedure TaOPCTCPSource_V30.UploadFile(aFileName: string);
var
  aStream: TFileStream;
begin
  LockConnection('UploadFile');
  try
    aStream := TFileStream.Create(Trim(aFileName), fmOpenRead or fmShareDenyNone);
    try
      DoConnect;
      DoCommandFmt('UploadFile %s', [aFileName]);
      WriteStream(aStream);
    finally
      aStream.Free;
    end;
  finally
    UnLockConnection('UploadFile');
  end;

end;

end.
