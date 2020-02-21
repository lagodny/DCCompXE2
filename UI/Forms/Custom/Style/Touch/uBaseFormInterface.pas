unit uBaseFormInterface;

interface

type
  // список элементов, форма для выбора элемента, редактирование элемента в диалоге
  TOpenFormType = (
    ftList,
    ftSelect, ftSelectModal,
    ftDialog, ftDialogModal,
    ftReport, ftReportModal
  );
  TOpenFormTypeSet = set of TOpenFormType;

  IBaseForm = interface
    ['{6621BEEC-E1C1-46CA-B97F-213CB9EA3BBA}']
    procedure SetOpenFormType(aOpenFormType: TOpenFormType);

    // обмен через ID объекта
    function GetID: Integer;
    procedure InitFromID(aID: Integer);
    procedure OpenForm(aOpenFormType: TOpenFormType; aID: Integer = 0; aSubscriber: string = '');

    // обмен через вариантный объект в формате JSON
    function GetData: string;
    procedure InitFromData(aData: string);
    procedure OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string = '');

    // однозначный идентификатор формы
    function GetFormGUID: string;
  end;

  IMainForm = interface
    ['{E21E0BCB-E71F-4AF8-B870-C654341EEBB3}']
    procedure InitChild(aObject: TObject);
  end;

const
  cModalOpenFormTypes = [ftSelectModal, ftDialogModal, ftReportModal];

implementation

end.
