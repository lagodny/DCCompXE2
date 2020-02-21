unit uIntervalDataFilter;

interface

uses
  system.Classes,
  uOPCInterval,
  uDataFilter,
  IniFiles;

type
  TIntervalDataFilter = class(TCustomDataFilter)
  private
    FInterval: TOPCInterval;
    procedure SetInterval(const Value: TOPCInterval);
    procedure DoChangeInterval(Sender: TObject);
  protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure AssignTo(Dest: TPersistent); override;

    procedure Save(aReg: TCustomIniFile; aSectionName: string); override;
    procedure Load(aReg: TCustomIniFile; aSectionName: string); override;
  published
    property Interval: TOPCInterval read FInterval write SetInterval;
  end;

implementation

{ TIntervalDataFiler }

procedure TIntervalDataFilter.AssignTo(Dest: TPersistent);
var
  aDestFilter: TIntervalDataFilter;
begin
  if Dest = Self then
    Exit;

  if Dest is TIntervalDataFilter then
  begin
    aDestFilter := TIntervalDataFilter(Dest);

    aDestFilter.BeginUpdate;
    try
      aDestFilter.Interval.Assign(Interval);
    finally
      aDestFilter.EndUpdate;
    end;
  end
  else
    inherited;

end;

constructor TIntervalDataFilter.Create;
begin
  FInterval := TOPCInterval.Create;
  FInterval.OnChanged := DoChangeInterval;
end;

destructor TIntervalDataFilter.Destroy;
begin
  FInterval.Free;
  inherited;
end;

procedure TIntervalDataFilter.DoChangeInterval(Sender: TObject);
begin
  DoChanged;
end;

procedure TIntervalDataFilter.Load(aReg: TCustomIniFile; aSectionName: string);
begin
  BeginUpdate;
  try
    inherited;
    Interval.Load(aReg, aSectionName + '/Interval');
  finally
    EndUpdate;
  end;
end;

procedure TIntervalDataFilter.Save(aReg: TCustomIniFile; aSectionName: string);
begin
  inherited;
  Interval.Save(aReg, aSectionName + '/Interval');
end;

procedure TIntervalDataFilter.SetInterval(const Value: TOPCInterval);
begin
  FInterval.Assign(Value);
end;

end.
