unit gbCob479;

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
   CodigoBanco = '479';
   NomeBanco = 'Bank Boston';

type

   TgbBanco479 = class(TPersistent)
   published
      function  GetNomeBanco   : string; {Retorna o nome do banco}
      function  GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string; {Retorna o conte�do da parte vari�vel do c�digo de barras}
      function  CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string; {Calcula o d�gito do NossoNumero, conforme crit�rios definidos por cada banco}
      procedure FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string); {Define o formato como alguns valores ser�o apresentados no boleto }
{$IFNDEF VER120}
      function  LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean; {L� o arquivo retorno recebido do banco}
      function  GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean; {Gerar arquivo remessa para enviar ao banco}
{$ENDIF}
   end;


implementation


function TgbBanco479.GetNomeBanco : string;
begin
   Result := NomeBanco;
end;

function TgbBanco479.CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ADigitoNossoNumero : string;
begin
   Result := '0';

   ANossoNumero := Formatar(ATitulo.NossoNumero,8,false,'0');
   ADigitoNossoNumero := Modulo11(ANossoNumero,9);

   Result := ADigitoNossoNumero;
end;

function TgbBanco479.GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ACodigoCedente: string;
begin

   {
    A primeira parte do c�digo de barras ser� calculada automaticamente.
    Ela � composta por:
    C�digo do banco (3 posi��es)
    C�digo da moeda = 9 (1 posi��o)
    D�gito do c�digo de barras (1 posi��o) - Ser� calculado e inclu�do pelo componente
    Fator de vencimento (4 posi��es) - Obrigat�rio a partir de 03/07/2000
    Valor do documento (10 posi��es) - Sem v�rgula decimal e com ZEROS � esquerda

    A segunda parte do c�digo de barras � um campo livre, que varia de acordo
    com o banco. Esse campo livre ser� calculado por esta fun��o (que voc� dever�
    alterar de acordo com as informa��es fornecidas pelo banco).
   }

   {Segunda parte do c�digo de barras - Campo livre - Varia de acordo com o banco}

   with ATitulo do
   begin
      ACodigoCedente := Formatar(Cedente.CodigoCedente,9,false,'0');
      ANossoNumero := Formatar(NossoNumero,15,false,'0');
   end;

   Result := ACodigoCedente + ANossoNumero + '9';
end;

procedure TgbBanco479.FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string);
begin
   with ATitulo do
   begin
      AAgenciaCodigoCedente := Cedente.ContaBancaria.CodigoAgencia + '/' + Cedente.CodigoCedente + '-' + Cedente.DigitoCodigoCedente;
      ANossoNumero := Formatar(NossoNumero,14,false,'0') + '-' + DigitoNossoNumero;
      ACarteira := Formatar(Carteira,3);
      AEspecieDocumento := '';
   end;
end;

{$IFNDEF VER120}

function TgbBanco479.GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Gera��o de arquivo remessa n�o est� dispon�vel para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

function TgbBanco479.LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Processamento de arquivo retorno n�o est� dispon�vel para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

{$ENDIF}

initialization
RegisterClass(TgbBanco479);

end.
