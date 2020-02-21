inherited frCupag1PK: TfrCupag1PK
  Width = 109
  Height = 244
  ParentColor = False
  ExplicitWidth = 109
  ExplicitHeight = 244
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 109
    Height = 244
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Fon: TaOPCImage
      Left = 0
      Top = 20
      Width = 109
      Height = 224
      Value = '0'
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=19'
        '1=19')
    end
    object Ramka: TaOPCImage
      Left = 7
      Top = 216
      Width = 32
      Height = 22
      Value = '0'
      Stretch = True
      States.Strings = (
        '0=35')
    end
    object Shape1: TaOPCShape
      Left = 1
      Top = 0
      Width = 108
      Height = 20
      Brush.Color = 13034239
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object lSiName: TaOPCLabel
      Left = 38
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
    object LockP1: TaOPCLabel
      Left = 37
      Top = 172
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object AlarmP1: TaOPCLabel
      Left = 8
      Top = 172
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object LockP2: TaOPCLabel
      Left = 77
      Top = 171
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object AlarmP2: TaOPCLabel
      Left = 68
      Top = 171
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object Label1: TLabel
      Left = 5
      Top = 3
      Width = 7
      Height = 15
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 97
      Top = 3
      Width = 7
      Height = 15
      Caption = '2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Clapan1: TaOPCImage2In
      Left = 6
      Top = 101
      Width = 26
      Height = 24
      Cursor = crHandPoint
      Hint = #1050#1088#1099#1096#1082#1072' '#1083#1102#1082#1072
      OnChange = Clapan1Change
      OnClick = Clapan1DblClick
      OnDblClick = Clapan1DblClick
      Interactive = True
      Stretch = True
      States.Strings = (
        '00=0'
        '01=2'
        '10=1'
        '11=3')
    end
    object Clapan2: TaOPCImage2In
      Left = 77
      Top = 101
      Width = 26
      Height = 24
      Cursor = crHandPoint
      Hint = #1050#1088#1099#1096#1082#1072' '#1083#1102#1082#1072
      OnChange = Clapan2Change
      OnClick = Clapan2Click
      OnDblClick = Clapan2Click
      Interactive = True
      Stretch = True
      States.Strings = (
        '00=24'
        '01=26'
        '10=25'
        '11=27')
    end
    object K1: TaOPCImage2In
      Left = 88
      Top = 50
      Width = 7
      Height = 9
      Hint = #1050'1 - '#1082#1086#1085#1094#1077#1085#1090#1088#1072#1090
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=12'
        '01=11 ')
      ErrorImageIndex = 37
      Animate = False
    end
    object K10: TaOPCImage2In
      Left = 62
      Top = 81
      Width = 9
      Height = 7
      Hint = #1050'10'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K11: TaOPCImage2In
      Left = 9
      Top = 81
      Width = 9
      Height = 7
      Hint = #1050'11'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K12: TaOPCImage2In
      Left = 31
      Top = 91
      Width = 7
      Height = 9
      Hint = #1050'12'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K13: TaOPCImage2In
      Left = 71
      Top = 91
      Width = 7
      Height = 9
      Hint = #1050'13'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K14: TaOPCImage2In
      Left = 91
      Top = 81
      Width = 9
      Height = 7
      Hint = #1050'14'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K15: TaOPCImage2In
      Left = 30
      Top = 196
      Width = 9
      Height = 7
      Hint = #1050'15'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K16: TaOPCImage2In
      Left = 70
      Top = 196
      Width = 9
      Height = 7
      Hint = #1050'16'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K17: TaOPCImage2In
      Left = 8
      Top = 217
      Width = 9
      Height = 7
      Hint = #1050'17'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K18: TaOPCImage2In
      Left = 28
      Top = 217
      Width = 9
      Height = 7
      Hint = #1050'18'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K19: TaOPCImage2In
      Left = 59
      Top = 217
      Width = 9
      Height = 7
      Hint = #1050'19'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K2: TaOPCImage2In
      Left = 52
      Top = 50
      Width = 7
      Height = 9
      Hint = #1050'2 - '#1089#1072#1093#1072#1088#1085#1099#1081' '#1089#1080#1088#1086#1087
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=12'
        '01=11 ')
      ErrorImageIndex = 37
      Animate = False
    end
    object K20: TaOPCImage2In
      Left = 19
      Top = 227
      Width = 7
      Height = 9
      Hint = #1050'20'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=8'
        '01=8')
      ErrorImageIndex = 37
      Animate = False
    end
    object K21: TaOPCImage2In
      Left = 20
      Top = 202
      Width = 7
      Height = 9
      Hint = #1050'21'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K22: TaOPCImage2In
      Left = 82
      Top = 202
      Width = 7
      Height = 9
      Hint = #1050'22'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K23: TaOPCImage2In
      Left = 9
      Top = 202
      Width = 7
      Height = 9
      Hint = #1050'23'
      OnChange = K23Change
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K24: TaOPCImage2In
      Left = 93
      Top = 202
      Width = 7
      Height = 9
      Hint = #1050'24'
      OnChange = K24Change
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K3: TaOPCImage2In
      Left = 14
      Top = 50
      Width = 7
      Height = 9
      Hint = #1050'3 - '#1074#1086#1076#1072
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=12'
        '01=11 ')
      ErrorImageIndex = 37
      Animate = False
    end
    object K4: TaOPCImage2In
      Left = 84
      Top = 64
      Width = 7
      Height = 9
      Hint = #1050'4'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K5: TaOPCImage2In
      Left = 19
      Top = 65
      Width = 7
      Height = 9
      Hint = #1050'5'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K6: TaOPCImage2In
      Left = 40
      Top = 64
      Width = 9
      Height = 7
      Hint = #1050'6'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K7: TaOPCImage2In
      Left = 62
      Top = 64
      Width = 9
      Height = 7
      Hint = #1050'7'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object K8: TaOPCImage2In
      Left = 52
      Top = 72
      Width = 7
      Height = 9
      Hint = #1050'8'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=8'
        '11=9'
        '10=10'
        '01=11')
      ErrorImageIndex = 37
      Animate = False
    end
    object K9: TaOPCImage2In
      Left = 40
      Top = 81
      Width = 9
      Height = 7
      Hint = #1050'9'
      OnMouseDown = K18MouseDown
      Stretch = True
      States.Strings = (
        '00=13'
        '11=14'
        '10=15'
        '01=16')
      ErrorImageIndex = 36
    end
    object Lamp1: TaOPCGifImage
      Left = 36
      Top = 115
      Width = 10
      Height = 10
      Hint = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1052#1048
      Stretch = True
      States.Strings = (
        '0=4'
        '1=5')
    end
    object Lamp2: TaOPCGifImage
      Left = 63
      Top = 115
      Width = 10
      Height = 10
      Hint = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1052#1048
      Stretch = True
      States.Strings = (
        '0=4'
        '1=5')
    end
    object Si1: TaOPCImage
      Left = 1
      Top = 125
      Width = 47
      Height = 69
      Cursor = crHandPoint
      OnChange = Si1Change
      OnClick = Si1DblClick
      OnDblClick = Si1DblClick
      Value = '0'
      Interactive = True
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=6'
        '1=7')
    end
    object Si2: TaOPCImage
      Left = 62
      Top = 125
      Width = 47
      Height = 69
      Cursor = crHandPoint
      OnChange = Si2Change
      OnClick = Si2Click
      OnDblClick = Si2Click
      Value = '0'
      Interactive = True
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=6'
        '1=7')
    end
    object Status: TaOPCLabel
      Left = 6
      Top = 51
      Width = 3
      Height = 13
      Hint = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099
      OnChange = StatusChange
      PopupMenu = PopupMenu1
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Work: TaOPCImage
      Left = 4
      Top = 66
      Width = 9
      Height = 9
      Hint = #1056#1091#1095#1085#1086#1081'/'#1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1088#1077#1078#1080#1084#1099
      OnChange = WorkChange
      ShowHint = True
      Stretch = True
      States.Strings = (
        '0=17'
        '1=18')
    end
    object Pump: TaOPCImage2In
      Left = 86
      Top = 216
      Width = 14
      Height = 12
      Hint = #1053#1072#1089#1086#1089
      Stretch = True
      States.Strings = (
        '00=20'
        '11=21'
        '10=32'
        '01=33')
    end
    object Circ1: TaOPCImage2In
      Left = 6
      Top = 130
      Width = 11
      Height = 5
      Hint = #1052#1077#1096#1072#1083#1082#1072' '#1074#1082#1083#1102#1095#1077#1085#1072
      Stretch = True
      States.Strings = (
        '00=22'
        '11=23'
        '10=30'
        '01=31')
    end
    object Circ2: TaOPCImage2In
      Left = 93
      Top = 130
      Width = 11
      Height = 5
      Hint = #1052#1077#1096#1072#1083#1082#1072' '#1074#1082#1083#1102#1095#1077#1085#1072
      Stretch = True
      States.Strings = (
        '00=22'
        '11=23'
        '10=30'
        '01=31')
    end
    object gMassa1: TaOPCGauge
      Left = 43
      Top = 125
      Width = 4
      Height = 50
      OnChange = gMassa1Change
      Visible = False
      BackColor = 15395562
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 3400
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object gMassa2: TaOPCGauge
      Left = 62
      Top = 125
      Width = 4
      Height = 50
      OnChange = gMassa2Change
      Visible = False
      BackColor = 15395562
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 3400
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object UnLockP1: TaOPCLabel
      Left = 36
      Top = 171
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object UnLockP2: TaOPCLabel
      Left = 76
      Top = 170
      Width = 3
      Height = 13
      Visible = False
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
    end
    object RedLeft: TaOPCImage
      Left = 44
      Top = 171
      Width = 7
      Height = 7
      Visible = False
      Value = '29'
      Discrete = False
      Stretch = True
    end
    object RedRight: TaOPCImage
      Left = 58
      Top = 171
      Width = 7
      Height = 7
      Visible = False
      Value = '28'
      Discrete = False
      Stretch = True
    end
    object LimitSensor1: TaOPCImage
      Left = 2
      Top = 173
      Width = 45
      Height = 11
      Stretch = True
      States.Strings = (
        '0=22'
        '1=34')
    end
    object LimitSensor2: TaOPCImage
      Left = 63
      Top = 173
      Width = 45
      Height = 11
      Stretch = True
      States.Strings = (
        '0=22'
        '1=34')
    end
    object WaterLabel: TaOPCLabel
      Left = 22
      Top = 47
      Width = 7
      Height = 13
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object aOPCLabel1: TaOPCLabel
      Left = 96
      Top = 47
      Width = 7
      Height = 13
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object aOPCLabel2: TaOPCLabel
      Left = 60
      Top = 47
      Width = 7
      Height = 13
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DozatorConc: TaOPCImage
      Left = 75
      Top = 24
      Width = 33
      Height = 20
      Hint = #1044#1086#1079#1072#1090#1086#1088' '#1082#1086#1085#1094#1077#1085#1090#1088#1072#1090#1072
      Value = '1'
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=38'
        '1=38')
    end
    object DozatorSugar: TaOPCImage
      Left = 39
      Top = 24
      Width = 33
      Height = 20
      Hint = #1044#1086#1079#1072#1090#1086#1088' '#1089#1072#1093#1072#1088#1072
      Value = '1'
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=38'
        '1=38')
    end
    object DozatorWater: TaOPCImage
      Left = 1
      Top = 24
      Width = 33
      Height = 20
      Hint = #1044#1086#1079#1072#1090#1086#1088' '#1074#1086#1076#1099
      Value = '1'
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=38'
        '1=38')
    end
    object lSugarDoz: TaOPCLabel
      Left = 41
      Top = 25
      Width = 30
      Height = 13
      Hint = #1057#1072#1093#1072#1088'. '#1047#1072#1076#1072#1085#1086
      OnChange = lSugarDozChange
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lConcDoz: TaOPCLabel
      Left = 77
      Top = 25
      Width = 30
      Height = 13
      Hint = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090'. '#1047#1072#1076#1072#1085#1086
      OnChange = lSugarDozChange
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lWaterDoz: TaOPCLabel
      Left = 3
      Top = 25
      Width = 30
      Height = 13
      Hint = #1042#1086#1076#1072'. '#1047#1072#1076#1072#1085#1086
      OnChange = lSugarDozChange
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 64
    Top = 208
    object N01: TMenuItem
      Caption = '0'
      Hint = 'Off Line'
      OnClick = N01Click
    end
    object N11: TMenuItem
      Caption = '1'
      Hint = #1053#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 1, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 2'
      OnClick = N01Click
    end
    object N21: TMenuItem
      Caption = '2'
      Hint = #1053#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 2, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 1'
      OnClick = N01Click
    end
    object N31: TMenuItem
      Caption = '3'
      Hint = #1054#1087#1086#1083#1072#1089#1082#1080#1074#1072#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 2, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 1'
      OnClick = N01Click
    end
    object N41: TMenuItem
      Caption = '4'
      Hint = #1054#1087#1086#1083#1072#1089#1082#1080#1074#1072#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 1, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 2'
      OnClick = N01Click
    end
    object N51: TMenuItem
      Caption = '5'
      Hint = #1052#1086#1081#1082#1072' '#1105#1084#1082#1086#1089#1090#1080' 1'
      OnClick = N01Click
    end
    object N61: TMenuItem
      Caption = '6'
      Hint = #1052#1086#1081#1082#1072' '#1105#1084#1082#1086#1089#1090#1080' 2'
      OnClick = N01Click
    end
    object N71: TMenuItem
      Caption = '7'
      Hint = #1052#1086#1081#1082#1072' '#1105#1084#1082#1086#1089#1090#1077#1081' 1 '#1080' 2'
      OnClick = N01Click
    end
    object N81: TMenuItem
      Caption = '8'
      Hint = #1044#1088#1077#1085#1072#1078
      OnClick = N01Click
    end
  end
  object FEnter: TaOPCProvider
    Left = 40
    Top = 208
  end
  object FStatus: TaOPCProvider
    Left = 48
    Top = 208
  end
end
