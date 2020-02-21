inherited BoilerAlarms: TBoilerAlarms
  Width = 710
  Height = 33
  ExplicitWidth = 710
  ExplicitHeight = 33
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 33
    ParentBackground = False
    TabOrder = 0
    object LMax: TaOPCBlinkLabel
      Left = 564
      Top = 8
      Width = 42
      Height = 16
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.0;-#0.0;0'
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = RUSSIAN_CHARSET
      BlinkFont.Color = clWindowText
      BlinkFont.Height = -13
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = [fsBold]
    end
    object LMin: TaOPCBlinkLabel
      Left = 522
      Top = 8
      Width = 42
      Height = 16
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0.0;-#0.0;0'
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = RUSSIAN_CHARSET
      BlinkFont.Color = clWindowText
      BlinkFont.Height = -13
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = [fsBold]
    end
    object LValue: TaOPCBlinkLabel
      Left = 415
      Top = 8
      Width = 108
      Height = 16
      OnChange = LValueChange
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '##0.0'
      Alignment = taCenter
      AutoSize = False
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = RUSSIAN_CHARSET
      BlinkFont.Color = clGreen
      BlinkFont.Height = -13
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = [fsBold]
    end
    object lName: TaOPCBlinkLabel
      Left = 8
      Top = 8
      Width = 410
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkFont.Charset = RUSSIAN_CHARSET
      BlinkFont.Color = clWindowText
      BlinkFont.Height = -13
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = []
    end
    object cbAlarm: TCheckBox
      Left = 612
      Top = 8
      Width = 95
      Height = 17
      Caption = #1050#1074#1080#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = cbAlarmClick
    end
  end
end
