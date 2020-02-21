{*******************************************************}
{                                                       }
{     SCS                                               }
{     Модуль событий                                    }
{     Copyright (c) 2009-2011 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

{
  Имеется список событий - объект TEvents
  Его элементами являются объекты событий - TEvent
  Каждое событие имеет настройки TEventParams, определяющие
   его срабатывание - ParamSet
   и его сброс      - ParamReset
   если параметны сброса не заданы, то сброс выполняется, когда не выполняется условие срабатываения
}

unit uEvents;

interface

uses
  Classes, SysUtils, IniFiles, Windows,
  JclExprEval,
  uSchedule;

type
  TEventState = (esNone, esSet, esReset);
  TEventAction = (eaNone, eaShowMessage);

  TEvent = class;
  TEventParams = class;

  TOnEventEvent = procedure (Sender: TEventParams; aTime: TDateTime; var Handled: Boolean);
  TEventStatus = (esLow, esMedium, esHigh); 

  // пармаетры срабатываения события (установки/сброса)
  TEventParams = class
  private
    FEvent: TEvent;
    FOnEvent: TOnEventEvent;
    FScriptStr: string;
    procedure SetScriptStr(const Value: string);
  public
    // для срабатывания события оно должно продержаться некоторое время
    StandingTime: TDateTime;
    // значение, которое вызывает срабатывание
    Value: Extended;
    // скрипт, выполнение которого определяет сработало событие или нет
    Script: TCompiledExpression;

    Status: TEventStatus;
    Msg: string;
    Action: TEventAction;

    constructor Create(aEvent: TEvent);

    procedure DoEvent(aTime: TDateTime);
    function Check(aNewValue: Extended): Boolean;

    procedure Load(aIniFile: TCustomIniFile; aSection: string); virtual;
    procedure Save(aIniFile: TCustomIniFile; aSection: string); virtual;

    property ScriptStr: string read FScriptStr write SetScriptStr;

    property OnEvent: TOnEventEvent read FOnEvent write FOnEvent;
  end;


  TEvent = class
  private
    FEval: TExpressionCompiler;
    FState: TEventState;
    FEventTime: TDateTime;
    FNewStateTime: TDateTime;

    FParamSet: TEventParams;
    FParamReset: TEventParams;
    FSchedule: TSchedule;
    FScheduleName: string;
    FName: string;
    FObjectName: string;
    FEnable: Boolean;
    FDescription: string;
    procedure SetState(const Value: TEventState);
    procedure SetSchedule(const Value: TSchedule);
    procedure SetScheduleName(const Value: string);
    procedure SetName(const Value: string);
    procedure SetObjectName(const Value: string);
    procedure SetEnable(const Value: Boolean);
    procedure SetDescription(const Value: string);
  protected
    procedure DoEvent(aTime: TDateTime);
  public
    constructor Create; overload;
    constructor Create(aEval: TExpressionCompiler); overload;
    destructor Destroy; override;

    procedure Reset;
    function Check(aNewValue: Extended; aTime: TDateTime): Boolean; virtual;

    procedure Load(aIniFile: TCustomIniFile; aSection: string); virtual;
    procedure Save(aIniFile: TCustomIniFile; aSection: string); virtual;

    property Name: string read FName write SetName;
    property Description: string read FDescription write SetDescription;
    property ObjectName: string read FObjectName write SetObjectName;
    
    property ParamSet: TEventParams read FParamSet;
    property ParamReset: TEventParams read FParamReset;

    property Enable: Boolean read FEnable write SetEnable;
    //property EnableResetParam: Boolean read FEnableResetParam write SetEnableResetParam;
    property State: TEventState read FState write SetState;
    property Schedule: TSchedule read FSchedule write SetSchedule;
    property ScheduleName: string read FScheduleName write SetScheduleName;
  end;

  TEvents = class
  private
    FEval: TExpressionCompiler; // ссылка на компилятор объекта DataPoint
    FList: TList; // список событий
    function Get(Index: Integer): TEvent;
    function GetCount: integer;
  public
    constructor Create; overload;
    constructor Create(aEval: TExpressionCompiler); overload;
    destructor Destroy; override;

    procedure Clear;
    procedure Delete(aEvent: TEvent);
    procedure Add(aEvent: TEvent);

    procedure Load(aIniFile: TCustomIniFile; aSection: string);
    procedure Save(aIniFile: TCustomIniFile; aSection: string);

    procedure Reset;
    procedure Check(aNewValue: Extended; aTime: TDateTime);

    property Items[Index: Integer]: TEvent read Get; default;
    property Count: integer read GetCount;

  end;

implementation

uses
  uEventMsg;

const
  sEnable = 'Enable';
  sStandingTime = 'StandingTime';
  sValue = 'Value';
  sScript = 'Script';
  sMsg = 'Msg';
  sAction = 'Action';
  sStatus = 'Status';
  sSetParams = 'SetParams';
  sResetParams = 'ResetParams';
  sScheduleName = 'ScheduleName';
//var
//  dotFS: TFormatSettings;

{ TCustomEvent }

function TEvent.Check(aNewValue: Extended; aTime: TDateTime): Boolean;
var
  //aTime: TDateTime;
  aNewState: TEventState;
begin
  Result := False;

  if not Enable then
    Exit;

  //aTime := Now;
  if Assigned(Schedule) and not Schedule.DateInSchedule(aTime) then
  begin
    State := esNone;
    FNewStateTime := 0;
    Exit;
  end;

  aNewState := State;
  // в зависимости от старого состояния, вычисляем новое
  case State of
    esNone:
    begin
      if ParamSet.Check(aNewValue) then
        aNewState := esSet
      else if (not Assigned(ParamReset.Script)) or ParamReset.Check(aNewValue) then
        aNewState := esReset;

      //Exit;
    end;
    esSet:
    begin
      if Assigned(ParamReset.Script) then
      begin
        if ParamReset.Check(aNewValue) then
          aNewState := esReset;
      end
      else
      begin
        if not ParamSet.Check(aNewValue) then
          aNewState := esReset;
      end
    end;
    esReset:
    begin
      if ParamSet.Check(aNewValue) then
        aNewState := esSet;
    end;
  end;

  if FNewStateTime > aTime then
    FNewStateTime := 0;

  // если новое состояние отличается от старого, запомним время
  if (aNewState <> State) and (FNewStateTime = 0)  then
    FNewStateTime := aTime;

  // проверяем истекло ли время, через которое нужно сигнализировать
  case aNewState of
    esNone:
      Result := False;
    esSet:
      Result := (FNewStateTime <> 0) and
        ((aTime - FNewStateTime) >= ParamSet.StandingTime);
    esReset:
    begin
      if Assigned(ParamReset.Script) then
        Result := (FNewStateTime <> 0) and ((aTime - FNewStateTime) >= ParamReset.StandingTime)
      else
        Result := (FNewStateTime <> 0) and ((aTime - FNewStateTime) >= ParamSet.StandingTime);

    end;
  end;

  // если сработало событие, запоминаем его состояние и сбрасываем время
  if Result then
  begin
    State := aNewState;
    FEventTime := FNewStateTime;
    FNewStateTime := 0;
    DoEvent(aTime);
  end;
end;

constructor TEvent.Create;
begin
  FEnable := True;
  FState := esNone;
  FNewStateTime := 0;

  FParamSet := TEventParams.Create(Self);
  FParamReset := TEventParams.Create(Self);
end;

constructor TEvent.Create(aEval: TExpressionCompiler);
begin
  Create;
  FEval := aEval;
end;

destructor TEvent.Destroy;
begin
  FParamSet.Free;
  FParamReset.Free;

  inherited;
end;

procedure TEvent.DoEvent(aTime: TDateTime);
begin
  case State of
    esSet: ParamSet.DoEvent(aTime);
    esReset:
    begin
      if Assigned(ParamReset.Script) then
        ParamReset.DoEvent(aTime);
    end;
  end;
end;

procedure TEvent.Load(aIniFile: TCustomIniFile; aSection: string);
begin
  ScheduleName := aIniFile.ReadString(aSection, sScheduleName, '');
  Enable := aIniFile.ReadBool(aSection, sEnable, True);

  ParamSet.Load(aIniFile, aSection + '\' + sSetParams);
  ParamReset.Load(aIniFile, aSection + '\' + sResetParams);
end;

procedure TEvent.Reset;
begin
  State := esNone;
  FNewStateTime := 0;
end;

procedure TEvent.Save(aIniFile: TCustomIniFile; aSection: string);
begin
  aIniFile.WriteString(aSection, sScheduleName, ScheduleName);
  aIniFile.WriteBool(aSection, sEnable, Enable);

  ParamSet.Save(aIniFile, aSection + '\' + sSetParams);
  ParamReset.Save(aIniFile, aSection + '\' + sResetParams)
end;

procedure TEvent.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TEvent.SetEnable(const Value: Boolean);
begin
  FEnable := Value;
end;

procedure TEvent.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TEvent.SetObjectName(const Value: string);
begin
  FObjectName := Value;
end;

procedure TEvent.SetSchedule(const Value: TSchedule);
begin
  FSchedule := Value;
end;

procedure TEvent.SetScheduleName(const Value: string);
begin
  FScheduleName := Value;
end;

procedure TEvent.SetState(const Value: TEventState);
begin
  FState := Value;
end;

{ TCustomEventParam }

function TEventParams.Check(aNewValue: Extended): Boolean;
begin
  if Assigned(Script) then
    Result := (Script = 1)
  else
    Result := aNewValue = Value;
end;

constructor TEventParams.Create(aEvent: TEvent);
begin
  FEvent := aEvent;
  Action := eaShowMessage;
end;

procedure TEventParams.DoEvent(aTime: TDateTime);
var
  Handled: boolean;
begin
  Handled := False;
  if Assigned(FOnEvent) then
    FOnEvent(Self, aTime, Handled);

  if Handled then
    Exit;

  case Action of
    eaNone:;
    eaShowMessage:
    begin
//      MessageBox(0, PAnsiChar(Msg), PAnsiChar(FEvent.ObjectName),
//        MB_ICONASTERISK or MB_OK);
//      EventMsgForm.ShowEvent(FEvent.ObjectName, aTime, Msg, Status);
      TEventMsgForm.ShowNewEvent(EventMsgForm, FEvent.ObjectName, aTime, Msg, Status);
    end;
  end;
end;

procedure TEventParams.Load(aIniFile: TCustomIniFile; aSection: string);
begin
  StandingTime := aIniFile.ReadInteger(aSection, sStandingTime, 1) /(24*60*60);
  Value := StrToFloat(aIniFile.ReadString(aSection, sValue, '0'), dotFS);
  ScriptStr := aIniFile.ReadString(aSection, sScript, '');
  Msg := aIniFile.ReadString(aSection, sMsg, '');
  Action := TEventAction(aIniFile.ReadInteger(aSection, sAction, 0));
  Status := TEventStatus(aIniFile.ReadInteger(aSection, sStatus, 0));
end;

procedure TEventParams.Save(aIniFile: TCustomIniFile; aSection: string);
begin
  aIniFile.WriteInteger(aSection, sStandingTime, Trunc(StandingTime *(24*60*60)));
  aIniFile.WriteString(aSection, sValue, FloatToStr(Value, dotFS));
  aIniFile.WriteString(aSection, sScript, ScriptStr);
  aIniFile.WriteString(aSection, sMsg, Msg);
  aIniFile.WriteInteger(aSection, sAction, Ord(Action));
  aIniFile.WriteInteger(aSection, sStatus, Ord(Status));
end;

procedure TEventParams.SetScriptStr(const Value: string);
var
  saveDecimalSeparator: AnsiChar;
begin
  FScriptStr := Value;
  
  if FScriptStr = '' then
    Script := nil
  else
  begin
    saveDecimalSeparator := DecimalSeparator;
    try
      DecimalSeparator := '.';
      if Assigned(FEvent.FEval) then
        Script := FEvent.FEval.Compile(FScriptStr);
    finally
      DecimalSeparator := saveDecimalSeparator;
    end;
  end;
end;

{ TEvents }

procedure TEvents.Add(aEvent: TEvent);
begin
  FList.Add(aEvent);
end;

procedure TEvents.Check(aNewValue: Extended; aTime: TDateTime);
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    Items[i].Check(aNewValue, aTime);
end;

procedure TEvents.Clear;
var
  i: Integer;
begin
  for i := FList.Count - 1 downto 0 do
    Items[i].Free;
  FList.Clear;
end;

constructor TEvents.Create(aEval: TExpressionCompiler);
begin
  FEval := aEval;
  Create;
end;

constructor TEvents.Create;
begin
  FList := TList.Create;
end;

procedure TEvents.Delete(aEvent: TEvent);
begin
  FList.Remove(aEvent);
  aEvent.Free;
end;

destructor TEvents.Destroy;
begin
  Clear;
  FList.Free;

  inherited;
end;

function TEvents.Get(Index: Integer): TEvent;
begin
  Result := TEvent(FList[Index]);
end;

function TEvents.GetCount: integer;
begin
  Result := FList.Count;
end;

procedure TEvents.Load(aIniFile: TCustomIniFile; aSection: string);
var
  sl: TStringList;
  i: Integer;
  aItem: TEvent;
begin
  Clear;
    
  sl := TStringList.Create;
  try
    aIniFile.ReadSectionValues(aSection, sl);
    for i := 0 to sl.Count - 1 do
    begin
      aItem := TEvent.Create(FEval);
      aItem.Name := sl.Names[i];
      aItem.Description := sl.ValueFromIndex[i];
      FList.Add(aItem);
      aItem.Load(aIniFile, aSection + '\' + aItem.Name);
    end;
  finally
    sl.Free;
  end;
end;

procedure TEvents.Reset;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    Items[i].Reset;
end;

procedure TEvents.Save(aIniFile: TCustomIniFile; aSection: string);
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    Items[i].Name := 'E'+IntToStr(i);
    aIniFile.WriteString(aSection, Items[i].Name, Items[i].Description);
    Items[i].Save(aIniFile, aSection + '\' + Items[i].Name);
  end;
end;

//initialization
//  GetLocaleFormatSettings(0, dotFS);
//  dotFS.DecimalSeparator := '.';

end.
