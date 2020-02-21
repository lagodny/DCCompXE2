inherited CustomList: TCustomList
  Caption = 'CustomList'
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object ListGrid: TcxGrid [0]
    Left = 0
    Top = 0
    Width = 644
    Height = 356
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object ListView: TcxGridDBTableView
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      DataController.DataSource = DataSource
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoInsertOnNewItemRowFocusing]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Images = CommonData.GridImageList
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.CellHints = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.GridLineColor = 15000804
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
    end
    object ListLevel: TcxGridLevel
      GridView = ListView
    end
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 144
    Top = 176
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = DataSetBeforePost
    BeforeDelete = DataSetBeforeDelete
    AfterDelete = DataSetAfterDelete
    BeforeApplyUpdates = DataSetBeforeApplyUpdates
    BeforeGetRecords = DataSetBeforeGetRecords
    Left = 224
    Top = 176
  end
  object PopupMenu: TPopupMenu
    Left = 144
    Top = 72
  end
  object ActionList: TActionList
    Left = 224
    Top = 72
    object aRefresh: TAction
      Category = 'List'
      Caption = 'Refresh'
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aApplyData: TAction
      Category = 'List'
      Caption = 'aApplyData'
      Visible = False
      OnExecute = aApplyDataExecute
    end
    object aCancel: TAction
      Category = 'List'
      Caption = 'Cancel'
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = ListGrid
    PopupMenus = <>
    Left = 400
    Top = 88
  end
end
