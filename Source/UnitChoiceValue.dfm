object ChoiceValue: TChoiceValue
  Left = 485
  Top = 231
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 118
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 24
    Width = 125
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
  end
  object bbOK: TBitBtn
    Left = 54
    Top = 84
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    NumGlyphs = 2
  end
  object bbCancel: TBitBtn
    Left = 138
    Top = 84
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    NumGlyphs = 2
  end
  object Edit: TEdit
    Left = 148
    Top = 18
    Width = 103
    Height = 21
    TabOrder = 0
    Text = 'Edit'
    OnChange = EditChange
  end
  object ComboBox: TComboBox
    Left = 8
    Top = 44
    Width = 243
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBoxChange
  end
end
