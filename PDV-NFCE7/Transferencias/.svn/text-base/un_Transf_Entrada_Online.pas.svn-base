unit un_Transf_Entrada_Online;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BotaoSair, StdCtrls, ExtCtrls, Menus, PanelOO, Mask, MaskEditOO,
  LabelOO, Grids, DBGrids, DB, DBTables, ComCtrls, Buttons,funcoesglobais;

type
  Tfrm_Transf_Entrada_Online = class(TForm)
    filtro2: TPanel;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    edtDocumento: TMaskEditOO;
    edtLojaOrigem: TMaskEditOO;
    pnLojaOrigem: TPanelOO;
    botao5: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulrio1: TMenuItem;
    qItens: TQuery;
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
    qItenscDATADIGITACAO: TStringField;
    qItenscDATAEMBARQUE: TStringField;
    qItenscDATACHEGADA: TStringField;
    qItensTR_LOJ1: TFloatField;
    qItensTR_NUME: TFloatField;
    qItensTR_DATA: TDateTimeField;
    qItensTR_LOJ2: TFloatField;
    qItensTR_STAT: TStringField;
    qItensTR_ENVI: TStringField;
    qItensTR_ONLI: TStringField;
    qItensTR_TIPZ: TStringField;
    qItenscQTDE: TStringField;
    qItenscQTDS: TStringField;
    qItenscDIVERG: TStringField;
    ds: TDataSource;
    pg1: TPageControl;
    pagina1: TTabSheet;
    pagina2: TTabSheet;
    grade: TDBGrid;
    tblTransf: TTable;
    tblTransfGRUPO: TIntegerField;
    tblTransfSUBGRUPO: TIntegerField;
    tblTransfPRODUTO: TFloatField;
    tblTransfLOJA: TIntegerField;
    tblTransfCOR: TIntegerField;
    tblTransfTAMANHO: TStringField;
    tblTransfQTDE: TFloatField;
    tblTransfDATA: TDateField;
    tblTransfMODE: TStringField;
    tblTransfTIPZ: TStringField;
    tblTransfSALDOANT: TIntegerField;
    tblTransfcSaldo1: TStringField;
    tblTransfcCBARRA: TStringField;
    btnIncluir: TSpeedButton;
    ds2: TDataSource;
    tblTransfcDescricao: TStringField;
    grade2: TDBGrid;
    tblTransfcSituacao: TStringField;
    tblTransfcflasit: TStringField;
    btnSalvar: TSpeedButton;
    LabelOO1: TLabelOO;
    pnQtdeTotal2: TPanel;
    btnExcluir: TSpeedButton;
    btnDiminuir: TSpeedButton;
    tblTransfSEQ: TIntegerField;
    btnAumentaQtde: TSpeedButton;
    btnDiminuiQtde: TSpeedButton;
    tblTransfcCOR: TStringField;
    tblTransfcTAM: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    BotaoSair1: TBotaoSair;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtLojaOrigemDblClick(Sender: TObject);
    procedure edtLojaOrigemEnter(Sender: TObject);
    procedure edtLojaOrigemExit(Sender: TObject);
    procedure edtLojaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDocumentoEnter(Sender: TObject);
    procedure edtDocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao5Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure qItensCalcFields(DataSet: TDataSet);
    procedure BotaoSair1Click(Sender: TObject);
    procedure tblTransfCalcFields(DataSet: TDataSet);
    procedure gradeSaidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure pg1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grade2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSalvarClick(Sender: TObject);
    procedure tblTransfAfterOpen(DataSet: TDataSet);
    procedure tblTransfAfterClose(DataSet: TDataSet);
    procedure btnDiminuirClick(Sender: TObject);
    procedure btnAumentaQtdeClick(Sender: TObject);
    procedure btnDiminuiQtdeClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure pg1DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    podeLancarEntrada: Boolean;
    procedure RefrescaTabela;
    function AnalisaSituacaoItem(lojaorigem: Real; documento: String; grupo,subgrupo,
      produto,cor,tamanho: String; qtde: Real):String;
    function JaExisteTransfLojaComEsteNumero1(lojaorigem,documento: Real):Boolean;
    function JaExisteTransfLojaComEsteNumero2(lojaorigem,documento,lojadest: Real):Boolean;
  end;

var
  frm_Transf_Entrada_Online: Tfrm_Transf_Entrada_Online;

implementation

uses principal, funcoes1, funcoes2, procura, auxiliar, F8Lojas,
  un_Transf_Lancamento, un_Transf_Entrada_Online_Lancamento, unDialogo,
  unMensagem, DM2, DM16, venda, Un_ConsProdutosEstoque;

{$R *.dfm}

procedure Tfrm_Transf_Entrada_Online.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Entrada_Online.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_F3) then
    if (podeLancarEntrada) then
      btnIncluir.click;
  if (shift=[ssCtrl]) then
  begin
    if (key=K_DELETE) then
      if (btnExcluir.enabled) then
        btnExcluir.click;
  end
  else
  if (key=K_DELETE) then
    if (btnDiminuir.enabled) then
      btnDiminuir.click;
  if (key=K_F5) or (key=K_F9) then
    if (btnSalvar.enabled) then
      btnSalvar.click;
end;

procedure Tfrm_Transf_Entrada_Online.FormActivate(Sender: TObject);
begin
  edtLojaOrigem.setfocus;
  if (Frm_ConsProdutosEstoque <> nil) and
    Frm_ConsProdutosEstoque.QEstoque.Active and
    (Frm_ConsProdutosEstoque.QEstoque.fieldbyname('El_Loja').AsFloat  <> Frm_Principal.x_loja)  then
    edtLojaOrigem.Text := Frm_ConsProdutosEstoque.QEstoque.fieldbyname('El_Loja').AsString;

end;

procedure Tfrm_Transf_Entrada_Online.edtLojaOrigemDblClick(
  Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLojaOrigem;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Entrada_Online.edtLojaOrigemEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Entrada_Online.edtLojaOrigemExit(Sender: TObject);
begin
  if (edtLojaOrigem.GetValor<>0) then
  begin
    edtLojaOrigem.text:=form_nz(edtLojaOrigem.GetValor,2);
    pnLojaOrigem.caption:=ProcuraNomeLoja(edtLojaOrigem.GetValor,self);
  end
  else
    pnLojaOrigem.caption:='';
end;

procedure Tfrm_Transf_Entrada_Online.edtLojaOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDocumento.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLojaOrigem;
      showmodal;
    end;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Entrada_Online.edtDocumentoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Entrada_Online.edtDocumentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao5Click(Sender);
  if (key=K_CIMA) then
    edtLojaOrigem.setfocus;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Entrada_Online.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_Entrada_Online.botao5Click(Sender: TObject);
begin
  RefrescaTabela;
end;

procedure Tfrm_Transf_Entrada_Online.RefrescaTabela;
begin
  with (qItens) do
    if (trim(edtDocumento.GetValor)<>'') and
      (edtLojaOrigem.GetValor<>0) then
      if (edtLojaOrigem.GetValor=frm_principal.x_loja) then
      begin
        frmDialogo.ExibirMensagem (' Loja de Origem não pode ser igual à loja '+form_nz(frm_principal.x_loja,2)+'! '
          ,'Transferências',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        Limparformulrio1.click;
        edtLojaOrigem.setfocus;
      end
      else
      begin
                   //*************************************************************************
        podeLancarEntrada := true;
        sql.clear;
        sql.Add ('SELECT *                                           ');
        sql.Add ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA                 ');
        sql.Add ('WHERE (TR_LOJ1=:lojaorigem) AND                    ');
        sql.Add ('      (IT_TRAN=:documento) AND                     ');
        sql.Add ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME)      ');
        close;
        parambyname('lojaorigem').AsFloat := edtLojaOrigem.GetValor;
        parambyname('documento').AsString := edtDocumento.GetValor;
        open;
        pg1.activepageindex:=0;
        first;
        grade.setfocus;

                   //... CRITICAS - RETIRADA A PEDIDO DA KIK
        if (fieldbyname('TR_LOJ2').AsFloat<>frm_principal.x_loja) then
        begin
          frmDialogo.ExibirMensagem ('A transferência não é destinada a esta loja ou não foi lançada! Verifique os dados!'
            ,'Transferências',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                        //Limparformulrio1.click;
          btnIncluir.Enabled  := false;
          btnDiminuir.Enabled := false;
          btnExcluir.Enabled  := false;
          btnSalvar.Enabled   := false;
          edtDocumento.setfocus;
          if (frm_principal.servidor_estoque.Connected) then
            podeLancarEntrada := false;
        end
        else
        begin
          btnIncluir.Enabled  := true;
          btnDiminuir.Enabled := true;
          btnExcluir.Enabled  := true;
          btnSalvar.Enabled   := true;
        end;
      end//CRITICAS - Evita que os itens aparecam
//***************************************************************
//***************************************************************
  ;
end;

procedure Tfrm_Transf_Entrada_Online.Limparformulrio1Click(
  Sender: TObject);
begin
  edtLojaOrigem.text    := '';
  pnLojaOrigem.caption  := '';
  edtDocumento.text     := '';
  if (not tblTransf.active) then
    tblTransf.active;
  while (not tblTransf.eof) do
    tblTransf.delete;
  pnQtdeTotal2.caption  := '0';
  pnQtdeTotal2.tag      := 0;
  pg1.activepageindex   := 0;
  qItens.close;
  edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_Entrada_Online.qItensCalcFields(DataSet: TDataSet);
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
      begin
        fieldbyname('cSTATUS').AsString := 'DIGITADO';
        fieldbyname('cQTDS').AsString := '-';
        fieldbyname('cQTDE').AsString := '-';
      end
      else
      if (fieldbyname('IT_STAT').AsString='1') then
      begin
        fieldbyname('cSTATUS').AsString := 'SAIDA';
        fieldbyname('cQTDS').AsString := floattostr(fieldbyname('IT_QTDS').AsFloat);
        fieldbyname('cQTDE').AsString := '-';
      end
      else
      if (fieldbyname('IT_STAT').AsString='2') then
      begin
        fieldbyname('cSTATUS').AsString := 'ENTRADA';
        fieldbyname('cQTDS').AsString := floattostr(fieldbyname('IT_QTDS').AsFloat);
        fieldbyname('cQTDE').AsString := floattostr(fieldbyname('IT_QTDE').AsFloat);
      end;
    if (fieldbyname('cDESCITEM').IsNull) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('ESTOQUE',self);
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

procedure Tfrm_Transf_Entrada_Online.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Entrada_Online.tblTransfCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
  situacao: String;
begin
  if (edtLojaOrigem.GetValor<>0) or (edtDocumento.GetValor<>'') then
    with (dataset) do
    begin
      if (fieldbyname('cCBARRA').IsNull) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('ESTOQUE',self);
        clAux.ClearSql;
        clAux.AddParam ('Select ES_DESC,ES_CBAR,PR_DESC                                           ');
        clAux.AddParam ('From   ESTOQUE,PRODUTOS                                                  ');
        clAux.AddParam ('Where (ES_GRUP='+fieldbyname('GRUPO').AsString+') AND                    ');
        clAux.AddParam ('      (ES_SUBG='+fieldbyname('SUBGRUPO').AsString+') AND                 ');
        clAux.AddParam ('      (ES_PROD='+fieldbyname('PRODUTO').AsString+') AND                  ');
        clAux.AddParam ('      (ES_CORE='+fieldbyname('COR').AsString+') AND                      ');
        clAux.AddParam ('      (ES_TAMA='+chr(39)+fieldbyname('TAMANHO').AsString+chr(39)+') AND  ');
        clAux.AddParam ('      (ES_GRUP=PR_GRUP) AND (ES_SUBG=PR_SUBG) AND (ES_PROD=PR_CODI)      ');
        if (clAux.Execute) then
        begin
          fieldbyname('cDescricao').AsString := Trim(clAux.result('PR_DESC'));
          fieldbyname('cCBARRA').AsString    := Trim(clAux.result('ES_CBAR'));
        end
        else
        begin
          fieldbyname('cDescricao').AsString := '?';
          fieldbyname('cCBARRA').AsString    := '?';
        end;
        clAux.desconect;
        clAux.Free;
      end;
      if (fieldbyname('cSituacao').IsNull) then
      begin
        fieldbyname('cSituacao').AsString := 'OK';
        fieldbyname('cflasit').AsString   := 'OK';
      end;
      if (fieldbyname('cCOR').IsNull) then
        if (fieldbyname('COR').AsFloat=0) then
          fieldbyname('cCOR').AsString:='UNICA'
        else
          fieldbyname('cCOR').AsString:=
            fieldbyname('COR').AsString+'/'+
            ProcuraAbrevCor(fieldbyname('COR').AsFloat,self);
      if (fieldbyname('cTAM').IsNull) then
        if (fieldbyname('TAMANHO').AsString='0') then
          fieldbyname('cTAM').AsString:='UNICO'
        else
          fieldbyname('cTAM').AsString:=fieldbyname('TAMANHO').AsString;
    end;
end;

procedure Tfrm_Transf_Entrada_Online.gradeSaidaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_Entrada_Online.btnIncluirClick(
  Sender: TObject);
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>'') then
    if (edtLojaOrigem.GetValor=frm_principal.x_loja) then
    begin
      frmDialogo.ExibirMensagem (' Loja de Origem não pode ser igual à loja '+form_nz(frm_principal.x_loja,2)+'! '
        ,'Transferências',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      Limparformulrio1.click;
      edtLojaOrigem.setfocus;
    end
    else
    begin
      pg1.activepageindex:=1;
      Application.CreateForm(Tfrm_Transf_Entrada_Online_Lancamento, frm_Transf_Entrada_Online_Lancamento);
      frm_Transf_Entrada_Online_Lancamento.y_lojaorigem := edtLojaOrigem.GetValor;
      frm_Transf_Entrada_Online_Lancamento.y_documento  := edtDocumento.GetValor;
      frm_Transf_Entrada_Online_Lancamento.showmodal;
      frm_Transf_Entrada_Online_Lancamento.Free;
    end//CRITICAS - Evita que os itens aparecam
  ;
end;

procedure Tfrm_Transf_Entrada_Online.pg1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (edtLojaOrigem.GetValor=0) or (edtDocumento.GetValor='') then
    AllowChange := false
  else
    AllowChange := true;
end;

procedure Tfrm_Transf_Entrada_Online.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (not tblTransf.active) then
    tblTransf.active;
  while (not tblTransf.eof) do
    tblTransf.delete;
end;

function Tfrm_Transf_Entrada_Online.AnalisaSituacaoItem(lojaorigem: Real; documento: String;
  grupo,subgrupo,produto,cor,tamanho: String; qtde: Real):String;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',self);
  clAux.ClearSql;
  clAux.AddParam ('Select IT_QTDS                                             ');
  clAux.AddParam ('From   ITENS_TRANSF_LOJA                                   ');
  clAux.AddParam ('Where (IT_GRUP='+grupo+') AND                              ');
  clAux.AddParam ('      (IT_SUBG='+subgrupo+') AND                           ');
  clAux.AddParam ('      (IT_PROD='+produto+') AND                            ');
  clAux.AddParam ('      (IT_CORE='+cor+') AND                                ');
  clAux.AddParam ('      (IT_TAMA='+tamanho+') AND                            ');
  clAux.AddParam ('      (IT_LOJ1=:lojaorigem) AND (IT_TRAN=:documento)       ');
  clAux.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux.consulta.parambyname('documento').AsString := documento;
  if (clAux.Execute) then
    if (clAux.result('IT_QTDS')=qtde) then
      result := 'OK'
    else
    if (clAux.result('IT_QTDS')>qtde) then
      result := '-'
    else
    if (clAux.result('IT_QTDS')<qtde) then
      result := '+';
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Transf_Entrada_Online.grade2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade2.focused) then
    grade2.Canvas.Font.color:=clWhite
  else
  if (tbltransf.fieldbyname('cflasit').AsString='OK') then
    grade2.Canvas.Font.color:=clBlack
  else
    grade2.Canvas.Font.color:=clRed;
  grade2.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_Transf_Entrada_Online.btnSalvarClick(Sender: TObject);
var
  clTransf: TClassAuxiliar;
  continua: Boolean;
  seqmov2: Real;
  codigofornecedor,preco_venda,preco_custo: Real;
  ordemtamanho,indgauge,totgauge: Integer;
begin
     //***************************************************************
  if (trim(edtDocumento.GetValor)<>'') and
    (edtLojaOrigem.GetValor<>0) then
    if (tbltransf.active) then
      if (tbltransf.recordcount<>0) then
        if (edtLojaOrigem.GetValor=frm_principal.x_loja) then
        begin
          frmDialogo.ExibirMensagem (' Loja de Origem não pode ser igual à loja '+form_nz(frm_principal.x_loja,2)+'! '
            ,'Transferências',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          Limparformulrio1.click;
          edtLojaOrigem.setfocus;
        end
        else
        if (Trim(pnLojaOrigem.Caption)='<loja nao cadastrada>') then
        begin
          frmDialogo.ExibirMensagem (' Loja de Origem não Cadastrada '
            ,'Transferências',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
//                      Limparformulrio1.click;
          edtLojaOrigem.setfocus;
        end
        else
        if (JaExisteTransfLojaComEsteNumero1(edtLojaOrigem.GetValor,edtDocumento.GetValor)) then
        begin
          frmDialogo.ExibirMensagem ('Já existe uma Entrada com este número!'
            ,'Transferências',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtDocumento.setfocus;
        end
        else
        if (JaExisteTransfLojaComEsteNumero2(edtLojaOrigem.GetValor,edtDocumento.GetValor,frm_principal.x_loja)) then
        begin
          frmDialogo.ExibirMensagem ('Já existe uma Entrada para outra loja com este número!'
            ,'Transferências',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtDocumento.setfocus;
        end
        else
        begin
          frmDialogo.posativ:=1;
          if (frmDialogo.ExibirMensagem ('Deseja salvar Transferência?'
            ,'Transferências',[mbYes,mbNo],
            frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          begin
                          //1. VERIFICANDO O DOCUMENTO ORIGINAL DA TRANSFERENCIA
            clTransf := TClassAuxiliar.Create;
            clTransf.conect   ('ESTOQUE',self);
            clTransf.ClearSql;
            clTransf.AddParam ('SELECT TR_NUME,TR_LOJ2 FROM TRANSF_LOJA        ');
            clTransf.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND                ');
            clTransf.AddParam ('      (TR_NUME=:documento)                     ');
            clTransf.consulta.parambyname('lojaorigem').AsFloat     := edtLojaOrigem.GetValor;
            clTransf.consulta.parambyname('documento').AsFloat      := edtDocumento.GetValor;
            if (not clTransf.Execute) then
            begin
              clTransf.ClearSql;
              clTransf.AddParam ('INSERT INTO TRANSF_LOJA (TR_LOJ1,TR_NUME,TR_DATA,TR_LOJ2,TR_STAT,TR_ENVI,TR_ONLI,TR_TIPZ)  ');
              clTransf.AddParam ('VALUES (:TR_LOJ1,:TR_NUME,:TR_DATA,:TR_LOJ2,:TR_STAT,:TR_ENVI,:TR_ONLI,:TR_TIPZ)           ');
              clTransf.consulta.parambyname('TR_LOJ1').AsFloat     := edtLojaOrigem.GetValor;
              clTransf.consulta.parambyname('TR_NUME').AsFloat     := edtDocumento.GetValor;
              clTransf.consulta.parambyname('TR_DATA').AsDateTime  := frm_principal.x_data_trabalho;
              clTransf.consulta.parambyname('TR_LOJ2').AsFloat     := frm_principal.x_loja;
              clTransf.consulta.parambyname('TR_STAT').AsString    := '2'; //chegado
              clTransf.consulta.parambyname('TR_ENVI').AsString    := '1';
              clTransf.consulta.parambyname('TR_ONLI').AsString    := '1';
              clTransf.consulta.parambyname('TR_TIPZ').AsString    := '1';
              clTransf.Execute;
            end
            else
            begin
//                            if (clTransf.Result('TR_LOJ2')<>frm_principal.x_loja) then
//                            begin
              clTransf.ClearSql;
              clTransf.AddParam ('UPDATE TRANSF_LOJA SET TR_LOJ1=:TR_LOJ1,TR_NUME=:TR_NUME,TR_DATA=:TR_DATA,TR_LOJ2=:TR_LOJ2,');
              clTransf.AddParam ('TR_STAT=:TR_STAT,TR_ENVI=:TR_ENVI,TR_ONLI=:TR_ONLI,TR_TIPZ=:TR_TIPZ                        ');
              clTransf.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND                ');
              clTransf.AddParam ('      (TR_NUME=:documento)                     ');
              clTransf.consulta.parambyname('lojaorigem').AsFloat     := edtLojaOrigem.GetValor;
              clTransf.consulta.parambyname('documento').AsFloat      := edtDocumento.GetValor;
              clTransf.consulta.parambyname('TR_LOJ1').AsFloat     := edtLojaOrigem.GetValor;
              clTransf.consulta.parambyname('TR_NUME').AsFloat     := edtDocumento.GetValor;
              clTransf.consulta.parambyname('TR_DATA').AsDateTime  := frm_principal.x_data_trabalho;
              clTransf.consulta.parambyname('TR_LOJ2').AsFloat     := frm_principal.x_loja;
              clTransf.consulta.parambyname('TR_STAT').AsString    := '2'; //chegado
              clTransf.consulta.parambyname('TR_ENVI').AsString    := '1';
              clTransf.consulta.parambyname('TR_ONLI').AsString    := '1';
              clTransf.consulta.parambyname('TR_TIPZ').AsString    := '1';
              clTransf.Execute;
//                            end;
            end;
            clTransf.desconect;
            clTransf.Free;

                          //2. PROCESSANDO CADA ITEM DA TRANSFERENCIA
            tbltransf.disablecontrols;
            tbltransf.first;
            frm_mensagem.painel.visible:=true;
            frm_mensagem.gauge1.progress:=0;
            indGauge:=0;
            totGauge:=tbltransf.recordcount;
            while (not tbltransf.eof) do
            begin
                               //****************************************************************************
              ordemtamanho := InformaOrdemTamanho(tblTransf.fieldbyname('GRUPO').AsFloat,
                tblTransf.fieldbyname('SUBGRUPO').AsFloat,
                tblTransf.fieldbyname('PRODUTO').AsFloat,
                tblTransf.fieldbyname('TAMANHO').AsString);

              seqmov2 := Round(MaxiCod_estoque ('MOVIMENTO',frm_principal.barraDicas));

              preco_venda      := DevolvePrecoItem(frm_principal.x_loja,
                tblTransf.fieldbyname('GRUPO').AsFloat,
                tblTransf.fieldbyname('SUBGRUPO').AsFloat,
                tblTransf.fieldbyname('PRODUTO').AsFloat,
                tblTransf.fieldbyname('COR').AsFloat,
                tblTransf.fieldbyname('TAMANHO').AsString,
                '1');

              preco_custo      := InformaUltimoPrecoCusto(tblTransf.fieldbyname('GRUPO').AsFloat,
                tblTransf.fieldbyname('SUBGRUPO').AsFloat,
                tblTransf.fieldbyname('PRODUTO').AsFloat,
                tblTransf.fieldbyname('COR').AsFloat,
                tblTransf.fieldbyname('TAMANHO').AsString,
                '1');

              codigofornecedor := BuscaFornecedor(tblTransf.fieldbyname('GRUPO').AsFloat,tblTransf.fieldbyname('SUBGRUPO').AsFloat,tblTransf.fieldbyname('PRODUTO').AsFloat);

                               //****************************************************************************
              DMcaixa.qInsereMovimento.parambyname('MO_SEQ').AsFloat     := seqmov2;
              DMcaixa.qInsereMovimento.parambyname('MO_GRUP').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_SUBG').AsFloat    := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_PROD').AsFloat    := tblTransf.fieldbyname('PRODUTO').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_CORE').AsFloat    := tblTransf.fieldbyname('COR').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_TAMA').AsString   := tblTransf.fieldbyname('TAMANHO').AsString;
              DMcaixa.qInsereMovimento.parambyname('MO_OTAM').AsInteger  := ordemtamanho;
              DMcaixa.qInsereMovimento.parambyname('MO_PCU1').AsFloat    := preco_custo;
              DMcaixa.qInsereMovimento.parambyname('MO_PVE1').AsFloat    := preco_venda;
              DMcaixa.qInsereMovimento.parambyname('MO_LOJA').AsFloat    := frm_principal.x_loja;
              DMcaixa.qInsereMovimento.parambyname('MO_NPED').AsFloat    := 0;
              DMcaixa.qInsereMovimento.parambyname('MO_DATA').AsDateTime := frm_principal.x_data_trabalho;
              DMcaixa.qInsereMovimento.parambyname('MO_TIPO').AsString   := 'E'; {entrada}
              DMcaixa.qInsereMovimento.parambyname('MO_MODE').AsString   := 'F'; {transferencia}
              DMcaixa.qInsereMovimento.parambyname('MO_ENTR').AsString   := '';
              DMcaixa.qInsereMovimento.parambyname('MO_NOTA').AsString   := edtDocumento.GetValor;
              DMcaixa.qInsereMovimento.parambyname('MO_FORN').AsFloat    := codigofornecedor;
              DMcaixa.qInsereMovimento.parambyname('MO_QTD1').AsFloat    := tblTransf.fieldbyname('QTDE').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_QTDR').AsFloat    := tblTransf.fieldbyname('QTDE').AsFloat;
              DMcaixa.qInsereMovimento.parambyname('MO_TIPZ').AsString   := '1';
              DMcaixa.qInsereMovimento.parambyname('MO_CLIE').AsString   := '';
              DMcaixa.qInsereMovimento.ExecSql;
                               //****************************************************************************
              VerificaExistenciaDoRegistroESTOQUE_LOJA(tblTransf.fieldbyname('GRUPO').AsFloat,
                tblTransf.fieldbyname('SUBGRUPO').AsFloat,
                tblTransf.fieldbyname('PRODUTO').AsFloat,
                tblTransf.fieldbyname('COR').AsFloat,
                tblTransf.fieldbyname('TAMANHO').AsString,
                frm_principal.x_loja);
                               //****************************************************************************
              EntradaItemEstoque (frm_principal.x_loja,
                '1',
                tblTransf.fieldbyname('GRUPO').AsFloat,
                tblTransf.fieldbyname('SUBGRUPO').AsFloat,
                tblTransf.fieldbyname('PRODUTO').AsFloat,
                tblTransf.fieldbyname('COR').AsFloat,
                tblTransf.fieldbyname('TAMANHO').AsString,
                tblTransf.fieldbyname('QTDE').AsFloat);

                               //... ALTERANDO DADOS DO ITEM DA TRANSFERENCIA
              clTransf := TClassAuxiliar.Create;
              clTransf.conect   ('ESTOQUE',self);
              clTransf.ClearSql;
              clTransf.AddParam ('SELECT IT_GRUP FROM ITENS_TRANSF_LOJA          ');
              clTransf.AddParam ('WHERE (IT_LOJ1=:lojaorigem) AND                ');
              clTransf.AddParam ('      (IT_TRAN=:documento) AND                 ');
              clTransf.AddParam ('      (IT_GRUP=:grupo) AND                     ');
              clTransf.AddParam ('      (IT_SUBG=:subgrupo) AND                  ');
              clTransf.AddParam ('      (IT_PROD=:produto) AND                   ');
              clTransf.AddParam ('      (IT_CORE=:cor) AND                       ');
              clTransf.AddParam ('      (IT_TAMA=:tamanho)                       ');
              clTransf.consulta.parambyname('lojaorigem').AsFloat     := edtLojaOrigem.GetValor;
              clTransf.consulta.parambyname('documento').AsFloat      := edtDocumento.GetValor;
              clTransf.consulta.parambyname('grupo').AsFloat          := tblTransf.fieldbyname('GRUPO').AsFloat;
              clTransf.consulta.parambyname('subgrupo').AsFloat       := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
              clTransf.consulta.parambyname('produto').AsFloat        := tblTransf.fieldbyname('PRODUTO').AsFloat;
              clTransf.consulta.parambyname('cor').AsFloat            := tblTransf.fieldbyname('COR').AsFloat;
              clTransf.consulta.parambyname('tamanho').AsString       := tblTransf.fieldbyname('TAMANHO').AsString;
              if (clTransf.Execute) then
              begin
                clTransf.ClearSql;
                clTransf.AddParam ('UPDATE ITENS_TRANSF_LOJA                       ');
                clTransf.AddParam ('SET    IT_MOV2=:movimento2,                    ');
                clTransf.AddParam ('       IT_CHEG=:datachegada,                   ');
                clTransf.AddParam ('       IT_QTDE=:qtdeentrada,                   ');
                clTransf.AddParam ('       IT_STAT=:status,                        ');
                clTransf.AddParam ('       IT_HORA=:IT_HORA                        ');
                clTransf.AddParam ('WHERE (IT_LOJ1=:lojaorigem) AND                ');
                clTransf.AddParam ('      (IT_TRAN=:documento) AND                 ');
                clTransf.AddParam ('      (IT_GRUP=:grupo) AND                     ');
                clTransf.AddParam ('      (IT_SUBG=:subgrupo) AND                  ');
                clTransf.AddParam ('      (IT_PROD=:produto) AND                   ');
                clTransf.AddParam ('      (IT_CORE=:cor) AND                       ');
                clTransf.AddParam ('      (IT_TAMA=:tamanho)                       ');
                clTransf.consulta.parambyname('lojaorigem').AsFloat     := edtLojaOrigem.GetValor;
                clTransf.consulta.parambyname('documento').AsFloat      := edtDocumento.GetValor;
                clTransf.consulta.parambyname('grupo').AsFloat          := tblTransf.fieldbyname('GRUPO').AsFloat;
                clTransf.consulta.parambyname('subgrupo').AsFloat       := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
                clTransf.consulta.parambyname('produto').AsFloat        := tblTransf.fieldbyname('PRODUTO').AsFloat;
                clTransf.consulta.parambyname('cor').AsFloat            := tblTransf.fieldbyname('COR').AsFloat;
                clTransf.consulta.parambyname('tamanho').AsString       := tblTransf.fieldbyname('TAMANHO').AsString;
                clTransf.consulta.parambyname('movimento2').AsFloat     := seqmov2;
                clTransf.consulta.parambyname('datachegada').AsDateTime := frm_principal.x_data_trabalho;
                clTransf.consulta.parambyname('status').AsString        := '2';
                clTransf.consulta.parambyname('qtdeentrada').AsFloat    := tblTransf.fieldbyname('QTDE').AsFloat;
                clTransf.consulta.parambyname('IT_HORA').AsDateTime  := Now();
                clTransf.Execute; {*}
              end
              else
              begin
                clTransf.ClearSql;
                clTransf.AddParam ('INSERT INTO ITENS_TRANSF_LOJA (IT_LOJ1,IT_TRAN,IT_TIPZ,IT_GRUP,IT_SUBG,IT_PROD,IT_CORE,IT_TAMA,IT_OTAM,IT_QTDE,                               ');
                clTransf.AddParam ('                               IT_MOV1,IT_MOV2,IT_DIGI,IT_EMBA,IT_CHEG,IT_STAT,IT_QTDS,IT_QTAE,IT_QTAS,IT_MOV3,IT_MOV4,IT_ACER,IT_SEQ,IT_HORA)');
                clTransf.AddParam ('VALUES  (:IT_LOJ1,:IT_TRAN,:IT_TIPZ,:IT_GRUP,:IT_SUBG,:IT_PROD,:IT_CORE,:IT_TAMA,:IT_OTAM,:IT_QTDE,                                           ');
                clTransf.AddParam ('         :IT_MOV1,:IT_MOV2,:IT_DIGI,:IT_EMBA,:IT_CHEG,:IT_STAT,:IT_QTDS,:IT_QTAE,:IT_QTAS,:IT_MOV3,:IT_MOV4,:IT_ACER,:IT_SEQ,:IT_HORA)        ');
                clTransf.consulta.parambyname('IT_LOJ1').AsFloat     := edtLojaOrigem.GetValor;
                clTransf.consulta.parambyname('IT_TRAN').AsFloat     := edtDocumento.GetValor;
                clTransf.consulta.parambyname('IT_GRUP').AsFloat     := tblTransf.fieldbyname('GRUPO').AsFloat;
                clTransf.consulta.parambyname('IT_SUBG').AsFloat     := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
                clTransf.consulta.parambyname('IT_PROD').AsFloat     := tblTransf.fieldbyname('PRODUTO').AsFloat;
                clTransf.consulta.parambyname('IT_CORE').AsFloat     := tblTransf.fieldbyname('COR').AsFloat;
                clTransf.consulta.parambyname('IT_OTAM').AsInteger   := ordemtamanho;
                clTransf.consulta.parambyname('IT_TAMA').AsString    := tblTransf.fieldbyname('TAMANHO').AsString;
                clTransf.consulta.parambyname('IT_MOV1').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_MOV2').AsFloat     := seqmov2;
                clTransf.consulta.parambyname('IT_DIGI').AsDateTime  := frm_principal.x_data_trabalho;
                clTransf.consulta.parambyname('IT_EMBA').AsDateTime  := strtodate('01/01/1900');
                clTransf.consulta.parambyname('IT_CHEG').AsDateTime  := frm_principal.x_data_trabalho;
                clTransf.consulta.parambyname('IT_STAT').AsString    := '2';
                clTransf.consulta.parambyname('IT_QTDS').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_QTDE').AsFloat     := tblTransf.fieldbyname('QTDE').AsFloat;
                clTransf.consulta.parambyname('IT_TIPZ').AsString    := '1'; //nao usado
                clTransf.consulta.parambyname('IT_QTAE').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_QTAS').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_MOV3').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_MOV4').AsFloat     := 0;
                clTransf.consulta.parambyname('IT_ACER').AsString    := '0';
                clTransf.consulta.parambyname('IT_SEQ').AsInteger    := tblTransf.fieldbyname('SEQ').AsInteger;
                clTransf.consulta.parambyname('IT_HORA').AsDateTime  := Now();
                clTransf.Execute; {*}
              end;
              clTransf.desconect;
              clTransf.Free;
                               //****************************************************************************

                               {---->}
              tbltransf.next;
              indGauge:=indGauge+1;
              frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
              frm_mensagem.gauge1.refresh;
            end;
            tbltransf.enablecontrols;
            tbltransf.first;

                          {************************************************************}
            if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
              continua:=true
            else
            if (frmDialogo.ExibirMensagem ('Deseja imprimir SLIP?'
              ,'Transferências',[mbYes,mbNo]
              ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              continua:=true
            else
              continua:=false;
            if (continua) then
              ImprimeSlipTransferencia(edtLojaOrigem.GetValor,
                edtDocumento.GetValor);

            Limparformulrio1.click; {*}

            frmDialogo.ExibirMensagem (' Transferência salva com sucesso! '
              ,'Transferências',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          end;
        end//CRITICAS - Evita que os itens aparecam
  ;
end;

procedure Tfrm_Transf_Entrada_Online.tblTransfAfterOpen(DataSet: TDataSet);
begin
  if (tblTransf.recordcount=0) then
  begin
    btnDiminuir.enabled  := false;
    btnExcluir.enabled   := false;
    btnSalvar.enabled    := false;
  end
  else
  begin
    btnDiminuir.enabled  := true;
    btnExcluir.enabled   := true;
    btnSalvar.enabled    := true;
  end;
end;

procedure Tfrm_Transf_Entrada_Online.tblTransfAfterClose(
  DataSet: TDataSet);
begin
  btnDiminuir.enabled := false;
  btnExcluir.enabled  := false;
  btnSalvar.enabled   := false;
end;

procedure Tfrm_Transf_Entrada_Online.btnDiminuirClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  seqAnt: Integer;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>'') then
    if (tblTransf.active) then
      if (tblTransf.recordcount<>0) then
      begin
        frmDialogo.posativ:=2;
        if (frmDialogo.ExibirMensagem ('Confirma exclusão da referência?'
          ,'Transferências',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          tblTransf.disablecontrols;
          tblTransf.next;
          if (not tblTransf.eof) then
          begin
            seqAnt := tblTransf.fieldbyname('SEQ').AsInteger;
            tblTransf.prior;
          end
          else
            seqAnt := -1;

          clAux := TClassAuxiliar.Create;
          clAux.conect   ('C:\NATIVA\VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('DELETE FROM TEMP_TRANSF.DBF             ');
          clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
          clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
          clAux.AddParam ('      (PRODUTO=:produto) AND            ');
          clAux.AddParam ('      (COR=:cor) AND                    ');
          clAux.AddParam ('      (TAMANHO=:tamanho)                ');
          clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
          clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
          clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
          clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
          clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
          clAux.Execute; {*}
          clAux.desconect;
          clAux.Free;

          if (pnQtdeTotal2.tag>0) then
          begin
            pnQtdeTotal2.tag := pnQtdeTotal2.tag - trunc(tblTransf.fieldbyname('QTDE').AsFloat);
            pnQtdeTotal2.caption := inttostr(pnQtdeTotal2.tag);
          end;

          pg1.activepageindex := 1;
          tblTransf.close;
          tblTransf.open;
          tblTransf.first;
          while (not tblTransf.eof) do
          begin
            if (seqAnt=tblTransf.fieldbyname('SEQ').AsInteger) then
              break;
            tblTransf.next;
          end;

          tblTransf.enablecontrols;

          grade2.setfocus;
        end;
      end;
end;
                        
procedure Tfrm_Transf_Entrada_Online.btnAumentaQtdeClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookMark;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>'') then
    if (tblTransf.active) then
      if (tblTransf.recordcount<>0) then
      begin
        book := tblTransf.GetBookMark;
        tblTransf.disablecontrols;

        clAux := TClassAuxiliar.Create;
        clAux.conect   ('C:\NATIVA\VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE TEMP_TRANSF.DBF                  ');
        clAux.AddParam ('SET    QTDE = QTDE + 1                  ');
        clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
        clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
        clAux.AddParam ('      (PRODUTO=:produto) AND            ');
        clAux.AddParam ('      (COR=:cor) AND                    ');
        clAux.AddParam ('      (TAMANHO=:tamanho)                ');
        clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

        if (pnQtdeTotal2.tag>0) then
        begin
          pnQtdeTotal2.tag := pnQtdeTotal2.tag + 1;
          pnQtdeTotal2.caption := inttostr(pnQtdeTotal2.tag);
        end;

        pg1.activepageindex := 1;
        tblTransf.close;
        tblTransf.open;

        tblTransf.Gotobookmark(book);
        tblTransf.Freebookmark(book);
        tblTransf.enablecontrols;

        grade2.setfocus;
      end;
end;

procedure Tfrm_Transf_Entrada_Online.btnDiminuiQtdeClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookmark;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtDocumento.GetValor<>'') then
    if (tblTransf.active) then
      if (tblTransf.recordcount<>0) then
        if (tblTransf.fieldbyname('QTDE').AsFloat>1) then
        begin
          book := tblTransf.GetBookmark;
          tblTransf.disablecontrols;

          clAux := TClassAuxiliar.Create;
          clAux.conect   ('C:\NATIVA\VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('UPDATE TEMP_TRANSF.DBF                  ');
          clAux.AddParam ('SET    QTDE = QTDE - 1                  ');
          clAux.AddParam ('WHERE (GRUPO=:grupo) AND                ');
          clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND          ');
          clAux.AddParam ('      (PRODUTO=:produto) AND            ');
          clAux.AddParam ('      (COR=:cor) AND                    ');
          clAux.AddParam ('      (TAMANHO=:tamanho)                ');
          clAux.consulta.parambyname('grupo').AsFloat    := tblTransf.fieldbyname('GRUPO').AsFloat;
          clAux.consulta.parambyname('subgrupo').AsFloat := tblTransf.fieldbyname('SUBGRUPO').AsFloat;
          clAux.consulta.parambyname('produto').AsFloat  := tblTransf.fieldbyname('PRODUTO').AsFloat;
          clAux.consulta.parambyname('cor').AsFloat      := tblTransf.fieldbyname('COR').AsFloat;
          clAux.consulta.parambyname('tamanho').AsString := tblTransf.fieldbyname('TAMANHO').AsString;
          clAux.Execute; {*}
          clAux.desconect;
          clAux.Free;

          if (pnQtdeTotal2.tag>0) then
          begin
            pnQtdeTotal2.tag := pnQtdeTotal2.tag - 1;
            pnQtdeTotal2.caption := inttostr(pnQtdeTotal2.tag);
          end;

          pg1.activepageindex := 1;
          tblTransf.close;
          tblTransf.open;

          tblTransf.Gotobookmark(book);
          tblTransf.Freebookmark(book);
          tblTransf.enablecontrols;

          grade2.setfocus;
        end;
end;

procedure Tfrm_Transf_Entrada_Online.btnExcluirClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (tblTransf.active) then
    if (tblTransf.recordcount<>0) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma exclusão de todo o lote?'
        ,'Transferências',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('C:\NATIVA\VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('DELETE FROM TEMP_TRANSF.DBF             ');
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

        pnQtdeTotal2.tag     := 0;
        pnQtdeTotal2.caption := '0';

        pg1.activepageindex := 1;
        tblTransf.close;
        tblTransf.open;
        grade2.setfocus;
      end;
    end;
end;

procedure Tfrm_Transf_Entrada_Online.pg1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  if Active then
  begin
    Control.Canvas.Font.Color := clWhite;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end
  else
  begin
    Control.Canvas.Font.Color := clBtnFace;
    Control.Canvas.Font.Style := [fsBold];
    Control.Canvas.Brush.Color := clTeal;
  end;

  Control.Canvas.FillRect( Rect );
  Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(Pg1.Pages[TabIndex]).Caption );
end;

function Tfrm_Transf_Entrada_Online.JaExisteTransfLojaComEsteNumero1(lojaorigem,documento: Real):Boolean;
var
  trstat: String;
  clAux1: TClassAuxiliar;
begin
  clAux1 := TClassAuxiliar.Create;
  clAux1.conect   (databaseprodutos,self);
  clAux1.ClearSql;
  clAux1.AddParam ('SELECT TR_NUME,TR_STAT FROM TRANSF_LOJA                  ');
  clAux1.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) AND ');
  clAux1.AddParam ('      (TR_LOJ2=:lojadest) AND (TR_STAT=:TR_STAT)         ');
  clAux1.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux1.consulta.parambyname('documento').AsFloat  := documento;
  clAux1.consulta.parambyname('lojadest').AsFloat  := frm_principal.x_loja;
  clAux1.consulta.parambyname('TR_STAT').AsFloat  := 2;
  result := clAux1.Execute;
  clAux1.desconect;
  clAux1.Free;
end;

function Tfrm_Transf_Entrada_Online.JaExisteTransfLojaComEsteNumero2(lojaorigem,documento,lojadest: Real):Boolean;
var
  trstat: String;
  clAux1: TClassAuxiliar;
begin
  clAux1 := TClassAuxiliar.Create;
  clAux1.conect   (databaseprodutos,self);
  clAux1.ClearSql;
  clAux1.AddParam ('SELECT TR_NUME,TR_STAT FROM TRANSF_LOJA                  ');
  clAux1.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) AND ');
  clAux1.AddParam ('      (TR_LOJ2<>:lojadest) AND (TR_STAT=:TR_STAT)        ');
  clAux1.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux1.consulta.parambyname('documento').AsFloat  := documento;
  clAux1.consulta.parambyname('lojadest').AsFloat  := frm_principal.x_loja;
  clAux1.consulta.parambyname('TR_STAT').AsFloat  := 2;
  result := clAux1.Execute;
  clAux1.desconect;
  clAux1.Free;
end;

end.
