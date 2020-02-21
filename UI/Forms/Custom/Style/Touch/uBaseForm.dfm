object BaseForm: TBaseForm
  Left = 0
  Top = 0
  Caption = 'BaseForm'
  ClientHeight = 356
  ClientWidth = 644
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 25
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 144
    Top = 120
  end
end
