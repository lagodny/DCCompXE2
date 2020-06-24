inherited CustomHistroyList: TCustomHistroyList
  Caption = 'CustomHistroyList'
  ExplicitWidth = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList: TActionList
    object aInterval: TAction
      Category = 'Filter'
      Caption = 'Interval...'
      OnExecute = aIntervalExecute
    end
  end
  inherited dxBarManager1: TdxBarManager
    Categories.Strings = (
      'Default'
      'Filter')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    PixelsPerInch = 96
    inherited dxBarNavigator: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxcNavigator'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxbInterval'
        end>
    end
    object dxbInterval: TdxBarButton
      Action = aInterval
      Category = 1
    end
  end
end
