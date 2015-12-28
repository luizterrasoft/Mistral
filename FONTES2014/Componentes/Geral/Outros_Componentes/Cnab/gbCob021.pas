unit gbCob021;

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
   CodigoBanco = '021';
   NomeBanco = 'BANESTES';

type

   TgbBanco021 = class(TPersistent)
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

function DigitosChaveASBACE(ChaveASBACESemDigito : string) : string;
{Calcula os 2 dígitos usados na CHAVE ASBACE - Código usado por bancos estaduais}
var
   Digito1, Digito2 : integer;

   function CalcularDigito1(ChaveASBACESemDigito : string) : integer;
   {
    Calcula o primeiro dígito.
    O cálculo é parecido com o da rotina Modulo10. Porém, não faz diferença o
    número de dígitos de cada subproduto.
    Se o resultado da operação for 0 (ZERO) o dígito será 0 (ZERO). Caso contrário,
    o dígito será igual a 10 - Resultado.
   }
   var
      Auxiliar, Soma, Contador, Peso, Digito1 : integer;
   begin
      Soma := 0;
      Peso := 2;
      for Contador := Length(ChaveASBACESemDigito) downto 1 do
      begin
         Auxiliar := (StrToInt(ChaveASBACESemDigito[Contador]) * Peso);
         if Auxiliar > 9 then
            Auxiliar := Auxiliar - 9;
         Soma := Soma + Auxiliar;
         if Peso = 1 then
            Peso := 2
         else
            Peso := 1;
      end;

      Digito1 := Soma mod 10;
      if (Digito1 = 0) then
         Result := Digito1
      else
         Result := 10 - Digito1;
   end;

   function CalcularDigito2(ChaveASBACESemDigito : string; var Digito1 : integer) : integer;
   {Calcula o segundo dígito}
   var
      Digito2 : integer;
      ChaveASBACEComDigito1 : string;
   begin
      ChaveASBACEComDigito1 := ChaveASBACESemDigito + IntToStr(Digito1);
      Digito2 := StrToInt(Modulo11(ChaveASBACEComDigito1,7,true));
      {Se dígito2 = 1, deve-se incrementar o dígito1 e recalcular o dígito2}
      if Digito2 = 1 then
      begin
         Digito1 := Digito1 + 1;
         {Se, após incrementar o dígito1, ele ficar maior que 9, deve-se
          substituí-lo por 0}
         if Digito1 > 9 then
            Digito1 := 0;
         Digito2 := CalcularDigito2(ChaveASBACESemDigito, Digito1);
      end
      else if Digito2 > 1 then
      begin
         Digito2 := 11 - Digito2;
      end;

      Result := Digito2;
   end;

begin
   Digito1 := CalcularDigito1(ChaveASBACESemDigito);
   Digito2 := CalcularDigito2(ChaveASBACESemDigito, Digito1);

   Result := IntToStr(Digito1) + IntToStr(Digito2);
end;


function TgbBanco021.GetNomeBanco : string;
begin
   Result := NomeBanco;
end;

function TgbBanco021.CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ADigitoNossoNumero : string;
begin
   Result := '0';

   ANossoNumero := Formatar(ATitulo.NossoNumero,8,false,'0');
   ADigitoNossoNumero := Modulo11(ANossoNumero,9);
   ADigitoNossoNumero := Modulo11(ANossoNumero + ADigitoNossoNumero,10);

   Result := ADigitoNossoNumero;
end;

function TgbBanco021.GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string;
var
   ANossoNumero,
   ANumeroConta,
   ACampoLivre: string;
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
      ANossoNumero := Formatar(NossoNumero,8,false,'0');
      ANumeroConta := Formatar(Cedente.ContaBancaria.NumeroConta,11,false,'0');
   end;
   ACampoLivre := ANossoNumero + ANumeroConta + '2' + '021';

   Result := ACampoLivre + DigitosChaveASBACE(ACampoLivre);
end;

procedure TgbBanco021.FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string);
begin
   with ATitulo do
   begin
      AAgenciaCodigoCedente := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0') + '/' + Formatar(Cedente.CodigoCedente,11,false,'0') + '-' + Cedente.DigitoCodigoCedente;
      ANossoNumero := Formatar(NossoNumero,8,false,'0') + '-' + DigitoNossoNumero;
      ACarteira := Formatar(Carteira,1,false,'0');
      AEspecieDocumento := '';
   end;
end;

{$IFNDEF VER120}

function  TgbBanco021.GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Geração de arquivo remessa não está disponível para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

function TgbBanco021.LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
begin
   Result := FALSE;
   Raise Exception.CreateFmt('Processamento de arquivo retorno não está disponível para o banco %s - %s',[CodigoBanco, NomeBanco]);
end;

{$ENDIF}

initialization
RegisterClass(TgbBanco021);

end.
