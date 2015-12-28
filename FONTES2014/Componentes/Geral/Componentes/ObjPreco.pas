unit ObjPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,DbCtrls,FuncoesGlobais,
  StdCtrls,DbTables,Grids,DbGrids,Imposto;

type
  TPreco = class(TComponent)
  private
    FBancoDados: TDataBase;
    FObjProd: TWinControl;
    FObjAlmox: TWinControl;
    FObjPreco: TWinControl;
    FColAlmox: Integer;
    FColProd: Integer;
    FColPreco: Integer;
    FColQtde: Integer;
    FObjQtde: TWinControl;
    FObjCliente: TWinControl;
    FImposto: Timposto;
    FObjData: TWinControl;
    FObjVendedor: TWinControl;
    FObjOperacao: TWinControl;
    Procedure ValorObjeto(Objeto:Twincontrol;Coluna:Integer;Var Variavel:String);
    Procedure RetornaObjeto(Objeto:Twincontrol;Coluna:Integer;Variavel:Variant);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    { Private declarations }
  protected
    { Protected declarations }
  public
     Produto :String;
     Almoxarifado :String;
     Quantidade : Currency;
     Cliente : String;
     AliquotaIcmsFixa:Currency;
     Data : TDateTime;
     Vendedor : Integer;
     TipoTabPreco : String;
     Operacao : String;
     Function Preco:Currency;
     constructor Create(AOwner: TComponent);override;
     destructor destroy ; override;
    { Public declarations }
  published
     Property BancodeDados       :TDataBase     read FBancoDados write FBancoDados ;
     Property ObjetoProdutos     :TWinControl   read FObjProd write FObjProd ;
     Property ObjetoAlmoxarifado :TWinControl   read FObjAlmox write FObjAlmox ;
     Property ObjetoQuantidade   :TWinControl   read FObjQtde write FObjQtde ;
     Property ObjetoPreco        :TWinControl   read FObjPreco write FObjPreco ;
     Property ObjetoCliente      :TWinControl   read FObjCliente write FObjCliente ;
     Property ObjetoVendedor     :TWinControl   read FObjVendedor write FObjVendedor ;
     Property ObjetoData         :TWinControl   read FObjData write FObjData ;
     Property ObjetoOperacao     :TWinControl   read FObjOperacao write FObjOperacao;
     Property ColunaPreco        :Integer       read FColPreco write FColPreco Default -1;
     Property ColunaAlmoxarifado :Integer       read FColAlmox write FColAlmox Default -1;
     Property ColunaProduto      :Integer       read FColProd write FColProd   Default -1;
     Property ColunaQtde         :Integer       read FColQtde write FColQtde   Default -1;
     Property Imposto            : Timposto Read FImposto Write FImposto;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Entidades', [TPreco]);
end;

{ TPreco }

procedure TPreco.CMExit(var Message: TCMExit);
begin
  If (TForm(Owner as TForm).ActiveControl = FObjPreco) and (FobjPreco is Tstringgrid) and (Tstringgrid(FobjPreco).col = FColProd)  then begin
    showmessage('Coluna produto');
  end;
end;

constructor TPreco.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  TipoTabPreco := 'C';
end;

destructor TPreco.destroy;
begin
  inherited Destroy;

end;

function TPreco.Preco: Currency;
var Pesquisa:Tquery;
    IncideImcs : Boolean;
    VendedorAux : String;
    TabeladePreco:Boolean;
begin
   ValorObjeto(FobjProd,FColProd,Produto);
   ValorObjeto(FobjAlmox,FColAlmox,Almoxarifado);
   ValorObjeto(FobjCliente,-1,Cliente);
   ValorObjeto(FobjOperacao,-1,Operacao);
   Pesquisa := TQuery.Create(Application);
   Pesquisa.DataBaseName := FBancoDados.DataBaseName;
   TabeladePreco := True;
{   If Operacao <> '' then begin
     With Pesquisa do begin
       Sql.clear;
       sql.add('Select ClienteVendedor from TipodeOperacao');
       sql.add('Where Codigo =:Codigo');
       Params[0].asstring := Operacao;
       open;
       If FieldByName('ClienteVendedor').AsString <> '' then
         TipoTabPreco := FieldByName('ClienteVendedor').AsString;
     end;
   end;}


   VendedorAux := IntToStr(Vendedor);
   ValorObjeto(FobjVendedor,-1,VendedorAux);
   if Vendedoraux <> '' then
    Vendedor := StrToInt(VendedorAux);
   IncideImcs := False;
   With Pesquisa do begin
       Sql.Clear;
       sql.add('Select TabelaPreco.IncideIcms,T.Codigo as TabPreco,P.Valor_Prod as ValorProduto,T.Valor as ValorTabPreco,Promocao1.AcabaEstoque,');
       sql.add('Promocao1.DtFim_Prom as FimProm,Promocao1.Perc_Prom as DescPromocao,Promocao1.Desct_Prom as VlPromocao,Promocao1.CodProd_Prom as CodPromocao,P.ValorIcms_Prod as AliqICMS,');
       Sql.add('P.QtdIni_Prod as QtdInicial,(Select Sum(Qtde) from movestoque Where P.Cod_Prod = MovEstoque.Produto and P.Almox_Prod = MovEstoque.Almoxarifado) as QtdAtual');
       sql.add('FROM PRODUTO P LEFT JOIN PROMOCAO Promocao1 ON (Promocao1.ALMOXPROD_PROM = P.ALMOX_PROD ');
       sql.add('  And Promocao1.DtIni_Prom <= '''+DataBancoDados(DateM)+''' And Promocao1.dtfim_prom >= '''+databancodados(DateM())+'''');
       sql.add('  and ((Promocao1.CODPROD_PROM = P.COD_PROD and Promocao1.ProdOrigem <> ''S'') or (Promocao1.CODPROD_PROM = P.COD_PROD_SubItem and Promocao1.ProdOrigem = ''S'')');
       sql.add('  and not exists (select CodProd_Prom from promocao where codprod_prom = produto.cod_prod and produto.almox_prod = almoxprod_prom)))');
       sql.add('Left  Join Cliente C On (C.Cod_Cliente = :Cliente) Left  Join Vendedor V on (V.Cod_Vendedor = :Vendedor ) ');
       sql.add( 'Left  Join TabPrecoProdutos T on (Almox_Prod = T.Almoxarifado and ((Cod_Prod = T.Produto and (P.Cod_Prod_SubItem = '''' or P.Cod_Prod_SubItem is Null)) or (P.Cod_Prod_SubItem = T.Produto))');
       sql.add('and ((T.Codigo = C.TabelaPreco) Or ((T.Codigo = V.TabeladePreco) and ((C.TabelaPreco is  Null) or (C.TabelaPreco = '''')))))' );
       sql.add( 'Left  Join TabelaPreco on (T.Codigo = TabelaPreco.Codigo)');
       sql.add('Where (subitem <> ''S'' or subitem is null) and ALMOX_PROD = :Almoxarifado and Cod_Prod =:Produto');
       parambyname('Produto').AsString := Produto;
       parambyname('Almoxarifado').AsString := Almoxarifado;
       parambyname('Cliente').AsString := Cliente;
       parambyname('Vendedor').AsInteger := Vendedor;
       open;
       If FieldByName('TabPreco').AsString <> '' then
          Result := FieldByName('ValorTabPreco').AsFloat
       else If (FieldByName('CodPromocao').AsString <> '') And (DateM <= FieldByName('FimProm').AsDateTime) And ((FieldByName('AcabaEstoque').AsString <> 'S') or (FieldByName('QtdInicial').AsFloat + FieldByName('QtdAtual').AsFloat > 0)) then
          Result := FieldByName('ValorProduto').AsFloat - ( FieldByName('ValorProduto').AsFloat * FieldByName('DescPromocao').AsFloat/100 + FieldByName('VlPromocao').AsFloat )
       else
          Result := FieldByName('ValorProduto').AsFloat;

       If FieldByName('IncideIcms').AsBoolean   then begin
         if (RetornaConfiguracoes(['ClienteVendaDireta'])[0] = Cliente) and (RetornaConfiguracoes(['AliquotaPdv'])[0] <> 0)  then
             Result := Result * (1 + RetornaConfiguracoes(['AliquotaPdv'])[0]/100)
         else If Imposto <> Nil then begin
             Imposto.GetIcms;
             Result := Result * (1 + Imposto.GetAIcms/100);
         end
         else
             Result := Result * (1 + FieldByName('AliqIcms').asfloat/100);
       end;




     Destroy;
   end;



   RetornaObjeto(FobjPreco,FColPreco,Result);

end;


procedure TPreco.RetornaObjeto(Objeto: Twincontrol; Coluna: Integer;
   Variavel: Variant);
begin
     If Objeto = Nil then
       Exit;

     If Objeto Is TCustomEdit then
        Tedit(Objeto).Text := VarToStr(Variavel);

     If Objeto Is TStringGrid then
       TStringGrid(Objeto).Cells[Coluna,TStringGrid(Objeto).Row] := VarToStr(Variavel);

     If Objeto Is TDbGrid then
       TDbGrid(Objeto).Columns.Items[Coluna].Field.Value := Variavel;

end;

Procedure TPreco.ValorObjeto(Objeto:Twincontrol;Coluna:Integer;Var Variavel:String);
begin
     If Objeto = Nil then
       Exit;

     If Objeto Is TCustomEdit then
       Variavel :=  Tedit(Objeto).Text;

     If Objeto Is TStringGrid then
       Variavel :=  TStringGrid(Objeto).Cells[Coluna,TStringGrid(Objeto).Row];

     If Objeto Is TDbGrid then
       Variavel := TDbGrid(Objeto).Columns.Items[Coluna].Field.Value ;
end;


end.
