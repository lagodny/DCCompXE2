inherited cxCustomRec: TcxCustomRec
  Caption = 'cxCustomRec'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited FormStorage: TJvFormStorage
    Left = 136
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 224
    Top = 120
    object aSave: TAction
      Category = 'Rec'
      Caption = 'Save'
      Enabled = False
      ImageIndex = 3
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aOK: TAction
      Category = 'Rec'
      Caption = 'OK'
      Enabled = False
      ImageIndex = 1
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Category = 'Rec'
      Caption = 'Close'
      Enabled = False
      ImageIndex = 2
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aFullScreen: TAction
      Category = 'Rec'
      AutoCheck = True
      Caption = 'Full screen'
      ImageIndex = 12
      ShortCut = 123
      OnExecute = aFullScreenExecute
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 312
    Top = 120
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      33
      0)
    object dxBarButtons: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Buttons'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 678
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 90
      ItemLinks = <
        item
          Visible = True
          ItemName = 'blbOk'
        end
        item
          Visible = True
          ItemName = 'blbSave'
        end
        item
          Visible = True
          ItemName = 'blbClose'
        end
        item
          Visible = True
          ItemName = 'blbFullScreen'
        end>
      NotDocking = [dsNone]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object blbSave: TdxBarLargeButton
      Action = aSave
      Category = 0
      AutoGrayScale = False
      GlyphLayout = glRight
    end
    object blbOk: TdxBarLargeButton
      Action = aOK
      Category = 0
      AutoGrayScale = False
      GlyphLayout = glRight
    end
    object blbClose: TdxBarLargeButton
      Action = aCancel
      Category = 0
      AutoGrayScale = False
      GlyphLayout = glRight
    end
    object blbFullScreen: TdxBarLargeButton
      Action = aFullScreen
      Align = iaRight
      Category = 0
      ButtonStyle = bsChecked
      GlyphLayout = glRight
    end
    object dxBarGroup1: TdxBarGroup
      Items = (
        'blbSave'
        'blbOk'
        'blbClose')
    end
  end
end
