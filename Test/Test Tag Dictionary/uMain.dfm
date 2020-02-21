object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 339
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 40
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object aOPCLabel1: TaOPCLabel
    Left = 312
    Top = 72
    Width = 94
    Height = 13
    OPCSource = aOPCTCPSource_V301
    PhysID = '1'
    InteractiveFont.Charset = DEFAULT_CHARSET
    InteractiveFont.Color = clHighlight
    InteractiveFont.Height = -11
    InteractiveFont.Name = 'Tahoma'
    InteractiveFont.Style = [fsUnderline]
    Caption = '42626,6246528704'
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 24
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object aOPCTagDictionary1: TaOPCTagDictionary
    Tags = <
      item
        Name = 'TTagCollectionItem0'
        OPCSource = aOPCTCPSource_V301
        PhysID = '4'
        Value = '48570'
        OnChange = aOPCTagDictionary1Tags0Change
      end
      item
        Name = 'TTagCollectionItem1'
        OPCSource = aOPCTCPSource_V301
        PhysID = '1'
        Value = '42626,6246528704'
      end>
    Left = 160
    Top = 104
  end
  object aOPCTCPSource_V301: TaOPCTCPSource_V30
    RemoteMachine = 'duakhed0023'
    User = #1051#1072#1075#1086#1076#1085#1099#1081
    Password = '314'
    PacketUpdate = True
    UpdateMode = umStreamPacket
    MainHost = 'duakhed0023'
    Left = 160
    Top = 40
  end
  object IdCmdTCPServer1: TIdCmdTCPServer
    Bindings = <>
    DefaultPort = 0
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '200'
    Greeting.Text.Strings = (
      'Welcome')
    HelpReply.Code = '100'
    HelpReply.Text.Strings = (
      'Help follows')
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '400'
    ReplyUnknownCommand.Text.Strings = (
      'Unknown Command')
    Left = 248
    Top = 176
  end
  object aOPCProviderList1: TaOPCProviderList
    OPCSource = aOPCTCPSource_V301
    Left = 208
    Top = 256
    object TaOPCProviderItem: TaOPCProviderItem
      Active = True
      OPCSource = aOPCTCPSource_V301
      Value = '42626,6246528704'
      PhysID = '1'
    end
    object TaOPCProviderItem1: TaOPCProviderItem
    end
    object TaOPCProviderItem2: TaOPCProviderItem
    end
    object TaOPCProviderItem3: TaOPCProviderItem
    end
    object TaOPCProviderItem4: TaOPCProviderItem
    end
    object TaOPCProviderItem5: TaOPCProviderItem
    end
    object TaOPCProviderItem6: TaOPCProviderItem
    end
    object System_Connection_count: TaOPCProviderItem
      OPCSource = aOPCTCPSource_V301
      PhysID = '3'
    end
  end
end
