unit ObjSelecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,FuncoesGlobais,Grids,GridSql,gridControl,
  Mask,StdCtrls,ExtCtrls,ComCtrls,EditControle,MaskEdit,ComboSql,CheckControle,Db,DbtAbles,PanelControle,QrExpr,TipoDef;
type

   TTipoSql = (Select,Insert,Update,Delete);

   TITEMCADSELECAO = Class(TCollectionItem)
   Private
     FValor,FMascara:String;
     FNotNull: Boolean;
     FCampo: String;
     FMascaraF: String;
     FTitulo: String;
     FVlInicial: String;
     FTipo: TFieldType;
     FValores: TStringList;
     FPesquisa: String;
     FPesquisaTab: String;
     FAjuda: TStringList;
     FSqlPesquisa: TStringList;
     FObrigatorio: Boolean;
     FTamanho:Word;
     FLookTabela: String;
     FLookCodigo: String;
     FLookDescricao: String;
     FCheck: Boolean;
     FValueCheck: String;
     FValueUnCheck: String;
     FLargura: Integer;
     FGuia: String;
     FColuna: Integer;
     FTabelaDetal: String;
     FVerifDupl: Boolean;
     FNotVisible: Boolean;
     FTotal: String;
     function GetMascara: String;
     function GetValue: String;
     procedure SetMascara(const Value: String);
     procedure SetValue(const Value: String);
     procedure SetValores(const Value: TStringList);
     procedure SetAjuda(const Value: TStringList);
     procedure SetSqlPesquisa(const Value: TStringList);
     Procedure ExitObjeto(Sender:Tobject);
     Procedure KeyDownObjeto(Sender: TObject; var Key: Word;Shift: TShiftState);
     Procedure ChangeObjeto(Sender:Tobject);
    function verificaexcecao: Boolean;
    { Private declarations }
   Public
     NomeParametro:String;
     Objeto,Objeto2:TWinControl;
     FGridCs:TGridSql;
     ColunaCs:LongInt;
     LinhaCs:LongInt;
     CamposAjuda:TStringList;
     constructor Create(Collection:TCollection);Override;            
     Destructor  Destroy ;Override;
     Function    SqlGravar(Altera: Boolean;Var Query:TQuery;Linha1,Linha2:Integer):String;
     Function    SqlSelect(Var Query:TQuery;Linha:Integer):String;
     Function    CriaObjeto(FParent:TWinControl):TWinControl;
    { Public declarations }
   Published
     Property Valor          :String   Read GetValue Write SetValue;
     Property Mascara        :String   Read GetMascara Write SetMascara;
     Property Campo          :String   Read FCampo Write FCampo;
     Property Titulo         :String   Read FTitulo Write FTitulo;
     Property NotNull        :Boolean  Read FNotNull Write FNotNull Default True;
     Property Obrigatorio    :Boolean  Read FObrigatorio Write FObrigatorio;
     Property Tipo           :TFieldType  Read FTipo Write FTipo;
     Property VlInicial      :String   Read FVlInicial Write FVlInicial;
     Property MascaraF       :String   Read FMascaraF Write FMascaraF;
     Property Tamanho        :Word     Read FTamanho Write FTamanho;
     Property Valores        :TStringList Read FValores Write SetValores;
     Property Ajuda          :TStringList Read FAjuda Write SetAjuda;
     Property Pesquisa       :String Read FPesquisa Write FPesquisa;
     Property PesquisaSql    :TStringList Read FSqlPesquisa Write SetSqlPesquisa;
     Property PesquisaTab    :String Read FPesquisaTab Write FPesquisaTab;
     Property LookTabela     :String   Read FLookTabela Write FLookTabela;
     Property LookCodigo     :String   Read FLookCodigo Write FLookCodigo;
     Property LookDescricao  :String   Read FLookDescricao Write FLookDescricao;
     Property Check          :Boolean  Read FCheck Write FCheck;
     Property ValueCheck     :String   Read FValueCheck Write FValueCheck;
     Property ValueUnCheck     :String   Read FValueUnCheck Write FValueUnCheck;
     Property Guia     :String   Read FGuia Write FGuia;
     Property Largura     :Integer   Read FLargura Write FLargura;
     Property Coluna          :Integer   Read FColuna Write FColuna;
     Property TabelaDetal     :String   Read FTabelaDetal Write FTabelaDetal;
     Property VerifDupl          :Boolean  Read FVerifDupl Write FVerifDupl;
     Property NotVisible          :Boolean  Read FNotVisible Write FNotVisible;
     Property Total     :String   Read FTotal Write FTotal;
    { Published declarations }
   end;

   TTabDetal = Class(TCollectionItem)
   private
    FSql: String;
    ftabela: String;
    FSqlIns: String;
   public
     PnTotal:TPanel;
     LDpl:LongInt;
     QryEof:TQuery;
     Fgrid:TGridSql;
     SqlRec:String;
     QryRecupera:TQuery;
     QryExclui:TQuery;
     QryInsert:TQuery;
     Recuperando:Boolean;
     veiopesquisa:boolean;
     constructor Create(Collection:TCollection);Override;
     destructor  Destroy;Override;
     Procedure   Recupera;
     Procedure   Exclui;
     Procedure   Insert;
     procedure   FGridAlign(Sender:TObject;ARow,ACol:LongInt;var HorAlignment:TAlignment;var VerAlignment:TVerticalAlignment);
     Procedure   FGridEditMask(Sender: TObject; ACol,ARow: Integer; var Value: String);
     Procedure   FGridMontaGridDataSet(var DadosGrid: TDadosgrid; var DeletaLinha: Boolean);
     Procedure   FGridKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
     Procedure   FGridSelectCell(Sender: TObject; ACol,ARow: Integer; var CanSelect: Boolean);
     Procedure   FGridMovimentaCelula(Sender: TObject);
     Procedure   TotalGrid;
   published
     Property Tabela :String read ftabela write ftabela;
     Property Sql    :String read FSql write FSql;
     Property SqlIns :String read FSqlIns write FSqlIns;
   end;


  TCADSELECAO = Class;

  TTabDetals = Class(TCollection)
    Private
     FCadSelecao : TCadSelecao;
     function GetItems(Index: Integer): TTabDetal;
     procedure SetItems(Index: Integer; const Value: TTabDetal);
    { Private declarations }
    Public
     Constructor Create(CadSelecao:TCadSelecao);
     function    GetOwner: TPersistent; override;
     function    FindName(FName:String):TTabDetal;
     Procedure   Recupera;
     Procedure   Exclui;
     Procedure   Insert;
     Property    Items[Index:Integer] : TTabDetal read GetItems write SetItems ;Default;
    { Public declarations }
  end;

  TITEMSCADSELECAO = Class(TCollection)
    Private
     FCadSelecao : TCadSelecao;
     function GetItems(Index: Integer): TItemCadSelecao;
     procedure SetItems(Index: Integer; const Value: TItemCadSelecao);
    { Private declarations }
    Public
     Constructor Create(CadSelecao:TCadSelecao);
     function    GetOwner: TPersistent; override;
     function    FindItem(VNome:String):TItemCadSelecao;
     Property    Items[Index:Integer] : TItemCadSelecao read GetItems write SetItems ;Default;
    { Public declarations }
  end;

  TCADSELECAO = class(TComponent)
  private
    FTabela: String;
    FItemsCadSelecao: TItemsCadSelecao;
    FPanel: TWinControl;
    FIdentif: String;
    FColIni: Integer;
    FTabDetals: TTabDetals;
    Procedure RefreshPesquisa;
    procedure SetItemsCadSelecao(const Value: TItemsCadSelecao);
    procedure SetTabDetals(const Value: TTabDetals);
   { Private declarations }
  public
    LinhaGrid:LongInt;
    QueryExc:TQuery;
    Constructor Create(AOwner: TComponent);Override;
    Destructor  Destroy ;Override;
    Procedure   RefreshCadSelecao;
    procedure   CriaComponentes;
    Procedure   SqlComponentes(FQuery:TQuery;VTipo: TTipoSql;var F1,F2:String);
    Procedure   AlteraDataSet(VTipo:TTipoSql;Query:TQuery);
    Function    ValueParametros(FQuery: TQuery;FTabela:String=''):Boolean;
    Procedure   ValueComponentes(FQuery:TQuery);
    { Public declarations }
  published
    Property Items :TItemsCadSelecao Read FItemsCadSelecao Write SetItemsCadSelecao;
    Property TabDetals :TTabDetals Read FTabDetals Write SetTabDetals;
    Property Tabela:String Read FTabela Write FTabela;
    Property Identif:String Read FIdentif Write FIdentif;
    Property Panel:TWinControl Read FPanel Write FPanel;
    Property ColIni:Integer Read FColIni Write FColIni;
    { Published declarations }
  end;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('Entidades', [TCADSELECAO]);
end;

{ TCADSELECAO }

procedure TCADSELECAO.AlteraDataSet(VTipo: TTipoSql;Query: TQuery);
var
F1,f2,F3:String;
I,I2,i3:Integer;
QtdParentes:Word;
FBreak,TemValues,Aspas:Boolean;
OldPalavra,Palavra:String;
PalavraChave:TStringList;
begin

  Aspas        := False;
  SqlComponentes(Query,VTipo,F1,f2);

  If F1 = '' Then
   exit;

  PalavraChave := TStringList.Create;

  Try
      If VTipo = Select Then
        PalavraChave.Add('FROM')
      else if VTipo = Update Then
        PalavraChave.Add('WHERE')
      else if VTipo = Insert Then begin
        PalavraChave.Add(')');
        PalavraChave.Add('FROM');
      end;


      For i:=0 to Query.Sql.Count - 1 do begin
       OldPalavra := Palavra;
       Palavra    := '';
       I2         := 1;
       While i2 <= Length(Query.Sql[i]) + 1 do begin
          If (Copy(Query.Sql[i],I2,1) = ' ') or (I2 = Length(Query.Sql[i]) + 1)  Then begin
            TemValues  := TemValues or ((UpperCase(Palavra) = 'VALUES') and Not Aspas);
            OldPalavra := Palavra;
            Palavra    := '';
          end;

          If (I2 <= Length(Query.Sql[i])) and (Copy(Query.Sql[i],I2,1) <> ' ') Then
            Palavra := Palavra + Copy(Query.Sql[i],I2,1);

          TemValues  := TemValues or (((UpperCase(Palavra) = ')VALUES') or (UpperCase(Palavra) = 'VALUES(')) and Not Aspas);

          if Not Aspas
             and (((QtdParentes = 0) and (PalavraChave.IndexOf(OldPalavra) > -1))
                  Or
                  ((VTipo = Insert) and (QtdParentes = 1) and (Copy(Query.Sql[i],I2,1) = ')') and
                  ((i2 = 1) or (Copy(Query.Sql[i],I2 - 1,1) <> ' ')) and
                  ((i2 = Length(Query.Sql[i])) or (Copy(Query.Sql[i],I2 + 1,1) <> ' ')) and
                  ( TemValues or (f1 <> f2)))) Then begin
                       If (VTipo = Insert) and (QtdParentes = 1) and (Copy(Query.Sql[i],I2,1) = ')') and (TemValues or (f1 <> f2)) and
                          ((i2 = 1) or (Copy(Query.Sql[i],I2 - 1,1) <> ' ')) and
                          ((i2 = Length(Query.Sql[i])) or (Copy(Query.Sql[i],I2 + 1,1) <> ' ')) Then
                           i3 := 0
                       else
                           i3 := Length(PalavraChave[PalavraChave.IndexOf(OldPalavra)]);


                       FBreak := I2 >= Length(Query.Sql[i]);

                       F3 := Query.Sql[i];
                       System.Insert(' '+F1+ ' ',F3,i2 - i3);
                       Query.Sql[i] := F3;


                       I2 := I2 + Length(F1) + 2;
                       If VTipo = Insert then
                        f1 := f2;
                       OldPalavra := '';

                       If FBreak then begin
                          If I3 = 0 Then BEGIN
                             QtdParentes := 0;
                             Palavra     := '';
                          end;
                          Break;
                       end;
          end else
               inc(I2);

          If Copy(Query.Sql[i],I2 - 1,1) = '''' Then
            Aspas := Not Aspas
          else If Not Aspas and (Copy(Query.Sql[i],I2 - 1,1)  = '(') Then
            Inc(QtdParentes)
          else If Not Aspas and ((Copy(Query.Sql[i],I2 - 1,1) = ')') and (QtdParentes > 0)) Then
            Dec(QtdParentes);
        end;
      end;

  finally
      PalavraChave.Destroy;
  end;










end;

constructor TCADSELECAO.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  FItemsCadSelecao := TItemsCadSelecao.Create(Self);
  FTabDetals := TTabDetals.Create(Self);
  QueryExc   := TQuery.Create(nIL);
  QueryExc.DataBaseName := 'BD';
end;

procedure TCADSELECAO.CriaComponentes;
var
FParent :TWinControl;
I,I2,i3:Integer;
FHeigth:Integer;
begin
  i2 := 0;
  If (FPanel is TStringGrid) then begin
   With TGridSql(FPanel) do
    for i:=0 to Items.Count - 1 do begin
      Items[i].Objeto := FPanel;
      If TituloHorizontal.IndexOf(Items[i].Titulo) > -1 then
        TituloHorizontal.Move(TituloHorizontal.IndexOf(Items[i].Titulo),FColIni  + IIfs(items[i].Coluna = 0,I2,items[i].Coluna))
      else
        TituloHorizontal.Insert(FColIni  + IIfs(items[i].Coluna = 0,I2,items[i].Coluna),Items[i].Titulo);
                      
      If Campos.IndexOf(Items[i].Campo) > -1 then
         Campos.Move(Campos.IndexOf(Items[i].Campo),FColIni  + IIfs(items[i].Coluna = 0,I2,items[i].Coluna))
      else begin
         ColCount := ColCount + 1;
         Campos.Insert(FColIni  + IIfs(items[i].Coluna = 0,I2,items[i].Coluna),Items[i].Campo);
      end;
      If Items[i].NotVisible Then begin
        ColWidths[Campos.IndexOf(Items[i].Campo)] := -1;
        CellSkip[Campos.IndexOf(Items[i].Campo)] := True;
      end else
        ColWidths[Campos.IndexOf(Items[i].Campo)] := DefaultColWidth;
      If items[i].Coluna = 0 Then
       i2 :=  i2 + 1;                  
     end;
     exit;
  end;
  
  FPArent := FPanel;
  for i:=0 to Items.Count - 1 do begin
    If (FPanel is TPageControl) Then
       If(I = 0) or
         ((Items[i].Guia <> '') and (TForm(FPanel.Owner).FindComponent('Tb'+Items[i].Guia+'00') = Nil))  then begin
           FParent := TTabSheet.Create(FPanel.Owner);
           With TTabSheet(Fparent) do begin
              Name         := IIfs(Items[i].Guia <> '','Tb'+Items[i].Guia+'00','TbOutrosDados00');
              PageControl  := TPageControl(Fpanel);
              Caption      := IIfs(Items[i].Guia <> '',Items[i].Guia,'Outros Dados');
           end;
      end else begin
          FParent := TTabSheet(TForm(FPanel.Owner).FindComponent(IIfs(Items[i].Guia <> '','Tb'+Items[i].Guia+'00','TbOutrosDados00')));
          I2      := 1;
          While TForm(FPanel.Owner).FindComponent('Tb'+IIfs(Items[i].Guia <> '',Items[i].Guia,'OutrosDados')+FormatFloat('00',I2)) <> Nil do begin
            FParent := TTabSheet(TForm(FPanel.Owner).FindComponent('Tb'+IIfs(Items[i].Guia <> '',Items[i].Guia,'OutrosDados')+FormatFloat('00',I2)));
            Inc(I2);
          end;
      end;


    Items[i].CriaObjeto(FParent);

    If (FPanel is TPageControl) and
       (Items[I].Objeto <> Nil) and
       (Items[I].Objeto.Top + Items[I].Objeto.Height > FParent.Height)  Then begin
         FParent := TTabSheet.Create(FPanel.Owner);
         With TTabSheet(Fparent) do begin
            I2     := 0;
            While TForm(FPanel.Owner).FindComponent('Tb'+IIfs(Items[i].Guia <> '',Items[i].Guia,'OutrosDados')+FormatFloat('00',I2 + 1)) <> Nil do
              Inc(I2);
            PageControl  := TPageControl(Fpanel);
            Name         := 'Tb'+IIfs(Items[i].Guia <> '',Items[i].Guia,'OutrosDados')+FormatFloat('00',I2 + 1);
            Caption      := IIfs(Items[i].Guia <> '',Items[i].Guia,'Outros Dados');            
         end;

        If Not(Items[i].Objeto is TCheckBox) then
          With TWinControl(FPanel.Owner.Components[Items[i].Objeto.ComponentIndex - 1]) do begin
           Parent := FParent;
           Top := 1;
          end;


         With Items[i].Objeto do begin
           Parent := FParent;
           Top    := IIfs(Items[i].Objeto is TCheckBox,1,TWincontrol(FPanel.Owner.Components[Items[i].Objeto.ComponentIndex - 1]).Top +
                                                         TWinControl(FPanel.Owner.Components[Items[i].Objeto.ComponentIndex - 1]).Height + 1);
         end;  

         If Items[i].Objeto2 <> Nil Then 
           With Items[i].Objeto do begin
             Parent := FParent;
             Top    := Items[i].Objeto.Top;  
           end;
    end;

  end;
end;

destructor TCADSELECAO.Destroy;
begin
  QueryExc.Destroy;
  FItemsCadSelecao.Destroy;
  FTabDetals.Destroy;
  inherited Destroy;
end;


procedure TCADSELECAO.RefreshCadSelecao;
var VQuery,FQuery,FQuery2:TQuery;
begin



   FQuery2 := TQuery.Create(Application);
   With FQuery2 do begin
        DataBaseNAme := 'BD';
        Sql.Add('Select Tabela,Sql,paramsinsert from TABDETALSELECAO Where Upper(Selecao) = '''+UpperCase(FTabela)+'''');
        sql.add('and Upper(Identificador) = '''+UpperCase(FIdentif)+'''');
        Open;
   end;

   FQuery := TQuery.Create(Application);
   FQuery.DataBaseName := 'BD';
   With TQuery.Create(Application) do
    Try
      DataBaseNAme := 'BD';
      Sql.Add('Select * from SELECAO Where Upper(Local) = '''+UpperCase(FTabela)+'''');
      sql.add('and Upper(LocalIdentif) = '''+UpperCase(FIdentif)+'''');
      sql.add('Order By Posicao,Campo');
      Open;

      If Eof Then
        exit;

      FQuery.Sql.Add('Select * From '+FTabela+' Where ''a'' = ''b''');
      Fquery.Open;

      While Not Eof do begin
        VQuery := FQuery;
        If FieldByName('TabelaDetal').AsString <> '' Then begin
           FQuery2.Locate('Tabela',FieldByName('TabelaDetal').AsString,[]);
           If TabDetals.FindName(FieldByName('TabelaDetal').AsString) = nil then
             With TTabDetal(TabDetals.Add) do begin
                Tabela := FieldByName('TabelaDetal').AsString;
                Sql    := FQuery2.FieldbyName('Sql').AsString;
                SqlIns := FQuery2.FieldbyName('ParamsInsert').AsString;
                Qryeof.Sql.Text := 'Select * from '+FieldByName('TabelaDetal').AsString+' Where ''a'' = ''b''';
             end;
           vquery := TabDetals.FindName(FieldByName('TabelaDetal').AsString).QryEof;
           if not vquery.active then
            vquery.open; 
        end;


        If VQuery.FindField(FieldByName('Campo').AsString) = Nil Then begin
          Next;
          Continue;
        end;

        With TItemCadSelecao(Items.Add) do begin
           Tipo     := VQuery.FieldByName(FieldByName('Campo').AsString).DataType;
           Tamanho  := VQuery.FieldByName(FieldByName('Campo').AsString).Size;
           Campo    := FieldByName('Campo').AsString;
           Coluna    := FieldByName('Coluna').AsInteger;
           Titulo   := FieldByName('Descricao').AsString;
           Mascara  := FieldByName('Mascara').AsString;
           MascaraF := FieldByName('MascaraF').AsString;
           NotNull  := FieldByName('NotNull').AsBoolean;
           Obrigatorio  := FieldByName('Obrigatorio').AsBoolean;
           Valores.Text     := FieldByName('VAlores').AsString;
           VlInicial := FieldByName('VlInicial').AsString;
           LookTabela    := FieldByName('LookTabela').AsString;
           LookDescricao := FieldByName('LookDescricao').AsString;
           LookCodigo    := FieldByName('LookCodigo').AsString;
           Check         := FieldByName('FCheck').AsBoolean;
           ValueCheck    := FieldByName('ValueCheck').AsString;
           ValueUnCheck  := FieldByName('ValueUnCheck').AsString;
           Largura       := FieldByName('Tamanho').AsiNTEGER;
           Guia          := FieldByName('Titulo').AsString;
           TabelaDetal   := FieldByName('TabelaDetal').AsString;
           Total   := FieldByName('Total').AsString;
           VerifDupl     := FieldByName('VerifDupl').AsBoolean;
           NotVisible    := FieldByName('NotVisible').AsBoolean;
           Ajuda.Text       := iiFS((FieldByName('SqlAjuda').AsString = '') And
                                    (FieldByName('Tabela').AsString <> ''),
                                    'SELECT DESCRICAO FROM CADSELECAO1 '+
                                    ' WHERE TABELA = '''+FieldByNAme('Tabela').AsString+''''+
                                    ' AND   CODIGO = :'+FieldByName('Campo').AsString,
                                     FieldByName('SqlAjuda').AsString);


           Pesquisa    := iifs((FieldByName('Pesquisa').AsString = '') And
                               (FieldByName('Tabela').AsString <> ''),
                               'PESQUISA',
                                FieldByName('Pesquisa').AsString
                               );

           PesquisaTab := IIFS((FieldByName('Pesquisa').AsString = '') And
                               (FieldByName('Tabela').AsString <> ''),
                               'CADSELECAO1',
                               FieldByName('PesquisaTabela').AsString);

           PesquisaSql.Text := iifs((FieldByName('Pesquisa').AsString = '') And
                                    (FieldByName('Tabela').AsString <> ''),
                                    'TABELA = '''+FieldByName('Tabela').AsString+'''',
                                     FieldByName('SqlPesquisa').AsString);

           If TabelaDetal <> '' Then NomeParametro := 'CadSelecao'+Campo;                          

           if FieldByName('TabelaDetal').AsString <> '' Then
            Vquery.close;
        end;
        Next;
      end;

      With QueryExc do begin
        Sql.Clear;
        Sql.Add('Select * from excecaosel Where Upper(TABELASEL) = '''+UpperCase(FTabela)+'''');
        sql.add('and Upper(TABELAIDENTIFSEL) = '''+UpperCase(FIdentif)+'''');
        Open;
      end;
      
    Finally
       Destroy;
       FQuery.Destroy;
    end;
end;

procedure TCADSELECAO.RefreshPesquisa;
begin
end;

procedure TCADSELECAO.SetItemsCadSelecao(const Value: TItemsCadSelecao);
begin
  FItemsCadSelecao.Assign(Value);
end;

procedure TCADSELECAO.SetTabDetals(const Value: TTabDetals);
begin
  FTabDetals.Assign(Value);
end;

procedure TCADSELECAO.SqlComponentes(FQuery:TQuery;VTipo: TTipoSql;var F1,F2:String);
Var I,i2:Integer;
    Virgula:Boolean;
begin
    If VTipo <> Select Then
       Virgula :=  FQuery.ParamCount = 0
    else begin
      With ListIndexField(FQuery.Sql) do begin
        Virgula := Count = 0;
        Destroy;
      end;
    end;

    For i:=0 to Items.Count - 1  do
     If Items[i].TabelaDetal = '' Then
      With Items[i] do begin
          If (Vtipo = Insert) and
             (Valor = '') and
              Not NotNull then begin
                NomeParametro := '';
                continue;
              end;

          If (VTipo in [Insert,Update]) then begin
            I2 := 1;
            NomeParametro := 'CadSelecao'+Campo+IntToStr(I2);
            While FQuery.Params.FindParam(NomeParametro) <> Nil do begin
              Inc(I2);
              NomeParametro := 'CadSelecao'+Campo+IntToStr(I2);
            end;
          end;


          F1 := F1 +(IIfs(Virgula and (I = 0),'',',') + Campo + IIfs(VTipo = Update,' = :'+NomeParametro,''));

          If (VTipo = Insert) Then
            F2 := F2 +IIfs(Virgula and (I = 0),'(:',',(:')+NomeParametro+')';
      end;
end;


procedure TCADSELECAO.ValueComponentes(FQuery: TQuery);
var I:Integer;
OldActivePage:TTabSheet;
begin

   If FQuery.Eof Then Begin
      for i:=0 to TabDetals.Count - 1 do
       If (Tabdetals[i].Fgrid <> Nil) and (Tabdetals[i].Fgrid.Parent is TTabSheet) Then begin
         oldactivepage := TPageControl(Tabdetals[i].FGrid.Parent.Parent).ActivePage;
         TPageControl(Tabdetals[i].FGrid.Parent.Parent).ActivePage := TTabSheet(Tabdetals[i].Fgrid.Parent);
         Tabdetals[i].Fgrid.TituloHorizontal.refresh(0);
         TPageControl(Tabdetals[i].FGrid.Parent.Parent).ActivePage := oldactivepage;
         TabDetals[i].TotalGrid;
       end;
      Exit;
   end;  

   For i:=0 to Items.Count - 1  do
    With Items[i] do
     If (Items[i].TabelaDetal = '') and (FQuery.Fields.FindField(Campo) <> Nil) and Not FQuery.FieldByName(Campo).IsNull and (Objeto <> Nil) Then BEGIN
        If Not(Objeto is TGridSql) then begin 
          SetValueObject(Objeto,FQuery.FieldByName(Campo).AsString);
          ExitObjeto(Objeto);
        end else
          TGridSql(Objeto).FieldValue[Self.Items[i].Campo,LinhaGrid] := FQuery.FieldByName(Campo).AsString; 
     END;   
     TabDetals.Recupera;
end;

Function TCadSelecao.ValueParametros(FQuery: TQuery;FTabela:String=''):Boolean;
var I:Integer;
begin
    Result := True; 
    For i:=0 to Items.Count - 1  do
      With Items[i] do begin
         Result := (FTabela <> TabelaDetal) Or Not Obrigatorio or (Valor <> '');
         If Not Result Then
          exit;          
         If (FTabela = TabelaDetal) and (NomeParametro <> '') and (FQuery.Params.FindParam(NomeParametro) <> Nil) Then
          If Not(Not NotNull and (Valor = ''))  Then Begin
              If FTipo in [FtDate,FtTime,FtDateTime] Then
                FQuery.paramByName(NomeParametro).AsDateTime := StrtoDateN(Valor)
              else If FTipo in [FtFloat,FtInteger,FtWord,FtCurrency,FtBcd] Then
                FQuery.paramByName(NomeParametro).AsFloat    := StrtoFloatN(Valor)
              else
                FQuery.paramByName(NomeParametro).AsString   := Valor;
          end else begin
              FQuery.paramByName(NomeParametro).DataType := Tipo;
              FQuery.paramByName(NomeParametro).Clear;          
          end;
      end;
      If Result and (FTabela = '') Then
       TabDetals.Insert;
end;



{ TITEMCADSELECAO }

constructor TITEMCADSELECAO.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FAjuda       := TStringList.Create;
  FValores     := TStringList.Create;
  FSqlPesquisa := TStringList.Create;
  CamposAjuda := TStringList.Create;
end;

function TITEMCADSELECAO.CriaObjeto(FParent: TWinControl):TWinControl;
var
OldFont:TFont;
FQuery:TQuery;
i,i2:integer;
begin

 If FTabeladetal <> '' Then begin
     FGridCs := TGridSql(FParent.Owner.FindComponent('GridCS'+FTabelaDetal));
     If FGridCs = Nil Then begin
       FGridCs := TGridSql.Create(FParent.Owner);
       FGridCs.ScrollBars := ssVertical;
       If (Collection is TItemsCadSelecao) and (TItemsCadSelecao(Collection).GetOwner is TCadSelecao) and
          (TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal) <> nil) Then
            TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal).FGrid := FgridCs;

       If (Collection <> nil) and (TItemsCadSelecao(Collection).GetOwner is TCadSelecao) Then
        With TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals do
         if (FindName(Ftabeladetal) <> Nil) and (FindName(Ftabeladetal).Fgrid <> Nil) Then Begin
           FindName(FtabelaDetal).FGrid := FgridCs;
           FGridCs.OnKeydown := FindName(FtabelaDetal).FGridKeyDown;
           FGridCs.OnMontaGridDataSet := FindName(FtabelaDetal).FGridMontaGridDataSet;
           FGridCs.OnGetEditMask := FindName(FtabelaDetal).FGridEditMask;
           FGridCs.OnGetCellAlignment := FindName(FtabelaDetal).FGridAlign;
           FGridCs.OnSelectCell       := FindName(FtabelaDetal).FGridSelectCell;
           FGridCs.OnMovimentaCelula  := FindName(FtabelaDetal).FGridMovimentaCelula;
         end;

       With FGridCs do begin
        Align           := AlClient;
        Parent          := FParent;
        name            := 'GridCS'+FTabelaDetal;
        incluilinha     := True;
        CtrlDelete      := True;
        movimentacelula := true;
        options         := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goColSizing,goEditing];
        f3editor        := true;
        MovMouseLinha   := true;
        TituloHorizontal.Automatico := true;
        SaiEmBranco     := True;
        tag             := 3;
        ColCount        := 1;
        font.Style      := [];
      end;
     end;

     Objeto  := FGridCs;
     With FGridCs do begin
      campos.add(FCampo);
      ColunaCs := Campos.Count - 1;
      titulohorizontal.add(FTitulo);
      ColCount := campos.Count;
      If Not FNotVisible then
        Limite   := ColCount - 1
      else
        ColWidths[ColCount - 1] := -1;
      If Ajuda.Text <> '' Then
        With ListIndexField(Ajuda) do
         Try
           For i:=0 to Count - 1 do begin
              for i2:=0 to TCadSelecao(TItemsCadSelecao(Collection).GetOwner).Items.count - 1 do
               If UpperCase(TCadSelecao(TItemsCadSelecao(Collection).GetOwner).Items[i].Campo) =
                  UpperCase(Strings[i]) then
                    break;

               if I2 = TCadSelecao(TItemsCadSelecao(Collection).GetOwner).Items.count Then begin
                 CamposAjuda.Add(FCampo+'_'+Strings[i]);
                 Campos.Add(FCampo+'_'+Strings[i]);
                 TituloHorizontal.Add(Strings[i]);
                 ColCount := Campos.Count;
                 cellskip[ColCount - 1] := True;
               end;
           end;
         finally
           Destroy;
         end;
      titulohorizontal.Refresh(0);

      If Total <> '' then begin
        If TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal).PnTotal = nil Then begin
         TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal).PnTotal := TPanel.Create(FParent.Owner);
         With TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal).PnTotal do begin
            Align           := alBottom;
            AutoSize        := True;
            Parent          := FParent;
            name            := 'PnTot'+FGridCs.Name;
            tag             := 3;
         end;
        end;

        With SeparaString(Total) do
         try
          For i:=0 to Count - 1 do
           with TLabel.Create(FParent.Owner) do begin
            Parent          := TCadSelecao(TItemsCadSelecao(Collection).GetOwner).TabDetals.FindName(FTabelaDetal).PNtOTAL;
            Name            := 'LbTot'+FGridCs.name+IIfs(UpperCase(Self.Campo) = UpperCase(Strings[i]),'',Self.Campo+'_')+Strings[i];
            Alignment       := taRightJustify;
            Caption         := Strings[i];
            ParentFont      := True;
            Font.Style      := [fsbold];
            AutoSize        := False;
            Align           := alBottom;
            tag             := 3;
           end;
         finally
          destroy;
         end;
      end;
      exit;
   end;   
 end;

 If Not FCheck Then
   With TLabel.Create(FParent.Owner) do begin
     Caption := FTitulo;
     Left  := 1;
     Font.Style := [fsBold];
     If fParent.ControlCount = 0 then
       Top   := 1
     else
       Top   := FParent.Controls[FParent.ControlCount - 1].Top +
                FParent.Controls[FParent.ControlCount - 1].Height +
                3;
     Parent  := FParent;
   end;

   If FMascara <> '' Then begin
     Objeto := TMaskEditControle.Create(FParent.Owner);
     With TMaskEditControle(Objeto) do begin
        EditMask     := FMascara;
        valueini     := FvlInicial;
        DescCampo    := FCampo;
        Obrigatorio  := FObrigatorio;
        VerificaData := FTipo in [FtDate,FtDateTime];
        VerificaHora := (FTipo in [FtDate,FtDateTime,FtTime]) and
                        (Pos('99:',EditMask) > 0);
        Enter        := True;
     end;
   end else If (Valores.Text <> '') or (LookTabela <> '')  Then begin
     Objeto := TComboSql.Create(FParent.Owner);
     With TComboSql(Objeto) do begin
        Parent      := FParent;
        Style       := csDropDownList;
        DescCampo   := FCampo;
        Obrigatorio := FObrigatorio;
        Enter       := True;
        If LookTabela <> '' Then begin
           BancodeDados := 'BD';
           CampoiTENS   := LookDescricao;
           CampoRetorno := LookCodigo;
           Tabela       := LookTabela;
           Retorno      := RcValorRetorno;
           CAse Self.FTipo of
              FtInteger,FtWord,FtSmallInt:TipoCampo := VarInteger;
              FtCurrency,FtFloat,FtBcd:TipoCampo := VarDouble;
           end;

        end else Begin
           Items.Clear;
           Items.Text   := Self.Valores.Text;
           ItemIndexIni := Items.Indexof(FVlInicial);
        end;

     end;
   end else If FCheck Then begin
     Objeto := TCheckControle.Create(FParent.Owner);
     With TCheckControle(Objeto) do begin
          ValorChecado :=   IIfs(Self.ValueCheck <> '',Self.ValueCheck
                              ,IIFs(Self.Tipo in [FtCurrency,FtFloat,FtBcd,FtInteger,FtWord,FtSmallInt],'1','T'));
          ValorNaoChecado := IIfs(Self.ValueUnCheck <> '',Self.ValueUnCheck
                               ,IIFs(Self.Tipo in [FtCurrency,FtFloat,FtBcd,FtInteger,FtWord,FtSmallInt],'0','F'));
          CheckIni     := ValorChecado = Self.VlInicial;
          Caption      := FTitulo;
          CAse Self.FTipo of
              FtInteger,FtWord,FtSmallInt:TipoValor := VarInteger;
              FtCurrency,FtFloat,FtBcd:TipoValor := VarDouble;
          end;
          DescCampo   := FCampo;
          Enter       := True;
     end;
   end else begin
     Objeto := TEditControle.Create(FParent.Owner);
     With TEditControle(Objeto) do begin
        ValueIni     := FvlInicial;
        DescCampo    := FCampo;
        Obrigatorio  := FObrigatorio;
        GeraPesquisa := FAjuda.Text <> '';
        Mascara      := FmascaraF;
        Enter        := True;
        MaxLength    := Tamanho;
        CAse Self.FTipo of
          FtInteger,FtWord,FtSmallInt:Tipo := TpNumero;
          FtCurrency,FtFloat,FtBcd:begin
                                     Alignment := taRightJustify;
                                     Tipo      := TpDecimal;
                                   end;
        end;

     end;
   end;

   With TEdit(Objeto) do begin
      Parent      := FPArent;
      Tag         := IIfs(Obrigatorio,1,3);

      If Not(Objeto is TCheckBox) Then
        Font.Style := []
      else
        Font.Style := [FsBold];

      OldFont                          := TForm(Fparent.Owner).Canvas.Font;
      TForm(Fparent.Owner).Canvas.Font := Font;
      Width     :=  IIfs(Objeto is TCheckBox,TForm(Fparent.Owner).Canvas.TextWidth(TCheckBox(Objeto).Caption+'WW'),
                    IIfs((Objeto is TMaskEdit) and (TMaskEdit(Objeto).EditmAsk <> ''),TForm(Fparent.Owner).Canvas.TextWidth(TCheckBox(Objeto).Caption+'W'),
                    IIfs(FLargura = 0,FParent.Width div 3,TForm(Fparent.Owner).Canvas.TextWidth(StringOfCHar('W',Flargura + 2)))));
      TForm(Fparent.Owner).Canvas.Font := OldFont;

     If fParent.ControlCount > 1 then
       Top       := TWinControl(TForm(Owner).Components[ComponentIndex - 1]).Top + TWinControl(TForm(Owner).Components[ComponentIndex - 1]).Height + 1
     else
       Top       := 1;

      Left      := 1;
      OnExit    := ExitObjeto;
      If Not(Objeto is TCheckBox) Then OnChange   := ChangeObjeto;
      OnKeyDown := KeyDownObjeto;
   end;

   If (FAjuda.Text <> '') ANd (Objeto is TEdit) Then begin
        Objeto2       := TPAnelControle.create(FParent.Owner);
        Objeto2.Parent:= Objeto.Parent;
        Objeto2.Top   := Objeto.Top;
        Objeto2.Left  := Objeto.Width + Objeto.Left + 1;
        Objeto2.Width := Objeto.Parent.Width - Objeto.Width - Objeto.Left - 2;
        Objeto2.Tag   := 3;
        TPAnelControle(Objeto2).Font.Style := [FsBold];
   end;
end;

destructor TITEMCADSELECAO.Destroy;
begin

  FAjuda.Destroy;
  FSqlPesquisa.Destroy;
  FValores.Destroy;
  CamposAjuda.Destroy;
  inherited Destroy;
end;


function TITEMCADSELECAO.GetMascara: String;
begin
   Result := FMascara;
end;

function TITEMCADSELECAO.GetValue: String;
var VLinha,VCol:LongInt;
begin
  VLinha := 0;
  Vcol   := 0;

  If (Objeto is TStringGrid) then begin
    VCol   := TGridSql(Objeto).campos.IndexOf(Campo);
    VLinha := TCAdSelecao(TItemsCadSelecao(Collection).GetOwner).linhagrid;
  end;


  If (Objeto <> Nil) Then
    Result := GetValueObjectG(Objeto,VCol,VLinha)
  else
    Result := FValor; 
end;

procedure TITEMCADSELECAO.SetAjuda(const Value: TStringList);
begin
  FAjuda.Assign(Value);
end;

procedure TITEMCADSELECAO.SetMascara(const Value: String);
begin
   FMascara := Value;
   If (Objeto is TMaskEdit) then
    TMaskEdit(Objeto).EditMask := Value;
end;

procedure TITEMCADSELECAO.SetSqlPesquisa(const Value: TStringList);
begin
  FSqlPesquisa.Assign(Value);
end;

procedure TITEMCADSELECAO.SetValores(const Value: TStringList);
begin
  FValores.Assign(Value);
end;

procedure TITEMCADSELECAO.SetValue(const Value: String);
begin
   Fvalor := Value;
   If (Objeto <> Nil) Then
    SetValueObject(Objeto,Value);
end;

Function TITEMCADSELECAO.SqlGravar(Altera: Boolean;Var Query:TQuery;Linha1,Linha2:Integer):String;
var TemOutros:Boolean;
begin
  If (GetValue = '') and Not FNotNull Then
   Exit;

  TemOutros := Pos(',',Query.Sql.Text) > 0;

  If Not Altera and (Linha1 > 0) Then
   Query.Sql.Insert(Linha1,IIfs(TemOutros,',','')+FCampo);

  if Linha2 > 0 Then begin
    Query.Sql.Insert(Linha2,IIfs(TemOutros,',','')+
                            IIfs(Altera,FCampo+' = :','')+
                            FCampo+
                            IntToStr(Query.ParamCount + 1));
    If FTipo in [FtDate,FtTime,FtDateTime] Then
      Query.Params[Query.ParamCount - 1].AsDateTime := StrtoDateN(GetValue)
    else If FTipo in [FtFloat,FtInteger,FtWord,FtCurrency,FtBcd] Then
      Query.Params[Query.ParamCount - 1].AsFloat    := StrtoFloatN(GetValue)
    else
      Query.Params[Query.ParamCount - 1].AsString   := GetValue;
  end;
end;

function TITEMCADSELECAO.SqlSelect(var Query: TQuery;
  Linha: Integer): String;
begin
   With ListIndexField(Query.Sql) do
    Try
       Query.Sql.Insert(Linha,IIfs(Count > 0,',','')+FCampo);
    Finally
       Destroy;
    end;
end;

Procedure TITEMCADSELECAO.ExitObjeto(Sender:Tobject);
var I:Integer;
    FParams:TParams;
    FQuery:TQuery;
begin

  if (Ajuda.Text <> '') Then
    If TEditcontrole(Sender).Text = '' Then
      TPanelControle(Objeto2).Caption := ''
    else If not(Not TEditcontrole(Sender).FoiAlterado and TEditControle(Sender).OldFocus) Then begin
     FQuery := TQuery.Create(Application);
     With FQuery do
      Try
       DataBaseName := 'BD';
       Sql.Text := Ajuda.Text;
{       For i:=0 to ParamCount - 1 do
        If UpperCase(Params[i].Name) = UpperCase(FCampo) Then begin
          If FTipo in [FtInteger,FtFloat,FtWord,FtSmallInt,FtBcd,FtCurrency] Then
            Params[i].AsFloat    := StrtoFloatN(TEditControle(Sender).Text)
          else
            Params[i].AsString   := TEditControle(Sender).Text;
        end else
          Params[i].Clear;}
       FParams := TParams.Create;
       FParams.Assign(Params);
       ParamsObjeto(TForm(Objeto.Owner),FParams);
       TrocaStringParams(FQuery,FParams);
       Open;
       If Eof and TEditControle(Sender).OldFocus Then begin
         Mensagem('Dado não Cadastrado');
         TWinControl(Sender).SetFocus;
         TeDITCONTROLE(Sender).OldText := '';
         Exit;
       end else
         TPanelControle(Objeto2).Caption := Fields[0].AsString;

       If TEditControle(Sender).OldFocus then
        if Not TItemsCadSelecao(GetOwner).finditem(TEditControle(Sender).DescCampo).verificaexcecao then
          TEditControle(Sender).SetFocus;
      Finally
        Destroy;
      end;
    end;
end;

Procedure TITEMCADSELECAO.KeyDownObjeto(Sender: TObject; var Key: Word;Shift: TShiftState);
var FNewSqlPesquisa:String;
    FQuery:TQuery; 
begin
  if (Key = Vk_F2) and (FPesquisa <> '') Then Begin
       If FSqlPesquisa.Text <> '' Then begin
          FQuery := TQuery.Create(Application);
          Try
            FQuery.Sql.Text := FSqlPesquisa.Text;
            ParamsObjeto(TForm(TWinControl(Sender).Owner),FQuery.Params);
            TrocaStringParams(FQuery,FQuery.Params);
            FNewSqlPesquisa := StringStringList(FQuery.Sql);
          finally
             FQuery.Destroy;
          end;
       end;

       MontaPesquisa(TWinControl(Sender),FPesquisa,FPesquisaTab,FNewSqlPesquisa,Nil);
  end;
end;

Procedure TITEMCADSELECAO.ChangeObjeto(Sender:Tobject);
begin
   If (TForm(TWinControl(Sender).Owner).ActiveControl <> Sender) and (FMascaraF <> '')  Then
    If (TCustomEdit(Sender).Text <> '') Then
       If (FTipo in [FtInteger,FtFloat,FtWord,FtSmallInt,FtBcd,FtCurrency]) Then
         TCustomEdit(Sender).Text := FormatFloat(FMascaraF,StrtoFloatN(TCustomEdit(Sender).Text))
       else If (FTipo in [FtDate,FtDateTime,FtTime]) and Not((Sender is TmaskEditControle) and TMaskEditControle(Sender).EditEmBranco) Then
         TCustomEdit(Sender).Text := FormatDateTime(FmascaraF,StrtoDateN(TCustomEdit(Sender).Text));
end;

function TITEMCADSELECAO.verificaexcecao: Boolean;
var i:integer;
    FQUERY:TQUERY;
    FParams:TParams;
    FEnvironment:TQrEvEnvironment;
    FMensagem:String;
    Fevaluator:TQrEvaluator;
begin
   result := true;
   TCadSelecao(TItemsCadSelecao(Collection).GetOwner).queryexc.First;
   If TCadSelecao(TItemsCadSelecao(Collection).GetOwner).queryexc.eof then
    exit;

   FQuery := Tquery.Create(Application);
   FQuery.DataBaseName := 'Bd';
   FQuery.name         := 'queryexcecaosel';
   Fparams             := TParams.Create;
    with TCadSelecao(TItemsCadSelecao(Collection).GetOwner).Queryexc do
     try
       While not Eof do Begin
         if UpperCase(fieldbyname('CAMPOSEL').ASSTRING) = UpperCase(FcAMPO) then begin
           FParams.clear;
           ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),FParams,True);
           If Objeto is TGridSql Then
            With TGridSql(Objeto) do
              for I:=0 to Campos.Count - 1 do
                 if (Campos[I] <> '') then begin
                   TParam(FParams.Add).Name := Campos[I];
                   If TItemsCadSelecao(Collection).finditem(campos[I]) <> Nil Then
                     FParams.ParamByName(Campos[I]).DataType := TItemsCadSelecao(Collection).finditem(Campos[I]).Tipo
                   else
                     FParams.ParamByName(Campos[I]).DataType := FtString;

                     FParams.ParamByName(Campos[I]).Value    :=
                     ValidaDataType(FParams.ParamByName(Campos[I]).DataType,FieldValue[Campos[I],row]);
                 end;

          if (fieldbyname('sql').AsString <> '') then begin
             Fquery.Sql.Text := Fieldbyname('Sql').AsString;
             TrocaStringParams(FQuery,FParams);
             FQuery.open;
          end else
             FQuery.Sql.Clear;

           FEnvironment := TQrEvEnvironment.create;
           Fevaluator   := TQrEvaluator.Create;
             With Fevaluator do
                Try
                 DataSets.Add(FQuery);
                 AssignEnvironment(QrGlobalEnvironment,FEnvironment);
                 for i:=0 to FParams.Count - 1 do
                  AssignFunction(FEnvironment,FParams[i].name,FParams.ParamByName(Fparams[i].name).AsString,DataTypetoQREvResultType(Fparams[i].DataType));
                 Environment := FEnvironment;
                 Environment.Prepare;
                 if Calculate(stringstostr(fieldbyname('Expression').Asstring)).booResult then begin
                   fmensagem := '';
                   with dividememo(fieldbyname('Mensagem').AsString) do
                    try
                     for i:=0 to count - 1 do
                      FMensagem := Fmensagem + iifs(Fmensagem <> '',#13,'')+
                                   Calculate(Strings[i]).strResult;
                    finally
                     destroy;
                    end;



                   if ((fieldbyname('Confirma').AsString = 'T') and mensconf(fmensagem)) or ((fieldbyname('Confirma').AsString = 'F') and Not mensconf(fmensagem)) Then
                     exit
                   else if fieldbyname('Confirma').AsString = '' Then
                     mensagem(FMensagem);
                   result := false;
                 end;
                finally
                  Destroy;
                  fEnvironment.Destroy;
                end;
         end;
         next;
       end;
     finally
       FParams.Destroy;
       FQuery.Destroy;
     end;

end;

{ TITEMSCADSELECAO }

constructor TITEMSCADSELECAO.Create(CadSelecao: TCadSelecao);
begin
  inherited Create(TItemCadSelecao);
  FCadSelecao := CadSelecao;
end;

function TITEMSCADSELECAO.FindItem(VNome: String): TItemCadSelecao;
var i:integer;
begin
  Result := nil;
  For i:=0 to count - 1 do
   if uppercase(items[i].CAMPO) = UpperCase(Vnome) Then begin
    Result := items[i];
    exit;
   end;
end;

function TITEMSCADSELECAO.GetItems(Index: Integer): TItemCadSelecao;
begin
  Result := TItemCadSelecao(inherited GetItem(Index));
end;

function TITEMSCADSELECAO.GetOwner: TPersistent;
begin
  result := FCadSelecao;
end;

procedure TITEMSCADSELECAO.SetItems(Index: Integer;
  const Value: TItemCadSelecao);
begin
  inherited SetItem(Index, Value);
end;


{ TTabDetals }


constructor TTabDetals.Create(CadSelecao: TCadSelecao);
begin
  inherited Create(TTabDetal);
  FCadSelecao := CadSelecao;
end;

procedure TTabDetals.Exclui;
var i:integer;
begin
  For i:=0 to Count - 1 do
   Items[i].Exclui;
end;





function TTabDetals.FindName(FName: String): TTabDetal;
var i:integer;
begin
 Result := Nil;
 for i:=0 to Count - 1 do
  If UpperCase(Items[i].FTabela) = UpperCase(Fname) Then begin
     Result := Items[i]; 
     break; 
  end;
end;

function TTabDetals.GetItems(Index: Integer): TTabDetal;
begin
 Result := TTabDetal(inherited GetItem(Index));
end;

function TTabDetals.GetOwner: TPersistent;
begin
 Result := FCadSelecao;
end;

procedure TTabDetals.Insert;
var i:integer;
begin
  For i:=0 to Count - 1 do
   Items[i].Insert;
end;

procedure TTabDetals.Recupera;
var i:integer;
begin
  For i:=0 to Count - 1 do
   Items[i].Recupera;   
end;

procedure TTabDetals.SetItems(Index: Integer;
  const Value: TTabDetal);
begin
  inherited SetItem(Index, Value);
end;

{ TTabDetal }

constructor TTabDetal.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  Ldpl := -1;
  veiopesquisa := false;
  Recuperando := False;
  QryEof := TQuery.create(Nil);
  QryEof.DataBaseName := 'BD';
  QryInsert := TQuery.create(Nil);
  QryInsert.DataBaseName := 'BD';
  QryExclui := TQuery.create(Nil);
  QryExclui.DataBaseName := 'BD';
  QryRecupera := TQuery.create(Nil);
  QryRecupera.DataBaseName := 'BD';
end;

destructor TTabDetal.Destroy;
begin
  Qryeof.destroy;
  Qryrecupera.destroy;
  QryInsert.destroy;
  QryExclui.destroy;
  inherited Destroy;
end;


procedure TTabDetal.TotalGrid;
var i:integer;
    FCampo:String;
begin
    If TForm(FGrid.Owner).findcomponent('PnTot'+Fgrid.Name) <> Nil then
     With TPanel(TForm(FGrid.Owner).findcomponent('PnTot'+Fgrid.Name)) do
      For i:=0 to ControlCount - 1 do begin
        FCampo := Copy(Controls[i].Name,Length('LbTot'+Fgrid.Name) + 1,Length(Controls[i].Name));
        TLabel(Controls[i]).Caption := FGrid.TituloHorizontal[Fgrid.ColunaCampo(fcampo)]+' '+FloatToStr(Fgrid.RetornaSoma(Fgrid.ColunaCampo(fcampo),0,[],false));
      end;
end;

procedure TTabDetal.Exclui;
var
FParams:TParams;
i:Integer;
begin
  If NOt((Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
   exit;

  QryExclui.Sql.Clear;
  With QryExclui do
    With TCadSelecao(TTabDetals(Collection).GetOwner).Items do begin
      Sql.Add('Delete from  '+Self.Tabela+' Where '+Self.Sql);
      ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),QryExclui.Params);
      ExecSql;
    end;
end;

procedure TTabDetal.FGridAlign(Sender: TObject; ARow, ACol: Integer;
  var HorAlignment: TAlignment; var VerAlignment: TVerticalAlignment);
var i:integer;
begin
  If NOt((Fgrid <> Nil) and (FGrid.Campos.Count > Acol) and (Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
   exit;

  With TCadSelecao(TTabDetals(Collection).GetOwner) do
    For i:=0 to Items.Count - 1 do
     If (UpperCase(Items[i].campo) = UpperCase(Self.Fgrid.Campos[ACol])) and
        (UpperCase(Items[i].TabelaDetal) = UpperCase(Self.Tabela)) and
        (TipoDataType(Items[i].tipo) = dtnumero) Then begin
          HorAlignment := taRightJustify;
          Break;
     end;
end;

procedure TTabDetal.FGridEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
var i:integer;
begin
  If NOt((Fgrid <> Nil) and (FGrid.Campos.Count > Acol) and (Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
   exit;

  With TCadSelecao(TTabDetals(Collection).GetOwner) do
    For i:=0 to Items.Count - 1 do
     If (UpperCase(Items[i].campo) = UpperCase(Self.Fgrid.Campos[ACol])) and (UpperCase(Items[i].TabelaDetal) = UpperCase(Self.Tabela)) and (Items[i].Mascara <> '') Then begin
       Value := Items[i].Mascara;
       Break;
     end;
end;

procedure TTabDetal.FGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i,i2,I4:integer;
    a,B,C:String;
    FQuery:TQuery;
    FParams:TParams;
begin
  If (Key <> Vk_F2) Then
   exit;
 try
    With TCadSelecao(TTabDetals(Collection).GetOwner) do
      For i:=0 to Items.Count - 1 do begin
       If (UpperCase(Items[i].campo) = UpperCase(Self.Fgrid.Campos[FGrid.Col])) and (UpperCase(Items[i].TabelaDetal) = UpperCase(Self.Tabela)) and (Items[i].Pesquisa <> '') Then begin

        If Items[i].PesquisaSql.Text <> '' Then begin
           FQuery := Tquery.create(application);
           FParams := TParams.Create;
           With Fquery do
            try
              Sql.Text := Items[i].PesquisaSql.Text;
              ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),FQuery.Params);
              TCadSelecao(TTabDetals(Collection).GetOwner).LinhaGrid := Fgrid.Row;
              For i2:=0 to Items.Count - 1 do
                If ((UpperCase(Items[i2].TabelaDetal) = '') or (UpperCase(Items[i2].TabelaDetal) = UpperCase(Self.Tabela))) and
                   (Params.FindParam(Items[i2].Campo) <> Nil) and
                    ParamByNAme(Items[i2].Campo).IsNull Then begin
                      ParamByName(Items[i2].Campo).DataType := Items[i].Tipo;
                      ParamByName(Items[i2].campo).Value    :=
                      ValidaDataType(ParamByName(Items[i2].Campo).DataType,Items[i2].Valor);
                   end;
               FParams.Assign(FQuery.Params);
               TrocaStringParams(Fquery,FParams);
               A := Sql.Text;
            finally
               FParams.Destroy;
               FQuery.Destroy;
            end;
         end;




         veiopesquisa := true;
         MontaPesquisa(FGrid,Items[i].Pesquisa,Items[i].PesquisaTab,A,nil);
         Break;
       end;
      end;
   finally
        veiopesquisa := false;
   end;
end;

procedure TTabDetal.FGridMontaGridDataSet(var DadosGrid: TDadosgrid;
  var DeletaLinha: Boolean);
var i,i2:integer;
begin
    DadosGrid.mascara := '';
    If NOt((Fgrid <> Nil) and  (Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
      exit;

    With TCadSelecao(TTabDetals(Collection).GetOwner) do
      For i:=0 to Items.Count - 1 do
       If (UpperCase(Items[i].campo) = UpperCase(DadosGrid.field)) and (UpperCase(Items[i].TabelaDetal) = UpperCase(Self.Tabela)) and
          (Items[i].MascaraF <> '') Then begin
            DadosGrid.mascara := Items[i].MascaraF;
            Break;
        end;

end;

procedure TTabDetal.FGridMovimentaCelula(Sender: TObject);
var OldRow:LongInt;
begin
    If NOt((Fgrid <> Nil) and (Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
      exit;

    If not (Ldpl > -1)  then
      exit;

    OldRow := FGrid.row;
    FGrid.PulaSelectCell := True;
    Try
      FGrid.DeletaLinha(FGrid.Row);
      FGrid.MovLinha(Ldpl,Fgrid.RowCount - iifs(veiopesquisa,2,1));
      Fgrid.Row := Fgrid.RowCount - 1;
    finally
      Fgrid.PulaSelectCell := False;
    end;
end;

procedure TTabDetal.FGridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var i,i2:integer;
FQuery:TQuery;
FCols:Array of Word;
FValues:Array of String;
FParams:TParams;
FCampo:String;
begin
    LDpl := -1;
    If NOt((Fgrid <> Nil) and Fgrid.ColunaAlterada(Fgrid.Col,FGrid.Row) and (Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
      exit;

   Try
    With TCadSelecao(TTabDetals(Collection).GetOwner) do begin
      For i:=0 to Items.Count - 1 do
       If (UpperCase(Items[i].campo) = UpperCase(Self.Fgrid.Campos[FGrid.Col])) and (UpperCase(Items[i].TabelaDetal) = UpperCase(Self.Tabela)) Then begin
         If Not Recuperando and Items[i].VerifDupl Then begin
           SetLength(FCols,0);
           SetLength(FValues,0);
           For i2:=0 to FGrid.Col do
            If Not Fgrid.CellSkip[i2] Then begin
              SetLength(FCols,Length(FCols) + 1);
              FCols[Length(Fcols) - 1] := I2;
              SetLength(FValues,Length(FValues) + 1);
              FValues[Length(FValues) - 1] := fGRID.Cells[i2,FGrid.row];
            end;
            LDpl := LinhaDuplicadaGrid(FGrid,FCols,FValues);
            If (LDpl = FGrid.Row) Then
              LDpl := -1
            else If (LDpl > -1) Then begin
              Fgrid.abortainsert := True;
              exit;
            end;
         end;


        If Not Recuperando AND Not TCadSelecao(TTabDetals(Collection).GetOwner).Items.finditem(FGrid.Campos[FGrid.Col]).verificaexcecao then begin
          Fgrid.abortainsert := True;
          canselect := false;
          exit;
        end;

         If (Items[i].Ajuda.Text <> '') Then begin
           If (Fgrid.Cells[FGrid.Col,Fgrid.Row] = '') and Not Recuperando Then begin
             With ListIndexField(Items[i].Valores) do
              try
               For i2:=0 to Count - 1 do
                if FGrid.Campos.IndexOf(Strings[i2]) > -1 Then
                  Fgrid.FieldValue[Strings[i2],Fgrid.Row] := ''
                else
                  Fgrid.FieldValue[Items[i].Campo+'_'+Strings[i2],Fgrid.Row] := ''
              finally
               destroy;
              end;
              exit;
           end;


           FQuery := TQuery.Create(Application);
           With FQuery do
            try
              DataBaseName := 'BD';
              Sql.Text := Items[i].Ajuda.Text;
              ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),FQuery.Params);
              TCadSelecao(TTabDetals(Collection).GetOwner).LinhaGrid := Fgrid.Row;
              For i2:=0 to Items.Count - 1 do
                If ((UpperCase(Items[i2].TabelaDetal) = '') or (UpperCase(Items[i2].TabelaDetal) = UpperCase(Self.Tabela))) and
                   (Params.FindParam(Items[i2].Campo) <> Nil) and
                    ParamByNAme(Items[i2].Campo).IsNull Then begin
                      ParamByName(Items[i2].Campo).DataType := Items[i].Tipo;
                      ParamByName(Items[i2].campo).Value    :=
                      ValidaDataType(ParamByName(Items[i2].Campo).DataType,Items[i2].Valor);
                   end;
               Fparams := TParams.Create;
               Try
                 FParams.Assign(Params);
                 TrocaStringParams(FQuery,FParams);
               finally
                 FParams.Destroy;
               end;

               Open;
               
               If FQuery.eof and Not recuperando Then begin
                 Mensagem(Fgrid.TituloHorizontal[Fgrid.Col]+' Invalido');
                 CanSelect := False;
                 Exit;
               end;


               For i2:=0 to Fields.Count - 1 do
                if FGrid.Campos.IndexOf(Fields[i2].FieldName) > -1 Then
                  Fgrid.FieldValue[Fields[i2].FieldName,Fgrid.Row] := Fields[i2].AsString
                else
                  Fgrid.FieldValue[Items[i].Campo+'_'+Fields[i2].FieldName,Fgrid.Row] := Fields[i2].AsString
            finally
               Destroy;
            end;
           Break;
        end;
       end;
    end;
  finally
    If Not Recuperando Then TotalGrid;
  end;
end;

procedure TTabDetal.Insert;
VAR I,i2:INTEGER;
    FQuery:TQuery;
begin
  If NOt((Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
   exit;

  Exclui;
  QryInsert.Sql.Clear;
  try
   With QryInsert do
    With TCadSelecao(TTabDetals(Collection).GetOwner).Items do begin
      Sql.Add('Insert Into  '+Self.Tabela+' ( ');
      With DivideMemo(SqlIns) do
       Try
         for i:=0 to Count - 1 do
          If Strings[i] <> '' Then
           sql.add(IIfs(QryInsert.Sql.count = 1,'',',')+Strings[i]);
       finally
         Destroy;
       end;

      For i:=0 to Count - 1 do
        If UpperCase(Self.Tabela) = UpperCase(Items[i].TabelaDetal) then
            Sql.Add(IIfs(Sql.Count = 1,'',',')+Items[i].campo);
      sql.add(' ) Values ( ');

      FQuery := TQuery.Create(Application);
      With FQuery do
       Try
         Sql.Text := Self.Sql;
         For i:=0 to ParamCount - 1 do
          QryInsert.Sql.add(iifs(I = 0,'',',')+':'+Params[i].name);
       finally
         destroy;
       end;
       ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),QryInsert.Params);
       For i:=0 to Count - 1 do
         If UpperCase(Self.Tabela) = UpperCase(Items[i].TabelaDetal) then
             Sql.Add(IIfs(Sql.Count = 1,':',', :')+Items[i].NomeParametro);
      sql.add(' ) ');
      MensErroGlobal := 'Erro ao Gravar na Tabela '+Self.Tabela+#13+
                        'Linha '+IntToStr(I);
      For i:=FGrid.FixedRows to FGrid.RowCount - 1 do begin
       TCadSelecao(TTabDetals(Collection).GetOwner).LinhaGrid := I;
       for i2:=0 to Fgrid.colcount - 1 do
        if Fgrid.colwidths[i] > -1 then
         menserroglobal := menserroglobal+#13+Fgrid.cells[i2,I];
       If TCadSelecao(TTabDetals(Collection).GetOwner).ValueParametros(QryInsert,Self.Tabela) Then
        execSql;
      end;
    end;
  finally
    MensErroglobal := '';
  end;
end;

procedure TTabDetal.Recupera;
var
i,i2,i3,ind,i4:integer;
OldCol,OldRow:Integer;
vQuery:TQuery;
OldActivePAge:TTabSheet;
FParams:TParams;
begin
  OldActivePage := Nil;
  If NOt((Collection is TTabDetals) and (TTabDetals(Collection).GetOwner is TCadSelecao)) Then
   exit;
  QryRecupera.Sql.Clear;
  With QryRecupera do
    With TCadSelecao(TTabDetals(Collection).GetOwner).Items do begin
      Sql.Add('Select ');
      For i:=0 to Count - 1 do
         If UpperCase(Self.Tabela) = UpperCase(Items[i].TabelaDetal) then begin
           Sql.Add(IIfs(Sql.Count = 1,'',',')+Items[i].campo);
           For i2:=0 to Items[i].camposAjuda.count - 1 do
            Sql.Add(', '' '' as '+Items[i].camposAjuda[i2]);
         end;
      sql.add(' From '+Self.Tabela+' Where '+Self.Sql);
      ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),QryRecupera.Params);
      Open;
      Fgrid.MontaGridDataSet(QryRecupera,0);
      For i:=0 to FGrid.ColCount - 1 do
       FGrid.CellSkip[I] := False;
      For i:=0 to Count - 1 do
         If UpperCase(Self.Tabela) = UpperCase(Items[i].TabelaDetal) then
           For i2:=0 to Items[i].camposAjuda.count - 1 do begin
             Ind := Fgrid.Campos.IndexOf(Items[i].camposAjuda[i2]);
             If Ind > -1 Then
              FGrid.CellSkip[Ind] := True;
           end;
      If (Fgrid.Parent is TTabSheet) Then begin
       oldactivepage := TPageControl(FGrid.Parent.Parent).ActivePage;
       TPageControl(FGrid.Parent.Parent).ActivePage := TTabSheet(Fgrid.Parent);
      end;
      Fgrid.TituloHorizontal.Refresh(0);
      If OldActivePage <> Nil Then
       TPageControl(FGrid.Parent.Parent).ActivePage := OldActivePage;
      QryRecupera.First;
      If Eof Then
       exit;


      vqUERY := TQuery.Create(Application);
      Try
          vqUERY.DataBaseName := 'BD';
          For i3:=FGrid.FixedRows to Fgrid.RowCount - 1 do begin
            For i:=0 to Count - 1 do
            If (UpperCase(Self.Tabela) = UpperCase(Items[i].TabelaDetal)) and (Items[i].Ajuda.text <> '') then begin
              vqUERY.Sql.Clear;
              vqUERY.Sql.Text := Items[i].Ajuda.Text;
              ParamsObjeto(TForm(TCadSelecao(TTabDetals(Collection).GetOwner).Owner),vqUERY.Params);

              TCadSelecao(TTabDetals(Collection).GetOwner).LinhaGrid := i3;
              For i2:=0 to Count - 1 do
               If ((UpperCase(Items[i2].TabelaDetal) = '') or (UpperCase(Items[i2].TabelaDetal) = UpperCase(Self.Tabela))) and
                  (vqUERY.Params.FindParam(Items[i2].Campo) <> Nil) and
                   vqUERY.ParamByNAme(Items[i2].Campo).IsNull Then begin
                     vqUERY.ParamByName(Items[i2].Campo).DataType := Items[i].Tipo;
                     vqUERY.ParamByName(Items[i2].campo).Value    :=
                     ValidaDataType(vqUERY.ParamByName(Items[i2].Campo).DataType,Items[i2].Valor);
               end;
               vqUERY.Open;
               If Not vqUERY.Eof Then
                For i2:=0 to vqUERY.Fields.Count - 1 do
                 if FGrid.Campos.IndexOf(vqUERY.Fields[i2].FieldName) = -1 Then
                   Fgrid.FieldValue[Items[i].Campo+'_'+vqUERY.Fields[i2].FieldName,I3] := vqUERY.Fields[i2].AsString
            end;
           end;
           TotalGrid;
        finally
           vqUERY.Destroy;
        end;

    end;
end;

end.
