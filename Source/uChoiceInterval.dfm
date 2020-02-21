object ChoiceInterval: TChoiceInterval
  Left = 697
  Top = 149
  BorderStyle = bsDialog
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 116
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 243
    Height = 81
    Align = alTop
    Caption = #1055#1077#1088#1080#1086#1076
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 25
      Width = 7
      Height = 13
      Caption = #1057
    end
    object Label2: TLabel
      Left = 5
      Top = 50
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object dtFrom: TDateTimePicker
      Left = 30
      Top = 20
      Width = 106
      Height = 21
      Date = 38051.000000000000000000
      Time = 38051.000000000000000000
      TabOrder = 0
    end
    object tmFrom: TDateTimePicker
      Left = 145
      Top = 20
      Width = 86
      Height = 21
      Date = 0.384909768516081400
      Time = 0.384909768516081400
      Kind = dtkTime
      TabOrder = 1
    end
    object dtTo: TDateTimePicker
      Left = 30
      Top = 45
      Width = 106
      Height = 21
      Date = 38416.000000000000000000
      Time = 38416.000000000000000000
      TabOrder = 2
    end
    object tmTo: TDateTimePicker
      Left = 145
      Top = 45
      Width = 86
      Height = 21
      Date = 0.387262696756806700
      Time = 0.387262696756806700
      Kind = dtkTime
      TabOrder = 3
    end
  end
  object bOk: TButton
    Left = 79
    Top = 85
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 159
    Top = 85
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
