unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, aCustomOPCSource, aOPCSource, aCustomOPCTCPSource, aOPCTCPSource_V30,
  uOPCFrame, ukzTempFrame, TB2Item, SpTBXMDIMRU, aOPCDataObject, aOPCLabel, SpTBXItem;

type
  TForm3 = class(TForm)
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    Button1: TButton;
    kzTemp1: TkzTemp;
    aOPCLabel2: TaOPCLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  kzTemp1.OPCSource := aOPCTCPSource_V301;
  kzTemp1.ID := '110389';
end;

end.
