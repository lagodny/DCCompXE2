unit uDataFilter;

interface

uses
  System.Classes,
  IniFiles;

type
  TCustomDataFilter = class(TPersistent)
  private
    FLockCount: integer;
    FWasChanged: Boolean;
    FOnChanged: TNotifyEvent;
    FSectionName: string;
    procedure SetSectionName(const Value: string);
  protected
    procedure DoChanged;
  public
    constructor Create;

    procedure Save(aReg: TCustomIniFile; aSectionName: string); virtual;
    procedure Load(aReg: TCustomIniFile; aSectionName: string); virtual;

    procedure BeginUpdate;
    procedure EndUpdate;
  published
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
    property SectionName: string read FSectionName write SetSectionName;
  end;


implementation

const
  cDataFilterSectionName = 'DataFilter';

{ TCustomDataFilter }

constructor TCustomDataFilter.Create;
begin
  FSectionName := cDataFilterSectionName;
end;

procedure TCustomDataFilter.DoChanged;
begin
  FWasChanged := True;
  if (FLockCount = 0) and Assigned(FOnChanged) then
  begin
    FWasChanged := False;
    FOnChanged(Self);
  end;
end;

procedure TCustomDataFilter.Load(aReg: TCustomIniFile; aSectionName: string);
begin

end;

procedure TCustomDataFilter.BeginUpdate;
begin
  Inc(FLockCount);
end;

procedure TCustomDataFilter.Save(aReg: TCustomIniFile; aSectionName: string);
begin

end;

procedure TCustomDataFilter.SetSectionName(const Value: string);
begin
  FSectionName := Value;
end;

procedure TCustomDataFilter.EndUpdate;
begin
  Dec(FLockCount);
  if FLockCount <= 0 then
  begin
    FLockCount := 0;
    if FWasChanged then
      DoChanged;
  end;
end;

end.
