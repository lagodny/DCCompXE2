object cxCustomMainForm: TcxCustomMainForm
  Left = 0
  Top = 0
  Caption = 'Custom Main Form'
  ClientHeight = 425
  ClientWidth = 772
  Color = clAppWorkSpace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 405
    Width = 772
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarStateIndicatorPanelStyle'
        PanelStyle.Indicators = <
          item
            IndicatorType = sitGreen
          end>
        Text = 'Connected'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'User'
        Width = 120
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
  object GestureManager: TGestureManager
    Left = 264
    Top = 48
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    ShowHint = False
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 544
    Top = 104
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      31
      0)
    object dxbMain: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Main menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 806
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'siLanguage'
        end
        item
          Visible = True
          ItemName = 'siHelp'
        end
        item
          Visible = True
          ItemName = 'biVer'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object siLanguage: TdxBarSubItem
      Caption = 'Language'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object siHelp: TdxBarSubItem
      Caption = 'Help'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object biVer: TdxBarStatic
      Align = iaRight
      Caption = 'Version'
      Category = 0
      Hint = 'Version'
      Visible = ivAlways
      Alignment = taLeftJustify
    end
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    NativeStyle = False
    TouchMode = True
    Left = 544
    Top = 48
  end
  object dxTabbedMDIManager1: TdxTabbedMDIManager
    Active = True
    TabProperties.CloseButtonMode = cbmEveryTab
    TabProperties.CustomButtons.Buttons = <>
    Left = 544
    Top = 160
    PixelsPerInch = 96
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    TouchMode = True
    Left = 544
    Top = 224
  end
end
