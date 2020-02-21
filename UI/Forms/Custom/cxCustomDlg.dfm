inherited CustomDlg: TCustomDlg
  BorderIcons = [biSystemMenu]
  Caption = 'cxCustomDlg'
  ClientHeight = 289
  ClientWidth = 458
  ExplicitWidth = 474
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 458
    Height = 289
    Align = alClient
    TabOrder = 0
    object bOK: TcxButton
      Left = 292
      Top = 254
      Width = 75
      Height = 25
      Action = aOK
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object bCancel: TcxButton
      Left = 373
      Top = 254
      Width = 75
      Height = 25
      Action = aCancel
      Cancel = True
      ModalResult = 2
      TabOrder = 1
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object lgButtons: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignVert = avBottom
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lgButtonsRight: TdxLayoutGroup
      Parent = lgButtons
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object liOK: TdxLayoutItem
      Parent = lgButtonsRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = bOK
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liCancel: TdxLayoutItem
      Parent = lgButtonsRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = bCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgMain: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
  end
  inherited FormStorage: TJvFormStorage
    Left = 152
    Top = 96
  end
  object ActionList1: TActionList
    Left = 224
    Top = 96
    object aOK: TAction
      Caption = 'OK'
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = 'Cancel'
      OnExecute = aCancelExecute
    end
    object aSave: TAction
      Caption = 'Save'
      Visible = False
      OnExecute = aSaveExecute
    end
  end
end
