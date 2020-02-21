object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object aOPCLabel1: TaOPCLabel
    Left = 400
    Top = 132
    Width = 94
    Height = 13
    OPCSource = aOPCTCPSource_V321
    PhysID = '1'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = '41471,6732868287'
  end
  object Button1: TButton
    Left = 352
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 352
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object mPerm: TMemo
    Left = 8
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      #1051#1072#1075#1086#1076#1085#1099#1081' = rw'
      #1042#1077#1088#1073#1080#1074#1089#1082#1080#1081' = r'
      '134124=r')
    TabOrder = 2
  end
  object ePeoject: TEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 21
    TabOrder = 3
    Text = '6'
  end
  object bTestPerm: TButton
    Left = 8
    Top = 127
    Width = 75
    Height = 25
    Caption = 'bTestPerm'
    TabOrder = 4
    OnClick = bTestPermClick
  end
  object aOPCTCPSource_V321: TaOPCTCPSource_V32
    RemoteMachine = 'localhost'
    User = #1051#1072#1075#1086#1076#1085#1099#1081
    Password = '314'
    PacketUpdate = True
    UpdateMode = umStreamPacket
    ProtocolVersion = 32
    Encrypt = True
    Port = 5152
    MainHost = 'localhost'
    MainPort = 5152
    Left = 424
    Top = 24
  end
  object aOPCTCPSource_V301: TaOPCTCPSource_V30
    RemoteMachine = 'duakhed0023'
    User = #1051#1072#1075#1086#1076#1085#1099#1081
    Password = '314'
    PacketUpdate = True
    UpdateMode = umStreamPacket
    MainHost = 'duakhed0023'
    Left = 424
    Top = 72
  end
end
