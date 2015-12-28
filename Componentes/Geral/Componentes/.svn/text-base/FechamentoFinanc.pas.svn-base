unit FechamentoFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,TipoDef,Db,DbTables,
  FuncoesGlobais,VariaveisSafi,DetalFinanc,Grids;

type
// TOrigem   = (ORC,NTF,PDV,COM,PED);
// TPagouRec = (Pagamento,Recebimento);

 TFechamentoFinanc = class(TComponent)
  private
    { Private declarations }
    VarNaoZeraVendedor : Boolean;
    VarOrigem        : String;
    VarGeraDuplicata  : Boolean;
    FBAncoDados    : TDataBase;
    FActive        : Boolean;
    VarCliForn     : String;
    VarTemVendedor : Boolean;
    VarPag_Rec     : TPagouRec;
    VarPdvOrc      : String;
    VarTipoOrigem  : TOrigem;
    VarAborta      : Boolean;
    VarDetalFechamento : TDetalFinanc;
    FFormaDePagamento : String;
    FDesabilitaDesc: Boolean;
    FReduzido: Boolean;
    procedure preenchegrids;
    Procedure GravaTabelaFinanceira;
    Procedure GravaTabelaBaixa;
    procedure SetActive(const Value: Boolean);
    Function  NomeCliforn:String;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  destroy ; override;
  public
    { Public declarations }
    PercComissComp,PercComissAberto,PercComissFat,PercComissGer,
    VlComissComp,VlComissGer,VlComissAberto,VlComissFat:Double;

    GeraFinanceiro,Ativo,VarNaoExclui,InserindoDados,
    AlteraComiss,LtExcedido,FoiCancelado   : Boolean;

    CondPagIni,GrupoPagamento : String;
    TipoGrupoPagamento : string;
    VlLCredIni,Troco,VlDesconto,Desconto:Currency;
    DescontoPercentual  : Currency;
    VAlorPagoFinal : Currency;
    FormadePgto    : String;
    ConddePgto     : String;
    QtdLCredIni,Gerente,VendedorFinal  : Integer;
    valorparcial   : Currency;
    // Variáveis de Retorno
    Formadepgtoinicial : String;
    Condpgtoinicial    : String;
    clientefornecedor  : String;
    DocOrigem,Documento: String;

    Empresa            : String;
    RetornoAlmoxarifadoPadrao : String;
    DatadeEmissao      :TDateTime;
    Caixa              :String;
    Operacao           :String;
    InfComp            :TInfComplementar;
    Procedure          Deleta;
    Procedure          DeletaBaixados;
    Procedure          GravaDuplicata;
    Property Reduzido  :Boolean    Read FReduzido Write FReduzido Default False;
  published
    { Published declarations }
   Property Origem      : TOrigem read Vartipoorigem write VarTipoOrigem default ORC;
   property Active      : Boolean read FActive write SetActive default False;
   property temvendedor : boolean read VarTemVendedor write VarTemVendedor default False;
   property GeraDuplicata : boolean read VarGeraDuplicata write VarGeraDuplicata default False;
   property pagamento_Recebimento :TPagouRec read varpag_rec write varpag_rec Default Recebimento;
   Property AbortaaoCancelar      :Boolean   read varaborta  write varaborta  Default False;
   Property DesabilitaDesconto    :Boolean   read FDesabilitaDesc  write FDesabilitaDesc  Default False;
   property NaoZeraVendedor       :Boolean   read varnaozeravendedor write varnaozeravendedor Default False;
   Property Detalhamento          :TDetalFinanc read VarDetalFechamento write VarDetalFechamento;
   Property NaoExcluiComBaixa     :Boolean  read VarNaoExclui write VarNaoExclui default False;
   Property BancodeDados          :TDataBase read FBancoDados write FBancoDados ;
   Property FormaDePagamento      : String    Read FFormaDePagamento Write FFormaDePagamento;
  end;

procedure Register;

implementation

uses
Fechamento;

procedure Register;
begin
  RegisterComponents('Sistema', [TFechamentoFinanc]);
end;

{ TFechamentoFinanc }


constructor TFechamentoFinanc.Create(AOwner: TComponent);
begin

   inherited Create(AOwner);
   Ativo         := False;
   VlLCredIni    := 0;
   QtdLCredIni   := 0;
   VarTipoOrigem := PDV;
   VarPag_rec    := Recebimento;
   FoiCancelado  := False;
end;

destructor TFechamentoFinanc.destroy;
begin
  inherited destroy;
end;

procedure TFechamentoFinanc.preenchegrids;
var
qry  : tquery;
i   :  integer;
begin
    frm_fechamento.CondicoesPagamento.colwidths[1] := -1;
    frm_fechamento.CondicoesPagamento.colwidths[2] := -1;
    frm_fechamento.CondicoesPagamento.colwidths[3] := -1;
    frm_fechamento.CondicoesPagamento.colwidths[4] := -1;
    frm_fechamento.CondicoesPagamento.colwidths[5] := -1;
    frm_fechamento.CondicoesPagamento.colwidths[6] := -1;
    qry := tquery.create(nil);
    qry.databasename := 'BD';
    with qry do begin

         sql.clear;
         if Not Freduzido then begin
               sql.add('Select Codigo,Descricao,DescontoPerc,DescontoValor,Mora,MoraMes,Multa,MultaPerc,ParcAberta,Limite_Cred from CondPag');
               sql.add('Where PagAVista <>:PagAVista');
               sql.add('And '+IIfs(Pagamento_recebimento = Pagamento,'Pagamento','Recebimento')+' = ''T''');
               sql.add('Order By ParcAberta Desc,Codigo');
               ParamByName('PagAVista').AsString := 'S';
         end else begin
               sql.add('Select FormaPg.Descricao,FormaPg.Codigo,GrupoPg.Tipo,LIMITE_CRED from FormaPg');
               sql.add('Left Join GrupoPg on (FormaPg.Grupo = GrupoPg.Codigo)');
               sql.add('Order By FormaPg.Codigo');
               open;
               PreencheGrid(frm_fechamento.CondicoesPagamento,Qry,[]);
               Qry.Destroy;
               With Frm_Fechamento do begin
                     Parcelas.Visible              := False;
                     Label2.Visible                := False;
                     ValorParcelado.Visible        := False;
                     CondicoesPagamento.Tag        := 1;
                     CondicoesPagamento.Cells[0,0] := 'Formas de Pagamento';
                     ActiveControl                 := CondicoesPagamento;
                     CondicoesPagamento.Height     := Vendedor.Height + Vendedor.Top + 10;
                     Height := CondicoesPagamento.Height + 10;
               end;
               Exit;
         end;

         open;
         frm_fechamento.CondicoesPagamento.cells[00,01]  := 'Nenhuma Condição de Pagamento';
         while not eof do begin
                frm_fechamento.CondicoesPagamento.rowcount := frm_fechamento.CondicoesPagamento.rowcount + 1;
                frm_fechamento.CondicoesPagamento.cells[00,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('Descricao').asstring;
                frm_fechamento.CondicoesPagamento.cells[01,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('Codigo').asstring;
                frm_fechamento.CondicoesPagamento.cells[02,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('Mora').asstring;
                frm_fechamento.CondicoesPagamento.cells[03,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('DescontoPerc').asstring;
                frm_fechamento.CondicoesPagamento.cells[04,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('DescontoValor').asstring;
                frm_fechamento.CondicoesPagamento.cells[05,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('MultaPerc').asstring;
                frm_fechamento.CondicoesPagamento.cells[06,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('Multa').asstring;
                frm_fechamento.CondicoesPagamento.cells[07,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('MoraMes').asstring;
                frm_fechamento.CondicoesPagamento.cells[08,frm_fechamento.CondicoesPagamento.rowcount - 1] := fieldbyname('Limite_Cred').asstring;
                qry.next;
         end;
         free;
    end;

end;

procedure TFechamentoFinanc.gravatabelafinanceira;
var
i : integer;
qry : tquery;
begin
{    If Not (goRowSelect in Frm_Fechamento.CondicoesPagamento.Options) then
      Exit;}


//      Deleta;


    try
                qry := tquery.create(nil);
                qry.databasename := 'BD';
                with qry do begin
{                   sql.clear;
                   sql.add('Delete From ');
                   if VarPag_rec = Recebimento then begin
                      sql.add(' PagRec ');
                      sql.add(' Where Empresa_PagRec  =:Empresa');
                      sql.add(' And   Origem_PagRec   =:Origem');
                      sql.add(' And   Cod_Cli_PagRec  =:CliForn');
                      sql.add(' And   Prpedn          =:Documento');
                      sql.add(' And   Caixa_PagRec    =:Caixa');
                      ParamByNAme('Caixa').AsString      := Caixa;
                   end else begin
                      sql.add(' Pagament ');
                      sql.add(' Where Empresa_Pag   =:Empresa');
                      sql.add(' And   Origem_Pag    =:Origem');
                      sql.add(' And   Cod_Forn_Pag  =:CliForn');
                      sql.add(' And   Prpedn        =:Documento');
                   end;
                   ParamByNAme('Empresa').AsString        := Empresa;
                   ParamByNAme('CliForn').AsString        := ClienteFornecedor;
                   ParamByNAme('Origem').AsString         := VarOrigem;
                   ParamByNAme('Documento').AsString      := Documento;
                   execsql;
                   if VarPag_rec = Recebimento then
                      sql[1] := ' BaixaRec '
                   else
                      sql[1] := ' BaixaPag ';
                   execsql;}



                   sql.clear;
                   if VarPag_rec = Recebimento then begin
                       sql.add('Insert into BaixaRec');
                       sql.add('(               ');
                       sql.add(' Empresa_PagRec,     ');
                       sql.add(' DocNum_PagRec,     ');
                       sql.add(' Cod_Cli_PagRec, ');
                       sql.add(' DtDocVen_PagRec, ');
                       sql.add(' DtDocEmi_PagRec, ');
                       sql.add(' Nome_Cli_PagRec,');
                       sql.add(' Origem_PagRec, ');
                       sql.add(' Sit_PagRec, ');
                       sql.add(' CentCust_PagRec, ');
                       sql.add(' Loc_PagRec, ');
                       sql.add(' CategMov_PagRec, ');
                       sql.add(' SubCateg_PagRe, ');
                       sql.add(' Prpedn, ');
                       sql.add(' VlEmit_PagRec ');
                       sql.add(',Duplicata_PagRec');
                       sql.add(' ,CondPag_PagRec,Mora_PagRec,MoraMes_Pagrec,DescontoPerc_PagRec,Desconto_PagRec,MultaPerc_PagRec,Multa_PagRec');
                       sql.add(' ,VlPag_PagRec,DtPag_PagRec,AVista_PagRec ');
                       sql.add(' ,Cod_Ven_PagRec,Nome_Ven_PagRec,Comiss_PagRec,ComissParcela,ComissComp_PagRec,Gerente_PagRec,ComissGerente,VlcomissFat_PagRec,VlComissAbert_PagRec,VlComissComp_PagRec,VlComissGer_PagRec,Caixa_PagRec');
                       sql.add(',Parcela');
                       sql.add(' ) ');
                end else begin
                       sql.add('Insert into BaixaPag');
                       sql.add('(                 ');
                       sql.add(' Empresa_Pag,     ');
                       sql.add(' DocNum_Pag,     ');
                       sql.add(' Cod_Forn_Pag, ');
                       sql.add(' DtDocVen_Pag, ');
                       sql.add(' DtDocEmi_Pag, ');
                       sql.add(' Raz_Forn_Pag,');
                       sql.add(' Origem_Pag, ');
                       sql.add(' Sit_Pag, ');
                       sql.add(' CentCust_Pag, ');
                       sql.add(' Loc_Pag, ');
                       sql.add(' CategMov_Pag, ');
                       sql.add(' SubCateg_Pag, ');
                       sql.add(' Prpedn, ');
                       sql.add(' VlEmit_Pag  ');
                       sql.add(',Duplicata_Pag');
                       sql.add(' ,CondPag_Pag,Mora_Pag,MoraMes_Pag,DescontoPerc_Pag,Desconto_Pag,MultaPerc_Pag,Multa_Pag');
                       sql.add(' ,VlPag_Pag,DtPag_Pag,AVista_Pag ');
                       sql.add(',Parcela');
                       sql.add(' ) ');
                end;

                    sql.add('Values ( ');
                       sql.Add(':Empresa,     ');
                       sql.Add(':Documento,     ');
                       sql.Add(':CliForn, ');
                       sql.Add(':Vencimento, ');
                       sql.Add(':Emissao, ');
                       if (VarPag_Rec = Recebimento) Then
                        sql.add(' (Select Cliente From Cliente  Where Cod_Cliente = '''+ClienteFornecedor+'''), ')
                       else
                        sql.add(' (Select Raz_Forn From AqFornec Where Cod_Forn ='''+ClienteFornecedor+'''), ');
                       sql.Add(':Origem, ');
                       sql.Add(':Sit, ');
                       sql.Add(':CentCust, ');
                       sql.Add(':Loc, ');
                       sql.Add(':CategMov, ');
                       sql.Add(':SubCateg, ');
                       sql.Add(':NOrigem, ');
                       sql.Add(':Valor  ');
                       sql.add(' ,:Duplicata ');
                        sql.add(',:CondPag,:Mora,:MoraMes,:DescontoPerc,:DescontoValor,:MultaPerc,:MultaValor');
                       sql.add(' ,:VlPag,:DtPag,:AVista ');
                       if (VarPag_Rec = Recebimento) Then Begin
                          sql.add(',:Vendedor,');
                          sql.add(' (Select Nome from Vendedor where Cod_Vendedor = :Vendedor  and CdEmpresa = :Empresa), ');
                          If not Alteracomiss then begin
                              sql.add(' (select ComissFat from Vendedor where Cod_Vendedor = :Vendedor and CdEmpresa = :Empresa),');
                              sql.add(' (Select ComissAberto from Vendedor where Cod_Vendedor = :Vendedor and CdEmpresa = :Empresa),');
                              sql.add(' (Select ComissComp from Vendedor where Cod_Vendedor = :Vendedor and CdEmpresa = :Empresa), ');
                              sql.add(' (Select Gerente   from Vendedor where Cod_Vendedor = :Vendedor and CdEmpresa = :Empresa), ');
                              sql.add(' (Select PcomissGV from Vendedor where Cod_Vendedor = :Vendedor and CdEmpresa = :Empresa), ');
                              sql.add( '0.00,0.00,0.00,0.00');
                          end else begin
                              sql.add(' :PercComissFat,:PercComissAberto,:PercComissComp,:Gerente,:PercComissGer,:VlComissFat,:VlComissAberto,:VlComissComp,:VlComissGer');
                              ParamByName('PercComissFat').AsFloat    := PercComissFat;
                              ParamByName('PercComissAberto').AsFloat := PercComissAberto;
                              ParamByName('PercComissComp').AsFloat   := PercComissComp;
                              ParamByName('PercComissGer').AsFloat    := PercComissGer;
                              ParamByName('VlComissFat').AsFloat      := VlComissFat;
                              ParamByName('VlComissAberto').AsFloat   := VlComissAberto;
                              ParamByName('VlComissComp').AsFloat     := VlComissComp;
                              ParamByName('VlComissGer').AsFloat      := VlComissGer;
                              ParamByName('Gerente').AsInteger        := Gerente;
                          end;
                          sql.add(' ,:Caixa');
                       end;
                       sql.add(',:Parcela');
                       sql.add(' ) ');

                 if (VarPag_Rec = Recebimento) then begin
                     if frm_fechamento.Vendedor.text <> '' then
                          ParamByNAme('Vendedor').AsInteger         := strtoint(frm_fechamento.Vendedor.text)
                     else begin
                          ParamByNAme('Vendedor').DataType := ftinteger;
                          ParamByNAme('Vendedor').Clear;
                     end;
                     ParamByNAme('Caixa').AsString      := Caixa;
                 end;

                 ParamByNAme('Empresa').AsString      := Empresa;
                 ParamByNAme('CliForn').AsString      := ClienteFornecedor;
                 ParamByNAme('Origem').AsString       := IIfs(Operacao = '',VarOrigem,Operacao);
                 ParamByNAme('NOrigem').AsString      := IIfs(DocOrigem <> '',DocOrigem,Documento);
                 ParamByNAme('Emissao').AsDateTime    := DatadeEmissao;
                 ParamByNAme('Sit').AsString          := VarInfComplementarParcela.Situacao;
                 ParamByNAme('Loc').AsString          := VarInfComplementarParcela.Conta;
                 ParamByNAme('CategMov').AsInteger    := VarInfComplementarParcela.Categoria;
                 ParamByNAme('SubCateg').AsInteger    := VarInfComplementarParcela.SubCategoria;
                 ParamByNAme('CentCust').AsString     := VarInfComplementarParcela.CCusto;
                 ParamByNAme('Documento').AsString    := Documento;
                 ParamByNAme('Vencimento').AsDateTime := DatadeEmissao;

                 ParamByNAme('DtPag').AsDateTime      := IIfs(Not FReduzido,VarDetalFechamento.DataPagamento,DateM);
                 ParamByNAme('Valor').AsFloat         := StrtoFloatN(Frm_Fechamento.ValorPago.Text)  - StrtoFloatN(Frm_Fechamento.Troco.Text);
                 ParamByNAme('VlPag').AsFloat         := StrtoFloatN(Frm_Fechamento.ValorPago.Text)  - StrtoFloatN(Frm_Fechamento.Troco.Text);
                 ParamByNAme('Mora').Datatype := FtFloat;
                 ParamByNAme('Mora').Clear;
                 ParamByNAme('DescontoPerc').Datatype := FtFloat;
                 ParamByNAme('DescontoPerc').Clear;
                 ParamByNAme('DescontoValor').Datatype := FtFloat;
                 ParamByNAme('DescontoValor').Clear;
                 ParamByNAme('MultaPerc').Datatype := FtFloat;
                 ParamByNAme('MultaPerc').Clear;
                 ParamByNAme('MultaValor').Datatype := FtFloat;
                 ParamByNAme('MultaValor').Clear;
                 ParamByNAme('MoraMes').Datatype := FtFloat;
                 ParamByNAme('MoraMes').Clear;
                 ParamByNAme('CondPag').Datatype := FtString;
                 ParamByNAme('MoraMes').Clear;

                 ParamByName('AVista').AsString       := 'S';
                 ParamByName('Duplicata').DataType    := FtString;
                 ParamByName('Duplicata').Clear;
                 ParamByName('Parcela').AsString      := '';
                if (StrtoFloatN(Frm_Fechamento.ValorPago.Text) <> 0) and (Frm_Fechamento.Duplicata = '') then
                  execsql;

                If Not FReduzido then begin
                              ParamByNAme('Mora').AsFloat          := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[2,Frm_Fechamento.CondicoesPagamento.Row]);
                              ParamByNAme('DescontoPerc').AsFloat  := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[3,Frm_Fechamento.CondicoesPagamento.Row]);
                              ParamByNAme('DescontoValor').AsFloat := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[4,Frm_Fechamento.CondicoesPagamento.Row]);
                              ParamByNAme('MultaPerc').AsFloat     := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[5,Frm_Fechamento.CondicoesPagamento.Row]);
                              ParamByNAme('MultaValor').AsFloat    := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[6,Frm_Fechamento.CondicoesPagamento.Row]);
                              ParamByNAme('MoraMes').AsFloat       := StrtoFloatN(Frm_Fechamento.CondicoesPagamento.Cells[7,Frm_Fechamento.CondicoesPagamento.Row]);
                end else begin
                              Sql.Clear;
                              Sql.Add('Insert Into ');
                              If Frm_Fechamento.CondicoesPagamento.cells[2,Frm_Fechamento.CondicoesPagamento.Row] = 'CHEQUE' then
                                  Sql.Add('ChequeFinanceiro')
                              else If Frm_Fechamento.CondicoesPagamento.cells[2,Frm_Fechamento.CondicoesPagamento.Row] = 'CARTAO' then
                                  Sql.Add('CartaoFinanceiro')
                              else
                                  Sql.Add('OutrosFinanceiro');
                              Sql.add(' (  ');
                              Sql.add('Empresa,');
                              Sql.add('Documento,');
                              Sql.add('ClienteFornecedor,');
                              Sql.add('Origem,');
                              sql.add('Caixa, ');
                              Sql.add('PagRec,');
                              If Frm_Fechamento.CondicoesPagamento.cells[2,Frm_Fechamento.CondicoesPagamento.Row] <> 'CARTAO' then
                                  Sql.add('Emissao,')
                              else
                                  Sql.add('Data,');
                              Sql.add('Valor,');
                              sql.add('FormaPg,   ');
                              Sql.add('CliFornPrincipal,');
                              Sql.add('OrigemPrincipal,');
                              Sql.add('DocumentoPrincipal,');
                              Sql.add('CaixaPrincipal,');
                              Sql.add('Vencimento,');
                              Sql.add('Deposito,');
                              sql.add('Propietario,');
                              sql.add('CNPJ');
                              Sql.add(' ) ');
                              Sql.add('Values (  ');
                              Sql.add(':Empresa,');
                              Sql.add(':Documento,');
                              Sql.add(':CliForn,');
                              Sql.add(':Origem,');
                              Sql.add(':Caixa,');
                              Sql.add(':PagRec,');
                              Sql.add(':Emissao,');
                              Sql.add(':Valor,');
                              sql.add(':FormaPg,');
                              Sql.add(':CliForn,');
                              Sql.add(':Origem,');
                              Sql.add(':Documento,');
                              Sql.add(':Caixa,');
                              Sql.add(':Vencimento,');
                              Sql.add(':Deposito,');
                              If VarPag_rec = Recebimento then begin
                                  sql.add('(Select Cliente from cliente where cod_cliente = '''+ClienteFornecedor+'''),');
                                  sql.add('(Select CGC from cliente where cod_cliente = '''+ClienteFornecedor+''')');
                              end else begin
                                  sql.add('(Select Raz_Emp from ArqEmp where cod_Emp = '''+Empresa+'''),');
                                  sql.add('(Select CGC_Emp from ArqEmp where cod_Emp = '''+Empresa+''')');
                              end;
                              Sql.add(' ) ');
                              ParamByNAme('Empresa').AsString              := Empresa;
                              ParamByNAme('CliForn').AsString              := ClienteFornecedor;
                              ParamByNAme('Origem').AsString               := VarOrigem;
                              ParamByNAme('Documento').AsString            := Documento;
                              ParamByNAme('Emissao').AsDateTime            := DatadeEmissao;
                              ParamByNAme('FormaPg').AsString              := frm_fechamento.CondicoesPagamento.Cells[1,frm_fechamento.CondicoesPagamento.Row];
                              ParamByNAme('Caixa').AsString                := Caixa;
                              ParamByNAme('PagRec').AsString               := IIfs(VarPag_rec = Recebimento,'R','P');
                              ParamByNAme('Valor').AsFloat                 := StrtoFloatN(Frm_Fechamento.ValorPago.Text)  - StrtoFloatN(Frm_Fechamento.Troco.Text);
                              ParamByNAme('Emissao').AsDateTime            := DateM;
                              ParamByNAme('Vencimento').AsDateTime         := DateM;
                              If Frm_Fechamento.CondicoesPagamento.cells[2,Frm_Fechamento.CondicoesPagamento.Row] = 'DINHEI' then begin
                                      ParamByNAme('Deposito').AsDateTime  := DateM;
                              end else begin
                                      ParamByNAme('Deposito').DataType      := FtDateTime;
                                      ParamByNAme('Deposito').Clear;
                              end;
                              ExecSql;
                              exit;
                end;





                  if (VarPag_Rec = Recebimento) then begin
                     sql[0] := 'Insert Into PagRec';
                     sql.delete(39);
                   end
                  else begin
                    sql[0] := 'Insert Into Pagament';
                    sql.delete(38);
                  end;

                 sql.delete(18);

                 If (Frm_Fechamento.Duplicata <> '') Then begin
                    ParamByName('Duplicata').AsString    := Frm_Fechamento.Duplicata;
                    parambyname('Vencimento').AsDateTime := Frm_Fechamento.VencDuplicata;
                    execsql;
                    Gravaduplicata;
                 end;

                 if frm_fechamento.condicoespagamento.row = 1 then
                  exit;

                  ParamByNAme('CondPag').AsString := frm_fechamento.CondicoesPagamento.Cells[1,frm_fechamento.CondicoesPagamento.Row];
                  ParamByName('Duplicata').Clear;
                  for i:=1 to frm_fechamento.parcelas.rowcount -1 do begin
                             If (frm_fechamento.parcelas.cells[1,i] = '') or
                                (frm_fechamento.parcelas.cells[1,i] = '  /  /  ') or
                                (StrtoFloatN(frm_fechamento.parcelas.cells[2,i]) = 0) then
                                  continue;

                             ParamByNAme('Documento').AsString    := Documento+frm_fechamento.parcelas.cells[00,i];
                             ParamByNAme('Parcela').AsString      := frm_fechamento.parcelas.cells[00,i];
                             ParamByNAme('Vencimento').AsDateTime := strtodatetime(frm_fechamento.parcelas.cells[01,i]);
                             ParamByNAme('Valor').AsFloat         := strtofloatn(frm_fechamento.parcelas.cells[02,i]);
              //               ParamByNAme('Nome').AsString         := NomeCliforn;

                             execsql;
                  end;//fim do for
                         free;
            end;// fim do with
    except
       on E: Exception do Begin
                             Raise;
                             FoiCancelado := True;
       End;

    end;


end;


procedure TFechamentoFinanc.SetActive(const Value: Boolean);
var
qry : tquery;
DocumentoDetal:TDocumentoDetal;
FltCred: TCredito;
begin
     Ativo := Value;
     if not value then
      begin
           Desconto    := 0;
           VlDesconto  := 0;
           DescontoPercentual := 0;
           Desconto           := 0;
           FormadePgto := '';
           ConddePgto := '';

           if not varnaozeravendedor then
             VendedorFinal := 0;

           ValorPagoFinal := 0;
           DocOrigem      := '';
           GrupoPagamento := '';
           InfComp.Conta  := '';
           InfComp.Situacao  := '';
           InfComp.Categoria  := 0;
           InfComp.SubCategoria  := 0;
           Gerente            := 0;
           PercComissAberto   := 0;
           PercComissFat      := 0;
           PercComissGer      := 0;
           VlComissAberto     := 0;
           VlComissFat        := 0;
           VlComissGer        := 0;
           Troco              := 0;
           CondPagIni         := ''; 
           exit;
      end;

{      If OrigemToStr(vartipoOrigem) = 'ORC' Then
          varorigem := Copy(OrigemToStr(vartipoOrigem),1,1) + RetornoAlmoxarifadoPadrao
      Else}

       qry := tquery.create(nil);
       qry.databasename := 'BD';

       varorigem := OrigemToStr(vartipoOrigem);
       frm_fechamento                     := tfrm_fechamento.create(application);
       Frm_Fechamento.Caption             := TForm(Owner).Caption;
       frm_fechamento.varvalorparcial     := ValorParcial;
       Frm_Fechamento.PesqVend.Database     := FBancoDados;
       Frm_Fechamento.CondPag.BancoDeDados  := FBancoDados;
       frm_fechamento.DocumentoFinanceiro := Documento;
       Frm_Fechamento.CliFornFechamento   := ClienteFornecedor;
       Frm_Fechamento.PagRecFechamento    := VarPag_Rec;
       Frm_Fechamento.Empresa             := Empresa;

       Frm_fechamento.BDuplicata.Visible  := VarGeraDuplicata;
       Frm_Fechamento.BDuplicata.Enabled  := VarGeraDuplicata;
       Frm_Fechamento.Label9.Visible      := VarTemVendedor;
       Frm_Fechamento.Vendedor.Visible    := VarTemVendedor;
       Frm_Fechamento.Vendedor.Enabled    := VarTemVendedor;
       Frm_Fechamento.NomeVendedor.Visible:= VarTemVendedor;
       Frm_Fechamento.valortotal.caption  := FormatFloat('#,##0.00',ValorParcial);
       Frm_Fechamento.ValorDesconto.Text             := FormatFloat('#,##0.00',Desconto);
       Frm_Fechamento.PercentualDesconto.Text        := FormatFloat('#,##0.00',DescontoPercentual);
       Frm_Fechamento.PesqVend.Parametro[1]  := Empresa;
       Frm_Fechamento.FDataemissao := DatadeEmissao;
       Frm_Fechamento.FCondPagIni := CondPagIni;

       if vendedorfinal <> 0 then
          frm_fechamento.vendedor.text       := inttostr(vendedorfinal);
       frm_fechamento.PercentualDesconto.Enabled   := Not FDesabilitaDesc;
       frm_fechamento.ValorDesconto.Enabled   := Not FDesabilitaDesc;

       Frm_Fechamento.TotalDesconto.Caption := FormatFloat('#,##0.00',ValorParcial - Desconto - DescontoPercentual/100 * ValorParcial);

       If Not frm_fechamento.ValorDesconto.Enabled then
         frm_fechamento.ActiveControl := frm_fechamento.ValorPago;




       If Not VarTemVendedor then
         Frm_Fechamento.ValorPago.NextPos := Frm_Fechamento.Vendedor.NextPos;


       if strtofloatn(frm_fechamento.vendedor.text) = 0 then
        frm_fechamento.vendedor.clear;

        preencheGrids;

        try
                  with qry do begin
                     VarInfComplementarParcela := InfComp;
                     If (Operacao <> '') then begin
                          sql.clear;
                          sql.add('Select  CONTA,CATEGORIA,SUBCATEGORIA,SITUACAO');
                          sql.add('From TipodeOperacao');
                          sql.add('Where Codigo =:Codigo');
                          Params[0].AsString := Operacao;
                          Open;

                          VarInfComplementarParcela.Conta         := IIfs(FieldByName('Conta').AsString <> '',FieldByName('Conta').AsString,'');
                          VarInfComplementarParcela.Situacao      := IIfs(FieldByName('Situacao').AsString <> '',FieldByName('Situacao').AsString,'');
                          VarInfComplementarParcela.Categoria     := IIfs(FieldByName('Categoria').AsString <> '',FieldByName('Categoria').AsInteger,0);
                          VarInfComplementarParcela.SubCategoria  := IIfs(FieldByName('SubCategoria').AsString <> '',FieldByName('SubCategoria').AsInteger,0);

                     end;
                   end;


                   Ltexcedido := False;
                   frm_fechamento.Duplicata  := '';
                   Desconto    := 0;
                   FormadePgto := '';
                   ConddePgto := '';
                   if  not varnaozeravendedor then
                      VendedorFinal := 0;
                   ValorPagoFinal := 0;
                   GrupoPagamento := '';
                   foicancelado := false;
                    if  (frm_fechamento.showmodal = mrok) or (Frm_Fechamento.activecontrol = Frm_Fechamento.BDuplicata) then
                    begin
                       Inserindodados := true;
                       if (StrtoFloatN(Frm_Fechamento.ValorPago.Text) <> 0) and (VarDetalFechamento <> nil) and Not FReduzido and (Frm_fechamento.Duplicata = '') then
                        begin
                               DocumentoDetal.Documento      := Documento;
                               DocumentoDetal.Origem         := IIfs(Operacao = '',VarOrigem,Operacao);
                               DocumentoDetal.CliForn        := ClienteFornecedor;
                               DocumentoDetal.Empresa        := Empresa;
                               DocumentoDetal.Caixa          := Caixa;
                               VarDetalFechamento.BancoDados := FBancoDados;
                               VarDetalFechamento.Documentos := DocumentoDetal;
                               VarDetalFechamento.ClienteFornecedor   := ClienteFornecedor;
                               VarDetalFechamento.ValorTotalPago      := StrtoFloatN(Frm_Fechamento.ValorPago.Text) - StrtoFloatN(Frm_Fechamento.Troco.Text);
                               VarDetalFechamento.AbortaAoCancelar    := VarAborta;
                               //VarDetalFechamento.FormaDePagamento := FormaDePagamento;

                               VarDetalFechamento.ValorTotalTroco     := StrtoFloatN(Frm_Fechamento.ValorPago.Text) - StrtoFloatN(Frm_Fechamento.Troco.Text);
                               VarDetalFechamento.DataPagamento       := Self.DatadeEmissao;
                               VarDetalFechamento.FContaIni           := VarInfComplementarParcela.Conta;
                               VarDetalFechamento.LtCred              := False;
                               VarDetalFechamento.Active              := True;



                               If VarDetalFechamento.Cancelado then begin
                                 FoiCancelado := True;
                                 exit;
                               end;
                        end;

                       FormaDePagamento := VarDetalFechamento.FormaDePagamento;

                       gravatabelafinanceira;

                       with frm_fechamento do begin
                              desconto                  := strtofloatn(valordesconto.text)
                                                           + (valorparcial * (strtofloatn(percentualdesconto.text)/100));

                              Self.DescontoPercentual   := strtofloatn(Frm_Fechamento.percentualdesconto.text);
                              Self.VlDesconto           := strtofloatn(Frm_Fechamento.valordesconto.text);
                              Self.valorpagofinal       := strtofloatn(frm_fechamento.valorpago.text) - StrtoFloatN(frm_fechamento.Troco.text);
                              Self.Troco                := StrtoFloatN(Frm_Fechamento.Troco.Text);

                              If (Frm_Fechamento.CondicoesPagamento.Row <> 1) and Not FReduzido then
                                conddePgto := condicoespagamento.cells[01,condicoespagamento.row];
                              if vendedor.text <> '' then
                               vendedorfinal  := strtoint(vendedor.text);

                              If ((VarDetalFechamento <> Nil) and Not FReduzido and (VarDetalFechamento.TemLtCred))
                              or ((Not FReduzido and (CondicoesPagamento.Cells[8,CondicoesPagamento.Row] = 'S')
                               or (FReduzido and (CondicoesPagamento.Cells[3,CondicoesPagamento.Row] = 'S')))) then begin
                                  FLtCred := RetLimiteCredito(Empresa,IIfs(VarPag_rec = Recebimento,'R','P'),ClienteFornecedor,Self.DatadeEmissao,VlLCredini,QtdLcredIni);
                                  If Not FLtCred.Valida then
                                    If FLtCred.BloqueiaFat or Not MensConf(FLtCred.Mensagem+#13+' CONTINUA OPERAÇÃO ?') then begin
                                          If FLtCred.BloqueiaFat then Mensagem(FLtCred.Mensagem);
                                          foicancelado := true;
                                          if varaborta then
                                            SysUtils.Abort;
                                    end else
                                           Ltexcedido := True;
                              end; 


                     end;



               end
              else
                begin
                   foicancelado := true;
                   if varaborta then
                      SysUtils.Abort;
                end;

       finally
              Inserindodados := false;
              frm_fechamento.free;
              If Qry <> Nil then
                Qry.Destroy;
    //          factive := false;
       end;

end;




procedure TFechamentoFinanc.GravaTabelaBaixa;
var
qry : tquery;
begin
{  if frm_fechamento.formaspagamento.row = 1 then
    exit;}

  if (VarDetalFechamento = nil) or (StrtoFloatN(Frm_Fechamento.ValorPago.Text) = 0) then
   exit;


  qry := tquery.create(nil);
  qry.databasename := 'BD';

  with qry do begin
     if  VarPag_REc = Recebimento then
      begin
         sql.clear;
         sql.add('Delete From BaixaRec');
         sql.add('Where DocNum_PagRec   = :Documento');
         sql.add('and   Cod_Cli_PagRec  = :Cliente');
         sql.add('and   Origem_PagRec   = :Par_Origem');
         sql.add('and   Empresa_PagRec  = :Empresa');

         ParamByNAme('Documento').AsString   := Documento;
         ParamByName('Par_Origem').AsString  := VarOrigem;
         ParamByNAme('Cliente').AsString     := ClienteFornecedor;
         ParamByNAme('Empresa').AsString     := Empresa;
         ExecSql;


         sql.clear;
         sql.add('Insert into BaixaRec');
         sql.add('(                ');

         sql.add(' DocNum_PagRec,     ');
         sql.add(' Empresa_PagRec,     ');
         sql.add(' Cod_Cli_PagRec, ');
         sql.add(' DtDocVen_PagRec, ');
         sql.add(' DtDocEmi_PagRec, ');
         sql.add(' Nome_Cli_PagRec,');
         sql.add(' Origem_PagRec, ');
         sql.add(' Sit_PagRec, ')	;
         sql.add(' CentCust_PagRec, ');
         sql.add(' Loc_PagRec, ');
         sql.add(' CategMov_PagRec, ');
         sql.add(' SubCateg_PagRe, ');
         sql.add(' Prpedn, ');
         sql.add(' AVista_PagRec, ');
         sql.add(' VlPag_PagRec, ');
        if VarDetalFechamento <> nil Then
           sql.add('DtPag_PagRec,   ');

           if (VarPag_Rec = Recebimento) and
              (Frm_Fechamento.Vendedor.Text <> '')
               then
               begin
                 sql.add(' Cod_Ven_PagRec,');
                 sql.add(' Nome_Ven_PagRec,');
               end;

         sql.add(' VlEmit_PagRec) ');
      end;


     if VarPag_rec = Pagamento then
      begin
             sql.clear;
             sql.add('Delete from BAixaPag');
             sql.add('Where DocNum_Pag   = :Documento');
             sql.add('and   Cod_Forn_Pag = :Forn');
             sql.add('and   Origem_Pag   = :Par_origem');
             sql.add('and   Empresa_Pag  = :Empresa');

             ParamByNAme('Documento').AsString   := Documento;
             ParamByNAme('Forn').AsString        := ClienteFornecedor;
             ParamByName('Par_Origem').AsString  := VarOrigem;
             ParamByName('Empresa').AsString     := Empresa;
             execsql;;

             sql.clear;
             sql.add('Insert into BaixaPag');
             sql.add('(DocNum_Pag,     ');
             sql.add(' Empresa_Pag,     ');
             sql.add(' Cod_Forn_Pag, ');
             sql.add(' DtDocVen_Pag, ');
             sql.add(' DtDocEmi_Pag, ');
             sql.add(' Raz_Forn_Pag,');
             sql.add(' Origem_Pag, ');
             sql.add(' Sit_Pag, ');
             sql.add(' CentCust_Pag, ');
             sql.add(' Loc_Pag, ');
             sql.add(' CategMov_Pag, ');
             sql.add(' SubCateg_Pag, ');
             sql.add(' Prpedn, ');
             sql.add(' AVista_Pag, ');
             sql.add(' VlPag_Pag, ');
             if VarDetalFechamento <> nil Then
               sql.add('DtPag_Pag,   ');



             sql.add(' VlEmit_Pag) ');
       end;

         sql.add(' Values(');

             sql.add(' :Documento,     ');
             sql.add(' :Empresa,     ');
             sql.add(' :CliForn, ');
             sql.add(' :Emissao, ');
             sql.add(' :Vencimento, ');
             sql.add(' :Nome, ');
             sql.add(' :Origem, ');
             sql.add(' :Sit, ');
             sql.add(' :CentCust, ');
             sql.add(' :Loc, ');
             sql.add(' :CategMov, ');
             sql.add(' :SubCateg, ');
             sql.add(' :NOrigem, ');
             sql.add(' :AVista, ');
             sql.add(' :ValorPago,  ');

             if VarDetalFechamento <> nil Then
               sql.add(' :Pagamento,   ');


           if (VarPag_Rec = Recebimento) and
              (Frm_Fechamento.Vendedor.Text <> '') then

               begin
                 sql.add(' :Vendedor,');
                 sql.add(' :NomeVendedor,');
               end;

             sql.add(' :Valor)   ');

         ParamByNAme('Empresa').AsString      := Empresa;
         ParamByNAme('Documento').AsString    := Documento;
         ParamByNAme('CliForn').AsString      := ClienteFornecedor;
         ParamByNAme('NOrigem').AsString      := Documento;
         ParamByNAme('Origem').AsString       := VarOrigem;
         ParamByNAme('Valor').AsFloat         := StrtoFloatN(Frm_Fechamento.ValorPago.Text)  - StrtoFloatN(Frm_Fechamento.Troco.Text);
         ParamByNAme('ValorPago').AsFloat     := StrtoFloatN(Frm_Fechamento.ValorPago.Text)  - StrtoFloatN(Frm_Fechamento.Troco.Text);
         ParamByNAme('Sit').AsString          := VarInfComplementarParcela.Situacao;
         ParamByNAme('Loc').AsString          := VarInfComplementarParcela.Conta;
         ParamByNAme('CategMov').AsInteger    := VarInfComplementarParcela.Categoria;
         ParamByNAme('SubCateg').AsInteger    := VarInfComplementarParcela.SubCategoria;
         ParamByNAme('Nome').AsString         := NomeCliforn;
         ParamByNAme('CentCust').AsString     := VarInfComplementarParcela.CCusto;
         ParamByNAme('AVista').AsString       := 'S';
         ParamByNAme('Emissao').AsDateTime    := DatadeEmissao;
         ParamByNAme('Vencimento').AsDateTime := DatadeEmissao;
         if VarDetalFechamento <> nil Then
           ParamByNAme('pagamento').AsDateTime  := VarDetalFechamento.DataPagamento
         else
           ParamByNAme('Pagamento').AsDateTime  := DateM();

           if (VarPag_Rec = Recebimento) and
              (Frm_Fechamento.Vendedor.Text <> '') then begin
                 ParamByNAme('Vendedor').AsInteger         :=  strtoint(frm_fechamento.Vendedor.text);
                 ParamByNAme('NomeVendedor').AsString      :=  frm_fechamento.NomeVendedor.Caption;
              end;
         execsql;
         free;
  end;// fim do with

end;

function TFechamentoFinanc.NomeCliforn: String;
var
qry : Tquery;
tabela,Campocodigo,camponome:String;
begin
  if VarPag_Rec = recebimento then
   begin
    campocodigo := 'Cod_Cliente';
    camponome   := 'Cliente';
    tabela      := 'Cliente';
   end
  else
   begin
    campocodigo := 'Cod_Forn';
    camponome   := 'Raz_Forn';
    tabela      := 'AqFornec';
   end;



  qry := tquery.create(nil);
  qry.databasename := 'BD';
  with qry do begin
   sql.clear;
   sql.add('Select  '+CampoNome);
   sql.add('  From  '  +TAbela);
   sql.add('  Where  '+CampoCodigo+'  = :Codigo');
   parambyname('Codigo').AsString := ClienteFornecedor;
   open;
   result := fieldbyname(CampoNome).AsString;
   free;
  end;


end;

procedure TFechamentoFinanc.Deleta;
VAR
QRY :tquery;
begin


     Qry := Tquery.Create(application);
     With qry do begin
           databasename := 'BD';
           sql.clear;
           if (varnaoexclui) and (not inserindodados) then begin
                 if  VarPag_REc = Recebimento then begin
                     sql.add('Select DocNum_PagREc From BaixaRec');
                     sql.add('Where  Prpedn   = :DocumentoOrigem');
                     sql.add('and    Cod_Cli_PagRec  = :CliForn');
                     sql.add('and    Origem_PagRec   = :Par_Origem');
                     sql.add('and   Empresa_PagRec  = :Empresa');
                 end
                  else begin
                     sql.add('Select DocNum_pag from BAixaPag');
                     sql.add('Where Prpedn       = :DocumentoOrigem');
                     sql.add('and   Cod_Forn_Pag = :CliForn');
                     sql.add('and   Origem_Pag   = :Par_origem');
                     sql.add('and   Empresa_Pag  = :Empresa');
                   end;

                   ParamByNAme('Empresa').AsString      := Empresa;
                   ParamByNAme('DocumentoOrigem').AsString   := Documento;
                   ParamByName('Par_Origem').AsString        := OrigemToStr(vartipoOrigem);
                   ParamByNAme('CliForn').AsString           := ClienteFornecedor;
                   open;

                   if not eof then begin
                     MessageDlg('Documento Com Parcelas já Pagas'+#13+'Exclusão Cancelada',
                                mterror,[mbok],0);
                     sysutils.abort;
                   end;

            end;


           sql.clear;
           if  VarPag_REc = Recebimento then begin
                 sql.add('Delete From PagRec');
                 sql.add('Where Prpedn          = :DocumentoOrigem');
                 sql.add('and   Origem_PagRec   = :Par_Origem');
                 sql.add('and   Cod_Cli_PagRec  = :CliForn');
                 sql.add('and   Empresa_PagRec    = :Empresa');
            end
           else begin
                 sql.add('Delete from Pagament');
                 sql.add('Where Prpedn          = :DocumentoOrigem');
                 sql.add('and   Origem_Pag      = :Par_Origem');
                 sql.add('and   Cod_Forn_Pag    = :CliForn');
                 sql.add('and   Empresa_Pag     = :Empresa');
           end;
           ParamByNAme('DocumentoOrigem').AsString   := Documento;
           ParamByNAme('CliForn').AsString           := ClienteFornecedor;
           ParamByName('Par_Origem').AsString        := OrigemToStr(vartipoOrigem);
           ParamByName('Empresa').AsString           := Empresa;
           execsql;
           free;

    end;
end;

procedure TFechamentoFinanc.DeletaBaixados;
begin

end;

procedure TFechamentoFinanc.GravaDuplicata;
var qry : tquery;
begin
     qry := tquery.create(application);
     qry.databasename := 'bd';
     With qry do begin
         sql.clear;
         sql.add('Select NFatura_Duplicata from Duplicata');
         sql.add('Where  PagRec       =:PagRec');
         if  VarPag_REc = Recebimento then begin
           sql.add('and   Empresa =:Empresa');
           Params[0].AsString := 'R';
           Params[1].AsString := Empresa;
          end
         else begin
           sql.add('And  Cliente_Duplicata =:CliForn');
           Params[0].AsString := 'P';
           Params[1].AsString := ClienteFornecedor;
         end;
         sql.add('And  NFatura_Duplicata =:Duplicata');
         Params[2].AsString := Frm_Fechamento.Duplicata;
         open;

         If Not Eof then
          exit;

         sql.clear;
         sql.add('Insert Into Duplicata ');
         sql.add('( Empresa,Nfatura_Duplicata,Cliente_Duplicata,PagRec,Emissao,DtVencimeto_DupliCata )');
         sql.add('values( :Empresa,:Nfatura_Duplicata,:Cliente_Duplicata,:PagRec,:Emissao,:DtVencimeto_DupliCata )');
         Params[0].AsString := Empresa;
         Params[1].AsString := Frm_Fechamento.Duplicata;
         Params[2].AsString := ClienteFornecedor;
         if  VarPag_REc = Recebimento then
           Params[3].AsString := 'R'
         else
           Params[3].AsString := 'P';
         Params[4].AsDateTime := DateM();
         Params[5].AsDateTime := Frm_Fechamento.VencDuplicata;
         execsql;
         destroy;
    end;


end;

end.



