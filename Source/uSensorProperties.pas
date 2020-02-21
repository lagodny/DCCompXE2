unit uSensorProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls,  ExtCtrls,
  aOPCConnectionList, aCustomOPCSource,
  uDCObjects, uDCSensors,
  aOPCDataObject, aCustomOPCTCPSource,
  aOPCLabel,
  JvExComCtrls, JvComCtrls, JvPageList, JvPageListTreeView, JvExControls,
  uConsts;

type
  TTransRec = record
    InValue, OutValue: extended;
  end;

  TSensorPropertiesForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    JvPageList1: TJvPageList;
    JvPageListTreeView1: TJvPageListTreeView;
    JvStandardPage1: TJvStandardPage;
    JvStandardPage3: TJvStandardPage;
    JvStandardPage4: TJvStandardPage;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    cbSmoothKind: TComboBox;
    eSmoothInterval: TEdit;
    GroupBox2: TGroupBox;
    Label27: TLabel;
    Label9: TLabel;
    lDelta: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label28: TLabel;
    Label17: TLabel;
    cbWriterKind: TComboBox;
    eDelta: TEdit;
    eUpdateDBInterval: TEdit;
    eApproxPrecision: TEdit;
    ePrecision: TEdit;
    JvStandardPage5: TJvStandardPage;
    gbReference: TGroupBox;
    Label16: TLabel;
    eRefTableName: TEdit;
    eRefAutoFill: TCheckBox;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    eFullName: TEdit;
    eUnitName: TEdit;
    eDisplayFormat: TEdit;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ResValue: TaOPCLabel;
    XValue: TaOPCLabel;
    Label29: TLabel;
    sgTransforms: TStringGrid;
    eCorrectM: TEdit;
    eCorrect: TEdit;
    eFuncName: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    eMinReadInterval: TEdit;
    eUpdateInterval: TEdit;
    ePath: TEdit;
    eEquipmentPath: TEdit;
    eThreadName: TEdit;
    Label1: TLabel;
    eName: TEdit;
    Label6: TLabel;
    eID: TEdit;
    Label31: TLabel;
    procedure ResValueChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure bOkClick(Sender: TObject);
  private
    a, b: extended;
    BackTransformation: array of TTransRec;

    FSensor: TSensor;
    procedure SetSensor(const Value: TSensor);
  public
    class procedure ShowSensorProperties(aSensor: TSensor);

    procedure SetSensorProperties;
    procedure FillControlsEx(aSensor: TSensor);
    function BackTransform(aValue: string): string;

    property Sensor: TSensor read FSensor write SetSensor;
  end;


implementation

uses
  uSensorPropNames;

var
  SensorPropertiesForm: TSensorPropertiesForm;


{$R *.dfm}

{ TfSensorProperties }

function TSensorPropertiesForm.BackTransform(aValue: string): string;
var
  aInValue, aOutValue: extended;
  i1, i2: Integer;
  Count: integer;
  aSource: TaCustomOPCTCPSource;
begin
  Result := '???';

  aOutValue := 0;
  aSource := TOPCConnectionCollectionItem(Sensor.Owner).OPCSource;
  aInValue := StrToFloatDef(aValue, 0, aSource.OpcFS);

  Count := Length(BackTransformation);
  if Count = 0 then
  begin
    aOutValue := (aInValue - b)/a;
    Result := FloatToStr(aOutValue);
    exit;
  end
  else
  begin
    if Count > 1 then
    begin
      for i2 := 1 to Count - 1 do
      begin
        i1 := i2 - 1;
        if (BackTransformation[i1].InValue <= aInValue) and
          (BackTransformation[i2].InValue >= aInValue) and
          (BackTransformation[i1].InValue <> BackTransformation[i2].InValue) then
        begin
          // y = y1 + (x-x1)*(y2-y1)/(x2-x1)
  {
          aOutValue := Transformation[i1].InValue +     // y1
            (aInValue - Transformation[i1].InValue)*    // (x-x1)
            (Transformation[i2].OutValue - Transformation[i1].OutValue) /  //(y2-y1)
            (Transformation[i2].InValue - Transformation[i1].InValue);     //(x2-x1)
  }
          // y = y2 - (y2 - y1)*(x2 - x)/(x2 - x1)
          aOutValue := BackTransformation[i2].OutValue - // y2
          (BackTransformation[i2].OutValue - BackTransformation[i1].OutValue) * //(y2 - y1)
          (BackTransformation[i2].InValue - aInValue) / // (x2 - x)
          (BackTransformation[i2].InValue - BackTransformation[i1].InValue); //(x2-x1)

          Result := FloatToStr(aOutValue);
          exit;
        end;
      end;
    end;
  end;
end;

procedure TSensorPropertiesForm.bOkClick(Sender: TObject);
begin
  SetSensorProperties;
end;

procedure TSensorPropertiesForm.FillControlsEx(aSensor: TSensor);
var
  i: integer;
  vin, vout: string;
  TransCount: integer;
  sl: TStringList;
  aSource: TaCustomOPCTCPSource;
begin
  FSensor := aSensor;

  sl := TStringList.Create;
  try
    aSource := TOPCConnectionCollectionItem(aSensor.Owner).OPCSource;
    sl.Text := aSource.GetSensorPropertiesEx(aSensor.IdStr);
    //ShowMessage(sl.Text);

    Caption        := 'Свойства датчика: ' + sl.Values[sSensorName];

    // представление
    eID.Text       := sl.Values[sSensorID];
    eName.Text     := sl.Values[sSensorName];
    eFullName.Text := sl.Values[sSensorFullName];
    eUnitName.Text := sl.Values[sSensorUnitName];
    eDisplayFormat.Text := sl.Values[sSensorDisplayFormat];

    // чтение
    ePath.Text     := sl.Values[sSensorAddr];
    eEquipmentPath.Text := sl.Values[sSensorControllerAddr];
    eThreadName.Text := sl.Values[sSensorConnectionName];

    eUpdateInterval.Text := sl.Values[sSensorUpdateInterval];
    eMinReadInterval.Text := sl.Values[sSensorMinReadInterval];

    // преобразование
    eFuncName.Text := sl.Values[sSensorFuncName];

    eCorrectM.Text := sl.Values[sSensorCorrectMul];
    eCorrect.Text  := sl.Values[sSensorCorrectAdd];
    a := StrToFloatDef(eCorrectM.Text, 1, aSource.OpcFS);
    b := StrToFloatDef(eCorrect.Text, 0, aSource.OpcFS);

    TransCount := StrToIntDef(sl.Values[sSensorTransformCount], 0);
    SetLength(BackTransformation, TransCount);

    RadioButton2.Checked := TransCount > 0;
    RadioButton1.Checked := not RadioButton2.Checked;

    sgTransforms.RowCount := TransCount + 1;
    sgTransforms.Cells[0, 0] := 'из';
    sgTransforms.Cells[1, 0] := 'в';
    for i := 1 to TransCount do
    begin
      vin := sl.Values[Format('%s%d', [sSensorTransformIn, i-1])];
      vout := sl.Values[Format('%s%d', [sSensorTransformOut, i-1])];
      sgTransforms.Cells[0, i] := vin;
      sgTransforms.Cells[1, i] := vout;
      BackTransformation[i-1].OutValue := StrToFloatDef(vin, 0, aSource.OpcFS);
      BackTransformation[i-1].InValue := StrToFloatDef(vout, 0, aSource.OpcFS);
    end;

    RadioButton1Click(Self);

    // сглаживание, сжатие и хранение
    cbSmoothKind.ItemIndex := StrToIntDef(sl.Values[sSensorSmooth_Kind], 0);
    eSmoothInterval.Text := sl.Values[sSensorSmooth_Interval];

    cbWriterKind.ItemIndex := StrToIntDef(sl.Values[sSensorDataBuffer_DataWriter_Kind], 0);
    eUpdateDBInterval.Text := sl.Values[sSensorDataBuffer_DataWriter_UpdateDBInterval];

    eApproxPrecision.Text := sl.Values[sApproxPrecision];
    
    eDelta.Text    := sl.Values[sSensorCompression_DeadSpace];
    lDelta.Caption := eUnitName.Text;

    ePrecision.Text := sl.Values[sSensorPrecision];
    //eVn.Text := sl.Values[sSensor];
    //lVn.Caption := sl.Values[]+'/ч.';

    eRefTableName.Text := sl.Values[sSensorRefTableName];
    eRefAutoFill.Checked := not (sl.Values[sSensorRefAutoFill]='0');

    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TEdit) and (TEdit(Components[i]).Hint = '') then
        TEdit(Components[i]).Hint := TEdit(Components[i]).Text;

  finally
    sl.Free;
  end;

  ResValue.DisplayFormat := aSensor.DisplayFormat; //eDisplayFormat.Text;
  ResValue.PhysID := aSensor.IdStr; // eId.Text;
  ResValue.OPCSource := TOPCConnectionCollectionItem(aSensor.Owner).OPCSource;

end;

procedure TSensorPropertiesForm.FormCreate(Sender: TObject);
begin
//  JvPageListTreeView1.Select(JvPageListTreeView1.Items[0]);
end;

procedure TSensorPropertiesForm.RadioButton1Click(Sender: TObject);
begin
  eCorrectM.Enabled := RadioButton1.Checked;
  eCorrect.Enabled := RadioButton1.Checked;
  sgTransforms.Visible := RadioButton2.Checked;
end;

procedure TSensorPropertiesForm.ResValueChange(Sender: TObject);
begin
  XValue.Caption := BackTransform(ResValue.Value);
//  FloatToStr(
//    (StrToFloatDef(ResValue.Value, 0) - StrToFloatDef(fSensorProperties.Correct,0))/
//    StrToFloatDef(fSensorProperties.CorrectM,1)
//    );
  XValue.Hint := XValue.Caption;
end;

procedure TSensorPropertiesForm.SetSensor(const Value: TSensor);
begin
  FillControlsEx(Value);
end;

procedure TSensorPropertiesForm.SetSensorProperties;
var
  sl: TStringList;
  Source: TaCustomOPCTCPSource;
  Answer: string;
  i, TransCount: integer;
begin
  sl := TStringList.Create;
  try
    // представление
    sl.Add(sSensorName + '=' + eName.Text);
    sl.Add(sSensorFullName + '=' + eFullName.Text);
    sl.Add(sSensorUnitName + '=' + eUnitName.Text);
    sl.Add(sSensorDisplayFormat + '=' + eDisplayFormat.Text);

    // чтение
    sl.Add(sSensorAddr + '=' + ePath.Text);
    sl.Add(sSensorUpdateInterval + '=' + eUpdateInterval.Text);
    sl.Add(sSensorMinReadInterval + '=' + eMinReadInterval.Text);

    // преобразование
    sl.Add(sSensorFuncName + '=' + eFuncName.Text);
    sl.Add(sSensorCorrectMul + '=' + eCorrectM.Text);
    sl.Add(sSensorCorrectAdd + '=' + eCorrect.Text);

    TransCount := sgTransforms.RowCount - 1;
    sl.Add(sSensorTransformCount + '=' + IntToStr(TransCount));
    for i := 1 to TransCount do
    begin
      sl.Add(Format('%s%d', [sSensorTransformIn, i-1]) + '=' + sgTransforms.Cells[0, i]);
      sl.Add(Format('%s%d', [sSensorTransformOut, i-1]) + '=' + sgTransforms.Cells[1, i]);
    end;

    // сглаживание, сжатие и хранение
    sl.Add(sSensorSmooth_Kind + '=' + IntToStr(cbSmoothKind.ItemIndex));
    sl.Add(sSensorSmooth_Interval + '=' + eSmoothInterval.Text);
    sl.Add(sSensorDataBuffer_DataWriter_Kind + '=' + IntToStr(cbWriterKind.ItemIndex));
    sl.Add(sSensorDataBuffer_DataWriter_UpdateDBInterval + '=' + eUpdateDBInterval.Text);
    sl.Add(sSensorCompression_DeadSpace + '=' + eDelta.Text);
    sl.Add(sApproxPrecision + '=' + eApproxPrecision.Text);
    sl.Add(sSensorPrecision + '=' + ePrecision.Text);

    sl.Add(sSensorRefTableName + '=' + eRefTableName.Text);
    sl.Add(sSensorRefAutoFill + '=' + BoolToStr(eRefAutoFill.Checked));

    sl.Add(sSensorEquipmentPath + '=' + eEquipmentPath.Text);

    //sl.Add( + '=' + );
    //eVn.Text := sl.Values[sSensor];
    //lVn.Caption := sl.Values[]+'/ч.';

    Source := TOPCConnectionCollectionItem(FSensor.Owner).OPCSource;
    try
      Answer := Source.SetSensorPropertiesEx(Sensor.IdStr, sl);
      if SameText(Answer, 'ok') then
      begin
        Sensor.DisplayFormat := eDisplayFormat.Text;
        Sensor.SensorUnitName := eUnitName.Text;
        Sensor.Name := eName.Text;
      end
      else if SameText(Answer, 'no right') then
        ShowMessage('Недостаточно прав для изменения свойств датчика')
      else if SameText(Answer, 'not found') then
        ShowMessage('Датчик не найден')
      else
        ShowMessage('Ошибка: '+Answer);
    except
      on e: Exception do
        ShowMessage(e.Message);
    end;
  finally
    sl.Free;
  end;
end;

class procedure TSensorPropertiesForm.ShowSensorProperties(aSensor: TSensor);
begin
  SensorPropertiesForm := TSensorPropertiesForm.Create(nil);
  try
    SensorPropertiesForm.FillControlsEx(aSensor);
    SensorPropertiesForm.ShowModal;
  finally
    FreeAndNil(SensorPropertiesForm);
  end;
end;

end.
