{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uAseptic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCLookupList, aOPCGauge,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCProvider, aOPCShape, ComCtrls;


type
  TfrAseptic = class(TaOPCFrame)
    Panel: TPanel;
    lName: TaOPCLabel;
    Shape1: TaOPCShape;
    lPressure: TaOPCBlinkLabel;
    lMaxPressure: TaOPCLabel;
    lMinPressure: TaOPCLabel;
    lProduct: TaOPCLabel;
    Shape3: TaOPCShape;
    Shape2: TaOPCShape;
    lDate: TaOPCLabel;
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure lMaxPressureDblClick(Sender: TObject);
    procedure lProductDblClick(Sender: TObject);
    procedure lDateDblClick(Sender: TObject);
    procedure lMinPressureDblClick(Sender: TObject);
    procedure Changing(Sender: TObject);
  private
    F_Value: double;
    F_OldValue: double;
    F_MaxValue: double;
    F_MinValue: double;
    F_OldMaxValue: double;
    F_OldMinValue: double;
    FfrWidth, FfrHeigth: integer;
    FAseptName : string;
    procedure SetOPCLookupList(const Value: taOPCLookupList);
    function  GetLookupList: taOPCLookupList;
    function  GetAseptName: string;
    procedure SetAseptName(const Value: string);
    function  GetProduct: TPhysID;
    procedure SetProduct(const Value: TPhysID);
    function  GetMaxPressure: TPhysID;
    procedure SetMaxPressure(const Value: TPhysID);
    function  GetMinPressure: TPhysID;
    procedure SetMinPressure(const Value: TPhysID);
    function  GetPressure: TPhysID;
    procedure SetPressure(const Value: TPhysID);
    function  GetLotDate: TPhysID;
    procedure SetLotDate(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
    procedure CheckError(out result:boolean);
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    constructor Create(AOwner: TComponent); override;
    property Value: double read F_Value write F_Value;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupList:taOPCLookupList read GetLookupList write SetOPCLookupList;
    property Product : TPhysID read GetProduct write SetProduct;
    property AseptName : string read GetAseptName write SetAseptName;
    property MaxPressure : TPhysID read GetMaxPressure write SetMaxPressure;
    property MinPressure : TPhysID read GetMinPressure write SetMinPressure;
    property Pressure : TPhysID read GetPressure write SetPressure;
    property LotDate : TPhysID read GetLotDate write SetLotDate;
  end;

implementation

uses
  uStrUtils, uChoiceDate, ChoiceProduct, Math, DateUtils,
  aOPCLog;

{$R *.dfm}

procedure TfrAseptic.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
    else if Components[i] is TaOPCProvider then
      TaOPCProvider(Components[i]).OPCSource := Value;
  end;
end;

procedure TfrAseptic.SetOPCLookupList(const Value: taOPCLookupList);
begin
  lProduct.LookupList := Value;
end;

function TfrAseptic.GetLookupList: taOPCLookupList;
begin
  Result := lProduct.LookupList;
end;

procedure TfrAseptic.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;
  
  procedure Init(aOPCObject:TOPCObject; aRecurcive:boolean = true);
  var
    i: Integer;
    ObjectName: string;
    id : string;
  begin
    for i := 0 to aOPCObject.Childs.Count - 1 do
    begin
      if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
      begin
        ObjectName := TOPCObject(aOPCObject.Childs[i]).Name;
        id         := TOPCObject(aOPCObject.Childs[i]).IdStr;

        if ObjectName      = 'Pmax' then
          MaxPressure       := id
        else if ObjectName = 'Pmin' then
          MinPressure       := id
        else if ObjectName = 'Давление' then
          Pressure          := id
        else if ObjectName = 'Дата партии' then
          LotDate           := id
        else if ObjectName = 'Продукт' then
          Product           := id;

        // отработаем эти же проверки для дочерних элементов, если
        // задан рекурсивный способ проверки
        if aRecurcive and (TOPCObject(aOPCObject.Childs[i]).Childs.Count > 0) then
          Init(TOPCObject(aOPCObject.Childs[i]));
      end;
    end;

  end;
begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  FAseptName := aOPCObject.Name;
  AseptName := Copy(FAseptName, 3, Length(FAseptName)-2);
  Init(aOPCObject, true);
  FID := IntToStr(aId);
end;

constructor TfrAseptic.Create(AOwner: TComponent);
begin
  inherited;
  FfrWidth:=Width;
  FfrHeigth:=Height;
end;

procedure TfrAseptic.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrAseptic.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

function TfrAseptic.GetMaxPressure: TPhysID;
begin
  Result:=lMaxPressure.PhysID;
end;

procedure TfrAseptic.SetMaxPressure(const Value: TPhysID);
begin
  lMaxPressure.PhysID:=Value;
  Changing(Self);
end;

function TfrAseptic.GetMinPressure: TPhysID;
begin
  Result:=lMinPressure.PhysID;
end;

procedure TfrAseptic.SetMinPressure(const Value: TPhysID);
begin
  lMinPressure.PhysID:=Value;
  Changing(Self);
end;

function TfrAseptic.GetPressure: TPhysID;
begin
  Result:=lPressure.PhysID;
end;

procedure TfrAseptic.SetPressure(const Value: TPhysID);
begin
  lPressure.PhysID:=Value;
end;

function TfrAseptic.GetProduct: TPhysID;
begin
  Result:=lProduct.PhysID;
end;

procedure TfrAseptic.SetProduct(const Value: TPhysID);
begin
  lProduct.PhysID:=Value;
end;

function TfrAseptic.GetLotDate: TPhysID;
begin
  Result:=lDate.PhysID;
end;

procedure TfrAseptic.SetLotDate(const Value: TPhysID);
begin
  lDate.PhysID:=Value;
end;

function TfrAseptic.GetAseptName: string;
begin
  Result:=lName.Caption;
end;

procedure TfrAseptic.SetAseptName(const Value: string);
begin
  FAseptName := Value;
  lName.Caption := FAseptName;
end;

procedure TfrAseptic.SetID(const Value: TPhysID);
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

      if FID = Data.Strings[0] then
        AseptName := ObjectName;

      if Data.Strings[1] = '1' then
        Continue; // это не датчик

        if ObjectName      = 'Pmax' then
          MaxPressure       := Data.Strings[0]
        else if ObjectName = 'Pmin' then
          MinPressure       := Data.Strings[0]
        else if ObjectName = 'Давление' then
          Pressure          := Data.Strings[0]
        else if ObjectName = 'Дата партии' then
          LotDate           := Data.Strings[0]
        else if ObjectName = 'Продукт' then
          Product           := Data.Strings[0];
    finally
      FreeAndNil(Data);
    end;
  end;
end;

function TfrAseptic.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(lPressure.OPCSource as TaCustomMultiOPCSource);
end;

procedure TfrAseptic.CheckError(out Result:boolean);
begin

end;

procedure TfrAseptic.lProductDblClick(Sender: TObject);
var
  ItInd, i : integer;
  cp : TChoiceProductForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
begin
  if (OPCLookupList = nil) or (OPCSource = nil) or
    not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  cp:=TChoiceProductForm.Create(nil);
  try
    ItInd := lProduct.LookupList.Items.IndexOfName(lProduct.Value);
    for i := 0 to lProduct.LookupList.Items.Count - 1 do
    begin
      cp.ListBox1.Items.Add(lProduct.LookupList.Items.ValueFromIndex[i]);
    end;
    cp.ListBox1.ItemIndex := ItInd;
    if cp.ShowModal = mrOk then
    begin
      if cp.rbNow.Checked then
        dt:=0
      else
        dt:=Trunc(cp.dtpDate.DateTime) + frac(cp.dtpTime.DateTime);

      aNewValue := lProduct.LookupList.Items.Names[cp.ListBox1.ItemIndex];
      aOPCSource.SetSensorValue(lProduct.PhysID, aNewValue, dt);
      if aNewValue <> '0' then
        aOPCSource.SetSensorValue(lDate.PhysID, FloattoStr(Now), 0)
      else
        aOPCSource.SetSensorValue(lDate.PhysID, '0', 0);
    end;
  finally
    cp.Free;
  end;
end;


procedure TfrAseptic.lDateDblClick(Sender: TObject);
var
  dt : TDateTime;
  cp : TChoiceDateForm;
  aOPCSource : TaOPCSource;
begin
  if (OPCSource=nil) or (lDate.PhysID='')
    or not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  cp:=TChoiceDateForm.Create(nil);
  try
    if cp.ShowModal = mrOk then
    begin
      dt := 0;
      aOPCSource.SetSensorValue(lDate.PhysID, FloattoStr(Trunc(cp.DateTimePicker.Date)), dt);
    end;
  finally
    cp.Free;
  end;
end;

procedure TfrAseptic.lMinPressureDblClick(Sender: TObject);
var
  v : string;
  dt : TDateTime;
begin
  if (OPCSource=nil) or (lMinPressure.PhysID='')
    or not (OPCSource is TaOPCSource) then
    exit;

  v := lMinPressure.Value;
  if InputQuery('Укажите min давление',
    'Укажите минимальное давление, Bar', v) then
  begin
    dt:=0;
    if DecimalSeparator = '.' then v:=StringReplace(v,',','.',[])
    else v:=StringReplace(v,'.',',',[]);
    if StrtoFloat(v) < (-1.62324) then v := '-1.62324';
    TaOPCSource(lMinPressure.OPCSource).SetSensorValue(lMinPressure.PhysID,
      v, dt);
  end;
  Changing(Self);
end;

procedure TfrAseptic.lMaxPressureDblClick(Sender: TObject);
var
  v : string;
  dt : TDateTime;
begin
  if (OPCSource=nil) or (lMaxPressure.PhysID='')
    or not (OPCSource is TaOPCSource) then
    exit;

  v := lMaxPressure.Value;
  if InputQuery('Укажите max давление',
    'Укажите максимальное давление, Bar', v) then
  begin
    dt:=0;
    if DecimalSeparator = '.' then v:=StringReplace(v,',','.',[])
    else v:=StringReplace(v,'.',',',[]);
    if StrtoFloat(v) > (1.78356) then v := '1.78356';
    TaOPCSource(lMaxPressure.OPCSource).SetSensorValue(lMaxPressure.PhysID,
      v, dt);
  end;
  Changing(Self);
end;

procedure TfrAseptic.Changing(Sender: TObject);
var
  Prod : boolean;
  err : integer;
begin
  if (lProduct.Value = '')
    or (lPressure.Value = '')
    or (lMaxPressure.Value = '')
    or (lMinPressure.Value = '')
    then exit;

  try
    lProduct.Hint := lProduct.Caption + #10 + 'c ' + DateTimeToStr(lProduct.Moment);
  except
    on e : Exception do
      OPCLog.WriteToLog('UpdateTankStatus: ' + e.Message);
  end;

  if TryStrToFloat(lPressure.Value, F_Value) then F_OldValue := F_Value
  else lPressure.Value := FloatToStr(F_OldValue);

  if TryStrToFloat(lMinPressure.Value, F_MInValue) then F_OldMInValue := F_MINValue
  else lMinPressure.Value := FloatToStr(F_OldMINValue);

  if TryStrToFloat(lMaxPressure.Value, F_MaxValue) then F_OldMaxValue := F_MAXValue
  else lMaxPressure.Value := FloatToStr(F_OldMAXValue);


  if lProduct.Value = '0' then Prod := false
  else Prod := true;

  if ((F_Value > F_MaxValue) or (F_Value < F_MinValue)) then Err := 1;
  if ((F_Value < F_MaxValue) and (F_Value > F_MinValue)) then Err := 0;

  if (Prod = false) and (Err = 1)
  then begin
    lDate.Visible := false;
    lName.Font.Color := clSkyBlue;
    Shape1.Brush.Color := $00EAF4FF;
    Shape1.Pen.Color := clSilver;
    Shape2.Pen.Color := clSilver;
    Shape3.Pen.Color := clSilver;
    lPressure.Font.Color := clSilver;
  end;

  if (Prod = false) and (Err = 0)
  then begin
    lDate.Visible := false;
    lName.Font.Color := clSkyBlue;
    Shape1.Brush.Color := $00EAF4FF;
    Shape1.Pen.Color := clSilver;
    Shape2.Pen.Color := clSilver;
    Shape3.Pen.Color := clSilver;
    lPressure.Font.Color := clSilver;
  end;

  if (Prod = true) and (Err = 1)
  then begin
    lDate.Visible := true;
    lName.Font.Color := clNavy;
    Shape1.Brush.Color := $00C6E2FF;
    Shape1.Pen.Color := clBlack;
    Shape2.Pen.Color := clBlack;
    Shape3.Pen.Color := clBlack;
    lPressure.Font.Color := clRed;
  end;

  if (Prod = true) and (Err = 0)
  then begin
    lDate.Visible := true;
    lName.Font.Color := clNavy;
    Shape1.Brush.Color := $00C6E2FF;
    Shape1.Pen.Color := clBlack;
    Shape2.Pen.Color := clBlack;
    Shape3.Pen.Color := clBlack;
    lPressure.Font.Color := clGreen;
  end;
end;

initialization
  RegisterClasses([TfrAseptic]);
end.
