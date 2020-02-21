{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2006 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit OPCFrameReg;

interface

Uses
  Classes, DesignIntf;

procedure Register;

implementation

{$R aOPCFrameImg.res}

uses
  uOPCFrame
//  uTankFrame,
//  uCupagTankFrame,
//  uSt1P1,uSt1P2,
//  uSt2P1,uSt2P2,uSt2P3,
//  uSt3P1,uSt3P2,uSt3P3,
//  uPulpP1,uPulpP2,uPulpP3,
//  uRefMonometr,
//  uRefTermometr,
//  uTomatLine, uHotBreak,
//  uLine1_1,uLine1_2,
//  uLine2_1,uLine2_2,
//  uSensorFrame,
//  uCounterFrame,
//  uConcentratPK2Frame,
//  uSaxarPK2Frame,
//  uCupagPK2Frame,
//  uLimonPK2Frame,
//  uReceptFrame,
//  uCupagParaFrame,
//  uAnticeptPK2Frame,
//  uCompress,
//  uSmInFrame,
//  uCIPProgramm,
//  uHoleFrame,
//  uTeploTable,
//  uAseptic,
//  uHoleAlarm,
//  uBoilerAlarms
  ;

procedure Register;
begin
//  RegisterComponents('OPC Frames', [TfrTank]);
//  RegisterComponents('OPC Frames', [TfrCupagTank]);
//  RegisterComponents('OPC Frames', [TSt1P1]);
//  RegisterComponents('OPC Frames', [TSt1P2]);
//  RegisterComponents('OPC Frames', [TSt2P1]);
//  RegisterComponents('OPC Frames', [TSt2P2]);
//  RegisterComponents('OPC Frames', [TSt2P3]);
//  RegisterComponents('OPC Frames', [TSt3P1]);
//  RegisterComponents('OPC Frames', [TSt3P2]);
//  RegisterComponents('OPC Frames', [TSt3P3]);
//  //RegisterComponents('OPC Frames', [TSt3P3]);
//  RegisterComponents('OPC Frames', [TPulpP1]);
//  RegisterComponents('OPC Frames', [TPulpP2]);
//  RegisterComponents('OPC Frames', [TPulpP3]);
//
//  RegisterComponents('OPC Frames', [TTomatLine]);
//  RegisterComponents('OPC Frames', [THotBreak]);
//
//  RegisterComponents('OPC Frames', [TLine2_1]);
//  RegisterComponents('OPC Frames', [TLine2_2]);
//
//  RegisterComponents('OPC Frames', [TLine1_1]);
//  RegisterComponents('OPC Frames', [TLine1_2]);
//
//  RegisterComponents('OPC Frames', [TSensorFrame]);
//
//  RegisterComponents('OPC Frames', [TMonometr]);
//  RegisterComponents('OPC Frames', [TTermometr]);
//  RegisterComponents('OPC Frames', [TfrCounter]);
//  RegisterComponents('OPC Frames', [TfrConcentrat]);
//  RegisterComponents('OPC Frames', [TfrSaxar]);
//  RegisterComponents('OPC Frames', [TfrCupag]);
//  RegisterComponents('OPC Frames', [TfrLimon]);
//  RegisterComponents('OPC Frames', [TReceptFrame]);
//  RegisterComponents('OPC Frames', [TParaFrame]);
//
//  RegisterComponents('OPC Frames', [TfrAnt]);

  RegisterPropertiesInCategory('OPC', TaOPCFrame,
    ['ID', '*LookupList','*OPCSource']);

//  RegisterComponents('OPC Frames', [TCompressor]);
//  RegisterComponents('OPC Frames', [TfrCupag1PK]);
//  RegisterComponents('OPC Frames', [TCIPProgrammFrame]);
//  RegisterComponents('OPC Frames', [TfrHole]);
//  RegisterComponents('OPC Frames', [TTeploTable]);
//  RegisterComponents('OPC Frames', [TfrAseptic]);
//  RegisterComponents('OPC Frames', [TfrHoleAlarm]);
//  RegisterComponents('OPC Frames', [TBoilerAlarms]);
end;

end.
