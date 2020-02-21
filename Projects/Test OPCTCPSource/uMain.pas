unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  aOPCTCPSource_V30, aCustomOPCSource,
  jpeg, Vcl.Imaging.GIFImg, //GIFImage,

  Vcl.StdCtrls, Vcl.ExtCtrls, aOPCDataObject, aOPCImage, aOPCImageList;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    bConnect: TButton;
    bGetValue: TButton;
    eId1: TEdit;
    Splitter1: TSplitter;
    bStartUpdate: TButton;
    bGetValue1: TButton;
    eTestConvert: TEdit;
    bTestConvert: TButton;
    procedure bConnectClick(Sender: TObject);
    procedure bGetValueClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bStartUpdateClick(Sender: TObject);
    procedure bGetValue1Click(Sender: TObject);
    procedure bTestConvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    a: TaOPCTCPSource_V30;
    dl: TaOPCDataLink;

    procedure DoRequest(Sender: TObject);

  end;

var
  Form2: TForm2;

implementation

uses
  uStrFunc;

{$R *.dfm}

procedure TForm2.bConnectClick(Sender: TObject);
begin
//  a.RemoteMachine := 'localhost';
//  a.Port := 15555;
  a.RemoteMachine := 'tdc.org.ua';
  a.Port := 5152;
  a.User := 'Лагодный';
  a.Password := '314';
  a.Connected := True;
  a.CompressionLevel := 5;
end;

procedure TForm2.bGetValue1Click(Sender: TObject);
begin
  Memo1.Lines.Add(a.GetValue('1'));
end;

procedure TForm2.bGetValueClick(Sender: TObject);
var
  errorCode: Integer;
  errorString: string;
  moment: TDateTime;
begin
  Memo1.Lines.Add(a.GetSensorValue(eId1.Text, errorCode, errorString, moment))
end;

procedure TForm2.bStartUpdateClick(Sender: TObject);
begin
  a.Active := not a.Active;
end;

procedure TForm2.bTestConvertClick(Sender: TObject);
var
  s: string;
begin
  s := StrToHex(eTestConvert.Text);
  Memo1.Lines.Add(s);
  Memo1.Lines.Add(HexToStr(s));
end;

procedure TForm2.DoRequest(Sender: TObject);
begin
  Memo1.Lines.Add(dl.Value);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  a := TaOPCTCPSource_V30.Create(Self);
  a.Encrypt := True;
  a.OnRequest := DoRequest;
  dl := TaOPCDataLink.Create(nil);
  dl.PhysID := '1';
  dl.OPCSource := a;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  dl.Free;
  a.Free;
end;

end.
