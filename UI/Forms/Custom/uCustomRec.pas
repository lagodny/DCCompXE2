unit uCustomRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList,
  uBaseForm;

resourcestring
  sConfirmExitWithoutSaving = 'Close without saving?';
  sIsReadOnly = 'Read only';

type
  //TOnAfterEditProc = procedure (aID: Integer) of object;

  TCustomRec = class(TBaseForm)
    ActionList: TActionList;
    aSave: TAction;
    aOK: TAction;
    aCancel: TAction;
    pButton: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    SaveBtn: TButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  protected
    procedure UpdateUI; override;
    procedure UpdateCaption; override;
  public
    procedure Save; virtual;

//    property IsChanged: Boolean read GetIsChanged write SetIsChanged;

//    class function OpenDialog(aID: Integer; aAfterEditProc: TOnAfterEditProc): Boolean; virtual;

//    property OnAfterEditDoc: TOnAfterEditProc read FOnAfterEditDoc write FOnAfterEditDoc;
  end;

  TCustomRecClass = class of TCustomRec;

implementation

{$R *.dfm}

uses
  SynCommons,
  uResources
  //, uMain
  ;

{ TCustomRec }

procedure TCustomRec.aCancelExecute(Sender: TObject);
begin
//  if IsChanged then
//  begin
//    // запросим подтверждение выхода без сохранения
//    if MessageBox(Handle,
//      PWideChar(sConfirmExitWithoutSaving),
//      PWideChar(sConfirm), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
//      Close
//    else
//      Abort;
//
//  end
//  else
    Close;
end;

procedure TCustomRec.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
//  aSave.Enabled := IsChanged and UserActionIsEnabled;
//  aOK.Enabled := IsChanged and UserActionIsEnabled;
//  aCancel.Enabled := UserActionIsEnabled;
end;

procedure TCustomRec.aOKExecute(Sender: TObject);
begin
  if not IsReadOnly then
    Save;

  Close;
end;

procedure TCustomRec.aSaveExecute(Sender: TObject);
begin
  if not IsReadOnly then
    Save;
end;


procedure TCustomRec.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  if not (LoadingState in cStatesReadyForAction) then
    Exit;

  if (not IsReadOnly) and IsChanged then
  begin
    // запросим подтверждение выхода без сохранения
//    CanClose := MessageBox(Handle,
//      PWideChar(sConfirmExitWithoutSaving),
//      PWideChar(sConfirm), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes;
    CanClose := MessageDlg(PChar(sConfirmExitWithoutSaving),  mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  end
  else
    CanClose := True;
end;

procedure TCustomRec.Save;
begin
  if IsChanged then
  begin
    ControlsToData;
    IsChanged := False;
    //LoadingState := TBaseFormState.ReadyForAction;
  end;
end;

procedure TCustomRec.UpdateCaption;
var
  s: string;
  aLoadingState: string;
begin
  if LoadingState in [TBaseFormState.ReadyForAction] then
  begin
    aLoadingState := '';
    //Enabled := True;
    //ActionList.State := asNormal;
  end
  else
  begin
    aLoadingState := ' ' + GetCaptionFromEnum(TypeInfo(TBaseFormState), Ord(LoadingState)) + '...';
    //ActionList.State := asSuspended;
    //Enabled := False;
  end;

  if ID <> 0 then
    s := Format('%s (%d)', [FInitCaption, ID])
  else
    s := FInitCaption;

  if IsReadOnly then
    s := s + ' - ' + sIsReadOnly + '!'
  else if IsChanged then
    s := s + '*';

  Caption := s + aLoadingState;
end;



procedure TCustomRec.UpdateUI;
begin
  inherited UpdateUI;
  aSave.Enabled := UserActionIsEnabled and not IsReadOnly and IsChanged;
  aOK.Enabled := UserActionIsEnabled and not IsReadOnly and IsChanged;
  aCancel.Enabled := UserActionIsEnabled;
end;

end.
