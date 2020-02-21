unit cxCustomTitleRefRec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCustomRefRec, dxSkinsCore, dxSkinsdxBarPainter, dxBar, cxClasses, Vcl.ActnList,
  JvComponentBase, JvFormPlacement, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinscxPCPainter,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxLayoutContainer,
  cxTextEdit, dxLayoutControl;
  //DomDCEventModel;

type
  TCustomTitleRefRec = class(TcxCustomRefRec)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCommon: TdxLayoutGroup;
    lgHead: TdxLayoutGroup;
    lgButtons: TdxLayoutGroup;
    lsItem1: TdxLayoutSeparatorItem;
    lsItem2: TdxLayoutSeparatorItem;
    teTitle: TcxTextEdit;
    liTitle: TdxLayoutItem;
    cxButton1: TcxButton;
    liClose: TdxLayoutItem;
    cxButton2: TcxButton;
    liOK: TdxLayoutItem;
    cxButton3: TcxButton;
    liSave: TdxLayoutItem;

//  *** реализовать у наследников ***
//  private
//    FEntity: TSQLEntity;
//  protected
//    procedure InitLookups; override;
//
//    procedure ReadModel(aID: Integer); override;
//    function WriteModel: Integer; override;
//
//    procedure ModelToView; override;
//    procedure ViewToModel; override;
//
//  public
//    function GetID: Integer; override;
//    destructor Destroy; override;
  end;

implementation

//uses
//  SynCommons, mORMot,
//  uBaseFormInterface,
//  uFormsManager;


{$R *.dfm}

//destructor TCustomTitleRefRec.Destroy;
//begin
//  FEntity.Free;
//  inherited;
//end;

//initialization
//  TFormsManager.Instance.RegisterForm(TcxClientRefRec, TSQLClient, [ftDialog, ftDialogModal]);



end.
