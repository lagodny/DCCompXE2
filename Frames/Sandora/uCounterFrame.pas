unit uCounterFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCFrame, aOPCDataObject, aOPCLabel, StdCtrls, ExtCtrls,
  uOPCObjects, aCustomOPCSource, aOPCSource, uStrUtils;

type
  TfrCounter = class(TaOPCFrame)
    Panel: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    I1Caption: TaOPCLabel;
    I2Caption: TaOPCLabel;
    I3Caption: TaOPCLabel;
    U1Caption: TaOPCLabel;
    U2Caption: TaOPCLabel;
    U3Caption: TaOPCLabel;
    PhiCaption: TaOPCLabel;
    FreqCaption: TaOPCLabel;
    PACaption: TaOPCLabel;
    PRCaption: TaOPCLabel;
    I1: TaOPCLabel;
    I3: TaOPCLabel;
    U1: TaOPCLabel;
    U2: TaOPCLabel;
    U3: TaOPCLabel;
    Phi: TaOPCLabel;
    Freq: TaOPCLabel;
    PA: TaOPCLabel;
    PR: TaOPCLabel;
    I2: TaOPCLabel;
    Shape3: TShape;
    QAplusCaption: TaOPCLabel;
    QAplus: TaOPCLabel;
    QAminusCaption: TaOPCLabel;
    QAminus: TaOPCLabel;
    QR1Caption: TaOPCLabel;
    QR1: TaOPCLabel;
    QR2Caption: TaOPCLabel;
    QR2: TaOPCLabel;
    QR3Caption: TaOPCLabel;
    QR3: TaOPCLabel;
    QR4Caption: TaOPCLabel;
    QR4: TaOPCLabel;
    Shape4: TShape;
    Shape5: TShape;
    Place: TaOPCLabel;
    procedure UpdateCounterStatus(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function GetCounterName: string;
    procedure SetCounterName(const Value: string);
    function GetSensorI1: TPhysID;
    procedure SetSensorI1(const Value: TPhysID);
    function GetSensorI2: TPhysID;
    procedure SetSensorI2(const Value: TPhysID);
    function GetSensorI3: TPhysID;
    procedure SetSensorI3(const Value: TPhysID);
    function GetSensorU1: TPhysID;
    procedure SetSensorU1(const Value: TPhysID);
    function GetSensorU2: TPhysID;
    procedure SetSensorU2(const Value: TPhysID);
    function GetSensorU3: TPhysID;
    procedure SetSensorU3(const Value: TPhysID);
    function GetSensorPhi: TPhysID;
    procedure SetSensorPhi(const Value: TPhysID);
    function GetSensorFreq: TPhysID;
    procedure SetSensorFreq(const Value: TPhysID);
    function GetSensorPA: TPhysID;
    procedure SetSensorPA(const Value: TPhysID);
    function GetSensorPR: TPhysID;
    procedure SetSensorPR(const Value: TPhysID);
    function GetSensorQAplus: TPhysID;
    procedure SetSensorQAplus(const Value: TPhysID);
    function GetSensorQAminus: TPhysID;
    procedure SetSensorQAminus(const Value: TPhysID);
    function GetSensorQR1: TPhysID;
    procedure SetSensorQR1(const Value: TPhysID);
    function GetSensorQR2: TPhysID;
    procedure SetSensorQR2(const Value: TPhysID);
    function GetSensorQR3: TPhysID;
    procedure SetSensorQR3(const Value: TPhysID);
    function GetSensorQR4: TPhysID;
    procedure SetSensorQR4(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    { Public declarations }
    procedure LocalInit(aId: integer; aOPCObjects: TOPCObjectList);override;
    constructor Create(AOwner: TComponent); override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property SensorI1 : TPhysID read GetSensorI1 write SetSensorI1;
    property SensorI2 : TPhysID read GetSensorI2 write SetSensorI2;
    property SensorI3 : TPhysID read GetSensorI3 write SetSensorI3;
    property SensorU1 : TPhysID read GetSensorU1 write SetSensorU1;
    property SensorU2 : TPhysID read GetSensorU2 write SetSensorU2;
    property SensorU3 : TPhysID read GetSensorU3 write SetSensorU3;
    property SensorPhi : TPhysID read GetSensorPhi write SetSensorPhi;
    property SensorFreq : TPhysID read GetSensorFreq write SetSensorFreq;
    property SensorPA : TPhysID read GetSensorPA write SetSensorPA;
    property SensorPR : TPhysID read GetSensorPR write SetSensorPR;
    property SensorQAplus : TPhysID read GetSensorQAplus write SetSensorQAplus;
    property SensorQAminus : TPhysID read GetSensorQAminus write SetSensorQAminus;
    property SensorQR1 : TPhysID read GetSensorQR1 write SetSensorQR1;
    property SensorQR2 : TPhysID read GetSensorQR2 write SetSensorQR2;
    property SensorQR3 : TPhysID read GetSensorQR3 write SetSensorQR3;
    property SensorQR4 : TPhysID read GetSensorQR4 write SetSensorQR4;
    property CounterName : string read GetCounterName write SetCounterName;

  end;

var
  frCounter: TfrCounter;

implementation

uses
  aOPCLog;

{$R *.dfm}


procedure TfrCounter.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaOPCLabel then
      TaOPCLabel(Components[i]).OPCSource:=Value
  end;
end;

function TfrCounter.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(I1.OPCSource as TaCustomMultiOPCSource);
end;


constructor TfrCounter.Create(AOwner: TComponent);
begin
  inherited;
//  FfrWidth:=Width;
//  FfrHeigth:=Height;
//  FfrScale:=p;
end;

function TfrCounter.GetSensorI1: TPhysID;
begin
  Result:=I1.PhysID;
end;

procedure TfrCounter.SetSensorI1(const Value: TPhysID);
begin
  I1.PhysID:=Value;
end;

function TfrCounter.GetSensorI2: TPhysID;
begin
  Result:=I2.PhysID;
end;

procedure TfrCounter.SetSensorI2(const Value: TPhysID);
begin
  I2.PhysID:=Value;
end;

function TfrCounter.GetSensorI3: TPhysID;
begin
  Result:=I3.PhysID;
end;

procedure TfrCounter.SetSensorI3(const Value: TPhysID);
begin
  I3.PhysID:=Value;
end;

function TfrCounter.GetSensorU1: TPhysID;
begin
  Result:=U1.PhysID;
end;

procedure TfrCounter.SetSensorU1(const Value: TPhysID);
begin
  U1.PhysID:=Value;
end;

function TfrCounter.GetSensorU2: TPhysID;
begin
  Result:=U2.PhysID;
end;

procedure TfrCounter.SetSensorU2(const Value: TPhysID);
begin
  U2.PhysID:=Value;
end;

function TfrCounter.GetSensorU3: TPhysID;
begin
  Result:=U3.PhysID;
end;

procedure TfrCounter.SetSensorU3(const Value: TPhysID);
begin
  U3.PhysID:=Value;
end;

procedure TfrCounter.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrCounter.Shape1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

function TfrCounter.GetSensorPhi: TPhysID;
begin
  Result:=Phi.PhysID;
end;

procedure TfrCounter.SetSensorPhi(const Value: TPhysID);
begin
  Phi.PhysID:=Value;
end;

function TfrCounter.GetSensorFreq: TPhysID;
begin
  Result:=Freq.PhysID;
end;

procedure TfrCounter.SetSensorFreq(const Value: TPhysID);
begin
  Freq.PhysID:=Value;
end;

function TfrCounter.GetSensorPA: TPhysID;
begin
  Result:=PA.PhysID;
end;

procedure TfrCounter.SetSensorPA(const Value: TPhysID);
begin
  PA.PhysID:=Value;
end;

function TfrCounter.GetSensorPR: TPhysID;
begin
  Result:=PR.PhysID;
end;

procedure TfrCounter.SetSensorPR(const Value: TPhysID);
begin
  PR.PhysID:=Value;
end;

function TfrCounter.GetSensorQAplus: TPhysID;
begin
  Result:=QAplus.PhysID;
end;

procedure TfrCounter.SetSensorQAplus(const Value: TPhysID);
begin
  QAplus.PhysID:=Value;
end;

function TfrCounter.GetSensorQAminus: TPhysID;
begin
  Result:=QAminus.PhysID;
end;

procedure TfrCounter.SetSensorQAminus(const Value: TPhysID);
begin
  QAminus.PhysID:=Value;
end;

function TfrCounter.GetSensorQR1: TPhysID;
begin
  Result:=QR1.PhysID;
end;

procedure TfrCounter.SetSensorQR1(const Value: TPhysID);
begin
  QR1.PhysID:=Value;
end;

function TfrCounter.GetSensorQR2: TPhysID;
begin
  Result:=QR2.PhysID;
end;

procedure TfrCounter.SetSensorQR2(const Value: TPhysID);
begin
  QR2.PhysID:=Value;
end;

function TfrCounter.GetSensorQR3: TPhysID;
begin
  Result:=QR3.PhysID;
end;

procedure TfrCounter.SetSensorQR3(const Value: TPhysID);
begin
  QR3.PhysID:=Value;
end;

function TfrCounter.GetSensorQR4: TPhysID;
begin
  Result:=QR4.PhysID;
end;

procedure TfrCounter.SetSensorQR4(const Value: TPhysID);
begin
  QR4.PhysID:=Value;
end;

function TfrCounter.GetCounterName: string;
begin
  Result:=Place.Caption;
end;

procedure TfrCounter.SetCounterName(const Value: string);
begin
  Place.Caption:=Value;
end;

procedure TfrCounter.UpdateCounterStatus(Sender: TObject);
var
  t1, t2, t3 : integer;
  t1max, t2max, t3max : integer;
begin
  try
    t1 := StrToIntDef(I1.Value,0);
    t1max := 1000;
    if t1<t1max then I1.Color:=clBtnFace
    else I1.Color:=clRed;

    t2 := StrToIntDef(I2.Value,0);
    t2max := 1000;
    if t2<t2max then I2.Color:=clBtnFace
    else I2.Color:=clRed;

    t3 := StrToIntDef(I3.Value,0);
    t3max := 1000;
    if t3<t3max then I3.Color:=clBtnFace
    else I3.Color:=clRed;
{
      if v>vmax then
      begin
        lTemperature.Font.Color:=clRed;
        TempGif.Value := '2';
      end
      else if v<vmin then
        begin
          lTemperature.Font.Color:=clBlue;
          TempGif.Value := '3';
        end
        else
        begin
          lTemperature.Font.Color:=clBlack;
          TempGif.Value := '1';
        end;

    massa := StrToFloatDef(lMassa.Value,0);
    if massa<=50 then
    begin  //меньше 50 кг не учитываем
      lMassa.Font.Color := clGray;
      MassaGif.Value := '0';
    end
    else if (massa<TankMinMassa) then
    begin  //меньше допустимого предела
      lMassa.Font.Color := clMaroon;
      MassaGif.Value := '2';
    end
    else
    begin   //все нормально
      lMassa.Font.Color := clBlack;
      MassaGif.Value := '1';
    end;
}
  except
    on e:Exception do
      OPCLog.WriteToLog('UpdateCounterStatus: '+e.Message);
  end;

end;

procedure TfrCounter.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;
  ObjectName: string;
  id : string;
  i: Integer;
begin

  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;

  CounterName := aOPCObject.Name;
  for i := 0 to aOPCObject.Childs.Count - 1 do
  begin
    if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
    begin
      ObjectName := TOPCObject(aOPCObject.Childs[i]).Name;
      id         := TOPCObject(aOPCObject.Childs[i]).IdStr;

      if ObjectName = 'U1' then
        SensorU1      := id
      else if ObjectName = 'U2' then
        SensorU2      := id
      else if ObjectName = 'U3' then
        SensorU3      := id
      else if ObjectName = 'I1' then
        SensorI1      := id
      else if ObjectName = 'I2' then
        SensorI2      := id
      else if ObjectName = 'I3' then
        SensorI3      := id
      else if ObjectName = 'Частота' then
        SensorFreq    := id
      else if ObjectName = 'Угол сдвига фаз' then
        SensorPhi     := id
      else if ObjectName = 'P активная' then
        SensorPA      := id
      else if ObjectName = 'P реактивная' then
        SensorPR      := id
      else if ObjectName = 'Q активная +' then
        SensorQAplus  := id
      else if ObjectName = 'Q активная -' then
        SensorQAminus := id
      else if ObjectName = 'Q реактивная I' then
        SensorQR1     := id
      else if ObjectName = 'Q реактивная II' then
        SensorQR2     := id
      else if ObjectName = 'Q реактивная III' then
        SensorQR3     := id
      else if ObjectName = 'Q реактивная IV' then
        SensorQR4     := id;
    end;
  end;
  FID := inttostr(aId);

end;

procedure TfrCounter.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;
  ObjectName : string;
//  ObjectKind : string;
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
  aOPCSource.GetNameSpace(StrtoIntDef(Value, 0));
  for i := 0 to aOPCSource.FNameSpaceCash.Count - 1 do
  begin
    CurrStr := GetBufStart(PChar(aOPCSource.FNameSpaceCash[i]), ALevel);
    ObjectName := ExtractData(CurrStr);

    Data := TStringList.Create;
    try
      while CurrStr<>'' do
        Data.Add(ExtractData(CurrStr));

      if FID = Data.Strings[0] then
        CounterName := ObjectName;

      if Data.Strings[1] = '1' then
        Continue; // это не датчик

      if ObjectName = 'U1' then
        SensorU1      := Data.Strings[0]
      else if ObjectName = 'U2' then
        SensorU2      := Data.Strings[0]
      else if ObjectName = 'U3' then
        SensorU3      := Data.Strings[0]
      else if ObjectName = 'I1' then
        SensorI1      := Data.Strings[0]
      else if ObjectName = 'I2' then
        SensorI2      := Data.Strings[0]
      else if ObjectName = 'I3' then
        SensorI3      := Data.Strings[0]
      else if ObjectName = 'Частота' then
        SensorFreq    := Data.Strings[0]
      else if ObjectName = 'Угол сдвига фаз' then
        SensorPhi     := Data.Strings[0]
      else if ObjectName = 'P активная' then
        SensorPA      := Data.Strings[0]
      else if ObjectName = 'P реактивная' then
        SensorPR      := Data.Strings[0]
      else if ObjectName = 'Q активная +' then
        SensorQAplus  := Data.Strings[0]
      else if ObjectName = 'Q активная -' then
        SensorQAminus := Data.Strings[0]
      else if ObjectName = 'Q реактивная I' then
        SensorQR1     := Data.Strings[0]
      else if ObjectName = 'Q реактивная II' then
        SensorQR2     := Data.Strings[0]
      else if ObjectName = 'Q реактивная III' then
        SensorQR3     := Data.Strings[0]
      else if ObjectName = 'Q реактивная IV' then
        SensorQR4     := Data.Strings[0];

    finally
      FreeAndNil(Data);
    end;
  end;
end;

initialization
  RegisterClasses([TfrCounter]);

end.
