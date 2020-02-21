unit uCIPProgramm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, aOPCDataObject, aOPCLabel,
  uOPCFrame, aCustomOPCSource, aOPCLookupList, StdCtrls, DrawObjects1,
  DrawObjects2, ExtCtrls,
  uOPCObjects,
  aOPCSource, aOPCShape;

type
  TCIPProgrammFrame = class(TaOPCFrame)
    Panel1: TPanel;
    Programm: TaOPCLabel;
    aOPCShape: TaOPCShape;
    procedure ProgrammDblClick(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
  private
    function GetLookupList: taOPCLookupList;
    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetSensorProgramm: TPhysID;
    procedure SetSensorProgramm(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property ProgrammID : TPhysID read GetSensorProgramm write SetSensorProgramm;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils, aOPCLog;

{$R *.dfm}

{ TSensorFrame }

function TCIPProgrammFrame.GetLookupList: taOPCLookupList;
begin
  Result := Programm.LookupList;
end;

procedure TCIPProgrammFrame.SetOPCLookupList(const Value: taOPCLookupList);
begin
  Programm.LookupList := Value;
end;

function TCIPProgrammFrame.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(Programm.OPCSource);
end;

procedure TCIPProgrammFrame.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TaCustomOPCDataObject)
//    and (TaCustomOPCDataObject(Components[i]).PhysID <> '')
    then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
  end;
end;

procedure TCIPProgrammFrame.ProgrammDblClick(Sender: TObject);
{
var
  ItInd, i : integer;
  cp : TChoiceProductForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
}
begin
{
  inherited;
  if (OPCLookupList = nil) or (OPCSource = nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  cp:=TChoiceProductForm.Create(nil);
  cp.Caption := 'Установить рецепт';
  try
    ItInd := Programm.LookupList.Items.IndexOfName(Programm.Value);
    for i := 0 to Programm.LookupList.Items.Count - 1 do
    begin
      cp.ListBox1.Items.Add(Programm.LookupList.Items.ValueFromIndex[i]);
    end;
    cp.ListBox1.ItemIndex := ItInd;
    if cp.ShowModal = mrOk then
    begin
      if cp.rbNow.Checked then
        dt:=0
      else
        dt:=Trunc(cp.dtpDate.DateTime) + frac(cp.dtpTime.DateTime);

      aNewValue := Programm.LookupList.Items.Names[cp.ListBox1.ItemIndex];
      aOPCSource.SetSensorValue(Programm.PhysID, aNewValue, dt);
    end;
  finally
    cp.Free;
  end;
}
end;

procedure TCIPProgrammFrame.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;
  ObjectName: string;
  id : string;
  i: Integer;
begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  for i := 0 to aOPCObject.Childs.Count - 1 do
  begin
    if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
    begin
      ObjectName := TOPCObject(aOPCObject.Childs[i]).Name;
      id         := TOPCObject(aOPCObject.Childs[i]).IdStr;

      if ObjectName      = 'Номер объекта мойки' then
        ProgrammID          := id
    end;
  end;
  FID := IntToStr(aId);
end;

procedure TCIPProgrammFrame.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  p := (Sender as TControl).ClientToParent(Point(x,y),Self);
  FMouseDownX := p.X;
  FMouseDownY := p.Y;
  if Assigned(OnMouseDown) then
    OnMouseDown(Self,Button, Shift, FMouseDownX, FMouseDownY);
end;

procedure TCIPProgrammFrame.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TCIPProgrammFrame.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;
  ObjectName : string;
  Data: TStrings;
begin
  if (FID = Value) or
    (not Assigned(OPCSource)) or
    (not (OPCSource is TaOPCSource)) then
    exit;
  aOPCSource := TaOPCSource(OPCSource);
  FID := Value;
  aOPCSource.FNameSpaceCash.Clear;
  aOPCSource.FNameSpaceTimeStamp := 0;
  aOPCSource.GetNameSpace(StrToIntDef(Value,0));
  for i := 0 to aOPCSource.FNameSpaceCash.Count - 1 do
  begin
    CurrStr := GetBufStart(PChar(aOPCSource.FNameSpaceCash[i]), ALevel);
    ObjectName := ExtractData(CurrStr);

    Data := TStringList.Create;
    try
      while CurrStr<>'' do
        Data.Add(ExtractData(CurrStr));

      if Data.Strings[1] = '1' then
        Continue; // это не датчик

      if ObjectName      = 'Номер объекта мойки' then
        ProgrammID          := Data.Strings[0];
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TCIPProgrammFrame.GetSensorProgramm: TPhysID;
begin
  Result:=Programm.PhysID;
end;

procedure TCIPProgrammFrame.SetSensorProgramm(const Value: TPhysID);
begin
  Programm.PhysID:=Value;
end;

initialization
  RegisterClasses([TCIPProgrammFrame]);
end.
