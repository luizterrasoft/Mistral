unit un_ConsultaVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, Mask, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, Db, DBTables, LabelOO;

type
  Tfrm_ConsultaVenda = class(Tfrm_Auxformulario1)
    ds1: TDataSource;
    ds2: TDataSource;
    ds3: TDataSource;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Panel1: TPanel;
    Image2: TImage;
    Label12: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    lbtipz: TLabel;
    pnLocal2: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    botao3: TPanel;
    edtCaixa: TMaskEdit;
    edtNumero: TMaskEdit;
    pnLocal1: TPanel;
    Label18: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    botao2: TPanel;
    edtVend: TMaskEdit;
    edtDataVend: TMaskEdit;
    pnLocal3: TPanel;
    Label9: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtData1: TMaskEdit;
    edtData2: TMaskEdit;
    botao4: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    grade1: TDBGrid;
    grade2: TDBGrid;
    grade3: TDBGrid;
    procedure edtVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtmaskeditformulario1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grade2DblClick(Sender: TObject);
    procedure grade2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade1DblClick(Sender: TObject);
    procedure edtDataVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao4Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer; {0-> modo simples de consulta, 1-> modo de retorno de chave da venda}
    y_loja,y_caixa,y_codigo_venda: Real; {campos de retorno, usado apenas pelo modo=1}
    y_ndoc,y_tipz: String; {campos de retorno, usado apenas pelo modo=1}
    tabela1: TQuery;
    tabela2: TQuery;
    tabela3: TQuery;
    n_ordem_f7: Integer;
    tipz: String;
    procedure MudaFocoConsulta;
    procedure ExibeFormaPgto(loja,caixa,venda,codigo_forma,valor: Real);
    function GetOrdemFormaPgto(codigo_forma: Real):Integer;
  end;

var
  frm_ConsultaVenda: Tfrm_ConsultaVenda;

implementation

{$R *.DFM}

uses principal, funcoes1,funcoes2, procura, DM5, un_VerDadosPgto, auxiliar,
  unDialogo, DM4, Venda, F8Lojas, DM6, un_ConsultaVenda_Vendedores;

procedure Tfrm_ConsultaVenda.edtVendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDataVend.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend);
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.edtmaskeditformulario1Exit(Sender: TObject);
var
  loja,codigo: String;
begin
  inherited;
  {************************}
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  codigo := Trim(TMaskEdit(sender).text);
  if (codigo<>'') then
    if (TmaskEdit(Sender).EditMask = '') then
      if (TMaskEdit(sender).tag=0) then
        TMaskEdit(sender).text := form_nz(strtofloat(codigo),6)
      else
      if (TMaskEdit(sender).tag=1) then
        TMaskEdit(sender).text := form_nz(strtofloat(codigo),2);
end;

procedure Tfrm_ConsultaVenda.edtmaskeditformulario1DblClick(
  Sender: TObject);
begin
  inherited;
  {************************}
  if (TMaskEdit(sender).tag=0) then
  begin
    if (TMaskEdit(sender).name='edtVend') then
      ChamandoF8Vend(frm_principal.x_loja,edtVend);
  end
  else
  if (TMaskEdit(sender).tag=1) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=TMaskEdit(sender);
      showmodal;
    end;
end;

procedure Tfrm_ConsultaVenda.FormCreate(Sender: TObject);
begin
  y_loja  := -1;
  y_caixa := -1;
  y_codigo_venda := -1;
  y_ndoc  := '-1';
  y_tipz  := '1';
     {*********************}
  tipz :='1';
  lbtipz.caption:='Sr.: '+tipz;
  n_ordem_f7 := 1;
  pnLocal1.visible:=true;
  pnLocal2.visible:=false;
  tabela1 := DMVendas.qVendas;
  tabela2 := DMVendas.qFormas;
  tabela3 := DMVendas.qItensVenda;
  ds1.dataset := tabela1;
  ds2.dataset := tabela2;
  ds3.dataset := tabela3;

     {**************************************************}
  grade3.columns[0].visible := false;
  grade3.columns[1].visible := false;
  grade3.columns[2].visible := false;
  grade3.columns[3].visible := false;
  grade3.columns[4].visible := false;
  if (frm_principal.x_ordem_codigo=1) then
  begin
    grade3.columns[0].visible := true;
    grade3.columns[1].visible := true;
    grade3.columns[2].visible := true;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
    grade3.columns[3].visible := true
  else
  if (frm_principal.x_ordem_reffabric=1) then
    grade3.columns[4].visible := true;
end;

procedure Tfrm_ConsultaVenda.FormActivate(Sender: TObject);
begin
  begin
    if (edtData1.text='  /  /    ') then
      edtData1.text:=form_data(frm_principal.x_data_trabalho);
    if (edtData2.text='  /  /    ') then
      edtData2.text:=form_data(frm_principal.x_data_trabalho);
    if (edtDataVend.text='  /  /    ') then
      edtDataVend.text:=form_data(frm_principal.x_data_trabalho);
  end;
  if (Modo=K_MODO_CONSULTA_VENDA_NORMAL) then
  begin
    grade1.cursor := crHandPoint;
    grade1.hint   := 'ENTER / Duplo clique exibe os vendedores participantes da venda, caso exista mais de um';
  end
  else
  if (Modo=K_MODO_CONSULTA_VENDA_SELECAO) then
  begin
    grade1.cursor := crHandPoint;
    grade1.hint   := 'ENTER / Duplo clique escolhe a venda selecionada';
  end;
  if (pnLocal1.visible) then
    edtVend.setfocus
  else
  if (pnLocal2.visible) then
    edtCaixa.setfocus
  else
  if (pnLocal3.visible) then
    edtData1.setfocus;
end;

procedure Tfrm_ConsultaVenda.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao3Click(Sender);
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.Limparformulrio1Click(Sender: TObject);
begin
  edtCaixa.text      := '';
  edtNumero.text     := '';
  edtVend.text       := '';
  edtDataVend.text   := '';
  edtData2.text      := '';
  edtData1.text      := '';
  ds1.dataset.close;
  ds2.dataset.close;
  ds3.dataset.close;
  if (pnLocal1.visible) then
    edtVend.setfocus
  else
  if (pnLocal2.visible) then
    edtCaixa.setfocus
  else
  if (pnLocal3.visible) then
    edtData1.setfocus;
end;

procedure Tfrm_ConsultaVenda.MudaFocoConsulta;
begin
  pnLocal1.visible:=false;
  pnLocal2.visible:=false;
  pnLocal3.visible:=false;
  n_ordem_f7:=n_ordem_f7+1;
  if (n_ordem_f7=4) then
    n_ordem_f7:=1;
  if (n_ordem_f7=1) then
  begin
    pnLocal1.visible:=true;
    edtVend.setfocus;
  end
  else
  if (n_ordem_f7=2) then
  begin
    pnLocal2.visible:=true;
    edtCaixa.setfocus;
  end
  else
  if (n_ordem_f7=3) then
  begin
    pnLocal3.visible:=true;
    edtData1.setfocus;
  end;
end;

procedure Tfrm_ConsultaVenda.edtmaskeditformulario1Enter(Sender: TObject);
begin
  inherited;
     {******************}
     //if (TMaskEdit(sender).tag=1) then
     {begin
          lbF8.visible:=true;
          lbF8Mens.caption:='Exibir lojas cadastradas';
          lbF8Mens.visible:=true;
     end}
  if (TMaskEdit(sender).tag=0) then
  begin
    lbF8.visible:=true;
    lbF8Mens.caption:='Exibir vendedores cadastrados';
    lbF8Mens.visible:=true;
  end;
end;

procedure Tfrm_ConsultaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
     {*****************************************8}
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
      if (pnLocal1.visible) then
        botao2Click(Sender)
      else
      if (pnLocal2.visible) then
        botao3Click(Sender);
      if (ds1.dataset.active) then
        if (pnLocal1.visible) then
          botao2Click(Sender)
        else
        if (pnLocal2.visible) then
          botao3Click(Sender)
        else
        if (pnLocal3.visible) then
          botao4Click(Sender);
    end;
end;

procedure Tfrm_ConsultaVenda.grade1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade1.focused) then
    grade1.Canvas.Font.color:=clWhite
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='0') then {venda SEM pagamento}
    grade1.Canvas.Font.color:=clBlue
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='1') then {venda COM pagamento}
    grade1.Canvas.Font.color:=clNavy
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='2') then {venda CANCELADA}
    grade1.Canvas.Font.color:=clRed;
  grade1.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_ConsultaVenda.grade2DblClick(Sender: TObject);
begin
  if (ds2.dataset.active) then
    if (TQuery(ds2.dataset).recordcount<>0) then
      ExibeFormaPgto(ds2.dataset.fieldbyname('VF_LOJA').AsFloat,
        ds2.dataset.fieldbyname('VF_CAIX').AsFloat,
        ds2.dataset.fieldbyname('VF_VEND').AsFloat,
        ds2.dataset.fieldbyname('VF_FPGT').AsFloat,
        ds2.dataset.fieldbyname('VF_VALO').AsFloat);
end;

procedure Tfrm_ConsultaVenda.grade2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (ds2.dataset.active) then
      if (TQuery(ds2.dataset).recordcount<>0) then
        ExibeFormaPgto(ds2.dataset.fieldbyname('VF_LOJA').AsFloat,
          ds2.dataset.fieldbyname('VF_CAIX').AsFloat,
          ds2.dataset.fieldbyname('VF_VEND').AsFloat,
          ds2.dataset.fieldbyname('VF_FPGT').AsFloat,
          ds2.dataset.fieldbyname('VF_VALO').AsFloat);
  if (key=K_F2) then
    if (pnLocal1.visible) then
      edtVend.setfocus
    else
    if (pnLocal2.visible) then
      edtCaixa.setfocus
    else
    if (pnLocal3.visible) then
      edtData1.setfocus;
end;

procedure Tfrm_ConsultaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabela1.close;
  tabela2.close;
  tabela3.close;
end;

procedure Tfrm_ConsultaVenda.ExibeFormaPgto(loja,caixa,venda,codigo_forma,valor: Real);
var
  clAux: TClassAuxiliar;
  codigo_forma_a_vista: Real;
  ordem: Integer;
begin
  Application.CreateForm(Tfrm_VerDadosPgto,frm_VerDadosPgto);
  clAux := TClassAuxiliar.Create;
  clAux.conect (databaseprodutos,self);
  ordem := GetOrdemFormaPgto(codigo_forma);{<<<------}
  if (codigo_forma=KFPGT_DINHEIRO) then {* DINHEIRO}
  begin
         {***************************************************************************}
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VENDAS_FORMA_PAGAMENTO         ');
    clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND                 ');
    clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND                 ');
    clAux.AddParam ('      (VF_VEND=:VF_VEND) AND                 ');
    clAux.AddParam ('      (VF_ORDE=:VF_ORDE)                     ');
    clAux.consulta.parambyname('VF_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('VF_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('VF_VEND').AsFloat := venda;
    clAux.consulta.parambyname('VF_ORDE').AsInteger := ordem;
    clAux.Execute;
         {***************************************************************************}
    frm_VerDadosPgto.Memo1.lines.Add(' --- DINHEIRO -----------------------------------------------');
    frm_VerDadosPgto.Memo1.lines.Add(' Valor a receber.....$: '+form_nc(clAux.result('VF_VALO'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' Valor recebido......$: '+form_nc(clAux.result('VF_VALO')+clAux.result('VF_TROC'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' Troco...............$: '+form_nc(clAux.result('VF_TROC'),18));
    frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
  end
  else
  if (codigo_forma=KFPGT_CHEQUE) then {* CHEQUE A VISTA}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CHEQUES                 ');
    clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND          ');
    clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND          ');
    clAux.AddParam ('      (CH_VEND=:CH_VEND) AND          ');
    clAux.AddParam ('      (CH_ORDE=:CH_ORDE)              ');
    clAux.consulta.parambyname('CH_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('CH_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('CH_VEND').AsFloat := venda;
    clAux.consulta.parambyname('CH_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.Add(' --- CHEQUE À VISTA ---------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Cód/Banco......: '+form_n (clAux.result('CH_BANC'),3));
      frm_VerDadosPgto.Memo1.lines.Add(' Emitente.......: '+form_t (clAux.result('CH_NOME'),40));
      frm_VerDadosPgto.Memo1.lines.Add(' Fone...........: '+form_t (clAux.result('CH_FONE'),15));
      frm_VerDadosPgto.Memo1.lines.Add(' CPF............: '+ExibeCpf(clAux.result('CH_CPF')));
      if (clAux.result('CH_FLAG')='1') then
        frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: PRÓPRIO CLIENTE ')
      else
      if (clAux.result('CH_FLAG')='0') then
        frm_VerDadosPgto.Memo1.lines.Add(' Origem cheque..: TERCEIROS ');
      frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
      frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
      frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrada');
  end
  else
  if (codigo_forma=KFPGT_CREDITO) then {* CREDIARIO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CREDIARIOS              ');
    clAux.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND          ');
    clAux.AddParam ('      (CR_CAIX=:CR_CAIX) AND          ');
    clAux.AddParam ('      (CR_VEND=:CR_VEND) AND          ');
    clAux.AddParam ('      (CR_ORDE=:CR_ORDE)              ');
    clAux.consulta.parambyname('CR_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('CR_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('CR_VEND').AsFloat := venda;
    clAux.consulta.parambyname('CR_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- CREDIÁRIO -------------------------------------------------');
      if (clAux.result('CR_CLIE')<>0) then
        frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: '+form_nz(clAux.result('CR_CLIE'),6)+'-'+
          ProcuraNomeClienteCod(clAux.result('CR_CLIE'),self))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Código/cliente..: >>Não informado');
      if (clAux.result('CR_CPF')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: '+form_t(clAux.result('CR_CPF'),14))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' CPF/CNPJ........: >>Não informado');
      if (clAux.result('CR_NOME')<>'') then
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: '+form_t(clAux.result('CR_NOME'),40))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Nome do cliente.: >>Não informado');
      if (clAux.result('CR_CODI')<>0) then
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: '+form_nz(clAux.result('CR_CODI'),6))
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Contrato........: >>Não informado');
      frm_VerDadosPgto.Memo1.lines.Add(' Total contrato.$: '+form_nc(clAux.result('CR_TOTA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Entrada........$: '+form_nc(clAux.result('CR_VENT'),12));
      if (clAux.result('CR_RECE')<>0.00) then
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: SIM')
      else
        frm_VerDadosPgto.Memo1.lines.Add(' Recebido?......$: NAO!!!');
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Financiado.....$: '+form_nc(clAux.result('CR_FINA'),12));
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=KFPGT_VALE_MERC) then {* vale mercadoria funcionario}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_MERC                       ');
    clAux.AddParam ('WHERE (VM_LOJA=:VM_LOJA) AND                   ');
    clAux.AddParam ('      (VM_CAIX=:VM_CAIX) AND                   ');
    clAux.AddParam ('      (VM_VEND=:VM_VEND) AND                   ');
    clAux.AddParam ('      (VM_ORDE=:VM_ORDE)                       ');
    clAux.consulta.parambyname('VM_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('VM_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('VM_VEND').AsFloat := venda;
    clAux.consulta.parambyname('VM_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALE MERCADORIA ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Funcionário.......: '+form_nz(clAux.result('VM_CFUN'),4)+'-'+
        ProcuraNomeVend(frm_principal.x_loja,clAux.result('VM_CFUN'),self));
      frm_VerDadosPgto.Memo1.lines.Add(' N. documento......: '+clAux.result('VM_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $...........: '+form_nc(clAux.result('VM_VALO'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' N.de parcelas.....: '+form_nz(clAux.result('VM_NPAR'),2));
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=KFPGT_CARTAO) then {* cartao de credito}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CARTOES           ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND          ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND          ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND          ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)              ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- CARTÃO DE CRÉDITO -----------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
        ProcuraNomeAdm(clAux.result('CA_CADM'),1,self));
      frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+clAux.result('CA_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $........: '+form_nc(valor,10));
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=KFPGT_DEBITO) then {* DEBITO AUTOMATICO}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CARTOES           ');
    clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND          ');
    clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND          ');
    clAux.AddParam ('      (CA_VEND=:CA_VEND) AND          ');
    clAux.AddParam ('      (CA_ORDE=:CA_ORDE)              ');
    clAux.consulta.parambyname('CA_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('CA_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('CA_VEND').AsFloat := venda;
    clAux.consulta.parambyname('CA_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- DÉBITO AUTOMÁTICO -----------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
        ProcuraNomeAdm(clAux.result('CA_CADM'),0,self));
      frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+clAux.result('CA_NUME'));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor $........: '+form_nc(valor,10));
      frm_VerDadosPgto.Memo1.lines.Add(' ---------------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=KFPGT_VALES) then {* VALES RECEBIDOS}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_RECEBIDOS         ');
    clAux.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND          ');
    clAux.AddParam ('      (VE_VEND=:VE_VEND) AND          ');
    clAux.AddParam ('      (VE_ORDE=:VE_ORDE)              ');
    clAux.consulta.parambyname('VE_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('VE_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('VE_VEND').AsFloat := venda;
    clAux.consulta.parambyname('VE_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALES RECEBIDOS ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Número do vale.: '+form_t(clAux.result('VE_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor do vale $: '+form_nc(clAux.result('VE_VALO'),10));
      if (clAux.result('VE_TIPO')='P') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE PRESENTE')
      else
      if (clAux.result('VE_TIPO')='S') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE SIMPLES')
      else
      if (clAux.result('VE_TIPO')='T') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE TROCO')
      else
      if (clAux.result('VE_TIPO')='F') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE FUNCIONARIO')
      else
      if (clAux.result('VE_TIPO')='D') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE DESCONTO')
      else
      if (clAux.result('VE_TIPO')='B') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BRINDE')
      else
      if (clAux.result('VE_TIPO')='O') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BÔNUS ');
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
  if (codigo_forma=KFPGT_VALES_EMI) then {* VALES EMITIDOS}
  begin
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM VALES_RECEBIDOS         ');
    clAux.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND          ');
    clAux.AddParam ('      (VE_CAIX=:VE_CAIX) AND          ');
    clAux.AddParam ('      (VE_VEND=:VE_VEND) AND          ');
    clAux.AddParam ('      (VE_ORDE=:VE_ORDE)              ');
    clAux.consulta.parambyname('VE_LOJA').AsFloat := loja;
    clAux.consulta.parambyname('VE_CAIX').AsFloat := caixa;
    clAux.consulta.parambyname('VE_VEND').AsFloat := venda;
    clAux.consulta.parambyname('VE_ORDE').AsInteger := ordem;
    if (clAux.Execute) then
    begin
      frm_VerDadosPgto.Memo1.lines.clear;
      frm_VerDadosPgto.Memo1.lines.Add(' --- VALES VENDIDOS  ------------------------------------');
      frm_VerDadosPgto.Memo1.lines.Add(' Número do vale.: '+form_t(clAux.result('VE_NUME'),10));
      frm_VerDadosPgto.Memo1.lines.Add(' Valor do vale $: '+form_nc((-1)*clAux.result('VE_VALO'),10));
      if (clAux.result('VE_TIPO')='P') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE PRESENTE')
      else
      if (clAux.result('VE_TIPO')='S') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE SIMPLES')
      else
      if (clAux.result('VE_TIPO')='T') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE TROCO')
      else
      if (clAux.result('VE_TIPO')='F') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE FUNCIONARIO')
      else
      if (clAux.result('VE_TIPO')='D') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE DESCONTO')
      else
      if (clAux.result('VE_TIPO')='B') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BRINDE')
      else
      if (clAux.result('VE_TIPO')='O') then
        frm_VerDadosPgto.Memo1.lines.Add(' Tipo de vale...: VALE BÔNUS ');
      frm_VerDadosPgto.Memo1.lines.Add(' --------------------------------------------------------');
    end
    else
      frm_VerDadosPgto.Memo1.lines.Add('>>Forma de pagamento não encontrado');
  end
  else
    frm_VerDadosPgto.Memo1.lines.Add('>>Nenhuma Forma de pagamento informada');
  clAux.desconect;
  clAux.Free;
  frm_VerDadosPgto.showmodal;
  frm_VerDadosPgto.Free;
end;

function Tfrm_ConsultaVenda.GetOrdemFormaPgto(codigo_forma: Real):Integer;
begin
  ds2.dataset.disablecontrols;
  ds2.dataset.first;
  result:=0;
  while (not ds2.dataset.eof) do
  begin
    if (ds2.dataset.fieldbyname('VF_FPGT').AsFloat=codigo_forma) then
    begin
      result := ds2.dataset.fieldbyname('VF_ORDE').AsInteger;
      break;
    end;
    ds2.dataset.next;
  end;
  ds2.dataset.enablecontrols;
end;

procedure Tfrm_ConsultaVenda.edtCaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.edtData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtData2.setfocus;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.grade1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassAuxiliar;
  ponto: TBookmark;
  codigo_loja,codigo_caixa,codigo_venda: Real;
begin
  if (key=K_ENTER) then
    if (Modo=K_MODO_CONSULTA_VENDA_SELECAO) then
    begin
      if (ds1.dataset.active) then
      begin
        y_loja  := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
        y_caixa := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        y_codigo_venda := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        y_ndoc  := ds1.dataset.fieldbyname('VE_NOTA').AsString;
        y_tipz  := ds1.dataset.fieldbyname('VE_TIPZ').AsString;
        close;
      end
      else
      begin
        y_loja := -1;
        y_caixa := -1;
        y_codigo_venda := -1;
        y_ndoc := '-1';
        y_tipz := '1';
        close;
      end;
    end
    else
    if (Modo=K_MODO_CONSULTA_VENDA_NORMAL) then
      if (ds1.dataset.fieldbyname('VE_VEND').AsFloat=0) then //somente quando tiver mais DE UM VENDEDOR
      begin
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT VA_VEDE,VA_TOTA,VA_QTDE,VA_LOJA FROM VENDAS_ATENDIMENTO            ');
        clAux.AddParam ('WHERE (VA_LOJA=:loja) AND (VA_CAIX=:terminal) AND (VA_VEND=:numerovenda)  ');
        clAux.consulta.parambyname('loja').AsFloat        := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
        clAux.consulta.parambyname('terminal').AsFloat    := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('numerovenda').AsFloat := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.Execute;
        clAux.first;
        Application.CreateForm(Tfrm_ConsultaVenda_Vendedores, frm_ConsultaVenda_Vendedores);
        frm_ConsultaVenda_Vendedores.Memo1.lines.clear;
        frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' ');
        frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' Vendedor                       Qtde    Total $');
        frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' ----------------------------------------------');
        while (not clAux.eof) do
        begin
          frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' '+form_nz (clAux.result('VA_VEDE'),6)+' - '+
            form_t  (ProcuraNomeVend(clAux.result('VA_LOJA'),clAux.result('VA_VEDE'),self),20)+' '+
            form_n  (clAux.result('VA_QTDE'),5)+' '+
            form_nc (clAux.result('VA_TOTA'),10));

                        {--->}
          clAux.next;
        end;
        frm_ConsultaVenda_Vendedores.showmodal;
        frm_ConsultaVenda_Vendedores.Free;
        clAux.desconect;
        clAux.Free;
      end;
  if (key=K_F2) then
    if (pnLocal1.visible) then
      edtVend.setfocus
    else
    if (pnLocal2.visible) then
      edtCaixa.setfocus
    else
    if (pnLocal3.visible) then
      edtData1.setfocus;
end;

procedure Tfrm_ConsultaVenda.grade1DblClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (Modo=K_MODO_CONSULTA_VENDA_SELECAO) then
  begin
    if (ds1.dataset.active) then
    begin
      y_loja := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
      y_caixa := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
      y_codigo_venda := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
      y_ndoc  := ds1.dataset.fieldbyname('VE_NOTA').AsString;
      y_tipz  := ds1.dataset.fieldbyname('VE_TIPZ').AsString;
      close;
    end
    else
    begin
      y_loja := -1;
      y_caixa := -1;
      y_codigo_venda := -1;
      y_ndoc  := '-1';
      y_tipz  := '1';
      close;
    end;
  end
  else
  if (Modo=K_MODO_CONSULTA_VENDA_NORMAL) then
    if (ds1.dataset.fieldbyname('VE_VEND').AsFloat=0) then //somente quando tiver mais DE UM VENDEDOR
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT VA_VEDE,VA_TOTA,VA_QTDE,VA_LOJA FROM VENDAS_ATENDIMENTO            ');
      clAux.AddParam ('WHERE (VA_LOJA=:loja) AND (VA_CAIX=:terminal) AND (VA_VEND=:numerovenda)  ');
      clAux.consulta.parambyname('loja').AsFloat        := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
      clAux.consulta.parambyname('terminal').AsFloat    := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
      clAux.consulta.parambyname('numerovenda').AsFloat := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
      clAux.Execute;
      clAux.first;
      Application.CreateForm(Tfrm_ConsultaVenda_Vendedores, frm_ConsultaVenda_Vendedores);
      frm_ConsultaVenda_Vendedores.Memo1.lines.clear;
      frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' ');
      frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' Vendedor                       Qtde    Total $');
      frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' ----------------------------------------------');
      while (not clAux.eof) do
      begin
        frm_ConsultaVenda_Vendedores.Memo1.lines.Add (' '+form_nz (clAux.result('VA_VEDE'),6)+' - '+
          form_t  (ProcuraNomeVend(clAux.result('VA_LOJA'),clAux.result('VA_VEDE'),self),20)+' '+
          form_n  (clAux.result('VA_QTDE'),5)+' '+
          form_nc (clAux.result('VA_TOTA'),10));

                    {--->}
        clAux.next;
      end;
      frm_ConsultaVenda_Vendedores.showmodal;
      frm_ConsultaVenda_Vendedores.Free;
      clAux.desconect;
      clAux.Free;
    end;
end;

procedure Tfrm_ConsultaVenda.edtDataVendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
    edtVend.setfocus;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao4Click(Sender);
  if (key=K_CIMA) then
    edtData1.setfocus;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.grade3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    if (pnLocal1.visible) then
      edtVend.setfocus
    else
    if (pnLocal2.visible) then
      edtCaixa.setfocus
    else
    if (pnLocal3.visible) then
      edtData1.setfocus;
end;

procedure Tfrm_ConsultaVenda.botao4Click(Sender: TObject);
var
  data_vendas1,data_vendas2: String;
  continua: Boolean;
begin
  data_vendas1 := edtData1.text;
  data_vendas2 := edtData2.text;
  if (frm_principal.x_prazo_vendas<>'01/01/1900') and (frm_principal.x_prazo_vendas<>'') then
  begin
    if (not IsDate(edtData1.Text)) then
    begin
      frmDialogo.ExibirMensagem ('Data informada não é válida'
        ,'Consulta Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      edtData1.SetFocus;
    end
    else
    if (not IsDate(edtData2.Text)) then
    begin
      frmDialogo.ExibirMensagem ('Data informada não é válida'
        ,'Consulta Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      edtData2.SetFocus;
    end
    else
    if (StrToDateTime(data_vendas1)<(StrToDateTime(frm_principal.x_prazo_vendas))) then
    begin
      frmDialogo.ExibirMensagem ('Data informada não permitida'
        ,'Consulta Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
      edtData1.SetFocus;
    end
    else
      continua := true;
  end
  else
    continua := true;
  if (continua) then
    if (data_vendas1<>'  /  /    ') then
    begin
      tabela1.close;
      tabela1.sql.clear;
      tabela1.sql.Add ('SELECT VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,VE_QTDE,             ');
      tabela1.sql.Add ('       VE_TOTA,VE_TIPZ,VE_STAT,VE_DESC,VE_PDES,             ');
      tabela1.sql.Add ('       VE_VEND,VE_NOTA,VE_QTD1,VE_QTD2,VE_ONLI,             ');
      tabela1.sql.Add ('       VE_ENVI,VE_CUPO,VE_ECF,VE_FUNC,VE_HORA               ');
      tabela1.sql.Add ('FROM VENDAS                                                 ');
      if (data_vendas2='  /  /    ') then
        tabela1.sql.Add ('WHERE VE_DATA=:data1                                   ')
      else
      begin
        tabela1.sql.Add ('WHERE VE_DATA>=:data1                                  ');
        tabela1.sql.Add (' AND VE_DATA<=:data2                                   ');
      end;
      if (frm_principal.x_caixa_ativo<>0) then
        tabela1.sql.Add (' AND (VE_FUNC='+floattostr(frm_principal.x_caixa_ativo)+')  ');
      if (tipz='1') or (tipz='2') then
        tabela1.sql.Add('  AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                 ');
      tabela1.sql.Add ('   AND (VE_LOJA='+floattostr(frm_principal.x_loja)+')       ');
      if (data_vendas2='  /  /    ') then
        tabela1.ParamByName('data1').AsDateTime := StrToDateTime(data_vendas1)
      else
      begin
        tabela1.ParamByName('data1').AsDateTime := StrToDateTime(data_vendas1);
        tabela1.ParamByName('data2').AsDateTime := StrToDateTime(data_vendas2);
      end;
      tabela1.sql.Add ('ORDER BY VE_DATA,VE_CAIX,VE_LOJA,VE_CODI                    ');
      tabela1.open;
      tabela1.first;
      grade1.setfocus;
    end;
end;

procedure Tfrm_ConsultaVenda.botao3Click(Sender: TObject);
var
  terminal,numero,data: String;
begin
  terminal  := Trim(edtCaixa.text);
  numero    := Trim(edtNumero.text);

  tabela1.close;
  tabela1.sql.clear;
  tabela1.sql.Add ('SELECT VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,VE_QTDE,                 ');
  tabela1.sql.Add ('       VE_TOTA,VE_TIPZ,VE_STAT,VE_DESC,VE_PDES,                 ');
  tabela1.sql.Add ('       VE_VEND,VE_NOTA,VE_QTD1,VE_QTD2,VE_ONLI,                 ');
  tabela1.sql.Add ('       VE_ENVI,VE_CUPO,VE_ECF,VE_FUNC,VE_HORA                   ');
  tabela1.sql.Add ('FROM VENDAS                                                     ');
  tabela1.sql.Add ('WHERE (VE_LOJA='+floattostr(frm_principal.x_loja)+')            ');
  if (frm_principal.x_caixa_ativo<>0) then
    tabela1.sql.Add (' AND (VE_FUNC='+floattostr(frm_principal.x_caixa_ativo)+')  ');
  if (terminal<>'') then
    tabela1.sql.Add ('  AND (VE_CAIX='+terminal+')                                ');
  if (numero<>'') then
    tabela1.sql.Add ('  AND (VE_CODI='+numero+')                                  ');
  if (tipz='1') or (tipz='2') then
    tabela1.sql.Add('  AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                     ');
  if (frm_principal.x_prazo_vendas<>'01/01/1900') then
    tabela1.sql.Add ('  AND VE_DATA>=:data1                                        ');
  if (frm_principal.x_prazo_vendas<>'01/01/1900') then
    tabela1.ParamByName('data1').AsDateTime := StrToDateTime(frm_principal.x_prazo_vendas);
  tabela1.sql.Add ('ORDER BY VE_DATA,VE_CAIX,VE_LOJA,VE_CODI                        ');
  tabela1.open;
  tabela1.first;
  grade1.setfocus;
end;

procedure Tfrm_ConsultaVenda.botao2Click(Sender: TObject);
var
  data,codigo: String;
  continua: Boolean;
begin
  codigo := Trim(edtVend.text);
  if (edtDataVend.Text<>('  /  /    ')) then
  begin
    if (frm_principal.x_prazo_vendas<>'01/01/1900') then
    begin
      if StrToDateTime(edtDataVend.Text)<StrToDateTime(frm_principal.x_prazo_vendas) then
      begin
        frmDialogo.ExibirMensagem ('Data informada não permitida'
          ,'Consulta Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        continua := false;
        edtDataVend.SetFocus;
      end
      else
        continua := true;
    end
    else
      continua := true;
  end
  else
    continua := true;
  if (continua) then
    if (codigo<>'') then
    begin
      tabela1.close;
      tabela1.sql.clear;
      tabela1.sql.Add ('SELECT VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,VE_QTDE,             ');
      tabela1.sql.Add ('       VE_TOTA,VE_TIPZ,VE_STAT,VE_DESC,VE_PDES,             ');
      tabela1.sql.Add ('       VE_VEND,VE_NOTA,VE_QTD1,VE_QTD2,VE_ONLI,             ');
      tabela1.sql.Add ('       VE_ENVI,VE_CUPO,VE_ECF,VE_FUNC,VE_HORA               ');
      tabela1.sql.Add ('FROM VENDAS                                                 ');
      tabela1.sql.Add ('WHERE (VE_VEND='+codigo+') AND                              ');
      tabela1.sql.Add ('      (VE_LOJA='+floattostr(frm_principal.x_loja)+')        ');
      if (frm_principal.x_caixa_ativo<>0) then
        tabela1.sql.Add (' AND (VE_FUNC='+floattostr(frm_principal.x_caixa_ativo)+')  ');
      if (edtDataVend.text<>('  /  /    ')) then
      begin
        data := FormataDataVendas(StrToDate(edtDataVend.Text));
        tabela1.sql.Add ('  AND (VE_DATA='+chr(39)+data+chr(39)+')               ');
      end
      else
      if StrToDateTime(frm_principal.x_prazo_vendas)<>StrToDateTime('01/01/1900') then
        tabela1.sql.Add ('  AND VE_DATA>=:data1                                ');
      if (tipz='1') or (tipz='2') then
        tabela1.sql.Add('  AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                 ');
      if (StrToDateTime(frm_principal.x_prazo_vendas)<>StrToDateTime('01/01/1900')) and (edtDataVend.text=('  /  /    ')) then
        tabela1.ParamByName('data1').AsDateTime := StrToDateTime(frm_principal.x_prazo_vendas);
      tabela1.sql.Add ('ORDER BY VE_DATA,VE_CAIX,VE_LOJA,VE_CODI                    ');
      tabela1.open;
      tabela1.first;
      grade1.setfocus;
    end;
end;

end.
