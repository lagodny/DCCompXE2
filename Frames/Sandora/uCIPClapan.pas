{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uCIPClapan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCTCPSource,aOPCLookupList,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCShape,
  aOPCLog, aOPCImage2In, aOPCGauge;

type
  TfrCupag1PK = class(TaOPCFrame)
    Panel1: TPanel;
    K11: TaOPCImage2In;
  private
    //FID: TPhysID;
    function  GetImageK11: TPhysID;
    procedure SetImageK11(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);

    function GetK11ID2: TPhysID;
    procedure SetK11ID2(const Value: TPhysID);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
  public
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    //property ID : TPhysID read FID write SetID stored false;
    property K11ID : TPhysID read GetImageK11 write SetImageK11;
    property K11ID2: TPhysID read GetK11ID2  write SetK11ID2;

    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
  end;

implementation

uses
  uStrUtils, uChoice, Math, DateUtils;

{$R *.dfm}

procedure TfrCupag1PK.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
//Устанавливаем компонентам источник данных
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
  end;
end;

function TfrCupag1PK.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(Clapan1.OPCSource as TaCustomMultiOPCSource);
end;

procedure TfrCupag1PK.LocalInit(aId: integer; aOPCObjects: TOPCObjectList);
var
  aOPCObject: TOPCObject;

  procedure Init(aOPCObject:TOPCObject; aRecurcive:boolean = true);
  var
    i : Integer;
    ChildOPCObject: TOPCObject;
    ObjectName: string;
    ParentName: string;
    id : string;
  begin
    for i := 0 to aOPCObject.Childs.Count - 1 do
    begin
      if Assigned(aOPCObject.Childs[i]) and (aOPCObject.Childs[i] is TOPCObject) then
      begin
        ChildOPCObject := TOPCObject(aOPCObject.Childs[i]);

        ParentName := aOPCObject.Name;
        ObjectName := ChildOPCObject.Name;
        id         := ChildOPCObject.IdStr;

        if ParentName = 'Блокировка' then
        begin
          if ObjectName      = 'Alarm 1' then
            ClapanID11           := id
          else if ObjectName = 'Alarm 2' then
            ClapanID21           := id
          else if ObjectName = 'Lock 1' then
            SIID1                := id
          else if ObjectName = 'Lock 2' then
            SIID2                := id
          else if ObjectName = 'Причина Alarm 1' then
            AlarmPID1            := id
          else if ObjectName = 'Причина Alarm 2' then
            AlarmPID2            := id
          else if ObjectName = 'Причина Lock 1' then
            LockPID1             := id
          else if ObjectName = 'Причина Lock 2' then
            LockPID2             := id
          else if ObjectName = 'Причина UnLock 1' then
            UnLockPID1           := id
          else if ObjectName = 'Причина UnLock 2' then
            UnLockPID2           := id
        end
        else if ParentName = 'Контроллер' then
        begin
          if ObjectName = 'Режим работы' then
            StatusID1             := id
          else if ObjectName = 'Люк 1' then
            ClapanID12           := id
          else if ObjectName = 'Люк 2' then
            ClapanID22           := id
          else if ObjectName = 'Блокировка МИ 1, сигнал 1' then
            LampID1              := id
          else if ObjectName = 'Блокировка МИ 2, сигнал 2' then
            LampID2              := id
          else if ObjectName = 'Кнопка Р/А' then
            WorkID               := id
          else if ObjectName = 'Реле PUMP1' then
            PumpID               := id
          else if ObjectName = 'Реле М1' then
            CircID1              := id
          else if ObjectName = 'Реле М2' then
            CircID2              := id
          else if ObjectName = 'Уровень1' then
            Level1ID              := id
          else if ObjectName = 'Уровень2' then
            Level2ID              := id
          else if ObjectName = 'Клапан 1' then
            K1ID                   := id
          else if ObjectName = 'Клапан 2' then
            K2ID                   := id
          else if ObjectName = 'Клапан 3' then
            K3ID                   := id
          else if ObjectName = 'Клапан 4' then
            K4ID                   := id
          else if ObjectName = 'Клапан 5' then
            K5ID                   := id
          else if ObjectName = 'Клапан 6' then
            K6ID                   := id
          else if ObjectName = 'Клапан 7' then
            K7ID                   := id
          else if ObjectName = 'Клапан 8' then
            K8ID                   := id
          else if ObjectName = 'Клапан 9' then
            K9ID                   := id
          else if ObjectName = 'Клапан 10' then
            K10ID                  := id
          else if ObjectName = 'Клапан 11' then
            K11ID                  := id
          else if ObjectName = 'Клапан 12' then
            K12ID                  := id
          else if ObjectName = 'Клапан 13' then
            K13ID                  := id
          else if ObjectName = 'Клапан 14' then
            K14ID                  := id
          else if ObjectName = 'Клапан 15' then
            K15ID                  := id
          else if ObjectName = 'Клапан 16' then
            K16ID                  := id
          else if ObjectName = 'Клапан 17' then
            K17ID                  := id
          else if ObjectName = 'Клапан 18' then
            K18ID                  := id
          else if ObjectName = 'Клапан 19' then
            K19ID                  := id
          else if ObjectName = 'Клапан 20' then
            K20ID                  := id
          else if ObjectName = 'Клапан 21' then
            K21ID                  := id
          else if ObjectName = 'Клапан 22' then
            K22ID                  := id
          else if ((copy(ObjectName, 1, 1) = 'i') and
             (copy(ObjectName, length(ObjectName), 1) = '1')) then
              K23ID                 := id
          else if ((copy(ObjectName, 1, 1) = 'i') and
             (copy(ObjectName, length(ObjectName), 1) = '2')) then
              K24ID                 := id
          else if ((copy(ObjectName, 1, 1) = 'o') and
             (copy(ObjectName, length(ObjectName), 1) = '1')) then
              K23ID2                 := id
          else if ((copy(ObjectName, 1, 1) = 'o') and
             (copy(ObjectName, length(ObjectName), 1) = '2')) then
              K24ID2                 := id;
        end
        else if ParentName = 'Out' then
        begin
          if ObjectName = 'Клапан 1' then
            K1ID2                   := id
          else if ObjectName = 'Клапан 2' then
            K2ID2                   := id
          else if ObjectName = 'Клапан 3' then
            K3ID2                   := id
          else if ObjectName = 'Клапан 4' then
            K4ID2                   := id
          else if ObjectName = 'Клапан 5' then
            K5ID2                   := id
          else if ObjectName = 'Клапан 6' then
            K6ID2                   := id
          else if ObjectName = 'Клапан 7' then
            K7ID2                   := id
          else if ObjectName = 'Клапан 8' then
            K8ID2                   := id
          else if ObjectName = 'Клапан 9' then
            K9ID2                   := id
          else if ObjectName = 'Клапан 10' then
            K10ID2                  := id
          else if ObjectName = 'Клапан 11' then
            K11ID2                  := id
          else if ObjectName = 'Клапан 12' then
            K12ID2                  := id
          else if ObjectName = 'Клапан 13' then
            K13ID2                  := id
          else if ObjectName = 'Клапан 14' then
            K14ID2                  := id
          else if ObjectName = 'Клапан 15' then
            K15ID2                  := id
          else if ObjectName = 'Клапан 16' then
            K16ID2                  := id
          else if ObjectName = 'Клапан 17' then
            K17ID2                  := id
          else if ObjectName = 'Клапан 18' then
            K18ID2                  := id
          else if ObjectName = 'Клапан 19' then
            K19ID2                  := id
          else if ObjectName = 'Клапан 20' then
            K20ID2                  := id
          else if ObjectName = 'Клапан 21' then
            K21ID2                  := id
          else if ObjectName = 'Клапан 22' then
            K22ID2                  := id

          else if ObjectName = 'M1' then
            CircID12                := id
          else if ObjectName = 'M2' then
            CircID22                := id
          else if ObjectName = 'PUMP1' then
            PumpID2                 := id

        end;

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

  lSI := aOPCObject.Name;
  Fon.Value := '1';
  Init(aOPCObject, true);
  // инициализация выполняется без учета зеркальности
//  if FMirror then
//  begin
//    ExchangePhysID(K11,K14);
//    ExchangePhysID(K9,K10);
//    ExchangePhysID(K6,K7);
//    ExchangePhysID(K12,K13);
//    ExchangePhysID(K15,K16);
//    ExchangePhysID(K21,K22);
//    ExchangePhysID2In(Clapan1,Clapan2);
//  end;


  FID := IntToStr(aId);
end;

procedure TfrCupag1PK.LockChange(aTankNo:integer; aLock: TaOPCImage; aLockRef,
  aUnLockRef: TaOPCLabel);
var
  Locked: boolean;
  HasLockReason: boolean;
  HasUnLockReason: boolean;
  aMessage : string;
  LockReason : string;
  UnLockReason: string;
begin
  if (not Assigned(aLock.OPCSource)) or
    not (aLock.OPCSource is TaOPCTCPSource) then
    exit;

  if Assigned(FOnEvent) then
  begin

    LockReason := '';
    UnLockReason := '';
    aMessage := '';

    Locked := (aLock.Value = '1');
    HasLockReason   := (StrToIntDef(aLockRef.Value,0)   <> 0);
    HasUnLockReason := (StrToIntDef(aUnLockRef.Value,0) <> 0);

    if Locked then
    begin
      // сбросим причину снятия блокировки
      ResetReason(aUnLockRef);

      if HasLockReason and Assigned(aLockRef.LookupList) then
      begin
        aLockRef.LookupList.Lookup(aLockRef.Value, LockReason);
        aMessage := 'заблокирована    : ' + LockReason;
      end
      else
        aMessage := 'заблокирована (авто)';
    end
    else
    begin
      // сбросим причину блокировки
      ResetReason(aLockRef);

      if HasUnLockReason and Assigned(aUnLockRef.LookupList) then
      begin
        UnLockP1.LookupList.Lookup(aUnLockRef.Value, UnLockReason);
        aMessage := 'блокировка снята : ' + UnLockReason;
      end
      else
        aMessage := 'блокировка снята (авто)';
    end;
    aLock.Hint := aMessage;

    aMessage := Format('%s : %s.%d %s',
      [FormatDateTime('dd.mm.yyyy hh:mm:ss',aLock.Moment), lSI, aTankNo, aMessage]);

    FOnEvent(aLock,aTankNo,aMessage);
  end;
end;

procedure TfrCupag1PK.SetID(const Value: TPhysID);
var
  aOPCSource: TaOPCSource;
  ALevel, i: Integer;
  CurrStr : string;

  ParentList : TStringList;
  ParentName : string;
  SensorName : string;

  ObjectName : string;
  Data: TStrings;
begin
  if (FID = Value) or
    (not Assigned(OPCSource)) or
    (not (OPCSource is TaOPCSource)) then
    exit;

  ParentList := TStringList.Create;
  try

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
        begin
          lSI := ObjectName;
          Fon.Value := '1';
        end;

        if Data.Strings[1] = '1' then
        begin
          if ALevel >= ParentList.Count then
            ParentList.Add(ObjectName)
          else
            ParentList[ALevel] := ObjectName;
        end
        else
        begin
          // проверим наличие имени родителя требуемого уровня в списке
          if ALevel > ParentList.Count then
          begin
            OPCLog.WriteToLogFmt(
              'TfrCupagTank.SetID: ALevel > ParentList.Count (%d >= %d)',
              [ALevel, ParentList.Count]);
            Continue;
          end;
          // -1 список с нуля, а уровень с единицы
          ParentName    := ParentList.Strings[ALevel - 1];
          SensorName    := ObjectName;
          if ParentName = 'Блокировка' then
          begin
            if SensorName      = 'Alarm 1' then
              ClapanID11           := Data.Strings[0]
            else if SensorName = 'Lock 1' then
              SIID1                := Data.Strings[0]
            else if SensorName = 'Причина Alarm 1' then
              AlarmPID1            := Data.Strings[0]
            else if SensorName = 'Причина Lock 1' then
              LockPID1             := Data.Strings[0]
            else if SensorName = 'Причина UnLock 1' then
              UnLockPID1             := Data.Strings[0]
            else if SensorName = 'Alarm 2' then
              ClapanID21           := Data.Strings[0]
            else if SensorName = 'Lock 2' then
              SIID2                := Data.Strings[0]
            else if SensorName = 'Причина Alarm 2' then
              AlarmPID2            := Data.Strings[0]
            else if SensorName = 'Причина Lock 2' then
              LockPID2             := Data.Strings[0]
            else if SensorName = 'Причина UnLock 2' then
              UnLockPID2             := Data.Strings[0]
          end
          else if ParentName = 'Контроллер' then
          begin
            if SensorName = 'Люк 1' then
              ClapanID12           := Data.Strings[0]
            else if SensorName = 'Люк 2' then
              ClapanID22           := Data.Strings[0]
            else if SensorName = 'Кнопка Р/А' then
              WorkID               := Data.Strings[0]
            else if SensorName = 'Блокировка МИ 1, сигнал 1' then
              LampID1              := Data.Strings[0]
            else if SensorName = 'Блокировка МИ 2, сигнал 2' then
              LampID2              := Data.Strings[0]
            else if SensorName = 'Режим работы' then
              StatusID1            := Data.Strings[0]
            else if SensorName = 'Реле PUMP1' then
              PumpID               := Data.Strings[0]
            else if SensorName = 'Реле М1' then
              CircID1              := Data.Strings[0]
            else if SensorName = 'Реле М2' then
              CircID2              := Data.Strings[0]
            else if SensorName = 'Уровень1' then
              Level1ID             := Data.Strings[0]
            else if SensorName = 'Уровень2' then
              Level2ID             := Data.Strings[0]
            else if SensorName = 'Клапан 1' then
              K1ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 2' then
              K2ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 3' then
              K3ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 4' then
              K4ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 5' then
              K5ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 6' then
              K6ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 7' then
              K7ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 8' then
              K8ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 9' then
              K9ID                   := Data.Strings[0]
            else if SensorName = 'Клапан 10' then
              K10ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 11' then
              K11ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 12' then
              K12ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 13' then
              K13ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 14' then
              K14ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 15' then
              K15ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 16' then
              K16ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 17' then
              K17ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 18' then
              K18ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 19' then
              K19ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 20' then
              K20ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 21' then
              K21ID                  := Data.Strings[0]
            else if SensorName = 'Клапан 22' then
              K22ID                  := Data.Strings[0]
            else if ((copy(SensorName, 1, 1) = 'i') and
               (copy(SensorName, length(SensorName), 1) = '1')) then
                K23ID                 := Data.Strings[0]
            else if ((copy(SensorName, 1, 1) = 'i') and
               (copy(SensorName, length(SensorName), 1) = '2')) then
                K24ID                 := Data.Strings[0]
            else if ((copy(SensorName, 1, 1) = 'o') and
               (copy(SensorName, length(SensorName), 1) = '1')) then
                K23ID2                 := Data.Strings[0]
            else if ((copy(SensorName, 1, 1) = 'o') and
               (copy(SensorName, length(SensorName), 1) = '2')) then
                K24ID2                 := Data.Strings[0];
          end
          else if ParentName = 'Out' then
          begin
            if SensorName = 'Клапан 1' then
              K1ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 2' then
              K2ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 3' then
              K3ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 4' then
              K4ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 5' then
              K5ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 6' then
              K6ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 7' then
              K7ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 8' then
              K8ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 9' then
              K9ID2                   := Data.Strings[0]
            else if SensorName = 'Клапан 10' then
              K10ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 11' then
              K11ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 12' then
              K12ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 13' then
              K13ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 14' then
              K14ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 15' then
              K15ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 16' then
              K16ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 17' then
              K17ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 18' then
              K18ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 19' then
              K19ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 20' then
              K20ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 21' then
              K21ID2                  := Data.Strings[0]
            else if SensorName = 'Клапан 22' then
              K22ID2                  := Data.Strings[0]

            else if ObjectName = 'M1' then
              CircID12                := Data.Strings[0]
            else if ObjectName = 'M2' then
              CircID22                := Data.Strings[0]
            else if ObjectName = 'PUMP1' then
              PumpID2                 := Data.Strings[0]

          end;
        end;

      finally
        FreeAndNil(Data);
      end;
    end;
  finally
    ParentList.Free;
  end;
end;

function TfrCupag1PK.GetOPCImageList: TaOPCImageList;
begin
  Result := SI1.OPCImageList;
end;

procedure TfrCupag1PK.SetImageList(const Value: TaOPCImageList);
begin
  K11.OPCImageList := Value;
end;

procedure TfrCupag1PK.SetK11ID2(const Value: TPhysID);
begin
  K11.PhysID2 := Value;
end;

function TfrCupag1PK.GetK11ID2: TPhysID;
begin
  Result := K11.PhysID2;
end;

procedure TfrCupag1PK.SetImageK11(const Value: TPhysID);
begin
  K11.PhysID := Value;
end;

function TfrCupag1PK.GetImageK11: TPhysID;
begin
  Result := K11.PhysID;
end;

initialization
  RegisterClasses([TfrCupag1PK]);
end.
