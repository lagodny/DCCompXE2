unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aOPCImageList, Vcl.StdCtrls, aOPCDataObject, aOPCImage,
  Vcl.Imaging.GIFImg, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    aOPCImageList1: TaOPCImageList;
    aOPCImage1: TaOPCImage;
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  aOPCImage1.Value := '0';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  (Image1.Picture.Graphic as TGIFImage).Animate := True;
end;

end.
