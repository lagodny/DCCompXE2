unit cxCustomRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList,
  uBaseForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxLayoutControlAdapters, dxLayoutContainer, cxClasses,
  dxLayoutControl, Vcl.Menus, cxButtons, dxBar, dxSkinsCore, dxSkinsdxBarPainter;

resourcestring
  sConfirmExitWithoutSaving = 'Close without saving?';
  sIsReadOnly = 'Read only';

type
  //TOnAfterEditProc = procedure (aID: Integer) of object;

  TcxCustomRec = class(TBaseForm)
    ActionList: TActionList;
    aSave: TAction;
    aOK: TAction;
    aCancel: TAction;
    dxBarManager1: TdxBarManager;
    dxBarButtons: TdxBar;
    blbSave: TdxBarLargeButton;
    blbOk: TdxBarLargeButton;
    blbClose: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    aFullScreen: TAction;
    blbFullScreen: TdxBarLargeButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aFullScreenExecute(Sender: TObject);
  protected
    procedure UpdateUI; override;
    procedure UpdateCaption; override;
  public
    procedure SetUserShowHint(aValue: Boolean); override;

    procedure Save; virtual;

//    property IsChanged: Boolean read GetIsChanged write SetIsChanged;

//    class function OpenDialog(aID: Integer; aAfterEditProc: TOnAfterEditProc): Boolean; virtual;

//    property OnAfterEditDoc: TOnAfterEditProc read FOnAfterEditDoc write FOnAfterEditDoc;
  end;

  TcxCustomRecClass = class of TcxCustomRec;

implementation

{$R *.dfm}

uses
  SynCommons,
  uResources
  //, uMain
  //, uCommonData
  ;

{ TcxCustomRec }

procedure TcxCustomRec.aCancelExecute(Sender: TObject);
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

procedure TcxCustomRec.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
//  aSave.Enabled := IsChanged and UserActionIsEnabled;
//  aOK.Enabled := IsChanged and UserActionIsEnabled;
//  aCancel.Enabled := UserActionIsEnabled;
end;

procedure TcxCustomRec.aFullScreenExecute(Sender: TObject);
begin
  FullScreen := aFullScreen.Checked;
end;

procedure TcxCustomRec.aOKExecute(Sender: TObject);
begin
  if not IsReadOnly then
    Save;

  Close;
end;

procedure TcxCustomRec.aSaveExecute(Sender: TObject);
begin
  if not IsReadOnly then
    Save;
end;


procedure TcxCustomRec.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TcxCustomRec.Save;
begin
  if IsChanged then
  begin
    ControlsToData;
    IsChanged := False;
  end;
end;

procedure TcxCustomRec.SetUserShowHint(aValue: Boolean);
begin
  inherited;
  dxBarManager1.ShowHint := aValue;
end;

procedure TcxCustomRec.UpdateCaption;
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



procedure TcxCustomRec.UpdateUI;
begin
  inherited UpdateUI;
  aSave.Enabled := UserActionIsEnabled and not IsReadOnly and IsChanged;
  aOK.Enabled := UserActionIsEnabled and not IsReadOnly and IsChanged;
  aCancel.Enabled := UserActionIsEnabled;
end;

end.
