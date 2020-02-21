unit uDelta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TDeltaForm = class(TForm)
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
  private
    procedure AddCalcField;
  public
    class procedure ShowDelta(aDataSet: TClientDataSet);
    class procedure ShowDelta1(aDelta: OleVariant);
    class procedure ShowData(aDataSet: TClientDataSet);
  end;




implementation

{$R *.dfm}

{ TDeltaForm }

procedure TDeltaForm.AddCalcField;
var
  Field: TStringField;
  i: Integer;
begin
  ClientDataSet1.Close;


  // восстанавливае поял из FieldDefs
  for i := 0 to ClientDataSet1.FieldDefs.Count - 1 do
  begin
    ClientDataSet1.FieldDefs[i].CreateField(ClientDataSet1);
  end;

  Field := TStringField.Create(ClientDataSet1);
  Field.FieldName := '_UpdateStatus';
  Field.Calculated := True;
  Field.DataSet := ClientDataSet1;
  with ClientDataSet1.FieldDefs.AddFieldDef do
  begin
    Name := '_UpdateStatus';
    DataType := ftString;
    Size := 20;
  end;

  ClientDataSet1.Open;
end;
procedure TDeltaForm.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
  case DataSet.UpdateStatus of
    usUnmodified:
      DataSet.FieldByName('_UpdateStatus').AsString := 'Unmodified';
    usModified:
      DataSet.FieldByName('_UpdateStatus').AsString := 'Modified';
    usInserted:
      DataSet.FieldByName('_UpdateStatus').AsString := 'Inserted';
    usDeleted:
      DataSet.FieldByName('_UpdateStatus').AsString := 'Deleted';
  end;
end;

class procedure TDeltaForm.ShowData(aDataSet: TClientDataSet);
var
  DeltaForm: TDeltaForm;
begin
  DeltaForm := TDeltaForm.Create(nil);
  try
    DeltaForm.ClientDataSet1.Data := aDataSet.Data;
    DeltaForm.ClientDataSet1.Open;
    DeltaForm.ShowModal;
  finally
    DeltaForm.Free;
  end;
end;

class procedure TDeltaForm.ShowDelta(aDataSet: TClientDataSet);
var
  DeltaForm: TDeltaForm;
begin
  DeltaForm := TDeltaForm.Create(nil);
  try
    DeltaForm.ClientDataSet1.Data := aDataSet.Delta;

    DeltaForm.AddCalcField;

    DeltaForm.ShowModal;
  finally
    DeltaForm.Free;
  end;
end;

class procedure TDeltaForm.ShowDelta1(aDelta: OleVariant);
var
  DeltaForm: TDeltaForm;
begin
  DeltaForm := TDeltaForm.Create(nil);
  try
    DeltaForm.ClientDataSet1.Data := aDelta;

    DeltaForm.AddCalcField;

    DeltaForm.ShowModal;
  finally
    DeltaForm.Free;
  end;
end;

end.
