unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aCustomOPCSource, aOPCSource, aCustomOPCTCPSource, aOPCTCPSource_V30, aOPCTagDictionary,
  Vcl.StdCtrls, IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, IdCmdTCPServer, aOPCDataObject, aOPCLabel,
  aOPCProvider;

type
  TForm4 = class(TForm)
    aOPCTagDictionary1: TaOPCTagDictionary;
    aOPCTCPSource_V301: TaOPCTCPSource_V30;
    Label1: TLabel;
    IdCmdTCPServer1: TIdCmdTCPServer;
    CheckBox1: TCheckBox;
    aOPCLabel1: TaOPCLabel;
    aOPCProviderList1: TaOPCProviderList;
    TaOPCProviderItem: TaOPCProviderItem;
    TaOPCProviderItem1: TaOPCProviderItem;
    TaOPCProviderItem2: TaOPCProviderItem;
    TaOPCProviderItem3: TaOPCProviderItem;
    TaOPCProviderItem4: TaOPCProviderItem;
    TaOPCProviderItem5: TaOPCProviderItem;
    TaOPCProviderItem6: TaOPCProviderItem;
    System_Connection_count: TaOPCProviderItem;
    procedure aOPCTagDictionary1Tags0Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  aOPCCollection;

{$R *.dfm}

procedure TForm4.aOPCTagDictionary1Tags0Change(Sender: TObject);
begin
  Label1.Caption := (Sender as TTagCollectionItem).Value;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
  aOPCTCPSource_V301.Active := CheckBox1.Checked;
end;

end.
