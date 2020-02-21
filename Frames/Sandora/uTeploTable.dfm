inherited TeploTable: TTeploTable
  Width = 83
  Height = 47
  AutoSize = True
  ExplicitWidth = 83
  ExplicitHeight = 47
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 83
    Height = 47
    AutoSize = True
    TabOrder = 0
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 81
      Height = 45
      Brush.Color = 14809087
      Shape = stRoundRect
    end
    object LTeplo: TaOPCLabel
      Left = 7
      Top = 20
      Width = 70
      Height = 19
      OnChange = LTeploChange
      OnDblClick = LTeploDblClick
      StairsOptions = []
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '##0.0 C'
      Alignment = taCenter
      AutoSize = False
      Color = 14809087
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
    end
    object lTeploName: TaOPCLabel
      Left = 7
      Top = 5
      Width = 70
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
end
