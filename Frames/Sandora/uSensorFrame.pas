unit uSensorFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, aOPCDataObject, aOPCLabel,
  uOPCFrame, aCustomOPCSource, aOPCLookupList, StdCtrls;

type
  TSensorFrame = class(TaOPCFrame)
    lName: TLabel;
    lSensorValue: TaOPCLabel;
    lUnit: TLabel;
  private
    function GetSensorPhysID: string;
    procedure SetSensorPhysID(const Value: string);
    function GetLookupList: taOPCLookupList;
    procedure SetOPCLookupList(const Value: taOPCLookupList);
  protected
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
  published
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;

    property SensorPhysID : string read GetSensorPhysID write SetSensorPhysID;

  end;

implementation

{$R *.dfm}

{ TSensorFrame }

function TSensorFrame.GetLookupList: taOPCLookupList;
begin
  Result := lSensorValue.LookupList;
end;

function TSensorFrame.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(lSensorValue.OPCSource);
end;

function TSensorFrame.GetSensorPhysID: string;
begin
  Result := lSensorValue.PhysID;
end;

procedure TSensorFrame.SetOPCLookupList(const Value: taOPCLookupList);
begin
  lSensorValue.LookupList := Value;
end;

procedure TSensorFrame.SetOPCSource(const Value: TaCustomMultiOPCSource);
begin
  lSensorValue.OPCSource := Value;
end;

procedure TSensorFrame.SetSensorPhysID(const Value: string);
begin
  lSensorValue.PhysID := Value;
end;

end.
