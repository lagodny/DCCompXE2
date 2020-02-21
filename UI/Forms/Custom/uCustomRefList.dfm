inherited CustomRefList: TCustomRefList
  Caption = 'CustomRefList'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    ExplicitTop = 31
    ExplicitHeight = 325
    inherited ListView: TcxGridDBTableView
      OptionsView.NoDataToDisplayInfoText = ''
    end
  end
  inherited ListNavigator: TcxDBNavigator
    Top = 3
    ExplicitTop = 3
  end
  inherited dxBarManager1: TdxBarManager
    PixelsPerInch = 96
  end
end
