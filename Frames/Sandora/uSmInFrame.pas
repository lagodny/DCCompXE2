{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2007 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit uSmInFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, aOPCLabel, ExtCtrls,
  uOPCObjects,
  aCustomOPCSource,aOPCSource,aOPCTCPSource,aOPCLookupList,
  uOPCFrame, aOPCDataObject, aOPCImage, aOPCGifImage, aOPCImageList, jpeg,
  aOPCShape,
  aOPCLog, aOPCImage2In, aOPCGauge, Menus, aOPCProvider;

type
  TTankGroupEvent = procedure(Sender: TObject; aTankNo: integer; aMessage: string) of object;

  TfrCupag1PK = class(TaOPCFrame)
    Panel1: TPanel;
    lSiName: TaOPCLabel;
    Shape1: TaOPCShape;
    Si1: TaOPCImage;
    LockP1: TaOPCLabel;
    AlarmP1: TaOPCLabel;
    Clapan1: TaOPCImage2In;
    Lamp1: TaOPCGifImage;
    Clapan2: TaOPCImage2In;
    Lamp2: TaOPCGifImage;
    Si2: TaOPCImage;
    LockP2: TaOPCLabel;
    AlarmP2: TaOPCLabel;
    Label1: TLabel;
    Label2: TLabel;
    K2: TaOPCImage2In;
    K1: TaOPCImage2In;
    K3: TaOPCImage2In;
    K4: TaOPCImage2In;
    K5: TaOPCImage2In;
    K8: TaOPCImage2In;
    K13: TaOPCImage2In;
    K12: TaOPCImage2In;
    K23: TaOPCImage2In;
    K21: TaOPCImage2In;
    K22: TaOPCImage2In;
    K24: TaOPCImage2In;
    K20: TaOPCImage2In;
    K7: TaOPCImage2In;
    K14: TaOPCImage2In;
    K9: TaOPCImage2In;
    K16: TaOPCImage2In;
    K15: TaOPCImage2In;
    K19: TaOPCImage2In;
    K18: TaOPCImage2In;
    K17: TaOPCImage2In;
    K6: TaOPCImage2In;
    K10: TaOPCImage2In;
    K11: TaOPCImage2In;
    Status: TaOPCLabel;
    Work: TaOPCImage;
    Fon: TaOPCImage;
    Pump: TaOPCImage2In;
    Circ1: TaOPCImage2In;
    Circ2: TaOPCImage2In;
    gMassa1: TaOPCGauge;
    gMassa2: TaOPCGauge;
    UnLockP1: TaOPCLabel;
    UnLockP2: TaOPCLabel;
    RedLeft: TaOPCImage;
    RedRight: TaOPCImage;
    LimitSensor1: TaOPCImage;
    LimitSensor2: TaOPCImage;
    Ramka: TaOPCImage;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N01: TMenuItem;
    FEnter: TaOPCProvider;
    FStatus: TaOPCProvider;
    WaterLabel: TaOPCLabel;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    DozatorWater: TaOPCImage;
    DozatorSugar: TaOPCImage;
    DozatorConc: TaOPCImage;
    lSugarDoz: TaOPCLabel;
    lConcDoz: TaOPCLabel;
    lWaterDoz: TaOPCLabel;
    procedure gMassa2Change(Sender: TObject);
    procedure gMassa1Change(Sender: TObject);
    procedure Clapan2Click(Sender: TObject);
    procedure Si2Click(Sender: TObject);
    procedure Si1DblClick(Sender: TObject);
    procedure Clapan1DblClick(Sender: TObject);
    procedure Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
    procedure Clapan1Change(Sender: TObject);
    procedure Si1Change(Sender: TObject);
    procedure Si2Change(Sender: TObject);
    procedure K23Change(Sender: TObject);
    procedure K24Change(Sender: TObject);
    procedure Clapan2Change(Sender: TObject);
    procedure StatusChange(Sender: TObject);
    procedure WorkChange(Sender: TObject);
    procedure K18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N01Click(Sender: TObject);
    procedure lSugarDozChange(Sender: TObject);
//    procedure DozatorConcDblClick(Sender: TObject);
  private
    FReadOn, FAnimated : boolean;
    //FID: TPhysID;
    FMirror: boolean;
    FLoadMirror: boolean;
    FOnEvent: TTankGroupEvent;
    FModeLookupList: TaOPCLookupList;
    FRegistryKey: string;

    FResetAlarm1ID: TPhysID;
    FResetAlarm2ID: TPhysID;
    FResetLock1ID: TPhysID;
    FResetLock2ID: TPhysID;
    FSetLock1ID: TPhysID;
    FSetLock2ID: TPhysID;

    function  GetSugarDoz: TPhysID;
    procedure SetSugarDoz(const Value: TPhysID);
    function  GetWaterDoz: TPhysID;
    procedure SetWaterDoz(const Value: TPhysID);
    function  GetConcDoz: TPhysID;
    procedure SetConcDoz(const Value: TPhysID);

    function  GetImageK1: TPhysID;
    procedure SetImageK1(const Value: TPhysID);
    function  GetImageK2: TPhysID;
    procedure SetImageK2(const Value: TPhysID);
    function  GetImageK3: TPhysID;
    procedure SetImageK3(const Value: TPhysID);
    function  GetImageK4: TPhysID;
    procedure SetImageK4(const Value: TPhysID);
    function  GetImageK5: TPhysID;
    procedure SetImageK5(const Value: TPhysID);
    function  GetImageK6: TPhysID;
    procedure SetImageK6(const Value: TPhysID);
    function  GetImageK7: TPhysID;
    procedure SetImageK7(const Value: TPhysID);
    function  GetImageK8: TPhysID;
    procedure SetImageK8(const Value: TPhysID);
    function  GetImageK9: TPhysID;
    procedure SetImageK9(const Value: TPhysID);
    function  GetImageK10: TPhysID;
    procedure SetImageK10(const Value: TPhysID);
    function  GetImageK11: TPhysID;
    procedure SetImageK11(const Value: TPhysID);
    function  GetImageK12: TPhysID;
    procedure SetImageK12(const Value: TPhysID);
    function  GetImageK13: TPhysID;
    procedure SetImageK13(const Value: TPhysID);
    function  GetImageK14: TPhysID;
    procedure SetImageK14(const Value: TPhysID);
    function  GetImageK15: TPhysID;
    procedure SetImageK15(const Value: TPhysID);
    function  GetImageK16: TPhysID;
    procedure SetImageK16(const Value: TPhysID);
    function  GetImageK17: TPhysID;
    procedure SetImageK17(const Value: TPhysID);
    function  GetImageK18: TPhysID;
    procedure SetImageK18(const Value: TPhysID);
    function  GetImageK19: TPhysID;
    procedure SetImageK19(const Value: TPhysID);
    function  GetImageK20: TPhysID;
    procedure SetImageK20(const Value: TPhysID);
    function  GetImageK21: TPhysID;
    procedure SetImageK21(const Value: TPhysID);
    function  GetImageK22: TPhysID;
    procedure SetImageK22(const Value: TPhysID);

    function  GetImageCirc1: TPhysID;
    procedure SetImageCirc1(const Value: TPhysID);
    function  GetImageCirc2: TPhysID;
    procedure SetImageCirc2(const Value: TPhysID);
    function  GetImageFon: string;
    procedure SetImageFon(const Value: string);
    function  GetImageDozatorWater: string;
    procedure SetImageDozatorWater(const Value: string);
    function  GetImageDozatorSugar: string;
    procedure SetImageDozatorSugar(const Value: string);
    function  GetImageDozatorConc: string;
    procedure SetImageDozatorConc(const Value: string);
    function  GetImageRamka: string;
    procedure SetImageRamka(const Value: string);
    function  GetImageWork: TPhysID;
    procedure SetImageWork(const Value: TPhysID);
    function  GetImagePump: TPhysID;
    procedure SetImagePump(const Value: TPhysID);
    function  GetImageClapan11: TPhysID;
    procedure SetImageClapan11(const Value: TPhysID);
    function  GetImageClapan12: TPhysID;
    procedure SetImageClapan12(const Value: TPhysID);
    function  GetImageClapan21: TPhysID;
    procedure SetImageClapan21(const Value: TPhysID);
    function  GetImageClapan22: TPhysID;
    procedure SetImageClapan22(const Value: TPhysID);
    function  GetImageSI1: TPhysID;
    procedure SetImageSI1(const Value: TPhysID);
    function  GetImageSI2: TPhysID;
    procedure SetImageSI2(const Value: TPhysID);
    function  GetImageLamp1: TPhysID;
    procedure SetImageLamp1(const Value: TPhysID);
    function  GetImageLamp2: TPhysID;
    procedure SetImageLamp2(const Value: TPhysID);
    function GetOPCImageList: TaOPCImageList;
    procedure SetImageList(const Value: TaOPCImageList);

    procedure SetLockLookupList(const Value: taOPCLookupList);
    function  GetLockLookupList: TaOPCLookupList;
    function  GetLockP1: TPhysID;
    procedure SetLockP1(const Value: TPhysID);
    function  GetLockP2: TPhysID;
    procedure SetLockP2(const Value: TPhysID);
    function  GetAlarmP1: TPhysID;
    procedure SetAlarmP1(const Value: TPhysID);
    function  GetAlarmP2: TPhysID;
    procedure SetAlarmP2(const Value: TPhysID);
    function  GetlSIName: string;
    procedure SetlSIName(const Value: string);
    function  GetCaptionColor: TColor;
    procedure SetCaptionColor(const Value: TColor);
    function  GetStatus1: TPhysID;
    procedure SetStatus1(const Value: TPhysID);
    function  GetStatus2: TPhysID;
    procedure SetStatus2(const Value: TPhysID);
    function  GetEnter: TPhysID;
    procedure SetEnter(const Value: TPhysID);
    function  GetTankLevel1: TPhysID;
    procedure SetTankLevel1(const Value: TPhysID);
    function  GetTankLevel2: TPhysID;
    procedure SetTankLevel2(const Value: TPhysID);
    function GetUnLockP1: TPhysID;
    function GetUnLockP2: TPhysID;
    procedure SetUnLockP1(const Value: TPhysID);
    procedure SetUnLockP2(const Value: TPhysID);
    function GetUnLookupList: TaOPCLookupList;
    procedure SetUnLockLookupList(const Value: TaOPCLookupList);
    function GetAlarmLookupList: TaOPCLookupList;
    procedure SetAlarmLookupList(const Value: TaOPCLookupList);

    function CheckLockPossibility(aTankNo: integer): boolean;
    function CalcChoiceCaption(aValue, aName: string; Num: string): string;
    function CalcChoicePrompt(aValue, aName: string): string;
    procedure MakeChoice(aRefObject: TaOPCLabel; aSetObject: TaOPCImage;
      aCaption, aPrompt: string; SetLockId, ResetLockId, ResetAlarmId: TPhysID);
      
    procedure LockChange(aTankNo:integer; aLock:TaOPCImage; aLockRef, aUnLockRef: TaOPCLabel);
    procedure AlarmChange(aTankNo:integer; aClapan: TaOPCImage2In; aAlarmRef: TaOPCLabel);
    procedure ResetReason(aReasonControl: TaOPCLabel);
    procedure SetMirror(const Value: boolean);
    function GetImageK23: TPhysID;
    function GetImageK24: TPhysID;
    function GetK10ID2: TPhysID;
    function GetK11ID2: TPhysID;
    function GetK12ID2: TPhysID;
    function GetK13ID2: TPhysID;
    function GetK14ID2: TPhysID;
    function GetK15ID2: TPhysID;
    function GetK16ID2: TPhysID;
    function GetK17ID2: TPhysID;
    function GetK18ID2: TPhysID;
    function GetK19ID2: TPhysID;
    function GetK1ID2: TPhysID;
    function GetK20ID2: TPhysID;
    function GetK21ID2: TPhysID;
    function GetK22ID2: TPhysID;
    function GetK23ID2: TPhysID;
    function GetK24ID2: TPhysID;
    function GetK2ID2: TPhysID;
    function GetK3ID2: TPhysID;
    function GetK4ID2: TPhysID;
    function GetK5ID2: TPhysID;
    function GetK6ID2: TPhysID;
    function GetK7ID2: TPhysID;
    function GetK8ID2: TPhysID;
    function GetK9ID2: TPhysID;
    procedure SetImageK23(const Value: TPhysID);
    procedure SetImageK24(const Value: TPhysID);
    procedure SetK10ID2(const Value: TPhysID);
    procedure SetK11ID2(const Value: TPhysID);
    procedure SetK12ID2(const Value: TPhysID);
    procedure SetK13ID2(const Value: TPhysID);
    procedure SetK14ID2(const Value: TPhysID);
    procedure SetK15ID2(const Value: TPhysID);
    procedure SetK16ID2(const Value: TPhysID);
    procedure SetK17ID2(const Value: TPhysID);
    procedure SetK18ID2(const Value: TPhysID);
    procedure SetK19ID2(const Value: TPhysID);
    procedure SetK1ID2(const Value: TPhysID);
    procedure SetK20ID2(const Value: TPhysID);
    procedure SetK21ID2(const Value: TPhysID);
    procedure SetK22ID2(const Value: TPhysID);
    procedure SetK23ID2(const Value: TPhysID);
    procedure SetK24ID2(const Value: TPhysID);
    procedure SetK2ID2(const Value: TPhysID);
    procedure SetK3ID2(const Value: TPhysID);
    procedure SetK4ID2(const Value: TPhysID);
    procedure SetK5ID2(const Value: TPhysID);
    procedure SetK6ID2(const Value: TPhysID);
    procedure SetK7ID2(const Value: TPhysID);
    procedure SetK8ID2(const Value: TPhysID);
    procedure SetK9ID2(const Value: TPhysID);
    function GetCircID12: TPhysID;
    function GetCircID22: TPhysID;
    function GetPumpID2: TPhysID;
    procedure SetCircID12(const Value: TPhysID);
    procedure SetCircID22(const Value: TPhysID);
    procedure SetPumpID2(const Value: TPhysID);
    function GetLimit1ID: TPhysID;
    function GetLimit2ID: TPhysID;
    procedure SetLimit1ID(const Value: TPhysID);
    procedure SetLimit2ID(const Value: TPhysID);
    procedure SetRegistryKey(const Value: string);
  protected
    procedure SetID(const Value: TPhysID);override;
    procedure SetOPCSource(const Value: TaCustomMultiOPCSource);override;
    function GetOPCSource: TaCustomMultiOPCSource;override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    procedure AnimaChange;
    procedure LocalInit(aId:integer; aOPCObjects:TOPCObjectList);override;
    procedure SetReadOn(const Value: boolean);
    function  GetReadOn: boolean;
    procedure SetAnimated(const Value: boolean);
    function  GetAnimated: boolean;

    property RegistryKey: string read FRegistryKey write SetRegistryKey;
  published
    property OPCSource;//:TaCustomMultiOPCSource read GetOPCSource write SetOPCSource;
    property LockLookupList:TaOPCLookupList read GetLockLookupList write SetLockLookupList;
    property UnLockLookupList:TaOPCLookupList read GetUnLookupList write SetUnLockLookupList;
    property AlarmLookupList:TaOPCLookupList read GetAlarmLookupList write SetAlarmLookupList;
    property ModeLookupList:TaOPCLookupList read FModeLookupList write FModeLookupList;
    property LockPID1 : TPhysID read GetLockP1 write SetLockP1;
    property LockPID2 : TPhysID read GetLockP2 write SetLockP2;
    property UnLockPID1 : TPhysID read GetUnLockP1 write SetUnLockP1;
    property UnLockPID2 : TPhysID read GetUnLockP2 write SetUnLockP2;
    property AlarmPID1 : TPhysID read GetAlarmP1 write SetAlarmP1;
    property AlarmPID2 : TPhysID read GetAlarmP2 write SetAlarmP2;
    property lSI : string read GetlSIName write SetlSIName;
    //property ID : TPhysID read FID write SetID stored false;
    property CaptionColor: TColor read GetCaptionColor write SetCaptionColor;
    property StatusID1 : TPhysID read GetStatus1 write SetStatus1;
    property StatusID2 : TPhysID read GetStatus2 write SetStatus2;
    property EnterID : TPhysID read GetEnter write SetEnter;

    property K1ID  : TPhysID read GetImageK1 write SetImageK1;
    property K2ID  : TPhysID read GetImageK2 write SetImageK2;
    property K3ID  : TPhysID read GetImageK3 write SetImageK3;
    property K4ID  : TPhysID read GetImageK4 write SetImageK4;
    property K5ID  : TPhysID read GetImageK5 write SetImageK5;
    property K6ID  : TPhysID read GetImageK6 write SetImageK6;
    property K7ID  : TPhysID read GetImageK7 write SetImageK7;
    property K8ID  : TPhysID read GetImageK8 write SetImageK8;
    property K9ID  : TPhysID read GetImageK9 write SetImageK9;
    property K10ID : TPhysID read GetImageK10 write SetImageK10;
    property K11ID : TPhysID read GetImageK11 write SetImageK11;
    property K12ID : TPhysID read GetImageK12 write SetImageK12;
    property K13ID : TPhysID read GetImageK13 write SetImageK13;
    property K14ID : TPhysID read GetImageK14 write SetImageK14;
    property K15ID : TPhysID read GetImageK15 write SetImageK15;
    property K16ID : TPhysID read GetImageK16 write SetImageK16;
    property K17ID : TPhysID read GetImageK17 write SetImageK17;
    property K18ID : TPhysID read GetImageK18 write SetImageK18;
    property K19ID : TPhysID read GetImageK19 write SetImageK19;
    property K20ID : TPhysID read GetImageK20 write SetImageK20;
    property K21ID : TPhysID read GetImageK21 write SetImageK21;
    property K22ID : TPhysID read GetImageK22 write SetImageK22;
    property K23ID : TPhysID read GetImageK23 write SetImageK23;
    property K24ID : TPhysID read GetImageK24 write SetImageK24;

    property K1ID2 : TPhysID read GetK1ID2   write SetK1ID2; 
    property K2ID2 : TPhysID read GetK2ID2   write SetK2ID2; 
    property K3ID2 : TPhysID read GetK3ID2   write SetK3ID2; 
    property K4ID2 : TPhysID read GetK4ID2   write SetK4ID2; 
    property K5ID2 : TPhysID read GetK5ID2   write SetK5ID2; 
    property K6ID2 : TPhysID read GetK6ID2   write SetK6ID2; 
    property K7ID2 : TPhysID read GetK7ID2   write SetK7ID2; 
    property K8ID2 : TPhysID read GetK8ID2   write SetK8ID2; 
    property K9ID2 : TPhysID read GetK9ID2   write SetK9ID2;
    property K10ID2: TPhysID read GetK10ID2  write SetK10ID2;
    property K11ID2: TPhysID read GetK11ID2  write SetK11ID2;
    property K12ID2: TPhysID read GetK12ID2  write SetK12ID2;
    property K13ID2: TPhysID read GetK13ID2  write SetK13ID2;
    property K14ID2: TPhysID read GetK14ID2  write SetK14ID2;
    property K15ID2: TPhysID read GetK15ID2  write SetK15ID2;
    property K16ID2: TPhysID read GetK16ID2  write SetK16ID2;
    property K17ID2: TPhysID read GetK17ID2  write SetK17ID2;
    property K18ID2: TPhysID read GetK18ID2  write SetK18ID2;
    property K19ID2: TPhysID read GetK19ID2  write SetK19ID2;
    property K20ID2: TPhysID read GetK20ID2  write SetK20ID2;
    property K21ID2: TPhysID read GetK21ID2  write SetK21ID2;
    property K22ID2: TPhysID read GetK22ID2  write SetK22ID2;
    property K23ID2: TPhysID read GetK23ID2  write SetK23ID2;
    property K24ID2: TPhysID read GetK24ID2  write SetK24ID2;

    property PumpID : TPhysID read GetImagePump write SetImagePump;
    property PumpID2 : TPhysID read GetPumpID2 write SetPumpID2;

    property Level1ID : TPhysID read GetTankLevel1 write SetTankLevel1;
    property Level2ID : TPhysID read GetTankLevel2 write SetTankLevel2;
    property WorkID : TPhysID read GetImageWork write SetImageWork;
    property FonImage : string read GetImageFon write SetImageFon;
    property DozatorWaterImage : string read GetImageDozatorWater write SetImageDozatorWater;
    property DozatorSugarImage : string read GetImageDozatorSugar write SetImageDozatorSugar;
    property DozatorConcImage : string read GetImageDozatorConc write SetImageDozatorConc;
    property RamkaImage : string read GetImageRamka write SetImageRamka;
    property OPCImageList: TaOPCImageList read GetOPCImageList write SetImageList;
    property ClapanID11 : TPhysID read GetImageClapan11 write SetImageClapan11;
    property ClapanID21 : TPhysID read GetImageClapan21 write SetImageClapan21;
    property ClapanID12 : TPhysID read GetImageClapan12 write SetImageClapan12;
    property ClapanID22 : TPhysID read GetImageClapan22 write SetImageClapan22;
    property SIID1 : TPhysID read GetImageSI1 write SetImageSI1;
    property SIID2 : TPhysID read GetImageSI2 write SetImageSI2;
    property LampID1 : TPhysID read GetImageLamp1 write SetImageLamp1;
    property LampID2 : TPhysID read GetImageLamp2 write SetImageLamp2;

    property CircID1  : TPhysID read GetImageCirc1 write SetImageCirc1;
    property CircID12 : TPhysID read GetCircID12 write SetCircID12;
    property CircID2  : TPhysID read GetImageCirc2 write SetImageCirc2;
    property CircID22 : TPhysID read GetCircID22 write SetCircID22;

    property Limit1ID : TPhysID read GetLimit1ID write SetLimit1ID;
    property Limit2ID : TPhysID read GetLimit2ID write SetLimit2ID;

    property ReadOn : boolean read GetReadOn write SetReadOn default false;
    property Animated : boolean read GetAnimated write SetAnimated default false;
    property Mirror : boolean read FMirror write SetMirror default false;

    property OnEvent: TTankGroupEvent read FOnEvent write FOnEvent;

    property SetLockID1  : TPhysID read FSetLock1ID write FSetLock1ID;
    property SetLockID2  : TPhysID read FSetLock2ID write FSetLock2ID;
    property ResetLockID1  : TPhysID read FResetLock1ID write FResetLock1ID;
    property ResetLockID2  : TPhysID read FResetLock2ID write FResetLock2ID;
    property ResetAlarmID1  : TPhysID read FResetAlarm1ID write FResetAlarm1ID;
    property ResetAlarmID2  : TPhysID read FResetAlarm2ID write FResetAlarm2ID;

    property SugarDozID : TPhysID read GetSugarDoz write SetSugarDoz;
    property WaterDozID : TPhysID read GetWaterDoz write SetWaterDoz;
    property ConcDozID : TPhysID read GetConcDoz write SetConcDoz;
  end;

implementation

uses
  uStrUtils, uChoice, Math, DateUtils, DozatorControl,
  uAppStorage;

{$R *.dfm}

  procedure ExchangeHint(aComp1, aComp2: TControl);
  var
    tmpHint : string;
  begin
    tmpHint := aComp1.Hint;
    aComp1.Hint := aComp2.Hint;
    aComp2.Hint := tmpHint;
  end;

  procedure ExchangeValue(aComp1, aComp2: TControl);
  var
    tmpValue: string;
  begin
    if (aComp1 is TaOPCDataObject) and (aComp2 is TaOPCDataObject) then
    begin
      tmpValue := TaOPCDataObject(aComp1).Value;
      TaOPCDataObject(aComp1).Value := TaOPCDataObject(aComp2).Value;
      TaOPCDataObject(aComp2).Value := tmpValue;
    end;
  end;

  procedure ExchangeStates(aComp1, aComp2: TControl);
  var
    tmpStates: TStrings;
  begin
    if (aComp1 is TaOPCImage) and (aComp2 is TaOPCImage) then
    begin
      tmpStates := TStringList.Create;
      try
        tmpStates.Assign(TaOPCImage(aComp1).States);
        TaOPCImage(aComp1).States.Assign(TaOPCImage(aComp2).States);
        TaOPCImage(aComp2).States.Assign(tmpStates);
      finally
        FreeAndNil(tmpStates);
      end;
    end;
  end;

  procedure ExchangePos(aComp1, aComp2: TControl);
  var
    tmpLeft : integer;
  begin
    tmpLeft := aComp1.Left;
    aComp1.Left := aComp2.Left;
    aComp2.Left := tmpLeft;

    if (aComp1 is TaCustomOPCDataObject) and (aComp2 is TaCustomOPCDataObject) then
    begin
      tmpLeft := TaCustomOPCDataObject(aComp1).OriginalLeft;
      TaCustomOPCDataObject(aComp1).OriginalLeft := TaCustomOPCDataObject(aComp2).OriginalLeft;
      TaCustomOPCDataObject(aComp2).OriginalLeft := tmpLeft;
    end;

    ExchangeStates(aComp1, aComp2);
    //ExchangeValue(aComp1, aComp2);
    //ExchangeHint(aComp1,aComp2);
  end;

  procedure ExchangePhysID(aComp1, aComp2: TPhysID);
  var
    tmp : TPhysID;
  begin
    tmp := aComp1;
    aComp1 := aComp2;
    aComp2 := tmp;
//    ExchangeHint(aComp1,aComp2);
  end;

//  procedure ExchangePhysID2In(aComp1, aComp2: TaOPCImage2In);
//  var
//    tmp : TPhysID;
//  begin
//    tmp := aComp1.PhysID2;
//    aComp1.PhysID2 := aComp2.PhysID2;
//    aComp2.PhysID2 := tmp;
//    ExchangePhysID(aComp1,aComp2);
//  end;


function TfrCupag1PK.GetReadOn : boolean;
begin
  Result := FReadOn;
end;

procedure TfrCupag1PK.SetReadOn(const Value: boolean);
begin
  FReadOn := Value;
end;

procedure TfrCupag1PK.SetRegistryKey(const Value: string);
begin
  FRegistryKey := Value;
end;

function TfrCupag1PK.GetAnimated : boolean;
begin
  Result := FAnimated;
end;

procedure TfrCupag1PK.SetAnimated(const Value: boolean);
begin
  FAnimated := Value;
  AnimaChange;
end;

procedure TfrCupag1PK.AlarmChange(aTankNo:integer; aClapan: TaOPCImage2In;
  aAlarmRef: TaOPCLabel);
var
  aMessage : string;
  HasAlarm : boolean;
  AlarmChanged: boolean;
begin
  if (not Assigned(aClapan.OPCSource)) or
    not (aClapan.OPCSource is TaOPCTCPSource) then
    exit;

  HasAlarm := (aClapan.DataLink.Value = '1');
  AlarmChanged := (aClapan.DataLink.Value <> aClapan.DataLink.OldValue) and
    (aClapan.DataLink.Value <> '') and (aClapan.DataLink.OldValue <> '');
    // (aClapan.Value = '10') or (aClapan.Value = '11');

  aClapan.Interactive := HasAlarm;
  if HasAlarm then
    aClapan.Cursor := crHandPoint
  else
    aClapan.Cursor := crDefault;


  if HasAlarm and AlarmChanged then
  begin
    if Assigned(FOnEvent) then
    begin
      aMessage := FormatDateTime('dd.mm.yyyy hh:mm:ss',aClapan.DataLink.Moment) +
        Format(' : %s.%d открытый люк на заблокированной ёмкости',[lSI,aTankNo]);
      
      FOnEvent(aClapan,aTankNo,aMessage);

      // сбросим старую причину возникновения аварии, у нас уже есть новая!
      ResetReason(aAlarmRef);
    end
  end;
end;

procedure TfrCupag1PK.AnimaChange;
begin
  Clapan1.Animate := Animated;
  Clapan2.Animate := Animated;
end;

procedure TfrCupag1PK.SetMirror(const Value: boolean);
var
  s: string;
begin
  if (csReading in ComponentState) then
  begin
    //ShowMessage('Reading '+Name);
    FLoadMirror := Value;
    exit;
  end;

  if FMirror = Value then
    exit;

  //ShowMessage('Set mirror '+Name);
  FMirror := Value;

  ExchangePos(Si1,Si2);
  ExchangePos(Lamp1,Lamp2);
  ExchangePos(Circ1,Circ2);
  ExchangePos(Label1,Label2);
  ExchangePos(gMassa1,gMassa2);
  ExchangePos(RedLeft,RedRight);

  ExchangePos(K11,K14);
  ExchangePos(K9,K10);
  ExchangePos(K6,K7);
  ExchangePos(K12,K13);
  ExchangePos(K15,K16);
  ExchangePos(K21,K22);
  ExchangePos(K23,K24);
  ExchangePos(Clapan1,Clapan2);
  ExchangePos(LimitSensor1,LimitSensor2);

  ExchangePhysID(FSetLock1ID, FSetLock2ID);
  ExchangePhysID(FResetLock1ID, FResetLock2ID);
  ExchangePhysID(FResetAlarm1ID, FResetAlarm2ID);

  s := RedLeft.Value;
  RedLeft.Value := RedRight.Value;
  RedRight.Value := s;

end;

procedure TfrCupag1PK.SetOPCSource(const Value: TaCustomMultiOPCSource);
var
  I: Integer;
begin
//Устанавливаем компонентам источник данных
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TaCustomOPCDataObject then
      TaCustomOPCDataObject(Components[i]).OPCSource := Value
    else if Components[i] is TaOPCProvider then
      TaOPCProvider(Components[i]).OPCSource := Value;
  end;
end;

procedure TfrCupag1PK.SetPumpID2(const Value: TPhysID);
begin
  Pump.PhysID2 := Value;
end;

function TfrCupag1PK.GetOPCSource: TaCustomMultiOPCSource;
begin
  Result:=(Clapan1.OPCSource as TaCustomMultiOPCSource);
end;

function TfrCupag1PK.GetPumpID2: TPhysID;
begin
  Result := Pump.PhysID2;
end;

procedure TfrCupag1PK.SetLimit1ID(const Value: TPhysID);
begin
  LimitSensor1.PhysID := Value;
end;

procedure TfrCupag1PK.SetLimit2ID(const Value: TPhysID);
begin
  LimitSensor2.PhysID := Value;
end;

procedure TfrCupag1PK.SetLockLookupList(const Value: taOPCLookupList);
begin
  LockP1.LookupList := Value;
  LockP2.LookupList := Value;
end;

function TfrCupag1PK.GetLimit1ID: TPhysID;
begin
  Result := LimitSensor1.PhysID;
end;

function TfrCupag1PK.GetLimit2ID: TPhysID;
begin
  Result := LimitSensor2.PhysID;
end;

function TfrCupag1PK.GetLockLookupList: taOPCLookupList;
begin
  Result := LockP1.LookupList;
end;

procedure TfrCupag1PK.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  if ssCtrl in Shift then
  begin
    if Scale = 1 then
    begin
      BringToFront;
      Panel1.BevelKind := bkFlat;
      ScaleBy(2,1);
      Scale := 2;
    end
    else if Scale = 2 then
    begin
      SendToBack;
      Panel1.BevelKind := bkNone;
      ScaleBy(1,2);
      Scale := 1;
    end;

  end;

  p := (Sender as TControl).ClientToParent(Point(x,y),Self);
  FMouseDownX := p.X;
  FMouseDownY := p.Y;
  if Assigned(OnMouseDown) then
    OnMouseDown(Self,Button, Shift, FMouseDownX, FMouseDownY);
end;

procedure TfrCupag1PK.Shape1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  if Assigned(OnStartDrag) then
    OnStartDrag(Self,DragObject);
end;

procedure TfrCupag1PK.Loaded;
begin
  inherited Loaded;
  Mirror := FLoadMirror;
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

        else if ParentName = 'Write' then
        begin
          if ObjectName = 'Reset Alarm 1' then
            FResetAlarm1ID              := id
          else if ObjectName = 'Reset Alarm 2' then
            FResetAlarm2ID              := id
          else if ObjectName = 'Reset Lock 1' then
            FResetLock1ID              := id
          else if ObjectName = 'Reset Lock 2' then
            FResetLock2ID              := id
          else if ObjectName = 'Set Lock 1' then
            FSetLock1ID              := id
          else if ObjectName = 'Set Lock 2' then
            FSetLock2ID              := id
        end


        else if ParentName = 'Уровень' then
        begin
          if ObjectName = 'Уровень1' then
            Level1ID              := id
          else if ObjectName = 'Уровень2' then
            Level2ID              := id
        end
        else if ParentName = 'Вода' then
        begin
          if ObjectName = 'Задано' then
            WaterDozID             := id
        end
        else if ParentName = 'Концентрат' then
        begin
          if ObjectName = 'Задано' then
            ConcDozID             := id
        end
        else if ParentName = 'Сахар' then
        begin
          if ObjectName = 'Задано' then
            SugarDozID             := id
        end
        else if ParentName = 'Контроллер' then
        begin
          if ObjectName = 'Режим работы' then
            StatusID1             := id
          else if ObjectName = 'Режим работы (з)' then
            StatusID2             := id
          else if ObjectName = 'Кнопка Ввод' then
            EnterID             := id
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

          else if ObjectName = 'Предельный датчик 1' then
            Limit1ID               := id
          else if ObjectName = 'Предельный датчик 2' then
            Limit2ID               := id

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
  DozatorWater.Value := '1';
  DozatorSugar.Value := '1';
  DozatorConc.Value := '1';
  Ramka.Value := '0';
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

    if not (((aLock.DataLink.OldValue = '0') and (aLock.DataLink.Value = '1')) or
       ((aLock.DataLink.OldValue = '1') and (aLock.DataLink.Value = '0'))) then
       exit;
       
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

procedure TfrCupag1PK.lSugarDozChange(Sender: TObject);
begin
  inherited;
  (Sender as TaOPCLabel).Hint := (Sender as TaOPCLabel).Hint + ' ' + (Sender as TaOPCLabel).Caption + ' л';
end;

procedure TfrCupag1PK.MakeChoice(aRefObject: TaOPCLabel;
  aSetObject: TaOPCImage; aCaption, aPrompt: string; SetLockId, ResetLockId, ResetAlarmId: TPhysID);
var
  aChoiceForm : TChoiceForm;
  aOPCSource  : TaOPCSource;
begin
  if (aRefObject.LookupList = nil) or (OPCSource = nil)
    or not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  aChoiceForm := CreateChoice(aCaption,aPrompt,aRefObject.LookupList.Items);
  try
    //aChoiceForm.Left   := AppStorage.ReadInteger(aCaption,'Left',aChoiceForm.Left);
    //aChoiceForm.Top    := AppStorage.ReadInteger(aCaption,'Top',aChoiceForm.Top);
    if RegistryKey <> '' then
    begin
      aChoiceForm.Width  := AppStorage(RegistryKey).
        ReadInteger('MakeChoiceForm','Width',aChoiceForm.Width);
      aChoiceForm.Height := AppStorage(RegistryKey).
        ReadInteger('MakeChoiceForm','Height',aChoiceForm.Height);
    end;

    if aChoiceForm.ShowModal = mrOk then
    begin
      // устанавливаем новую причину
      aOPCSource.SetSensorValue(aRefObject.PhysID, aChoiceForm.ComboBox.Text);

      // устанавливаем/сбрасываем блокировку/аварию
      // блокировка
      if (aSetObject.Value = '1')  then       // блокировку сбросить
        aOPCSource.SetSensorValue(ResetLockId, '1')
      else if (aSetObject.Value = '0')  then  // блокировку установить
        aOPCSource.SetSensorValue(SetLockId, '1')
      // тревогу только сбрасываем
      else if (aSetObject.Value = '10') or (aSetObject.Value = '11') then
        aOPCSource.SetSensorValue(ResetAlarmId, '1');

      // сбрасываем причину
      //aOPCSource.SetSensorValue(aRefObject.PhysID, '');
      if RegistryKey <> '' then
      begin
        AppStorage(RegistryKey).
          WriteInteger('MakeChoiceForm','Width',aChoiceForm.Width);
        AppStorage(RegistryKey).
          WriteInteger('MakeChoiceForm','Height',aChoiceForm.Height);
      end;
    end;
  finally
    aChoiceForm.Free;
  end;
end;

procedure TfrCupag1PK.N01Click(Sender: TObject);
begin
  inherited;
  TaOPCSource(FStatus.OPCSource).SetSensorValue(FStatus.PhysID, (Sender as TMenuItem).Caption, 0);
  TaOPCSource(FEnter.OPCSource).SetSensorValue(FEnter.PhysID, '1', 0) ;
end;

procedure TfrCupag1PK.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove)  then
  begin
    if (AComponent = FModeLookupList) then
      FModeLookupList := nil;
  end;
end;

procedure TfrCupag1PK.ResetReason(aReasonControl: TaOPCLabel);
begin
  if Assigned(aReasonControl.OPCSource) then
    if aReasonControl.OPCSource is TaOPCTCPSource then
      TaOPCTCPSource(aReasonControl.OPCSource).SetSensorValue(aReasonControl.PhysID, '');
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
          DozatorWater.Value := '1';
          DozatorSugar.Value := '1';
          DozatorConc.Value := '1';
          Ramka.Value := '0';
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

        else if ParentName = 'Write' then
        begin
          if ObjectName = 'Reset Alarm 1' then
            FResetAlarm1ID              := Data.Strings[0]
          else if ObjectName = 'Reset Alarm 2' then
            FResetAlarm2ID              := Data.Strings[0]
          else if ObjectName = 'Reset Lock 1' then
            FResetLock1ID              := Data.Strings[0]
          else if ObjectName = 'Reset Lock 2' then
            FResetLock2ID              := Data.Strings[0]
          else if ObjectName = 'Set Lock 1' then
            FSetLock1ID              := Data.Strings[0]
          else if ObjectName = 'Set Lock 2' then
            FSetLock2ID              := Data.Strings[0]
        end


          else if ParentName = 'Вода' then
          begin
            if ObjectName = 'Задано' then
              WaterDozID             := Data.Strings[0]
          end
          else if ParentName = 'Концентрат' then
          begin
            if ObjectName = 'Задано' then
              ConcDozID             := Data.Strings[0]
          end
          else if ParentName = 'Сахар' then
          begin
            if ObjectName = 'Задано' then
              SugarDozID             := Data.Strings[0]
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
            else if SensorName = 'Режим работы (з)' then
              StatusID2            := Data.Strings[0]
            else if SensorName = 'Кнопка Ввод' then
              EnterID              := Data.Strings[0]
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

            else if SensorName = 'Предельный датчик 1' then
              Limit1ID               := Data.Strings[0]
            else if SensorName = 'Предельный датчик 2' then
              Limit2ID               := Data.Strings[0]


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

function TfrCupag1PK.GetlSIName: string;
begin
  Result:=lSIName.Caption;
end;

procedure TfrCupag1PK.SetlSIName(const Value: string);
begin
  lSIName.Caption:=Value;
end;

function TfrCupag1PK.GetLockP1: TPhysID;
begin
  Result:=LockP1.PhysID;
end;

procedure TfrCupag1PK.SetLockP1(const Value: TPhysID);
begin
  LockP1.PhysID:=Value;
end;

function TfrCupag1PK.GetLockP2: TPhysID;
begin
  Result:=LockP2.PhysID;
end;

procedure TfrCupag1PK.SetLockP2(const Value: TPhysID);
begin
  LockP2.PhysID:=Value;
end;

function TfrCupag1PK.GetAlarmLookupList: TaOPCLookupList;
begin
  Result := AlarmP1.LookupList;
end;

function TfrCupag1PK.GetAlarmP1: TPhysID;
begin
  Result := AlarmP1.PhysID;
end;

procedure TfrCupag1PK.SetAlarmLookupList(const Value: TaOPCLookupList);
begin
  AlarmP1.LookupList := Value;
  AlarmP2.LookupList := Value;
end;

procedure TfrCupag1PK.SetAlarmP1(const Value: TPhysID);
begin
  AlarmP1.PhysID := Value;
end;

function TfrCupag1PK.GetAlarmP2: TPhysID;
begin
  Result := AlarmP2.PhysID;
end;

procedure TfrCupag1PK.SetAlarmP2(const Value: TPhysID);
begin
  AlarmP2.PhysID := Value;
end;

function TfrCupag1PK.GetStatus1: TPhysID;
begin
  Result:=Status.PhysID;
end;

procedure TfrCupag1PK.SetStatus1(const Value: TPhysID);
begin
  Status.PhysID:=Value;
end;

function TfrCupag1PK.GetStatus2: TPhysID;
begin
  Result:=FStatus.PhysID;
end;

procedure TfrCupag1PK.SetStatus2(const Value: TPhysID);
begin
  FStatus.PhysID:=Value;
end;

function TfrCupag1PK.GetEnter: TPhysID;
begin
  Result:=FEnter.PhysID;
end;

procedure TfrCupag1PK.SetEnter(const Value: TPhysID);
begin
  FEnter.PhysID:=Value;
end;

procedure TfrCupag1PK.Si1Change(Sender: TObject);
begin
  LockChange(1,Si1,LockP1,UnLockP1);
end;

procedure TfrCupag1PK.Si1DblClick(Sender: TObject);
var
  aRefObject: TaOPCLabel;
begin
  if ReadOn then
    exit;

  if Si1.Value = '1' then
    aRefObject := UnLockP1
  else
  begin
    if not CheckLockPossibility(1) then
      exit;
    aRefObject := LockP1;
  end;

  MakeChoice(aRefObject,Si1,
    CalcChoiceCaption(Si1.Value,Si1.Name,'1'),CalcChoicePrompt(Si1.Value,Si1.Name),
    FSetLock1ID, FResetLock1ID, FResetAlarm1ID);
end;

procedure TfrCupag1PK.Si2Change(Sender: TObject);
begin
  LockChange(2,Si2,LockP2,UnLockP2);
end;

procedure TfrCupag1PK.Si2Click(Sender: TObject);
var
  aRefObject: TaOPCLabel;
begin
  if ReadOn then
    exit;

  if Si2.Value = '1' then
    aRefObject := UnLockP2
  else
  begin
    if not CheckLockPossibility(2) then
      exit;
    aRefObject := LockP2;
  end;

  MakeChoice(aRefObject,Si2,
    CalcChoiceCaption(Si2.Value,Si2.Name,'2'),CalcChoicePrompt(Si2.Value,Si2.Name),
    FSetLock2ID, FResetLock2ID, FResetAlarm2ID);
end;

procedure TfrCupag1PK.StatusChange(Sender: TObject);
var
  aModeStr: string;
begin
  if Assigned(ModeLookupList) then
  begin
    aModeStr := '';
    ModeLookupList.Lookup(Status.Value, aModeStr);
    Status.Hint := aModeStr;
  end;
end;

procedure TfrCupag1PK.WorkChange(Sender: TObject);
begin
  if Work.Value = '1' then
    Work.Hint := 'автомат'
  else
    Work.Hint := 'ручной';
end;

function TfrCupag1PK.CalcChoiceCaption(aValue, aName: string; Num: string): string;
begin
  if Copy(aName,1,2) = 'Si' then
  begin
    if aValue = '1' then
      Result := 'Снятие блокировки ёмкости № '+ lSiName.Caption + '.' + Num
    else
      Result := 'Блокировка ёмкости № '+ lSiName.Caption + '.' + Num
  end
  else
  begin
    Result := 'Снятие тревоги. Ёмкость № '+ lSiName.Caption + '.' + Num
  end;
end;

function TfrCupag1PK.CalcChoicePrompt(aValue, aName: string): string;
begin
  if Copy(aName,1,2) = 'Si' then
  begin
    if aValue = '1' then
      Result := 'Укажите причину снятия блокировки'
    else
      Result := 'Укажите причину блокировки';
  end
  else
    Result := 'Укажите причину возникновения тревоги';
end;

function TfrCupag1PK.CheckLockPossibility(aTankNo: integer): boolean;
const
  sK23Opened = 'Открыт клапан К23';
  sK24Opened = 'Открыт клапан К24!';

  sK6Opened = 'Открыт клапан К6';
  sK7Opened = 'Открыт клапан К7';

  sLockImpossible = 'блокировка невозможна!';
  sPrepMode = 'Ёмкости находятся в режиме приготовления';
var
  aMessage: string;
begin
  Result := false;

  // проверяем клапана К23, К24
  if (aTankNo = 1) and (K23.Value <> '00') then
  begin
    MessageDlg(
      Format('%s, %s',[sK23Opened, sLockImpossible]), mtWarning, [mbOk], 0);
    exit;
  end
  else if (aTankNo = 2) and (K24.Value <> '00') then
  begin
    MessageDlg(
      Format('%s, %s',[sK24Opened, sLockImpossible]), mtWarning, [mbOk], 0);
    exit;
  end;

  // проверяем подающие клапана К1, К2, К3
  aMessage := '';
  if k1.Value <> '00' then
    aMessage := 'K1 открыт,'+#13;
  if k2.Value <> '00' then
    aMessage := aMessage + 'K2 открыт,'+#13;
  if k3.Value <> '00' then
    aMessage := aMessage + 'K3 открыт,'+#13;

  if aMessage = '' then
  begin
    Result := true;
    exit;
  end;

  aMessage := Copy(aMessage,1,length(aMessage)-2);

  if (aTankNo = 1) and (K6.Value <> '00') then
  begin
    MessageDlg(
      Format('%s:'#13+
        '%s'#13+
        '%s'#13+
        '%s', [
        sPrepMode,
        aMessage,
        sK6Opened,
        sLockImpossible]), mtWarning, [mbOk], 0);
    exit;
  end
  else if (aTankNo = 2) and (K7.Value <> '00') then
  begin
    MessageDlg(
      Format('%s:'#13+
        '%s'#13+
        '%s'#13+
        '%s', [
        sPrepMode,
        aMessage,
        sK7Opened,
        sLockImpossible]), mtWarning, [mbOk], 0);
    exit;
  end;


  aMessage := aMessage + '!'+#13#13+
    'Всё равно заблокировать емкость?';

  Result := (MessageDlg(aMessage,mtConfirmation,[mbYes,mbNo],0) = mrYes)

end;

procedure TfrCupag1PK.Clapan1Change(Sender: TObject);
begin
  AlarmChange(1,Clapan1,AlarmP1);
end;

procedure TfrCupag1PK.Clapan1DblClick(Sender: TObject);
begin
  if ReadOn then
    exit;

  if (Clapan1.Value = '10') or (Clapan1.Value = '11') then
  begin
    MakeChoice(AlarmP1,Clapan1,
      CalcChoiceCaption(Clapan1.Value,Clapan1.Name,'1'),
      CalcChoicePrompt(Clapan1.Value,Clapan1.Name),
      FSetLock1ID, FResetLock1ID, FResetAlarm1ID);
  end;
end;

procedure TfrCupag1PK.Clapan2Change(Sender: TObject);
begin
  AlarmChange(2,Clapan2,AlarmP2);
end;

procedure TfrCupag1PK.Clapan2Click(Sender: TObject);
begin
  if ReadOn then
    exit;

  if (Clapan2.Value = '10') or (Clapan2.Value = '11') then
  begin
    MakeChoice(AlarmP2,Clapan2,
      CalcChoiceCaption(Clapan2.Value,Clapan2.Name,'2'),
      CalcChoicePrompt(Clapan2.Value,Clapan2.Name),
      FSetLock2ID, FResetLock2ID, FResetAlarm2ID);
  end;
end;
{
procedure TfrCupag1PK.DozatorConcDblClick(Sender: TObject);
var
  ItInd, i : integer;
  cp : TDozatorControlForm;
  dt : TDateTime;
  aOPCSource : TaOPCSource;
  aNewValue  : string;
begin
  if (OPCLookupList = nil) or (OPCSource = nil) or
    not (OPCSource is TaOPCSource) then
    exit;

  aOPCSource := TaOPCSource(OPCSource);

  cp:=TDozatorControlForm.Create(nil);
  try
//
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
//
      aNewValue := lProduct.LookupList.Items.Names[cp.ListBox1.ItemIndex];
      aOPCSource.SetSensorValue(lProduct.PhysID, aNewValue, dt);
      if (aNewValue = '0') and (cp.rbNow.Checked) then
      begin
        aOPCSource.SetSensorValue(SensorSV, '0', 0);
        aOPCSource.SetSensorValue(SensorTK, '0', 0);
      end;
    end;
  finally
    cp.Free;
  end;
end;
}
procedure TfrCupag1PK.SetCaptionColor(const Value: TColor);
begin
  Shape1.Brush.Color := Value;
end;

procedure TfrCupag1PK.SetCircID12(const Value: TPhysID);
begin
  Circ1.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetCircID22(const Value: TPhysID);
begin
  Circ2.PhysID2 := Value;
end;

function TfrCupag1PK.GetCaptionColor: TColor;
begin
  Result := Shape1.Brush.Color;
end;

function TfrCupag1PK.GetCircID12: TPhysID;
begin
  Result := Circ1.PhysID2;
end;

function TfrCupag1PK.GetCircID22: TPhysID;
begin
  Result := Circ2.PhysID2;
end;

function TfrCupag1PK.GetOPCImageList: TaOPCImageList;
begin
  Result := SI1.OPCImageList;
end;

procedure TfrCupag1PK.SetImageList(const Value: TaOPCImageList);
begin
  SI1.OPCImageList := Value;
  Clapan1.OPCImageList := Value;
  Lamp1.OPCImageList := Value;
  SI2.OPCImageList := Value;
  Clapan2.OPCImageList := Value;
  Lamp2.OPCImageList := Value;
  Work.OPCImageList := Value;
  Pump.OPCImageList := Value;
  Circ1.OPCImageList := Value;
  Circ2.OPCImageList := Value;
  K1.OPCImageList := Value;
  K2.OPCImageList := Value;
  K3.OPCImageList := Value;
  K4.OPCImageList := Value;
  K5.OPCImageList := Value;
  K6.OPCImageList := Value;
  K7.OPCImageList := Value;
  K8.OPCImageList := Value;
  K9.OPCImageList := Value;
  K10.OPCImageList := Value;
  K11.OPCImageList := Value;
  K12.OPCImageList := Value;
  K13.OPCImageList := Value;
  K14.OPCImageList := Value;
  K15.OPCImageList := Value;
  K16.OPCImageList := Value;
  K17.OPCImageList := Value;
  K18.OPCImageList := Value;
  K19.OPCImageList := Value;
  K20.OPCImageList := Value;
  K21.OPCImageList := Value;
  K22.OPCImageList := Value;
  K23.OPCImageList := Value;
  K24.OPCImageList := Value;
  Fon.OPCImageList := Value;
  DozatorWater.OPCImageList := Value;
  DozatorSugar.OPCImageList := Value;
  DozatorConc.OPCImageList := Value;
  Ramka.OPCImageList := Value;
  RedLeft.OPCImageList := Value;
  RedRight.OPCImageList := Value;
  LimitSensor1.OPCImageList := Value;
  LimitSensor2.OPCImageList := Value;
end;

procedure TfrCupag1PK.SetImageClapan11(const Value: TPhysID);
begin
  Clapan1.PhysID := Value;
end;

function TfrCupag1PK.GetImageClapan11: TPhysID;
begin
  Result := Clapan1.PhysID;
end;

procedure TfrCupag1PK.SetImageClapan21(const Value: TPhysID);
begin
  Clapan2.PhysID := Value;
end;

function TfrCupag1PK.GetImageClapan21: TPhysID;
begin
  Result := Clapan2.PhysID;
end;

procedure TfrCupag1PK.SetImageClapan12(const Value: TPhysID);
begin
  Clapan1.PhysID2 := Value;
end;

function TfrCupag1PK.GetImageClapan12: TPhysID;
begin
  Result := Clapan1.PhysID2;
end;

procedure TfrCupag1PK.SetImageClapan22(const Value: TPhysID);
begin
  Clapan2.PhysID2 := Value;
end;

function TfrCupag1PK.GetImageClapan22: TPhysID;
begin
  Result := Clapan2.PhysID2;
end;

procedure TfrCupag1PK.SetImageWork(const Value: TPhysID);
begin
  Work.PhysID := Value;
end;

procedure TfrCupag1PK.SetK10ID2(const Value: TPhysID);
begin
  K10.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK11ID2(const Value: TPhysID);
begin
  K11.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK12ID2(const Value: TPhysID);
begin
  K12.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK13ID2(const Value: TPhysID);
begin
  K13.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK14ID2(const Value: TPhysID);
begin
  K14.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK15ID2(const Value: TPhysID);
begin
  K15.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK16ID2(const Value: TPhysID);
begin
  K16.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK17ID2(const Value: TPhysID);
begin
  K17.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK18ID2(const Value: TPhysID);
begin
  K18.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK19ID2(const Value: TPhysID);
begin
  K19.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK1ID2(const Value: TPhysID);
begin
  K1.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK20ID2(const Value: TPhysID);
begin
  K20.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK21ID2(const Value: TPhysID);
begin
  K21.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK22ID2(const Value: TPhysID);
begin
  K22.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK23ID2(const Value: TPhysID);
begin
  K23.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK24ID2(const Value: TPhysID);
begin
  K24.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK2ID2(const Value: TPhysID);
begin
  K2.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK3ID2(const Value: TPhysID);
begin
  K3.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK4ID2(const Value: TPhysID);
begin
  K4.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK5ID2(const Value: TPhysID);
begin
  K5.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK6ID2(const Value: TPhysID);
begin
  K6.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK7ID2(const Value: TPhysID);
begin
  K7.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK8ID2(const Value: TPhysID);
begin
  K8.PhysID2 := Value;
end;

procedure TfrCupag1PK.SetK9ID2(const Value: TPhysID);
begin
  K9.PhysID2 := Value;
end;

function TfrCupag1PK.GetImageWork: TPhysID;
begin
  Result := Work.PhysID;
end;

function TfrCupag1PK.GetK10ID2: TPhysID;
begin
  Result := K10.PhysID2;
end;

function TfrCupag1PK.GetK11ID2: TPhysID;
begin
  Result := K11.PhysID2;
end;

function TfrCupag1PK.GetK12ID2: TPhysID;
begin
  Result := K12.PhysID2;
end;

function TfrCupag1PK.GetK13ID2: TPhysID;
begin
  Result := K13.PhysID2;
end;

function TfrCupag1PK.GetK14ID2: TPhysID;
begin
  Result := K14.PhysID2;
end;

function TfrCupag1PK.GetK15ID2: TPhysID;
begin
  Result := K15.PhysID2;
end;

function TfrCupag1PK.GetK16ID2: TPhysID;
begin
  Result := K16.PhysID2;
end;

function TfrCupag1PK.GetK17ID2: TPhysID;
begin
  Result := K17.PhysID2;
end;

function TfrCupag1PK.GetK18ID2: TPhysID;
begin
  Result := K18.PhysID2;
end;

function TfrCupag1PK.GetK19ID2: TPhysID;
begin
  Result := K19.PhysID2;
end;

function TfrCupag1PK.GetK1ID2: TPhysID;
begin
  Result := K1.PhysID2;
end;

function TfrCupag1PK.GetK20ID2: TPhysID;
begin
  Result := K20.PhysID2;
end;

function TfrCupag1PK.GetK21ID2: TPhysID;
begin
  Result := K21.PhysID2;
end;

function TfrCupag1PK.GetK22ID2: TPhysID;
begin
  Result := K22.PhysID2;
end;

function TfrCupag1PK.GetK23ID2: TPhysID;
begin
  Result := K23.PhysID2;
end;

function TfrCupag1PK.GetK24ID2: TPhysID;
begin
  Result := K24.PhysID2;
end;

function TfrCupag1PK.GetK2ID2: TPhysID;
begin
  Result := K2.PhysID2;
end;

function TfrCupag1PK.GetK3ID2: TPhysID;
begin
  Result := K3.PhysID2;
end;

function TfrCupag1PK.GetK4ID2: TPhysID;
begin
  Result := K4.PhysID2;
end;

function TfrCupag1PK.GetK5ID2: TPhysID;
begin
  Result := K5.PhysID2;
end;

function TfrCupag1PK.GetK6ID2: TPhysID;
begin
  Result := K6.PhysID2;
end;

function TfrCupag1PK.GetK7ID2: TPhysID;
begin
  Result := K7.PhysID2;
end;

function TfrCupag1PK.GetK8ID2: TPhysID;
begin
  Result := K8.PhysID2;
end;

function TfrCupag1PK.GetK9ID2: TPhysID;
begin
  Result := K9.PhysID2;
end;

procedure TfrCupag1PK.SetImagePump(const Value: TPhysID);
begin
  Pump.PhysID := Value;
end;

function TfrCupag1PK.GetImagePump: TPhysID;
begin
  Result := Pump.PhysID;
end;

procedure TfrCupag1PK.SetImageSI1(const Value: TPhysID);
begin
  SI1.PhysID := Value;
end;

function TfrCupag1PK.GetImageSI1: TPhysID;
begin
  Result := SI1.PhysID;
end;

procedure TfrCupag1PK.SetImageSI2(const Value: TPhysID);
begin
  SI2.PhysID := Value;
end;

function TfrCupag1PK.GetImageSI2: TPhysID;
begin
  Result := SI2.PhysID;
end;

procedure TfrCupag1PK.SetImageLamp1(const Value: TPhysID);
begin
  Lamp1.PhysID := Value;
end;

function TfrCupag1PK.GetImageLamp1: TPhysID;
begin
  Result := Lamp1.PhysID;
end;

procedure TfrCupag1PK.SetImageLamp2(const Value: TPhysID);
begin
  Lamp2.PhysID := Value;
end;

function TfrCupag1PK.GetImageLamp2: TPhysID;
begin
  Result := Lamp2.PhysID;
end;

procedure TfrCupag1PK.SetImageCirc1(const Value: TPhysID);
begin
  Circ1.PhysID := Value;
end;

function TfrCupag1PK.GetImageCirc1: TPhysID;
begin
  Result := Circ1.PhysID;
end;

procedure TfrCupag1PK.SetImageCirc2(const Value: TPhysID);
begin
  Circ2.PhysID := Value;
end;

function TfrCupag1PK.GetImageCirc2: TPhysID;
begin
  Result := Circ2.PhysID;
end;

procedure TfrCupag1PK.SetTankLevel1(const Value: TPhysID);
begin
  gMassa1.PhysID := Value;
  if gMassa1.PhysID <> ''
  then begin
    gMassa1.Visible := true;
    RedLeft.Visible := true;
  end
  else begin
    gMassa1.Visible := false;
    RedLeft.Visible := false;
  end;
end;

function TfrCupag1PK.GetTankLevel1: TPhysID;
begin
  Result := gMassa1.PhysID;
end;

procedure TfrCupag1PK.SetTankLevel2(const Value: TPhysID);
begin
  gMassa2.PhysID := Value;
  if gMassa2.PhysID <> ''
  then begin
    gMassa2.Visible := true;
    RedRight.Visible := true;
  end
  else begin
    gMassa2.Visible := false;
    RedRight.Visible := false;
  end;
end;

function TfrCupag1PK.GetTankLevel2: TPhysID;
begin
  Result := gMassa2.PhysID;
end;

procedure TfrCupag1PK.SetUnLockLookupList(const Value: TaOPCLookupList);
begin
  UnLockP1.LookupList := Value;
  UnLockP2.LookupList := Value;
end;

procedure TfrCupag1PK.SetUnLockP1(const Value: TPhysID);
begin
  UnLockP1.PhysID := Value;
end;

procedure TfrCupag1PK.SetUnLockP2(const Value: TPhysID);
begin
  UnLockP2.PhysID := Value;
end;

function TfrCupag1PK.GetUnLockP1: TPhysID;
begin
  Result := UnLockP1.PhysID;
end;

function TfrCupag1PK.GetUnLockP2: TPhysID;
begin
  Result := UnLockP2.PhysID;
end;

function TfrCupag1PK.GetUnLookupList: TaOPCLookupList;
begin
  Result := UnLockP1.LookupList;
end;

procedure TfrCupag1PK.gMassa1Change(Sender: TObject);
var
  aMassa: extended;
begin
  inherited;
  aMassa := StrToFloatDef(gMassa1.Value,0);
  gMassa1.Hint := IntToStr(Trunc(aMassa)) + ' мм';
  RedLeft.Top := 171 - (Trunc(0.0147 * aMassa));
  RedLeft.Hint := gMassa1.Hint;
end;

procedure TfrCupag1PK.gMassa2Change(Sender: TObject);
var
  aMassa: extended;
begin
  inherited;
  aMassa := StrToFloatDef(gMassa2.Value,0);
  gMassa2.Hint := IntToStr(Trunc(aMassa)) + ' мм';
  RedRight.Top := 171 - (Trunc(0.0147 * aMassa));
  RedRight.Hint := gMassa2.Hint;
end;

procedure TfrCupag1PK.K18MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TaOPCImage2In then
  begin
    if (ssShift in Shift) and (ssCtrl in Shift) and (Button = mbLeft) then
      if (Sender <> K18) and (Sender <> K20) then
      begin
        if (Sender as TaOPCImage2In).DataLink2.Value = '0' then
          TaOPCSource((Sender as TaOPCImage2In).OPCSource).SetSensorValue((Sender as TaOPCImage2In).PhysID2, '1', 0)
        else if (Sender as TaOPCImage2In).DataLink2.Value = '1' then
          TaOPCSource((Sender as TaOPCImage2In).OPCSource).SetSensorValue((Sender as TaOPCImage2In).PhysID2, '0', 0)
      end
  end;
end;

procedure TfrCupag1PK.K23Change(Sender: TObject);
var
  aMessage: string;
begin                                               
  if Assigned(FOnEvent) then
  begin
    if (K23.Value <> '00') and (Si1.Value = '1') then
    begin
      aMessage := FormatDateTime('dd.mm.yyyy hh:mm:ss',K23.Moment)+
        ' : '+lSI+'.1 попытка добавления малых ингредиентов в заблокированную емкость';
      FOnEvent(Self,1,aMessage);
    end
  end;

end;

procedure TfrCupag1PK.K24Change(Sender: TObject);
var
  aMessage: string;
begin
  if Assigned(FOnEvent) then
  begin
    if (K24.Value <> '00') and (Si2.Value = '1') then
    begin
      aMessage := FormatDateTime('dd.mm.yyyy hh:mm:ss',K24.Moment)+
        ' : '+lSI+'.2 попытка добавления малых ингредиентов в заблокированную емкость';
      FOnEvent(Self,2,aMessage);
    end
  end;

end;

procedure TfrCupag1PK.SetImageK1(const Value: TPhysID);
begin
  K1.PhysID := Value;
end;

function TfrCupag1PK.GetImageK1: TPhysID;
begin
  Result := K1.PhysID;
end;

procedure TfrCupag1PK.SetImageK2(const Value: TPhysID);
begin
  K2.PhysID := Value;
end;

function TfrCupag1PK.GetImageK2: TPhysID;
begin
  Result := K2.PhysID;
end;

procedure TfrCupag1PK.SetImageK3(const Value: TPhysID);
begin
  K3.PhysID := Value;
end;

function TfrCupag1PK.GetImageK3: TPhysID;
begin
  Result := K3.PhysID;
end;

procedure TfrCupag1PK.SetImageK4(const Value: TPhysID);
begin
  K4.PhysID := Value;
end;

function TfrCupag1PK.GetImageK4: TPhysID;
begin
  Result := K4.PhysID;
end;

procedure TfrCupag1PK.SetImageK5(const Value: TPhysID);
begin
  K5.PhysID := Value;
end;

function TfrCupag1PK.GetImageK5: TPhysID;
begin
  Result := K5.PhysID;
end;

procedure TfrCupag1PK.SetImageK6(const Value: TPhysID);
begin
  K6.PhysID := Value;
end;

function TfrCupag1PK.GetImageK6: TPhysID;
begin
  Result := K6.PhysID;
end;

procedure TfrCupag1PK.SetImageK7(const Value: TPhysID);
begin
  K7.PhysID := Value;
end;

function TfrCupag1PK.GetImageK7: TPhysID;
begin
  Result := K7.PhysID;
end;

procedure TfrCupag1PK.SetImageK8(const Value: TPhysID);
begin
  K8.PhysID := Value;
end;

function TfrCupag1PK.GetImageK8: TPhysID;
begin
  Result := K8.PhysID;
end;

procedure TfrCupag1PK.SetImageK9(const Value: TPhysID);
begin
  K9.PhysID := Value;
end;

function TfrCupag1PK.GetImageK9: TPhysID;
begin
  Result := K9.PhysID;
end;

procedure TfrCupag1PK.SetImageK10(const Value: TPhysID);
begin
  K10.PhysID := Value;
end;

function TfrCupag1PK.GetImageK10: TPhysID;
begin
  Result := K10.PhysID;
end;

procedure TfrCupag1PK.SetImageK11(const Value: TPhysID);
begin
  K11.PhysID := Value;
end;

function TfrCupag1PK.GetImageK11: TPhysID;
begin
  Result := K11.PhysID;
end;

procedure TfrCupag1PK.SetImageK12(const Value: TPhysID);
begin
  K12.PhysID := Value;
end;

function TfrCupag1PK.GetImageK12: TPhysID;
begin
  Result := K12.PhysID;
end;

procedure TfrCupag1PK.SetImageK13(const Value: TPhysID);
begin
  K13.PhysID := Value;
end;

function TfrCupag1PK.GetImageK13: TPhysID;
begin
  Result := K13.PhysID;
end;

procedure TfrCupag1PK.SetImageK14(const Value: TPhysID);
begin
  K14.PhysID := Value;
end;

function TfrCupag1PK.GetImageK14: TPhysID;
begin
  Result := K14.PhysID;
end;

procedure TfrCupag1PK.SetImageK15(const Value: TPhysID);
begin
  K15.PhysID := Value;
end;

function TfrCupag1PK.GetImageK15: TPhysID;
begin
  Result := K15.PhysID;
end;

procedure TfrCupag1PK.SetImageK16(const Value: TPhysID);
begin
  K16.PhysID := Value;
end;

function TfrCupag1PK.GetImageK16: TPhysID;
begin
  Result := K16.PhysID;
end;

procedure TfrCupag1PK.SetImageK17(const Value: TPhysID);
begin
  K17.PhysID := Value;
end;

function TfrCupag1PK.GetImageK17: TPhysID;
begin
  Result := K17.PhysID;
end;

procedure TfrCupag1PK.SetImageK18(const Value: TPhysID);
begin
  K18.PhysID := Value;
end;

function TfrCupag1PK.GetImageK18: TPhysID;
begin
  Result := K18.PhysID;
end;

procedure TfrCupag1PK.SetImageK19(const Value: TPhysID);
begin
  K19.PhysID := Value;
end;

function TfrCupag1PK.GetImageK19: TPhysID;
begin
  Result := K19.PhysID;
end;

procedure TfrCupag1PK.SetImageK20(const Value: TPhysID);
begin
  K20.PhysID := Value;
end;

function TfrCupag1PK.GetImageK20: TPhysID;
begin
  Result := K20.PhysID;
end;

procedure TfrCupag1PK.SetImageK21(const Value: TPhysID);
begin
  K21.PhysID := Value;
end;

function TfrCupag1PK.GetImageK21: TPhysID;
begin
  Result := K21.PhysID;
end;

procedure TfrCupag1PK.SetImageK22(const Value: TPhysID);
begin
  K22.PhysID := Value;
end;

function TfrCupag1PK.GetImageK22: TPhysID;
begin
  Result := K22.PhysID;
end;

procedure TfrCupag1PK.SetImageK23(const Value: TPhysID);
begin
  K23.PhysID := Value;
end;

function TfrCupag1PK.GetImageK23: TPhysID;
begin
  Result := K23.PhysID;
end;

procedure TfrCupag1PK.SetImageK24(const Value: TPhysID);
begin
  K24.PhysID := Value;
end;

function TfrCupag1PK.GetImageK24: TPhysID;
begin
  Result := K24.PhysID;
end;

function TfrCupag1PK.GetImageFon: string;
begin
  Result:=Fon.Value;
end;

procedure TfrCupag1PK.SetImageFon(const Value: string);
begin
  Fon.Value := '1';
end;

function TfrCupag1PK.GetImageDozatorWater: string;
begin
  Result:=DozatorWater.Value;
end;

procedure TfrCupag1PK.SetImageDozatorWater(const Value: string);
begin
  DozatorWater.Value := '1';
end;

function TfrCupag1PK.GetImageDozatorSugar: string;
begin
  Result:=DozatorSugar.Value;
end;

procedure TfrCupag1PK.SetImageDozatorSugar(const Value: string);
begin
  DozatorSugar.Value := '1';
end;

function TfrCupag1PK.GetImageDozatorConc: string;
begin
  Result:=DozatorConc.Value;
end;

procedure TfrCupag1PK.SetImageDozatorConc(const Value: string);
begin
  DozatorConc.Value := '1';
end;

function TfrCupag1PK.GetImageRamka: string;
begin
  Result:=Ramka.Value;
end;

procedure TfrCupag1PK.SetImageRamka(const Value: string);
begin
  Ramka.Value := '0';
end;

function TfrCupag1PK.GetSugarDoz: TPhysID;
begin
  Result := lSugarDoz.PhysID;
end;

procedure TfrCupag1PK.SetSugarDoz(const Value: TPhysID);
begin
  lSugarDoz.PhysID := Value;
end;

function TfrCupag1PK.GetWaterDoz: TPhysID;
begin
  Result := lWaterDoz.PhysID;
end;

procedure TfrCupag1PK.SetWaterDoz(const Value: TPhysID);
begin
  lWaterDoz.PhysID := Value;
end;

function TfrCupag1PK.GetConcDoz: TPhysID;
begin
  Result := lConcDoz.PhysID;
end;

procedure TfrCupag1PK.SetConcDoz(const Value: TPhysID);
begin
  lConcDoz.PhysID := Value;
end;

initialization
  RegisterClasses([TfrCupag1PK]);
end.
