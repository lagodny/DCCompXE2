unit uKeyboardForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Touch.Keyboard;

type
  TKeyboardForm = class(TForm)
    TouchKeyboard1: TTouchKeyboard;
  private
    { Private declarations }
  public
    FFocusHandle: HWND;
    procedure WndProc(var Message: TMessage); override;
    procedure WMFocus(var msg: TMessage); message wm_setfocus;

    class procedure ShowKeyboardForm(aFocusHandle: HWND);
    class procedure HideKeyboardForm;
  end;

var
  KeyboardForm: TKeyboardForm;



implementation

{$R *.dfm}

{ TKeyboardForm }

class procedure TKeyboardForm.HideKeyboardForm;
begin
  if not Assigned(KeyboardForm) then
    Exit;
end;

class procedure TKeyboardForm.ShowKeyboardForm(aFocusHandle: HWND);
begin
  if not Assigned(KeyboardForm) then
    KeyboardForm := TKeyboardForm.Create(Application);

  KeyboardForm.FFocusHandle := aFocusHandle;
  KeyboardForm.Show;
end;

procedure TKeyboardForm.WMFocus(var msg: TMessage);
begin
  SetActiveWindow(FFocusHandle);
  //SetActiveWindow(msg.WParam);
  //PostMessage(msg.WParam, WM_CLOSE, 0, 0);
end;

procedure TKeyboardForm.WndProc(var Message: TMessage);
begin
  inherited;

  case Message.Msg of
     WM_MOUSEFIRST..WM_MOUSELAST,WM_KEYFIRST..WM_KEYLAST:
       begin
         //Form2.ActiveControl:=Form2.Edit1;
         SetActiveWindow(FFocusHandle);
         //send
       end
  end
end;

end.
