object OPCIntervalForm: TOPCIntervalForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076
  ClientHeight = 213
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline OPCIntervalFrame: TOPCIntervalFrame
    Left = 8
    Top = 8
    Width = 249
    Height = 166
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
  end
  object bOk: TButton
    Left = 97
    Top = 178
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 178
    Top = 178
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
