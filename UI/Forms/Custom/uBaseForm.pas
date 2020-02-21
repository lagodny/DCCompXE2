unit uBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.RTLConsts,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  JvComponentBase, JvFormPlacement,
  //TB2Dock, TB2Toolbar, SpTBXItem,
  //cxTextEdit,
  SynCommons,
  dxRibbonForm,
  uBaseFormInterface;

resourcestring
  sDoNotUseCreateConstructor = 'You should not use this constructor. Use CreateStyled instead.';

const
  msgNotify = WM_USER + 100;

type
  TBaseFormState = (Loading, ReadModel, ModelToView, ReadyForAction, ViewToModel, WriteModel, Saving);

const
  cStatesReadyForAction = [TBaseFormState.ReadyForAction];
  cStatesLoading = [TBaseFormState.Loading, TBaseFormState.ReadModel, TBaseFormState.ModelToView];
  cStatesSaving = [TBaseFormState.ViewToModel, TBaseFormState.WriteModel, TBaseFormState.Saving];


type
  EBaseFormException = class(Exception)

  end;

  TBaseForm = class(TdxRibbonForm, IBaseForm)
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
    FSubscribers: TStrings;
    FFormGUID: string;
    FIncomingData: string;

    // данные переданные форме
    FInitData: string;
    FFormState: TFormState;
    FStyleName: string;
    FFullScreen: Boolean;
    FEditMode: TOpenEditMode;

    procedure SetLoadingState(const Value: TBaseFormState);
    procedure SetRefControl(const Value: TObject);

    procedure NotifyMsg(var Message: TMessage); message msgNotify;

    procedure SetSubscriber(const Value: string);
    procedure SetIncomingData(const Value: string);

    function fmInternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean;
    function fmInitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;
    procedure SetFullScreen(const Value: Boolean);
    procedure SetEditMode(const Value: TOpenEditMode);

  protected
    // заголовок формы без всякой дополнительной информации
    FInitCaption: string;
    // форма только для просмотра
    FIsReadOnly: Boolean;

    procedure AbortIfNoCheck(aCondition: Boolean; aControl: TWinControl; const Msg, Inst: string; Error: boolean=false);

    function GetIsChanged: Boolean; virtual;
    procedure SetIsChanged(const Value: Boolean); virtual;

    procedure UpdateCaption; virtual;
    function UserActionIsEnabled: Boolean; virtual;

    // необходимо переопределить у наследников
    procedure LoadSettings; virtual;
    procedure SaveSettings; virtual;

    procedure SetReadOnlyControl(aControl: TControl; aReadOnly: Boolean);
    procedure SetReadOnlyForm(aReadOnly: Boolean);

    procedure UpdateUI; virtual;

    // возвращает True, если сообщение было обработано
    function DoPerformNotify(aOperation: TNotifyOperation; aParam: Integer): Boolean; virtual;

    // вызывается при необходимости выполнить повторную загрузку Lookup (добавился новый элемент и т.д.)
    // необходимо переопределить у наследника, т.к. базовая форма может ничего не знать о том как это сделать
    procedure ReloadLookup(aLookupComp: TObject); virtual;
    function IsNeedToReloadLookup(aLookup: TObject): Boolean;

    procedure InitLookups; virtual;
    procedure InitIsReadOnly; virtual;
    procedure PostActive_cxControl; virtual;

    // проверить корректность модели
    procedure CheckModel; virtual;

    // получить модель с сервера по ID (если ID = 0, будут создана новая модель (документ, номенклатура...)
    procedure ReadModel(aID: Integer); virtual;
    // записать модель на сервер: возвращает ID модели
    function WriteModel: Integer; virtual;

    // показывает данные модели на форме
    procedure ModelToView; virtual;
    // переносит данные формы в модель
    procedure ViewToModel; virtual;

    // порядок работы:
    {
    1. при окрытии документа или получении обновлённого документа с сервера:
      - вычитываем документ с сервера               ReadModel
      - показываем документ на форме                ModelToView

    2. при сохранении документа
      - переносим данные с формы в документ         ViewToModel
      - записываем документ на сервере              WriteModel

    3. при выполнении каких либо операций над моделью (подсчет итогов, пересчет данных ... )
      - переносим данные с формы в документ         ViewToModel
      - выполняем нужные операции над документом    CalcTotal, CalcEE, Calc...
      - показываем документ на форме                ModelToView

      P.S. Важно: никогда не выполняем пересчеты по данным формы!
    }
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateStyled(AOwner: TComponent; aStyleName: string); virtual;

    //** реализация интерфейса IBaseForm **
    procedure SetOpenFormType(Value: TOpenFormType);
    function GetOpenFormType: TOpenFormType;

    // работа с ID (частный случай)
    function GetID: Integer; virtual;
    procedure InitFromID(aID: Integer); virtual;
    procedure OpenForm(aOpenFormType: TOpenFormType; aID: Integer = 0; aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit);

    // работа с Data
    // данные о НАШЕЙ форме, которые мы ВОЗВРАЩАЕМ в другие формы
    function GetData: string; virtual;
    // диалог может использовать aData для своей инициализации
    // список может использовать aData для поиска
    // данные запоминаем
    procedure InitFromData(aData: string); virtual;
    // открыть НАШУ форму в нужном виде
    // инициироваться данными
    // и запомнить, кого уведомлять
    procedure OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit);

    function GetFormGUID: string;

    // некоторые компоненты не реагируют на изменения Application.ShowHint
    // для них нужно выполнить это вручную
    procedure SetUserShowHint(aValue: Boolean); virtual;
    //**

  public
    function IncomingDataIsEmpty: Boolean;
    function FormSectionName: string;

    procedure NotifyFormByName(aFormName: string; aOperation: TNotifyOperation);
    procedure NotifyFormByClassName(aFormClassName: string; aOperation: TNotifyOperation);
    procedure NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string);

    procedure DataToControls(aID: Integer); virtual;
    function ControlsToData: Integer; virtual;

    function IsReadyForAction: Boolean;

    property FormGUID: string read FFormGUID;
    property FormState: TFormState read FFormState write FFormState;

    property ID: Integer read GetID;
    property Data: string read GetData;
    property OpenFormType: TOpenFormType read FOpenFormType write SetOpenFormType;
    property InitData: string read FInitData write FInitData;

    // кого уведомлять о каких-то действиях
    property Subscriber: string read FSubscriber write SetSubscriber;
    property Subscribers: TStrings read FSubscribers;

    // поступающие данные от других форм
    property IncomingData: string read FIncomingData write SetIncomingData;

    property RefControl: TObject read FRefcontrol write SetRefControl default nil;

    property LoadingState: TBaseFormState read FLoadingState write SetLoadingState;
    property IsChanged: Boolean read GetIsChanged write SetIsChanged;

    property StyleName: string read FStyleName;
    property IsReadOnly: Boolean read FIsReadOnly;

    property FullScreen: Boolean read FFullScreen write SetFullScreen;
    property EditMode: TOpenEditMode read FEditMode write SetEditMode;
  end;

  TBaseFormClass = class of TBaseForm;

implementation

uses
  SynTaskDialog,
  mORMoti18n,
  uCursorSaver,
  cxEdit, cxLookupEdit, cxDBLookupComboBox,
  uDataProc,
  uKeys;

{$R *.dfm}

{ TBaseForm }

procedure TBaseForm.CheckModel;
begin

end;

function TBaseForm.ControlsToData: Integer;
var
  aCursor: ICursorSaver;
begin
  try
    aCursor := TCursorSaver.Create;

    LoadingState := TBaseFormState.ViewToModel;
    ViewToModel;

    CheckModel;

    LoadingState := TBaseFormState.WriteModel;
    Result := WriteModel;
  finally
    LoadingState := TBaseFormState.ReadyForAction;
  end;
end;

constructor TBaseForm.Create(AOwner: TComponent);
begin
  inherited;
  raise EBaseFormException.Create(sDoNotUseCreateConstructor);
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
    InitIsReadOnly;
  finally
    LoadingState := TBaseFormState.ReadyForAction;
  end;
end;

procedure TBaseForm.DoDataChanged(Sender: TObject);
begin
  if not IsReadyForAction then
    Exit;

  IsChanged := True;
//  UpdateUI;
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
        if (IncomingData <> '') and (IncomingData <> '{}') then
          TcxCustomEdit(ActiveControl.Parent).EditValue := IncomingData
        else
          TcxCustomEdit(ActiveControl.Parent).EditValue := aParam;

        if IsNeedToReloadLookup(ActiveControl.Parent) then
          ReloadLookup(ActiveControl.Parent);
//        if ActiveControl.Parent is TcxLookupComboBox then
//        begin
//          TcxLookupComboBox(ActiveControl.Parent).Properties.ListSource.DataSet.Lookup('ID', VarArrayOf([1]), 'Title')
//        end;


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
    // текущий не трогаем
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

  // 1. пытаемся найти ресурс соответстующий нашему стилю
  aStyledResName := System.SysUtils.UpperCase(ResName + '_' + StyleName);
  HRsrc := FindResource(HInst, PChar(aStyledResName), PChar(RT_RCDATA));
  if HRsrc <> 0 then
  begin
    Result := HRsrc <> 0;
    aMS := TMemoryStream.Create;
    try
      // читаем в память (ресурс хранится в виде текста)
      aRS := TResourceStream.Create(HInstance, aStyledResName, RT_RCDATA);
      try
        // преобразовываем в Binary
        ObjectTextToBinary(aRS, aMS);
      finally
        aRS.Free;
      end;

      // и загружаемся из этого Binary
      aMS.Position := 0;
      Instance := aMS.ReadComponent(Instance);
    finally
      aMS.Free
    end
  end

  // 2. не нашли - используем то, что есть
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
  FSubscribers := TStringList.Create;
  FInitCaption := Caption;

  // по GUID формы будут находить друг друга для обмена сообщениями
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
  FreeAndNIl(FSubscribers);
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

function TBaseForm.GetOpenFormType: TOpenFormType;
begin
  Result := FOpenFormType;
end;

function TBaseForm.IncomingDataIsEmpty: Boolean;
begin
  Result := (IncomingData = '') or (IncomingData = '{}');
end;

procedure TBaseForm.InitFromData(aData: string);
var
  v: Variant;
  aID: Integer;
begin
  FInitData := aData;

  aID := 0;

  // в aData можно передать ID
  // проверяем:
  if aData <> '' then
  begin
    if not TryStrToInt(aData, aID) then
    begin
      v := _Json(S2U(aData));
      aID := VariantToInt64Def(v.ID, 0);
    end;
  end;

  DataToControls(aID);
end;

procedure TBaseForm.InitFromID(aID: Integer);
begin
  DataToControls(aID);
end;

procedure TBaseForm.InitIsReadOnly;
begin
  FIsReadOnly := False;
end;

procedure TBaseForm.InitLookups;
begin

end;

function TBaseForm.IsNeedToReloadLookup(aLookup: TObject): Boolean;
var
  lc: TcxLookupComboBox;
  r: Variant;
begin
  Result := False;

  if not (aLookup is TcxLookupComboBox) then
    Exit;

  lc := aLookup as TcxLookupComboBox;
  if not Assigned(lc.Properties.ListSource) or not Assigned(lc.Properties.ListSource.DataSet) then
    Exit;

  r := lc.Properties.ListSource.DataSet.Lookup(
    lc.Properties.KeyFieldNames, VarArrayOf([lc.EditValue]), lc.Properties.ListFieldNames);

  Result := VarIsNull(r);

end;

function TBaseForm.IsReadyForAction: Boolean;
begin
  Result := LoadingState in cStatesReadyForAction;
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
      if SameText(aForm.FormGUID, Subscriber) or (Subscribers.IndexOf(aForm.FormGUID)>-1) then
      begin
        aForm.IncomingData := aData;
        PostMessage(aForm.Handle, msgNotify, Ord(aOperation), aParam);
      end;
    end;
  end;
end;

procedure TBaseForm.OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string; aEditMode: TOpenEditMode);
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
  EditMode := aEditMode;
end;

procedure TBaseForm.OpenForm(aOpenFormType: TOpenFormType; aID: Integer; aSubscriber: string; aEditMode: TOpenEditMode);
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

  EditMode := aEditMode;
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

procedure TBaseForm.ReloadLookup(aLookupComp: TObject);
begin

end;

procedure TBaseForm.SaveSettings;
begin

end;

procedure TBaseForm.SetEditMode(const Value: TOpenEditMode);
begin
  if FEditMode <> Value then
  begin
    FEditMode := Value;
    UpdateUI;
  end;
end;

procedure TBaseForm.SetFullScreen(const Value: Boolean);
begin
  if FFullScreen <> Value then
  begin
    FFullScreen := Value;
    if Value then
    begin
      BorderStyle := bsNone;
      FormStyle := fsStayOnTop;
      WindowState := wsMaximized;
    end
    else
    begin
      FormStyle := fsMDIChild;
      BorderStyle := bsSizeable;
    end;
  end;
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
    UpdateUI;
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
  FSubscribers.Add(Value);
end;

procedure TBaseForm.SetUserShowHint(aValue: Boolean);
begin
  ShowHint := aValue;
end;

procedure TBaseForm.AbortIfNoCheck(aCondition: Boolean; aControl: TWinControl; const Msg, Inst: string; Error: boolean=false);
const
  IconError: array[boolean] of TTaskDialogIcon = (tiInformation, tiError);
var
  Task: TTaskDialog;
begin
  if aCondition then
    Exit;

  if Assigned(aControl) then
    SetFocusedControl(aControl);

  Task.Inst := Inst;
  Task.Content := Msg;
  Task.Execute([cbOK], mrOk, [], IconError[Error]);

  ModalResult := mrNone;
  Abort;
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

procedure TBaseForm.SetReadOnlyControl(aControl: TControl; aReadOnly: Boolean);
//var
//  i: Integer;
begin
//  if (aControl <> Self)
//    or (aControl is TPageControl)
//    or (aControl is TTabSheet)
//    or (aControl is TTabControl)
//    or (aControl is TPanel) then
//    aControl.Enabled := not aReadOnly;
//  if (aControl is TcxTextEdit) then
//    TCustomEdit(aControl).ReadOnly
//    or (aControl is TCustomEdit)
//    or (aControl is TCustomButton)
//    then
//    aControl.Enabled := not aReadOnly;
//
//
//  if aControl is TWinControl then
//  begin
//    for i := 0 to TWinControl(aControl).ControlCount - 1 do
//      SetReadOnlyControl(TWinControl(aControl).Controls[i], aReadOnly);
//  end;
end;

procedure TBaseForm.SetReadOnlyForm(aReadOnly: Boolean);
begin
  SetReadOnlyControl(Self, aReadOnly);
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
