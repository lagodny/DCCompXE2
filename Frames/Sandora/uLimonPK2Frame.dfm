inherited frLimon: TfrLimon
  Width = 94
  Height = 180
  AutoSize = True
  ParentColor = False
  ExplicitWidth = 94
  ExplicitHeight = 180
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 94
    Height = 180
    AutoSize = True
    TabOrder = 0
    object Tank: TaOPCImage
      Left = 1
      Top = 19
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
      Height = 17
      Brush.Color = 13034239
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object lTankName: TaOPCLabel
      Left = 11
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
    object lTKCaption: TaOPCLabel
      Left = 7
      Top = 99
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
      Caption = #1058#1050
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lSVCaption: TaOPCLabel
      Left = 7
      Top = 87
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
      Left = 31
      Top = 86
      Width = 48
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
    object gMassa: TaOPCGauge
      Left = 81
      Top = 22
      Width = 6
      Height = 109
      BackColor = 15395562
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 3000
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object lTK: TaOPCLabel
      Left = 31
      Top = 98
      Width = 48
      Height = 18
      Cursor = crHandPoint
      Hint = #1050#1080#1089#1083#1086#1090#1085#1086#1089#1090#1100', pH'
      OnDblClick = lTKDblClick
      Visible = False
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.00 pH'
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
    object LevelUp: TaOPCImage
      Left = 77
      Top = 22
      Width = 15
      Height = 15
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=1')
    end
    object BlendStart: TaOPCImage
      Left = 15
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=6')
    end
    object BlendStop: TaOPCImage
      Left = 15
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=5')
    end
    object Clear: TaOPCImage
      Left = 65
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '60=14')
    end
    object DrenagStart: TaOPCImage
      Left = 40
      Top = 154
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=8')
    end
    object DrenagStartStek: TaOPCImage
      Left = 40
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=10')
    end
    object DrenagStop: TaOPCImage
      Left = 40
      Top = 154
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=7')
    end
    object DrenagStopStek: TaOPCImage
      Left = 40
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=9')
    end
    object MoykaStart: TaOPCImage
      Left = 65
      Top = 154
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=11')
    end
    object MoykaStop: TaOPCImage
      Left = 65
      Top = 154
      Width = 19
      Height = 19
      OnChange = pStepChange
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=12')
    end
    object QualityStart: TaOPCImage
      Left = 15
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=3')
    end
    object QualityStop: TaOPCImage
      Left = 15
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=2')
    end
    object Service: TaOPCImage
      Left = 15
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=4')
    end
    object Stiril: TaOPCImage
      Left = 65
      Top = 154
      Width = 19
      Height = 19
      Discrete = False
      Stretch = True
      States.Strings = (
        '61=13')
    end
    object LevelMiddle: TaOPCImage
      Left = 77
      Top = 68
      Width = 15
      Height = 15
      Discrete = False
      Stretch = True
      States.Strings = (
        '1=20')
    end
  end
  object pStep: TaOPCProvider
    OnChange = pStepChange
    Left = 8
    Top = 24
  end
end
