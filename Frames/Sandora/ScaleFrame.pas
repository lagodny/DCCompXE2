unit ScaleFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs,Contnrs;

type
  TFrame1 = class(TFrame)
  private
    FCompList:TObjectList;
    FScaled: bolean;
    procedure SetScaled(const Value: bolean);

  public
    property Scaled:bolean read FScaled write SetScaled;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

constructor TFrame1.Create(AOwner: TComponent);
begin
  inherited;
  FCompList := TObjectList.Create(False);
end;

destructor TFrame1.Destroy;
begin
  FreeAndNil(FCompList);
  inherited;
end;

procedure TFrame1.SetScaled(const Value: bolean);
begin
  FScaled := Value;
end;

end.
