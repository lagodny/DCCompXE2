unit uBaseFormInterface;

interface

type
  // ������ ���������, ����� ��� ������ ��������, �������������� �������� � �������
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

    // ����� ����� ID �������
    function GetID: Integer;
    procedure InitFromID(aID: Integer);
    procedure OpenForm(aOpenFormType: TOpenFormType; aID: Integer = 0; aSubscriber: string = '');

    // ����� ����� ���������� ������ � ������� JSON
    function GetData: string;
    procedure InitFromData(aData: string);
    procedure OpenData(aOpenFormType: TOpenFormType; aData: string; aSubscriber: string = '');

    // ����������� ������������� �����
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
