inherited CustomDocList: TCustomDocList
  Caption = 'CustomDocList'
  ClientWidth = 819
  ExplicitWidth = 835
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    Width = 819
    ExplicitTop = 29
    ExplicitWidth = 1071
    ExplicitHeight = 327
    inherited ListView: TcxGridDBTableView
      Navigator.Visible = False
    end
  end
  inherited ActionList: TActionList
    Images = CommonData.cxImageList16
    object aInterval: TAction [5]
      Category = 'Filter'
      Caption = 'Interval...'
      ImageIndex = 0
      ShortCut = 16457
      OnExecute = aIntervalExecute
    end
  end
  inherited cxGridPopupMenu1: TcxGridPopupMenu
    AlwaysFireOnPopup = True
  end
  inherited dxBarManager1: TdxBarManager
    Categories.Strings = (
      'Default'
      'Navigator'
      'Filter')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    PixelsPerInch = 96
    inherited dxBarNavigator: TdxBar
      OneOnRow = False
    end
    object dxBarFilter: TdxBar [1]
      AllowQuickCustomizing = False
      Caption = 'Filter'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 266
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 1160
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Images = CommonData.cxImageList16
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbInterval'
        end
        item
          Visible = True
          ItemName = 'siInterval'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    inherited dxBarButton1: TdxBarButton [2]
    end
    inherited dxcNavigator: TdxBarControlContainerItem [3]
      Category = 1
    end
    object dxbInterval: TdxBarButton
      Action = aInterval
      Category = 2
      PaintStyle = psCaptionGlyph
    end
    object siInterval: TdxBarSubItem
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbToday'
        end
        item
          Visible = True
          ItemName = 'dxbYesterday'
        end>
      OnPopup = siIntervalPopup
    end
    object dxbToday: TdxBarButton
      Tag = 1
      Caption = 'Today'
      Category = 2
      Hint = 'Today'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = iTodayClick
    end
    object dxbYesterday: TdxBarButton
      Tag = 2
      Caption = 'Yesterday'
      Category = 2
      Hint = 'Yesterday'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = iTodayClick
    end
  end
end
