{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2011 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit aOPCConsts;

interface

uses
  Graphics;

const
  cTCPMaxBlockSize = 64*1024;

  cOPCGroupDataCount = 2;

  cParamsDelimiter = ';';

  �OPCErrorBrushColor = clYellow;
  cOPCErrorFontColor = clRed;
  cOPCZeroValueFontColor = clGray;

  sOk = 'ok';       // not localize
  sError = 'error'; // not localize
  sNoCommandHandler = 'no command handler'; // not localize

  sUnknownAnswer = 'Unknown answer : %s';
  sBadParamCount = '�������� ������������ ���������� ���������� %d �� %d.';

  // ����� ������� �������
  sSensorID = 'ID';
  sSensorName = 'Name';
  sSensorNameEn = 'NameEn';
  sSensorFullName = 'FullName';

  sSensorConnectionName = 'ConnectionName';
  sSensorControllerAddr = 'ControllerAddr';
  sSensorAddr = 'Addr';

  sSensorPermissions = 'Permissions';

  sSensorUnitName = 'UnitName';
  sSensorDisplayFormat = 'DisplayFormat';

  sSensorMinReadInterval = 'MinReadInterval';
  sSensorUpdateInterval = 'UpdateInterval';

  sSensorCorrectMul = 'CorrectMul';
  sSensorCorrectAdd = 'CorrectAdd';

  sSensorTransformCount = 'TransformCount';
  sSensorTransformIn = 'TransformIn';
  sSensorTransformOut = 'TransformOut';

  sSensorPrecision = 'SensorPrecision';

  sSensorCompression_Precision = 'Compression.Precision';
  sSensorCompression_DeadSpace = 'Compression.DeadSpace';

  sSensorDataBuffer_MaxInterval = 'DataBuffer.MaxInterval';
  sSensorDataBuffer_MaxRecCount = 'DataBuffer.MaxRecCount';

  sSensorDataBuffer_DataWriter_Kind = 'DataBuffer.DataWriter.Kind';
  sSensorDataBuffer_DataWriter_UpdateDBInterval = 'DataBuffer.DataWriter.UpdateDBInterval';
  sSensorDataBuffer_DataWriter_ExtDeadband ='DataBuffer.DataWriter.ExtDeadband';

  sSensorSmooth_Kind = 'Smooth.Kind';
  sSensorSmooth_Interval = 'Smooth.Interval';

  sSensorRefAutoFill = 'RefAutoFill';
  sSensorRefTableName = 'RefTableName';

  sSensorFuncName = 'FuncName';
  sSensorOnChangValueFuncName = 'OnChangValueFuncName';
  sSensorOsSensornReadConvertValueFuncName = 'ReadConvertValueFuncName';
  sSensorOnWriteConvertValueFuncName = 'OnWriteConvertValueFuncName';


resourcestring
  SImageNotFound = '������� ''%s'' �� ������';
  SDataLinkNotFound = '������ ����� ''%s'' �� ������';



implementation

end.
