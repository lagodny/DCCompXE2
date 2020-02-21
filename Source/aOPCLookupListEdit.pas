unit aOPCLookupListEdit;

interface

uses
  DesignIntf, DesignEditors;

type
  TaOPCLookupListEditor = class (TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses
  SysUtils, Dialogs, StdCtrls, aOPCLookupList;

function TaOPCLookupListEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TaOPCLookupListEditor.GetVerb (Index: Integer): string;
begin
  case Index of
    0: Result := 'Загрузить список';
  end;
end;

procedure TaOPCLookupListEditor.ExecuteVerb (Index: Integer);
begin
  case Index of
    0: TaOPCLookupList(Component).GetLookup;
  end;
end;

procedure TaOPCLookupListEditor.Edit;
begin
end;

procedure Register;
begin
  RegisterComponentEditor (
    TaOPCLookupList, TaOPCLookupListEditor);
end;

end.
