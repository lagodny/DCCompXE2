inherited RecordHistoryView: TRecordHistoryView
  Caption = 'Record history'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ListGrid: TcxGrid
    inherited ListView: TcxGridDBTableView
      OptionsData.Appending = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object ListViewTimestamp: TcxGridDBColumn
        DataBinding.FieldName = 'Timestamp'
        HeaderAlignmentHorz = taCenter
        Options.ShowEditButtons = isebNever
      end
      object ListViewEvent: TcxGridDBColumn
        DataBinding.FieldName = 'Event'
        HeaderAlignmentHorz = taCenter
      end
      object ListViewIdentifier: TcxGridDBColumn
        DataBinding.FieldName = 'Identifier'
        HeaderAlignmentHorz = taCenter
      end
      object ListViewValue: TcxGridDBColumn
        DataBinding.FieldName = 'Value'
        HeaderAlignmentHorz = taCenter
        Width = 500
      end
    end
  end
  inherited ListNavigator: TcxDBNavigator
    Left = 9
    Top = 1
    ExplicitLeft = 9
    ExplicitTop = 1
  end
  inherited DataSet: TClientDataSet
    object DataSetTimestamp: TDateTimeField
      FieldName = 'Timestamp'
    end
    object DataSetEvent: TWideStringField
      FieldName = 'Event'
    end
    object DataSetIdentifier: TIntegerField
      FieldName = 'Identifier'
    end
    object DataSetValue: TWideStringField
      FieldName = 'Value'
      Size = 5000
    end
  end
  inherited dxBarManager1: TdxBarManager
    PixelsPerInch = 96
  end
end
