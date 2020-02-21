unit ucxGridProc;

interface

uses
  Forms, Vcl.Controls,
  cxTL,
  cxGrid, cxGridCustomView, cxEdit;

//function GetParentForm(aControl: TControl): TCustomForm;
function IsGridFocused(aGrid: TcxGrid): Boolean;

procedure LoadGridSettings(aGridView: TcxCustomGridView; aSection: string; aGridVer: Integer);
procedure SaveGridSettings(aGridView: TcxCustomGridView; aSection: string);

procedure LoadTLSettings(aTL: TcxCustomTreeList; aSection: string; aVer: Integer);
procedure SaveTLSettings(aTL: TcxCustomTreeList; aSection: string);


procedure RestoreDefGridSettings(aGridView: TcxCustomGridView; aSection: string);
procedure StoreDefGridSettings(aGridView: TcxCustomGridView; aSection: string);


implementation

uses
  uAppStorage;

const
  cGridVer = 'GridVer';
  cTLVer = 'TLVer';

//function GetParentForm(aControl: TControl): TCustomForm;
//begin
//  if not Assigned(aControl) then
//    Exit(nil)
//  else if (aControl is TCustomForm) then
//    Exit(TCustomForm(aControl))
//  else
//    Exit(GetParentForm(aControl.Parent);
//end;

function IsGridFocused(aGrid: TcxGrid): Boolean;
var
  AContainer: TcxCustomEdit;
begin
  Result := (Screen.ActiveControl is TcxGridSite) and (Screen.ActiveControl.Parent = aGrid);

  if not Result then
  begin
    AContainer := nil;
    if Screen.ActiveControl is TcxCustomEdit then
    begin
      AContainer := TcxCustomEdit(Screen.ActiveControl);
      Result := True;
    end
    else if (Screen.ActiveControl.Parent <> nil) and (Screen.ActiveControl.Parent is TcxCustomEdit) then
    begin
      AContainer := TcxCustomEdit(Screen.ActiveControl.Parent);
      Result := True;
    end;

    Result := Result and (AContainer.Parent is TcxGridSite) and (AContainer.Parent.Parent = aGrid);
  end;
end;


procedure RestoreDefGridSettings(aGridView: TcxCustomGridView; aSection: string);
begin
  aGridView.RestoreFromRegistry(aSection + '\Def\' + aGridView.Name);
end;

procedure StoreDefGridSettings(aGridView: TcxCustomGridView; aSection: string);
begin
  try
    aGridView.StoreToRegistry(aSection + '\Def\' + aGridView.Name, True, [gsoUseFilter]);
  except
  end;
end;


procedure LoadGridSettings(aGridView: TcxCustomGridView; aSection: string; aGridVer: Integer);
begin
  try
    // восстанавливаем настроки сетки, если версия не изменилась
    if AppStorage.ReadInteger(aSection + '\' + cGridVer, aGridView.Name, 0) = aGridVer then
      aGridView.RestoreFromRegistry(aSection + '\' + aGridView.Name)
    else
      AppStorage.WriteInteger(aSection + '\' + cGridVer, aGridView.Name, aGridVer);
  except
  end;
end;


procedure SaveGridSettings(aGridView: TcxCustomGridView; aSection: string);
begin
  try
    aGridView.StoreToRegistry(aSection + '\' + aGridView.Name, True, [gsoUseFilter]);
  except
  end;
end;

procedure LoadTLSettings(aTL: TcxCustomTreeList; aSection: string; aVer: Integer);
begin
  try
    // восстанавливаем, если версия не изменилась
    if AppStorage.ReadInteger(aSection + '\' + cTLVer, aTL.Name, 0) = aVer then
      aTL.RestoreFromRegistry(aSection + '\' + aTL.Name)
    else
      AppStorage.WriteInteger(aSection + '\' + cTLVer, aTL.Name, aVer);
  except
  end;
end;

procedure SaveTLSettings(aTL: TcxCustomTreeList; aSection: string);
begin
  try
    aTL.StoreToRegistry(aSection + '\' + aTL.Name, True);
  except
  end;
end;




end.
