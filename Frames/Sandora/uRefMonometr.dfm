inherited Monometr: TMonometr
  Width = 83
  Height = 83
  AutoSize = True
  ExplicitWidth = 83
  ExplicitHeight = 83
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 83
    Height = 83
    AutoSize = True
    TabOrder = 0
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 81
      Height = 81
      Brush.Color = 14809087
      Shape = stRoundRect
    end
    object ErrWarning: TShape
      Left = 33
      Top = 12
      Width = 16
      Height = 16
      Brush.Color = clSilver
      Pen.Style = psClear
      Shape = stCircle
    end
    object LMAX: TaOPCLabel
      Left = 51
      Top = 9
      Width = 26
      Height = 19
      OnChange = LMAXChange
      OnDblClick = LMAXDblClick
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '##;-##;0'
      Alignment = taCenter
      AutoSize = False
      Color = 14809087
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object LMIN: TaOPCLabel
      Left = 5
      Top = 9
      Width = 26
      Height = 19
      OnChange = LMINChange
      OnDblClick = LMINDblClick
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '##;-##;0'
      Alignment = taCenter
      AutoSize = False
      Color = 14809087
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object LValue: TaOPCBlinkLabel
      Left = 7
      Top = 30
      Width = 68
      Height = 31
      OnChange = LValueChange
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '##0.0'
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -29
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = ANSI_CHARSET
      BlinkFont.Color = clWhite
      BlinkFont.Height = -29
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = []
    end
  end
end
