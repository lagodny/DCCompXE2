unit aOPCRoute;

interface

uses
  Classes;

type
  TRouteCollection = class;
  TRouteLinkCollection = class;

  // элемент маршрута
  TRouteItem = class(TCollectionItem)
  private
    FComponent: TComponent;
    FLinks: TRouteLinkCollection;
    procedure SetComponent(const Value: TComponent);
    procedure SetLinks(const Value: TRouteLinkCollection);
  public
    procedure Assign(Source: TPersistent); override;

    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  published
    property Component: TComponent read FComponent write SetComponent;
    property Links: TRouteLinkCollection read FLinks write SetLinks;
  end;

  // коллекция элементов маршрута
  TRouteCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRouteItem;
    procedure SetItem(Index: Integer; const Value: TRouteItem);
  public
    property Items[Index: Integer]: TRouteItem read GetItem write SetItem; default;
  end;

  // ссылка на элемент маршрута
  TRouteItemLink = class(TCollectionItem)
  private
    FRouteItem: TRouteItem;
    procedure SetRouteItem(const Value: TRouteItem);
  public
    procedure Assign(Source: TPersistent); override;
  published
    property RouteItem: TRouteItem read FRouteItem write SetRouteItem;
  end;

  // коллекция ссылок на элементы маршрута
  TRouteLinkCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRouteItemLink;
    procedure SetItem(Index: Integer; const Value: TRouteItemLink);
  public
    property Items[Index: Integer]: TRouteItemLink read GetItem write SetItem; default;
  end;


  //
  TaOPCRoute = class(TComponent)
  private
    FSteps: TRouteCollection;
    procedure SetSteps(const Value: TRouteCollection);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOnwer: TComponent); override;
    destructor Destroy; override;
  published
    property Steps: TRouteCollection read FSteps write SetSteps;
  end;

  TRouteItemClass = class of TRouteItem;



implementation

{ TRouteCollection }

function TRouteCollection.GetItem(Index: Integer): TRouteItem;
begin
  Result := TRouteItem(inherited Items[Index]);
end;

procedure TRouteCollection.SetItem(Index: Integer; const Value: TRouteItem);
begin
  inherited Items[Index] := Value;
end;

{ TRouteItem }

procedure TRouteItem.Assign(Source: TPersistent);
begin
  if Source is TRouteItem then
  begin
    FComponent := TRouteItem(Source).Component;
    FLinks := TRouteItem(Source).Links;
  end;

  inherited Assign(Source);
end;

constructor TRouteItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);

  FLinks := TRouteLinkCollection.Create(TRouteItemLink);
end;

destructor TRouteItem.Destroy;
begin
  FLinks.Free;
  inherited;
end;

procedure TRouteItem.SetComponent(const Value: TComponent);
begin
  FComponent := Value;
end;

procedure TRouteItem.SetLinks(const Value: TRouteLinkCollection);
begin
  FLinks.Assign(Value);
end;

{ TaOPCTagDictionary }

constructor TaOPCRoute.Create(AOnwer: TComponent);
begin
  inherited Create(AOnwer);
  FSteps := TRouteCollection.Create(TRouteItem);
end;

destructor TaOPCRoute.Destroy;
begin
  FSteps.Free;
  inherited Destroy;
end;

procedure TaOPCRoute.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i:integer;
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) then
  begin
    for i := 0 to FSteps.Count - 1 do
      if FSteps.Items[i].Component = AComponent then
        FSteps.Items[i].Component := nil;
  end;
end;

procedure TaOPCRoute.SetSteps(const Value: TRouteCollection);
begin
  FSteps.Assign(Value);
end;

{ TRouteItemLink }

procedure TRouteItemLink.Assign(Source: TPersistent);
begin
  if Source is TRouteItemLink then
    FRouteItem := TRouteItemLink(Source).RouteItem;

  inherited Assign(Source);
end;

procedure TRouteItemLink.SetRouteItem(const Value: TRouteItem);
begin
  FRouteItem := Value;
end;

{ TRouteLinkCollection }

function TRouteLinkCollection.GetItem(Index: Integer): TRouteItemLink;
begin
  Result := TRouteItemLink(inherited Items[Index]);
end;

procedure TRouteLinkCollection.SetItem(Index: Integer;
  const Value: TRouteItemLink);
begin
  inherited Items[Index] := Value;
end;

end.
