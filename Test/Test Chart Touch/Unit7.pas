unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TeEngine, Vcl.ExtCtrls, TeeProcs, Chart, aOPCChart, Series, ArrowCha, Vcl.Touch.GestureMgr,
  Vcl.Touch.Keyboard;

type
  TForm7 = class(TForm)
    Chart: TaOPCChart;
    Series1: TArrowSeries;
    GestureManager1: TGestureManager;
    Panel1: TPanel;
    procedure Panel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Gestures;

{$R *.dfm}

procedure TForm7.Panel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
var
  S: String;
begin
  if GestureToIdent(EventInfo.GestureID, S) then
    ShowMessage(S)
  else
    ShowMessage('Could not translate gesture identifier');
end;
end.
