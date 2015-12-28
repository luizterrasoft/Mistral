unit darumaFS345;

interface

uses Dialogs, SysUtils, principal;

function DARUMAFS345_Inicializa:Integer;
function DARUMAFS345_Finaliza:Integer;
function DARUMAFS345_LeituraX: Integer;
function DARUMAFS345_ReducaoZ: Integer;
function DARUMAFS345_VerificaEstadoImpressora: Integer;
function DARUMAFS345_CancelaCupom: Integer;
function DARUMAFS345_LeituraMemoriaFiscalData(DataInicial: String; DataFinal: String):Integer;
function DARUMAFS345_AbreCupom:Integer;
function DARUMAFS345_VendeItem(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; ValorDesconto: String): Integer;
function DARUMAFS345_IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String): Integer;
function DARUMAFS345_EfetuaFormaPagamento(FormaPagamento: String; ValorFormaPagamento: String):Integer;
function DARUMAFS345_TerminaFechamentoCupom(Mensagem: String):Integer;
function DARUMAFS345_LeituraMemoriaFiscalReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
function DARUMAFS345_LeituraMemoriaFiscalSerialData(DataInicial: String; DataFinal: String):Integer;
function DARUMAFS345_LeituraMemoriaFiscalSerialReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
function DARUMAFS345_RelatorioGerencial(Texto: String): Integer;
function DARUMAFS345_FechaRelatorioGerencial: Integer;
function DARUMAFS345_NumeroCupom:String;
function DARUMAFS345_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
function DARUMAFS345_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
function DARUMAFS345_FechaComprovanteNaoFiscalVinculado: Integer;
procedure DARUMAFS345_AnalisaRetorno(retorno: Integer);
function DARUMAFS345_ProgramaFormasPagamento( Formas: String): Integer;
function DARUMAFS345_VerificaDescricaoFormasPagamento ( Formas: String): Integer;
function DARUMAFS345_CancelaItemGenerico( Numero_Item: String ):Integer;
function DARUMAFS345_ProgramaAliquota ( Aliquota: String; Vinculo: String ): Integer;
function DARUMAFS345_Sangria(Valor:Real;Sangria:String='S'):Integer;

implementation

//Funcoes da DARUMA FS345, localizadas na extensão 'DARUMA.DLL'
function Daruma_FI_AbrePortaSerial: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaPortaSerial: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraX: Integer; stdcall; external 'Daruma32.dll' ;
function Daruma_FI_ReducaoZ( Data: String; Hora: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaEstadoImpressora( var ACK: Integer; var ST1: Integer; var ST2: Integer ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_CancelaCupom: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_AbreCupom(sParam1: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VendeItem(sParam1:String; sParam2: String; sParam3: String; sParam4: String; sParam5: String; sParam6: Integer; sParam7: String; sParam8: String; sParam9: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_IniciaFechamentoCupom(sParam1: String; sParam2: String; sParam3: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_EfetuaFormaPagamento(sParam1: String; sParam2: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_TerminaFechamentoCupom( sParam1: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_RelatorioGerencial( Texto: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaRelatorioGerencial: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_NumeroCupom( NumeroCupom: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_FechaComprovanteNaoFiscalVinculado: Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaFormasPagamento( Formas: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_VerificaDescricaoFormasPagamento ( Formas: String): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_ProgramaAliquota ( Aliquota: String; Vinculo: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_CancelaItemGenerico( Numero_Item: String ):Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_Sangria(Valor:String):Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_Suprimento(Valor:String;formadepagamento:String):Integer; stdcall; external 'Daruma32.dll';

var
  ERRO_DARUMAFS345_GERAL: array[-8..0] of String;

function DARUMAFS345_Inicializa:Integer;
begin
  ERRO_DARUMAFS345_GERAL [0]   := 'Erro de comunicação, a Função nao conseguiu enviar o comando';
  ERRO_DARUMAFS345_GERAL [-1]  := 'Erro de Execução da Função';
  ERRO_DARUMAFS345_GERAL [-2]  := 'Parâmetro inválido passado na função.!';
  ERRO_DARUMAFS345_GERAL [-3]  := 'Alíquota não programada no ECF. !';
  ERRO_DARUMAFS345_GERAL [-4]  := 'A Chave ou Valor no Registry não Foi Encontado.!';
  ERRO_DARUMAFS345_GERAL [-5]  := 'Erro ao Abrir a Porta de Comunicação';
  ERRO_DARUMAFS345_GERAL [-6]  := 'Impressora desligada ou cabo de comunicação desconectado.';
  ERRO_DARUMAFS345_GERAL [-7]  := 'Banco não encontrado ou não cadastrado no Registry';
  ERRO_DARUMAFS345_GERAL [-8]  := ' Erro ao criar ou gravar no arquivo STATUS.TXT ou RETORNO.TXT.';

  result := Daruma_FI_AbrePortaSerial;
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_Finaliza:Integer;
begin
  result := Daruma_FI_FechaPortaSerial;
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_LeituraX: Integer;
begin
  result := Daruma_FI_LeituraX();
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_ReducaoZ: Integer;
begin
  result := Daruma_FI_ReducaoZ(Pchar(FormatDateTime ('dd/mm/yyyy',frm_principal.x_data_trabalho)),
    Pchar(FormatDateTime ('hh:nn:ss',time)));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_VerificaEstadoImpressora: Integer;
var
  sMsg: String;
  Ack,St1,St2: Integer;
begin
  result := Daruma_FI_VerificaEstadoImpressora(Ack,St1,St2);

  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result)
  else
  begin
         //tratamento do status
         //Codificando o bit 1
    if  St1 >= 128 then                        // bit 7
    begin
      St1 := St1 - 128;
      sMsg := 'Fim de Papel';
      showmessage(sMsg);
    end;
    if St1 >= 64 then                        // bit 6
    begin
      St1 := St1 - 64;
      sMsg := 'Pouco Papel';
      showmessage(sMsg);
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
  end;
end;

function DARUMAFS345_CancelaCupom: Integer;
begin
  result := Daruma_FI_CancelaCupom;
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_LeituraMemoriaFiscalData(DataInicial: String; DataFinal: String):Integer;
begin
  result := Daruma_FI_LeituraMemoriaFiscalData(Pchar(DataInicial), Pchar(DataFinal));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_AbreCupom:Integer;
begin
  result := Daruma_FI_AbreCupom(Pchar('')); //sem usar o CGC/CPF do consumidor
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_VendeItem(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; ValorDesconto: String): Integer;
begin
  result := Daruma_FI_VendeItem(Pchar(Codigo),
    Pchar(Descricao),
    Pchar(Aliquota),
    Pchar(TipoQuantidade), Pchar(Quantidade),
    CasasDecimais,Pchar(ValorUnitario),
    Pchar(TipoDesconto),Pchar(ValorDesconto));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String): Integer;
begin
  result       := Daruma_FI_IniciaFechamentoCupom(Pchar(AcrescimoDesconto),
    Pchar(TipoAcrescimoDesconto),
    Pchar(ValorAcrescimoDesconto));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_EfetuaFormaPagamento(FormaPagamento: String; ValorFormaPagamento: String):Integer;
begin
  result := Daruma_FI_EfetuaFormaPagamento(Pchar(FormaPagamento),
    Pchar(ValorFormaPagamento));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_TerminaFechamentoCupom(Mensagem: String):Integer;
begin
  result := Daruma_FI_TerminaFechamentoCupom(Pchar(Mensagem)); 
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_LeituraMemoriaFiscalReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
begin
  result := Daruma_FI_LeituraMemoriaFiscalReducao(Pchar(ReducaoInicial), Pchar(ReducaoFinal));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_LeituraMemoriaFiscalSerialData(DataInicial: String; DataFinal: String):Integer;
begin
  result := Daruma_FI_LeituraMemoriaFiscalSerialData(Pchar(DataInicial), Pchar(DataFinal));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_LeituraMemoriaFiscalSerialReducao(ReducaoInicial: String; ReducaoFinal: String):Integer;
begin
  result := Daruma_FI_LeituraMemoriaFiscalSerialReducao(Pchar(ReducaoInicial), Pchar(ReducaoFinal));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_RelatorioGerencial(Texto: String): Integer;
begin
  result := Daruma_FI_RelatorioGerencial(Pchar(Texto));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_FechaRelatorioGerencial: Integer;
begin
  result := Daruma_FI_FechaRelatorioGerencial;
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_NumeroCupom:String;
var
  cNumeroCupom: String;
  i,iRet: Integer;
begin
  for i:=1 to 6 do
    cNumeroCupom := cNumeroCupom + ' ';
  iRet := Daruma_FI_NumeroCupom(cNumeroCupom);
  result := cNumeroCupom;
  if (iRet<=0) then
    DARUMAFS345_AnalisaRetorno(iRet);
end;

procedure DARUMAFS345_AnalisaRetorno(retorno: Integer);
begin
  if (retorno>0) then
    retorno:=(-1)*retorno;
  showmessage(ERRO_DARUMAFS345_GERAL [retorno]);
end;

function DARUMAFS345_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
begin
  result := Daruma_FI_AbreComprovanteNaoFiscalVinculado(Pchar(FormaPagamento), Pchar(Valor), Pchar(NumeroCupom));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
begin
  result := Daruma_FI_UsaComprovanteNaoFiscalVinculado(Pchar(Texto));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_FechaComprovanteNaoFiscalVinculado: Integer;
begin
  result := Daruma_FI_FechaComprovanteNaoFiscalVinculado;
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

//Este comando somente poderá ser enviado uma REDUCAO Z
function DARUMAFS345_ProgramaFormasPagamento( Formas: String): Integer;
begin
  result := Daruma_FI_ProgramaFormasPagamento(Pchar(Formas));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_VerificaDescricaoFormasPagamento ( Formas: String): Integer;
begin
  result := Daruma_FI_VerificaDescricaoFormasPagamento(Formas); //PASSA-SE A 'STRING' SEM 'PCHAR'
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_ProgramaAliquota ( Aliquota: String; Vinculo: String ): Integer;
begin
  result := Daruma_FI_ProgramaAliquota( Pchar(Aliquota), Pchar(Vinculo));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_CancelaItemGenerico( Numero_Item: String ):Integer;
begin
  result := Daruma_FI_CancelaItemGenerico(Pchar(Numero_Item));
  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

function DARUMAFS345_Sangria(Valor:Real;Sangria:String='S'):Integer;
var
  vvalor:String;
begin
  VValor := formatfloat('0.00',Valor);

  if Sangria = 'S' then
    Result := Daruma_FI_Sangria(Pchar(VValor))
  else
    Result := Daruma_FI_Suprimento( Pchar( VValor ),Pchar('Dinheiro'));

  if (result<=0) then
    DARUMAFS345_AnalisaRetorno(result);
end;

end.
