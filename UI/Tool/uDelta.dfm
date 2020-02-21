object DeltaForm: TDeltaForm
  Left = 0
  Top = 0
  Caption = 'DeltaForm'
  ClientHeight = 338
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 729
    Height = 297
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 297
    Width = 729
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = ClientDataSet1CalcFields
    Left = 296
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
    Top = 144
  end
end
