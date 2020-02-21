unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aOPCDataObject, aOPCLabel, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    aOPCColorLabel1: TaOPCColorLabel;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Edit1Change(Sender: TObject);
begin
  aOPCColorLabel1.Value := Edit1.Text;
end;

end.
