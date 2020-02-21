unit aOPCCommandHandler;

interface

uses
  Classes, IdTCPServer, IdResourceStrings;

type
  TaOPCCustomCommandHandlers = class;

  TOPCCommandHandlers = class(TOwnedCollection)
  private
    FServer: TIdTCPServer;
  protected
    function GetItem(AIndex: Integer): TIdCommandHandler;
    function GetOwnedBy: TPersistent;
    procedure SetItem(AIndex: Integer; const AValue: TIdCommandHandler);
  published
  public
    function Add: TIdCommandHandler;
    constructor Create(aOwner: TComponent); reintroduce;
    //
    property Items[AIndex: Integer]: TIdCommandHandler read GetItem write SetItem;
    property OwnedBy: TPersistent read GetOwnedBy;

    property Server: TIdTCPServer read FServer write FServer;
  end;

  TOPCAfterCommandHandlerEvent = procedure(ASender: TaOPCCustomCommandHandlers; AThread: TIdPeerThread) of object;
  TOPCBeforeCommandHandlerEvent = procedure(ASender: TaOPCCustomCommandHandlers; const AData: string;
    AThread: TIdPeerThread) of object;
  TOPCNoCommandHandlerEvent = procedure(ASender: TaOPCCustomCommandHandlers; const AData: string;
    AThread: TIdPeerThread) of object;

  TaOPCCustomCommandHandlers = class(TComponent)
  private
    FOnBeforeCommandHandler: TOPCBeforeCommandHandlerEvent;
    FOnAfterCommandHandler: TOPCAfterCommandHandlerEvent;
    FOnNoCommandHandler: TOPCNoCommandHandlerEvent;
  protected
    procedure DoAfterCommandHandler(AThread: TIdPeerThread);
    procedure DoBeforeCommandHandler(AThread: TIdPeerThread; const ALine: string);
  public
    procedure DoCommandHandler(AThread: TIdPeerThread); virtual;
    procedure DoOnNoCommandHandler(const AData: string; AThread: TIdPeerThread);
  published
    property OnBeforeCommandHandler: TOPCBeforeCommandHandlerEvent read FOnBeforeCommandHandler
     write FOnBeforeCommandHandler;
    property OnAfterCommandHandler: TOPCAfterCommandHandlerEvent read FOnAfterCommandHandler
     write FOnAfterCommandHandler;
    property OnNoCommandHandler: TOPCNoCommandHandlerEvent read FOnNoCommandHandler
      write FOnNoCommandHandler;
  end;


  TaOPCCommandHandlers = class(TaOPCCustomCommandHandlers)
  private
    FCommandHandlers: TOPCCommandHandlers;
    function GetServer: TIdTCPServer;
    procedure SetServer(const Value: TIdTCPServer);
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure DoCommandHandler(AThread: TIdPeerThread); override;
    procedure DoExtCommandHandler(AThread: TIdPeerThread;
      aExtCommandHandlers: TaOPCCommandHandlers; AData: string); virtual;

  published
    property Server: TIdTCPServer read GetServer write SetServer;
    property CommandHandlers: TOPCCommandHandlers read FCommandHandlers write FCommandHandlers;


  end;



implementation

{ TaOPCCommandHandler }

constructor TaOPCCommandHandlers.Create(aOwner: TComponent);
begin
  inherited;
  FCommandHandlers := TOPCCommandHandlers.Create(aOwner);
end;

destructor TaOPCCommandHandlers.Destroy;
begin
  FCommandHandlers.Free;
  inherited;
end;

procedure TaOPCCommandHandlers.DoExtCommandHandler(AThread: TIdPeerThread;
  aExtCommandHandlers: TaOPCCommandHandlers; AData: string);
var
  i, L: integer;
begin
// если команда не была распознана этим обработчиком,
// попробуем ее обработать обработчиком, переданным в параметре aExtCommandHandler
// (уже вычитанные данные для обработки передаются в параметре AData)
// события BeforeCommandHandler и AfterCommandHandler не вызываем

  if AData <> '' then
  begin
    //aExtCommandHandlers.DoBeforeCommandHandler(AThread, AData);
    L := aExtCommandHandlers.FCommandHandlers.Count - 1;
    if (L >= 0) then
    begin
      try
        i := 0;
        while i <= L do
        begin
          with aExtCommandHandlers.FCommandHandlers.Items[i] do
          begin
            if Enabled and Check(AData, AThread) then
              Break;
          end;
          inc(i);
        end;
        if i > L then
          aExtCommandHandlers.DoOnNoCommandHandler(AData, AThread);

      finally
        //aExtCommandHandlers.Do(AThread);
      end;
    end;
  end;

end;

procedure TaOPCCommandHandlers.DoCommandHandler(AThread: TIdPeerThread);
var
  I, L: integer;
  LLine: string;
  //aServer: TCrackIdTCPServer;
begin
  //aServer := TCrackIdTCPServer(AThread.Connection.Server);

  L := CommandHandlers.Count - 1;
  if (L >= 0) then
  begin
    if AThread.Connection.Connected then
    begin //APR: was While, but user can disable handlers
      LLine := AThread.Connection.ReadLn;
      // OLX sends blank lines during reset groups and expects no response. Not sure
      // what the RFCs say about blank lines.
      // I telnetted to some newsservers, and they dont respond to blank lines.
      // This unit is core and not NNTP, but we should be consistent.
      if LLine <> '' then
      begin
        DoBeforeCommandHandler(AThread, LLine);
        try
          i := 0;
          while i <= L do
          begin
            with CommandHandlers.Items[i] do
            begin
              if Enabled and Check(LLine, AThread) then
                Break;
            end;
            inc(i);
          end;
          if i > L then
            DoOnNoCommandHandler(LLine, AThread);

        finally
          DoAfterCommandHandler(AThread);
        end;
      end;
    end;
  end;
end;

function TaOPCCommandHandlers.GetServer: TIdTCPServer;
begin
  Result := FCommandHandlers.Server;
end;

type
  TCrackTIdCommandHandlers = class(TIdCommandHandlers);

procedure TaOPCCommandHandlers.SetServer(const Value: TIdTCPServer);
begin
  FCommandHandlers.FServer := Value;
end;


{ TOPCCommandHandlers }

function TOPCCommandHandlers.Add: TIdCommandHandler;
begin
  Result := TIdCommandHandler(inherited Add);
end;

constructor TOPCCommandHandlers.Create(aOwner: TComponent);
begin
  inherited Create(aOwner, TIdCommandHandler);
end;

function TOPCCommandHandlers.GetItem(AIndex: Integer): TIdCommandHandler;
begin
  Result := TIdCommandHandler(inherited Items[AIndex]);
end;

function TOPCCommandHandlers.GetOwnedBy: TPersistent;
begin
  Result := GetOwner;
end;

procedure TOPCCommandHandlers.SetItem(AIndex: Integer; const AValue: TIdCommandHandler);
begin
  inherited SetItem(AIndex, AValue);
end;

{ TaOPCCustomCommandHandlers }

procedure TaOPCCustomCommandHandlers.DoAfterCommandHandler(AThread: TIdPeerThread);
begin
  if Assigned(OnAfterCommandHandler) then
    OnAfterCommandHandler(Self, AThread)
  else if Assigned(AThread.Connection.Server.OnAfterCommandHandler) then
    AThread.Connection.Server.OnAfterCommandHandler(AThread.Connection.Server, AThread);
end;

procedure TaOPCCustomCommandHandlers.DoBeforeCommandHandler(AThread: TIdPeerThread; const ALine: string);
begin
  if Assigned(OnBeforeCommandHandler) then
    OnBeforeCommandHandler(Self, ALine, AThread)
  else if Assigned(AThread.Connection.Server.OnBeforeCommandHandler) then
    AThread.Connection.Server.OnBeforeCommandHandler(AThread.Connection.Server, ALine, AThread);
end;

procedure TaOPCCustomCommandHandlers.DoCommandHandler(AThread: TIdPeerThread);
begin
  // должно быть реализовано у наследников
end;

procedure TaOPCCustomCommandHandlers.DoOnNoCommandHandler(const AData: string; AThread: TIdPeerThread);
begin
  if Assigned(OnNoCommandHandler) then
    OnNoCommandHandler(Self, AData, AThread)
  else if Assigned(AThread.Connection.Server.OnNoCommandHandler) then
    AThread.Connection.Server.OnNoCommandHandler(AThread.Connection.Server, AData, AThread)
  else if AThread.Connection.Server.ReplyUnknownCommand.ReplyExists then
    //Do not UpdateText here - in thread. Is done in constructor
    // TODO: wrong command name is frequently required
    AThread.Connection.WriteRFCReply(AThread.Connection.Server.ReplyUnknownCommand)
  else
    raise EIdTCPServerError.Create(RSNoCommandHandlerFound);
end;

end.
