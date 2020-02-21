inherited kzCompressorDetail: TkzCompressorDetail
  Width = 932
  Height = 509
  ExplicitWidth = 932
  ExplicitHeight = 509
  object aOPCImage1: TaOPCImage
    Left = 0
    Top = 0
    Width = 932
    Height = 509
    Value = '0'
    Stretch = True
    OPCImageList = aOPCImageList1
  end
  object aOPCLabel1: TaOPCLabel
    Left = 10
    Top = 37
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1074#1089#1072#1089#1099#1074#1072#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSUCT_Pressure: TaOPCLabel
    Left = 208
    Top = 37
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '1,3'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '1,3'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel23: TaOPCLabel
    Left = 247
    Top = 37
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1041#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel2: TaOPCLabel
    Left = 52
    Top = 10
    Width = 92
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1042#1057#1040#1057#1067#1042#1040#1053#1048#1045
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel3: TaOPCLabel
    Left = 10
    Top = 57
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1085#1072' '#1074#1089#1072#1089#1099#1074#1072#1085#1080#1080' (SAT)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSUCT_PressureSAT: TaOPCLabel
    Left = 208
    Top = 57
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '-16,4'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '-16,4'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel5: TaOPCLabel
    Left = 247
    Top = 57
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057'/R'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel6: TaOPCLabel
    Left = 10
    Top = 77
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1077#1088#1077#1075#1088#1077#1074' '#1074#1089#1072#1089#1099#1074#1072#1077#1084#1086#1075#1086' '#1075#1072#1079#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSUCT_GAS_TI: TaOPCLabel
    Left = 208
    Top = 77
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '-14,7'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '-14,7'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel8: TaOPCLabel
    Left = 247
    Top = 77
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel9: TaOPCLabel
    Left = 10
    Top = 97
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1077#1088#1077#1075#1088#1077#1074' '#1085#1072' '#1074#1089#1072#1089#1099#1074#1072#1085#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSUCT_GAS_S_HEAT: TaOPCLabel
    Left = 208
    Top = 97
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '1,7'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '1,7'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel11: TaOPCLabel
    Left = 247
    Top = 97
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel12: TaOPCLabel
    Left = 46
    Top = 131
    Width = 111
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1052#1040#1057#1051#1054#1057#1048#1057#1058#1045#1052#1040
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel13: TaOPCLabel
    Left = 10
    Top = 165
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1084#1072#1089#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lOIL_PRES: TaOPCLabel
    Left = 208
    Top = 165
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '7,1'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '7,1'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel15: TaOPCLabel
    Left = 247
    Top = 165
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1041#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel16: TaOPCLabel
    Left = 10
    Top = 185
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1084#1072#1089#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lOIL_TEMP: TaOPCLabel
    Left = 208
    Top = 185
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '50'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '50,0'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel18: TaOPCLabel
    Left = 247
    Top = 185
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel19: TaOPCLabel
    Left = 10
    Top = 204
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1077#1088#1077#1087#1072#1076' '#1076#1072#1074#1083'. '#1085#1072' '#1084#1072#1089#1083'. '#1092#1080#1083#1100#1090#1088#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lOIL_FILT_DIF_PRES: TaOPCLabel
    Left = 207
    Top = 207
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '0,1'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0,1'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel21: TaOPCLabel
    Left = 247
    Top = 204
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1041#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel22: TaOPCLabel
    Left = 55
    Top = 241
    Width = 66
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1044#1074#1080#1075#1072#1090#1077#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel24: TaOPCLabel
    Left = 10
    Top = 273
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1058#1086#1082' '#1076#1074#1080#1075#1072#1090#1077#1083#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lMotorCurrent: TaOPCLabel
    Left = 208
    Top = 273
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '297'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '297'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel26: TaOPCLabel
    Left = 247
    Top = 273
    Width = 35
    Height = 16
    Value = #1040
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1040
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel27: TaOPCLabel
    Left = 10
    Top = 294
    Width = 195
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1063#1072#1089#1099' '#1053#1072#1088#1072#1073#1086#1090#1082#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lTIMER_RUN_HOURS: TaOPCLabel
    Left = 208
    Top = 294
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '3502'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '3502'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel29: TaOPCLabel
    Left = 247
    Top = 294
    Width = 35
    Height = 16
    Value = #1040
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1040
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel30: TaOPCLabel
    Left = 10
    Top = 413
    Width = 164
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lCompCtrl: TaOPCLabel
    Left = 9
    Top = 429
    Width = 269
    Height = 25
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    StairsOptions = []
    Value = '1'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    LookupList = llCtrlMode
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    AutoSize = False
    BorderWidth = 1
    Caption = 'MANUAL'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel32: TaOPCLabel
    Left = 11
    Top = 461
    Width = 164
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lCompMode: TaOPCLabel
    Left = 10
    Top = 477
    Width = 269
    Height = 25
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    StairsOptions = []
    Value = '1'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    Hints.Strings = (
      '1=Ready'
      '2=Running'
      '5=Pause'
      '11=Running Suction Pressure Limit')
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    LookupList = llStateMode
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    AutoSize = False
    BorderWidth = 1
    Caption = 'Ready'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel34: TaOPCLabel
    Left = 370
    Top = 8
    Width = 105
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1050#1054#1053#1060#1048#1043#1059#1056#1040#1062#1048#1071
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel35: TaOPCLabel
    Left = 331
    Top = 36
    Width = 143
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1058#1080#1087
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object aOPCLabel36: TaOPCLabel
    Left = 481
    Top = 36
    Width = 58
    Height = 16
    Value = 'SAB233L'
    PhysID = '72'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SAB233L'
    Color = clBlue
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel37: TaOPCLabel
    Left = 331
    Top = 56
    Width = 143
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1061#1083#1072#1076#1086#1085#1086#1089#1080#1090#1077#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object aOPCLabel38: TaOPCLabel
    Left = 481
    Top = 56
    Width = 58
    Height = 16
    Value = 'R717'
    PhysID = '72'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'R717'
    Color = clBlue
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel39: TaOPCLabel
    Left = 331
    Top = 76
    Width = 164
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1056#1077#1072#1083#1100#1085' '#1091#1089#1090#1072#1074#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSUCT_PressureSAT_SP: TaOPCLabel
    Left = 496
    Top = 76
    Width = 43
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    StairsOptions = []
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel41: TaOPCLabel
    Left = 543
    Top = 76
    Width = 31
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057'/R'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel42: TaOPCLabel
    Left = 331
    Top = 96
    Width = 143
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1042#1050#1051
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object aOPCLabel43: TaOPCLabel
    Left = 481
    Top = 96
    Width = 58
    Height = 16
    Value = 'SUCTION'
    PhysID = '72'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'SUCTION'
    Color = clBlue
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel44: TaOPCLabel
    Left = 391
    Top = 359
    Width = 139
    Height = 23
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1056#1072#1089#1089#1086#1083
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel45: TaOPCLabel
    Left = 331
    Top = 397
    Width = 164
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1056#1072#1089#1089#1086#1083
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lRassol: TaOPCLabel
    Left = 524
    Top = 397
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '27'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '27,0'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel47: TaOPCLabel
    Left = 563
    Top = 397
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel48: TaOPCLabel
    Left = 676
    Top = 10
    Width = 85
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1053#1040#1043#1053#1045#1058#1040#1053#1048#1045
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel49: TaOPCLabel
    Left = 651
    Top = 39
    Width = 180
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1085#1072#1075#1085#1077#1090#1072#1085#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lDISHPressure: TaOPCLabel
    Left = 852
    Top = 39
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '9,1'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '9,1'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel51: TaOPCLabel
    Left = 891
    Top = 39
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1041#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel52: TaOPCLabel
    Left = 651
    Top = 58
    Width = 180
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1044#1072#1074#1083#1077#1085#1080#1077' '#1085#1072#1075#1085#1077#1090#1072#1085#1080#1103' 2 (Sat)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lDISHPressureSAT: TaOPCLabel
    Left = 852
    Top = 58
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '25'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '25,0'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel54: TaOPCLabel
    Left = 891
    Top = 58
    Width = 35
    Height = 16
    Value = #176#1057'/R'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057'/R'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel55: TaOPCLabel
    Left = 651
    Top = 78
    Width = 180
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1075#1072#1079#1072' '#1085#1072' '#1085#1072#1075#1085#1077#1090#1072#1085#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lDISH_t: TaOPCLabel
    Left = 852
    Top = 78
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '64,2'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '64,2'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel57: TaOPCLabel
    Left = 891
    Top = 78
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel58: TaOPCLabel
    Left = 651
    Top = 98
    Width = 180
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1077#1088#1077#1075#1088#1077#1074' '#1075#1072#1079#1072' '#1085#1072' '#1085#1072#1075#1085#1077#1090#1072#1085#1080#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lDISH_t2: TaOPCLabel
    Left = 852
    Top = 98
    Width = 34
    Height = 16
    Hint = #1054#1096#1080#1073#1082#1072': '#1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ShowHint = True
    Value = '39,1'
    PhysID = '72'
    ErrorCode = -1
    ErrorString = #1053#1077#1090' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    ErrorHint = #1054#1096#1080#1073#1082#1072': %s'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0.0;-0.0'
    ShowError = False
    OnDrawLabel = lSUCT_PressureDrawLabel
    Alignment = taRightJustify
    AutoSize = False
    Caption = '39,1'
    Color = 46186688
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    Transparent = False
    Layout = tlCenter
  end
  object aOPCLabel60: TaOPCLabel
    Left = 891
    Top = 98
    Width = 35
    Height = 16
    Value = #176#1057
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #176#1057
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object aOPCLabel61: TaOPCLabel
    Left = 684
    Top = 131
    Width = 160
    Height = 20
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068#1053#1054#1057#1058#1068
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel62: TaOPCLabel
    Left = 651
    Top = 163
    Width = 126
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object gPerfomance: TaOPCGauge
    Left = 792
    Top = 163
    Width = 100
    Height = 16
    ForeColor = clNavy
    Progress = 10
  end
  object aOPCLabel63: TaOPCLabel
    Left = 651
    Top = 185
    Width = 126
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1055#1086#1079#1080#1094#1080#1103' '#1079#1086#1083#1086#1090#1085#1080#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object gPosition: TaOPCGauge
    Left = 792
    Top = 185
    Width = 100
    Height = 16
    ForeColor = clNavy
    Progress = 10
  end
  object aOPCLabel64: TaOPCLabel
    Left = 708
    Top = 302
    Width = 165
    Height = 23
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = 'MULTISAB'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCLabel65: TaOPCLabel
    Left = 651
    Top = 330
    Width = 164
    Height = 16
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1053#1086#1084#1077#1088' '#1057#1080#1089#1090#1077#1084#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object lSystemNo: TaOPCLabel
    Left = 839
    Top = 330
    Width = 34
    Height = 16
    Value = '2'
    PhysID = '72'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = '0'
    Alignment = taRightJustify
    AutoSize = False
    Caption = '2'
    Color = clBlue
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object CompMode: TaOPCImage
    Left = 23
    Top = 335
    Width = 61
    Height = 63
    Value = '0'
    Hints.Strings = (
      '0=2')
    Stretch = True
    OPCImageList = aOPCImageList1
    States.Strings = (
      '0=2'
      '1=2'
      '2=3'
      '5=4'
      '11=2')
  end
  object lCompressorName: TaOPCLabel
    Left = 444
    Top = 128
    Width = 20
    Height = 23
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Alignment = taCenter
    Caption = 'K1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object aOPCLabel7: TaOPCLabel
    Left = 335
    Top = 131
    Width = 103
    Height = 23
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    AutoSize = False
    Caption = #1050#1086#1084#1087#1088#1077#1089#1089#1086#1088':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object aOPCImageList1: TaOPCImageList
    Items = <
      item
        Name = 'Compr.png'
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = 'Compr.png'
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = 'CompressorMode-Gray.bmp'
        Picture.Data = {
          07544269746D61707E2D0000424D7E2D00000000000036000000280000003D00
          00003F0000000100180000000000482D00000000000000000000000000000000
          0000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F00000000000000000000000000
          0000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000
          000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F000000000000000000000000000000000000C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000000000000000000000
          000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000000000
          00000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000000000000000000000000000000000
          00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000000000
          0000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6
          C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000000000000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F0000
          00000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000000000000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000000000000000
          0000000000000000C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000
          0000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F000000000000000000000000000000000000C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000000000000000000000000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000000000000000
          000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F000000000000
          000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000007F7F7F
          7F7F7F7F7F7F000000000000000000000000000000000000C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000000000C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600}
        Transparent = True
        TransparentColor = 46581446
      end
      item
        Name = 'CompressorMode-Green.bmp'
        Picture.Data = {
          07544269746D61707E2D0000424D7E2D00000000000036000000280000003D00
          00003F0000000100180000000000482D00000000000000000000000000000000
          0000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C60000000000E60000E60000000000000000000000000000
          0000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C60000000000E60000E60000E60000E60000E60000E60000E60000E600000000
          000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E600000000000000000000000000000000000000C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E600000000000000000000000000000000
          000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E6000000000000
          00000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C60000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E600000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E6000000000000000000000000000000000000
          00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000000000000000
          0000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E600000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6
          C60000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E6000000000000000000000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E6000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E6000000000000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E6000000000000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E6000000
          000000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E6000000000000000000000000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000000000000000000000
          0000000000000000C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000000000
          0000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E600000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C60000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E600000000000000000000000000000000000000C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E600
          00E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E600000000000000000000000000000000000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E6
          0000E60000E60000E60000E60000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E600000000000000000000000000
          000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C60000000000E60000E60000E60000E60000E60000E60000
          E60000E60000E60000E60000E60000E60000E60000E60000E600000000000000
          000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C60000000000E60000E60000E60000E60000E60000E60000E60000E60000E600
          000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C60000000000E600
          00E60000E600000000000000000000000000000000000000C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000000000C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600}
        Transparent = True
        TransparentColor = 46581446
      end
      item
        Name = 'CompressorMode-Blue.bmp'
        Picture.Data = {
          07544269746D61707E2D0000424D7E2D00000000000036000000280000003D00
          00003F0000000100180000000000482D00000000000000000000000000000000
          0000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600000000CC483FCC483F00000000000000000000000000
          0000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F000000
          000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483F000000000000000000000000000000000000C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483F000000000000000000000000000000
          000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000000000
          00000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483F0000000000000000000000000000000000
          00C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000
          0000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6
          C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483F00000000000000000000000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F00000000000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483F00000000000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F0000
          0000000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483F00000000000000000000000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000000000000000
          0000000000000000C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F00000000
          0000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483F000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483F000000000000000000000000000000000000C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483F
          CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483F000000000000000000000000000000000000
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC48
          3FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483F000000000000000000000000
          000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC
          483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F000000000000
          000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C600000000CC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483FCC483F
          000000000000000000000000000000000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000CC483F
          CC483FCC483F000000000000000000000000000000000000C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C600000000000000000000000000C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C6C6C6C600}
        Transparent = True
        TransparentColor = 46581446
      end>
    Left = 384
    Top = 456
  end
  object llCtrlMode: TaOPCLookupList
    Items.Strings = (
      '1=MANUAL'
      '2=AUTOMATIC')
    Left = 288
    Top = 424
  end
  object llStateMode: TaOPCLookupList
    Items.Strings = (
      '1=Ready'
      '2=Running'
      '5=Pause'
      '11=Running Suction Pressure Limit')
    Left = 288
    Top = 472
  end
end
