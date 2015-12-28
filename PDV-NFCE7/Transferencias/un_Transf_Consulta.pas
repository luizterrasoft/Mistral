unit un_Transf_Consulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, StdCtrls, Mask, MaskEditOO, LabelOO, Menus, Db,
  DBTables, Grids, DBGrids, PanelOO, DBCtrls;

type
  Tfrm_Transf_Consulta = class(TForm)
    BotaoSair1: TBotaoSair;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    ds: TDataSource;
    grade: TDBGrid;
    Buscaritensdatransferncia1: TMenuItem;
    qItens: TQuery;
    Label1: TLabel;
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
    Panel1: TPanel;
    filtro1: TPanel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    edtDataEmba1: TMaskEditOO;
    botao2: TPanel;
    filtro2: TPanel;
    LabelOO7: TLabelOO;
    LabelOO8: TLabelOO;
    edtDataEmba2: TMaskEditOO;
    botao3: TPanel;
    filtro3: TPanel;
    LabelOO10: TLabelOO;
    LabelOO11: TLabelOO;
    edtDataCheg1: TMaskEditOO;
    botao4: TPanel;
    Imprimir1: TMenuItem;
    edtLoja1: TMaskEditOO;
    pnLoja1: TPanelOO;
    edtLoja3: TMaskEditOO;
    pnLoja3: TPanelOO;
    edtLoja2: TMaskEditOO;
    pnLoja2: TPanelOO;
    qItenscQTDE: TStringField;
    qItenscQTDS: TStringField;
    qItenscDIVERG: TStringField;
    lbtipz: TLabel;
    filtro4: TPanel;
    LabelOO3: TLabelOO;
    botao5: TPanel;
    edtLojaOrigem: TMaskEditOO;
    edtDocumento: TMaskEditOO;
    LabelOO4: TLabelOO;
    pnLojaOrigem: TPanelOO;
    edtDataEmba12: TMaskEditOO;
    LabelOO5: TLabelOO;
    edtDataCheg12: TMaskEditOO;
    LabelOO6: TLabelOO;
    LabelOO9: TLabelOO;
    edtDataEmba21: TMaskEditOO;
    btnExcluiReferencia: TPanel;
    btnImprimiSLIP: TPanel;
    btnImprimirTransfConsultadas: TPanel;
    N2: TMenuItem;
    ImprimirSLIPdatransfernciaselecionada1: TMenuItem;
    btnExcluiDocumento: TPanel;
    LabelOO16: TLabelOO;
    pnTotalEntradas: TPanelOO;
    pnTotalSaidas: TPanelOO;
    btnAcertaSaida: TPanel;
    btnAcertaEntrada: TPanel;
    qItensIT_ACER: TStringField;
    LabelOO15: TLabelOO;
    LabelOO12: TLabelOO;
    LabelOO14: TLabelOO;
    LabelOO13: TLabelOO;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDataEmba1Enter(Sender: TObject);
    procedure edtDataEmba1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure Buscaritensdatransferncia1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure qItensCalcFields(DataSet: TDataSet);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Imprimir1Click(Sender: TObject);
    procedure edtLoja1DblClick(Sender: TObject);
    procedure edtLoja1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja1Enter(Sender: TObject);
    procedure edtLoja2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja3DblClick(Sender: TObject);
    procedure edtLoja3Enter(Sender: TObject);
    procedure edtLoja3Exit(Sender: TObject);
    procedure edtLoja2Exit(Sender: TObject);
    procedure edtLoja1Exit(Sender: TObject);
    procedure edtLoja2Enter(Sender: TObject);
    procedure edtLoja2DblClick(Sender: TObject);
    procedure edtLojaOrigemExit(Sender: TObject);
    procedure edtLojaOrigemDblClick(Sender: TObject);
    procedure edtLojaOrigemEnter(Sender: TObject);
    procedure edtLojaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDocumentoEnter(Sender: TObject);
    procedure edtDataEmba12Enter(Sender: TObject);
    procedure edtDataEmba12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataCheg1Enter(Sender: TObject);
    procedure edtDataCheg12Enter(Sender: TObject);
    procedure edtDataCheg1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataCheg12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataEmba2Enter(Sender: TObject);
    procedure edtDataEmba21Enter(Sender: TObject);
    procedure edtDataEmba2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataEmba21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcluiReferenciaClick(Sender: TObject);
    procedure btnImprimirTransfConsultadasClick(Sender: TObject);
    procedure btnImprimiSLIPClick(Sender: TObject);
    procedure ImprimirSLIPdatransfernciaselecionada1Click(Sender: TObject);
    procedure btnExcluiDocumentoClick(Sender: TObject);
    procedure btnAcertaSaidaClick(Sender: TObject);
    procedure btnAcertaEntradaClick(Sender: TObject);
    procedure qItensAfterScroll(DataSet: TDataSet);
    procedure qItensAfterOpen(DataSet: TDataSet);
    procedure qItensAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    flagAcerto: Boolean;
    exibiu: Boolean;
    function RefrescaTabela:Boolean;
    procedure FocaFiltro;
    function ExisteItensParaTransf(loja,doc: Real):Boolean;
    function VerificaSeHouveInventarioPosteriomente(loja: Real; data: TDateTime;
      grupo,subgrupo,produto,cor: Real; tamanho: String):Boolean;
  end;

var
  frm_Transf_Consulta: Tfrm_Transf_Consulta;

implementation

uses F8Lojas, principal, funcoes1, funcoes2, procura, unMensagem, auxiliar,
  unDialogo, DM2, venda, mem_prnt, un_Transf_Acerto_Alteracao;

{$R *.DFM}

procedure Tfrm_Transf_Consulta.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Consulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (key=K_F7) then
    if (filtro1.visible) then
    begin
      filtro1.visible:=false;
      filtro2.visible:=true;
      filtro3.visible:=false;
      filtro4.visible:=false;
      edtLoja2.setfocus;
    end
    else
    if (filtro2.visible) then
    begin
      filtro1.visible:=false;
      filtro2.visible:=false;
      filtro3.visible:=true;
      filtro4.visible:=false;
      edtLoja3.setfocus;
    end
    else
    if (filtro3.visible) then
    begin
      filtro1.visible:=false;
      filtro2.visible:=false;
      filtro3.visible:=false;
      filtro4.visible:=true;
      edtLojaOrigem.setfocus;
    end
    else
    if (filtro4.visible) then
    begin
      filtro1.visible:=true;
      filtro2.visible:=false;
      filtro3.visible:=false;
      filtro4.visible:=false;
      edtLoja1.setfocus;
    end;
end;

procedure Tfrm_Transf_Consulta.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Consulta.FormActivate(Sender: TObject);
begin
  if (not exibiu) then
  begin
    if (flagAcerto) then
    begin
      caption           := 'Acerto de Transferências';
      btnExcluiReferencia.visible := true;
      btnExcluiDocumento.visible := true;
      btnImprimiSLIP.visible := true;
      ImprimirSLIPdatransfernciaselecionada1.enabled := true;
      btnAcertaEntrada.visible := true;
      btnAcertaSaida.visible := true;
    end
    else
    begin
      caption           := 'Consulta de Transferências';
      btnExcluiReferencia.visible := false;
      btnExcluiDocumento.visible := false;
      btnImprimiSLIP.visible := true;
      ImprimirSLIPdatransfernciaselecionada1.enabled := true;
      btnAcertaEntrada.visible := false;
      btnAcertaSaida.visible := false;
    end;
    qItens.databasename := databaseprodutos;
    exibiu:=true;
  end;
  FocaFiltro;
end;

procedure Tfrm_Transf_Consulta.FormCreate(Sender: TObject);
begin
  flagAcerto:=false;
  exibiu:=false;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataEmba12.setfocus;
  if (key=K_CIMA) then
    edtLoja1.setfocus;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Consulta.botao2Click(Sender: TObject);
begin
  Buscaritensdatransferncia1.click;
end;

procedure Tfrm_Transf_Consulta.Buscaritensdatransferncia1Click(Sender: TObject);
begin
  if (RefrescaTabela) then
    grade.setfocus;
end;

function Tfrm_Transf_Consulta.RefrescaTabela:Boolean;
var
  totale,totals: Integer;
  continua: Boolean;
begin
  with (qItens) do
  begin
          //***************************************************************
    if (filtro1.visible) then
    begin
      if (edtDataEmba1.GetValor<>strtodate('01/01/1900')) and
        (edtDataEmba12.GetValor<>strtodate('01/01/1900')) and
        (edtLoja1.GetValor<>0) then
      begin
        continua := true;
        if (continua) then
        begin
          sql.clear;
          sql.Add ('SELECT *                                            ');
          sql.Add ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA                  ');
          sql.Add ('WHERE (TR_LOJ2=:lojadestino) AND                    ');
          sql.Add ('      (IT_EMBA>=:dataembarque1) AND                 ');
          sql.Add ('      (IT_EMBA<=:dataembarque2) AND                 ');
          sql.Add ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME) AND   ');
          sql.Add ('      (TR_LOJ1=:loja OR TR_LOJ2=:loja)              ');
//                        sql.Add (' and  (TR_stat=:stat)              ');
          sql.Add ('ORDER BY TR_DATA,TR_NUME                            ');
          close;
          parambyname('loja').AsFloat             := frm_principal.x_loja;
          parambyname('lojadestino').AsFloat      := edtLoja1.GetValor;
          parambyname('dataembarque1').AsDateTime := edtDataEmba1.GetValor;
          parambyname('dataembarque2').AsDateTime := edtDataEmba12.GetValor;
//                        parambyname('stat').AsString := '1';
          open;
          first;
        end;
      end;
    end
    else
    if (filtro2.visible) then
    begin
      if (edtDataEmba2.GetValor<>strtodate('01/01/1900')) and
        (edtDataEmba21.GetValor<>strtodate('01/01/1900')) and
        (edtLoja2.GetValor<>0) then
      begin
        continua := true;
        if (continua) then
        begin
          sql.clear;
          sql.Add ('SELECT *                                            ');
          sql.Add ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA                  ');
          sql.Add ('WHERE (TR_LOJ1=:lojaorigem) AND                     ');
          sql.Add ('      (IT_EMBA>=:dataembarque1) AND                 ');
          sql.Add ('      (IT_EMBA<=:dataembarque2) AND                 ');
          sql.Add ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME) AND   ');
          sql.Add ('      (TR_LOJ1=:loja OR TR_LOJ2=:loja)              ');
//                         sql.Add (' and  (TR_stat=:stat)              ');
          sql.Add ('ORDER BY TR_DATA,TR_NUME                            ');
          close;
          parambyname('loja').AsFloat             := frm_principal.x_loja;
          parambyname('lojaorigem').AsFloat       := edtLoja2.GetValor;
          parambyname('dataembarque1').AsDateTime := edtDataEmba2.GetValor;
          parambyname('dataembarque2').AsDateTime := edtDataEmba21.GetValor;
//                         parambyname('stat').AsString := '1';
          open;
          first;
        end;
      end;
    end
    else
    if (filtro3.visible) then
    begin
      if (edtDataCheg1.GetValor<>strtodate('01/01/1900')) and
        (edtDataCheg12.GetValor<>strtodate('01/01/1900')) and
        (edtLoja3.GetValor<>0) then
      begin
        continua := true;
        if (continua) then
        begin
          sql.clear;
          sql.Add ('SELECT *                                            ');
          sql.Add ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA                  ');
          sql.Add ('WHERE (TR_LOJ2=:lojadestino) AND                    ');
          sql.Add ('      (IT_CHEG>=:datachegada1) AND                  ');
          sql.Add ('      (IT_CHEG<=:datachegada2) AND                  ');
          sql.Add ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME) AND   ');
          sql.Add ('      (TR_LOJ1=:loja OR TR_LOJ2=:loja)              ');
//                         sql.Add (' and  (TR_stat=:stat)              ');
          sql.Add ('ORDER BY TR_DATA,TR_NUME                            ');
          close;
          parambyname('loja').AsFloat            := frm_principal.x_loja;
          parambyname('lojadestino').AsFloat     := edtLoja3.GetValor;
          parambyname('datachegada1').AsDateTime := edtDataCheg1.GetValor;
          parambyname('datachegada2').AsDateTime := edtDataCheg12.GetValor;
//                         parambyname('stat').AsString := '2';
          open;
          first;
        end;
      end;
    end
    else
    if (filtro4.visible) then
      if (trim(edtDocumento.GetValor)<>'') then
      begin
        continua := true;
        if (continua) then
        begin
          sql.clear;
          sql.Add ('SELECT *                                            ');
          sql.Add ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA                  ');
          sql.Add ('WHERE                                               ');
          if (edtLojaOrigem.GetValor <> 0) then
            sql.Add('(TR_LOJ1=:lojaorigem) AND                     ');
          sql.Add ('      (IT_TRAN=:documento) AND                      ');
          sql.Add ('      (IT_LOJ1=TR_LOJ1) AND (IT_TRAN=TR_NUME) AND   ');
          sql.Add ('      (TR_LOJ1=:loja OR TR_LOJ2=:loja)              ');
//                         sql.Add (' and  (TR_stat=:stat)              ');
          sql.Add ('ORDER BY TR_DATA,TR_NUME                            ');
          close;
          parambyname('loja').AsFloat       := frm_principal.x_loja;
          if (edtLojaOrigem.GetValor <> 0) then
            parambyname('lojaorigem').AsFloat := edtLojaOrigem.GetValor;
          parambyname('documento').AsString := edtDocumento.GetValor;
//                         parambyname('stat').AsString := '1';
          open;
          first;
        end;
      end;
          //***************************************************************
    if (active) then
    begin
      disablecontrols;
      first;
      totale := 0;
      totals := 0;
      while (not eof) do
      begin
        totale := totale + fieldbyname('IT_QTDE').AsInteger;
        totals := totals + fieldbyname('IT_QTDS').AsInteger;
        next;
      end;
      pnTotalEntradas.caption := inttostr(totale);
      pnTotalSaidas.caption   := inttostr(totals);
      first;
      enablecontrols;
    end;
          //***************************************************************
    result := continua;
  end;
end;

procedure Tfrm_Transf_Consulta.Limparformulrio1Click(Sender: TObject);
begin
  edtLojaOrigem.text    := '';
  pnLojaOrigem.caption  := '';
  edtDocumento.text     := '';
  lbtipz.visible        := false;
  edtDataEmba1.text     := '';
  edtDataEmba12.text    := '';
  edtDataEmba2.text     := '';
  edtDataEmba21.text    := '';
  edtDataCheg1.text     := '';
  edtDataCheg12.text    := '';
  edtLoja1.text         := '';
  pnLoja1.caption       := '';
  edtLoja2.text         := '';
  pnLoja2.caption       := '';
  edtLoja3.text         := '';
  pnLoja3.caption       := '';
  pnTotalEntradas.caption := '';
  pnTotalSaidas.caption   := '';
  qItens.close;
  FocaFiltro;
end;

procedure Tfrm_Transf_Consulta.qItensCalcFields(DataSet: TDataSet);
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
      begin
        fieldbyname('cDATAEMBARQUE').AsString := form_data(fieldbyname('IT_EMBA').AsDateTime);
        fieldbyname('cQTDS').AsString := floattostr(fieldbyname('IT_QTDS').AsFloat);
      end
      else
      begin
        fieldbyname('cDATAEMBARQUE').AsString := '          ';
        fieldbyname('cQTDS').AsString := ' - ';
      end;
    if (fieldbyname('cDATACHEGADA').IsNull) then
      if (fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
      begin
        fieldbyname('cDATACHEGADA').AsString := form_data(fieldbyname('IT_CHEG').AsDateTime);
        fieldbyname('cQTDE').AsString := floattostr(fieldbyname('IT_QTDE').AsFloat);
      end
      else
      begin
        fieldbyname('cDATACHEGADA').AsString := '          ';
        fieldbyname('cQTDE').AsString := ' - ';
      end;
    if (fieldbyname('cSTATUS').IsNull) then
    begin
      if (fieldbyname('IT_STAT').AsString='0') then
        fieldbyname('cSTATUS').AsString := 'DIGITADO'
      else
      if (fieldbyname('IT_STAT').AsString='1') then
        fieldbyname('cSTATUS').AsString := 'SAIDA'
      else
      if (fieldbyname('IT_STAT').AsString='2') then
        fieldbyname('cSTATUS').AsString := 'ENTRADA';
      if (fieldbyname('IT_ACER').AsString='1') then
        fieldbyname('cSTATUS').AsString := 'ACERTADO'
      else
      if (fieldbyname('IT_ACER').AsString='2') then
        fieldbyname('cSTATUS').AsString := 'ACERTADO'
      else
      if (fieldbyname('IT_ACER').AsString='3') then
        fieldbyname('cSTATUS').AsString := 'ACERTADO'
      else
      if (fieldbyname('IT_ACER').AsString='4') then
        fieldbyname('cSTATUS').AsString := 'ACERTADO';
    end;
    if (fieldbyname('cDIVERG').IsNull) then
      if (fieldbyname('IT_ACER').AsString = '0') then
      begin
        if (fieldbyname('IT_EMBA').AsDateTime<>strtodate('01/01/1900')) and
          (fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
          if (fieldbyname('IT_QTDS').AsFloat<>fieldbyname('IT_QTDE').AsFloat) then
            fieldbyname('cDIVERG').AsString := 'X'//exibe a divergencia

          else
            fieldbyname('cDIVERG').AsString := ' ';
      end
      else
      if (fieldbyname('IT_ACER').AsString = '1') then //ambos estao certos
        fieldbyname('cDIVERG').AsString := 'A'
      else
      if (fieldbyname('IT_ACER').AsString = '2') then //pela origem
        fieldbyname('cDIVERG').AsString := 'O'
      else
      if (fieldbyname('IT_ACER').AsString = '3') then //pelo destino
        fieldbyname('cDIVERG').AsString := 'D'
      else
      if (fieldbyname('IT_ACER').AsString = '4') then
        fieldbyname('cDIVERG').AsString := 'C';
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

procedure Tfrm_Transf_Consulta.gradeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F2) then
    FocaFiltro;
  if (Shift=[ssCtrl]) then
  begin
    if (key=K_DELETE) then
      if (btnExcluiDocumento.visible) then
        btnExcluiDocumentoClick(btnExcluiDocumento);
    if (key=Ord('S')) or (key=Ord('s')) then
      if (btnAcertaSaida.enabled) then
        btnAcertaSaidaClick(btnAcertaSaida);
    if (key=Ord('E')) or (key=Ord('e')) then
      if (btnAcertaEntrada.enabled) then
        btnAcertaEntradaClick(btnAcertaEntrada);
  end
  else
  if (key=K_DELETE) then
    if (btnExcluiReferencia.visible) then
      btnExcluiReferenciaClick(btnExcluiReferencia);
end;

procedure Tfrm_Transf_Consulta.Imprimir1Click(Sender: TObject);
var
  situacao,codigo_barras: String;
  descricao,data: String;
  total_merc,qtde,qtds: Real;
  total_merc0,total_merc1,total_merc2: Real;
  indGauge,totGauge: Integer;
  linha,divergencia: String;
  lojaOrigemAnt,documentoAnt: Real;
  data_saida,data_chegada: String;
  book: TBookMark;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      with (frm_mem_print) do
      begin
                 {configurando o gerador de relatorios}
        PrepareReport;
        frm_principal.x_col_impressao := 80;
        frm_principal.x_comando       := '12c';
        frm_principal.x_arq_impressao := 'v03.rel';
        frm_principal.x_tam_fonte     := 8;
        Title:= 'LISTAGEM DE VENDAS P/ LOJA/VENDEDOR';

        qItens.disablecontrols;
        if (filtro1.visible) then
        begin
          frm_mem_print.Addline('- Tranferencias embarcadas com destino a loja:'+form_nz(edtLoja1.GetValor,2)+'/'+ProcuraNomeLoja(edtLoja1.GetValor,self));
          frm_mem_print.Addline('Data de embarque..: '+form_data(edtDataEmba1.GetValor)+' ate '+form_data(edtDataEmba12.GetValor));
        end
        else
        if (filtro2.visible) then
        begin
          frm_mem_print.Addline('- Tranferencias embarcadas a partir da loja:'+form_nz(edtLoja2.GetValor,2)+'/'+ProcuraNomeLoja(edtLoja2.GetValor,self));
          frm_mem_print.Addline('Data de embarque..: '+form_data(edtDataEmba2.GetValor)+' ate '+form_data(edtDataEmba21.GetValor));

        end
        else
        if (filtro3.visible) then
        begin
          frm_mem_print.Addline('- Tranferencias que chegaram na loja:'+form_nz(edtLoja3.GetValor,2)+'/'+ProcuraNomeLoja(edtLoja3.GetValor,self));
          frm_mem_print.Addline('Data de chegada..: '+form_data(edtDataCheg1.GetValor)+' ate '+form_data(edtDataCheg12.GetValor));
        end;
        frm_mem_print.Addline(form_tc2('-',132,'-'));
        frm_mem_print.Addline('Loja|Numero    |Loja|                  |                                   |Qtde |Qtde |Ultima   |Data      |Data');
        frm_mem_print.Addline('Orig|Documento |Dest|Codigo de barras  |Descricao                          |Saida|Entr.|Situacao |Embarque  |Chegada');
        frm_mem_print.Addline(form_tc2('-',132,'-'));

        mostra_mensagem ('Imprimindo consulta...Aguarde!');
        frm_mensagem.painel.visible:=true;
        frm_mensagem.gauge1.progress:=0;
        book := qItens.GetBookMark;
        indGauge:=0;
        totGauge:=qItens.recordcount;
        qItens.first;
        total_merc0:=0.00;
        total_merc1:=0.00;
        total_merc2:=0.00;
        lojaOrigemAnt := -1;
        documentoAnt  := -1;
        while (not qItens.eof) do
        begin
          codigo_barras := RetornaCodigoDeBarrasDoItem(qItens.fieldbyname('IT_GRUP').AsFloat,
            qItens.fieldbyname('IT_SUBG').AsFloat,
            qItens.fieldbyname('IT_PROD').AsFloat,
            qItens.fieldbyname('IT_CORE').AsFloat,
            qItens.fieldbyname('IT_TAMA').AsString);
          data := '          ';
          qtds := qItens.fieldbyname('IT_QTDS').AsFloat;
          qtde := qItens.fieldbyname('IT_QTDE').AsFloat;
          total_merc1 := total_merc1 + qtds;
          total_merc2 := total_merc2 + qtde;
          if (qItens.fieldbyname('IT_STAT').AsString='0') then
          begin
            situacao:='DIGITADO ';
            data:=form_data(qItens.fieldbyname('IT_DIGI').AsDateTime);
            total_merc0 := total_merc0 + qtds;
          end
          else
          if (qItens.fieldbyname('IT_STAT').AsString='1') then
          begin
            situacao:='SAIDA    ';
            data:=form_data(qItens.fieldbyname('IT_EMBA').AsDateTime);
          end
          else
          if (qItens.fieldbyname('IT_STAT').AsString='2') then
          begin
            situacao:='ENTRADA  ';
            data:=form_data(qItens.fieldbyname('IT_CHEG').AsDateTime);
          end;
          if (qItens.fieldbyname('IT_EMBA').AsDateTime<>strtodate('01/01/1900')) then
            data_saida:=form_data(qItens.fieldbyname('IT_EMBA').AsDateTime)
          else
            data_saida:='          ';
          if (qItens.fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
            data_chegada:=form_data(qItens.fieldbyname('IT_CHEG').AsDateTime)
          else
            data_chegada:='          ';
          descricao := ProcuraNomeProdutos_1 (qItens.fieldbyname('IT_GRUP').AsFloat,
            qItens.fieldbyname('IT_SUBG').AsFloat,
            qItens.fieldbyname('IT_PROD').AsFloat,self);
          if (qItens.fieldbyname('cDIVERG').AsString='X') then
            divergencia := '-DIVERG!!!!'
          else
          if (qItens.fieldbyname('cDIVERG').AsString='O') then
            divergencia := '-ACERT!Orig'
          else
          if (qItens.fieldbyname('cDIVERG').AsString='D') then
            divergencia := '-ACERT!Dest'
          else
          if (qItens.fieldbyname('cDIVERG').AsString='A') then
            divergencia := '-ACERT!Ambo'
          else
          if (qItens.fieldbyname('cDIVERG').AsString='C') then
            divergencia := '-ACERT!Comp'
          else
            divergencia := '-OK';
          if (lojaOrigemAnt = qItens.fieldbyname('TR_LOJ1').AsFloat) and
            (documentoAnt  = qItens.fieldbyname('TR_NUME').AsFloat) then
            linha := form_t(' ',(2+10+2+5))
          else
          begin
            if (lojaOrigemAnt<>-1) then
              frm_mem_print.AddLine (form_tc2('-',132,'-'));
            linha := form_nz (qItens.fieldbyname('TR_LOJ1').AsFloat,2)  +' '+
              form_n  (qItens.fieldbyname('TR_NUME').AsFloat,10) +'   '+
              form_nz (qItens.fieldbyname('TR_LOJ2').AsFloat,2)  +' ';
            lojaOrigemAnt := qItens.fieldbyname('TR_LOJ1').AsFloat;
            documentoAnt  := qItens.fieldbyname('TR_NUME').AsFloat;
          end;
          frm_mem_print.AddLine ('  '  +
            linha +
            form_t  (codigo_barras,18)                         +' '+
            form_t  (descricao,36)                             +' '+
            form_n  (qtds,5)                                   +' '+
            form_n  (qtde,5)                                   +' '+
            situacao                                           +' '+
            data_saida                                         +' '+
            data_chegada                                       +' '+
            divergencia);

                      {---->}
          qItens.next;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        frm_mem_print.Addline(form_tc2('-',132,'-'));
        frm_mem_print.Addline(' - Total de mercadorias -');
        frm_mem_print.Addline(' 1) SAIDAS.........: '+form_n(total_merc1,5));
        frm_mem_print.Addline(' 2) ENTRADAS.......: '+form_n(total_merc2,5));
        frm_mem_print.Addline(form_tc2('-',132,'-'     ));

                 {salto de pagina}
        if (frm_principal.x_salto) then
          AddLine(chr(18)+chr(12))
        else
          AddLine(chr(18));

        qItens.GotoBookMark(book);
        qItens.FreeBookMark(book);
        qItens.enablecontrols;
        grade.setfocus;
      end;
      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
    end;
end;

procedure Tfrm_Transf_Consulta.edtLoja1DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja1;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Consulta.edtLoja1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataEmba1.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja1;
      showmodal;
    end;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtLoja1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtLoja2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataEmba2.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja2;
      showmodal;
    end;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtLoja3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataCheg1.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja3;
      showmodal;
    end;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtLoja3DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja3;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Consulta.edtLoja3Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtLoja3Exit(Sender: TObject);
begin
  if (edtLoja3.GetValor<>0) then
  begin
    edtLoja3.text:=form_nz(edtLoja3.GetValor,2);
    pnLoja3.caption:=ProcuraNomeLoja(edtLoja3.GetValor,self);
  end
  else
    pnLoja3.caption:='';
end;

procedure Tfrm_Transf_Consulta.edtLoja2Exit(Sender: TObject);
begin
  if (edtLoja2.GetValor<>0) then
  begin
    edtLoja2.text:=form_nz(edtLoja2.GetValor,2);
    pnLoja2.caption:=ProcuraNomeLoja(edtLoja2.GetValor,self);
  end
  else
    pnLoja2.caption:='';
end;

procedure Tfrm_Transf_Consulta.edtLoja1Exit(Sender: TObject);
begin
  if (edtLoja1.GetValor<>0) then
  begin
    edtLoja1.text:=form_nz(edtLoja1.GetValor,2);
    pnLoja1.caption:=ProcuraNomeLoja(edtLoja1.GetValor,self);
  end
  else
    pnLoja1.caption:='';
end;

procedure Tfrm_Transf_Consulta.edtLoja2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtLoja2DblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja2;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Consulta.edtLojaOrigemExit(Sender: TObject);
begin
  if (edtLojaOrigem.GetValor<>0) then
  begin
    edtLojaOrigem.text:=form_nz(edtLojaOrigem.GetValor,2);
    pnLojaOrigem.caption:=ProcuraNomeLoja(edtLojaOrigem.GetValor,self);
  end
  else
    pnLojaOrigem.caption:='';
end;

procedure Tfrm_Transf_Consulta.edtLojaOrigemDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLojaOrigem;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Consulta.edtLojaOrigemEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtLojaOrigemKeyDown(Sender: TObject;
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

procedure Tfrm_Transf_Consulta.edtDocumentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtLojaOrigem.setfocus;
  if (key=K_F2) then
    grade.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtDocumentoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Consulta.FocaFiltro;
begin
  if (filtro1.visible) then
    edtLoja1.setfocus
  else
  if (filtro2.visible) then
    edtLoja2.setfocus
  else
  if (filtro3.visible) then
    edtLoja3.setfocus
  else
  if (filtro4.visible) then
    edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba12Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall; 
end;

procedure Tfrm_Transf_Consulta.edtDataEmba12KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtDataEmba1.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtDataCheg1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtDataCheg12Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtDataCheg1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtLoja3.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataCheg12.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtDataCheg12KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtDataCheg1.setfocus;
  if (key=K_ENTER) then
    botao2Click(Sender);
end;

procedure Tfrm_Transf_Consulta.edtDataEmba2Enter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba21Enter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtLoja2.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataEmba21.setfocus;
end;

procedure Tfrm_Transf_Consulta.edtDataEmba21KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtDataEmba2.setfocus;
  if (key=K_ENTER) then
    botao2Click(Sender);
end;

procedure Tfrm_Transf_Consulta.btnExcluiReferenciaClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  loja,seqmov,qtde: Real;
  datamovimento: TDateTime;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma exclusão da referência?'
        ,'Transferências',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
                    //... EXCLUSAO DE ITENS
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('DELETE FROM ITENS_TRANSF_LOJA  ');
        clAux.AddParam ('WHERE (IT_LOJ1=:loja1) AND     ');
        clAux.AddParam ('      (IT_TRAN=:tran) AND      ');
        clAux.AddParam ('      (IT_GRUP=:grupo) AND     ');
        clAux.AddParam ('      (IT_SUBG=:subgrupo) AND  ');
        clAux.AddParam ('      (IT_PROD=:produto) AND   ');
        clAux.AddParam ('      (IT_CORE=:cor) AND       ');
        clAux.AddParam ('      (IT_TAMA=:tamanho)       ');
        clAux.consulta.parambyname('loja1').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
        clAux.consulta.parambyname('tran').AsFloat     := qItens.fieldbyname('IT_TRAN').AsFloat;
        clAux.consulta.parambyname('grupo').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := qItens.fieldbyname('IT_SUBG').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := qItens.fieldbyname('IT_PROD').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := qItens.fieldbyname('IT_CORE').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := qItens.fieldbyname('IT_TAMA').AsString;
        clAux.Execute; {*}

                    {... Excluindo o documento caso nao tenha mais nenhuma REFERENCIA}
        if (not ExisteItensParaTransf(qItens.fieldbyname('IT_LOJ1').AsFloat,
          qItens.fieldbyname('IT_TRAN').AsFloat)) then
        begin
          clAux.ClearSql;
          clAux.AddParam ('DELETE FROM TRANSF_LOJA        ');
          clAux.AddParam ('WHERE (TR_LOJ1=:loja1) AND     ');
          clAux.AddParam ('      (TR_NUME=:doc)           ');
          clAux.consulta.parambyname('loja1').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
          clAux.consulta.parambyname('doc').AsFloat      := qItens.fieldbyname('IT_TRAN').AsFloat;
          clAux.Execute; {*}
        end;

                    //*************************************************************************
                    {... SOMENTE PARA O CASO DO SISTEMA ESTAR ONLINE}
                    //*************************************************************************
        if (frm_principal.x_online) then
        begin
                        //Ajustando a saida, caso ela tenha sido dada
          if (qItens.fieldbyname('IT_EMBA').AsDateTime<>strtodate('01/01/1900')) then
          begin
            loja    := qItens.fieldbyname('TR_LOJ1').AsFloat;
            seqmov  := qItens.fieldbyname('IT_MOV1').AsFloat;
            qtde    := qItens.fieldbyname('IT_QTDS').AsFloat;

                             {...}
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('ESTOQUE',self);
            clAux.ClearSql;
            clAux.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
            clAux.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
            clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
            if (clAux.Execute) then
            begin
              datamovimento := clAux.result('MO_DATA');

              clAux.ClearSql;
              clAux.AddParam ('DELETE FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
              clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
              clAux.Execute; {*}

                                  //...
              if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
                qItens.fieldbyname('IT_GRUP').AsFloat,
                qItens.fieldbyname('IT_SUBG').AsFloat,
                qItens.fieldbyname('IT_PROD').AsFloat,
                qItens.fieldbyname('IT_CORE').AsFloat,
                qItens.fieldbyname('IT_TAMA').AsString)) then
                EntradaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qtde);
            end;
          end;

                        //Ajustando a entrada, caso ela tenha sido dada
          if (qItens.fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
          begin
            loja    := qItens.fieldbyname('TR_LOJ2').AsFloat;
            seqmov  := qItens.fieldbyname('IT_MOV2').AsFloat;
            qtde    := qItens.fieldbyname('IT_QTDE').AsFloat;

                             {...}
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('ESTOQUE',self);
            clAux.ClearSql;
            clAux.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
            clAux.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
            clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
            if (clAux.Execute) then
            begin
              datamovimento := clAux.result('MO_DATA');

              clAux.ClearSql;
              clAux.AddParam ('DELETE FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
              clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
              clAux.Execute; {*}

                                  //...
              if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
                qItens.fieldbyname('IT_GRUP').AsFloat,
                qItens.fieldbyname('IT_SUBG').AsFloat,
                qItens.fieldbyname('IT_PROD').AsFloat,
                qItens.fieldbyname('IT_CORE').AsFloat,
                qItens.fieldbyname('IT_TAMA').AsString)) then
                SaidaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qtde);
            end;
          end;
        end;
                    //*************************************************************************
                    
        clAux.desconect;
        clAux.Free;

                    {...}
        RefrescaTabela;
        grade.setfocus;
        qItens.first;
      end;
    end;
end;

function Tfrm_Transf_Consulta.ExisteItensParaTransf(loja,doc: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT IT_LOJ1 FROM ITENS_TRANSF_LOJA      ');
  clAux.AddParam ('WHERE (IT_LOJ1=:loja1) AND                 ');
  clAux.AddParam ('      (IT_TRAN=:tran)                      ');
  clAux.consulta.parambyname('loja1').AsFloat := loja;
  clAux.consulta.parambyname('tran').AsFloat  := doc;
  result := clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Transf_Consulta.btnImprimirTransfConsultadasClick(Sender: TObject);
begin
  Imprimir1.click;
end;

procedure Tfrm_Transf_Consulta.btnImprimiSLIPClick(Sender: TObject);
begin
  ImprimirSLIPdatransfernciaselecionada1.click;
end;

procedure Tfrm_Transf_Consulta.ImprimirSLIPdatransfernciaselecionada1Click(Sender: TObject);
var
  continua: Boolean;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
        continua:=true
      else
      if (frmDialogo.ExibirMensagem ('Confirma impressão do SLIP?'
        ,'Transferências',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        continua:=true
      else
        continua:=false;
      if (continua) then
        ImprimeSlipTransferencia(qItens.fieldbyname('IT_LOJ1').AsFloat,
          qItens.fieldbyname('IT_TRAN').AsFloat);
    end;
end;

procedure Tfrm_Transf_Consulta.btnExcluiDocumentoClick(Sender: TObject);
var
  clTransf,clAux: TClassAuxiliar;
  loja,seqmov,qtde: Real;
  datamovimento: TDateTime;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma exclusão do documento?'
        ,'Transferências',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
                    //Selecionando os itens das transferencias *********************************
        clTransf := TClassAuxiliar.Create;
        clTransf.conect   (databaseprodutos,self);
        clTransf.ClearSql;
        clTransf.AddParam ('SELECT *                            ');
        clTransf.AddParam ('FROM ITENS_TRANSF_LOJA,TRANSF_LOJA  ');
        clTransf.AddParam ('WHERE (IT_LOJ1=:loja1) AND          ');
        clTransf.AddParam ('      (IT_TRAN=:tran) AND           ');
        clTransf.AddParam ('      (IT_LOJ1=TR_LOJ1) AND         ');
        clTransf.AddParam ('      (IT_TRAN=TR_NUME)             ');
        clTransf.consulta.parambyname('loja1').AsFloat := qItens.fieldbyname('IT_LOJ1').AsFloat;
        clTransf.consulta.parambyname('tran').AsFloat  := qItens.fieldbyname('IT_TRAN').AsFloat;
        clTransf.Execute; {*}
        clTransf.first;
        while (not clTransf.eof) do
        begin
                         //... EXCLUSAO DE ITENS
          clAux := TClassAuxiliar.Create;
          clAux.conect   (databaseprodutos,self);
          clAux.ClearSql;
          clAux.AddParam ('DELETE FROM ITENS_TRANSF_LOJA  ');
          clAux.AddParam ('WHERE (IT_LOJ1=:loja1) AND     ');
          clAux.AddParam ('      (IT_TRAN=:tran) AND      ');
          clAux.AddParam ('      (IT_GRUP=:grupo) AND     ');
          clAux.AddParam ('      (IT_SUBG=:subgrupo) AND  ');
          clAux.AddParam ('      (IT_PROD=:produto) AND   ');
          clAux.AddParam ('      (IT_CORE=:cor) AND       ');
          clAux.AddParam ('      (IT_TAMA=:tamanho)       ');
          clAux.consulta.parambyname('loja1').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
          clAux.consulta.parambyname('tran').AsFloat     := qItens.fieldbyname('IT_TRAN').AsFloat;
          clAux.consulta.parambyname('grupo').AsFloat    := clTransf.Result('IT_GRUP');
          clAux.consulta.parambyname('subgrupo').AsFloat := clTransf.Result('IT_SUBG');
          clAux.consulta.parambyname('produto').AsFloat  := clTransf.Result('IT_PROD');
          clAux.consulta.parambyname('cor').AsFloat      := clTransf.Result('IT_CORE');
          clAux.consulta.parambyname('tamanho').AsString := clTransf.Result('IT_TAMA');
          clAux.Execute; {*}

                         //*************************************************************************
                         {... SOMENTE PARA O CASO DO SISTEMA ESTAR ONLINE}
                         //*************************************************************************
          if (frm_principal.x_online) then
          begin
                              //Ajustando a saida, caso ela tenha sido dada
            if (clTransf.Result('IT_EMBA')<>strtodate('01/01/1900')) then
            begin
              loja    := clTransf.Result('TR_LOJ1');
              seqmov  := clTransf.Result('IT_MOV1');
              qtde    := clTransf.Result('IT_QTDS');

                                   {...}
              clAux := TClassAuxiliar.Create;
              clAux.conect   ('ESTOQUE',self);
              clAux.ClearSql;
              clAux.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
              clAux.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
              clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
              if (clAux.Execute) then
              begin
                datamovimento := clAux.result('MO_DATA');

                clAux.ClearSql;
                clAux.AddParam ('DELETE FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
                clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
                clAux.Execute; {*}

                                        //...
                if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
                  clTransf.Result('IT_GRUP'),
                  clTransf.Result('IT_SUBG'),
                  clTransf.Result('IT_PROD'),
                  clTransf.Result('IT_CORE'),
                  clTransf.Result('IT_TAMA'))) then
                  EntradaItemEstoque (loja,
                    clTransf.Result('TR_TIPZ'),
                    clTransf.Result('IT_GRUP'),
                    clTransf.Result('IT_SUBG'),
                    clTransf.Result('IT_PROD'),
                    clTransf.Result('IT_CORE'),
                    clTransf.Result('IT_TAMA'),
                    qtde);
              end;
            end;

                              //Ajustando a entrada, caso ela tenha sido dada
            if (qItens.fieldbyname('IT_CHEG').AsDateTime<>strtodate('01/01/1900')) then
            begin
              loja    := clTransf.Result('TR_LOJ2');
              seqmov  := clTransf.Result('IT_MOV2');
              qtde    := clTransf.Result('IT_QTDE');

                                   {...}
              clAux := TClassAuxiliar.Create;
              clAux.conect   ('ESTOQUE',self);
              clAux.ClearSql;
              clAux.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
              clAux.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
              clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
              if (clAux.Execute) then
              begin
                datamovimento := clAux.result('MO_DATA');

                clAux.ClearSql;
                clAux.AddParam ('DELETE FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
                clAux.consulta.parambyname('seqmov').AsFloat := seqmov;
                clAux.Execute; {*}

                                        //...
                if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
                  clTransf.Result('IT_GRUP'),
                  clTransf.Result('IT_SUBG'),
                  clTransf.Result('IT_PROD'),
                  clTransf.Result('IT_CORE'),
                  clTransf.Result('IT_TAMA'))) then
                  SaidaItemEstoque (loja,
                    clTransf.Result('TR_TIPZ'),
                    clTransf.Result('IT_GRUP'),
                    clTransf.Result('IT_SUBG'),
                    clTransf.Result('IT_PROD'),
                    clTransf.Result('IT_CORE'),
                    clTransf.Result('IT_TAMA'),
                    qtde);
              end;
            end;
          end;
                         //*************************************************************************

          clAux.desconect;
          clAux.Free;

                         {--->}
          clTransf.next;
        end;

                    //Excluindo o documento inteiro
        clTransf.ClearSql;
        clTransf.AddParam ('DELETE FROM TRANSF_LOJA        ');
        clTransf.AddParam ('WHERE (TR_LOJ1=:loja1) AND     ');
        clTransf.AddParam ('      (TR_NUME=:doc)           ');
        clTransf.consulta.parambyname('loja1').AsFloat := qItens.fieldbyname('IT_LOJ1').AsFloat;
        clTransf.consulta.parambyname('doc').AsFloat   := qItens.fieldbyname('IT_TRAN').AsFloat;
        clTransf.Execute; {*}

        clTransf.desconect;
        clTransf.Free;

                    {...}
        RefrescaTabela;
        grade.setfocus;
        qItens.first;
      end;
    end;
end;

function Tfrm_Transf_Consulta.VerificaSeHouveInventarioPosteriomente(loja: Real; data: TDateTime;
  grupo,subgrupo,produto,cor: Real; tamanho: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MO_SEQ FROM MOVIMENTO   ');
  clAux.AddParam ('WHERE (MO_LOJA=:loja) AND      ');
  clAux.AddParam ('      (MO_TIPO=:tipo) AND      ');
  clAux.AddParam ('      (MO_MODE=:mode) AND      ');
  clAux.AddParam ('      (MO_GRUP=:grupo) AND     ');
  clAux.AddParam ('      (MO_SUBG=:subgrupo) AND  ');
  clAux.AddParam ('      (MO_PROD=:produto) AND   ');
  clAux.AddParam ('      (MO_CORE=:cor) AND       ');
  clAux.AddParam ('      (MO_TAMA=:tamanho) AND   ');
  clAux.AddParam ('      (MO_DATA>=:data)         ');
  clAux.consulta.parambyname('loja').AsFloat      := loja;
  clAux.consulta.parambyname('tipo').AsString     := 'E'; //entrada
  clAux.consulta.parambyname('mode').AsString     := 'I'; //inventario
  clAux.consulta.parambyname('grupo').AsFloat     := grupo;
  clAux.consulta.parambyname('subgrupo').AsFloat  := subgrupo;
  clAux.consulta.parambyname('produto').AsFloat   := produto;
  clAux.consulta.parambyname('cor').AsFloat       := cor;
  clAux.consulta.parambyname('tamanho').AsString  := tamanho;
  clAux.consulta.parambyname('data').AsDateTime   := data;
  result := clAux.Execute; {*}
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Transf_Consulta.btnAcertaSaidaClick(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  book: Tbookmark;
  loja,seqmov,qtde: Real;
  datamovimento: TDateTime;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      Application.CreateForm(Tfrm_Transf_Acerto_Alteracao, frm_Transf_Acerto_Alteracao);
      frm_Transf_Acerto_Alteracao.caption := 'Alterar QTDE SAÍDA';
      frm_Transf_Acerto_Alteracao.tecla   := 27;
      frm_Transf_Acerto_Alteracao.edtQtdeAtual.text := floattostr(qItens.fieldbyname('IT_QTDS').AsFloat);
      frm_Transf_Acerto_Alteracao.showmodal;
      if (frm_Transf_Acerto_Alteracao.tecla=13) then
      begin
        book := qItens.GetBookmark;
        qItens.disablecontrols;

        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE ITENS_TRANSF_LOJA       ');
        clAux.AddParam ('SET    IT_QTDS=:novaqtde       ');
        clAux.AddParam ('WHERE (IT_LOJ1=:loja1) AND     ');
        clAux.AddParam ('      (IT_TRAN=:tran) AND      ');
        clAux.AddParam ('      (IT_GRUP=:grupo) AND     ');
        clAux.AddParam ('      (IT_SUBG=:subgrupo) AND  ');
        clAux.AddParam ('      (IT_PROD=:produto) AND   ');
        clAux.AddParam ('      (IT_CORE=:cor) AND       ');
        clAux.AddParam ('      (IT_TAMA=:tamanho)       ');
        clAux.consulta.parambyname('loja1').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
        clAux.consulta.parambyname('tran').AsFloat     := qItens.fieldbyname('IT_TRAN').AsFloat;
        clAux.consulta.parambyname('grupo').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := qItens.fieldbyname('IT_SUBG').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := qItens.fieldbyname('IT_PROD').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := qItens.fieldbyname('IT_CORE').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := qItens.fieldbyname('IT_TAMA').AsString;
        clAux.consulta.parambyname('novaqtde').AsFloat := frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor;
        clAux.Execute; {*}

                    //*************************************************************************
                    {... SOMENTE PARA O CASO DO SISTEMA ESTAR ONLINE}
                    //*************************************************************************
        if (frm_principal.x_online) then
        begin
          loja    := qItens.fieldbyname('TR_LOJ1').AsFloat;
          seqmov  := qItens.fieldbyname('IT_MOV1').AsFloat;
          qtde    := qItens.fieldbyname('IT_QTDS').AsFloat;

                         {...}
          clAux2 := TClassAuxiliar.Create;
          clAux2.conect   ('ESTOQUE',self);
          clAux2.ClearSql;
          clAux2.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
          clAux2.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
          clAux2.consulta.parambyname('seqmov').AsFloat := seqmov;
          if (clAux2.Execute) then
          begin
            datamovimento := clAux2.result('MO_DATA');

                             {...}
            clAux2.ClearSql;
            clAux2.AddParam ('UPDATE MOVIMENTO                       ');
            clAux2.AddParam ('SET    MO_QTD1=:novaqtde               ');
            clAux2.AddParam ('WHERE (MO_SEQ=:seqmov)                 ');
            clAux2.consulta.parambyname('seqmov').AsFloat   := seqmov;
            clAux2.consulta.parambyname('novaqtde').AsFloat := frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor;
            clAux2.Execute;

                             //...
            if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_CORE').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString)) then
              if (frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor>qtde) then
                EntradaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor - qtde)
              else
              if (frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor<qtde) then
                SaidaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qtde - frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor);
          end;
          clAux2.desconect;
          clAux2.Free;
        end;
                    //*************************************************************************

        clAux.desconect;
        clAux.Free;

        RefrescaTabela;
        qItens.GotoBookmark(book);
        qItens.FreeBookmark(book);
        qItens.enablecontrols;
      end;
      frm_Transf_Acerto_Alteracao.Free;
    end;
end;

procedure Tfrm_Transf_Consulta.btnAcertaEntradaClick(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
  book: Tbookmark;
  loja,seqmov,qtde: Real;
  datamovimento: TDateTime;
begin
  if (qItens.active) then
    if (qItens.recordcount<>0) then
    begin
      Application.CreateForm(Tfrm_Transf_Acerto_Alteracao, frm_Transf_Acerto_Alteracao);
      frm_Transf_Acerto_Alteracao.caption := 'Alterar QTDE ENTRADA';
      frm_Transf_Acerto_Alteracao.tecla   := 27;
      frm_Transf_Acerto_Alteracao.edtQtdeAtual.text := floattostr(qItens.fieldbyname('IT_QTDE').AsFloat);
      frm_Transf_Acerto_Alteracao.showmodal;
      if (frm_Transf_Acerto_Alteracao.tecla=13) then
      begin
        book := qItens.GetBookmark;
        qItens.disablecontrols;

        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE ITENS_TRANSF_LOJA       ');
        clAux.AddParam ('SET    IT_QTDE=:novaqtde       ');
        clAux.AddParam ('WHERE (IT_LOJ1=:loja1) AND     ');
        clAux.AddParam ('      (IT_TRAN=:tran) AND      ');
        clAux.AddParam ('      (IT_GRUP=:grupo) AND     ');
        clAux.AddParam ('      (IT_SUBG=:subgrupo) AND  ');
        clAux.AddParam ('      (IT_PROD=:produto) AND   ');
        clAux.AddParam ('      (IT_CORE=:cor) AND       ');
        clAux.AddParam ('      (IT_TAMA=:tamanho)       ');
        clAux.consulta.parambyname('loja1').AsFloat    := qItens.fieldbyname('IT_LOJ1').AsFloat;
        clAux.consulta.parambyname('tran').AsFloat     := qItens.fieldbyname('IT_TRAN').AsFloat;
        clAux.consulta.parambyname('grupo').AsFloat    := qItens.fieldbyname('IT_GRUP').AsFloat;
        clAux.consulta.parambyname('subgrupo').AsFloat := qItens.fieldbyname('IT_SUBG').AsFloat;
        clAux.consulta.parambyname('produto').AsFloat  := qItens.fieldbyname('IT_PROD').AsFloat;
        clAux.consulta.parambyname('cor').AsFloat      := qItens.fieldbyname('IT_CORE').AsFloat;
        clAux.consulta.parambyname('tamanho').AsString := qItens.fieldbyname('IT_TAMA').AsString;
        clAux.consulta.parambyname('novaqtde').AsFloat := frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor;
        clAux.Execute; {*}

                      //*************************************************************************
                      {... SOMENTE PARA O CASO DO SISTEMA ESTAR ONLINE}
                      //*************************************************************************
        if (frm_principal.x_online) then
        begin
          loja    := qItens.fieldbyname('TR_LOJ2').AsFloat;
          seqmov  := qItens.fieldbyname('IT_MOV2').AsFloat;
          qtde    := qItens.fieldbyname('IT_QTDE').AsFloat;

                           {...}
          clAux2 := TClassAuxiliar.Create;
          clAux2.conect   ('ESTOQUE',self);
          clAux2.ClearSql;
          clAux2.AddParam ('SELECT MO_SEQ,MO_DATA                  ');
          clAux2.AddParam ('FROM MOVIMENTO WHERE (MO_SEQ=:seqmov)  ');
          clAux2.consulta.parambyname('seqmov').AsFloat := seqmov;
          if (clAux2.Execute) then
          begin
            datamovimento := clAux2.result('MO_DATA');

                               {...}
            clAux2.ClearSql;
            clAux2.AddParam ('UPDATE MOVIMENTO                       ');
            clAux2.AddParam ('SET    MO_QTD1=:novaqtde               ');
            clAux2.AddParam ('WHERE (MO_SEQ=:seqmov)                 ');
            clAux2.consulta.parambyname('seqmov').AsFloat   := seqmov;
            clAux2.consulta.parambyname('novaqtde').AsFloat := frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor;
            clAux2.Execute;

                               //...
            if (not VerificaSeHouveInventarioPosteriomente(loja,datamovimento,
              qItens.fieldbyname('IT_GRUP').AsFloat,
              qItens.fieldbyname('IT_SUBG').AsFloat,
              qItens.fieldbyname('IT_PROD').AsFloat,
              qItens.fieldbyname('IT_CORE').AsFloat,
              qItens.fieldbyname('IT_TAMA').AsString)) then
              if (frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor>qtde) then
                EntradaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor - qtde)
              else
              if (frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor<qtde) then
                SaidaItemEstoque (loja,
                  qItens.fieldbyname('TR_TIPZ').AsString,
                  qItens.fieldbyname('IT_GRUP').AsFloat,
                  qItens.fieldbyname('IT_SUBG').AsFloat,
                  qItens.fieldbyname('IT_PROD').AsFloat,
                  qItens.fieldbyname('IT_CORE').AsFloat,
                  qItens.fieldbyname('IT_TAMA').AsString,
                  qtde - frm_Transf_Acerto_Alteracao.edtNovaQtde.GetValor);
          end;
          clAux2.desconect;
          clAux2.Free;
        end;
                      //*************************************************************************

        clAux.desconect;
        clAux.Free;

        RefrescaTabela;
        qItens.GotoBookmark(book);
        qItens.FreeBookmark(book);
        qItens.enablecontrols;
      end;
      frm_Transf_Acerto_Alteracao.Free;
    end;
end;

procedure Tfrm_Transf_Consulta.qItensAfterScroll(DataSet: TDataSet);
begin
  btnImprimirTransfConsultadas.enabled := true;
  btnImprimirTransfConsultadas.font.color := clWhite;

  btnImprimiSLIP.enabled      := true;
  btnImprimiSLIP.font.color := clWhite;

  if (qItens.fieldbyname('IT_LOJ1').AsFloat=frm_principal.x_loja) then
  begin
    if (qItens.fieldbyname('IT_QTDE').AsFloat=0) then
    begin
      btnExcluiReferencia.enabled := true;
      btnExcluiReferencia.font.color := clWhite;
      btnExcluiDocumento.enabled := true;
      btnExcluiDocumento.font.color := clWhite;
    end
    else
    begin
      btnExcluiReferencia.enabled := false;
      btnExcluiReferencia.font.color := clGray;
      btnExcluiDocumento.enabled := false;
      btnExcluiDocumento.font.color := clGray;
    end;
    if (qItens.fieldbyname('IT_QTDS').AsFloat<>0) then
    begin
              //*** Início *** Rodrigo Cordeiro - 01/10/2009 ********************************
      if (qItens.FieldByName('TR_DATA').AsDateTime = frm_principal.x_data_trabalho) {and (statusCaixa = '1') }then
      begin
        btnAcertaSaida.enabled    := true;
        btnAcertaSaida.font.color := clWhite;
      end
      else
      begin
        btnAcertaSaida.enabled    := false;
        btnAcertaSaida.font.color := clGray;
      end;
              //*** Fim *********************************************************************
    end
    else
    begin
              //*** Início *** Rodrigo Cordeiro - 01/10/2009 ********************************
      if (qItens.FieldByName('TR_DATA').AsDateTime = frm_principal.x_data_trabalho) {and (statusCaixa = '1')} then
      begin
        btnAcertaSaida.enabled    := true;
        btnAcertaSaida.font.color := clWhite;
      end
      else
      begin
        btnAcertaSaida.enabled    := false;
        btnAcertaSaida.font.color := clGray;
      end;
              //*** Fim *********************************************************************
    end;
    btnAcertaEntrada.enabled    := false;
    btnAcertaEntrada.font.color := clGray;
  end
  else
  if (qItens.fieldbyname('TR_LOJ2').AsFloat=frm_principal.x_loja) then
  begin
    btnExcluiReferencia.enabled := false;
    btnExcluiReferencia.font.color := clGray;
    btnExcluiDocumento.enabled := false;
    btnExcluiDocumento.font.color := clGray;

    btnAcertaSaida.enabled    := false;
    btnAcertaSaida.font.color := clGray;
    if (qItens.fieldbyname('IT_QTDE').AsFloat<>0) then
    begin
              //*** Início *** Rodrigo Cordeiro - 01/10/2009 ********************************
      if (qItens.FieldByName('TR_DATA').AsDateTime = frm_principal.x_data_trabalho) {and (statusCaixa = '1')} then
      begin
        btnAcertaEntrada.enabled    := true;
        btnAcertaEntrada.font.color := clWhite;
      end
      else
      begin
        btnAcertaEntrada.enabled    := false;
        btnAcertaEntrada.font.color := clGray;
      end;
              //*** Fim *********************************************************************
    end
    else
    if (qItens.FieldByName('TR_DATA').AsDateTime = frm_principal.x_data_trabalho) {and (statusCaixa = '1')} then
    begin
      btnAcertaEntrada.enabled    := true;
      btnAcertaEntrada.font.color := clWhite;
    end
    else
    begin
      btnAcertaEntrada.enabled    := false;
      btnAcertaEntrada.font.color := clGray;
    end//*** Início *** Rodrigo Cordeiro - 01/10/2009 ********************************
//*** Fim *********************************************************************
    ;
  end;
end;

procedure Tfrm_Transf_Consulta.qItensAfterOpen(DataSet: TDataSet);
begin
  if (qItens.recordcount<>0) then
  begin
    btnImprimirTransfConsultadas.enabled := true;
    btnImprimirTransfConsultadas.font.color := clWhite;

    btnImprimiSLIP.enabled      := true;
    btnImprimiSLIP.font.color := clWhite;

    if (qItens.fieldbyname('IT_LOJ1').AsFloat=frm_principal.x_loja) then
    begin
      if (qItens.fieldbyname('IT_QTDE').AsFloat=0) then
      begin
        btnExcluiReferencia.enabled := true;
        btnExcluiReferencia.font.color := clWhite;
        btnExcluiDocumento.enabled := true;
        btnExcluiDocumento.font.color := clWhite;
      end
      else
      begin
        btnExcluiReferencia.enabled := false;
        btnExcluiReferencia.font.color := clGray;
        btnExcluiDocumento.enabled := false;
        btnExcluiDocumento.font.color := clGray;
      end;
      if (qItens.fieldbyname('IT_QTDS').AsFloat<>0) then
      begin
        btnAcertaSaida.enabled   := true;
        btnAcertaSaida.font.color := clWhite;
      end
      else
      begin
        btnAcertaSaida.enabled   := false;
        btnAcertaSaida.font.color := clGray;
      end;
      btnAcertaEntrada.enabled := false;
      btnAcertaEntrada.font.color := clGray;
    end
    else
    if (qItens.fieldbyname('TR_LOJ2').AsFloat=frm_principal.x_loja) then
    begin
      btnExcluiReferencia.enabled := false;
      btnExcluiReferencia.font.color := clGray;
      btnExcluiDocumento.enabled := false;
      btnExcluiDocumento.font.color := clGray;

      btnAcertaSaida.enabled   := false;
      btnAcertaSaida.font.color := clGray;
      if (qItens.fieldbyname('IT_QTDE').AsFloat<>0) then
      begin
        btnAcertaEntrada.enabled := true;
        btnAcertaEntrada.font.color := clWhite;
      end
      else
      begin
        btnAcertaEntrada.enabled := false;
        btnAcertaEntrada.font.color := clGray;
      end;
    end;
  end
  else
  begin
    btnExcluiReferencia.enabled := false;
    btnExcluiDocumento.enabled  := false;
    btnAcertaEntrada.enabled    := false;
    btnAcertaSaida.enabled      := false;
    btnImprimirTransfConsultadas.enabled := false;
    btnImprimiSLIP.enabled      := false;

    btnExcluiReferencia.font.color := clGray;
    btnExcluiDocumento.font.color := clGray;
    btnAcertaEntrada.font.color := clGray;
    btnAcertaSaida.font.color := clGray;
    btnImprimirTransfConsultadas.font.color := clGray;
    btnImprimiSLIP.font.color := clGray;
  end;
end;

procedure Tfrm_Transf_Consulta.qItensAfterClose(DataSet: TDataSet);
begin
  btnExcluiReferencia.enabled := false;
  btnExcluiDocumento.enabled  := false;
  btnAcertaEntrada.enabled    := false;
  btnAcertaSaida.enabled      := false;
  btnImprimirTransfConsultadas.enabled := false;
  btnImprimiSLIP.enabled      := false;

  btnExcluiReferencia.font.color := clGray;
  btnExcluiDocumento.font.color := clGray;
  btnAcertaEntrada.font.color := clGray;
  btnAcertaSaida.font.color := clGray;
  btnImprimirTransfConsultadas.font.color := clGray;
  btnImprimiSLIP.font.color := clGray;
end;

end.
