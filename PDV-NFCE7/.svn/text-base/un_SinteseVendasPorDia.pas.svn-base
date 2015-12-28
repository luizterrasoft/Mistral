//POR ENQUANTO, ESTA EXIBINDO APENAS INFORMACOES DO 'CAIXA' ATIVO!!!!
unit un_SinteseVendasPorDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, MaskEditOO, LabelOO, Menus, CheckBoxOO;

type
  Tfrm_SinteseVendasPorDia = class(TForm)
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    botaoSair: TPanel;
    Image2: TImage;
    Bevel4: TBevel;
    LabelOO1: TLabelOO;
    edtData1: TMaskEditOO;
    botao1: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmardados1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    lblloja: TLabelOO;
    lblNTerminal: TLabelOO;
    Bevel2: TBevel;
    lbltipz: TLabel;
    LabelOO2: TLabelOO;
    edtData2: TMaskEditOO;
    Label1: TLabel;
    rdSituacao: TRadioGroup;
    edtTerminal: TMaskEditOO;
    chTerminal: TCheckBoxOO;
    chExibirSomenteCaixa: TCheckBox;
    procedure edtData1Enter(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData1Exit(Sender: TObject);
    procedure edtData2Exit(Sender: TObject);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chTerminalClick(Sender: TObject);
    procedure chTerminalExit(Sender: TObject);
    procedure chTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTerminalEnter(Sender: TObject);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    y_tipz: String;
    exibiu: Boolean;
  end;

var
  frm_SinteseVendasPorDia: Tfrm_SinteseVendasPorDia;

implementation

uses unDialogo, principal, auxiliar, funcoes1, funcoes2, procura,
  unMensagem, mem_prnt;

{$R *.DFM}

procedure Tfrm_SinteseVendasPorDia.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SinteseVendasPorDia.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtData2.setfocus;
  if (key=38) then
    edtTerminal.setfocus;
  if (key=27) then
    close;
end;

procedure Tfrm_SinteseVendasPorDia.Limparformulrio1Click(Sender: TObject);
begin
  edtTerminal.text:='';   
  edtData1.text:='';
  edtData2.text:='';
  edtTerminal.font.color:=clWhite;
  edtTerminal.text:='';
  edtTerminal.readonly:=true;
  edtTerminal.color:=clTeal;
  chTerminal.checked:=true;
  edtData1.setfocus;
end;

procedure Tfrm_SinteseVendasPorDia.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SinteseVendasPorDia.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_SinteseVendasPorDia.Confirmardados1Click(Sender: TObject);
var
  clAux,clAux2,clAux3: TClassAuxiliar;
  total_acumulado_dia: Real;
  total_acumulado: Real;
  total_vales_merc: Real;
  data1,data2: String;
  linha: String;
  indGauge,totGauge: Integer;
  ind: Integer;
  total_dinheiro,total_cheque: Real;
  total_debito,total_cartao: Real;
  total_credito,total_desconto: Real;
  total_vales_recebidos: Real;
  total_somado: Real;
begin
  if (not chTerminal.checked) and (edtTerminal.GetValor=0) then
  begin
    frmDialogo.ExibirMensagem ('O número do terminal deve ser informado!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtTerminal.setfocus;
  end
  else
  if (edtData1.GetValor=strtodate('01/01/1900')) then
  begin
    frmDialogo.ExibirMensagem ('A data inicial das vendas deve ser informada!'
      ,'Síntese das vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end
  else
  if (edtData2.GetValor=strtodate('01/01/1900')) then
  begin
    frmDialogo.ExibirMensagem ('A data final das vendas deve ser informada!'
      ,'Síntese das vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData2.setfocus;
  end
  else
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (edtData1.GetValor<StrToDateTime(frm_principal.x_prazo_vendas)) then
  begin
    frmDialogo.ExibirMensagem ('Data informada não permitida!'
      ,'Sumário de vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end
  else
  begin
    data1 := FormataDataVendas(edtData1.GetValor);
    data2 := FormataDataVendas(edtData2.GetValor);
          {*********************************************************************}
    mostra_mensagem ('Preparando listagem...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   (databaseprodutos, self);
      ClearSql;
      AddParam ('Select    DISTINCT VE_DATA                                         ');
      AddParam ('From      VENDAS                                                   ');
      AddParam ('Where     (VE_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
      if (not chTerminal.checked) then
        AddParam ('       (VE_CAIX=:terminal) AND                                  ');
      if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
      begin
        AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND            ');
        AddParam ('          (VE_FUNC=:func)                                     ');
      end
      else
        AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+')                ');
      if (y_tipz='1') or (y_tipz='2') then
        AddParam ('      AND (VE_TIPZ='+chr(39)+y_tipz+chr(39)+')                     ');
      AddParam ('      AND (VE_LOJA=:loja)                                          ');
      if (rdSituacao.itemindex=0) then
        AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                          ')
      else
      if (rdSituacao.itemindex=1) then
        AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                          ');
      AddParam ('Order by  VE_DATA                                                  ');
      consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
      if (not chTerminal.checked) then
        consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
      if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
      if (not Execute) then
      begin
        esconde_mensagem;
        frmDialogo.ExibirMensagem ('Não há movimento nestas condições!',
          'Síntese das vendas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
          250,200);
      end
      else
      begin
                   {*VENDAS***********************************************************}
        clAux2 := TClassAuxiliar.Create;
        clAux2.conect(databaseprodutos,self);
        clAux2.ClearSql;
        clAux2.AddParam ('Select    VE_DATA,VF_FPGT,VF_VALO                                  ');
        clAux2.AddParam ('From      VENDAS,VENDAS_FORMA_PAGAMENTO                            ');
        clAux2.AddParam ('Where     (VE_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
        clAux2.AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                 ');
        if (not chTerminal.checked) then
          clAux2.AddParam ('      (VE_CAIX=:terminal) AND                                  ');
        clAux2.AddParam ('          (VE_CAIX=VF_CAIX) AND                                    ');
        clAux2.AddParam ('          (VE_LOJA=VF_LOJA) AND                                    ');
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
        begin
          clAux2.AddParam ('          (VE_CODI=VF_VEND) AND                               ');
          clAux2.AddParam ('          (VE_FUNC=:func)                                     ');
        end
        else
          clAux2.AddParam ('          (VE_CODI=VF_VEND)                                   ');
        if (y_tipz='1') or (y_tipz='2') then
          clAux2.AddParam ('      AND (VE_TIPZ='+chr(39)+y_tipz+chr(39)+')                     ');
        clAux2.AddParam ('      AND (VE_LOJA=:loja)                                          ');
        if (rdSituacao.itemindex=0) then
          clAux2.AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                          ')
        else
        if (rdSituacao.itemindex=1) then
          clAux2.AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                          ');
        clAux2.AddParam ('Order by  1,2                                                      ');
        clAux2.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
        if (not chTerminal.checked) then
          clAux2.consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
        if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          clAux2.consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
        if (clAux2.Execute) then
        begin
                       {*DESCONTOS********************************************************}
          clAux3 := TClassAuxiliar.Create;
          clAux3.conect(databaseprodutos,self);
          clAux3.ClearSql;
          clAux3.AddParam ('Select    VE_DATA,VE_DESC                                          ');
          clAux3.AddParam ('From      VENDAS                                                   ');
          clAux3.AddParam ('Where     (VE_DATA>='+chr(39)+data1+chr(39)+') AND                 ');
          clAux3.AddParam ('          (VE_DATA<='+chr(39)+data2+chr(39)+') AND                 ');
          if (not chTerminal.checked) then
            clAux3.AddParam ('       (VE_CAIX=:terminal) AND                                  ');
          clAux3.AddParam ('          (VE_LOJA=:loja) AND                                      ');
          if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
          begin
            clAux3.AddParam ('          (VE_DESC<>0) AND                                    ');
            clAux3.AddParam ('          (VE_FUNC=:func)                                     ');
          end
          else
            clAux3.AddParam ('          (VE_DESC<>0)                                        ');
          if (y_tipz='1') or (y_tipz='2') then
            clAux3.AddParam ('      AND (VE_TIPZ='+chr(39)+y_tipz+chr(39)+')                     ');
          if (rdSituacao.itemindex=0) then
            clAux3.AddParam (' AND (VE_STAT='+chr(39)+'1'+chr(39)+')                          ')
          else
          if (rdSituacao.itemindex=1) then
            clAux3.AddParam (' AND (VE_STAT='+chr(39)+'2'+chr(39)+')                          ');
          clAux3.AddParam ('Order by  1,2                                                      ');
          clAux3.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
          if (not chTerminal.checked) then
            clAux3.consulta.parambyname('terminal').AsFloat := edtTerminal.GetValor;
          if (frm_principal.x_caixa_ativo<>0) and (chExibirSomenteCaixa.checked) then
            clAux3.consulta.parambyname('func').AsFloat := frm_principal.x_caixa_ativo;
          clAux3.Execute;

          with (frm_mem_print) do
          begin
                           {configurando o gerador de relatorios}
            PrepareReport;
            frm_principal.x_col_impressao := 132;
            frm_principal.x_comando       := '15c';
            frm_principal.x_arq_impressao := 'g08.rel';
            frm_principal.x_tam_fonte     := 8;
            Title:= 'SINTESE DAS VENDAS POR PERIODO';

            AddLine ('Periodo de vendas...: '+edtData1.text+' a '+edtData2.text);
            if (not chTerminal.checked) then
              AddLine ('N. terminal.........: '+form_nz(edtTerminal.GetValor,2))
            else
              AddLine ('N. terminal.........: TODOS OS TERMINAIS');
            if (y_tipz<>'1') then
              AddLine ('Modelo..: Sr'+y_tipz);
            AddLine(form_Tc2('-',132,'-'));
            AddLine('Data da   |Total        |Total       |Total       |Total       |Total       |Total       |Total        |Total       |Total');
            AddLine('Venda     |Dinheiro   $ |Cheque    $ |Deb/Autom.$ |Cartao    $ |Crediario $ |Vales Receb.|Vales Merc.$ |Acumulado $ |Desconto $');
            AddLine(form_Tc2('-',132,'-'));

            clAux.first; {*}
            total_acumulado       := 0.00;
            total_dinheiro        := 0.00;
            total_cheque          := 0.00;
            total_debito          := 0.00;
            total_cartao          := 0.00;
            total_credito         := 0.00;
            total_vales_recebidos := 0.00;
            total_vales_merc      := 0.00;
            total_desconto        := 0.00;
            indGauge:=0;
            totGauge:=clAux.reccount;
            while (not clAux.eof) do
            begin
              total_acumulado_dia := 0.00;
              linha := form_data(result('VE_DATA'))+' ';
              ind:=1;
              while (ind<=8) do //ATE VALES RECEBIDOS
              begin
                if (ind=7) then 
                else
                begin
                  clAux2.filter('(VE_DATA='+chr(39)+form_data(result('VE_DATA'))+chr(39)+') AND '+ //data da venda
                    '(VF_FPGT='+inttostr(ind)+') ');//forma de pgto
                  clAux2.first;
                  if (clAux2.reccount<>0) then
                  begin
                                              {******************************************************************}
                    total_somado := 0.00;
                    while (not clAux2.eof) do
                    begin
                      total_somado := total_somado + clAux2.result('VF_VALO');
                      clAux2.next;
                    end;
                                              {******************************************************************}
                    linha := linha + form_nc(total_somado,13);
                    total_acumulado     := total_acumulado     + total_somado;
                    total_acumulado_dia := total_acumulado_dia + total_somado;
                                              {******************************************************************}
                    if (ind=KFPGT_DINHEIRO) then
                      total_dinheiro  := total_dinheiro + total_somado
                    else
                    if (ind=KFPGT_CHEQUE) then
                      total_cheque := total_cheque + total_somado
                    else
                    if (ind=KFPGT_DEBITO) then
                      total_debito := total_debito + total_somado
                    else
                    if (ind=KFPGT_CARTAO) then
                      total_cartao := total_cartao + total_somado
                    else
                    if (ind=KFPGT_CREDITO) then
                      total_credito := total_credito + total_somado
                    else
                    if (ind=KFPGT_VALES) then
                      total_vales_recebidos := total_vales_recebidos + total_somado
                    else
                    if (ind=KFPGT_VALE_MERC) then
                      total_vales_merc  := total_vales_merc + total_somado;
                                              {******************************************************************}
                  end
                  else
                    linha := linha + form_nc(0.00,13);
                end;
                ind:=ind+1;
              end;
              linha := linha + form_nc(total_acumulado_dia,13);
                                {******************************************************************}

                                //...
              clAux3.filter('(VE_DATA='+chr(39)+form_data(result('VE_DATA'))+chr(39)+') '); //data da venda
              clAux3.first;
              if (clAux3.reccount<>0) then
              begin
                                     {******************************************************************}
                total_somado := 0.00;
                while (not clAux3.eof) do
                begin
                  total_somado := total_somado + clAux3.result('VE_DESC');
                  clAux3.next;
                end;
                linha := linha + form_nc(total_somado,12);
                total_desconto := total_desconto + total_somado;
                                     {******************************************************************}
              end
              else
                linha := linha + form_nc(0.00,12);
              AddLine(linha);

                                {--->}
              clAux.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            AddLine(form_Tc2('-',132,'-'));
            AddLine('  Total acumulado: '+form_nc(total_acumulado,18));
            AddLine(form_Tc2('-',132,'-'));
            AddLine('  1. DINHEIRO....: '+form_nc(total_dinheiro,18));
            AddLine('  2. CHEQUE......: '+form_nc(total_cheque,18));
            AddLine('  3. DEBITO......: '+form_nc(total_debito,18));
            AddLine('  4. CARTAO......: '+form_nc(total_cartao,18));
            AddLine('  5. CREDITO.....: '+form_nc(total_credito,18));
            AddLine('  6. VALES RECEB.: '+form_nc(total_vales_recebidos,18));
            AddLine('  7. VALES MERC..: '+form_nc(total_vales_merc,18));
            AddLine('  -  DESCONTOS...: '+form_nc(total_desconto,18));
            AddLine(form_Tc2('-',132,'-'));

                           {salto de pagina}
            if (frm_principal.x_salto) then
              AddLine(chr(18)+chr(12))
            else
              AddLine(chr(18));
          end;
          clAux3.desconect;
          clAux3.Free;
          frm_mem_print.windowstate:=wsMaximized;
          esconde_mensagem;
          if (frm_principal.x_empresa = 'GIZA CALÇADOS') then
            frm_mem_print.bloqueiaImpressaoGiza := true;
          frm_mem_print.showmodal;
        end;
        clAux2.desconect;
        clAux2.Free;
      end;
      desconect;
      Free;
    end;
  end;
end;

procedure Tfrm_SinteseVendasPorDia.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_SinteseVendasPorDia.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  if (not exibiu) then
  begin
    if (edtData1.text='  /  /    ') then
      edtData1.text:=form_data(frm_principal.x_data_trabalho);
    if (edtData2.text='  /  /    ') then
      edtData2.text:=form_data(frm_principal.x_data_trabalho);
    exibiu:=true;
  end;

     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtData1.setfocus;
end;

procedure Tfrm_SinteseVendasPorDia.FormCreate(Sender: TObject);
begin
  lblLoja.caption  := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+
    form_t(ProcuraNomeLoja(frm_principal.x_loja,self),10);
  lblNTerminal.caption := ' Nº do terminal de venda: '+form_nz(frm_principal.x_terminal,2);
  y_tipz:='1';
  lbltipz.caption:='Sr.'+y_tipz;
  lbltipz.visible:=false;
  exibiu:=false;
end;

procedure Tfrm_SinteseVendasPorDia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (y_tipz='1') then
      begin
        y_tipz:='2';
        lbltipz.visible:=true;
      end
      else
      if (y_tipz='2') then
      begin
        y_tipz:='3';
        lbltipz.visible:=true;
      end
      else
      if (y_tipz='3') then
      begin
        y_tipz:='1';
        lbltipz.visible:=false;
      end;
      lbltipz.caption:='Sr.'+y_tipz;
    end
end;

procedure Tfrm_SinteseVendasPorDia.edtData1Exit(Sender: TObject);
begin
  if (not IsDate (edtData1.text) and (edtData1.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data das vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end;
end;

procedure Tfrm_SinteseVendasPorDia.edtData2Exit(Sender: TObject);
begin
  if (not IsDate (edtData2.text) and (edtData2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data das vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData2.setfocus;
  end;
end;

procedure Tfrm_SinteseVendasPorDia.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SinteseVendasPorDia.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    botao1Click(Sender);
  if (key=38) then
    edtData1.setfocus;
  if (key=27) then
    close;
end;

procedure Tfrm_SinteseVendasPorDia.chTerminalClick(Sender: TObject);
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

procedure Tfrm_SinteseVendasPorDia.chTerminalExit(Sender: TObject);
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

procedure Tfrm_SinteseVendasPorDia.chTerminalKeyDown(Sender: TObject;
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

procedure Tfrm_SinteseVendasPorDia.edtTerminalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_SinteseVendasPorDia.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData1.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_ESC) then
    close;
end;

end.
