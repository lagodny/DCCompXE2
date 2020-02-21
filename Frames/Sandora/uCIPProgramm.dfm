inherited CIPProgrammFrame: TCIPProgrammFrame
  Width = 146
  Height = 38
  AutoSize = True
  Color = 15066597
  Font.Name = 'Arial'
  ParentColor = False
  ParentFont = False
  ExplicitWidth = 146
  ExplicitHeight = 38
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 146
    Height = 38
    Hint = #1054#1073#1098#1077#1082#1090' '#1084#1086#1081#1082#1080
    AutoSize = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    object aOPCShape: TaOPCShape
      Left = 1
      Top = 1
      Width = 144
      Height = 36
      Hint = #1054#1073#1098#1077#1082#1090' '#1084#1086#1081#1082#1080
      Brush.Color = 13303754
      Shape = stRoundRect
    end
    object Programm: TaOPCLabel
      Left = 1
      Top = 3
      Width = 144
      Height = 34
      Cursor = crHandPoint
      Hint = #1054#1073#1098#1077#1082#1090' '#1084#1086#1081#1082#1080
      OnClick = ProgrammDblClick
      OnDblClick = ProgrammDblClick
      StairsOptions = []
      Interactive = True
      InteractiveFont.Charset = RUSSIAN_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -12
      InteractiveFont.Name = 'Arial'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      WordWrap = True
    end
  end
end
