object RecordEditForm: TRecordEditForm
  Left = 314
  Top = 204
  BorderIcons = [biSystemMenu]
  ClientHeight = 500
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 443
    Width = 519
    Height = 57
    Align = alBottom
    TabOrder = 0
  end
  object Scroll: TScrollBox
    Left = 0
    Top = 0
    Width = 519
    Height = 443
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 1
  end
end
