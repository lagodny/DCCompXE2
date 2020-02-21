{*******************************************************}
{                                                       }
{     OPC Sinoptic Service  V 4.0                       }
{     Copyright (c) 2001-2011 by Alex A. Lagodny        }
{                                                       }
{*******************************************************}
{
  перехватчик реализующий сжатие и шифрование данных
}

unit uOPCIntercept;

interface

uses
  Classes, SysUtils,
  IdIntercept, IdCompressionIntercept, IdBlockCipherIntercept,
  DCPcrypt2, DCPblowfish, DCPsha1;

type

  TOPCIntercept = class(TIdConnectionIntercept)
  private
    FCrypter: TDCP_blockcipher;
    FBlockCipherIntercept: TIdBlockCipherIntercept;
    FCompressionIntercept: TIdCompressionIntercept;

    FCryptKey: string;
    procedure SetCryptKey(const Value: string);

    function GetCompressionLevel: TCompressionLevel;
    procedure SetCompressionLevel(const Value: TCompressionLevel);
  protected
    procedure BlockCipherInterceptSend(ASender: TIdBlockCipherIntercept; ASrcData, ADstData: Pointer);
    procedure BlockCipherInterceptReceive(ASender: TIdBlockCipherIntercept; ASrcData, ADstData: Pointer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Receive(ABuffer: TStream); override;
    procedure Send(ABuffer: TStream); override;
  published
    property Intercept;

    property CompressionLevel: TCompressionLevel read GetCompressionLevel write SetCompressionLevel;

    property CryptKey: string read FCryptKey write SetCryptKey;

  end;

implementation

{ TOPCIntercept }

procedure TOPCIntercept.BlockCipherInterceptReceive(ASender: TIdBlockCipherIntercept; ASrcData, ADstData: Pointer);

var
  LCount: Byte;
  LCountPos: Byte;
begin
{.$R-}
  LCountPos := FBlockCipherIntercept.BlockSize - 1;
  //LCount := TBytes(ASrcData)[LCountPos];
  LCount := PByte(longword(ASrcData)+LCountPos)^;

  FCrypter.Reset;
  FCrypter.Decrypt(ASrcData^, ADstData^, LCount);
  //TBytes(ADstData)[LCountPos] := LCount;
  PByte(longword(ADstData)+LCountPos)^ := LCount;
{.$R+}
end;

procedure TOPCIntercept.BlockCipherInterceptSend(ASender: TIdBlockCipherIntercept; ASrcData, ADstData: Pointer);
var
  LCount: Byte;
  LCountPos: Byte;
begin
{.$R-}
  LCountPos := FBlockCipherIntercept.BlockSize - 1;
  //LCount := TBytes(ASrcData)[LCountPos];
  LCount := PByte(longword(ASrcData)+LCountPos)^;

  FCrypter.Reset;
  FCrypter.Encrypt(ASrcData^, ADstData^, LCount);
  //TBytes(ADstData)[LCountPos] := LCount;
  PByte(longword(ADstData)+LCountPos)^ := LCount;
{.$R+}
end;

constructor TOPCIntercept.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TOPCIntercept.Destroy;
begin
  FreeAndNil(FCompressionIntercept);
  FreeAndNil(FBlockCipherIntercept);
  FreeAndNil(FCrypter);
  inherited Destroy;
end;

function TOPCIntercept.GetCompressionLevel: TCompressionLevel;
begin
  if Assigned(FCompressionIntercept) then
    Result := FCompressionIntercept.CompressionLevel
  else
    Result := 0;
end;

procedure TOPCIntercept.Receive(ABuffer: TStream);
begin
  inherited Receive(ABuffer);
  // при приеме
  // сначала расшифровываем
  if Assigned(FBlockCipherIntercept) then
  begin
    ABuffer.Position := 0;
    FBlockCipherIntercept.Receive(ABuffer);
  end;
  // а потом разжимаем
  if Assigned(FCompressionIntercept) then
  begin
    ABuffer.Position := 0;
    FCompressionIntercept.Receive(ABuffer);
  end;
end;

procedure TOPCIntercept.Send(ABuffer: TStream);
begin
  inherited Send(ABuffer);
  // при посылке
  // сначала сжимаем
  if Assigned(FCompressionIntercept) then
  begin
    ABuffer.Position := 0;
    FCompressionIntercept.Send(ABuffer);
  end;
  // а потом шифруем
  if Assigned(FBlockCipherIntercept) then
  begin
    ABuffer.Position := 0;
    FBlockCipherIntercept.Send(ABuffer);
  end;

end;

procedure TOPCIntercept.SetCompressionLevel(const Value: TCompressionLevel);
begin
  if Value = CompressionLevel then
    Exit;

  FreeAndNil(FCompressionIntercept);
  if Value = 0 then
    Exit;

  FCompressionIntercept := TIdCompressionIntercept.Create(nil);
  FCompressionIntercept.CompressionLevel := Value;
end;

procedure TOPCIntercept.SetCryptKey(const Value: string);
begin
  if FCryptKey = Value then
    Exit;

  FreeAndNil(FBlockCipherIntercept);
  FreeAndNil(FCrypter);

  FCryptKey := Value;
  if Length(FCryptKey) = 0 then
    Exit;

  FCrypter := TDCP_blowfish.Create(nil);
  FCrypter.InitStr(FCryptKey, TDCP_sha1);

  FBlockCipherIntercept := TIdBlockCipherIntercept.Create(nil);
  FBlockCipherIntercept.BlockSize := (FCrypter.BlockSize div 8) + 1;
  FBlockCipherIntercept.OnReceive := BlockCipherInterceptReceive;
  FBlockCipherIntercept.OnSend := BlockCipherInterceptSend;

end;

end.
