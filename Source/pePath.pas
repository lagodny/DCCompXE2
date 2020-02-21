unit pePath;


interface

{$I OPC.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DesignEditors, DesignIntf;

type
  TPathProperty = class (TStringProperty)
  public
    procedure GetValues(Proc: TGetStrProc);override;
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

uses PathPeForm,
  uOPCFrame,
  aCustomOPCSource, aOPCSource, aOPCProvider,
  aOPCLabel,aOPCProgressBar,aOPCGauge,aOPCDataObject,
//  uTankFrame,
//  uMonometr,
//  uTeploTable,
  uDCObjects, aOPCCollection,
  aOPCListBox,
  {.$IFDEF TEECHART}
  aOPCLineSeries,
  aOPCChart,
  {.$ENDIF}
  aOPCTagDictionary,
  ComCtrls;

function FullName(aNode:TTreeNode):string;
begin
  if Assigned(aNode) then
    if Assigned(aNode.Parent) then
      Result := FullName(aNode.Parent)+'.'+aNode.Text
    else
      Result := aNode.Text;
end;

{ TPathProperty }

procedure TPathProperty.Edit;
var
  Comp:TObject;
  CustomOPCSource:TaCustomOPCSource;
  OPCSource:taOPCSource;
  OPCObject:TaCustomOPCDataObject;
  Data  :TStringList;
  StairsCase:integer;
  sStairs:string;
  ObjectID:integer;
  aDataLink: TaCustomDataLink;
  //i: integer;
begin
  CustomOPCSource := nil;
  OPCObject       := nil;
  aDataLink       := nil;
  ObjectID        := 0;
  TreeForm := TTreeForm.Create(Application);
  try
    Comp:=GetComponent(0);
    if Comp is TaOPCProvider then
      CustomOPCSource:=TaOPCProvider(Comp).OPCSource
    else if Comp is TaOPCProgressBar then
      CustomOPCSource:=TaOPCProgressBar(Comp).OPCSource
    {$IFDEF TEECHART}
    else if Comp is TaOPCLineSeries then
      CustomOPCSource:=TaOPCLineSeries(Comp).OPCSource
    {$ENDIF}
    else if Comp is TaCustomOPCDataObject then
    begin
      CustomOPCSource:=TaCustomOPCDataObject(Comp).OPCSource;
      aDataLink := TaCustomOPCDataObject(Comp).DataLink;
    end
    else if Comp is TaOPCFrame then
    begin
      CustomOPCSource := TaOPCFrame(Comp).OPCSource;
      if UpperCase(GetName) = 'ID' then
        ObjectID := StrToIntDef(TaOPCFrame(Comp).ID,0)
      else
        ObjectID := 0;
    end
    else if Comp is TDataLinkCollectionItem then
      CustomOPCSource:=TDataLinkCollectionItem(Comp).DataLink.OPCSource
    else if Comp is TTagCollectionItem then
      CustomOPCSource:=TTagCollectionItem(Comp).OPCSource
    else
      begin
        ShowMessage('Не удалось определить класс компонента');
        exit;
      end;


    if CustomOPCSource=nil then
    begin
      ShowMessage('Источник данных не выбран');
      exit;
    end;
    if CustomOPCSource is TaOPCSource then
      OPCSource:=TaOPCSource(CustomOPCSource)
    else
      Exit;

    OPCSource.GetNameSpace(IntToStr(ObjectID));
    TreeForm.LoadTree(TreeForm.SensorsTree.Items,OPCSource.FNameSpaceCash,Value);

    if TreeForm.ShowModal = mrOk then
    begin
      if TreeForm.SensorsTree.Selected<>nil then
      begin
        Data := TStringList(TreeForm.SensorsTree.Selected.Data);
        SetValue(Data.Strings[0]); //id
        if (OPCObject <> nil) and (Data.Strings[1] = '0') then
        begin
          sStairs := Data.Strings[5]; //stairs
          StairsCase := StrToIntDef(sStairs,0);
          case StairsCase of
            0:OPCObject.StairsOptions := [soIncrease,soDecrease];
            1:OPCObject.StairsOptions := [];
            2:OPCObject.StairsOptions := [soIncrease];
            3:OPCObject.StairsOptions := [soDecrease];
          end;
          OPCObject.Hint := FullName(TreeForm.SensorsTree.Selected); // наименование
          if OPCObject is TaOPCLabel then
            TaOPCLabel(OPCObject).DisplayFormat := Data.Strings[2]; //DisplayFormat
        end
        else if (aDataLink <> nil) then
        begin
          Data := TStringList(TreeForm.SensorsTree.Selected.Data);
          if (Data.Strings[1] = '0') then
          begin
            SetValue(Data.Strings[0]); //id
            sStairs := Data.Strings[5]; //stairs
            StairsCase := StrToIntDef(sStairs,0);
            case StairsCase of
              0:aDataLink.StairsOptions := [soIncrease,soDecrease];
              1:aDataLink.StairsOptions := [];
              2:aDataLink.StairsOptions := [soIncrease];
              3:aDataLink.StairsOptions := [soDecrease];
            end;
            //OPCObject.Hint := FullName(TreeForm.SensorsTree.Selected); // наименование
          end
        end
        else if Comp is TDataLinkCollectionItem then
          TDataLinkCollectionItem(Comp).Name := TreeForm.SensorsTree.Selected.Text
        {$IFDEF TEECHART}
        else if Comp is TaOPCLineSeries then
        begin
          TaOPCLineSeries(Comp).Title := TreeForm.SensorsTree.Selected.Text;
          if Data.Strings[1] = '0' then
            TaOPCLineSeries(Comp).DisplayFormat := Data.Strings[2];
        end
        {$ENDIF}
//        else if Comp is TTeploTable then
//          TTeploTable(Comp).TeploName := TreeForm.SensorsTree.Selected.Text;
      end;
    end;
  finally
    FreeAndNil(TreeForm);
  end;
end;

function TPathProperty.GetAttributes: TPropertyAttributes;
begin
  Result:=[paDialog,paMultiSelect];
end;

procedure TPathProperty.GetValues(Proc: TGetStrProc);
begin
  inherited;

end;

procedure Register;
begin
  RegisterPropertyEditor (TypeInfo(TPhysID),
    nil, 'PhysID', TPathProperty);
end;



end.
