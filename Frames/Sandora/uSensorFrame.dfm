inherited SensorFrame: TSensorFrame
  Width = 300
  Height = 20
  Color = 15066597
  ParentColor = False
  ParentFont = False
  ExplicitWidth = 300
  ExplicitHeight = 20
  object lName: TLabel
    Left = 0
    Top = 4
    Width = 166
    Height = 13
    AutoSize = False
    Caption = 'Name'
  end
  object lSensorValue: TaOPCLabel
    Left = 172
    Top = 4
    Width = 59
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = 'lSensorValue'
  end
  object lUnit: TLabel
    Left = 245
    Top = 4
    Width = 52
    Height = 13
    AutoSize = False
    Caption = 'Unit'
  end
end
