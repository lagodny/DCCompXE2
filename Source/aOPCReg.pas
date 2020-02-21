{*******************************************************}
{                                                       }
{     Copyright (c) 2001-2006 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}

unit aOPCReg;

interface

{$I OPC.inc}

uses Windows, SysUtils, Classes,DesignEditors,DesignIntf, Forms,
      Dialogs,Graphics,
      PLDesign
      {$IFDEF GIF}
      ,GifImage
      {$ENDIF}
      ;

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

{$R aOPCImg.res}

uses aOPCAuthorization,
  //aOPCDCOMSource,
  aOPCDataObject,
  aOPCTCPSource, aOPCTCPSource_V30, aOPCTCPSource_V31,
  aOPCGauge, 
  aOPCLabel, aOPCLookupList, aOPCPipe, aOPCProgressBar, aOPCProvider,
  aOpcPump, aOPCSwitch, aOPCValve, aOPCFlowTransmitter,
  aOPCImage, aOPCImage2In, aOPCImage3In, aOPCImage4In, aOPCImage5In,
  aOPCGifImage,
  aOPCImageList, aOPCConnectionList,
  aOPCCinema,uCinemaControl,
  aOPCListBox, aOPCShape, aOPCPanel,
  aOPCTagDictionary,
  //aOPCRoute,
  {$IFDEF TEECHART}
  aOPCChart,
  {$ENDIF}

  aOPCStateLine,
  SizeControl
  //, uOPCIntercept
  , aOPCCommandHandler
  , aOPCVerUpdater

  ;

const
  SOpen = '&Открыть...';
  SSave = '&Сохранить..';
  SSaveImages = 'Сохранить рисунки...';

  SplEdit = 'Редактировать...';

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
                       {$IFDEF GIF}
//                       if Picture.Graphic is TGifImage then
                         //ShowMessage(Picture.Graphic.ClassName);
                       {$ENDIF}

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


procedure Register;
begin
  RegisterComponents('OPC', [TaOPCTCPSource]);
  RegisterComponents('OPC', [TaOPCTCPSource_V30]);
  RegisterComponents('OPC', [TaOPCTCPSource_V31]);

  RegisterComponents('OPC', [TaOPCProvider]);
  RegisterClass(TaOPCProviderItem);
  //RegisterComponents('OPC', [TaOPCProviderItem]);
  RegisterComponents('OPC', [TaOPCCinema]);
  RegisterComponents('OPC', [TaOPCCinemaControl]);
  RegisterComponents('OPC', [TaOPCAuthorization]);
  //RegisterComponents('OPC', [TaOPCDCOMSource]);

  RegisterComponents('OPC', [TaOPCLabel]);
  RegisterComponents('OPC', [TaOPCBlinkLabel]);
  RegisterComponents('OPC', [TaOPCLookupList]);

  RegisterComponents('OPC', [TaOPCPipe]);
  RegisterComponents('OPC', [TaOPCValve]);
  RegisterComponents('OPC', [TaOPCPump]);
  RegisterComponents('OPC', [TaOPCSwitch]);
  RegisterComponents('OPC', [TaOPCFlowTransmitter]);

  RegisterComponents('OPC', [TaOPCImage]);
  RegisterComponents('OPC', [TaOPCImage2In]);
  RegisterComponents('OPC', [TaOPCImage3In]);
  RegisterComponents('OPC', [TaOPCImage4In]);
  RegisterComponents('OPC', [TaOPCImage5In]);
  RegisterComponents('OPC', [TaOPCGifImage]);

  RegisterComponents('OPC', [TaOPCImageList]);
  RegisterComponents('OPC', [TaOPCConnectionList]);

  //RegisterComponents('OPC', [TG32GifAnimator]);
  //RegisterComponents('OPC', [TaOPCGifAnimator]);
  RegisterComponents('OPC', [TaOPCGauge]);
  RegisterComponents('OPC', [TaOPCProgressBar]);


  RegisterComponents('OPC', [TaOPCListBox]);

  RegisterComponents('OPC', [TaOPCShape]);
  RegisterComponents('OPC', [TaOPCPanel]);

  RegisterComponents('OPC', [TaOPCTagDictionary]);
  RegisterComponents('OPC', [TaOPCProviderList]);

  //RegisterComponents('OPC', [TaOPCRoute]);

  {$IFDEF TEECHART}
  RegisterComponents('OPC', [TaOPCChart]);
  {$ENDIF}

  RegisterComponents('OPC', [TaOPCStateLine]);

  RegisterComponents('OPC', [TaOPCCommandHandlers]);
  //RegisterComponents('OPC', [TOPCIntercept]);

  RegisterComponents('OPC', [TSizeCtrl]);

  RegisterComponentEditor(TaOPCImageList, TaOPCImageListEditor);
  RegisterComponentEditor(TaOPCProviderList, TaOPCProviderListEditor);

  RegisterNoIcon([TaOPCProviderItem]);

  RegisterPropertiesInCategory('OPC', TaCustomOPCDataObject,
    ['PhysID', 'Value', 'ErrorCode', 'ErrorString', 'LookupList',
     'StairsOptions','*OPCSource']);


  RegisterComponents('OPC', [TaOPCVerUpdater]);
end;

{ TaOPCProviderListEditor }

procedure TaOPCProviderListEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: // настройка списка провейдеров
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
