unit uBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, system.RTLConsts,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  JvComponentBase, JvFormPlacement,
  TB2Dock, TB2Toolbar, SpTBXItem,
  SynCommons,
  uBaseFormInterface;

const
  msgNotify = WM_USER + 100;

type
  TBaseFormState = (Loading, ReadModel, ModelToView, ReadyForAction, ViewToModel, WriteModel, Saving);

const
  cStatesReadyForAction = [TBaseFormState.ReadyForAction];
  cStatesLoading = [TBaseFormState.Loading, TBaseFormState.ReadModel, TBaseFormState.ModelToView];
  cStatesSaving = [TBaseFormState.ViewToModel, TBaseFormState.WriteModel, TBaseFormState.Saving];


type
  TNotifyOperation = (
    noRefresh,
    noItemSelected,
    noDataChanged,
    noNone
  );

  TBaseForm = class(TForm, IBaseForm)
    FormStorage: TJvFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DoDataChanged(Sender: TObject);
  private
    FIsChanged: Boolean;
    FLoadingState: TBaseFormState;
    FRefcontrol: TObject;
    FOpenFormType: TOpenFormType;
    FSubscriber: string;
    FFormGUID: string;
    FIncomingData: string;

    // ������ ���������� �����
    FInitData: string;
    FFormState: TFormState;
    FStyleName: string;

    procedure SetLoadingState(const Value: TBaseFormState);
    procedure SetRefControl(const Value: TObject);

    procedure NotifyMsg(var Message: TMessage); message msgNotify;

    procedure SetSubscriber(const Value: string);
    procedure SetIncomingData(const Value: string);

    function fmInternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean;
    function fmInitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;

  protected
    // ��������� ����� ��� ������ �������������� ����������
    FInitCaption: string;

    function GetIsChanged: Boolean; virtual;
    procedure SetIsChanged(const Value: Boolean); virtual;

    procedure UpdateCaption; virtual;
    function UserActionIsEnabled: Boolean; virtual;

    // ���������� �������������� � �����������
    procedure LoadSettings; virtual;
    procedure SaveSettings; virtual;

    procedure UpdateUI; virtual;

    // ���������� True, ���� ��������� ���� ����������
    function DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean; virtual;

    procedure InitLookups; virtual;
    procedure PostActive_cxControl; virtual;

    // �������� ������ � ������� �� ID (���� ID = 0, ����� ������� ����� ������ (��������, ������������...)
    procedure ReadModel(aID: Integer); virtual;
    // �������� ������ �� ������: ���������� ID ������
    function WriteModel: Integer; virtual;

    // ���������� ������ ������ �� �����
    procedure ModelToView; virtual;
    // ��������� ������ ����� � ������
    procedure ViewToModel; virtual;

    // ������� ������:
    {
    1. ��� ������� ��������� ��� ��������� ����������� ��������� � �������:
      - ���������� �������� � �������               ReadModel
      - ���������� �������� �� �����                ModelToView

    2. ��� ���������� ���������
      - ��������� ������ � ����� � ��������         ViewToModel
      - ���������� �������� �� �������              WriteModel

    3. ��� ���������� ����� ���� �������� ��� ������� (������� ������, �������� ������ ... )
      - ��������� ������ � ����� � ��������         ViewToModel
      - ��������� ������ �������� ��� ����������    CalcTotal, CalcEE, Calc...
      - ���������� �������� �� �����                ModelToView

      P.S. �����: ������� �� ��������� ��������� �� ������ �����!
    }
  public
    constructor CreateStyled(AOwner: TComponent; aStyleName: string); virtual;

    //** ���������� ���������� IBaseForm **
    procedure SetOpenFormType(Value: TOpenFormType);

    // ������ � ID (������� ������)
    function GetID: Integer; virtual;
    procedure InitFromID(aID: Integer); virtual;
    procedure OpenForm(aOpenFormType: TOpenFormType; aID: Integer = 0; aSubscriber: string = '');

    // ������ � Data
    // ������ � ����� �����, ������� �� ���������� � ������ �����
    function GetData: string; virtual;
    // ������ ����� ������������ aData ��� ����� �������������
    // ������ ����� ������������ aData ��� ������
    // ������ ����������
    procedure InitFromData(aData: string); virtual;
    // ������� ���� ����� � ������ ����
    // �������������� �������
    // � ���������, ���� ����������
    procedure OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string = '');

    function GetFormGUID: string;
    //**

  public
    function FormSectionName: string;

    procedure NotifyFormByName(aFormName: string; aOperation: TNotifyOperation);
    procedure NotifyFormByClassName(aFormClassName: string; aOperation: TNotifyOperation);
    procedure NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string);

    procedure DataToControls(aID: Integer); virtual;
    function ControlsToData: Integer; virtual;

    property FormGUID: string read FFormGUID;
    property FormState: TFormState read FFormState write FFormState;

    property ID: Integer read GetID;
    property Data: string read GetData;
    property OpenFormType: TOpenFormType read FOpenFormType write SetOpenFormType;
    property InitData: string read FInitData write FInitData;

    // ���� ���������� � �����-�� ���������
    property Subscriber: string read FSubscriber write SetSubscriber;
    // ����������� ������ �� ������ ����
    property IncomingData: string read FIncomingData write SetIncomingData;

    property RefControl: TObject read FRefcontrol write SetRefControl default nil;

    property LoadingState: TBaseFormState read FLoadingState write SetLoadingState;
    property IsChanged: Boolean read GetIsChanged write SetIsChanged;

    property StyleName: string read FStyleName;
  end;

  TBaseFormClass = class of TBaseForm;

implementation

uses
  mORMoti18n,
  uCursorSaver,
  cxEdit,
  uKeys;

{$R *.dfm}

{ TBaseForm }

function TBaseForm.ControlsToData: Integer;
var
  aCursor: ICursorSaver;
begin
  try
    aCursor := TCursorSaver.Create;

    LoadingState := TBaseFormState.ViewToModel;
    ViewToModel;

    LoadingState := TBaseFormState.WriteModel;
    Result := WriteModel;

    IsChanged := False;
  finally
    LoadingState := TBaseFormState.ReadyForAction;
  end;
end;

constructor TBaseForm.CreateStyled(AOwner: TComponent; aStyleName: string);
begin
  inherited CreateNew(AOwner);

  FStyleName := aStyleName;
  GlobalNameSpace.BeginWrite;
  try
//    FCreatingMainForm := Application.FCreatingMainForm;
//    if FCreatingMainForm then
//      Application.FCreatingMainForm := False;

//    InitializeNewForm;

    if (ClassType <> TForm) and not (csDesigning in ComponentState) then
    begin
      Include(FFormState, fsCreating);
      try
        if StyleName <> '' then
        begin
          if not fmInitInheritedComponent(Self, TForm) then
            raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
        end
        else
        begin
          if not InitInheritedComponent(Self, TForm) then
            raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
        end

      finally
        Exclude(FFormState, fsCreating);
      end;

      if OldCreateOrder then
        DoCreate;
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
  ControlStyle := ControlStyle + [csPaintBlackOpaqueOnGlass];
end;

procedure TBaseForm.DataToControls(aID: Integer);
var
  aCursor: ICursorSaver;
begin
  try
    aCursor := TCursorSaver.Create;

    LoadingState := TBaseFormState.ReadModel;
    ReadModel(aID);

    LoadingState := TBaseFormState.ModelToView;
    ModelToView;

    IsChanged := aID = 0;
  finally
    LoadingState := TBaseFormState.ReadyForAction;
  end;
end;

procedure TBaseForm.DoDataChanged(Sender: TObject);
begin
  if LoadingState in [TBaseFormState.ReadyForAction] then
  begin
    IsChanged := True;
    UpdateUI;
  end;
end;

function TBaseForm.DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean;
begin
  Result := False;

  case aOperation of
    noItemSelected:
    begin
      if ActiveControl is TcxCustomEdit then
      begin
        if IncomingData <> '' then
          TcxCustomEdit(ActiveControl).EditValue := IncomingData
        else
          TcxCustomEdit(ActiveControl).EditValue := aParam;
        PostActive_cxControl;
        Exit(True);
      end
      else if ActiveControl.Parent is TcxCustomEdit then
      begin
        if IncomingData <> '' then
          TcxCustomEdit(ActiveControl.Parent).EditValue := IncomingData
        else
          TcxCustomEdit(ActiveControl.Parent).EditValue := aParam;
        PostActive_cxControl;
        Exit(True);
      end;
    end;
  end;
end;

function TBaseForm.fmInitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;

  function InitComponent(ClassType: TClass): Boolean;
  begin
    Result := False;
    if (ClassType = TComponent) or (ClassType = RootAncestor) then
      Exit;

    Result := InitComponent(ClassType.ClassParent);
    // ������� �� �������
    //if ClassType <> Instance.ClassType then
    Result :=
      fmInternalReadComponentRes(ClassType.ClassName, FindResourceHInstance(FindClassHInstance(ClassType)), Instance) or Result;
  end;
var
  LocalizeLoading: Boolean;
begin
  GlobalNameSpace.BeginWrite;  // hold lock across all ancestor loads (performance)
  try
    LocalizeLoading := (Instance.ComponentState * [csInline, csLoading]) = [];
    if LocalizeLoading then BeginGlobalLoading;  // push new loadlist onto stack
    try
      Result := InitComponent(Instance.ClassType);
      if LocalizeLoading then NotifyGlobalLoading;  // call Loaded
    finally
      if LocalizeLoading then EndGlobalLoading;  // pop loadlist off stack
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;
//
//begin
//  GlobalNameSpace.BeginWrite;  // hold lock across all ancestor loads (performance)
//  try
//    Result := InitComponent(Instance.ClassType);
//  finally
//    GlobalNameSpace.EndWrite;
//  end;
//end;

function TBaseForm.fmInternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean;
var
  HRsrc: THandle;
  aStyledResName: string;
  aMS: TMemoryStream;
  aRS : TResourceStream;
begin
  { avoid possible EResNotFound exception }
  if HInst = 0 then
    HInst := HInstance;

  // 1. �������� ����� ������ �������������� ������ �����
  aStyledResName := System.SysUtils.UpperCase(ResName + '_' + StyleName);
  HRsrc := FindResource(HInst, PChar(aStyledResName), PChar(RT_RCDATA));
  if HRsrc <> 0 then
  begin
    Result := HRsrc <> 0;
    aMS := TMemoryStream.Create;
    try
      // ������ � ������ (������ �������� � ���� ������)
      aRS := TResourceStream.Create(HInstance, aStyledResName, RT_RCDATA);
      try
        // ��������������� � Binary
        ObjectTextToBinary(aRS, aMS);
      finally
        aRS.Free;
      end;

      // � ����������� �� ����� Binary
      aMS.Position := 0;
      Instance := aMS.ReadComponent(Instance);
    finally
      aMS.Free
    end
  end

  // 2. �� ����� - ���������� ��, ��� ����
  else
  begin
    HRsrc := FindResource(HInst, PChar(ResName), PChar(RT_RCDATA));
    Result := HRsrc <> 0;
    if not Result then
      Exit;

    with TResourceStream.Create(HInst, ResName, RT_RCDATA) do
    try
      Instance := ReadComponent(Instance);
    finally
      Free;
    end;
  end;

  Result := True;
end;

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TBaseForm.FormCreate(Sender: TObject);
var
  aGuid: TGUID;
begin
  FInitCaption := Caption;

  // �� GUID ����� ����� �������� ���� ����� ��� ������ �����������
  if CreateGUID(aGuid) <> S_OK then
    RaiseLastOSError;

  FFormGUID := GUIDToString(aGuid);

  LoadingState := TBaseFormState.Loading;
  LoadSettings;
  //LoadingState := TBaseFormState.ReadyForAction;
end;

procedure TBaseForm.FormDestroy(Sender: TObject);
begin
  LoadingState := TBaseFormState.Saving;
  SaveSettings;
end;

function TBaseForm.FormSectionName: string;
begin
  Result := TKeys.Home + '\' + Name;
end;

function TBaseForm.GetData: string;
begin
  Result := '{}';
end;

function TBaseForm.GetFormGUID: string;
begin
  Result := FFormGUID;
end;

function TBaseForm.GetID: Integer;
begin
  Result := 0;
end;

function TBaseForm.GetIsChanged: Boolean;
begin
  Result := FIsChanged;
end;

procedure TBaseForm.InitFromData(aData: string);
var
  v: Variant;
  aID: Integer;
begin
  FInitData := aData;

  aID := 0;

  // � aData ����� �������� ID
  // ���������:
  if not TryStrToInt(aData, aID) then
  begin
    v := _Json(S2U(aData));
    aID := VariantToInt64Def(v.ID, 0);
  end;

  DataToControls(aID);
end;

procedure TBaseForm.InitFromID(aID: Integer);
begin
  DataToControls(aID);
end;

procedure TBaseForm.InitLookups;
begin

end;

procedure TBaseForm.LoadSettings;
begin
  UpdateUI;
end;

procedure TBaseForm.ModelToView;
begin
  InitLookups;
end;

procedure TBaseForm.NotifyFormByClassName(aFormClassName: string; aOperation: TNotifyOperation);
var
  i: Integer;
  aForm: TBaseForm;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i] is TBaseFormClass then
    begin
      aForm := TBaseForm(Screen.Forms[i]);
      if SameText(aForm.ClassName, aFormClassName) then
        PostMessage(aForm.Handle, msgNotify, Ord(aOperation), 0);
    end;
  end;

end;

procedure TBaseForm.NotifyFormByName(aFormName: string; aOperation: TNotifyOperation);
var
  i: Integer;
  aForm: TBaseForm;
begin
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i] is TBaseFormClass then
    begin
      aForm := TBaseForm(Screen.Forms[i]);
      if SameText(aForm.Name, aFormName) then
        PostMessage(aForm.Handle, msgNotify, Ord(aOperation), 0);
    end;
  end;

end;

procedure TBaseForm.NotifyMsg(var Message: TMessage);
begin
  DoPerformNotify(TNotifyOperation(Message.WParam), Message.LParam);
end;

procedure TBaseForm.NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string);
var
  i: Integer;
  aForm: TBaseForm;
begin
  if Subscriber = '' then
    Exit;

  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i] is TBaseFormClass then
    begin
      aForm := TBaseForm(Screen.Forms[i]);
      if SameText(aForm.FormGUID, Subscriber) then
      begin
        aForm.IncomingData := aData;
        PostMessage(aForm.Handle, msgNotify, Ord(aOperation), aParam);
      end;
    end;
  end;

end;

procedure TBaseForm.OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string);
begin
  SetOpenFormType(aOpenFormType);

  InitFromData(aData);
  Subscriber := aSubscriber;

  if Visible then
    SetForegroundWindow(Handle)
  else
  begin
    case FOpenFormType of
      ftList, ftSelect, ftDialog:
        Show;

      ftSelectModal, ftDialogModal:
        ShowModal;
    end;
  end;
end;

procedure TBaseForm.OpenForm(aOpenFormType: TOpenFormType; aID: Integer; aSubscriber: string);
begin

  InitFromID(aID);
  Subscriber := aSubscriber;

  SetOpenFormType(aOpenFormType);

  if Visible then
  begin
    if WindowState = wsMinimized then
      WindowState := wsNormal
    else
      SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOSIZE+SWP_NOMOVE);
    //SetForegroundWindow(Handle)
  end
  else
  begin
    case FOpenFormType of
      ftList, ftSelect, ftDialog:
        Show;

      ftSelectModal, ftDialogModal:
        ShowModal;
    end;
  end;
end;

procedure TBaseForm.PostActive_cxControl;
begin
  if ActiveControl is TcxCustomEdit then
    TcxCustomEdit(ActiveControl).PostEditValue
  else if Assigned(ActiveControl) and (ActiveControl.Parent is TcxCustomEdit) then
    TcxCustomEdit(ActiveControl.Parent).PostEditValue;
end;

procedure TBaseForm.ReadModel(aID: Integer);
begin

end;

procedure TBaseForm.SaveSettings;
begin

end;

procedure TBaseForm.SetIncomingData(const Value: string);
begin
  FIncomingData := Value;
end;

procedure TBaseForm.SetIsChanged(const Value: Boolean);
begin
  if FIsChanged <> Value then
  begin
    FIsChanged := Value;
    UpdateCaption;
  end;
end;

procedure TBaseForm.SetLoadingState(const Value: TBaseFormState);
begin
  if FLoadingState <> Value then
  begin
    FLoadingState := Value;
    UpdateCaption;
    UpdateUI;
  end;
end;

procedure TBaseForm.SetSubscriber(const Value: string);
begin
  FSubscriber := Value;
end;

procedure TBaseForm.SetOpenFormType(Value: TOpenFormType);
begin
  FOpenFormType := Value;
  case FOpenFormType of
    ftList, ftSelect, ftDialog, ftReport:
    begin
      FormStyle := fsMDIChild;
    end;

    ftSelectModal, ftDialogModal, ftReportModal:
    begin
      FormStyle := fsNormal;
    end;
  end;

end;

procedure TBaseForm.SetRefControl(const Value: TObject);
begin
  FRefcontrol := Value;
end;

procedure TBaseForm.UpdateCaption;
begin

end;

procedure TBaseForm.UpdateUI;
begin

end;

function TBaseForm.UserActionIsEnabled: Boolean;
begin
  Result := LoadingState in cStatesReadyForAction;
end;

procedure TBaseForm.ViewToModel;
begin
  PostActive_cxControl;
end;

function TBaseForm.WriteModel: Integer;
begin
  Result := 0;
end;

initialization
  RegisterClasses([TBaseForm]);
  RegisterClasses([TJvFormStorage]);

end.
