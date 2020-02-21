inherited CustomRec: TCustomRec
  Caption = 'CustomRec'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pButton: TPanel [0]
    Left = 0
    Top = 317
    Width = 644
    Height = 39
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pButton'
    ShowCaption = False
    TabOrder = 0
    object OKBtn: TButton
      AlignWithMargins = True
      Left = 482
      Top = 6
      Width = 75
      Height = 25
      Margins.Top = 6
      Margins.Bottom = 6
      Action = aOK
      Align = alRight
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object CancelBtn: TButton
      AlignWithMargins = True
      Left = 563
      Top = 6
      Width = 75
      Height = 25
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Action = aCancel
      Align = alRight
      Cancel = True
      ModalResult = 2
      TabOrder = 2
    end
    object SaveBtn: TButton
      AlignWithMargins = True
      Left = 401
      Top = 6
      Width = 75
      Height = 25
      Margins.Top = 6
      Margins.Bottom = 6
      Action = aSave
      Align = alRight
      TabOrder = 0
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 224
    Top = 120
    object aSave: TAction
      Category = 'Rec'
      Caption = 'Save'
      Enabled = False
      ShortCut = 16467
      OnExecute = aSaveExecute
    end
    object aOK: TAction
      Category = 'Rec'
      Caption = 'OK'
      Enabled = False
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Category = 'Rec'
      Caption = 'Close'
      Enabled = False
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
