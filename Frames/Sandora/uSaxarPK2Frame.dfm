inherited frSaxar: TfrSaxar
  Width = 94
  Height = 179
  AutoSize = True
  ParentColor = False
  ExplicitWidth = 94
  ExplicitHeight = 179
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 94
    Height = 179
    AutoSize = True
    TabOrder = 0
    object Tank: TaOPCImage
      Left = 1
      Top = 18
      Width = 92
      Height = 160
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=17')
    end
    object Shape1: TaOPCShape
      Left = 1
      Top = 2
      Width = 92
      Height = 16
      Brush.Color = 13034239
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object lTankName: TaOPCLabel
      Left = 5
      Top = 1
      Width = 37
      Height = 18
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lSVCaption: TaOPCLabel
      Left = 8
      Top = 92
      Width = 25
      Height = 12
      Visible = False
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1042
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lSv: TaOPCLabel
      Left = 30
      Top = 92
      Width = 45
      Height = 12
      Cursor = crHandPoint
      Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1091#1093#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', %'
      OnDblClick = lSvDblClick
      Visible = False
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.00%'
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lTemperature: TaOPCLabel
      Left = 30
      Top = 79
      Width = 45
      Height = 12
      Hint = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1093#1088#1072#1085#1077#1085#1080#1103', '#176'C'
      OnChange = UpdateTankStatus
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
    end
    object lMassa: TaOPCLabel
      Left = 14
      Top = 39
      Width = 63
      Height = 15
      Hint = #1052#1072#1089#1089#1072', '#1082#1075
      OnChange = UpdateTankStatus
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 kg'
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
    end
    object gMassa: TaOPCGauge
      Left = 81
      Top = 22
      Width = 6
      Height = 109
      BackColor = 15395562
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 25000
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object lTemperatureCapture: TLabel
      Left = 8
      Top = 76
      Width = 25
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 't'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LevelUp: TaOPCImage
      Left = 77
      Top = 22
      Width = 15
      Height = 13
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=1')
    end
    object LevelDown: TaOPCImage
      Left = 77
      Top = 116
      Width = 15
      Height = 15
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=0')
    end
    object Clear: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = uStatChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=14')
    end
    object DrenagStart: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=8')
    end
    object DrenagStop: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=7')
    end
    object MoykaHand: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = uStatChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=19')
    end
    object MoykaRed: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = uStatChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=18')
    end
    object MoykaStart: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=11')
    end
    object MoykaStop: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=12')
    end
    object Service: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=4')
    end
    object Stiril: TaOPCImage
      Left = 39
      Top = 151
      Width = 19
      Height = 19
      OnChange = uStatChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=13')
    end
  end
  object pStep: TaOPCProvider
    OnChange = pStepChange
    Left = 8
    Top = 24
  end
  object uStat: TaOPCProvider
    OnChange = uStatChange
    Left = 8
    Top = 56
  end
end
