unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, jpeg;

type
  TDevelopInfo = record
//  private
//    FCompany: string;
//    procedure SetCompany(const Value: string);
//  public
    Title: string;
    ApplicationName: string;
    Version : string;
    Company : string;
    Department: string;
    Developers: string;
    WebSite : string;
    MailTo  : string;
  end;

  TAboutForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    lMailTo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Version: TLabel;
    User: TLabel;
    ApplicationName: TLabel;
    mDevelopers: TMemo;
    Image1: TImage;
    lTitle1: TLabel;
    lTitle2: TLabel;
    Label1: TLabel;
    lDepartment: TLabel;
    lCompany: TLabel;
    procedure lMailToClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

  end;

  procedure ShowAbout(aDevelopInfo: TDevelopInfo; aUser: string);

implementation

var
  AboutForm: TAboutForm;

{$R *.dfm}

procedure ShowAbout(aDevelopInfo: TDevelopInfo; aUser: string);
begin
  AboutForm := TAboutForm.Create(Application);
  try
    AboutForm.ApplicationName.Caption := aDevelopInfo.ApplicationName;
    AboutForm.lCompany.Caption := aDevelopInfo.Company;
    AboutForm.lDepartment.Caption := aDevelopInfo.Department;
    AboutForm.mDevelopers.Lines.Text := aDevelopInfo.Developers;
    AboutForm.Version.Caption := aDevelopInfo.Version;
    AboutForm.User.Caption := aUser;
    AboutForm.lMailTo.Caption := aDevelopInfo.MailTo;
    AboutForm.lTitle1.Caption := aDevelopInfo.Title;
    AboutForm.lTitle2.Caption := aDevelopInfo.Title;

    AboutForm.ShowModal;
  finally
    FreeAndNil(AboutForm);
  end;
end;


procedure TAboutForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_ESCAPE)) or (Key = Chr(VK_RETURN)) then
    Close;
end;

procedure TAboutForm.lMailToClick(Sender: TObject);
var
  SendStr: string;
begin
  if pos('MAILTO:',UpperCase(lMailTo.Caption)) = 0 then
    SendStr := 'MailTo:'+lMailTo.Caption
  else
    SendStr := lMailTo.Caption;
  ShellExecute(Handle, 'Open', PChar(SendStr), nil, nil, SW_NORMAL);
end;

end.
