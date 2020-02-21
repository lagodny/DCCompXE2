unit uFormsManager;

interface

uses
  Classes, System.RTLConsts,
  Forms, SysUtils, Winapi.Windows
  , SynCommons
  , uBaseFormInterface
  //, mORMot
  ;

resourcestring
  sFormClassIsNotFoundFmt = 'Form class is not found! (ModelClass: %s, OpenFormType: %d)';

type

  TRegistrationRec = packed record
    FormClass: TFormClass;
    ModelClass: TClass;
    FormOpenType: TOpenFormType;
  end;

  TRegistrations = array of TRegistrationRec;

  // класс предназначен для открытия нужной формы по модели
  // нужные формы регистрируются у себя в секции initialization
  // для открытия формы передаем класс модели и правило открытия формы
  TFormsManager = class
  private
    class var FInstance: TFormsManager;
  private
    FData: TRegistrations;
    FIndex: TDynArray;
    FMainForm: TForm;
    FStypeName: string;
    FScale: Integer;
    procedure SetCompareFunc(aCompareFunc: TDynArraySortCompare);
    procedure SetStypeName(const Value: string);

//    function fmInternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean;
//    function fmInitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;
    procedure SetScale(const Value: Integer);

  public
    constructor Create(aMainForm: TForm);

    procedure RegisterForm(aFormClass: TFormClass; aModelClass: TClass; aFormTypes: TOpenFormTypeSet);
    procedure RegisterMainForm(aMainForm: TForm);

    function FindFormByName(aFormName: string): TForm;
    function FindFormClass(aModelClass: TClass; aFormType: TOpenFormType): TFormClass;

    // работа по ID (ID объекта)
    function FindFormByClass(aClass: TFormClass; aID: Integer): TForm;
    function OpenFormByClass(aFormClass: TFormClass; aFormType: TOpenFormType; aID: Integer = 0;
      aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit): TForm;
    function OpenForm(aModelClass: TClass; aFormType: TOpenFormType; aID: Integer = 0;
      aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit): TForm;

    // работа по Data (объект в JSON)
    function FindDataFormByClass(aClass: TFormClass; aData: string): TForm;
    function OpenDataFormByClass(aFormClass: TFormClass; aFormType: TOpenFormType; aData: string;
      aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit): TForm;
    function OpenDataForm(aModelClass: TClass; aFormType: TOpenFormType; aData: string;
      aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit): TForm;

    //function CreateNewFormRes_Old(aFormClass: TFormClass): TForm;
    function CreateNewFormRes(aFormClass: TFormClass): TForm;

    class function Instance(aMainForm: TForm = nil): TFormsManager;

    property StyleName: string read FStypeName write SetStypeName;
    property Scale: Integer read FScale write SetScale;

  end;

implementation

uses
  uBaseForm;

  function CompareToAdd(const A,B): integer;
  var
    l: TRegistrationRec absolute A;
    r: TRegistrationRec absolute B;
  begin
    if l.FormOpenType > r.FormOpenType then
      Result := 1
    else if l.FormOpenType < r.FormOpenType then
      Result := -1

    else if l.ModelClass.ClassName > r.ModelClass.ClassName then
      Result := 1
    else if l.ModelClass.ClassName < r.ModelClass.ClassName then
      Result := -1

    else if l.FormClass.ClassName > r.FormClass.ClassName then
      Result := 1
    else if l.FormClass.ClassName < r.FormClass.ClassName then
      Result := -1

    else
      Result := 0;
  end;

  function CompareToFind(const A,B): integer;
  var
    l: TRegistrationRec absolute A;
    r: TRegistrationRec absolute B;
  begin
    if l.FormOpenType > r.FormOpenType then
      Result := 1
    else if l.FormOpenType < r.FormOpenType then
      Result := -1
    else if l.ModelClass.ClassName > r.ModelClass.ClassName then
      Result := 1
    else if l.ModelClass.ClassName < r.ModelClass.ClassName then
      Result := -1
    else
      Result := 0;
  end;


{ TFormsManager }

procedure TFormsManager.SetCompareFunc(aCompareFunc: TDynArraySortCompare);
begin
  if @FIndex.Compare <> @aCompareFunc then
  begin
    FIndex.Compare := aCompareFunc;
    FIndex.Sort;
  end;
end;

procedure TFormsManager.SetScale(const Value: Integer);
var
  i: Integer;
begin
  if FScale <> Value then
  begin
    for i := 0 to Screen.FormCount - 1 do
      Screen.Forms[i].ScaleBy(Value, FScale);

    FScale := Value;
  end;
end;

procedure TFormsManager.SetStypeName(const Value: string);
begin
  FStypeName := Value;
end;

constructor TFormsManager.Create(aMainForm: TForm);
begin
  FIndex.Init(TypeInfo(TRegistrations), FData);
  FIndex.Compare := CompareToAdd;
  FIndex.Sorted := True;

  FScale := 100;
  FStypeName := '';

  FMainForm := aMainForm;
end;

//function TFormsManager.fmInternalReadComponentRes(const ResName: string; HInst: THandle; var Instance: TComponent): Boolean;
//var
//  HRsrc: THandle;
//  aStyledResName: string;
//  aMS: TMemoryStream;
//  aRS : TResourceStream;
//begin
//  { avoid possible EResNotFound exception }
//  if HInst = 0 then
//    HInst := HInstance;
//
//  // 1. пытаемся найти ресурс соответстующий нашему стилю
//  aStyledResName := SysUtils.UpperCase(ResName + '_' + StyleName);
//  HRsrc := FindResource(HInst, PChar(aStyledResName), PChar(RT_RCDATA));
//  if HRsrc <> 0 then
//  begin
//    Result := HRsrc <> 0;
//    aMS := TMemoryStream.Create;
//    try
//      // читаем в память (ресурс хранится в виде текста)
//      aRS := TResourceStream.Create(HInstance, aStyledResName, RT_RCDATA);
//      try
//        // преобразовываем в Binary
//        ObjectTextToBinary(aRS, aMS);
//      finally
//        aRS.Free;
//      end;
//
//      // и загружаемся из этого Binary
//      aMS.Position := 0;
//      Instance := aMS.ReadComponent(Instance);
//    finally
//      aMS.Free
//    end
//  end
//
//  // 2. не нашли - используем то, что есть
//  else
//  begin
//    HRsrc := FindResource(HInst, PChar(ResName), PChar(RT_RCDATA));
//    Result := HRsrc <> 0;
//    if not Result then
//      Exit;
//
//    with TResourceStream.Create(HInst, ResName, RT_RCDATA) do
//    try
//      Instance := ReadComponent(Instance);
//    finally
//      Free;
//    end;
//  end;
//
//  Result := True;
//end;


//function TFormsManager.fmInitInheritedComponent(Instance: TComponent; RootAncestor: TClass): Boolean;
//
//  function InitComponent(ClassType: TClass): Boolean;
//  begin
//    Result := False;
//    if (ClassType = TComponent) or (ClassType = RootAncestor) then
//      Exit;
//
//    Result := InitComponent(ClassType.ClassParent);
//    // текущий не трогаем
//    //if ClassType <> Instance.ClassType then
//    Result :=
//      fmInternalReadComponentRes(ClassType.ClassName, FindResourceHInstance(FindClassHInstance(ClassType)), Instance) or Result;
//  end;
//
//begin
//  GlobalNameSpace.BeginWrite;  // hold lock across all ancestor loads (performance)
//  try
//    Result := InitComponent(Instance.ClassType);
//  finally
//    GlobalNameSpace.EndWrite;
//  end;
//end;


//function TFormsManager.CreateNewFormRes_Old(aFormClass: TFormClass): TForm;
//var
////  aFileStream: TFileStream;
//  aMS: TMemoryStream;
//  aRS : TResourceStream;
//  aResName: string;
//begin
//  // ресурс храним по имени класса формы и имени стиля (в имени стиля хорошо бы указать разрешение)
//  // например: TForm1_Touch_1366x768
//  aResName := SysUtils.UpperCase(aFormClass.ClassName + '_' + StyleName);
//
//  // если не указан стиль или нет такого ресурса - работаем как обычно
//  if (StyleName = '') or (FindResource(HInstance, PChar(aResName), RT_RCDATA) = 0) then
//    Result := aFormClass.Create(FMainForm)
//
//  // иначе загружаем форму из ресурса
//  else
//  begin
//    try
//      aMS := TMemoryStream.Create;
//      try
//        aRS := TResourceStream.Create(HInstance, aResName, RT_RCDATA);
//        try
//          ObjectTextToBinary(aRS, aMS);
//        finally
//          aRS.Free;
//        end;
//
//    //    FileStream := TFileStream.Create(DfmFile, fmOpenRead or fmShareDenyWrite);
//    //    try
//    //      ObjectTextToBinary(FileStream, MemoryStream)
//    //    finally
//    //      FileStream.Free
//    //    end;
//
//        aMS.Position := 0;
//        Result := TBaseFormClass(aFormClass).CreateStyled(FMainForm, StyleName);
//        try
////          Include(Result.FormState, fsCreating);
////          try
//            if not fmInitInheritedComponent(Result, TForm) then
//              raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
////          finally
////            Exclude(Result.FormState, fsCreating);
////          end;
//
////          if not fmInitInheritedComponent(Result, TForm) then
////            raise EResNotFound.CreateFmt(SResNotFound, [Result.ClassName]);
//
//          Result := TForm(aMS.ReadComponent(Result));
//          Result.AfterConstruction;
//        except
//          Result.Free;
//          raise
//        end
//      finally
//        aMS.Free
//      end
//    except
//      on e: Exception do
//      begin
//        Result := aFormClass.Create(FMainForm);
//        raise;
//      end;
//    end;
//  end;
//end;

function TFormsManager.CreateNewFormRes(aFormClass: TFormClass): TForm;
begin
//  if Supports(aFormClass, IBaseForm) then
  if not aFormClass.InheritsFrom(TBaseForm) then
    Result := aFormClass.Create(FMainForm)
  else
    Result := TBaseFormClass(aFormClass).CreateStyled(FMainForm, StyleName);

  Result.ScaleBy(Scale, 100);
end;

function TFormsManager.FindDataFormByClass(aClass: TFormClass; aData: string): TForm;
var
  i: integer;
  aForm: TForm;
begin
  Result := nil;
  for i := 0 to Screen.FormCount - 1 do
  begin
    aForm := Screen.Forms[i];
    if (aForm.ClassType = aClass) then
      if (aForm as IBaseForm).GetData = aData then
        Exit(aForm);
  end;
end;

function TFormsManager.FindFormByClass(aClass: TFormClass; aID: Integer): TForm;
var
  i: integer;
  aForm: TForm;
begin
  Result := nil;
  for i := 0 to Screen.FormCount - 1 do
  begin
    aForm := Screen.Forms[i];
    if (aForm.ClassType = aClass) then
      if (aForm as IBaseForm).GetID = aID  then
        Exit(aForm);
  end;
end;

function TFormsManager.FindFormByName(aFormName: string): TForm;
var
  i: integer;
  aForm: TForm;
begin
  Result := nil;
  for i := 0 to Screen.FormCount - 1 do
  begin
    aForm := Screen.Forms[i];
    if (aForm.Name = aFormName) then
      Exit(aForm);
  end;
end;

function TFormsManager.FindFormClass(aModelClass: TClass; aFormType: TOpenFormType): TFormClass;
var
  e: TRegistrationRec;
  i: Integer;
begin
  SetCompareFunc(CompareToFind);

  e.ModelClass := aModelClass;
  e.FormOpenType := aFormType;

  i := FIndex.Find(e);
  if i < 0 then
    Result := nil
  else
    Result := FData[i].FormClass;
end;

class function TFormsManager.Instance(aMainForm: TForm): TFormsManager;
begin
  if not Assigned(FInstance) then
    FInstance := TFormsManager.Create(aMainForm)
  else if Assigned(aMainForm) then
    FInstance.FMainForm := aMainForm;

  Result := FInstance;
end;

function TFormsManager.OpenForm(aModelClass: TClass; aFormType: TOpenFormType; aID: Integer;
  aSubscriber: string; aEditMode: TOpenEditMode): TForm;
var
  aFormClass: TFormClass;
begin
  aFormClass := FindFormClass(aModelClass, aFormType);
  if not Assigned(aFormClass) then
    raise Exception.CreateFmt(
      //'Form class is not found! (ModelClass: %s, OpenFormType: %d)',
      sFormClassIsNotFoundFmt,
      [aModelClass.ClassName, Ord(aFormType)]);

  Result := OpenFormByClass(aFormClass, aFormType, aID, aSubscriber, aEditMode);
end;

function TFormsManager.OpenDataForm(aModelClass: TClass; aFormType: TOpenFormType; aData: string;
  aSubscriber: string; aEditMode: TOpenEditMode): TForm;
var
  aFormClass: TFormClass;
begin
  aFormClass := FindFormClass(aModelClass, aFormType);
  if not Assigned(aFormClass) then
    raise Exception.CreateFmt(
      //'Form class is not found! (ModelClass: %s, OpenFormType: %d)',
      sFormClassIsNotFoundFmt,
      [aModelClass.ClassName, Ord(aFormType)]);

  Result := OpenDataFormByClass(aFormClass, aFormType, aData, aSubscriber, aEditMode);
end;

function TFormsManager.OpenDataFormByClass(aFormClass: TFormClass; aFormType: TOpenFormType; aData: string;
  aSubscriber: string; aEditMode: TOpenEditMode): TForm;
begin
  // модальную форму всегда создаем новую
  if aFormType in cModalOpenFormTypes then
    Result := nil
  else
    Result := FindDataFormByClass(aFormClass, aData);

  if not Assigned(Result) then
  begin
//    Result := aFormClass.Create(FMainForm);
    Result := CreateNewFormRes(aFormClass);
    (FMainForm as IMainForm).InitChild(Result);
  end;

  (Result as IBaseForm).OpenData(aFormType, aData, aSubscriber, aEditMode);
end;

function TFormsManager.OpenFormByClass(aFormClass: TFormClass; aFormType: TOpenFormType; aID: Integer;
  aSubscriber: string; aEditMode: TOpenEditMode): TForm;
begin
  // модальную форму всегда создаем новую
  if aFormType in cModalOpenFormTypes then
    Result := nil
  else
    Result := FindFormByClass(aFormClass, aID);

  if not Assigned(Result) then
  begin
    Result := CreateNewFormRes(aFormClass);
    (FMainForm as IMainForm).InitChild(Result);
  end;

  //(Result as IBaseForm).InitFromID(aID);
  (Result as IBaseForm).OpenForm(aFormType, aID, aSubscriber, aEditMode);
end;

procedure TFormsManager.RegisterForm(aFormClass: TFormClass; aModelClass: TClass;
  aFormTypes: TOpenFormTypeSet);
var
  e: TRegistrationRec;
  aType: TOpenFormType;
begin
  SetCompareFunc(CompareToAdd);

  e.FormClass := aFormClass;
  e.ModelClass := aModelClass;

  for aType := Low(TOpenFormType) to High(TOpenFormType) do
  begin
    if aType in aFormTypes then
    begin
      e.FormOpenType := aType;
      FIndex.FastLocateOrAddSorted(e);
    end;
  end;
end;

procedure TFormsManager.RegisterMainForm(aMainForm: TForm);
begin
  FMainForm := aMainForm;
end;

initialization
  TFormsManager.FInstance := nil;

finalization
  FreeAndNil(TFormsManager.FInstance);

end.
