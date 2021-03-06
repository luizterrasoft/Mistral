unit Un_FechamentoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair, LabelOO, auxiliar,funcoesglobais,db,dbtables,
  PanelControle, MaskEdit, EditControle, ComCtrls, Pesquisa,variants,
  MaskEditOO;

type

  TFrm_FechamentoCaixa = class(Tform)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel3: TBevel;
    lbGerenteSupervisor: TLabelOO;
    lbCaixa: TLabelOO;
    Bevel2: TBevel;
    Bevel1: TBevel;
    lbltitulo_sombra: TLabel;
    lbltitulo: TLabel;
    rdTipo: TRadioGroup;
    botaoEncerramento: TPanel;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    botaoConferencia: TPanel;
    Label1: TLabel;
    BotaoSair1: TBotaoSair;
    lbtipz: TLabel;
    Panel1: TPanel;
    BotaoSair2: TBotaoSair;
    Label6: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    PanelControle2: TPanelControle;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    Principal2: TMenuItem;
    Limparformulrio1: TMenuItem;
    N4: TMenuItem;
    Conferncia1: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    SAIR1: TMenuItem;
    chtodoscaixas: TCheckBox;
    chtodoscaixas1: TCheckBox;
    Label4: TLabel;
    Caixa: TEdit;
    Loja: TEdit;
    Data: TMaskEditOO;
    Data2: TMaskEditOO;
    edtDescLoja: TEdit;
    chExibeData: TCheckBox;
//    Label4: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure botaoEncerramentoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botaoConferenciaClick(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    //procedure CaixaKeyDown(Sender: TObject; var Key: Word;
    //  Shift: TShiftState);
    procedure LojaExit(Sender: TObject);
    //procedure CaixaExit(Sender: TObject);
    procedure DataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure BotaoSair2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chtodoscaixas1Click(Sender: TObject);
    procedure Data2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CaixaExit(Sender: TObject);
  private
    function ChamandoF8LojasLocal: String;
    { Private declarations }
  public
    { Public declarations }
    //************************************************************************************************
    clTeste,ClAuxPrest,clAux,clAux2,clAux3,clCheqDev: TClassAuxiliar;
    tipo_vale: String;
    nomeStatuAtdo,statusant: String;
    y_caixa_ativo: Real;
    tipz: String;
    tecla: Integer;
    FEstoque,continua: Boolean;
    flagExibeImpressaoConferencia: Boolean;    
    //************************************************************************************************
    //TODOS OS IDENTIFICADORES RELACIONADOS COM A SUMARIZACAO DO 'FECHAMENTO DO CAIXA'
    //************************************************************************************************
    a_total_troco,a_total_dinheiro: Real;
    a_total_vetor_cartao: array[1..999] of Real;
    a_total_vetor_parcelado_cartao: array[1..20,1..12] of Real;
    a_total_cheque,a_total_cartao,a_total_debito: Real;
    total_recebimentos_cheque_devolvido: Real;
    a_total_do_caixa: Real;
    a_total_crediarios,a_subtotal_crediarios: Real;
    a_total_troco_vales: Real;
    a_total_vales_recebidos: Real;
    a_total_vales_emitidos: Real;
    a_total_vales_merc: Real;
    a_valor_inicial: Real;
    a_qtde_vendas_canceladas: Integer;
    a_total_vendas_canceladas: Real;
    b_total_produtos_vendidos: Real;
    b_total_vales_emitidos: Real;
    b_total_vales_emitidos_avulsos: Real;
    b_total_vales_mercadorias: Real;
    c_total_desconto: Real;
    c_total_trocas: Real;
    c_total_devolucoes: Real;
    f_prestacoes_recebidas: Real;
    f_juros_multas_recebidos: Real;
    f_entradas: Real;
    d2_total_dinheiro_creditos: Real;
    d2_total_dinheiro_debitos: Real;
    d2_total_cheque_creditos: Real;
    d2_total_cheque_debitos: Real;
    d2_total_outros_creditos: Real;
    d2_total_outros_debitos: Real;
    total_excesso_vendas: Real;
    total_trocas_vendedores: Integer;
    total_sangrias_ch,total_sangrias: Real;
    total_reprovisionamento: Real;
    qtdeAtdo: Integer;
    totalAtdo: Real;
    //************************************************************************************************
    function totprestfpgt(ffpgt,campo:String):Real;
    procedure GravaRegistroEncerramentoDoCaixa; {*} //ACIONADO EXTERNAMENTE, E SOMENTE PARA 'ENCERRAR O CAIXA'
    procedure GravaRegistroEncerramentoDoCaixa_ONLINE; //ESSE � EXECUTADO EM PARALELO, PARA O CASO DO SISTEMA ON-LINE
    procedure ExclueRegistroEncerramentoDoCaixa (opcaixa: Real);
    procedure ExclueRegistroEncerramentoDoCaixa_ONLINE (opcaixa: Real);
  end;

var
  frm_FechamentoCaixa: Tfrm_FechamentoCaixa;

implementation

uses unDialogo, mem_prnt, principal, funcoes1, funcoes2, procura, caixa;

{$R *.DFM}

procedure Tfrm_FechamentoCaixa.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoCaixa.botaoEncerramentoClick(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_FechamentoCaixa.Conferncia1Click(Sender: TObject);
var
  i,j: Integer;
  abre,fecha: String;
//*****************************
  fim: Integer;
  contaRegistro: Integer;
  proximoRegistro: Integer;
  numeroPlano, numeroPlano2: Real;
  subtotalPlanoEntrada, subtotalPlanoValor: Real;
  totalPlanoEntrada, totalPlanoValor: Real;
  adm,numeroParcelas: Integer;
//****VARI�VEIS DA NOVA CONFER�NCIA DE CREDI�RIOS REALIZADOS********************
  plano, planoAnt, entrada, valor: Real;
  subtotalEntrada, subtotalValor, totalEntrada, totalValor: Real;
  subtotalDinheiro, subtotalCheque, subtotalCartaoDebito, subtotalCartaoCredito: Real;
  imprimiu, imprimeCabecalho, imprimeOBS: Boolean;
  descPlano: String;
  dataInicial,dataFinal: TDateTime;
  auxSubtotalDinheiro, auxSubtotalCheque, auxSubtotalCartaoDebito, auxSubtotalCartaoCredito: Real;
  clie,clieAnt: Real;   //AJUDA NA VERIFICA��O DE QUANDO H� ENTRADA POR FORA
  numBoleta: Real;
  dataAnt,dataAtual: TDateTime;
//******************************************************************************
//****VARI�VEIS UTILIZADAS PARA VERIFICAR SE O CONTRATO � MULTIBOLETA***********
  multiEntrada,multiFinanciado: Real;
  multiCadaEntrada: Real;
  multiJaSomou: Boolean;
  multiContrato,multiContratoAnt: Real;
  qtdeBoletas: Integer;
  existeMultiboleta: Boolean;
  clienteAnt,cliente,contratoAnt,contrato: Real;
  continuaMulti,avancaCliente: Boolean;
  contaMulti,contaMulti2: Integer;
  subtraiDinheiro,subtraiCheque,subtraiCartaoDebito,subtraiCartaoCredito: Boolean;
  multiDinheiro,multiCheque,multiCartaoDebito,multiCartaoCredito: Real;
  numContrato: Real;
  boletaAnt,boleta: Real; //AJUDA NA VERIFICA��O DE QUANDO H� ENTRADA POR FORA
//******************************************************************************
begin
     {...}
  continua := true;
  if (fEstoque) then
    if (not IsDate(Data.Text)) or (Data.Text = '  /  /    ') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma data inicial v�lida!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Data.SetFocus;
      Data.SelectAll;
    end
    else
    if (not IsDate(Data2.Text)) or (Data2.Text = '  /  /    ') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma data final v�lida!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Data2.SetFocus;
      Data2.SelectAll;
    end
    else
    if (Trim(Loja.Text) = '') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma loja!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Loja.SetFocus;
      Loja.SelectAll;
    end
    else
      continua := true;
  if (continua) then
  begin
    dataInicial := Data.GetValor;
    dataFinal   := Data2.GetValor;
    frm_mem_print.PrepareReport;
    frm_principal.x_col_impressao := 40;
    frm_principal.x_comando       := '12c';
    frm_principal.x_arq_impressao := 'conferencia.rel';
    frm_principal.x_tam_fonte     := 8;
    frm_principal.x_Fecha_caixa := false;
    frm_mem_print.Title:= 'CONFERENCIA DE CAIXA';

          {************************************************************************}
          //CABECALHO
          {************************************************************************}
    frm_mem_print.AddLine('****************************************');
    if (rdTipo.itemindex=0) then
      frm_mem_print.AddLine('         CONFERENCIA DE CAIXA           ')
    else
    if (rdTipo.itemindex=1) then
      frm_mem_print.AddLine('   FECHAMENTO / ENCERRAMENTO DO CAIXA   ');
    frm_mem_print.AddLine('****************************************');
    if (fEstoque) then
    begin
      frm_mem_print.AddLine(form_data(dataInicial)+' a '+form_data(dataFinal)+'');
      frm_mem_print.AddLine('LOJA: '+form_nz(frm_principal.x_loja,2)+'   HORA:'+formatDateTime('hh:nn:ss',time));
    end
    else
      frm_mem_print.AddLine(form_data(frm_principal.x_data_trabalho)+'    LOJA: '+form_nz(frm_principal.x_loja,2)+'   HORA:'+formatDateTime('hh:nn:ss',time));
    frm_mem_print.AddLine('****************************************');
    if (chtodoscaixas.Checked) or (chtodoscaixas1.Checked) then
      frm_mem_print.AddLine(' Caixa: Todos')
    else
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      frm_mem_print.AddLine(' Caixa: '+form_nz (y_caixa_ativo,6)+'/'+
        form_t  (ProcuraNomeVend(frm_principal.x_loja,y_caixa_ativo,self),20));
    if not Festoque then
      if (chtodoscaixas.Checked) or (chtodoscaixas1.Checked) then
        frm_mem_print.AddLine(' Terminal: Todos')
      else
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        frm_mem_print.AddLine(' Terminal: '+form_nz(frm_principal.x_terminal,2));
    frm_mem_print.AddLine('****************************************');

          //ATENDIMENTOS ------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT min(CX_ABRE) as minimo,                                         ');
    clAux.AddParam ('max(CX_ENCE) as maximo                                                 ');
    clAux.AddParam ('FROM CAIXAS                                                            ');
    clAux.AddParam ('WHERE ((CX_DATA>=:data) AND (CX_DATA<=:data2))                         ');
    if (fEstoque) then
      clAux.AddParam ('AND (CX_LOJA=:yloja)                                               ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
    begin
      clAux.AddParam('AND (CX_FUNC=:caixa)                                                ');
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    end;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
    end;
    if (fEstoque) then
      clAux.consulta.ParamByName('yloja').AsFloat    := StrToFloat(Loja.Text);
    clAux.Execute;
    clAux.Last;
    if (dataInicial = dataFinal) then
    begin
      frm_mem_print.AddLine(' Abertura..: '+form_t(clAux.Result('minimo'),8));
      if (chtodoscaixas.Checked) or (chtodoscaixas1.Checked)then
        frm_mem_print.AddLine(' Fechamento: '+form_t(clAux.Result('maximo'),8));
      frm_mem_print.AddLine('****************************************');
    end;
    clAux.Desconect;
    clAux.Free;
    if (tipz='2') then
    begin
                //ATENDIMENTOS ------------------------------------------------------------
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT AT_TOTA,AT_STAT,AT_CAIX                                         ');
      clAux.AddParam ('FROM ATENDIMENTOS                                                      ');
      clAux.AddParam ('WHERE (AT_LOJA=:loja) AND ((AT_DATA>=:data) AND (AT_DATA<=:data2))     ');
      clAux.AddParam ('ORDER BY AT_STAT                                                       ');
      clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
      if (fEstoque) then
      begin
        clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
        clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
      end
      else
      begin
        clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
        clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
      end;
      if (clAux.Execute) then
      begin
      //              if (tipz='1') or (tipz='3') then
      //              begin
        frm_mem_print.AddLine('');
        frm_mem_print.AddLine('= = = = = = ATENDIMENTOS = = = = = = = =');
      //              end;
        clAux.first;
        statusant := clAux.result('AT_STAT');
        qtdeAtdo  := 0;
        totalAtdo := 0.00;
        while (not clAux.eof) do
        begin
          if (statusant<>clAux.result('AT_STAT')) then
          begin
      //                        if (tipz='1') or (tipz='3') then
      //                        begin
            if (statusant='0') then
              nomeStatuAtdo:='Em Andamento...:'
            else
            if (statusant='1') then
              nomeStatuAtdo:='Concluidos.....:'
            else
            if (statusant='2') then
              nomeStatuAtdo:='Cancelados.....:'
            else
            if (statusant='3') then
              nomeStatuAtdo:='Suspensos......:';
            frm_mem_print.AddLine(nomeStatuAtdo+form_n(qtdeAtdo,5)+' '+form_nc(totalAtdo,10));
      //                        end;
            statusant := clAux.result('AT_STAT');
            qtdeAtdo  := 0;
            totalAtdo := 0.00;
          end;
          qtdeAtdo  := qtdeAtdo  + 1;
          totalAtdo := totalAtdo + clAux.result('AT_TOTA');

                         {--->}
          clAux.next;
        end;
      //              if (tipz='1') or (tipz='3') then
      //              begin
        if (statusant='0') then
          nomeStatuAtdo:='Em Andamento...:'
        else
        if (statusant='1') then
          nomeStatuAtdo:='Concluidos.....:'
        else
        if (statusant='2') then
          nomeStatuAtdo:='Cancelados.....:'
        else
        if (statusant='3') then
          nomeStatuAtdo:='Suspensos......:';
        frm_mem_print.AddLine(nomeStatuAtdo+form_n(qtdeAtdo,5)+' '+form_nc(totalAtdo,10));
        frm_mem_print.AddLine('');
      //              end;
      end;
      clAux.desconect;
      clAux.Free;
    end;
          {...}
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('             - - RESUMOS - -            ');
    frm_mem_print.AddLine('');

          {************************************************************************}
          //a) LISTAGEM ANALITICA DE TODOS OS VALORES
          {************************************************************************}
          //1. DINHEIRO RECEBIDO ----------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC                                                                      ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                          ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2)) AND (VF_FPGT=:formapagamento)                                                                   ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                  ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                                 ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                  ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento').AsFloat  := KFPGT_DINHEIRO;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    a_total_dinheiro := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = (1)DINHEIRO RECEBIDO = = = = =');
      clAux.first;
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine(form_tc2(' ',14,' ')+
          '(R$ '+form_nc(clAux.result('VF_VALO') + clAux.result('VF_TROC'),10)+') '+
          form_nc(clAux.result('VF_VALO'),10));
        a_total_troco    := a_total_troco    + clAux.result('VF_TROC');
        a_total_dinheiro := a_total_dinheiro + clAux.result('VF_VALO');
        clAux.next;
      end;
      frm_mem_print.AddLine('----------------------------------------');
//               frm_mem_print.AddLine('Total em Troco.........: '+form_nc(a_total_troco,15));
//               frm_mem_print.AddLine('Total .................: '+form_nc(a_total_troco + a_total_dinheiro,15));
      frm_mem_print.AddLine('TOTAL EM DINHEIRO.(D2).: '+form_nc(a_total_dinheiro,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

          //2. CHEQUE A VISTA ------------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                                               ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                                                   ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND                          ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2)) AND (VF_FPGT=:formapagamento)                                         ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                                           ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                                                          ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                                           ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento').AsFloat  := KFPGT_CHEQUE;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    a_total_cheque := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = =(2)CHEQUE A VISTA = = = = = =');
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT CH_NUME,CH_CPF FROM CHEQUES                                                              ');
        clAux2.AddParam ('WHERE (CH_LOJA=:loja) AND (CH_VEND=:codigovenda) AND (CH_ORDE=:ordem)                           ');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.AddParam ('AND (CH_CAIX=:terminal)                                                                          ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.consulta.parambyname('terminal').AsFloat := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
          frm_mem_print.AddLine(form_t(clAux2.result('CH_CPF'),14)+
            ' - N:'+form_n  (clAux2.result('CH_NUME'),9)+
            form_nc (clAux.result('VF_VALO'),12))
        else
          frm_mem_print.AddLine(form_tc2(' ',14,' ')+
            ' - N:'+form_t  ('?',9)+
            form_nc (clAux.result('VF_VALO'),12));
        a_total_cheque := a_total_cheque + clAux.result('VF_VALO');
        clAux2.desconect;
        clAux2.Free;

                    {-->}
        clAux.next;
      end;
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL CHEQUES A VISTA....'+form_nc(a_total_cheque,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;


          //3. DEBITO AUTOMATICO -----------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                      ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                          ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2)) AND (VF_FPGT=:formapagamento)                ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                  ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                                 ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                  ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento').AsFloat  := KFPGT_DEBITO;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    a_total_debito := 0.00;
    for i:=1 to 999 do
      a_total_vetor_cartao[i]:=0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = (3)DEBITO AUTOMATICO = = = = =');
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT CA_NUME,CA_CADM FROM CARTOES                                                             ');
        clAux2.AddParam ('WHERE (CA_LOJA=:loja) AND (CA_VEND=:codigovenda) AND (CA_ORDE=:ordem)                           ');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.AddParam ('AND (CA_CAIX=:terminal)                                                                       ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.consulta.parambyname('terminal').AsFloat    := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
          frm_mem_print.AddLine('('+form_t(clAux2.result('CA_NUME'),25)+')'+
            form_nc(clAux.result('VF_VALO'),13))
        else
          frm_mem_print.AddLine('('+form_t('?',25)+')'+
            form_nc(clAux.result('VF_VALO'),13));
        a_total_vetor_cartao[trunc(clAux2.result('CA_CADM'))] := a_total_vetor_cartao[trunc(clAux2.result('CA_CADM'))] + clAux.result('VF_VALO');
        clAux2.desconect;
        clAux2.Free;

                    {-->}
        clAux.next;
      end;

               //Lista de cartoes de credito
      clAux3 := TClassAuxiliar.Create;
      clAux3.conect   (databaseprodutos,self);
      clAux3.ClearSql;
      clAux3.AddParam ('SELECT AM_CODI,AM_DESC FROM ADMINISTRADORAS    ');
      clAux3.AddParam ('WHERE (AM_TIPO=0)                              '); //so adm. de debito
      clAux3.AddParam ('ORDER BY AM_DESC                               ');
      clAux3.Execute;
      clAux3.first;
      while (not clAux3.eof) do
      begin
        if (a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))]<>0.00) then
          frm_mem_print.AddLine(form_t('TOTAL '+trim(clAux3.result('AM_DESC'))+': ',25)+
            form_nc(a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))],15));
        a_total_debito := a_total_debito + a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))];
                    {---->}
        clAux3.next;
      end;
      clAux3.desconect;
      clAux3.Free;
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL EM DEBITO AUTOMATICO..:'+form_nc(a_total_debito,11));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

    //4. CART�ES DE CREDITO -----------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.Conect(DataBaseProdutos,self);
    clAux.ClearSql;
    clAux.AddParam('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_CAIX,VF_LOJA ');
    clAux.AddParam('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                     ');
    clAux.AddParam('WHERE (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND      ');
    clAux.AddParam('      (VF_VEND=VE_CODI) AND (VF_LOJA=:loja) AND        ');
    clAux.AddParam('      (VE_DATA>=:data) AND (VE_DATA<=:data2) AND       ');
    clAux.AddParam('      (VF_FPGT=:formapagamento)                        ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')           ');
    if (tipz = '1') or (tipz = '2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                ');
    clAux.consulta.ParamByName('loja').AsFloat := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.ParamByName('caixa').AsFloat := y_caixa_ativo;
    clAux.consulta.ParamByName('formapagamento').AsFloat := KFPGT_CARTAO;
    if (tipz = '1') or (tipz = '2') then
      clAux.consulta.ParamByName('tipz').AsString := tipz;

    for i := 1 to 999 do
      a_total_vetor_cartao[i] := 0.00;

    {Zerando o vetor que guarda os valores totais das parcelas de cada cart�o}
    for i := 1 to 20 do
      for j := 1 to 12 do
        a_total_vetor_parcelado_cartao[i,j] := 0.00;

    a_total_cartao := 0.00;

    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = =(4)CARTOES DE CREDITO = = = = =');
      clAux.First;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.Conect(DataBaseProdutos,self);
        clAux2.ClearSql;
        clAux2.AddParam('SELECT CA_NUME,CA_CADM FROM CARTOES                  ');
        clAux2.AddParam('WHERE (CA_LOJA=:loja) AND (CA_VEND=:codigovenda) AND ');
        clAux2.AddParam('      (CA_ORDE=:ordem) AND (CA_CAIX=:terminal)       ');
        clAux2.consulta.ParamByName('loja').AsFloat        := clAux.Result('VF_LOJA');
        clAux2.consulta.ParamByName('terminal').AsFloat    := clAux.Result('VF_CAIX');
        clAux2.consulta.ParamByName('codigovenda').AsFloat := clAux.Result('VF_VEND');
        clAux2.consulta.ParamByName('ordem').AsInteger     := clAux.Result('VF_ORDE');
        if (clAux2.Execute) then
          frm_mem_print.AddLine(''+form_t  (clAux2.result('CA_NUME'),30)+' '+
            form_nc (clAux.result('VF_VALO'),9))
        else
          frm_mem_print.AddLine(''+form_t  ('?',30)+'  '+
            form_nc (clAux.result('VF_VALO'),9));
        a_total_vetor_cartao[trunc(clAux2.result('CA_CADM'))] := a_total_vetor_cartao[trunc(clAux2.result('CA_CADM'))] + clAux.result('VF_VALO');

        adm := trunc(clAux2.result('CA_CADM'));

        clAux2.ClearSql;
        clAux2.AddParam('SELECT PC_TOTA FROM CARTOES_PARCELAS                 ');
        clAux2.AddParam('WHERE (PC_LOJA=:loja) AND (PC_VEND=:codigovenda) AND ');
        clAux2.AddParam('      (PC_ORDE=:ordem) AND (PC_CAIX=:terminal)       ');
        clAux2.consulta.ParamByName('loja').AsFloat        := clAux.Result('VF_LOJA');
        clAux2.consulta.ParamByName('terminal').AsFloat    := clAux.Result('VF_CAIX');
        clAux2.consulta.ParamByName('codigovenda').AsFloat := clAux.Result('VF_VEND');
        clAux2.consulta.ParamByName('ordem').AsInteger     := clAux.Result('VF_ORDE');
        clAux2.consulta.Open;
        if (not clAux2.consulta.IsEmpty) then
        begin
          numeroParcelas := clAux2.consulta.RecordCount;
          a_total_vetor_parcelado_cartao[adm,numeroParcelas] := a_total_vetor_parcelado_cartao[adm,numeroParcelas] + clAux2.Result('PC_TOTA');
        end;
        clAux2.Desconect;
        clAux2.Free;
        {-->}
        clAux.Next;
      end;

      //Lista de cartoes de credito
      clAux3 := TClassAuxiliar.Create;
      clAux3.Conect(DataBaseProdutos,self);
      clAux3.ClearSql;
      clAux3.AddParam('SELECT AM_CODI,AM_DESC ');
      clAux3.AddParam('FROM ADMINISTRADORAS   ');
      clAux3.AddParam('WHERE (AM_TIPO=1)      '); //so adm. de credito
      clAux3.AddParam('ORDER BY AM_DESC       ');
      clAux3.Execute;
      clAux3.First;
      frm_mem_print.AddLine('---- TOTAIS DE PARCELAS POR CARTAO -----');
      while (not clAux3.Eof) do
      begin
        if (a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))] <> 0.00) then
        begin
          frm_mem_print.AddLine(clAux3.result('AM_DESC')+':');
          for j := 1 to 12 do
            if (a_total_vetor_parcelado_cartao[trunc(clAux3.result('AM_CODI')),j] <> 0.00) then
            begin
              frm_mem_print.AddLine(form_nz(j,2)+'X: '+form_nc(a_total_vetor_parcelado_cartao[trunc(clAux3.result('AM_CODI')),j],14));
            end;
          frm_mem_print.AddLine('TOTAL '+form_t(clAux3.result('AM_DESC')+':',17)+
            form_nc(a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))],17));
          frm_mem_print.AddLine('----------------------------------------');
        end;
        a_total_cartao := a_total_cartao + a_total_vetor_cartao[trunc(clAux3.result('AM_CODI'))];
        {---->}
        clAux3.Next;
      end;
      clAux3.desconect;
      clAux3.Free;
      frm_mem_print.AddLine('TOTAL CARTAO DE CREDITO: '+form_nc(a_total_cartao,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

{Rodrigo Cordeiro ----------------------------------Inicio-----------------------------------------------------------------}

    //5. CREDIARIOS REALIZADOS ----------------------------------------------------------------------------

    {---------------------------------------------------------------}
    {   CLIENTES QUE N�O UTILIZAM O SISTEMA DE CR�DITO E COBRAN�A   }
    {---------------------------------------------------------------}
    {-------------------------IN�CIO--------------------------------}
    if (not frm_principal.servidor_credito.Connected) then
    begin
      imprimiu := false;
      clTeste := TClassAuxiliar.Create;
      clTeste.Conect(DataBaseProdutos,self);
      clTeste.ClearSql;
      clTeste.AddParam('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX,VF_FPGT,CR_VENT,CR_CODI,CR_PLAN,CR_CLIE  ');
      clTeste.AddParam('FROM VENDAS_FORMA_PAGAMENTO,VENDAS,CREDIARIOS                                                   ');
      clTeste.AddParam('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND     ');
      clTeste.AddParam('      (CR_LOJA=VF_LOJA) AND (CR_VEND=VF_VEND) AND                                               ');
      clTeste.AddParam('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND                                                     ');
      clTeste.AddParam('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                                  ');
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clTeste.AddParam ('AND (VE_FUNC=:caixa)                                                                   ');
      if (tipz='1') or (tipz='2') then
        clTeste.AddParam('AND (VE_TIPZ=:tipz)                                                                     ');
      clTeste.AddParam('ORDER BY CR_CLIE,CR_CODI                                                                        ');
      clTeste.consulta.ParamByName('loja').AsFloat           := frm_principal.x_loja;
      if (fEstoque) then
      begin
        clTeste.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
        clTeste.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
      end
      else
      begin
        clTeste.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
        clTeste.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
      end;
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clTeste.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
      if (tipz='1') or (tipz='2') then
        clTeste.consulta.parambyname('tipz').AsString  := tipz;
      if (clTeste.Execute) then
      begin
        clTeste.First;
        plano    := clTeste.Result('CR_PLAN');
        planoAnt := plano;
        entrada  := clTeste.Result('CR_VENT');
        valor    := clTeste.Result('VF_VALO');
        while (not clTeste.Eof) do
        begin
          if (clTeste.Result('VF_FPGT') = 5) then
          begin
            if (not imprimiu) then
            begin
              frm_mem_print.AddLine('= = = = = = (5) CREDIARIOS = = = = = = =');
              frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
              imprimiu := true;
            end;
            frm_mem_print.AddLine(''+form_nz(strtofloat(Trim(clTeste.Result('CR_CLIE'))),6)+'.'+form_nz(strtofloat(Trim(clTeste.Result('CR_CODI'))),6)+'     '+form_nc(entrada,10)+'  '+form_nc(valor,10)+'');
            totalEntrada := totalEntrada + entrada;
            totalValor   := totalValor + valor;
          end
          else
          if (clTeste.Result('VF_FPGT') = 1) then
            subtotalDinheiro := subtotalDinheiro + valor
          else
          if (clTeste.Result('VF_FPGT') = 2) then
            subtotalCheque := subtotalCheque + valor
          else
          if (clTeste.Result('VF_FPGT') = 3) then
            subtotalCartaoDebito := subtotalCartaoDebito + valor
          else
          if (clTeste.Result('VF_FPGT') = 4) then
            subtotalCartaoCredito := subtotalCartaoCredito + valor;
          clTeste.Next;
          entrada := clTeste.Result('CR_VENT');
          valor   := clTeste.Result('VF_VALO');
        end;
      end;
      clTeste.Desconect;
      clTeste.Free;
      if (subtotalDinheiro <> 0) or (subtotalCheque <> 0) or (subtotalCartaoDebito <> 0) or (subtotalCartaoCredito <> 0) then
        frm_mem_print.AddLine('Entradas p/ forma pgto:');
      if (subtotalDinheiro <> 0) then
        frm_mem_print.AddLine('DINHEIRO:              '+form_nc(subtotalDinheiro,10)+'');
      if (subtotalCheque <> 0) then
        frm_mem_print.AddLine('CHEQUE A VISTA:        '+form_nc(subtotalCheque,10)+'');
      if (subtotalCartaoDebito <> 0) then
        frm_mem_print.AddLine('CARTAO DEBITO:         '+form_nc(subtotalCartaoDebito,10)+'');
      if (subtotalCartaoCredito <> 0) then
        frm_mem_print.AddLine('CARTAO CREDITO:        '+form_nc(subtotalCartaoCredito,10)+'');
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL CREDIARIOS: '+form_nc(totalEntrada,10)+'  '+form_nc(totalValor,10));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end
    else
    begin
      {-------------------------FIM-----------------------------------}  

      {---------------------------------------------------------------}
      {      CLIENTES QUE UTILIZAM O SISTEMA DE CR�DITO E COBRAN�A    }
      {---------------------------------------------------------------}
      {-------------------------IN�CIO--------------------------------}
      a_total_crediarios := 0;  // Zerando a vari�vel total de credi�rios
      //******************************
      clTeste := TClassAuxiliar.Create;
      clTeste.Conect(DataBaseProdutos,self);
      clTeste.ClearSql;
      clTeste.AddParam('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX,VF_FPGT,CR_VENT,CR_CODI,       ');
      clTeste.AddParam('       CR_PLAN,CR_CLIE,CR_CONT,CR_FINA,CR_CAIX,CR_VEND,VE_DATA                        ');
      clTeste.AddParam('FROM VENDAS_FORMA_PAGAMENTO,VENDAS,CREDIARIOS                                         ');
      clTeste.AddParam('WHERE (VF_LOJA=:loja) AND (VE_LOJA=VF_LOJA) AND (VE_CAIX=VF_CAIX) AND                 ');
      clTeste.AddParam('      (VE_CODI=VF_VEND) AND (CR_CAIX=VE_CAIX) AND                                     ');
      clTeste.AddParam('      (CR_LOJA=VF_LOJA) AND (CR_VEND=VF_VEND) AND                                     ');
      clTeste.AddParam('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND (VF_FPGT <> '+chr(39)+'4'+chr(39)+') AND  ');
      clTeste.AddParam('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                        ');
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clTeste.AddParam ('AND (VE_FUNC=:caixa)                                                               ');
      if (tipz='1') or (tipz='2') then
        clTeste.AddParam('AND (VE_TIPZ=:tipz)                                                                 ');
      clTeste.AddParam('ORDER BY CR_PLAN,VE_DATA,CR_CLIE,CR_CONT,CR_CODI,VF_ORDE                              ');
      clTeste.consulta.ParamByName('loja').AsFloat           := frm_principal.x_loja;
      if (fEstoque) then
      begin
        clTeste.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
        clTeste.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
      end
      else
      begin
        clTeste.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
        clTeste.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
      end;
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clTeste.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
      if (tipz='1') or (tipz='2') then
        clTeste.consulta.parambyname('tipz').AsString    := tipz;
      if (clTeste.Execute) then
      begin
        clTeste.First;
        while (not clTeste.Eof) do
          if (clTeste.Result('CR_PLAN') = 0) then
            clTeste.Next
          else
          begin
            frm_mem_print.AddLine('= = = = = = (5) CREDIARIOS = = = = = = =');
            clTeste.Last;
          end;
        clTeste.First;
        imprimiu      := false;
        planoAnt      := clTeste.Result('CR_PLAN');
        plano         := clTeste.Result('CR_PLAN');
        entrada       := clTeste.Result('CR_VENT');
        valor         := clTeste.Result('VF_VALO');
        multiJaSomou  := false;
        avancaCliente := false;
        while (not clTeste.Eof) do
        begin
          entrada  := clTeste.Result('CR_VENT');
          valor    := clTeste.Result('VF_VALO');
          if (chExibeData.Checked) then
          begin
            dataAnt   := clTeste.Result('VE_DATA');
            dataAtual := clTeste.Result('VE_DATA');
          end;
          if (clTeste.Result('VF_FPGT') = 5) and (clTeste.Result('CR_PLAN') <> 0) then
          begin
            //********PEGANDO A DESCRI��O DO PLANO**********************************
            descPlano := '';
            if (frm_principal.servidor_credito.Connected) then
            begin
              clAux := TClassAuxiliar.Create;
              clAux.Conect('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam('SELECT PL_TIPO            ');
              clAux.AddParam('FROM CREDPLANO            ');
              clAux.AddParam('WHERE (PL_CODI=:codiPlano)');
              clAux.consulta.ParamByName('codiPlano').AsFloat := plano;
              if (clAux.Execute) then
                descPlano := descPlano + clAux.Result('PL_TIPO')
              else
                descPlano := '';
              clAux.Desconect;
              clAux.Free;
            end;
            //**********************************************************************

            //**********VERIFICANDO A EXIST�NCIA DE CONTRATOS MULTIBOLETAS**********
            clAux := TClassAuxiliar.Create;
            clAux.Conect('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam('SELECT CR_TOTA,CR_VENT,CR_QBOL                       ');
            clAux.AddParam('FROM CRECTABR                                        ');
            clAux.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CODI=:contrato) AND ');
            clAux.AddParam('      (CR_LOJA=:loja)                                ');
            clAux.consulta.ParamByName('cliente').AsFloat  := clTeste.Result('CR_CLIE');
            clAux.consulta.ParamByName('contrato').AsFloat := clTeste.Result('CR_CONT');
            clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
            //**********************************************************************
            if (clAux.Execute) then
            begin
              if (clAux.Result('CR_QBOL') = '1') then
              begin
                clieAnt   := 0;
                clie      := 0;
                numBoleta := 0;
                frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                if (chExibeData.Checked) then
                begin
                  frm_mem_print.AddLine('----------------------------------------');
                  frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                  ;
                end;
                frm_mem_print.AddLine(''+form_nz(strtofloat(Trim(clTeste.Result('CR_CLIE'))),6)+'.'+form_nz(strtofloat(Trim(clTeste.Result('CR_CODI'))),6)+'     '+form_nc(entrada,10)+'  '+form_nc(valor,10)+'');
                //subtotalEntrada := subtotalEntrada + entrada;
                subtotalValor   := subtotalValor + valor;
                imprimiu        := true;
                avancaCliente   := true;
                clieAnt         := clTeste.Result('CR_CLIE');
                numBoleta       := clTeste.Result('CR_CODI');
              end
              else
              begin
                //*** USADO NA VERIFICA��O DE ENTRADA POR FORA ***
                boletaAnt            := 0;
                boleta               := 0;
                boletaAnt            := clTeste.Result('CR_CODI');
                contrato             := clTeste.Result('CR_CONT');
                contratoAnt          := clTeste.Result('CR_CONT');
                //************************************************
                clienteAnt           := clTeste.Result('CR_CLIE');
                cliente              := clTeste.Result('CR_CLIE');
                multiEntrada         := 0;
                multiFinanciado      := 0;
                contaMulti           := StrToInt(clAux.Result('CR_QBOL'));
                contaMulti2          := 0;
                subtraiDinheiro      := false;
                subtraiCheque        := false;
                subtraiCartaoDebito  := false;
                subtraiCartaoCredito := false;
                multiDinheiro        := 0;
                multiCheque          := 0;
                multiCartaoDebito    := 0;
                multiCartaoCredito   := 0;
                //*************************************************
                auxSubtotalDinheiro      := subtotalDinheiro;
                auxSubtotalCheque        := subtotalCheque;
                auxSubtotalCartaoDebito  := subtotalCartaoDebito;
                auxSubtotalCartaoCredito := subtotalCartaoCredito;
                subtotalDinheiro         := 0;
                subtotalCheque           := 0;
                subtotalCartaoDebito     := 0;
                subtotalCartaoCredito    := 0;
                //*************************************************
                while (clienteAnt = cliente) and (not clTeste.Eof) and (contratoAnt = contrato) do
                begin
                  if (clTeste.Result('VF_FPGT') = 5) then
                  begin
                    if (clTeste.Result('CR_VEND') = 0) or (clTeste.Result('CR_CAIX') = 0) then
                    begin
                      clienteAnt    := 0;
                      cliente       := 1;
                      continuaMulti := false;
                    end
                    else
                    begin
                      multiFinanciado := multiFinanciado + clTeste.Result('CR_FINA');
                      inc(contaMulti2);
                      continuaMulti   := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalDinheiro := subtotalDinheiro + clTeste.Result('CR_VENT');
                      multiDinheiro    := subtotalDinheiro;
                      subtraiDinheiro  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCheque := subtotalCheque + clTeste.Result('CR_VENT');
                      multiCheque    := subtotalCheque;
                      subtraiCheque  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCartaoDebito := subtotalCartaoDebito + clTeste.Result('CR_VENT');
                      multiCartaoDebito    := subtotalCartaoDebito;
                      subtraiCartaoDebito  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCartaoCredito := subtotalCartaoCredito + clTeste.Result('CR_VENT');
                      multiCartaoCredito    := subtotalCartaoCredito;
                      subtraiCartaoCredito  := true;
                    end;
                  numContrato   := clTeste.Result('CR_CONT');
                  dataAtual     := clTeste.Result('VE_DATA');
                  clTeste.Next;
                  boleta        := clTeste.Result('CR_CODI');
                  avancaCliente := false;
                  clienteAnt    := cliente;
                  cliente       := clTeste.Result('CR_CLIE');
                  contratoAnt   := contrato;
                  contrato      := clTeste.Result('CR_CONT');
                end;
                if (continuaMulti) and (contaMulti = contaMulti2) then
                begin
                  if (not imprimiu) then
                  begin
                    frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                    frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                    if (chExibeData.Checked) then
                    begin
                      frm_mem_print.AddLine('----------------------------------------');
                      frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                    end;
                    imprimiu := true;
                  end
                  else
                  begin
                    if (dataAnt <> dataAtual) and (chExibeData.Checked) then
                    begin
                      dataAnt := dataAtual;
                      frm_mem_print.AddLine('----------------------------------------');
                      frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      ;
                    end;
                  end;
                  frm_mem_print.AddLine(''+form_nz(clienteAnt,6)+'.'+form_nz(numContrato,6)+'     '+form_nc(subtotalDinheiro+subtotalCheque+subtotalCartaoDebito+subtotalCartaoCredito,10)+'  '+form_nc(multiFinanciado,10)+'');
                  //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                  subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                  subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                  subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                  subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                  //**********************************************************************************
                  subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                  subtotalValor         := subtotalValor + multiFinanciado;
                end
                else
                begin
                  if (subtraiDinheiro) then
                    subtotalDinheiro      := subtotalDinheiro - multiDinheiro;
                  if (subtraiCheque) then
                    subtotalCheque        := subtotalCheque - multiCheque;
                  if (subtraiCartaoDebito) then
                    subtotalCartaoDebito  := subtotalCartaoDebito - multiCartaoDebito;
                  if (subtraiCartaoCredito) then
                    subtotalCartaoCredito := subtotalCartaoCredito - multiCartaoCredito;
                  //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                  subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                  subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                  subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                  subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                  //**********************************************************************************
                  subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                  subtotalValor         := subtotalValor;
                end;
              end;
            end
            else
              avancaCliente := true;
            clAux.Desconect;
            clAux.Free;

            if (avancaCliente) then
            begin
              clTeste.Next;
              if (clieAnt = clie) and (clTeste.Result('CR_CODI') = numBoleta) then
                clTeste.Next;
              clie := clTeste.Result('CR_CLIE');
              if (chExibeData.Checked) then
              begin
                dataAtual := clTeste.Result('VE_DATA');
                plano     := clTeste.Result('CR_PLAN');
                if (dataAnt <> dataAtual) and (planoAnt = plano) then
                begin
                  dataAnt := dataAtual;
                  frm_mem_print.AddLine('----------------------------------------');
                  frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                end;
              end;
            end;
            plano   := clTeste.Result('CR_PLAN');
            entrada := clTeste.Result('CR_VENT');
            valor   := clTeste.Result('VF_VALO');
          end
          else
          begin
            //********PEGANDO A DESCRI��O DO PLANO**********************************
            descPlano := '';
            if (frm_principal.servidor_credito.Connected) then
            begin
              clAux := TClassAuxiliar.Create;
              clAux.Conect('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam('SELECT PL_TIPO            ');
              clAux.AddParam('FROM CREDPLANO            ');
              clAux.AddParam('WHERE (PL_CODI=:codiPlano)');
              clAux.consulta.ParamByName('codiPlano').AsFloat := plano;
              if (clAux.Execute) then
                descPlano := descPlano + clAux.Result('PL_TIPO')
              else
                descPlano := '';
              clAux.Desconect;
              clAux.Free;
            end;
            //**********************************************************************

            //**********VERIFICANDO A EXIST�NCIA DE CONTRATOS MULTIBOLETAS**********
            clAux := TClassAuxiliar.Create;
            clAux.Conect('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam('SELECT CR_TOTA,CR_VENT,CR_QBOL                       ');
            clAux.AddParam('FROM CRECTABR                                        ');
            clAux.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CODI=:contrato) AND ');
            clAux.AddParam('      (CR_LOJA=:loja)                                ');
            clAux.consulta.ParamByName('cliente').AsFloat  := clTeste.Result('CR_CLIE');
            clAux.consulta.ParamByName('contrato').AsFloat := clTeste.Result('CR_CONT');
            clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
            //**********************************************************************
            if (clAux.Execute) then
            begin
              if (clAux.Result('CR_QBOL') = '1') then
              begin
                if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                begin
                  subtotalDinheiro := subtotalDinheiro + valor;
                  subtotalEntrada  := subtotalEntrada + valor;
                  avancaCliente    := true;
                end
                else
                if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                begin
                  subtotalCheque  := subtotalCheque + valor;
                  subtotalEntrada := subtotalEntrada + valor;
                  avancaCliente   := true;
                end
                else
                if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                begin
                  subtotalCartaoDebito := subtotalCartaoDebito + valor;
                  subtotalEntrada      := subtotalEntrada + valor;
                  avancaCliente        := true;
                end
                else
                if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                begin
                  subtotalCartaoCredito := subtotalCartaoCredito + valor;
                  subtotalEntrada       := subtotalEntrada + valor;
                  avancaCliente         := true;
                end;
              end
              else
              begin
                //*** USADO NA VERIFICA��O DE ENTRADA POR FORA ***
                boletaAnt            := 0;
                boleta               := 0;
                boletaAnt            := clTeste.Result('CR_CODI');
                contrato             := clTeste.Result('CR_CONT');
                contratoAnt          := clTeste.Result('CR_CONT');
                //************************************************
                clienteAnt           := clTeste.Result('CR_CLIE');
                cliente              := clTeste.Result('CR_CLIE');
                multiEntrada         := 0;
                multiFinanciado      := 0;
                contaMulti           := StrToInt(clAux.Result('CR_QBOL'));
                contaMulti2          := 0;
                subtraiDinheiro      := false;
                subtraiCheque        := false;
                subtraiCartaoDebito  := false;
                subtraiCartaoCredito := false;
                multiDinheiro        := 0;
                multiCheque          := 0;
                multiCartaoDebito    := 0;
                multiCartaoCredito   := 0;
                //*************************************************
                auxSubtotalDinheiro      := subtotalDinheiro;
                auxSubtotalCheque        := subtotalCheque;
                auxSubtotalCartaoDebito  := subtotalCartaoDebito;
                auxSubtotalCartaoCredito := subtotalCartaoCredito;
                subtotalDinheiro         := 0;
                subtotalCheque           := 0;
                subtotalCartaoDebito     := 0;
                subtotalCartaoCredito    := 0;
                //*************************************************
                while (clienteAnt = cliente) and (not clTeste.Eof) and (contratoAnt = contrato) do
                begin
                  if (clTeste.Result('VF_FPGT') = 5) then
                  begin
                    if (clTeste.Result('CR_VEND') = 0) or (clTeste.Result('CR_CAIX') = 0) then
                    begin
                      clienteAnt    := 0;
                      cliente       := 1;
                      continuaMulti := false;
                    end
                    else
                    begin
                      multiFinanciado := multiFinanciado + clTeste.Result('CR_FINA');
                      inc(contaMulti2);
                      continuaMulti   := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalDinheiro := subtotalDinheiro + clTeste.Result('CR_VENT');
                      multiDinheiro    := subtotalDinheiro;
                      subtraiDinheiro  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCheque := subtotalCheque + clTeste.Result('CR_VENT');
                      multiCheque    := subtotalCheque;
                      subtraiCheque  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCartaoDebito := subtotalCartaoDebito + clTeste.Result('CR_VENT');
                      multiCartaoDebito    := subtotalCartaoDebito;
                      subtraiCartaoDebito  := true;
                    end;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                    if (boletaAnt <> boleta) then
                    begin
                      if (boleta <> 0) then
                        boletaAnt := boleta;
                      subtotalCartaoCredito := subtotalCartaoCredito + clTeste.Result('CR_VENT');
                      multiCartaoCredito    := subtotalCartaoCredito;
                      subtraiCartaoCredito  := true;
                    end;
                  numContrato   := clTeste.Result('CR_CONT');
                  dataAtual     := clTeste.Result('VE_DATA');
                  clTeste.Next;
                  boleta        := clTeste.Result('CR_CODI');
                  avancaCliente := false;
                  clienteAnt    := cliente;
                  cliente       := clTeste.Result('CR_CLIE');
                  contratoAnt   := contrato;
                  contrato      := clTeste.Result('CR_CONT');
                end;
                if (continuaMulti) and (contaMulti = contaMulti2) then
                begin
                  if (not imprimiu) then
                  begin
                    frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                    frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                    if (chExibeData.Checked) then
                    begin
                      frm_mem_print.AddLine('----------------------------------------');
                      frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                    end;
                    imprimiu := true;
                  end
                  else
                  begin
                    if (dataAnt <> dataAtual) and (chExibeData.Checked) then
                    begin
                      dataAnt := dataAtual;
                      frm_mem_print.AddLine('----------------------------------------');
                      frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      ;
                    end;
                  end;
                  frm_mem_print.AddLine(''+form_nz(clienteAnt,6)+'.'+form_nz(numContrato,6)+'     '+form_nc(subtotalDinheiro+subtotalCheque+subtotalCartaoDebito+subtotalCartaoCredito,10)+'  '+form_nc(multiFinanciado,10)+'');
                  //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                  subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                  subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                  subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                  subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                  //**********************************************************************************
                  subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                  subtotalValor         := subtotalValor + multiFinanciado;
                end
                else
                begin
                  if (subtraiDinheiro) then
                    subtotalDinheiro      := subtotalDinheiro - multiDinheiro;
                  if (subtraiCheque) then
                    subtotalCheque        := subtotalCheque - multiCheque;
                  if (subtraiCartaoDebito) then
                    subtotalCartaoDebito  := subtotalCartaoDebito - multiCartaoDebito;
                  if (subtraiCartaoCredito) then
                    subtotalCartaoCredito := subtotalCartaoCredito - multiCartaoCredito;
                  //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                  subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                  subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                  subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                  subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                  //**********************************************************************************
                  subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                  subtotalValor         := subtotalValor;
                end;
              end;
            end
            else
              avancaCliente := true;
            clAux.Desconect;
            clAux.Free;

            if (avancaCliente) then
            begin
              clTeste.Next;
              if (chExibeData.Checked) then
              begin
                dataAtual := clTeste.Result('VE_DATA');
                plano     := clTeste.Result('CR_PLAN');
                if (dataAnt <> dataAtual) and (planoAnt = plano) then
                begin
                  frm_mem_print.AddLine('----------------------------------------');
                  frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                  ;
                  dataAnt := dataAtual;
                end;
              end;
            end;
            plano   := clTeste.Result('CR_PLAN');
            entrada := clTeste.Result('CR_VENT');
            valor   := clTeste.Result('VF_VALO');
          end;

          while (planoAnt = plano) and (not clTeste.Eof) do
          begin
            if (clTeste.Result('VF_FPGT') = 5) and (imprimiu) and (clTeste.Result('CR_PLAN') <> 0) then
            begin
              //**********VERIFICANDO A EXIST�NCIA DE CONTRATOS MULTIBOLETAS**********
              clAux := TClassAuxiliar.Create;
              clAux.Conect('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam('SELECT CR_TOTA,CR_VENT,CR_QBOL                       ');
              clAux.AddParam('FROM CRECTABR                                        ');
              clAux.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CODI=:contrato) AND ');
              clAux.AddParam('      (CR_LOJA=:loja)                                ');
              clAux.consulta.ParamByName('cliente').AsFloat  := clTeste.Result('CR_CLIE');
              clAux.consulta.ParamByName('contrato').AsFloat := clTeste.Result('CR_CONT');
              clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
              //**********************************************************************
              if (clAux.Execute) then
              begin
                if (clAux.Result('CR_QBOL') = '1') then
                begin
                  clieAnt   := 0;
                  clie      := 0;
                  numBoleta := 0;
                  frm_mem_print.AddLine(''+form_nz(strtofloat(Trim(clTeste.Result('CR_CLIE'))),6)+'.'+form_nz(strtofloat(Trim(clTeste.Result('CR_CODI'))),6)+'     '+form_nc(entrada,10)+'  '+form_nc(valor,10)+'');
                  //  subtotalEntrada := subtotalEntrada + entrada;
                  subtotalValor   := subtotalValor + valor;
                  avancaCliente   := true;
                  clieAnt         := clTeste.Result('CR_CLIE');
                  numBoleta       := clTeste.Result('CR_CODI');
                end
                else
                begin
                  //*** USADO NA VERIFICA��O DE ENTRADA POR FORA ***
                  boletaAnt            := 0;
                  boleta               := 0;
                  boletaAnt            := clTeste.Result('CR_CODI');
                  contrato             := clTeste.Result('CR_CONT');
                  contratoAnt          := clTeste.Result('CR_CONT');
                  //************************************************
                  clienteAnt           := clTeste.Result('CR_CLIE');
                  cliente              := clTeste.Result('CR_CLIE');
                  multiEntrada         := 0;
                  multiFinanciado      := 0;
                  contaMulti           := StrToInt(clAux.Result('CR_QBOL'));
                  contaMulti2          := 0;
                  subtraiDinheiro      := false;
                  subtraiCheque        := false;
                  subtraiCartaoDebito  := false;
                  subtraiCartaoCredito := false;
                  multiDinheiro        := 0;
                  multiCheque          := 0;
                  multiCartaoDebito    := 0;
                  multiCartaoCredito   := 0;
                  //*************************************************
                  auxSubtotalDinheiro      := subtotalDinheiro;
                  auxSubtotalCheque        := subtotalCheque;
                  auxSubtotalCartaoDebito  := subtotalCartaoDebito;
                  auxSubtotalCartaoCredito := subtotalCartaoCredito;
                  subtotalDinheiro         := 0;
                  subtotalCheque           := 0;
                  subtotalCartaoDebito     := 0;
                  subtotalCartaoCredito    := 0;
                  //*************************************************
                  while (clienteAnt = cliente) and (not clTeste.Eof) and (contratoAnt = contrato) do
                  begin
                    if (clTeste.Result('VF_FPGT') = 5) then
                    begin
                      if (clTeste.Result('CR_VEND') = 0) or (clTeste.Result('CR_CAIX') = 0) then
                      begin
                        clienteAnt    := 0;
                        cliente       := 1;
                        continuaMulti := false;
                      end
                      else
                      begin
                        multiFinanciado := multiFinanciado + clTeste.Result('CR_FINA');
                        inc(contaMulti2);
                        continuaMulti   := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalDinheiro := subtotalDinheiro + clTeste.Result('CR_VENT');
                        multiDinheiro    := subtotalDinheiro;
                        subtraiDinheiro  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCheque := subtotalCheque + clTeste.Result('CR_VENT');
                        multiCheque    := subtotalCheque;
                        subtraiCheque  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaANt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoDebito := subtotalCartaoDebito + clTeste.Result('CR_VENT');
                        multiCartaoDebito    := subtotalCartaoDebito;
                        subtraiCartaoDebito  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                      if (boletaANt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoCredito := subtotalCartaoCredito + clTeste.Result('CR_VENT');
                        multiCartaoCredito    := subtotalCartaoCredito;
                        subtraiCartaoCredito  := true;
                      end;
                    numContrato   := clTeste.Result('CR_CONT');
                    dataAtual     := clTeste.Result('VE_DATA');
                    clTeste.Next;
                    boleta        := clTeste.Result('CR_CODI');
                    avancaCliente := false;
                    clienteAnt    := cliente;
                    cliente       := clTeste.Result('CR_CLIE');
                    contratoAnt   := contrato;
                    contrato      := clTeste.Result('CR_CONT');
                  end;
                  if (continuaMulti) and (contaMulti = contaMulti2) then
                  begin
                    if (not imprimiu) then
                    begin
                      frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                      frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                      if (chExibeData.Checked) then
                      begin
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      end;
                      imprimiu := true;
                    end
                    else
                    begin
                      if (dataAnt <> dataAtual) and (chExibeData.Checked) then
                      begin
                        dataAnt := dataAtual;
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                        ;
                      end;
                    end;
                    frm_mem_print.AddLine(''+form_nz(clienteAnt,6)+'.'+form_nz(numContrato,6)+'     '+form_nc(subtotalDinheiro+subtotalCheque+subtotalCartaoDebito+subtotalCartaoCredito,10)+'  '+form_nc(multiFinanciado,10)+'');
                    //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                    //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor + multiFinanciado;
                  end
                  else
                  begin
                    if (subtraiDinheiro) then
                      subtotalDinheiro      := subtotalDinheiro - multiDinheiro;
                    if (subtraiCheque) then
                      subtotalCheque        := subtotalCheque - multiCheque;
                    if (subtraiCartaoDebito) then
                      subtotalCartaoDebito  := subtotalCartaoDebito - multiCartaoDebito;
                    if (subtraiCartaoCredito) then
                      subtotalCartaoCredito := subtotalCartaoCredito - multiCartaoCredito;
                    //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                    //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor;
                  end;
                end;
              end
              else
                avancaCliente := true;
              clAux.Desconect;
              clAux.Free;

              if (avancaCliente) then
              begin
                clTeste.Next;
                clie := clTeste.Result('CR_CLIE');
                if (clieAnt = clie) and (clTeste.Result('CR_CODI') = numBoleta) then
                  clTeste.Next;
                if (chExibeData.Checked) then
                begin
                  dataAtual := clTeste.Result('VE_DATA');
                  plano     := clTeste.Result('CR_PLAN');
                  if (dataAnt <> dataAtual) and (planoAnt = plano) then
                  begin
                    frm_mem_print.AddLine('----------------------------------------');
                    frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                    dataAnt := dataAtual;
                  end;
                end;
              end;
              plano   := clTeste.Result('CR_PLAN');
              entrada := clTeste.Result('CR_VENT');
              valor   := clTeste.Result('VF_VALO');
            end
            else
            if (clTeste.Result('VF_FPGT') = 5) and (clTeste.Result('CR_PLAN') <> 0) then
            begin
              //**********VERIFICANDO A EXIST�NCIA DE CONTRATOS MULTIBOLETAS**********
              clAux := TClassAuxiliar.Create;
              clAux.Conect('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam('SELECT CR_TOTA,CR_VENT,CR_QBOL                       ');
              clAux.AddParam('FROM CRECTABR                                        ');
              clAux.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CODI=:contrato) AND ');
              clAux.AddParam('      (CR_LOJA=:loja)                                ');
              clAux.consulta.ParamByName('cliente').AsFloat  := clTeste.Result('CR_CLIE');
              clAux.consulta.ParamByName('contrato').AsFloat := clTeste.Result('CR_CONT');
              clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
              //**********************************************************************
              if (clAux.Execute) then
              begin
                if (clAux.Result('CR_QBOL') = '1') then
                begin
                  clieAnt   := 0;
                  clie      := 0;
                  numBoleta := 0;
                  frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                  frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                  if (chExibeData.Checked) then
                  begin
                    frm_mem_print.AddLine('----------------------------------------');
                    frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                  end;
                  frm_mem_print.AddLine(''+form_nz(strtofloat(Trim(clTeste.Result('CR_CLIE'))),6)+'.'+form_nz(strtofloat(Trim(clTeste.Result('CR_CODI'))),6)+'     '+form_nc(entrada,10)+'  '+form_nc(valor,10)+'');
                                                      //subtotalEntrada := subtotalEntrada + entrada;
                  subtotalValor   := subtotalValor + valor;
                  imprimiu        := true;
                  avancaCliente   := true;
                  clieAnt         := clTeste.Result('CR_CLIE');
                  numBoleta       := clTeste.Result('CR_CODI');
                end
                else
                begin
                  //*** USADO NA VERIFICA��O DE ENTRADA POR FORA ***
                  boletaAnt            := 0;
                  boleta               := 0;
                  boletaAnt            := clTeste.Result('CR_CODI');
                  contrato             := clTeste.Result('CR_CONT');
                  contratoAnt          := clTeste.Result('CR_CONT');
                  //************************************************
                  clienteAnt           := clTeste.Result('CR_CLIE');
                  cliente              := clTeste.Result('CR_CLIE');
                  multiEntrada         := 0;
                  multiFinanciado      := 0;
                  contaMulti           := StrToInt(clAux.Result('CR_QBOL'));
                  contaMulti2          := 0;
                  subtraiDinheiro      := false;
                  subtraiCheque        := false;
                  subtraiCartaoDebito  := false;
                  subtraiCartaoCredito := false;
                  multiDinheiro        := 0;
                  multiCheque          := 0;
                  multiCartaoDebito    := 0;
                  multiCartaoCredito   := 0;
                  //*************************************************
                  auxSubtotalDinheiro      := subtotalDinheiro;
                  auxSubtotalCheque        := subtotalCheque;
                  auxSubtotalCartaoDebito  := subtotalCartaoDebito;
                  auxSubtotalCartaoCredito := subtotalCartaoCredito;
                  subtotalDinheiro         := 0;
                  subtotalCheque           := 0;
                  subtotalCartaoDebito     := 0;
                  subtotalCartaoCredito    := 0;
                  //*************************************************
                  while (clienteAnt = cliente) and (not clTeste.Eof) and (contratoAnt = contrato) do
                  begin
                    if (clTeste.Result('VF_FPGT') = 5) then
                    begin
                      if (clTeste.Result('CR_VEND') = 0) or (clTeste.Result('CR_CAIX') = 0) then
                      begin
                        clienteAnt    := 0;
                        cliente       := 1;
                        continuaMulti := false;
                      end
                      else
                      begin
                        multiFinanciado := multiFinanciado + clTeste.Result('CR_FINA');
                        inc(contaMulti2);
                        continuaMulti   := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalDinheiro := subtotalDinheiro + clTeste.Result('CR_VENT');
                        multiDinheiro    := subtotalDinheiro;
                        subtraiDinheiro  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCheque := subtotalCheque + clTeste.Result('CR_VENT');
                        multiCheque    := subtotalCheque;
                        subtraiCheque  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoDebito := subtotalCartaoDebito + clTeste.Result('CR_VENT');
                        multiCartaoDebito    := subtotalCartaoDebito;
                        subtraiCartaoDebito  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoCredito := subtotalCartaoCredito + clTeste.Result('CR_VENT');
                        multiCartaoCredito    := subtotalCartaoCredito;
                        subtraiCartaoCredito  := true;
                      end;
                    numContrato   := clTeste.Result('CR_CONT');
                    dataAtual     := clTeste.Result('VE_DATA');
                    clTeste.Next;
                    boleta        := clTeste.Result('CR_CODI');
                    avancaCliente := false;
                    clienteAnt    := cliente;
                    cliente       := clTeste.Result('CR_CLIE');
                    contratoAnt   := contrato;
                    contrato      := clTeste.Result('CR_CONT');
                  end;
                  if (continuaMulti) and (contaMulti = contaMulti2) then
                  begin
                    if (not imprimiu) then
                    begin
                      frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                      frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                      if (chExibeData.Checked) then
                      begin
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      end;
                      imprimiu := true;
                    end
                    else
                    begin
                      if (dataAnt <> dataAtual) and (chExibeData.Checked) then
                      begin
                        dataAnt := dataAtual;
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      end;
                    end;
                    frm_mem_print.AddLine(''+form_nz(clienteAnt,6)+'.'+form_nz(numContrato,6)+'     '+form_nc(subtotalDinheiro+subtotalCheque+subtotalCartaoDebito+subtotalCartaoCredito,10)+'  '+form_nc(multiFinanciado,10)+'');
                    //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                    //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor + multiFinanciado;
                  end
                  else
                  begin
                    if (subtraiDinheiro) then
                      subtotalDinheiro      := subtotalDinheiro - multiDinheiro;
                    if (subtraiCheque) then
                      subtotalCheque        := subtotalCheque - multiCheque;
                    if (subtraiCartaoDebito) then
                      subtotalCartaoDebito  := subtotalCartaoDebito - multiCartaoDebito;
                    if (subtraiCartaoCredito) then
                      subtotalCartaoCredito := subtotalCartaoCredito - multiCartaoCredito;
                    //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                    //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor;
                  end;
                end;
              end
              else
                avancaCliente := true;
              clAux.Desconect;
              clAux.Free;

              if (avancaCliente) then
              begin
                clTeste.Next;
                clie := clTeste.Result('CR_CLIE');
                if (clieAnt = clie) and (clTeste.Result('CR_CODI') = numBoleta) then
                  clTeste.Next;
                if (chExibeData.Checked) then
                begin
                  dataAtual := clTeste.Result('VE_DATA');
                  plano     := clTeste.Result('CR_PLAN');
                  if (dataAnt <> dataAtual) and (planoAnt = plano) then
                  begin
                    frm_mem_print.AddLine('----------------------------------------');
                    frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                    dataAnt := dataAtual;
                  end;
                end;
              end;
              plano   := clTeste.Result('CR_PLAN');
              entrada := clTeste.Result('CR_VENT');
              valor   := clTeste.Result('VF_VALO');
            end
            else
            begin
              //**********VERIFICANDO A EXIST�NCIA DE CONTRATOS MULTIBOLETAS**********
              clAux := TClassAuxiliar.Create;
              clAux.Conect('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam('SELECT CR_TOTA,CR_VENT,CR_QBOL                       ');
              clAux.AddParam('FROM CRECTABR                                        ');
              clAux.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CODI=:contrato) AND ');
              clAux.AddParam('      (CR_LOJA=:loja)                                ');
              clAux.consulta.ParamByName('cliente').AsFloat  := clTeste.Result('CR_CLIE');
              clAux.consulta.ParamByName('contrato').AsFloat := clTeste.Result('CR_CONT');
              clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
              //**********************************************************************
              if (clAux.Execute) then
              begin
                if (clAux.Result('CR_QBOL') = '1') then
                begin
                  if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    subtotalDinheiro := subtotalDinheiro + valor;
                    subtotalEntrada  := subtotalEntrada + valor;
                    avancaCliente    := true;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    subtotalCheque  := subtotalCheque + valor;
                    subtotalEntrada := subtotalEntrada + valor;
                    avancaCliente   := true;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    subtotalCartaoDebito := subtotalCartaoDebito + valor;
                    subtotalEntrada      := subtotalEntrada + valor;
                    avancaCliente        := true;
                  end
                  else
                  if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                  begin
                    subtotalCartaoCredito := subtotalCartaoCredito + valor;
                    subtotalEntrada       := subtotalEntrada + valor;
                    avancaCliente         := true;
                  end;
                end
                else
                begin
                  //*** USADO NA VERIFICA��O DE ENTRADA POR FORA ***
                  boletaAnt            := 0;
                  boleta               := 0;
                  boletaAnt            := clTeste.Result('CR_CODI');
                  contrato             := clTeste.Result('CR_CONT');
                  contratoAnt          := clTeste.Result('CR_CONT');
                  //************************************************
                  clienteAnt           := clTeste.Result('CR_CLIE');
                  cliente              := clTeste.Result('CR_CLIE');
                  multiEntrada         := 0;
                  multiFinanciado      := 0;
                  contaMulti           := StrToInt(clAux.Result('CR_QBOL'));
                  contaMulti2          := 0;
                  subtraiDinheiro      := false;
                  subtraiCheque        := false;
                  subtraiCartaoDebito  := false;
                  subtraiCartaoCredito := false;
                  multiDinheiro        := 0;
                  multiCheque          := 0;
                  multiCartaoDebito    := 0;
                  multiCartaoCredito   := 0;
                  //*************************************************
                  auxSubtotalDinheiro      := subtotalDinheiro;
                  auxSubtotalCheque        := subtotalCheque;
                  auxSubtotalCartaoDebito  := subtotalCartaoDebito;
                  auxSubtotalCartaoCredito := subtotalCartaoCredito;
                  subtotalDinheiro         := 0;
                  subtotalCheque           := 0;
                  subtotalCartaoDebito     := 0;
                  subtotalCartaoCredito    := 0;
                  //*************************************************
                  while (clienteAnt = cliente) and (not clTeste.Eof) and (contratoAnt = contrato) do
                  begin
                    if (clTeste.Result('VF_FPGT') = 5) then
                    begin
                      if (clTeste.Result('CR_VEND') = 0) or (clTeste.Result('CR_CAIX') = 0) then
                      begin
                        clienteAnt    := 0;
                        cliente       := 1;
                        continuaMulti := false;
                      end
                      else
                      begin
                        multiFinanciado := multiFinanciado + clTeste.Result('CR_FINA');
                        inc(contaMulti2);
                        continuaMulti   := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 1) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalDinheiro := subtotalDinheiro + clTeste.Result('CR_VENT');
                        multiDinheiro    := subtotalDinheiro;
                        subtraiDinheiro  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 2) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCheque := subtotalCheque + clTeste.Result('CR_VENT');
                        multiCheque    := subtotalCheque;
                        subtraiCheque  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 3) and (clTeste.Result('CR_PLAN') <> 0) then
                    begin
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoDebito := subtotalCartaoDebito + clTeste.Result('CR_VENT');
                        multiCartaoDebito    := subtotalCartaoDebito;
                        subtraiCartaoDebito  := true;
                      end;
                    end
                    else
                    if (clTeste.Result('VF_FPGT') = 4) and (clTeste.Result('CR_PLAN') <> 0) then
                      if (boletaAnt <> boleta) then
                      begin
                        if (boleta <> 0) then
                          boletaAnt := boleta;
                        subtotalCartaoCredito := subtotalCartaoCredito + clTeste.Result('CR_VENT');
                        multiCartaoCredito    := subtotalCartaoCredito;
                        subtraiCartaoCredito  := true;
                      end;
                    numContrato   := clTeste.Result('CR_CONT');
                    dataAtual     := clTeste.Result('VE_DATA');
                    clTeste.Next;
                    boleta        := clTeste.Result('CR_CODI');
                    avancaCliente := false;
                    clienteAnt    := cliente;
                    cliente       := clTeste.Result('CR_CLIE');
                    contratoAnt   := contrato;
                    contrato      := clTeste.Result('CR_CONT');
                  end;
                  if (continuaMulti) and (contaMulti = contaMulti2) then
                  begin
                    if (not imprimiu) then
                    begin
                      frm_mem_print.AddLine('Plano '+form_nz(plano,3)+': '+descPlano+'');
                      frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                      if (chExibeData.Checked) then
                      begin
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      end;
                      imprimiu := true;
                    end
                    else
                    begin
                      if (dataAnt <> dataAtual) and (chExibeData.Checked) then
                      begin
                        dataAnt := dataAtual;
                        frm_mem_print.AddLine('----------------------------------------');
                        frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                      end;
                    end;
                    frm_mem_print.AddLine(''+form_nz(clienteAnt,6)+'.'+form_nz(numContrato,6)+'     '+form_nc(subtotalDinheiro+subtotalCheque+subtotalCartaoDebito+subtotalCartaoCredito,10)+'  '+form_nc(multiFinanciado,10)+'');
                    //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                    //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor + multiFinanciado;
                  end
                  else
                  begin
                    if (subtraiDinheiro) then
                      subtotalDinheiro      := subtotalDinheiro - multiDinheiro;
                    if (subtraiCheque) then
                      subtotalCheque        := subtotalCheque - multiCheque;
                    if (subtraiCartaoDebito) then
                      subtotalCartaoDebito  := subtotalCartaoDebito - multiCartaoDebito;
                    if (subtraiCartaoCredito) then
                      subtotalCartaoCredito := subtotalCartaoCredito - multiCartaoCredito;
                      //*** SOMA OS VALORES DE CADA ENTRADA DO MULTIBOLETA NA CONTA TOTAL DE ENTRADAS ****
                    subtotalDinheiro      := subtotalDinheiro + auxSubtotalDinheiro;
                    subtotalCheque        := subtotalCheque + auxSubtotalCheque;
                    subtotalCartaoDebito  := subtotalCartaoDebito + auxSubtotalCartaoDebito;
                    subtotalCartaoCredito := subtotalCartaoCredito + auxSubtotalCartaoCredito;
                      //**********************************************************************************
                    subtotalEntrada       := subtotalDinheiro + subtotalCheque + subtotalCartaoDebito + subtotalCartaoCredito;
                    subtotalValor         := subtotalValor;
                  end;
                end;
              end
              else
                avancaCliente := true;
              clAux.Desconect;
              clAux.Free;

              if (avancaCliente) then
              begin
                clTeste.Next;
                if (chExibeData.Checked) then
                begin
                  dataAtual := clTeste.Result('VE_DATA');
                  plano     := clTeste.Result('CR_PLAN');
                  if (dataAnt <> dataAtual) and (planoAnt = plano) then
                  begin
                    frm_mem_print.AddLine('----------------------------------------');
                    frm_mem_print.AddLine('Crediarios de: '+FormatDateTime('dd/mm/yyyy',dataAtual)+'');
                    dataAnt := dataAtual;
                  end;
                end;
              end;
              plano   := clTeste.Result('CR_PLAN');
              entrada := clTeste.Result('CR_VENT');
              valor   := clTeste.Result('VF_VALO');
            end;
            if (planoAnt = 0) and (plano = 0) then
            begin
              clTeste.next;
              if (chExibeData.Checked) then
              begin
                dataAtual := clTeste.Result('VE_DATA');
                dataAnt   := clTeste.Result('VE_DATA');
              end;
              planoAnt := clTeste.Result('CR_PLAN');
              plano    := clTeste.Result('CR_PLAN');
              entrada  := clTeste.Result('CR_VENT');
              valor    := clTeste.Result('VF_VALO');
            end;
          end;
          descPlano := '';
          imprimiu  := false;
          if (subtotalDinheiro <> 0) or (subtotalCheque <> 0) or (subtotalCartaoDebito <> 0) or (subtotalCartaoCredito <> 0) then
            frm_mem_print.AddLine('Entradas p/ forma pgto:');
          if (subtotalDinheiro <> 0) then
            frm_mem_print.AddLine('DINHEIRO:              '+form_nc(subtotalDinheiro,10)+'');
          if (subtotalCheque <> 0) then
            frm_mem_print.AddLine('CHEQUE A VISTA:        '+form_nc(subtotalCheque,10)+'');
          if (subtotalCartaoDebito <> 0) then
            frm_mem_print.AddLine('CARTAO DEBITO:         '+form_nc(subtotalCartaoDebito,10)+'');
          if (subtotalCartaoCredito <> 0) then
            frm_mem_print.AddLine('CARTAO CREDITO:        '+form_nc(subtotalCartaoCredito,10)+'');

          if (planoAnt <> 0) and ((subtotalEntrada <> 0) or (subtotalValor <> 0)) then
          begin
            frm_mem_print.AddLine('----------------------------------------');
            frm_mem_print.AddLine('TOTAL PLANO '+form_nz(planoAnt,3)+':  '+form_nc(subtotalEntrada,10)+'  '+form_nc(subtotalValor,10)+'');
            frm_mem_print.AddLine('----------------------------------------');
          end;
          planoAnt := plano;
          totalEntrada          := totalEntrada + subtotalEntrada;
          totalValor            := totalValor + subtotalValor;
          subtotalDinheiro      := 0;
          subtotalCheque        := 0;
          subtotalCartaoDebito  := 0;
          subtotalCartaoCredito := 0;
          subtotalEntrada       := 0;
          subtotalValor         := 0;
        end;
        if (planoAnt <> 0) and {(imprimiu)} ((totalEntrada <> 0) or (totalValor <> 0)) then
        begin
          frm_mem_print.AddLine('TOTAL CREDIARIOS: '+form_nc(totalEntrada,10)+'  '+form_nc(totalValor,10));
          frm_mem_print.AddLine('----------------------------------------');
          a_total_crediarios := totalValor;
        end;
      end;
      clTeste.Desconect;
      clTeste.Free;
         //*************************** CREDIARIOS SEM VENDA ******************************************
      imprimiu         := false;
      imprimeCabecalho := true;
      imprimeOBS       := false;
      descPlano        := '';
      if (frm_principal.servidor_credito.Connected) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.Conect('CREDITO',self);
        clAux.ClearSql;
        clAux.AddParam('SELECT CR_CLIE,CR_CODI,CR_LOJA,CR_DNOT,CR_PLAN, '+
                       '       CR_TOTA,CR_VENT,CR_QBOL                  '+
                       'FROM CRECTABR                                   '+
                       'WHERE (CR_LOJA=:loja) AND (CR_QBOL=1) AND       '+
                       '      ((CR_DNOT>=:data) AND (CR_DNOT<=:data2))  '+
                       'ORDER BY CR_PLAN,CR_CLIE,CR_CODI,CR_LOJA        ');
        if (fEstoque) then
        begin
          clAux.consulta.ParamByName('data').AsDateTime  := Data.GetValor;
          clAux.consulta.ParamByName('data2').AsDateTime := Data2.GetValor;
        end
        else
        begin
          clAux.consulta.ParamByName('data').AsDateTime  := frm_principal.x_data_trabalho;
          clAux.consulta.ParamByName('data2').AsDateTime := frm_principal.x_data_trabalho;
        end;
        clAux.consulta.ParamByName('loja').AsFloat := frm_principal.x_loja;
        if (clAux.Execute) then
        begin
          clAux.First;
          planoAnt := clAux.Result('CR_PLAN');
          plano    := clAux.Result('CR_PLAN');
          while (not clAux.Eof) do
          begin
            clAux2 := TClassAuxiliar.Create;
            clAux2.Conect(DataBaseProdutos,self);
            clAux2.ClearSql;
            clAux2.AddParam('SELECT CR_CLIE,CR_CODI,CR_LOJA,CR_PLAN '+
                            'FROM CREDIARIOS                        '+
                            'WHERE (CR_CLIE=:cliente) AND           '+
                            '      (CR_CODI=:contrato) AND          '+
                            '      (CR_LOJA=:loja) AND              '+
                            '      (CR_PLAN=:plano)                 ');
            clAux2.consulta.ParamByName('cliente').AsFloat  := clAux.Result('CR_CLIE');
            clAux2.consulta.ParamByName('contrato').AsFloat := clAux.Result('CR_CODI');
            clAux2.consulta.ParamByName('loja').AsFloat     := clAux.Result('CR_LOJA');
            clAux2.consulta.ParamByName('plano').AsFloat    := clAux.Result('CR_PLAN');
            if (clAux2.Execute) then
            begin
              clAux.Next;
              planoAnt := clAux.Result('CR_PLAN');
              plano    := clAux.Result('CR_PLAN');
            end
            else
            begin
              if (imprimeCabecalho) then
              begin
                frm_mem_print.AddLine('');
                frm_mem_print.AddLine('= = = = = CREDIARIOS SEM VENDA = = = = =');
                imprimeCabecalho := false;
                imprimeOBS       := true;
              end;
              if (not clAux.Eof) then
              begin
                if (planoAnt = plano) and (not imprimiu) then
                begin
                  //****** PEGA A DESCRI��O DO PLANO *************
                  clAux3 := TClassAuxiliar.Create;
                  clAux3.Conect('CREDITO',self);
                  clAux3.ClearSql;
                  clAux3.AddParam('SELECT PL_TIPO            ');
                  clAux3.AddParam('FROM CREDPLANO            ');
                  clAux3.AddParam('WHERE (PL_CODI=:codiPlano)');
                  clAux3.consulta.ParamByName('codiPlano').AsFloat := plano;
                  if (clAux3.Execute) then
                    descPlano := descPlano + clAux3.Result('PL_TIPO')
                  else
                    descPlano := '';
                  clAux3.Desconect;
                  clAux3.Free;
                  //**********************************************
                  frm_mem_print.AddLine('Plano '+form_nz(clAux.Result('CR_PLAN'),3)+':  '+descPlano+'');
                  frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                  frm_mem_print.AddLine(''+form_nz(clAux.Result('CR_CLIE'),6)+'.'+form_nz(clAux.Result('CR_CODI'),6)+'     '+form_nc(clAux.Result('CR_VENT'),10)+'  '+form_nc(clAux.Result('CR_TOTA'),10)+'');
                  imprimiu := true;
                end
                else
                  frm_mem_print.AddLine(''+form_nz(clAux.Result('CR_CLIE'),6)+'.'+form_nz(clAux.Result('CR_CODI'),6)+'     '+form_nc(clAux.Result('CR_VENT'),10)+'  '+form_nc(clAux.Result('CR_TOTA'),10)+'');
                clAux.Next;
                plano := clAux.Result('CR_PLAN');
              end;
              if (planoAnt = plano) then
                imprimiu := true
              else
              begin
                frm_mem_print.AddLine('');
                imprimiu := false;
              end;
              planoAnt  := plano;
              plano     := clAux.Result('CR_PLAN');
              descPlano := '';
            end;
            clAux2.Desconect;
            clAux2.Free;
          end;
          if (imprimeOBS) then
          begin
            frm_mem_print.AddLine('');
            frm_mem_print.AddLine('OBS.: Falta o lancamento das vendas dos ');
            frm_mem_print.AddLine('contratos acima.                        ');
            frm_mem_print.AddLine('----------------------------------------');
          end;
          imprimeCabecalho  := true;
          imprimeOBS        := false;
          imprimiu          := false;
          descPlano         := '';
        end;
                //******* CREDI�RIOS SEM VENDA - MULTIBOLETAS ******************************************
        clAux2 := TClassAuxiliar.Create;
        clAux2.Conect(DataBaseProdutos,self);

        clAux.ClearSql;
        clAux.AddParam('SELECT CR_CLIE,CR_CODI,CR_LOJA,CR_DNOT,CR_PLAN,CR_TOTA,CR_VENT,CR_QBOL   ');
        clAux.AddParam('FROM CRECTABR                                                            ');
        clAux.AddParam('WHERE (CR_LOJA=:loja) AND (CR_QBOL>1) AND                                ');
        clAux.AddParam('      ((CR_DNOT>=:data) AND (CR_DNOT<=:data2))                           ');
        clAux.AddParam('ORDER BY CR_PLAN,CR_CLIE,CR_CODI,CR_LOJA                                 ');
        if (fEstoque) then
        begin
          clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
          clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
        end
        else
        begin
          clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
          clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
        end;
        clAux.consulta.ParamByName('loja').AsFloat             := frm_principal.x_loja;
        if (clAux.Execute) then
        begin
          planoAnt := clAux.Result('CR_PLAN');
          plano    := clAux.Result('CR_PLAN');
          clAux.First;
          while (not clAux.Eof) do
          begin
            clAux2.ClearSql;
            clAux2.AddParam('SELECT *                                                             ');
            clAux2.AddParam('FROM CREDIARIOS                                                      ');
            clAux2.AddParam('WHERE (CR_CLIE=:cliente) AND (CR_CONT=:contrato) AND (CR_LOJA=:loja) ');
            clAux2.AddParam('  AND (CR_CAIX=0) AND (CR_VEND=0)                                    ');
            clAux2.AddParam('ORDER BY CR_PLAN,CR_CLIE,CR_LOJA,CR_CONT,CR_CODI                     ');
            clAux2.consulta.ParamByName('cliente').AsFloat   := clAux.Result('CR_CLIE');
            clAux2.consulta.ParamByName('contrato').AsFloat  := clAux.Result('CR_CODI');
            clAux2.consulta.ParamByName('loja').AsFloat      := clAux.Result('CR_LOJA');
            if (clAux2.Execute) then
            begin
              if (imprimeCabecalho) then
              begin
                frm_mem_print.AddLine('');
                frm_mem_print.AddLine('== CREDIARIOS SEM VENDA (MULTIBOLETA) ==');
                imprimeCabecalho := false;
                imprimeOBS       := true;
              end;
              clAux2.First;
              while (not clAux2.Eof) do
                if (planoAnt = plano) then
                begin
                  if (not imprimiu) then
                  begin
                                                    //****** PEGA A DESCRI��O DO PLANO *************
                    clAux3 := TClassAuxiliar.Create;
                    clAux3.Conect('CREDITO',self);
                    clAux3.ClearSql;
                    clAux3.AddParam('SELECT PL_TIPO            ');
                    clAux3.AddParam('FROM CREDPLANO            ');
                    clAux3.AddParam('WHERE (PL_CODI=:codiPlano)');
                    clAux3.consulta.ParamByName('codiPlano').AsFloat := plano;
                    if (clAux3.Execute) then
                      descPlano := descPlano + clAux3.Result('PL_TIPO')
                    else
                      descPlano := '';
                    clAux3.Desconect;
                    clAux3.Free;
                                                    //**********************************************
                    frm_mem_print.AddLine('----------------------------------------');
                    frm_mem_print.AddLine('Plano '+form_nz(clAux.Result('CR_PLAN'),3)+':  '+descPlano+'');
                    frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
                    frm_mem_print.AddLine('   Boletas   Entrada  Financiado');
                    imprimiu := true;
                  end;
                  frm_mem_print.AddLine(''+form_nz(clAux.Result('CR_CLIE'),6)+'.'+form_nz(clAux.Result('CR_CODI'),6)+'     '+form_nc(clAux.Result('CR_VENT'),10)+'  '+form_nc(clAux.Result('CR_TOTA'),10)+'');
                  frm_mem_print.AddLine('   '+form_nz(clAux2.Result('CR_CODI'),6)+' '+form_nc(clAux2.Result('CR_VENT'),10)+'  '+form_nc(clAux2.Result('CR_FINA'),10)+'');
                  if (clAux.Result('CR_QBOL') = '2') then
                  begin
                    clAux2.Next;
                    if (not clAux2.Eof) and (clAux2.Result('CR_CAIX') = 0) and (clAux2.Result('CR_VEND') = 0) then
                      frm_mem_print.AddLine('   '+form_nz(clAux2.Result('CR_CODI'),6)+' '+form_nc(clAux2.Result('CR_VENT'),10)+'  '+form_nc(clAux2.Result('CR_FINA'),10)+'');
                    clAux2.Next;
                  end
                  else
                  if (clAux.Result('CR_QBOL') = '3') then
                  begin
                    clAux2.Next;
                    if (not clAux2.Eof) and (clAux2.Result('CR_CAIX') = 0) and (clAux2.Result('CR_VEND') = 0) then
                      frm_mem_print.AddLine('   '+form_nz(clAux2.Result('CR_CODI'),6)+' '+form_nc(clAux2.Result('CR_VENT'),10)+'  '+form_nc(clAux2.Result('CR_FINA'),10)+'');
                    clAux2.Next;
                    if (not clAux2.Eof) and (clAux2.Result('CR_CAIX') = 0) and (clAux2.Result('CR_VEND') = 0) then
                      frm_mem_print.AddLine('   '+form_nz(clAux2.Result('CR_CODI'),6)+' '+form_nc(clAux2.Result('CR_VENT'),10)+'  '+form_nc(clAux2.Result('CR_FINA'),10)+'');
                    clAux2.Next;
                  end;
                end
                else
                begin
                  planoAnt := plano;
                  imprimiu := false;
                end;
              clAux.Next;
              planoAnt := plano;
              plano    := clAux.Result('CR_PLAN');
              if (planoAnt = plano) then
                imprimiu := true
              else
              if (not clAux.Eof) then
              begin
                frm_mem_print.AddLine('');
                imprimiu := false;
              end;
              descPlano      := '';
            end
            else
              clAux.Next;
            planoAnt := plano;
            plano    := clAux.Result('CR_PLAN');
          end;
        end;
        if (imprimeOBS) then
        begin
          frm_mem_print.AddLine('');
          frm_mem_print.AddLine('OBS.: Falta o lancamento das vendas das ');
          frm_mem_print.AddLine('boletas dos contratos acima.            ');
          frm_mem_print.AddLine('----------------------------------------');
        end;
        clAux2.Desconect;
        clAux2.Free;
        clAux.Desconect;
        clAux.Free;
      end;
         //*************************** VENDAS SEM CREDIARIO *******************************************
      if (frm_principal.servidor_credito.Connected) then
      begin
        imprimiu := false;
        imprimeCabecalho := true;
        imprimeOBS := false;
        clTeste := TClassAuxiliar.Create;
        clTeste.Conect(DataBaseProdutos,self);
        clTeste.ClearSql;
        clTeste.AddParam('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX,VF_FPGT,CR_VENT,CR_CODI,CR_PLAN,CR_CLIE  ');
        clTeste.AddParam('FROM VENDAS_FORMA_PAGAMENTO,VENDAS,CREDIARIOS                                                   ');
        clTeste.AddParam('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND     ');
        clTeste.AddParam('      (CR_LOJA=VF_LOJA) AND (CR_VEND=VF_VEND) AND (CR_CAIX=VE_CAIX) AND                         ');
        clTeste.AddParam('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND                                                     ');
        clTeste.AddParam('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                                  ');
        if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
          clTeste.AddParam ('AND (VE_FUNC=:caixa)                                                                   ');
        if (tipz='1') or (tipz='2') then
          clTeste.AddParam('AND (VE_TIPZ=:tipz)                                                                     ');
        clTeste.AddParam('ORDER BY CR_CLIE,CR_CODI                                                                        ');
        clTeste.consulta.ParamByName('loja').AsFloat             := frm_principal.x_loja;
        if (fEstoque) then
        begin
          clTeste.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
          clTeste.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
        end
        else
        begin
          clTeste.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
          clTeste.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
        end;
        if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
          clTeste.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
        if (tipz='1') or (tipz='2') then
          clTeste.consulta.parambyname('tipz').AsString    := tipz;
        if (clTeste.Execute) then
        begin
          clTeste.First;
          while (not clTeste.Eof) do
          begin
            if (clTeste.Result('CR_PLAN') = 0) and (clTeste.Result('VF_FPGT') = 5) then
              if (imprimeCabecalho) then
              begin
                frm_mem_print.AddLine('');
                frm_mem_print.AddLine('= = = = = VENDAS SEM CREDIARIO = = = = =');
                imprimeCabecalho := false;
                imprimeOBS := true;
              end;
            if (not imprimiu) and (clTeste.Result('CR_PLAN') = 0) and (clTeste.Result('VF_FPGT') = 5) then
            begin
              frm_mem_print.AddLine(' Cli  | CTR          Entrada  Financiado');
              frm_mem_print.AddLine(''+form_nz(clTeste.Result('CR_CLIE'),6)+'.'+form_nz(clTeste.Result('CR_CODI'),6)+'     '+form_nc(clTeste.Result('CR_VENT'),10)+'  '+form_nc(clTeste.Result('VF_VALO'),10)+'');
              imprimiu := true;
            end
            else
            if (clTeste.Result('CR_PLAN') = 0) and (clTeste.Result('VF_FPGT') = 5) then
              frm_mem_print.AddLine(''+form_nz(clTeste.Result('CR_CLIE'),6)+'.'+form_nz(clTeste.Result('CR_CODI'),6)+'     '+form_nc(clTeste.Result('CR_VENT'),10)+'  '+form_nc(clTeste.Result('VF_VALO'),10)+'');
            clTeste.Next;
          end;

          if (imprimeOBS) then
          begin
            frm_mem_print.AddLine('');
            frm_mem_print.AddLine('OBS.: Falta o lancamento dos contratos  ');
            frm_mem_print.AddLine('das vendas acima.                       ');
            frm_mem_print.AddLine('----------------------------------------');
            frm_mem_print.AddLine('');
          end;
        end;
        clTeste.Desconect;
        clTeste.Free;
      end;
    end;

         {---------------------------------------------------------------}
         {      CLIENTES QUE UTILIZAM O SISTEMA DE CR�DITO E COBRAN�A    }
         {---------------------------------------------------------------}
         {-------------------------FIM-----------------------------------}

{Rodrigo Cordeiro ----------------------------------Fim--------------------------------------------------------------------}


          //6. VALES RECEBIDOS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                       ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                           ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND  ');
    clAux.AddParam ('      (VF_FPGT=:formapagamento1) AND                                                         ');
    clAux.AddParam ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND                                                  ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                               ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                   ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                   ');
    clAux.consulta.parambyname('loja').AsFloat            := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat     := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento1').AsFloat := KFPGT_VALES;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    a_total_vales_recebidos := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('= = = = = (6)VALES RECEBIDOS = = = = = =');
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT VE_NUME,VE_TIPO,VE_VALO FROM VALES_RECEBIDOS                                             ');
        clAux2.AddParam ('WHERE (VE_LOJA=:loja) AND (VE_VEND=:codigovenda) AND (VE_ORDE=:ordem)                           ');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.AddParam ('AND (VE_CAIX=:terminal)                                                                        ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.consulta.parambyname('terminal').AsFloat    := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
        begin
          if (clAux2.result('VE_TIPO')='P') then
            tipo_vale:='Presente'
          else
          if (clAux2.result('VE_TIPO')='S') then
            tipo_vale:='Simples '
          else
          if (clAux2.result('VE_TIPO')='T') then
            tipo_vale:='Troco   '
          else
          if (clAux2.result('VE_TIPO')='D') then
            tipo_vale:='Desconto'
          else
          if (clAux2.result('VE_TIPO')='B') then
            tipo_vale:='Brinde  '
          else
          if (clAux2.result('VE_TIPO')='O') then
            tipo_vale:='Bonus   ';
          frm_mem_print.AddLine(PadL(vartostr(clAux2.result('VE_NUME')),9,' ')+
            ','+tipo_vale+','+
            '(R$ '+form_nc(clAux2.result('VE_VALO'),8)+') '+
            form_nc (clAux.result('VF_VALO'),7))
        end
        else
          frm_mem_print.AddLine(''+form_t  ('?',20)+'  '+
            form_nc (clAux.result('VF_VALO'),18));
        a_total_troco_vales     := a_total_troco_vales     + clAux.result('VF_TROC');
        a_total_vales_recebidos := a_total_vales_recebidos + clAux.result('VF_VALO');
        clAux2.desconect;
        clAux2.Free;
                    {--->}
        clAux.next;
      end;

//               frm_mem_print.AddLine('Total em Troco.........: '+form_nc(a_total_troco_vales,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL VALE RECEBIDO....: '+form_nc(a_total_vales_recebidos,15));
      frm_mem_print.AddLine('----------------------------------------');
//               frm_mem_print.AddLine('Total liquido..........: '+form_nc(a_total_vales_recebidos,15));
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

    a_total_do_caixa := a_total_dinheiro + a_total_cartao + a_total_debito + a_total_cheque + a_total_vales_recebidos + a_total_crediarios;
          {... --------------------------------------------------------------------------------}
          {...}

//Marcio--------------------------------------------------------------
          //7. VALES EMITIDOS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                       ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                           ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND  ');
    clAux.AddParam ('      (VF_FPGT=:formapagamento1) AND                                                         ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                               ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                   ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                                  ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                   ');
    clAux.consulta.parambyname('loja').AsFloat            := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat     := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento1').AsFloat := KFPGT_VALES_EMI;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString     := tipz; {*}
    a_total_vales_emitidos := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = (7) VALES EMITIDOS = = = = = =');
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT VE_NUME,VE_TIPO,VE_VALO FROM VALES_RECEBIDOS                                             ');
        clAux2.AddParam ('WHERE (VE_LOJA=:loja) AND (VE_VEND=:codigovenda) AND (VE_ORDE=:ordem) AND (VE_CAIX=:terminal)   ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
        clAux2.consulta.parambyname('terminal').AsFloat    := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
        begin
          if (clAux2.result('VE_TIPO')='P') then
            tipo_vale:='Presente'
          else
          if (clAux2.result('VE_TIPO')='S') then
            tipo_vale:='Simples '
          else
          if (clAux2.result('VE_TIPO')='T') then
            tipo_vale:='Troco   '
          else
          if (clAux2.result('VE_TIPO')='D') then
            tipo_vale:='Desconto'
          else
          if (clAux2.result('VE_TIPO')='B') then
            tipo_vale:='Brinde  '
          else
          if (clAux2.result('VE_TIPO')='O') then
            tipo_vale:='Bonus   ';
          frm_mem_print.AddLine(PadL(vartostr(clAux2.result('VE_NUME')),9,' ')+
            ','+tipo_vale+','+
            '(R$ '+form_nc(clAux2.result('VE_VALO'),8)+') '+
            form_nc (clAux.result('VF_VALO'),7))
        end
        else
          frm_mem_print.AddLine(''+form_t  ('?',20)+'  '+
            form_nc (clAux.result('VF_VALO'),18));
        a_total_troco_vales     := a_total_troco_vales     + clAux.result('VF_TROC');
        a_total_vales_emitidos := a_total_vales_emitidos + clAux.result('VF_VALO');
        clAux2.desconect;
        clAux2.Free;
                    {--->}
        clAux.next;
      end;

//               frm_mem_print.AddLine('Total em Troco.........: '+form_nc(a_total_troco_vales,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL VALE EMITIDO.....: '+form_nc(a_total_vales_emitidos,15));
      frm_mem_print.AddLine('----------------------------------------');
//               frm_mem_print.AddLine('Total liquido..........: '+form_nc(a_total_vales_emitidos,15));
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

          {...}

          //8 VALES RECEBIDOS FUNCION�RIOS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                       ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                           ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND  ');
    clAux.AddParam ('      (VF_FPGT=:formapagamento1) AND                                                         ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                               ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                   ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                                  ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                   ');
    clAux.consulta.parambyname('loja').AsFloat            := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat        := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento1').AsFloat := KFPGT_VALE_MERC;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString        := tipz; {*}
    a_total_vales_merc := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = (8)VALE MERCADORIA FUNCIONARIO = = = ');
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT * FROM VALES_MERC                                       ');
        clAux2.AddParam ('WHERE (VM_LOJA=:loja) AND (VM_VEND=:codigovenda) AND (VM_ORDE=:ordem)    ');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.AddParam ('AND (VM_CAIX=:terminal)                                                                                              ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.consulta.parambyname('terminal').AsFloat    := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
        begin
          frm_mem_print.AddLine('(Doc.'+form_t  (clAux2.result('VM_NUME'),10) +'Func.:'+
            form_n(clAux2.Result('VM_CFUN'),8)+') '+
            form_nc (clAux2.result('VM_VALO'),09));
          a_total_vales_merc := a_total_vales_merc + clAux2.result('VM_VALO');
          if (frm_principal.x_soma_valefunc_total_venda) then
            a_total_do_caixa := a_total_do_caixa + clAux2.result('VM_VALO');
        end;
        clAux2.desconect;
        clAux2.Free;
                    {--->}
        clAux.next;
      end;

      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL VALE FUNCIONARIO.: '+form_nc(a_total_vales_merc,15));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;
//Marcio-------------------------------------------

          //VALES MERCADORIAS ------------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VA_VALO,VA_NDOC,VA_EMPR                      ');
    clAux.AddParam ('FROM VALES_MERCADORIAS                              ');
    clAux.AddParam ('WHERE (VA_LOJA=:loja) AND                           ');
    clAux.AddParam ('      ((VA_DATA>=:data) AND (VA_DATA<=:data2))      ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VA_FUNC=:caixa)                          ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VA_TIPZ=:tipz)                          ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    b_total_vales_mercadorias := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = = VALES MERCADORIAS = = = = = ');
      clAux.first;
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('(Doc.'+form_t  (clAux.result('VA_NDOC'),11) +',Empr.'+
          form_nz (clAux.result('VA_EMPR'),6)  +' '+
          form_nc (clAux.result('VA_VALO'),10)+')');
        b_total_vales_mercadorias := b_total_vales_mercadorias + clAux.result('VA_VALO');
        clAux.next;
      end;
      frm_mem_print.AddLine('TOTAL VALE MERC....: '+form_nc(b_total_vales_mercadorias,19));
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

          //VALES AVULSOS EMITIDOS-------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VA_VALO,VA_NUME,VA_TIPO                      ');
    clAux.AddParam ('FROM   VALES_EMITIDOS                               ');
    clAux.AddParam ('WHERE (VA_LOJA=:loja) AND                           ');
    clAux.AddParam ('      ((VA_DATA>=:data) AND (VA_DATA<=:data2))      ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VA_FUNC=:caixa)                          ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VA_TIPZ=:tipz)                          ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    b_total_vales_emitidos_avulsos := 0.00;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('= = = = = VALES EMITIDOS AVULSOS  = = = ');
      clAux.first;
      while (not clAux.eof) do
      begin
        if (clAux.result('VA_TIPO')='P') then
          tipo_vale:='Presente'
        else
        if (clAux.result('VA_TIPO')='S') then
          tipo_vale:='Simples '
        else
        if (clAux.result('VA_TIPO')='T') then
          tipo_vale:='Troco   '
        else
        if (clAux.result('VA_TIPO')='D') then
          tipo_vale:='Desconto'
        else
        if (clAux.result('VA_TIPO')='B') then
          tipo_vale:='Brinde  '
        else
        if (clAux.result('VA_TIPO')='O') then
          tipo_vale:='Bonus   ';
        frm_mem_print.AddLine(form_n  (clAux.result('VA_NUME'),10) +','+
          tipo_vale+','+
          form_nc (clAux.result('VA_VALO'),20));
        b_total_vales_emitidos_avulsos := b_total_vales_emitidos_avulsos + clAux.result('VA_VALO');
        clAux.next;
      end;
      frm_mem_print.AddLine('TOTAL VALE AVULSO..: '+form_nc(b_total_vales_emitidos_avulsos,19));
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

    frm_mem_print.AddLine('----------------------------------------');
    if (frm_principal.x_soma_valefunc_total_venda) then
    begin
      frm_mem_print.AddLine('A.TOTAL RECEBIDO:'+form_nc(a_total_do_caixa,23));
      frm_mem_print.AddLine('(1+2+3+4+5+6+8)');
    end
    else
    begin
      frm_mem_print.AddLine('A.TOTAL RECEBIDO:'+form_nc(a_total_do_caixa,23));
      frm_mem_print.AddLine('(1+2+3+4+5+6)');
    end;
    frm_mem_print.AddLine('----------------------------------------');
    frm_mem_print.AddLine('');

          //VENDAS CANCELADAS ---------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VE_TOTA                                      ');
    clAux.AddParam ('FROM   VENDAS                                       ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                           ');
    clAux.AddParam ('      (VE_STAT='+chr(39)+'2'+chr(39)+') AND         ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))      ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                  ');
    clAux.consulta.parambyname('loja').AsFloat           := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString    := tipz; {*}
    if (clAux.Execute) then
    begin
      a_qtde_vendas_canceladas  := 0;
      a_total_vendas_canceladas := 0.00;
      clAux.first;
      while (not clAux.eof) do
      begin
        a_total_vendas_canceladas := a_total_vendas_canceladas + clAux.result('VE_TOTA');
        a_qtde_vendas_canceladas  := a_qtde_vendas_canceladas  + 1;
        clAux.next;
      end;
      frm_mem_print.AddLine('*** QTDE. VENDAS CANCELADAS *** '+inttostr(a_qtde_vendas_canceladas));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('TOTAL VENDAS CANCELADAS...:'+form_nc(a_total_vendas_canceladas,13));
      frm_mem_print.AddLine('----------------------------------------');
      frm_mem_print.AddLine('');
    end;
    clAux.desconect;
    clAux.Free;

    frm_mem_print.AddLine('              - - TOTAIS - -            ');
    frm_mem_print.AddLine('');

    {************************************************************************}
    //b) TOTALIZANDO A VENDA BRUTA
    {************************************************************************}
    //1. PRODUTOS VENDIDOS - SO SAIDAS, SO O BRUTO VENDIDO!!!
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT IV_TOTA,IV_MODO                                                                      ');
    clAux.AddParam ('FROM   VENDAS,ITENS_VENDAS                                                                  ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND (IV_LOJA=VE_LOJA) AND (IV_CAIX=VE_CAIX) AND (IV_VEND=VE_CODI) AND ');
    clAux.AddParam ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND (IV_STAT='+QuotedStr('1')+') AND                ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                              ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                  ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                  ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    b_total_produtos_vendidos := 0.00;
    if (clAux.Execute) then
    begin
      clAux.first;
      while (not clAux.eof) do
      begin
//                    if (clAux.result('IV_TOTA')>0.00) then
        b_total_produtos_vendidos := b_total_produtos_vendidos + clAux.result('IV_TOTA');

                    {---->}
        clAux.next;
      end;
    end;
    clAux.desconect;
    clAux.Free;
    frm_mem_print.AddLine('= = = = = = = VENDA BRUTA = = = = = = = ');
    frm_mem_print.AddLine('B. Produtos vendidos:'+form_nc(b_total_produtos_vendidos,19));
    frm_mem_print.AddLine('----------------------------------------');
    frm_mem_print.AddLine('C. TOTAL. . . . . . :'+form_nc(b_total_produtos_vendidos,19));
    frm_mem_print.AddLine('');

          {************************************************************************}
          //c) TOTALIZANDO ABATIMENTOS
          {************************************************************************}
          //1. DESCONTOS CONCEDIDOS-------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VE_DESC                                       ');
    clAux.AddParam ('FROM   VENDAS                                        ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                            ');
    clAux.AddParam ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND          ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))       ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                              ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    c_total_desconto := 0.00;
    if (clAux.Execute) then
    begin
      clAux.first;
      while (not clAux.eof) do
      begin
        c_total_desconto := c_total_desconto + clAux.result('VE_DESC');
        clAux.next;
      end;
    end;
    clAux.desconect;
    clAux.Free;

          //2. TROCAS---------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT IV_TOTA,IV_MODO                             ');
    clAux.AddParam ('FROM   VENDAS,ITENS_VENDAS                         ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja)   AND                        ');
    clAux.AddParam ('      (IV_LOJA=VE_LOJA) AND (IV_CAIX=VE_CAIX) AND  ');
    clAux.AddParam ('      (IV_VEND=VE_CODI) AND                        ');
    clAux.AddParam ('      (VE_STAT='+chr(39)+'1'+chr(39)+') AND        ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))     ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                         ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                         ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    c_total_trocas := 0.00;
    if (clAux.Execute) then
    begin
      clAux.First;
      while (not clAux.Eof) do
      begin
        if (clAux.result('IV_MODO')='2') then //TROCAS
          c_total_trocas := c_total_trocas + (-1)*clAux.result('IV_TOTA');

                    {---->}
        clAux.Next;
      end;
    end;
    clAux.desconect;
    clAux.Free;

          //3. DEVOLUCOES-------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT IV_TOTA,IV_MODO                             ');
    clAux.AddParam ('FROM   VENDAS,ITENS_VENDAS                         ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja)   AND                        ');
    clAux.AddParam ('      (IV_LOJA=VE_LOJA) AND (IV_CAIX=VE_CAIX) AND  ');
    clAux.AddParam ('      (IV_VEND=VE_CODI) AND                        ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))     ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                                              ');
    clAux.AddParam ('      AND (VE_STAT='+chr(39)+'1'+chr(39)+')        ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                         ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    c_total_devolucoes := 0.00;
    if (clAux.Execute) then
    begin
      clAux.First;
      while (not clAux.eof) do
      begin
        if (clAux.result('IV_MODO')='1') then //DEVOLUCOES
          c_total_devolucoes := c_total_devolucoes + (-1)*clAux.result('IV_TOTA');

                    {---->}
        clAux.Next;
      end;
    end;
    clAux.desconect;
    clAux.Free;

          {************************************************************************}
          //d) VENDA EFETIVA
          {************************************************************************}
    frm_mem_print.AddLine('= = = = = = = ABATIMENTOS = = = = = = = ');
    frm_mem_print.AddLine('D. Descontos. . . . . . . .'+form_nc(c_total_desconto,13));
//          frm_mem_print.AddLine('E. Trocas recebidas . . . .'+form_nc(c_total_trocas,13));
//          frm_mem_print.AddLine('E. Devolucoes . . . . . . .'+form_nc(c_total_devolucoes,13));
    frm_mem_print.AddLine('E. Outros . . . . . . . . .'+form_nc(0.00,13));
    frm_mem_print.AddLine('F. TOTAL ABAT.(D+E):    '+
      form_nc(c_total_desconto + 0.00,16));
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('= = = = = = = VENDA EFETIVA = = = = = = ');
    frm_mem_print.AddLine('TOTAL (C-F). . '+form_nc((b_total_produtos_vendidos + b_total_vales_emitidos)
      - (c_total_desconto),25));


          {************************************************************************}
          //e) RECEBIMENTOS DE VENDAS
          {************************************************************************}
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('= = = = = = SINTESE DE VENDAS = = = = =');
    frm_mem_print.AddLine('G. A VISTA');
    frm_mem_print.AddLine('   I1. Cheque a vista .:'+form_nc(a_total_cheque,16));
    frm_mem_print.AddLine('   I2. Debito automat .:'+form_nc(a_total_debito,16));
    frm_mem_print.AddLine('   I3. Dinheiro. . . . :'+form_nc(a_total_dinheiro,16));
    frm_mem_print.AddLine('H. A PRAZO');
    frm_mem_print.AddLine('   J1. Cartao/Credito .:'+form_nc(a_total_cartao,16));
    frm_mem_print.AddLine('   J2. Crediario . . . :'+form_nc(a_total_crediarios,16));
    frm_mem_print.AddLine('   J3. Vale recebido . :'+form_nc(a_total_vales_recebidos,16));
    frm_mem_print.AddLine('   J4. Vale emitido . .:'+form_nc(a_total_vales_emitidos,16));
    frm_mem_print.AddLine('   J5. Vale mercadoria :'+form_nc(a_total_vales_merc,16));


          {************************************************************************}
          //g) OUTROS RECEBIMENTOS
          {************************************************************************}
          //1. PRESTACOES,JUROS,MULTAS RECEBIDOS
    if clauxprest = nil then
    begin
      ClAuxPrest := TClassAuxiliar.Create;
      if not festoque then
        ClAuxPrest.conect   ('VENDAS',self)
      else
        ClAuxPrest.conect   (databasecredito,self);
    end;
    clAuxPrest.ClearSql;
    clAuxPrest.AddParam ('SELECT Sum(PC_VPAG - PC_VALO) as Dif,SUM(PC_VALO) as PC_Valo,Sum(PC_VPAG) as PC_VPAG,PC_FPGT ');
    clAuxPrest.addParam ('FROM CREPRABR C                                                                              ');
    clAuxPrest.AddParam ('WHERE (PC_LOJA=:loja) AND                                                                    ');
    clAuxPrest.AddParam ('      (PC_STAT=:status) AND                                                                  ');
    clAuxPrest.AddParam ('      ((PC_DTPG>=:data) AND (PC_DTPG<=:data2))                                               ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAuxPrest.AddParam ('AND (PC_FUNC=:caixa)                                                                   ');
    clAuxPrest.AddParam ('GROUP BY PC_FPGT                                                                             ');
    clAuxPrest.AddParam ('ORDER BY PC_FPGT                                                                             ');
    clAuxPrest.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAuxPrest.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAuxPrest.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAuxPrest.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAuxPrest.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAuxPrest.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    clAuxPrest.consulta.parambyname('status').AsString     := '1'; //prestacoes pagas
    f_prestacoes_recebidas := 0.00;
    f_juros_multas_recebidos := 0.00;
    if (ClAuxPrest.Execute) then
    begin
      clAuxPrest.first;
      while (not clAuxPrest.eof) do
      begin
        f_prestacoes_recebidas   := f_prestacoes_recebidas + ClAuxPrest.result('PC_VALO');
        f_juros_multas_recebidos := f_juros_multas_recebidos + (ClAuxPrest.result('PC_VPAG') - ClAuxPrest.result('PC_VALO'));
        ClAuxPrest.next;
      end;
    end;




          //2. ENTRADAS RECEBIDAS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VF_VALO,VF_TROC,VF_VEND,VF_ORDE,VF_LOJA,VF_CAIX                                      ');
    clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                                          ');
    clAux.AddParam ('WHERE (VF_LOJA=:loja) AND (VF_LOJA=VE_LOJA) AND (VF_CAIX=VE_CAIX) AND (VF_VEND=VE_CODI) AND ');
    clAux.AddParam ('      (VF_FPGT=:formapagamento) AND (VE_STAT='+chr(39)+'1'+chr(39)+') AND                   ');
    clAux.AddParam ('      ((VE_DATA>=:data) AND (VE_DATA<=:data2))                                              ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (VE_FUNC=:caixa)                                                                  ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (VE_TIPZ=:tipz)                                                                  ');
    clAux.consulta.parambyname('loja').AsFloat           := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat    := y_caixa_ativo;
    clAux.consulta.parambyname('formapagamento').AsFloat := KFPGT_CREDITO;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString    := tipz; {*}
    f_entradas := 0.00;
    if (clAux.Execute) then
    begin
      clAux.first;
      while (not clAux.eof) do
      begin
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect   (databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('SELECT CR_VENT FROM CREDIARIOS                                        ');
        clAux2.AddParam ('WHERE (CR_LOJA=:loja) AND (CR_VEND=:codigovenda) AND (CR_ORDE=:ordem) ');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.AddParam ('AND (CR_CAIX=:terminal)                                            ');
        clAux2.consulta.parambyname('loja').AsFloat        := clAux.result('VF_LOJA');
//                    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
        clAux2.consulta.parambyname('terminal').AsFloat := clAux.result('VF_CAIX');
        clAux2.consulta.parambyname('codigovenda').AsFloat := clAux.result('VF_VEND');
        clAux2.consulta.parambyname('ordem').AsInteger     := clAux.result('VF_ORDE');
        if (clAux2.Execute) then
          f_entradas := f_entradas + clAux2.result('CR_VENT');
        clAux2.desconect;
        clAux2.Free;
                    {---->}
        clAux.next;
      end;
    end;
    clAux.desconect;
    clAux.Free;

    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('= = = = = = OUTROS RECEBIMENTOS = = = = ');
    frm_mem_print.AddLine('I. Prestacoes  . . :'+form_nc(f_prestacoes_recebidas,20));
    clauxprest.first;
    if not clauxprest.eof then
    begin
      frm_mem_print.AddLine(stringofchar('-',40));
      while not clauxprest.eof do
      begin
        if databasecredito = 'CREDITO' then
          frm_mem_print.AddLine('- '+PadL(ProcuraNomeFormaPrestacao(clauxprest.consulta.fieldbyname('PC_FPGT').AsFloat,Self),17,'.')+':'+form_nc(clauxprest.consulta.fieldbyname('PC_Valo').AsFloat,20))
        else
          frm_mem_print.AddLine('- '+PadL(clauxprest.consulta.fieldbyname('PC_FPGT').AsString,17,'.')+':'+form_nc(clauxprest.consulta.fieldbyname('PC_Valo').AsFloat,20));
        clauxprest.next;
      end;
    end;
    frm_mem_print.AddLine(stringofchar('-',40));
    frm_mem_print.AddLine('J. Juros / Multas. :'+form_nc(f_juros_multas_recebidos,20));
    frm_mem_print.AddLine('K. Entradas  . . . :'+form_nc(f_entradas,20));

          //EXCESSO EM VENDAS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT SUM(tab1.VE_VALO) as TOTAL_EXCESSO                    ');
    clAux.AddParam ('FROM   VENDAS_EXCESSO tab1,VENDAS tab2                       ');
    clAux.AddParam ('WHERE (tab1.VE_LOJA=tab2.VE_LOJA) AND                        ');
    clAux.AddParam ('      (tab1.VE_CAIX=tab2.VE_CAIX) AND                        ');
    clAux.AddParam ('      (tab1.VE_VEND=tab2.VE_CODI) AND                        ');
    clAux.AddParam ('      (tab2.VE_LOJA=:loja) AND                               ');
    clAux.AddParam ('      (tab2.VE_STAT='+chr(39)+'1'+chr(39)+') AND             ');
    clAux.AddParam ('      ((tab2.VE_DATA>=:data) AND (tab2.VE_DATA<=:data2))     ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (tab2.VE_TIPZ=:tipz)                              ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    clAux.Execute;
    total_excesso_vendas := clAux.result('TOTAL_EXCESSO');
    if (total_excesso_vendas<>0.00) then
    begin
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('= = = = = = EXCESSO DE VENDAS = = = = = ');
      frm_mem_print.AddLine('TOTAL. . . . . . . :'+form_nc((-1)*total_excesso_vendas,20));
    end;
    clAux.desconect;
    clAux.Free;


          {************************************************************************}
          //g) LANCAMENTOS DIVERSOS
          {************************************************************************}
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('= = = = = LANCAMENTOS DIVERSOS = = = = ');
    frm_mem_print.AddLine('-- Tipo de valor: DINHEIRO');

    d2_total_dinheiro_creditos := 0.00;

          //1. CREDITOS DE DINHEIRO --------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=1) AND                              '); //dinheiro
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2))     ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                         ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString   := 'C'; //credito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('1. CREDITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_dinheiro_creditos := d2_total_dinheiro_creditos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('1. CREDITOS - Nao houve creditos');
    clAux.desconect;
    clAux.Free;

    d2_total_dinheiro_debitos  := 0.00;

          //2. DEBITOS DE DINHEIRO!
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2)) AND ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=1)                                  '); //dinheiro
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                            ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString := 'D'; //debito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('2. DEBITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_dinheiro_debitos := d2_total_dinheiro_debitos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('2. DEBITOS  - Nao houve debitos');
    clAux.desconect;
    clAux.Free;
    if (d2_total_dinheiro_debitos<>0.00) or (d2_total_dinheiro_creditos<>0.00) then
      frm_mem_print.AddLine('   Total...; '+form_nc(d2_total_dinheiro_creditos - d2_total_dinheiro_debitos,27));
    frm_mem_print.AddLine('');

          //3. CREDITOS DE CHEQUE -------------------------------------------------------------------

    d2_total_cheque_creditos := 0.00;

    frm_mem_print.AddLine('-- Tipo de valor: CHEQUE');
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2)) AND ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=2)                                  '); //cheque
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                            ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat     := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString := 'C'; //credito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('1. CREDITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_cheque_creditos := d2_total_cheque_creditos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('1. CREDITOS - Nao houve creditos');
    clAux.desconect;
    clAux.Free;

    d2_total_cheque_debitos  := 0.00;

          //2. DEBITOS DE CHEQUE
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2)) AND ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=2)                                  '); //cheque
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                            ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                            ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString := 'D'; //debito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString  := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('2. DEBITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_cheque_debitos := d2_total_cheque_debitos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('2. DEBITOS  - Nao houve debitos');
    clAux.desconect;
    clAux.Free;
    if (d2_total_cheque_debitos<>0.00) or (d2_total_cheque_creditos<>0.00) then
      frm_mem_print.AddLine('   Total...; '+form_nc(d2_total_cheque_creditos - d2_total_cheque_debitos,27));
    frm_mem_print.AddLine('');

          //3. CREDITOS DE OUTROS -------------------------------------------------------------------

    d2_total_outros_creditos := 0.00;

    frm_mem_print.AddLine('-- Tipo de valor: OUTROS');
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2)) AND ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=3)                                  '); //outros
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                            ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString := 'C'; //credito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString  := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('1. CREDITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_outros_creditos := d2_total_outros_creditos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('1. CREDITOS - Nao houve creditos');
    clAux.desconect;
    clAux.Free;

    d2_total_outros_debitos  := 0.00;

          //2. DEBITOS DE OUTROS
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT LC_VALO,LC_NATU,LC_CONT,LC_DESC,LC_TIPZ     ');
    clAux.AddParam ('FROM   LANCAMENTOS_CAIXA                           ');
    clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                          ');
    clAux.AddParam ('      ((LC_DATA>=:data) AND (LC_DATA<=:data2)) AND ');
    clAux.AddParam ('      (LC_NATU=:natureza) AND                      ');
    clAux.AddParam ('      (LC_TIPO=3)                                  '); //outros
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (LC_FUNC=:caixa)                                                                                              ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (LC_TIPZ=:tipz)                            ');
    clAux.AddParam ('ORDER BY LC_SEQ                                    ');
    clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
    clAux.consulta.parambyname('natureza').AsString := 'D'; //debito
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString := tipz; {*}
    if (clAux.Execute) then
    begin
      clAux.first;
      frm_mem_print.AddLine('2. DEBITOS');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('('+form_t  (clAux.result('LC_CONT'),10)  +')'+
          form_t  (clAux.result('LC_DESC'),18)  +''+
          form_nc (clAux.result('LC_VALO'),10));

        d2_total_outros_debitos := d2_total_outros_debitos + clAux.result('LC_VALO');

                   {--->}
        clAux.next;
      end;
    end
    else
      frm_mem_print.AddLine('2. DEBITOS  - Nao houve debitos');
    clAux.desconect;
    clAux.Free;
    if (d2_total_outros_debitos<>0.00) or (d2_total_outros_creditos<>0.00) then
      frm_mem_print.AddLine('   Total...; '+form_nc(d2_total_outros_creditos - d2_total_outros_debitos,27));
    frm_mem_print.AddLine('');


          //**************** VALORES INICIAL /  1/2 **************************************************
    clAux := TClassAuxiliar.Create;
    if not festoque then
      clAux.conect   ('VENDAS',self)
    else
      clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT CX_VINI,CX_VIN2 FROM CAIXAS             ');
    clAux.AddParam ('WHERE (CX_LOJA=:loja) AND                      ');
    clAux.AddParam ('      ((CX_DATA>=:data) AND (CX_DATA<=:data2)) ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (CX_FUNC=:caixa)                        ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
    clAux.Execute; {*}
    if (tipz='1') then
      a_valor_inicial       := clAux.result('CX_VINI')
    else
    if (tipz='2') then
      a_valor_inicial  := clAux.result('CX_VIN2') //caso exista
    else
    if (tipz='3') then
      a_valor_inicial  := clAux.result('CX_VINI') + clAux.result('CX_VIN2'); //SOMA OS DOIS CAIXAS
    clAux.desconect;
    clAux.Free;
          //**************** VALORES INICIAL /  1/2 **************************************************


          //**************** VALORES RECEBIDOS DE CHEQUE DEVOLVIDO ***********************************
    total_recebimentos_cheque_devolvido := 0.00;
    if (databasecredito='CREDITO') then //somente com CREDIARIO ONLINE
    begin
               //if not festoque then begin
      clCheqDev := TClassAuxiliar.Create;
      if not festoque then
        clCheqDev.conect   ('VENDAS',self)
      else
        clCheqDev.conect   (databaseprodutos,self);
      clCheqDev.ClearSql;
      clCheqDev.AddParam ('SELECT VALOR,CPF,BANCO,NUMERO,CAIXA,DATA     ');
      clCheqDev.AddParam ('FROM   CHEQUES_DEVOLVIDOS_RECEBIDOS          ');
      if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      begin
        clCheqDev.AddParam ('WHERE (CAIXA=:caixa)                      ');
        clCheqDev.consulta.parambyname('caixa').AsFloat := y_caixa_ativo;
      end;
      if (clCheqDev.Execute) then
      begin
        frm_mem_print.AddLine('');
        frm_mem_print.AddLine(' - - RECEBIMENTO CHEQUES DEVOLVIDOS - - ');
        frm_mem_print.AddLine('CPF/CGC        BANCO NUMERO      VALOR $');
        clCheqDev.first;
        while (not clCheqDev.eof) do
        begin
          total_recebimentos_cheque_devolvido := total_recebimentos_cheque_devolvido + clCheqDev.Result('VALOR');

          frm_mem_print.AddLine(form_t  (clCheqDev.Result('CPF'),14)    +' '+
            form_n  (clCheqDev.Result('BANCO'),05)  +' '+
            form_n  (clCheqDev.Result('BANCO'),06)  +' '+
            form_nc (clCheqDev.Result('VALOR'),12));

                            {---->}
          clCheqDev.next;
        end;
        frm_mem_print.AddLine('----------------------------------------');
        frm_mem_print.AddLine('TOTAL:                     '+form_nc (total_recebimentos_cheque_devolvido,13));
      end;
      clCheqDev.desconect;
      clCheqDev.Free;
               //end;
    end;

          //*************************************************************************************
          //SANGRIAS
    clAux := TClassAuxiliar.Create;
    if not festoque then
      clAux.conect   ('VENDAS',self)
    else
      clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VALOR,MOTIVO,CHEQUE,BANCOCH,AGECH,NUMCH FROM SANGRIA_REPROVISAO ');
    clAux.AddParam ('WHERE (LOJA=:LOJA) AND ((DATA>=:data) AND (DATA<=:data2)) AND          ');
    clAux.AddParam ('      (TIPO=0)                                                         ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (FUNC=:FUNC)                                                 ');
    if (tipz='1') or (tipz='2') then
      clAux.addparam('AND (TIPZ='''+tipz+''')                                           ');
    clAux.AddParam ('ORDER BY CHEQUE                                                        ');
    clAux.consulta.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('FUNC').AsFloat := y_caixa_ativo;
    total_sangrias    := 0.00; {*}
    total_sangrias_ch := 0.00; {*}
    if (clAux.Execute) then
    begin
      if clAux.result('CHEQUE') = '' then
      begin
        frm_mem_print.AddLine('');
        frm_mem_print.AddLine('= = = = =  SANGRIAS DINHEIRO  = = = = = ');
        frm_mem_print.AddLine('MOTIVOS                         (-)VALOR');
      end;
      while (not clAux.eof) do
      begin

        if clAux.result('CHEQUE') = 'T' then
        begin
          if total_Sangrias_Ch = 0 then
          begin
            if (total_sangrias > 0) then
              frm_mem_print.AddLine ('..Total(SD):             '+form_nc(total_sangrias,15));
            frm_mem_print.AddLine('');
            frm_mem_print.AddLine('= = = = = =SANGRIAS CHEQUES = = = = = = ');
            frm_mem_print.AddLine('BC  NUM    MOTIVO               (-)VALOR');
            frm_mem_print.AddLine(stringofchar('-',40));
          end;
          total_Sangrias_Ch := total_Sangrias_Ch + clAux.result('VALOR');
          frm_mem_print.AddLine(copy(FormatFloat('000',clAux.Consulta.fieldbyname('Bancoch').asfloat),1,3)+' '+
            copy(formatfloat('000000',clAux.Consulta.fieldbyname('Numch').AsFloat),1,6)+' '+
            COPY(clAux.Consulta.fieldbyname('Motivo').asstring,1,14)+' '+
            stringofchar(' ',29
            - length(clAux.Consulta.fieldbyname('Motivo').asstring+' '+formatfloat('#,##0.00',clAux.Consulta.fieldbyname('Valor').AsFloat)))+
            formatfloat('#,##0.00',clAux.Consulta.fieldbyname('Valor').AsFloat));

        end
        else
        begin
          frm_mem_print.AddLine ('-'+
            form_t(clAux.result('MOTIVO'),38));
          frm_mem_print.AddLine ('. '+form_tc2(' ',21,' ')+
            'R$'+form_nc(clAux.result('VALOR'),15));
        end;

        total_sangrias := total_sangrias + clAux.result('VALOR');
                   {--->}
        clAux.next;
      end;
      if (clAux.result('CHEQUE') = 'T') and (total_Sangrias <> total_Sangrias_Ch) then
      begin
        frm_mem_print.AddLine ('');
        frm_mem_print.AddLine ('..Total(SC):             '+form_nc(total_sangrias_ch,15));
        frm_mem_print.AddLine ('..Total(SD + SC):        '+form_nc(total_sangrias,15));
      end
      else
        frm_mem_print.AddLine ('..Total                  '+form_nc(total_sangrias,15));
    end;
    clAux.desconect;
    clAux.Free;

          //*************************************************************************************
          //REPROVISIONAMENTO
    clAux := TClassAuxiliar.Create;
    if not festoque then
      clAux.conect   ('VENDAS',self)
    else
      clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VALOR,MOTIVO FROM SANGRIA_REPROVISAO                    ');
    clAux.AddParam ('WHERE (LOJA=:LOJA)  AND ((DATA>=:data) AND (DATA<=:data2)) AND ');
    clAux.AddParam ('      (TIPO=1)                                                 ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (FUNC=:FUNC)                                            ');
    if (tipz='1') or (tipz='2') then
      clAux.addparam('AND (TIPZ='''+Tipz+''')                                        ');
    clAux.consulta.parambyname('LOJA').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('FUNC').AsFloat  := y_caixa_ativo;
    total_reprovisionamento := 0.00; {*}
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('= = = = = = = = SUPRIMENTO = = = = = = = ');
      frm_mem_print.AddLine('MOTIVOS                         (+)VALOR');
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine ('-'+
          form_t(clAux.result('MOTIVO'),38));
        frm_mem_print.AddLine ('. '+form_tc2(' ',21,' ')+
          'R$'+form_nc(clAux.result('VALOR'),15));

        total_reprovisionamento := total_reprovisionamento + clAux.result('VALOR');

                   {--->}
        clAux.next;
      end;
      frm_mem_print.AddLine ('..Total:                 '+form_nc(total_reprovisionamento,15));
    end;
    clAux.desconect;
    clAux.Free;

          {...}
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('       - - TOTAL EM DINHEIRO - -        ');
    frm_mem_print.AddLine('----------------Sumario-----------------');
    frm_mem_print.AddLine('    - Lancamentos Diversos DINHEIRO -   ');
    frm_mem_print.AddLine('TOTAL CREDITOS..(+):'+form_nc(d2_total_dinheiro_creditos,20));
    frm_mem_print.AddLine('TOTAL DEBITOS...(-):'+form_nc(d2_total_dinheiro_debitos,20));
    frm_mem_print.AddLine('TOTAL (CRED/DEB)...:'+form_nc(d2_total_dinheiro_creditos - d2_total_dinheiro_debitos,20));
    frm_mem_print.AddLine('');

    frm_mem_print.AddLine('----------------------------------------');
    frm_mem_print.AddLine('TOTAL (CRED/DEB)...:'+form_nc(d2_total_dinheiro_creditos - d2_total_dinheiro_debitos,20));
    frm_mem_print.AddLine('VALOR INICIAL...(+):'+form_nc(a_valor_inicial,20));
    frm_mem_print.AddLine('DINHEIRO VENDAS(D2):'+form_nc(a_total_dinheiro,20));
    if totprestfpgt('DINHEIRO','PC_VALO') > 0 then
    begin
      frm_mem_print.AddLine('DINHEIRO PRESTACOES(DP): '+form_nc(totprestfpgt('DINHEIRO','PC_VALO'),15));
      frm_mem_print.AddLine('DINHEIRO JUROS(DJ):      '+form_nc(totprestfpgt('DINHEIRO','Dif'),15));
      frm_mem_print.AddLine('DINHEIRO(D2+DJ+DP):      '+form_nc(a_total_dinheiro+totprestfpgt('DINHEIRO','PC_VPAG'),15));
    end;
    frm_mem_print.AddLine('CHEQUES DEVOLVIDOS.:'+form_nc(total_recebimentos_cheque_devolvido,20));
    frm_mem_print.AddLine('SANGRIAS........(-):'+form_nc(total_sangrias- total_sangrias_ch,20));
    frm_mem_print.AddLine('REPROVISAO......(+):'+form_nc(total_reprovisionamento,20));
    frm_mem_print.AddLine('');
    frm_mem_print.AddLine('----------------------------------------');
    frm_mem_print.AddLine('TOTAL(dinheiro)....:'+form_nc(
      a_valor_inicial
      + total_recebimentos_cheque_devolvido
      + d2_total_dinheiro_creditos
      - d2_total_dinheiro_debitos
      + a_total_dinheiro
      - total_sangrias + total_sangrias_ch
      + total_reprovisionamento
      + totprestfpgt('DINHEIRO','PC_VPAG')
      ,20));
    frm_mem_print.AddLine('= = = = = = = = = = = = = = = = = = = = ');
    frm_mem_print.AddLine('');



          //**************** VERIFICANDO AUDITORIAS EXISTENTES ***************************************
          //if not festoque then begin
    clAux := TClassAuxiliar.Create;
    if not festoque then
      clAux.conect   ('VENDAS',self)
    else
      clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT AV_VEND,AV_VENA,AV_NVEN,AV_TIPZ                        ');
    clAux.AddParam ('FROM   AUDITORIA_TROCA_VENDEDOR                               ');
    clAux.AddParam ('WHERE (AV_LOJA=:loja) AND                                     ');
    clAux.AddParam ('      ((AV_DATA>=:data) AND (AV_DATA<=:data2)) AND            ');
    clAux.AddParam ('      (AV_VENA<>'+chr(39)+'0'+chr(39)+')                      ');
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.AddParam ('AND (AV_FUNC=:caixa)                                        ');
    if (tipz='1') or (tipz='2') then
      clAux.AddParam (' AND (AV_TIPZ=:tipz)                                        ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    if (fEstoque) then
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := Data.GetValor;
      clAux.consulta.ParamByName('data2').AsDateTime    := Data2.GetValor;
    end
    else
    begin
      clAux.consulta.ParamByName('data').AsDateTime     := frm_principal.x_data_trabalho;
      clAux.consulta.ParamByName('data2').AsDateTime    := frm_principal.x_data_trabalho;
    end;
    if (not chtodoscaixas.Checked) and (not chtodoscaixas1.Checked)then
      clAux.consulta.parambyname('caixa').AsFloat  := y_caixa_ativo;
    if (tipz='1') or (tipz='2') then
      clAux.consulta.parambyname('tipz').AsString  := tipz;
    if (clAux.Execute) then
    begin
      frm_mem_print.AddLine('');
      frm_mem_print.AddLine('  - - AUDITORIA: TROCA DE VENDEDORES - -');
      clAux.first;
      total_trocas_vendedores := 0;
      while (not clAux.eof) do
      begin
        frm_mem_print.AddLine('Vend:'+form_n  (clAux.result('AV_VEND'),8)  +' - '+
          form_nz (clAux.result('AV_VENA'),6)          +' ---> '+
          form_nz (clAux.result('AV_NVEN'),6)          +'  Sr.'+
          clAux.result('AV_TIPZ'));
        total_trocas_vendedores := total_trocas_vendedores + 1;

                        {--->}
        clAux.next;
      end;
      frm_mem_print.AddLine('  Total de trocas..: '+form_n(total_trocas_vendedores,5));
    end;
    clAux.desconect;
    clAux.Free;
           //end;
          {...}
    frm_mem_print.windowstate:=wsMaximized;
    esconde_mensagem;

    if (frm_principal.x_empresa = 'GIZA CAL�ADOS') then
      frm_mem_print.bloqueiaImpressaoGiza := true;

    if (flagExibeImpressaoConferencia) then
      frm_mem_print.showmodal;
  end;
end;

procedure Tfrm_FechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (shift=[ssShift, ssAlt]) then
  begin
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='3';
        lbtipz.visible:=true;
      end
      else
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
    label6.caption := lbtipz.caption;
    label6.Visible := lbtipz.Visible;
  end;

  if (key=K_ENTER) and not Festoque then
    if (rdTipo.itemindex=0) then
      Conferncia1.click
    else
    if (rdTipo.itemindex=1) then
      N1.click;

  if key = Vk_F5 then
    if not festoque then
    begin
      if rdtipo.itemindex = 0 then
        BotaoConferencia.OnClick(BotaoConferencia)
      else
        N1.Onclick(N1);
    end
    else
      Panel1.OnClick(Panel1);

  if key = vk_escape then
    close;
end;

procedure Tfrm_FechamentoCaixa.FormCreate(Sender: TObject);
begin
  fEstoque := false;
  tecla    := 27;
  tipz     := '1';
  lbtipz.caption := 'Sr.: '+tipz;
//     Image2.picture := frm_principal.Image1.picture;
  flagExibeImpressaoConferencia := true;
  pagecontrol1.ActivePageIndex  := 0;
end;

procedure Tfrm_FechamentoCaixa.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  {***** cara de XP}
  ClAuxPrest := TClassAuxiliar.Create;

  if (not fEstoque) then
    clAuxPrest.Conect('VENDAS',self)
  else
    clAuxPrest.Conect(DataBaseCredito,self);

  if (not fEstoque) then
  begin
  //       inherited;
    hR := CreateRoundRectRgn(0,0,width,height,10,10);
    SetWindowRgn(Handle,hR,true);
  end;

     {*****}
  if (fEstoque) then
  begin
    Data2.Visible       := true;
    label4.Visible      := true;
    Loja.Visible        := true;
    edtDescLoja.Visible := true;
    Caixa.Visible       := true;
    Data.SetFocus;
  end
  else
  begin
    Data2.Visible       := false;
    label4.Visible      := false;
    Loja.Visible        := false;
    edtDescLoja.Visible := false;
    Caixa.Visible       := false;
    frm_FechamentoCaixa.BorderStyle := bsNone;
  end;

  if (rdTipo.itemindex=0) then
  begin
    Conferncia1.shortcut      := ShortCut (116,[]);
    N1.shortcut               := ShortCut (0,[]);
    botaoConferencia.caption  := 'Confer�ncia - [F5]';
    botaoEncerramento.caption := 'Encerrar';
    chtodoscaixas.Visible     := true;
  end
  else
  if (rdTipo.itemindex=1) then
  begin
    Conferncia1.shortcut      := ShortCut (0,[]);
    N1.shortcut               := ShortCut (116,[]);
    botaoConferencia.caption  := 'Confer�ncia';
    botaoEncerramento.caption := 'Encerrar - [F5]';
    chtodoscaixas.Visible     := false;
  end;
  if Self.FindComponent('Panel3') <> nil then
    TPanel(Self.FindComponent('Panel3')).Visible := false;
  if pagecontrol1.activepageindex = 0 then
    self.height := BotaoSair1.top + BotaoSair1.Height + 20;
end;

procedure Tfrm_FechamentoCaixa.botaoConferenciaClick(Sender: TObject);
var
  olddata:TDateTime;
begin
  Conferncia1.onclick(Sender);
end;

procedure Tfrm_FechamentoCaixa.N1Click(Sender: TObject);
begin
  if (frmDialogo.ExibirMensagem ('Confirma encerramento do Caixa?'
    ,'Caixa',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_FechamentoCaixa.GravaRegistroEncerramentoDoCaixa;
var
  clCaixa: TClassAuxiliar;
begin
  flagExibeImpressaoConferencia := false;

     {...}
  clCaixa := TClassAuxiliar.Create;
  clCaixa.conect   ('VENDAS',self);

  clCaixa.ClearSql;
  clCaixa.AddParam ('SELECT FC_FUNC FROM CAIXAS_ENCERRAMENTO ');
  clCaixa.AddParam ('WHERE (FC_LOJA=:loja) AND               ');
  clCaixa.AddParam ('      (FC_CAIX=:terminal) AND           ');
  clCaixa.AddParam ('      (FC_FUNC=:opcaixa) AND            ');
  clCaixa.AddParam ('      (FC_DATA=:data)                   ');
  clCaixa.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('opcaixa').AsFloat  := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  if (not clCaixa.Execute) then
  begin
    clCaixa.ClearSql;
    clCaixa.AddParam ('INSERT INTO CAIXAS_ENCERRAMENTO             ');
    clCaixa.AddParam (' (FC_LOJA,FC_CAIX,FC_FUNC,FC_DATA,          ');
    clCaixa.AddParam ('  FC_QATD,FC_TATD,                          ');
    clCaixa.AddParam ('  FC_TROC1,FC_DINH1,FC_CCRE1,FC_CDEB1,      ');
    clCaixa.AddParam ('  FC_CHEQ1,FC_CRED1,FC_TROV1,FC_VALR1,      ');
    clCaixa.AddParam ('  FC_TOTA1,                                 ');
    clCaixa.AddParam ('  FC_TROC2,FC_DINH2,FC_CCRE2,FC_CDEB2,      ');
    clCaixa.AddParam ('  FC_CHEQ2,FC_CRED2,FC_TROV2,FC_VALR2,      ');
    clCaixa.AddParam ('  FC_TOTA2)                                 ');
    clCaixa.AddParam ('VALUES                                      ');
    clCaixa.AddParam (' (:FC_LOJA,:FC_CAIX,:FC_FUNC,:FC_DATA,      ');
    clCaixa.AddParam ('  :FC_QATD,:FC_TATD,                        ');
    clCaixa.AddParam ('  :FC_TROC1,:FC_DINH1,:FC_CCRE1,:FC_CDEB1,  ');
    clCaixa.AddParam ('  :FC_CHEQ1,:FC_CRED1,:FC_TROV1,:FC_VALR1,  ');
    clCaixa.AddParam ('  :FC_TOTA1,                                ');
    clCaixa.AddParam ('  :FC_TROC2,:FC_DINH2,:FC_CCRE2,:FC_CDEB2,  ');
    clCaixa.AddParam ('  :FC_CHEQ2,:FC_CRED2,:FC_TROV2,:FC_VALR2,  ');
    clCaixa.AddParam ('  :FC_TOTA2)                                ');

    clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
    clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
    clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
    clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

          //atendimentos
    clCaixa.consulta.parambyname('FC_QATD').AsFloat     := 0;
    clCaixa.consulta.parambyname('FC_TATD').AsFloat     := 0.00;

          //valores analiticos sintetizados
    clCaixa.consulta.parambyname('FC_TROC1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_DINH1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CCRE1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CDEB1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CHEQ1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CRED1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TROV1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_VALR1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TOTA1').AsFloat    := 0.00;

    clCaixa.consulta.parambyname('FC_TROC2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_DINH2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CCRE2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CDEB2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CHEQ2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CRED2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TROV2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_VALR2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TOTA2').AsFloat    := 0.00;

    clCaixa.Execute; {*} //INSERINDO O REGISTRO
  end;

     //PRIMEIRO FAZ A APURACAO DO TIPZ = '1' **************************************
  tipz := '1';
  Conferncia1.click;
     //****************************************************************************
  clCaixa.ClearSql;
  clCaixa.AddParam ('UPDATE CAIXAS_ENCERRAMENTO SET              ');
  clCaixa.AddParam ('  FC_QATD=:FC_QATD,                         ');
  clCaixa.AddParam ('  FC_TATD=:FC_TATD,                         ');
  clCaixa.AddParam ('  FC_TROC1=:FC_TROC1,                       ');
  clCaixa.AddParam ('  FC_DINH1=:FC_DINH1,                       ');
  clCaixa.AddParam ('  FC_CCRE1=:FC_CCRE1,                       ');
  clCaixa.AddParam ('  FC_CDEB1=:FC_CDEB1,                       ');
  clCaixa.AddParam ('  FC_CHEQ1=:FC_CHEQ1,                       ');
  clCaixa.AddParam ('  FC_CRED1=:FC_CRED1,                       ');
  clCaixa.AddParam ('  FC_TROV1=:FC_TROV1,                       ');
  clCaixa.AddParam ('  FC_VALR1=:FC_VALR1,                       ');
  clCaixa.AddParam ('  FC_TOTA1=:FC_TOTA1                        ');
  clCaixa.AddParam ('WHERE                                       ');
  clCaixa.AddParam (' (FC_LOJA=:FC_LOJA) AND                     ');
  clCaixa.AddParam (' (FC_CAIX=:FC_CAIX) AND                     ');
  clCaixa.AddParam (' (FC_FUNC=:FC_FUNC) AND                     ');
  clCaixa.AddParam (' (FC_DATA=:FC_DATA)                         ');

  clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

     //atendimentos - IGUAL EM '1' E '2'
  clCaixa.consulta.parambyname('FC_QATD').AsFloat     := qtdeAtdo;
  clCaixa.consulta.parambyname('FC_TATD').AsFloat     := totalAtdo;

     //valores analiticos sintetizados
  clCaixa.consulta.parambyname('FC_TROC1').AsFloat    := a_total_troco;
  clCaixa.consulta.parambyname('FC_DINH1').AsFloat    := a_total_dinheiro;
  clCaixa.consulta.parambyname('FC_CCRE1').AsFloat    := a_total_cartao;
  clCaixa.consulta.parambyname('FC_CDEB1').AsFloat    := a_total_debito;
  clCaixa.consulta.parambyname('FC_CHEQ1').AsFloat    := a_total_cheque;
  clCaixa.consulta.parambyname('FC_CRED1').AsFloat    := a_total_crediarios;
  clCaixa.consulta.parambyname('FC_TROV1').AsFloat    := a_total_troco_vales;
  clCaixa.consulta.parambyname('FC_VALR1').AsFloat    := a_total_vales_recebidos;
  clCaixa.consulta.parambyname('FC_TOTA1').AsFloat    := a_total_do_caixa;

  clCaixa.Execute; {*} //ATUALIZANDO as colunas '1'

     //PRIMEIRO FAZ A APURACAO DO TIPZ = '2' **************************************
  tipz := '2';
  Conferncia1.click;
     //****************************************************************************
  clCaixa.ClearSql;
  clCaixa.AddParam ('UPDATE CAIXAS_ENCERRAMENTO SET              ');
  clCaixa.AddParam ('  FC_QATD=:FC_QATD,                         ');
  clCaixa.AddParam ('  FC_TATD=:FC_TATD,                         ');
  clCaixa.AddParam ('  FC_TROC2=:FC_TROC2,                       ');
  clCaixa.AddParam ('  FC_DINH2=:FC_DINH2,                       ');
  clCaixa.AddParam ('  FC_CCRE2=:FC_CCRE2,                       ');
  clCaixa.AddParam ('  FC_CDEB2=:FC_CDEB2,                       ');
  clCaixa.AddParam ('  FC_CHEQ2=:FC_CHEQ2,                       ');
  clCaixa.AddParam ('  FC_CRED2=:FC_CRED2,                       ');
  clCaixa.AddParam ('  FC_TROV2=:FC_TROV2,                       ');
  clCaixa.AddParam ('  FC_VALR2=:FC_VALR2,                       ');
  clCaixa.AddParam ('  FC_TOTA2=:FC_TOTA2                        ');
  clCaixa.AddParam ('WHERE                                       ');
  clCaixa.AddParam (' (FC_LOJA=:FC_LOJA) AND                     ');
  clCaixa.AddParam (' (FC_CAIX=:FC_CAIX) AND                     ');
  clCaixa.AddParam (' (FC_FUNC=:FC_FUNC) AND                     ');
  clCaixa.AddParam (' (FC_DATA=:FC_DATA)                         ');

  clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

     //atendimentos - IGUAL EM '1' E '2'
  clCaixa.consulta.parambyname('FC_QATD').AsFloat     := qtdeAtdo;
  clCaixa.consulta.parambyname('FC_TATD').AsFloat     := totalAtdo;

     //valores analiticos sintetizados
  clCaixa.consulta.parambyname('FC_TROC2').AsFloat    := a_total_troco;
  clCaixa.consulta.parambyname('FC_DINH2').AsFloat    := a_total_dinheiro;
  clCaixa.consulta.parambyname('FC_CCRE2').AsFloat    := a_total_cartao;
  clCaixa.consulta.parambyname('FC_CDEB2').AsFloat    := a_total_debito;
  clCaixa.consulta.parambyname('FC_CHEQ2').AsFloat    := a_total_cheque;
  clCaixa.consulta.parambyname('FC_CRED2').AsFloat    := a_total_crediarios;
  clCaixa.consulta.parambyname('FC_TROV2').AsFloat    := a_total_troco_vales;
  clCaixa.consulta.parambyname('FC_VALR2').AsFloat    := a_total_vales_recebidos;
  clCaixa.consulta.parambyname('FC_TOTA2').AsFloat    := a_total_do_caixa;

  clCaixa.Execute; {*} //ATUALIZANDO as colunas '2'

  clCaixa.desconect;
  clCaixa.Free;

  flagExibeImpressaoConferencia := true; {*}
end;

procedure Tfrm_FechamentoCaixa.GravaRegistroEncerramentoDoCaixa_ONLINE;
var
  clCaixa: TClassAuxiliar;
begin
  flagExibeImpressaoConferencia := false;

     {...}
  clCaixa := TClassAuxiliar.Create;
  clCaixa.conect   ('ESTOQUE',self);

  clCaixa.ClearSql;
  clCaixa.AddParam ('SELECT FC_FUNC FROM CAIXAS_ENCERRAMENTO ');
  clCaixa.AddParam ('WHERE (FC_LOJA=:loja) AND               ');
  clCaixa.AddParam ('      (FC_CAIX=:terminal) AND           ');
  clCaixa.AddParam ('      (FC_FUNC=:opcaixa) AND            ');
  clCaixa.AddParam ('      (FC_DATA=:data)                   ');
  clCaixa.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('opcaixa').AsFloat  := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  if (not clCaixa.Execute) then
  begin
    clCaixa.ClearSql;
    clCaixa.AddParam ('INSERT INTO CAIXAS_ENCERRAMENTO             ');
    clCaixa.AddParam (' (FC_LOJA,FC_CAIX,FC_FUNC,FC_DATA,          ');
    clCaixa.AddParam ('  FC_QATD,FC_TATD,                          ');
    clCaixa.AddParam ('  FC_TROC1,FC_DINH1,FC_CCRE1,FC_CDEB1,      ');
    clCaixa.AddParam ('  FC_CHEQ1,FC_CRED1,FC_TROV1,FC_VALR1,      ');
    clCaixa.AddParam ('  FC_TOTA1,                                 ');
    clCaixa.AddParam ('  FC_TROC2,FC_DINH2,FC_CCRE2,FC_CDEB2,      ');
    clCaixa.AddParam ('  FC_CHEQ2,FC_CRED2,FC_TROV2,FC_VALR2,      ');
    clCaixa.AddParam ('  FC_TOTA2)                                 ');
    clCaixa.AddParam ('VALUES                                      ');
    clCaixa.AddParam (' (:FC_LOJA,:FC_CAIX,:FC_FUNC,:FC_DATA,      ');
    clCaixa.AddParam ('  :FC_QATD,:FC_TATD,                        ');
    clCaixa.AddParam ('  :FC_TROC1,:FC_DINH1,:FC_CCRE1,:FC_CDEB1,  ');
    clCaixa.AddParam ('  :FC_CHEQ1,:FC_CRED1,:FC_TROV1,:FC_VALR1,  ');
    clCaixa.AddParam ('  :FC_TOTA1,                                ');
    clCaixa.AddParam ('  :FC_TROC2,:FC_DINH2,:FC_CCRE2,:FC_CDEB2,  ');
    clCaixa.AddParam ('  :FC_CHEQ2,:FC_CRED2,:FC_TROV2,:FC_VALR2,  ');
    clCaixa.AddParam ('  :FC_TOTA2)                                ');

    clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
    clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
    clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
    clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

          //atendimentos
    clCaixa.consulta.parambyname('FC_QATD').AsFloat     := 0;
    clCaixa.consulta.parambyname('FC_TATD').AsFloat     := 0.00;

          //valores analiticos sintetizados
    clCaixa.consulta.parambyname('FC_TROC1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_DINH1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CCRE1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CDEB1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CHEQ1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CRED1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TROV1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_VALR1').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TOTA1').AsFloat    := 0.00;

    clCaixa.consulta.parambyname('FC_TROC2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_DINH2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CCRE2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CDEB2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CHEQ2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_CRED2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TROV2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_VALR2').AsFloat    := 0.00;
    clCaixa.consulta.parambyname('FC_TOTA2').AsFloat    := 0.00;

    clCaixa.Execute; {*} //INSERINDO O REGISTRO
  end;

     //PRIMEIRO FAZ A APURACAO DO TIPZ = '1' **************************************
  tipz := '1';
  Conferncia1.click;
     //****************************************************************************
  clCaixa.ClearSql;
  clCaixa.AddParam ('UPDATE CAIXAS_ENCERRAMENTO SET              ');
  clCaixa.AddParam ('  FC_QATD=:FC_QATD,                         ');
  clCaixa.AddParam ('  FC_TATD=:FC_TATD,                         ');
  clCaixa.AddParam ('  FC_TROC1=:FC_TROC1,                       ');
  clCaixa.AddParam ('  FC_DINH1=:FC_DINH1,                       ');
  clCaixa.AddParam ('  FC_CCRE1=:FC_CCRE1,                       ');
  clCaixa.AddParam ('  FC_CDEB1=:FC_CDEB1,                       ');
  clCaixa.AddParam ('  FC_CHEQ1=:FC_CHEQ1,                       ');
  clCaixa.AddParam ('  FC_CRED1=:FC_CRED1,                       ');
  clCaixa.AddParam ('  FC_TROV1=:FC_TROV1,                       ');
  clCaixa.AddParam ('  FC_VALR1=:FC_VALR1,                       ');
  clCaixa.AddParam ('  FC_TOTA1=:FC_TOTA1                        ');
  clCaixa.AddParam ('WHERE                                       ');
  clCaixa.AddParam (' (FC_LOJA=:FC_LOJA) AND                     ');
  clCaixa.AddParam (' (FC_CAIX=:FC_CAIX) AND                     ');
  clCaixa.AddParam (' (FC_FUNC=:FC_FUNC) AND                     ');
  clCaixa.AddParam (' (FC_DATA=:FC_DATA)                         ');

  clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

     //atendimentos - IGUAL EM '1' E '2'
  clCaixa.consulta.parambyname('FC_QATD').AsFloat     := qtdeAtdo;
  clCaixa.consulta.parambyname('FC_TATD').AsFloat     := totalAtdo;

     //valores analiticos sintetizados
  clCaixa.consulta.parambyname('FC_TROC1').AsFloat    := a_total_troco;
  clCaixa.consulta.parambyname('FC_DINH1').AsFloat    := a_total_dinheiro;
  clCaixa.consulta.parambyname('FC_CCRE1').AsFloat    := a_total_cartao;
  clCaixa.consulta.parambyname('FC_CDEB1').AsFloat    := a_total_debito;
  clCaixa.consulta.parambyname('FC_CHEQ1').AsFloat    := a_total_cheque;
  clCaixa.consulta.parambyname('FC_CRED1').AsFloat    := a_total_crediarios;
  clCaixa.consulta.parambyname('FC_TROV1').AsFloat    := a_total_troco_vales;
  clCaixa.consulta.parambyname('FC_VALR1').AsFloat    := a_total_vales_recebidos;
  clCaixa.consulta.parambyname('FC_TOTA1').AsFloat    := a_total_do_caixa;

  clCaixa.Execute; {*} //ATUALIZANDO as colunas '1'

     //PRIMEIRO FAZ A APURACAO DO TIPZ = '2' **************************************
  tipz := '2';
  Conferncia1.click;
     //****************************************************************************
  clCaixa.ClearSql;
  clCaixa.AddParam ('UPDATE CAIXAS_ENCERRAMENTO SET              ');
  clCaixa.AddParam ('  FC_QATD=:FC_QATD,                         ');
  clCaixa.AddParam ('  FC_TATD=:FC_TATD,                         ');
  clCaixa.AddParam ('  FC_TROC2=:FC_TROC2,                       ');
  clCaixa.AddParam ('  FC_DINH2=:FC_DINH2,                       ');
  clCaixa.AddParam ('  FC_CCRE2=:FC_CCRE2,                       ');
  clCaixa.AddParam ('  FC_CDEB2=:FC_CDEB2,                       ');
  clCaixa.AddParam ('  FC_CHEQ2=:FC_CHEQ2,                       ');
  clCaixa.AddParam ('  FC_CRED2=:FC_CRED2,                       ');
  clCaixa.AddParam ('  FC_TROV2=:FC_TROV2,                       ');
  clCaixa.AddParam ('  FC_VALR2=:FC_VALR2,                       ');
  clCaixa.AddParam ('  FC_TOTA2=:FC_TOTA2                        ');
  clCaixa.AddParam ('WHERE                                       ');
  clCaixa.AddParam (' (FC_LOJA=:FC_LOJA) AND                     ');
  clCaixa.AddParam (' (FC_CAIX=:FC_CAIX) AND                     ');
  clCaixa.AddParam (' (FC_FUNC=:FC_FUNC) AND                     ');
  clCaixa.AddParam (' (FC_DATA=:FC_DATA)                         ');

  clCaixa.consulta.parambyname('FC_LOJA').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('FC_CAIX').AsFloat     := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('FC_FUNC').AsFloat     := y_caixa_ativo; {*}
  clCaixa.consulta.parambyname('FC_DATA').AsDateTime  := frm_principal.x_data_trabalho;

     //atendimentos - IGUAL EM '1' E '2'
  clCaixa.consulta.parambyname('FC_QATD').AsFloat     := qtdeAtdo;
  clCaixa.consulta.parambyname('FC_TATD').AsFloat     := totalAtdo;

     //valores analiticos sintetizados
  clCaixa.consulta.parambyname('FC_TROC2').AsFloat    := a_total_troco;
  clCaixa.consulta.parambyname('FC_DINH2').AsFloat    := a_total_dinheiro;
  clCaixa.consulta.parambyname('FC_CCRE2').AsFloat    := a_total_cartao;
  clCaixa.consulta.parambyname('FC_CDEB2').AsFloat    := a_total_debito;
  clCaixa.consulta.parambyname('FC_CHEQ2').AsFloat    := a_total_cheque;
  clCaixa.consulta.parambyname('FC_CRED2').AsFloat    := a_total_crediarios;
  clCaixa.consulta.parambyname('FC_TROV2').AsFloat    := a_total_troco_vales;
  clCaixa.consulta.parambyname('FC_VALR2').AsFloat    := a_total_vales_recebidos;
  clCaixa.consulta.parambyname('FC_TOTA2').AsFloat    := a_total_do_caixa;

  clCaixa.Execute; {*} //ATUALIZANDO as colunas '2'

  clCaixa.desconect;
  clCaixa.Free;

  flagExibeImpressaoConferencia := true; {*}
end;

procedure Tfrm_FechamentoCaixa.ExclueRegistroEncerramentoDoCaixa (opcaixa: Real);
var
  clCaixa: TClassAuxiliar;
begin
  clCaixa := TClassAuxiliar.Create;
  clCaixa.conect   ('VENDAS',self);
  clCaixa.ClearSql;
  clCaixa.AddParam ('DELETE FROM CAIXAS_ENCERRAMENTO         ');
  clCaixa.AddParam ('WHERE (FC_LOJA=:loja) AND               ');
  clCaixa.AddParam ('      (FC_CAIX=:terminal) AND           ');
  clCaixa.AddParam ('      (FC_FUNC=:opcaixa) AND            ');
  clCaixa.AddParam ('      (FC_DATA=:data)                   ');
  clCaixa.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('opcaixa').AsFloat  := opcaixa; {*}
  clCaixa.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clCaixa.Execute; {*}
  clCaixa.desconect;
  clCaixa.Free;
end;

procedure Tfrm_FechamentoCaixa.ExclueRegistroEncerramentoDoCaixa_ONLINE (opcaixa: Real);
var
  clCaixa: TClassAuxiliar;
begin
  clCaixa := TClassAuxiliar.Create;
  clCaixa.conect   ('ESTOQUE',self);
  clCaixa.ClearSql;
  clCaixa.AddParam ('DELETE FROM CAIXAS_ENCERRAMENTO         ');
  clCaixa.AddParam ('WHERE (FC_LOJA=:loja) AND               ');
  clCaixa.AddParam ('      (FC_CAIX=:terminal) AND           ');
  clCaixa.AddParam ('      (FC_FUNC=:opcaixa) AND            ');
  clCaixa.AddParam ('      (FC_DATA=:data)                   ');
  clCaixa.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clCaixa.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clCaixa.consulta.parambyname('opcaixa').AsFloat  := opcaixa;
  clCaixa.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clCaixa.Execute; {*}
  clCaixa.desconect;
  clCaixa.Free;
end;

function Tfrm_FechamentoCaixa.totprestfpgt(ffpgt, campo: String): Real;

  function ftipofp(ftipo:String):String;
  var
    qry:tquery;
  begin
    if (databasecredito <> 'CREDITO') and (FFpgt = '5') and (strtointn(ftipo) >= 5)  then
      result := FFpgt
    else
    if  (databasecredito <> 'CREDITO') then
      result := Ftipo
    else
    begin
      qry := tquery.create(application);
      qry.databasename := 'CREDITO';
      qry.sql.add ('Select Fp_tipo from CREFPGT Where fp_codi = '''+FTIPO+''' ');
      qry.open;
      result := qry.fieldbyname('Fp_tipo').AsString;
    end;
  end;


begin

  if databasecredito <> 'CREDITO' then
    if ffpgt = 'DINHEIRO' then
      ffpgt := '1'
    else
    if ffpgt = 'CHEQUE' then
      ffpgt := '2'
    else
    if ffpgt = 'DEBITO' then
      ffpgt := '3'
    else
    if ffpgt = 'CARTAO' then
      ffpgt := '4'
    else
    if (ffpgt = 'OUTROS') or (ffpgt = '') then
      ffpgt := '5';

  result := 0;
  clauxprest.first;
  while not clauxprest.eof do
  begin
    if FFpgt = FtipoFp(ClAuxPrest.consulta.fieldbyname('PC_FPGT').AsString) then
      result := result + ClAuxPrest.consulta.fieldbyname(Campo).AsFloat;
    clauxprest.next;
  end;
end;

procedure Tfrm_FechamentoCaixa.FormDestroy(Sender: TObject);
begin
  if clauxprest <> nil then
    clauxprest.Desconect;
  inherited;
end;

procedure Tfrm_FechamentoCaixa.LojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
    Loja.Text := ChamandoF8LojasLocal;
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(Loja.Text) = '') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma loja!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Loja.SetFocus;
    end
    else
    begin
      edtDescLoja.Color := clTeal;
      continua := true;
      if (Caixa.Enabled) then
        Caixa.SetFocus
      else
        Panel1.Onclick(Sender);
    end;
  if (key=K_CIMA) then
    Data2.SetFocus;
end;

procedure Tfrm_FechamentoCaixa.LojaExit(Sender: TObject);
begin
  edtDescLoja.Text := ProcuraNomeLoja(StrtoFloatN(Loja.Text),Self);
end;

procedure Tfrm_FechamentoCaixa.DataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (not IsDate(Data.Text)) or (Trim(Data.Text) = '  /  /    ') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma data inicial v�lida!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Data.SetFocus;
      Data.SelectAll;
    end
    else
    begin
      Data2.Text := Data.Text;
      continua   := true;
      Data2.SetFocus;
    end;
end;

procedure TFrm_FechamentoCaixa.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_FechamentoCaixa.Panel1Click(Sender: TObject);
var
  olddata:TDateTime;
begin
  olddata := frm_principal.x_data_trabalho;
  try
    frm_Principal.x_loja          := StrtoFloatN(Loja.Text);
    y_caixa_ativo                 := StrtoFloatN(Caixa.Text);
    Conferncia1.Onclick(Sender);
  finally
    Frm_principal.x_data_trabalho := olddata;
  end;
end;

procedure TFrm_FechamentoCaixa.BotaoSair2Click(Sender: TObject);
begin
  close;
end;

function TFrm_FechamentoCaixa.ChamandoF8LojasLocal:String;
var
  FQuery:Tquery;
begin
  Result := '';

  FQuery := TQuery.Create(Application);
  FfocusgradeGridCons := true;

  try
    Fquery.DataBaseName := databasecredito;
    Fquery.sql.add('Select Lo_codi as Codigo,Lo_Nome From CRELOJA');
    Fquery.open;

    FQuery.FieldByName('Codigo').DisplayLabel := 'C�digo';
    FQuery.FieldByName('Codigo').DisplayWidth := 4;
    FQuery.FieldByName('Lo_Nome').DisplayLabel := 'Descri��o';

    if Fgridcons(FQuery,'Consulta de Lojas',false,-1,true,true,'Lo_Nome') then
      Result := FormatFloat('00',Fquery.fieldbyname('Codigo').AsFloat);
  finally
    FfocusgradeGridCons := false;
    FQuery.Destroy;
  end;
end;

procedure TFrm_FechamentoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_principal.x_fecha_caixa := true;
end;

procedure TFrm_FechamentoCaixa.chtodoscaixas1Click(Sender: TObject);
begin
  if (not chtodoscaixas1.Checked) then
  begin
    habilitaEditVerde(Caixa);
    Caixa.Enabled          := true;
    PanelControle2.Caption := '';
    Caixa.SetFocus;
    PanelControle2.Color   := clWhite;
  end
  else
  begin
    desabilitaEditVerde(Caixa);
    Caixa.Text             := '';
    Caixa.Enabled          := false;
    PanelControle2.Caption := '';
    PanelControle2.Color   := clTeal;
  end;
end;

procedure TFrm_FechamentoCaixa.Data2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_CIMA) then
    Data.SetFocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (not IsDate(Data2.Text)) or (Trim(Data2.Text) = '  /  /    ') then
    begin
      frmDialogo.ExibirMensagem ('Informe uma data final v�lida!'
        ,'Confer�ncia de Caixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      Data2.SetFocus;
      Data2.SelectAll;
    end
    else
    begin
      Loja.SetFocus;
      continua := true;
    end;
end;

procedure TFrm_FechamentoCaixa.CaixaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
    ChamandoF8Vend (StrtofloatN(Loja.Text),caixa,false,true);
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (trim(Caixa.Text)='') then
    begin
      chtodoscaixas1.Checked := true;
      chtodoscaixas1Click(Sender);
      Panel1.Onclick(Sender);
    end
    else
    begin
      PanelControle2.Caption := ProcuraNomeVend(Strtofloat(Loja.Text),StrtoFloat(Caixa.Text),Self);
      chTodosCaixas1.Checked := false;
      chTodosCaixas1Click(Sender);
      Panel1.Onclick(Sender);
    end;
  if (key=K_CIMA) then
    Loja.SetFocus;
end;

procedure TFrm_FechamentoCaixa.CaixaExit(Sender: TObject);
begin
  if (not chtodoscaixas1.Checked) and (Trim(Caixa.Text)<>'') then
    PanelControle2.Caption := ProcuraNomeVend(Strtofloat(Loja.Text),StrtoFloat(Caixa.Text),Self);
end;

end.
