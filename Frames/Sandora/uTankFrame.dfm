inherited frTank: TfrTank
  Width = 78
  Height = 183
  ParentColor = False
  ExplicitWidth = 78
  ExplicitHeight = 183
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 78
    Height = 183
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 78
      Height = 18
      Brush.Color = 13034239
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object gMassa: TaOPCGauge
      Left = 0
      Top = 17
      Width = 78
      Height = 161
      BackColor = 15395562
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 20000
      ParentColor = False
      Progress = 0
      ShowText = False
    end
    object lTemperature: TaOPCLabel
      Left = 18
      Top = 145
      Width = 37
      Height = 17
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
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
    end
    object lProduct: TaOPCLabel
      Left = 1
      Top = 35
      Width = 76
      Height = 57
      Cursor = crHandPoint
      Hint = #1055#1088#1086#1076#1091#1082#1090
      OnChange = UpdateTankStatus
      OnClick = lProductDblClick
      OnDblClick = lProductDblClick
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Times New Roman'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
    object lTankName: TaOPCLabel
      Left = 3
      Top = 0
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
      Caption = 'TA-1'
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
    object lMin: TaOPCLabel
      Left = 56
      Top = 155
      Width = 18
      Height = 12
      Cursor = crHandPoint
      Hint = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1093#1088#1072#1085#1077#1085#1080#1103
      OnChange = UpdateTankStatus
      OnClick = lMinDblClick
      OnDblClick = lMinDblClick
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#.#;-#.#;0'
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lMax: TaOPCLabel
      Left = 56
      Top = 142
      Width = 18
      Height = 12
      Cursor = crHandPoint
      Hint = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099' '#1093#1088#1072#1085#1077#1085#1080#1103
      OnChange = UpdateTankStatus
      OnClick = lMaxDblClick
      OnDblClick = lMaxDblClick
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '0.#;-0.#;0'
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lMassa: TaOPCLabel
      Left = 19
      Top = 19
      Width = 56
      Height = 15
      Hint = #1052#1072#1089#1089#1072', '#1082#1075
      OnChange = UpdateTankStatus
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 kg'
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
    end
    object lData: TaOPCLabel
      Left = 8
      Top = 92
      Width = 61
      Height = 12
      Cursor = crHandPoint
      Hint = #1044#1072#1090#1072' '#1087#1072#1088#1090#1080#1080
      OnClick = lDataDblClick
      OnDblClick = lDataDblClick
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = 'datedd.mm.yyyy;<>'
      Alignment = taCenter
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object MaxSize: TaOPCLabel
      Left = 44
      Top = 3
      Width = 16
      Height = 15
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taRightJustify
      AutoSize = False
      Caption = '25'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TaOPCLabel
      Left = 70
      Top = 2
      Width = 4
      Height = 7
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = '3'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TaOPCLabel
      Left = 62
      Top = 3
      Width = 8
      Height = 13
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Caption = 'm'
      Transparent = True
    end
    object lSv: TaOPCLabel
      Left = 37
      Top = 118
      Width = 37
      Height = 12
      Cursor = crHandPoint
      Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1091#1093#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', %'
      OnClick = lSvDblClick
      OnDblClick = lSvDblClick
      Visible = False
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.00%'
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lSVCaption: TaOPCLabel
      Left = 0
      Top = 118
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
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lStoreTimeCaption: TaOPCLabel
      Left = 0
      Top = 104
      Width = 42
      Height = 12
      Visible = False
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1088#1086#1082' '#1093#1088'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lStoreTime: TaOPCLabel
      Left = 47
      Top = 104
      Width = 27
      Height = 12
      Cursor = crHandPoint
      Hint = #1057#1088#1086#1082' '#1093#1088#1072#1085#1077#1085#1080#1103', '#1076#1085#1077#1081
      OnClick = lStoreTimeDblClick
      OnDblClick = lStoreTimeDblClick
      Visible = False
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0 '#1076#1085'.'
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object MassaGif: TaOPCGifImage
      Left = 5
      Top = 23
      Width = 7
      Height = 7
      Visible = False
      Discrete = False
      Proportional = True
      Stretch = True
      Animate = False
    end
    object TempGif: TaOPCGifImage
      Left = 5
      Top = 151
      Width = 7
      Height = 7
      Visible = False
      Discrete = False
      Proportional = True
      Stretch = True
      States.Strings = (
        '0=0'
        '1=1'
        '2=2'
        '3=3')
      Animate = False
    end
    object lTKCaption: TaOPCLabel
      Left = 0
      Top = 129
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
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lTK: TaOPCLabel
      Left = 37
      Top = 129
      Width = 37
      Height = 12
      Cursor = crHandPoint
      Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1091#1093#1080#1093' '#1074#1077#1097#1077#1089#1090#1074', %'
      OnClick = lTKDblClick
      OnDblClick = lTKDblClick
      Visible = False
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -9
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.00'
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object CoolSystem: TShape
      Left = 0
      Top = 16
      Width = 78
      Height = 167
      Brush.Style = bsClear
      Pen.Color = clNavy
      Pen.Width = 2
      Visible = False
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object Pump: TaOPCGifImage
      Left = 5
      Top = 165
      Width = 7
      Height = 8
      Hint = #1053#1072#1089#1086#1089
      Visible = False
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=7'
        '1=4')
    end
    object Mixer: TaOPCImage2In
      Left = 19
      Top = 166
      Width = 11
      Height = 5
      Hint = #1052#1077#1096#1072#1083#1082#1072
      OnClick = MixerClick
      Visible = False
      Discrete = False
      Stretch = True
      States.Strings = (
        '00=8'
        '01=9'
        '10=10'
        '11=6')
    end
    object Cooling: TaOPCGifImage
      Left = 37
      Top = 166
      Width = 14
      Height = 5
      Hint = #1054#1093#1083#1072#1078#1085#1077#1085#1080#1077
      OnChange = CoolingChange
      Visible = False
      Discrete = False
      Stretch = True
      States.Strings = (
        '0=7'
        '1=5')
    end
    object MixerStateLine: TaOPCStateLine
      Left = 0
      Top = 177
      Width = 78
      Height = 6
      Hint = #1056#1072#1073#1086#1090#1072' '#1084#1077#1096#1072#1083#1082#1080' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 12 '#1095#1072#1089#1086#1074
      OnClick = MixerStateLineClick
      Visible = False
      ShowHint = True
      UpdateOnChangeMoment = True
      ParentShowHint = False
      StateColors.Strings = (
        '0=clWhite'
        '1=clGreen')
      Interval = 12.000000000000000000
    end
  end
end
