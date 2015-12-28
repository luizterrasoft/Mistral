unit gbCob341;

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
   CodigoBanco = '341';
   NomeBanco = 'Banco Itaú S.A.';

type

   TgbBanco341 = class(TPersistent)
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


function TgbBanco341.GetNomeBanco : string;
begin
   Result := NomeBanco;
end;

function TgbBanco341.CalcularDigitoNossoNumero(ATitulo: TgbTitulo) : string;
var
   ACodigoAgencia,
   ANumeroConta,
   ACarteira,
   ANossoNumero,
   ADigitoNossoNumero : string;
begin
   Result := '0';

   with ATitulo do
   begin
      ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
      ANumeroConta := Formatar(Cedente.ContaBancaria.NumeroConta,5,false,'0');
      ACarteira := Formatar(Carteira,3,false,'0');
      ANossoNumero := Formatar(NossoNumero,8,false,'0');
   end;

   ADigitoNossoNumero := Modulo10(ACodigoAgencia + ANumeroConta + ACarteira + ANossoNumero);

   Result := ADigitoNossoNumero;
end;

function TgbBanco341.GetCampoLivreCodigoBarra(ATitulo: TgbTitulo) : string;
var
   ACarteira,
   ANossoNumero,
   ADigitoNossoNumero,
   ACodigoAgencia,
   ANumeroConta,
   ADigitoAgenciaConta: string;
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
      ACarteira := Formatar(Carteira,3,false,'0');
      ACodigoAgencia := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
      ANossoNumero := Formatar(NossoNumero,8,false,'0');
      ANumeroConta := Formatar(Cedente.ContaBancaria.NumeroConta,5,false,'0');
      ADigitoNossoNumero := Modulo10(ACodigoAgencia + ANumeroConta + ACarteira + ANossoNumero);
      ADigitoAgenciaConta := Modulo10(ACodigoAgencia + ANumeroConta);
   end;

   Result := ACarteira + ANossoNumero + ADigitoNossoNumero + ACodigoAgencia + ANumeroConta + ADigitoAgenciaConta + '000';
end;

procedure TgbBanco341.FormatarBoleto(ATitulo: TgbTitulo; var AAgenciaCodigoCedente, ANossoNumero, ACarteira, AEspecieDocumento: string);
begin
   with ATitulo do
   begin
      AAgenciaCodigoCedente := Formatar(Cedente.ContaBancaria.CodigoAgencia,4,false,'0') + '/' + Formatar(Cedente.CodigoCedente,5,false,'0') + '-' + Cedente.DigitoCodigoCedente;
      ANossoNumero := Formatar(Carteira,3,false,'0') + '/' + Formatar(NossoNumero,8,false,'0') + '-' + DigitoNossoNumero;
      ACarteira := Formatar(Carteira,3,false,'0');
      AEspecieDocumento := '';
   end;
end;

{$IFNDEF VER120}

function TgbBanco341.GerarRemessa(var ACobranca: TgbCobranca; var Remessa: TStringList) : boolean;
var
   ACedenteTipoInscricao, ASacadoTipoInscricao,
   ATipoOcorrencia,
   AEspecieDocumento,
   Registro : string;
   NumeroRegistro : integer;
begin
   Result := FALSE;
   NumeroRegistro := 0;
   Remessa.Clear;

   with ACobranca do
   begin

      { GERAR REGISTRO-HEADER DA REMESSA }

      Remessa.Add('01REMESSA01'+Formatar('COBRANCA',15)+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0')+'00'+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,5,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1)+Formatar('',8)+Formatar(Titulos[NumeroRegistro].Cedente.Nome,30,true,' ')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0')+Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Nome,15,true,' ')+FormatDateTime('ddmmyy',DataArquivo)+Formatar('',294)+'000001');

      { GERAR TODOS OS REGISTROS DETALHE DA REMESSA }
      while NumeroRegistro <= (Titulos.Count - 1) do
      begin
         if Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0') <> Formatar(CodigoBanco,3,false,'0') then
            Raise Exception.CreateFmt('Titulo não pertence ao banco %s - %s',[CodigoBanco,NomeBanco]);

         case Titulos[NumeroRegistro].Cedente.TipoInscricao of
            tiPessoaFisica  : ACedenteTipoInscricao := '01';
            tiPessoaJuridica: ACedenteTipoInscricao := '02';
            tiOutro         : ACedenteTipoInscricao := '03';
         end;
         case Titulos[NumeroRegistro].Sacado.TipoInscricao of
            tiPessoaFisica  : ASacadoTipoInscricao := '01';
            tiPessoaJuridica: ASacadoTipoInscricao := '02';
            tiOutro         : ASacadoTipoInscricao := '03';
         end;

         Registro := '1';
         Registro := Registro + Formatar(ACedenteTipoInscricao,2,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.NumeroCPFCGC,14,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.CodigoAgencia,4,false,'0');
         Registro := Registro + '00';
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.NumeroConta,5,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.DigitoConta,1);
         Registro := Registro + Formatar('',8,true,' ');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].SeuNumero,25,true,' ');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].NossoNumero,8,false,'0');
         Registro := Registro + Formatar('',13,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Carteira,3,false,'0');
         Registro := Registro + Formatar('',21);
         Registro := Registro + 'I';

         {Tipo de ocorrência}
         case Titulos[NumeroRegistro].TipoOcorrencia of
            toRemessaRegistrar : ATipoOcorrencia := '01';
            toRemessaBaixar : ATipoOcorrencia := '02';
            toRemessaConcederAbatimento : ATipoOcorrencia := '04';
            toRemessaCancelarAbatimento : ATipoOcorrencia := '05';
            toRemessaAlterarVencimento : ATipoOcorrencia := '06';
            toRemessaProtestar : ATipoOcorrencia := '09';
            toRemessaCancelarInstrucaoProtesto : ATipoOcorrencia := '18';
            toRemessaDispensarJuros : ATipoOcorrencia := '47';
            toRemessaAlterarNumeroControle : ATipoOcorrencia := '08'
         else
            Raise Exception.CreateFmt('Ocorrência inválida em remessa - Nosso número: %s / Seu número: %s',[Titulos[NumeroRegistro].NossoNumero,Titulos[NumeroRegistro].SeuNumero]);
         end;
         Registro := Registro + ATipoOcorrencia;

         Registro := Registro + Formatar(Titulos[NumeroRegistro].NumeroDocumento,10);
         Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataVencimento);
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorDocumento * 100);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Cedente.ContaBancaria.Banco.Codigo,3,false,'0');
         Registro := Registro + Formatar('',5,false,'0');

         {Espécie do título}
         case Titulos[NumeroRegistro].EspecieDocumento of
            edContrato : AEspecieDocumento := '06';
            edCosseguros : AEspecieDocumento := '07';
            edDuplicataMercantil : AEspecieDocumento := '01';
            edDuplicataMercantialIndicacao : AEspecieDocumento := '01';
            edDuplicataServico : AEspecieDocumento := '08';
            edDuplicataServicoIndicacao : AEspecieDocumento := '08';
            edLetraCambio : AEspecieDocumento := '09';
            edMensalidadeEscolar : AEspecieDocumento := '04';
            edNotaDebito : AEspecieDocumento := '13';
            edNotaPromissoria : AEspecieDocumento := '02';
            edNotaPromissoriaRural : AEspecieDocumento := '02';
            edNotaSeguro : AEspecieDocumento := '03';
            edRecibo : AEspecieDocumento := '05'
         else
            AEspecieDocumento := '99';
         end;
         Registro := Registro + AEspecieDocumento;

         {Identificação de aceite do título}
         case Titulos[NumeroRegistro].AceiteDocumento of
            adSim : Registro := Registro + 'A';
            adNao : Registro := Registro + 'N';
         end;

         Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataDocumento);
         Registro := Registro + Formatar(' ',4);
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorMoraJuros*100);
         if Titulos[NumeroRegistro].DataDesconto <> 0 then
            Registro := Registro + FormatDateTime('ddmmyy',Titulos[NumeroRegistro].DataDesconto)
         else
            Registro := Registro + Formatar(' ',6,false,'0');
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorDesconto*100);
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorIOF*100);
         Registro := Registro + FormatCurr('0000000000000',Titulos[NumeroRegistro].ValorAbatimento*100);         
         Registro := Registro + Formatar(ASacadoTipoInscricao,2,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.NumeroCPFCGC,14,false,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Nome,30);
         Registro := Registro + Formatar(' ',10);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Rua+' '+Titulos[NumeroRegistro].Sacado.Endereco.Numero+' '+Titulos[NumeroRegistro].Sacado.Endereco.Complemento,40);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Bairro,12);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.CEP,8,true,'0');
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Cidade,15,true);
         Registro := Registro + Formatar(Titulos[NumeroRegistro].Sacado.Endereco.Estado,2,false);
         Registro := Registro + Formatar('',43);
         Registro := Registro + Formatar(IntToStr(NumeroRegistro+2),6,false,'0');

         Remessa.Add(Registro);
         NumeroRegistro := NumeroRegistro + 1;
      end;

      { GERAR REGISTRO TRAILER DA REMESSA }

      Remessa.Add('9'+Formatar('',393,true,' ')+Formatar(IntToStr(NumeroRegistro+2),6,false,'0'));
   end;

   Result := TRUE;
end;

function TgbBanco341.LerRetorno(var ACobranca: TgbCobranca; Retorno: TStringList) : boolean;
var
   ACodigoBanco,
   ANomeCedente,
   ATipoInscricao : string;
   NumeroRegistro : integer;
   ATitulo : TgbTitulo;
begin
   NumeroRegistro := 0;
   ATitulo := TgbTitulo.Create(nil);

   TRY

      with ACobranca do
      begin
         Titulos.Clear; {Zera o conjunto de títulos, antes de incluir os títulos do arquivo retorno}

         if Retorno.Count <= 0 then
            Raise Exception.Create('O retorno está vazio. Não há dados para processar');

         {Ver se o arquivo é mesmo RETORNO DE COBRANÇA}
         if Copy(Retorno.Strings[NumeroRegistro],1,19) <> '02RETORNO01COBRANCA' then
            Raise Exception.Create(NomeArquivo+' não é um arquivo de retorno de cobrança');

         { Lê registro HEADER}
         ACodigoBanco := Copy(Retorno.Strings[NumeroRegistro],77,3);
         if ACodigoBanco <> CodigoBanco then
            Raise Exception.CreateFmt('Este não é um retorno de cobrança do banco %s - %s',[CodigoBanco,NomeBanco]);

         ANomeCedente := Trim(Copy(Retorno.Strings[NumeroRegistro],47,30));
         if StrToInt(Copy(Retorno.Strings[NumeroRegistro],99,2)) <= 69 then
            DataArquivo := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)))
         else
            DataArquivo := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],99,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],97,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],95,2)));

         NumeroArquivo := StrToInt(Trim(Copy(Retorno.Strings[NumeroRegistro],109,5)));

         {Lê os registros DETALHE}
         {Processa até o penúltimo registro porque o último contém apenas o TRAILLER}
         for NumeroRegistro := 1 to (Retorno.Count - 2) do
         begin
            {Confirmar se o tipo do registro é 1}
            if Copy(Retorno.Strings[NumeroRegistro],1,1) <> '1' then
               Continue; {Não processa o registro atual}

            { Ler títulos do arquivo retorno}
            {Dados do titulo}
            with ATitulo do
            begin
               {Dados do cedente do título}
               with Cedente do
               begin
                  ATipoInscricao := Copy(Retorno.Strings[NumeroRegistro],2,2);
                  if ATipoInscricao = '01' then
                     TipoInscricao := tiPessoaFisica
                  else if ATipoInscricao = '02' then
                     TipoInscricao := tiPessoaJuridica
                  else
                     TipoInscricao := tiOutro;
                  NumeroCPFCGC := Copy(Retorno.Strings[NumeroRegistro],4,14);
                  ContaBancaria.Banco.Codigo := ACodigoBanco;
                  ContaBancaria.CodigoAgencia := Copy(Retorno.Strings[NumeroRegistro],18,4);
                  ContaBancaria.NumeroConta := Copy(Retorno.Strings[NumeroRegistro],24,5);
                  ContaBancaria.DigitoConta := Copy(Retorno.Strings[NumeroRegistro],29,1);
                  CodigoCedente := Cedente.ContaBancaria.NumeroConta;
                  DigitoCodigoCedente := Cedente.ContaBancaria.DigitoConta;
                  Nome := ANomeCedente;
               end; {with ACedente}

               SeuNumero := Copy(Retorno.Strings[NumeroRegistro],38,25);
               {Nosso número SEM DÍGITO}
               NossoNumero := Copy(Retorno.Strings[NumeroRegistro],63,8);
               Carteira := Copy(Retorno.Strings[NumeroRegistro],83,3);

               {Tipo de ocorrência}
               case StrToInt(Copy(Retorno.Strings[NumeroRegistro],109,2)) of
                  02 : TipoOcorrencia := toRetornoRegistroConfirmado;
                  03 : TipoOcorrencia := toRetornoRegistroRecusado;
                  06 : TipoOcorrencia := toRetornoLiquidado;
                  08 : TipoOcorrencia := toRetornoLiquidado;
                  09 : TipoOcorrencia := toRetornoBaixado;
                  11 : TipoOcorrencia := toRetornoTituloEmSer;
                  12 : TipoOcorrencia := toRetornoAbatimentoConcedido;
                  13 : TipoOcorrencia := toRetornoAbatimentoCancelado;
                  14 : TipoOcorrencia := toRetornoVencimentoAlterado;
                  16 : TipoOcorrencia := toRetornoComandoRecusado;
                  17 : TipoOcorrencia := toRetornoComandoRecusado;
                  19 : TipoOcorrencia := toRetornoRecebimentoInstrucaoProtestar;
                  20 : TipoOcorrencia := toRetornoRecebimentoInstrucaoSustarProtesto;
                  23 : TipoOcorrencia := toRetornoEncaminhadoACartorio;
                  26 : TipoOcorrencia := toRetornoDebitoTarifas;
                  27 : TipoOcorrencia := toRetornoDebitoTarifas;
                  28 : TipoOcorrencia := toRetornoDebitoTarifas;
                  29 : TipoOcorrencia := toRetornoDebitoTarifas;
                  30 : TipoOcorrencia := toRetornoDebitoTarifas;
                  32 : TipoOcorrencia := toRetornoProtestado;
                  33 : TipoOcorrencia := toRetornoDebitoTarifas;
                  34 : TipoOcorrencia := toRetornoDespesasProtesto;
                  35 : TipoOcorrencia := toRetornoDespesasSustacaoProtesto;
                  36 : TipoOcorrencia := toRetornoDebitoTarifas;
                  37 : TipoOcorrencia := toRetornoDebitoTarifas;
                  38 : TipoOcorrencia := toRetornoDebitoTarifas;
                  39 : TipoOcorrencia := toRetornoDebitoTarifas;
                  40 : TipoOcorrencia := toRetornoDebitoTarifas;
                  41 : TipoOcorrencia := toRetornoDebitoTarifas;
                  42 : TipoOcorrencia := toRetornoDebitoTarifas;
                  43 : TipoOcorrencia := toRetornoDebitoTarifas;
                  44 : TipoOcorrencia := toRetornoDebitoTarifas;
                  45 : TipoOcorrencia := toRetornoDespesasProtesto;
                  46 : TipoOcorrencia := toRetornoDespesasSustacaoProtesto;
                  48 : TipoOcorrencia := toRetornoDebitoTarifas;
                  51 : TipoOcorrencia := toRetornoDebitoTarifas;
                  52 : TipoOcorrencia := toRetornoDebitoTarifas;
                  53 : TipoOcorrencia := toRetornoDebitoTarifas;
                  54 : TipoOcorrencia := toRetornoDebitoTarifas;
                  55 : TipoOcorrencia := toRetornoDebitoTarifas;
                  56 : TipoOcorrencia := toRetornoDebitoTarifas
               else
                  TipoOcorrencia := toRetornoOutrasOcorrencias;
               end;

               if StrToInt(Copy(Retorno.Strings[NumeroRegistro],115,2)) <= 69 then
                  DataRecebimento := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)))
               else
                  DataRecebimento := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],115,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],113,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],111,2)));
               ValorDocumento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],153,13))/100;

               {Espécie do documento}
               if Trim(Copy(Retorno.Strings[NumeroRegistro],174,2)) = '' then
                  EspecieDocumento := edOutros
               else
                  case StrToInt(Copy(Retorno.Strings[NumeroRegistro],174,2)) of
                     01 : EspecieDocumento := edDuplicataMercantil;
                     02 : EspecieDocumento := edNotaPromissoria;
                     03 : EspecieDocumento := edNotaSeguro;
                     04 : EspecieDocumento := edMensalidadeEscolar;
                     05 : EspecieDocumento := edRecibo;
                     06 : EspecieDocumento := edContrato;
                     07 : EspecieDocumento := edCosseguros;
                     08 : EspecieDocumento := edDuplicataServico;
                     09 : EspecieDocumento := edLetraCambio;
                     13 : EspecieDocumento := edNotaDebito
                  else
                     EspecieDocumento := edOutros;
                  end;

               ValorDespesaCobranca := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],176,13))/100;
               ValorIOF := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],215,13))/100;
               ValorAbatimento := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],228,13))/100;
               ValorDesconto := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],241,13))/100;
               ValorMoraJuros := StrToFloat(Copy(Retorno.Strings[NumeroRegistro],267,13))/100;
               ValorOutrosCreditos := StrToFloat(Trim(Copy(Retorno.Strings[NumeroRegistro],280,13)))/100;

               if StrToInt(Copy(Retorno.Strings[NumeroRegistro],300,2)) <= 69 then
                  DataCredito := EncodeDate(StrToInt('20'+Copy(Retorno.Strings[NumeroRegistro],300,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],298,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],296,2)))
               else
                  DataCredito := EncodeDate(StrToInt('19'+Copy(Retorno.Strings[NumeroRegistro],300,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],298,2)),StrToInt(Copy(Retorno.Strings[NumeroRegistro],296,2)));

               Sacado.TipoInscricao := tiOutro;
               Sacado.Nome := Copy(Retorno.Strings[NumeroRegistro],325,30);

            end; {with ATitulo}

            {Insere o título}
            Titulos.Add(ATitulo);
         end;
      end;

      ATitulo.Free;
      Result := TRUE
   EXCEPT
      ATitulo.Free;
      Result := FALSE;
      Raise; {Propaga o erro}
   END;
end;

{$ENDIF}

initialization
RegisterClass(TgbBanco341);

end.
