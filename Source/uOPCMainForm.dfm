object fmOPCMainForm: TfmOPCMainForm
  Left = 69
  Top = 77
  HorzScrollBar.Tracking = True
  VertScrollBar.Tracking = True
  Caption = #1043#1083#1072#1074#1085#1072#1103' '#1092#1086#1088#1084#1072' '#1076#1083#1103' '#1052#1086#1085#1080#1090#1086#1088#1080#1085#1075#1072
  ClientHeight = 473
  ClientWidth = 723
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 454
    Width = 723
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 120
      end
      item
        Width = 50
      end>
  end
  object aOPCSource: TaOPCTCPSource_V30
    OnActivate = aOPCSourceActivate
    OnRequest = aOPCSourceRequest
    OnError = aOPCSourceError
    RemoteMachine = 'zav-vigo'
    PacketUpdate = False
    UpdateMode = umAuto
    MainHost = 'zav-vigo'
    Left = 90
    Top = 15
  end
  object aOPCAuthorization: TaOPCAuthorization
    OPCSource = aOPCSource
    Left = 120
    Top = 15
  end
  object MainMenu: TMainMenu
    Left = 10
    Top = 15
    object mPrint: TMenuItem
      Action = aPrint
    end
    object mAbout: TMenuItem
      Caption = '?'
      object N9: TMenuItem
        Action = HelpContents1
      end
      object mAboutProgramm: TMenuItem
        Action = aAbout
      end
    end
  end
  object ActionList: TActionList
    Left = 40
    Top = 15
    object aPrint: TAction
      Category = #1055#1077#1095#1072#1090#1100
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aAbout: TAction
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnExecute = aAboutExecute
    end
    object HelpContents1: THelpContents
      Category = 'Help'
      Caption = #1057#1087#1088#1072#1074#1082#1072
      Enabled = False
      Hint = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 40
      ShortCut = 112
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 225
    Top = 21
  end
end
