object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 426
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 121
    Top = 0
    Height = 426
    ExplicitLeft = 144
    ExplicitTop = 112
    ExplicitHeight = 100
  end
  object Memo1: TMemo
    Left = 124
    Top = 0
    Width = 511
    Height = 426
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 426
    Align = alLeft
    TabOrder = 1
    object bConnect: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 25
      Caption = 'bConnect'
      TabOrder = 0
      OnClick = bConnectClick
    end
    object bGetValue: TButton
      Left = 8
      Top = 79
      Width = 105
      Height = 25
      Caption = 'bGetValue'
      TabOrder = 1
      OnClick = bGetValueClick
    end
    object eId1: TEdit
      Left = 8
      Top = 52
      Width = 105
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object bStartUpdate: TButton
      Left = 8
      Top = 120
      Width = 105
      Height = 25
      Caption = 'bStartUpdate'
      TabOrder = 3
      OnClick = bStartUpdateClick
    end
    object bGetValue1: TButton
      Left = 8
      Top = 168
      Width = 107
      Height = 25
      Caption = 'bGetValue1'
      TabOrder = 4
      OnClick = bGetValue1Click
    end
    object eTestConvert: TEdit
      Left = 8
      Top = 248
      Width = 107
      Height = 21
      TabOrder = 5
      Text = #1090#1077#1089#1058' '#8470'1 123'
    end
    object bTestConvert: TButton
      Left = 8
      Top = 275
      Width = 107
      Height = 25
      Caption = 'bTestConvert'
      TabOrder = 6
      OnClick = bTestConvertClick
    end
  end
end
