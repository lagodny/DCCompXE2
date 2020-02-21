{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2012 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

{$I OPC.inc}

unit aCustomDCSource;

interface

uses
  Classes, SysUtils, Contnrs, SyncObjs,
  //Graphics, Controls,
  aDCLog, aDCClass,
  uDCObjects;

const
  UnUsedValue = -99999;

type
  TPhysID = type string;
  TaCustomDCSource = class;

  //  TOPCStairsOptions = (soIncrease,soDecrease);
  //  TOPCStairsOptionsSet = set of TOPCStairsOptions;

  TaCustomDataLink = class(TPersistent)
  private
    FID: Integer;
    FPhysID: TPhysID;
    FControl: TObject;
    FDeleted: boolean;
    FUpdateOnChangeMoment: boolean;
    FStairsOptions: TDCStairsOptionsSet;

    FOnUpdateData: TNotifyEvent;
    FOnChangeData: TNotifyEvent;
    FOnChangeDataThreaded: TNotifyEvent;
    FOnRequest: TNotifyEvent;
  protected
    FOldValue: string;
    FValue: string;
    FFloatValue: Double;
    FMoment: TDateTime;
    FErrorCode: integer;
    FErrorString: string;

    procedure AssignTo(Dest: TPersistent); override;

    function GetPhysID: TPhysID; virtual;
    procedure SetPhysID(const aValue: TPhysID); virtual;

    procedure SetValue(const aValue: string); virtual;
    procedure SetFloatValue(const aValue: Double);
    procedure UpdateData; virtual;
    procedure ChangeData; virtual;
    procedure DoChangeDataThreaded; virtual;
  public
    property Control: TObject read FControl write FControl;

    property OldValue: string read FOldValue;
    property Value: string read FValue write SetValue;
    property FloatValue: Double read FFloatValue write SetFloatValue;
    property ID: Integer read FID;
    property PhysID: TPhysID read GetPhysID write SetPhysID;
    property ErrorCode: integer read fErrorCode write fErrorCode;
    property ErrorString: string read fErrorString write fErrorString;
    property Moment: TDateTime read fMoment write fMoment;

    function IsActive: boolean; virtual;

    property Deleted: boolean read FDeleted write FDeleted;
    property StairsOptions: TDCStairsOptionsSet read FStairsOptions write FStairsOptions;
    property UpdateOnChangeMoment: boolean read FUpdateOnChangeMoment write FUpdateOnChangeMoment;

    //при записи в OPC
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
    //при чтении из OPC
    property OnChangeData: TNotifyEvent read FOnChangeData write FOnChangeData;
    //после того, как данные прочитаны (вызывается в потоке)
    property OnChangeDataThreaded: TNotifyEvent read FOnChangeDataThreaded write FOnChangeDataThreaded;
    //после того, как все данные почитаны (вызывается в главном потоке)
    property OnRequest: TNotifyEvent read FOnRequest write FOnRequest;

    constructor Create(aControl: TObject); virtual;
    destructor Destroy; override;

  end;

  TaDCDataLink = class(TaCustomDataLink)
  private
    procedure SetDCSource(const Value: TaCustomDCSource);
  protected
    FRealSource: TaCustomDCSource;
    FOPCSource: TaCustomDCSource;

    procedure SetPhysID(const Value: TPhysID); override;
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(aControl: TObject); override;
    destructor Destroy; override;

    property OPCSource: TaCustomDCSource read FOPCSource write SetDCSource;
    property RealSource: TaCustomDCSource read FRealSource;
  end;

  TDCDataLinkGroup = class
    PhysID: TPhysID;

    OldValue: string;
    Value: string;
    ErrorCode: integer;
    ErrorString: string;

    Moment: TDateTime;

    UpdateOnChangeMoment: boolean;
    NeedUpdate: boolean;

    DataLinks: TList;
    Deleted: boolean;
    StairsOptions: TDCStairsOptionsSet;
    constructor Create;
    destructor Destroy; override;
  end;

  TLookupItem = class
    ID: integer;
      Name: string;
    constructor Create(aID: integer; aName: string);
  end;

  TQStringList = class(TStringList)
  private
    FSortedList: TStringList;
    procedure UpdateSortedList;
  protected
    procedure ListChanged(Sender: TObject);
  public
    function IndexOfName(const Name: string): Integer; override;

    constructor Create;
    destructor Destroy; override;
  end;

  TaCustomDCLookupList = class(TComponent)
  private
    FItems: TStrings;

    procedure SetItems(const Value: TStrings);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Items: TStrings read FItems write SetItems;
  end;

  TaCustomDCSource = class(TComponent)
  private
    FLockUpdate: integer;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FStates: TaCustomDCLookupList;
    procedure SetActive(const Value: boolean); virtual;
    function GetActive: boolean;
    procedure SetStates(const Value: TaCustomDCLookupList);
  protected
    FServerVer: Integer;
    FServerEnableMessage: Boolean;
    FServerSupportingProtocols: string; 

    FActive: boolean;
    FStreamedActive: boolean;
    FDataLinkGroups: TList;
    FDataLinkGroupsLock: TCriticalSection;

    procedure SlToFormatSettings(sl: TStringList);
    function GetOPCName: string; virtual;

    function FindDataLinkGroup(DataLink: TaDCDataLink): TDCDataLinkGroup;
    function FindDataLinkGroups(PhysID: string): TList;

    procedure DoActive; virtual;
    procedure DoNotActive; virtual;
    procedure Loaded; override;
    property DataLinkGroups: TList read FDataLinkGroups;

    procedure AddDataLink(DataLink: TaDCDataLink; OldSource: TaCustomDCSource = nil); virtual;
    procedure RemoveDataLink(DataLink: TaDCDataLink); virtual;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure DoBeginUpdate; virtual;
    procedure DoEndUpdate; virtual;
    function IsLocked: boolean;
  public
    OpcDS: Char;
    OpcFS: TFormatSettings;

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    function IsReal: boolean; virtual;

    procedure BeginUpdate;
    procedure EndUpdate;

    property OPCName: string read GetOPCName;
    property ServerVer: Integer read FServerVer;
  published
    property Active: boolean read GetActive write SetActive default false;
    property States: TaCustomDCLookupList read FStates write SetStates;

    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate; //при записи в OPC
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate; //при записи в OPC
  end;

  TaCustomMultiDCSource = class(TaCustomDCSource)
  private
  protected
    FCurrentMoment: TDateTime;
    function GetCurrentMoment: TDateTime;
    procedure SetCurrentMoment(const Value: TDateTime); virtual;
  public
    property CurrentMoment: TDateTime
      read GetCurrentMoment write SetCurrentMoment;
  end;

  TaCustomSingleDCSource = class(TaCustomDCSource);

  //var
  //  OpcDS:Char;
  //  OpcFS:TFormatSettings;

function CompareDataLinkGroup(Item1, Item2: Pointer): Integer;

implementation

uses
  Math, Windows;

function CompareDataLinkGroup(Item1,
  Item2: Pointer): Integer;
var
  i1, i2: TDCDataLinkGroup;
begin
  if (Item1 = nil) and (Item2 = nil) then
    Result := 0
  else if (Item1 = nil) then
    Result := 1
  else if (Item2 = nil) then
    Result := -1
  else
  begin
    i1 := TDCDataLinkGroup(Item1);
    i2 := TDCDataLinkGroup(Item2);
    if (i1.PhysID = i2.PhysID) then
    begin
      if (i1.UpdateOnChangeMoment = i2.UpdateOnChangeMoment) then
        Result := 0
      else if (i1.UpdateOnChangeMoment < i2.UpdateOnChangeMoment) then
        Result := -1
      else
        Result := 1;
    end
    else if i1.PhysID < i2.PhysID then
      Result := -1
    else
      Result := 1;
  end;
end;

{ TaCustomOPCSource }

procedure TaCustomDCSource.SlToFormatSettings(sl: TStringList);
begin
  with OpcFS do
  begin
    ThousandSeparator := sl[0][1];
    DecimalSeparator := sl[1][1]; // +
    TimeSeparator := sl[2][1]; // +
    ListSeparator := sl[3][1];

    CurrencyString := sl.Strings[4];
    ShortDateFormat := sl.Strings[5];
    LongDateFormat := sl.Strings[6];
    TimeAMString := sl.Strings[7];
    TimePMString := sl.Strings[8];
    ShortTimeFormat := sl.Strings[9];
    LongTimeFormat := sl.Strings[10];

    if sl.Count > 11 then
    begin
      DateSeparator := sl[11][1]; // + действительно необходимые

      if sl.Count > 12 then
        FServerVer := StrToInt(sl[12]);
    end;
  end;

  // версия сервера
  if sl.Count > 12 then
    FServerVer := StrToInt(sl[12]);

end;

procedure TaCustomDCSource.AddDataLink(DataLink: TaDCDataLink;
  OldSource: TaCustomDCSource = nil);
var
  DataLinkGroup: TDCDataLinkGroup;
begin
  DataLinkGroup := FindDataLinkGroup(DataLink);
  if DataLinkGroup = nil then
  begin
    DataLinkGroup := TDCDataLinkGroup.Create;
    DataLinkGroup.PhysID := DataLink.PhysID;
    DataLinkGroup.StairsOptions := DataLink.StairsOptions;
    DataLinkGroup.UpdateOnChangeMoment := DataLink.UpdateOnChangeMoment;
    DataLinkGroups.Add(DataLinkGroup);
  end;

  DataLinkGroup.NeedUpdate := true;
  DataLinkGroup.DataLinks.Add(DataLink);
  DataLink.FOPCSource := Self;
end;

procedure TaCustomDCSource.BeginUpdate;
begin
  DoBeginUpdate;
end;

constructor TaCustomDCSource.Create(aOwner: TComponent);
begin
  inherited;
  FActive := false;
  FDataLinkGroups := TList.Create;
  FDataLinkGroupsLock := TCriticalSection.Create;

  GetLocaleFormatSettings(0, OpcFS);
end;

destructor TaCustomDCSource.Destroy;
var
  i: Integer;
  DataLinkGroup: TDCDataLinkGroup;
begin
  Active := false;

  for i := 0 to FDataLinkGroups.Count - 1 do // Iterate
  begin
    DataLinkGroup := TDCDataLinkGroup(FDataLinkGroups[i]);
    if DataLinkGroup <> nil then
      DataLinkGroup.Free;
  end;
  FDataLinkGroups.Free;
  FDataLinkGroupsLock.Free;

  inherited;
end;

procedure TaCustomDCSource.DoActive;
begin
  if Assigned(FOnActivate) then
    FOnActivate(Self);
end;

procedure TaCustomDCSource.DoBeginUpdate;
begin
  Inc(FLockUpdate);
end;

procedure TaCustomDCSource.DoEndUpdate;
begin
  Dec(FLockUpdate);

end;

procedure TaCustomDCSource.DoNotActive;
begin
  if not (csDestroying in ComponentState) then
  begin
    if Assigned(FOnDeactivate) then
      FOnDeactivate(Self);
  end;
end;

procedure TaCustomDCSource.EndUpdate;
begin
  DoEndUpdate;
end;

function TaCustomDCSource.FindDataLinkGroup(DataLink: TaDCDataLink): TDCDataLinkGroup;
var
  i: integer;
  DataLinkGroup: TDCDataLinkGroup;
begin
  Result := nil;

  // поиск может выполняться в основном потоке приложения
  // необходимо запретить потоку сбора данных Упаковать
  // (уменьшить размер списка) DataLinkGroups
  FDataLinkGroupsLock.Enter;
  try
    for i := 0 to DataLinkGroups.Count - 1 do
    begin
      if i >= DataLinkGroups.Count then
        Exit;

      DataLinkGroup := TDCDataLinkGroup(DataLinkGroups[i]);
      if DataLinkGroup <> nil then
      begin
        if (DataLinkGroup.PhysID = DataLink.PhysID) and
          (DataLinkGroup.UpdateOnChangeMoment = DataLink.UpdateOnChangeMoment) and
          not DataLinkGroup.Deleted then
        begin
          Result := DataLinkGroup;
          exit;
        end;
      end;
    end;
  finally
    FDataLinkGroupsLock.Leave;
  end;
end;

function TaCustomDCSource.FindDataLinkGroups(PhysID: string): TList;
var
  L, H, I, I1: integer;
  Item1: string;
  Sl: TList;
  DLG: TDCDataLinkGroup;
begin
  Result := nil;
  DLG := nil;
  Sl := FDataLinkGroups;

  L := 0;
  H := Sl.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if Sl.Items[i] <> nil then
      Item1 := TDCDataLinkGroup(Sl.Items[i]).PhysID
    else
      Item1 := '';

    if Item1 < PhysID then
      L := I + 1
    else
    begin
      H := I - 1;
      if Item1 = PhysID then
      begin
        DLG := TDCDataLinkGroup(Sl.Items[i]);
        L := I;
      end;
    end;
  end;
  if DLG <> nil then
  begin
    Result := TList.Create;
    Result.Add(DLG);

    // в списке групп может быть две группы с одинаковым PhisID
    // но у первого UpdateOnChangeMoment = false
    // а у второго true
    // мы должны вернуть обоих
    if DLG.UpdateOnChangeMoment then
      i1 := IfThen(i > 0, i - 1, i)
    else
      i1 := IfThen(i < Sl.Count - 1, i + 1, i);

    if (i <> I1) and (Sl.Items[i1] <> nil) and
      (DLG.PhysID = TDCDataLinkGroup(Sl.Items[i1]).PhysID) then
      Result.Add(Sl.Items[i1]);
  end;
end;

function TaCustomDCSource.GetActive: boolean;
begin
  Result := FActive;
end;

function TaCustomDCSource.GetOPCName: string;
begin
  Result := Name;
end;

function TaCustomDCSource.IsLocked: boolean;
begin
  Result := FLockUpdate <> 0;
end;

function TaCustomDCSource.IsReal: boolean;
begin
  Result := false;
end;

procedure TaCustomDCSource.Loaded;
begin
  inherited Loaded;
  if FStreamedActive then
    SetActive(True);
end;

procedure TaCustomDCSource.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FStates) then
    FStates := nil;
end;

procedure TaCustomDCSource.RemoveDataLink(DataLink: TaDCDataLink);
var
  DataLinkGroup: TDCDataLinkGroup;
begin
  DataLink.FOPCSource := nil;

  DataLinkGroup := FindDataLinkGroup(DataLink);
  if DataLinkGroup <> nil then
  begin
    DataLinkGroup.DataLinks.Remove(DataLink);
    if DataLinkGroup.DataLinks.Count = 0 then
    begin
      DataLinkGroups.Remove(DataLinkGroup);
      DataLinkGroup.Free; // здесь можно и удалить
    end;
  end;
end;

procedure TaCustomDCSource.SetActive(const Value: boolean);
begin
  if (csReading in ComponentState) and Value then
    FStreamedActive := Value
  else
  begin
    if Value = GetActive then
      Exit;
    if Value then
      DoActive
    else
      DoNotActive;
  end;
end;

procedure TaCustomDCSource.SetStates(const Value: TaCustomDCLookupList);
begin
  FStates := Value;
end;

{ TaCustomDataLink }

procedure TaCustomDataLink.AssignTo(Dest: TPersistent);
var
  aDest: TaCustomDataLink;
begin
  if not (Dest is TaCustomDataLink) then
    inherited AssignTo(Dest)
  else
  begin
    aDest := TaCustomDataLink(Dest);
    aDest.FPhysID := PhysID;
    aDest.FStairsOptions := StairsOptions;
    aDest.FUpdateOnChangeMoment := UpdateOnChangeMoment;

    //aDest.FOnUpdateData := OnUpdateData;
    //aDest.FOnChangeData := OnChangeData;
    //aDest.OnChangeDataThreaded := OnChangeDataThreaded;
    //aDest.FOnRequest := OnRequest;

    //aDest.FControl := Control;
  end;

end;

procedure TaCustomDataLink.ChangeData;
begin
  if (Control <> nil) and Assigned(FOnChangeData) then
    FOnChangeData(Self);
end;

constructor TaCustomDataLink.Create(aControl: TObject);
begin
  Control := aControl;
  FValue := '';
  fErrorCode := 0;
  fErrorString := '';
  FPhysID := '';
  fMoment := 0;
  FDeleted := false;
  FUpdateOnChangeMoment := false;
  FStairsOptions := [];
  OnUpdateData := nil;
  OnChangeData := nil;
  //  OPCSource := nil;
end;

destructor TaCustomDataLink.Destroy;
begin
  //  OPCSource := nil;
  Control := nil;
  inherited;
end;

procedure TaCustomDataLink.DoChangeDataThreaded;
begin
  if Assigned(OnChangeDataThreaded) then
    OnChangeDataThreaded(Self);
end;

function TaCustomDataLink.GetPhysID: TPhysID;
begin
  Result := FPhysID;
end;

function TaCustomDataLink.IsActive: boolean;
begin
  Result := not ((Value = '0') or (Value = '') or
    (Pos('FALSE', UpperCase(Value)) > 0) or (StrToIntDef(Value, 0) = 0));
end;

procedure TaCustomDataLink.SetFloatValue(const aValue: Double);
begin
  if FFloatValue <> aValue then
  begin
    FFloatValue := aValue;
    FValue := FloatToStr(FFloatValue);
    
    ChangeData;
  end;
end;

procedure TaCustomDataLink.SetPhysID(const aValue: TPhysID);
begin
  FPhysID := aValue;
  FID := StrToIntDef(FPhysID, 0);
end;

procedure TaCustomDataLink.SetValue(const aValue: string);
begin
  if FValue <> aValue then
  begin
    FValue := aValue;
    TryStrToFloat(FValue, FFloatValue);

    ChangeData;
  end;
end;

procedure TaCustomDataLink.UpdateData;
begin
  if (Control <> nil) and Assigned(FOnUpdateData) then
    FOnUpdateData(Self);
end;

procedure TaDCDataLink.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);

  if Dest is TaDCDataLink then
  begin
    //TaOPCDataLink(Dest).OPCSource := OPCSource;
  end;

end;

constructor TaDCDataLink.Create(aControl: TObject);
begin
  inherited Create(aControl);
  OPCSource := nil;
end;

destructor TaDCDataLink.Destroy;
begin
  OPCSource := nil;
  inherited;
end;

procedure TaDCDataLink.SetDCSource(const Value: TaCustomDCSource);
begin
  if FOPCSource <> Value then
  begin
    if FOPCSource <> nil then
      FOPCSource.RemoveDataLink(Self);

    if Value <> nil then
    begin
      if Value.IsReal then
        FRealSource := Value;
      Value.AddDataLink(Self); //, aOldSource);
    end
    else
      FRealSource := Value;

    FOPCSource := Value;
  end;
end;

{ TOPCDataLinkGroup }

constructor TDCDataLinkGroup.Create;
begin
  inherited Create;
  Deleted := false;
  DataLinks := TList.Create;
end;

destructor TDCDataLinkGroup.Destroy;
var
  i: Integer;
  DataLink: TaDCDataLink;
begin
  for i := 0 to DataLinks.Count - 1 do
  begin
    DataLink := TaDCDataLink(DataLinks[i]);
    if DataLink <> nil then
    begin
      DataLink.FOPCSource := nil;
      DataLink.FRealSource := nil;
    end;
  end;
  DataLinks.Free;
  inherited;
end;

procedure TaDCDataLink.SetPhysID(const Value: TPhysID);
var
  aOPCSource: TaCustomDCSource;
begin
  if FPhysID <> Value then
  begin
    aOPCSource := FOPCSource;
    if aOPCSource <> nil then
    begin
      aOPCSource.RemoveDataLink(Self);
      inherited SetPhysID(Value);
      aOPCSource.AddDataLink(self, aOPCSource);
    end
    else
      inherited SetPhysID(Value);

  end;
end;

{ TaCustomMultiOPCSource }

function TaCustomMultiDCSource.GetCurrentMoment: TDateTime;
begin
  Result := FCurrentMoment;
end;

procedure TaCustomMultiDCSource.SetCurrentMoment(const Value: TDateTime);
begin
  FCurrentMoment := Value;
end;

{ TaCustomOPCLookupList }

constructor TaCustomDCLookupList.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TQStringList.Create;
end;

destructor TaCustomDCLookupList.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TaCustomDCLookupList.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

{ TLookupItem }

constructor TLookupItem.Create(aID: integer; aName: string);
begin
  inherited Create;
  ID := aID;
  Name := aName;
end;

{ FQStringList }

constructor TQStringList.Create;
begin
  inherited Create;
  FSortedList := TStringList.Create;
  OnChange := ListChanged;
end;

destructor TQStringList.Destroy;
var
  i: integer;
begin
  for i := 0 to FSortedList.Count - 1 do
    FSortedList.Objects[i].Free;
  FSortedList.Clear;

  FSortedList.Free;
  inherited Destroy;
end;

function TQStringList.IndexOfName(const Name: string): Integer;
begin
  Result := FSortedList.IndexOf(Name);
  if Result >= 0 then
    Result := TLookupItem(FSortedList.Objects[Result]).ID;
end;

procedure TQStringList.ListChanged(Sender: TObject);
begin
  UpdateSortedList;
end;

procedure TQStringList.UpdateSortedList;
var
  i: integer;
  //  tc : cardinal;
begin
  //  tc := GetTickCount;
  for i := 0 to FSortedList.Count - 1 do
    FSortedList.Objects[i].Free;
  FSortedList.Clear;

  for i := 0 to Count - 1 do
  begin
    FSortedList.AddObject(
      Names[i],
      TLookupItem.Create(i, ValueFromIndex[i]));
  end;
  FSortedList.Sort;
  //  OPCLog.WriteToLogFmt('TQStringList.UpdateSortedList: %d', [gettickcount - tc]);
end;

end.

