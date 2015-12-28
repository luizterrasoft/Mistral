unit un_ListaVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ExtCtrls, CheckBoxOO, MaskEditOO, LabelOO;

type
  Tfrm_ListaVendas = class(TForm)
    chSalto: TCheckBox;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmarttulo1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    lbtipz: TLabel;
    rdModelo: TRadioGroup;
    rdSituacao: TRadioGroup;
    Image2: TImage;
    Label3: TLabel;
    Label1: TLabel;
    edtInicial2: TMaskEdit;
    Label2: TLabel;
    edtFinal2: TMaskEdit;
    ch2: TCheckBox;
    Bevel1: TBevel;
    btnConfere: TPanel;
    botao_sair: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Label10: TLabel;
    lblNTerminal: TLabelOO;
    edtTerminal: TMaskEditOO;
    chTerminal: TCheckBoxOO;
    chExibirSomenteCaixa: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure Confirmarttulo1Click(Sender: TObject);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure chTerminalClick(Sender: TObject);
    procedure chTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chTerminalExit(Sender: TObject);
    procedure edtTerminalEnter(Sender: TObject);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    exibiu: Boolean;
    procedure LimparEdits;
  end;

var
  frm_ListaVendas: Tfrm_ListaVendas;

implementation

uses unDialogo, principal, unMensagem, mem_prnt, auxiliar, funcoes1, funcoes2, procura,
  venda, F8Lojas;

{$R *.DFM}

procedure Tfrm_ListaVendas.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ListaVendas.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ListaVendas.Confirmarttulo1Click(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  data1,data2: String;
  totqtde: Integer;
  status: String;
  indGauge,totgauge: Integer;
  lojaant: Real;
  vendant: Real;
  dataant: TDateTime;
  codant,total_qtde3,total_qtde2,total_qtde1: Integer;
  total_venda3,total_avista3,total_cavista3: Real;
  total_aprazo3,total_cprazo3: Real;
  total_venda2,total_avista2,total_cavista2: Real;
  total_aprazo2,total_cprazo2: Real;
  total_venda1,total_avista1,total_cavista1: Real;
  total_desc1,total_desc2,total_desc3: Real;
  total_aprazo1,total_cprazo1: Real;
  taxa,comissao: Real;
  label_tipz,linha,tipo,operacao: String;
  situacao: String;
  total_venda_1,total_venda_2: Real;
  total_numero_vendas_1,total_qtde_itens_1: Integer;
  total_numero_vendas_2,total_qtde_itens_2: Integer;
  itens_por_venda,venda_media: Real;
begin
    {CRITICA ÀS DATAS}
  if (not chTerminal.checked) and (edtTerminal.GetValor=0) then
  begin
    frmDialogo.ExibirMensagem ('O número do terminal deve ser informado!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTerminal.setfocus;
  end
  else
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Listagem de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Listagem de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (StrToDateTime(edtInicial2.Text)<StrToDateTime(frm_principal.x_prazo_vendas)) then
  begin
    frmDialogo.ExibirMensagem ('Data informada não permitida!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  begin
        {FORMATACAO DOS DADOS DE ENTRADA}
    if (edtInicial2.text='') and (not ch2.checked) then
      edtInicial2.text:='01/01/1900';
    if (Trim(edtFinal2.text)='') and (not ch2.checked) then
      edtFinal2.text:='31/12/5000';

        {Puxando os filtros}
    if (ch2.checked) then
    begin
      data1  := FormataDataVendas(strtodate('01/01/1900'));
      data2  := FormataDataVendas(strtodate('31/12/5000'));
    end
    else
    begin
      data1  := FormataDataVendas(strtodate(Trim(edtInicial2.text)));
      data2  := FormataDataVendas(strtodate(Trim(edtFinal2.text)));
    end;

        {******************************************************************************************}
        {1- MODELO ANALITICO}
        {******************************************************************************************}
    if (rdModelo.itemindex=0) then
    begin
            {iniciando o processamento do relatorio}
      mostra_mensagem ('Preparando listagem...Aguarde!');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      clAux := TClassAuxiliar.Create;
      with (clAux) do
      begin
        conect   (databaseprodutos, self);
        ClearSql;
        AddParam ('Select    VE_LOJA,VE_VEND,VE_DATA,VE_PDES,VE_TOTA,VE_QTDE,VE_DESC,          ');
        AddParam ('          VE_STAT,VE_CODI,VF_FPGT,VF_VALO,VE_CAIX,VE_TIPZ,VE_NOTA           ');
        AddParam ('From      VENDAS                                                            ');
        AddParam ('LEFT OUTER JOIN VENDAS_FORMA_PAGAMENTO ON (VE_CAIX=VF_CAIX) AND (VE_LOJA=VF_LOJA) AND (VE_CODI=VF_VEND) ');
        AddParam ('Where     (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                ');
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                           ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                          ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                     ');
          AddParam ('          (VE_FUNC=:func)                                              ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                         ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                                  ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                   ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                                   ');
        AddParam ('Order by  VE_LOJA,VE_DATA,VE_CODI,VF_ORDE                                   ');
        if (not chTerminal.checked) then
          consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
        if (not Execute) then
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
            'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        end
        else
        begin
          with (frm_mem_print) do
          begin
                         {configurando o gerador de relatorios}
            PrepareReport;
            frm_principal.x_col_impressao := 132;
            frm_principal.x_comando       := '15c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM DE VENDAS';

            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('Nº terminal.........: TODAS OS TERMINAIS')
            else
              AddLine ('Nº terminal.........: '+form_nz(edtTerminal.GetValor,2));
            if (rdSituacao.itemindex=0) then
              AddLine ('Situacao das vendas.: NORMAIS ')
            else
            if (rdSituacao.itemindex=1) then
              AddLine ('Situacao das vendas.: CANCELADAS ')
            else
            if (rdSituacao.itemindex=2) then
              AddLine ('Situacao das vendas.: TODAS AS VENDAS ');
            AddLine ('Modelo..: ANALITICO (Venda a venda) '+tipz);
            AddLine ('');
            indGauge:=0;
            totGauge:=clAux.Reccount;
            clAux.first;
            lojaant:=-1;
            vendant:=-1;
            dataant:=strtodate('01/01/1900');
            codant :=-1;
            total_qtde3    :=0;
            total_venda3   :=0;
            total_desc3    :=0.00;
            total_avista3  :=0.00;
            total_cavista3 :=0.00;
            total_aprazo3  :=0.00;
            total_cprazo3  :=0.00;
            total_qtde1    :=0;
            total_venda1   :=0;
            total_desc1    :=0.00;
            total_avista1  :=0.00;
            total_cavista1 :=0.00;
            total_aprazo1  :=0.00;
            total_cprazo1  :=0.00;
            while (not clAux.eof) do
            begin
                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  AddLine (form_tc2('-',132,'-'));
                  AddLine ('         Total do dia: '+
                    form_n  (total_qtde3,6)+
                    '  '+
                    form_nc4 (total_venda3,12)+
                    '         '+
                    form_nc4 (total_desc3,10)+
                    '                 '+
                    form_nc4 (total_avista3,11)+' '+
                    form_nc4 (total_cavista3,10)+' '+
                    form_nc4 (total_aprazo3,11)+' '+
                    form_nc4 (total_cprazo3,9));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0;
                  total_desc3    :=0.00;
                  total_avista3  :=0.00;
                  total_cavista3 :=0.00;
                  total_aprazo3  :=0.00;
                  total_cprazo3  :=0.00;
                  AddLine ('         Total loja..: '+
                    form_n  (total_qtde1,6)+
                    '  '+
                    form_nc4 (total_venda1,12)+
                    '         '+
                    form_nc4 (total_desc1,10)+
                    '                 '+
                    form_nc4 (total_avista1,11)+' '+
                    form_nc4 (total_cavista1,10)+' '+
                    form_nc4 (total_aprazo1,11)+' '+
                    form_nc4 (total_cprazo1,9));
                  vendant := clAux.Result('VE_VEND');
                  total_qtde1    :=0;
                  total_venda1   :=0;
                  total_desc1    :=0.00;
                  total_avista1  :=0.00;
                  total_cavista1 :=0.00;
                  total_aprazo1  :=0.00;
                  total_cprazo1  :=0.00;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                    AddLine ('');
                end;
                lojaant := clAux.Result('VE_LOJA');
                AddLine (form_tc2('-',132,'-'));
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
                AddLine (form_tc2('-',132,'-'));
                if (tipz='1') then
                  label_tipz:=''
                else
                if (tipz='2') then
                  label_tipz:=''
                else
                  label_tipz:='Sr';
                AddLine ('Data da   |  |Numero    |Qtde  |Total     |Perc. |Total      |----------|Tipo|Valor     |          |Valor      |          |      |');
                AddLine ('Venda     |Nt|Documento |Venda |Vendido  $|Desc.%|Desconto  $|Operacao  |Oper|A Vista  $|   Comis $|A Prazo   $|   Comis $|Sit   |'+label_tipz);
                AddLine (form_tc2('-',132,'-'));
              end;
              if (dataant<>clAux.Result('VE_DATA')) then
              begin
                if (dataant<>strtodate('01/01/1900')) then
                begin
                  AddLine (form_tc2('-',132,'-'));
                  AddLine ('         Total do dia: '+
                    form_n  (total_qtde3,6)+
                    '  '+
                    form_nc4 (total_venda3,12)+
                    '         '+
                    form_nc4 (total_desc3,10)+
                    '                 '+
                    form_nc4 (total_avista3,11)+' '+
                    form_nc4 (total_cavista3,10)+' '+
                    form_nc4 (total_aprazo3,11)+' '+
                    form_nc4 (total_cprazo3,9));
                  AddLine('');
                  total_qtde3    :=0;
                  total_venda3   :=0;
                  total_desc3    :=0.00;
                  total_avista3  :=0.00;
                  total_cavista3 :=0.00;
                  total_aprazo3  :=0.00;
                  total_cprazo3  :=0.00;
                end;
                dataant := clAux.Result('VE_DATA');
              end;
              if (codant<>clAux.result('VE_CODI')) then //impressao da venda
              begin
                linha  := form_data  (clAux.result('VE_DATA'))    +' '+
                  form_n     (clAux.result('VE_CAIX'),2)  +' '+
                  form_t     (clAux.result('VE_NOTA'),9)  +' '+
                  form_n     (clAux.result('VE_QTDE'),8)  +' '+
                  form_nc4   (clAux.result('VE_TOTA'),10) +'  '+
                  form_nc4   (clAux.result('VE_PDES'),5)  +' '+
                  form_nc4   (clAux.result('VE_DESC'),11);
                codant := clAux.result('VE_CODI');
                total_qtde3  := total_qtde3  + clAux.result('VE_QTDE');
                total_venda3 := total_venda3 + clAux.result('VE_TOTA');
                total_desc3  := total_desc3  + clAux.result('VE_DESC');
                total_qtde2  := total_qtde2  + clAux.result('VE_QTDE');
                total_venda2 := total_venda2 + clAux.result('VE_TOTA');
                total_desc2  := total_desc2  + clAux.result('VE_DESC');
                total_qtde1  := total_qtde1  + clAux.result('VE_QTDE');
                total_venda1 := total_venda1 + clAux.result('VE_TOTA');
                total_desc1  := total_desc1  + clAux.result('VE_DESC');
              end
              else
                linha := form_tc2(' ',62,' ');

                              //definindo forma de pgto.
              if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) then
                operacao:='DINHEIRO   '
              else
              if (clAux.result('VF_FPGT')=KFPGT_DEBITO) then
                operacao:='DEB/AUTOMAT'
              else
              if (clAux.result('VF_FPGT')=KFPGT_CHEQUE) then
                operacao:='CHEQUE     '
              else
              if (clAux.result('VF_FPGT')=KFPGT_CREDITO) then
                operacao:='CREDIARIO  '
              else
              if (clAux.result('VF_FPGT')=KFPGT_CARTAO) then
                operacao:='C/CREDITO  '
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALES) then
                operacao:='VALES      '
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                operacao:='VALES EMITI'
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALE_MERC) then
                operacao:='VALES MERC '
              else
                operacao:='S/PGTO!!!  ';
              if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) or
                (clAux.result('VF_FPGT')=KFPGT_DEBITO) or
                (clAux.result('VF_FPGT')=KFPGT_CHEQUE) or
                (operacao='S/PGTO!!!  ') then
                tipo:='AV' //A vista
              else
                tipo:='AP'; //A prazo
              taxa     := DevolvePercComisVend(lojaant,vendant,tipo); //COMISSAO do vendedor
              if (clAux.result('VF_FPGT')=KFPGT_VALES) or (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                comissao := 0.00
              else
                comissao := (taxa/100)*clAux.result('VF_VALO');
              if (tipo='AP') then
              begin
                if (tipz='1') then
                  label_tipz:=''
                else
                if (tipz='2') then
                  label_tipz:=''
                else
                  label_tipz:=clAux.result('VE_TIPZ');
                if (clAux.result('VE_STAT')='1') then
                  situacao:='Normal'
                else
                if (clAux.result('VE_STAT')='2') then
                  situacao:='Cancel';
                if (operacao='S/PGTO!!!  ') then
                  situacao:='TROCA ';
                AddLine (linha+' '+
                  operacao+' '+
                  tipo+' '+
                  '                         '+
                  form_nc4   (clAux.result('VF_VALO'),10)+' '+
                  form_nc4   (comissao,9)+' '+
                  situacao+' '+
                  label_tipz);
              end
              else
              if (tipo='AV') then
              begin
                if (tipz='1') then
                  label_tipz:=' '
                else
                if (tipz='2') then
                  label_tipz:=' '
                else
                  label_tipz:=clAux.result('VE_TIPZ');
                if (clAux.result('VE_STAT')='1') then
                  situacao:='Normal'
                else
                if (clAux.result('VE_STAT')='2') then
                  situacao:='Cancel';
                if (operacao='S/PGTO!!!  ') then
                  situacao:='TROCA ';
                AddLine (linha+' '+
                  operacao+' '+
                  tipo+'   '+
                  form_nc4   (clAux.result('VF_VALO'),10)+' '+
                  form_nc4   (comissao,10)+
                  '                       '+
                  situacao+' '+
                  label_tipz);
              end;
              if (tipo='AV') then
              begin
                total_avista3  := total_avista3  + clAux.result('VF_VALO');
                total_cavista3 := total_cavista3 + comissao;
                total_avista1  := total_avista1  + clAux.result('VF_VALO');
                total_cavista1 := total_cavista1 + comissao;
              end
              else
              if (tipo='AP') then
              begin
                total_aprazo3  := total_aprazo3  + clAux.result('VF_VALO');
                total_cprazo3  := total_cprazo3  + comissao;
                total_aprazo1  := total_aprazo1  + clAux.result('VF_VALO');
                total_cprazo1  := total_cprazo1  + comissao;
              end;
                              {---->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine (form_tc2('-',132,'-'));
            AddLine ('         Total do dia: '+
              form_n  (total_qtde3,6)+
              '  '+
              form_nc4 (total_venda3,12)+
              '         '+
              form_nc4 (total_desc3,10)+
              '                 '+
              form_nc4 (total_avista3,11)+' '+
              form_nc4 (total_cavista3,10)+' '+
              form_nc4 (total_aprazo3,11)+' '+
              form_nc4 (total_cprazo3,9));
            AddLine ('         Total loja..: '+
              form_n  (total_qtde1,6)+
              '  '+
              form_nc4 (total_venda1,12)+
              '         '+
              form_nc4 (total_desc1,10)+
              '                 '+
              form_nc4 (total_avista1,11)+' '+
              form_nc4 (total_cavista1,10)+' '+
              form_nc4 (total_aprazo1,11)+' '+
              form_nc4 (total_cprazo1,9));

                         {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          frm_mem_print.windowstate:=wsMaximized;
          esconde_mensagem;
          if (frm_principal.x_empresa = 'GIZA CALÇADOS') then
            frm_mem_print.bloqueiaImpressaoGiza := true;
          frm_mem_print.showmodal;
        end;
        desconect;
        Free;
      end;
    end

        {**********************************************************************************************}
        {2- MODELO SINTETICO POR VENDEDOR/DIA}
        {**********************************************************************************************}
    else
    if (rdModelo.itemindex=1) then
    begin
            {iniciando o processamento do relatorio}
      mostra_mensagem ('Preparando listagem...Aguarde!');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      clAux := TClassAuxiliar.Create;
      with (clAux) do
      begin
        conect   (databaseprodutos, self);
        ClearSql;
        AddParam ('Select    VE_LOJA,VE_VEND,VE_DATA,VE_PDES,VE_TOTA,VE_QTDE,VE_DESC, ');
        AddParam ('          VE_STAT,VE_CODI,VF_FPGT,VF_VALO                          ');
        AddParam ('From      VENDAS                                                   ');
        AddParam ('LEFT OUTER JOIN VENDAS_FORMA_PAGAMENTO ON (VE_CAIX=VF_CAIX) AND (VE_LOJA=VF_LOJA) AND (VE_CODI=VF_VEND) ');
        AddParam ('Where     (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND       ');
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                  ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND            ');
          AddParam ('          (VE_FUNC=:func)                                     ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                         ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                          ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                          ');
        AddParam ('Order by  VE_LOJA,VE_DATA,VE_CODI,VF_ORDE                          ');
        if (not chTerminal.checked) then
          consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
        if (not Execute) then
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
            'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        end
        else
        begin
          with (frm_mem_print) do
          begin
                         {configurando o gerador de relatorios}
            PrepareReport;
            frm_principal.x_col_impressao := 132;
            frm_principal.x_comando       := '15c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM DE VENDAS';

            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('Nº terminal.........: TODAS OS TERMINAIS')
            else
              AddLine ('Nº terminal.........: '+form_nz(edtTerminal.GetValor,2));
            if (rdSituacao.itemindex=0) then
              AddLine ('Situacao das vendas.: NORMAIS ')
            else
            if (rdSituacao.itemindex=1) then
              AddLine ('Situacao das vendas.: CANCELADAS ')
            else
            if (rdSituacao.itemindex=2) then
              AddLine ('Situacao das vendas.: TODAS AS VENDAS ');
            AddLine ('Modelo..: SINTETICO (totalizado p/ dia) '+tipz);
            AddLine ('');
            indGauge:=0;
            totGauge:=clAux.Reccount;
            clAux.first;
            lojaant:=-1;
            vendant:=-1;
            dataant:=strtodate('01/01/1900');
            codant :=-1;
            total_qtde3    :=0;
            total_venda3   :=0;
            total_desc3    :=0.00;
            total_avista3  :=0.00;
            total_cavista3 :=0.00;
            total_aprazo3  :=0.00;
            total_cprazo3  :=0.00;
            total_qtde2    :=0;
            total_venda2   :=0;
            total_desc2    :=0.00;
            total_avista2  :=0.00;
            total_cavista2 :=0.00;
            total_aprazo2  :=0.00;
            total_cprazo2  :=0.00;
            total_qtde1    :=0;
            total_venda1   :=0;
            total_desc1    :=0.00;
            total_avista1  :=0.00;
            total_cavista1 :=0.00;
            total_aprazo1  :=0.00;
            total_cprazo1  :=0.00;
            while (not clAux.eof) do
            begin
                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  AddLine (form_data(dataant)+'          '+
                    form_n  (total_qtde3,6)+
                    '  '+
                    form_nc4 (total_venda3,12)+
                    '         '+
                    form_nc4 (total_desc3,10)+
                    '                 '+
                    form_nc4 (total_avista3,11)+' '+
                    form_nc4 (total_cavista3,10)+' '+
                    form_nc4 (total_aprazo3,11)+' '+
                    form_nc4 (total_cprazo3,10));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0;
                  total_desc3    :=0.00;
                  total_avista3  :=0.00;
                  total_cavista3 :=0.00;
                  total_aprazo3  :=0.00;
                  total_cprazo3  :=0.00;
                  AddLine ('      Total loja..: '+
                    form_n  (total_qtde1,6)+
                    '  '+
                    form_nc4 (total_venda1,12)+
                    '         '+
                    form_nc4 (total_desc1,10)+
                    '                 '+
                    form_nc4 (total_avista1,11)+' '+
                    form_nc4 (total_cavista1,10)+' '+
                    form_nc4 (total_aprazo1,11)+' '+
                    form_nc4 (total_cprazo1,10));
                  total_qtde1    :=0;
                  total_venda1   :=0;
                  total_desc1    :=0.00;
                  total_avista1  :=0.00;
                  total_cavista1 :=0.00;
                  total_aprazo1  :=0.00;
                  total_cprazo1  :=0.00;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                    AddLine ('');
                end;
                lojaant := clAux.Result('VE_LOJA');
                AddLine (form_tc2('-',132,'-'));
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
                AddLine (form_tc2('-',132,'-'));
                AddLine ('Data da   |       |Qtde    |Total        |      |Total      |-----------|   |Valor     |          |Valor      |          ');
                AddLine ('Venda     |       |Vendida |Vendido     $|      |Desconto  $|Operacao   |   |A Vista  $|   Comis $|A Prazo   $|   Comis $');
                AddLine (form_tc2('-',132,'-'));
              end;
              if (dataant<>clAux.Result('VE_DATA')) then
              begin
                if (dataant<>strtodate('01/01/1900')) then
                begin
                  AddLine (form_data(dataant)+'          '+
                    form_n  (total_qtde3,6)+
                    '  '+
                    form_nc4 (total_venda3,12)+
                    '         '+
                    form_nc4 (total_desc3,10)+
                    '                 '+
                    form_nc4 (total_avista3,11)+' '+
                    form_nc4 (total_cavista3,10)+' '+
                    form_nc4 (total_aprazo3,11)+' '+
                    form_nc4 (total_cprazo3,10));
                  total_qtde3    :=0;
                  total_venda3   :=0;
                  total_desc3    :=0.00;
                  total_avista3  :=0.00;
                  total_cavista3 :=0.00;
                  total_aprazo3  :=0.00;
                  total_cprazo3  :=0.00;
                end;
                dataant := clAux.Result('VE_DATA');
              end;
              if (codant<>clAux.result('VE_CODI')) then //impressao da venda
              begin
                codant := clAux.result('VE_CODI');
                total_qtde3  := total_qtde3  + clAux.result('VE_QTDE');
                total_venda3 := total_venda3 + clAux.result('VE_TOTA');
                total_desc3  := total_desc3  + clAux.result('VE_DESC');
                total_qtde2  := total_qtde2  + clAux.result('VE_QTDE');
                total_venda2 := total_venda2 + clAux.result('VE_TOTA');
                total_desc2  := total_desc2  + clAux.result('VE_DESC');
                total_qtde1  := total_qtde1  + clAux.result('VE_QTDE');
                total_venda1 := total_venda1 + clAux.result('VE_TOTA');
                total_desc1  := total_desc1  + clAux.result('VE_DESC');
              end;

                              {//definindo a forma de pgto}
              if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) then
                operacao:='DINHEIRO   '
              else
              if (clAux.result('VF_FPGT')=KFPGT_DEBITO) then
                operacao:='DEB/AUTOMAT'
              else
              if (clAux.result('VF_FPGT')=KFPGT_CHEQUE) then
                operacao:='CHEQUE     '
              else
              if (clAux.result('VF_FPGT')=KFPGT_CREDITO) then
                operacao:='CREDIARIO  '
              else
              if (clAux.result('VF_FPGT')=KFPGT_CARTAO) then
                operacao:='C/CREDITO  '
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALES) then
                operacao:='VALES      '
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                operacao:='VALES EMITI'
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALE_MERC) then
                operacao:='VALES MERC '
              else
                operacao:='S/PGTO';
              if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) or
                (clAux.result('VF_FPGT')=KFPGT_DEBITO) or
                (clAux.result('VF_FPGT')=KFPGT_CHEQUE) or
                (operacao='S/PGTO!!!  ') then
                tipo:='AV' //A vista
              else
                tipo:='AP'; //A prazo
              taxa     := DevolvePercComisVend(lojaant,vendant,tipo); //COMISSAO DO VENDEDOR
              if (clAux.result('VF_FPGT')=KFPGT_VALES) or (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                comissao := 0.00
              else
                comissao := (taxa/100)*clAux.result('VF_VALO');
              if (tipo='AV') then
              begin
                total_avista3  := total_avista3  + clAux.result('VF_VALO');
                total_cavista3 := total_cavista3 + comissao;
                total_avista1  := total_avista1  + clAux.result('VF_VALO');
                total_cavista1 := total_cavista1 + comissao;
              end
              else
              if (tipo='AP') then
              begin
                total_aprazo3  := total_aprazo3  + clAux.result('VF_VALO');
                total_cprazo3  := total_cprazo3  + comissao;
                total_aprazo1  := total_aprazo1  + clAux.result('VF_VALO');
                total_cprazo1  := total_cprazo1  + comissao;
              end;
                              {--->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine (form_data(dataant)+'          '+
              form_n  (total_qtde3,6)+
              '  '+
              form_nc4 (total_venda3,12)+
              '         '+
              form_nc4 (total_desc3,10)+
              '                 '+
              form_nc4 (total_avista3,11)+' '+
              form_nc4 (total_cavista3,10)+' '+
              form_nc4 (total_aprazo3,11)+' '+
              form_nc4 (total_cprazo3,10));
            AddLine (form_tc2('-',132,'-'));
            AddLine ('      Total loja..: '+
              form_n  (total_qtde1,6)+
              '  '+
              form_nc4 (total_venda1,12)+
              '         '+
              form_nc4 (total_desc1,10)+
              '                 '+
              form_nc4 (total_avista1,11)+' '+
              form_nc4 (total_cavista1,10)+' '+
              form_nc4 (total_aprazo1,11)+' '+
              form_nc4 (total_cprazo1,10));

                         {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          frm_mem_print.windowstate:=wsMaximized;
          esconde_mensagem;
          if (frm_principal.x_empresa = 'GIZA CALÇADOS') then
            frm_mem_print.bloqueiaImpressaoGiza := true;
          frm_mem_print.showmodal;
        end;
        desconect;
        Free;
      end;
    end
        {**********************************************************************************************}

        {**********************************************************************************************}
        {3- MODELO SINTETICO - SO TOTAIS POR VENDEDOR}
        {**********************************************************************************************}
    else
    if (rdModelo.itemindex=2) then
    begin
            {iniciando o processamento do relatorio}
      mostra_mensagem ('Preparando listagem...Aguarde!');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      clAux := TClassAuxiliar.Create;
      with (clAux) do
      begin
        conect   (databaseprodutos, self);
        ClearSql;
        AddParam ('Select    VE_LOJA,VE_VEND,VE_TOTA,VE_QTDE                          ');
        AddParam ('From      VENDAS                                                   ');
        AddParam ('Where     (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND       ');
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                  ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND            ');
          AddParam ('          (VE_FUNC=:func)                                     ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                         ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                          ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                          ');
        AddParam ('Order by  VE_LOJA                                                  ');
        if (not chTerminal.checked) then
          consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
        if (not Execute) then
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
            'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        end
        else
        begin
          with (frm_mem_print) do
          begin
                         {configurando o gerador de relatorios}
            PrepareReport;
            frm_principal.x_col_impressao := 80;
            frm_principal.x_comando       := '12c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM DE VENDAS';

            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('Nº terminal.........: TODAS OS TERMINAIS')
            else
              AddLine ('Nº terminal.........: '+form_nz(edtTerminal.GetValor,2));
            if (rdSituacao.itemindex=0) then
              AddLine ('Situacao das vendas.: NORMAIS ')
            else
            if (rdSituacao.itemindex=1) then
              AddLine ('Situacao das vendas.: CANCELADAS ')
            else
            if (rdSituacao.itemindex=2) then
              AddLine ('Situacao das vendas.: TODAS AS VENDAS ');
            AddLine ('Modelo..: SINTETICO (Totais por vendedor) '+tipz);
            AddLine ('');
            AddLine (form_Tc2('-',80,'-'));
            AddLine ('                                    |Total      |Numero|Qtde  |Itens  |Venda   ');
            AddLine ('Loja                                |Venda     $|Vendas|Itens |P/Venda|Media  $');
            AddLine (form_Tc2('-',80,'-'));
            lojaant:=-1;
            vendant:=-1;
            indGauge:=0;
            totGauge:=clAux.Reccount;
            clAux.first;
            total_venda_1         := 0.00;
            total_numero_vendas_1 := 0;
            total_qtde_itens_1    := 0;
            total_venda_2         := 0.00;
            total_numero_vendas_2 := 0;
            total_qtde_itens_2    := 0;
            while (not clAux.eof) do
            begin
                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  itens_por_venda := total_qtde_itens_1/total_numero_vendas_1;
                  venda_media     := total_venda_1/total_numero_vendas_1;
                  AddLine (form_nz  (lojaant,2)                        +' - '+
                    form_t   (ProcuraNomeLoja(lojaant,self),30) +' '+
                    form_nc  (total_venda_1,12)                 +' '+
                    form_n   (total_numero_vendas_1,6)          +' '+
                    form_n   (total_qtde_itens_1,6)             +' '+
                    form_nc2 (itens_por_venda,6,2)              +' '+
                    form_nc  (venda_media,10));
                  total_venda_1         := 0.00;
                  total_numero_vendas_1 := 0;
                  total_qtde_itens_1    := 0;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                    AddLine ('');
                end;
                lojaant := clAux.Result('VE_LOJA');
              end;
              total_venda_1         := total_venda_1         + strtofloat(RetiraFormatacaoNumero(trim(form_nc(clAux.Result('VE_TOTA'),10))));
              total_numero_vendas_1 := total_numero_vendas_1 + 1;
              total_qtde_itens_1    := total_qtde_itens_1    + clAux.Result('VE_QTDE');
              total_venda_2         := total_venda_2         + strtofloat(RetiraFormatacaoNumero(trim(form_nc(clAux.Result('VE_TOTA'),10))));
              total_numero_vendas_2 := total_numero_vendas_2 + 1;
              total_qtde_itens_2    := total_qtde_itens_2    + clAux.Result('VE_QTDE');

                              {---->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            itens_por_venda := total_qtde_itens_1/total_numero_vendas_1;
            venda_media     := total_venda_1/total_numero_vendas_1;
            AddLine (form_nz  (lojaant,2)                        +' - '+
              form_t   (ProcuraNomeLoja(lojaant,self),30) +' '+
              form_nc  (total_venda_1,12)                 +' '+
              form_n   (total_numero_vendas_1,6)          +' '+
              form_n   (total_qtde_itens_1,6)             +' '+
              form_nc2 (itens_por_venda,6,2)              +' '+
              form_nc  (venda_media,10));
            AddLine (form_Tc2('-',80,'-'));
            itens_por_venda := total_qtde_itens_2/total_numero_vendas_2;
            venda_media     := total_venda_2/total_numero_vendas_2;
            AddLine ('Total..: '                                 +'                           '+
              form_nc  (total_venda_2,12)                 +' '+
              form_n   (total_numero_vendas_2,6)          +' '+
              form_n   (total_qtde_itens_2,6)             +' '+
              form_nc2 (itens_por_venda,6,2)              +' '+
              form_nc  (venda_media,10));

                         {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          frm_mem_print.windowstate:=wsMaximized;
          esconde_mensagem;
          if (frm_principal.x_empresa = 'GIZA CALÇADOS') then
            frm_mem_print.bloqueiaImpressaoGiza := true;
          frm_mem_print.showmodal;
        end;
        desconect;
        Free;
      end;
    end;
        {**********************************************************************************************}
  end;
end;

procedure Tfrm_ListaVendas.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendas.edtFinal2Enter(Sender: TObject);
begin
  if (edtFinal2.text='  /  /    ') then
    edtFinal2.text:=edtInicial2.text;
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendas.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtTerminal.setfocus;
end;

procedure Tfrm_ListaVendas.edtInicial2Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_ListaVendas.edtFinal2Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end;
end;

procedure Tfrm_ListaVendas.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfereClick(btnConfere);
  if (key=K_CIMA) then
    edtInicial2.setfocus;
end;

procedure Tfrm_ListaVendas.ch2Click(Sender: TObject);
begin
  if (not ch2.checked) then
  begin
    habilitaeditVerde(edtInicial2);
    habilitaeditVerde(edtFinal2);
    edtInicial2.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial2);
    desabilitaeditVerde(edtFinal2);
  end;
end;

procedure Tfrm_ListaVendas.ch2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not ch2.checked) then
  begin
    habilitaeditVerde(edtInicial2);
    habilitaeditVerde(edtFinal2);
    edtInicial2.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial2);
    desabilitaeditVerde(edtFinal2);
  end;
end;

procedure Tfrm_ListaVendas.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial2.enabled:=true;
  edtInicial2.setfocus;
  LimparEdits;
end;

procedure Tfrm_ListaVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
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
end;

procedure Tfrm_ListaVendas.LimparEdits;
begin
  edtTerminal.text :='';
  edtInicial2.text :='';
  edtFinal2.text   :='';
  ch2.checked:=false;
  edtTerminal.font.color:=clWhite;
  edtTerminal.text:='';
  edtTerminal.readonly:=true;
  edtTerminal.color:=clTeal;
  chTerminal.checked:=true;
  habilitaeditRelat(edtInicial2);
  habilitaeditRelat(edtFinal2);
end;

procedure Tfrm_ListaVendas.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  if (not exibiu) then
  begin
    if (edtInicial2.text='  /  /    ') then
      edtInicial2.text:=form_data(frm_principal.x_data_trabalho);
    if (edtFinal2.text='  /  /    ') then
      edtFinal2.text:=form_data(frm_principal.x_data_trabalho);
    exibiu:=true;
  end;

     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtinicial2.setfocus;
end;

procedure Tfrm_ListaVendas.FormCreate(Sender: TObject);
begin
  exibiu:=false;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
end;

procedure Tfrm_ListaVendas.btnConfereClick(Sender: TObject);
begin
  Confirmarttulo1.click;
end;

procedure Tfrm_ListaVendas.chTerminalClick(Sender: TObject);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_ListaVendas.chTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_ListaVendas.chTerminalExit(Sender: TObject);
begin
  if (chTerminal.checked) then
  begin
    edtTerminal.font.color:=clWhite;
    edtTerminal.text:='';
    edtTerminal.readonly:=true;
    edtTerminal.color:=clTeal;
  end
  else
  begin
    edtTerminal.font.color:=clBlack;
    edtTerminal.readonly:=false;
    edtTerminal.color:=clWhite;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_ListaVendas.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ListaVendas.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_ESC) then
    close;
end;

end.
