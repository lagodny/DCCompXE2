object DozatorControlForm: TDozatorControlForm
  Left = 345
  Top = 202
  BorderStyle = bsDialog
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1076#1086#1079#1072#1090#1086#1088#1086#1084
  ClientHeight = 270
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    252
    270)
  PixelsPerInch = 96
  TextHeight = 13
  object aOPCLabel1: TaOPCLabel
    Left = 8
    Top = 24
    Width = 49
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1047#1072#1076#1072#1085#1086', '#1083
  end
  object aOPCLabel2: TaOPCLabel
    Left = 8
    Top = 64
    Width = 56
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1053#1072#1073#1088#1072#1085#1086', '#1083
  end
  object aOPCLabel3: TaOPCLabel
    Left = 8
    Top = 104
    Width = 53
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = #1055#1086#1090#1086#1082', '#1083'/'#1095
  end
  object aOPCLabel4: TaOPCLabel
    Left = 96
    Top = 64
    Width = 60
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = 'aOPCLabel4'
  end
  object aOPCLabel5: TaOPCLabel
    Left = 96
    Top = 104
    Width = 60
    Height = 13
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = 'aOPCLabel5'
  end
  object Button1: TButton
    Left = 96
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 172
    Top = 241
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 96
    Top = 24
    Width = 60
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 169
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
  end
end
