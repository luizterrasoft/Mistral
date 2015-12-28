
unit un_ConfirmaAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario2, ExtCtrls, Menus, BotaoSair, StdCtrls, Mask,
  MaskEditOO, LabelOO,StrUtils;

type
  Tfrm_ConfirmaAtendimento = class(Tfrm_Auxformulario2)
    Bevel3: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    Image2: TImage;
    super_painel: TPanel;
    painel_1: TPanel;
    LabelOO2: TLabelOO;
    pnSubTotal: TPanel;
    painel_2: TPanel;
    LabelDesconto: TLabelOO;
    LabelValorDesconto: TLabelOO;
    edtDesconto: TMaskEditOO;
    edtValorDesconto: TMaskEditOO;
    painel_3: TPanel;
    LabelOO4: TLabelOO;
    Label1: TLabel;
    pnTotal: TPanel;
    painel_final: TPanel;
    botao2: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    edtNome: TMaskEditOO;
    LabelOO1: TLabelOO;
    BotaoSair2: TBotaoSair;
    edtprazo: TMaskEditOO;
    LabelOO3: TLabelOO;
    LabelOO5: TLabelOO;
    edtpagamento: TMaskEditOO;
    LabelOO6: TLabelOO;
    LabelOO7: TLabelOO;
    LabelOO8: TLabelOO;
    Memo1: TMemo;
    cbFrete: TComboBox;
    edtContato: TMaskEditOO;
    LabelOO9: TLabelOO;
    edtValidade: TMaskEditOO;
    procedure edtNomeDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDescontoEnter(Sender: TObject);
    procedure edtDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BotaoSair2Click(Sender: TObject);
    procedure edtprazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtpagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtvalidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFreteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContatoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure RelatorioJatoTinta(ind:Byte);
  public
    { Public declarations }
    exibiu: Boolean;
    y_subtotal: Real;
    tecla: Integer;
    codigoCli,CodigoContato :Double;
    procedure CalculaTotalAtendimento;
    function ExibeLabelDesconto(tag: Integer):String;
  end;

var
  frm_ConfirmaAtendimento: Tfrm_ConfirmaAtendimento;

implementation

uses f8Clientes, principal, unMensagem, auxiliar, venda, funcoes1,funcoes2,
  mem_prnt, procura, unDialogo, un_senhaSupervisor, un_LancaAtendimento,
  un_RelOrcamento, f8planos, un_abresessao, Uf8Comprador;

{$R *.DFM}

procedure Tfrm_ConfirmaAtendimento.edtNomeDblClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (databasecredito='CREDITO') then
    with (frm_f8Clientes) do
    begin
      edit:=edtNome;
      showmodal;
      if (trim(edtNome.text)<>'') then
      begin
                  //*******************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databasecredito,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT CL_NOME FROM CRECLI WHERE (CL_CODI=:codigo) ');
        clAux.consulta.parambyname('codigo').AsFloat := strtofloat(trim(edtNome.text));
        codigoCli := strtofloat(trim(edtNome.text));
        if (clAux.Execute) then
          edtNome.text := clAux.result('CL_NOME')
        else
          edtNome.text := '';
        clAux.desconect;
        clAux.Free;
                  //*******************************************
      end
      else
        edtNome.text := '';
    end;
end;

procedure Tfrm_ConfirmaAtendimento.FormActivate(Sender: TObject);
begin
  inherited;
  if (not exibiu) then
  begin
    pnSubtotal.caption:=trim(form_nc(y_subtotal,15));
    pnTotal.caption:=trim(form_nc(y_subtotal,15));
    LabelDesconto.tag   := 2; //inicia com desconto percentual
    painel_3.visible    := false;
    painel_2.visible    := false;
    LabelOO2.caption := '1. Total                             $';
    if (y_subtotal<=0.00) then
    begin
      edtDesconto.text := '0,00';
      edtDesconto.readonly := true;
    end
    else
      edtDesconto.readonly := false;
    exibiu:=true;
  end;
  if (painel_2.visible) then
    edtDesconto.setfocus
  else
    edtNome.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.edtNomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    if not frm_principal.x_Orcamento_Atendimento then
      botao2Click(Sender)
    else
      edtContato.SetFocus;
  if (key=K_CIMA) then
    edtDesconto.setfocus;
  if (key=K_F8) then
    edtNomeDblClick(Sender);
end;

procedure Tfrm_ConfirmaAtendimento.botao2Click(Sender: TObject);
var
  clAux,clConf,clProd: TClassAuxiliar;
  clAtdoLocal,clAtdo: TClassAuxiliar;
  clItensLocal,clItens: TClassAuxiliar;
  ix,indGauge,totGauge: Integer;
  total_qtde,total_vendas: Real;
  referencia,descricao: String;
  flagZerar,continua: Boolean;
  testdata :TDateTime;
begin
  continua := true; {*}

  //CRITICAS EM CIMA DO 'VALOR DE DESCONTO'
  if ((y_subtotal - edtValorDesconto.GetValor)<0.00) and
    (y_subtotal>0.00) and
    (continua) then
  begin
    frmDialogo.ExibirMensagem ('Valor de desconto não permitido!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesconto.text := '';
    edtDesconto.setfocus;
    continua := false;
  end;
  if (edtValorDesconto.GetValor<>0.00) and
    (y_subtotal<=0.00) and
    (continua) then
  begin
    frmDialogo.ExibirMensagem ('Valor de desconto não permitido!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDesconto.text := '';
    edtDesconto.setfocus;
    continua := false;
  end;
  if (Pos(';',trim(edtNome.text))>0) and
    (continua) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o nome do cliente!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.setfocus;
    continua := false;
  end;
  try
    testdata := edtValidade.GetValor;
    if (testdata < date) then
    begin
      frmDialogo.ExibirMensagem ('Data anterior a data do sistema ' ,'Atendimento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
    end;
  except
    begin
      frmDialogo.ExibirMensagem ('         Data Inválida!' ,'Atendimento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
    end;
  end;

     {...}
      if (continua) then
      begin
              //....
        if (y_subtotal<0.00) then //DEU UM VALOR NEGATIVO, 'troca em excesso'
        begin
          if (frmDialogo.ExibirMensagem ('Troca em excesso! Deseja ZERAR o     Atendimento?'
            ,'Atendimentos',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            flagZerar:=true
          else
            flagZerar:=false;
        end
        else
          flagZerar:=false;

        //****************************************************
        clAtdoLocal := TClassAuxiliar.Create;
        clAtdoLocal.conect   ('VENDAS',self);
        clAtdoLocal.ClearSql;
        clAtdoLocal.AddParam ('SELECT * FROM ATDO_LOCAL         ');
        clAtdoLocal.AddParam ('WHERE (AT_LOJA=:loja) AND        ');
        clAtdoLocal.AddParam ('      (AT_CAIX=:terminal) AND    ');
        clAtdoLocal.AddParam ('      (AT_CODI=:atendimento)     ');
        clAtdoLocal.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
        clAtdoLocal.consulta.parambyname('terminal').AsFloat    := frm_principal.x_terminal;
        clAtdoLocal.consulta.parambyname('atendimento').AsFloat := frm_principal.x_atendimento;
        if (clAtdoLocal.Execute) then
        begin
          mostra_mensagem ('Confirmando Atendimento...');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;

          {CASO O ATENDIMENTO SEJA UM SUSPENSO ********************************************************}
          if (frm_LancaAtendimento.y_terminal_atendimento_suspenso<>-1) and
            (frm_LancaAtendimento.y_codigo_atendimento_suspenso<>-1) then
          begin
            //... EXCLUINDO O ATENDIMENTO ORIGINALMENTE 'Suspenso'
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('VENDAS',self);
            clAux.ClearSql;
            clAux.AddParam ('DELETE FROM ATENDIMENTOS_SUSP        ');
            clAux.AddParam ('WHERE (AT_LOJA=:loja) AND            ');
            clAux.AddParam ('      (AT_CAIX=:terminal) AND        ');
            clAux.AddParam ('      (AT_CODI=:numero)              ');
            clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
            clAux.consulta.parambyname('terminal').AsFloat := frm_LancaAtendimento.y_terminal_atendimento_suspenso;
            clAux.consulta.parambyname('numero').AsFloat   := frm_LancaAtendimento.y_codigo_atendimento_suspenso;
            clAux.Execute; {*}
            clAux.ClearSql;
            clAux.AddParam ('DELETE FROM ITENS_ATENDIMENTOS_SUSP  ');
            clAux.AddParam ('WHERE (IA_LOJA=:loja) AND            ');
            clAux.AddParam ('      (IA_CAIX=:terminal) AND        ');
            clAux.AddParam ('      (IA_VEND=:numero)              ');
            clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
            clAux.consulta.parambyname('terminal').AsFloat := frm_LancaAtendimento.y_terminal_atendimento_suspenso;
            clAux.consulta.parambyname('numero').AsFloat   := frm_LancaAtendimento.y_codigo_atendimento_suspenso;
            clAux.Execute; {*}
            clAux.desconect;
            clAux.Free;

            //....
            frm_LancaAtendimento.y_terminal_atendimento_suspenso := -1;
            frm_LancaAtendimento.y_codigo_atendimento_suspenso   := -1;
          end;

          //****************************************************
          frm_principal.x_codigo_atendimento := frm_principal.x_codigo_atendimento + 1;

          //gravando o atendimento
          //****************************************************
          clAtdo := TClassAuxiliar.Create;
          clAtdo.conect   (databaseprodutos,self);
          clAtdo.ClearSql;
          clAtdo.AddParam ('INSERT INTO ATENDIMENTOS(AT_CAIX,AT_LOJA,AT_CODI,AT_FUNC,AT_DATA,AT_OPER,AT_TOTA,AT_QTDE,AT_QTD1,AT_QTD2,AT_VEND,AT_NOME,AT_ONLI,AT_ENVI,AT_STAT,AT_DESC) ');
          clAtdo.AddParam ('VALUES (:AT_CAIX,:AT_LOJA,:AT_CODI,:AT_FUNC,:AT_DATA,:AT_OPER,:AT_TOTA,:AT_QTDE,:AT_QTD1,:AT_QTD2,:AT_VEND,:AT_NOME,:AT_ONLI,:AT_ENVI,:AT_STAT,:AT_DESC)  ');
          clAtdo.consulta.parambyname('AT_LOJA').AsFloat    := frm_principal.x_loja;
          clAtdo.consulta.parambyname('AT_CAIX').AsFloat    := frm_principal.x_terminal;
          clAtdo.consulta.parambyname('AT_CODI').AsFloat    := frm_principal.x_codigo_atendimento; {*}
          clAtdo.consulta.parambyname('AT_FUNC').AsFloat    := clAtdoLocal.result('AT_FUNC');
          clAtdo.consulta.parambyname('AT_OPER').AsFloat    := clAtdoLocal.result('AT_OPER');
          clAtdo.consulta.parambyname('AT_DATA').AsDateTime := clAtdoLocal.result('AT_DATA');
          clAtdo.consulta.parambyname('AT_OPER').AsFloat    := clAtdoLocal.result('AT_TOTA');
          if (y_subtotal<0.00) then
          begin
            if (flagZerar) then
            begin
              clAtdo.consulta.parambyname('AT_TOTA').AsFloat := 0.00; //ZERANDO O ATENDIMENTO, caso solicitado
              GravaExcessoTrocasAtendimentos (frm_principal.x_loja,
                frm_principal.x_terminal,
                frm_principal.x_codigo_atendimento,
                clAtdoLocal.result('AT_TOTA'));
            end
            else
              clAtdo.consulta.parambyname('AT_TOTA').AsFloat := clAtdoLocal.result('AT_TOTA');
            clAtdo.consulta.parambyname('AT_DESC').AsFloat := 0.00;
          end
          else
          begin
            clAtdo.consulta.parambyname('AT_TOTA').AsFloat    := clAtdoLocal.result('AT_TOTA');
            if (LabelDesconto.tag=0) then
              clAtdo.consulta.parambyname('AT_DESC').AsFloat := (-1)*edtValorDesconto.GetValor
            else
            if (LabelDesconto.tag=1) then
              clAtdo.consulta.parambyname('AT_DESC').AsFloat := edtDesconto.GetValor
            else
            if (LabelDesconto.tag=2) then
              clAtdo.consulta.parambyname('AT_DESC').AsFloat := 0.00;
          end;
          clAtdo.consulta.parambyname('AT_QTDE').AsFloat    := clAtdoLocal.result('AT_QTDE');
          clAtdo.consulta.parambyname('AT_QTD1').AsFloat    := clAtdoLocal.result('AT_QTD1');
          clAtdo.consulta.parambyname('AT_QTD2').AsFloat    := clAtdoLocal.result('AT_QTD2');
          clAtdo.consulta.parambyname('AT_STAT').AsString   := '0';
          clAtdo.consulta.parambyname('AT_VEND').AsFloat    := clAtdoLocal.result('AT_VEND');
          if (edtNome.GetValor='') then
            clAtdo.consulta.parambyname('AT_NOME').AsString   := ' [NAO INFORMADO]'
          else
            clAtdo.consulta.parambyname('AT_NOME').AsString   := edtNome.GetValor;
          if (frm_principal.x_online) then
          begin
            clAtdo.consulta.parambyname('AT_ONLI').AsString := '1';
            clAtdo.consulta.parambyname('AT_ENVI').AsString := '1';
          end
          else
          begin
            clAtdo.consulta.parambyname('AT_ONLI').AsString := '0';
            clAtdo.consulta.parambyname('AT_ENVI').AsString := '0';
          end;
          clAtdo.Execute;
          clAtdo.desconect;
          clAtdo.Free;

          clAtdoLocal.desconect;
          clAtdoLocal.Free;
          //****************************************************

          //****************************************************
          clItensLocal := TClassAuxiliar.Create;
          clItensLocal.conect   ('VENDAS',self);
          clItensLocal.ClearSql;
          clItensLocal.AddParam ('SELECT * FROM ITENS_ATDO_LOCAL    ');
          clItensLocal.AddParam ('WHERE (IA_LOJA=:loja) AND         ');
          clItensLocal.AddParam ('      (IA_CAIX=:terminal) AND     ');
          clItensLocal.AddParam ('      (IA_VEND=:atendimento)      ');
          clItensLocal.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
          clItensLocal.consulta.parambyname('terminal').AsFloat    := frm_principal.x_terminal;
          clItensLocal.consulta.parambyname('atendimento').AsFloat := frm_principal.x_atendimento;
          clItensLocal.Execute; {*}
          clItensLocal.first;
          indGauge:=0;
          totGauge:=clItensLocal.reccount;
          while (not clItensLocal.eof) do
          begin
            //****************************************************
            clItens := TClassAuxiliar.Create;
            clItens.conect   (databaseprodutos,self);
            clItens.ClearSql;
            clItens.AddParam ('INSERT INTO ITENS_ATENDIMENTOS(IA_LOJA,IA_CAIX,IA_VEND,IA_GRUP,IA_SUBG,IA_PROD,IA_TAMA,IA_CORE,IA_QTDE,IA_TOTA,IA_PVEN,IA_OTAM,IA_MODO,IA_SEQ) ');
            clItens.AddParam ('VALUES (:IA_LOJA,:IA_CAIX,:IA_VEND,:IA_GRUP,:IA_SUBG,:IA_PROD,:IA_TAMA,:IA_CORE,:IA_QTDE,:IA_TOTA,:IA_PVEN,:IA_OTAM,:IA_MODO,:IA_SEQ)        ');
            clItens.consulta.parambyname('IA_LOJA').AsFloat   := frm_principal.x_loja;
            clItens.consulta.parambyname('IA_CAIX').AsFloat   := frm_principal.x_terminal;
            clItens.consulta.parambyname('IA_VEND').AsFloat   := frm_principal.x_codigo_atendimento; {*}
            clItens.consulta.parambyname('IA_GRUP').AsFloat   := clItensLocal.Result('IA_GRUP');
            clItens.consulta.parambyname('IA_SUBG').AsFloat   := clItensLocal.Result('IA_SUBG');
            clItens.consulta.parambyname('IA_PROD').AsFloat   := clItensLocal.Result('IA_PROD');
            clItens.consulta.parambyname('IA_TAMA').AsString  := clItensLocal.Result('IA_TAMA');
            clItens.consulta.parambyname('IA_CORE').AsFloat   := clItensLocal.Result('IA_CORE');
            clItens.consulta.parambyname('IA_QTDE').AsFloat   := clItensLocal.Result('IA_QTDE');
            clItens.consulta.parambyname('IA_TOTA').AsFloat   := clItensLocal.Result('IA_TOTA');
            clItens.consulta.parambyname('IA_PVEN').AsFloat   := clItensLocal.Result('IA_PVEN');
            clItens.consulta.parambyname('IA_OTAM').AsInteger := clItensLocal.Result('IA_OTAM');
            clItens.consulta.parambyname('IA_MODO').AsString  := clItensLocal.Result('IA_MODO');
            clItens.consulta.parambyname('IA_SEQ').AsInteger  := clItensLocal.Result('IA_SEQ');
            clItens.Execute; {*}
            clItens.desconect;
            clItens.Free;

            {----->}
            clItensLocal.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          clItensLocal.desconect;
          clItensLocal.Free;

          //****************************************************
          esconde_mensagem;
          frm_ConfirmaAtendimento.Hide;

          //****************************************************
          ExclueAtendimentoLocal; {*}
          if (frm_principal.x_Orcamento_Atendimento) then
          begin
            continua:=false;
            if (frmDialogo.ExibirMensagem ('Deseja gerar o Relatório de Orçamento?' ,'Atendimentos',[mbYes,mbNo]
               ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              RelatorioJatoTinta(0)
            else
              RelatorioJatoTinta(1);
          end
//          else if (frm_principal.x_slip_na_tela_ATENDIMENTO) then
//            continua:=true
          else
          if (frmDialogo.ExibirMensagem ('Deseja imprimir SLIP de atendimento?'
            ,'Atendimentos',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            continua:=true
          else
            continua:=false;
          if (continua) then
            ImprimeSlipAtendimento (frm_principal.x_loja,
              frm_principal.x_terminal,
              frm_principal.x_codigo_atendimento); {*}

          //****************************************************
          clConf := TClassAuxiliar.Create;
          clConf.conect   ('C:\NATIVA',self);
          clConf.ClearSql;
          clConf.AddParam ('UPDATE SEQATDO.DBF SET ULTIMO_ATDO=:ultimo_atdo ');
          clConf.consulta.parambyname('ultimo_atdo').AsFloat := frm_principal.x_codigo_atendimento;
          clConf.Execute;
          clConf.desconect;
          clConf.Free;

          {*************************************************************}
          tecla:=13;
          close;
      end;
  end;
end;

procedure Tfrm_ConfirmaAtendimento.N1Click(Sender: TObject);
begin
  botao2Click(botao2);
end;

procedure Tfrm_ConfirmaAtendimento.Limparformulrio1Click(Sender: TObject);
begin
  edtDesconto.text := '';
  edtNome.text     := '';
  edtNome.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
  exibiu:=false;
  tecla:=27;
  if frm_principal.x_Orcamento_Atendimento then
  begin
    edtValidade.text     := AnsiReplaceStr(DateToStr(date),'/','');
    edtprazo.Visible     := true;
    edtpagamento.Visible := true;
    edtContato.Visible   := true;
    cbFrete.Visible      := true;
    edtvalidade.Visible  := true;
    Memo1.Visible        := true;
    LabelOO3.Visible     := true;
    LabelOO5.Visible     := true;
    LabelOO6.Visible     := true;
    LabelOO7.Visible     := true;
    LabelOO8.Visible     := true;
    frm_ConfirmaAtendimento.Height := 415;
  end
  else
  begin
    edtprazo.Visible     := false;
    edtpagamento.Visible := false;
    cbFrete.Visible      := false;
    edtContato.Visible   := false;    
    edtvalidade.Visible  := false;
    Memo1.Visible        := false;
    LabelOO3.Visible     := false;
    LabelOO5.Visible     := false;
    LabelOO6.Visible     := false;
    LabelOO7.Visible     := false;
    LabelOO8.Visible     := false;
    Label6.Left := 25;
    Label6.Top  := 73;
    Label7.Left := 25;
    Label7.Top  := 56;
    Label8.Left := 25;
    Label8.Top  := 89;
    Label9.Left := 397;
    Label9.Top  := 99;
    botao2.Left := 117;
    botao2.Top  := 121;
    BotaoSair2.Left := 389;
    BotaoSair2.Top  := 120;
    frm_ConfirmaAtendimento.Height := 246;
  end;
end;

procedure Tfrm_ConfirmaAtendimento.edtDescontoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_ConfirmaAtendimento.edtDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNome.setfocus;
  if (key=K_CIMA) then
    edtNome.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.edtDescontoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConfirmaAtendimento.edtDescontoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
  if (shift=[ssCtrl]) then
    if (key=Ord('D')) or (key=Ord('d')) then
      edtNome.text := '';
end;

procedure Tfrm_ConfirmaAtendimento.edtDescontoChange(Sender: TObject);
begin
  CalculaTotalAtendimento;
end;

procedure Tfrm_ConfirmaAtendimento.CalculaTotalAtendimento;
var
  valor_desconto: Real;
begin
  if (LabelDesconto.tag=0) then //desconto em VALOR
  begin
    if (y_subtotal>0.00) then
      if ((y_subtotal - edtDesconto.GetValor)>=0.00) then
        pnTotal.caption := trim(form_nc(y_subtotal - edtDesconto.GetValor,15))
      else
        pnTotal.caption := '0,00';
    edtValorDesconto.text := edtDesconto.text;
  end
  else
  if (LabelDesconto.tag=1) then //desconto em PERCENTUAL
  begin
    if (y_subtotal>0.00) then
    begin
      valor_desconto := ((edtDesconto.GetValor/100)*y_subtotal);
      if ((y_subtotal - valor_desconto)>=0.00) then
        pnTotal.caption := trim(form_nc(y_subtotal - valor_desconto,15))
      else
        pnTotal.caption := '0,00';
    end
    else
      valor_desconto := 0.00;
    edtValorDesconto.text := trim(form_nc(valor_desconto,15));
    LabelValorDesconto.caption := ' - Valor: '+trim(form_nc(valor_desconto,15));
  end;
end;

function Tfrm_ConfirmaAtendimento.ExibeLabelDesconto(tag: Integer):String;
begin
  if (tag=0) then
    result := '2. Desconto  (em valor)    $'
  else
  if (tag=1) then
    result := '2. Desconto  (percentual)  %';
end;

procedure Tfrm_ConfirmaAtendimento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  continua: Boolean;
begin
  inherited;
  if (shift=[ssCtrl]) then
    if (key=Ord('D')) or (key=Ord('d')) then
      if (LabelDesconto.tag=0) then
      begin
        painel_2.visible    := true;
        painel_3.visible    := true;
        LabelOO2.caption    := '1. Subtotal                       $';
        LabelDesconto.tag   := 1;
        frm_ConfirmaAtendimento.height := 346;
        LabelValorDesconto.caption := ' - Valor: 0,00';
        LabelValorDesconto.visible := true;
        LabelDesconto.caption := ExibeLabelDesconto(LabelDesconto.tag);
        edtDesconto.text      := '';
        edtDesconto.setfocus;
      end
      else
      if (LabelDesconto.tag=1) then
      begin
        painel_3.visible    := false;
        painel_2.visible    := false;
        LabelOO2.caption    := '1. Total                             $';
        LabelDesconto.tag   := 2;
        frm_ConfirmaAtendimento.height := 246;
        LabelValorDesconto.visible := false;
        edtDesconto.text    := '';
        edtNome.setfocus;
      end
      else
      if (LabelDesconto.tag=2) then
      begin
        if (frm_principal.x_solicitar_senha_DESCONTO_Atdo) then
        begin
          frm_senhaSupervisor.showmodal;
          if (frm_senhaSupervisor.y_flag) then
            continua := true;
        end
        else
          continua := true;
        if (continua) then
        begin
          painel_2.visible    := true;
          painel_3.visible    := true;
          LabelOO2.caption    := '1. Subtotal                       $';
          LabelDesconto.tag   := 0;
          if frm_principal.x_Orcamento_Atendimento then
            frm_ConfirmaAtendimento.height := 510
          else
            frm_ConfirmaAtendimento.height := 346;
          LabelValorDesconto.visible := false;
          LabelDesconto.caption := ExibeLabelDesconto(LabelDesconto.tag);
          edtNome.text        := '';
          edtDesconto.text    := '';
          edtDesconto.setfocus;
        end;
      end;
end;

procedure Tfrm_ConfirmaAtendimento.BotaoSair2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConfirmaAtendimento.RelatorioJatoTinta(ind:byte);
begin
  Application.CreateForm(Tfrm_RelOrcamento,frm_RelOrcamento);
  if (ind = 0) then
    frm_RelOrcamento.QuickRep1.Preview
  else
    frm_RelOrcamento.QuickRep1.Print;
  frm_RelOrcamento.Free;
end;

procedure Tfrm_ConfirmaAtendimento.edtprazoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtpagamento.SetFocus;
  if (key=K_CIMA) then
    edtContato.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.edtpagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    cbfrete.SetFocus;
  if (key=K_CIMA) then
    edtprazo.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.edtvalidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    Memo1.setfocus;
  if (key=K_CIMA) then
    cbfrete.SetFocus;
end;

procedure Tfrm_ConfirmaAtendimento.cbFreteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) then
    edtvalidade.setfocus;
end;

procedure Tfrm_ConfirmaAtendimento.Memo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) then
    Memo1.ReadOnly := true
  else
    Memo1.ReadOnly := false;
end;

procedure Tfrm_ConfirmaAtendimento.edtContatoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ESC) then
    close;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtprazo.setfocus;
  if (key=K_CIMA) then
    edtNome.SetFocus;
  if (key=K_F8) then
    edtContatoDblClick(Sender);
end;

procedure Tfrm_ConfirmaAtendimento.edtContatoDblClick(Sender: TObject);
var
  clAux : TClassAuxiliar;
begin
  inherited;
  Application.CreateForm(Tfrm_f8Comprador,frm_f8Comprador);
  if (databasecredito='CREDITO') then

    with (frm_f8Comprador) do
    begin
      edit:=edtContato;
      showmodal;
      if (trim(edtContato.text)<>'') then
      begin
                  //*******************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databasecredito,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT CC_NCO1 FROM CRECLI_COMP WHERE (CC_CLIE=:codigo) ');
        clAux.consulta.parambyname('codigo').AsFloat := strtofloat(trim(edtContato.text));
        codigoContato := strtofloat(trim(edtContato.text));
        if (clAux.Execute) then
          edtContato.text := clAux.result('CC_NCO1')
        else
          edtContato.text := '';
        clAux.desconect;
        clAux.Free;
                  //*******************************************
      end
      else
        edtContato.text := '';
    end;
    frm_f8Comprador.Free;
end;

end.
