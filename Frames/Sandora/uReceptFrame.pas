unit uReceptFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, aOPCDataObject, aOPCLabel,
  uOPCFrame, aCustomOPCSource, aOPCLookupList, StdCtrls, DrawObjects1,
  DrawObjects2, ExtCtrls,
  uOPCObjects,
  aOPCSource, aOPCShape;

type
  TReceptFrame = class(TaOPCFrame)
    Panel1: TPanel;
    Shape1: TaOPCShape;
    Zadano: TaOPCLabel;
    Proizvedeno: TaOPCLabel;
    Recept: TaOPCLabel;
    lFrom: TaOPCLabel;
    procedure ReceptDblClick(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure UpdateTankStatus(Sender: TObject);
  private
    function GetLookupList: taOPCLookupList;
    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetSensorZadano: TPhysID;
    procedure SetSensorZadano(const Value: TPhysID);
    function  GetSensorProizvedeno: TPhysID;
    procedure SetSensorProizvedeno(const Value: TPhysID);
    function  GetSensorRecept: TPhysID;
    procedure SetSensorRecept(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property ReceptID : TPhysID read GetSensorRecept write SetSensorRecept;
    property ZadanoID : TPhysID read GetSensorZadano write SetSensorZadano;
    property ProizvedenoID : TPhysID read GetSensorProizvedeno write SetSensorProizvedeno;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

{ TSensorFrame }

procedure TReceptFrame.UpdateTankStatus(Sender: TObject);
begin
  try
    Recept.Hint := Recept.Caption + #10 + 'c ' + DateTimeToStr(Recept.Moment);
  except
    on e : Exception do
      OPCLog.WriteToLog('UpdateTankStatus: ' + e.Message);
  end;

end;

function TReceptFrame.GetLookupList: taOPCLookupList;
begin
  Result := Recept.LookupList;
end;

procedure TReceptFrame.SetOPCLookupList(const Value: taOPCLookupList);
begin
  Recept.LookupList := Value;
end;

function TReceptFrame.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := TaCustomMultiOPCSource(Zadano.OPCSource);
end;

procedure TReceptFrame.SetOPCSource(const Value: TaCustomMultiOPCSource);
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

procedure TReceptFrame.ReceptDblClick(Sender: TObject);
var
  ItInd, i : integer;
  cp : TChoiceProductForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
begin
  inherited;
  if (OPCLookupList = nil) or (OPCSource = nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  cp:=TChoiceProductForm.Create(nil);
  cp.Caption := 'Установить рецепт';
  try
    ItInd := Recept.LookupList.Items.IndexOfName(Recept.Value);
    for i := 0 to Recept.LookupList.Items.Count - 1 do
    begin
      cp.ListBox1.Items.Add(Recept.LookupList.Items.ValueFromIndex[i]);
    end;
    cp.ListBox1.ItemIndex := ItInd;
    if cp.ShowModal = mrOk then
    begin
      if cp.rbNow.Checked then
        dt:=0
      else
        dt:=Trunc(cp.dtpDate.DateTime) + frac(cp.dtpTime.DateTime);

      aNewValue := Recept.LookupList.Items.Names[cp.ListBox1.ItemIndex];
      aOPCSource.SetSensorValue(Recept.PhysID, aNewValue, dt);
      if (aNewValue = '0') and (cp.rbNow.Checked) then
      begin
        aOPCSource.SetSensorValue(ZadanoID, '0', 0);
        aOPCSource.SetSensorValue(ProizvedenoID, '0', 0);
      end;
    end;
  finally
    cp.Free;
  end;
end;

procedure TReceptFrame.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
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

      if ObjectName      = 'Задано' then
        ZadanoID       := id
      else if ObjectName = 'Произведено' then
        ProizvedenoID     := id
      else if ObjectName = 'Рецепт' then
        ReceptID          := id
    end;
  end;
  FID := IntToStr(aId);
end;

procedure TReceptFrame.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TReceptFrame.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TReceptFrame.SetID(const Value: TPhysID);
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

      if ObjectName      = 'Задано' then
        ZadanoID       := Data.Strings[0]
      else if ObjectName = 'Произведено' then
        ProizvedenoID     := Data.Strings[0]
      else if ObjectName = 'Рецепт' then
        ReceptID          := Data.Strings[0];
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TReceptFrame.GetSensorZadano: TPhysID;
begin
  Result:=Zadano.PhysID;
end;

procedure TReceptFrame.SetSensorZadano(const Value: TPhysID);
begin
  Zadano.PhysID:=Value;
end;

function TReceptFrame.GetSensorProizvedeno: TPhysID;
begin
  Result:=Proizvedeno.PhysID;
end;

procedure TReceptFrame.SetSensorProizvedeno(const Value: TPhysID);
begin
  Proizvedeno.PhysID:=Value;
end;

function TReceptFrame.GetSensorRecept: TPhysID;
begin
  Result:=Recept.PhysID;
end;

procedure TReceptFrame.SetSensorRecept(const Value: TPhysID);
begin
  Recept.PhysID:=Value;
end;

initialization
  RegisterClasses([TReceptFrame]);
end.
