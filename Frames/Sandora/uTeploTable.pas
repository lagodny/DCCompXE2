unit uTeploTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, aOPCLabel, aOPCSource,
  aCustomOPCSource, aOPCTCPSource, aOPCDataObject, uOPCFrame, jpeg;

type
  TTeploTable = class(TaOPCFrame)
    Panel1: TPanel;
    Shape1: TShape;
    LTeplo: TaOPCLabel;
    lTeploName: TaOPCLabel;
    procedure LTeploChange(Sender: TObject);
    procedure LTeploDblClick(Sender: TObject);
  private
    { Private declarations }
    F_TeploValue: double;
    F_OldTeploValue: double;
    procedure SetTeploValueID(const Value: TPhysID);
    function GetTeploValueID: TPhysID;
    function  GetTeploName: string;
    procedure SetTeploName(const Value: string);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function  GetOPCSource: TaCustomMultiOPCSource;override;
  public
    { Public declarations }
    constructor Create(aowner:Tcomponent);override;
  published
    property TeploValueID : TPhysID read GetTeploValueID write SetTeploValueID;
    property TeploName : string read GetTeploName write SetTeploName;

end;

implementation

{$R *.dfm}

constructor TTeploTable.Create(aowner:Tcomponent);
begin
  inherited;
  SetTeploValueID(TeploValueID);
  SetTeploName(TeploName);
end;

procedure TTeploTable.LTeploChange(Sender: TObject);
begin
  inherited;
  if TryStrToFloat(LTeplo.Value, F_TeploValue) then
  begin
    F_OldTeploValue := F_TeploValue;
  end
  else LTeplo.Value := FloatToStr(F_OldTeploValue);
end;

procedure TTeploTable.LTeploDblClick(Sender: TObject);
var
  v  : string;
  dt : TDateTime;
begin
  inherited;
  if (OPCSource=nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  v := LTeplo.Value;
  if InputQuery('Укажите новое значение температуры',
    'Укажите новое значение температуры', v) then
  begin
    dt:=0;
    v := StringReplace(v,'.',',',[]);
    TaOPCSource(LTeplo.OPCSource).SetSensorValue(LTeplo.PhysID, v, dt);
  end;
  LTeploChange(Self);
end;

procedure TTeploTable.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  i : integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaOPCLabel then
      TaOPCLabel(Components[i]).OPCSource:=Value
  end;
end;

function TTeploTable.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := (LTeplo.OPCSource as TaCustomMultiOPCSource);
end;

function TTeploTable.GetTeploValueID: TPhysID;
begin
  Result := LTeplo.PhysID;
end;

procedure TTeploTable.SetTeploValueID(const Value: TPhysID);
begin
  LTeplo.PhysID := Value;
  LTeploChange(Self);
end;

function TTeploTable.GetTeploName: string;
begin
  Result:=LTeploName.Caption;
end;

procedure TTeploTable.SetTeploName(const Value: string);
begin
  LTeploName.Caption:=Value;
end;

end.

