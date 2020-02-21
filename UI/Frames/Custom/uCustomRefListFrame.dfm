inherited CustomRefListFrame: TCustomRefListFrame
  inherited ListGrid: TcxGrid
    inherited ListView: TcxGridDBTableView
      object colNo: TcxGridDBColumn
        Caption = '#'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        OnGetDisplayText = colNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 44
      end
    end
  end
end
