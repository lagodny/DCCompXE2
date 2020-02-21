unit aOPCIntercept;

{  This file implements an Indy intercept component that compresses a data
   stream using the open-source zlib compression library.  In order for this
   file to compile on Windows, the follow .obj files *must* be provided as
   delivered with this file:

   deflate.obj
   inflate.obj
   inftrees.obj
   trees.obj
   adler32.obj
   infblock.obj
   infcodes.obj
   infutil.obj
   inffast.obj

   On Linux, the shared-object file libz.so.1 *must* be available on the
   system.  Most modern Linux distributions include this file.

   Simply set the CompressionLevel property to a value between 1 and 9 to
   enable compressing of the data stream.  A setting of 0(zero) disables
   compression and the component is dormant.  The sender *and* received must
   have compression enabled in order to properly decompress the data stream.
   They do *not* have to use the same CompressionLevel as long as they are
   both set to a value between 1 and 9.

   Original Author: Allen Bauer

   This source file is submitted to the Indy project on behalf of Borland
   Sofware Corporation.  No warranties, express or implied are given with
   this source file.
}
interface

{$I IdCompilerDefines.inc}

uses
  Classes, IdIntercept, IdCompressionIntercept;

type
  TCryptType = (ctRSA, ctBlowfish);

  TaOPCIntercept = class(TIdCompressionIntercept)
  private
    FCryptKey: string;
    FCryptType: TCryptType;
    procedure SetCryptKey(const Value: string);
    procedure SetCryptType(const Value: TCryptType);
  public
    procedure Receive(ABuffer: TStream); override;
    procedure Send(ABuffer: TStream); override;

    procedure DoEncode(ABuffer: TStream);
    procedure DoDecode(ABuffer: TStream);
  published
    property Intercept;
    
    property CryptType: TCryptType read FCryptType write SetCryptType;
    property CryptKey: string read FCryptKey write SetCryptKey;
  end;

  TaOPCServerIntercept = class(TIdServerCompressionIntercept)
  end;


implementation


{ TaOPCIntercept }

procedure TaOPCIntercept.DoDecode(ABuffer: TStream);
begin
  case CryptType of
    ctRSA: ;
    ctBlowfish: ;
  end;
end;

procedure TaOPCIntercept.DoEncode(ABuffer: TStream);
begin
  case CryptType of
    ctRSA: ;
    ctBlowfish: ;
  end;
end;

procedure TaOPCIntercept.Receive(ABuffer: TStream);
begin
  if Assigned(Intercept) then
    Intercept.Receive(ABuffer);

  if Assigned(OnReceive) then
  begin
    OnReceive(Self, ABuffer);
    ABuffer.Position := 0;
  end
  else
  begin
    DoDecode(ABuffer);            // разкодируем
    inherited Receive(ABuffer);   // разжимаем
  end;
end;

procedure TaOPCIntercept.Send(ABuffer: TStream);
begin
  if Assigned(OnSend) then
  begin
    OnSend(Self, ABuffer);
    ABuffer.Position := 0;
  end
  else
  begin
    inherited Send(ABuffer); // сжимаем
    DoEncode(ABuffer);       // кодируем
  end;

  if Assigned(Intercept) then
    Intercept.Send(ABuffer);

end;

procedure TaOPCIntercept.SetCryptKey(const Value: string);
begin
  FCryptKey := Value;
end;

procedure TaOPCIntercept.SetCryptType(const Value: TCryptType);
begin
  FCryptType := Value;
end;

end.

