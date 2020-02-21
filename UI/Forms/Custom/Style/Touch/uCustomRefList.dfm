inherited CustomRefList: TCustomRefList
  Caption = 'CustomRefList'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    inherited ListView: TcxGridDBTableView
      OnKeyDown = ListViewKeyDown
      OnCellDblClick = ListViewCellDblClick
      OnEditKeyDown = ListViewEditKeyDown
      OptionsView.HeaderHeight = 35
    end
  end
  inherited PopupMenu: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
    object New1: TMenuItem
      Action = aNew
    end
    object Edit1: TMenuItem
      Action = aEdit
    end
  end
  inherited ActionList: TActionList
    object aNew: TAction
      Category = 'Ref'
      Caption = 'New'
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aEdit: TAction
      Category = 'Ref'
      Caption = 'Edit'
      ShortCut = 115
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Category = 'Ref'
      Caption = 'Delete'
    end
  end
end
