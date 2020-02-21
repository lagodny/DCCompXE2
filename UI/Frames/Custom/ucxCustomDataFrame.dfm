inherited cxCustomDataFrame: TcxCustomDataFrame
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 136
    Top = 152
  end
  object DataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = DataSetBeforeInsert
    BeforeEdit = DataSetBeforeEdit
    BeforePost = DataSetBeforePost
    BeforeDelete = DataSetBeforeDelete
    BeforeGetRecords = DataSetBeforeGetRecords
    Left = 216
    Top = 152
    object DataSetID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
  end
end
