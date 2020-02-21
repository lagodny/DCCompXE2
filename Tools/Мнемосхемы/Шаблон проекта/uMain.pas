unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMnemoShema, ExtCtrls, ActnList, Menus, XPMan, aCustomOPCSource,
  aOPCProvider, aOPCCinema, aOPCAuthorization, aOPCSource, aOPCTCPSource,
  ComCtrls;

type
  TfmMnemoShema1 = class(TfmMnemoShema)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMnemoShema1: TfmMnemoShema1;

implementation

{$R *.dfm}

end.
