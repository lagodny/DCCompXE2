inherited frCupagTank: TfrCupagTank
  Width = 438
  Height = 519
  Color = 11249050
  ParentColor = False
  OnMouseDown = FrameMouseDown
  ExplicitWidth = 438
  ExplicitHeight = 519
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 519
    Align = alClient
    Color = 11249050
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    OnStartDrag = Panel1StartDrag
    object T1: TaOPCGauge
      Left = 129
      Top = 240
      Width = 11
      Height = 130
      Value = '0'
      BorderStyle = bsNone
      ForeColor = 16777088
      Kind = gkVerticalBar
      MaxValue = 3500
      Progress = 0
      ShowText = False
    end
    object T2: TaOPCGauge
      Left = 294
      Top = 239
      Width = 11
      Height = 130
      Value = '0'
      BorderStyle = bsNone
      Color = clBtnFace
      ForeColor = 16777088
      Kind = gkVerticalBar
      MaxValue = 3500
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object aOPCImage64: TaOPCImage
      Left = 260
      Top = 218
      Width = 79
      Height = 167
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
    end
    object aOPCImage63: TaOPCImage
      Left = 96
      Top = 218
      Width = 79
      Height = 167
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
    end
    object s1: TaOPCImage
      Left = 158
      Top = 189
      Width = 5
      Height = 5
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object Label1: TaOPCLabel
      Tag = 1
      Left = 347
      Top = 29
      Width = 66
      Height = 15
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TaOPCLabel
      Tag = 1
      Left = 28
      Top = 76
      Width = 29
      Height = 15
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1042#1086#1076#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TaOPCLabel
      Tag = 1
      Left = 377
      Top = 77
      Width = 37
      Height = 15
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1057#1080#1088#1086#1087
      Color = clLime
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object gConcentrat: TaOPCGauge
      Left = 220
      Top = 16
      Width = 49
      Height = 25
      OPCSource = pConcentrat
      BorderStyle = bsNone
      Kind = gkNeedle
      MaxValue = 40000
      Progress = 0
    end
    object lConcentrat: TaOPCLabel
      Left = 228
      Top = 56
      Width = 61
      Height = 14
      OnMouseDown = lConcentratMouseDown
      OPCSource = pConcentrat
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1083'/'#1095
      Alignment = taCenter
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object gWater: TaOPCGauge
      Left = 28
      Top = 104
      Width = 49
      Height = 25
      OPCSource = PWater
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Kind = gkNeedle
      MaxValue = 40000
      ParentFont = False
      Progress = 0
    end
    object lWater: TaOPCLabel
      Left = 20
      Top = 130
      Width = 69
      Height = 13
      OnMouseDown = lConcentratMouseDown
      OPCSource = PWater
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1083'/'#1095
      Alignment = taCenter
      AutoSize = False
    end
    object gShuger: TaOPCGauge
      Left = 356
      Top = 100
      Width = 49
      Height = 25
      OPCSource = pShuger
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Kind = gkNeedle
      MaxValue = 40000
      ParentFont = False
      Progress = 0
    end
    object lShuger: TaOPCLabel
      Left = 348
      Top = 126
      Width = 69
      Height = 13
      OnMouseDown = lConcentratMouseDown
      OPCSource = pShuger
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1083'/'#1095
      Alignment = taCenter
      AutoSize = False
    end
    object Label4: TaOPCLabel
      Tag = 1
      Left = 210
      Top = 476
      Width = 103
      Height = 30
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1076#1091#1082#1090#1072' '#13#10#1086#1090' '#1089#1090#1077#1088#1080#1083#1080#1079#1072#1090#1086#1088#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TaOPCLabel
      Tag = 1
      Left = 20
      Top = 434
      Width = 36
      Height = 15
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1052#1086#1081#1082#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TaOPCLabel
      Tag = 1
      Left = 147
      Top = 240
      Width = 22
      Height = 41
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = '1'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TaOPCLabel
      Tag = 1
      Left = 312
      Top = 240
      Width = 22
      Height = 41
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = '2'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TaOPCLabel
      Tag = 1
      Left = 332
      Top = 472
      Width = 100
      Height = 30
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1055#1086#1076#1072#1095#1072' '#1087#1088#1086#1076#1091#1082#1090#1072' '#13#10#1085#1072' '#1089#1090#1077#1088#1080#1083#1080#1079#1072#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object aOPCLabel4: TaOPCLabel
      Left = 88
      Top = 380
      Width = 41
      Height = 14
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ###'
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object lMode: TaOPCBlinkLabel
      Left = 8
      Top = 22
      Width = 205
      Height = 34
      OnChange = lModeChange
      OnDblClick = lModeDblClick
      OPCSource = pMode
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      LookupList = llT1Mode
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 89
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      BlinkCount = 3
      BlinkFont.Charset = DEFAULT_CHARSET
      BlinkFont.Color = clWindowText
      BlinkFont.Height = -11
      BlinkFont.Name = 'Tahoma'
      BlinkFont.Style = []
    end
    object k2In: TaOPCImage
      Left = 350
      Top = 92
      Width = 63
      Height = 5
      Hint = #1057#1080#1088#1086#1087
      OnChange = K2Change
      Value = '3'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k14Out: TaOPCImage
      Left = 303
      Top = 188
      Width = 11
      Height = 11
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k11Out: TaOPCImage
      Left = 125
      Top = 189
      Width = 11
      Height = 11
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=12'
        '1=13'
        '2=14'
        '3=15')
    end
    object aOPCImage7: TaOPCImage
      Left = 158
      Top = 125
      Width = 11
      Height = 11
      GraphicOPCSource = k6Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=12'
        '1=13'
        '2=14'
        '3=15')
    end
    object aOPCImage8: TaOPCImage
      Left = 272
      Top = 125
      Width = 11
      Height = 11
      GraphicOPCSource = k7Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage9: TaOPCImage
      Left = 219
      Top = 46
      Width = 11
      Height = 11
      GraphicOPCSource = k1Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=12'
        '1=13'
        '2=14'
        '3=15')
    end
    object r1: TaOPCImage
      Left = 219
      Top = 93
      Width = 5
      Height = 36
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k2Out: TaOPCImage
      Left = 223
      Top = 92
      Width = 113
      Height = 5
      OnChange = aOPCImage13Change
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage13: TaOPCImage
      Left = 219
      Top = 55
      Width = 5
      Height = 38
      OnChange = aOPCImage13Change
      GraphicOPCSource = k1Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k8In: TaOPCImage
      Left = 219
      Top = 129
      Width = 5
      Height = 14
      OnChange = K8Change
      GraphicOPCSource = r1
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k7In: TaOPCImage
      Left = 223
      Top = 125
      Width = 25
      Height = 5
      OnChange = K7Change
      GraphicOPCSource = r1
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k7Out: TaOPCImage
      Left = 261
      Top = 125
      Width = 13
      Height = 5
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K6: TaOPCImage2In
      Left = 182
      Top = 121
      Width = 13
      Height = 13
      Hint = 'K6'
      OnChange = K6Change
      OnMouseDown = K3MouseDown
      Value = '11'
      PhysID = '516'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object K7: TaOPCImage2In
      Left = 248
      Top = 121
      Width = 13
      Height = 13
      Hint = 'K7'
      OnChange = K7Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=11'
        '01=13')
    end
    object K9: TaOPCImage2In
      Left = 176
      Top = 185
      Width = 13
      Height = 13
      Hint = 'K9'
      OnChange = k10Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object k10: TaOPCImage2In
      Left = 248
      Top = 185
      Width = 13
      Height = 13
      Hint = 'K10'
      OnChange = k10Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=11'
        '01=13')
    end
    object k6In: TaOPCImage
      Left = 195
      Top = 125
      Width = 25
      Height = 5
      OnChange = K6Change
      GraphicOPCSource = r1
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k6Out: TaOPCImage
      Left = 169
      Top = 125
      Width = 13
      Height = 5
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage23: TaOPCImage
      Left = 158
      Top = 136
      Width = 5
      Height = 54
      OnChange = k9OutChange
      GraphicOPCSource = k6Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k1In: TaOPCImage
      Left = 292
      Top = 46
      Width = 121
      Height = 5
      Hint = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090
      OnChange = K1Change
      Value = '2'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K1: TaOPCImage2In
      Left = 280
      Top = 42
      Width = 13
      Height = 13
      Hint = 'K1'
      OnChange = K1Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=10'
        '01=5')
    end
    object k1Out: TaOPCImage
      Left = 228
      Top = 46
      Width = 52
      Height = 5
      OnChange = aOPCImage13Change
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K2: TaOPCImage2In
      Left = 336
      Top = 88
      Width = 13
      Height = 13
      Hint = 'K2'
      OnChange = K2Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=10'
        '01=5')
    end
    object k3Out: TaOPCImage
      Left = 107
      Top = 92
      Width = 113
      Height = 5
      OnChange = aOPCImage13Change
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K3: TaOPCImage2In
      Left = 96
      Top = 88
      Width = 13
      Height = 13
      Hint = 'K3'
      OnChange = K3Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=9'
        '01=13')
    end
    object k3In: TaOPCImage
      Left = 27
      Top = 92
      Width = 69
      Height = 5
      Hint = #1042#1086#1076#1072
      OnChange = K3Change
      Value = '1'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K8: TaOPCImage2In
      Left = 215
      Top = 143
      Width = 13
      Height = 13
      Hint = 'K8'
      OnChange = K8Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k8Out: TaOPCImage
      Left = 219
      Top = 156
      Width = 5
      Height = 24
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage28: TaOPCImage
      Left = 219
      Top = 203
      Width = 5
      Height = 168
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage29: TaOPCImage
      Left = 219
      Top = 370
      Width = 11
      Height = 11
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object aOPCImage30: TaOPCImage
      Left = 230
      Top = 376
      Width = 11
      Height = 11
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage31: TaOPCImage
      Left = 236
      Top = 384
      Width = 5
      Height = 8
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage34: TaOPCImage
      Left = 236
      Top = 413
      Width = 5
      Height = 6
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage35: TaOPCImage
      Left = 236
      Top = 417
      Width = 11
      Height = 11
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object k17Out: TaOPCImage
      Left = 19
      Top = 456
      Width = 114
      Height = 5
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage37: TaOPCImage
      Left = 246
      Top = 423
      Width = 18
      Height = 5
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage38: TaOPCImage
      Left = 264
      Top = 423
      Width = 11
      Height = 11
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListUgol
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k9In: TaOPCImage
      Left = 189
      Top = 189
      Width = 59
      Height = 5
      OnChange = k10Change
      GraphicOPCSource = Back
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage20: TaOPCImage
      Left = 219
      Top = 180
      Width = 11
      Height = 23
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object aOPCImage2: TaOPCImage
      Left = 203
      Top = 193
      Width = 5
      Height = 199
      GraphicOPCSource = Back
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage22: TaOPCImage
      Left = 203
      Top = 413
      Width = 5
      Height = 36
      GraphicOPCSource = Back
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object Back: TaOPCImage
      Left = 203
      Top = 469
      Width = 5
      Height = 31
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K14: TaOPCImage2In
      Left = 292
      Top = 185
      Width = 13
      Height = 13
      Hint = 'K14'
      OnChange = K14Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=11'
        '01=13')
    end
    object K13: TaOPCImage2In
      Left = 274
      Top = 204
      Width = 13
      Height = 13
      Hint = 'K13'
      OnChange = K13Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k5In: TaOPCImage
      Left = 123
      Top = 96
      Width = 5
      Height = 17
      OnChange = K5Change
      GraphicOPCSource = k3Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K5: TaOPCImage2In
      Left = 119
      Top = 113
      Width = 13
      Height = 13
      Hint = 'K5'
      OnChange = K5Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k5Out: TaOPCImage
      Left = 123
      Top = 126
      Width = 5
      Height = 17
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K4: TaOPCImage2In
      Left = 315
      Top = 113
      Width = 13
      Height = 13
      Hint = 'K4'
      OnChange = K4Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k4In: TaOPCImage
      Left = 319
      Top = 96
      Width = 5
      Height = 17
      OnChange = K4Change
      GraphicOPCSource = k2Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k4Out: TaOPCImage
      Left = 319
      Top = 126
      Width = 5
      Height = 17
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage54: TaOPCImage
      Left = 309
      Top = 199
      Width = 5
      Height = 30
      GraphicOPCSource = k14Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k13Out: TaOPCImage
      Left = 278
      Top = 217
      Width = 5
      Height = 12
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K11: TaOPCImage2In
      Left = 136
      Top = 185
      Width = 13
      Height = 13
      Hint = 'K11'
      OnChange = K11Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object k9Out: TaOPCImage
      Left = 162
      Top = 189
      Width = 14
      Height = 5
      OnChange = k9OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k11In: TaOPCImage
      Left = 149
      Top = 189
      Width = 10
      Height = 5
      OnChange = K11Change
      GraphicOPCSource = s1
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object K12: TaOPCImage2In
      Left = 154
      Top = 204
      Width = 13
      Height = 13
      Hint = 'K12'
      OnChange = K12Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k12In: TaOPCImage
      Left = 158
      Top = 194
      Width = 5
      Height = 10
      OnChange = K12Change
      GraphicOPCSource = s1
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k12Out: TaOPCImage
      Left = 158
      Top = 217
      Width = 5
      Height = 13
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage60: TaOPCImage
      Left = 125
      Top = 199
      Width = 5
      Height = 31
      GraphicOPCSource = k11Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object M1: TaOPCImage
      Left = 104
      Top = 200
      Width = 16
      Height = 30
      Hint = 'M1'
      OnMouseDown = K3MouseDown
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
      States.Strings = (
        '0=1'
        '1=2')
    end
    object M2: TaOPCImage
      Left = 320
      Top = 200
      Width = 16
      Height = 30
      Hint = 'M2'
      OnMouseDown = K3MouseDown
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
      States.Strings = (
        '0=1'
        '1=2')
    end
    object K22: TaOPCImage2In
      Left = 293
      Top = 412
      Width = 13
      Height = 13
      Hint = 'K22'
      OnChange = K22Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object K16: TaOPCImage2In
      Left = 274
      Top = 394
      Width = 13
      Height = 13
      Hint = 'K16'
      OnChange = K16Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object pd2Out: TaOPCImage
      Left = 297
      Top = 385
      Width = 5
      Height = 17
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k22In: TaOPCImage
      Left = 297
      Top = 402
      Width = 5
      Height = 10
      OnChange = K22Change
      GraphicOPCSource = pd2Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k16In: TaOPCImage
      Left = 287
      Top = 398
      Width = 11
      Height = 5
      OnChange = K16Change
      GraphicOPCSource = pd2Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k22Out: TaOPCImage
      Left = 297
      Top = 425
      Width = 5
      Height = 12
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K15: TaOPCImage2In
      Left = 148
      Top = 394
      Width = 13
      Height = 13
      Hint = 'K15'
      OnChange = K15Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=11'
        '01=13')
    end
    object pd1Out: TaOPCImage
      Left = 133
      Top = 386
      Width = 5
      Height = 16
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k15In: TaOPCImage
      Left = 137
      Top = 398
      Width = 11
      Height = 5
      OnChange = K15Change
      GraphicOPCSource = pd1Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k21In: TaOPCImage
      Left = 133
      Top = 402
      Width = 5
      Height = 10
      OnChange = k21Change
      GraphicOPCSource = pd1Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k21: TaOPCImage2In
      Left = 129
      Top = 412
      Width = 13
      Height = 13
      Hint = 'K21'
      OnChange = k21Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k21Out: TaOPCImage
      Left = 133
      Top = 425
      Width = 5
      Height = 12
      GraphicOPCSource = k21In
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object K17: TaOPCImage2In
      Left = 133
      Top = 452
      Width = 13
      Height = 13
      Hint = 'k17'
      OnChange = K17Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object K18: TaOPCImage2In
      Left = 175
      Top = 452
      Width = 13
      Height = 13
      Hint = 'k18'
      OnChange = K18Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=1'
        '10=12'
        '01=5')
    end
    object K19: TaOPCImage2In
      Left = 240
      Top = 452
      Width = 13
      Height = 13
      Hint = 'K19'
      OnChange = K18Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=0'
        '11=2'
        '10=11'
        '01=13')
    end
    object k18In: TaOPCImage
      Left = 188
      Top = 456
      Width = 52
      Height = 5
      OnChange = K18Change
      GraphicOPCSource = r2
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object r2: TaOPCImage
      Left = 219
      Top = 399
      Width = 5
      Height = 58
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object P1: TaOPCImage
      Left = 344
      Top = 446
      Width = 36
      Height = 27
      Hint = 'P1'
      OnMouseDown = K3MouseDown
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
      States.Strings = (
        '0=3'
        '1=4')
    end
    object p1Out: TaOPCImage
      Left = 379
      Top = 447
      Width = 34
      Height = 5
      OnChange = p1OutChange
      GraphicOPCSource = p1In
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k19Out: TaOPCImage
      Left = 253
      Top = 456
      Width = 18
      Height = 5
      OnChange = k19OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage41: TaOPCImage
      Left = 203
      Top = 446
      Width = 11
      Height = 23
      GraphicOPCSource = Back
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object k20: TaOPCImage2In
      Left = 154
      Top = 473
      Width = 13
      Height = 13
      Hint = 'K20'
      OnChange = k20Change
      OnMouseDown = K3MouseDown
      Value = '11'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListValve
      States.Strings = (
        '00=3'
        '11=4'
        '10=7'
        '01=8')
    end
    object k20Out: TaOPCImage
      Left = 158
      Top = 486
      Width = 5
      Height = 13
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k20In: TaOPCImage
      Left = 158
      Top = 457
      Width = 5
      Height = 16
      OnChange = k20Change
      GraphicOPCSource = k18Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k18Out: TaOPCImage
      Left = 162
      Top = 456
      Width = 13
      Height = 5
      OnChange = k18OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k17In: TaOPCImage
      Left = 146
      Top = 456
      Width = 14
      Height = 5
      OnChange = K17Change
      GraphicOPCSource = k18Out
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object p1In: TaOPCImage
      Left = 271
      Top = 456
      Width = 74
      Height = 5
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object aOPCImage39: TaOPCImage
      Left = 270
      Top = 433
      Width = 5
      Height = 24
      OnChange = k19OutChange
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object pd1: TaOPCImage
      Left = 131
      Top = 377
      Width = 9
      Height = 9
      Hint = 'pd1'
      OnChange = pd1Change
      OnMouseDown = K3MouseDown
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
      States.Strings = (
        '0=5'
        '1=6')
    end
    object pd2: TaOPCImage
      Left = 295
      Top = 377
      Width = 9
      Height = 9
      Hint = 'pd2'
      OnChange = pd2Change
      OnMouseDown = K3MouseDown
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageList1
      States.Strings = (
        '0=5'
        '1=6')
    end
    object k16Out: TaOPCImage
      Left = 223
      Top = 398
      Width = 51
      Height = 5
      OnChange = k15OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k15Out: TaOPCImage
      Left = 161
      Top = 398
      Width = 59
      Height = 5
      OnChange = k15OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object s2: TaOPCImage
      Left = 278
      Top = 189
      Width = 5
      Height = 5
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object k14In: TaOPCImage
      Left = 282
      Top = 189
      Width = 10
      Height = 5
      OnChange = K14Change
      GraphicOPCSource = s2
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k10Out: TaOPCImage
      Left = 261
      Top = 189
      Width = 18
      Height = 5
      OnChange = k10OutChange
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
    end
    object k13In: TaOPCImage
      Left = 278
      Top = 193
      Width = 5
      Height = 11
      OnChange = K13Change
      GraphicOPCSource = s2
      Value = '0'
      Discrete = True
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage27: TaOPCImage
      Left = 278
      Top = 136
      Width = 5
      Height = 54
      OnChange = k10OutChange
      GraphicOPCSource = k7Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=4'
        '1=5'
        '2=6'
        '3=7')
    end
    object aOPCImage21: TaOPCImage
      Left = 203
      Top = 390
      Width = 11
      Height = 23
      GraphicOPCSource = Back
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object aOPCImage32: TaOPCImage
      Left = 236
      Top = 390
      Width = 11
      Height = 23
      GraphicOPCSource = k8Out
      Value = '0'
      Discrete = False
      Stretch = True
      OPCImageList = aOPCImageListPipe
      States.Strings = (
        '0=8'
        '1=9'
        '2=10'
        '3=11')
    end
    object aOPCLabel5: TaOPCLabel
      Left = 309
      Top = 380
      Width = 41
      Height = 14
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ###'
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
    end
    object Label9: TaOPCLabel
      Tag = 1
      Left = 8
      Top = 59
      Width = 77
      Height = 13
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
    end
    object lRA: TaOPCLabel
      Left = 100
      Top = 59
      Width = 89
      Height = 13
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      LookupList = llRA
      AutoSize = False
    end
    object lCaption: TaOPCLabel
      Left = 8
      Top = 4
      Width = 30
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = #1048#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object llT1Mode: TaOPCLookupList
    TableName = 'T1Mode'
    Items.Strings = (
      '0=off line'
      '1='#1085#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 1, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 2'
      '2='#1085#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 2, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 1'
      '3='#1086#1087#1083#1072#1089#1082#1080#1074#1072#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 2, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 1'
      '4='#1086#1087#1083#1072#1089#1082#1080#1074#1072#1085#1080#1077' '#1105#1084#1082#1086#1089#1090#1080' 1, '#1074#1086#1079#1074#1088#1072#1090' '#1074' '#1105#1084#1082#1086#1089#1090#1100' 2'
      '5='#1084#1086#1081#1082#1072' '#1077#1084#1082#1086#1089#1090#1080' 1'
      '6='#1084#1086#1081#1082#1072' '#1077#1084#1082#1086#1089#1090#1080' 2'
      '7='#1084#1086#1081#1082#1072' '#1077#1084#1082#1086#1089#1090#1077#1081' 1 '#1080' 2'
      '8='#1076#1088#1077#1085#1072#1078)
    Left = 16
    Top = 367
  end
  object aOPCImageListPipe: TaOPCImageList
    Items = <
      item
        Name = #1090#1088#1091#1073#1072' '#1075#1086#1088' '#1089#1077#1088#1072#1103'.bmp'
        Picture.Data = {
          07544269746D61704A000000424D4A0000000000000036000000280000000100
          0000050000000100180000000000140000000000000000000000000000000000
          000000000000C0C0C000C0C0C000C0C0C00000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1075#1086#1088' '#1075#1086#1083#1091#1073#1072#1103'.bmp'
        Picture.Data = {
          07544269746D61704A000000424D4A0000000000000036000000280000000100
          0000050000000100180000000000140000000000000000000000000000000000
          000000000000FFFF8000FFFFD200FFFF800000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1075#1086#1088' '#1078#1077#1083#1090#1072#1103'.bmp'
        Picture.Data = {
          07544269746D61704A000000424D4A0000000000000036000000280000000100
          0000050000000100180000000000140000000000000000000000000000000000
          00000000000000FFFF00C6FFFF0000FFFF0000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1075#1086#1088' '#1079#1077#1083#1077#1085#1072#1103'.bmp'
        Picture.Data = {
          07544269746D61704A000000424D4A0000000000000036000000280000000100
          0000050000000100180000000000140000000000000000000000000000000000
          00000000000000FF0000B0FFB00000FF000000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1074#1077#1088' '#1089#1077#1088#1072#1103'.bmp'
        Picture.Data = {
          07544269746D617046000000424D460000000000000036000000280000000500
          0000010000000100180000000000100000000000000000000000000000000000
          0000000000C0C0C0C0C0C0C0C0C000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1074#1077#1088' '#1075#1086#1083#1091#1073#1072#1103'.bmp'
        Picture.Data = {
          07544269746D617046000000424D460000000000000036000000280000000500
          0000010000000100180000000000100000000000000000000000000000000000
          0000000000FFFF80FFFFD2FFFF8000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1074#1077#1088' '#1078#1077#1083#1090#1072#1103'.bmp'
        Picture.Data = {
          07544269746D617046000000424D460000000000000036000000280000000500
          0000010000000100180000000000100000000000000000000000000000000000
          000000000000FFFFC6FFFF00FFFF00000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1090#1088#1091#1073#1072' '#1074#1077#1088' '#1079#1077#1083#1077#1085#1072#1103'.bmp'
        Picture.Data = {
          07544269746D617046000000424D460000000000000036000000280000000500
          0000010000000100180000000000100000000000000000000000000000000000
          000000000000FF00B0FFB000FF0000000000}
        Transparent = False
        TransparentColor = 33554432
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1075#1086#1088' '#1089#1077#1088'.bmp'
        Picture.Data = {
          07544269746D617072030000424D720300000000000036000000280000000B00
          00001700000001001800000000003C0300000000000000000000000000000000
          0000000000C0C0C0E1E1E1C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000C0C0C0E1E1E1C0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000C0C0C0E1E1E1E1E1E1C0C0C0000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0C0C0C0E1E1E1E1E1E1C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0E1E1
          E1C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000C0
          C0C0E1E1E1E1E1E1C0C0C0000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000C0C0C0E1E1E1E1E1E1C0C0C0000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF000000C0C0C0E1E1E1C0C0C0000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0E1E1E1E1E1E1C0C0C0000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0E1E1E1C0C0
          C0000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0E1
          E1E1C0C0C0000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          C0C0C0E1E1E1C0C0C0000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000C0C0C0E1E1E1C0C0C0000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000C0C0C0E1E1E1C0C0C0000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF000000C0C0C0E1E1E1E1E1E1C0C0C0000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF000000C0C0C0E1E1E1C0C0C0000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000C0C0C0E1E1E1E1E1E1C0C0C0000000FFFFFF
          FFFFFF000000FFFFFFFFFFFF000000C0C0C0E1E1E1E1E1E1C0C0C0000000FFFF
          FFFFFFFFFFFFFF000000FFFFFF000000C0C0C0C0C0C0E1E1E1C0C0C0000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0C0C0C0E1E1E1E1E1E1C0C0C0
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0E1E1E1E1E1E1C0C0
          C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0E1E1E1C0
          C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0
          E1E1E1C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1075#1086#1088' '#1075#1086#1083'.bmp'
        Picture.Data = {
          07544269746D617072030000424D720300000000000036000000280000000B00
          00001700000001001800000000003C0300000000000000000000000000000000
          0000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFFD2FFFF80000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFF80FFFFD2FFFFD2FFFF80
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFF80FFFF80FFFF
          D2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FF
          FF80FFFFD2FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFF80FFFFD2FFFFD2FFFF80000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFFD2FFFF80000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF
          80000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FF
          FFD2FFFF80000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          FFFF80FFFFD2FFFF80000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000FFFF80FFFFD2FFFF80000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000FFFF80FFFFD2FFFF80000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF000000FFFF80FFFFD2FFFFD2FFFF80000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFFD2FFFF80000000FFFFFF
          FFFFFF000000FFFFFFFFFFFF000000FFFF80FFFFD2FFFFD2FFFF80000000FFFF
          FFFFFFFFFFFFFF000000FFFFFF000000FFFF80FFFF80FFFFD2FFFF80000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFF80FFFFD2FFFFD2FFFF80
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFFD2FFFF
          80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FF
          FF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80
          FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1075#1086#1088' '#1078#1077#1083'.bmp'
        Picture.Data = {
          07544269746D617072030000424D720300000000000036000000280000000B00
          00001700000001001800000000003C0300000000000000000000000000000000
          000000000000FFFFC6FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000000FFFFC6FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000FFFFC6FFFFC6FFFF00FFFF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00000000000000FFFF00FFFFC6FFFFC6FFFF00FFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00000000FFFF00FFFFC6FF
          FF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00000000
          FFFFC6FFFFC6FFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF00000000FFFFC6FFFFC6FFFF00FFFF000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF00000000FFFFC6FFFF00FFFF000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFC6FFFFC6FFFF00FFFF000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFC6FFFF00FF
          FF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFC6
          FFFF00FFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          00FFFFC6FFFF00FFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00000000FFFFC6FFFF00FFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FFFFC6FFFF00FFFF000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF00000000FFFFC6FFFFC6FFFF00FFFF000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF00000000FFFFC6FFFF00FFFF000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF00000000FFFFC6FFFFC6FFFF00FFFF000000FFFFFF
          FFFFFF000000FFFFFFFFFFFF00000000FFFFC6FFFFC6FFFF00FFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFF00000000FFFF00FFFFC6FFFF00FFFF000000FF
          FFFFFFFFFFFFFFFFFFFFFF00000000000000FFFF00FFFFC6FFFFC6FFFF00FFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFC6FFFFC6FFFF00FF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFC6FFFF00
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFF
          C6FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1075#1086#1088' '#1079#1077#1083'.bmp'
        Picture.Data = {
          07544269746D617072030000424D720300000000000036000000280000000B00
          00001700000001001800000000003C0300000000000000000000000000000000
          000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000FF00CFFFBFCFFFBF00FF00000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00000000000000FF0000FF00CFFFBFCFFFBF00FF00
          000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00000000FF0000FF00CFFF
          BF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00000000
          FF00CFFFBFCFFFBF00FF00000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF00000000FF00CFFFBFCFFFBF00FF00000000FFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF00000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBFCFFFBF00FF00000000
          FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF
          00000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CF
          FFBF00FF00000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          00FF00CFFFBF00FF00000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00000000FF00CFFFBF00FF00000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FF00CFFFBF00FF00000000FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFF00000000FF00CFFFBFCFFFBF00FF00000000FFFFFF000000FFFF
          FFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF00000000FFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF00000000FF00CFFFBFCFFFBF00FF00000000FFFFFF
          FFFFFF000000FFFFFFFFFFFF00000000FF00CFFFBFCFFFBF00FF00000000FFFF
          FFFFFFFFFFFFFF000000FFFFFF00000000FF0000FF00CFFFBF00FF00000000FF
          FFFFFFFFFFFFFFFFFFFFFF00000000000000FF0000FF00CFFFBFCFFFBF00FF00
          000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBFCFFFBF00FF
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBF00
          FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00
          CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1074#1077#1088' '#1089#1077#1088'.bmp'
        Picture.Data = {
          07544269746D61704E030000424D4E0300000000000036000000280000001700
          00000B0000000100180000000000180300000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000C0C0C0C0C0C0C0C0C0C0C0C0000000E1E1E1E1E1E1E1E1E1C0C0C0C0C0
          C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000C0C0C0C0C0C0E1E1E1E1E1E1E1E1E1000000C0C0C0C0C0C0
          E1E1E1E1E1E1C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0E1E1E1E1E1E1C0C0C0C0C0C000
          0000000000000000C0C0C0E1E1E1E1E1E1E1E1E1C0C0C0000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0E1E1E1E1E1E1E1E1E1C0C0
          C0000000000000000000FFFFFFFFFFFF000000C0C0C0C0C0C0E1E1E1E1E1E1C0
          C0C0C0C0C0000000000000000000000000000000C0C0C0C0C0C0E1E1E1E1E1E1
          C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000
          00C0C0C0E1E1E1E1E1E1E1E1E1C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0E1E1E1E1
          E1E1E1E1E1C0C0C0000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1074#1077#1088' '#1075#1086#1083'.bmp'
        Picture.Data = {
          07544269746D61704E030000424D4E0300000000000036000000280000001700
          00000B0000000100180000000000180300000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00000000000000000000FFFF80FFFF80FFFF80FFFF80000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000FFFF80FFFF80FFFF80FFFF80000000FFFFD2FFFFD2FFFFD2FFFF80FFFF
          80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FFFFD2000000FFFF80FFFF80
          FFFFD2FFFFD2FFFF80FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FFFF80FFFF8000
          0000000000000000FFFF80FFFFD2FFFFD2FFFFD2FFFF80000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFFD2FFFFD2FFFF
          80000000000000000000FFFFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FF
          FF80FFFF80000000000000000000000000000000FFFF80FFFF80FFFFD2FFFFD2
          FFFF80FFFF80000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000
          00FFFF80FFFFD2FFFFD2FFFFD2FFFF80FFFF80FFFF80FFFF80FFFF80FFFFD2FF
          FFD2FFFFD2FFFF80000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FFFFD2FFFFD2FFFF
          D2FFFFD2FFFFD2FFFF80FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFF80
          FFFF80FFFF80FFFF80FFFF80FFFF80000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1074#1077#1088' '#1078#1077#1083'.bmp'
        Picture.Data = {
          07544269746D61704E030000424D4E0300000000000036000000280000001700
          00000B0000000100180000000000180300000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          0000000000000000000000FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00000000FFFF00FFFF00FFFF00FFFF000000C6FFFFC6FFFFC6FFFF00FFFF00FF
          FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FFFF00FFFFC6FFFFC6FFFFC6FFFF00000000FFFF00FFFF
          C6FFFFC6FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFFC6FFFFC6FFFF00FFFF00FFFF00
          000000000000000000FFFFC6FFFFC6FFFFC6FFFF00FFFF000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFFC6FFFFC6FFFFC6FFFF00FF
          FF000000000000000000FFFFFFFFFFFF00000000FFFF00FFFFC6FFFFC6FFFF00
          FFFF00FFFF00000000000000000000000000000000FFFF00FFFFC6FFFFC6FFFF
          00FFFF00FFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000
          0000FFFFC6FFFFC6FFFFC6FFFF00FFFF00FFFF00FFFF00FFFF00FFFFC6FFFFC6
          FFFFC6FFFF00FFFF000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00000000FFFF00FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FF
          FFC6FFFFC6FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1055#1077#1088#1077#1093#1086#1076' '#1074#1077#1088' '#1079#1077#1083'.bmp'
        Picture.Data = {
          07544269746D61704E030000424D4E0300000000000036000000280000001700
          00000B0000000100180000000000180300000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          0000000000000000000000FF0000FF0000FF0000FF00000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00000000FF0000FF0000FF0000FF00000000CFFFBFCFFFBFCFFFBF00FF0000FF
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FF0000FF00CFFFBFCFFFBFCFFFBF00000000FF0000FF00
          CFFFBFCFFFBF00FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00000000FF0000FF00CFFFBFCFFFBF00FF0000FF0000
          000000000000000000FF00CFFFBFCFFFBFCFFFBF00FF00000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBFCFFFBFCFFFBF00FF
          00000000000000000000FFFFFFFFFFFF00000000FF0000FF00CFFFBFCFFFBF00
          FF0000FF0000000000000000000000000000000000FF0000FF00CFFFBFCFFFBF
          00FF0000FF00000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000000000
          0000FF00CFFFBFCFFFBFCFFFBF00FF0000FF0000FF0000FF0000FF00CFFFBFCF
          FFBFCFFFBF00FF00000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00000000FF0000FF00CFFFBFCFFFBFCFFFBFCFFFBFCFFF
          BFCFFFBFCFFFBF00FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF00000000000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end>
    Left = 48
    Top = 296
  end
  object aOPCImageListUgol: TaOPCImageList
    Items = <
      item
        Name = #1059#1075#1086#1083' '#1089#1077#1088'  11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEEEEC0C0C0
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEE
          EEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0
          C0C0EEEEEEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000C0C0C0EEEEEEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000C0C0C0EEEEEEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000C0C0C0C0C0C0EEEEEEC0C0C0000000000000000000000000
          000000000000000000C0C0C0C0C0C0EEEEEEEEEEEEC0C0C0000000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0EEEEEEEEEEEEC0C0C0000000FFFFFF00
          0000EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEC0C0C0C0C0C0000000
          FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
          00FFFFFFFFFFFF000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1075' 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF80
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFF
          D2FFFF80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FF80FFFFD2FFFF80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000FFFF80FFFFD2FFFF80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFF80FFFFD2FFFF80000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFF80000000000000000000000000
          000000000000000000FFFF80FFFF80FFFFD2FFFFD2FFFF80000000000000FFFF
          80FFFF80FFFF80FFFF80FFFF80FFFF80FFFFD2FFFFD2FFFF80000000FFFFFF00
          0000FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFF80FFFF80000000
          FFFFFF000000FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF800000000000
          00FFFFFFFFFFFF000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1078' 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FFFF80FFFF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FF
          FF80FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080
          FFFFC6FFFF80FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00000080FFFFC6FFFF80FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00000080FFFFC6FFFF80FFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000080FFFF80FFFFC6FFFF80FFFF000000000000000000000000
          00000000000000000080FFFF80FFFFC6FFFFC6FFFF80FFFF00000000000080FF
          FF80FFFF80FFFF80FFFF80FFFF80FFFFC6FFFFC6FFFF80FFFF000000FFFFFF00
          0000C6FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFF80FFFF80FFFF000000
          FFFFFF00000080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF0000000000
          00FFFFFFFFFFFF000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1079' 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF00
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFF
          BF00FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          FF00CFFFBF00FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00000000FF00CFFFBF00FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00000000FF00CFFFBF00FF00000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FF0000FF00CFFFBF00FF00000000000000000000000000
          00000000000000000000FF0000FF00CFFFBFCFFFBF00FF0000000000000000FF
          0000FF0000FF0000FF0000FF0000FF00CFFFBFCFFFBF00FF00000000FFFFFF00
          0000CFFFBFCFFFBFCFFFBFCFFFBFCFFFBFCFFFBFCFFFBF00FF0000FF00000000
          FFFFFF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000
          00FFFFFFFFFFFF000000000000000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1089#1077#1088'1 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
          00FFFFFFFFFFFF000000EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEC0
          C0C0C0C0C0000000FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          EEEEEEEEEEEEC0C0C0000000FFFFFF0000000000000000000000000000000000
          00C0C0C0C0C0C0EEEEEEEEEEEEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000C0C0C0C0C0C0EEEEEEC0C0C0000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEEEEC0C0C0000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEEEEC0C0C000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEEEEC0C0C0
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0EEEE
          EEC0C0C0000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0
          C0C0EEEEEEC0C0C0000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1075'1 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFF000000FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF800000000000
          00FFFFFFFFFFFF000000FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FF
          FF80FFFF80000000FFFFFF000000FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80
          FFFFD2FFFFD2FFFF80000000FFFFFF0000000000000000000000000000000000
          00FFFF80FFFF80FFFFD2FFFFD2FFFF80000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000FFFF80FFFF80FFFFD2FFFF80000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF80000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF8000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFFD2FFFF80
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF80FFFF
          D2FFFF80000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FF80FFFFD2FFFF80000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1078'1 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFF00000080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF0000000000
          00FFFFFFFFFFFF000000C6FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFF80
          FFFF80FFFF000000FFFFFF00000080FFFF80FFFF80FFFF80FFFF80FFFF80FFFF
          C6FFFFC6FFFF80FFFF000000FFFFFF0000000000000000000000000000000000
          0080FFFF80FFFFC6FFFFC6FFFF80FFFF000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000080FFFF80FFFFC6FFFF80FFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FFFF80FFFF000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FFFF80FFFF00000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FFFF80FFFF
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080FFFFC6FF
          FF80FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080
          FFFFC6FFFF80FFFF000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1079'1 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFF00000000FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000
          00FFFFFFFFFFFF000000CFFFBFCFFFBFCFFFBFCFFFBFCFFFBFCFFFBFCFFFBF00
          FF0000FF00000000FFFFFF00000000FF0000FF0000FF0000FF0000FF0000FF00
          CFFFBFCFFFBF00FF00000000FFFFFF0000000000000000000000000000000000
          0000FF0000FF00CFFFBFCFFFBF00FF00000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00000000FF0000FF00CFFFBF00FF00000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF00000000000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF0000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFFBF00FF00
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF00CFFF
          BF00FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          FF00CFFFBF00FF00000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1089#1077#1088'2 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          000000000000FFFFFFFFFFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000FFFFFF000000C0C0C0C0C0C0EEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEE000000FFFFFF000000C0C0C0EEEEEEEEEEEEC0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0EEEEEEEEEEEEC0C0
          C0C0C0C0000000000000000000000000000000000000000000C0C0C0EEEEEEC0
          C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0
          EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1075'2 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          000000000000FFFFFFFFFFFF000000000000FFFF80FFFF80FFFF80FFFF80FFFF
          80FFFF80FFFF80000000FFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FFFFD2FF
          FFD2FFFFD2FFFFD2FFFFD2000000FFFFFF000000FFFF80FFFFD2FFFFD2FFFF80
          FFFF80FFFF80FFFF80FFFF80FFFF80000000000000FFFF80FFFFD2FFFFD2FFFF
          80FFFF80000000000000000000000000000000000000000000FFFF80FFFFD2FF
          FF80FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80
          FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          00FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1078'2 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          000000000000FFFFFFFFFFFF00000000000080FFFF80FFFF80FFFF80FFFF80FF
          FF80FFFF80FFFF000000FFFFFF00000080FFFF80FFFFC6FFFFC6FFFFC6FFFFC6
          FFFFC6FFFFC6FFFFC6FFFF000000FFFFFF00000080FFFFC6FFFFC6FFFF80FFFF
          80FFFF80FFFF80FFFF80FFFF80FFFF00000000000080FFFFC6FFFFC6FFFF80FF
          FF80FFFF00000000000000000000000000000000000000000080FFFFC6FFFF80
          FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080FFFF
          C6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          0080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1079'2 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
          000000000000FFFFFFFFFFFF00000000000000FF0000FF0000FF0000FF0000FF
          0000FF0000FF00000000FFFFFF00000000FF0000FF00CFFFBFCFFFBFCFFFBFCF
          FFBFCFFFBFCFFFBFCFFFBF000000FFFFFF00000000FF00CFFFBFCFFFBF00FF00
          00FF0000FF0000FF0000FF0000FF0000000000000000FF00CFFFBFCFFFBF00FF
          0000FF0000000000000000000000000000000000000000000000FF00CFFFBF00
          FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00
          CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
          0000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1089#1077#1088'3 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000C0C0C0EEEEEEC0C0C0000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0EEEEEEC0C0C0000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0EEEEEEC0C0C00000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0EEEEEEC0
          C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C0C0C0
          EEEEEEEEEEEEC0C0C0C0C0C0000000000000000000000000000000000000FFFF
          FF000000C0C0C0EEEEEEEEEEEEC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
          0000FFFFFF000000C0C0C0C0C0C0EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEEEE000000FFFFFFFFFFFF000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1075'3 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          0000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFF80000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FFFF800000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80FFFFD2FF
          FF80FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFF80
          FFFFD2FFFFD2FFFF80FFFF80000000000000000000000000000000000000FFFF
          FF000000FFFF80FFFFD2FFFFD2FFFF80FFFF80FFFF80FFFF80FFFF80FFFF8000
          0000FFFFFF000000FFFF80FFFF80FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFD2
          FFFFD2000000FFFFFFFFFFFF000000000000FFFF80FFFF80FFFF80FFFF80FFFF
          80FFFF80FFFF80000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1078'3 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000080FFFFC6FFFF80FFFF000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00000000000080FFFFC6FFFF80FFFF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080FFFFC6FFFF80FFFF0000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080FFFFC6FFFF80
          FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000080FFFF
          C6FFFFC6FFFF80FFFF80FFFF000000000000000000000000000000000000FFFF
          FF00000080FFFFC6FFFFC6FFFF80FFFF80FFFF80FFFF80FFFF80FFFF80FFFF00
          0000FFFFFF00000080FFFF80FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFFC6FFFF
          C6FFFF000000FFFFFFFFFFFF00000000000080FFFF80FFFF80FFFF80FFFF80FF
          FF80FFFF80FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000000000000000}
        Transparent = True
        TransparentColor = clWhite
      end
      item
        Name = #1059#1075#1086#1083' '#1079'3 11.bmp'
        Picture.Data = {
          07544269746D6170C2010000424DC20100000000000036000000280000000B00
          00000B00000001001800000000008C010000C40E0000C40E0000000000000000
          000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBF00FF00000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBF00FF000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00CFFFBF00
          FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF00
          CFFFBFCFFFBF00FF0000FF00000000000000000000000000000000000000FFFF
          FF00000000FF00CFFFBFCFFFBF00FF0000FF0000FF0000FF0000FF0000FF0000
          0000FFFFFF00000000FF0000FF00CFFFBFCFFFBFCFFFBFCFFFBFCFFFBFCFFFBF
          CFFFBF000000FFFFFFFFFFFF00000000000000FF0000FF0000FF0000FF0000FF
          0000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
          0000000000000000000000000000}
        Transparent = True
        TransparentColor = clWhite
      end>
    Left = 16
    Top = 328
  end
  object aOPCImageListValve: TaOPCImageList
    Items = <
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Off.gif'
        Picture.Data = {
          0954474946496D6167654749463839610D000D00910000000000EFEFEFFFFFFF
          00000021FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0002002C000000000D000D00000226848E29C09A0C8271
          9105A9A2D4F8707B61DC165E23191A23D82DA9362170E5B850ED35B85700003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' On.gif'
        Picture.Data = {
          0954474946496D6167654749463839610D000D0091000000000000FF00EFEFEF
          FFFFFF21FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0003002C000000000D000D00000228C48E39C09A0C8471
          20302155B511CF158417966D62479A275986AB8798E3776C171D73F8D3384F01
          003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' On1.gif'
        Picture.Data = {
          0954474946496D6167654749463839610D000D00A2000000000000FF00EFEFEF
          FFFFFF00000000000000000000000021FE1D4275696C74207769746820474946
          204D6F766965204765617220332E300021F904010A0003002C000000000D000D
          0000032A08B3DC03D03508829240C0605DD615773D42B971DD6786A8BAA269F9
          8A8C7A8ECBB7E135C84F11C92401003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1074#1077#1088' Off.gif'
        Picture.Data = {
          0954474946496D6167654749463839610D000D00910000000000EFEFEFFFFFFF
          00000021FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0002002C000000000D000D00000223848F2710ED0E8464
          AF4539EBC5D9F2CF6C1F268E4B5072146AAE9E5ABD67EC25B65100003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1074#1077#1088' On.gif'
        Picture.Data = {
          0954474946496D6167654749463839610D000D0091000000000000FF00EFEFEF
          FFFFFF21FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0003002C000000000D000D00000226848F3710ED0E8664
          AF4539EBC5D9F2CF6C1F268E8B507280C0A627DB82F0BCAD33BD243A5000003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Yellow.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000408080408080408080408080408080408080408080408080408080
          4080804080800000000000000000000040808040808040808040808040808040
          808040808040808040808000000000000000000000EFEFEF0000004080804080
          8040808040808040808040808040808000000000FFFF00000000000000EFEFEF
          EFEFEF00000040808040808040808040808040808000000000FFFF00FFFF0000
          0000000000EFEFEFEFEFEFEFEFEF00000040808040808040808000000000FFFF
          00FFFF00FFFF00000000000000EFEFEFEFEFEFEFEFEFEFEFEF00000040808000
          000000FFFF00FFFF00FFFF00FFFF00000000000000EFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEF00000000FFFF00FFFF00FFFF00FFFF00FFFF00000000000000EFEFEF
          EFEFEFEFEFEFEFEFEF00000040808000000000FFFF00FFFF00FFFF00FFFF0000
          0000000000EFEFEFEFEFEFEFEFEF00000040808040808040808000000000FFFF
          00FFFF00FFFF00000000000000EFEFEFEFEFEF00000040808040808040808040
          808040808000000000FFFF00FFFF00000000000000EFEFEF0000004080804080
          8040808040808040808040808040808000000000FFFF00000000000000000000
          4080804080804080804080804080804080804080804080804080800000000000
          0000000000408080408080408080408080408080408080408080408080408080
          40808040808000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1074#1077#1088' Blue.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEF00000000808000008080008080000000EFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00000000808000808000008080008080
          008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000000080800080800080
          8000008080008080008080008080000000EFEFEFEFEFEFEFEFEF000000008080
          00808000808000808000008080008080008080008080008080000000EFEFEF00
          0000008080008080008080008080008080000080800080800080800080800080
          8000808000000000808000808000808000808000808000808000008080008080
          008080008080008080000000FF00000000000080800080800080800080800080
          8000008080008080008080008080000000FF0000FF0000FF0000000000008080
          00808000808000808000008080008080008080000000FF0000FF0000FF0000FF
          0000FF000000000000808000808000808000008080008080000000FF0000FF00
          00FF0000FF0000FF0000FF0000FF000000000000808000808000008080000000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00000000000080
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1074#1077#1088' Red.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEF00000000808000008080008080000000EFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00000000808000808000008080008080
          008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000000080800080800080
          8000008080008080008080008080000000EFEFEFEFEFEFEFEFEF000000008080
          00808000808000808000008080008080008080008080008080000000EFEFEF00
          0000008080008080008080008080008080000080800080800080800080800080
          8000808000000000808000808000808000808000808000808000008080008080
          0080800080800080800000000000FF0000000080800080800080800080800080
          80000080800080800080800080800000000000FF0000FF0000FF000000008080
          008080008080008080000080800080800080800000000000FF0000FF0000FF00
          00FF0000FF000000008080008080008080000080800080800000000000FF0000
          FF0000FF0000FF0000FF0000FF0000FF00000000808000808000008080000000
          0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000080
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1074#1077#1088' Yellow.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEF00000000808000008080008080000000EFEFEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF00000000808000808000008080008080
          008080000000EFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0000000080800080800080
          8000008080008080008080008080000000EFEFEFEFEFEFEFEFEF000000008080
          00808000808000808000008080008080008080008080008080000000EFEFEF00
          0000008080008080008080008080008080000080800080800080800080800080
          8000808000000000808000808000808000808000808000808000008080008080
          00808000808000808000000000FFFF0000000080800080800080800080800080
          800000808000808000808000808000000000FFFF00FFFF00FFFF000000008080
          0080800080800080800000808000808000808000000000FFFF00FFFF00FFFF00
          FFFF00FFFF0000000080800080800080800000808000808000000000FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00000000808000808000008080000000
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000000080
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Blue left.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000008080008080008080008080008080008080008080008080008080
          0080800080800000000000000000000000808000808000808000808000808000
          808000808000808000808000000000000000000000FF00000000000080800080
          80008080008080008080008080008080000000FFFFFF00000000000000FF0000
          FF0000000000008080008080008080008080008080000000FFFFFFFFFFFF0000
          0000000000FF0000FF0000FF0000000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF00000000000000FF0000FF0000FF0000FF000000000000808000
          0000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF0000FF0000FF0000FF00
          00FF0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000FF0000
          FF0000FF0000FF0000000000008080000000FFFFFFFFFFFFFFFFFFFFFFFF0000
          0000000000FF0000FF0000FF0000000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF00000000000000FF0000FF000000000000808000808000808000
          8080008080000000FFFFFFFFFFFF00000000000000FF00000000000080800080
          80008080008080008080008080008080000000FFFFFF00000000000000000000
          0080800080800080800080800080800080800080800080800080800000000000
          0000000000008080008080008080008080008080008080008080008080008080
          00808000808000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Blue.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000008080008080008080008080008080008080008080008080008080
          0080800080800000000000000000000000808000808000808000808000808000
          808000808000808000808000000000000000000000EFEFEF0000000080800080
          80008080008080008080008080008080000000FF000000000000000000EFEFEF
          EFEFEF000000008080008080008080008080008080000000FF0000FF00000000
          0000000000EFEFEFEFEFEFEFEFEF000000008080008080008080000000FF0000
          FF0000FF000000000000000000EFEFEFEFEFEFEFEFEFEFEFEF00000000808000
          0000FF0000FF0000FF0000FF000000000000000000EFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEF000000FF0000FF0000FF0000FF0000FF000000000000000000EFEFEF
          EFEFEFEFEFEFEFEFEF000000008080000000FF0000FF0000FF0000FF00000000
          0000000000EFEFEFEFEFEFEFEFEF000000008080008080008080000000FF0000
          FF0000FF000000000000000000EFEFEFEFEFEF00000000808000808000808000
          8080008080000000FF0000FF000000000000000000EFEFEF0000000080800080
          80008080008080008080008080008080000000FF000000000000000000000000
          0080800080800080800080800080800080800080800080800080800000000000
          0000000000008080008080008080008080008080008080008080008080008080
          00808000808000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Red left.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000008080008080008080008080008080008080008080008080008080
          0080800080800000000000000000000000808000808000808000808000808000
          8080008080008080008080000000000000000000000000FF0000000080800080
          80008080008080008080008080008080000000FFFFFF000000000000000000FF
          0000FF000000008080008080008080008080008080000000FFFFFFFFFFFF0000
          00000000000000FF0000FF0000FF000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF000000000000000000FF0000FF0000FF0000FF00000000808000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF0000FF0000FF0000
          FF0000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
          0000FF0000FF0000FF000000008080000000FFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000FF0000FF0000FF000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF000000000000000000FF0000FF00000000808000808000808000
          8080008080000000FFFFFFFFFFFF000000000000000000FF0000000080800080
          80008080008080008080008080008080000000FFFFFF00000000000000000000
          0080800080800080800080800080800080800080800080800080800000000000
          0000000000008080008080008080008080008080008080008080008080008080
          00808000808000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Red.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000008080008080008080008080008080008080008080008080008080
          0080800080800000000000000000000000808000808000808000808000808000
          808000808000808000808000000000000000000000EFEFEF0000000080800080
          800080800080800080800080800080800000000000FF00000000000000EFEFEF
          EFEFEF0000000080800080800080800080800080800000000000FF0000FF0000
          0000000000EFEFEFEFEFEFEFEFEF0000000080800080800080800000000000FF
          0000FF0000FF00000000000000EFEFEFEFEFEFEFEFEFEFEFEF00000000808000
          00000000FF0000FF0000FF0000FF00000000000000EFEFEFEFEFEFEFEFEFEFEF
          EFEFEFEF0000000000FF0000FF0000FF0000FF0000FF00000000000000EFEFEF
          EFEFEFEFEFEFEFEFEF0000000080800000000000FF0000FF0000FF0000FF0000
          0000000000EFEFEFEFEFEFEFEFEF0000000080800080800080800000000000FF
          0000FF0000FF00000000000000EFEFEFEFEFEF00000000808000808000808000
          80800080800000000000FF0000FF00000000000000EFEFEF0000000080800080
          800080800080800080800080800080800000000000FF00000000000000000000
          0080800080800080800080800080800080800080800080800080800000000000
          0000000000008080008080008080008080008080008080008080008080008080
          00808000808000000000}
        Transparent = True
        TransparentColor = clOlive
      end
      item
        Name = #1050#1083#1072#1087#1072#1085' '#1075#1086#1088' Yellow left.bmp'
        Picture.Data = {
          07544269746D61703E020000424D3E0200000000000036000000280000000D00
          00000D0000000100180000000000080200000000000000000000000000000000
          0000000000008080008080008080008080008080008080008080008080008080
          0080800080800000000000000000000000808000808000808000808000808000
          80800080800080800080800000000000000000000000FFFF0000000080800080
          80008080008080008080008080008080000000FFFFFF0000000000000000FFFF
          00FFFF000000008080008080008080008080008080000000FFFFFFFFFFFF0000
          000000000000FFFF00FFFF00FFFF000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF0000000000000000FFFF00FFFF00FFFF00FFFF00000000808000
          0000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF00FFFF00FFFF00FF
          FF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
          00FFFF00FFFF00FFFF000000008080000000FFFFFFFFFFFFFFFFFFFFFFFF0000
          000000000000FFFF00FFFF00FFFF000000008080008080008080000000FFFFFF
          FFFFFFFFFFFF0000000000000000FFFF00FFFF00000000808000808000808000
          8080008080000000FFFFFFFFFFFF0000000000000000FFFF0000000080800080
          80008080008080008080008080008080000000FFFFFF00000000000000000000
          0080800080800080800080800080800080800080800080800080800000000000
          0000000000008080008080008080008080008080008080008080008080008080
          00808000808000000000}
        Transparent = True
        TransparentColor = clOlive
      end>
    Left = 48
    Top = 328
  end
  object aOPCImageList1: TaOPCImageList
    Items = <
      item
        Name = 'S510.gif'
        Picture.Data = {
          0954474946496D6167654749463839614F00A700D50000000000060606090909
          0D0D0D1313131515151919191E1E1E2121212525252929292D2D2D3232323535
          353A3A3A3E3E3E4141414444444A4A4A4E4E4E5151515555555959595E5E5E60
          60606666666868686F6F6F7070707575757979797E7E7E818181858585888888
          8C8C8C9090909696969A9A9A9D9D9DA0A0A0A6A6A6A8A8A8ADADADB1B1B1B4B4
          B4B8B8B8BEBEBEC0C0C0C5C5C5CACACACCCCCCD0D0D0D6D6D6DADADADCDCDCE0
          E0E0E4E4E4E8E8E8EDEDEDF1F1F1F5F5F5F9F9F9FEFEFE21FE1D4275696C7420
          7769746820474946204D6F766965204765617220332E300021F904010A003F00
          2C000000004F00A7000006FFC09F70482C1A8FC8A472C96C3A9FD0A854196B7D
          AE93072401E87ABF5F07E471B9865EB1A9FAB77B7D2A8F01A011B97E56AF570D
          C6EFFBFD317927571E0F0D00030F151F2F3D6B4837251609891F292F3B7F9A9B
          9C9C6D291F0F020B1625398F311D090719277B9DB0B1B27D332719050B1F3351
          270A0C21AFB3C2C3B0331F0A0E2B4D2D071633C4D0D19D2F120A69491E1037D2
          DCDD7E330E2448181CDEE6DE3D1620462D10E7EFDD0835451212F0F7D008EB44
          1806F8FFB27A081047E40382093D002AFCB3A3018213453E38A0D0E0C5C2852B
          48318058D081070C0A14A4B808AFC709030B3278D818D1A3870F1A1A0CB09022
          2149683B4E5018D060C307FF0F2B390E9108F40388101F2C380800E1438B1C37
          3BDD58217180830B2040100ADAB2E85111234894E0409140813A255E405578E3
          C588AA0626762841624408AD3FB976F41A02ACD8132854AC40110203C5027314
          D9C9C3F8C5B63E351ABFB082E5C10200071A58B82022C58A14284CD0B58B1728
          CBBD2FBF862D0158700B173062CCA05163858A121D3A147AC09B37822F0A7AF3
          8E90BBC309152C6AD09011C8058BCFA147DFDD7A7AA84BA37D57B75EF13AF6EC
          1A3770E4D0B183078F1E3ED22349DFA3078F1D3B74E4C0614339F317CEA18BAE
          3B3D6F752144A596DD5F8171079B6CB485375E79E7A5E7C37A3EB4F75E7CF3D5
          B75C73CF81B61F69D40905FFE075AA11E8DA81DF29489E79E8A977047BEEC127
          1F7DF661A89F74A5E9651D5F7EB1566077088227DE890DAA68048B13BE68E17D
          F9694863875D0998E3763C96F82383293EB862842D5208E385F865181D7F35FE
          F74380D83DB92389094E89A283104AE8628531763923984CA256A676677A97E6
          826B0A5904916F6E89A4971BF6679A87638238A08E23EAE9239F415A39249645
          C2C965925F72E81FA26486C8A8818E9A48259B57BAA9E591322A49E7A64DDE29
          22A83D8ADAA7A47F521A28AA72AAAAE9A1AD7A0A259A8F0259659B591A1927A6
          8586C9A9A266361AAB9A91125BA9A0A9666AA88D1FE288A7B352423A6CA9C55A
          3AE89CBB629BA8B6AF46B9FFA7B0A44E6AAAB19712BA24AB76FA9AE7B3DEB65B
          EBBBE2569B6C9D373AB92DACDDB2EB2711809E7AACBCABF25AEFA2BF860AEDB7
          EE864B6DAED62ADB2BC4F7163CEAC143240CEFB8BA5E2B66A71C73BBEEC7B422
          6CABC2F1926BF2B2E87EAA6EB02C4B7BEBC2326BFC70B304AF3CABCE30939C31
          C0D90A9C2EB0B2460BEEB4B8223BAFC301BB6A33D313EBEB32BF174BDDB0B928
          037D73D314EF6B71D40C977B32B3038F9D35C84288DC2FC6FFD25BB5BD2AE33C
          F4D33BC75CB2CF77A71CB4DE4E570C35CF7F237DAED2574B9C2FDC3FC8DD75DA
          336F2C36D68FB71CF2CB23FB3B35D86C2FEDB8C19AC7CDF9DC5EAB4D33E311E3
          4B3AD19DD3FDF9DA35B7EEFFF1DE86F76D74DD54276DB5ED42176EF6E17E1F6D
          B7EF780F4EB6D69B738D76CF8A87DD36E6AFF35DB4E75FD3CE7AC7C197BDF5D9
          881BDFFBE2BF734FB8F7CD835F3CEFA0D76EFEF2904BFE7CE2C7939FBCDB99C3
          8E3AE580232F38FED5CBDDF56497BDD5952F6FF02B5DE44E3739E8D54F7AA273
          5DCEAC17BBD455EE67D31BDD04055841FE452F748D9320EE86A73BECA9CE7219
          14A1F0BE47BCDDCDCE80F7A3DE064938400BF6CF7EFF93E108595842029E1083
          11BCDD0AD3D742135E307097D3E00E89D8431B7ED07D087C9B02E5173EF669EF
          80CA93A2FE1A48BFF141308442449FE99C57C517A23088DD63DE18D5E7C2029E
          118C698C1F03E727BEF66DFF2F8AF9A3E0FE1CE8451002EF7C6A5C2019D76746
          20C21190721C641B7F88C4148631905424A41B0DF9C7046E918E5684610E9538
          C43516D18747F45F1255284641B2D18837FC6225B5A8472ED6F18A31E4642923
          B9C850E270948F4CE42941994A3FBE8F951CDC6317ED884500CE908735F4E003
          7D89C700D2B0837C24662C4909C9399671928D442322A7684D493252948E8C23
          371589CA27DE318B790CA62B33F9C655A6F399C27CA5267129CE4B5EF39BB70C
          E736EDE94D5BAAF297EF4426348709CB4D5253979F74E232A1884E670A349EEC
          A424401DCAC46446B3A0F4DC672B3159C86C1ED2921BBDA73F99D9D0635674A0
          F26CE7444DEAC9262AB38FFF0C35E6125B6A5182CE539F20552747B1094E6DE6
          149EEBEC684F3F0A4CA0EE149FFF6C264B4D99D0974AD3A0B91CE72E150AD373
          CAB4934C75E9456FEAD3A23E34A83CCD6757037A52880A55AC44252B4D511A51
          8FBA93A26B356B58935AD29966B5A62995A852ED4ACB722ED4AA3AC46A5F7969
          CE62067696DDAC652F637AD86A9293B07F35AC2C1D3B55A76214A75E2D2B5891
          4AD2AB22F6B1547D6A467FFAD5A38E94B19345A8566DAAD2BD0A36B17EADAA64
          0F2AD5A66EB5B5757D2D682DCBD5B4C2F5AE6C3D2B5D3D4B59DBB256AFB9FD6C
          656F8B5CE2AA16AF6D1DEA5B973AD8D05E76ACBFAD2E6F71EBDCDAAE36AF6E5D
          295F610B59D94E33AAFC54FF6C61CF5BCF90F6F38621E86C639F1BDCECA5A008
          3140006A699BDED876A000A720C20C0ED281D9A2D7BDEAFDC00E12608223EC80
          222F60AF46752A52AD6424044A6841482A30DACCC675B32038C902E6B1841D5C
          40263421C174C7BB5BFD8C40273CC1F01398A114A638E504DDED6F974A401507
          58E5020C2031144CBC000E80A02C67F9405AF4405ACDD6A72D6FF1715C28D081
          0C2040C66A60C6224230021314E6308959C41524E3182244A63194F940162E93
          190BB8603025780B0482FC082110D9C822608D0A5A008319D8E0CF36D08D707C
          039C4113A70380AE8F0C5EC0821498800421B03296EB2C042D7F80CB2648010B
          5E2003F0E4E0D33AD0019BFF424DEA5297FAD339B0010D62E00215A020CE1F98
          B390293D843B8320CFC7E1B39F71A003F3F8FAD7C0FE757C7050834537FAD191
          BE32AD9360E9109020D39BEEF40D72B083F638E8DAD7768F7C54CD6A38CB99CE
          CB4E82AD71BDE73EDB80D70D5A510F865D6C463B1AD2920EF7320EB0E5676B9A
          D39EAEB69022F49E54AFFACDAFFEF6ACE5AD8471EB59D7E7EE7595D6AD831BB4
          FBD8F05636C1A1D06C7B473BDF6EF277B7031E6B704F7CC81728F2AD0F6E6E5E
          C7C7E1C67E77B227FDF12834BBCBF796B6C6010E6B59B7FC1106CF759F1FAEF2
          78DF9CD22D40C09661BEE98DD7DCE33FAF73CE91D37389273DDC411FBA09386E
          F3A7137CDC1167B9D5E51D1BF52B547DEB2D37B102F40176ABB760E0654FBBDA
          D7CEF6B6432108003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1052#1077#1096#1072#1083#1082#1072' OFF.gif'
        Picture.Data = {
          0954474946496D61676547494638396110001E00910000000000C0C0C0FFFFFF
          00000021FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0002002C0000000010001E0000025A9405A97997012364
          4EBE08AA053264A4749E82604B3871E27AAD5DEB9AA878A6277AA91E664EBC9F
          02EE84B9DF6E41E4658AC9A54A07F580923EE4F00A7D1AA1A528F0A38B7D4AE2
          066CD330C0286907A9DD66C3CDE3B91B5E00003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1052#1077#1096#1072#1083#1082#1072' ON.gif'
        Picture.Data = {
          0954474946496D61676547494638396110001E0091000000000000FF00FFFFFF
          00000021FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0002002C0000000010001E0000025A9405A97997012364
          4EBE08AA053264A4749E82604B3871E27AAD5DEB9AA878A6277AA91E664EBC9F
          02EE84B9DF6E41E4658AC9A54A07F580923EE4F00A7D1AA1A528F0A38B7D4AE2
          066CD330C0286907A9DD66C3CDE3B91B5E00003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = 'P 694,601,653 OFF.gif'
        Picture.Data = {
          0954474946496D61676547494638396124001B00910000000000808080C0C0C0
          FFFFFF21FE1D4275696C74207769746820474946204D6F766965204765617220
          332E300021F904010A0003002C0000000024001B0000027C9C8F09CBED9EA261
          A25A16B2DE402A0B86C0462EDEB084EA359241E701EB7CB9A624D373CBC5BAFE
          807D7EC0D32147DCE11C499A10C14336574F5474EA8C5CB154C5962BD26AA4E0
          4AD5DA285F8C13B5998D720BCE3835DDC7BDE3B1FA588A7803E705D877D24221
          B290512856E2602338E13239C9881684F9105100003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = 'P 694,601,653 ON.gif'
        Picture.Data = {
          0954474946496D61676547494638396124001B00A2000000000000FF00808080
          C0C0C0FFFFFF00000000000000000021FE1D4275696C74207769746820474946
          204D6F766965204765617220332E300021F904010A0004002C0000000024001B
          0000039548BADCF0304AD9AA82236B28BAFF80E56864097CE823124FE96E272A
          8422F0DE9BAC5A367EC7A09ACF37A18D86C4D5A2F76BFD78926660EA34F13C4C
          1760CACD928C17A077C32D8F07E00BF657EEBED28FF5BB4D7D57C4B8ADF9E988
          BEF501555F4A174482568467481B84858B5A8D4B8F83918E9368954B874D990C
          9B5A699531182671339D2C3A123A994032AF418D45B3B41509003B}
        Transparent = True
        TransparentColor = clBlack
      end
      item
        Name = #1059#1088#1086#1074#1077#1085#1100' OFF.bmp'
        Picture.Data = {
          07544269746D617062000000424D62000000000000003E000000280000000900
          0000090000000100010000000000240000000000000000000000020000000000
          000000000000FFFFFF00E3800000808000008080000000000000000000000000
          00008080000080800000E3800000}
        Transparent = True
        TransparentColor = 50331647
      end
      item
        Name = #1059#1088#1086#1074#1077#1085#1100'.bmp'
        Picture.Data = {
          07544269746D617032010000424D320100000000000036000000280000000900
          0000090000000100180000000000FC0000000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF00FFFF
          FF00000000000000FF0000FF0000FF00000000000000FFFFFF00FFFFFF000000
          00FF0000FF0000FF0000FF0000FF00000000FFFFFF0000000000FF0000FF0000
          FF0000FF0000FF0000FF0000FF000000000000000000FF0000FF0000FF0000FF
          0000FF0000FF0000FF000000000000000000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000000000FFFFFF00000000FF0000FF0000FF0000FF0000FF0000
          0000FFFFFF00FFFFFF00000000000000FF0000FF0000FF00000000000000FFFF
          FF00FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF00}
        Transparent = True
        TransparentColor = 50331647
      end
      item
        Name = #1091#1088#1086#1074#1077#1085#1100'1.bmp'
        Picture.Data = {
          07544269746D617002010000424D020100000000000036000000280000004300
          0000010000000100180000000000CC0000000000000000000000000000000000
          000080FFFF80FFFFAAFFFFAAFFFFAAFFFFBFFFFFBFFFFFBFFFFFBFFFFFD2FFFF
          D2FFFFD2FFFFD2FFFFD2FFFFD2FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FF
          FFE1FFFFE1FFFFE1FFFFE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFE1FFFFD2FF
          FFD2FFFFD2FFFFD2FFFFD2FFFFD2FFFFBFFFFFBFFFFFBFFFFFBFFFFFAAFFFFAA
          FFFFAAFFFF80FFFF80FFFF000000}
        Transparent = True
        TransparentColor = 42008575
      end
      item
        Name = 'S510_5.gif'
        Picture.Data = {
          0954474946496D6167654749463839614900A100E60000000000060606090909
          0D0D0D1313131515151919191E1E1E2121212525252929292D2D2D3232323535
          353A3A3A3E3E3E4141414444444A4A4A4E4E4E5151515555555959595E5E5E60
          60606666666868686F6F6F7070707575757979797E7E7E808040818181858585
          8888888C8C8C9090909696969A9A9A9D9D9DA0A0A0A6A6A6A8A8A8ADADADB1B1
          B1B4B4B4B8B8B8BEBEBEC0C0C0C5C5C5CACACACCCCCCD0D0D0D6D6D6DADADADC
          DCDCE0E0E0E4E4E4E8E8E8EDEDEDF1F1F1F5F5F5F9F9F9FEFEFE000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000021FE1D4275696C7420
          7769746820474946204D6F766965204765617220332E300021F904010A002000
          2C000000004900A1000007FF80208283848585322E1F8A130F10090090919292
          0E100F178A223032869D9E9F843C301F150F03000D118A1F2C30303631B1B2B3
          B332AE288A1E0F0D00030F151F303EA0C48238261609BE1F2A303CB4D0D1D2D2
          A22A1F0F020B16263AC584321D09071928B0D3E7E8E9B2342819050B1F34C428
          0A0C22E6EAF9FAE7341F0A0E2C3AB9386081C6BE8308A7C190A080D3200F1070
          249C4871160D07250461E050B163451F16428080E0B12445043624985C791041
          08032C63A6F321A00482093E64EAA4C5A30102140E283480B173270B6D0C807A
          C0A040818AA2267DA030B0208387A40E3C78F8A0A1C1000B2A72423DC8030585
          010D367CD08A55EB871022FF3E58701000C207173AC64EC3C1E28383010E2E84
          0891EBAAD2AD704790286182835002055499809157270E1824FC0E3010B48389
          122444105E6B382B62118A19A348B182450A1118841640F56B95ABDB3024CAB2
          811B46A2450F160038D0C0C285112A58A84871E273E8D16C0FBF45BDD8C4EAD6
          2E5EC49041A3860D162B4C74E8A0EB8179F3082429386F3EC2F80E2856B4B051
          6386AD172D9433772EBA70DBD3A959C71A0BD96DD79D0D38E4A0C30E3CF4D083
          0F3F4408C484144E18A10F3EF4C0030F3BE890C30DF4D907037EFA35075A7FA4
          FD375D80D711A8DD81092ED8A083104A5821851766B861871F86785F7ECB99F8
          9C7FD225565D8B05C2A820FF830E3E18E10F37E2F803861A72E82188F5FD5822
          7FD095E69691AA0D98A477313249E393515A38A58E56F698E58840EE7762972A
          822920762F92B9648382D408659A3956C923962292182497449AB6E29162E689
          E09E3D1062639481EE78A58F706E3967A25F5217269E31282963A48600BAA6A0
          97BE69A89C43A658A4A777BA18AA9EA37E7263A56D12AAE5A19BBAAAA89D483A
          5A269FA04849A5A56E161AA7902846F72BACC11A482B93DEE03A28A6AB324BE7
          AB2C362AEDA3A33EE8CDB1B962BB2CA2BE76DA2DA8DC4D3BA39FC5A09AECAEAC
          36EB25808CB22BAA997E4EE8CDB5AA9EDBABB3EAE62B6BBBE0F28B2685DECC9B
          29AFAD128CEFA707EFFBEEFFC2377A13B0A611DFBB28C505223CEC9993DE5A8C
          B21CDB5B27B4DE8A0CA99325577821282843AC32B706876C31C97F527AAA2735
          D7BBEDB3EB56EC2ECF6902112131416BCBE9C4B1EA7C34CC3D674CCCC6360F5D
          30C8DAB91C6EBF157A0382B9296B0D75B45E2B6CA3D820389C2DBA127F1C75D7
          3B532D76B9580BFDB4DC68D73D8CD8F2EAFAB0DEE99EDDB2C56C9F8AACE06F0F
          EC31B087D32AB69AE402DC34DC8FB3ACAF776CCBAC38DE973BBE72D12177EE73
          E5A986DEF1E806B32D48D59EA3EEB6C0ABE3FC29DB609FCEA6E5F43A5D38DFAC
          157371CCC6EE9E7AEF98B37EFB275F637CEBE7BC0FEE7BDC90B7162FD5495B7B
          BCF4C9DB1EF5B8CEC76EFCFFEC65EF5DFDC1C5104FF9F88CD37E33D139D35D83
          37A6CADE7EF9BF9F2F3582F48B1F38D959339FE68C96B06214EF7F799B5EE648
          27BF84118B18DA235F00F337C0FD8D4C5CC5B01F000947BD0A36F082F0220602
          55F7BEADCDED5B205CD8BFB6D7B8DAC18F6B287C59EE80D0B0FB4DB0830C8C61
          F3D4A731129A0D789B7320D2007532E489CE7B7D9BDA0C63473323BAD0844914
          22F6EA9721A039B184860B620AD5A7B41F30ED8A3FD4DF0765183E865DCD8702
          CC61DA86073BB16D5081CA3BE11A87C83609727081F1D3A1DABCE80DD081318D
          799C23063338C23F52508D88131BF458E8BE307A508793EBA20613D8BD17CAF1
          40A65B5F21B977444BA22DFF93FE5BDC1B2B09C501B98E8B11B4E11DE3789D15
          006E890714650D0C89C37CB912147BCCDE22DD444B3C7EEA969ED821EC6289B7
          5EB29235D613E1147587406322119904021F2A778925677A129AA583E0303529
          4B6B9672059BEBDFF326E9CD2C6A519CDC2C26279F684E0296C980E904583981
          A84548558B9AF49967F5EAF9B571B12F9FEBC4223DDD49C6A589B09B0175E4BA
          F8994B1A16439E0905E42F092ACCB0158397113DA42D29DA50AB5D4D9F9A6328
          1BB3570C902E94A323AD1F284CBA510B16749B92AC6227583A519756D454C4A0
          E99D443AC42815639619AD654DC77853331603A02D14E83E514A47B16134A90A
          6D2951F77837884255A23BFF65EA20E385D0AB6A74A87AE441E2C819545F66D5
          A69D4B25521B89D5561210946A05AA57857AD6AEB98E995D65EB57B3EA3A10C0
          34AE3A6DE529A749D6B99A55B0D783653C5315586412A3A3E3FCA75CF54A57B7
          26B68C8B7D2A650F8B4D69FE159F93C55F65B169576DEAB2B09B3D26388D864E
          625A35B5CF5CAD055B0BD8B2AA96A1F08C69336D1B5B9EDE13B5A2E5AC6CA7FA
          2E7FEED6B0B7D56A0841715CD85E73B8616DEA6319CBDBE7F274990E25866683
          9B5C9B42D6A8A008ED0D857B5DC52AADA4D5FD6679312BC995A6B79DDE4D2933
          3DD158E80AD2BC06FD447DD7CBC59FEE57B9E173A37857D95B00AFCDA9D57CEF
          40E3CBB3AA5217B90566F0FF564121D9FFC677AC1556F052D1DABFDA42D8BA6F
          A52D682D5CDAD66636C11F566F4012F759E08EF7B6AF64AF8753AB0204A85778
          3D8D6C7345DB8102E8E0261DA0E763E5ABE3BCE28F0709380108782014182C55
          6CF81D71448F220242B8A0291538A90B587CDA0CB730045359800D0CC1830B78
          052C2588162843E947E991C02C68A9F227063297BADC0505FB23469737891F13
          F4E52F8161C0988951E6057020048F89CC0726F38A2DB6F89F97C9CC5F384381
          0E6400017216DB40802102129C0036B2A10D3014D19BDC548837B8F9CD071821
          1CE258E005AE3141662020E8BE2EF902860EC108ACB3021784EA06C0BE0179D8
          831EF510DB3D1D08368866FF008316A8E0042510C1A5336D6B106CFA039D3E81
          0A5A008319204807E0DEC10ED024EE729BDBDCE0D6C10D66F98215A440D61FA0
          F5A0AB3D88421F7AD7F1F1350D6E90831D34E9DF000F3887726003663B1BDAD2
          C634BD3D716D119440DBDCF6360E74C0030C3DE9E217CF5087D62D0358BF7BD6
          B55EB827ECAD6B5EEB9BDFFE8610A07C30F08237FBD9D19EB6C88BD1F0876FBB
          DBDFAEF8A4A6A42175B33BD6209FF7CC4141727CF7FAD7FDA61ACB778003971F
          3CE60A1F3ADB6A0E719C4FBCE23AF279C7811EEF904B9D6D453739D219C474A7
          C33CE1D4FEBAEB1AEEE99B4B5CEB1E87B7BCD5BEF0B0E73B546647B8CCE93E73
          172080D36DE7F6D63FDE752EA1F3BDEEB8BE37AF9F8EF6C3D3DDEF803F01E1E7
          EE78BA171DEA69AFBCDA21AF08CA6BDEF16556804B3E0F824000003B}
        Transparent = True
        TransparentColor = clBlack
      end>
    Left = 16
    Top = 296
  end
  object PWater: TaOPCProvider
    Active = True
    OnChange = PWaterChange
    Left = 16
    Top = 152
  end
  object pConcentrat: TaOPCProvider
    Active = True
    OnChange = pConcentratChange
    Left = 16
    Top = 184
  end
  object pShuger: TaOPCProvider
    Active = True
    OnChange = pShugerChange
    Left = 16
    Top = 216
  end
  object pMode: TaOPCProvider
    Active = True
    OnChange = p1OutChange
    Left = 16
    Top = 256
  end
  object llRA: TaOPCLookupList
    Items.Strings = (
      '0='#1088#1091#1095#1085#1086#1081
      '1='#1072#1074#1090#1086#1084#1072#1090)
    Left = 48
    Top = 368
  end
end
