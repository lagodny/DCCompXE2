inherited HistoryRep: THistoryRep
  Caption = 'History report'
  ClientWidth = 937
  ExplicitWidth = 953
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 937
    Height = 356
    Align = alClient
    TabOrder = 0
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
  end
  object ListGrid: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 937
    Height = 356
    Align = alClient
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    object ListView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.InfoPanel.Width = 100
      FindPanel.DisplayMode = fpdmManual
      DataController.DataSource = sHistory
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoInsertOnNewItemRowFocusing]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
            end
            item
            end
            item
            end>
          SummaryItems = <
            item
              Format = '# ##0'
              Kind = skSum
              FieldName = 'Quantity'
            end
            item
              Kind = skCount
            end>
        end>
      EditForm.DefaultColumnCount = 1
      EditForm.ItemHotTrack = True
      EditForm.DefaultStretch = fsHorizontal
      Images = CommonData.GridImageList
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.GridLineColor = 15000804
      OptionsView.GroupByBox = False
      OptionsView.GroupSummaryLayout = gslAlignWithColumnsAndDistribute
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      object ListViewTimestamp: TcxGridDBColumn
        DataBinding.FieldName = 'Timestamp'
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
      object ListViewIdentifier: TcxGridDBColumn
        DataBinding.FieldName = 'Identifier'
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object ListViewEvent: TcxGridDBColumn
        DataBinding.FieldName = 'Event'
        HeaderAlignmentHorz = taCenter
      end
      object ListViewValue: TcxGridDBColumn
        DataBinding.FieldName = 'Value'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentHorz = taCenter
        Width = 569
      end
    end
    object ListLevel: TcxGridLevel
      GridView = ListView
    end
  end
  object sHistory: TDataSource
    DataSet = dsHistory
    Left = 232
    Top = 120
  end
  object dsHistory: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsHistory'
    Left = 368
    Top = 128
    object dsHistoryTimestamp: TDateTimeField
      FieldName = 'Timestamp'
    end
    object dsHistoryEvent: TWideStringField
      FieldName = 'Event'
    end
    object dsHistoryIdentifier: TIntegerField
      FieldName = 'Identifier'
    end
    object dsHistoryValue: TWideStringField
      FieldName = 'Value'
      Size = 1024
    end
  end
end
