unit LayoutImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,FuncoesGlobais
  ,CtrlDb,Db,DbTables,Mask,Setup,rdpRINT,QrExpr,GridSql,Grids,ComboSql,Math;

type

  TItemLayoutImp = Class;

  TItemsLayoutImp = Class;

  TItemLayoutImpPrint  = procedure (sender : TItemLayoutImp;Dados:TListDados) of object;

  TExprItemLayoutImp = Class(TCollectionItem)
  private
    FExpression: String;
    Descricao:String;
    Fkind: TQREvResultType;
    constructor Create(Collection:TCollection);Override;
    Destructor  Destroy ;Override;
    procedure   SetExpression(const Value: String);
  public
     Evaluator:TQREvaluator;
     Property Expression:String  Read FExpression Write FExpression;
     Property Kind : TQREvResultType read Fkind;
     function Value : TQREvResult;
     Procedure reset;
  end;

  TExprsItemLayoutImp = Class(Tcollection)
  Private
      FItemLayoutImp:TItemLayoutImp;
      function    GetItems(Index: Integer): TExprItemLayoutImp;
      procedure   SetItems(Index: Integer; const Value: TExprItemLayoutImp);
      { Private declarations }
  Public
      Constructor Create(ItemLayoutImp:TItemLayoutImp);
      function    GetOwner: TPersistent; override;
      Function    AchaDescricao(Value:String):TExprItemLayoutImp; 
      Property    Items[Index:Integer] : TExprItemLayoutImp read GetItems write SetItems ;Default;
      { Public declarations }
  end;

  TItemLayoutImp = Class(TCollectionItem)
   Private
    Query:TQuery;
    FFaixas: String;
    FTabela: String;
    FModelo: String;
    FFlag: String;
    FDados: TDadosDb;
    FPrint: TItemLayoutImpPrint;
    voLDsQL:String;
    Function GetDisplayName:String;Override;
    { Private declarations }
   Public
     Reset:String;
     Expressions:TExprsItemLayoutImp;
     Imprimiu:Boolean;
     Params:TParams;
     Pesquisa:TQuery;
     QtdeRegPesquisa:Integer;
     TotRegGeral,Indgeral
     ,FFirstLinha,FFirstColuna,UltLinha,FUltLinha,FUltColuna,FultTamColuna,QtdeImp:LongInt;
     constructor Create(Collection:TCollection);Override;
     Destructor  Destroy ;Override;
     procedure   Assign(Source: TPersistent); override;
     procedure   Ativa;
     procedure   AtivaExpression;
     procedure   Imprime(FRdPrint:TRdPrint);
     procedure   MontaSql(Sql:String);
     Function    SqlCampos:TStringList;
     Property    Dados:TDadosDb  Read FDados Write FDados;
    { Public declarations }
   Published
     Property Faixas  : String   Read FFaixas Write FFaixas;
     Property Flag    : String   Read FFlag Write FFlag;
     Property Modelo  : String   Read FModelo Write FModelo;
     Property Tabela  : String  Read FTabela Write FTabela;
     Property Print   : TItemLayoutImpPrint  Read FPrint Write FPrint;
    { Published declarations }
 end;


  TLayoutImp = class;

  TItemsLayoutImp = Class(Tcollection)
  Private
      FDataSet:TQuery;
      FLayoutImp : TLayoutImp;
      function GetItems(Index: Integer): TItemLayoutImp;
      procedure SetItems(Index: Integer; const Value: TItemLayoutImp);
      { Private declarations }
  Public
      UltImpNovo:TItemLayoutImp;
      NovaPagina,imprimedenovo :boolean;
      Pagina:Word;
      Constructor Create(LayoutImp:TLayoutImp);
      destructor  Destroy;Override;
      Procedure   RefreshTabelas;
      function    Add :TItemLayoutImp;
      function    GetOwner: TPersistent; override;
      Property    Items[Index:Integer] : TItemLayoutImp read GetItems write SetItems ;Default;
      Function    ItemsPorTabela(Tabela:String):TItemLayoutImp;
      { Public declarations }
  Published
      { Published declarations }
  end;

  TLayoutImp = class(TComponent)
   private
    QueryUpdates,Query:TQuery;
    FModelo: String;
    FFaixas: String;
    FFlag: String;
    FItemsLayoutImp: TItemsLayoutImp;
    FRdPrint: TRdPrint;
    FBeforePrint: TNotifyEvent;
    FAfterPrint: TNotifyEvent;
    VRdPrintBeforePrint,VRdPrintAfterPrint,
    VRdPrintNewPage,VRdPrintBeforeNewPage:Pointer;
    FItemAtua:TItemLayoutImp;
    FNAtuaPreview: Boolean;
    Procedure FRdPrintAfterPrint(Sender: TObject);
    Procedure FrdPrintBeforeNewPage(Sender: TObject;Pagina: Integer);
    Procedure FRdPrintNewPage(Sender: TObject;Pagina: Integer);
    procedure SetItemsLayoutImp(const Value: TItemsLayoutImp);
    procedure SetRdPrint(const Value: TRdPrint);
    { Private declarations }
   protected
    { Protected declarations }
   public
    FUnion,StrFaixas:String;
    QueryP:TQuery;
    Environment:TQrEvEnvironment;
    Params:TParams;
    FgridParams:TGridSql;
    Constructor Create(AOwner: TComponent);Override;
    Destructor  Destroy ;Override;
    procedure   Ativa;
    procedure   Imprime;
    Procedure   Atualizacao(Posicao:Integer;Tabela: String);
    procedure   CriaParametros(FParent: TWinControl);
    Procedure   AtualizaExpression;
    { Public declarations }
   published
     Property RdPrint: TRdPrint Read FRdPrint Write SetRdPrint;
     Property Faixas : String   Read FFaixas Write FFaixas;
     Property Flag : String   Read FFlag Write FFlag;
     Property Modelo : String   Read FModelo Write FModelo;
     Property Items  : TItemsLayoutImp read FItemsLayoutImp write SetItemsLayoutImp;
     Property BeforePrint: TNotifyEvent Read FBeforePrint Write FBeforePrint;
     Property AfterPrint: TNotifyEvent Read FAfterPrint Write FAfterPrint;
     Property NAtuaPreview : Boolean Read FNAtuaPreview Write FNAtuaPreview;
    { Published declarations }
   end;

   TRegTotal = record
     Posicao:Integer;
     Total :Double;
     TotalR:Double;
   end;

   TregsTotal = Array of TRegTotal;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sistema', [TLayoutImp]);
end;

{ TLayoutImp }

procedure TLayoutImp.Ativa;
begin
  Query.Close;
  With Query do begin
    ParamByName('Faixas').AsString := FFaixas;
    ParamByName('Flag').AsString   := FFlag;
    ParamByName('Codigo').AsString := FModelo;
    Open;
  end;
end;

procedure TLayoutImp.Atualizacao(Posicao:Integer;Tabela: String);
Var
FAtuaParams:TParams;
FStrings:TStringlist;
i,i2,i3:Integer;
FExpValue:TQREvResult;
VQuery:TQuery;
FValue,feXP,fEXP1,FEXP2:sTRING;

begin
  If (FRdPrint <> Nil) and FNAtuaPreview and FRdPrint.OpcoesPreview.Preview then
    exit;
 Try
{             0:Antes da Impressão
              1:Após a Impressão
              2:Antes de Imprimir Nova Pagina
              3:Após Imprimir Nova Pagina
              4:Antes de Imprimir um Novo resgistro
              5:Após Imprimir um Novo resgistro}

       FAtuaParams := TParams.Create;
       FStrings    := TStringList.Create;

       QueryUpdates.Close;
       QueryUpdates.ParamByName('Faixas').AsString := FFaixas;
       QueryUpdates.ParamByName('Flag').AsString   := FFlag;
       QueryUpdates.ParamByName('Codigo').AsString := FModelo;
       QueryUpdates.Open;

       QueryUpdates.First;
       While Not QueryUpdates.Eof do begin
             If QueryUpdates.FieldByName('Posicao').AsInteger <> Posicao then begin
               QueryUpdates.Next;
               Continue;
             end;

             FStrings.Text := QueryUpdates.FieldByName('Tabela').AsString;
             If Not((FStrings.Text = '') or (Tabela = '') or (FStrings.IndexOf(Tabela) > -1)) then begin
               QueryUpdates.Next;
               Continue;
             end;

             VQuery := TQuery.CReate(Application);
             With VQuery do begin
                 Try
                    DataBaseName := 'Bd';
                    Sql.Text     := QueryUpdates.FieldByName('Sql').AsString;
                    Name         := 'FQuery';

                    for i:=0 to Sql.Count - 1 do
                     While Pos('@',Sql[i]) > 0 do
                       With TqrEvaluator.create do
                        try
                           DataSets.Clear;
                           for i3:=0 to FItemsLayoutImp.Count - 1 do
                            If (Tabela = '') or (FStrings.Text = '') or (FStrings.IndexOF(FItemsLayoutImp[i3].Tabela) >-1) then
                              DataSets.Add(FItemsLayoutImp[i3].Pesquisa);
                           Environment := sELF.Environment;

                           For i2:=Pos('@',Sql[i]) + 1 to Length(Sql[i]) do begin
                            If (Copy(Sql[i],i2,1) = '@') Then
                             break;
                            Fexp := FExp + Copy(Sql[i],i2,1);
                           end;
                           With Calculate(Fexp) do
                              Case Kind of
                                    resDouble  :FValue := TrocaPalavra(FloatToStr(dblResult),',','.');
                                    resInt     :FValue := IntToStr(IntResult);
                                    resString,
                                    resBool    :FValue := ''''+StrResult+'''';
                             end;

                          Sql[i] := IIfs(Pos('@',Sql[i]) = 1,'',Copy(Sql[i],1,Pos('@',Sql[i]) - 1)) +
                                    FValue +
                                    IIfs(Pos(Fexp,Sql[i]) + Length(Fexp) + 1 = Length(Sql[i]),'',Copy(Sql[i],Pos(Fexp,Sql[i]) + Length(Fexp) + 2,Length(Sql[i])));
                        finally
                           Destroy;
                        end;

                    FatuaParams.Clear;
                    FAtuaParams.Assign(Self.Params);

                    For i:=0 to ParamCount - 1 do
                     If FAtuaParams.FindParam(Params[i].Name) = Nil  then begin
                        for i2:=0 to FItemsLayoutImp.Count - 1 do begin
                           FItemsLayoutImp[i2].Query.First;
                           If FItemsLayoutImp[i2].Pesquisa.FindField(Params[i].Name) <> Nil then begin
                              TParam(FAtuaParams.Add).Assign(FItemsLayoutImp[i2].Pesquisa.FieldByName(Params[i].Name));
                              If FItemsLayoutImp[i2].Query.Locate('Descricao',Params[i].Name,[loCaseInsensitive]) and
                                 (FItemsLayoutImp[i2].Query.FieldByName('Tipo').AsString = 'S')  then
                                            FAtuaParams[FAtuaParams.Count - 1].AsFloat :=  FItemsLayoutImp[i2].Dados.KeyValue('Descricao',FItemsLayoutImp[i2].Query.FieldByName('Descricao').AsString)
                                                                                   [FItemsLayoutImp[i2].Dados.FindNome(IIfs(Posicao = 3,'TotalR','Total')).Index].Valor;
                              break;
                           end else If FItemsLayoutImp[i2].Query.Locate('Descricao',Params[i].Name,[]) then begin
                                With TParam(FAtuaParams.Add) do begin
                                      Name := FItemsLayoutImp[i2].Query.FieldByName('descricao').AsString;
                                     If FItemsLayoutImp[i2].Query.FieldByName('Tipo').AsString = 'E' then begin
                                        FExpValue := FItemsLayoutImp[i2].Expressions.AchaDescricao(FItemsLayoutImp[i2].Query.FieldByName('Descricao').AsString).Value;
                                        Case FexpValue.Kind of
                                              resDouble :  begin
                                                             DataType := ftFloat;
                                                             Value    := FexpValue.dblResult;
                                                           end;
                                              resInt     : begin
                                                             DataType := ftInteger;
                                                             Value    := FexpValue.IntResult;
                                                           end;
                                              resString,
                                              resBool   : begin
                                                             DataType := ftString;
                                                             Value    := FexpValue.StrResult;
                                                            end;
                                        end;
                                      end else If (FItemsLayoutImp[i2].Query.FieldByName('Tipo').AsString = 'ES') then begin
                                             AsFloat :=  FItemsLayoutImp[i2].Dados.KeyValue('Descricao',FItemsLayoutImp[i2].Query.FieldByName('Descricao').AsString)
                                             [FItemsLayoutImp[i2].Dados.FindNome(IIfs(Posicao = 3,'TotalR','Total')).Index].Valor;
                                      end else begin
                                        DataType := FtString;
                                        AsString := FItemsLayoutImp[i2].Query.FieldByName('Descricao').AsString;
                                      end;
                                      break;
                                end;
                           end;
                      end;


                        If I2 > FItemsLayoutImp.Count - 1 then begin


                            If Self.Environment.IndexOf(Params[i].Name) > -1 then begin
                              With  Self.Environment.Value(Params[i].Name) do
                                Case Kind of
                                  resDouble :  begin
                                                Params[i].DataType :=  ftFloat;
                                                Params[i].Value    :=  dblResult;
                                                end;
                                   resInt     : begin
                                                 Params[i].DataType := ftInteger;
                                                 Params[i].Value    := IntResult;
                                                end;
                                  resString,
                                  resBool    : begin
                                                 Params[i].DataType := ftString;
                                                 Params[i].Value    := StrResult;
                                                end;
                                end;
                           end else begin
                              ParamByName(Params[i].Name).DataType := FtString;
                              ParamByName(Params[i].Name).Clear;
                           end;
                        end;
                      end;

                    TrocaStringParams(VQuery,FAtuaParams);
                    ExecSql;
                 finally
                   Destroy;
                 end;
               end;
            QueryUpdates.Next;
       end;
  finally
       FAtuaParams.Destroy;
       FStrings.Destroy;
  end;
end;

procedure TLayoutImp.AtualizaExpression;
var i:integer;
    FValue:String;
    FQuery:TQuery;
begin
  Environment.SetIntegerConstant(Environment.GetConstant('QtdePagina'),1);
  For i:=0 to QRGlobalEnvironment.Count - 1 do
    Environment.SetConstant(Environment.GetConstant(QRGlobalEnvironment[i]),QRGlobalEnvironment.Value(QRGlobalEnvironment[i]));

  If Not QueryP.Active or (FFlag <> QueryP.ParamByName('Flag').AsString) then begin
     QueryP.Close;
     QueryP.ParamByName('Flag').AsString   := FFlag;
     QueryP.Open;
  end;


 QueryP.First;
 I := 0;
 While Not QueryP.Eof Do Begin
     If Environment.IndexOf(QueryP.FieldbyName('Alias').AsString) = -1 then begin
       QueryP.Next;
       Continue;
     end;

     If Not QueryP.FieldByName('Automatico').AsBoolean  then begin
        If (FGridParams <> Nil) then
          FValue := FGridParams.Cells[1,I];
        Inc(I);
     end else begin
        If QueryP.FieldByName('Sql').AsString <> '' then begin
            FQuery := TQuery.create(Application);
            With FQuery do begin
              Try
                databasename := 'BD';
                Sql.Text := QueryP.FieldByName('Sql').AsString;
                TrocaStringParams(FQuery,Self.Params);
                OPen;
                FValue := Fields[0].AsString;
              finally
                Destroy;
              end;
            end;
        end else begin
          QueryP.Next;
          Continue;
        end;
     end;

     If QueryP.FieldByName('Tipo').AsString = 'ftInteger' then
        Environment.SetIntegerConstant(Environment.GetConstant(QueryP.FieldbyName('Alias').AsString),StrtoIntN(FValue))
     else If (QueryP.FieldByName('Tipo').AsString = 'ftFloat') or (QueryP.FieldByName('Tipo').AsString = 'ftCurrency') then
        Environment.SetFloatConstant(Environment.GetConstant(QueryP.FieldbyName('Alias').AsString),StrtoFloatN(FValue))
     else
        Environment.SetStringConstant(Environment.GetConstant(QueryP.FieldbyName('Alias').AsString),FValue);
     QueryP.Next;
 end;

end;

constructor TLayoutImp.Create(AOwner: TComponent);
var
I:Integer;
begin
  inherited Create(AOwner);
  FItemsLayoutImp := TItemsLayoutImp.Create(Self);
  Query           := TQuery.Create(Self);
  QueryUpdates    := TQuery.Create(Self);
  QueryP          := TQuery.Create(Self);
  Query.DataBaseName := 'BD';
  Params          := TParams.Create(TParam);
  Environment     := TQREvEnvironment.Create;
  Environment.AddFunction('QTDEPAGINA','1');
  Environment.AddFunction('NUMEROLINHA','0');
  QRGlobalEnvironment.Prepare;
  For i:=0 to QRGlobalEnvironment.Count - 1 do
    Environment.AddFunction(QRGlobalEnvironment[i],QRGlobalEnvironment.Value(QRGlobalEnvironment[i]).StrResult);

  With Query do begin
    DataBaseName := 'BD';
    sql.add('Select Descricao,TipodeImpressora,Fonte,Tamanho');
    sql.add(',Lpp,TotColunas,TotLinhas from ModeloImp');
    sql.add('Where Faixas =:Faixas and Flag =:Flag and codigo =:Codigo');
  end;
  With QueryUpdates do begin
    DataBaseName := 'BD';
    sql.add('Select Posicao,Tabela,Sql,Ind');
    sql.add('from ModeloImpU');
    sql.add('Where Faixas =:Faixas and Flag =:Flag and codigo =:Codigo');
    sql.add('Order By Posicao,Ind');
  end;

  With QueryP do begin
    DataBaseName := 'BD';
    Sql.Add('Select Descricao,Alias,Tipo,Valor,Automatico,Sql,Pesquisa,PesquisaTab,PesquisaFiltro,Seq');
    sql.add('From ModeloImpP  Where Flag =:Flag');
    sql.add('Order By Seq');
  end;

end;



Procedure TLayoutImp.CriaParametros(FParent: TWinControl);
Var F:Word;
    FQuery:TQuery;    
begin

  If (FFlag <> QueryP.ParamByName('Flag').AsString) then begin
     QueryP.Close;
     QueryP.ParamByName('Flag').AsString   := FFlag;
     QueryP.Open;
  end;

   FgridParams := Nil;
   If not QueryP.Active then
    QueryP.Open;
   F := 0;

   QueryP.First;
   While Not QueryP.Eof do Begin
      If Not QueryP.FieldByName('Automatico').AsBoolean then Inc(F);
        Environment.AddFunction(Queryp.FieldByName('Alias').AsString,IIFS(UpperCase(Queryp.FieldByName('tIPO').AsString) = 'FTSTRING','''','')+
                                                                          Queryp.FieldByName('Valor').AsString+
                                                                     IIFS(UpperCase(Queryp.FieldByName('tIPO').AsString) = 'FTSTRING','''',''));
      QueryP.Next;
   end;

   If F = 0 then
    exit;

   FgridParams        := TGridSql.Create(Self.Owner);
   FgridParams.Parent := FParent;

   With FgridParams do begin
       MovimentaCelula := True;
       IncluiOption(goEditing);
       Align        := AlClient;
       ColCount     := 2;
       Cells[1,0]   := 'Valor';
       ColWidths[0] := ClientWidth div 2 - 3;
       ColWidths[1] := ClientWidth div 2 - 3;
       Fixedcols    := 1;
       RowCount     := 1;

       F := 0;
       QueryP.First;
       While Not QueryP.Eof do Begin
          If Queryp.FieldByName('Automatico').AsBoolean then begin
            QueryP.Next;
            Continue;
          end;

          If Cells[0,0] <> '' then
            RowCount := RowCount + 1;

          If QueryP.FieldByName('Sql').AsString <> '' then begin
            FQuery := TQuery.create(Application);
            With FQuery do begin
                Try
                  databasename := 'BD';
                  Sql.Text := QueryP.FieldByName('Sql').AsString;
                  TrocaStringParams(FQuery,Self.Params);
                  OPen;
                  Cells[1,RowCount - 1] := Fields[0].AsString;
                finally
                  Destroy;
                end;
            end;
          end else begin
            Cells[0,RowCount - 1] := Queryp.FieldByName('Descricao').AsString;
            With DivideMemo(Queryp.FieldByName('Valor').AsString) do
              Try
                 If Count <= 1 then
                     Cells[1,RowCount - 1] := Queryp.FieldByName('Valor').AsString
                 else begin
                   Cells[1,RowCount - 1]  := Strings[0];
                   With SetCombo(1,RowCount - 1,1) do begin
                     Retorno         := RcText;
                     Items.Text      := Queryp.FieldByName('Valor').AsString;
                   end;
                 end;
              finally
                Destroy;
              end;
          end;
          QueryP.Next;
       end;
   end;
end;

destructor TLayoutImp.Destroy;
begin
  Query.Destroy;
  QueryUpdates.Destroy;
  FItemsLayoutImp.Destroy;
  Params.Destroy;
  inherited Destroy;
end;

procedure TLayoutImp.FRdPrintAfterPrint(Sender: TObject);
begin
  //1:Após a Impressão
  Atualizacao(1,'');
end;

procedure TLayoutImp.FrdPrintBeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
  //3:APÓS DE IMPRIMIR NOVA PAGINA
    If FItemAtua <> Nil Then
      Atualizacao(3,FItemAtua.Tabela)
    else
      Atualizacao(3,'');
end;


procedure TLayoutImp.FRdPrintNewPage(Sender: TObject; Pagina: Integer);
var
FqrValue:TQREvResult;
begin
  //2:ANTES DE IMPRIMIR NOVA PAGINA(SOMENTE MAIOR QUE 1 POIS A PRIMEIRA A FEITA NO MOMENTO QUE CHAMA A FUNÇÃO DE IMPRIMIR)
  FQrValue.Kind      := resInt;
  FQrValue.IntResult := Pagina;
  Environment.Prepare;
  Environment.UpdateConstant('QTDEPAGINA',FQrValue);
  IF Pagina > 1 then
   If FItemAtua <> Nil Then
     Atualizacao(2,FItemAtua.Tabela)
   else
     Atualizacao(2,'');
end;

procedure TLayoutImp.Imprime;
var I,i2:Integer;
    OldImpnovo:Boolean;
begin
 If Not FItemsLayoutImp.ImprimeDeNovo then begin
    AtualizaExpression;
    Atualizacao(0,'');
    Atualizacao(2,FItemsLayoutImp[0].Tabela);
 End;

 OldImpNovo                    := FItemsLayoutImp.ImprimeDeNovo;
 FItemsLayoutImp.UltImpNovo    := Nil;
 FItemsLayoutImp.ImprimeDeNovo := False;
 FItemAtua := Nil;

  For i:=0 to FItemsLayoutImp.Count - 1 do begin
    If Not FItemsLayoutImp.ImprimeDeNovo then
       FItemAtua := FItemsLayoutImp[i];
     FItemsLayoutImp[i].Imprime(FRdPrint);
  end;

  If FItemsLayoutImp.ImprimeDeNovo then begin
     FItemsLayoutImp.Pagina := FItemsLayoutImp.Pagina + 1; 
     For i:=0 to FItemsLayoutImp.Count - 1 do begin
         If  (FItemsLayoutImp[i].Reset = 'R') and (FItemsLayoutImp.UltImpNovo.Index <> I)  then
            FItemsLayoutImp[i].Pesquisa.Close
         else If (FItemsLayoutImp.UltImpNovo.Index < I) or (FItemsLayoutImp[i].Reset = 'T')  then
            FItemsLayoutImp[i].Pesquisa.First
         else if FItemsLayoutImp.UltImpNovo.Index > I  then
            FItemsLayoutImp[i].Pesquisa.Prior;
     end;

     If FRdPrint <> Nil then FrdPrint.NovaPagina;
     Imprime;
  end;
end;

procedure TLayoutImp.SetItemsLayoutImp(const Value: TItemsLayoutImp);
begin
  FItemsLayoutImp.Assign(Value);
end;

procedure TLayoutImp.SetRdPrint(const Value: TRdPrint);
begin
  FRdPrint := Value;
  If FRdPrint <> Nil then begin
    FRdPrint.OnAfterPrint    := FrdPrintAfterPrint;
    FRdPrint.OnBeforeNewPage := FrdPrintBeforeNewPage;
    FRdPrint.OnNewPage       := FrdPrintNewPage;
  end;
end;

{ TItemLayoutImp }

procedure TItemLayoutImp.Assign(Source: TPersistent);
begin
  inherited Assign(Source);

  If Not(Source is TItemLayoutImp) then
   exit;

  FFaixas := TItemLayoutImp(Source).FFaixas;
  FFlag := TItemLayoutImp(Source).FFlag;
  FModelo := TItemLayoutImp(Source).FModelo;
  FTabela := TItemLayoutImp(Source).FTabela;
  FDados := TItemLayoutImp(Source).FDados;
end;

procedure TItemLayoutImp.Ativa;
var
Totais:TRegsTotal;
i:integer;
Diferenca:Double;
begin

  SetLength(Totais,0);
  
  If (FFaixas <> Query.ParamByName('Faixas').AsString) or
     (FFlag <>   Query.ParamByName('Flag').AsString) or
     (FModelo <> Query.ParamByName('Codigo').AsString) or
     (FTabela <> Query.ParamByName('Tabela').AsString) Then begin
        Query.Close;
        With Query do begin
            ParamByName('Faixas').AsString := FFaixas;
            ParamByName('Flag').AsString   := FFlag;
            ParamByName('Codigo').AsString := FModelo;
            ParamByName('Tabela').AsString := FTabela;
            Open;
            Reset := FieldByName('Reset').AsString;
        end;
     end else BEGIN
        for i:=0 to dados.qtderegistros - 1 do begin
         Dados.Posicao := I;
         If Dados.FindNome('Total').FFloat <> 0 then begin
           SetLength(Totais,Length(Totais) + 1);
           Totais[Length(Totais) - 1].Posicao:= I;
           If (Dados.Campos.FindNome('Tipo').FString = 'S')  then
               Diferenca  := Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).AsFloat;
           If (Dados.Campos.FindNome('Tipo').FString = 'ES') and
              (Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.Kind in [ResInt,ResDouble]) then
                Diferenca := Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.dblResult;
           Totais[Length(Totais) - 1].Total := Dados.FindNome('Total').FFloat - Diferenca;
         end;
        end;
        Dados.RefreshDataSet;
     END;

     If TotRegGeral = 0 then begin
         With Query do begin
          Expressions.Clear;
          First;
          While Not Eof do begin
             With TExprItemLayoutImp(Expressions.Add) do begin
               descricao            := FieldByName('Descricao').AsString;
               Expression           := FieldByName('Titulo').AsString;
               If (Self.Collection <> Nil) and (Self.Collection is TItemsLayoutImp) and (TItemsLayoutImp(Self.Collection).getowner <> Nil) then
                 Evaluator.Environment:= TLayoutImp(TItemsLayoutImp(Self.Collection).getowner).Environment
               else
                 Evaluator.Environment:= QrGlobalEnvironment;
             end;
             Next;
          end;
          First;
        end;
    end;


     With  TDadoDb(Dados.Campos.add) do begin
       Name    := 'Total';
       Tipo    := FtCurrency;
       NotNull := True;
     end;

     With  TDadoDb(Dados.Campos.add) do begin
       Name    := 'TotalR';
       Tipo    := FtCurrency;
       NotNull := True;
     end;

     for i:=0 to Length(Totais) - 1 do begin
         Dados.Posicao := Totais[i].Posicao;
         Dados.FindNome('Total').FFloat := Totais[i].Total;
     end;
end;

procedure TItemLayoutImp.AtivaExpression;
var i,i2:integer;
begin
  If (Collection <> Nil) and (Collection is TItemsLayoutImp) then
   For i:=0 to Expressions.count - 1 do begin
      If Expressions[i].Evaluator.DataSets.Count > 0 then
         Expressions[i].Evaluator.DataSets.Clear;
      for i2:=0 to TItemsLayoutImp(Collection).Count - 1 do
       Expressions[i].Evaluator.DataSets.Add(TItemsLayoutImp(Collection).Items[i2].Pesquisa);
   end;
end;

constructor TItemLayoutImp.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  Imprimiu := false;
  Reset    := ''; 
  Pesquisa := TQuery.Create(Nil);
  Pesquisa.DataBaseName := 'BD';
  Query           := TQuery.Create(Nil);
  Params          := TParams.Create(TParam);
  Dados           := TDadosDb.Create(Nil);
  Dados.DataSet   := Query;
  Expressions     := TExprsItemLayoutImp.Create(Self);
  Indgeral    := 1;
  TotReggeral := 0;
  QtdeImp     := 0;
  With Query do begin
    DataBaseName := 'BD';
    sql.add('select I.Descricao,I.Linha,I.Coluna,I.Linha as LinhaOrg,I.coluna as ColOrg,I.Tamanho,I.Largura,I.Tipo,I.Mascara,I.ExprMascara,I.Alinhamento,I.Titulo,I.Repeticao,I.Posicionamento,I.UltimaLinha,I.resetafterprint,I.Strech,i.FonteIt,I.Caixa,I.Extenso');
    sql.add(',(Select Max(I2.Linha) from ModeloImpI i2 Where I2.Faixas =I.Faixas and I2.Flag =I.Flag and I2.codigo =I.Codigo and I2.Tabela =I.Tabela) as MaxLinha');
    sql.add(',(Select Min(I2.Linha) from ModeloImpI i2 Where I2.Faixas =I.Faixas and I2.Flag =I.Flag and I2.codigo =I.Codigo and I2.Tabela =I.Tabela) as FirstLinha');
    sql.add(',C.Linhas,C.Colunas,C.EspColunas,C.EspLinhas,C.limite,C.NovaPagina,C.Reset,C.Caixa as CaixaTab');
    sql.add('from ModeloImpI I');
    sql.add('Left Join ModeloImpC C On (I.Faixas = C.Faixas and I.Flag = C.Flag and I.codigo = C.Codigo and i.Tabela = C.Tabela)');
    sql.add('Where I.Faixas =:Faixas and I.Flag =:Flag and I.codigo =:Codigo and i.Tabela =:Tabela');
    sql.add('Order By I.Posicionamento,I.Seq');
  end;
end;

destructor TItemLayoutImp.Destroy;
begin
  Dados.Destroy;
  Pesquisa.Destroy;
  Query.Destroy;
  Params.Destroy;
  Expressions.Destroy;
  inherited Destroy;
end;

function TItemLayoutImp.GetDisplayName: String;
begin
    If Tabela <> '' then
      Result := Tabela
    else
      Result := inherited GetDisplayName;
end;


procedure TItemLayoutImp.Imprime(FRdPrint:TRdPrint);
var i,i2,i3:Integer;
    FAlignment:TAlignment;
    FExp,FCaixaTab,FValue:String;
    voltaregs,TemLimite,UltLargura,UltCampo,MovLinha,SoRodape:Boolean;
    MaxLength:Extended;
    MaxOldLinha,TotRegistros
    ,OldLinha,FirstLinha,FirstColuna
    ,FColuna
    ,Indice,IndLinha,IndColuna,DifLinha
    ,UltColuna,UltTamColuna
    ,OldIndLinha,LargMovLinha,FUltLarg,RegDifLinha:LongInt;
    FLinhasMemo:TStringList;
    FExpValue:TqrEvResult;
    ObjExp:TQREvaluator;
begin
   voltaregs := false;   
   Ativa;
   If TotRegGeral = 0 then
     AtivaExpression;

   If VOldSql <> Pesquisa.Sql.Text Then
    Pesquisa.Sql.Text := Self.VOldSql;

   With Pesquisa do
    for i:=0 to Sql.Count - 1 do
     While Pos('@',Sql[i]) > 0 do begin
       Pesquisa.close;
       Objexp := TQREvaluator.CReate;
       With ObjExp do
         try
           DataSets.Clear;
           for i3:=0 to TItemsLayoutImp(Collection).Count - 1 do begin
              if Not VoltaRegs and (i3 < self.index) and TItemsLayoutImp(Collection)[i3].Pesquisa.Active and
                 not TItemsLayoutImp(Collection)[i3].Pesquisa.eof Then
                  TItemsLayoutImp(Collection)[i3].Pesquisa.Prior;
              DataSets.Add(TItemsLayoutImp(Collection)[i3].Pesquisa);
           end;
           voltaregs := true;
           Environment := TLayoutImp(TItemsLayoutImp(Collection).getowner).Environment;
           For i2:=Pos('@',Sql[i]) + 1 to Length(Sql[i]) do begin
              If (Copy(Sql[i],i2,1) = '@') Then
                break;
              Fexp := FExp + Copy(Sql[i],i2,1);
           end;



           With Calculate(Fexp) do
              Case Kind of
                      resDouble  :FValue := TrocaPalavra(FloatToStr(dblResult),',','.');
                      resInt     :FValue := IntToStr(IntResult);
                      resString,
                      resBool    :FValue := ''''+StrResult+'''';
               end;

            Sql[i] := IIfs(Pos('@',Sql[i]) = 1,'',Copy(Sql[i],1,Pos('@',Sql[i]) - 1)) +
                      FValue +
                      IIfs(Pos(Fexp,Sql[i]) + Length(Fexp) + 1 = Length(Sql[i]),'',Copy(Sql[i],Pos(Fexp,Sql[i]) + Length(Fexp) + 2,Length(Sql[i])));
         finally
            Objexp.Destroy;
            if Voltaregs then
             for i3:=0 to self.index - 1 do
              if TItemsLayoutImp(Collection)[i3].Pesquisa.Active and  not TItemsLayoutImp(Collection)[i3].Pesquisa.eof Then
               TItemsLayoutImp(Collection)[i3].Pesquisa.Next;
         end;
     end;
     

   If Not Pesquisa.Active then begin
     Pesquisa.Open;
     If Not Pesquisa.Eof and (Pesquisa.RecordCount = -1) Then begin
       QtdeRegPesquisa := 0;
       While Not Pesquisa.Eof do begin
         Inc(QtdeRegPesquisa);
         Pesquisa.Next;
       end;
       Pesquisa.First;
     end else
       QtdeRegPesquisa := pesquisa.recordcount;
   end;  
   Indice := 1;
   Dados.Posicao := 1;
   IndLinha := 0;
   IndColuna := 0;
   FFirstLinha := 0;
   FFirstColuna := 0;
   FUltLinha := 0;
   FUltColuna := 0;
   FultTamColuna := 0;
   TotRegistros := 0;
   Imprimiu := Not Pesquisa.eof;
   SoRodape := false;
   MovLinha := false;
   DifLinha := 0;
   RegDifLinha := 0;
   MaxOldLinha := 0;
   TemLimite := False;
   If (collection is TItemsLayoutImp) then
     For i2:=Self.Index - 1 downto 0 do begin
       MaxOldLinha := IIfs(TItemsLayoutImp(Collection)[i2].UltLinha > TItemsLayoutImp(Collection)[i2].FUltLinha,TItemsLayoutImp(Collection)[i2].UltLinha,TItemsLayoutImp(Collection)[i2].FUltLinha);
       If TItemsLayoutImp(Collection)[i2].Imprimiu and
         (MaxOldLinha > Dados.Campos.findnome('FirstLinha').Finteger)  then begin
             DifLinha  := (MaxOldLinha - TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('MaxLinha').FInteger);
             TemLimite := (Self.Dados.Campos.findnome('Reset').FString = 'F') and (TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('NovaPagina').FString = 'T') and Not TItemsLayoutImp(Collection)[i2].Pesquisa.Eof;
             Break;
       end;
     end;

{            for i3:=0 to TItemsLayoutImp(Collection)[i2].Dados.QtdeRegistros - 1 do begin
               TItemsLayoutImp(Collection)[i2].Dados.Posicao := I3;
               If (TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('Linha').Finteger > MaxOldLinha) and
                  Not((TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('Posicionamento').FString = 'R') and
                      Not TItemsLayoutImp(Collection)[i2].Pesquisa.Eof)
               Then begin
                  MaxOldLinha := TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('Linha').Finteger;
                  DifLinha    := (TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('Linha').Finteger - TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('LinhaOrg').Finteger)+
                                  iifs(TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('LinhaOrg').Finteger < Dados.Campos.findnome('FirstLinha').Finteger,
                                       Dados.Campos.findnome('FirstLinha').Finteger - TItemsLayoutImp(Collection)[i2].Dados.Campos.findnome('LinhaOrg').Finteger,0)
                                  ;


                  //                  DifLinha    := TItemsLayoutImp(Collection)[i2].FultLinha - MaxOldLinha;
                end;
           end;}

   While Not Pesquisa.Eof do begin
      If (Collection <> Nil) and (Collection is TItemsLayoutImp) and (TItemsLayoutImp(Collection).getowner <> Nil) and
         (QtdeImp <> -1) then
           TLayoutImp(TItemsLayoutImp(Collection).getowner).Atualizacao(4,FTabela);

      fcoluna      := 0;
      UltLinha     := 0;
      UltColuna    := 0;
      ulttamcoluna := 0;
      FirstLinha   := 0;
      FirstColuna  := 0;
      FUltLarg     := 0;
      TotRegistros := TotRegistros + 1;
      TotReggeral  := TotReggeral  + 1;
      for i:=0 to Dados.QtdeRegistros - 1 do begin
         If (TemLimite and (Dados.Campos.FindNome('UltimaLinha').FString = 'T')) Then
          continue;

         LargMovLinha := 0;
         UltCampo := False;
         Dados.Posicao := I;
         FcaixaTab     := Dados.campos.findnome('CaixaTab').FString;
         If Dados.Campos.FindNome('FonteIt').FString <> '' then
           MaxLength   := IndiceImp(FRdPrint.FonteTamanhoPadrao,StrtoSize(Dados.Campos.FindNome('FonteIt').FString))
         else
           MaxLength   := 1;

         If SoRodape and (Dados.campos.findnome('posicionamento').FString = 'C') then
           continue;

         OldLinha      := IndLInha;

         If (Dados.Campos.FindNome('Tipo').FString = 'S')  then
           Dados.Campos.FindNome('Total').FFloat := Dados.Campos.FindNome('Total').FFloat +
           Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).AsFloat;

         If (Dados.Campos.FindNome('Tipo').FString = 'ES') and
            (Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.Kind in [ResInt,ResDouble]) then
               Dados.Campos.FindNome('Total').FFloat := Dados.Campos.FindNome('Total').FFloat +
               Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.dblResult;


         Dados.Campos.FindNome('TotalR').FFloat := Dados.Campos.FindNome('Total').FFloat;






       If (Dados.Campos.FindNome('Posicionamento').FString = 'R') or (Dados.Campos.FindNome('Posicionamento').FString = 'P') then
           if ((totregGeral < QtdeRegPesquisa) and (Dados.Campos.FindNome('Posicionamento').FString = 'R')) or
              ((totregGeral < QtdeRegPesquisa) and Not SoRodape and (Dados.Campos.FindNome('Posicionamento').FString = 'P'))  then
               Continue
           else if (Dados.Registros.FindValue[I - 1,Dados.Campos.FindNome('Posicionamento')] = 'C') Then
               IndLinha     := IIfs(FUltLinha > UltLinha,FUltLinha,UltLinha) -
                               RegDifLInha - 
                               IIfs(Dados.Registros.FindValue[I - 1,Dados.Campos.FindNome('Caixa')] = '',1,2) -
                               IIfs(TotRegistros > 1,FFirstLinha,FirstLinha) +
                               IIfs(Dados.Registros.FindValue[I - 1,Dados.Campos.FindNome('UltimaLinha')] = 'T',DifLinha,0) +
                               IIfs(Dados.Campos.FindNome('EspLinhas').FInteger = 0,1,Dados.Campos.FindNome('EspLinhas').FInteger);


         MovLinha   := MovLinha or (
                                   ((Dados.Campos.FindNome('Posicionamento').FString = 'R') or (Dados.Campos.FindNome('Posicionamento').FString = 'P')) and
                                    (Dados.Campos.FindNome('LinhaOrg').FInteger  <=
                                    (IIfs(TotRegistros > 1,FFirstLinha,FirstLinha) + IndLInha +
                                    IIfs((Dados.Campos.FindNome('Caixa').FString <> '') and (Dados.Campos.FindNome('LinhaOrg').FInteger = IIfs(TotRegistros > 1,FFirstLinha,FirstLinha) + IndLInha + 1),1,0)
                                    )));

         Dados.Campos.FindNome('Linha').FInteger := Dados.Campos.FindNome('Linha').FInteger +
                                                    IIfs(MovLinha or (Not(((Dados.Campos.FindNome('Posicionamento').FString = 'R') or (Dados.Campos.FindNome('Posicionamento').FString = 'P'))
                                                         and (Dados.Campos.FindNome('LinhaOrg').FInteger > IIfs(TotRegistros > 1,FFirstLinha,FirstLinha) + IndLInha)))
                                                         ,IndLinha,0) +
                                                    IIfs((TotRegistros = 1) and (Dados.Campos.FindNome('UltimaLinha').FString = 'T'),DifLinha,0)
                                                    ;


         Dados.Campos.FindNome('Coluna').FInteger := Dados.Campos.FindNome('Coluna').FInteger + IndColuna;


         If Assigned(FPrint) then
           FPrint(Self,Dados.Campos);


        FExpValue.Kind      := resInt;
        FExpValue.IntResult := Dados.Campos.FindNome('Linha').FInteger;
        TLayoutImp(TItemsLayoutImp(Collection).getowner).Environment.Prepare;
        TLayoutImp(TItemsLayoutImp(Collection).getowner).Environment.UpdateConstant('NUMEROLINHA',FExpValue);

        If(Dados.Campos.FindNome('Tipo').FString = 'C') or
          (Dados.Campos.FindNome('Tipo').FString = 'S') or
          (Dados.Campos.FindNome('Tipo').FString = 'ES') or
          (Dados.Campos.FindNome('Tipo').FString = 'E') then begin
            If Dados.Campos.FindNome('Tipo').FString = 'E' then begin
              FExpValue := Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value;
              case FExpValue.kind of
                 ResInt:   FValue := IntToStr(FExpValue.IntResult);
                 ResDouble:FValue := FloatToStr(FExpValue.dblResult);
              else
                           FValue := FExpValue.StrResult;
              end;
            end else If Dados.Campos.FindNome('Tipo').FString = 'C' then
              FValue := Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).AsString

            else begin
              If (Dados.Campos.FindNome('Tipo').FString = 'S') then
                  FValue := Dados.Campos.FindNome('Total').FString -
                            IIFS((TotRegGeral <> QtdeRegPesquisa) and
                                 (Dados.Campos.FindNome('Posicionamento').FString = 'P')
                                 ,Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).AsFloat
                                 ,0)
             else If Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.Kind in [ResInt,ResDouble] then
                  FValue := Dados.Campos.FindNome('Total').FString -
                            IIFS((TotRegGeral <> QtdeRegPesquisa) and
                                 (Dados.Campos.FindNome('Posicionamento').FString = 'P')
                                 ,Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Value.dblResult
                                 ,0);

             Dados.Campos.FindNome('TotalR').FFloat := StrToFloatN(FValue);
            end;



            If Dados.Campos.FindNome('ExprMascara').FString <> '' then begin
              With TQrEvaluator.Create do begin
                Try
                 DataSets := Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Evaluator.DataSets;
                 If (Collection <> Nil) and (Collection is TItemsLayoutImp) and (TItemsLayoutImp(Collection).getowner <> Nil) then
                   Environment:= TLayoutImp(TItemsLayoutImp(Collection).getowner).Environment
                 else
                   Environment:= QrGlobalEnvironment;

                 With DivideMemo(Dados.Campos.FindNome('ExprMascara').FString) do begin
                   Try
                       Text := Dados.Campos.FindNome('ExprMascara').FString;
                       Dados.Campos.FindNome('ExprMascara').FString := '';
                       For i2:=0 to Count - 1 do
                         Dados.Campos.FindNome('ExprMascara').FString := Dados.Campos.FindNome('ExprMascara').FString +
                                                                         IIfs(Dados.Campos.FindNome('ExprMascara').FString = '','',' ') +
                                                                         Strings[i2];
                   finally
                       Destroy;
                   end;
                 end;
                 Environment.Prepare;
                 Dados.Campos.FindNome('Mascara').FString := Calculate(Dados.Campos.FindNome('ExprMascara').FString).StrResult;
                finally
                  Destroy;
                end;
              end;
            end;


            If Dados.Campos.FindNome('Mascara').FString <> '' then
               If ((Dados.Campos.FindNome('Tipo').FString = 'C') or (Dados.Campos.FindNome('Tipo').FString = 'S')) then begin
                 Case Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).DataType of
                      FtString,FtMemo:          FValue := FormatMaskText(Dados.Campos.FindNome('Mascara').FString,FValue);
                      FtDateTime,FtTime,FtDate: FValue := FormatDateTime(Dados.Campos.FindNome('Mascara').FString,
                                                          Pesquisa.FieldByNAme(Dados.Campos.FindNome('Descricao').FString).AsDateTime);
                      FtFloat,FtCurrency,FtInteger,
                      FtWord                  : FValue := FormatFloat(Dados.Campos.FindNome('Mascara').FString,
                                                          StrtoFloatN(FValue));
                 end;
              end else If ((Dados.Campos.FindNome('Tipo').FString = 'E') or (Dados.Campos.FindNome('Tipo').FString = 'ES')) then begin
                  Case Expressions.AchaDescricao(Dados.Campos.FindNome('Descricao').FString).Kind of
                        resInt,resDouble : FValue := FormatFloat(Dados.Campos.FindNome('Mascara').FString,StrtoFloatN(FValue));
                        resString        : FValue := FormatMaskText(Dados.Campos.FindNome('Mascara').FString,FValue);
                  end;
              end;
          end Else If Dados.Campos.FindNome('Tipo').FString = 'L' then
            FValue   := RepeatChar(Dados.Campos.FindNome('Descricao').FString,(FRdPrint.TamanhoQteColunas
                       - Dados.Campos.FindNome('Coluna').FInteger + 1) div length(Dados.Campos.FindNome('Descricao').FString))
          else If  (Dados.Campos.FindNome('Tipo').FString = 'P')
               and (Collection <> Nil) and (Collection is TItemsLayoutImp) then
            FValue := InttoStr(TItemsLayoutImp(Collection).Pagina)
          else
            FValue := IIfs(Dados.Campos.FindNome('Titulo').FString <> '',Dados.Campos.FindNome('Titulo').FString,Dados.Campos.FindNome('Descricao').FString);


           FColuna := Dados.Campos.FindNome('Coluna').FInteger;

           If Dados.Campos.FindNome('Alinhamento').FString = 'D' then begin
             FAlignment := taRightJustify;
             FColuna    := Dados.Campos.FindNome('Coluna').FInteger
                           + IIfs(Dados.Campos.FindNome('Tamanho').FInteger > 0
                          ,Dados.Campos.FindNome('Tamanho').FInteger,Length(Dados.Campos.FindNome('Descricao').FString));
          end else If Dados.Campos.FindNome('Alinhamento').FString = 'C' then begin
             FAlignment := taCenter;
             FColuna    := Dados.Campos.FindNome('Coluna').FInteger
                           + IIfs(Dados.Campos.FindNome('Tamanho').FInteger > 0
                           ,Dados.Campos.FindNome('Tamanho').FInteger,Length(Dados.Campos.FindNome('Descricao').FString)) div 2;
          end else
             FAlignment := taLeftJustify;


       If Dados.Campos.FindNome('Extenso').FString = 'T' then
         FValue := UpperCase(MonExtenso(FValue));

       FLinhasMemo := DivideMemo(FValue);
       If (Dados.Campos.FindNome('Strech').FString = 'T') and (Dados.Campos.FindNome('Tamanho').FInteger > 0) then
        DivLimiteStrings(FlinhasMemo,Dados.Campos.FindNome('Tamanho').FInteger);


      If (Dados.Campos.FindNome('Linha').FInteger + IIfs(Dados.Campos.FindNome('Largura').FInteger > 0,
                                                         Dados.Campos.FindNome('Largura').FInteger
                                                        ,IIfs(FLinhasmemo.Count > 0,FLinhasmemo.Count,1)) <=
          Dados.Campos.FindNome('FirstLinha').FInteger + Dados.Campos.FindNome('Limite').FInteger) or
         (Dados.Campos.FindNome('Limite').FInteger = 0) or
         (Dados.Campos.FindNome('Posicionamento').FString <> 'C') or
         (IndGeral = 1) then begin
            If ((Dados.Campos.FindNome('Tipo').FString = 'QS') or (Dados.Campos.FindNome('Tipo').FString = 'QD')) then BEGIN
               Dados.Campos.FindNome('Largura').Finteger :=      iifs(Dados.Campos.FindNome('Strech').FString <> 'T',
                                                                 Dados.Campos.FindNome('Largura').FInteger,
                                                                 UltLinha - Dados.Campos.FindNome('Linha').FInteger + 1);
               FRdPrint.Box(Dados.Campos.FindNome('Linha').FInteger,Dados.Campos.FindNome('Coluna').FInteger,
                            Round(Abs(Dados.Campos.FindNome('Linha').FInteger + iiFS(Dados.Campos.FindNome('Largura').FInteger > 0,Dados.Campos.FindNome('Largura').FInteger,-FRdPrint.TamanhoQteLinhas))),
                            Round(Abs(Dados.Campos.FindNome('Coluna').FInteger + iiFS(Dados.Campos.FindNome('Tamanho').FInteger > 0,Dados.Campos.FindNome('Tamanho').FInteger,-FRdPrint.TamanhoQteColunas))),
                            Dados.Campos.FindNome('Tipo').FString = 'QD')
            END else begin


                   for i2:=0 to FlinhasMemo.count - 1 do begin
                     If TiraEspacosEsq(FLinhasMemo[i2]) <> '' then begin
                         RdPrintImpNegritoF(FRdPrint
                                           ,Dados.Campos.FindNome('Linha').FInteger + I2
                                           ,IIfs(Dados.Campos.FindNome('FonteIt').FString <> '',Dados.Campos.FindNome('Coluna').FString,FColuna)
                                           ,IIfs((Dados.Campos.FindNome('Tamanho').FInteger = 0) or (Dados.Campos.FindNome('Strech').FString = 'T')
                                                  ,TiraEspacosEsq(FLinhasMemo[i2])
                                                  ,copy(TiraEspacosEsq(FLinhasMemo[i2]),1,Dados.Campos.FindNome('Tamanho').FInteger)
                                                 )
                                           ,FAlignment
                                           ,Dados.Campos.FindNome('Repeticao').FInteger
                                           ,[StrtoFonteRd(iiFS(Dados.Campos.FindNome('FonteIt').FString = '',
                                                          SizeTosTR(FRdPrint.FonteTamanhoPadrao),
                                                          dados.Campos.FindNome('FonteIt').FString))]
                                           ,Iifs(Dados.Campos.FindNome('Tamanho').FInteger > 0,Dados.Campos.FindNome('Tamanho').FInteger,Length(TiraEspacosEsq(FLinhasMemo[i2]))));

                           If (i2 + 1 > FUltLarg)  then
                             FUltlarg := i2 + 1;
                     end;

                     If (Dados.Campos.FindNome('Largura').FInteger > 0) and
                        (I2 + 1 = Dados.Campos.FindNome('Largura').FInteger) then
                         break;
                  end;


                   If (Dados.Campos.FindNome('Caixa').FString <> '') then
                     FRdPrint.Box(Dados.Campos.FindNome('Linha').FInteger   - 1
                                 ,Dados.Campos.FindNome('Coluna').FInteger  - 1
                                 ,Dados.Campos.FindNome('Linha').FInteger +
                                  IIfs(Dados.Campos.FindNome('Largura').FInteger > 0,Dados.Campos.FindNome('Largura').FInteger,FLinhasMemo.Count)
                                 ,Dados.Campos.FindNome('Coluna').FInteger + Round(IIfs(Dados.Campos.FindNome('Tamanho').FInteger > 0,Dados.Campos.FindNome('Tamanho').FInteger,Length(Dados.Campos.FindNome('Descricao').FString)) * MaxLength)
                                 ,Dados.Campos.FindNome('Caixa').FString = 'D');

                   If Dados.Campos.FindNome('ResetAfterPrint').FString = 'T' then
                     Dados.Campos.FindNome('Total').FFloat := 0;
             end;
      end else begin
         IndLinha  := OldLinha;
         SoRodape  := True;
         TotReggeral  := TotReggeral  - 1;
         If (Collection <> Nil) and (Collection is TItemsLayoutImp) then begin
          TItemsLayoutImp(Collection).ImprimeDeNovo  := Dados.campos.findnome('NovaPagina').FsTRING = 'T';
          TItemsLayoutImp(Collection).UltImpNovo     := Self;
         end;
         Continue;
      end;



        If Dados.Campos.FindNome('Alinhamento').FString <> 'D' then
           Fcoluna :=  Fcoluna + Ceil(
                                 IIfs(Dados.Campos.FindNome('Tamanho').FInteger > 0
                                     ,Dados.Campos.FindNome('Tamanho').FInteger
                                     ,Length(Dados.Campos.FindNome('Descricao').FString)) * MaxLength)
                                  div IIfs(Dados.Campos.FindNome('Alinhamento').FString = 'C',2,1);

         If UltColuna < FColuna then
           UltColuna  := Fcoluna;



         If UltLinha < Dados.Campos.FindNome('Linha').FInteger +
                       IIfs(Dados.Campos.FindNome('Largura').FInteger > 0,Dados.Campos.FindNome('Largura').FInteger,IIfs(FlinhasMemo.Count > 0,FlinhasMemo.Count,1)) +
                       IIfs(Dados.Campos.FindNome('Caixa').FString <> '',1,0) - 1 THEN
            UltLinha := Dados.Campos.FindNome('Linha').FInteger
                        + IIfs(Dados.Campos.FindNome('Largura').FInteger > 0,Dados.Campos.FindNome('Largura').FInteger,IIfs(FlinhasMemo.Count > 0,FlinhasMemo.Count,1))
                        + IIfs(Dados.Campos.FindNome('Caixa').FString <> '',1,0) - 1 ;


         If UltTamColuna < Dados.Campos.FindNome('Coluna').FInteger + IIfs(Dados.Campos.FindNome('Caixa').FString <> '',1,0) then
          UltTamColuna  := Dados.Campos.FindNome('Coluna').FInteger + IIfs(Dados.Campos.FindNome('Caixa').FString <> '',1,0);

         If (Dados.Campos.FindNome('Linha').FInteger < FirstLinha) Or (FirstLinha = 0) then
          FirstLinha := Dados.Campos.FindNome('Linha').FInteger;

         If (Dados.Campos.FindNome('Coluna').FInteger < FirstColuna) Or (FirstColuna = 0) then
          FirstColuna := Dados.Campos.FindNome('Coluna').FInteger;

          




      end;

      If SoRodape then
       Break;

      IndColuna := 0;
      IndLinha  := 0;

      If (FFirstcoluna = 0) or  (FirstColuna < FFirstColuna) then
        FFirstColuna := FirstColuna;

      If (FFirstLinha = 0)  or (FirstLinha < FFirstLinha)  then
        FFirstLinha := FirstLinha;


      If (Dados.Campos.FindNome('Colunas').FInteger > 1)  then begin
           If (Dados.Campos.FindNome('Colunas').FInteger = Indice) then begin
              IndColuna := FFirstColuna - firstColuna;
              Indice    := 0;
              IndLinha  := UltLinha - FirstLinha + IIfs(Dados.Campos.FindNome('EspLinhas').FInteger = 0,1,
                                                  Dados.Campos.FindNome('EspLinhas').FInteger);
           end else
              IndColuna  := UltColuna - firstColuna + IIfs(Dados.Campos.FindNome('EspColunas').FInteger = 0,1,
                                                      Dados.Campos.FindNome('EspColunas').FInteger);
      end else If (Dados.Campos.FindNome('Linhas').FInteger > 1)  then begin
           If (Dados.Campos.FindNome('Linhas').FInteger = Indice) then begin
              IndLinha   := FFirstLinha - UltLinha + IIfs(Dados.Campos.FindNome('EspLinhas').FInteger > 1,0,
                                                      Dados.Campos.FindNome('EspLinhas').FInteger);;
              Indice     := 0;
              IndColuna  := UltColuna - firstColuna + IIfs(Dados.Campos.FindNome('EspColunas').FInteger = 0,1,
                                                      Dados.Campos.FindNome('EspColunas').FInteger);
           end else
              IndLinha := UltLinha - FirstLinha + IIfs(Dados.Campos.FindNome('EspLinhas').FInteger = 0,1,
                                                  Dados.Campos.FindNome('EspLinhas').FInteger);
      end else
          IndLinha := UltLinha - FirstLinha + IIfs(Dados.Campos.FindNome('EspLinhas').FInteger = 0,1,
                                                  Dados.Campos.FindNome('EspLinhas').FInteger);

      If (FUltColuna < UltColuna) then
        FUltColuna := UltColuna;

      If (FUltTamColuna < UltTamColuna) then
        FUltTamColuna := UltTamColuna;

      If (FUltLinha < UltLinha) then
        FUltLinha := UltLinha;


      If (Collection <> Nil) and (Collection is TItemsLayoutImp) and (TItemsLayoutImp(Collection).getowner <> Nil) and
         (QtdeImp <> -1) then
           TLayoutImp(TItemsLayoutImp(Collection).getowner).Atualizacao(5,FTabela);

      Pesquisa.Next;

      If IndGeral = 1 then
        RegDifLinha := FUltLinha - FFirstLinha;

      Indice   := Indice + 1;
      IndGeral := IndGeral + 1;
      If QtdeImp <> -1 then
        Qtdeimp  := Qtdeimp + 1;
   end;

   If Pesquisa.Eof or SoRodaPe then begin
      If FCaixaTab <> '' then
       FRdPrint.Box(FFirstLinha  - 1,
                    FFirstColuna - 1,
                    FUltLinha + 1,
                    FUltColuna + 1,
                    FCaixaTab = 'D');

      If Pesquisa.Eof then begin
        IndGeral    := 1;
        TotRegGeral := 0;
        Qtdeimp     := -1;
      end;
   end;
end;



procedure TItemLayoutImp.MontaSql(Sql: String);
var i:INTEGER;
    FCampos:String;
begin
   Pesquisa.Sql.Clear;
   Pesquisa.Sql.Text := Sql;
   FCampos := '';
   With SqlCampos do
    try
      For i:=0 to Count - 1 do
       FCampos := FCampos +' '+Strings[i] ;
    finally
      Destroy;
    end;

   If (Collection <> Nil) and (Collection is TItemsLayoutImp) and (TItemsLayoutImp(Collection).getowner <> Nil) and
      (TLayoutImp(TItemsLayoutImp(Collection).getowner).FUnion <> '') Then
        Pesquisa.Sql.Text := TLayoutImp(TItemsLayoutImp(Collection).getowner).FUnion;

   Pesquisa.Sql.Text := TrocaPalavra(Pesquisa.Sql.Text,'@Campos',FCampos);
   If (Collection <> Nil) and (Collection is TItemsLayoutImp) and (TItemsLayoutImp(Collection).getowner <> Nil) and
      (TLayoutImp(TItemsLayoutImp(Collection).getowner).StrFaixas <> '') Then
         Pesquisa.Sql.Text := TrocaPalavra(Pesquisa.Sql.Text,'@Faixas',TLayoutImp(TItemsLayoutImp(Collection).getowner).StrFaixas)
   else
         Pesquisa.Sql.Text := TrocaPalavra(Pesquisa.Sql.Text,'@Faixas',' ''a'' = ''a''');



   Pesquisa.Name     := 'Pesquisa'+Tabela;
   If Params.Count > 0 then
     For i:=0 to Params.Count - 1 do
       If Pesquisa.Params.FindParam(Params[i].Name) <> Nil then Begin
         Pesquisa.ParamByName(Params[i].Name).Assign(Params[i]);
         Pesquisa.ParamByName(Params[i].Name).Value := Params[i].Value;
       end;
   FCampos := Pesquisa.Sql.Text;

   TrocaStringParams(Pesquisa,Params);
   VOldSql := Pesquisa.Sql.Text;
end;

function TItemLayoutImp.SqlCampos: TStringList;
var i:word;
begin
  Result := TStringList.Create;
  Ativa;
  Dados.Posicao := 0;
  for i:=0 to Dados.QtdeRegistros - 1 do begin
       If ((Dados.Campos.FindNome('Tipo').FString <> 'C') and (Dados.Campos.FindNome('Tipo').FString <> 'S')) or
           (PosField(Result,Dados.Campos.FindNome('Descricao').FString) > 0) then begin
              Dados.Posicao := I + 1;
              continue;
       end;

       If Dados.Campos.FindNome('Titulo').FString <> '' then
         Result.Add(IIfs(Result.Text <> '',',','')+Dados.Campos.FindNome('Titulo').FString +' as '+Dados.Campos.FindNome('Descricao').FString)
       else
        Result.Add(IIfs(Result.Text <> '',',','')+Dados.Campos.FindNome('Descricao').FString);
       Dados.Posicao := I + 1;
  end;
end;

{ TItemsLayoutImp }

function TItemsLayoutImp.Add: TItemLayoutImp;
begin
  Result := TItemLayoutImp(inherited Add);
end;

constructor TItemsLayoutImp.Create(LayoutImp: TLayoutImp);
begin
  inherited Create(TItemLayoutImp);
  Self.FLayoutImp := LayoutImp;
  Pagina          := 1;
end;

destructor TItemsLayoutImp.Destroy;
begin
  inherited Destroy;
end;

function TItemsLayoutImp.GetItems(Index: Integer): TItemLayoutImp;
begin
  Result := TItemLayoutImp(inherited GetItem(Index));
end;

function TItemsLayoutImp.GetOwner: TPersistent;
begin
  Result := Self.FLayoutImp;
end;

function TItemsLayoutImp.ItemsPorTabela(Tabela: String): TItemLayoutImp;
var I:Word;
begin
  Result := Nil;
  for i:=0 to Count - 1 do
    If UpperCase(GetItems(I).Tabela) = UpperCase(Tabela) then begin
      Result := GetItems(I);
      exit;
    end;
end;

procedure TItemsLayoutImp.RefreshTabelas;
var i:Integer;
    FSql:TStringList;
    FQuery:TQuery;
begin
  Pagina          := 1;
  FQuery := TQuery.Create(Nil);
  Try
     with FQuery do begin
        DataBaseName := 'Bd';
        sql.add('select C.Tabela,C.Sql,C.Seq');
        sql.add('from  ModeloImpC C');
        sql.add('Where C.Faixas =:Faixas and C.Flag =:Flag and C.codigo =:Codigo');
        Sql.add('Order By Seq');
        ParamByName('Faixas').AsString := FLayoutImp.Faixas;
        ParamByName('Flag').AsString   := FLayoutImp.Flag;
        ParamByName('Codigo').AsString := FLayoutImp.Modelo;
        open;

        Self.Clear;

        While Not eof do begin
           With Add do begin
             Flag   := FLayoutImp.Flag;
             Faixas := FLayoutImp.Faixas;
             Modelo := FLayoutImp.Modelo;
             Tabela := FieldByName('Tabela').AsString;
             Params.Assign(FLayoutImp.Params);
             TLayoutImp(FLayoutImp).Environment.Prepare;
             For i:=0 to TLayoutImp(FLayoutImp).Environment.Count - 1 do
              If Params.FindParam(TLayoutImp(FLayoutImp).Environment[i]) = Nil Then
               With TLayoutImp(FLayoutImp).Environment.Value(TLayoutImp(FLayoutImp).Environment[i]) do
                 With TParam(Params.Add) do begin
                  DataType := QREvResultTypeToDataType(Kind);
                  Case Kind Of
                    ResString  : AsString  := TLayoutImp(FLayoutImp).Environment.Value(TLayoutImp(FLayoutImp).Environment[i]).strResult;
                    ResDouble  : AsFloat   := TLayoutImp(FLayoutImp).Environment.Value(TLayoutImp(FLayoutImp).Environment[i]).dblResult;
                    ResInt     : AsInteger := TLayoutImp(FLayoutImp).Environment.Value(TLayoutImp(FLayoutImp).Environment[i]).intResult;
                  end;
                 end;
             MontaSql(FieldByName('Sql').AsString);
           end;
           Next;
        end;
     end;
   finally
      FQuery.Destroy;
   end;
end;

procedure TItemsLayoutImp.SetItems(Index: Integer;
  const Value: TItemLayoutImp);
begin
  inherited SetItem(Index, Value);
end;

{ TExprItemLayoutImp }

constructor TExprItemLayoutImp.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  Evaluator := TQrEvaluator.Create;
end;

destructor TExprItemLayoutImp.Destroy;
begin
  Evaluator.Destroy;
  inherited Destroy;
end;

procedure TExprItemLayoutImp.reset;
begin
  Evaluator.Reset;
end;

procedure TExprItemLayoutImp.SetExpression(const Value: String);
begin
  FExpression          := Value;        
end;

function TExprItemLayoutImp.Value: TQREvResult;
begin
  Evaluator.Environment.Prepare;
  Result := Evaluator.Calculate(StringstoStr(Fexpression));
  FKind  := Result.Kind;
end;

{ TExprsItemLayoutImp }

function TExprsItemLayoutImp.AchaDescricao(Value: String): TExprItemLayoutImp;
var i:integer;
begin
   result := Nil;
   for i:=0 to count - 1 do
     If UpperCase(Items[i].descricao) = UpperCase(Value) then begin
       Result := Items[i];
       Exit;
     end;

end;

constructor TExprsItemLayoutImp.Create(ItemLayoutImp: TItemLayoutImp);
begin
  inherited Create(TExprItemLayoutImp);
  Self.FItemLayoutImp := ItemLayoutImp;
end;

function TExprsItemLayoutImp.GetItems(Index: Integer): TExprItemLayoutImp;
begin
  Result := TExprItemLayoutImp(inherited GetItem(Index));
end;

function TExprsItemLayoutImp.GetOwner: TPersistent;
begin
   Result :=  Self.FItemLayoutImp;
end;

procedure TExprsItemLayoutImp.SetItems(Index: Integer;
  const Value: TExprItemLayoutImp);
begin
  inherited SetItem(Index, Value);
end;

end.

