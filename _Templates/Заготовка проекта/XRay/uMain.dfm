object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' X-Ray (ERMI)'
  ClientHeight = 402
  ClientWidth = 668
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RegistryStorage: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = 'Monitoring\Reports\XRayErmi'
    SubStorages = <>
    Left = 368
    Top = 48
  end
  object FormStorage: TJvFormStorage
    AppStorage = RegistryStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 368
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N1: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object eamViewer1: TMenuItem
        Action = aTeamViewer
      end
    end
  end
  object ActionList1: TActionList
    Left = 216
    Top = 168
    object aTeamViewer: TAction
      Category = 'Help'
      Caption = 'TeamViewer'
      OnExecute = aTeamViewerExecute
    end
    object aMakeReport: TAction
      Category = 'Help'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090
    end
    object aSelectPeriod: TAction
      Category = 'Help'
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076'...'
    end
  end
end
