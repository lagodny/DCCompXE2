unit uShedule;

interface

uses
  Classes, IniFiles;

type
  TSheduleKind = (shkEveryDay, shkDayOfWeek, shkDayOfMonth);

  TTimeInterval = record
    TimeFrom, TimeTo: TDateTime;
  end;

  TTimeArray = array of TTimeInterval;
  TDaysOfWeek = array [1..7] of Boolean;
  TDaysOfMonth = array [1..31] of Boolean;

  TShedule = class
  private
    FKind: TSheduleKind;
    FName: string;
    procedure SetKind(const Value: TSheduleKind);
    
    function ruDayOfWeek(const DateTime: TDateTime): Word;
    function TimeInArray(aTime: TDateTime): Boolean;
    procedure SetName(const Value: string);
  public
    Times: TTimeArray;
    DaysOfWeek: TDaysOfWeek;
    DaysOfMonth: TDaysOfMonth;

    function DateInShedule(aDate: TDateTime): Boolean;

    procedure Clear; 
    procedure Load(aIniFile: TCustomIniFile; aSection: string); virtual;
    procedure Save(aIniFile: TCustomIniFile; aSection: string); virtual;

    property Name: string read FName write SetName;
    property Kind: TSheduleKind read FKind write SetKind;
  end;

  TShedules = class
  private
    FList: TList;
    function Get(Index: Integer): TShedule;
  public
    constructor Create;
    destructor Destroy; override;

    function ItemByName(aName: string): TShedule;

    procedure Clear;
    procedure Load(aIniFile: TCustomIniFile; aSection: string);
    procedure LoadLinked(aIniFile: TCustomIniFile; aSection: string);
    procedure Save(aIniFile: TCustomIniFile; aSection: string);

    property Items[Index: Integer]: TShedule read Get; default;
  end;

implementation

uses
  SysUtils, DateUtils;

const
  sKind = 'Kind';
  sTimes = 'Times';
  sDaysOfWeek = 'DaysOfWeek';
  sDaysOfMonth = 'DaysOfMonth';  

{ TShedule }

procedure TShedule.Clear;
var
  i: Integer;
begin
  Kind := shkEveryDay;
  
  SetLength(Times, 0);

  for i := Low(DaysOfWeek) to High(DaysOfWeek) do
    DaysOfWeek[i] := false;

  for i := Low(DaysOfMonth) to High(DaysOfMonth) do
    DaysOfMonth[i] := false;
end;

function TShedule.DateInShedule(aDate: TDateTime): Boolean;
begin
  Result := False;
  case Kind of
    shkEveryDay:
      Result := TimeInArray(aDate);
    shkDayOfWeek:
      Result := DaysOfWeek[ruDayOfWeek(aDate)] and TimeInArray(aDate);
    shkDayOfMonth:
      Result := DaysOfMonth[DayOfTheMonth(aDate)] and TimeInArray(aDate);
  end;
end;

procedure TShedule.Load(aIniFile: TCustomIniFile; aSection: string);
var
  i: integer;
  sl: TStringList;
begin
  Clear;

  // Kind
  Kind := TSheduleKind(aIniFile.ReadInteger(aSection, sKind, Ord(Kind)));

  sl := TStringList.Create;
  try
    aIniFile.ReadSectionValues(aSection + '\' + sTimes, sl);
    SetLength(Times, sl.Count);
    for i := 0 to sl.Count - 1 do
    begin
      Times[i].TimeFrom := StrToTime(sl.Names[i]);
      Times[i].TimeTo := StrToTime(sl.ValueFromIndex[i]);
    end;

    aIniFile.ReadSectionValues(aSection + '\' + sDaysOfWeek, sl);
    for i := 0 to sl.Count - 1 do
      DaysOfWeek[StrToInt(sl.Names[i])] := true;

    aIniFile.ReadSectionValues(aSection + '\' + sDaysOfMonth, sl);
    for i := 0 to sl.Count - 1 do
      DaysOfMonth[StrToInt(sl.Names[i])] := true;

  finally
    sl.Free;
  end;

  // Times
  for i := Low(Times) to High(Times) do
  begin
    aIniFile.WriteString(aSection + '\' + sTimes,
      FormatDateTime('hh:MM:ss', Times[i].TimeFrom),
      FormatDateTime('hh:MM:ss', Times[i].TimeTo));
  end;

  // DaysOfWeek
  aIniFile.EraseSection(sDaysOfWeek);
  for i := Low(DaysOfWeek) to High(DaysOfWeek) do
  begin
    if DaysOfWeek[i] then
      aIniFile.WriteString(aSection + '\' + sDaysOfWeek,
        IntToStr(i), IntToStr(i));
  end;

  // DaysOfMonth
  aIniFile.EraseSection(sDaysOfMonth);
  for i := Low(DaysOfMonth) to High(DaysOfMonth) do
  begin
    if DaysOfMonth[i] then
      aIniFile.WriteString(aSection + '\' + sDaysOfMonth,
        IntToStr(i), IntToStr(i));
  end;
end;

function TShedule.ruDayOfWeek(const DateTime: TDateTime): Word;
begin
  // день недели по нашему : пн-0, вт-1 ... вс-6
  Result := DayOfWeek(DateTime);
  if Result = 1 then
    Result := 6
  else
    Result := Result - 2;

  // и чтобы начиналось все с 1 (1-пн, 2-вт.... 7-вс)
  Result := Result + 1;
end;

procedure TShedule.Save(aIniFile: TCustomIniFile; aSection: string);
var
  i: integer;
begin
  // Kind
  aIniFile.WriteInteger(aSection, sKind, Ord(Kind));

  // Times
  aIniFile.EraseSection(sTimes);
  for i := Low(Times) to High(Times) do
  begin
    aIniFile.WriteString(aSection + '\' + sTimes,
      FormatDateTime('hh:MM:ss', Times[i].TimeFrom),
      FormatDateTime('hh:MM:ss', Times[i].TimeTo));
  end;

  // DaysOfWeek
  aIniFile.EraseSection(sDaysOfWeek);
  for i := Low(DaysOfWeek) to High(DaysOfWeek) do
  begin
    if DaysOfWeek[i] then
      aIniFile.WriteString(aSection + '\' + sDaysOfWeek,
        IntToStr(i), IntToStr(i));
  end;

  // DaysOfMonth
  aIniFile.EraseSection(sDaysOfMonth);
  for i := Low(DaysOfMonth) to High(DaysOfMonth) do
  begin
    if DaysOfMonth[i] then
      aIniFile.WriteString(aSection + '\' + sDaysOfMonth,
        IntToStr(i), IntToStr(i));
  end;
end;

procedure TShedule.SetKind(const Value: TSheduleKind);
begin
  FKind := Value;
end;

procedure TShedule.SetName(const Value: string);
begin
  FName := Value;
end;

function TShedule.TimeInArray(aTime: TDateTime): Boolean;
var
  i: Integer;
  t: TDateTime;
begin
  // если промежутки не заданы, считаем что доступен весь день
  Result := Length(Times) = 0;
  if Result then
    Exit;
    
  t := Frac(aTime);
  for i := Low(Times) to High(Times) do
  begin
    if (Times[i].TimeFrom <= t) and (t <= Times[i].TimeTo) then
    begin
      Result := true;
      Exit;
    end;
  end;
end;

{ TShedules }

procedure TShedules.Clear;
var
  i: Integer;
begin
  for i := FList.Count - 1 downto 0 do
    Items[i].Free;
  FList.Clear;
end;

constructor TShedules.Create;
begin
  FList := TList.Create;
end;

destructor TShedules.Destroy;
begin
  Clear;
  FList.Free;

  inherited;
end;

function TShedules.Get(Index: Integer): TShedule;
begin
  Result := TShedule(FList[Index]);
end;

function TShedules.ItemByName(aName: string): TShedule;
var
  i: Integer;
begin
  Result := nil;
  if aName = '' then
    Exit;
  
  for i := 0 to FList.Count - 1 do
    if AnsiSameText(Items[i].Name, aName) then
    begin
      Result := Items[i];
      Exit;
    end;
end;

procedure TShedules.Load(aIniFile: TCustomIniFile; aSection: string);
var
  sl: TStringList;
  i: Integer;
  aItem: TShedule;
begin
  Clear;

  sl := TStringList.Create;
  try
    aIniFile.ReadSectionValues(aSection, sl);
    for i := 0 to sl.Count - 1 do
    begin
      aItem := TShedule.Create;
      aItem.Name := sl.Names[i];
      FList.Add(aItem);
      aItem.Load(aIniFile, aSection + '\' + aItem.Name);
    end;
  finally
    sl.Free;
  end;
end;

procedure TShedules.LoadLinked(aIniFile: TCustomIniFile; aSection: string);
var
  sl: TStringList;
  i: Integer;
  aItem: TShedule;
begin
  sl := TStringList.Create;
  try
    aIniFile.ReadSectionValues(aSection, sl);
    for i := 0 to sl.Count - 1 do
    begin
      if not Assigned(ItemByName(sl.Names[i])) then
      begin
        aItem := TShedule.Create;
        aItem.Name := sl.Names[i];
        FList.Add(aItem);
        aItem.Load(aIniFile, aSection + '\' + aItem.Name);
      end;
    end;
  finally
    sl.Free;
  end;
end;

procedure TShedules.Save(aIniFile: TCustomIniFile; aSection: string);
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    aIniFile.WriteString(aSection, Items[i].Name, '');
    Items[i].Save(aIniFile, aSection + '\' + Items[i].Name);
  end;
end;

end.
