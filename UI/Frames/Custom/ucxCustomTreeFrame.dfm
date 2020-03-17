inherited cxCustomTreeFrame: TcxCustomTreeFrame
  Width = 581
  Height = 375
  ExplicitWidth = 581
  ExplicitHeight = 375
  object tlStructure: TcxDBTreeList [0]
    Left = 0
    Top = 0
    Width = 581
    Height = 375
    Align = alClient
    Bands = <
      item
      end>
    DataController.DataSource = DataSource
    DataController.ParentField = 'Parent'
    DataController.KeyField = 'ID'
    DragMode = dmAutomatic
    FindPanel.DisplayMode = fpdmManual
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    Navigator.Buttons.ConfirmDelete = True
    Navigator.Buttons.CustomButtons = <>
    Navigator.Buttons.First.Visible = False
    Navigator.Buttons.PriorPage.Visible = False
    Navigator.Buttons.Prior.Visible = False
    Navigator.Buttons.Next.Visible = False
    Navigator.Buttons.NextPage.Visible = False
    Navigator.Buttons.Last.Visible = False
    Navigator.Buttons.Append.Visible = True
    Navigator.Buttons.SaveBookmark.Visible = False
    Navigator.Buttons.GotoBookmark.Visible = False
    Navigator.Buttons.Filter.Visible = False
    Navigator.Visible = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.AutoDragCopy = True
    OptionsBehavior.IncSearch = True
    OptionsCustomizing.ColumnsQuickCustomization = True
    OptionsData.Appending = True
    OptionsData.Inserting = True
    OptionsSelection.InvertSelect = False
    OptionsSelection.MultiSelect = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.DropNodeIndicator = True
    OptionsView.IndicatorWidth = 20
    PopupMenu = PopupMenu
    PopupMenus.ColumnHeaderMenu.UseBuiltInMenu = True
    RootValue = -1
    TabOrder = 0
    OnDblClick = tlStructureDblClick
  end
  inherited DataSet: TClientDataSet
    AfterDelete = DataSetAfterDelete
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 400
    Top = 152
    object fr_TL_miCopy: TMenuItem
      Caption = 'Copy text'
      ShortCut = 24643
      OnClick = fr_TL_miCopyClick
    end
    object fr_TL_miCopyValues: TMenuItem
      Caption = 'Copy values'
      ShortCut = 16451
      OnClick = fr_TL_miCopyValuesClick
    end
    object fr_TL_miPaste: TMenuItem
      Caption = 'Paste values'
      ShortCut = 16470
      OnClick = fr_TL_miPasteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object fr_TL_miEditInline: TMenuItem
      AutoCheck = True
      Caption = 'Edit inline'
      OnClick = fr_TL_miEditInlineClick
    end
  end
end
