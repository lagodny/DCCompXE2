unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uOPCMainForm, ExtCtrls, ActnList, Menus, XPMan, aCustomOPCSource,
  aOPCProvider, aOPCCinema, aOPCAuthorization, aOPCSource, aOPCTCPSource,
  ComCtrls;

type
  TfmOPCMainForm1 = class(TfmOPCMainForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOPCMainForm1: TfmOPCMainForm1;

implementation

{$R *.dfm}

end.
