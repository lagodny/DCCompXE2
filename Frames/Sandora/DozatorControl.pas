unit DozatorControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, aOPCDataObject, aOPCLabel;

type
  TDozatorControlForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    aOPCLabel1: TaOPCLabel;
    aOPCLabel2: TaOPCLabel;
    aOPCLabel3: TaOPCLabel;
    aOPCLabel4: TaOPCLabel;
    aOPCLabel5: TaOPCLabel;
    Edit1: TEdit;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DozatorControlForm: TDozatorControlForm;

implementation

{$R *.dfm}

end.
