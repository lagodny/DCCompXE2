unit aDCReg;

interface

uses
  Classes, DesignEditors, DesignIntf,
  PLDesign;

type
  {  TaOPCImageListEditor  }
  TaOPCImageListEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TaOPCProviderListEditor = class(TComponentEditor)
  public
    function GetPLDesignerClass: TProvidersDesignerClass;

    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


procedure Register;

implementation

uses
  Vcl.Dialogs, Vcl.Graphics, System.SysUtils,
  aOPCDataObject,

  aDCCommandHandler,
  aOPCTCPSource, aOPCTCPSource_V30, aOPCTCPSource_V31, aOPCTCPSource_V32, aOPCTCPSource_V33,
  aOPCProvider, aOPCCinema, uCinemaControl,

  aOPCConnectionList, aOPCAuthorization,

  aOPCLookupList,

  aOPCLabel,
  aOPCShape, aOPCGauge, aOPCProgressBar, aOPCListBox,
  aOPCStateLine,
  aOPCTagDictionary,
  aOPCImage, aOPCImageList,
  aOPCImage2In, aOPCImage3In, aOPCImage4In, aOPCImage5In,
  aOPCChart
  , aOPCVerUpdater
  , aOPCPanel
  //, JLLabel
  ;

procedure Register;
begin
  // ���������� ������
  RegisterComponents('DC', [TaDCCommandHandlers]);

  // ������ �����������
  RegisterComponents('DC', [TaOPCConnectionList]);

  // ��������� ������
  RegisterComponents('DC', [TaOPCTCPSource]);
  RegisterComponents('DC', [TaOPCTCPSource_V30]);
  RegisterComponents('DC', [TaOPCTCPSource_V31]);
  RegisterComponents('DC', [TaOPCTCPSource_V32]);
  RegisterComponents('DC', [TaOPCTCPSource_V33]);

  // ����������� �������
  RegisterComponents('DC', [TaOPCCinema]);
  RegisterComponents('DC', [TaOPCCinemaControl]);

  // �����������
  RegisterComponents('DC', [TaOPCAuthorization]);
  // ����������
  RegisterComponents('DC', [TaOPCLookupList]);

  // ������������ ������ � �����

  // ���������
  RegisterComponents('DC', [TaOPCProvider]);
  RegisterClass(TaOPCProviderItem);
  RegisterNoIcon([TaOPCProviderItem]);

  RegisterComponents('DC', [TaOPCTagDictionary]);
  RegisterComponents('DC', [TaOPCProviderList]);

  // ���������� ������������
  RegisterComponents('DC', [TaOPCLabel]);
  RegisterComponents('DC', [TaOPCBlinkLabel]);
  RegisterComponents('DC', [TaOPCColorLabel]);

  RegisterComponents('DC', [TaOPCShape]);
  RegisterComponents('DC', [TaOPCGauge]);
  RegisterComponents('DC', [TaOPCProgressBar]);
  RegisterComponents('DC', [TaOPCListBox]);

  RegisterComponents('DC', [TaOPCStateLine]);

  RegisterComponents('DC', [TaOPCImage]);
  RegisterComponents('DC', [TaOPCImage2In]);
  RegisterComponents('DC', [TaOPCImage3In]);
  RegisterComponents('DC', [TaOPCImage4In]);
  RegisterComponents('DC', [TaOPCImage5In]);

  RegisterComponents('DC', [TaOPCImageList]);

  RegisterComponents('DC', [TaOPCPanel]);

  RegisterComponents('DC', [TaOPCChart]);
  RegisterComponents('DC', [TaOPCVerUpdater]);

  //RegisterComponents('Grafik', [TRotateLabel]);



  // ��������� �����������
  RegisterComponentEditor(TaOPCImageList, TaOPCImageListEditor);
  RegisterComponentEditor(TaOPCProviderList, TaOPCProviderListEditor);

  // ��������� ������� DC
  RegisterPropertiesInCategory('DC', TaCustomOPCDataObject,
    ['PhysID', 'Value', 'ErrorCode', 'ErrorString', 'LookupList', 'StairsOptions','*OPCSource']);


end;


const
  SOpen = '&�������...';
  SSave = '&���������..';
  SSaveImages = '��������� �������...';

  SplEdit = '�������������...';

{  TaOPCImageListEditor  }

procedure TaOPCImageListEditor.ExecuteVerb(Index: Integer);
var
  OpenDialog: TOpenDialog;
  SaveDialog: TSaveDialog;
  aItem: TPictureCollectionItem;
  i: Integer;
begin
  case Index of
    0: begin
         OpenDialog := TOpenDialog.Create(nil);
         try
           OpenDialog.Filter := GraphicFilter(TGraphic);
           OpenDialog.Filter := OpenDialog.Filter +
             '|OPC Graphic files (*.opg)|*.OPG';
           OpenDialog.Options := [ofPathMustExist, ofFileMustExist, ofAllowMultiSelect];
           if OpenDialog.Execute then
           begin
             TaOPCImageList(Component).BeginUpdate;
             try
               if not AnsiSameText(ExtractFileExt(OpenDialog.FileName),'.opg') then
               begin
                 for i:=0 to OpenDialog.Files.Count-1 do
                   with TPictureCollectionItem.Create(TaOPCImageList(Component).Items) do
                   begin
                     try
                       Picture.LoadFromFile(OpenDialog.Files[i]);
                       if Picture.Graphic is TBitmap then
                         TransparentColor := TBitmap(Picture.Graphic).TransparentColor;

                       Name := ExtractFileName(OpenDialog.Files[i]);
                     except
                       Free;
                       raise;
                     end;
                   end;
               end else
                 TaOPCImageList(Component).Items.LoadFromFile(OpenDialog.FileName);
             finally
               TaOPCImageList(Component).EndUpdate;
             end;
             Designer.Modified;
           end;
         finally
           OpenDialog.Free;
         end;
       end;
    1: begin
         SaveDialog := TSaveDialog.Create(nil);
         try
           SaveDialog.DefaultExt := '.opg';
           SaveDialog.Filter := 'OPC Graphic files (*.opg)|*.OPG';
           SaveDialog.Options := [ofOverwritePrompt, ofPathMustExist];
           if SaveDialog.Execute then
             TaOPCImageList(Component).Items.SaveToFile(SaveDialog.FileName);
         finally
           SaveDialog.Free;
         end;
       end;
      2: begin
         SaveDialog := TSaveDialog.Create(nil);
         try
           //SaveDialog.DefaultExt := '.opg';
           //SaveDialog.Filter := 'OPC Graphic files (*.opg)|*.OPG';
           //SaveDialog.Options := [ofPathMustExist];
           if SaveDialog.Execute then
             for i := 0 to TaOPCImageList(Component).Items.Count - 1 do
             begin
              aItem := TPictureCollectionItem(TaOPCImageList(Component).Items[i]);
              if Assigned(aItem.Picture) and (aItem.Name <> '') then
                aItem.Picture.SaveToFile(
                  ExtractFilePath(SaveDialog.FileName)+'\'+aItem.Name);
             end;

             TaOPCImageList(Component).Items.SaveToFile(SaveDialog.FileName);
         finally
           SaveDialog.Free;
         end;
       end;
  end;
end;

function TaOPCImageListEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := SOpen;
    1: Result := SSave;
    2: Result := SSaveImages;
  end;
end;

function TaOPCImageListEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

{ TaOPCProviderListEditor }

procedure TaOPCProviderListEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: // ��������� ������ �����������
    begin
      ShowProvidersEditor(Designer,TaOPCProviderList(Component),GetPLDesignerClass);
    end;
  end;
end;

function TaOPCProviderListEditor.GetPLDesignerClass: TProvidersDesignerClass;
begin
  Result := TProvidersDesigner;
end;

function TaOPCProviderListEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := SplEdit;
  end;

end;

function TaOPCProviderListEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;



end.
