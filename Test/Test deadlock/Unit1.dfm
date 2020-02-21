object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 384
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object aOPCLabel1: TaOPCLabel
    Left = 217
    Top = 48
    Width = 94
    Height = 13
    OPCSource = aOPCTCPSource_V301
    PhysID = '4'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = '42209.3583442824'
  end
  object aOPCGauge1: TaOPCGauge
    Left = 24
    Top = 128
    Width = 100
    Height = 100
    Progress = 0
  end
  object Button1: TButton
    Left = 344
    Top = 36
    Width = 105
    Height = 25
    Caption = 'Add 100 Labels'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 217
    Top = 80
    Width = 97
    Height = 17
    Caption = 'label connected'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 217
    Top = 103
    Width = 97
    Height = 17
    Caption = 'Source is active'
    TabOrder = 2
    OnClick = CheckBox2Click
  end
  object Button2: TButton
    Left = 344
    Top = 67
    Width = 105
    Height = 25
    Caption = 'FillData'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 344
    Top = 98
    Width = 105
    Height = 25
    Caption = 'Add 100 guages'
    TabOrder = 4
    OnClick = Button3Click
  end
  object aOPCTCPSource_V301: TaOPCTCPSource_V30
    RemoteMachine = 'duakhed0023'
    User = #1051#1072#1075#1086#1076#1085#1099#1081
    Password = '314'
    PacketUpdate = True
    MainHost = 'duakhed0023'
    Left = 64
    Top = 24
  end
end
