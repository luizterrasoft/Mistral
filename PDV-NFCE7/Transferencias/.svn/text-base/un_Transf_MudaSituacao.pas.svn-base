unit un_Transf_MudaSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, StdCtrls, Mask, MaskEditOO, LabelOO, Menus, Db,
  DBTables, Grids, DBGrids, PanelOO, DBCtrls;

type
  Tfrm_Transf_MudaSituacao = class(TForm)
    BotaoSair1: TBotaoSair;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    LabelOO1: TLabelOO;
    edtLojaOrigem: TMaskEditOO;
    pnLojaOrigem: TPanelOO;
    LabelOO2: TLabelOO;
    edtDocumento: TMaskEditOO;
    ds: TDataSource;
    grade: TDBGrid;
    botao2: TPanel;
    Buscaritensdatransferncia1: TMenuItem;
    qItens: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qItensIT_LOJ1: TFloatField;
    qItensIT_TRAN: TFloatField;
    qItensIT_TIPZ: TStringField;
    qItensIT_GRUP: TFloatField;
    qItensIT_SUBG: TFloatField;
    qItensIT_PROD: TFloatField;
    qItensIT_CORE: TFloatField;
    qItensIT_OTAM: TIntegerField;
    qItensIT_TAMA: TStringField;
    qItensIT_QTDE: TFloatField;
    qItensIT_MOV1: TFloatField;
    qItensIT_MOV2: TFloatField;
    qItensIT_DIGI: TDateTimeField;
    qItensIT_EMBA: TDateTimeField;
    qItensIT_CHEG: TDateTimeField;
    qItensIT_STAT: TStringField;
    qItensIT_QTDS: TFloatField;
    qItenscDESCITEM: TStringField;
    qItenscCBARRA: TStringField;
    qItenscSTATUS: TStringField;
    Panel2: TPanel;
    LabelOO3: TLabelOO;
    Panel3: TPanel;
    Panel4: TPanel;
    LabelOO4: TLabelOO;
    LabelOO5: TLabelOO;
    Panel5: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    qItenscDATADIGITACAO: TStringField;
    qItenscDATAEMBARQUE: TStringField;
    qItenscDATACHEGADA: TStringField;
    botaoUm: TPanel;
    botaoTodos: TPanel;
    Bevel1: TBevel;
    LabelOO6: TLabelOO;
    edtLojaDestino: TMaskEditOO;
    pnLojaDestino: TPanelOO;
    lbtipz: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLojaOrigemEnter(Sender: TObject);
    procedure edtDocumentoEnter(Sender: TObject);
    procedure edtLojaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaOrigemDblClick(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure Buscaritensdatransferncia1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure qItensCalcFields(DataSet: TDataSet);
    procedure botaoUmClick(Sender: TObject);
    procedure botaoTodosClick(Sender: TObject);
    procedure edtLojaOrigemExit(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    exibiu: Boolean;
    y_flagStat: String;
    procedure RefrescaTabela;
  end;

var
  frm_Transf_MudaSituacao: Tfrm_Transf_MudaSituacao;

implementation

uses F8Lojas, principal, funcoes1, funcoes2, procura, unMensagem, auxiliar,
  unDialogo, DM2, DM16, venda;

{$R *.DFM}

procedure Tfrm_Transf_MudaSituacao.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_MudaSituacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_Transf_MudaSituacao.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_MudaSituacao.FormActivate(Sender: TObject);
begin
  if (not exibiu) then
  begin
    if (y_flagStat='1') then
    begin
      edtLojaOrigem.text := form_nz(frm_principal.x_loja,2);
      edtLojaOrigemExit(edtLojaOrigem);
      edtLojaOrigem.readonly := true;
      caption := 'Registrar Embarque da Mercadoria';
      botaoUm.caption := 'Embarcar item selecionado';
      botaoTodos.caption := 'Embarcar todos os itens';
    end
    else
    begin
      edtLojaOrigem.readonly := false;
      caption := 'Registrar Chegada da Mercadoria';
      botaoUm.caption := 'Registrar Chegada do item selecionado';
      botaoTodos.caption := 'Registrar Chegada de todos os itens';
    end;
    qItens.databasename := databaseprodutos;
    exibiu:=true;
  end;
  if (y_flagStat='1') then
    edtDocumento.setfocus
  else
    edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_MudaSituacao.FormCreate(Sender: TObject);
begin
  exibiu:=false;
  y_flagStat:='';
end;

procedure Tfrm_Transf_MudaSituacao.edtLojaOrigemEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_MudaSituacao.edtDocumentoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_MudaSituacao.edtLojaOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDocumento.setfocus;
  if (key=K_CIMA) then;
  if (key=K_F8) then
    if (y_flagStat='2') then
      with (frm_f8Lojas) do
      begin
        left:=287;
        top :=76;
        edit:=edtLojaOrigem;
        showmodal;
      end;
end;

procedure Tfrm_Transf_MudaSituacao.edtDocumentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtLojaOrigem.setfocus;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_MudaSituacao.edtLojaOrigemDblClick(Sender: TObject);
begin
  if (y_flagStat='2') then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLojaOrigem;
      showmodal;
    end;
end;

procedure Tfrm_Transf_MudaSituacao.botao2Click(Sender: TObject);
begin
  Buscaritensdatransferncia1.click;
end;

procedure Tfrm_Transf_MudaSituacao.Buscaritensdatransferncia1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>0) then
  begin
          //***********************************************************
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT TR_LOJ2,TR_TIPZ                               ');
    clAux.AddParam ('FROM TRANSF_LOJA                                     ');
    clAux.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) ');
    clAux.consulta.parambyname('lojaorigem').AsFloat := edtLojaOrigem.GetValor;
    clAux.consulta.parambyname('documento').AsFloat  := edtDocumento.GetValor;
    if (clAux.Execute) then
    begin
      edtLojaDestino.text   := form_nz(clAux.result('TR_LOJ2'),2);
      pnLojaDestino.caption := ProcuraNomeLoja(clAux.result('TR_LOJ2'),self);
      if (clAux.result('TR_TIPZ')='1') then
        lbtipz.visible := false
      else
      if (clAux.result('TR_TIPZ')='2') then
        lbtipz.visible := true;
      lbtipz.caption := 'Sr.'+clAux.result('TR_TIPZ');
    end
    else
    begin
      pnLojaDestino.caption := '[DOCUMENTO NAO ENCONTRADO]';
      lbtipz.visible := false;
    end;
    clAux.desconect;
    clAux.Free;
          //***********************************************************
    RefrescaTabela;
    grade.setfocus;
  end;
end;

procedure Tfrm_Transf_MudaSituacao.RefrescaTabela;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>0) then
    with (qItens) do
    begin
      close;
      parambyname('lojaorigem').AsFloat := edtLojaOrigem.GetValor;
      parambyname('documento').AsFloat  := edtDocumento.GetValor;
      open;
      first;
    end;
end;

procedure Tfrm_Transf_MudaSituacao.Limparformulrio1Click(Sender: TObject);
begin
  if (y_flagStat='2')then
  begin
    edtLojaOrigem.text := '';
    pnLojaOrigem.caption := '';
  end;
  edtDocumento.text := '';
  edtLojaDestino.text := '';
  pnLojaDestino.caption := '';
  lbtipz.visible:=false;
  qItens.close;
  if (y_flagStat='1') then
    edtDocumento.setfocus
  else
    edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_MudaSituacao.qItensCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (dataset) do
  begin
    if (fieldbyname('cDATADIGITACAO').IsNull) then
      if (fieldbyname('IT_DIGI').AsDateTime<>strtodate('01/01/1900')) then
        fieldbyname('cDATADIGITACAO').AsString := form_data(fieldbyname('IT_DIGI').AsDateTime)
      else
        fieldbyname('cDATADIGITACAO').AsString := '          ';
    if (fieldbyname('cDATAEMBARQUE').IsNull) then
      if (fieldbyname('IT_EMBA').AsDateTime<>strtodate('01/01/1900')) then
        fieldbyname('cDATAEMBARQUE').AsString := form_data(fieldbyname('IT_EMBA').AsDateTime)
      else
        fieldbyname('cDATAEMBARQUE').AsString := '          ';
    if (fieldbyname('cDATACHEGADA').IsNull) then
      if (fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
        fieldbyname('cDATACHEGADA').AsString := form_data(fieldbyname('IT_CHEG').AsDateTime)
      else
        fieldbyname('cDATACHEGADA').AsString := '          ';
    if (fieldbyname('cSTATUS').IsNull) then
      if (fieldbyname('IT_STAT').AsString='0') then
        fieldbyname('cSTATUS').AsString := 'DIGITADO'
      else
      if (fieldbyname('IT_STAT').AsString='1') then
        fieldbyname('cSTATUS').AsString := 'EMBARCADO'
      else
      if (fieldbyname('IT_STAT').AsString='2') then
        fieldbyname('cSTATUS').AsString := 'CHEGOU';
    if (fieldbyname('cDESCITEM').IsNull) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('Select ES_DESC,ES_CBAR                                                   ');
      clAux.AddParam ('From ESTOQUE                                                             ');
      clAux.AddParam ('Where (ES_GRUP='+fieldbyname('IT_GRUP').AsString+') AND                  ');
      clAux.AddParam ('      (ES_SUBG='+fieldbyname('IT_SUBG').AsString+') AND                  ');
      clAux.AddParam ('      (ES_PROD='+fieldbyname('IT_PROD').AsString+') AND                  ');
      clAux.AddParam ('      (ES_CORE='+fieldbyname('IT_CORE').AsString+') AND                  ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+fieldbyname('IT_TAMA').AsString+chr(39)+')      ');
      if (clAux.Execute) then
      begin
        fieldbyname('cDESCITEM').AsString := Trim(clAux.result('ES_DESC'));
        fieldbyname('cCBARRA').AsString := Trim(clAux.result('ES_CBAR'));
      end
      else
      begin
        fieldbyname('cDESCITEM').AsString := '?';
        fieldbyname('cCBARRA').AsString := '?';
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_Transf_MudaSituacao.botaoUmClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  continua: Boolean;
  tipz,mensagem: String;
  seqmov1,seqmov2: Real;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
               //******************************************************************
      if (y_flagStat='1') then
      begin
        mensagem := 'embarque';
        if (qItens.fieldbyname('IT_STAT').AsString='0') then
          continua:=true
        else
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' Mercadoria já embarcada ou já entregue! '
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end;
      end
      else
      if (y_flagStat='2') then
      begin
        mensagem := 'registro de chegada';
        if (qItens.fieldbyname('IT_STAT').AsString='0') or
          (qItens.fieldbyname('IT_STAT').AsString='1') then
          continua:=true
        else
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' Mercadoria já entregue! '
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end;
        if (continua) then
          if (edtLojaDestino.GetValor<>frm_principal.x_loja) then
          begin
            continua:=false;
            frmDialogo.ExibirMensagem (' LOJA DE DESTINO não é a loja trabalhada pelo sistema! '
              ,'Vendas',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            frmDialogo.ExibirMensagem (' Impossível registrar chegada de mercadoria! '
              ,'Vendas',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          end
          else
            continua:=true;
      end;
               //******************************************************************

      if (continua) then
      begin
        frmDialogo.posativ:=1;
        if (frmDialogo.ExibirMensagem ('Confirma '+mensagem+'?'
          ,'Vendas',[mbYes,mbNo],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
                       //***************************************************************************
          if (frm_principal.x_online) and (y_flagStat='2') then
          begin
            seqmov1 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
            seqmov2 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
          end;
                       //***************************************************************************

          clAux := TClassAuxiliar.Create;
          clAux.conect   (databaseprodutos,self);
          clAux.ClearSql;
          clAux.AddParam ('UPDATE ITENS_TRANSF_LOJA                ');
          if (y_flagStat='1') then
            clAux.AddParam ('SET    IT_EMBA=:embarque,          ')
          else
          if (y_flagStat='2') then
          begin
            clAux.AddParam ('SET    IT_CHEG=:chegada,           ');
            clAux.AddParam ('       IT_QTDE=:qtdentrada,        ');
          end;
          clAux.AddParam ('       IT_STAT=:status                  ');
                       //***************************************************************************
          if (frm_principal.x_online) and (y_flagStat='2') then
          begin
            clAux.AddParam ('      ,IT_MOV1=:movi1              ');
            clAux.AddParam ('      ,IT_MOV2=:movi2              ');
          end;
                       //***************************************************************************
          clAux.AddParam ('WHERE (IT_GRUP=:grupo) AND              ');
          clAux.AddParam ('      (IT_SUBG=:subgrupo) AND           ');
          clAux.AddParam ('      (IT_PROD=:produto) AND            ');
          clAux.AddParam ('      (IT_CORE=:cor) AND                ');
          clAux.AddParam ('      (IT_TAMA=:tamanho) AND            ');
          clAux.AddParam ('      (IT_LOJ1=:lojaorigem) AND         ');
          clAux.AddParam ('      (IT_TRAN=:documento)              ');
          clAux.consulta.parambyname('grupo').AsFloat      := qItens.fieldbyname('IT_GRUP').AsFloat;
          clAux.consulta.parambyname('subgrupo').AsFloat   := qItens.fieldbyname('IT_SUBG').AsFloat;
          clAux.consulta.parambyname('produto').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
          clAux.consulta.parambyname('cor').AsFloat        := qItens.fieldbyname('IT_CORE').AsFloat;
          clAux.consulta.parambyname('tamanho').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
          clAux.consulta.parambyname('lojaorigem').AsFloat := qItens.fieldbyname('IT_LOJ1').AsFloat;
          clAux.consulta.parambyname('documento').AsFloat  := qItens.fieldbyname('IT_TRAN').AsFloat;
          if (y_flagStat='1') then
            clAux.consulta.parambyname('embarque').AsDateTime := frm_principal.x_data_trabalho
          else
          if (y_flagStat='2') then
          begin
            clAux.consulta.parambyname('chegada').AsDateTime := frm_principal.x_data_trabalho;
            clAux.consulta.parambyname('qtdentrada').AsFloat := qItens.fieldbyname('IT_QTDS').AsFloat;
          end;
          clAux.consulta.parambyname('status').AsString := y_flagStat;
                       //***************************************************************************
          if (frm_principal.x_online) and (y_flagStat='2') then
          begin
            clAux.consulta.parambyname('movi1').AsFloat := seqmov1;
            clAux.consulta.parambyname('movi2').AsFloat := seqmov2;
          end;
                       //***************************************************************************
          clAux.Execute; {*}
          clAux.desconect;
          clAux.Free;

                       //-----------------------------------------------------------------------
          if (frm_principal.x_online) and (y_flagStat='2') then
          begin
            if (lbtipz.caption='Sr.1') then
              tipz:='1'
            else
            if (lbtipz.caption='Sr.2') then
              tipz:='2';

                            //1a. SAIDA DA LOJA DE ORIGEM
            DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov1;
            DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := qItens.fieldbyname('IT_SUBG').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := qItens.fieldbyname('IT_CORE').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
            DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := InformaOrdemTamanho(
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString);
            DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := 0.00;
            DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := 0.00;
            DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
            DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
            DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {saida}
            DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
            DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
            DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := qItens.fieldbyname('IT_TRAN').AsString;
            DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat);
            DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
            DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*qItens.fieldbyname('IT_QTDS').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := tipz;
            DMCaixa.qInsereMovimento.ExecSql; {*}
            SaidaItemEstoque (qItens.fieldbyname('IT_LOJ1').AsFloat,
              tipz,
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_CORE').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString,
              qItens.fieldbyname('IT_QTDS').AsFloat);

                            //2a. ENTRADA NA LOJA DE DESTINO
            DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov2;
            DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := qItens.fieldbyname('IT_SUBG').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := qItens.fieldbyname('IT_CORE').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
            DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := InformaOrdemTamanho(
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString);
            DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := 0.00;
            DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := 0.00;
            DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := edtLojaDestino.GetValor;
            DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
            DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
            DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {saida}
            DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
            DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
            DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := qItens.fieldbyname('IT_TRAN').AsString;
            DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat);
            DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
            DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
            DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := tipz;
            DMCaixa.qInsereMovimento.ExecSql; {*}
            EntradaItemEstoque (qItens.fieldbyname('IT_LOJ1').AsFloat,
              tipz,
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_CORE').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString,
              qItens.fieldbyname('IT_QTDS').AsFloat);
          end;

          RefrescaTabela;
        end;
      end;
    end;
end;

procedure Tfrm_Transf_MudaSituacao.botaoTodosClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  indGauge,totGauge: Integer;
  continua: Boolean;
  tipz,mensagem: String;
  seqmov1,seqmov2: Real;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
               //*****************************************************************
      if (y_flagStat='2') then
      begin
        if (edtLojaDestino.GetValor<>frm_principal.x_loja) then
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' LOJA DE DESTINO não é a loja trabalhada pelo sistema! '
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          frmDialogo.ExibirMensagem (' Impossível registrar chegada de mercadoria! '
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end
        else
          continua:=true;
      end
      else
        continua:=true;
               //*****************************************************************

      if (continua) then
      begin
        if (y_flagStat='1') then
          mensagem := 'embarque de tudo'
        else
        if (y_flagStat='2') then
          mensagem := 'registro de chegada de tudo';
        frmDialogo.posativ:=1;
        if (frmDialogo.ExibirMensagem ('Confirma '+mensagem+'?'
          ,'Vendas',[mbYes,mbNo],
          frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          qItens.disablecontrols;
          qItens.first;
          if (y_flagStat='1') then
            mostra_mensagem('Embarcando itens...Aguarde')
          else
          if (y_flagStat='2') then
            mostra_mensagem('Registrando entrega dos itens...Aguarde');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;
          indGauge:=0;
          totGauge:=qItens.recordcount;
          while (not qItens.eof) do
          begin
                           //******************************************************************
            if (y_flagStat='1') then
            begin
              if (qItens.fieldbyname('IT_STAT').AsString='0') then
                continua:=true
              else
                continua:=false;
            end
            else
            if (y_flagStat='2') then
              if (qItens.fieldbyname('IT_STAT').AsString='0') or
                (qItens.fieldbyname('IT_STAT').AsString='1') then
                continua:=true
              else
                continua:=false;
                           //******************************************************************

            if (continua) then
            begin
                               //***************************************************************************
              if (frm_principal.x_online) and (y_flagStat='2') then
              begin
                seqmov1 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
                seqmov2 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));
              end;
                               //***************************************************************************

              clAux := TClassAuxiliar.Create;
              clAux.conect   (databaseprodutos,self);
              clAux.ClearSql;
              clAux.AddParam ('UPDATE ITENS_TRANSF_LOJA                ');
              if (y_flagStat='1') then
                clAux.AddParam ('SET    IT_EMBA=:embarque,          ')
              else
              if (y_flagStat='2') then
              begin
                clAux.AddParam ('SET    IT_CHEG=:chegada,           ');
                clAux.AddParam ('       IT_QTDE=:qtdentrada,        ');
              end;
              clAux.AddParam ('       IT_STAT=:status                  ');
                               //***************************************************************************
              if (frm_principal.x_online) and (y_flagStat='2') then
              begin
                clAux.AddParam ('      ,IT_MOV1=:movi1              ');
                clAux.AddParam ('      ,IT_MOV2=:movi2              ');
              end;
                               //***************************************************************************
              clAux.AddParam ('WHERE (IT_GRUP=:grupo) AND              ');
              clAux.AddParam ('      (IT_SUBG=:subgrupo) AND           ');
              clAux.AddParam ('      (IT_PROD=:produto) AND            ');
              clAux.AddParam ('      (IT_CORE=:cor) AND                ');
              clAux.AddParam ('      (IT_TAMA=:tamanho) AND            ');
              clAux.AddParam ('      (IT_LOJ1=:lojaorigem) AND         ');
              clAux.AddParam ('      (IT_TRAN=:documento)              ');
              clAux.consulta.parambyname('grupo').AsFloat      := qItens.fieldbyname('IT_GRUP').AsFloat;
              clAux.consulta.parambyname('subgrupo').AsFloat   := qItens.fieldbyname('IT_SUBG').AsFloat;
              clAux.consulta.parambyname('produto').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
              clAux.consulta.parambyname('cor').AsFloat        := qItens.fieldbyname('IT_CORE').AsFloat;
              clAux.consulta.parambyname('tamanho').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
              clAux.consulta.parambyname('lojaorigem').AsFloat := qItens.fieldbyname('IT_LOJ1').AsFloat;
              clAux.consulta.parambyname('documento').AsFloat  := qItens.fieldbyname('IT_TRAN').AsFloat;
              if (y_flagStat='1') then
                clAux.consulta.parambyname('embarque').AsDateTime := frm_principal.x_data_trabalho
              else
              if (y_flagStat='2') then
              begin
                clAux.consulta.parambyname('chegada').AsDateTime := frm_principal.x_data_trabalho;
                clAux.consulta.parambyname('qtdentrada').AsFloat := qItens.fieldbyname('IT_QTDS').AsFloat;
              end;
              clAux.consulta.parambyname('status').AsString := y_flagStat;
                               //***************************************************************************
              if (frm_principal.x_online) and (y_flagStat='2') then
              begin
                clAux.consulta.parambyname('movi1').AsFloat := seqmov1;
                clAux.consulta.parambyname('movi2').AsFloat := seqmov2;
              end;
                               //***************************************************************************
              clAux.Execute; {*}
              clAux.desconect;
              clAux.Free;

                               //-----------------------------------------------------------------------
              if (frm_principal.x_online) and (y_flagStat='2') then
              begin
                if (lbtipz.caption='Sr.1') then
                  tipz:='1'
                else
                if (lbtipz.caption='Sr.2') then
                  tipz:='2';

                                    //1a. SAIDA DA LOJA DE ORIGEM
                DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov1;
                DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := qItens.fieldbyname('IT_SUBG').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := qItens.fieldbyname('IT_CORE').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
                DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := InformaOrdemTamanho(
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString);
                DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := 0.00;
                DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := 0.00;
                DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
                DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
                DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'S'; {saida}
                DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
                DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
                DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := qItens.fieldbyname('IT_TRAN').AsString;
                DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat);
                DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := (-1)*qItens.fieldbyname('IT_QTDS').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := tipz;
                DMCaixa.qInsereMovimento.ExecSql; {*}
                SaidaItemEstoque (qItens.fieldbyname('IT_LOJ1').AsFloat,
                  tipz,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qItens.fieldbyname('IT_QTDS').AsFloat);

                                    //2a. ENTRADA NA LOJA DE DESTINO
                DMCaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov2;
                DMCaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := qItens.fieldbyname('IT_SUBG').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := qItens.fieldbyname('IT_PROD').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := qItens.fieldbyname('IT_CORE').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := qItens.fieldbyname('IT_TAMA').AsString;
                DMCaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := InformaOrdemTamanho(
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString);
                DMCaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := 0.00;
                DMCaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := 0.00;
                DMCaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := edtLojaDestino.GetValor;
                DMCaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
                DMCaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
                DMCaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {saida}
                DMCaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
                DMCaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
                DMCaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := qItens.fieldbyname('IT_TRAN').AsString;
                DMCaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := BuscaFornecedor(
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat);
                DMCaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
                DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := qItens.fieldbyname('IT_QTDS').AsFloat;
                DMCaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := tipz;
                DMCaixa.qInsereMovimento.ExecSql; {*}
                EntradaItemEstoque (qItens.fieldbyname('IT_LOJ1').AsFloat,
                  tipz,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qItens.fieldbyname('IT_QTDS').AsFloat);
              end;
            end;

                           {--->}
            qItens.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          esconde_mensagem;
          qItens.enablecontrols;
          RefrescaTabela;
        end;
      end;
    end;
end;

procedure Tfrm_Transf_MudaSituacao.edtLojaOrigemExit(Sender: TObject);
begin
  if (edtLojaOrigem.getValor<>0) then
  begin
    edtLojaOrigem.text:=form_nz(edtLojaOrigem.GetValor,2);
    pnLojaOrigem.caption:=ProcuraNomeLoja(edtLojaOrigem.GetValor,self);
  end
  else
    pnLojaOrigem.caption:='';
end;

procedure Tfrm_Transf_MudaSituacao.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    edtDocumento.setfocus;
end;

end.
