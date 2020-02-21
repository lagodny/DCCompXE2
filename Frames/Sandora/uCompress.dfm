inherited Compressor: TCompressor
  Width = 114
  Height = 33
  AutoSize = True
  ExplicitWidth = 114
  ExplicitHeight = 33
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 114
    Height = 33
    AutoSize = True
    TabOrder = 0
    object aOPCShape1: TaOPCShape
      Left = 1
      Top = 1
      Width = 112
      Height = 31
      Align = alLeft
      Shape = stRoundRect
    end
    object LValue: TaOPCBlinkLabel
      Left = 12
      Top = 5
      Width = 90
      Height = 24
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
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkOptions = [boFont, boColor]
      BlinkFont.Charset = RUSSIAN_CHARSET
      BlinkFont.Color = clGreen
      BlinkFont.Height = -19
      BlinkFont.Name = 'Arial'
      BlinkFont.Style = [fsBold]
    end
  end
end
