unit uClientIntf;

interface

uses
  mORMot;

type

  IClient = interface
    function GetTableRight(aTable: TSQLRecordClass; aRight: TSQLOccasion): Boolean;
  end;

implementation

end.
