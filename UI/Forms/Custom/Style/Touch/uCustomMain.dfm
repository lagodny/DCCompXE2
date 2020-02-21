object CustomMainForm: TCustomMainForm
  Left = 0
  Top = 0
  Caption = 'DC Config'
  ClientHeight = 405
  ClientWidth = 772
  Color = clAppWorkSpace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpTBXDock1: TSpTBXDock
    Left = 0
    Top = 0
    Width = 772
    Height = 25
    object tbPanel: TSpTBXToolbar
      Left = 0
      Top = 0
      DockMode = dmCannotFloatOrChangeDocks
      DockPos = 0
      FullSize = True
      ShrinkMode = tbsmNone
      Stretch = True
      TabOrder = 0
      Caption = 'Panel'
      object SpTBXRightAlignSpacerItem2: TSpTBXRightAlignSpacerItem
        CustomWidth = 732
      end
      object tbItemVer: TSpTBXLabelItem
        Caption = 'Ver:'
        OnClick = tbItemVerClick
        FontSettings.Color = clBlack
      end
    end
  end
  object WindowBar: TllTaskBar
    Left = 0
    Top = 25
    Width = 772
    Height = 26
    Align = alTop
    ButtonTransparent = True
    Color = clAppWorkSpace
    Kind = lltbHorizontal
    Flat = False
    HideMinimizedMDI = True
    MinButtonWidth = 22
    MaxButtonWidth = 150
    ParentColor = False
    PictureAlign = paRightBottom
    PictureBevel = False
    PictureCentered = True
    PictureMaximize = True
    PictureRatio = True
    PictureTransparent = False
    PictureWidth = 22
    TabOrder = 1
  end
  object StatusBar: TSpTBXStatusBar
    Left = 0
    Top = 380
    Width = 772
    Height = 25
    ParentShowHint = False
    ShowHint = True
    SkinType = sknNone
    ExplicitTop = 386
    object tbiHint: TSpTBXLabelItem
      CustomWidth = 300
      MinHeight = 15
    end
    object SpTBXRightAlignSpacerItem1: TSpTBXRightAlignSpacerItem
      Alignment = taRightJustify
      CustomWidth = 380
    end
    object iCurrentUser: TTBItem
      Caption = 'CurrentUser'
      DisplayMode = nbdmImageAndText
      ImageIndex = 35
    end
  end
  object RegistryStorage: TJvAppRegistryStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    Root = 'CUTE_RegLine'
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
  object ActionList1: TActionList
    Left = 112
    Top = 40
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = 'Cascade'
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile horizontal'
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = 'Tile vertical'
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = 'Minimize All'
    end
    object aUploadSetup: TAction
      Caption = 'Upload setup...'
      OnExecute = aUploadSetupExecute
    end
    object aDownloadSetup: TAction
      Caption = 'Download setup...'
      OnExecute = aDownloadSetupExecute
    end
    object aWindowCloseAll: TAction
      Category = 'Window'
      Caption = 'Close All'
      OnExecute = aWindowCloseAllExecute
    end
  end
  object aOpenPlantRefList: TAction
    Category = 'RefList'
    Caption = 'Plants'
  end
  object aOpenPasterShiftReportDocList: TAction
    Category = 'DocList'
    Caption = 'Paster shift report'
  end
  object WindowClose1: TWindowClose
    Category = 'Window'
    Caption = 'Close'
  end
  object aShowInstruction: TAction
    Category = 'Help'
    Caption = 'Instruction...'
  end
  object ApplicationEvents1: TApplicationEvents
    OnHint = ApplicationEvents1Hint
    Left = 368
    Top = 160
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 96
    object miLanguage: TMenuItem
      Caption = 'Language'
    end
    object Windows1: TMenuItem
      Caption = 'Windows'
      object Cascade1: TMenuItem
        Action = WindowCascade1
      end
      object mTileHorizontal: TMenuItem
        Action = WindowTileHorizontal1
      end
      object mTileVertical: TMenuItem
        Action = WindowTileVertical1
      end
      object mMinimizeAll: TMenuItem
        Action = WindowMinimizeAll1
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object CloseAll1: TMenuItem
        Action = aWindowCloseAll
      end
    end
    object smiHelp: TMenuItem
      Caption = 'Help'
    end
  end
  object GestureManager: TGestureManager
    Left = 456
    Top = 48
  end
end
