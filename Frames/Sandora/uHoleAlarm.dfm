inherited frHoleAlarm: TfrHoleAlarm
  Width = 189
  Height = 20
  AutoSize = True
  ParentColor = False
  ExplicitWidth = 189
  ExplicitHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 20
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object lHoleName: TaOPCBlinkLabel
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
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      BlinkInterval = 500
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = DEFAULT_CHARSET
      BlinkFont.Color = 1791
      BlinkFont.Height = -11
      BlinkFont.Name = 'Tahoma'
      BlinkFont.Style = []
    end
    object Antena: TaOPCImage
      Left = 73
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
      Left = 107
      Top = 0
      Width = 20
      Height = 20
      OnChange = ManholeChange
      Hints.Strings = (
        '0='#1051#1102#1082' '#1079#1072#1082#1088#1099#1090
        '1='#1051#1102#1082' '#1086#1090#1082#1088#1099#1090)
      Stretch = True
      States.Strings = (
        '0=12'
        '1=13')
    end
    object Dry: TaOPCImage
      Left = 169
      Top = 0
      Width = 20
      Height = 20
      OnChange = DryChange
      Hints.Strings = (
        '1='#1042#1086#1076#1072' '#1074' '#1087#1088#1080#1103#1084#1082#1077' '#1080#1083#1080' '#1089#1091#1093#1086#1081' '#1093#1086#1076)
      Stretch = True
      States.Strings = (
        '0=14'
        '1=15')
    end
  end
  object NoAnswer: TaOPCProvider
    OnChange = NoAnswerChange
    Left = 136
    Top = 65528
  end
  object Comm: TaOPCProvider
    OnChange = NoAnswerChange
    Left = 128
    Top = 65528
  end
end
