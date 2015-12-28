unit relat;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, ExtCtrls, Menus, DB, DBTables, Grids,
  DBGrids;

{relatorios do outros}
procedure imprime_contratos (consulta:TQuery);
procedure imprime_clientes (consulta:TQuery);
procedure imprime_cheques_pre (consulta:TQuery);

{relatorios financeiros}
procedure RelatorioEmAberto (codigo: String; onde: Integer);
procedure RelatorioLiquidado (codigo: String; onde: Integer);

implementation

uses Mem_prnt, Principal, funcoes1, funcoes2, DM1 ,prestacoes, unDialogo,
  contratos, cliente, procura, credito, unMensagem, unPosFinanc;

{Opcao de impressao dos portadores}
procedure imprime_portadores (consulta:TQuery);
var
  totport: Integer;
  flagEnd: Boolean;
  tipo: String;
begin
     {perguntas}
  if (frmDialogo.ExibirMensagem ('Layout da listagem. Exibir dados mais secundários (conta,cnpj,...)?',
    'Portadores',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',
    250,200)=mrYes) then
    flagEnd:=false
  else
    flagEnd:=true;

     {Inicio da visualizacao da impressao ***}
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'c03.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 12;
    Title:= 'CADASTRO DE PORTADORES - Outros relatorios...';

        {cabecalhos}
    if (flagEnd) then
    begin
      AddLine(form_tc('-',132,'-'));
      AddLine('     |                              |         |                                     |                   |                    |   ');
      AddLine('Cód  |Nome do portador              |CEP      |Endereço                             |Bairro             |Cidade              |UF ');
      AddLine(form_tc('-',132,'-'));
    end
    else
    begin
      AddLine(form_tc('-',132,'-'));
      AddLine('     |                              |         |                    |Conta        |  |Telefone p/  |          |            |       ');
      AddLine('Cód  |Nome do portador              |Agência  |CNPJ/CPF            |Corrente     |Tp|Contato      |Fax       |Celular     |Comis. ');
      AddLine(form_tc('-',132,'-'));
    end;

        {inicializacoes}
    totport := 0;
    consulta.first;
    while (not consulta.eof) do
    begin
      if (consulta.fieldbyname('PO_TIPO').AsString='0') then
        tipo:='I'
      else
        tipo:='E';
      if (flagEnd) then
        AddLine(form_nz  (consulta.fieldbyname('PO_CODI').AsFloat,4)  +' '+
          form_t   (consulta.fieldbyname('PO_NOME').AsString,30) +' '+
          form_t   (consulta.fieldbyname('PO_CEP').AsString,10)  +' '+
          form_t   (consulta.fieldbyname('PO_ENDE').AsString,37) +' '+
          form_t   (consulta.fieldbyname('PO_BAIR').AsString,19) +' '+
          form_t   (consulta.fieldbyname('PO_CIDA').AsString,20) +' '+
          form_t   (consulta.fieldbyname('PO_ESTA').AsString,2))
      else
        AddLine(form_nz  (consulta.fieldbyname('PO_CODI').AsFloat,4)  +' '+
          form_t   (consulta.fieldbyname('PO_NOME').AsString,30) +' '+
          form_t   (consulta.fieldbyname('PO_AGEN').AsString,10) +' '+
          ExibeCgc (consulta.fieldbyname('PO_CCGC').AsString)    +'   '+
          form_t   (consulta.fieldbyname('PO_CCOR').AsString,10) +'   '+
          form_t   (tipo,1)                      +'   '+
          form_t   (consulta.fieldbyname('PO_FONE').AsString,13) +' '+
          form_t   (consulta.fieldbyname('PO_FAX').AsString ,11) +' '+
          form_t   (consulta.fieldbyname('PO_CELU').AsString,12) +' '+
          form_nc  (consulta.fieldbyname('PO_TAXA').AsFloat,5));
      totport := totport + 1;
      consulta.next;
    end;
    AddLine('');
    AddLine('Total de portadores  ---> '+form_nz (totport,3));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
end;

{Impressao de contratos}
procedure imprime_contratos (consulta:TQuery);
var
  totcont: Integer;
begin
     {Inicio da visualizacao da impressao ***}
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'p11.rel';
    frm_principal.x_comando       := '12c';
    frm_principal.x_tam_fonte     := 12;
    Title:= 'CADASTRO DE CONTRATOS - Outros relatorios...';

        {inicializacoes}
    totcont := 0;
    consulta.first;

        {cabecalhos}
    AddLine('Data do relatorio: '+form_data(frm_principal.x_data_trabalho));
    AddLine(form_tc('-',80,'-'));
    AddLine('Código Nota/Fiscal     Total       Entrada  Qtde.Prest.    Juros  Plano');
    AddLine(form_tc('-',80,'-'));
    while (not consulta.eof) do
    begin
      AddLine (form_nz   (consulta.fieldbyname('CR_CODI').AsInteger,6)+' '+
        form_t    (consulta.fieldbyname('CR_NOTA').AsString,10)+'-'+
        form_t    (consulta.fieldbyname('CR_SERI').AsString,2)+' '+
        form_nc   (consulta.fieldbyname('CR_TOTA').AsFloat,10)+'  '+
        form_nc   (consulta.fieldbyname('CR_VENT').AsFloat,10)+'   '+
        form_nz   (consulta.fieldbyname('CR_QPRE').AsInteger,3)+'        '+
        form_nc   (consulta.fieldbyname('CR_FATO').AsFloat,8)+'  '+
        form_nz   (consulta.fieldbyname('CR_PLAN').AsInteger,3));
      totcont := totcont + 1;
      consulta.next;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de contratos ---> '+form_nz (totcont,3));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  frm_mem_print.showmodal;
  esconde_mensagem;
end;

{Impressao de clientes}
procedure imprime_clientes (consulta:TQuery);
var
  totclie: Integer;
  cnpj: String;
begin
     {Inicio da visualizacao da impressao ***}
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 80;
    frm_principal.x_arq_impressao := 'p10.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 12;
    Title:= 'CADASTRO DE CLIENTES - Outros relatorios...';

        {inicializacoes}
    totclie := 0;
    consulta.first;

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('Codigo|Lj|Nome do Cliente             |PDC |Sit| Endereco                    |  Fone     |Dt.Nasc. | Identidade    |  CPF / CNPJ');
    AddLine(form_tc('-',132,'-'));
    while (not consulta.eof) do
    begin
      cnpj := DevolveCpfFormatado(consulta.fieldbyname('CL_CPF').AsString);
      cnpj := FormataCNPJ (cnpj);
      AddLine (form_nz   (consulta.fieldbyname('CL_CODI').AsFloat,6)   +' '+
        form_nz   (consulta.fieldbyname('CL_LOJA').AsFloat,2)   +' '+
        form_t    (consulta.fieldbyname('CL_NOME').AsString,28) +' '+
        form_t    (consulta.fieldbyname('CL_PDC').AsString,4)   +'     '+
        form_t    (consulta.fieldbyname('CL_ENDE').AsString,29) +' '+
        form_t    (consulta.fieldbyname('CL_FONE').AsString,11) +' '+
        form_data (consulta.fieldbyname('CL_DTNA').AsDateTime)  +' '+
        form_t    (consulta.fieldbyname('CL_IDEN').AsString,12) +' '+
        cnpj);
      totclie := totclie + 1;
      consulta.next;
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de clientes ---> '+form_nz (totclie,3));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  frm_mem_print.showmodal;
  esconde_mensagem;
end;

{Relatorio de outros para cheques pre-datados ***}
procedure imprime_cheques_pre (consulta:TQuery);
var
  totvalor: Real;
  totcheq: Integer;
  cnpj: String;
begin
      {iniciando o relatorio ***}
  mostra_mensagem ('Preparando relatório...Aguarde!');
  with (frm_mem_print) do
  begin
         {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'h01.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 8;
    Title:= 'LISTAGEM PARA CONFERÊNCIA DE CHEQUES';

         {inicio do relatorio}
    AddLine(form_tc('-',132,'-'));
    AddLine(' Data     |                              | C P F  /  C G C | Num |         | Sr / Num. |  Num. | Data de | Cod. | Cod. |  Valor do ');
    AddLine('Emissao   | Nome do Cliente              |   DO EMITENTE   |Banco| Agencia | do Cheque |  Seq. | Vencto. | Port.| Loja |   Cheque  ');
    AddLine(form_tc('-',132,'-'));
    consulta.first;
    totcheq  := 0;
    totvalor := 0.00;
    while (not consulta.eof) do
    begin
      if (Length(consulta.fieldbyname('CH_CCGC').AsString)=11) then
        cnpj := ExibeCpf (consulta.fieldbyname('CH_CCGC').AsString)
      else
        cnpj := ExibeCgc (consulta.fieldbyname('CH_CCGC').AsString);
      AddLine (form_data (consulta.fieldbyname('CH_DTCT').AsDateTime)    +' '+
        form_t    (consulta.fieldbyname('CH_NOME').AsString,29) +'  '+
        form_t    (cnpj,17) +' '+
        form_t    (consulta.fieldbyname('CH_BANC').AsString,5)  +'  '+
        form_t    (consulta.fieldbyname('CH_AGEN').AsString,7)  +'   '+
        form_t    (floattostr(consulta.fieldbyname('CH_NUME').AsFloat),8) +'   '+
        form_nz   (consulta.fieldbyname('CH_CODI').AsFloat,6)  +'  '+
        form_data (consulta.fieldbyname('CH_DVTO').AsDateTime)    +' '+
        form_nz   (consulta.fieldbyname('CH_PORT').AsFloat,4)  +'   '+
        form_nz   (consulta.fieldbyname('CH_LOJA').AsFloat,3)  +'    '+
        form_nc   (consulta.fieldbyname('CH_VALO').AsFloat,10));
      totcheq := totcheq + 1;
      totvalor := totvalor + consulta.fieldbyname('CH_VALO').AsFloat;
      consulta.next;
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total ---> '+form_nz (totcheq,3)+
      '                                                            '+
      '                                               '+
      form_nc(totvalor,10));
    AddLine('');

         {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
end;

{Relatorios financeiros ------}
{Opcao de posioca financeira de contratos liquidados ***}
procedure RelatorioLiquidado (codigo: String; onde: Integer);
var
  clCont: TClassContrato;
  clClient: TClassCliente;
  ldias: String;
  linha2: String;
  contant: Integer;
begin
     {CONFIGURANDO DE ACORDO DE ONDE E CHAMADO}
  mostra_mensagem ('Preparando relatório...Aguarde!');
  if (onde=1) then
    if (frm_PosFinanc.flagCli=0) then
      with (frm_PosFinanc) do
      begin
        codigo:=Trim(edtCodigo.text);
        edtCodigo.text:=form_nz(strtofloat(Trim(edtCodigo.text)),6);
        pnCliente.caption:=ProcuraNomeClienteCod (strtofloat(codigo),frm_principal);
      end
    else
    begin
      clClient := TClassCliente.Create;
      with (clClient) do
      begin
        conect ('CREDITO',frm_principal);
        AddParam ('Select CL_CODI,CL_CODI                    ');
        AddParam ('From   CRECLI                             ');
        AddParam ('Where  (CL_CPF='+Trim(frm_PosFinanc.edtCodigo.text)+')  ');
        Execute;
        codigo := floattostr(Result('CL_CODI'));
        desconect;
        Free;
      end;
    end;
  clCont := TClassContrato.Create;
  with (clCont) do
  begin
          {Busca dos dados das prestacoes--}
    conect ('CREDITO', frm_principal);
    ClearSql;
    AddParam ('Select   CR_LOJA,CR_CODI,CR_DNOT,CR_TOTA,CR_PORT,CR_VENT, ');
    AddParam ('         PC_DVTO,PC_VALO,PC_DTPG,PC_VPAG,PC_NPRE,PC_PORT, ');
    AddParam ('         CR_PLAN,CR_PORT                                  ');
    AddParam ('From     CRECTABR,CREPRABR                                ');
    AddParam ('Where    (CR_CODI=PC_CONT)    AND (CR_CLIE=PC_CLIE) AND   ');
    AddParam ('         (CR_CLIE='+codigo+') AND (CR_PDEV=0)             ');
    AddParam ('Order By PC_CONT,PC_NPRE                                  ');
    if (not Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
        'Posição Financeira',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
        250,200);
    end
    else
    begin
               {gerando listagem na tela do computador ***}
      with (frm_mem_print) do
      begin
        PrepareReport;
        frm_principal.x_col_impressao := 80;
        frm_principal.x_arq_impressao := 's01.rel';
        frm_principal.x_comando       := '12c';
        frm_principal.x_tam_fonte     := 12;
        Title:= 'POSIÇÃO FINANCEIRA DO CLIENTE - Contratos Liquidados';

                   {inicio do relatorio}
        AddLine(form_tc('-',80,'-'));
        AddLine('Cliente: '+codigo+'/'+ProcuraNomeClienteCod(strtofloat(codigo),frm_principal));
        AddLine(form_tc('-',80,'-'));
        AddLine(form_tc('-',80,'-'));
        AddLine('Lj No.Ctr|  Data  |    Val.Ctr|Pc| Dt.Vct | $ Parc.|  $ Pago | Dt.Pgt.  | Dias  ');
        AddLine(form_tc('-',80,'-'));
        contant := 0;
        linha2  := form_tc(' ',30,' ');
        ldias   := '???';
        while (not clCont.eof) do
        begin
                        {mudanca de contrato ***}
          if (clCont.Result('CR_CODI')<>contant) then
          begin
            if (linha2<>form_tc(' ',30,' ')) then
              AddLine (linha2);
            contant  := clCont.Result('CR_CODI');
            AddLine (form_tc('-',80,'-'));
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),3)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),3)+'apo';
            AddLine (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
              form_nz   (contant,6)+' '+
              form_data (clCont.Result('CR_DNOT'))+' '+
              form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),9)+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              form_nc   (clCont.Result('PC_VALO'),8)+' '+
              form_nc   (clCont.Result('PC_VPAG'),8)+' '+
              form_data (clCont.Result('PC_DTPG'))+' '+
              form_t    (ldias,6));
            linha2  := form_nz (Result('CR_PLAN'),4)+'-'+
              form_t  (ProcuraTipoPlano(Result('CR_PLAN'),
              frm_principal),9)+' Entr.'+
              form_nc (clCont.Result('CR_VENT'),10);
          end
          else
          begin
                             {impressao das outras prestacoes ***}
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),3)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),3)+'apo';
            AddLine (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              form_nc   (clCont.Result('PC_VALO'),8)+' '+
              form_nc   (clCont.Result('PC_VPAG'),8)+' '+
              form_data (clCont.Result('PC_DTPG'))+' '+
              form_t    (ldias,6));
            if (linha2<>form_tc(' ',30,' ')) then
              linha2 := form_tc(' ',30,' ');
          end;
          clCont.next;
        end;

                   {salto de pagina}
        if (frm_principal.x_salto) then
          AddLine(chr(18)+chr(12))
        else
          AddLine(chr(18));
      end;
      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
    end;
    desconect;
    Free;
  end;
end;

{Opcao de posicao financeira de contratos Em Aberto ***}
procedure RelatorioEmAberto (codigo: String; onde: Integer);
var
  clCont: TClassContrato;
  clClient: TClassCliente;
  ldias: String;
  linha2: String;
  contant: Integer;
  multa,juros,atraso: Real;
  total1,total2,total3,total4: Real;
  totab,totcor,totsemjur: Real;
begin
     {CONFIGURANDO DE ACORDO COM O LOCAL DE ONDE É CHAMADO ***}
  mostra_mensagem ('Preparando relatório...Aguarde!');
  if (onde=1) then
    if (frm_PosFinanc.flagCli=0) then
      with (frm_PosFinanc) do
      begin
        codigo:=Trim(edtCodigo.text);
        edtCodigo.text:=form_nz(strtofloat(Trim(edtCodigo.text)),6);
        pnCliente.caption:=ProcuraNomeClienteCod (strtofloat(codigo),frm_PosFinanc);
      end
    else
    begin
      clClient := TClassCliente.Create;
      with (clClient) do
      begin
        conect ('CREDITO',frm_PosFinanc);
        AddParam ('Select CL_CODI,CL_CODI                                  ');
        AddParam ('From   CRECLI                                           ');
        AddParam ('Where  (CL_CPF='+Trim(frm_PosFinanc.edtCodigo.text)+')  ');
        Execute;
        codigo := floattostr(Result('CL_CODI'));
        desconect;
        Free;
      end;
    end;
  clCont := TClassContrato.Create;
  with (clCont) do
  begin
          {Busca dos dados dos cheques--}
    conect ('CREDITO', frm_principal);
    ClearSql;
    AddParam ('Select   CR_LOJA,CR_CODI,CR_DNOT,CR_TOTA,CR_PORT,CR_VENT, ');
    AddParam ('         PC_DVTO,PC_VALO,PC_DTPG,PC_VPAG,PC_NPRE,PC_STAT, ');
    AddParam ('         PC_PORT,CR_PLAN                                  ');
    AddParam ('From     CRECTABR,CREPRABR                                ');
    AddParam ('Where    (CR_CODI=PC_CONT)    AND (CR_CLIE=PC_CLIE) AND   ');
    AddParam ('         (CR_CLIE='+codigo+') AND                         ');
    AddParam ('         (CR_PDEV>0)          AND (CR_PDEV<=CR_QPRE)      ');
    AddParam ('Order by CR_LOJA,CR_CODI,PC_NPRE                          ');
    if (not Execute) then
    begin
      esconde_mensagem;
      frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
        'Posição Financeira',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
        250,200);
    end
    else
    begin
      with (frm_mem_print) do
      begin
                   {configurando o gerador de relatorios}
        PrepareReport;
        frm_principal.x_col_impressao := 132;
        frm_principal.x_arq_impressao := 's01.rel';
        frm_principal.x_comando       := '15c';
        frm_principal.x_tam_fonte     := 8;
        Title:= 'POSIÇÃO FINANCEIRA DO CLIENTE - Contratos em Aberto';

                   {inicio do relatorio}
        AddLine(form_tc('-',132,'-'));
        AddLine('Cliente: '+codigo+'/'+ProcuraNomeClienteCod(strtofloat(codigo),frm_principal));
        AddLine(form_tc('-',132,'-'));
        AddLine('Lj No.Ctr|  Data  |   Val.Ctr  |Pc| Dt.Vcto. |Atraso|   $ Parc.|    Multa |   Juros  |    a Cobrar');
        AddLine(form_tc('-',132,'-'));
        clCont.first;
        contant   := 0;
        linha2    := form_tc(' ',31,' ');
        ldias     := '???';
        total1    := 0.00;
        total2    := 0.00;
        total3    := 0.00;
        total4    := 0.00;
        totsemjur := 0.00;
        totcor    := 0.00;
        totab     := 0.00;
        while (not clCont.eof) do
        begin
                        {mudanca de contrato ***}
          if (clCont.Result('CR_CODI')<>contant) then
          begin
            if (linha2<>form_tc(' ',31,' ')) then
              AddLine (linha2);
            if (contant<>0) then
            begin
              AddLine (form_tc(' ',19,' ')+
                '-----------Totais Devidos>>       '+
                form_nc   (total1,10)+' '+
                form_nc   (total2,10)+' '+
                form_nc   (total3,10)+' '+
                form_nc   (total4,10));
              AddLine('');
            end;
            total1   := 0.00;
            total2   := 0.00;
            total3   := 0.00;
            total4   := 0.00;
            contant  := clCont.Result('CR_CODI');

                             {Verificando status das prestacoes--}
            if (clCont.Result('PC_STAT')='0') then
            begin
              if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
                atraso := frm_principal.x_data_trabalho - clCont.Result('PC_DVTO')
              else
                atraso := 0;
              totab := totab + clCont.Result ('PC_VALO');
              multa := LerMulta(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
              juros := LerJuros(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
              if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
              begin
                totcor := totcor + (clCont.Result('PC_VALO')+multa+juros);
                totsemjur := totsemjur + (clCont.Result('PC_VALO'));
              end;
              AddLine (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
                form_nz   (contant,6)+' '+
                form_data (clCont.Result('CR_DNOT'))+' '+
                form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),10)+' '+
                form_nz   (clCont.Result('PC_NPRE'),2)+' '+
                form_data (clCont.Result('PC_DVTO'))+' '+
                form_n    (atraso,3)+'    '+
                form_nc   (clCont.Result('PC_VALO'),10)+' '+
                form_nc   (multa,10)+' '+
                form_nc   (juros,10)+' '+
                form_nc   (multa + juros + clCont.Result('PC_VALO'),10));
            end
            else
            begin
              if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
                ldias:='Em dia'
              else
              if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
                ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),3)+'ant'
              else
                ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),3)+'apo';
              AddLine (form_nz   (clCont.Result('CR_LOJA'),2)+'.'+
                form_nz   (contant,6)+' '+
                form_data (clCont.Result('CR_DNOT'))+'  '+
                form_nc   (clCont.Result('CR_TOTA')+clCont.Result('CR_VENT'),9)+' '+
                form_nz   (clCont.Result('PC_NPRE'),2)+' '+
                form_data (clCont.Result('PC_DVTO'))+' '+
                form_t    ('Pagou',6)+'  '+
                form_nc   (clCont.Result('PC_VALO'),9)+' '+
                form_t    ('em '+datetostr(clCont.Result('PC_DTPG')),13)+' '+
                form_t    (ldias,6));
            end;
            linha2  := form_nz (Result('CR_PLAN'),3)+' -'+
              form_t  (ProcuraTipoPlano(Result('CR_PLAN'),
              frm_principal),10)+' Entr.'+
              form_nc (clCont.Result('CR_VENT'),10);
          end
          else
          if (clCont.Result('PC_STAT')='0') then
          begin
            if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
              atraso := frm_principal.x_data_trabalho - clCont.Result('PC_DVTO')
            else
              atraso := 0;
            totab := totab + clCont.Result ('PC_VALO');
            multa := LerMulta(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
            juros := LerJuros(clCont.Result('PC_VALO'),atraso,clCont.Result('CR_LOJA'));
            if (clCont.Result('PC_DVTO')<frm_principal.x_data_trabalho) then
            begin
              totcor := totcor + (clCont.Result('PC_VALO')+multa+juros);
              totsemjur := totsemjur + (clCont.Result('PC_VALO'));
            end;
            AddLine (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              form_n    (atraso,3)+'    '+
              form_nc   (clCont.Result('PC_VALO'),10)+' '+
              form_nc   (multa,10)+' '+
              form_nc   (juros,10)+' '+
              form_nc   (multa + juros + clCont.Result('PC_VALO'),10));
            if (linha2<>form_tc(' ',31,' ')) then
              linha2 := form_tc(' ',31,' ');
          end
          else
          begin
            if (clCont.Result('PC_DVTO')=clCont.Result('PC_DTPG')) then
              ldias:='Em dia'
            else
            if (clCont.Result('PC_DVTO')>clCont.Result('PC_DTPG')) then
              ldias:=form_n(clCont.Result('PC_DVTO')-clCont.Result('PC_DTPG'),3)+'ant'
            else
              ldias:=form_n(clCont.Result('PC_DTPG')-clCont.Result('PC_DVTO'),3)+'apo';
            AddLine (linha2+' '+
              form_nz   (clCont.Result('PC_NPRE'),2)+' '+
              form_data (clCont.Result('PC_DVTO'))+' '+
              form_t    ('Pagou',6)+'  '+
              form_nc   (clCont.Result('PC_VALO'),9)+' '+
              form_t    ('em '+datetostr(clCont.Result('PC_DTPG')),13)+' '+
              form_t    (ldias,6));
            if (linha2<>form_tc(' ',31,' ')) then
              linha2 := form_tc(' ',31,' ');
          end{impressao das outras prestacoes ***};
          if (clCont.Result('PC_STAT')='0') then
          begin
            total1    := total1 + clCont.Result('PC_VALO');
            total2    := total2 + multa;
            total3    := total3 + juros;
            total4    := total4 + (clCont.Result('PC_VALO')+multa+juros);
          end;
          clCont.next;
        end;
                   {Total final ***}
        if (linha2<>form_tc(' ',31,' ')) then
          AddLine (linha2);
        AddLine (form_tc(' ',19,' ')+
          '-----------Totais Devidos>>       '+
          form_nc   (total1,10)+' '+
          form_nc   (total2,10)+' '+
          form_nc   (total3,10)+' '+
          form_nc   (total4,10));
        AddLine ('');
        AddLine (' Totais do cliente ------------------------------------------------------------------------------------------------------------------');
        AddLine ('  Em aberto '+form_nc(totab,10)+
          '  |  Vencido sem Juros '+form_nc(totsemjur,10)+
          '  |  Corrigido '+form_nc(totcor,10));

                   {salto de pagina}
        if (frm_principal.x_salto) then
          AddLine(chr(18)+chr(12))
        else
          AddLine(chr(18));
      end;
      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
    end;
    desconect;
    Free;
  end;
end;


end.
