inherited CustomRefList: TCustomRefList
  Caption = 'CustomRefList'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    inherited ListView: TcxGridDBTableView
      OptionsView.NoDataToDisplayInfoText = ''
    end
  end
  inherited dxBarManager1: TdxBarManager
    PixelsPerInch = 96
  end
end
