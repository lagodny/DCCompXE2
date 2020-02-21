unit uCupagParaFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, aOPCDataObject, aOPCLabel,
  uOPCFrame, aCustomOPCSource, aOPCLookupList, StdCtrls, DrawObjects1,
  DrawObjects2, ExtCtrls,
  uOPCObjects,
  aOPCSource, uCupagPK2Frame, uReceptFrame, aOPCImage, aOPCGauge, jpeg,
  aOPCGifImage, aOPCImageList;

type
  TParaFrame = class(TaOPCFrame)
    Panel1: TPanel;
    Label1: TaOPCLabel;
    frCupag40: TfrCupag;
    frCupag30: TfrCupag;
    ReceptFrame: TReceptFrame;
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure Label1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    function GetLookupListRecept: taOPCLookupList;
    procedure SetOPCLookupListRecept(const Value: taOPCLookupList);
    function GetLookupListProduct: taOPCLookupList;
    procedure SetOPCLookupListProduct(const Value: taOPCLookupList);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);
    function  GetTop: string;
    procedure SetTop(const Value: string);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    constructor Create(AOwner: TComponent); override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property OPCLookupListRecept:taOPCLookupList read GetLookupListRecept write SetOPCLookupListRecept;
    property OPCLookupListProduct:taOPCLookupList read GetLookupListProduct write SetOPCLookupListProduct;
    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property Recept:TReceptFrame read ReceptFrame write ReceptFrame;
    property Cupag40:TfrCupag read frCupag40 write frCupag40;
    property Cupag30:TfrCupag read frCupag30 write frCupag30;
    property TopLabel : string read GetTop write SetTop;
  end;

implementation

uses
  uStrUtils, ChoiceProduct, Math, DateUtils;

{$R *.dfm}

{ TSensorFrame }

function TParaFrame.GetLookupListRecept: taOPCLookupList;
begin
  Result := ReceptFrame.Recept.LookupList;
end;

procedure TParaFrame.SetOPCLookupListRecept(const Value: taOPCLookupList);
begin
  ReceptFrame.Recept.LookupList := Value;
end;

constructor TParaFrame.Create(AOwner: TComponent);
begin
  inherited;
  ReceptFrame.SetSubComponent(true);
  frCupag40.SetSubComponent(true);
  frCupag30.SetSubComponent(true);
end;

function TParaFrame.GetLookupListProduct: taOPCLookupList;
begin
  Result := frCupag40.lProduct.LookupList;
end;

procedure TParaFrame.SetOPCLookupListProduct(const Value: taOPCLookupList);
begin
  frCupag40.lProduct.LookupList := Value;
  frCupag30.lProduct.LookupList := Value;
end;

function TParaFrame.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result := frCupag40.OPCSource;
end;

procedure TParaFrame.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if ((Components[i] is tfrCupag) or
    (Components[i] is tReceptFrame)) then
      TaOPCFrame(Components[i]).OPCSource := Value
  end;
end;


procedure TParaFrame.Label1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TParaFrame.Label1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TParaFrame.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;
  ObjectName: string;
  tmpId : integer;
  i: Integer;
begin
  aOPCObject := aOPCObjects.FindObjectByID(aId);
  if not Assigned(aOPCObject) then
    exit;
  // инициализация рецепта
  ReceptFrame.LocalInit(aId,aOPCObjects);

  for i := 0 to aOPCObject.Childs.Count - 1 do
  begin
    if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
    begin
      ObjectName := TOPCObject(aOPCObject.Childs[i]).Name;
      tmpId        := TOPCObject(aOPCObject.Childs[i]).Id;

      if copy(ObjectName, 1, 3) = 'T40' then
        Cupag40.LocalInit(tmpId,aOPCObjects);
      if copy(ObjectName, 1, 3) = 'T30' then
        Cupag30.LocalInit(tmpId,aOPCObjects);

    end;
  end;
  FID := IntToStr(aId);
  Label1.Caption := 'Купажная пара ' + frCupag40.lTankName.Caption + '-' + frCupag30.lTankName.Caption;
 
end;

procedure TParaFrame.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TParaFrame.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TParaFrame.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;
  ObjectName : string;
  Data: TStrings;
  temp40, temp30 : string;
begin
  if (FID = Value) or
    (not Assigned(OPCSource)) or
    (not (OPCSource is TaOPCSource)) then
    exit;
  aOPCSource := TaOPCSource(OPCSource);
  FID := Value;
  ReceptFrame.ID := FID;
  aOPCSource.FNameSpaceCash.Clear;
  aOPCSource.FNameSpaceTimeStamp := 0;
  aOPCSource.GetNameSpace(StrToIntDef(Value,0));
  temp40 := '';
  temp30 := '';
  for i := 0 to aOPCSource.FNameSpaceCash.Count - 1 do
  begin
    if (temp40<>'') and (temp30<>'') then
       break;

    CurrStr := GetBufStart(PChar(aOPCSource.FNameSpaceCash[i]), ALevel);
    ObjectName := ExtractData(CurrStr);

    Data := TStringList.Create;
    try
      while CurrStr<>'' do
        Data.Add(ExtractData(CurrStr));

      if Data.Strings[1] = '1' then
      begin
        if copy(ObjectName, 1, 3) = 'T40' then
          temp40 := Data.Strings[0];
        if copy(ObjectName, 1, 3) = 'T30' then
          temp30 := Data.Strings[0];
        Continue; // это не датчик
      end;
    finally
      FreeAndNil(Data);
    end;
  end;
  frCupag40.ID := temp40;
  frCupag30.ID := temp30;
  Label1.Caption := 'Купажная пара ' + frCupag40.lTankName.Caption + '-' + frCupag30.lTankName.Caption;
end;

function TParaFrame.GetOPCImageList: TaOPCImageList;
begin
  Result := frCupag40.LevelDown.OPCImageList;
end;

procedure TParaFrame.SetImageList(const Value: TaOPCImageList);
begin
  frCupag40.LevelDown.OPCImageList := Value;
  frCupag40.LevelUp.OPCImageList := Value;
  frCupag40.QualityStop.OPCImageList := Value;
  frCupag40.QualityStart.OPCImageList := Value;
  frCupag40.Service.OPCImageList := Value;
  frCupag40.BlendStop.OPCImageList := Value;
  frCupag40.BlendStart.OPCImageList := Value;
  frCupag40.DrenagStop.OPCImageList := Value;
  frCupag40.DrenagStart.OPCImageList := Value;
  frCupag40.DrenagStopStek.OPCImageList := Value;
  frCupag40.DrenagStartStek.OPCImageList := Value;
  frCupag40.MoykaStart.OPCImageList := Value;
  frCupag40.MoykaStop.OPCImageList := Value;
  frCupag40.Clear.OPCImageList := Value;
  frCupag40.Stiril.OPCImageList := Value;
  frCupag40.ReceptStop.OPCImageList := Value;
  frCupag40.ReceptStart.OPCImageList := Value;
  frCupag40.Tank.OPCImageList := Value;

  frCupag30.LevelDown.OPCImageList := Value;
  frCupag30.LevelUp.OPCImageList := Value;
  frCupag30.QualityStop.OPCImageList := Value;
  frCupag30.QualityStart.OPCImageList := Value;
  frCupag30.Service.OPCImageList := Value;
  frCupag30.BlendStop.OPCImageList := Value;
  frCupag30.BlendStart.OPCImageList := Value;
  frCupag30.DrenagStop.OPCImageList := Value;
  frCupag30.DrenagStart.OPCImageList := Value;
  frCupag30.DrenagStopStek.OPCImageList := Value;
  frCupag30.DrenagStartStek.OPCImageList := Value;
  frCupag30.MoykaStart.OPCImageList := Value;
  frCupag30.MoykaStop.OPCImageList := Value;
  frCupag30.Clear.OPCImageList := Value;
  frCupag30.Stiril.OPCImageList := Value;
  frCupag30.ReceptStop.OPCImageList := Value;
  frCupag30.ReceptStart.OPCImageList := Value;
  frCupag30.Tank.OPCImageList := Value;
end;

function TParaFrame.GetTop: string;
begin
  Result:=Label1.Caption;
end;

procedure TParaFrame.SetTop(const Value: string);
begin
  Label1.Caption := Value;
end;

initialization
  RegisterClasses([TParaFrame]);
end.
