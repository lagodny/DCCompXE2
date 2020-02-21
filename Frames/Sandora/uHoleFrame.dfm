inherited frHole: TfrHole
  Width = 610
  Height = 20
  AutoSize = True
  ParentColor = False
  ExplicitWidth = 610
  ExplicitHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 610
    Height = 20
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object lHoleName: TaOPCLabel
      Left = 0
      Top = 3
      Width = 3
      Height = 14
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Potok: TaOPCLabel
      Left = 73
      Top = 3
      Width = 35
      Height = 14
      StairsOptions = [soIncrease]
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '0'
      Alignment = taCenter
      AutoSize = False
      BorderWidth = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object ModeImage: TaOPCImage
      Left = 204
      Top = 0
      Width = 20
      Height = 20
      OnChange = ModeImageChange
      OnDblClick = ModeImageDblClick
      Hints.Strings = (
        '0='#1056#1091#1095#1085#1086#1081
        '1='#1040#1074#1090#1086#1084#1072#1090)
      Stretch = True
      States.Strings = (
        '0=5'
        '1=4')
    end
    object StartImage: TaOPCImage
      Left = 230
      Top = 0
      Width = 20
      Height = 20
      OnDblClick = ModeImageDblClick
      Hints.Strings = (
        '0='#1057#1090#1086#1087
        '1='#1055#1091#1089#1082)
      Stretch = True
      States.Strings = (
        '0=7'
        '1=6')
    end
    object D1: TaOPCImage
      Left = 262
      Top = 0
      Width = 20
      Height = 20
      Hints.Strings = (
        '0='#1053#1072#1089#1086#1089' '#1074#1099#1082#1083#1102#1095#1077#1085
        '1='#1053#1072#1089#1086#1089' '#1074#1082#1083#1102#1095#1077#1085)
      Stretch = True
      States.Strings = (
        '0=0'
        '1=1')
    end
    object HoleTime: TaOPCLabel
      Left = 483
      Top = 3
      Width = 45
      Height = 14
      StairsOptions = [soIncrease]
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '0 '#1095
      Alignment = taCenter
      AutoSize = False
      BorderWidth = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object Prior: TaOPCLabel
      Left = 565
      Top = 3
      Width = 45
      Height = 14
      PopupMenu = PopupMenu
      StairsOptions = [soIncrease]
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '0'
      Alignment = taCenter
      AutoSize = False
      BorderWidth = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object Counter: TaOPCLabel
      Left = 120
      Top = 3
      Width = 59
      Height = 14
      StairsOptions = [soIncrease]
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '0'
      Alignment = taCenter
      AutoSize = False
      BorderWidth = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object MLabel: TaOPCLabel
      Left = 180
      Top = 3
      Width = 8
      Height = 14
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1084
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TaOPCLabel
      Left = 188
      Top = 1
      Width = 4
      Height = 10
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taRightJustify
      Caption = '3'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Antena: TaOPCImage
      Left = 299
      Top = 0
      Width = 20
      Height = 20
      Hints.Strings = (
        '0='#1057#1074#1103#1079#1100' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
        '1='#1053#1077#1090' '#1089#1074#1103#1079#1080)
      Stretch = True
      States.Strings = (
        '0=9'
        '1=10')
    end
    object Manhole: TaOPCImage
      Left = 333
      Top = 0
      Width = 20
      Height = 20
      Hints.Strings = (
        '0='#1051#1102#1082' '#1079#1072#1082#1088#1099#1090
        '1='#1051#1102#1082' '#1086#1090#1082#1088#1099#1090)
      Stretch = True
      States.Strings = (
        '0=12'
        '1=13')
    end
    object Dry: TaOPCImage
      Left = 395
      Top = 0
      Width = 20
      Height = 20
      Hints.Strings = (
        '1='#1042#1086#1076#1072' '#1074' '#1087#1088#1080#1103#1084#1082#1077' '#1080#1083#1080' '#1089#1091#1093#1086#1081' '#1093#1086#1076)
      Stretch = True
      States.Strings = (
        '0=14'
        '1=15')
    end
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 16
    Top = 65528
    object N11: TMenuItem
      Caption = '1'
      OnClick = N11Click
    end
    object N21: TMenuItem
      Caption = '2'
      OnClick = N11Click
    end
    object N31: TMenuItem
      Caption = '3'
      OnClick = N11Click
    end
    object N41: TMenuItem
      Caption = '4'
      OnClick = N11Click
    end
    object N51: TMenuItem
      Caption = '5'
      OnClick = N11Click
    end
    object N61: TMenuItem
      Caption = '6'
      OnClick = N11Click
    end
    object N71: TMenuItem
      Caption = '7'
      OnClick = N11Click
    end
    object N81: TMenuItem
      Caption = '8'
      OnClick = N11Click
    end
    object N91: TMenuItem
      Caption = '9'
      OnClick = N11Click
    end
    object N101: TMenuItem
      Caption = '10'
      OnClick = N11Click
    end
    object N111: TMenuItem
      Caption = '11'
      OnClick = N11Click
    end
    object N121: TMenuItem
      Caption = '12'
      OnClick = N11Click
    end
    object N131: TMenuItem
      Caption = '13'
      OnClick = N11Click
    end
    object N141: TMenuItem
      Caption = '14'
      OnClick = N11Click
    end
    object N151: TMenuItem
      Caption = '15'
      OnClick = N11Click
    end
    object N161: TMenuItem
      Caption = '16'
      OnClick = N11Click
    end
  end
  object NoAnswer: TaOPCProvider
    OnChange = NoAnswerChange
    Top = 65528
  end
  object Comm: TaOPCProvider
    OnChange = NoAnswerChange
    Left = 40
    Top = 65528
  end
end
