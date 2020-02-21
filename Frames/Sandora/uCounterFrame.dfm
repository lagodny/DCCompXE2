inherited frCounter: TfrCounter
  Width = 158
  Height = 317
  AutoSize = True
  ParentShowHint = False
  ShowHint = True
  ExplicitWidth = 158
  ExplicitHeight = 317
  DesignSize = (
    158
    317)
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 158
    Height = 317
    Anchors = [akLeft, akTop, akBottom]
    BorderStyle = bsSingle
    TabOrder = 0
    object Shape2: TShape
      Left = 1
      Top = 138
      Width = 152
      Height = 72
      Align = alClient
      ExplicitTop = 22
      ExplicitHeight = 282
    end
    object Shape5: TShape
      Left = 1
      Top = 80
      Width = 152
      Height = 58
      Align = alTop
      Brush.Color = clCream
    end
    object Shape4: TShape
      Left = 1
      Top = 22
      Width = 152
      Height = 58
      Align = alTop
      Brush.Color = clCream
    end
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 152
      Height = 21
      Align = alTop
      Brush.Color = clMoneyGreen
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
    end
    object I1Caption: TaOPCLabel
      Left = 8
      Top = 28
      Width = 10
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'I1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object I2Caption: TaOPCLabel
      Left = 8
      Top = 46
      Width = 10
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'I2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object I3Caption: TaOPCLabel
      Left = 8
      Top = 64
      Width = 10
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'I3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U1Caption: TaOPCLabel
      Left = 8
      Top = 83
      Width = 16
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'U1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U2Caption: TaOPCLabel
      Left = 8
      Top = 101
      Width = 16
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'U2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U3Caption: TaOPCLabel
      Left = 8
      Top = 120
      Width = 16
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'U3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object PhiCaption: TaOPCLabel
      Left = 8
      Top = 140
      Width = 27
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = #1059#1075#1086#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object FreqCaption: TaOPCLabel
      Left = 8
      Top = 158
      Width = 47
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = #1063#1072#1089#1090#1086#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object PACaption: TaOPCLabel
      Left = 8
      Top = 176
      Width = 31
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = #1056' '#1072#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object PRCaption: TaOPCLabel
      Left = 8
      Top = 194
      Width = 45
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = #1056' '#1088#1077#1072#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object I1: TaOPCLabel
      Left = 140
      Top = 28
      Width = 7
      Height = 16
      Hint = #1058#1086#1082' 1, '#1040
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 A'
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object I3: TaOPCLabel
      Left = 140
      Top = 64
      Width = 7
      Height = 16
      Hint = #1058#1086#1082' 3, '#1040
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 A'
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U1: TaOPCLabel
      Left = 140
      Top = 83
      Width = 7
      Height = 16
      Hint = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' 1, '#1042
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1042
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U2: TaOPCLabel
      Left = 140
      Top = 101
      Width = 7
      Height = 16
      Hint = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' 2, '#1042
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1042
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object U3: TaOPCLabel
      Left = 140
      Top = 120
      Width = 7
      Height = 16
      Hint = #1053#1072#1087#1088#1103#1078#1077#1085#1080#1077' 3, '#1042
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1042
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Phi: TaOPCLabel
      Left = 140
      Top = 140
      Width = 7
      Height = 16
      Hint = #1059#1075#1086#1083' '#1089#1076#1074#1080#1075#1072' '#1092#1072#1079', '#176
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '#0 '#176
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Freq: TaOPCLabel
      Left = 140
      Top = 158
      Width = 7
      Height = 16
      Hint = #1063#1072#1089#1090#1086#1090#1072' '#1089#1077#1090#1080', '#1043#1094
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1043#1094
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object PA: TaOPCLabel
      Left = 140
      Top = 176
      Width = 7
      Height = 16
      Hint = #1040#1082#1090#1080#1074#1085#1072#1103' '#1084#1086#1078#1085#1086#1089#1090#1100', '#1082#1042#1090
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0.0 '#1082#1042#1058
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object PR: TaOPCLabel
      Left = 143
      Top = 194
      Width = 4
      Height = 16
      Hint = #1056#1077#1072#1082#1090#1080#1074#1085#1072#1103' '#1084#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1072#1088
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0.0 '#1082#1042#1072#1088
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object I2: TaOPCLabel
      Left = 140
      Top = 46
      Width = 7
      Height = 16
      Hint = #1058#1086#1082' 2, '#1040
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 A'
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape3: TShape
      Left = 1
      Top = 210
      Width = 152
      Height = 102
      Align = alBottom
      Brush.Color = clCream
      ExplicitLeft = 0
      ExplicitTop = 213
    end
    object QAplusCaption: TaOPCLabel
      Left = 8
      Top = 213
      Width = 40
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1072#1082#1090'+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QAplus: TaOPCLabel
      Left = 140
      Top = 213
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1072#1082#1090#1080#1074#1085#1072#1103' +, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QAminusCaption: TaOPCLabel
      Left = 8
      Top = 229
      Width = 36
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1072#1082#1090'-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QAminus: TaOPCLabel
      Left = 140
      Top = 229
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1072#1082#1090#1080#1074#1085#1072#1103' -, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR1Caption: TaOPCLabel
      Left = 8
      Top = 245
      Width = 53
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1088#1077#1072#1082#1090'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR1: TaOPCLabel
      Left = 140
      Top = 245
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1088#1077#1072#1082#1090#1080#1074#1085#1072#1103' I, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR2Caption: TaOPCLabel
      Left = 8
      Top = 261
      Width = 53
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1088#1077#1072#1082#1090'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR2: TaOPCLabel
      Left = 140
      Top = 261
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1088#1077#1072#1082#1090#1080#1074#1085#1072#1103' II, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR3Caption: TaOPCLabel
      Left = 8
      Top = 277
      Width = 53
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1088#1077#1072#1082#1090'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR3: TaOPCLabel
      Left = 140
      Top = 277
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1088#1077#1072#1082#1090#1080#1074#1085#1072#1103' III, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR4Caption: TaOPCLabel
      Left = 8
      Top = 294
      Width = 53
      Height = 16
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      Caption = 'Q '#1088#1077#1072#1082#1090'4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object QR4: TaOPCLabel
      Left = 140
      Top = 294
      Width = 7
      Height = 16
      Hint = #1052#1086#1097#1085#1086#1089#1090#1100' '#1088#1077#1072#1082#1090#1080#1074#1085#1072#1103' IV, '#1082#1042#1090'*'#1095
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      DisplayFormat = '# ##0 '#1082#1042#1058'*'#1095
      Alignment = taRightJustify
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Place: TaOPCLabel
      Left = 0
      Top = 3
      Width = 153
      Height = 16
      OnMouseDown = Shape1MouseDown
      OnStartDrag = Shape1StartDrag
      InteractiveFont.Charset = DEFAULT_CHARSET
      InteractiveFont.Color = clHighlight
      InteractiveFont.Height = -11
      InteractiveFont.Name = 'Tahoma'
      InteractiveFont.Style = [fsUnderline]
      Alignment = taCenter
      AutoSize = False
      Caption = 'Place'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
end
