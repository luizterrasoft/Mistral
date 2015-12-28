unit Bematech;

interface

uses Dialogs, SysUtils, principal, Forms,funcoesglobais;

function BEMATECH_Inicializa:Integer;
function BEMATECH_Finaliza:Integer;
function BEMATECH_AbreCupom:Integer;
function Bematech_AbreCupomMFD(cgc: String; nome: String; endereco: String):Integer;
function BEMATECH_VendeItem(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; ValorDesconto: String): Integer;
function BEMATECH_IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String): Integer;
function BEMATECH_EfetuaFormaPagamento(FormaPagamento: String; ValorFormaPagamento: String):Integer;
function BEMATECH_TerminaFechamentoCupom(Mensagem: String):Integer;
function BEMATECH_CancelaCupom: Integer;
function BEMATECH_LeituraX: Integer;
function BEMATECH_ReducaoZ: Integer;
function BEMATECH_RelatorioGerencial(Texto: String): Integer;
function BEMATECH_FechaRelatorioGerencial: Integer;
function BEMATECH_VerificaEstadoImpressora: Integer;
function BEMATECH_NumeroCupom:String;
function BEMATECH_LeituraMemoriaFiscalData(DataInicial: String; DataFinal: String):Integer;
function BEMATECH_LeituraMemoriaFiscalReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
function BEMATECH_LeituraMemoriaFiscalSerialData(DataInicial: String; DataFinal: String):Integer;
function BEMATECH_LeituraMemoriaFiscalSerialReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
function BEMATECH_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
function BEMATECH_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
function BEMATECH_FechaComprovanteNaoFiscalVinculado: Integer;
function BEMATECH_AnalisaRetorno(retorno: Integer):Boolean;
function BEMATECH_ProgramaAliquotas( Aliquota: String; Vinculo: Integer ):Integer;
function Bematech_AcionaGaveta: Integer;
function Bematech_CancelaItemGenerico(Numero:String):Integer;
function Bematech_Sangria(Valor:Real;Sangria:String='S'):Integer;
function Bematech_TerminaFechamentoCupomCodigoBarrasMFD(Mensagem: String; TipoCodigo: String; Codigo: String; Altura: Integer; Largura: Integer; PosicaoCaracteres: Integer; Fonte: Integer; Margem: Integer; CorrecaoErros: Integer; Colunas: Integer):Integer;

var
  FLAG_BEMATECH_CONTINUA_IMPRESSAO: Boolean;

implementation

//Funcoes da BEMATECH, localizadas na extensão 'BEMAFI32.DLL'
function Bematech_FI_AbrePortaSerial: Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_FechaPortaSerial: Integer; stdcall; external 'BEMAFI32.DLL' name 'Bematech_FI_FechaPortaSerial';
function Bematech_FI_LeituraX: Integer; stdcall; external 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencial( Texto: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_FechaRelatorioGerencial: Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_AbreCupomMFD(cgc: String; nome: String; endereco: String): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom( Mensagem: String): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom( NumeroCupom: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora( var ACK: Integer; var ST1: Integer; var ST2: Integer ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora( var ACK: Integer; var ST1: Integer; var ST2: Integer ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_FechaComprovanteNaoFiscalVinculado: Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota( Aliquota: String; Vinculo: Integer ): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_AcionaGaveta: Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico(NumeroItem:String):Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_Sangria(Valor:String):Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_Suprimento(Valor:String;FormaPagamento:String):Integer; stdcall; external 'BEMAFI32.DLL';
//*** Rodrigo Cordeiro *** 28/10/2009 *** Cupom Mania *********
function Bematech_FI_TerminaFechamentoCupomCodigoBarrasMFD( cMensagem: String; cTipoCodigo: String; cCodigo: String; iAltura: Integer; iLargura: Integer; iPosicaoCaracteres: Integer; iFonte: Integer; iMargem: Integer; iCorrecaoErros: Integer; iColunas: Integer ): Integer; stdcall; external 'BEMAFI32.DLL';

var
  ERRO_BEMATECH_GERAL: array[0..127] of String;
  STATUS_BEMATECH: array[1..127] of String;

function BEMATECH_AbreCupom:Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_AbreCupom(Pchar('')); //sem usar o CGC/CPF do consumidor
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function Bematech_AbreCupomMFD(cgc: String; nome: String; endereco: String):Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_AbreCupomMFD(Pchar(cgc),Pchar(nome),Pchar(endereco) ); //sem usar o CGC/CPF do consumidor
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function BEMATECH_VendeItem(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String;
  Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; ValorDesconto: String): Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_VendeItem(Pchar(Codigo),
      Pchar(Descricao),
      Pchar(Aliquota),
      Pchar(TipoQuantidade), Pchar(Quantidade),
      CasasDecimais,Pchar(ValorUnitario),
      Pchar(TipoDesconto),Pchar(ValorDesconto));
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function BEMATECH_IniciaFechamentoCupom(AcrescimoDesconto: String;
  TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String): Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_IniciaFechamentoCupom(Pchar(AcrescimoDesconto),
      Pchar(TipoAcrescimoDesconto),
      Pchar(ValorAcrescimoDesconto));
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function BEMATECH_EfetuaFormaPagamento(FormaPagamento: String; ValorFormaPagamento: String):Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_EfetuaFormaPagamento(Pchar(FormaPagamento),
      Pchar(ValorFormaPagamento));
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function BEMATECH_TerminaFechamentoCupom(Mensagem: String):Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_TerminaFechamentoCupom(Pchar(Mensagem)); //sem mensagem final
    if (result=1) then
      break
    else
    if (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function BEMATECH_CancelaCupom: Integer;
begin
  result := Bematech_FI_CancelaCupom;
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_Inicializa:Integer;
begin
     //Inicializando vetor de ERROS padrao 'BEMATECH'
  ERRO_BEMATECH_GERAL [0]  := 'Erro de Comunicação !';
  ERRO_BEMATECH_GERAL [1]  := 'Erro de Execução na Função. Verifique!';
  ERRO_BEMATECH_GERAL [2]  := 'Parâmetro Inválido !';
  ERRO_BEMATECH_GERAL [3]  := 'Alíquota não programada !';
  ERRO_BEMATECH_GERAL [4]  := 'Arquivo BemaFI32.INI não encontrado. Verifique!';
  ERRO_BEMATECH_GERAL [5]  := 'Erro ao Abrir a Porta de Comunicação';
  ERRO_BEMATECH_GERAL [6]  := 'Impressora Desligada ou Desconectada';
  ERRO_BEMATECH_GERAL [7]  := 'Banco Não Cadastrado no Arquivo BemaFI32.ini';
  ERRO_BEMATECH_GERAL [8]  := 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt';
  ERRO_BEMATECH_GERAL [18] := 'Não foi possível abrir arquivo INTPOS.001 !';
  ERRO_BEMATECH_GERAL [19] := 'Parâmetro diferentes!';
  ERRO_BEMATECH_GERAL [20] := 'Transação cancelada pelo Operador!';
  ERRO_BEMATECH_GERAL [21] := 'A Transação não foi aprovada!';
  ERRO_BEMATECH_GERAL [22] := 'Não foi possível terminar a Impressão!';
  ERRO_BEMATECH_GERAL [23] := 'Não foi possível terminar a Operação!';
  ERRO_BEMATECH_GERAL [24] := 'Forma de pagamento não programada.';
  ERRO_BEMATECH_GERAL [25] := 'Totalizador não fiscal não programado.';
  ERRO_BEMATECH_GERAL [26] := 'Transação já Efetuada!';
  ERRO_BEMATECH_GERAL [27] := 'Status da impressora dif. de 6,0,0(ACK,ST1,ST2)';
  ERRO_BEMATECH_GERAL [28] := 'Não há Informações para serem Impressas!';

  result := Bematech_FI_AbrePortaSerial;
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_Finaliza:Integer;
begin
  result := Bematech_FI_FechaPortaSerial;
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_VerificaEstadoImpressora: Integer;
var
  Ack,St1,St2: Integer;
begin
  result := Bematech_FI_VerificaEstadoImpressora(Ack,St1,St2);
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_AnalisaRetorno(retorno: Integer):Boolean;
var
  sMsg: String;
  Ack,St1,St2: Integer;
begin
  if (retorno>0) then //OK,1
  begin
    retorno := retorno;
    result  := true;
  end
  else
  if (retorno=-27) then //o STATUS da impressora esta com erro (ACH,ST1,ST2 - dif. de 6,0,0)
  begin
               //Erros administrativos da IMPRESSORA, mas comunicacao OK!
    result := true;
    Bematech_FI_VerificaEstadoImpressora (Ack,St1,St2);

               //Codificando o bit 1
    if  St1 >= 128 then                        // bit 7
    begin
      St1 := St1 - 128;
      sMsg := 'Fim de Papel';
      if (Application.MessageBox('Impressora no FIM DE PAPEL! Aguardar troca de bobina?','ECF',4+32)=6) then
        result := false
      else
        result := true;
    end;
    if St1 >= 64 then                        // bit 6
    begin
      St1 := St1 - 64;
      sMsg := 'Pouco Papel';
      if (Application.MessageBox('Impressora com POUCO PAPEL! Aguardar troca de bobina?','ECF',4+32)=6) then
        result := false
      else
        result := true;
    end;
    if St1 >= 32 then                        // bit 5
    begin
      St1 := St1 - 32;
      sMsg := 'Erro no Relógio';
      showmessage(sMsg);
    end;
    if St1 >= 16 then                        // bit 4
    begin
      St1 := St1 - 16;
      sMsg := 'Impressora em Erro';
      showmessage(sMsg);
    end;
    if St1 >= 8 then                        // bit 3
    begin
      St1 := St1 - 8;
      sMsg := 'Comando não iniciado com ESC';
      showmessage(sMsg);
    end;
    if St1 >= 4 then                        // bit 2
    begin
      St1 := St1 - 4;
      sMsg := 'Comando Inexistente';
      showmessage(sMsg);
    end;
    if St1 >= 2 then                        // bit 1
    begin
      St1 := St1 - 2;
      sMsg := 'Cupom Aberto';
      showmessage(sMsg);
    end;
    if St1 >= 1 then                        // bit 0
    begin
      St1 := St1 - 1;
      sMsg := 'Número de Parâmetro(s) Inválido(s)';
      showmessage(sMsg);
    end;

               //Codificando o bit 2
    if St2 >= 128 then                        // bit 7
    begin
      St2 := St2 - 128;
      sMsg := 'Tipo de Parâmetro de Comando Inválido';
      showmessage(sMsg);
    end;
    if St2 >= 64 then                        // bit 6
    begin
      St2 := St2 - 64;
      sMsg := 'Memória Fiscal Lotada';
      showmessage(sMsg);
    end;
    if St2 >= 32 then                        // bit 5
    begin
      St2 := St2 - 32;
      sMsg := 'Erro na Memória RAM';
      showmessage(sMsg);
    end;
    if St2 >= 16 then                        // bit 4
    begin
      St2 := St2 - 16;
      sMsg := 'Alíquota Não Programada';
      showmessage(sMsg);
    end;
    if St2 >= 8 then                        // bit 3
    begin
      St2 := St2 - 8;
      sMsg := 'Capacidade de Alíquotas Lotada';
      showmessage(sMsg);
    end;
    if St2 >= 4 then                        // bit 2
    begin
      St2 := St2 - 4;
      sMsg := 'Cancelamento Não Permitido';
      showmessage(sMsg);
    end;
    if St2 >= 2 then                        // bit 1
    begin
      St2 := St2 - 2;
      sMsg := 'CNPJ/IE do Proprietário Não Programado';
      showmessage(sMsg);
    end;
    if St2 >= 1 then                        // bit 0
    begin
      St2 := St2 - 1;
      sMsg := 'Comando Não Executado';
      showmessage(sMsg);
    end;
  end
  else
  begin
               //erros de comunicao, CABO, PORTA, etc...
    result := true;
    if (retorno<>0) then
      retorno := (-1)*retorno;

    if (Application.MessageBox(Pchar(ERRO_BEMATECH_GERAL [retorno]+'. Tentar novamente?'),'ECF',4+32)=6) then
      result := false
    else
      result := true;
  end;
end;

function BEMATECH_NumeroCupom:String;
var
  cNumeroCupom: String;
  i,iRet: Integer;
begin
  for i:=1 to 6 do
    cNumeroCupom := cNumeroCupom + ' ';
  iRet := Bematech_FI_NumeroCupom(cNumeroCupom);
  result := cNumeroCupom;
  if (iRet<=0) then
    BEMATECH_AnalisaRetorno(iRet);
end;

function BEMATECH_LeituraX: Integer;
begin
  result := Bematech_FI_LeituraX();
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_ReducaoZ: Integer;
begin
  result := Bematech_FI_ReducaoZ(Pchar(FormatDateTime ('dd/mm/yyyy',frm_principal.x_data_trabalho)),
    Pchar(FormatDateTime ('hh:nn:ss',time)));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_RelatorioGerencial(Texto: String): Integer;
begin
  result := Bematech_FI_RelatorioGerencial(Pchar(Texto));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_FechaRelatorioGerencial: Integer;
begin
  result := Bematech_FI_FechaRelatorioGerencial;
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_LeituraMemoriaFiscalData(DataInicial: String; DataFinal: String):Integer;
begin
  result := Bematech_FI_LeituraMemoriaFiscalData(Pchar(DataInicial), Pchar(DataFinal));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_LeituraMemoriaFiscalReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
begin
  result := Bematech_FI_LeituraMemoriaFiscalReducao(Pchar(ReducaoInicial), Pchar(ReducaoFinal));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_LeituraMemoriaFiscalSerialData(DataInicial: String; DataFinal: String):Integer;
begin
  result := Bematech_FI_LeituraMemoriaFiscalSerialData(Pchar(DataInicial), Pchar(DataFinal));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_LeituraMemoriaFiscalSerialReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
begin
  result := Bematech_FI_LeituraMemoriaFiscalSerialReducao(Pchar(ReducaoInicial), Pchar(ReducaoFinal));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function BEMATECH_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
begin
  if (FLAG_BEMATECH_CONTINUA_IMPRESSAO) then
    while (true) do
    begin
      result := Bematech_FI_AbreComprovanteNaoFiscalVinculado(Pchar(FormaPagamento), Pchar(Valor), Pchar(NumeroCupom));
      if (result=1) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := true;
        break;
      end
      else
      if (BEMATECH_AnalisaRetorno(result)) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := false;
        break;
      end;
    end;
end;

function BEMATECH_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
begin
  if (FLAG_BEMATECH_CONTINUA_IMPRESSAO) then
    while (true) do
    begin
      result := Bematech_FI_UsaComprovanteNaoFiscalVinculado(Pchar(Texto));
      if (result=1) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := true;
        break;
      end
      else
      if (BEMATECH_AnalisaRetorno(result)) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := false;
        break;
      end;
    end;
end;

function BEMATECH_FechaComprovanteNaoFiscalVinculado: Integer;
begin
  if (FLAG_BEMATECH_CONTINUA_IMPRESSAO) then
    while (true) do
    begin
      result := Bematech_FI_FechaComprovanteNaoFiscalVinculado;
      if (result=1) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := true;
        break;
      end
      else
      if (BEMATECH_AnalisaRetorno(result)) then
      begin
        FLAG_BEMATECH_CONTINUA_IMPRESSAO := false;
        break;
      end;
    end;
end;

function BEMATECH_ProgramaAliquotas( Aliquota: String; Vinculo: Integer):Integer;
begin
  result := Bematech_FI_ProgramaAliquota(Pchar(Aliquota), Vinculo);
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function Bematech_AcionaGaveta: Integer;
begin
  result := Bematech_FI_AcionaGaveta;
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function Bematech_CancelaItemGenerico(Numero:String):Integer;
begin
  while (true) do
  begin
    result := Bematech_FI_CancelaItemGenerico(Pchar(formatfloat('000',strtointn(Numero))));
    if (result=1) or (BEMATECH_AnalisaRetorno(result)) then
      break;
  end;
end;

function Bematech_Sangria(Valor:Real;Sangria:String='S'):Integer;
var
  vvalor:String;
begin
  VValor := formatfloat('0.00',Valor);
  if Sangria = 'S' then
    Result := Bematech_FI_Sangria(Pchar(VValor))
  else
    Result := Bematech_FI_Suprimento( Pchar( VValor ),Pchar('Dinheiro'));
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

function Bematech_TerminaFechamentoCupomCodigoBarrasMFD(Mensagem: String; TipoCodigo: String; Codigo: String; Altura: Integer; Largura: Integer; PosicaoCaracteres: Integer; Fonte: Integer; Margem: Integer; CorrecaoErros: Integer; Colunas: Integer):Integer;
begin
  result := Bematech_FI_TerminaFechamentoCupomCodigoBarrasMFD(Mensagem,TipoCodigo,Codigo,Altura,Largura,PosicaoCaracteres,Fonte,Margem,CorrecaoErros,Colunas);
  if (result<=0) then
    BEMATECH_AnalisaRetorno(result);
end;

end.
