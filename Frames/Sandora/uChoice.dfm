object ChoiceForm: TChoiceForm
  Left = 345
  Top = 202
  BorderIcons = [biSystemMenu]
  Caption = #1057#1085#1103#1090#1100' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091' '#1105#1084#1082#1086#1089#1090#1080
  ClientHeight = 88
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    296
    88)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 192
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1088#1080#1095#1080#1085#1091' '#1089#1085#1103#1090#1080#1103' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080':'
  end
  object ButtonOK: TButton
    Left = 123
    Top = 56
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1050
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object ButtonCancel: TButton
    Left = 213
    Top = 56
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object ComboBox: TComboBox
    Left = 8
    Top = 25
    Width = 282
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBoxChange
    OnDblClick = ComboBoxDblClick
  end
end
