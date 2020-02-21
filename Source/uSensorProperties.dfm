object SensorPropertiesForm: TSensorPropertiesForm
  Left = 0
  Top = 0
  ActiveControl = JvPageListTreeView1
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1076#1072#1090#1095#1080#1082#1072
  ClientHeight = 393
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 159
    Top = 351
    Width = 481
    Height = 2
  end
  object bOk: TButton
    Left = 484
    Top = 359
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCancel: TButton
    Left = 565
    Top = 359
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object JvPageList1: TJvPageList
    Left = 158
    Top = 8
    Width = 481
    Height = 337
    ActivePage = JvStandardPage4
    PropagateEnable = False
    object JvStandardPage1: TJvStandardPage
      Left = 0
      Top = 0
      Width = 481
      Height = 337
      Caption = 'JvStandardPage1'
      object GroupBox3: TGroupBox
        Left = 3
        Top = 3
        Width = 475
        Height = 158
        Caption = #1044#1072#1090#1095#1080#1082
        TabOrder = 0
        object Label2: TLabel
          Left = 13
          Top = 74
          Width = 112
          Height = 13
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        end
        object Label18: TLabel
          Left = 13
          Top = 101
          Width = 99
          Height = 13
          Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        end
        object Label19: TLabel
          Left = 13
          Top = 128
          Width = 38
          Height = 13
          Caption = #1060#1086#1088#1084#1072#1090
        end
        object Label1: TLabel
          Left = 13
          Top = 47
          Width = 73
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 13
          Top = 20
          Width = 82
          Height = 13
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object eFullName: TEdit
          Left = 136
          Top = 71
          Width = 329
          Height = 21
          TabOrder = 2
          Text = 'eFullName'
        end
        object eUnitName: TEdit
          Left = 136
          Top = 98
          Width = 182
          Height = 21
          TabOrder = 3
          Text = 'eUnitName'
        end
        object eDisplayFormat: TEdit
          Left = 136
          Top = 125
          Width = 182
          Height = 21
          TabOrder = 4
          Text = 'eDisplayFormat'
        end
        object eName: TEdit
          Left = 136
          Top = 44
          Width = 329
          Height = 21
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 1
          Text = 'eName'
        end
        object eID: TEdit
          Left = 136
          Top = 17
          Width = 86
          Height = 21
          Ctl3D = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          Text = 'eID'
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 167
        Width = 475
        Height = 162
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1095#1090#1077#1085#1080#1103
        TabOrder = 1
        object Label11: TLabel
          Left = 18
          Top = 134
          Width = 192
          Height = 13
          Hint = #1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1080#1085#1090#1077#1088#1074#1072#1083' '#1084#1077#1078#1076#1091' '#1095#1090#1077#1085#1080#1077#1084' '#1087#1086#1082#1072#1079#1072#1085#1080#1081
          Caption = #1052#1080#1085'. '#1080#1085#1090#1077#1088#1074#1072#1083' '#1095#1090#1077#1085#1080#1103' ('#1085#1077' '#1095#1072#1097#1077' '#1095#1077#1084'):'
        end
        object Label10: TLabel
          Left = 18
          Top = 107
          Width = 157
          Height = 13
          Hint = #1080#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093':'
        end
        object Label15: TLabel
          Left = 311
          Top = 107
          Width = 11
          Height = 13
          Caption = #1084#1089
        end
        object Label14: TLabel
          Left = 312
          Top = 135
          Width = 11
          Height = 13
          Caption = #1084#1089
        end
        object Label3: TLabel
          Left = 18
          Top = 26
          Width = 77
          Height = 13
          Caption = #1040#1076#1088#1077#1089' '#1076#1072#1090#1095#1080#1082#1072
        end
        object Label4: TLabel
          Left = 18
          Top = 53
          Width = 100
          Height = 13
          Caption = #1040#1076#1088#1077#1089' '#1082#1086#1085#1090#1088#1086#1083#1083#1077#1088#1072
        end
        object Label5: TLabel
          Left = 18
          Top = 80
          Width = 112
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
        end
        object eMinReadInterval: TEdit
          Left = 216
          Top = 131
          Width = 90
          Height = 21
          Hint = #1084#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1080#1085#1090#1077#1088#1074#1072#1083' '#1084#1077#1078#1076#1091' '#1095#1090#1077#1085#1080#1077#1084' '#1087#1086#1082#1072#1079#1072#1085#1080#1081
          TabOrder = 4
          Text = 'eMinReadInterval'
        end
        object eUpdateInterval: TEdit
          Left = 216
          Top = 104
          Width = 90
          Height = 21
          Hint = #1080#1085#1090#1077#1088#1074#1072#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
          TabOrder = 3
          Text = 'eUpdateInterval'
        end
        object ePath: TEdit
          Left = 136
          Top = 23
          Width = 329
          Height = 21
          TabOrder = 0
          Text = 'ePath'
        end
        object eEquipmentPath: TEdit
          Left = 136
          Top = 50
          Width = 329
          Height = 21
          TabOrder = 1
          Text = 'eEquipmentPath'
        end
        object eThreadName: TEdit
          Left = 136
          Top = 77
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Text = 'eThreadName'
        end
      end
    end
    object JvStandardPage3: TJvStandardPage
      Left = 0
      Top = 0
      Width = 481
      Height = 337
      Caption = 'JvStandardPage3'
      object GroupBox5: TGroupBox
        Left = 3
        Top = 3
        Width = 475
        Height = 326
        Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        TabOrder = 0
        object Label24: TLabel
          Left = 44
          Top = 178
          Width = 165
          Height = 15
          AutoSize = False
          Caption = #1058#1072#1073#1083#1080#1094#1072' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1081':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label7: TLabel
          Left = 46
          Top = 97
          Width = 99
          Height = 13
          Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' (A) ='
        end
        object Label8: TLabel
          Left = 46
          Top = 119
          Width = 82
          Height = 13
          Caption = #1057#1083#1072#1075#1072#1077#1084#1086#1077' (B) ='
        end
        object Label22: TLabel
          Left = 21
          Top = 49
          Width = 177
          Height = 13
          Caption = #1060#1091#1085#1082#1094#1080#1103' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103'  (Func) ='
        end
        object Label23: TLabel
          Left = 21
          Top = 27
          Width = 178
          Height = 13
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1086' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' (X) ='
        end
        object ResValue: TaOPCLabel
          Left = 268
          Top = 259
          Width = 163
          Height = 13
          OnChange = ResValueChange
          InteractiveFont.Charset = DEFAULT_CHARSET
          InteractiveFont.Color = clHighlight
          InteractiveFont.Height = -11
          InteractiveFont.Name = 'Tahoma'
          InteractiveFont.Style = [fsUnderline]
          AutoSize = False
          Caption = 'ResValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object XValue: TaOPCLabel
          Left = 205
          Top = 27
          Width = 137
          Height = 13
          InteractiveFont.Charset = DEFAULT_CHARSET
          InteractiveFont.Color = clHighlight
          InteractiveFont.Height = -11
          InteractiveFont.Name = 'Tahoma'
          InteractiveFont.Style = [fsUnderline]
          AutoSize = False
          Caption = 'XValue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 21
          Top = 289
          Width = 436
          Height = 34
          AutoSize = False
          Caption = 
            #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077': '#1082#1086#1101#1092#1092#1092#1080#1094#1080#1077#1085#1090' (A) '#1080' '#1089#1083#1072#1075#1072#1077#1084#1086#1077' (B) '#1080#1089#1087#1086#1083#1100#1079#1091#1102#1090#1089#1103' '#1076#1083#1103' '#1087#1088 +
            #1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093' '#1090#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1085#1077' '#1079#1072#1076#1072#1085#1072' '#1058#1072#1073#1083#1080#1094#1072' '#1087#1088#1077#1086#1073 +
            #1088#1072#1079#1086#1074#1072#1085#1080#1081'. '
          WordWrap = True
        end
        object Label31: TLabel
          Left = 21
          Top = 259
          Width = 240
          Height = 13
          Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1089#1083#1077' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' ('#1056#1077#1079#1091#1083#1100#1090#1072#1090') ='
        end
        object sgTransforms: TStringGrid
          Left = 211
          Top = 155
          Width = 246
          Height = 86
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 110
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
          ParentCtl3D = False
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object eCorrectM: TEdit
          Left = 211
          Top = 94
          Width = 137
          Height = 21
          TabOrder = 2
          Text = 'eCorrectM'
        end
        object eCorrect: TEdit
          Left = 211
          Top = 116
          Width = 137
          Height = 21
          TabOrder = 3
          Text = 'eCorrect'
        end
        object eFuncName: TEdit
          Left = 211
          Top = 46
          Width = 246
          Height = 21
          TabOrder = 1
          Text = 'eFuncName'
        end
        object RadioButton1: TRadioButton
          Left = 21
          Top = 75
          Width = 203
          Height = 13
          Caption = '1. '#1056#1077#1079#1091#1083#1100#1090#1072#1090' = A*Func(X) + B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 21
          Top = 155
          Width = 188
          Height = 13
          Caption = '2. '#1056#1077#1079#1091#1083#1100#1090#1072#1090' = '#1058#1072#1073#1083#1080#1094#1072'[Func(X)]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = RadioButton1Click
        end
      end
    end
    object JvStandardPage4: TJvStandardPage
      Left = 0
      Top = 0
      Width = 481
      Height = 337
      Caption = 'JvStandardPage4'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 475
        Height = 126
        Caption = #1057#1075#1083#1072#1078#1080#1074#1072#1085#1080#1077':'
        TabOrder = 0
        object Label21: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = #1052#1077#1090#1086#1076':'
        end
        object Label25: TLabel
          Left = 16
          Top = 46
          Width = 53
          Height = 13
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083':'
        end
        object Label26: TLabel
          Left = 302
          Top = 44
          Width = 11
          Height = 13
          Caption = #1084#1089
        end
        object Label30: TLabel
          Left = 16
          Top = 70
          Width = 439
          Height = 41
          AutoSize = False
          Caption = 
            #1050#1086#1075#1076#1072' '#1074#1082#1083#1102#1095#1077#1085#1086' '#1089#1075#1083#1072#1078#1080#1074#1072#1085#1080#1077', '#1085#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1086#1087#1088#1077#1076#1077#1083#1103#1077#1090#1089#1103' '#1085#1072' '#1086#1089#1085#1086#1074 +
            #1072#1085#1080#1080' '#1085#1072#1082#1086#1087#1083#1077#1085#1085#1099#1093' '#1079#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1080#1085#1090#1077#1088#1074#1072#1083' '#1074#1088#1077#1084#1077#1085#1080' '#1079#1085#1072#1095#1077#1085#1080#1081', '#1089#1086#1075#1083#1072#1089#1085 +
            #1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1084#1077#1090#1086#1076#1080#1082#1077
          WordWrap = True
        end
        object cbSmoothKind: TComboBox
          Left = 168
          Top = 21
          Width = 149
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = #1085#1077#1090
          Items.Strings = (
            #1085#1077#1090
            #1089#1082#1086#1083#1100#1079#1103#1097#1077#1077' '#1089#1088#1077#1076#1085#1077#1077
            #1084#1077#1090#1086#1076' '#1084#1077#1076#1080#1072#1085)
        end
        object eSmoothInterval: TEdit
          Left = 168
          Top = 43
          Width = 126
          Height = 21
          TabOrder = 1
          Text = 'eSmoothInterval'
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 135
        Width = 475
        Height = 186
        Caption = #1057#1078#1072#1090#1080#1077' '#1080' '#1093#1088#1072#1085#1077#1085#1080#1077':'
        TabOrder = 1
        object Label27: TLabel
          Left = 16
          Top = 24
          Width = 37
          Height = 13
          Caption = #1052#1077#1090#1086#1076':'
        end
        object Label9: TLabel
          Left = 16
          Top = 73
          Width = 150
          Height = 13
          Caption = #1044#1077#1083#1100#1090#1072' '#1085#1077#1095#1091#1074#1089#1090#1074#1080#1090#1077#1083#1100#1085#1086#1089#1090#1080':'
        end
        object lDelta: TLabel
          Left = 264
          Top = 73
          Width = 41
          Height = 13
          Caption = #1077#1076'. '#1080#1079#1084'.'
        end
        object Label13: TLabel
          Left = 16
          Top = 46
          Width = 116
          Height = 13
          Hint = #1080#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1044
          Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1044':'
        end
        object Label20: TLabel
          Left = 302
          Top = 47
          Width = 11
          Height = 13
          Caption = #1084#1089
        end
        object Label28: TLabel
          Left = 16
          Top = 95
          Width = 125
          Height = 13
          Caption = #1058#1086#1095#1085#1086#1089#1090#1100' '#1072#1087#1088#1086#1082#1089#1080#1084#1072#1094#1080#1080':'
        end
        object Label17: TLabel
          Left = 16
          Top = 151
          Width = 142
          Height = 13
          Caption = #1058#1086#1095#1085#1086#1089#1090#1100' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093':'
        end
        object cbWriterKind: TComboBox
          Left = 168
          Top = 21
          Width = 149
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = #1085#1077#1090
          Items.Strings = (
            #1085#1077#1090
            #1089#1088#1077#1076#1085#1077#1074#1079#1074#1077#1096#1077#1085#1085#1086#1077
            #1084#1077#1090#1086#1076' '#1084#1077#1076#1080#1072#1085)
        end
        object eDelta: TEdit
          Left = 168
          Top = 70
          Width = 90
          Height = 21
          Hint = #1052#1105#1088#1090#1074#1072#1103' '#1079#1086#1085#1072' ('#1080#1085#1090#1077#1088#1074#1072#1083' '#1090#1080#1096#1080#1085#1099')'
          TabOrder = 2
          Text = 'eDelta'
        end
        object eUpdateDBInterval: TEdit
          Left = 168
          Top = 43
          Width = 126
          Height = 21
          Hint = #1080#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1044
          TabOrder = 1
          Text = 'eUpdateDBInterval'
        end
        object eApproxPrecision: TEdit
          Left = 168
          Top = 92
          Width = 90
          Height = 21
          TabOrder = 3
          Text = 'eApproxPrecision'
        end
        object ePrecision: TEdit
          Left = 168
          Top = 148
          Width = 118
          Height = 21
          TabOrder = 4
          Text = 'ePrecision'
        end
      end
    end
    object JvStandardPage5: TJvStandardPage
      Left = 0
      Top = 0
      Width = 481
      Height = 337
      Caption = 'JvStandardPage5'
      object gbReference: TGroupBox
        Left = 3
        Top = 3
        Width = 475
        Height = 78
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        TabOrder = 0
        object Label16: TLabel
          Left = 9
          Top = 19
          Width = 61
          Height = 13
          Hint = #1089#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1080' '#1079#1085#1072#1095#1077#1085#1080#1081
          Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
        end
        object eRefTableName: TEdit
          Left = 127
          Top = 16
          Width = 186
          Height = 21
          Hint = #1089#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1080' '#1079#1085#1072#1095#1077#1085#1080#1081
          TabOrder = 0
          Text = 'eRefTableName'
        end
        object eRefAutoFill: TCheckBox
          Left = 9
          Top = 43
          Width = 304
          Height = 17
          Alignment = taLeftJustify
          Caption = #1040#1074#1090#1086#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
          TabOrder = 1
        end
      end
    end
  end
  object JvPageListTreeView1: TJvPageListTreeView
    Left = 8
    Top = 8
    Width = 145
    Height = 345
    PageDefault = 0
    PageList = JvPageList1
    HideSelection = False
    Indent = 19
    TabOrder = 0
    Items.NodeData = {
      03040000004A0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000
      000000000001162704420435043D04380435042000380420003F044004350434
      0441044204300432043B0435043D04380435043A0000000200000000000000FF
      FFFFFFFFFFFFFFFFFFFFFF0100000000000000010E1F04400435043E04310440
      04300437043E04320430043D0438043504460000000300000000000000FFFFFF
      FFFFFFFFFFFFFFFFFF020000000000000001141E0431044004300431043E0442
      043A0430042000380420004504400430043D0435043D04380435043200000000
      00000000000000FFFFFFFFFFFFFFFFFFFFFFFF0300000000000000010A21043F
      044004300432043E0447043D0438043A04}
    Items.Links = {0400000000000000010000000200000003000000}
  end
end
