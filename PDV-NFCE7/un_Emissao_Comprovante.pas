unit un_Emissao_Comprovante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBTables;

type
  Tfrm_Emissao_Comprovante = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCliente: TMaskEdit;
    edtContrato: TMaskEdit;
    btnComprovante: TButton;
    botao_sair: TPanel;
    Label22: TLabel;
    edtPrestacao: TMaskEdit;
    Label4: TLabel;
    procedure btnComprovanteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ImprimirComprovante;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrestacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnComprovanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure edtContratoExit(Sender: TObject);
    procedure edtPrestacaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codLoja: String;
    descricao, endereco, cidade, uf: String;
    nomeCliente: String;
    numeroComprovantes: Integer;
    dataVencimento, dataPagamento: String;
    statusPagamento: Real;
    juros, valorPago, valorParcela: Real;
    numeroVia: Integer;
  end;

var
  frm_Emissao_Comprovante: Tfrm_Emissao_Comprovante;

implementation

uses principal, funcoes2, unLancReceb2, un_frmConsulta1, mem_prnt, unDialogo, un_Opcoes_2via;

{$R *.dfm}

procedure Tfrm_Emissao_Comprovante.btnComprovanteClick(Sender: TObject);
var
  Qry: TQuery;
  verificaPrestacaoExiste: Integer;
  numeroDaPrestacao: Integer;
begin
  numeroVia := 1;
        //**********************************************************************************
        //*************VERIFICA SE A PRESTAÇÃO EXISTE***************************************
  Qry := TQuery.Create(Application);
  with (Qry) do
  begin
    try
      DataBaseName := 'CREDITO';
      Sql.Add('Select COUNT(*) as NUMERO_PRESTACOES           ');
      Sql.Add('From CREPRABR                                  ');
      Sql.Add('Where (PC_CONT='+Trim(edtContrato.Text)+') AND ');
      Sql.Add('      (PC_CLIE='+Trim(edtCliente.Text)+')  AND ');
      Sql.Add('      (PC_LOJA='+floattostr(frm_principal.x_loja)+')       ');
      open;
      verificaPrestacaoExiste := fieldbyname('NUMERO_PRESTACOES').AsInteger;
    finally
      destroy;
    end;
                //**********************************************************************************
    numeroDaPrestacao := strtoint(Trim(edtPrestacao.Text));
    if (numeroDaPrestacao > verificaPrestacaoExiste) or (numeroDaPrestacao = 0) then
    begin
      frmDialogo.ExibirMensagem ('Prestação não existe!',
        '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
      edtPrestacao.Text := '';
      edtPrestacao.SetFocus;
    end
    else
    if(edtCliente.Text <> '') and (edtContrato.Text <> '') and (edtPrestacao.Text <> '') then
    begin
                //**********************************************************************************
      Qry := TQuery.Create(Application);
      with (Qry) do
      begin
        try
          DataBaseName := 'CREDITO';
          Sql.Add('Select PC_LOJA, PC_STAT                        ');
          Sql.Add('From CREPRABR                                  ');
          Sql.Add('Where (PC_CONT='+Trim(edtContrato.Text)+') AND ');
          Sql.Add('      (PC_CLIE='+Trim(edtCliente.Text)+')  AND ');
          Sql.Add('      (PC_NPRE='+Trim(edtPrestacao.Text)+')    ');
          open;
          codLoja := fieldbyname('PC_LOJA').AsString;
          statusPagamento := fieldbyname('PC_STAT').AsFloat;
        finally
          destroy;
        end;
                 //*********************************************************************************
        if (statusPagamento=1) then
        begin
          numeroComprovantes := frm_principal.x_qtde_comprovante_pagamento;
          while (numeroComprovantes>0) do
          begin
            ImprimirComprovante;
            if (numeroComprovantes <> 1) then
              frmDialogo.ExibirMensagem ('Retire o comprovante!',
                '2ª Via',[mbOk],frm_principal.x_pathimg+'iconequestion.bmp',
                250,200);
            numeroComprovantes := numeroComprovantes - 1;
            numeroVia := numeroVia + 1;
          end;
          frm_Opcoes_2via.Close;
          frm_Emissao_Comprovante.Close;
        end
        else
          frmDialogo.ExibirMensagem ('Prestação em aberto!',
            '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
            250,200);
      end;
    end
    else
      frmDialogo.ExibirMensagem ('Os campos não podem ficar em branco!',
        '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
  end;
end;

procedure Tfrm_Emissao_Comprovante.FormActivate(Sender: TObject);
begin
  edtCliente.Text := frm_Consulta1.edtCodCli.Text;
end;

procedure Tfrm_Emissao_Comprovante.ImprimirComprovante;
var
  Qry: TQuery;
  ix: Integer;
begin
  with (frm_mem_print) do
  begin
                {configurando o gerador de relatorios}
    if (frm_principal.x_modelo_impressao_geral=0) then //MATRICIAL
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
    end
    else
    if (frm_principal.x_modelo_impressao_geral=1) then //JATO DE TINTA
    begin
      PrepareReport;
      frm_principal.x_col_impressao := 40;
      frm_principal.x_arq_impressao := 'sliptran.rel';
      frm_principal.x_comando       := '12c';
      frm_principal.x_tam_fonte     := 12;
      flagImprimeCabecalho := false;
      flagImprimeSlip      := true;
    end;
    AddLine ('--------------------------------------');
    AddLine ('      COMPROVANTE DE PAGAMENTO        ');
    AddLine ('                '+inttostr(numeroVia)+'-Via                 ');
    AddLine ('--------------------------------------');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName :=  'CONTASPAGAR';
        Sql.Add('Select CC_DESC, CC_ENDE, CC_CIDA, CC_UF  ');
        Sql.Add('From   CENTROS_DE_CUSTO                  ');
        Sql.Add('Where CC_CODI='+Trim(codLoja)+'          ');
        open;
        descricao    := fieldbyname('CC_DESC').AsString;
        endereco     := fieldbyname('CC_ENDE').AsString;
        cidade       := fieldbyname('CC_CIDA').AsString;
        uf           := fieldbyname('CC_UF').AsString;
      finally
        destroy;
      end;
                //************************************************************************************
    AddLine (''+descricao+'');
    AddLine (''+endereco+'');
    AddLine (''+cidade+' - '+uf+'');
    AddLine ('');
    AddLine ('Cliente: '+Trim(edtCliente.Text)+'');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName := 'CREDITO';
        Sql.Add('Select CL_NOME                         ');
        Sql.Add('From CRECLI                            ');
        Sql.Add('Where CL_CODI='+Trim(edtCliente.Text)+' ');
        open;
        nomeCliente := fieldbyname('CL_NOME').AsString;
      finally
        destroy;
      end;
                //************************************************************************************
    AddLine (''+nomeCliente+'');
    AddLine ('');
    AddLine ('Contrato     Prest      Valor    Juros');
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
      try
        DataBaseName := 'CREDITO';
        Sql.Add('Select PC_VALO                                ');
        Sql.Add('From CREPRABR                                 ');
        Sql.Add('Where (PC_CLIE='+Trim(edtCliente.Text)+')      ');
        Sql.Add('      AND (PC_NPRE='+Trim(edtPrestacao.Text)+')    ');
        Sql.Add('      AND (PC_CONT='+Trim(edtContrato.Text)+') ');
        open;
        valorParcela := fieldbyname('PC_VALO').AsFloat;
      finally
        destroy;
      end;
                //************************************************************************************
    Qry := TQuery.Create(Application);
    with (Qry) do
    begin
      try
        DataBaseName := 'CREDITO';
        Sql.Add('Select (PC_VPAG-PC_VALO) as JUROS,              ');
        Sql.Add('        PC_VPAG, PC_DTPG, PC_DVTO               ');
        Sql.Add('From CREPRABR                                   ');
        Sql.Add('Where (PC_CLIE='+Trim(edtCliente.Text)+')       ');
        Sql.Add('      AND (PC_NPRE='+Trim(edtPrestacao.Text)+') ');
        Sql.Add('      AND (PC_CONT='+Trim(edtContrato.Text)+')  ');
        Sql.Add('      AND (PC_LOJA='+Trim(codLoja)+')                 ');
        open;
        juros          := fieldbyname('JUROS').AsFloat;
        dataVencimento := fieldbyname('PC_DVTO').AsString;
        dataPagamento  := fieldbyname('PC_DTPG').AsString;
        valorPago      := fieldbyname('PC_VPAG').AsFloat;
      finally
        destroy;
      end;
                //************************************************************************************
      AddLine ('  '+form_t(Trim(edtContrato.Text),6)+'       '+form_t(Trim(edtPrestacao.Text),3)+'   '+form_nc(valorParcela,8)+'   '+form_nc(juros,6));
      AddLine ('');
      AddLine ('Data Vencimento             '+dataVencimento+'');
      AddLine ('Data Pagamento              '+dataPagamento+'');
      AddLine ('Total Pago                  R$'+form_nc(valorPago,8)+'');
      AddLine ('');
      AddLine ('--------------------------------------');
      AddLine ('      OBRIGADO PELA PREFERENCIA       ');
      AddLine ('--------------------------------------');

      ix:=1;
      while (ix<=frm_principal.x_qtde_linhas_entre_SLIPS_TRANSFERENCIA) do
      begin
        frm_mem_print.AddLine('');
        ix:=ix+1;
      end;
      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      if (frm_principal.x_slip_na_tela_TRANSFERENCIA) then
        frm_mem_print.showmodal //IMPRESSAO NA TELA
      else
        frm_mem_print.btnImprimiri.click; //IMPRIMINDO DIRETO, SEM PASSAR PELA TELA
    end;
  end;
end;

procedure Tfrm_Emissao_Comprovante.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=K_F5) then
    btnComprovante.Click;
  if(key=K_ESC) then
    close;
end;

procedure Tfrm_Emissao_Comprovante.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Emissao_Comprovante.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=K_ENTER) then
    if (edtCliente.Text = '') then
    begin
      frmDialogo.ExibirMensagem ('Digite o código do cliente!',
        '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
      edtCliente.SetFocus;
    end
    else
      edtContrato.SetFocus;
  if(key=K_ESC) then
    close;
  if(key=K_BAIXO) then
    edtContrato.SetFocus;
end;

procedure Tfrm_Emissao_Comprovante.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=K_ENTER) then
    if (edtContrato.Text = '') then
    begin
      frmDialogo.ExibirMensagem ('Digite o número do contrato!',
        '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
      edtContrato.SetFocus;
    end
    else
      edtPrestacao.SetFocus;
  if(key=K_ESC) then
    close;
  if(key=K_CIMA) then
    edtCliente.SetFocus;
  if(key=K_BAIXO) then
    edtPrestacao.SetFocus;
end;

procedure Tfrm_Emissao_Comprovante.edtPrestacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=K_ENTER) then
    if (edtPrestacao.Text = '') then
    begin
      frmDialogo.ExibirMensagem ('Digite o número da prestação!',
        '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
        250,200);
      edtPrestacao.SetFocus;
    end
    else
      btnComprovante.SetFocus;
  if(key=K_ESC) then
    close;
  if(key=K_CIMA) then
    edtContrato.SetFocus;
  if(key=K_BAIXO) then
    btnComprovante.SetFocus;
end;

procedure Tfrm_Emissao_Comprovante.btnComprovanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(key=K_ESC) then
    close;
  if(key=K_F5) then
    btnComprovante.Click;
  if(key=K_CIMA) then
    edtPrestacao.SetFocus;
  if(key=K_BAIXO) then
    botao_sair.SetFocus;
end;

procedure Tfrm_Emissao_Comprovante.edtClienteExit(Sender: TObject);
begin
  if (edtCliente.Text = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o código do cliente!',
      '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
    edtCliente.SetFocus;
  end;
end;

procedure Tfrm_Emissao_Comprovante.edtContratoExit(Sender: TObject);
begin
  if (edtContrato.Text = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o número do contrato!',
      '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
    edtContrato.SetFocus;
  end
  else
    edtContrato.Text := form_nz(strtofloat(Trim(edtContrato.Text)),6);
end;

procedure Tfrm_Emissao_Comprovante.edtPrestacaoExit(Sender: TObject);
begin
  if (edtPrestacao.Text = '') then
  begin
    frmDialogo.ExibirMensagem ('Digite o número da prestação!',
      '2ª Via',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
    edtPrestacao.SetFocus;
  end;
end;

end.
