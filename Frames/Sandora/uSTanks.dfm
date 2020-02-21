object frSTanks: TfrSTanks
  Left = 0
  Top = 0
  Width = 660
  Height = 323
  TabOrder = 0
  inline TK4: TfrTank
    Left = 0
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    SensorMin = 'TK-4.t min'
    SensorMax = 'TK-4.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 08'
    SensorMassa = 'DP:[CP 5611]Massa TK-4'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature08'
    TankName = #1058#1050'-4'
    TankMaxMassa = 26000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 26000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TK-4'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature08'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 08'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1050'-4'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-4.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-4.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TK-4'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TK3: TfrTank
    Left = 108
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    SensorMin = 'TK-3.t min'
    SensorMax = 'TK-3.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 07'
    SensorMassa = 'DP:[CP 5611]Massa TK-3'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature07'
    TankName = #1058#1050'-3'
    TankMaxMassa = 26000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 26000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TK-3'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature07'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 07'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1050'-3'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-3.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-3.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TK-3'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TK2: TfrTank
    Left = 216
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    SensorMin = 'TK-2.t min'
    SensorMax = 'TK-2.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 02'
    SensorMassa = 'DP:[CP 5611]Massa TK-2'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature02'
    TankName = #1058#1050'-2'
    TankMaxMassa = 26000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 26000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TK-2'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature02'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 02'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1050'-2'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-2.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-2.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TK-2'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TK1: TfrTank
    Left = 324
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    SensorMin = 'TK-1.t min'
    SensorMax = 'TK-1.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 01'
    SensorMassa = 'DP:[CP 5611]Massa TK-1'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature01'
    TankName = #1058#1050'-1'
    TankMaxMassa = 26000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 26000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TK-1'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature01'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 01'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1050'-1'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-1.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = 'TK-1.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TK-1'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TM1: TfrTank
    Left = 0
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    SensorMin = #1058#1052'-1.t min'
    SensorMax = #1058#1052'-1.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 03'
    SensorMassa = 'DP:[CP 5611]Massa TM-1'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature03'
    TankName = #1058#1052'-1'
    TankMaxMassa = 13000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 13000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TM-1'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature03'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 03'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1052'-1'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-1.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-1.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TM-1'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TM2: TfrTank
    Left = 108
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    SensorMin = #1058#1052'-2.t min'
    SensorMax = #1058#1052'-2.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 04'
    SensorMassa = 'DP:[CP 5611]Massa TM-2'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature04'
    TankName = #1058#1052'-2'
    TankMaxMassa = 13000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 13000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TM-2'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature04'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 04'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1052'-2'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-2.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-2.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TM-2'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TM3: TfrTank
    Left = 216
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    SensorMin = #1058#1052'-3.t min'
    SensorMax = #1058#1052'-3.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 05'
    SensorMassa = 'DP:[CP 5611]Massa TM-3'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature05'
    TankName = #1058#1052'-3'
    TankMaxMassa = 13000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 13000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TM-3'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature05'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 05'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1052'-3'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-3.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-3.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TM-3'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TM4: TfrTank
    Left = 324
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    SensorMin = #1058#1052'-4.t min'
    SensorMax = #1058#1052'-4.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 06'
    SensorMassa = 'DP:[CP 5611]Massa TM-4'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature06'
    TankName = #1058#1052'-4'
    TankMaxMassa = 13000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 13000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TM-4'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature06'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 06'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1052'-4'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-4.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1052'-4.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TM-4'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TP4: TfrTank
    Left = 444
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    SensorMin = #1058#1055'-4.t min'
    SensorMax = #1058#1055'-4.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 12'
    SensorMassa = 'DP:[CP 5611]Massa TP-4'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature12'
    TankName = #1058#1055'-4'
    TankMaxMassa = 27000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 27000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TP-4'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature12'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 12'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1055'-4'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-4.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-4.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TP-4'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TP3: TfrTank
    Left = 552
    Top = 0
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    SensorMin = #1058#1055'-3.t min'
    SensorMax = #1058#1055'-3.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 11'
    SensorMassa = 'DP:[CP 5611]Massa TP-3'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature11'
    TankName = #1058#1055'-3'
    TankMaxMassa = 27000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 27000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TP-3'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature11'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 11'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1055'-3'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-3.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-3.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TP-3'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TP2: TfrTank
    Left = 444
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    SensorMin = #1058#1055'-2.t min'
    SensorMax = #1058#1055'-2.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 10'
    SensorMassa = 'DP:[CP 5611]Massa TP-2'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature10'
    TankName = #1058#1055'-2'
    TankMaxMassa = 27000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 27000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TP-2'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature10'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 10'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1055'-2'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-2.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-2.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TP-2'
      DisplayFormat = '# ##0 kg'
    end
  end
  inline TP1: TfrTank
    Left = 552
    Top = 168
    Width = 100
    Height = 153
    AutoScroll = False
    Constraints.MaxWidth = 100
    Color = clWhite
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    SensorMin = #1058#1055'-1.t min'
    SensorMax = #1058#1055'-1.t max'
    SensorProduct = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 09'
    SensorMassa = 'DP:[CP 5611]Massa TP-1'
    SensorTemperatura = 'SandoraZavod:Concentrat.temperature_all.Temperature09'
    TankName = #1058#1055'-1'
    TankMaxMassa = 27000
    object gMassa: TaOPCGauge
      Left = 0
      Top = 40
      Width = 105
      Height = 113
      Align = alBottom
      BorderStyle = bsNone
      Color = clWhite
      ForeColor = 16768648
      Kind = gkVerticalBar
      MaxValue = 27000
      ParentColor = False
      Progress = 0
      ShowText = False
      PhysID = 'DP:[CP 5611]Massa TP-1'
    end
    object lTemperature: TaOPCLabel
      Left = 2
      Top = 97
      Width = 37
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = 't'
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
      PhysID = 'SandoraZavod:Concentrat.temperature_all.Temperature09'
      DisplayFormat = '#0.0'#176'C;-#0.0'#176'C;0.0'#176'C'
    end
    object lProduct: TaOPCLabel
      Left = 0
      Top = 36
      Width = 105
      Height = 53
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
      PhysID = #1050#1086#1085#1094#1077#1085#1090#1088#1072#1090' 09'
    end
    object lTankName: TLabel
      Left = 0
      Top = 0
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = #1058#1055'-1'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object lMin: TaOPCLabel
      Left = 44
      Top = 105
      Width = 18
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-1.t min'
      DisplayFormat = '#.#;-#.#;0'
    end
    object lMax: TaOPCLabel
      Left = 44
      Top = 89
      Width = 18
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'max'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      PhysID = #1058#1055'-1.t max'
      DisplayFormat = '0.#;-0.#;0'
    end
    object lMassa: TaOPCLabel
      Left = 0
      Top = 18
      Width = 105
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlBottom
      PhysID = 'DP:[CP 5611]Massa TP-1'
      DisplayFormat = '# ##0 kg'
    end
  end
end
