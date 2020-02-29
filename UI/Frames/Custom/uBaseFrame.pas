unit uBaseFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseFormInterface;

type
  TBaseFrame = class(TFrame)
  protected
    procedure InitCustomProps; virtual;
    procedure InitLookups; virtual;
    procedure InitRights; virtual;

    procedure ReadModel(aID: Integer); virtual;
    function WriteModel: Integer; virtual;

    procedure ModelToView; virtual;
    procedure ViewToModel; virtual;
  public
    constructor Create(AOwner: TComponent); override;

    function GetFormGUID: string;
    function GetOpenFormType: TOpenFormType;
    procedure NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string); virtual;

    // инициализровать фрейм
    // aData - произвольная структура данных
    procedure Init(aData: string); virtual;
  end;

implementation

{$R *.dfm}


{ TBaseFrame }

constructor TBaseFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitCustomProps;
  InitRights;
end;

function TBaseFrame.GetFormGUID: string;
var
  aIntf: IBaseForm;
begin
  if Assigned(Owner) and (Supports(Owner, IBaseForm, aIntf)) then
    Result := aIntf.GetFormGUID
  else
    Result := '';
end;

function TBaseFrame.GetOpenFormType: TOpenFormType;
var
  aIntf: IBaseForm;
begin
  if Assigned(Owner) and (Supports(Owner, IBaseForm, aIntf)) then
    Result := aIntf.GetOpenFormType
  else
    Result := ftUnknown;
end;

procedure TBaseFrame.Init(aData: string);
begin

end;

procedure TBaseFrame.InitCustomProps;
begin

end;

procedure TBaseFrame.InitLookups;
begin

end;

procedure TBaseFrame.InitRights;
begin

end;

procedure TBaseFrame.ModelToView;
begin
  InitLookups;
end;

procedure TBaseFrame.NotifySubscriber(aOperation: TNotifyOperation; aParam: Integer; aData: string);
var
  aIntf: IBaseForm;
begin
  if Assigned(Owner) and (Supports(Owner, IBaseForm, aIntf)) then
    aIntf.NotifySubscriber(aOperation, aParam, aData);
end;

procedure TBaseFrame.ReadModel(aID: Integer);
begin

end;

procedure TBaseFrame.ViewToModel;
begin

end;

function TBaseFrame.WriteModel: Integer;
begin

end;

end.
