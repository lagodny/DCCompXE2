inherited cxCustomListFrame: TcxCustomListFrame
  Width = 541
  Height = 370
  ExplicitWidth = 541
  ExplicitHeight = 370
  object ListGrid: TcxGrid [0]
    Left = 0
    Top = 0
    Width = 541
    Height = 370
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object ListView: TcxGridDBTableView
      OnKeyDown = ListViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmManual
      OnCellDblClick = ListViewCellDblClick
      DataController.DataSource = DataSource
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoInsertOnNewItemRowFocusing]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Images = CommonData.GridImageList
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.CellHints = True
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.NavigatorHints = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsData.Appending = True
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.GridLineColor = 15000804
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
    end
    object ListLevel: TcxGridLevel
      GridView = ListView
    end
  end
  inherited DataSet: TClientDataSet
    AfterDelete = DataSetAfterDelete
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = ListGrid
    PopupMenus = <
      item
        GridView = ListView
        HitTypes = [gvhtGridNone, gvhtCell]
        Index = 0
        PopupMenu = PopupMenu
      end>
    Left = 400
    Top = 88
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 400
    Top = 152
    object fr_miClone: TMenuItem
      Caption = 'Clone'
      ShortCut = 16452
      OnClick = fr_miCloneClick
    end
    object fr_div1: TMenuItem
      Caption = '-'
    end
    object fr_miCopy: TMenuItem
      Caption = 'Copy text'
      ShortCut = 24643
      OnClick = fr_miCopyClick
    end
    object fr_miCopyValues: TMenuItem
      Caption = 'Copy values'
      ShortCut = 16451
      OnClick = fr_miCopyValuesClick
    end
    object fr_miPaste: TMenuItem
      Caption = 'Paste values'
      ShortCut = 16470
      OnClick = fr_miPasteClick
    end
    object fr_div2: TMenuItem
      Caption = '-'
    end
    object miEditInline: TMenuItem
      AutoCheck = True
      Caption = 'Edit inline'
      OnClick = miEditInlineClick
    end
    object fr_miHistory: TMenuItem
      Caption = 'History'
      OnClick = fr_miHistoryClick
    end
  end
end
