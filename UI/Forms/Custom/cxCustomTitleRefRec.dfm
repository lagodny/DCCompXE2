inherited CustomTitleRefRec: TCustomTitleRefRec
  Caption = 'cxCustomTitleRefRec'
  ExplicitWidth = 660
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 644
    Height = 356
    Align = alClient
    TabOrder = 4
    object teTitle: TcxTextEdit
      Left = 35
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Text = 'teTitle'
      Width = 599
    end
    object cxButton1: TcxButton
      Left = 559
      Top = 321
      Width = 75
      Height = 25
      Action = aCancel
      TabOrder = 3
    end
    object cxButton2: TcxButton
      Left = 478
      Top = 321
      Width = 75
      Height = 25
      Action = aOK
      TabOrder = 2
    end
    object cxButton3: TcxButton
      Left = 397
      Top = 321
      Width = 75
      Height = 25
      Action = aSave
      TabOrder = 1
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lgHead: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgCommon: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object lsItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object lsItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Separator'
      Index = 3
    end
    object liTitle: TdxLayoutItem
      Parent = lgHead
      CaptionOptions.Text = 'Title'
      Control = teTitle
      ControlOptions.OriginalHeight = 31
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lgButtons: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object liClose: TdxLayoutItem
      Parent = lgButtons
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 2
    end
    object liOK: TdxLayoutItem
      Parent = lgButtons
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 1
    end
    object liSave: TdxLayoutItem
      Parent = lgButtons
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Enabled = False
      Index = 0
    end
  end
  inherited dxBarManager1: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited dxBarButtons: TdxBar
      Visible = False
    end
  end
end
