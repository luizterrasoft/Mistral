unit gbCob237;

interface

uses
   classes, SysUtils, gbCobranca
   {$IFDEF VER140}
      , MaskUtils, contnrs
   {$ELSE}
      {$IFDEF VER130}
         , Mask, contnrs
      {$ELSE}
         , Mask
      {$ENDIF}
   {$ENDIF}
   ;

const
   CodigoBanco = '237';
   NomeBanco = 'BRADESCO';

type

   TgbBanco237 = class(TPersistent)
   published
      function  GetNomeBanco   : string; {Retorna o nome do banco}
      function  GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string; {Retorna o conteúdo da parte variável do código de barras}
      function  CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string; {Calcula o dígito do NossoNumero, conforme critérios definidos por cada banco}
      procedure FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string); {Define o formato como alguns valores serão apresentados no boleto }
{$IFNDEF VER120}
      function  LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean; {Lê o arquivo retorno recebido do banco}
      function  GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean; {Gerar arquivo remessa para enviar ao banco}
{$ENDIF}
   end;


implementation


function TgbBanco237.GetNomeBanco : string;
begin
   Result := NomeBanco;
end;

function TgbBanco237.CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string;
var
   ACarteira,
   ANossoNumero,
   ADigitoNossoNumero : string;
begin
   Result := '0';

   with ATitulo do
   begin
      ACarteira := Formatar(Carteira,2,false,'0');
      ANossoNumero := Formatar(NossoNumero,11,false,'0');
      ADigitoNossoNumero := Modulo11(ACarteira + ANossoNumero,7,true);
   end;
   if StrToInt(ADigitoNossoNumero) = 1 then
      ADigitoNossoNumero := 'P'
   else if StrToInt(ADigitoNossoNumero) > 1 then
      ADigitoNossoNumero := IntToStr(11 - StrToInt(ADigitoNossoNumero));

   Result := ADigitoNossoNumero;
end;

function TgbBanco237.GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string;
var
   AAnoAtual,
   ACarteira,
   ANossoNumero,
   ACodigoAgencia,
   ANumeroConta: string;
begin

   {
    A primeira parte do código de barras será calculada automaticamente.
    Ela é composta por:
    Código do banco (3 posições)
    Código da moeda = 9 (1 posição)
    Dígito do código de barras (1 posição) - Será calculado e incluído pelo componente
    Fator de vencimento (4 posições) - Obrigatório a partir de 03/07/2000
    Valor do documento (10 posições) - Sem vírgula decimal e com ZEROS à esquerda

    A segunda parte do código de barras é um campo livre, que varia de acordo
    com o banco. Esse campo livre será calculado por esta função (que você deverá
    alterar de acordo com as informações fornecidas pelo banco).
   }

   {Segunda parte do código de barras - Campo livre - Varia de acordo com o banco}

   with ATitulo do
   begin
      ACarteira := Formatar(Carteira,2,false,'0');
      AAnoAtual := FormatDateTime('yy',Now());
      ANossoNumero := Formatar(NossoNumero,9,false,'0');
      ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
      ANumeroConta := Formatar(Cedente.ContaBancaria.NumeroConta,7,false,'0');
   end;

   Result := ACodigoAgencia + ACarteira + AAnoAtual + ANossoNumero + ANumeroConta + '0';
end;

procedure TgbBanco237.FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string);
begin
   with ATitulo do
   begin
      AAgenciaCodigoCedente := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0') + '/' + Formatar(Cedente.CodigoCedente,7,false,'0') + '-' + Cedente.DigitoCodigoCedente;
      ANossoNumero := Formatar(Carteira,3,false,'0') + '/' + Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0') + '/' + Formatar(NossoNumero,7,false,'0') + '-' + DigitoNossoNumero;
      ACarteira := Formatar(Carteira,3,false,'0');
      AEspecieDocumento := '';
   end;
end;

{$IFNDEF VER120}

function  TgbBanco237.GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Geração de arquivo remessa não está disponível para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

function TgbBanco237.LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Processamento de arquivo retorno não está disponível para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

{$ENDIF}

initialization
RegisterClass(TgbBanco237);

end.
