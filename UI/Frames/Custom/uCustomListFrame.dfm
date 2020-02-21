inherited CustomListFrame: TCustomListFrame
  Width = 581
  Height = 375
  ExplicitWidth = 581
  ExplicitHeight = 375
  object ListGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 581
    Height = 375
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object ListView: TcxGridDBTableView
      OnKeyDown = ListViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
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
  object DataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = DataSetBeforeInsert
    BeforePost = DataSetBeforePost
    BeforeDelete = DataSetBeforeDelete
    AfterDelete = DataSetAfterDelete
    BeforeGetRecords = DataSetBeforeGetRecords
    Left = 224
    Top = 176
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 144
    Top = 176
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = ListGrid
    PopupMenus = <>
    Left = 400
    Top = 88
  end
end
