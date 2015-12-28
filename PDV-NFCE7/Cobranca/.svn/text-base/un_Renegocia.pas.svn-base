unit un_Renegocia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, Buttons, PanelOO,
  MaskEditOO, LabelOO, Grids, DBGrids, Db, Gauges, GaugeOO;

type
  Tfrm_Renegocia = class(Tfrm_Auxformulario1)
    LabelOO1: TLabelOO;
    edtCodigo: TMaskEditOO;
    pnCliente: TPanelOO;
    Bevel1: TBevel;
    grade: TDBGrid;
    Panel1: TPanel;
    LabelOO2: TLabelOO;
    pnSaldo1: TPanelOO;
    ds1: TDataSource;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    Label1: TLabel;
    gauge: TGaugeOO;
    LabelOO3: TLabelOO;
    pnSaldo2: TPanelOO;
    botao2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnHoje: TPanel;
    N3: TMenuItem;
    Renegociacomjuros1: TMenuItem;
    Label9: TLabel;
    Label6: TLabel;
    LabelOO4: TLabelOO;
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Renegociacomjuros1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer; {0-> é chamado do menu principal, 1-> é chamado da consulta}
    valor_renegociacao: Real;
    procedure RefrescaTabela(cliente: Real);
    procedure CalculaSaldoDevedor(cliente: Real);
    procedure ProcessaRenovacao;
    procedure ChamandoClienteContrato(valor_renegociacao: Real);
  end;

var
  frm_Renegocia: Tfrm_Renegocia;

implementation

uses principal, DM4, funcoes1, funcoes2, procura, f8Clientes,
  un_frmConsulta1, auxiliar, credito, cadcli, unDialogo, aux5Contrato;

{$R *.DFM}

procedure Tfrm_Renegocia.FormActivate(Sender: TObject);
begin
  pnHoje.caption:=form_data(frm_principal.x_data_trabalho);   
  if (edtCodigo.GetValor=0) then
    ds1.dataset.close;   
  inherited;
  edtCodigo.setfocus;
end;

procedure Tfrm_Renegocia.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
  begin
    aListaRenegocia.Clear;
    RefrescaTabela(edtCodigo.GetValor);
    grade.setfocus;
  end;
  if (key=K_F1) then
    frm_principal.ExibirDica('Código do cliente: formato 999999 - F8/Duplo clique exibe clientes cadastrados',5);
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCodigo;
      showmodal;
    end;
end;

procedure Tfrm_Renegocia.RefrescaTabela(cliente: Real);
var
  saldo_devedor1: Real;
  saldo_devedor2: Real;
  atraso: Real;
  multa,juros: Real;
begin
  with (DMcontrato.qRenegociaContratosEmAberto) do
  begin
    close;
    sql.clear;
    sql.Add ('SELECT *                                     ');
    sql.Add ('FROM CRECTABR,CREDPLANO                      ');
    sql.Add ('WHERE (CR_CLIE=:cliente) AND                 ');
    sql.Add ('      (CR_PDEV>0) AND                        ');
    sql.Add ('      (CR_PDEV<=CR_QPRE) AND                 ');
    sql.Add ('      (CR_PLAN=PL_CODI) AND                  ');
    sql.Add ('      (PL_CHEQ='+chr(39)+'0'+chr(39)+')      ');
    sql.Add ('Order by CR_CODI                             ');
    parambyname('cliente').AsFloat := cliente;
    open;
    CalculaSaldoDevedor(cliente);
    first;
  end;
end;

procedure Tfrm_Renegocia.CalculaSaldoDevedor(cliente: Real);
var
  clAux: TClassAuxiliar;
  saldo_devedor1: Real;
  saldo_devedor2: Real;
  atraso: Real;
  multa,juros: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect('CREDITO',self);
  with (clAux) do
  begin
    ClearSql;
    AddParam ('SELECT *                                      ');
    AddParam ('FROM CRECTABR,CREDPLANO,CREPRABR              ');
    AddParam ('WHERE (CR_CLIE=:cliente) AND                  ');
    AddParam ('      (CR_PDEV>0) AND                         ');
    AddParam ('      (CR_PDEV<=CR_QPRE) AND                  ');
    AddParam ('      (CR_PLAN=PL_CODI) AND                   ');
    AddParam ('      (PL_CHEQ='+chr(39)+'0'+chr(39)+') AND   ');
    AddParam ('      (CR_CLIE=PC_CLIE) AND                   ');
    AddParam ('      (CR_CODI=PC_CONT) AND                   ');
    AddParam ('      (PC_STAT='+chr(39)+'0'+chr(39)+')       ');
    AddParam ('Order by CR_CODI                              ');
    consulta.parambyname('cliente').AsFloat := cliente;
    Execute;
    first;
    saldo_devedor1 := 0.00;
    saldo_devedor2 := 0.00;
    while (not eof) do
    begin
      if (aListaRenegocia.IndexOf(form_nz(result('PC_CLIE'),6)+
        form_nz(result('PC_CONT'),6))<>-1) then
      begin
        if (Result('PC_DVTO')<frm_principal.x_data_trabalho) then
          atraso := frm_principal.x_data_trabalho - Result('PC_DVTO')
        else
          atraso := 0;
        multa := LerMulta(result('PC_VALO'),atraso,result('PC_LOJA'));
        juros := LerJuros(result('PC_VALO'),atraso,result('PC_LOJA'));
        saldo_devedor1 := saldo_devedor1 + result('PC_VALO');
        saldo_devedor2 := saldo_devedor2 + result('PC_VALO') + multa + juros;
      end;
      next;
    end;
    if (saldo_devedor1<>0.00) then
      pnSaldo1.caption:=form_nc(saldo_devedor1,10)
    else
      pnSaldo1.caption:='0,00';
    if (saldo_devedor2<>0.00) then
      pnSaldo2.caption:=form_nc(saldo_devedor2,10)
    else
      pnSaldo2.caption:='0,00';
    first;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_Renegocia.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  ds1.dataset.close;
  edtCodigo.setfocus;
end;

procedure Tfrm_Renegocia.N1Click(Sender: TObject);
var
  valor_renegociacao: Real;
begin
  if (edtCodigo.GetValor<>0) then
    if (ds1.dataset.recordcount<>0) then
      if (aListaRenegocia.count=0) then
      begin
        frmDialogo.ExibirMensagem (' Não foram selecionados contratos para renegociação! '
          ,'Renegociação',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        grade.setfocus;
      end
      else
      begin
        if (Modo=0) then
        begin
          Application.CreateForm(Tfrm_Consulta1, frm_Consulta1);
          valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption)));
        end
        else
        if (Modo=1) then
          if (trim(frm_Consulta1.total_contrato_caixa)<>'') and
            (trim(frm_Consulta1.total_entrada_caixa)='') then
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption))) +
              strtofloat(trim(RetiraFormatacaoNumero(frm_Consulta1.total_contrato_caixa)))
          else
          if (trim(frm_Consulta1.total_contrato_caixa)<>'') and
            (trim(frm_Consulta1.total_entrada_caixa)<>'') then
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption))) +
              strtofloat(trim(RetiraFormatacaoNumero(frm_Consulta1.total_contrato_caixa))) 

          else
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption)));
        ChamandoClienteContrato (valor_renegociacao);
        ProcessaRenovacao;
        aListaRenegocia.Clear;
        RefrescaTabela(edtCodigo.GetValor);
        grade.setfocus;
      end;
end;

procedure Tfrm_Renegocia.botao1Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_Renegocia.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (ds1.dataset.fieldbyname('bFlag').AsBoolean) then
    grade.Canvas.Font.color:=clBlue
  else
    grade.Canvas.Font.color:=clRed;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_Renegocia.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  aListaRenegocia := TStringList.Create;
end;

procedure Tfrm_Renegocia.FormDestroy(Sender: TObject);
begin
  inherited;
  aListaRenegocia.Free;
end;

procedure Tfrm_Renegocia.gradeDblClick(Sender: TObject);
var
  SavePlace: TBookmark;
begin
  if (aListaRenegocia.IndexOf(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
    form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6))=-1) then
    aListaRenegocia.Add(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
      form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6))
  else
    aListaRenegocia.Delete(aListaRenegocia.IndexOf(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
      form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6)));
  SavePlace := ds1.dataset.GetBookmark;
  ds1.dataset.disablecontrols;
  RefrescaTabela(edtCodigo.GetValor);
  ds1.dataset.GotoBookmark(SavePlace);
  ds1.dataset.FreeBookmark(SavePlace);
  ds1.dataset.enablecontrols;
end;

procedure Tfrm_Renegocia.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  SavePlace: TBookmark;
begin
  if (key=K_ENTER) then
  begin
    if (aListaRenegocia.IndexOf(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
      form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6))=-1) then
      aListaRenegocia.Add(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
        form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6))
    else
      aListaRenegocia.Delete(aListaRenegocia.IndexOf(form_nz(ds1.dataset.fieldbyname('CR_CLIE').AsFloat,6)+
        form_nz(ds1.dataset.fieldbyname('CR_CODI').AsFloat,6)));
    SavePlace := ds1.dataset.GetBookmark;
    ds1.dataset.disablecontrols;
    RefrescaTabela(edtCodigo.GetValor);
    ds1.dataset.GotoBookmark(SavePlace);
    ds1.dataset.FreeBookmark(SavePlace);
    ds1.dataset.enablecontrols;
  end;
end;

{*** PROCESSA RENOVACAO}
procedure Tfrm_Renegocia.ProcessaRenovacao;
var
  clPrest: TClassAuxiliar;
  clUpdate: TClassAuxiliar;
  observacao: String;
begin
  if (frm_Consulta1.y_codigo_contrato<>-1) then
  begin
    clPrest := TClassAuxiliar.Create;
    clPrest.conect ('CREDITO',self);
    clUpdate := TClassAuxiliar.Create;
    clUpdate.conect('CREDITO',self);

          {* jogando a observacao padrao no contrato, para aparecer na consulta - MESTRE}
    observacao := 'Contrato de renegociacao';
    clUpdate.ClearSql;
    clUpdate.AddParam ('UPDATE CRECTABR                                     ');
    clUpdate.AddParam ('SET CR_OBSE='+chr(39)+observacao+chr(39)+',         ');
    clUpdate.AddParam ('    CR_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
    clUpdate.AddParam ('WHERE (CR_CLIE=:cliente) AND                        ');
    clUpdate.AddParam ('      (CR_CODI=:contrato)                           ');
    clUpdate.consulta.parambyname('cliente').AsFloat  := frm_Consulta1.y_codigo_cliente;
    clUpdate.consulta.parambyname('contrato').AsFloat := frm_Consulta1.y_codigo_contrato;
    clUpdate.Execute;

          {* Processando a baixa dos contratos renegociados}
    ds1.dataset.disablecontrols;
    ds1.dataset.first;
    gauge.Inicializa(ds1.dataset.recordcount);
    while (not ds1.dataset.eof) do
    begin
      if (ds1.dataset.fieldbyname('bFlag').AsBoolean) then
      begin
        clPrest.ClearSql;
        clPrest.AddParam ('SELECT PC_CLIE,PC_CONT,PC_NPRE,PC_LOJA,PC_VALO        ');
        clPrest.AddParam ('FROM CREPRABR                                         ');
        clPrest.AddParam ('WHERE (PC_CLIE=:cliente) AND (PC_CONT=:contrato) AND  ');
        clPrest.AddParam ('      (PC_STAT='+chr(39)+'0'+chr(39)+')               ');
        clPrest.consulta.parambyname('cliente').AsFloat  := ds1.dataset.fieldbyname('CR_CLIE').AsFloat;
        clPrest.consulta.parambyname('contrato').AsFloat := ds1.dataset.fieldbyname('CR_CODI').AsFloat;
        clPrest.Execute;
        clPrest.first;
        while (not clPrest.eof) do
        begin
          QuitaPrestacao (clPrest.result('PC_CLIE'),
            clPrest.result('PC_CONT'),
            clPrest.result('PC_NPRE'),
            clPrest.result('PC_LOJA'),
            0.00,{*}
            frm_principal.x_data_trabalho);
          clPrest.next;
        end;

                   {* jogando a observacao padrao no contrato, para aparecer na consulta - ESCRAVO}
        observacao := 'Contrato foi renegociado - Novo contrato: '+form_nz(frm_Consulta1.y_codigo_contrato,6);
        clUpdate.ClearSql;
        clUpdate.AddParam ('UPDATE CRECTABR                                     ');
        clUpdate.AddParam ('SET CR_OBSE='+chr(39)+observacao+chr(39)+',         ');
        clUpdate.AddParam ('    CR_TIME='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+' ');
        clUpdate.AddParam ('WHERE (CR_CLIE=:cliente) AND                        ');
        clUpdate.AddParam ('      (CR_CODI=:contrato)                           ');
        clUpdate.consulta.parambyname('cliente').AsFloat  := clPrest.result('PC_CLIE');
        clUpdate.consulta.parambyname('contrato').AsFloat := clPrest.result('PC_CONT');
        clUpdate.Execute;

                   {* vinculando o contrato escravo ao novo contrato criado (mestre)}
        clUpdate.ClearSql;
        clUpdate.AddParam ('INSERT INTO CONTRATOS_RENEGOCIADOS(CLIENTE,CONTRATO_MESTRE,CONTRATO_ESCRAVO,MENSALIDADE_INICIAL,CR_TIME) ');
        clUpdate.AddParam ('VALUES (:CLIENTE,:CONTRATO_MESTRE,:CONTRATO_ESCRAVO,:MENSALIDADE_INICIAL,:CR_TIME) ');
        clUpdate.consulta.parambyname('CLIENTE').AsFloat := clPrest.result('PC_CLIE');
        clUpdate.consulta.parambyname('CONTRATO_MESTRE').AsFloat := frm_Consulta1.y_codigo_contrato;
        clUpdate.consulta.parambyname('CONTRATO_ESCRAVO').AsFloat := clPrest.result('PC_CONT');
        clUpdate.consulta.parambyname('MENSALIDADE_INICIAL').AsFloat := ds1.dataset.fieldbyname('CR_QPRE').AsFloat -
          ds1.dataset.fieldbyname('CR_PDEV').AsFloat + 1;
        clUpdate.consulta.parambyname('CR_TIME').AsDateTime := frm_principal.x_data_trabalho;
        clUpdate.Execute;
      end;

               {--> prox. contrato}
      ds1.dataset.next;
      gauge.move;
    end;
    clPrest.desconect;
    clPrest.Free;
    clUpdate.desconect;
    clUpdate.Free;
    ds1.dataset.enablecontrols;
    ds1.dataset.close;
    frm_principal.ExibirDica('Renegociação de contratos executada com sucesso!',5);
  end;
  if (Modo=0) then
    frm_Consulta1.Free;
end;

{*** CHAMA TELA DE CLIENTE}
procedure Tfrm_Renegocia.ChamandoClienteContrato(valor_renegociacao: Real);
begin
  Application.CreateForm(Tfrm_Aux5Contrato, frm_Aux5Contrato);
  Application.CreateForm (Tfrm_EdtCliente, frm_EdtCliente);
  with (frm_EdtCliente) do
  begin
    fichario.activepage := pagina1;
    edtCodigo.text      := '';
    LimparEdits(1);
    LimparEdits(2);
    LimparEdits(3);
    IniciarGradeLancamentos;
    dataContrato  := StrToDate('01/01/1900');
    cdLoja        := 0;
    cdCliente     := 0;
    frm_edtCliente.cdCliente := strtoint(frm_Renegocia.edtCodigo.GetValor);
    frm_edtCliente.datacontrato := frm_principal.x_data_trabalho;
    frm_edtCliente.cdLoja := trunc(frm_principal.x_frente_loja);
    frm_edtCliente.pnTipoCad3.caption := 'Cliente: '+
      ProcuraNomeClienteCod(frm_edtCliente.cdCliente,self);
    frm_edtCliente.caption := frm_principal.x_sistema+' - '+LB_CADASTRO_CONTRAT+
      ' - Loja: '+ProcuraNomeLoja(frm_edtCliente.cdLoja,self)+
      '  - Data: '+datetostr(frm_edtCliente.datacontrato);
    btnConsulta.visible:=false;
    CodigoInclusaoContrato := CodigoCanceladoContrato;
    frm_edtCliente.edtValMerc.readonly := true; {*}
    frm_edtCliente.edtValMerc.text := form_nc2(valor_renegociacao,10,2); {*}
    edtValEntrada.readonly := true; {*}
    if (trim(frm_Consulta1.total_entrada_caixa)<>'') then
      edtValEntrada.text := frm_Consulta1.total_entrada_caixa;
    frm_edtCliente.valor_do_contrato_renegociacao := -1;
    MostraAuxLoja := true;
    cdCheq        := 0;
    Modo          := 2;
    frm_edtCliente.flagConsulta := true;
    showmodal;
    CodigoCanceladoContrato := CodigoInclusaoContrato;
    Free;
    frm_Aux5Contrato.Free;
  end;
end;

procedure Tfrm_Renegocia.Renegociacomjuros1Click(Sender: TObject);
var
  valor_renegociacao: Real;
begin
  if (edtCodigo.GetValor<>0) then
    if (ds1.dataset.recordcount<>0) then
      if (aListaRenegocia.count=0) then
      begin
        frmDialogo.ExibirMensagem (' Não foram selecionados contratos para renegociação! '
          ,'Renegociação',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        grade.setfocus;
      end
      else
      begin
        if (Modo=0) then
        begin
          Application.CreateForm(Tfrm_Consulta1, frm_Consulta1);
          valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo2.caption)));
        end
        else
        if (Modo=1) then
          if (trim(frm_Consulta1.total_contrato_caixa)<>'') and
            (trim(frm_Consulta1.total_entrada_caixa)='') then
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption))) +
              strtofloat(trim(RetiraFormatacaoNumero(frm_Consulta1.total_contrato_caixa)))
          else
          if (trim(frm_Consulta1.total_contrato_caixa)<>'') and
            (trim(frm_Consulta1.total_entrada_caixa)<>'') then
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption))) +
              strtofloat(trim(RetiraFormatacaoNumero(frm_Consulta1.total_contrato_caixa)))

          else
            valor_renegociacao := strtofloat(trim(RetiraFormatacaoNumero(pnSaldo1.caption)));
        ChamandoClienteContrato (valor_renegociacao);
        ProcessaRenovacao;
        aListaRenegocia.Clear;
        RefrescaTabela(edtCodigo.GetValor);
        grade.setfocus;
      end;
end;

procedure Tfrm_Renegocia.botao2Click(Sender: TObject);
begin
  Renegociacomjuros1.click;
end;

end.
