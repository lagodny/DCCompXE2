inherited CustomDocList: TCustomDocList
  Caption = 'CustomDocList'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    Top = 26
    Height = 330
    ExplicitTop = 26
    ExplicitHeight = 330
    inherited ListView: TcxGridDBTableView
      OnKeyDown = ListViewKeyDown
      OnCellDblClick = ListViewCellDblClick
    end
  end
  object dTop: TSpTBXDock [1]
    Left = 0
    Top = 0
    Width = 644
    Height = 26
    object tbDoc: TSpTBXToolbar
      Left = 0
      Top = 0
      Images = CommonData.GridImageList
      TabOrder = 0
      Caption = 'Document'
      object tbiNew: TSpTBXItem
        Action = aNew
      end
      object tbiEdit: TSpTBXItem
        Action = aEdit
      end
      object tbiSep1: TSpTBXSeparatorItem
      end
      object tbiUpdate: TSpTBXItem
        Action = aRefresh
      end
      object SpTBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object smiInterval: TSpTBXSubmenuItem
        Caption = #1057#1077#1075#1086#1076#1085#1103
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1085#1090#1077#1088#1074#1072#1083'...'
        OnClick = aIntervalExecute
        CustomWidth = 150
        FontSettings.Color = clHotLight
        DropdownCombo = True
        OnInitPopup = smiIntervalInitPopup
        object iToday: TSpTBXItem
          Tag = 1
          Caption = 'Today'
          OnClick = iTodayClick
        end
        object iYesterday: TSpTBXItem
          Tag = 2
          Caption = 'Yesterday'
          OnClick = iTodayClick
        end
        object iWeek: TSpTBXItem
          Tag = 3
          Caption = 'Week'
          OnClick = iTodayClick
        end
        object SpTBXSeparatorItem3: TSpTBXSeparatorItem
        end
        object SpTBXItem7: TSpTBXItem
          Caption = '...'
          OnClick = aIntervalExecute
        end
      end
      object SpTBXItem41: TSpTBXItem
        Action = aInterval
      end
    end
  end
  inherited PopupMenu: TPopupMenu
    Images = CommonData.GridImageList
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
  end
  inherited ActionList: TActionList
    object aNew: TAction
      Category = 'Doc'
      Caption = 'New'
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aEdit: TAction
      Category = 'Doc'
      Caption = 'Edit'
      ShortCut = 115
      OnExecute = aEditExecute
    end
    object aInterval: TAction
      Category = 'List'
      Caption = 'Interval...'
      ImageIndex = 9
      ShortCut = 16457
      OnExecute = aIntervalExecute
    end
    object aDelete: TAction
      Category = 'Doc'
      Caption = 'Delete'
      ShortCut = 46
    end
  end
end
