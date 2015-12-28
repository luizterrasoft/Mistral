unit DetalFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,VariaveisSafi,detals,FuncoesGlobais,DbTables;

type

  TFormPag = Record
     Grupo :String;
     Codigo : String;
     Valor : Currency;
  end;


  TDetalFinanc = class(TComponent)
  private
    VarAborta             : Boolean;
    VarClienteFornecedor : String;
    VarPag_Rec     : TPagouRec;
    FActive        : Boolean;
    FBanco         : TDataBase;
    VarOrigem      : TOrigem;
    VarSomenteInformacoes : Boolean;
    VarDocBaixado: String;
    VarClienteForncedor: String;
    VarGeraBaixaParcial : Boolean;
    VarDocumentoDetal : TDocumentoDetal;
    FFormaDePagamento : String;
    FGaveta: Boolean;
    FSubstituido: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetCliForn(const Value: String);
    procedure GravaTabelaDetalhamento;
    procedure gravatabeladeformas;
    Procedure AlimentaVetorDetal(const Value: String);
    PRocedure SetDocumentoDetal(value :TDocumentoDetal);
    { Private declarations }
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  destroy ; override;
  public
    VlLCredIni,VLCREDINI,Juros,ValorTotalPago,ValorTotalTroco :Currency;
    QtdLCredIni:LongInt;
    VlCredito         : Double;
    LtCred,TemLtCred,LtExcedido,SoCredito,Cancelado         : Boolean;

    DataPagamento     : TDateTime;
    FormasPagamento   : Array of TFormPag;
    FDescContaIni,FContaIni,DocumentoPrincipal,OrigemPrincipal :String;
    DatadeEmissao :TDateTime;
    FInformacaoDetalhamento:TVetInformacaoDetalhamento;
    IndSubst : Integer; 
    Procedure         IncluiOrigem(VarDocumento,VarOrigem:String);
    Procedure         Deleta;
//    Procedure         MostraDetalhes;
    Procedure         RetornaDetalhes(Documento,CliForn,Origem,PagRec,Empresa:String);
    Procedure         IncluiBaixaParcial(VarDocumento, VarOrigem: String;VarValor:Currency;VarData:TDateTime);
    Property          Documentos :TDocumentoDetal Read VarDocumentoDetal Write SetDocumentoDetal;
    Property          AbreGavetaPDV : Boolean read FGaveta write FGaveta Default False;
    { Public declarations }
  published
   property Active      : Boolean read FActive write SetActive default False;
   property pagamento_Recebimento :TPagouRec read varpag_rec write varpag_rec Default Recebimento;
   Property SomenteInformacoes  : Boolean    read VarSomenteInformacoes write  VarSomenteInformacoes  Default False;
   Property DocumentosBaixados  : String     read VarDocBaixado write AlimentaVetorDetal;
   Property ClienteFornecedor    : String    read VarClienteForncedor Write SetCliForn;
   Property AbortaaoCancelar     : Boolean   Read VarAborta           Write VarAborta Default False;
   Property GeraBaixaParcial     : Boolean   Read VarGeraBaixaParcial Write VarGeraBaixaParcial Default False;
   Property BancoDados           : TDataBase Read FBanco Write FBanco;
   Property FormaDePagamento     : String    Read FFormaDePagamento Write FFormaDePagamento;
   Property Substituido          : Boolean   Read FSubstituido Write FSubstituido Default False;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sistema', [TDetalFinanc]);
end;

{ TDetalFinanc }


constructor TDetalFinanc.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   VllCredIni := 0;
   QtdLCredIni := 0;
   VarOrigem := PDV;
   VarPag_rec    := Recebimento;
   SoCredito     := False;
   LtCred        := True;
   IndSubst      := 0;
   Juros         := 0;
end;


destructor TDetalFinanc.destroy;
begin
  inherited destroy;
end;



procedure TDetalFinanc.gravatabeladeformas;
begin
   // gravará na tabelas de cheques,outros,cartão e dinheiro
end;

procedure TDetalFinanc.GravaTabelaDetalhamento;
begin
   // gravará na tabela de detalhamento
end;

procedure TDetalFinanc.SetActive(const Value: Boolean);
var
i : integer;
FltCred: TCredito;
begin
   If not value then
    exit;

   VlCredito  := 0;
   flagorigem := origemtostr(Varorigem);
   frm_detals :=  tfrm_detals.create(application);
   with frm_detals do begin
         TemLtCred  := False;
         LtExcedido := False;
         FJuros     := Juros;
         FVlCredIni := VlCredIni;
         FSoCredito := SoCredito;
         FSubst := IIfs(FSubstituido,'T','F');
         FIndSubst  := IndSubst;
         CondPag.BancodeDados := FBanco;
         if valortotaltroco = 0 then
           valormaximotroco := VAlorTotalPago
         else
           valormaximotroco := valortotaltroco;
         GeraBaixaParcial.visible := vargerabaixaparcial;
         PnVlTot.Caption     := formatfloat('#,##0.00',VAlorTotalPago);
         PnInserido.Caption  := '0,00';
         PnFaltam.Caption    := formatfloat('#,##0.00',VAlorTotalPago);
         ValorParcial.Text   := PnFaltam.Caption;
         If Self.DataPagamento = 0 then
            Pagamento.Text := FormatDateTime('dd/mm/yy',DateM())
         else
            Pagamento.Text := FormatDateTime('dd/mm/yy',Self.DataPagamento);

         //FFormaDePAgamento       := VarFormaPAgamento;
         flagPagrec := Pagrectostr(VarPag_rec);

         QryFormaPagamento.sql.clear;
         QryFormaPagamento.sql.add(' Select F.Descricao,F.Grupo,F.PdvPermiteTroco,F.Codigo,F.Conta,G.Tipo,F.CondPag,F.AssocTef,F.rede,F.OperacaoTef,F.AcionaGavetaPDV,F.LIMITE_CRED');
         QryFormaPagamento.sql.add(',(Select Desc_Conta from Conta Where F.Conta = Cod_Conta) as DescConta,'''+FCONTAINI+''' as ContaIni');
         QryFormaPagamento.sql.add(',(Select Desc_Conta from Conta Where Cod_Conta = '''+FContaIni+''') as DescContaIni');
         QryFormaPagamento.sql.add(',Credito,RetornoCredito,LayoutImp');
         If FLagPagRec = 'R' then
           QryFormaPagamento.Sql.Add(',C.Cliente as DescPropietario,C.CGC as CNPJ')
         else
           QryFormaPagamento.Sql.Add(',C.Raz_Emp as DescPropietario,C.CGC_EMP as CNPJ');
         QryFormaPagamento.sql.add(' from FormaPg F, GrupoPg G');
         If FLagPagRec = 'R' then
           QryFormaPagamento.Sql.Add('Left Join Cliente C on (Cod_Cliente = '''+DocumentosDetal[0].CliForn+''')')
         else
           QryFormaPagamento.Sql.Add('Left Join ArqEmp C on (Cod_Emp = '''+DocumentosDetal[0].Empresa+''')');

         QryFormaPagamento.Sql.Add('Where  F.Grupo = G.Codigo');
         If SoCredito Then Begin
           QryFormaPagamento.Sql.Add('  And F.Credito = ''T''');
         end;
         QryFormaPagamento.sql.add('Order By G.Codigo,F.Descricao');
         QryFormaPagamento.open;

         FPropietario := QryFormaPagamento.FieldByName('DescPropietario').AsString;
         FCNPJCPF     := QryFormaPagamento.FieldByName('CNPJ').AsString;

         Formas.MontaGridDataSet(QryFormaPagamento,0);

         For i:=1 to Formas.ColCount - 1 do
          Formas.colwidths[i] := -1;

         For i:=1 to Formas.ColCount - 1 do
          SgDetals.Campos.Add(Formas.Campos[I]);

         SgDetals.colcount := SgDetals.Campos.Count;

         for i:=2 to SgDetals.colcount - 1 do
           SgDetals.colwidths[i] := -1;

         For i:=2 to Informacoes.ColCount - 1 do
          Informacoes.colwidths[i] := -1;

         Informacoes.Limite := 1;
         Informacoes.MovimentaCelula := true;


         Formas.cells[00,0] := 'Formas de Pagamento';

         FGaveta   := False;
         cancelado := False;
         Try
           if showmodal <> mrok then
            begin
              cancelado := true;
              if VarAborta then
                SysUtils.abort;
            end
           else begin
                   if owner is tform then  TForm(Owner).Refresh;
                   VlCredito          := FVlCredito;
                   Self.datapagamento := strtodatetime(pagamento.text);
                   FFormaDePagamento  := VarFormaDePAgamento;
                   Self.FInformacaoDetalhamento := frm_detals.InformacaoDetal;
                   SetLength(FormasPagamento,sgdetals.rowcount - 1);
                   AbreGavetaPDV  := False;
                   For i:=1 to sgdetals.rowcount - 1 do begin
                      If Not AbreGavetaPDV then
                        AbreGavetaPDV  := sgdetals.FieldValue['ABREGAVETAPDV',i] = 'T';

                      If not TemLtCred then
                        TemLtCred      := sgdetals.FieldValue['LIMITE_CRED',i] = 'S';

                      FormasPagamento[i - 1].Codigo := sgdetals.FieldValue['CODIGO',i];
                      FormasPagamento[i - 1].Valor := StrtoFloatN(sgdetals.cells[01,i]);
                  end;

                  If LtCred and TemLtCred  then begin
                        FLtCred := RetLimiteCredito(DocumentosDetal[0].Empresa,FlagPagRec,DocumentosDetal[0].CliForn,StrtoDateTime(Pagamento.Text),VllCredIni,QtdLCredIni);
                        If Not FLtCred.Valida then
                          If FLtCred.BloqueiaFat or Not MensConf(FLtCred.Mensagem+#13+' CONTINUA OPERAÇÃO ?') then begin
                              If FLtCred.BloqueiaFat then Mensagem(FLtCred.Mensagem);
                              cancelado := true;
                              if VarAborta then
                                SysUtils.abort;
                          end else
                               Ltexcedido := True;

                  end;
          end;
         finally
            VarGeraBaixaParcial := False;
            SetLength(Documentosdetal,0);
            free;
         end;




   end;

end;

procedure TDetalFinanc.AlimentaVetorDetal(const Value: String);
begin
  Setlength(DocumentosDetal,length(DocumentosDetal) + 1);
  documentosdetal[length(Detals.DocumentosDetal) - 1].Documento := Value;
  documentosdetal[length(Detals.DocumentosDetal) - 1].BaixaParcial := False;
end;



procedure TDetalFinanc.SetCliForn(const Value: String);
begin
  cliforndetal := Value;
end;


procedure TDetalFinanc.IncluiOrigem(VarDocumento,VarOrigem:String);
var
i : Integer;
begin
   for i:=0 to length(DocumentosDetal) - 1 do
    if UpperCase(VarDocumento) = Uppercase(DocumentosDetal[i].Documento)  then begin
      DocumentosDetal[i].Origem := VarOrigem;
      exit;
    end;
end;

procedure TDetalFinanc.Deleta;
var
i : integer;
begin
   for i:=0 to length(DocumentosDetal) - 1 do
     DeletaDetalhamento(DocumentosDetal[i].Origem,DocumentosDetal[i].Documento,
                        CliFornDetal,Pagrectostr(VarPag_rec));
end;



Procedure TDetalFinanc.RetornaDetalhes(Documento, CliForn, Origem,
  PagRec,Empresa: String);
Var
i : integer;
qry : Tquery;
begin
    qry := tquery.create(application);
    qry.databasename := 'BD';
    SetLength(FormasPagamento,0);
    with qry do begin
      sql.clear;
      sql.add('Select FormaPg,Valor');
      sql.add('From   ChequeFinanceiro');
      sql.add('Where Documento         = :Par_Doc');
      sql.add('And   ClienteFornecedor = :Par_CliForn');
      sql.add('And   Origem            = :Par_Origem');
      sql.add('And   PagRec            = :Par_PagRec');
      sql.add('And   Empresa           = :Empresa');
      ParamByName('Par_Doc').AsString     := Documento;
      ParamByName('Par_CliForn').AsString := CliForn;
      ParamByName('Par_Origem').AsString  := Origem;
      ParamByName('Par_PagRec').AsString  := PagRec;
      ParamByName('Empresa').AsString     := Empresa;
      open;

      While not eof do
       begin
         SetLength(FormasPagamento,length(formaspagamento) + 1);
         FormasPagamento[length(formaspagamento) - 1].Codigo := FieldByName('FormaPg').AsString;
         FormasPagamento[length(formaspagamento) - 1].Valor  := FieldByName('Valor').AsFloat;
         qry.next;
       end;

      sql.clear;
      sql.add('Select FormaPg,Valor');
      sql.add('From   CartaoFinanceiro');
      sql.add('Where Documento         = :Par_Doc');
      sql.add('And   ClienteFornecedor = :Par_CliForn');
      sql.add('And   Origem            = :Par_Origem');
      sql.add('And   PagRec            = :Par_PagRec');
      sql.add('And   Empresa           = :Empresa');
      ParamByName('Par_Doc').AsString     := Documento;
      ParamByName('Par_CliForn').AsString := CliForn;
      ParamByName('Par_Origem').AsString  := Origem;
      ParamByName('Par_PagRec').AsString  := PagRec;
      ParamByName('Empresa').AsString     := Empresa;
      open;

      While not eof do
       begin
         SetLength(FormasPagamento,length(formaspagamento) + 1);
         FormasPagamento[length(formaspagamento) - 1].Codigo := FieldByName('FormaPg').AsString;
         FormasPagamento[length(formaspagamento) - 1].Valor  := FieldByName('Valor').AsFloat;
         qry.next;
       end;

      sql.clear;
      sql.add('Select FormaPg,Valor');
      sql.add('From   OutrosFinanceiro');
      sql.add('Where Documento         = :Par_Doc');
      sql.add('And   ClienteFornecedor = :Par_CliForn');
      sql.add('And   Origem            = :Par_Origem');
      sql.add('And   PagRec            = :Par_PagRec');
      sql.add('And   Empresa           = :Empresa');
      ParamByName('Par_Doc').AsString     := Documento;
      ParamByName('Par_CliForn').AsString := CliForn;
      ParamByName('Par_Origem').AsString  := Origem;
      ParamByName('Par_PagRec').AsString  := PagRec;
      ParamByName('Empresa').AsString     := Empresa;
      open;

      While not eof do
       begin
         SetLength(FormasPagamento,length(formaspagamento) + 1);
         FormasPagamento[length(formaspagamento) - 1].Codigo := FieldByName('FormaPg').AsString;
         FormasPagamento[length(formaspagamento) - 1].Valor  := FieldByName('Valor').AsFloat;
         qry.next;
       end;

      Free;
    end;
end;

procedure TDetalFinanc.IncluiBaixaParcial(VarDocumento, VarOrigem: String;VarValor:Currency;VarData:TDateTime);
var
i : integer;
begin
   for i:=0 to length(DocumentosDetal) - 1 do
    if (UpperCase(VarDocumento) = Uppercase(DocumentosDetal[i].Documento))  and
       (UpperCase(VarOrigem) = Uppercase(DocumentosDetal[i].Origem)) then begin
          DocumentosDetal[i].BaixaParcial := True;
          DocumentosDetal[i].ValorBaixaParcial := VarValor;
          DocumentosDetal[i].DataBaixaParcial := VarData;
          exit;
    end;
end;


procedure TDetalFinanc.SetDocumentoDetal(value: TDocumentoDetal);
begin


        Setlength(DocumentosDetal,length(DocumentosDetal) + 1);

        documentosdetal[length(Detals.DocumentosDetal) - 1] := Value;

        VarDocumentoDetal := Value;




        If OrigemDetalPrincipal = '' then
         OrigemDetalPrincipal := Value.Origem;

        If DocumentoDetalPrincipal = '' then
         DocumentoDetalPrincipal := Value.Documento;

end;


end.
