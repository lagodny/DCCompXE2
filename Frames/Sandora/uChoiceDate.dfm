object ChoiceDateForm: TChoiceDateForm
  Left = 345
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1044#1072#1090#1072' '#1087#1072#1088#1090#1080#1080
  ClientHeight = 92
  ClientWidth = 137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    137
    92)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091' '#1087#1072#1088#1090#1080#1080
  end
  object ButtonOK: TButton
    Left = 8
    Top = 57
    Width = 57
    Height = 23
    Anchors = [akTop, akRight]
    Caption = #1054#1050
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object ButtonCancel: TButton
    Left = 71
    Top = 57
    Width = 58
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object DateTimePicker: TDateTimePicker
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    Date = 40106.409088252320000000
    Time = 40106.409088252320000000
    TabOrder = 2
    OnChange = DateTimePickerChange
    OnDblClick = DateTimePickerDblClick
  end
end
