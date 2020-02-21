object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 289
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object aOPCColorLabel1: TaOPCColorLabel
    Left = 208
    Top = 96
    Width = 105
    Height = 41
    Value = '10'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    DisplayFormat = #1055#1088#1086#1074#1077#1088#1103#1077#1084': 0'
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1074#1077#1088#1103#1077#1084': 10'
    Color = clYellow
    Layout = tlCenter
    ErrorColor = clBlack
    Colors.Strings = (
      '1=clRed'
      '2=clGreen'
      '3=clBlue'
      '4=$FFFFFF'
      '5=$0A0000'
      '6=0'
      '7=255'
      '8=65535')
    ShowValue = True
  end
  object Edit1: TEdit
    Left = 56
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
    OnChange = Edit1Change
  end
end
