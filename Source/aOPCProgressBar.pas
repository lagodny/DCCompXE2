unit aOPCProgressBar;

interface

uses
  SysUtils, Classes, Controls, ComCtrls, aCustomOPCSource,
  uDCObjects;

type
  TaOPCProgressBar = class(TProgressBar)
  private
    fDataLink: TAOPCDataLink;

    procedure ChangeData(Sender:TObject);

    function GetErrorCode: integer;
    function GetErrorString: string;
    function GetPhysID: TPhysID;
    function GetValue: string;
    function GetOPCSource: TaCustomOPCSource;
    procedure SetPhysID(const Value: TPhysID);
    procedure SetValue(const Value: string);
    procedure SetOPCSource(const Value: TaCustomOPCSource);
    function GetStairsOptions: TDCStairsOptionsSet;
    procedure SetStairsOptions(const Value: TDCStairsOptionsSet);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(aOwner : TComponent);override;
    destructor Destroy; override;
  published
    property OPCSource : TaCustomOPCSource read GetOPCSource write SetOPCSource;
    property StairsOptions : TDCStairsOptionsSet
      read GetStairsOptions write SetStairsOptions default [soIncrease,soDecrease];
    property Value : string read GetValue write SetValue;
    property PhysID : TPhysID read GetPhysID write SetPhysID;
    property ErrorCode : integer read GetErrorCode;
    property ErrorString : string read GetErrorString;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DC', [TaOPCProgressBar]);
end;

{ TaOPCProgressBar }

constructor TaOPCProgressBar.Create(aOwner: TComponent);
begin
  inherited;
  fDataLink := TAOPCDataLink.Create(Self);
  fDataLink.OnChangeData := ChangeData;
  fDataLink.StairsOptions := [soIncrease,soDecrease];
end;

destructor TaOPCProgressBar.Destroy;
begin
  OPCSource := nil;
  fDataLink.Free;

  inherited;
end;

function TaOPCProgressBar.GetErrorCode: integer;
begin
  Result := fDataLink.ErrorCode;

end;

function TaOPCProgressBar.GetErrorString: string;
begin
  Result := fDataLink.ErrorString;

end;

function TaOPCProgressBar.GetPhysID: TPhysID;
begin
  Result := fDataLink.PhysID;

end;

function TaOPCProgressBar.GetValue: string;
begin
  Result := fDataLink.Value;

end;

function TaOPCProgressBar.GetOPCSource: TaCustomOPCSource;
begin
  Result := fDataLink.OPCSource;

end;

procedure TaOPCProgressBar.SetPhysID(const Value: TPhysID);
begin
  fDataLink.PhysID := Value;

end;

procedure TaOPCProgressBar.SetValue(const Value: string);
begin

end;

procedure TaOPCProgressBar.SetOPCSource(const Value: TaCustomOPCSource);
begin
  if fDataLink.OPCSource <> Value then
    fDataLink.OPCSource := Value;

end;

procedure TaOPCProgressBar.ChangeData(Sender: TObject);
begin
  if ErrorCode=0 then
    Position := Trunc(StrToFloatDef(Value,0{,OPCFS}))
  else
    Caption:=ErrorString;
end;

function TaOPCProgressBar.GetStairsOptions: TDCStairsOptionsSet;
begin
  Result := fDataLink.StairsOptions;
end;

procedure TaOPCProgressBar.SetStairsOptions(const Value: TDCStairsOptionsSet);
begin
  fDataLink.StairsOptions := Value;
end;

end.
