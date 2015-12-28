unit un_RelOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, jpeg, DB, DBTables;

type
  Tfrm_RelOrcamento = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    qrEmpresa: TQRLabel;
    qrEndereco: TQRLabel;
    qrTelefones: TQRLabel;
    qrBairro: TQRLabel;
    QRBand4: TQRBand;
    qrReferencia: TQRLabel;
    qrDescricao: TQRLabel;
    qrQuant: TQRLabel;
    qrPreco: TQRLabel;
    qrTotal: TQRLabel;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrDesconto: TQRLabel;
    qrTotGeral: TQRLabel;
    qryAtendimento: TQuery;
    qrcdo: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    qrPagamento: TQRLabel;
    QRShape7: TQRShape;
    qrValidade: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRShape9: TQRShape;
    qrFrete: TQRLabel;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRShape13: TQRShape;
    qrFoco: TQRLabel;
    QRShape14: TQRShape;
    Des: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape17: TQRShape;
    QRLabel7: TQRLabel;
    QRShape19: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    qrPrazo: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    qrVendedor: TQRLabel;
    qrCliente: TQRLabel;
    qrEndCli: TQRLabel;
    qrCidCli: TQRLabel;
    qrTelCli: TQRLabel;
    qrBairroCli: TQRLabel;
    qrEstadoCli: TQRLabel;
    qrCep: TQRLabel;
    qrEmail: TQRLabel;
    qrCpf: TQRLabel;
    qrInsc: TQRLabel;
    qrContato: TQRLabel;
    qrmObs: TQRMemo;
    QRSysData2: TQRSysData;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    totalGeral :Double;
    cdo :Integer;
    { Private declarations }
    procedure MontaTitulo;
    procedure MontaCliente;
    procedure MontaSql;
    function  FocoCodigo : String;
  public
    { Public declarations }
  end;

var
  frm_RelOrcamento: Tfrm_RelOrcamento;

implementation

uses principal,funcoes2,funcoes1,procura,auxiliar, un_ConfirmaAtendimento,
  Mask, StdCtrls;

{$R *.dfm}

{ Tfrm_RelOrcamento }

procedure Tfrm_RelOrcamento.MontaTitulo;
begin
  qrEmpresa.Caption   := frm_principal.x_empresa;
  qrEndereco.Caption  := frm_principal.x_endereco;
  qrBairro.Caption    := frm_principal.x_bairro+' - '+frm_principal.x_cidade+' '+frm_principal.x_estado;
  qrContato.Caption   := 'Contato: '+frm_ConfirmaAtendimento.edtContato.Text;
  qrTelefones.Caption := 'Telefone: '+frm_principal.x_telefone+'  '+frm_principal.x_fax;
  if (frm_principal.x_vendedor = 0) then
    qrVendedor.Caption  := ' INDEFINIDO'
  else
    qrVendedor.caption := ' '+form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),30);
  try
    QRImage1.Picture.LoadFromFile('C:\NATIVA\imgRelatorio.jpg');
  Except

  end;
  MontaCliente;
end;

procedure Tfrm_RelOrcamento.FormCreate(Sender: TObject);
begin
 MontaTitulo;
 MontaSql;
 cdo := 0;
end;

procedure Tfrm_RelOrcamento.MontaCliente;
Var
  clAux: TClassAuxiliar;
  endereco,numero,cep,telefone :String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecredito,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CL_NOME,CL_ENDE,CL_FONE,CL_CIDA,CL_ESTA,   ');
  clAux.AddParam ('       CL_CEP,CL_BAIR,CL_EMAI,CL_TIPO_LOGRADOURO, ');
  clAux.AddParam ('       CL_NUMERO,CL_COMPLEMENTO,CL_CPF,CL_IDEN    ');
  clAux.AddParam ('FROM CRECLI                                       ');
  clAux.AddParam ('WHERE (CL_CODI=:CODI)                             ');
  clAux.consulta.parambyname('CODI').AsFloat  := frm_ConfirmaAtendimento.codigoCli;
  clAux.Execute;
  numero := IntToStr(clAux.Result('CL_NUMERO'));
  if (numero = '0')then
    numero := '';
  endereco := clAux.Result('CL_TIPO_LOGRADOURO')+' '+clAux.Result('CL_ENDE')+' '+numero+' '+clAux.Result('CL_COMPLEMENTO');
  if (clAux.RecCount > 0) then
    qrCliente.Caption   := 'Cliente: '+ clAux.Result('CL_NOME')
  else
    qrCliente.Caption   := 'Cliente: '+ frm_ConfirmaAtendimento.edtNome.GetValor;
  qrEndCli.Caption    := 'Endereço: '+ endereco;
  qrCidCli.Caption    := 'Cidade: '+ clAux.Result('CL_CIDA');
  if (clAux.Result('CL_FONE')) <> '' then
    telefone          := '(' + copy(clAux.Result('CL_FONE'),1,2)+') '+copy(clAux.Result('CL_FONE'),3,4)+'-'+copy(clAux.Result('CL_FONE'),7,4)
  else
    telefone          := '';
  qrTelCli.Caption    := 'Telefone: '+ telefone;
  qrBairroCli.Caption := 'Bairro: '+ clAux.Result('CL_BAIR');
  qrEstadoCli.Caption := 'Estado: '+ clAux.Result('CL_ESTA');
  if (clAux.Result('CL_CEP')) <> '' then
    cep               := copy(clAux.Result('CL_CEP'),1,5) +'-'+ copy(clAux.Result('CL_CEP'),6,3)
  else
    cep               := cep;
  qrCep.Caption       := 'C.E.P: '+ cep;
  qrEmail.Caption     := 'E-mail: '+ clAux.Result('CL_EMAI');
  if (Length(clAux.Result('CL_CPF'))=11) then
  begin
    qrCpf.Caption     := 'C.P.F: '+ FormataCNPJ(clAux.Result('CL_CPF'));
    qrInsc.Caption    := 'R.G: '+ clAux.Result('CL_IDEN');
  end
  else
  begin
    qrCpf.Caption     := 'C.N.P.J: '+ FormataCNPJ(clAux.Result('CL_CPF'));
    qrInsc.Caption    := 'I.E: '+ clAux.Result('CL_IDEN');
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_RelOrcamento.MontaSql;
begin
  qryAtendimento.DatabaseName := databaseprodutos;
  with (qryAtendimento) do
  begin
    Close;
    SQL.Clear;
    SQL.Add ('SELECT * FROM ITENS_ATENDIMENTOS        ');
    SQL.Add ('WHERE (IA_LOJA=:LOJA)AND(IA_CAIX=:CAIX) ');
    SQL.Add ('  AND (IA_VEND=:VEND)                   ');
    ParamByName('LOJA').AsFloat  := frm_principal.x_loja;
    ParamByName('CAIX').AsFloat  := frm_principal.x_terminal;
    ParamByName('VEND').AsFloat  := frm_principal.x_codigo_atendimento;
    open;
  end;
end;

procedure Tfrm_RelOrcamento.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrReferencia.Caption := FocoCodigo;
  qrDescricao.Caption  := Copy(ProcuraNomeProdutos_1(qryAtendimento.FieldByName('IA_GRUP').AsFloat,qryAtendimento.FieldByName('IA_SUBG').AsFloat,
                                                qryAtendimento.FieldByName('IA_PROD').AsFloat,Self),1,38);
  qrQuant.Caption      := IntToStr(qryAtendimento.FieldByName('IA_QTDE').AsInteger);
  qrPreco.Caption      := form_nc(qryAtendimento.FieldByName('IA_PVEN').AsFloat,14);
  qrTotal.Caption      := form_nc(qryAtendimento.FieldByName('IA_TOTA').AsFloat,14);
  cdo                  := cdo +1;
  qrcdo.Caption        := IntToStr(Cdo);
  totalGeral           := totalGeral + qryAtendimento.FieldByName('IA_TOTA').AsFloat;
end;

procedure Tfrm_RelOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 qryAtendimento.Close;
end;

procedure Tfrm_RelOrcamento.QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
 desconto: Double;
begin
  qrPrazo.Caption        := frm_ConfirmaAtendimento.edtprazo.Text;
  qrPagamento.Caption    := frm_ConfirmaAtendimento.edtpagamento.Text;
  qrFrete.Caption        := frm_ConfirmaAtendimento.cbFrete.Text;
  qrValidade.Caption     := frm_ConfirmaAtendimento.edtvalidade.Text;
  qrmObs.Lines.CommaText := frm_ConfirmaAtendimento.Memo1.Lines.CommaText;
  desconto               := frm_ConfirmaAtendimento.edtDesconto.GetValor;
  qrTotGeral.Caption     := form_nc(totalGeral-desconto,14);
  if (desconto = 0) then
  begin
    QRLabel5.Caption    := '';
    qrDesconto.Caption  := '';
    QRLabel6.Top        := 4;
    qrTotGeral.Top      := 4;
  end
  else
  begin
    QRLabel5.Caption    := 'Desconto( - ): ';
    qrDesconto.Caption  := form_nc(desconto,14);
    QRLabel6.Top        := 26;
    qrTotGeral.Top      := 26;
  end;
  totalGeral          := 0;
  cdo                 := 0;
end;

function Tfrm_RelOrcamento.FocoCodigo: String;
begin
  if (frm_principal.x_ordem_codigo= 1) then
    focoCodigo     := form_nz(qryAtendimento.FieldByName('IA_GRUP').AsFloat,2)+'-'+Form_nz(qryAtendimento.FieldByName('IA_SUBG').AsFloat,2)
                 +'-'+Form_nz(qryAtendimento.FieldByName('IA_PROD').AsFloat,2)
  else if (frm_principal.x_ordem_refinterna=1) then
      FocoCodigo   := ProcuraReferencia(qryAtendimento.FieldByName('IA_GRUP').AsFloat,qryAtendimento.FieldByName('IA_SUBG').AsFloat,
                                        qryAtendimento.FieldByName('IA_PROD').AsFloat,self)
  else if (frm_principal.x_ordem_reffabric=1) then
      FocoCodigo   := ProcuraReferenciaFabricante(qryAtendimento.FieldByName('IA_GRUP').AsFloat,qryAtendimento.FieldByName('IA_SUBG').AsFloat,
                                                  qryAtendimento.FieldByName('IA_PROD').AsFloat,self);
end;

procedure Tfrm_RelOrcamento.QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (frm_principal.x_ordem_codigo= 1) then
    qrFoco.Caption := 'Código'
  else if (frm_principal.x_ordem_refinterna=1) then
    qrFoco.Caption := 'Referência'
  else if (frm_principal.x_ordem_reffabric=1) then
    qrFoco.Caption := 'Ref.Fabricante';
end;

end.
