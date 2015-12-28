unit un_ListaVendasAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, ExtCtrls, CheckBoxOO, MaskEditOO, LabelOO;

type
  Tfrm_ListaVendasAtendimento = class(TForm)
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
    Label5: TLabel;
    edtInicial1: TMaskEdit;
    Label6: TLabel;
    edtFinal1: TMaskEdit;
    ch1: TCheckBox;
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
    chconsiderarvale: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure Confirmarttulo1Click(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtInicial1DblClick(Sender: TObject);
    procedure edtFinal1DblClick(Sender: TObject);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
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
  frm_ListaVendasAtendimento: Tfrm_ListaVendasAtendimento;

implementation

uses unDialogo, principal, unMensagem, mem_prnt, auxiliar, funcoes1, funcoes2, procura,
  venda, F8Lojas;

{$R *.DFM}

procedure Tfrm_ListaVendasAtendimento.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ListaVendasAtendimento.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_ListaVendasAtendimento.Confirmarttulo1Click(Sender: TObject);
var
  clAux,clAux2,claux3: TClassAuxiliar;
  total_forma,total_forma_vend,total_forma_loja: Real;
  codant,total_qtde3,total_qtde2,total_qtde1: Integer;
  total_venda3,total_venda2,total_venda1: Real;
  total_comis3,total_comis2,total_comis1: Real;
  total_numero_vendas_1,total_qtde_itens_1,QTDE_ITENS,contvend,totcomi: Integer;
  total_numero_vendas_2,total_qtde_itens_2: Integer;
  total_venda_1,total_venda_2,totalvendaf: Real;
  itens_por_venda,venda_media,valor_venda: Real;
  vend1,vend2,data1,data2: String;
  totqtde: Integer;
  operacao,status: String;
  indGauge,totgauge: Integer;
  lojaant,vendant,vendant1,formaant: Real;
  dataant: TDateTime;
  label_tipz,linha: String;
  situacao: String;
  contcomis : Boolean;
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
  if (Trim(edtInicial1.text)='') and (not ch1.checked) then
  begin
    frmDialogo.ExibirMensagem (' O vendedor inicial fornecida não é válida! '
      ,'Listagem de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial1.setfocus;
  end
  else
  if (Trim(edtFinal1.text)='') and (not ch1.checked) then
  begin
    frmDialogo.ExibirMensagem (' O vendedor final fornecida não é válida! '
      ,'Listagem de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal1.setfocus;
  end
  else
  if (not IsDate(edtInicial2.text) and (edtInicial2.text<>'  /  /    ') and (not ch2.Checked)) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Listagem de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate(edtFinal2.text) and (edtFinal2.text<>'  /  /    ') and (not ch2.Checked)) then
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
    if (edtInicial1.text='') and (not ch1.checked) then
      edtInicial1.text:='000000';
    if (Trim(edtFinal1.text)='') and (not ch1.checked) then
      edtFinal1.text:='999999';
    if (edtInicial2.text='') and (not ch2.checked) then
      edtInicial2.text:='01/01/1900';
    if (Trim(edtFinal2.text)='') and (not ch2.checked) then
      edtFinal2.text:='31/12/5000';

        {Puxando os filtros}
    if (ch1.checked) then
    begin
      vend1  := '000000';
      vend2  := '999999';
    end
    else
    begin
      vend1  := Trim(edtInicial1.text);
      vend2  := Trim(edtFinal1.text);
    end;
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
        AddParam ('Select VE_LOJA,VE_DATA,VE_PDES,VE_TOTA,VE_QTDE,VE_DESC,                             ');
        AddParam ('       VE_STAT,VE_CODI,VE_CAIX,VE_TIPZ,VE_NOTA,                                     ');
        AddParam ('       VA_VEDE,VA_TOTA,VA_QTDE,VA_COMI,VA_CAIX,VA_LOJA,VA_VEND                                              ');
        AddParam ('From   VENDAS,VENDAS_ATENDIMENTO                                                    ');
        AddParam ('Where  (VA_VEDE>='+vend1+') AND (VA_VEDE<='+vend2+')             ');
        AddParam ('  and     (VE_LOJA=VA_LOJA) AND (VE_CAIX=VA_CAIX) AND (VE_CODI=VA_VEND) AND            '); //juncao
        AddParam ('       (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                           ');
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                                   ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                                  ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                             ');
          AddParam ('          (VE_FUNC=:func)                                                      ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                                 ');
        if (frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA<>0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>=0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>0)                       ');

        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')            ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')             ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')        ');
        AddParam ('Order by  VE_LOJA,VA_VEDE,VE_DATA,VE_CODI,ve_nota                                           ');
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
            frm_principal.x_comando       := '15c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM DE VENDAS P/ LOJA/VENDEDOR';

            if (ch1.checked) then
              AddLine ('Vendedores..........: TODOS OS VENDEDORES')
            else
              AddLine ('Vendedores..........: '+vend1+' a '+vend2);
            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('N. terminal.........: TODAS OS TERMINAIS')
            else
              AddLine ('N. terminal.........: '+form_nz(edtTerminal.GetValor,2));
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
            total_qtde3    :=0;
            total_venda3   :=0.00;
            total_comis3   :=0.00;
            total_qtde2    :=0;
            total_venda2   :=0.00;
            total_comis2   :=0.00;
            total_qtde1    :=0;
            total_venda1   :=0.00;
            total_comis1   :=0.00;
            contcomis      := true;
            clAux3 := TClassAuxiliar.Create;
            clAux3.conect   (databaseprodutos, self);
            while (not clAux.eof) do
            begin
              with (clAux3) do
              begin
                ClearSql;
                AddParam ('select VF_CAIX,VF_LOJA,VF_VEND,VF_FPGT,VF_VALO       ');
                AddParam ('From VENDAS_FORMA_PAGAMENTO                  ');
                AddParam ('Where VF_CAIX=:VF_CAIX and VF_LOJA=:VF_LOJA  ');
                AddParam ('and   VF_VEND=:VF_VEND                       ');
                consulta.ParamByName('VF_CAIX').AsFloat := clAux.Result('VA_CAIX');
                consulta.ParamByName('VF_LOJA').AsFloat := clAux.Result('VA_LOJA');
                consulta.ParamByName('VF_VEND').AsFloat := clAux.Result('VA_VEND');
                Execute;
              end;
                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  AddLine ('            Total do dia: '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                  AddLine ('         Total vend..: '+
                    form_n  (total_qtde2,6)+
                    ' '+
                    form_nc4 (total_venda2,15)+' '+
                    form_nc4 (total_comis2,14));
                  total_qtde2    :=0;
                  total_venda2   :=0.00;
                  total_comis2   :=0.00;
                  AddLine ('');
                  AddLine ('            Total loja..: '+
                    form_n  (total_qtde1,6)+
                    ' '+
                    form_nc4 (total_venda1,15)+' '+
                    form_nc4 (total_comis1,14));
                  vendant := clAux.Result('VA_VEDE');
                  total_qtde1    :=0;
                  total_venda1   :=0.00;
                  total_comis1   :=0.00;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                  begin
                    AddLine ('');
                    AddLine ('');
                  end;
                end;
                lojaant := clAux.Result('VE_LOJA');
                AddLine ('');
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
                AddLine (form_tc2('-',80,'-'));
                if (tipz='1') then
                  label_tipz:=''
                else
                if (tipz='2') then
                  label_tipz:=''
                else
                  label_tipz:='Sr';
                AddLine ('Data da   |  |Numero    |Qtde  |Total          |Total          |      |');
                AddLine ('Venda     |Nt|Documento |Venda |Vendido       $|Comissionavel $|Sit   |'+label_tipz);
              end;
              if (vendant<>clAux.Result('VA_VEDE')) then
              begin
                if (vendant<>-1) {and (contcomis)} then
                begin
                  AddLine ('            Total do dia: '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                  AddLine ('            Total vend..: '+
                    form_n  (total_qtde2,6)+
                    ' '+
                    form_nc4 (total_venda2,15)+' '+
                    form_nc4 (total_comis2,14));
                  total_qtde2    :=0;
                  total_venda2   :=0.00;
                  total_comis2   :=0.00;
                end;
                vendant := clAux.Result('VA_VEDE');
//                                   if (contcomis) then
//                                   begin
                AddLine (form_tc2('-',80,'-'));
                AddLine ('Vendedor..:'+form_nz(vendant,6)+'-'+form_t(ProcuraNomeVend(lojaant,vendant,self),30));
//                                   end;
              end;
              if (dataant<>clAux.Result('VE_DATA')) then
              begin
                if (dataant<>strtodate('01/01/1900')) and (contcomis) then
                begin
                  AddLine ('            Total do dia: '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                end;
                dataant := clAux.Result('VE_DATA');
              end;

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
              contcomis := true;
              if (not frm_principal.x_comissao_vales_recebidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES) and (not chconsiderarvale.Checked) then
                contcomis := false
              else
              if (not frm_principal.x_comissao_vales_emitidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES_EMI) and (not chconsiderarvale.Checked) then
                contcomis := false
              else
              if (not frm_principal.x_comissao_vales_mercadoria) and (clAux3.result('VF_FPGT')=KFPGT_VALE_MERC) then
                contcomis := false
              else
              if (frm_principal.x_comissao_vales_mercadoria) and (clAux3.result('VF_FPGT')=KFPGT_VALE_MERC) then
                contcomis := true
              else
              if ((not frm_principal.x_comissao_vales_emitidos) or (not frm_principal.x_comissao_vales_recebidos)) and (not chconsiderarvale.Checked) then
              begin
                if (clAux3.result('VF_FPGT')=KFPGT_DINHEIRO) and (claux.Result('VE_TOTA')<0) then
                  contcomis := false;// else contcomis := true
              end
              else
                contcomis := true;
              valor_venda := clAux.result('VA_TOTA');
{                              if (not contcomis) then
                                 valor_venda := clAux.result('VA_TOTA')-claux3.Result('VF_VALO')
                              else valor_venda := clAux.result('VA_TOTA'); }
//                              if (contcomis) then
//                              if (valor_venda>0.00) then
              AddLine (form_data  (clAux.result('VE_DATA'))    +' '+
                form_n     (clAux.result('VE_CAIX'),2)  +' '+
                form_t     (clAux.result('VE_NOTA'),9)  +' '+
                form_n     (clAux.result('VA_QTDE'),8)  +' '+
                form_nc4   (valor_venda,15) +' '+
//                                       form_nc4   (clAux.result('VA_TOTA'),15) +' '+
                form_nc4   (clAux.result('VA_COMI'),14) +' '+
                situacao                                +' '+
                label_tipz);

//                            if (contcomis) then
//                            begin
              total_qtde3  := total_qtde3  + clAux.result('VA_QTDE');
              total_venda3 := total_venda3 + valor_venda; // clAux.result('VA_TOTA');
              total_comis3 := total_comis3 + clAux.result('VA_COMI');
              total_qtde2  := total_qtde2  + clAux.result('VA_QTDE');
              total_venda2 := total_venda2 + valor_venda; //clAux.result('VA_TOTA');
              total_comis2 := total_comis2 + clAux.result('VA_COMI');
              total_qtde1  := total_qtde1  + clAux.result('VA_QTDE');
              total_venda1 := total_venda1 + valor_venda; //clAux.result('VA_TOTA');
              total_comis1 := total_comis1 + clAux.result('VA_COMI');
//                            end;
                              {---->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine ('            Total do dia: '+
              form_n  (total_qtde3,6)+
              ' '+
              form_nc4 (total_venda3,15)+' '+
              form_nc4 (total_comis3,14));
            AddLine ('            Total vend..: '+
              form_n  (total_qtde2,6)+
              ' '+
              form_nc4 (total_venda2,15)+' '+
              form_nc4 (total_comis2,14));
            AddLine ('');
            AddLine ('            Total loja..: '+
              form_n  (total_qtde1,6)+
              ' '+
              form_nc4 (total_venda1,15)+' '+
              form_nc4 (total_comis1,14));
                         {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          claux3.Desconect;
          claux3.Free;
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

        {******************************************************************************************}
        {2- MODELO ANALITICO POR FORMA DE PGTO.}
        {******************************************************************************************}
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
        AddParam ('select ve_loja,ve_caix,ve_nota,ve_tota,ve_qtde,ve_tipz,ve_stat,ve_data,                                      ');
        AddParam ('       va_vede,va_comi,                                                                                              ');
        AddParam ('       vf_fpgt,vf_orde,vf_valo                                                                               ');
        AddParam ('from VENDAS                                                                                                  ');
        AddParam ('     INNER JOIN VENDAS_ATENDIMENTO ON (ve_loja=va_loja and ve_caix=va_caix and ve_codi=va_vend)              ');
        AddParam ('     LEFT OUTER JOIN VENDAS_FORMA_PAGAMENTO ON (ve_caix=vf_caix AND ve_loja=vf_loja AND ve_codi=vf_vend)     ');
        AddParam ('Where (VA_VEDE>='+vend1+') AND (VA_VEDE<='+vend2+') AND                                                      ');
        AddParam ('      (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                                                     ');
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                                                            ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                                                           ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                                                      ');
          AddParam ('          (VE_FUNC=:func)                                                                               ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                                                          ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                                     ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                      ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                                 ');
{                 if (not chconsiderarvale.Checked) then
                    AddParam ('AND (VF_FPGT<>'+inttostr(KFPGT_VALES_EMI)+') AND (VF_FPGT<>'+inttostr(KFPGT_VALES)+')                     '); }
        if (not frm_principal.x_comissao_vales_mercadoria) then
          AddParam ('AND (VF_FPGT<>'+inttostr(KFPGT_VALE_MERC)+')                                                              ');
        if (frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA<>0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>=0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>0)                       ');
        AddParam ('Order by  ve_loja,va_vede,vf_fpgt,vf_orde                                                                    ');
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
            frm_principal.x_comando       := '15c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM VENDAS P/ VENDEDOR/FORMA PGTO.';

            if (ch1.checked) then
              AddLine ('Vendedores..........: TODOS OS VENDEDORES')
            else
              AddLine ('Vendedores..........: '+vend1+' a '+vend2);
            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('N. terminal.........: TODAS OS TERMINAIS')
            else
              AddLine ('N. terminal.........: '+form_nz(edtTerminal.GetValor,2));
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

            lojaant :=-1;
            vendant :=-1;
            formaant:=-1;
            total_forma      := 0.00;
            total_forma_vend := 0.00;
            total_forma_loja := 0.00;
            total_comis1     := 0.00;
            total_comis2     := 0.00;
            total_comis3     := 0.00;
            while (not clAux.eof) do
            begin
                              {ORDEM: LOJA>>VENDEDOR>>FORMA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  AddLine (form_tc2(' ',35,' ')+' Subtotal: '+form_nc(total_forma,13));
                  total_forma := 0.00;
                  total_comis2 := 0.00;
                  formaant := clAux.Result('VF_FPGT');
                  AddLine (form_tc2(' ',29,' ')+' Total vendedor: '+form_nc(total_forma_vend,13));
                  total_forma_vend := 0.00;
                  total_comis1 := 0.00;
                  vendant  := clAux.Result('VA_VEDE');
                  AddLine ('');
                  AddLine (form_tc2(' ',33,' ')+' Total loja: '+form_nc(total_forma_loja,13));
                  total_forma_loja := 0.00;
                  total_comis3 := 0.00;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                  begin
                    AddLine ('');
                    AddLine ('');
                  end;
                end;
                lojaant := clAux.Result('VE_LOJA');
                AddLine ('');
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
              end;
              if (vendant<>clAux.Result('VA_VEDE')) then
              begin
                if (vendant<>-1) then
                begin
                  AddLine (form_tc2(' ',35,' ')+' Subtotal: '+form_nc(total_forma,13));
                  total_forma := 0.00;
                  total_comis2 := 0.00;
                  formaant := clAux.Result('VF_FPGT');
                  AddLine (form_tc2(' ',29,' ')+' Total vendedor: '+form_nc(total_forma_vend,13));
                  total_forma_vend := 0.00;
                  total_comis1 := 0.00;
                end;
                vendant := clAux.Result('VA_VEDE');
                AddLine ('Vendedor..:'+form_nz(vendant,6)+'-'+form_t(ProcuraNomeVend(lojaant,vendant,self),30));
                AddLine (form_tc2('-',80,'-'));
                if (tipz='1') then
                  label_tipz:=''
                else
                if (tipz='2') then
                  label_tipz:=''
                else
                  label_tipz:='Sr';
                AddLine ('    |Numero    |Total         |    |                         |      |');
                AddLine ('Term|Documento |Venda        $|Qtde|Forma de pagamento       |Status|'+label_tipz);
                AddLine (form_tc2('-',80,'-'));
              end;
              if (formaant<>clAux.Result('VF_FPGT')) then
              begin
                if (formaant<>-1) then
                begin
                  AddLine (form_tc2(' ',35,' ')+' Subtotal: '+form_nc(total_forma,13));
                  total_forma := 0.00;
                  total_comis2 := 0.00;
                end;
                formaant := clAux.Result('VF_FPGT');
              end;

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
                operacao:='VALES RECEB     '
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                operacao:='VALES EMIT'
              else
              if (clAux.result('VF_FPGT')=KFPGT_VALE_MERC) then
                operacao:='VALES MERC '
              else
                operacao:='S/PGTO!!!  ';

              AddLine (form_n  (clAux.result('ve_caix'),4)  +' '+
                form_t  (clAux.result('ve_nota'),9)  +' '+
                form_nc (clAux.result('ve_tota'),15) +' '+
                form_n  (clAux.result('ve_qtde'),4)  +' '+
                form_t  (operacao,12)                +' '+
                form_nc (clAux.result('vf_valo'),10) +'   '+
                form_t  (situacao,6)                 +' '+
                label_tipz);
              if (not frm_principal.x_comissao_vales_recebidos) and (clAux.result('VF_FPGT')=KFPGT_VALES) then
                contcomis := false
              else
              if (not frm_principal.x_comissao_vales_emitidos) and (clAux.result('VF_FPGT')=KFPGT_VALES_EMI) then
                contcomis := false
              else
              if (not frm_principal.x_comissao_vales_mercadoria) and (clAux.result('VF_FPGT')=KFPGT_VALE_MERC) then
                contcomis := false
              else
              if ((not frm_principal.x_comissao_vales_emitidos) or (not frm_principal.x_comissao_vales_recebidos)) then
              begin
                if (clAux.result('VF_FPGT')=KFPGT_DINHEIRO) and (claux.Result('VE_TOTA')<0) then
                  contcomis := false
                else
                  contcomis := true
              end
              else
                contcomis := true;
//                              if (contcomis) then
//                              begin
              total_forma      := total_forma + clAux.result('vf_valo');
              total_forma_vend := total_forma_vend + clAux.result('vf_valo');
              total_forma_loja := total_forma_loja + clAux.result('vf_valo');
              total_comis1     := total_comis1 + clAux.Result('va_comi');
              total_comis2     := total_comis2 + clAux.Result('va_comi');
              total_comis3     := total_comis3 + clAux.Result('va_comi');
//                              end;
                              {---->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine (form_tc2(' ',35,' ')+' Subtotal: '+form_nc(total_forma,13));
            formaant := clAux.Result('VF_FPGT');
            AddLine (form_tc2(' ',29,' ')+' Total vendedor: '+form_nc(total_forma_vend,13));
            vendant  := clAux.Result('VA_VEDE');
            AddLine ('');
            AddLine (form_tc2(' ',33,' ')+' Total loja: '+form_nc(total_forma_loja,13));

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
        {3- MODELO SINTETICO POR VENDEDOR/DIA}
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
        AddParam ('Select VE_LOJA,VE_DATA,VE_PDES,VE_TOTA,VE_QTDE,VE_DESC,                             ');
        AddParam ('       VE_STAT,VE_CODI,                                                      ');
        AddParam ('       VA_VEDE,VA_TOTA,VA_QTDE,VA_COMI,va_caix,va_vend,va_loja                      ');
        AddParam ('From   VENDAS,VENDAS_ATENDIMENTO                                                    ');
        AddParam ('Where  (VA_VEDE>='+vend1+') AND (VA_VEDE<='+vend2+') AND                            ');
        AddParam ('       (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                           ');
        AddParam ('       (VE_LOJA=VA_LOJA) AND (VE_CAIX=VA_CAIX) AND (VE_CODI=VA_VEND) AND            '); //juncao
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                                   ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                                  ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                             ');
          AddParam ('          (VE_FUNC=:func)                                                      ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                                 ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')            ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')             ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')        ');
//                 if (not chconsiderarvale.Checked) then
//                    AddParam ('AND (VF_FPGT<>'+inttostr(KFPGT_VALES_EMI)+') AND (VF_FPGT<>'+inttostr(KFPGT_VALES)+')                ');
        if (frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA<>0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>=0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>0)                       ');
        AddParam ('Order by  VE_LOJA,VA_VEDE,VE_DATA,VE_CODI                                           ');
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
            Title:= 'LISTAGEM DE VENDAS P/ LOJA/VENDEDOR';

            if (ch1.checked) then
              AddLine ('Vendedores..........: TODOS OS VENDEDORES')
            else
              AddLine ('Vendedores..........: '+vend1+' a '+vend2);
            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('N. terminal.........: TODOS OS TERMINAIS')
            else
              AddLine ('N. terminal.........: '+form_nz(edtTerminal.GetValor,2));
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
            total_venda3   :=0.00;
            total_comis3   :=0.00;
            total_qtde2    :=0;
            total_venda2   :=0.00;
            total_comis2   :=0.00;
            total_qtde1    :=0;
            total_venda1   :=0.00;
            total_comis1   :=0.00;
            clAux3 := TClassAuxiliar.Create;
            clAux3.conect   (databaseprodutos, self);
            while (not clAux.eof) do
            begin
              with (clAux3) do
              begin
                ClearSql;
                AddParam ('select VF_CAIX,VF_LOJA,VF_VEND,VF_FPGT,VF_VALO       ');
                AddParam ('From VENDAS_FORMA_PAGAMENTO                  ');
                AddParam ('Where VF_CAIX=:VF_CAIX and VF_LOJA=:VF_LOJA  ');
                AddParam ('and   VF_VEND=:VF_VEND                       ');
                consulta.ParamByName('VF_CAIX').AsFloat := clAux.Result('VA_CAIX');
                consulta.ParamByName('VF_LOJA').AsFloat := clAux.Result('VA_LOJA');
                consulta.ParamByName('VF_VEND').AsFloat := clAux.Result('VA_VEND');
                Execute;
              end;

                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  AddLine (form_data(dataant)+'          '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                  AddLine ('      Total vend..: '+
                    form_n  (total_qtde2,6)+
                    ' '+
                    form_nc4 (total_venda2,15)+' '+
                    form_nc4 (total_comis2,14));
                  total_qtde2    :=0;
                  total_venda2   :=0.00;
                  total_comis2   :=0.00;
                  AddLine ('');
                  AddLine ('      Total loja..: '+
                    form_n  (total_qtde1,6)+
                    ' '+
                    form_nc4 (total_venda1,15)+' '+
                    form_nc4 (total_comis1,14));
                  vendant := clAux.Result('VA_VEDE');
                  total_qtde1    :=0;
                  total_venda1   :=0.00;
                  total_comis1   :=0.00;
                  if (chSalto.checked) then
                    AddLine (chr(12)+form_tc2(' ',131,' '))
                  else
                  begin
                    AddLine ('');
                    AddLine ('');
                  end;
                end;
                lojaant := clAux.Result('VE_LOJA');
                AddLine ('');
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
                AddLine (form_tc2('-',80,'-'));
                AddLine ('Data da   |       |Qtde    |Total        |Total');
                AddLine ('Venda     |       |Itens   |Vendido     $|Comissionavel $');
              end;
              if (vendant<>clAux.Result('VA_VEDE')) then
              begin
                if (vendant<>-1) then
                begin
                  AddLine (form_data(dataant)+'          '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  dataant := clAux.Result('VE_DATA');
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                  AddLine ('      Total vend..: '+
                    form_n  (total_qtde2,6)+
                    ' '+
                    form_nc4 (total_venda2,15)+' '+
                    form_nc4 (total_comis2,14));
                  total_qtde2    :=0;
                  total_venda2   :=0.00;
                  total_comis2   :=0.00;
                end;
                vendant := clAux.Result('VA_VEDE');
                AddLine (form_tc2('-',80,'-'));

                AddLine ('Vendedor..:'+form_nz(vendant,6)+'-'+form_t(ProcuraNomeVend(lojaant,vendant,self),30));
              end;
              if (dataant<>clAux.Result('VE_DATA')) then
              begin
                if (dataant<>strtodate('01/01/1900')) then
                begin
                  AddLine (form_data(dataant)+'          '+
                    form_n  (total_qtde3,6)+
                    ' '+
                    form_nc4 (total_venda3,15)+' '+
                    form_nc4 (total_comis3,14));
                  total_qtde3    :=0;
                  total_venda3   :=0.00;
                  total_comis3   :=0.00;
                end;
                dataant := clAux.Result('VE_DATA');
              end;
              if (not chconsiderarvale.Checked) then
              begin
                if (not frm_principal.x_comissao_vales_recebidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES) then
                  contcomis := false
                else
                if (not frm_principal.x_comissao_vales_emitidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES_EMI) then
                  contcomis := false
                else
                if ((not frm_principal.x_comissao_vales_emitidos) or (not frm_principal.x_comissao_vales_recebidos)) then
                begin
                  if (clAux3.result('VF_FPGT')=KFPGT_DINHEIRO) and (claux.Result('VE_TOTA')<0) then
                    contcomis := false
                  else
                    contcomis := true
                end
                else
                  contcomis := true;
              end
              else
                contcomis := true;
              if (not frm_principal.x_comissao_vales_mercadoria) and (clAux3.result('VF_FPGT')=KFPGT_VALE_MERC) then
                contcomis := false
              else
              if (frm_principal.x_comissao_vales_mercadoria) and (clAux3.result('VF_FPGT')=KFPGT_VALE_MERC) then
                contcomis := true;
              valor_venda := clAux.result('VA_TOTA');
{                              if (not contcomis) then
                                 valor_venda := clAux.result('VA_TOTA')-claux3.Result('VF_VALO')
                              else valor_venda := clAux.result('VA_TOTA'); }

//                              if (contcomis) then
//                              begin
              total_qtde3  := total_qtde3  + clAux.result('VA_QTDE');
              total_venda3 := total_venda3 + valor_venda; // clAux.result('VA_TOTA');
              total_comis3 := total_comis3 + clAux.result('VA_COMI');
              total_qtde2  := total_qtde2  + clAux.result('VA_QTDE');

              total_venda2 := total_venda2 + valor_venda; //clAux.result('VA_TOTA');
              total_comis2 := total_comis2 + clAux.result('VA_COMI');
              total_qtde1  := total_qtde1  + clAux.result('VA_QTDE');

              total_venda1 := total_venda1 + valor_venda; //clAux.result('VA_TOTA');
              total_comis1 := total_comis1 + clAux.result('VA_COMI');
//                              end;
                              {--->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine (form_data(dataant)+'          '+
              form_n  (total_qtde3,6)+
              ' '+
              form_nc4 (total_venda3,15)+' '+
              form_nc4 (total_comis3,14));
            AddLine ('      Total vend..: '+
              form_n  (total_qtde2,6)+
              ' '+
              form_nc4 (total_venda2,15)+' '+
              form_nc4 (total_comis2,14));
            AddLine ('');
            AddLine ('      Total loja..: '+
              form_n  (total_qtde1,6)+
              ' '+
              form_nc4 (total_venda1,15)+' '+
              form_nc4 (total_comis1,14));

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
          claux3.Desconect;
          claux3.Free;
        end;
        desconect;
        Free;
      end;
    end
        {**********************************************************************************************}

        {**********************************************************************************************}
        {4- MODELO SINTETICO - SO TOTAIS POR VENDEDOR}
        {**********************************************************************************************}
    else
    if (rdModelo.itemindex=3) then
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
        AddParam ('Select VE_LOJA,VA_VEDE,                                                             ');
        AddParam ('       SUM(VA_TOTA) as TOTAL_VENDA,                                                 '); //ordem
        AddParam ('       SUM(VA_QTDE) as TOTAL_QTDE_ITENS,                                            ');
        AddParam ('       COUNT(*) as TOTAL_NUMERO_VENDAS                                              ');
        AddParam ('From   VENDAS,VENDAS_ATENDIMENTO                                                    ');
        AddParam ('Where  (VA_VEDE>='+vend1+') AND (VA_VEDE<='+vend2+') AND                            ');
        AddParam ('       (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                           ');
        AddParam ('       (VE_LOJA=VA_LOJA) AND (VE_CAIX=VA_CAIX) AND (VE_CODI=VA_VEND) AND            '); //juncao
        if (not chTerminal.checked) then
          AddParam ('       (VE_CAIX=:terminal) AND                                                   ');
//                 if (not frm_principal.x_exibir_itens) then
//                    AddParam (' (VF_FPGT<>:VEMIT) AND (VF_FPGT<>:VRECEBE) AND (VF_FPGT<>:VMERC) AND             ');
        AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                                  ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                             ');
          AddParam ('          (VE_FUNC=:func)                                                      ');
        end
        else
          AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                                 ');
        if (tipz='1') or (tipz='2') then
          AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')            ');
        if (rdSituacao.itemindex=0) then
          AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')             ')
        else
        if (rdSituacao.itemindex=1) then
          AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')        ');
        if (frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA<>0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>=0)                      ')
        else
        if (not frm_principal.x_exibe_devolucao) and (not frm_principal.x_exibe_troca) then
          AddParam(' AND (VE_TOTA>0)                       ');
        AddParam ('Group by  VE_LOJA,VA_VEDE                                                           ');
        AddParam ('Order by  VE_LOJA,3 DESC                                                            ');
        if (not chTerminal.checked) then
          consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
{                 if (not frm_principal.x_exibir_itens) then
                 begin
                    consulta.ParamByName('VEMIT').AsFloat := KFPGT_VALES_EMI;
                    consulta.ParamByName('VRECEBE').AsFloat := KFPGT_VALES;
                    consulta.ParamByName('VMERC').AsFloat := KFPGT_VALE_MERC;
                 end;       }
        if (not Execute) then
        begin
          esconde_mensagem;
          frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
            'Listagem de vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
        end
        else
        begin
//Marcio------------------------------------
          clAux3 := TClassAuxiliar.Create;
          with (clAux3) do
          begin
            conect   (databaseprodutos, self);
            ClearSql;
            AddParam ('select ve_loja,ve_caix,ve_nota,ve_tota,ve_qtde,ve_tipz,ve_stat,ve_data,                                      ');
            AddParam ('       va_vede,va_comi,                                                                                              ');
            AddParam ('       vf_fpgt,vf_orde,vf_valo                                                                               ');
            AddParam ('from VENDAS                                                                                                  ');
            AddParam ('     INNER JOIN VENDAS_ATENDIMENTO ON (ve_loja=va_loja and ve_caix=va_caix and ve_codi=va_vend)              ');
            AddParam ('     LEFT OUTER JOIN VENDAS_FORMA_PAGAMENTO ON (ve_caix=vf_caix AND ve_loja=vf_loja AND ve_codi=vf_vend)     ');
            AddParam ('Where (VA_VEDE>='+vend1+') AND (VA_VEDE<='+vend2+') AND                                                      ');
            AddParam ('      (VE_LOJA='+floattostr(frm_principal.x_loja)+') AND                                                     ');
            if (not chTerminal.checked) then
              AddParam ('       (VE_CAIX=:terminal) AND                                                                            ');
            AddParam ('          (VE_DATA>='+chr(39)+data1+chr(39)+') AND                                                           ');
            if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
            begin
              AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                                                      ');
              AddParam ('          (VE_FUNC=:func)                                                                               ');
            end
            else
              AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                                                          ');
            if (tipz='1') or (tipz='2') then
              AddParam (' AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                                     ');
            if (rdSituacao.itemindex=0) then
              AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                                      ')
            else
            if (rdSituacao.itemindex=1) then
              AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                                 ');
            AddParam ('Order by  ve_loja,va_vede,vf_fpgt,vf_orde                                                                                    ');
            if (not chTerminal.checked) then
              consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
            if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
              consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
            Execute;
          end;
//Marcio------------------------------------------------
          with (frm_mem_print) do
          begin
                         {configurando o gerador de relatorios}
            PrepareReport;
            frm_principal.x_col_impressao := 132;
            frm_principal.x_comando       := '12c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'LISTAGEM DE VENDAS P/ LOJA/VENDEDOR';

            if (ch1.checked) then
              AddLine ('Vendedores..........: TODOS OS VENDEDORES')
            else
              AddLine ('Vendedores..........: '+vend1+' a '+vend2);
            if (ch2.checked) then
              AddLine ('Data das vendas.....: TODAS AS VENDAS')
            else
              AddLine ('Data das vendas.....: '+edtInicial2.text+' a '+edtFinal2.text);
            AddLine ('Loja................: '+form_nz(frm_principal.x_loja,2)+'/'+
              ProcuraNomeLoja(frm_principal.x_loja,self));
            if (chTerminal.checked) then
              AddLine ('N. terminal.........: TODOS OS TERMINAIS')
            else
              AddLine ('N. terminal.........: '+form_nz(edtTerminal.GetValor,2));
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
            lojaant:=-1;
            vendant:=-1;
            vendant1 := clAux.Result('VA_VEDE');
            indGauge:=0;
            totGauge:=clAux.Reccount;
            clAux.first;
            total_venda_1         := 0.00;
            total_numero_vendas_1 := 0;
            total_qtde_itens_1    := 0;
            totcomi := -1;
            while (not clAux.eof) do
            begin
              if (totcomi = -1) then
              begin
                claux3.First;
                while (not claux3.Eof) do
                begin
                  contcomis := false;
                  if (clAux.Result('VA_VEDE')=claux3.Result('VA_VEDE')) then
                    if (not frm_principal.x_comissao_vales_recebidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES) and (not chconsiderarvale.Checked) then
                      contcomis := true
                    else
                    if (not frm_principal.x_comissao_vales_emitidos) and (clAux3.result('VF_FPGT')=KFPGT_VALES_EMI) and (not chconsiderarvale.Checked) then
                      contcomis := true
                    else
                    if (not frm_principal.x_comissao_vales_mercadoria) and (clAux3.result('VF_FPGT')=KFPGT_VALE_MERC) then
                      contcomis := false
                    else
                    if ((not frm_principal.x_comissao_vales_emitidos) or (not frm_principal.x_comissao_vales_recebidos)) and (not chconsiderarvale.Checked) then
                    begin
                      if (clAux3.result('VF_FPGT')=KFPGT_DINHEIRO) and (claux3.Result('VE_TOTA')<0) then
                        contcomis := true;// else contcomis := false
                    end
                    else
                      contcomis := false{                                if (contcomis) then
                                begin
                                   totalvendaf := totalvendaf + claux3.Result('VF_VALO');
                                   if (not frm_principal.x_exibir_itens) then
                                   begin
                                     QTDE_ITENS := QTDE_ITENS + claux3.Result('ve_qtde');
                                     contvend := contvend + 1;
                                   end;
                                end;     };
                  claux3.Next;
                end;
                totcomi := 1;
              end;
                              {ORDEM: LOJA>>VENDEDOR>>DATA}
              if (lojaant<>clAux.Result('VE_LOJA')) then
              begin
                if (lojaant<>-1) then
                begin
                  if (total_qtde_itens_1>0) and (total_numero_vendas_1>0) then
                    itens_por_venda := total_qtde_itens_1/total_numero_vendas_1
                  else
                    itens_por_venda := 0;
                  if (total_venda_1>0) and (total_numero_vendas_1>0) then
                    venda_media     := total_venda_1/total_numero_vendas_1
                  else
                    venda_media := 0.00;
                  AddLine (form_Tc2('-',80,'-'));
                  AddLine ('      Total da loja..: '+form_nz(lojaant,2)+' '+
                    form_tc2 (' ',9,' ')+' '+
                    form_nc  (total_venda_1,12)+' '+
                    form_n   (total_numero_vendas_1,6)+' '+
                    form_n   (total_qtde_itens_1,6)+' '+
                    form_nc2 (itens_por_venda,6,2)+' '+
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
                AddLine (form_tc2('-',80,'-'));
                AddLine ('Loja..:'+form_nz(lojaant,2)+'-'+ProcuraNomeLoja(lojaant,self));
                AddLine (form_tc2('-',80,'-'));
                AddLine ('      |                             |Total      |Numero|Qtde  |Itens  |Venda   ');
                AddLine ('Cod   |Nome do Vendedor             |Venda     $|Vendas|Itens |P/Venda|Media  $');
                AddLine (form_tc2('-',80,'-'));
              end;
              if (clAux.result('TOTAL_QTDE_ITENS')-QTDE_ITENS>0) and (clAux.result('TOTAL_NUMERO_VENDAS')-contvend>0) then
                itens_por_venda := (clAux.result('TOTAL_QTDE_ITENS')-QTDE_ITENS)/(clAux.result('TOTAL_NUMERO_VENDAS')-contvend)
              else
                itens_por_venda:=0;
              if (clAux.result('TOTAL_VENDA')-totalvendaf>0) and (clAux.result('TOTAL_NUMERO_VENDAS')-contvend>0) then
                venda_media     := (clAux.result('TOTAL_VENDA')-totalvendaf)/(clAux.result('TOTAL_NUMERO_VENDAS')-contvend)
              else
                venda_media := 0.00;

              AddLine (form_nz  (clAux.result('VA_VEDE'),6)+' '+
                form_t   (ProcuraNomeVend(lojaant,clAux.result('VA_VEDE'),self),28)+' '+
                form_nc  ((clAux.result('TOTAL_VENDA')-totalvendaf),12)+' '+
                form_n   ((clAux.result('TOTAL_NUMERO_VENDAS')-contvend),6)+' '+
                form_n   ((clAux.result('TOTAL_QTDE_ITENS')-QTDE_ITENS),6)+' '+
                form_nc2 (itens_por_venda,6,2)+' '+
                form_nc  (venda_media,10));

              total_venda_1         := total_venda_1         + strtofloat(RetiraFormatacaoNumero(trim(form_nc((clAux.Result('TOTAL_VENDA')-totalvendaf),10))));
              total_numero_vendas_1 := total_numero_vendas_1 + (clAux.result('TOTAL_NUMERO_VENDAS')-contvend);
              total_qtde_itens_1 := total_qtde_itens_1 + (clAux.Result('TOTAL_QTDE_ITENS')-QTDE_ITENS);
                              {---->}
              clAux.next;
              if vendant1 <> clAux.Result('VA_VEDE') then
              begin
                vendant1 := clAux.Result('VA_VEDE');
                totalvendaf := 0.00;
                QTDE_ITENS := 0;
                contvend := 0;
                totcomi := -1;
              end;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            if (total_qtde_itens_1>0) and (total_numero_vendas_1>0) then
              itens_por_venda := total_qtde_itens_1/total_numero_vendas_1
            else
              itens_por_venda := 0;
            if (total_venda_1>0) and (total_numero_vendas_1>0) then
              venda_media     := total_venda_1/total_numero_vendas_1
            else
              venda_media := 0.00;
            AddLine (form_Tc2('-',80,'-'));
            AddLine ('      Total da loja..: '+form_nz(lojaant,2)+' '+
              form_tc2 (' ',9,' ')+' '+
              form_nc  (total_venda_1,12)+' '+
              form_n   (total_numero_vendas_1,6)+' '+
              form_n   (total_qtde_itens_1,6)+' '+
              form_nc2 (itens_por_venda,6,2)+' '+
              form_nc  (venda_media,10));

                         {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          claux3.Desconect;
          claux3.Free;
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

procedure Tfrm_ListaVendasAtendimento.edtInicial1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal2Enter(Sender: TObject);
begin
  if (edtFinal2.text='  /  /    ') then
    edtFinal2.text:=edtInicial2.text;
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal1.setfocus;
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtInicial1);
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfereClick(Sender);
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtFinal1);
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtTerminal.setfocus;
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial2Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal2Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data do movimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtInicial1.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
end;

procedure Tfrm_ListaVendasAtendimento.ch1Click(Sender: TObject);
begin
  if (not ch1.checked) then
  begin
    habilitaeditVerde(edtInicial1);
    habilitaeditVerde(edtFinal1);
    edtInicial1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial1);
    desabilitaeditVerde(edtFinal1);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not ch1.checked) then
  begin
    habilitaeditVerde(edtInicial1);
    habilitaeditVerde(edtFinal1);
    edtInicial1.setfocus;
  end
  else
  begin
    desabilitaeditVerde(edtInicial1);
    desabilitaeditVerde(edtFinal1);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.ch2Click(Sender: TObject);
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
    edtInicial1.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.ch2KeyDown(Sender: TObject; var Key: Word;
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
    edtInicial1.setfocus;
  end;
end;

procedure Tfrm_ListaVendasAtendimento.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial2.enabled:=true;
  edtInicial2.setfocus;
  LimparEdits;
end;

procedure Tfrm_ListaVendasAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_ListaVendasAtendimento.LimparEdits;
begin
  edtTerminal.text :='';
  edtInicial1.text :='';
  edtFinal1.text   :='';
  edtInicial2.text :='';
  edtFinal2.text   :='';
  ch1.checked:=false;
  ch2.checked:=false;
  edtTerminal.font.color:=clWhite;
  edtTerminal.text:='';
  edtTerminal.readonly:=true;
  edtTerminal.color:=clTeal;
  chTerminal.checked:=true;
  habilitaeditRelat(edtInicial1);
  habilitaeditRelat(edtFinal1);
  habilitaeditRelat(edtInicial2);
  habilitaeditRelat(edtFinal2);
end;

procedure Tfrm_ListaVendasAtendimento.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  if (not exibiu) then
  begin
    if (edtInicial2.text='  /  /    ') then
      edtInicial2.text:=form_data(frm_principal.x_data_trabalho);
    if (edtFinal2.text='  /  /    ') then
      edtFinal2.text:=form_data(frm_principal.x_data_trabalho);
    ch1.checked:=true;
    exibiu:=true;
  end;

     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtInicial2.setfocus;
end;

procedure Tfrm_ListaVendasAtendimento.FormCreate(Sender: TObject);
begin
  exibiu:=false;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial1DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtInicial1);
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal1DblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtFinal1);
end;

procedure Tfrm_ListaVendasAtendimento.edtInicial1Exit(Sender: TObject);
begin
  if (trim(edtInicial1.text)<>'') then
    edtInicial1.text:=form_nz(strtofloat(trim(edtInicial1.text)),6);
end;

procedure Tfrm_ListaVendasAtendimento.edtFinal1Exit(Sender: TObject);
begin
  if (trim(edtFinal1.text)<>'') then
    edtFinal1.text:=form_nz(strtofloat(trim(edtFinal1.text)),6);
end;

procedure Tfrm_ListaVendasAtendimento.btnConfereClick(Sender: TObject);
begin
  Confirmarttulo1.click;
end;

procedure Tfrm_ListaVendasAtendimento.chTerminalClick(Sender: TObject);
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

procedure Tfrm_ListaVendasAtendimento.chTerminalKeyDown(Sender: TObject;
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

procedure Tfrm_ListaVendasAtendimento.chTerminalExit(Sender: TObject);
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

procedure Tfrm_ListaVendasAtendimento.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ListaVendasAtendimento.edtTerminalKeyDown(Sender: TObject;
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
