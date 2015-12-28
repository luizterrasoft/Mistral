unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

function Daruma_RSA_CarregaChavePrivada_Arquivo(Arquivo: String): Integer; stdcall; external 'Daruma32.dll';

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  linha1,linha2,linha3,linha4,linha5,linha6,linha7,linha8,linha9,linha10,linha11: String;
  linha12,linha13,linha14,linha15: String;
  arquivo: TextFile;
  path: String;
begin
  linha1  := '-----BEGIN RSA PRIVATE KEY-----';
  linha2  := 'MIICXAIBAAKBgQCjF4yuIqm9dGtcwnmipiqVjIexSGHCKK6zBXjUdzNYs7DyMtXJ';
  linha3  := 'ehvxzca8R/K2GDmBL5K8rkWwPWRbDOsMZp5idfCW+6N1Ho/b89kNQ2KUdwMK5a6a';
  linha4  := '8DiGum8acF0N8BL5IITsuiAcxa0I1v54VCG1Od14ZFIwjkODjTYlIzE93wIBJQKB';
  linha5  := 'gEaGuWAO/UsB6TzeecnLUK9fXUW+b3aOIgg5t7XSrmuL+X19xDtzEwDHr+K3VDMR';
  linha6  := 'ZPmYCBo9hetY0XN7NTXLgsIZwJQNWWd/kGvwTPM8G8YxDRa9QVsEPl9B/jahKXMO';
  linha7  := '7KuGTCogQArJ9ufp8HVY0riynJd2k7jFU/lrK8cS2lYtAkEA3/s1RoVEsnH8ODO7';
  linha8  := 'UsZK0mpkKQwEnjVu/Hhb2JocjnfVSlu90ltU6hxwV8mu67S9YCMY0EE6ezsZpcDs';
  linha9  := 'rtwlhQJBALpoC1Y/cRUf5h/zX3WcD1MqYib7c9gy23Va4EMTF08X1y+ZDX0wruiF';
  linha10 := 'oDI4ugsFrLywQVHbWsq2OR+f/Bi8MRMCQQDN0hVHuLuq5UiiWQz/9HwbTQIX4Yez';
  linha11 := '+b/u6yP3eNv4icrqYiQNaK7k94nUIR1HTCOkc0c76Omhq+4N741iaW6VAkEAlyPt';
  linha12 := 'hDNwcf4wNZTlnaEhLqy+SR7oTm5swAR+e5LwTfenjmBrzUoRRujiwO+5cLh+OCA0';
  linha13 := '9kMnBTnNc5Z5YCnimQJBAJHSy/IO4cOQgsNkcmikUxl2CD5NlolvQWRs/8/4Z1Kc';
  linha14 := 'ZPKV6NXCMD84UmLrkU8QsqHuJ1OQcNjwnYRpzXjP9YM=';
  linha15 := '-----END RSA PRIVATE KEY-----';

  path := ExtractFilePath(Application.ExeName);
  AssignFile(arquivo,(path+'mistral.key'));

  ReWrite(arquivo);
  WriteLn(arquivo,linha1);
  WriteLn(arquivo,linha2);
  WriteLn(arquivo,linha3);
  WriteLn(arquivo,linha4);
  WriteLn(arquivo,linha5);
  WriteLn(arquivo,linha6);
  WriteLn(arquivo,linha7);
  WriteLn(arquivo,linha8);
  WriteLn(arquivo,linha9);
  WriteLn(arquivo,linha10);
  WriteLn(arquivo,linha11);
  WriteLn(arquivo,linha12);
  WriteLn(arquivo,linha13);
  WriteLn(arquivo,linha14);
  WriteLn(arquivo,linha15);

  CloseFile(arquivo);

  try
    if (Daruma_RSA_CarregaChavePrivada_Arquivo(path+'mistral.key') = 1) then
      ShowMessage('Chave privada carregada com sucesso!')
    else
      ShowMessage('Erro no carregamento da chave privada!');
  finally
    DeleteFile((path+'mistral.key'));
  end;

  Close;

end;

end.
 