inherited CustomList: TCustomList
  Caption = 'CustomList'
  ClientWidth = 900
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  ExplicitWidth = 916
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  object ListGrid: TcxGrid [0]
    Left = 0
    Top = 29
    Width = 900
    Height = 327
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    ExplicitTop = 31
    ExplicitHeight = 325
    object ListView: TcxGridDBTableView
      OnKeyDown = ListViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.InfoPanel.Width = 100
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmManual
      OnCellDblClick = ListViewCellDblClick
      OnEditKeyDown = ListViewEditKeyDown
      DataController.DataSource = DataSource
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoInsertOnNewItemRowFocusing]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      EditForm.DefaultColumnCount = 1
      EditForm.DefaultStretch = fsHorizontal
      Images = CommonData.GridImageList
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
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
  object ListNavigator: TcxDBNavigator [1]
    Left = 8
    Top = 3
    Width = 216
    Height = 25
    BorderStyle = nbsNone
    Buttons.OnButtonClick = ListNavigatorButtonsButtonClick
    Buttons.CustomButtons = <>
    Buttons.First.Visible = False
    Buttons.PriorPage.Visible = False
    Buttons.Prior.Visible = False
    Buttons.Next.Visible = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Visible = False
    Buttons.Insert.Hint = 'Add'
    Buttons.Insert.Visible = True
    Buttons.Append.Visible = False
    Buttons.Delete.Hint = 'Delete'
    Buttons.Edit.Hint = 'Edit'
    Buttons.Post.Hint = 'Save'
    Buttons.Cancel.Hint = 'Cancel'
    Buttons.Cancel.Visible = True
    Buttons.Refresh.Visible = True
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = DataSource
    LookAndFeel.NativeStyle = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
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
    Left = 216
    Top = 176
  end
  object PopupMenu: TPopupMenu
    Images = CommonData.GridImageList
    OnPopup = PopupMenuPopup
    Left = 144
    Top = 72
    object pmiSelect: TMenuItem
      Action = aSelect
    end
    object pmiDivSelect: TMenuItem
      Caption = '-'
    end
    object pmiClone: TMenuItem
      Caption = 'Clone'
      ShortCut = 16452
      OnClick = pmiCloneClick
    end
    object pmiDivClone: TMenuItem
      Caption = '-'
    end
    object pmiCopyText: TMenuItem
      Caption = 'Copy text'
      ShortCut = 24643
      OnClick = pmiCopyTextClick
    end
    object pmiCopyValues: TMenuItem
      Caption = 'Copy values'
      ShortCut = 16451
      OnClick = pmiCopyValuesClick
    end
    object pmiPasteValues: TMenuItem
      Caption = 'Paste values'
      ShortCut = 16470
      OnClick = pmiPasteValuesClick
    end
    object pmiDivClipboard: TMenuItem
      Caption = '-'
    end
    object pmiNew: TMenuItem
      Action = aNew
    end
    object pmiEdit: TMenuItem
      Action = aEdit
    end
    object pmiDiv1: TMenuItem
      Caption = '-'
    end
    object pmiRefresh: TMenuItem
      Action = aRefresh
    end
    object divParams: TMenuItem
      Caption = '-'
    end
    object pmiEditInline: TMenuItem
      Action = aEditInline
      AutoCheck = True
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
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
    object aSelect: TAction
      Category = 'List'
      Caption = 'Select'
      OnExecute = aSelectExecute
    end
    object aNew: TAction
      Category = 'List'
      Caption = 'New'
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aEdit: TAction
      Category = 'List'
      Caption = 'Edit'
      ShortCut = 115
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Category = 'List'
      Caption = 'Delete'
      ShortCut = 46
    end
    object aEditInline: TAction
      Category = 'List'
      AutoCheck = True
      Caption = 'Edit Inline'
      OnExecute = aEditInlineExecute
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = ListGrid
    PopupMenus = <>
    Left = 392
    Top = 64
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 512
    Top = 176
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      29
      0)
    object dxBarNavigator: TdxBar
      AllowQuickCustomizing = False
      Caption = 'Navigator'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 678
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxcNavigator'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxcNavigator: TdxBarControlContainerItem
      Caption = 'Navigator'
      Category = 0
      Visible = ivAlways
      Control = ListNavigator
    end
    object dxBarButton1: TdxBarButton
      Action = aSelect
      Category = 0
    end
  end
end
