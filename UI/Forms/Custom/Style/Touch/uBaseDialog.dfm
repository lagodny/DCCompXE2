inherited BaseDialog: TBaseDialog
  BorderIcons = [biSystemMenu]
  Caption = 'BaseDialog'
  ClientHeight = 374
  ClientWidth = 547
  ExplicitWidth = 563
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  object pButton: TPanel [0]
    Left = 0
    Top = 335
    Width = 547
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
      Left = 385
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
      Left = 466
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
    object bSave: TButton
      AlignWithMargins = True
      Left = 304
      Top = 6
      Width = 75
      Height = 25
      Margins.Top = 6
      Margins.Bottom = 6
      Action = aSave
      Align = alRight
      ModalResult = 1
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 208
    Top = 120
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
