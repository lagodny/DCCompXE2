unit uBaseFormInterface;

interface

type
  TNotifyOperation = (
    noRefresh,
    noItemSelected,
    noDataChanged,
    noNone
  );

  TOpenEditMode = (
    oemEdit, oemView
  );


  // ������ ���������, ����� ��� ������ ��������, �������������� �������� � �������
  TOpenFormType = (
    ftList,
    ftSelect, ftSelectModal,
    ftDialog, ftDialogModal,
    ftReport, ftReportModal,
    ftUnknown
  );
  TOpenFormTypeSet = set of TOpenFormType;

  IBaseForm = interface
    ['{6621BEEC-E1C1-46CA-B97F-213CB9EA3BBA}']
    procedure SetOpenFormType(aOpenFormType: TOpenFormType);

    // ����� ����� ID �������
    function GetID: Integer;
    procedure InitFromID(aID: Integer);
    procedure OpenForm(aOpenFormType: TOpenFormType; aID: Integer = 0; aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit);

    // ����� ����� ���������� ������ � ������� JSON
    function GetData: string;
    procedure InitFromData(aData: string);
    procedure OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string = ''; aEditMode: TOpenEditMode = oemEdit);

    // ����������� ������������� �����
    function GetFormGUID: string;
    function GetOpenFormType: TOpenFormType;

    procedure NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string);

    // ���������� ShowHint ��� ���� ��������� �����
    procedure SetUserShowHint(aValue: Boolean);
  end;

  IMainForm = interface
    ['{E21E0BCB-E71F-4AF8-B870-C654341EEBB3}']
    procedure InitChild(aObject: TObject);
  end;

const
  cModalOpenFormTypes = [ftSelectModal, ftDialogModal, ftReportModal];

implementation

end.
