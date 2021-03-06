unit FuncoesGlobais;

interface

Uses Classes,stdctrls,extctrls,controls,Dialogs,dbtables,Forms,Grids,dbctrls,Sysutils,
     CondPag,Mask,GridControl,Db,Windows,VariaveisSafi,SenhaPrecision,TipoDef,MensPisca,Direito,
     ComCtrls,Menus,ABarra,Graphics,ShellApi,FileCtrl,Buttons,Math,QrExpr,QrExpbld,ConstantesAppl,MaskUtils,Variants,Messages,dbgrids;

type
     TTipoDataType = (dtcharacter,dtnumero,dtinteiro,dtdata);
          
     TRetConsDin = Record
       Execute:Boolean;
       Faixas:String;
     end;
     
     TSetChar =  set of Char;

     TCredito = Record
       Valida     : Boolean;
       Utilizado  : Currency;
       Total      : Currency;
       Quantidade : Integer;
       QtdeUtilizada : Integer;
       Mensagem   : String;
       BloqueiaFat:Boolean;
     End;

    TChaves = Record
      Campo : String;
      Valor : Variant;
      Tipo  : TFieldType;
    end;


    TVetorChaves = Array of TChaves;

    THeaderPagRec = Record
        Cliente   : String;
        NomeCli   : String;
        TipoCli   : Integer;
        Pedido    : String;
        Data      : TDateTime;
        Vendedor  : Integer;
        NomeVen   : String;
        Conta     : String;
        Centro    : String;
        Categoria : Integer;
        SubCateg  : Integer;
        Origem    : String;
        Situacao  : String;
        PagRec    : String;
    End;

    TDetPagRec = Record
        Documento : String;
        Data      : TDateTime;
        Valor     : Currency;
    End;

    ADetPagRec = Array of TDetPagRec;

    TEmpresasConsolidada = Array of String;

    TDadosEmail = Record
      porta:String;
      host:string;
      usuario:string;
      password:string;
    end;

   TDadosCriaMenu = Record
     Menu             : TMenuItem;
     Origem           : TTreeNode;
     CriaSubMenu      : Boolean;
     SubMenu          : Boolean;
     Direitos         : TDireito;
     IndexImage       : Word;
     IndexImageFilhos : Word;
   end;


   PMyRec = ^TMyRec;
   
   TMyRec = record
     Nome          : string;
     Codigo        : Word;
     Direitos      : Word;
     Filhos        : Boolean;
     Click         : TNotifyEvent;
     Menu          : TMenuItem;
     Form          : Tform;
     FormActivate  : TnotifyEvent;
     WindowState   : TWindowState;
     PForm         : ^TForm;
   end;

   TFaixa = Record
     Campo:String;
     Valor:Variant;
     DataType:TFieldType;
     Operacao:String;
   end;

   TFaixas = Array of TFaixa;

   TProcOpcoesMensagem = Procedure(Retorno,Flag:String;VAR Fechar:Boolean) of Object;

   TProcDelay          = Procedure(VAR Abortar:Boolean) of Object;


Function EVogal(Letra : Char) : Boolean;
Function VerificaQtdLinha(Palavra : String;Tamanho : Word; Var PalavraRet : Array of String): Word;
Function IIFs(Value1:Boolean;Value2,Value3:Variant) : Variant;
Procedure LimpaCampos(Janela : TComponent;Target : TwinControl=Nil);
Procedure Mensagem(Value : String);
Function VerificaCampos(Janela : TComponent):Boolean;
Function MontaPesquisa(pObjeto : TWinControl;pCodigo,pTabela,pFiltro : String;BancoDeDados:TDataBase;VRet:String=''):TRetConsDin;
Procedure LimpaGrid(Objeto : TStringGrid);
Procedure AlimentaFormaPag(Detalhe : ADetPagRec;Corpo : THeaderPagRec ;Var TabelaOld : TTable);
Function GeraParcelas(CPag : String;Doc : String ;Vlr : Currency ; Dt : TDateTime;Banco:TDataBase) : TTipoCondA;
procedure replicadados(qry:TDataSet;NomeTabela:String;
                        Var novosdados:array of string;Var valoresnovosdados:array of variant;
                        Var chaves:array of string);
Function  MensConf(Value : String):Boolean;
Procedure DeleteFormaPag(Corpo : THeaderPagRec );
Function  RetornaConfiguracoes(Const Campos : array of string):Variant;
function  retornavalortotaldogrid(const Operacao :array of String;
                                  Const Colunas : Array of Integer;Grid:TStringGrid;
                                  LinhaInicial:Integer):Double;
Function  StrToFloatN(cNumero:String):Double;
Procedure MensagemDuplicacao(Duplicado:Boolean;Assunto:String);
Function  RetornaDescricaoGrupoPgto(Codigo:String):String;
procedure verificacamposlocal(Origem,Janela:TComponent);
Function  OrigemtoStr(Value:Torigem):String;
Function  PagRectoStr(VAlue:TPagouREc):String;
Function  StrToOrigem(Origem:String):TOrigem;
Procedure DeletaDetalhamento(Origem,Documento,CliForn,PagRec:String);
Function  RetornaCliForn(CliForn,Codigo:String):String;
Function  RetornaSenha(Senha:Array of String):Boolean;
Procedure IncluiParametrosVariant(Parametro:TParam;Valor:Variant);
Function  VariantVaziaInvalida(Valor:Variant):Boolean;
Function  VariantVazia(Valor:Variant):Boolean;
Procedure LimpaVariantVazia(Valor:Variant);
Function  MascaraCompleta(Mascara,Texto:String):Boolean;
Function  NomeOrigem(Origem:String):String;
Function  RetornaEmpresasConsolidadas(Empresa:String):TEmpresasConsolidada;
Function  SqlEmpresaConsolidada(Empresa,CampoEmpresa:String):String;
Function  EmpresaValida(Empresa,EmpresaOrigem:String):Boolean;
function  aumentadia(data:tdatetime;repeticao:integer):string;
Function  GetTipoCampoTabela(Tabela,BancoDados,Campo:String):TTipoCampo;
Function  VarianttoField(Field:TField;Tipo:TTipoCampo):Variant;
Function  tipocampotovariant(Tipo:TTipoCampo):Integer;
Procedure CarregaParametro(Valor:Variant;Tipo:Integer;Param:TParam);
Function  FieldToVariant(Field:Tfield):Variant;
Function  DataTypeToTTipoCampo(Value :TFieldType):TTipoCampo;
Function  TipoCampotoDataType(Value  :TTipoCampo):TFieldType;
Function  GetIndexChave(Const Campo:String;Var Chaves:TVetorChaves):Integer;
Function  SqlTemWhere(Const Query:TQuery):Boolean;
//Procedure DeletaVetor(Const Vetor :pointer;Indice:Word);
Procedure TrocaDataSetSession(Var Form:TForm);
Function  DiaDaSemana(Dia:Word):String;
Procedure WhereouAnd(Const Query:Tquery);
Function  FWhereouAnd(FQuery:String):String;
Function TemLetra(Palavra:String):Boolean;
Procedure CompletaData(var Data:String);
Function DateM:TDateTime;
Procedure LimpalinhaGrid(Grid:TStringGrid;Linha:Word);
Procedure PreencheGrid(Grid:TStringGrid;DataSet:TDataSet;NCampos:Array of Word);
Function  VerificaDuplicidadeGrid(Grid:TStringGrid;Const Colunas:Array of Word):Boolean;
Function  LinhaDuplicadaGrid(Grid:TStringGrid;Colunas:Array of Integer;Valores:Array of String;niND:Integer=-1):Integer;
Procedure  VariantToParams(Params:TParam;Value:Variant);
Function   GetValueObject(Objeto:TControl):String;
Function   GetValueObjectG(Objeto:TControl;Col,Row:LongInt):String;
Procedure  SetValueObject(Objeto:TControl;Value:Variant);
Function   DataBancodados(Data:TDateTime):String;
Function   FormatDateTimeM(Mascara:String;Data:TdateTime):String;
Procedure MensP(Value :Boolean;Value2:String);
Function  StrtoIntN(Valor:String):Integer;
Function  StrtoInt64N(Valor:String):Int64;
//Function  DadosEmail:TDadosEmail;
Function  DiferencaMes(DataFinal,DataInicial:TDate):Word;
function TrocaResolucao(X, Y: word): Boolean;
Procedure ClearControls(FControl:TWinControl;ClearParent:Boolean);
function inttomonth(mes: integer): string;
Function  ColocaClic(Value : String) : String;
function NomeComputador : String;
function PadL(sVar:String; nTam:Byte; sAdic:String):String;
function PadR(sVar:String; nTam:Byte; sAdic:String):String;
function  PadC(sVar:String; nTam:Byte; sAdic:String):String;
Procedure FocusSemOnExit(FFocus:Twincontrol);
Procedure CriaMenu(Var Arvore:TTreeView;Dados:TDadosCriaMenu);

Function  ConvDataType(Value :TFieldType):String;
Function  ConvDataSize(Value :TFieldType;Tamanho : Word):Word;
Function  StrtoDataType(Value :String):TFieldType;
function  DataTypeToVarType(FDatatype:TFieldType):Variant;
function  LimpaMascara(FValue:String):String;
Procedure TiraEspacos(Control:TWinControl);
Function  ValidaInventario(Almoxarifado,Produto:String;Data:TDateTime):Boolean;
Function  DivideMemo(Value:String):TStringList;
Function  StrtoTipoCodBarra(Value:String):TTipo;
Function  TipoCodBarratoStr(Value:TTipo):String;
Function  VerificaCodBarras(Tipo:TTipo;Value:String):Boolean;
Function  NextFocus(Control:TWinControl):TWinControl;
Procedure GetListTabOrderClient(FControl:TWinControl;Var FLista:TList;SoHabilitados:Boolean);
Function  LinesCanvas(FCanvas:TCanvas;Texto:String;Tamanho:Word;AutoSize:Boolean):TStringList;
Function  PosField(Sql:TStrings;FField:String;DataBase:String='Bd'):Word;
Function  ListIndexField(Sql:TStrings;DataBase:String='Bd'):TStringList;
Function  ListFullField(FSql:TStrings;FDataBase:String):TStringList;
Procedure DataBaseParamstoCellsGrid(FGrid:TStringGrid;FParams:TStrings;ColPar,ColVal:Smallint);
Function  CellsGridtoDataBaseParams(FGrid:TStringGrid;ColPar,ColVal:Smallint):String;
Function  DivStrings(FStrings:TStrings;FDiv,BA:String):TStrings;
Function  ValidaExpr(P1,P2:Variant;Operacao:String):Boolean;
Function  StrTiraEspaco(Value:String):String;
Function  RetCredito(Empresa,PagRec,Cliforn:String;Data:TDateTime) : TCredito;
Function  RetLimiteCredito(Empresa,PagRec,Cliforn:String;Data:TDateTime;VAlueIni:Currency;QtdeIni:Word):TCredito;
Function  IntToStrCodBarra(Codigo:Double;Tipo:TTipo):String;
FUNCTION  TrocaUnPalavra(Value,Origem,Destino:String;FInd:Integer=0):String;
Function  TrocaPalavra(Value,Origem,Destino:String;Find:Integer=0):String;
Function  TrocaPalavras(Value:String;Origens,Destinos:Array of String):String;
Function  TrocaPalavrasSL(Value:TStrings;Origens,Destinos:Array of String):TStringList;
Procedure PTrocaPalavrasSL(var Value:TStringList;Origens,Destinos:Array of String);
Function  StrtoDateN(Value:String):TDateTime;
Function  DivLimiteString(Value:String;Tam:LongInt):TStringList;
Procedure DivLimiteStrings(Var Value:TStringList;Tam:LongInt);
Function  TiraEspacosEsq(Value:String):String;
Function  TiraEspacosDir(Value:String):String;
Function  TiraEspacosCent(Value:String):String;
function  CHEK_CGC(var_cgc:string):boolean;
function  CHEK_CPF(var_cpf:string):boolean;
Function  ValidaCharacteres(Characteres:TSetChar;Palavra:String;InPalavra:Boolean;VNew:String=''):String;
Function  SoNumero(Palavra:String):String;
Procedure AllOnExit(Janela : TWinControl;Objeto:TWinControl);
Function  VerArqPath(Value:String):String;
Function  CopiaPasta(cFrom,CTo:String;B:Boolean):Boolean;
Function  CopiaArquivo(cFrom,CTo:String;B:Boolean):Boolean;
Function  ValidaArquivo(Value:String):String;
Function  DeletaArquivos(Path:String):Integer;
Function  DeletaPasta(Path:String):Integer;
Function  MensOpcoes(mensagem:String;Opcoes:Array of String;find:integer=0;enables:string='';vertical:boolean=false;tempoerro:integer=0):Integer;
Function  FBuscaPath(ArqIni:String):String;
Function  CopiaArquivos(PathFrom,PathTo,Extension:String):Boolean;
Function  CopiaArquivosFiltros(PathFrom,PathTo:String;Extensions:Array of String):Boolean;
Function  RepeatChar(Value:String;Repeticao:Word):String;
Function  StringListtoStr(Value:TStringList):String;
Function  TotRect(F:TWincontrol):TRect;
Function  VLComponent(F:TWincontrol):String;
Function  SqlParams(Var F:TStringList;FParams:TParams):TStringList;
Function  StrtoStrings(F:String):TStringList;
Procedure TrocaStringParams(Var Query:TQuery;FParams:TParams;semaspas:Boolean=false);
Procedure ValidaParamsNulo(Var Query:TQuery;FParams:TParams);
function  ZeroEsquerda(Value:Double;Zeros:Word):String;
Function  StrtoDateTimeF(Value:String;Mascara:String):TDateTime;
Function  DateToStrBd(Value:TDateTime;FieldType:TFieldType):String;
Procedure ShowMensOpcoes(mensagem:String;Opcoes:Array of String;Const FProc:TProcOpcoesMensagem;Flag:String);
function  CopyRegDataSet(TabelaOrigem,TabelaDestino,DataBase:String;FCamposOrg,FCamposDest:TFaixas):Integer;
function  ChrToByte(FChr:Char):Byte;
Function  IncChar(Value:String;Repeticao:LongInt):String;
Function  NextConjuntoCaracteres(Value,ValueIni:TStringList):TStringList;
Function  SeparadortoStrings(Value,Separador:String):TStringList;
Function  StringstoSeparador(Value:TStringList;Separador:String):String;
Procedure IndicetabSheets(FOwner:TWinControl);
Function  StringstoStr(Value:String):String;
Function  SelectNextFocus(Control:TWinControl;Ind:LongInt;Parent:TWinControl):TWinControl;
Procedure HabilitaTabSheets(FControl:TWinControl;fowner:TCustomForm=Nil);
Function  RectTotal(Control:TControl):TRect;
function  MonExtenso(psNro: string):string;
function  Extenso(psNro: string): string;
function  CExtenso(psNro: string): string;
Procedure MensTodos(Mensagem:String;Var F:Word);
Function  FDataTypetoVarType(Value:TFieldType):Integer;
Procedure ParamsObjeto(Objeto:TWinControl;FParams:TParams;incluir:boolean=false);
Function  StringStringList(FStrings:TStrings):String;
function  AssignVariantParams(FParam:TParam;Value:Variant):Variant;
Function  CompletaZeros(Zeros:Integer;Value:Double;Decimal:Boolean):String;
Function  CopyPChar(Value:PChar;Ind:Integer;Count:Integer):PChar;
Procedure InicioTabSheets(FParent:TWinControl);
Procedure ComboDataType(Objeto:TComboBox);
Function  FormatNomeTabela(Value:String):String;
function  tiraacento(texto:string):string;
function  SeparaString(Value:String;Separador:String = ','):TStringList;
function  VDataTypeToVarType(FDatatype:TFieldType):Integer;
function  FtimeStamptoMsecs(FData:TTimeStamp):Comp;
function  DateTimetoMsecs(FData:TDateTime):Comp;
function  UltPos(Subst,VStr:String):Integer;
procedure Delay(MSec: Cardinal;ProcDelay:TProcDelay=Nil);
procedure AssignFunction(VEnvironment:TQREvEnvironment;VName,valor:String;Vtipo:TQREvResultType;altera:boolean=False);
Function  QREvResultTypeToDataType(Value:TQREvResultType):TFieldType;
Function  DataTypetoQREvResultType(Value:TFieldType):TQREvResultType;
Procedure AssignEnvironment(OrgEnvironment:TQREvEnvironment;DestEnvironment:TQREvEnvironment);
Function  ValidaDataType(FDataType:TFieldType;Value:String):Variant;
Function  ListIndexFullField(Sql:TStrings;database:string='bd'):TStringList;
Function  InsereFaixaSql(Sql:TStrings;Alias,Valor:String;Fupper:Boolean=False;DataBase:String='Bd'):String;
Function  TemWhereSql(Sql:String;Valor:String='WHERE'):Integer;
Function  FieldtoFullField(Sql:TStrings;Alias:String;DataBase:String='Bd'):String;
Function  TipoDataType(Value:TFieldType):TTipoDataType;
function  tbKeyIsDown(const Key: integer): boolean;
Function  UltimaLinhaFiltroSql(Sql:String):Integer;
function  IndexOfLike(List:TStringList;Palavra:String;Posicao:Word=0):Integer;
Function  ActivePageSel(FPage:TWinControl):TTabSheet;
function  MultiplicaString(Value:String;Qtde:Integer):String;
Function  TrocaStringParamsStr(FValue:String):String;
Function  LocateGlobal(FDataSet:TdataSet;Campos:TStringList;FValues:Array of Variant;FContinua:Boolean=False):Boolean;
Function  FGridCons(FDataSet:TQuery;tit:string;FMulti:Boolean=False;FgridPrinc:integer=-1;FModal:Boolean=True;FBarra:Boolean=True;FCamposPesq:String = '';
          FColumnDataCell:TDrawColumnCellEvent=nil;FFecha:Boolean=true;FDesabFiltros:Boolean=False):Boolean;
procedure FassignParams(Org,Dest:Tquery);
procedure CopyParams(Org,Dest:TParams);
function  GridVazio(FGrid:TStringGrid):Boolean;
Procedure PesquisaListBox(obj:TListBox);
function  LikeStrings(FValue:Tstrings;F:String;inicio:boolean=true):Integer;
Function SubstituiCamposQuery(FValue:String;Exp:String='COUNT(*)'):String;
Function CaminhoExtensao(VPasta:String;Vexts:Array of String):String;
Function NextFocusTbSheet(FControl:TWinControl;Ind:Integer=1):TWinControl;
function FileLastModified(const TheFile: string):TdateTime;
Function PopMenuParent(FParent:TControl;Union:Boolean=False):TPopupMenu;
function CriaCampoBd(BancoDados,Tabela,Campo,Tipo:String):Boolean;
Function LocateGlobalStr(FDataSet:TdataSet;Campos:String;FValues:Array of Variant;FContinua:Boolean=False):Boolean;


VAR
MensErroGlobal:String;
DataValidaDM    : TDateTime;
DataValidaDMini : TDateTime;
DataValidaDMnao : TDate;
HORAMLOCAL:TDATETIME ;
MENSAGEMDATEM:WORD;
Foldpesqlistbox :string;
Fpesqlistbox    :string;
ColorGridCons,ColorformGridCons,ColorFontGridCons,colorformfontgridcons:String;
FirstColGridCons:Boolean=false;
FirstColGridConsColor:String;
FirstColGridConsFColor:String;
FfocusgradeGridCons:Boolean;
const
  csAte10 = 'um    dois  tres  quatrocinco seis  sete  oito  ' + 'nove  dez   ' ;
  csAte19 = 'onze     doze     treze    quatorze quinze   ' + 'dezesseisdezessetedezoito  dezenove ';

implementation


uses
{Setup,DadosEmail,}MaskEdit,ComboSql,CheckControle,EditcONTROLE,OpcoesMensagem,BuscaPath,NovasExpressoes,ConsDinamica,gridcons,dbgridcontrole;

Procedure LimpaCampos(Janela : TComponent;Target :TwinControl=Nil);
Var Loop : Integer;
    Flist:TList;
Begin
     Try
         FList := TList.Create;
         TWinControl(Janela).GetTabOrderList(FList);
         For Loop := 0 To FList.Count -1 Do
             If TWinControl(FList[Loop]).Tag Mod 2 = 1 Then Begin
                   If TWinControl(FList[Loop]) Is TCustomEdit Then
                       TCustomEdit(FList[Loop]).Clear
                   Else If TWinControl(FList[Loop]) Is TPanel Then
                      TPanel(FList[Loop]).Caption := ''
                   Else If TWinControl(FList[Loop]) Is TCheckControle Then
                      TCheckControle(FList[Loop]).Checked := TCheckControle(FList[Loop]).CheckIni
                   Else If TWinControl(FList[Loop]) Is TCheckBox Then
                      TCheckBox(FList[Loop]).Checked := False
                   Else If TWinControl(FList[Loop]) Is TGridControl Then
                      TGridControl(FList[Loop]).Limpa
                   Else If TWinControl(FList[Loop]) Is TComboSql Then begin
                      If TComboSql(FList[Loop]).ValueIni <> '' Then Begin
                          TComboSql(FList[Loop]).ItemIndex := TComboSql(FList[Loop]).Items.IndexOf(TComboSql(FList[Loop]).ValueIni);
                          TComboSql(FList[Loop]).Text      := TComboSql(FList[Loop]).ValueIni;
                      end else Begin
                          TComboSql(FList[Loop]).ItemIndex := TComboSql(FList[Loop]).ItemIndexIni;
                          If TComboSql(FList[Loop]).ItemIndexIni = -1 then
                            TComboSql(FList[Loop]).Text := '';
                      end;    
                   end Else If TWinControl(FList[Loop]) Is TCustomCombobox Then begin
                      TCustomComboBox(FList[Loop]).ItemIndex := -1;
                      If TWinControl(FList[Loop]) Is TCombobox Then
                       TComboBox(FList[Loop]).Text  := '';
                   end else if TWinControl(FList[Loop]) Is TMemo Then
                     TMemo(FList[Loop]).Text  := '';
             End;

         If (Target <> Nil) Then BEGIN
          HabilitaTabSheets(Target);
          Target.SetFocus;
         End; 

     finally
         Flist.Destroy;
     end;
End;




Function VerificaCampos(Janela : TComponent):Boolean;
Var Loop : Integer;
    Flist:TList;
Begin
 Try
  FList := TList.Create;
  TWinControl(Janela).GetTabOrderList(FList);
  Result := True;
  For Loop := 0 To Flist.Count -1 Do  Begin
         If (TwinControl(Flist[Loop]) is TControl) and (TWinControl(Flist[Loop]).Tag Mod 3 = 1) and TWinControl(Flist[Loop]).CanFocus Then Begin
               If (TwinControl(Flist[Loop]) is  TEdit) And (TCustomEdit(Flist[Loop]).Text = '') Then Begin
                       Result := False;
                       Break;
               End;
               If (TwinControl(Flist[Loop]) is  TMaskEdit) And (TMaskEdit(Flist[Loop]).Text = FormatMaskText(TMaskEdit(Flist[Loop]).EditMask,'')) Then Begin
                       Result := False;
                       Break;
               End;
               If (TwinControl(Flist[Loop]) is  TComboBox) And (TComboBox(Flist[Loop]).Text = '') Then Begin
                       Result := False;
                       Break;
               End;
               If (TwinControl(Flist[Loop]) is  TRadioGroup) And (TRadioGroup(Flist[Loop]).Itemindex < 0) Then Begin
                       Result := False;
                       Break;
               End;
               If (TwinControl(Flist[Loop]) is  TStringGrid) And GridVazio(TStringGrid(Flist[Loop])) Then Begin
                       Result := False;
                       Break;
               End;

         End;

     End;

    If Not Result then begin
      MessageDlg('Informa��o obrigat�ria', mtInformation,[mbOk], 0);
      HabilitaTabSheets(TWinControl(Flist[Loop]));
      If TWinControl(Flist[Loop]).CanFocus Then
       TWinControl(Flist[Loop]).SetFocus;
    end;
  FINALLY
    Flist.Destroy;
  END;
End;


Function MontaPesquisa(pObjeto : TWinControl;pCodigo,pTabela,pFiltro : String;BancoDeDados:TDataBase;VRet:String=''):TRetConsDin;
var dados:TConsDinamica;
begin

  with dados do begin
   Dados.Comp     := pObjeto;
   Dados.Codigo   := Pcodigo;
   Dados.Tabela   := PTabela;
   Dados.Filtro   := PFiltro;
   Dados.CampoRetorno  := VRet;
   If BancodeDados <> Nil Then
     Dados.DataBase := BancodeDados.DataBaseName
   else if DataBaseNameAppl <> '' Then 
     Dados.DataBase := DataBaseNameAppl
   else
     Dados.DataBase  := 'Bd'; 
  end;

  With MontaConsDinamica(Dados) do begin
    Result.Execute := Execute;
    Result.Faixas  := faixas;
  end;

End;

Function IIFs(Value1 : Boolean;Value2,Value3:Variant) : Variant;
Begin
    If Value1 Then Result := Value2 Else Result := Value3;
End;

Procedure LimpaGrid(Objeto : TStringGrid);
Var Loop,Loop2 : Word;
Begin
         With Objeto Do
         For Loop := FixedRows To RowCount-1 Do
               For Loop2 := FixedCols To ColCount-1 Do
                    Cells[Loop2,Loop] := '';

         Objeto.RowCount := Objeto.FixedRows + 1;
End;


Procedure Mensagem(Value : String);
Begin
     MessageDlg(Value, mtInformation,[mbOk], 0);
End;

Function VerificaQtdLinha(Palavra : String;Tamanho : Word; Var PalavraRet : Array of String): Word;
Var TamanhoAux,Loop,Qtd,LoopAux,Loop2,nQtdRep : Word;
    PalavraAux : String;
Begin
     // valdinar marreiros marinho

     Result := 1;
     Qtd    := 0;
     Palavra := Trim(Palavra);
     TamanhoAux := 1;
     PalavraAux := '';
     Loop := 1;
     While Loop <= Length(Palavra) Do Begin
           Inc(TamanhoAux);
           PalavraAux := PalavraAux + Palavra[Loop];

           If (TamanhoAux = Tamanho) Or (Loop = Length(Palavra)) And (TamanhoAux > 1) Then begin
              LoopAux := Loop;
              nQtdRep := 0;
              If Not EVogal(Palavra[LoopAux]) And (Loop <> Length(Palavra))  Then Begin
                   If (Palavra[LoopAux] in ['S','s']) And (Palavra[LoopAux+1] = ' ') Then
                       //
                   Else Begin
                       While Not EVogal(Palavra[LoopAux]) Do Begin
                           Inc(LoopAux,-1);
                           Inc(nQtdRep);
                           If Not EVogal(Palavra[LoopAux]) And (Palavra[Loop] = Palavra[LoopAux]) Then
                              Break;
                       End;
                   End;
              //End
              //Else Begin
              //     While EVogal(Palavra[LoopAux-1]) Do Begin
              //         Inc(LoopAux,-1);
              //         Inc(nQtdRep);
              //     End;
              End;


              If (TamanhoAux - nQtdRep + 1 > 0) And  (nQtdRep > 0) Then
                  For Loop2 :=  TamanhoAux - nQtdRep + 1  To TamanhoAux Do
                      PalavraAux[Loop2] := ' ';

              Loop := LoopAux;
              TamanhoAux := 0;
              Inc(Qtd);
              PalavraRet[Qtd-1] := Trim(PalavraAux);
              PalavraAux := '';
           End;
           Inc(Loop);
     End;
     Result := Qtd;
End;


Function EVogal(Letra : Char) : Boolean;
Begin
     If Letra in ['A','E','I','O','U','a','e','i','o','u'] Then
             Result := True
     Else
          Result := False;
End;


Procedure AlimentaFormaPag(Detalhe : ADetPagRec;Corpo : THeaderPagRec ;Var TabelaOld : TTable);
Var Loop : Word;
    FormaPagPesq,Tabela : TQuery;
    Ativo : Boolean;
Begin
   //Ativo := Tabela.Active;
   //If Not Ativo Then Tabela.Open;

   FormaPagPesq := TQuery.Create(Application);
   FormaPagPesq.DataBaseName := 'bd';

   Tabela := TQuery.Create(Application);
   Tabela.DataBaseName := 'bd';

   Try
      If Corpo.PagRec <> 'P' Then Begin
                With FormaPagPesq Do Begin
                      Sql.Clear;
                      Sql.Add('DELETE FROM PAGREC                 ');
                      Sql.Add(' WHERE Cod_Cli_PagRec = :Cliente   ');
                      Sql.Add('   AND PRPEDN         = :Documento AND ORIGEM_PAGREC = :ORIGEM AND Tipo_Cli_PagRec = :TIPO');

                      Params[0].AsString  := Corpo.Cliente;
                      Params[1].AsString  := Corpo.Pedido;
                      Params[2].AsString  := Corpo.Origem;
                      Params[3].AsInteger := Corpo.TipoCli;
                      ExecSql;
                End;

                // Chave Referencia Cod_Cli_PagRec -> Cod_Forn_Pag , PrPedn -> PrPedn , OrigemPagRec -> Origem_Pag ,

                // Atributos Normais NOME_CLI_PAGREC -> raz_Forn_Pag, DTDOCEMI_PAGREC -> VlEmit_Pag,
                // dtdocvenc_pag
                //
                With Tabela Do Begin
                   Sql.Clear;
                   Sql.Add('INSERT INTO PAGREC (');
                   Sql.Add('PRPEDN,DOCNUM_PAGREC,COD_CLI_PAGREC,ORIGEM_PAGREC,TIPO_CLI_PAGREC,NOME_CLI_PAGREC,');
                   Sql.Add('DTDOCEMI_PAGREC,DTDOCVEN_PAGREC,VLEMIT_PAGREC,COD_VEN_PAGREC,NOME_VEN_PAGREC,LOC_PAGREC,');
                   Sql.Add('SIT_PAGREC,CENTCUST_PAGREC,CATEGMOV_PAGREC,SUBCATEG_PAGRE,USUARIO_PAGREC,DTMOV_PAGREC)');
                   Sql.Add('VALUES (');
                   Sql.Add(':PRPEDN, :DOCNUM_PAGREC, :COD_CLI_PAGREC, :ORIGEM_PAGREC, :TIPO_CLI_PAGREC, :NOME_CLI_PAGREC,');
                   Sql.Add(':DTDOCEMI_PAGREC, :DTDOCVEN_PAGREC, :VLEMIT_PAGREC, :COD_VEN_PAGREC, :NOME_VEN_PAGREC, :LOC_PAGREC,');
                   Sql.Add(':SIT_PAGREC, :CENTCUST_PAGREC, :CATEGMOV_PAGREC, :SUBCATEG_PAGRE ,:USUARIO_PAGREC,:DTMOV_PAGREC )');
                End;

                For Loop := 0 To Length(Detalhe)-1  do
                    begin
                       //If Tabela.FindKey([Corpo.Documento ,Corpo.TipoCli,Detalhe[Loop].Documento) Then
                       //   Tabela.Delete;

                       If Detalhe[Loop].Documento <> '' Then Begin
                           Tabela.ParamByName('PRPEDN').AsString           := Corpo.Pedido;
                           Tabela.ParamByName('DOCNUM_PAGREC').AsString    := Detalhe[Loop].Documento;
                           Tabela.ParamByName('COD_CLI_PAGREC').AsString    := Corpo.Cliente;
                           Tabela.ParamByName('ORIGEM_PAGREC').AsString           := Corpo.Origem;
                           Tabela.ParamByName('TIPO_CLI_PAGREC').AsInteger  := Corpo.TipoCli;
                           Tabela.ParamByName('NOME_CLI_PAGREC').AsString   := Corpo.NomeCli;
                           Tabela.ParamByName('DTDOCEMI_PAGREC').AsDateTime:= Corpo.Data;
                           Tabela.ParamByName('DTDOCVEN_PAGREC').AsDateTime:= Detalhe[Loop].Data;
                           Tabela.ParamByName('VLEMIT_PAGREC').AsCurrency  := Detalhe[Loop].Valor;
                           Tabela.ParamByName('COD_VEN_PAGREC').AsInteger  := Corpo.Vendedor;
                           Tabela.ParamByName('NOME_VEN_PAGREC').AsString  := Corpo.NomeVen;
                           Tabela.ParamByName('LOC_PAGREC').AsString       := Corpo.Conta;
                           Tabela.ParamByName('SIT_PAGREC').AsString       := Corpo.Situacao;
                           Tabela.ParamByName('CENTCUST_PAGREC').AsString  := Corpo.Centro;
                           Tabela.ParamByName('CATEGMOV_PAGREC').AsInteger := Corpo.Categoria;
                           Tabela.ParamByName('SUBCATEG_PAGRE').AsInteger := Corpo.SubCateg;

                           Tabela.ParamByName('USUARIO_PAGREC').AsString := '';
                           Tabela.ParamByName('DTMOV_PAGREC').AsDateTime := Date;
                           
                           Tabela.ExecSql;
                       End;
                    end;
      End
      Else Begin
                With FormaPagPesq Do Begin
                      Sql.Clear;
                      Sql.Add('DELETE FROM PAGAMENT                 ');
                      Sql.Add(' WHERE Cod_Forn_Pag = :Cliente   ');
                      Sql.Add('   AND PRPEDN         = :Documento AND ORIGEM_PAG = :ORIGEM ');

                      Params[0].AsString  := Corpo.Cliente;
                      Params[1].AsString  := Corpo.Pedido;
                      Params[2].AsString  := Corpo.Origem;
                      ExecSql;
                End;

                // Chave Referencia Cod_Cli_PagRec -> Cod_Forn_Pag , PrPedn -> PrPedn , OrigemPagRec -> Origem_Pag ,

                // Atributos Normais NOME_CLI_PAGREC -> raz_Forn_Pag, DTDOCEMI_PAGREC -> VlEmit_Pag,
                // dtdocvenc_pag
                //
                With Tabela Do Begin
                   Sql.Clear;
                   Sql.Add('INSERT INTO PAGAMENT (');
                   Sql.Add('PRPEDN,DOCNUM_PAG,COD_FORN_PAG,ORIGEM_PAG,RAZ_FORN_PAG,');
                   Sql.Add('DTDOCEMI_PAG,DTDOCVEN_PAG,VLEMIT_PAG,LOC_PAG,');
                   Sql.Add('SIT_PAG,CENTCUST_PAG,CATEGMOV_PAG,SUBCATEG_PAG)');
                   Sql.Add('VALUES (');
                   Sql.Add(':PRPEDN, :DOCNUM_PAG, :COD_FORN_PAG, :ORIGEM_PAG, :RAZ_FORN_PAG,');
                   Sql.Add(':DTDOCEMI_PAG, :DTDOCVEN_PAG, :VLEMIT_PAG, :LOC_PAG,');
                   Sql.Add(':SIT_PAG, :CENTCUST_PAG, :CATEGMOV_PAG, :SUBCATEG_PAG)');
                End;

                For Loop := 0 To Length(Detalhe)-1  do
                    begin
                       //If Tabela.FindKey([Corpo.Documento ,Corpo.TipoCli,Detalhe[Loop].Documento) Then
                       //   Tabela.Delete;

                       If Detalhe[Loop].Documento <> '' Then Begin
                           Tabela.ParamByName('PRPEDN').AsString           := Corpo.Pedido;
                           Tabela.ParamByName('DOCNUM_PAG').AsString    := Detalhe[Loop].Documento;
                           Tabela.ParamByName('COD_FORN_PAG').AsString    := Corpo.Cliente;
                           Tabela.ParamByName('ORIGEM_PAG').AsString           := Corpo.Origem;
                           Tabela.ParamByName('RAZ_FORN_PAG').AsString   := Corpo.NomeCli;
                           Tabela.ParamByName('DTDOCEMI_PAG').AsDateTime:= Corpo.Data;
                           Tabela.ParamByName('DTDOCVEN_PAG').AsDateTime:= Detalhe[Loop].Data;
                           Tabela.ParamByName('VLEMIT_PAG').AsCurrency  := Detalhe[Loop].Valor;
                           Tabela.ParamByName('LOC_PAG').AsString       := Corpo.Conta;
                           Tabela.ParamByName('SIT_PAG').AsString       := Corpo.Situacao;
                           Tabela.ParamByName('CENTCUST_PAG').AsString  := Corpo.Centro;
                           Tabela.ParamByName('CATEGMOV_PAG').AsInteger := Corpo.Categoria;
                           Tabela.ParamByName('SUBCATEG_PAG').AsInteger := Corpo.SubCateg;
                           Tabela.ExecSql;
                       End;
                    end;
      End;

   Finally
        //If Not Ativo Then Tabela.Close;
        FormaPagPesq.Destroy;
        Tabela.Destroy;
   End;
End;

Function GeraParcelas(CPag : String;Doc : String ;Vlr : Currency ; Dt : TDateTime;Banco:TDataBase) : TTipoCondA;
Var CondPagamento : TCondPag;
    Parcelas : TTipoCondA;
Begin
    CondPagamento := TCondPag.Create(Application);
    //With CondPagamento  Do Begin
       CondPagamento.BancoDeDados := Banco;

       CondPagamento.Ativa;
       CondPagamento.Codigo := CPag;
       CondPagamento.Recupera;
       CondPagamento.Documento := Doc;
       Parcelas := CondPagamento.GetData(Dt,Vlr);
    //End;
    Result := Parcelas;
    CondPagamento.Destroy;
End;

procedure replicadados(qry:TDataSet;NomeTabela:String;
                       Var novosdados:array of string;Var valoresnovosdados:array of variant;
                       Var chaves:array of string);
var
qry2: tquery;
i,i2: integer;
verdade  : boolean;
begin
         qry2 := tquery.create(application);
         qry2.databasename := 'bd';
         qry2.sql.clear;
         qry2.Sql.add('Select');
         qry2.Sql.add(chaves[0]);
         qry2.Sql.add('From');
         qry2.Sql.add(NomeTabela);
         for i:=0  to length(chaves) - 1 do
          begin
            If i = 0 then
                  qry2.sql.add('Where'+' '+chaves[0]+' '+'= :'+chaves[0])
            else
                  qry2.sql.add('and'+' '+chaves[i]+'= :'+chaves[i]);

                  verdade := false;
                  for i2:=0 to length(novosdados) - 1 do
                    begin
                     if chaves[i] = novosdados[i2] then
                      begin
                        qry2.parambyname(chaves[i]).value := valoresnovosdados[i2];
                        verdade := true;
                        break;
                      end;
                    end;

                   if verdade = false then
                      qry2.parambyname(chaves[i]).value := qry.fieldbyname(chaves[i]).value;


          end;

         qry2.open;

         if not qry2.eof then
          Begin
             qry2.free;
             exit;
          end;
              qry2.sql.clear;
              Qry2.Sql.Add('Insert into           ');
              Qry2.Sql.Add(Nometabela              );
              Qry2.Sql.Add('     (                ' );
              Qry2.Sql.Add(qry.FieldDefs.Items[0].Name);
              for i := 1 to qry.FieldDefs.Count - 1 do
               if not ((qry.FieldList.Count <> 0) and (qry.FieldList.find(qry.FieldDefs.Items[i].Name) = nil)) then
                Qry2.Sql.Add(','+qry.FieldDefs.Items[i].Name);

              Qry2.Sql.Add('      )               ' );

              Qry2.Sql.Add('Values (              ' );

              for i := 0 to qry.fielddefs.Count - 1 do begin
                   if (qry.FieldList.Count <> 0) and (qry.FieldList.Find(qry.FieldDefs.Items[i].Name) = nil) then
                     continue;

                   If qry2.ParamCount >  0 then
                     qry2.sql.add(',');
                   qry2.sql.add(':'+qry.fielddefs.Items[I].Name);

                   for i2:=0 to length(novosdados) - 1 do
                    if uppercase(qry.fielddefs.Items[I].Name) = uppercase(novosdados[i2]) then begin
                        Qry2.ParamByName(qry.fielddefs.Items[I].Name).DataType := qry.fielddefs.Items[I].dataType;
                        Qry2.ParamByName(qry.fielddefs.Items[I].Name).Value    := valoresnovosdados[i2];
                        break;
                    end;

                   If I2 > length(novosdados) - 1 then
                      Qry2.ParamByName(qry.fielddefs.Items[I].Name).Assign(Qry.FieldByName(qry.fielddefs.Items[i].Name));



              end;

              Qry2.Sql.Add('      )                       ' );


              qry2.execsql;

              qry2.free;

end;

Function MensConf(Value : String):Boolean;
Begin
   Result := IIfs(MessageDlg(Value,mtConfirmation, [mbYes, mbNo], 0) = idYes ,True,False);
End;



Procedure DeleteFormaPag(Corpo : THeaderPagRec);
Var Loop : Word;
    FormaPagPesq : TQuery;
    Ativo : Boolean;
Begin
   FormaPagPesq := TQuery.Create(Application);
   FormaPagPesq.DataBaseName := 'bd';

   Try
      With FormaPagPesq Do Begin
            Sql.Clear;
            Sql.Add('DELETE FROM PAGREC                 ');
            Sql.Add(' WHERE Cod_Cli_PagRec = :Cliente   ');
            Sql.Add('   AND PRPEDN         = :Documento AND ORIGEM_PAGREC = :ORIGEM AND Tipo_Cli_PagRec = :TIPO');

            Params[0].AsString  := Corpo.Cliente;
            Params[1].AsString  := Corpo.Pedido;
            Params[2].AsString  := Corpo.Origem;
            Params[3].AsInteger := Corpo.TipoCli;
            ExecSql;
      End;
   Finally
        FormaPagPesq.Destroy;
   End;
End;

Function  RetornaConfiguracoes(Const Campos : array of string):Variant;
var
qry : TQuery;
i   : integer;
begin
   qry := tquery.create(application);
  qry.databasename := 'bd';
    with qry do begin
      sql.clear;
      sql.add('Select');
      sql.add(Campos[0]);
      For i:=1 to Length(Campos) - 1 do
         sql.add(','+campos[i]);
      sql.add('From Configuracao');
      open;

      Result := VarArrayCreate([0,Length(Campos) - 1],VarVariant);

      For i:=0 to Length(Campos) - 1 do
       begin
        if FieldByName(Campos[i]).DataType = ftboolean then
         result[i] :=  FieldByName(Campos[i]).AsBoolean;

        if FieldByName(Campos[i]).DataType = ftMemo then
         result[i] :=  FieldByName(Campos[i]).AsString;

        if FieldByName(Campos[i]).DataType = ftstring then begin
            // Comenter pois todo o sistema esta configurado para receber "(.asstring = 'T')"
            // caso haja algum problema fale comigo .... valdinar....

           //If (FieldByName(Campos[i]).Size  = 1) and ((FieldByName(Campos[i]).AsString = 'T') or (FieldByName(Campos[i]).AsString = 'F') or (FieldByName(Campos[i]).AsString = '')) then
           //  result[i] :=  (FieldByName(Campos[i]).AsString = 'T')
           //else
             result[i] :=  FieldByName(Campos[i]).AsString;
        end;

        if FieldByName(Campos[i]).DataType = ftinteger then
          result[i] :=  FieldByName(Campos[i]).AsInteger;

        if FieldByName(Campos[i]).DataType = ftFloat then
          result[i] :=  FieldByName(Campos[i]).AsFloat;

        if (FieldByName(Campos[i]).DataType = ftDateTime) or (FieldByName(Campos[i]).DataType = ftDate) then
          result[i] :=  FieldByName(Campos[i]).AsDateTime;
      end;
     end;
end;

function  retornavalortotaldogrid(const Operacao:array of  String;
                                  Const Colunas : Array of Integer;Grid:TStringGrid;
                                  LinhaInicial:Integer):Double;
var
i,i2 : integer;
begin

  result := 0.0;
  for i2:=0 to length(colunas) -  1 do
   begin
    for i:=linhainicial to grid.rowcount - 1 do
     begin
         if operacao[i2] = '+' then
          result := result + strtofloatn(grid.cells[colunas[i2],i]);

         if operacao[i2] = '-' then
          result := result - strtofloatn(grid.cells[colunas[i2],i]);

         if operacao[i2] = '*' then
          result := result * strtofloatn(grid.cells[colunas[i2],i]);

         if operacao[i2] = '\' then
          result := result / strtofloatn(grid.cells[colunas[i2],i]);
      end;
   end;



end;

function StrToFloatN(cNumero:String):Double;
begin
  if Trim(cNumero) = '' then
    StrToFloatN := 0
  else
  begin
    while Pos(ThousandSeparator,cNumero) > 0 do
        Delete(cNumero, Pos(ThousandSeparator, cNumero), 1);
    IF cNumero = '_' then
       Result := 0
    else
       Result := StrToFloat(cNumero);
 end;
end;
Procedure MensagemDuplicacao(Duplicado:Boolean;Assunto:String);
begin
   if not duplicado then
    exit;

    ShowMessage(Assunto+' j� existente' +#13+
                'O Sistema n�o permite duplicidade');

    SysUtils.Abort;
end;
Function  RetornaDescricaoGrupoPgto(Codigo:String):String;
var
qry : tquery;
begin
         qry := tquery.create(application);
         qry.databasename := 'bd';
         qry.sql.clear;
         qry.Sql.add('Select Tipo');
         qry.Sql.add('Tipo,Descricao');
         qry.Sql.add('From GrupoPg');
         qry.Sql.add('Where Codigo = :Par_Codigo');
         Qry.ParamByName('Par_Codigo').AsString := Codigo;
         qry.open;

         if (Qry.fieldbyname('Tipo').AsString = 'CHEQUE') then
           result := 'Cheque';

         if (Qry.fieldbyname('Tipo').AsString = 'CARTAO') then
           result := 'Cart�o';

         if (Qry.fieldbyname('Tipo').AsString = 'DINHEI') then
           result := 'Dinheiro';

         if (Qry.fieldbyname('Tipo').AsString = 'OUTROS') then
           result := Qry.FieldByName('Descricao').AsString;

        qry.free;
end;


procedure verificacamposlocal(Origem,Janela:TComponent);
var
loop : integer;
erro : boolean;
begin
     erro := false;
     For Loop := 0 To Janela.ComponentCount -1 Do  Begin
       If  (Janela.Components[Loop] Is  TWinControl) and (Twincontrol(Janela.Components[Loop]).Parent = Origem) then

         If Janela.Components[Loop].Tag Mod 3 = 1 Then Begin
           if (Janela.Components[Loop] Is  TMaskEdit) and (TMaskEdit(Janela.Components[Loop]).Text = '  /  /  ') then
            erro := true
           else if TCustomEdit(Janela.Components[Loop]).Text = '' then
            erro := true;

           If erro Then Begin
               MessageDlg('Informa��o obrigat�ria', mtInformation,[mbOk], 0);
               HabilitaTabSheets(TWinControl(Janela.Components[Loop]));
               If TWinControl(Janela.Components[Loop]).CanFocus Then
                TWinControl(Janela.Components[Loop]).SetFocus;
               Sysutils.abort;
               Exit;
           End;
        End;
     End;

end;

Function  OrigemtoStr(Value:Torigem):String;
begin
 case Value of
  ORC : Result  := 'ORC';
  NTF : Result  := 'NTF';
  FIN : Result  := 'FIN';
  PED : Result  := 'PED';
  COM : Result  := 'COM';
  PDV : Result  := 'PDV';
  DEV : Result  := 'DEV';
  TRF : Result  := 'TRF';
  NTS : Result  := 'NTS';
  SES : Result  := 'SES';
 end;

end;

Function  PagRectoStr(VAlue:TPagouREc):String;
begin
 if Value = Pagamento then
   Result  := 'P'
 else
   Result  := 'R';
end;

Function  StrToOrigem(Origem:String):TOrigem;
begin
  If UpperCase(Origem) =   'ORC' Then  Result  := ORC;
  If UpperCase(Origem) =   'NTF' Then  Result  := NTF;
  If UpperCase(Origem) =   'FIN' Then  Result  := FIN;
  If UpperCase(Origem) =   'PED' Then  Result  := PED;
  If UpperCase(Origem) =   'COM' Then  Result  := COM;
  If UpperCase(Origem) =   'PDV' Then  Result  := PDV;
  If UpperCase(Origem) =   'DEV' Then  Result  := DEV;
  If UpperCase(Origem) =   'TRF' Then  Result  := TRF;
  If UpperCase(Origem) =   'NTS' Then  Result  := NTS;
  If UpperCase(Origem) =   'SES' Then  Result  := SES;

end;

Procedure DeletaDetalhamento(Origem,Documento,CliForn,PagRec:String);
var
qry,qry2 : tquery;
begin
         qry := Tquery.Create(application);
         qry2 := Tquery.Create(application);
         qry2.databasename := 'bd';
         with qry do begin
             databasename := 'bd';
             sql.clear;
             sql.add('Select ContaMov,Sum(VAlor) as Soma From  ChequeFinanceiro');
             sql.add('Where Documento     = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             sql.add('Group By ContaMov');
             open;

             while not eof do begin
                 Qry2.Sql.clear;
                 Qry2.Sql.add('Update  Conta  Set ');
                 qry2.sql.add('SaldoAtual = SaldoAtual  ');
                  if pagrec = 'R' then
                   qry2.sql.add(' -  ')
                  else
                   qry2.sql.add(' +  ');
                 qry2.sql.add('   :Par_Valor');
                 Qry2.Sql.add('Where Cod_Conta   = :Codigo');
                 Qry2.ParamByName('Codigo').AsString        := FieldByName('ContaMov').AsString;
                 qry2.ParamByName('Par_Valor').AsFloat    := FieldByName('Soma').AsFloat;
                 qry2.execsql;
                 qry.Next;
             end;

             sql.clear;
             sql.add('Select ContaMov,Sum(VAlor) as Soma From  OutrosFinanceiro');
             sql.add('Where Documento     = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             sql.add('Group By ContaMov');
             open;

             while not eof do begin
                 Qry2.Sql.clear;
                 Qry2.Sql.add('Update  Conta  Set ');
                 qry2.sql.add('SaldoAtual = SaldoAtual  ');
                  if pagrec = 'R' then
                   qry2.sql.add(' -  ')
                  else
                   qry2.sql.add(' +  ');
                 qry2.sql.add('   :Par_Valor');
                 Qry2.Sql.add('Where Cod_Conta   = :Codigo');
                 Qry2.ParamByName('Codigo').AsString        := FieldByName('ContaMov').AsString;
                 qry2.ParamByName('Par_Valor').AsFloat    := FieldByName('Soma').AsFloat;
                 Qry2.execsql;
                 qry.Next;
             end;

             sql.clear;
             sql.add('Select ContaMov,Sum(VAlor) as Soma From  OutrosFinanceiro');
             sql.add('Where Documento           = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             sql.add('Group By ContaMov');
             open;

             while not eof do begin
                 Qry2.Sql.clear;
                 Qry2.Sql.add('Update  Conta  Set ');
                 qry2.sql.add('SaldoAtual = SaldoAtual  ');
                  if pagrec = 'R' then
                   qry2.sql.add(' -  ')
                  else
                   qry2.sql.add(' +  ');
                 qry2.sql.add('   :Par_Valor');
                 Qry2.Sql.add('Where Cod_Conta   = :Codigo');
                 Qry2.ParamByName('Codigo').AsString      := FieldByName('ContaMov').AsString;
                 qry2.ParamByName('Par_Valor').AsFloat    := FieldByName('Soma').AsFloat;
                 Qry2.execsql;
                 qry.Next;
             end;

             sql.clear;
             sql.add('Delete From  ChequeFinanceiro');
             sql.add('Where Documento     = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             execsql;

             sql.clear;
             sql.add('Delete From  CartaoFinanceiro');
             sql.add('Where Documento     = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             execsql;

             sql.clear;
             sql.add('Delete From  OutrosFinanceiro');
             sql.add('Where Documento     = :Par_Documento');
             sql.add('And   Origem              = :Par_Origem');
             sql.add('And   ClienteFornecedor   = :Par_CliForn');
             sql.add('And   PagRec              = :Par_PagRec');
             ParamByName('Par_Documento').AsString := Documento;
             ParamByName('Par_Origem').AsString    := Origem;
             ParamByName('Par_CliForn').AsString   := Cliforn;
             ParamByName('Par_PagRec').AsString    := Pagrec;
             execsql;

             qry2.free;
             free;
           end;


end;

Function  RetornaSenha(Senha:Array of String):Boolean;
var i:word;
begin
   Frm_SenhaPrecision := Tfrm_SenhaPrecision.Create(Application);
   with Frm_SenhaPrecision do begin
      Try
              result := ShowModal = MrOk;

              If Not Result then
                exit;

               For i:=0 to Length(Senha) - 1 do
                  If (Senha[i] = EdSenha.Text) and (Senha[i] <> '') then
                    break;

               If I = Length(Senha) then
                begin
                  Mensagem('Senha Incorreta');
                  Result := False;
                end;
      finally
        free;
      end;
   end;
end;


Function  RetornaCliForn(CliForn,Codigo:String):String;
var
qry : tquery;
begin
    if ((Cliforn = 'C') or (CliForn = 'R'))
     and (codigo = RetornaConfiguracoes(['ClienteVendaDireta'])[0]) then
       begin
         Result := 'CLIENTE VENDA DIRETA PDV';
         exit;
       end;

    qry := tquery.create(application);
    qry.databasename := 'bd';
    if (CliForn = 'R') or (CliForn = 'C') then
       qry.sql.add('Select Cliente as Descr From Cliente Where Cod_Cliente = :Codigo')
    else  if (CliForn = 'P') or (CliForn = 'F') then
       qry.sql.add('Select Raz_Forn as Descr From AqFornec Where Cod_Forn = :Codigo');
    qry.parambyname('Codigo').AsString := Codigo;
    qry.open;
    Result := Qry.FieldByNAme('Descr').AsString;
    qry.free;
end;

Procedure IncluiParametrosVariant(Parametro:TParam;Valor:Variant);
begin
    if (VarType(Valor) = $0100) or (VarType(Valor) = $0008) then
     if Valor <> '' then begin
       Parametro.AsString   := Valor;
       exit;
     end;


    if (VarType(Valor) = $0003) or (VarType(Valor) = $0002) then
      If Valor <> 0 then begin
         Parametro.AsInteger  := Valor;
         exit;
      end;



    if (VarType(Valor) = $0007)  then
      If Valor <> 0 then begin
        Parametro.AsDateTime  := Valor;
        exit;
      end;

    if VarType(Valor) = $0005 then
      If Valor <> 0 then begin
       Parametro.AsFloat    := Valor;
       exit;
      end;

    if VarType(Valor) = $0006 then
      If Valor <> 0 then begin
        Parametro.AsCurrency := Valor;
        exit;
      end;

    if VarType(Valor) = $000B then begin
       Parametro.AsBoolean := Valor;
       exit;
    end;


//    Parametro.Clear;



 {  varEmpty    = $0000;
  varNull     = $0001;
  varSmallint = $0002;
  varInteger  = $0003;
  varSingle   = $0004;
  varDouble   = $0005;
  varCurrency = $0006;
  varDate     = $0007;
  varOleStr   = $0008;
  varDispatch = $0009;
  varError    = $000A;
  varBoolean  = $000B;
  varVariant  = $000C;
  varUnknown  = $000D;
  varByte     = $0011;
  varStrArg   = $0048;
  varString   = $0100;
  varAny      = $0101;
  varTypeMask = $0FFF;
  varArray    = $2000;
  varByRef    = $4000;}

end;

Function  VariantVaziaInvalida(Valor:Variant):Boolean;
begin
   result := false;
   if (VarType(Valor) <> $0100) and (Valor = '') then begin
      result := true;
      exit;
   end;

   if not(VarType(Valor) in [$0002,$0007,$0003,$0005,$0006]) and (Valor = 0) then begin
      result := true;
      exit;
   end;

end;

Function  VariantVazia(Valor:Variant):Boolean;
begin
   Result := False;

   If VarType(valor) = $0000 then begin
    result := true;
    exit;
   end;

   if (VarType(Valor) = $0100) and (Valor = '') then
    Result := True;

   if (VarType(Valor) in [$0002,$0007,$0003,$0005,$0006]) and (Valor = 0) then
    Result := True;

end;

Procedure LimpaVariantVazia(Valor:Variant);
begin
  If VariantVazia(Valor) then
   Valor := Unassigned;
end;


Function  MascaraCompleta(Mascara,Texto:String):Boolean;
var
i : integer;
mascarabranco:string;
letrasinseridas,Espacos:Word;
begin
     Result := True;
     LetrasInseridas := 0;
     Espacos         := 0;
     mascarabranco :=  FormatMaskText(Mascara,'');

     For i:=1 to Length(Texto) do begin
        If (Copy(texto,i,1) = ' ') and  (I <> Length(Texto)) then
         continue;

        if Copy(Texto,i,1) <> Copy(MascaraBranco,i,1)  then
            inc(letrasinseridas)
        else begin
           If LetrasInseridas = 0 then begin
               Result := False;
               Exit;
           end;

           LetrasInseridas := 0;
        end;

     end;


end;


Function  NomeOrigem(Origem:String):String;
begin
  If UpperCase(Origem) =   'ORC' Then  Result  := 'Or�amento';
  If UpperCase(Origem) =   'NTF' Then  Result  := 'Outras Notas Fiscais';
  If UpperCase(Origem) =   'FIN' Then  Result  := 'Finaceiro';
  If UpperCase(Origem) =   'PED' Then  Result  := 'Pedido';
  If UpperCase(Origem) =   'COM' Then  Result  := 'Compras';
  If UpperCase(Origem) =   'PDV' Then  Result  := 'PDV';
  If UpperCase(Origem) =   'DEV' Then  Result  := 'Devolu��o';
  If UpperCase(Origem) =   'TRF' Then  Result  := 'Transferencia';
  If UpperCase(Origem) =   'NTS' Then  Result  := 'Servi�o';
end;

Function  RetornaEmpresasConsolidadas(Empresa:String):TEmpresasConsolidada;
var
qry : tquery;
begin
//   SetLength(Result,0);
//   Result[0] := Empresa;

   Qry := Tquery.Create(Application);
   with qry do begin
       databasename := 'bd';
       sql.clear;
       sql.add('Select CodEmpasso from EmpAssoc Where CodEmpresa =:Empresa');
       ParamByName('Empresa').AsString := Empresa;
       open;

       while not eof do begin
         SetLength(Result,Length(Result) + 1);
         Result[Length(Result) - 1] := FieldByNAme('CodEmpAsso').AsString;
         qry.next;
       end;

     Destroy;
   end;
end;

Function  SqlEmpresaConsolidada(Empresa,CampoEmpresa:String):String;
var
empassociadas : TEmpresasConsolidada;
i             : Integer;
begin
   Result := CampoEmpresa+'  In    ('''+Empresa+'''';

   EmpAssociadas := RetornaEmpresasConsolidadas(Empresa);

   For i:=0 to Length(EmpAssociadas) - 1 do
     result := result + ','''+EmpAssociadas[i]+'''';

   Result := Result + ' )';
end;

Function  EmpresaValida(Empresa,EmpresaOrigem:String):Boolean;
var
empassociadas : TEmpresasConsolidada;
i             : Integer;
begin
   Result := (empresa = empresaorigem);

   EmpAssociadas := RetornaEmpresasConsolidadas(EmpresaOrigem);

   For i:=0 to Length(EmpAssociadas) - 1 do begin
     if Result then exit;
     result := (empassociadas[i] = Empresa);
   end;



end;

function aumentadia(data:tdatetime;repeticao:integer):string;
var
i : integer;
ano : word;
mes : word;
dia : word;
mes2 : string;
dia2 : string;
begin
  DecodeDate(data,Ano,Mes,Dia);//decodifica a data



   for i:= 1 to repeticao do // define a quantidade de dias que ser� diminuido
    begin
       dia := dia + 1;
       if (mes = 1) or (Mes = 3) or (mes = 5)   or (mes = 7) or
          (mes = 8) or (Mes = 10) or (mes = 12) then//inicia os meses depois dos que tem 31 dias
            begin
               if dia >= 31 then
                 begin
                  If mes = 12 then
                    begin
                     ano := ano + 1;
                     mes := 1;
                    end
                   else
                     mes := mes + 1;

                   dia := 0;
                   repeticao := repeticao + 1;
                 end;
            end;

        if (mes = 4) or (Mes = 6) or (mes = 9)   or (mes = 11) then////inicia os meses depois dos que tem 30 dias
          begin
            if dia >= 30 then
             begin
              dia := 0;
              mes := mes + 1;
              repeticao := repeticao + 1;
             end;
          end;

        if mes = 2 then//fim de fevereiro,verifica se � um ano bissexto
          begin
            if dia >= 28 then
             begin
               if ano mod 4 <> 0 then
                begin
                  dia := 0;
                  mes := mes + 1;
                  repeticao := repeticao + 1;
                end;
             end;

            if dia >= 29 then
             begin
               if ano mod 4 = 0 then
                 begin
                  dia := 0;
                  mes := mes + 1;
                  repeticao := repeticao + 1;
                 end;
             end;
         end;
     end;//fim do for

  if mes = 0 then
   mes := 1;

  if dia = 0 then
   dia := 1;

  if ano = 0 then
   ano := 1;

  if mes > 9 then//coloca  um zero nas vari�veis se for preciso
    mes2 := inttostr(mes)
  else
    mes2 := '0'+inttostr(mes);

  if dia > 9 then//coloca  um zero nas vari�veis se for preciso
    dia2 := inttostr(dia)
  else
    dia2 := '0'+inttostr(dia);

  result := dia2+'/'+mes2+'/'+inttostr(ano);// o resultado vir� nesse formato de data (dd/mm/yyyy)
end;

Function  GetTipoCampoTabela(Tabela,BancoDados,Campo:String):TTipoCampo;
var
qry : tquery;
begin
   Qry := Tquery.Create(Application);
   with qry do begin
    DataBasename := BancoDados;
    sql.clear;
    sql.add('Select '+Campo+'  From  '+Tabela);
    open;
    Result := DataTypeToTTipoCampo(FieldByName(Campo).DataType);
    Destroy;
   end;
end;

Function  TipoCampotoDataType(Value  :TTipoCampo):TFieldType;
begin
    case Value of
        VarString                   : Result := ftstring;
        VarMemo                     : Result := ftmemo;
        VarDate                     : Result := FtDateTime;
        VarCurrency,VarDouble       : Result := FtFloat;
        VarInteger                  : Result := FtInteger;
        VarNull                     : Result := ftUnknown;
    end;
end;



Function VarianttoField(Field:TField;Tipo:TTipoCampo):Variant;
begin
   case Tipo of
        Varstring,VarMemo    :  Result := Field.AsString ;
        VarDate              :  Result := Field.AsDateTime ;
        VarCurrency          :  Result := Field.AsFloat ;
        VarInteger           :  Result := Field.AsInteger ;
   end;
end;

Function  tipocampotovariant(Tipo:TTipoCampo):Integer;
begin
   case Tipo of
        Varstring            :  Result := $0100;
        VarDate              :  Result := $0007;
        VarCurrency          :  Result := $0005;
        VarInteger           :  Result := $0002;
   end;
end;

Procedure CarregaParametro(Valor:Variant;Tipo:Integer;Param:TParam);
begin
   If Tipo = $0100 then
      Param.AsString    := VarAsType(Valor,Tipo);

   If Tipo = $0007 then
      Param.AsDateTime := VarAsType(Valor,Tipo);

   If Tipo = $0005 then
      Param.AsFloat    := VarAsType(Valor,Tipo);

   If Tipo = $0002 then
      Param.AsInteger := VarAsType(Valor,Tipo);
end;

Function  FieldToVariant(Field:Tfield):Variant;
begin
    case Field.DataType of
        ftstring :            Result := Field.AsString;
        FtDateTime  :         Result := Field.AsDateTime;
        FtFloat,FtCurrency  : Result := Field.AsFloat;
        FtInteger           : Result := Field.AsInteger;
    end;
end;
Function  DataTypeToTTipoCampo(Value : TFieldType):TTipoCampo;
begin
    case Value of
        ftstring                  : Result := VarString;
        FtDateTime,FtTime,FtDate  : Result := VarDate;
        FtFloat,FtCurrency        : Result := VarCurrency;
        FtMemo                    : Result := VarMemo;
        FtInteger                 : Result := VarInteger;
    end;
end;

Function  GetIndexChave(Const Campo:String;Var Chaves:TVetorChaves):Integer;
var i:integer;
begin
  Result := -1;


  For i:=0 to Length(Chaves) - 1 do begin
     If Uppercase(Chaves[i].Campo) = Uppercase(Campo) then begin
      Result := I;
      Exit;
     end;
  end;

end;

Procedure TrocaDataSetSession(Var Form:TForm);
var c:integer;
begin
  With Form do begin
     for c := 0 to componentcount-1 do
        if (components[c] is Ttable) Or (components[c] is TQuery) then Begin
           If (components[c] is TTable) Then Begin
                 TTable(components[c]).Close;
                 If Pos('.',TTable(components[c]).TableName) > 0 Then
                     TTable(components[c]).TableName := Copy(TTable(components[c]).TableName,1,Pos('.',TTable(components[c]).TableName)-1);

                 TTable(components[c]).SessionName := 'Default';
                 TTable(components[c]).DatabaseName := 'bd';
           End
           Else If (components[c] is TQuery) Then Begin
                 TQuery(components[c]).Close;
                 TQuery(components[c]).SessionName := 'Default';
                 TQuery(components[c]).DatabaseName := 'bd';
           End;
        End;
  end;
end;


Function  SqlTemWhere(Const Query:TQuery):Boolean;
begin
  Result :=  Pos(' WHERE ',Uppercase(Query.Sql.Text)) > 0;
end;

{Procedure DeletaVetor(Const Vetor:;Indice:Word);
var i,i2:integer;
begin

  If Length(Vetor) = 0 then
   exit;

  For i:=Indice to Length(Vetor) - 2 do
    Vetor[I] := Vetor[I + 1];

  SetLength(Vetor,Length(Vetor - 1))




end;}

Function  DiaDaSemana(Dia:Word):String;
begin
    Case Dia of
       1: Result := 'Domingo';
       2: Result := 'Segunda Feira';
       3: Result := 'Ter�a Feira';
       4: Result := 'Quarta Feira';
       5: Result := 'Quinta Feira';
       6: Result := 'Sexta Feira';
       7: Result := 'S�bado';
    end;


end;

Procedure WhereouAnd(Const Query:Tquery);
begin
  If TemWhereSql(Query.Sql.Text) > 0 then
    Query.sql.add(' And ')
  else
    Query.sql.add(' Where ');
end;


Function TemLetra(Palavra:String):Boolean;
var i:integer;
    vPalavra : String;
begin
  Result := False;
  vPalavra := Trim(Palavra);
  For i:=0 to Length(vPalavra) - 1 do begin
    If Not(vPalavra[I] in ['1'..'9']) then begin
      Result := True;
       Exit;
    end;
  end;
end;

Procedure CompletaData(var Data:String);
var i : integer;
begin
  for i:=0 to length(Data) - 1  do begin
    If (I = 0) and (Data[i] = ' ') then
      data[i] := '0';

    If (Data[i - 1] = '/') and (Data[i] = ' ') then
      data[i] := '0';
  end;
end;

Function DateM:TDateTime;
var
qry : tquery;
begin
   result := date;
   exit;
   
   If DataValidaDM <> 0 Then Begin
       If ((MENSAGEMDATEM = 1) or ((MENSAGEMDATEM = 2) AND (DataValidaDMNao <> Date()))) and 
          (StrtoDate(DateToStr(HoraMLocal)) <  Date()) and
          (StrtoTime(TimeToStr(HoraMLocal)) >= time())
           then Begin
             MENSAGEMDATEM := MensOpcoes('O SISTEMA DETECTOU UMA ALTERA��O NO DIA DA MAQUINA'+#13+
                                         'DESEJA QUE A DATA DO SISTEMA PASSE DE '+#13+
                                          FORMATDATETIME('DD/MM/YY',DataValidaDM)+' PARA '+FORMATDATETIME('DD/MM/YY',DataValidaDMINI + 1),
                                          ['Sim','Perguntar Novamente','N�o']);

             If (MensagemDateM = 0) then begin
                 DataValidaDMINI := DataValidaDMINI + 1;
                 HoraMLocal    := Now();
                 DataValidaDM    := DataValidaDMINI;
                 MENSAGEMDATEM := 1;
             end Else If (MensagemDateM = 2) then
                 DataValidaDMNao := Date();                 
        end;                              
                                                                                  
       Result := DataValidaDM ;
       Exit;
   End;


   Qry := Tquery.Create(Application);
   Try
      with qry do begin
       DataBasename := 'bd';
       sql.clear;
       sql.add('SELECT CURRENT_TIMESTAMP AS DATASIST FROM CONFIGURACAO');
       open;
       If FieldByName('DATASIST').AsString <> '' Then
            Result := StrtoDate(DateToStr(FieldByName('DATASIST').AsDateTime))
       Else
            Result := Date;
      end;

      HoraMLocal    := Now();
      DataValidaDMIni := Result;
      DataValidaDM    := Result;
   Finally
      Qry.Free;
   End;
End;

Procedure LimpalinhaGrid(Grid:TStringGrid;Linha:Word);
Var Loop,Loop2 : Word;
begin

    with grid do begin
      For Loop := Linha To RowCount Do begin
          Rows[Loop].Clear;
        For Loop2 := FixedCols To ColCount-1 Do
             Cells[Loop2,Loop] := Cells[Loop2,Loop+1];
      end;

        If RowCount-1 > FixedRows Then Begin
             Rows[RowCount -1].Clear;
             RowCount := RowCount -1;
         End
         Else
              Rows[RowCount-1].Clear;
     end;

end;

Procedure PreencheGrid(Grid:TStringGrid;DataSet:TDataSet;NCampos:Array of Word);
var i,i2,i3,pulacoluna : integer;
begin
 with DataSet do begin
   PulaColuna := 0;
   LimpaGrid(Grid);
   while not eof do begin
      For i:=Grid.FixedCols to Grid.ColCount - 1 do begin
        If I > FieldDefs.Count - 1 then
         break;

        for i2:=0 to length(NCampos) - 1 do
          if NCampos[i2] >= PulaColuna + I then
            PulaColuna := PulaColuna + 1;

        I3 := PulaColuna + I;
        If FieldByName(fielddefs.Items[I3].Name).DataType in [ftFloat,FtCurrency] then
           Grid.Cells[I,Grid.RowCount - 1] := FormatFloat('#,##0.00',FieldByName(fielddefs.Items[I3].Name).AsFloat)
        else If FieldByName(fielddefs.Items[I3].Name).DataType in [ftdate,ftdatetime]   then
           Grid.Cells[I,Grid.RowCount - 1] := FormatDateTime('dd/mm/yy',FieldByName(fielddefs.Items[I3].Name).AsDateTime)
        else Grid.Cells[I,Grid.RowCount - 1] := FieldByName(fielddefs.Items[I3].Name).AsString;

      end;
      PulaColuna := 0;
      next;
      if not eof then
        Grid.RowCount := Grid.RowCount + 1;
   end;
 end;
end;

Function  VerificaDuplicidadeGrid(Grid:TStringGrid;Const Colunas:Array of Word):Boolean;
var
i,i2 : integer;
begin
   result := false;
   with grid do begin
     for i:=fixedrows to rowcount - 1 do begin
         if i = row then
          continue;
         for i2:=0 to length(Colunas) - 1 do
           if Cells[Colunas[I2],I] <> Cells[Colunas[I2],Row] then
             break;

         If i2 > length(Colunas) - 1 then begin
           Result := True;
           exit;
         end;
     end;
   end;
end;

Procedure VariantToParams(Params:TParam;Value:Variant);
begin
  Params.DataType  := VarTypetoDataType(VarType(Value));
  Params.Value    := Value;
end;

Function  GetValueObject(Objeto:TControl):String;
begin
   Result := '';
   If Objeto Is TDbEdit Then begin
      result := TdbEdit(Objeto).DataSource.DataSet.FieldByName(TdbEdit(Objeto).DataField).AsString;
      exit;
    end
   else If Objeto Is TCustomEdit Then begin
      If (Objeto Is TMaskEdit) and (TMaskEdit(Objeto).Text = FormatMaskText(TMaskEdit(Objeto).EditMask,'')) then
        exit;   
      Result :=  TCustomEdit(Objeto).Text;
   end Else If Objeto Is TPanel Then
    result :=  TPanel(Objeto).Caption
   Else If Objeto Is TLabel Then
    result :=  TLabel(Objeto).Caption
   Else If Objeto Is TStringGrid Then
    result :=  TStringGrid(Objeto).Cells[TStringGrid(Objeto).Col,TStringGrid(Objeto).Row]
   Else If Objeto Is TComboSql Then
    result :=  VarToStr(TComboSql(Objeto).ValorRetorno)
   Else If (Objeto Is TCheckControle) and (TCheckControle(Objeto).ValorChecado <> '') Then
    result :=  iifs(TCheckBox(Objeto).Checked,TCheckControle(Objeto).ValorChecado,TCheckControle(Objeto).ValorNaoChecado)
   Else If Objeto Is TCheckBox Then
    result :=  iifs(TCheckBox(Objeto).Checked,'T','F')
   Else If Objeto Is TComboBox Then
    result :=  TComboBox(Objeto).Text;

end;


Procedure  SetValueObject(Objeto:TControl;Value:Variant);
begin
   If Objeto Is TDbEdit Then begin
      TdbEdit(Objeto).DataSource.DataSet.FieldByName(TdbEdit(Objeto).DataField).Value := Value;
      exit;
    end
   else If Objeto Is TCustomEdit Then
      TCustomEdit(Objeto).Text := VartoStr(Value)
   Else If Objeto Is TPanel Then
      TPanel(Objeto).Caption := VartoStr(Value)
   Else If Objeto Is TLabel Then
      TLabel(Objeto).Caption := VartoStr(Value)
   Else If Objeto Is TStringGrid Then
    TStringGrid(Objeto).Cells[TStringGrid(Objeto).Col,TStringGrid(Objeto).Row] := VartoStr(Value)
   Else If Objeto Is TCheckControle Then
     TCheckControle(Objeto).Checked := (Value = Varastype(TCheckControle(Objeto).ValorChecado,VarType(Value)))
   Else If Objeto Is TCheckBox Then
     TCheckBox(Objeto).Checked := VarAsType(Value,System.VarBoolean)
   Else If Objeto Is TComboSql Then
     TComboSql(Objeto).ValorChave(VarAsType(Value,Tipocampotovariant(TComboSql(Objeto).TipoCampo)))
   Else If Objeto Is TComboBox Then
     TComboBox(Objeto).Text := VartoStr(Value);
end;

Function   DataBancodados(Data:TDateTime):String;
var ano,dia,mes:word;
    mesaux:string;
begin

   decodedate(data,ano,mes,dia);
   case mes of
    1:mesaux := 'JAN';
    2:mesaux := 'FEB';
    3:mesaux := 'MAR';
    4:mesaux := 'APR';
    5:mesaux := 'MAY';
    6:mesaux := 'JUN';
    7:mesaux := 'JUL';
    8:mesaux := 'AUG';
    9:mesaux := 'SEP';
    10:mesaux := 'OCT';
    11:mesaux := 'NOV';
    12:mesaux := 'DEC';
   end;

  Result := inttostr(Dia)+'-'+mesaux+'-'+inttostr(ano);

end;

Procedure MensP(Value :Boolean;Value2:String);
Begin
     If Value Then Begin
        If FrmMensPisca = Nil Then
           FrmMensPisca := TFrmMensPisca.Create(Application);
        FrmMensPisca.Mensagem.Caption := Value2;
        FrmMensPisca.Show;
        Application.ProcessMessages;
     End
     Else If FrmMensPisca <> Nil Then Begin
        FrmMensPisca.Close;
        FrmMensPisca.Destroy;
        FrmMensPisca := Nil;
     End;
End;

Function   FormatDateTimeM(Mascara:String;Data:TdateTime):String;
begin
  If (Data = 0) then
     Result := ''
  else
     Result := FormatDateTime(Mascara,Data);
end;
Function  StrtoIntN(Valor:String):Integer;
begin
  If trim(Valor) = ''  then
   Result := 0
  else
   Result := StrtoInt(Trim(Valor));
end;


{Function DadosEmail:TDadosEmail;
var
qry : tquery;
begin

   Qry := Tquery.Create(Application);
      with qry do begin
           DataBasename := 'bd';
           sql.clear;
           sql.add('SELECT Loginusuario,UsuarioEmail,PortaEmail,Host FROM CONFIGURACAO');
           open;

           If (FieldBYName('LoginUsuario').AsString <> '') and
              (FieldBYName('UsuarioEmail').AsString <> '') and
              (FieldBYName('Host').AsString <> '') and
              (FieldBYName('PortaEmail').AsString <> '') Then begin
                 Result.Host := FieldBYName('Host').AsString;
                 Result.usuario := FieldBYName('usuarioemail').AsString;
                 Result.Password := FieldBYName('LoginUsuario').AsString;
                 Result.Porta := FieldBYName('PortaEmail').AsString;
                 Qry.Destroy;
                 Exit;
              end;

           Frm_DadosEmail := Tfrm_DadosEmail.Create(application);

           Try
             Frm_DadosEmail.Host.Text:= FieldBYName('Host').AsString;
             Frm_DadosEmail.loginusuario.Text := FieldBYName('usuarioemail').AsString;
             Frm_DadosEmail.Password.Text := FieldBYName('LoginUsuario').AsString;
             Frm_DadosEmail.Porta.Text := FieldBYName('PortaEmail').AsString;

             If Frm_DadosEmail.ShowModal = MrOk then Begin
               Result.Host := Frm_DadosEmail.Host.Text ;
               Result.usuario:= Frm_DadosEmail.loginusuario.Text ;
               Result.Password:= Frm_DadosEmail.Password.Text;
               Result.Porta := Frm_DadosEmail.Porta.Text ;
             end else SysUtils.Abort;


            Finally
             Frm_DadosEmail.Free;
             Qry.Destroy;
           end;

      end;


end;}

Function  DiferencaMes(DataFinal,DataInicial:TDate):Word;
var
FData:TDateTime;
begin
     Result := 0;
     If datafinal = Datainicial then
       Exit;

     FData  := Datainicial;
     While datafinal > Datainicial do begin
       DataInicial := IncMonth(FDATA,Result);
       Inc(result);
     end;

     If datafinal <= Datainicial then
      Result := Result - 1;
end;


function TrocaResolucao(X, Y: word): Boolean;
var lpDevMode: TDeviceMode;
begin
  if EnumDisplaySettings(nil, 0, lpDevMode) then
  begin
    lpDevMode.dmFields := DM_PELSWIDTH Or DM_PELSHEIGHT;

    lpDevMode.dmPelsWidth := X;
    lpDevMode.dmPelsHeight:= Y;

    Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
  end;
end;


Procedure ClearControls(FControl:TWinControl;ClearParent:Boolean);
Var loop2,loop3,Loop : Integer;
Begin

         For Loop := 0 To FControl.ControlCount -1 Do  Begin
                 If ClearParent and (FControl.Controls[Loop] is TWinControl) and  (TwinControl(FControl.Controls[Loop]).ControlCount <> 0) then
                   ClearControls(TWinControl(FControl.Controls[Loop]),True);

                 If FControl.Controls[Loop].Tag Mod 2 = 1 Then Begin
                       If FControl.Controls[Loop] Is TCustomEdit Then
                          TCustomEdit(FControl.Controls[Loop]).Clear
                       Else If FControl.Controls[Loop] Is TPanel Then
                          TPanel(FControl.Controls[Loop]).Caption := ''
                       Else If FControl.Controls[Loop] Is TCheckBox Then
                          TCheckBox(FControl.Controls[Loop]).Checked := False
                       Else If FControl.Controls[Loop] Is TGridControl Then
                          TGridControl(FControl.Controls[Loop]).Limpa
                       Else If FControl.Controls[Loop] Is TCustomComboBox Then
                          TCustomComboBox(FControl.Controls[Loop]).ItemIndex := -1
                       Else If FControl.Controls[Loop] Is TCustomMemo Then
                          TCustomMemo(FControl.Controls[Loop]).Lines.Clear;
                 End;
         End;
End;
function inttomonth(mes: integer): string;
{recebe como parametro 1 e retorna janeiro}
begin
     if mes = 1 then
        result := 'Janeiro'
     else if mes = 2 then
          result := 'Fevereiro'
     else if mes = 3 then
          result := 'Mar�o'
     else if mes = 4 then
          result := 'Abril'
     else if mes = 5 then
          result := 'Maio'
     else if mes = 6 then
          result := 'Junho'
     else if mes = 7 then
          result := 'Julho'
     else if mes = 8 then
          result := 'Agosto'
     else if mes = 9 then
          result := 'Setembro'
     else if mes = 10 then
          result := 'Outubro'
     else if mes = 11 then
          result := 'Novembro'
     else if mes = 12 then
          result := 'Dezembro';
end;
Function ColocaClic(Value : String) : String;
Var Position : Word;
    Retorno : String;
Begin
     Retorno := '''';
     For Position := 1 To Length(Value) Do Begin

         If Value[Position] = ',' Then
             Retorno := Retorno + '''';

         Retorno := Retorno + Value[Position];

         If Value[Position] = ',' Then
             Retorno := Retorno + '''';
    End;
    Result := Retorno+'''';
End;


function NomeComputador : String;
var
  lpBuffer : PChar;
  nSize : DWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

function PadL(sVar:String; nTam:Byte; sAdic:String):String;
begin
  if sAdic = '' then sAdic := ' ';
  while Length(sVar) < nTam do Insert(sAdic,sVar,1);
  Result := Copy(sVar,1,nTam);
end;

function PadR(sVar:String; nTam:Byte; sAdic:String):String;
begin
  if sAdic = '' then sAdic := ' ';
  while Length(sVar) < nTam do sVar := sVar + sAdic;
  Result := Copy(sVar,1,nTam);
end;

function PadC(sVar:String; nTam:Byte; sAdic:String):String;
var nDiv: Byte;
begin
  try
    if sAdic = '' then sAdic := ' ';
    nDiv   := StrToInt(FloatToStr(Int( (nTam-Length(sVar)) / 2)));
    sVar   := PadL(sAdic,nDiv,sAdic) + sVar + PadL(sAdic,nDiv,sAdic);
  finally
    Result := Copy(sVar+sAdic,1,nTam);
  end;
end;

Procedure CriaMenu(Var Arvore:TTreeView;Dados:TDadosCriaMenu);
Var Loop : Word;
    MyTreeNode1: TTreeNode;
    Objeto : PMyRec;
    FDados : TDadosCriaMenu;
begin
  With Dados do begin
        If Not Menu.Visible  Then
           Exit;

           If Menu.Parent <> Nil then begin
                  New(Objeto);
                  Objeto^.Nome   := Menu.Caption ;
                  Objeto^.Codigo := Menu.Tag;
                  Objeto^.Filhos := Iifs(Menu.Count > 0,True,False);
                  Objeto^.Click  := Menu.OnClick;
                  Objeto^.Menu   := Menu;

                  If Direitos <> Nil then begin
                      Direitos.CodMenu := Menu.Tag;
                      Direitos.Recupera;
                      Objeto^.Direitos := Direitos.Direitos;
                  end;

                  If Origem = Nil then
                     MyTreeNode1 := Arvore.Items.AddObject(Nil,Menu.Caption,Objeto)
                  else
                     MyTreeNode1 := Arvore.Items.AddChildObject(Origem,Menu.Caption,Objeto) ;


                  MyTreeNode1.ImageIndex     := IIfs(Menu.ImageIndex <> -1,Menu.ImageIndex,0);
                  MyTreeNode1.SelectedIndex  := MyTreeNode1.ImageIndex;
          end;

          If (Dados.Menu.Count > 0) and CriaSubMenu Then begin
             For Loop := 0 To Dados.Menu.Count - 1 Do
               If Menu.Items[Loop].Visible  Then begin
                     FDados            := Dados;
                     If dados.Menu.Parent <> Nil then
                        FDados.Origem  :=  MyTreeNode1
                     else
                        FDados.Origem  :=  Nil;
                     FDados.SubMenu    := True;
                     FDados.Menu       := Dados.Menu.Items[Loop];
                     CriaMenu(Arvore,FDados);
               end;
          end;

   End;
end;
Procedure FocusSemOnExit(FFocus:Twincontrol);
Var
FOnExit:TNotifyEvent;
FFocus2:TWincontrol;
begin
   If (FFocus = Nil) or Not (FFocus.Canfocus) or Not(FFocus.Owner is TForm) then
    Exit;

   FFocus2 := Tform(FFocus.Owner).ActiveControl;
   FOnExit := Tedit(FFocus2).OnExit;
   TEdit(FFocus2).OnExit := Nil;
   FFocus.SetFocus;
   TEdit(FFocus2).OnExit := FonExit;




end;

Function ConvDataType(Value :TFieldType):String;
Begin
      If Value =  ftUnknown         Then Result := 'ftUnknown'      Else
      If Value =  ftString          Then Result :=  'ftString'     Else
      If Value =  ftSmallint        Then Result :=  'ftSmallint'     Else
      If Value =  ftInteger         Then Result :=  'ftInteger'     Else
      If Value =  ftWord            Then Result :=  'ftWord'     Else
      If Value =  ftBoolean         Then Result :=  'ftBoolean'     Else
      If Value =  ftFloat           Then Result :=  'ftFloat'     Else
      If Value =  ftCurrency        Then Result :=  'ftCurrency'     Else
      If Value =  ftBCD             Then Result :=  'ftBCD'     Else
      If Value =  ftDate            Then Result :=  'ftDate'     Else
      If Value =  ftTime            Then Result :=  'ftTime'     Else
      If Value =  ftDateTime        Then Result :=  'ftDateTime'     Else
      If Value =  ftBytes           Then Result :=  'ftBytes'     Else
      If Value =  ftVarBytes        Then Result :=  'ftVarBytes'     Else
      If Value =  ftAutoInc         Then Result :=  'ftAutoInc'     Else
      If Value =  ftBlob            Then Result :=  'ftBlob'     Else
      If Value =  ftMemo            Then Result :=  'ftMemo'     Else
      If Value =  ftGraphic         Then Result :=  'ftGraphic'     Else
      If Value =  ftFmtMemo         Then Result :=  'ftFmtMemo'     Else
      If Value =  ftParadoxOle      Then Result :=  'ftParadoxOle'   Else
      If Value =  ftDBaseOle        Then Result :=  'ftDBaseOle'     Else
      If Value =  ftTypedBinary     Then Result :=  'ftTypedBinary'  Else
      If Value =  ftCursor          Then Result :=  'ftCursor'  Else
      If Value =  ftFixedChar       Then Result :=  'ftFixedChar'  Else
      If Value =  ftWideString      Then Result :=  'ftWideString'  Else
      If Value =  ftLargeint        Then Result :=  'ftLargeint'  Else
      If Value =  ftADT             Then Result :=  'ftADT'  Else
      If Value =  ftArray           Then Result :=  'ftArray'  Else
      If Value =  ftReference       Then Result :=  'ftReference'  Else
      If Value =  ftDataSet         Then Result :=  'ftDataSet'  Else
      If Value =  ftOraBlob         Then Result :=  'ftOraBlob'  Else
      If Value =  ftOraClob         Then Result :=  'ftOraClob'  Else
      If Value =  ftVariant         Then Result :=  'ftVariant'  Else
      If Value =  ftInterface       Then Result :=  'ftInterface'  Else
      If Value =  ftIDispatch       Then Result :=  'ftIDispatch'  Else
      If Value =  ftGuid            Then Result :=  'ftGuid'  ;
End;

Function StrtoDataType(Value :String):TFieldType;
Begin
      If Value =  'ftUnknown'       Then Result := ftUnknown         Else
      If Value =  'ftString'      Then Result := ftString          Else
      If Value =  'ftSmallint'      Then Result := ftSmallint        Else
      If Value =  'ftInteger'      Then Result := ftInteger         Else
      If Value =  'ftWord'      Then Result := ftWord            Else
      If Value =  'ftBoolean'      Then Result := ftBoolean         Else
      If Value =  'ftFloat'      Then Result := ftFloat           Else
      If Value =  'ftCurrency'      Then Result := ftCurrency        Else
      If Value =  'ftBCD'      Then Result := ftBCD             Else
      If Value =  'ftDate'      Then Result := ftDate            Else
      If Value =  'ftTime'      Then Result := ftTime            Else
      If Value =  'ftDateTime'      Then Result := ftDateTime        Else
      If Value =  'ftBytes'      Then Result := ftBytes           Else
      If Value =  'ftVarBytes'      Then Result := ftVarBytes        Else
      If Value =  'ftAutoInc'      Then Result := ftAutoInc         Else
      If Value =  'ftBlob'      Then Result := ftBlob            Else
      If Value =  'ftMemo'      Then Result := ftMemo            Else
      If Value =  'ftGraphic'      Then Result := ftGraphic         Else
      If Value =  'ftFmtMemo'      Then Result := ftFmtMemo         Else
      If Value =  'ftParadoxOle'    Then Result := ftParadoxOle      Else
      If Value =  'ftDBaseOle'      Then Result := ftDBaseOle        Else
      If Value =  'ftTypedBinary'   Then Result := ftTypedBinary     Else
      If Value =  'ftCursor'   Then Result := ftCursor          Else
      If Value =  'ftFixedChar'   Then Result := ftFixedChar       Else
      If Value =  'ftWideString'   Then Result := ftWideString      Else
      If Value =  'ftLargeint'   Then Result := ftLargeint        Else
      If Value =  'ftADT'   Then Result := ftADT             Else
      If Value =  'ftArray'   Then Result := ftArray           Else
      If Value =  'ftReference'   Then Result := ftReference       Else
      If Value =  'ftDataSet'   Then Result := ftDataSet         Else
      If Value =  'ftOraBlob'   Then Result := ftOraBlob         Else
      If Value =  'ftOraClob'   Then Result := ftOraClob         Else
      If Value =  'ftVariant'   Then Result := ftVariant         Else
      If Value =  'ftInterface'   Then Result := ftInterface       Else
      If Value =  'ftIDispatch'   Then Result := ftIDispatch       Else
      If Value =  'ftGuid'   Then Result := ftGuid            ;
End;



Function ConvDataSize(Value :TFieldType;Tamanho : Word):Word;
Begin
      Result := 0;
      If Value =  ftUnknown         Then   Else
      If Value =  ftString          Then Result := Tamanho  Else
      If Value =  ftSmallint        Then Result := 10  Else
      If Value =  ftInteger         Then Result := 10   Else
      If Value =  ftWord            Then Result := 10   Else
      If Value =  ftBoolean         Then Result := 5   Else
      If Value =  ftFloat           Then Result := 18   Else
      If Value =  ftCurrency        Then Result := 18   Else
      If Value =  ftBCD             Then   Else
      If Value =  ftDate            Then Result := 10   Else
      If Value =  ftTime            Then Result := 8   Else
      If Value =  ftDateTime        Then Result := 18   Else
      If Value =  ftBytes           Then Result := 1   Else
      If Value =  ftVarBytes        Then   Else
      If Value =  ftAutoInc         Then   Else
      If Value =  ftBlob            Then   Else
      If Value =  ftMemo            Then   Else
      If Value =  ftGraphic         Then   Else
      If Value =  ftFmtMemo         Then   Else
      If Value =  ftParadoxOle      Then   Else
      If Value =  ftDBaseOle        Then   Else
      If Value =  ftTypedBinary     Then   Else
      If Value =  ftCursor          Then   Else
      If Value =  ftFixedChar       Then   Else
      If Value =  ftWideString      Then   Else
      If Value =  ftLargeint        Then   Else
      If Value =  ftADT             Then   Else
      If Value =  ftArray           Then   Else
      If Value =  ftReference       Then   Else
      If Value =  ftDataSet         Then   Else
      If Value =  ftOraBlob         Then   Else
      If Value =  ftOraClob         Then   Else
      If Value =  ftVariant         Then   Else
      If Value =  ftInterface       Then   Else
      If Value =  ftIDispatch       Then   Else
      If Value =  ftGuid            Then   ;
End;
                                                                        
function DataTypeToVarType(FDatatype:TFieldType):Variant;
begin
  case FDataType of
     ftSmallInt               : Result := System.varSmallint;
     ftInteger                : Result := System.varInteger;
     ftBCD                    : Result := System.varCurrency;
     ftFloat                  : Result := System.varSingle;
     ftTime,ftDate,ftDateTime : Result := System.varDate;
     ftBoolean                : Result := System.varBoolean;
     ftString,FtMemo          : Result := System.varString;
  else
     Result := VarUnknown;
  end;

  Result := VarType(Result);
end;
function LimpaMascara(FValue:String):String;
var i:word;
begin
   Result := FValue;

   for i:=Length(Result) downto 1 do
     If (Result[I] <> '') and  Not(UpCase(Result[I]) in ['A'..'Z']) and Not(Result[I] in ['0'..'9']) then
       System.Delete(Result,I,1);




end;
Procedure TiraEspacos(Control:TWinControl);
var
i,i2:word;
begin
   for i:=0 to Control.controlcount - 1 do
    If Control.controls[i].Visible then begin
       Control.controls[i].Left := 0;
      for i2:=0 to Control.controlcount - 1 do
                 if (Twincontrol(Control.controls[i2]).TabOrder < Twincontrol(Control.controls[i]).TabOrder) and Control.controls[i2].Visible  then
            Control.controls[i].Left := Control.controls[i].Left + Control.controls[i2].Width;
    end;
end;


Function   ValidaInventario(Almoxarifado,Produto:String;Data:TDateTime):Boolean;
var
qry : tquery;
begin
         qry := tquery.create(application);
         qry.databasename := 'BD';
         with qry do begin
                   sql.clear;
                   sql.add('Select CodProd_ivent');
                   sql.add('From');
                   sql.add('ItemInventario');
                   sql.add('Where  Almox_Ivent     = :Almox');
                   sql.add('and    CodProd_Ivent   = :Prod');
                   sql.add('and    ((Status_Ivent    <> ''S'' and DtAber_Ivent <=:Data)');
                   sql.add('or      (Status_Ivent    = ''S''  and Data_Ivent    >=:Data)) ');
                   Parambyname('Almox').AsString    := Almoxarifado;
                   Parambyname('Prod').AsString     := Produto;
                   Parambyname('Data').AsDateTime   := Data;
                   open;
                   result := Qry.Eof;
                   Destroy;
        end;
end;

Function  LinhaDuplicadaGrid(Grid:TStringGrid;Colunas:Array of Integer;Valores:Array of String;niND:Integer=-1):Integer;
var
i,i2 : integer;
begin
   result := -1;
   with grid do begin
     for i:=fixedrows to rowcount - 1 do begin
         if (nind > -1) and (nind = i) then
          continue;
          
         for i2:=0 to length(Colunas) - 1 do
           if Cells[Colunas[I2],I] <> Valores[I2] then
             break;

          If i2 > length(Colunas) - 1 then begin
             Result := I;
             exit;
          end;
     end;
   end;
end;

Function  DivideMemo(Value:String):TStringList;
var i:word;
begin
  Result := TStringList.Create;
  Result.Text := Value;

  {  While Pos(#$D#$A,Value) > 0 do begin
      Result.Add(Copy(Value,1,Pos(#$D#$A,Value) - 1));
      System.Delete(Value,1,Pos(#$D#$A,Value) + 5);
  end;
  Result.Add(Value);}
end;

Function  StrtoTipoCodBarra(Value:String):TTipo;
begin
  If Value = 'EAN13' then
    Result :=   cdEAN13
  else if Value = 'EAN8' then
    Result :=   cdEAN8
  else if Value = 'EAN11' then
    Result :=   cdEAN11
  else if Value = 'UPC' then
    Result :=   cdUPC
  else if Value = '2de5' then
    Result :=   cd2de5
  else if Value = '3de9' then
    Result :=   cd3x9
end;


Function  TipoCodBarratoStr(Value:TTipo):String;
begin
  If Value = CDEAN13  then
    Result :=   'EAN13'
  else if Value = CDEAN8  then
    Result :=   'EAN8'
  else if Value = CDEAN11  then
    Result :=   'EAN11'
  else if Value = CDUPC  then
    Result :=   'UPC'
  else if Value = CD2de5  then
    Result :=   '2de5'
  else if Value = CD3X9  then
    Result :=   '3x9'
end;

Function  VerificaCodBarras(Tipo:TTipo;Value:String):Boolean;
var FValue:String;
    FDigito:String;
begin
    DigitoPEG := '';
    If Tipo = cdEAN13 Then begin
      If Length(Value) = 13 then begin
         Fvalue    := DefineEAN13(Copy(Value,1,Length(Value) - 1));
         If DigitoPeg <> Copy(Value,Length(Value) - 1,1) then
           FValue := 'Erro';
      end else
         Fvalue    := DefineEAN13(Value);
    end else if Tipo = cdEAN8 Then begin
      If Length(Value) = 8 then begin
         Fvalue    := DefineEAN8(Copy(Value,1,Length(Value) - 1));
         If DigitoPeg <> Copy(Value,Length(Value) - 1,1) then
           FValue := 'Erro';
      end else
         Fvalue    := DefineEAN8(Value);
    end else if Tipo = cdEAN11 Then begin
      If Length(Value) = 11 then begin
         Fvalue    := DefineEAN11(Copy(Value,1,Length(Value) - 1));
         If DigitoPeg <> Copy(Value,Length(Value) - 1,1) then
           FValue := 'Erro';
      end else
         Fvalue    := DefineEAN11(Value);
    end else if Tipo = cdUPC Then begin
      If Length(Value) = 12 then begin
         Fvalue    := DefineUpc(Copy(Value,1,Length(Value) - 1));
         If DigitoPeg <> Copy(Value,Length(Value) - 1,1) then
           FValue := 'Erro';
      end else
         Fvalue    := DefineUpc(Value);
    end else if Tipo = cd2de5 Then
        FValue  :=  Define2de5(Value)
    else if Tipo = cd3x9 Then
        FValue  :=  Define3x9(Value);
    Result := FValue <> 'Erro';
end;

Function  NextFocus(Control:TWinControl):TWinControl;
var FControl:TWincontrol;
    FList:TList;
    I,I2:Word;
Begin
    If Control = nil then
      exit;

    Try
        FList := TList.Create;
//        GetListTabOrderClient(TWinControl(Control.Owner),FList,True);
        TWincontrol(Control.Owner).GetTabOrderList(FList);
        Result := Nil;
        I      := Flist.IndexOf(Control) + 1;
        For I:=0 to FList.Count - 1 do  
             If  (TWincontrol(FList[I]).Parent <> Control)
             and (Flist.IndexOf(Flist[I]) > Flist.IndexOf(Control))
             and (TWinControl(FList[I]).CanFocus)
             and (TWinControl(FList[I]).TabStop)
             and (TWinControl(FList[I]).DockClientCount = 0)  then begin
                   Result := FList[I];
                   Exit;
             end;
    Finally
       Flist.Destroy;
    end;

end;

Procedure  GetListTabOrderClient(FControl:TWinControl;Var FLista:TList;SoHabilitados:Boolean);
var
ListTabOrder:TList;
I:Word;
begin
    If (FControl = Nil) or (Not(FControl is TCustomForm) and (SoHabilitados and  (Not FControl.CanFocus or Not FControl.TabStop))) then
     exit;

    Try
        ListTabOrder := TList.Create;
        If Not(FControl is TCustomForm) And (FControl.DockClientCount = 0) then begin
            FLista.Add(FControl)
        end else begin
            FControl.GetTabOrderList(ListTabOrder);
            If ListTabOrder.count > 0 then
              For i:=0 to ListTabOrder.Count - 1 do
                GetListTabOrderClient(TWinControl(ListTabOrder[I]),FLista,SoHabilitados);
        end;
    Finally
        ListTabOrder.destroy;
    end;
end;

Function  LinesCanvas(FCanvas:TCanvas;Texto:String;Tamanho:Word;AutoSize:Boolean):TStringList;
Var
Palavra:String;
I,I2:Word;
begin
   Result := TStringList.Create;
   Result.Add('');
   I := 1;
   While I <= Length(Texto) do begin
         Palavra := '';
         If AutoSize and (Texto[I] <> ' ') then begin
             for i2:=I to Length(Texto)  do begin
                 If Texto[i2] = ' ' then
                   Break;
                 Palavra := Palavra + Texto[i2];
             end;
         end else  Palavra := Texto[I];


         If FCanvas.TextWidth(Result[Result.Count - 1]) +
            FCanvas.TextWidth(Palavra)  > Tamanho then
              Result.Add('');
         Result[Result.Count - 1] := Result[Result.Count - 1] + Palavra;
         I := I + Length(Palavra);
   end;


end;
Function  PosField(Sql:TStrings;FField:String;DataBase:String='Bd'):Word;
var FList:TStrings;
begin
       Result := 0;

       If FField = '' then
        exit;

       While Pos('.',FField) > 0 do
         System.Delete(FField,1,1);

       FList := ListIndexField(Sql,DataBase);

       If Flist = Nil Then
        exit;
      try
        Result := FList.IndexOf(FField) + 1;
      Finally
        FList.Destroy;
      end;
end;

Function  ListIndexField(Sql:TStrings;DataBase:String='Bd'):TStringList;
var I,I2,QParenteses:Word;
    FSql:String;
begin
       Result := TStringList.Create;

       If (Sql = Nil) or (Sql.Count = 0) then
        exit;

       If POS('SELECT*FROM',UpperCase(ValidaCharacteres([' '],StringstoStr(Sql.Text),False))) = 1 Then begin
         Result := ListFullField(Sql,DataBase);
         exit;
       end;

       For i:=0 to Sql.Count - 1 do
         Fsql := FSql +IIfs(I = 0,'',' ')+UpperCase(Sql[I]);

       System.Delete(FSql,Pos('SELECT',FSql),6);

       I := 1;

       QParenteses := 0;


       While  I <= Length(FSql) do begin
             If (Copy(Fsql,I,1) = '(') then
                Inc(QParenteses)
             else if (Qparenteses > 0) and (Copy(Fsql,I,1) = ')') then
                QParenteses := QParenteses - 1;


             If (QParenteses > 0) then begin
                 Inc(I);
                 Continue;
             end;

             If (FSql[I] = ' ')  then begin
                Inc(I);
                If Copy(FSql,I,3) = 'AS ' then
                  I := I + 3;
                continue;
             end;


             If (FSql[I] = ',') or (Copy(Fsql,I - 1,6) = ' FROM ') then begin
                 Result.Add('');
                 I2 := I - 1;
                 While (I2 > 0) and (FSql[I2] <> '.') and
                       Not((FSql[I2] = ' ') and (Result[Result.count - 1] <> '')) and
                       (FSql[I2] <> ',') do begin
                         If (FSql[I2] <> ' ')  then
                          Result[Result.count - 1] := FSql[I2] + Result[Result.count - 1];
                         I2 := I2 - 1;
                 end;

                 If (Copy(Fsql,I - 1,6) = ' FROM ') then
                   exit;
             end;

             Inc(I);
       end;
end;


Procedure DataBaseParamstoCellsGrid(FGrid:TStringGrid;FParams:TStrings;ColPar,ColVal:Smallint);
var I,I2:Word;
begin
   LimpaGrid(FGrid);

   If (FParams.Text = '') then
    exit;

   For i:=0 to FParams.Count - 1 do begin
        For i2:=1 to Length(FParams[I]) do
         If Pos('=',FParams[I]) <> i2 then
           FGrid.Cells[IIfs(Pos('=',FParams[I]) > i2,ColPar,ColVal),FGrid.RowCount - 1] :=
           FGrid.Cells[IIfs(Pos('=',FParams[I]) > i2,ColPar,ColVal),FGrid.RowCount - 1]  +
           Copy(FParams[I],I2,1);

        If I <> FParams.Count - 1 then
          FGrid.RowCount := FGrid.RowCount + 1;
   end;
end;


Function  CellsGridtoDataBaseParams(FGrid:TStringGrid;ColPar,ColVal:Smallint):String;
Var I:Word;
begin
    Result := '';
    For I:=1 to FGrid.RowCount - 1 do begin
        If FGrid.Cells[ColPar,i] = '' then
         continue;

        Result := Result+FGrid.Cells[ColPar,i]+'='+FGrid.Cells[ColVal,i];
        If I <> FGrid.RowCount - 1 Then
         Result := Result+' '+#$D#$A;
    end;
end;

Function  DivStrings(FStrings:TStrings;FDiv,BA:String):TStrings;
var i,i2:word;
StringVAzia:Boolean;
begin
    Result := TStrings.Create;
    For I:=0 to FStrings.Count - 1 do begin
          StringVazia := True;

          If Pos(Fdiv,FStrings[i]) = 0 then
           continue;

          For i2:=1 to length(FStrings[i]) do begin
            If ((BA = 'B') and (Pos(Fdiv,FStrings[i]) > i2)) OR
               ((BA = 'A') and (Pos(Fdiv,FStrings[i]) < i2)) then begin
                  If StringVazia then begin
                      StringVazia := False;
                      Result.Add('');
                  end;
                  Result[Result.count - 1] := Result[Result.count - 1] + Copy(FStrings[I],i2,1);
               end;
          end;
    end;
end;

Function  ValidaExpr(P1,P2:Variant;Operacao:String):Boolean;
begin
    Result := False;


    If (StrTiraEspaco(UpperCase(Operacao)) <> 'NOTNULL') and
       (StrTiraEspaco(UpperCase(Operacao)) <> 'ISNULL')   and
       (UpperCase(Operacao)                <> 'IN')  then
         P2 := VarAsType(P2,VarType(P1));

    If (Operacao = '=') and (P1 = P2) then
      Result := True
    else If (Operacao = '>=') and (P1 >= P2) then
      Result := True
    else If (Operacao = '<=') and (P1 <= P2) then
      Result := True
    else If (Operacao = '>') and (P1 >  P2) then
      Result := True
    else If (Operacao = '<') and (P1 <  P2) then
      Result := True
    else If (Operacao = '<>') and (P1 <>  P2) then
      Result := True
    else If (UpperCase(Operacao) = 'LIKE') and (Pos(p2,P1) > 0) then
      Result := True
    else If (UpperCase(Operacao) = 'NOTLIKE') and (Pos(p2,P1) <= 0) then
      Result := True
    else If (StrTiraEspaco(UpperCase(Operacao)) = 'ISNULL') and VarIsNull(P1)  then
      Result := True
    else If (StrTiraEspaco(UpperCase(Operacao)) = 'NOTNULL') and Not VarIsNull(P1) then
      Result := True
    else If (UpperCase(Operacao) = 'IN')  then begin
         P1 := VarToStr(P1);
         If (((P1 = P2) and  (Pos(',',P2) = 0)) or (Pos(','+P1,P2) > 0) or (Pos(P1+',',P2) > 0)) then
           Result := True
    end;
end;

Function  StrTiraEspaco(Value:String):String;
begin
  Result := Trim(Value);

  While pos(' ',Result) > 0 do
    System.delete(Result,pos(' ',Result),1);
end;

Function RetCredito(Empresa,PagRec,Cliforn:String;Data:TDateTime) : TCredito;
Var FPesquisa : TQuery;
Begin

    Result.Utilizado := 0;
    Result.Total     := 0;
    Result.Valida    := False;

    FPesquisa := TQuery.Create(Application);
    FPesquisa.DataBaseName := 'bd';
    Try
    With FPesquisa Do Begin
           SQL.ADD('Select Sum(Valor) as Total,F.CREDITO,F.RETORNOCREDITO');
           SQL.ADD('from OutrosFinanceiro O');
           SQL.ADD('LEFT JOIN FORMAPG F ON (F.CODIGO = O.FORMAPG)');
           SQL.ADD('Where  clientefornecedor = :CliForn');
           SQL.ADD('And    PagRec = :PagRec');
           IF EMPRESA <> '' THEN
             SQL.ADD('AND  '+SqlEmpresaConsolidada(Empresa,'Empresa'));
           SQL.ADD('AND    (F.CREDITO = ''T'' OR F.RETORNOCREDITO = ''T'')');
           ParamByName('Cliforn').AsString   := Cliforn;
           ParamByName('PagRec').AsString    := PagRec;

           IF DATA <> 0 THEN BEGIN
              SQL.ADD('AND   EMISSAO <= :DATA');
              ParamByName('Data').AsDAteTime := Data;
           END;
           SQL.ADD('AND    CLIFORNPRINCIPAL   = CLIENTEFORNECEDOR');
           SQL.ADD('AND    ORIGEMPRINCIPAL    = ORIGEM');
           SQL.ADD('AND    CAIXAPRINCIPAL     = CAIXA');
           SQL.ADD('AND    DOCUMENTOPRINCIPAL = DOCUMENTO');
           SQL.ADD('GROUP BY F.CREDITO,F.RETORNOCREDITO');
           open;
           WHILE NOT EOF DO BEGIN
              IF FIELDBYNAME('CREDITO').ASSTRING = 'T' THEN
               Result.Total     := FieldByName('TOTAL').AsCurrency
              ELSE IF FIELDBYNAME('RETORNOCREDITO').ASSTRING = 'T' THEN
               Result.UTILIZADO := FieldByName('TOTAL').AsCurrency;
              NEXT;
           END;
           Result.Valida   := Result.Total > Result.Utilizado;
     End;
     Finally
        FPesquisa.Free;
     End;
End;

Function  RetLimiteCredito(Empresa,PagRec,Cliforn:String;Data:TDateTime;VAlueIni:Currency;QtdeIni:Word):TCredito;
Var FPesquisa,FPesquisa2 : TQuery;
Begin
     Result.Total         := 0;
     Result.Utilizado     := 0;
     Result.Quantidade    := 0;
     Result.QtdeUtilizada := 0;
     Result.BloqueiaFat   := False;
     Result.Valida        := True;

     FPesquisa := TQuery.Create(Application);
     FPesquisa.DataBaseName := 'bd';
     FPesquisa2 := TQuery.Create(Application);
     FPesquisa2.DataBaseName := 'bd';
     Try
     With FPesquisa Do Begin
        with Fpesquisa2 do begin
            Sql.Clear;
            Sql.Add('SELECT Empresa,TotalEmpresas,DATALIMITE,VALOR,DATAVALIDADE,Quantidade,BloqueiaFaturamento FROM LIMITECREDITO');
            sql.add('WHERE CLIENTE = :CODCLI AND FLAG =:FLAG');
            sql.add('And (Empresa =:Empresa or Empresa = '''')');
            sql.add('Order By 1 Desc,2');
            Params[0].AsString := CliForn;
            Params[1].AsString := IIFs(PagRec = 'R','C','F');
            Params[2].AsString := Empresa;
            Open;

            If Eof then
              exit;
        end;

        Sql.Clear;
        Sql.Add('SELECT  SUM(VALOR) AS TOTAL,Count(*) AS QTDE ');
        Sql.Add('FROM CARTAOFINANCEIRO');
        Sql.Add('WHERE (Empresa =:PEmpresa or :PEmpresa = Cast('''' as Varchar(8))) and CARTAOFINANCEIRO.PAGREC = :PagRec AND CARTAOFINANCEIRO.CLIENTEFORNECEDOR = :CODCLI');
        sql.add('And CARTAOFINANCEIRO.DATA <= :Emissao');
        sql.add('And (Data >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
        sql.add('And (Data <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
        sql.add('And (Select LIMITE_CRED from formaPg Where Codigo = CARTAOFinanceiro.FormaPg) = ''S''');
        sql.add('And CARTAOFINANCEIRO.ClifornPrincipal = CARTAOFINANCEIRO.ClienteFornecedor and CARTAOFINANCEIRO.OrigemPrincipal = CARTAOFINANCEIRO.Origem');
        sql.add('And CARTAOFINANCEIRO.CaixaPrincipal = CARTAOFINANCEIRO.Caixa and CARTAOFINANCEIRO.DocumentoPrincipal = CARTAOFINANCEIRO.Documento');
        Sql.Add('AND (CARTAOFINANCEIRO.COMPENSACAO IS NULL OR (CARTAOFINANCEIRO.COMPENSACAO IS NOT NULL AND CARTAOFINANCEIRO.CANCELAMENTO IS NOT Null ');
        sql.add('AND NOT EXISTS(Select DOCUMENTO from substdetal where Empresa = CartaoFinanceiro.Empresa');
        sql.add('And ClienteFornecedor = CartaoFinanceiro.clifornprincipal');
        sql.add('And Origem            = CartaoFinanceiro.OrigemPrincipal');
        sql.add('And Caixa             = CartaoFinanceiro.CaixaPrincipal');
        sql.add('And Documento         = CartaoFinanceiro.DocumentoPrincipal');
        sql.add('And FPagOrg           = CartaoFinanceiro.FormaPg');
        sql.add('And IndSubst          = CartaoFinanceiro.IndSubst');
        sql.add('And BancoOrg  = CartaoFinanceiro.Operadora and AgenciaOrg = CartaoFinanceiro.Autorizacao And  NumeroOrg = CartaoFinanceiro.Numero)');
        Sql.add('))');


        Sql.Add('UNION ALL');

        Sql.Add('SELECT  SUM(VALOR) AS TOTAL,Count(*) AS QTDE ');
        Sql.Add('FROM CHEQUEFINANCEIRO');
        Sql.Add('WHERE  (Empresa =:PEmpresa or :Pempresa = Cast('''' as VarChar(8))) and CHEQUEFINANCEIRO.PAGREC = :PagRec AND CHEQUEFINANCEIRO.CLIENTEFORNECEDOR = :CODCLI');
        sql.add('And CHEQUEFINANCEIRO.Emissao <= :Emissao');
        sql.add('And (Emissao >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
        sql.add('And (Emissao <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
        sql.add('And (Select LIMITE_CRED from formaPg Where Codigo = ChequeFinanceiro.FormaPg) = ''S''');
        sql.add('And CHEQUEFINANCEIRO.ClifornPrincipal = CHEQUEFINANCEIRO.ClienteFornecedor and CHEQUEFINANCEIRO.OrigemPrincipal = CHEQUEFINANCEIRO.Origem');
        sql.add('And CHEQUEFINANCEIRO.CaixaPrincipal = CHEQUEFINANCEIRO.Caixa and CHEQUEFINANCEIRO.DocumentoPrincipal = CHEQUEFINANCEIRO.Documento');
        Sql.Add('AND (CHEQUEFINANCEIRO.COMPENSACAO IS NULL OR (CHEQUEFINANCEIRO.COMPENSACAO IS NOT NULL AND CHEQUEFINANCEIRO.CANCELAMENTO IS NOT Null ');
        sql.add('AND NOT EXISTS(Select DOCUMENTO from substdetal where Empresa = ChequeFinanceiro.Empresa');
        sql.add('And ClienteFornecedor = ChequeFinanceiro.clifornprincipal');
        sql.add('And Origem            = ChequeFinanceiro.OrigemPrincipal');
        sql.add('And Caixa             = ChequeFinanceiro.CaixaPrincipal');
        sql.add('And Documento         = ChequeFinanceiro.DocumentoPrincipal');
        sql.add('And FPagOrg           = ChequeFinanceiro.FormaPg');
        sql.add('And IndSubst          = ChequeFinanceiro.IndSubst');
        sql.add('And BancoOrg  = ChequeFinanceiro.Banco and AgenciaOrg = ChequeFinanceiro.Agencia and ContaOrg = ChequeFinanceiro.Conta and TalaoOrg = ChequeFinanceiro.Talao and NumeroOrg = ChequeFinanceiro.Numero)');
        Sql.add('))');

        Sql.Add('UNION ALL');

        Sql.Add('SELECT  SUM(VALOR) AS TOTAL,Count(*) AS QTDE ');
        Sql.Add('FROM OUTROSFINANCEIRO');
        Sql.Add('WHERE (Empresa =:PEmpresa or :Pempresa = Cast('''' as VarChar(8))) and OUTROSFINANCEIRO.PAGREC = :PagRec AND OUTROSFINANCEIRO.CLIENTEFORNECEDOR = :CODCLI');
        sql.add('And OUTROSFINANCEIRO.Emissao <= :Emissao');
        sql.add('And (Select LIMITE_CRED from formaPg Where Codigo = OUTROSFinanceiro.FormaPg) = ''S''');
        sql.add('And (Emissao >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
        sql.add('And (Emissao <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
        sql.add('And OUTROSFINANCEIRO.ClifornPrincipal = OUTROSFINANCEIRO.ClienteFornecedor and OUTROSFINANCEIRO.OrigemPrincipal = OUTROSFINANCEIRO.Origem');
        sql.add('And OUTROSFINANCEIRO.CaixaPrincipal = OUTROSFINANCEIRO.Caixa and OUTROSFINANCEIRO.DocumentoPrincipal = OUTROSFINANCEIRO.Documento');
        Sql.Add('AND (OUTROSFINANCEIRO.COMPENSACAO IS NULL OR (OUTROSFINANCEIRO.COMPENSACAO IS NOT NULL AND OUTROSFINANCEIRO.CANCELAMENTO IS NOT Null ');
        sql.add('AND NOT EXISTS(Select DOCUMENTO from substdetal where Empresa = OutrosFinanceiro.Empresa');
        sql.add('And ClienteFornecedor = OutrosFinanceiro.clifornprincipal');
        sql.add('And Origem            = OutrosFinanceiro.OrigemPrincipal');
        sql.add('And Caixa             = OutrosFinanceiro.CaixaPrincipal');
        sql.add('And Documento         = OutrosFinanceiro.DocumentoPrincipal');
        sql.add('And FPagOrg           = OutrosFinanceiro.FormaPg');
        sql.add('And IndSubst          = OutrosFinanceiro.IndSubst');
        sql.add('And NumeroOrg         = OutrosFinanceiro.Numero)');
        Sql.add('))');

        Sql.Add('UNION ALL');
        If PagRec = 'R' then begin
             Sql.Add('SELECT  SUM(VLEMIT_PAGREC) AS TOTAL,Count(*) AS QTDE');
             Sql.Add('FROM PAGREC');
             Sql.Add('WHERE (Empresa_PagRec =:PEmpresa or :Pempresa = Cast('''' as VarChar(8))) and COD_CLI_PAGREC = :CODCLI  ');
             sql.add('And (DtDocEmi_PagRec >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
             sql.add('And (DtDocEmi_PagRec <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
             Sql.Add('AND (SELECT LIMITE_CRED FROM CONDPAG WHERE CODIGO = PAGREC.CONDPAG_PAGREC) = ''S'' ');
             sql.add('And DtDocEmi_PagRec <= :Emissao')
        end else begin
             Sql.Add('SELECT  SUM(VLEMIT_PAG) AS TOTAL,Count(*) AS QTDE');
             Sql.Add('FROM PAGAMENT');
             Sql.Add('WHERE (Empresa_Pag =:PEmpresa or :Pempresa = Cast('''' as VarChar(8))) and COD_FORN_PAG = :CODCLI  ');
             sql.add('And (DtDocEmi_Pag <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
             sql.add('And (DtDocEmi_Pag >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
             Sql.Add('AND (SELECT LIMITE_CRED FROM CONDPAG WHERE CODIGO = PAGAMENT.CONDPAG_PAG) = ''S'' ');
             sql.add('And DtDocEmi_Pag <= :Emissao');
        end;

        Sql.Add('UNION ALL');

        Sql.Add('SELECT  SUM(TOTPED_PED) AS TOTAL,Count(*) AS QTDE');
        Sql.Add('FROM PEDIDO');
        Sql.Add('WHERE (CdEmpresa =:PEmpresa or :Pempresa = Cast('''' as VarChar(8))) and CODCLI_PED = :CODCLI  ');
        Sql.Add('AND   (SELECT LtCRED FROM tipodeoperacao WHERE CODIGO = Pedido.Operacao_Ped) = ''S'' ');
        sql.add('And   Dt_Ped  <=:Emissao');
        sql.add('And   (Dt_Ped >=:InicioCred   or :InicioCred = ''31-DEC-1899'')');
        sql.add('And   (Dt_Ped <=:ValidadeCred or :ValidadeCred = ''31-DEC-1899'')');
        sql.add('And   (Financeiro <> ''S'' or Financeiro is null)');

        ParamByName('CODCLI').AsString    := CliForn;
        ParamByName('PagRec').AsString    := PagRec;
        ParamByName('EMISSAO').AsDateTime := Data;

        While Not FPesquisa2.eof do begin
            If  (ParamByName('PEmpresa').AsString <> '')
             and (FPesquisa2.FieldByName('Empresa').AsString = '')
             and  Not FPesquisa2.FieldByName('TotalEmpresas').AsBoolean then begin
                 Fpesquisa2.Next;
                 Continue;
             end;

             Result.Total         := FPesquisa2.FieldByName('Valor').AsFloat;
             Result.Quantidade    := FPesquisa2.FieldByName('Quantidade').AsInteger;
             Result.BloqueiaFat   := FPesquisa2.FieldByName('BloqueiaFaturamento').AsBoolean;
             Result.Utilizado     := ValueIni;
             Result.QtdeUtilizada := QtdeIni;


             close;

             If Not FPesquisa2.FieldByName('TotalEmpresas').AsBoolean then
                ParamByName('PEmpresa').AsString := Empresa
             else
                ParamByName('PEmpresa').AsString := '';

             If FPesquisa2.FieldByName('DATALIMITE').AsDateTime > 0 then
                ParamByName('InicioCred').AsDateTime := FPesquisa2.FieldByName('DATALIMITE').AsDateTime
             else
                ParamByName('InicioCred').AsString   := '31-DEC-1899';

             If FPesquisa2.FieldByName('DATAVALIDADE').AsDateTime > 0 then
                ParamByName('ValidadeCred').AsDateTime := FPesquisa2.FieldByName('DATAVALIDADE').AsDateTime
             else
                ParamByName('ValidadeCred').AsString   := '31-DEC-1899';

             Open;

             While Not Eof Do Begin
               Result.QtdeUtilizada  := Result.QtdeUtilizada + FieldByName('Qtde').AsInteger;
               Result.Utilizado      := Result.Utilizado     + FieldByName('TOTAL').AsCurrency;
               Next;
             End;

             If ((Result.Total > 0) and (Result.Utilizado > Result.Total)) or ((Result.QtdeUtilizada > Result.Quantidade) and (Result.Quantidade > 0)) Then begin
               Result.Valida := False;
               break;
             end;

             FPesquisa2.Next;
         end;

         If Not Result.Valida then
           If ((Result.QtdeUtilizada > Result.Quantidade) and (Result.Quantidade > 0)) Then
                Result.Mensagem   :=  IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM A QUANTIDADE DO LIMITE DE CR�DITO ULTRAPASSADA '+#13+#10+
                                      'QUANTIDADE LIMITE'+PadL(FloatToStr(Result.Quantidade),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM A QUANTIDADE DO LIMITE DE CR�DITO ULTRAPASSADA') * 2 - 19,' ')+#13+#10+
                                      'QUANTIDADE EM ABERTO'+PadL(FloatToStr(Result.QtdeUtilizada),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM A QUANTIDADE DO LIMITE DE CR�DITO ULTRAPASSADA')  * 2 - 27,' ')+#13+#10+
                                      'DIFEREN�A'+PadL(FloattoStr(Result.QtdeUtilizada - Result.Quantidade),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM A QUANTIDADE DO LIMITE DE CR�DITO ULTRAPASSADA') * 2 - 27,' ')
           else if ((Result.Total > 0) and (Result.Utilizado > Result.Total)) then
                Result.Mensagem   :=  IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM LIMITE DE CR�DITO ULTRAPASSADO '+#13+#10+
                                      'LIMITE'+PadL(FormatFloat('#,##0.00',Result.Total),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM LIMITE DE CR�DITO ULTRAPASSADO') * 2 - 19,' ')+#13+#10+
                                      'EM ABERTO'+PadL(FormatFloat('#,##0.00',Result.Utilizado),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM LIMITE DE CR�DITO ULTRAPASSADO')  * 2 - 27,' ')+#13+#10+
                                      'DIFEREN�A'+PadL(FormatFloat('#,##0.00',Result.Utilizado - Result.Total),Length(IIfs(PagRec = 'R','CLIENTE','FORNECEDOR')+' COM LIMITE DE CR�DITO ULTRAPASSADO') * 2 - 27,' ');

     End;
     Finally
        FPesquisa.Destroy;
        FPesquisa2.Destroy;
     End;
end;

Function  IntToStrCodBarra(Codigo:Double;Tipo:TTipo):String;
begin
    Result := '';
    If Tipo = cdEAN13 Then
      Result := ZeroEsquerda(Codigo,12)
   else if Tipo = cdEAN8 Then
      Result := ZeroEsquerda(Codigo,7)
   else if Tipo = cdEAN11 Then
      Result := ZeroEsquerda(Codigo,10)
   else if Tipo = cdUPC Then
      Result := ZeroEsquerda(Codigo,11)
end;

Function  TrocaUnPalavra(Value,Origem,Destino:String;Find:integer=0):String;
var Fini,FFim:String;
    OldInd:String;
begin
    Result := IIfs(Find = 0,Value,Copy(Value,Find + 1,Length(Value)));
    oldind := Copy(Value,1,Find);

    If pos(UpperCase(Origem),UpperCase(Result)) > 0 then begin
       Fini   := Copy(Result,1,pos(UpperCase(Origem),UpperCase(Result)) - 1);
       FFim   := Copy(Result,pos(UpperCase(Origem),UpperCase(Result)) + Length(Origem),Length(Result) - pos(UpperCase(Origem),UpperCase(Result)) - Length(Origem) + 1);
       Result := Fini + Destino + FFim;
    end;
    if Find > 0  Then
     Result := OldInd + result;
end;

Function TrocaPalavra(Value,Origem,Destino:String;Find:integer=0):String;
var FIni,VValue,FFim:String;
    v,z,oldind,ind:integer;
    FOldInd:String;
begin

    Result := IIfs(FInd = 0,Value,Copy(Value,FInd + 1,Length(Value)));
    Foldind := Copy(Value,1,FInd);

    Ind    := 1;
    while pos(UpperCase(Origem),UpperCase(Copy(Result,Ind,Length(Result)))) > 0 do begin
     oldind := ind;
     ind    := iifs(Ind > 1,Length(Copy(Result,1,OldInd - 1)),0)+pos(UpperCase(Origem),UpperCase(Copy(Result,Ind,Length(Result)))) + Length(Destino);
     Result := Copy(Result,1,OldInd - 1)+
               TrocaUnPalavra(Copy(Result,OldInd,Length(Result)),Origem,Destino);
    end;
    if Find > 0  Then
     Result := FOldInd + result;
end;

Function  TrocaPalavras(Value:String;Origens,Destinos:Array of String):String;
var i:Word;
begin
   Result := Value;
   If Length(Origens) > 0 then
     For i:=0 to Length(Origens) - 1 do
       Result := TrocaPalavra(Result,Origens[i],Destinos[i]);
end;

Function TrocaPalavrasSL(Value:TStrings;Origens,Destinos:Array of String):TStringList;
var I:Word;
begin
 Result := TStringList.Create;
 For i:=0 to Value.Count - 1 do
  Result.Add(TrocaPalavras(Value[I],Origens,Destinos));
end;

Function  StrtoDateN(Value:String):TDateTime;
begin
    If ValidaCharacteres(['0'..'9'],Value,True) = '' then
        result := 0
    else
      try
         result :=StrtoDateTime(Value);
      except
         result := 0;
      end;
end;

Function  DivLimiteString(Value:String;Tam:LongInt):TStringList;
var I,I2:Word;
    FPalavra:String;
begin
     result       := TStringList.Create;
     If (Tam <= 0) or (Value = '') then begin
        Result.Text  := Value;
        exit;
     end;

     I := 1;
     Result.Add('');
     While I <= Length(Value) do begin
           if (Value[i] = ' ') then begin
                FPalavra := '';
                For I2:=I + 1 to Length(Value) do
                  if (Value[i2] = ' ') then
                    Break
                  else
                    FPalavra := FPalavra + Value[i2];

                 if (Length(Result[Result.count - 1]) + Length(FPalavra) + 1) > Tam then
                    Result.Add('');
           end;

           Result[Result.count - 1] := Result[Result.count - 1] + Value[i];
           If (Length(Result[Result.count - 1]) >= Tam) and (I <> Length(Value)) then
             Result.Add('');
           Inc(I);
    end;
end;

Procedure DivLimiteStrings(Var Value:TStringList;Tam:LongInt);
var i,i2,i3:Integer;
    FStrings:TStrings;
begin
   for i:=Value.count - 1 downto 0  do begin
        FStrings := DivLimiteString(Value[I],Tam);
        If Fstrings.count > 1 then begin
               Value[I] := FStrings[0];
                for i2:=1 to FStrings.Count - 1 do
                  Value.insert(i2 + I,FStrings[i2]);
        end;
   end;
end;

Function  TiraEspacosEsq(Value:String):String;
var i,Qtd:word;
begin
     Result := Value;
     qtd    := 0;
     For i:=1 to Length(Result) do
       If Copy(Result,I,1) = ' ' then
         Inc(Qtd)
       else
         Break;

     If Qtd > 0 then
       System.Delete(Result,1,Qtd);
end;

Function  TiraEspacosDir(Value:String):String;
var i,Qtd:word;
begin
     Result := Value;
     qtd    := 0;
     For i:=Length(Result) - 1 downto 0  do
       If Copy(Result,I,1) = ' ' then
         Inc(Qtd)
       else
         Break;

     If Qtd > 0 then
       System.Delete(Result,Length(Result) - Qtd + 1,Qtd);
end;

Function  TiraEspacosCent(Value:String):String;
begin
  Result := TiraEspacosEsq(Value)+TiraEspacosDir(Value);
end;

function CHEK_CGC(var_cgc:string):boolean;
(*confere o digito verificador do cgc*)
var
   t,i,j,sub_tot:integer;

begin
     While Pos('.',var_cgc) > 0 Do Delete(var_cgc,Pos('.',var_cgc),1);
     While Pos('-',var_cgc) > 0 Do Delete(var_cgc,Pos('-',var_cgc),1);
     While Pos('/',var_cgc) > 0 Do Delete(var_cgc,Pos('/',var_cgc),1);

     If Length(Var_Cgc) <> 14 then begin
       Result := False;
       exit;
     end;

     CHEK_CGC:=true;
     j:=2;
     sub_tot:=0;
     for i:=12 downto 1 do
         begin
         if j>9 then
            j:=2;
         sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
         j:=j+1;
         end;
     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cgc[13]) then
        CHEK_CGC:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=13 downto 1 do
             begin
             if j>9 then
                j:=2;
             sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
             j:=j+1;
             end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cgc[14]) then
            CHEK_CGC:=false;

         end;
end;


function CHEK_CPF(var_cpf:string):boolean;
(*confere o digito verificador do cpf*)
var
   i,j,sub_tot:integer;
begin
     While Pos('.',var_cpf) > 0  Do Delete(var_cpf,Pos('.',var_cpf),1);
     While Pos('-',var_cpf) > 0  Do Delete(var_cpf,Pos('-',var_cpf),1);
     While Pos('/',var_cpf) > 0  Do Delete(var_cpf,Pos('/',var_cpf),1);

     If Length(Var_Cpf) <> 11 then begin
       Result := False;
       exit;
     end;


     CHEK_CPF:=true;
     sub_tot:=0;
     j:=2;
     for i:=9 downto 1 do
         begin
         sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
         j:=j+1
         end;

     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cpf[10]) then
        CHEK_CPF:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=10 downto 1 do
             begin
             sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
             j:=j+1;
             end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cpf[11]) then
            CHEK_CPF:=false;

         end;
end;

Function  ValidaCharacteres(Characteres:TSetChar;Palavra:String;InPalavra:Boolean;VNew:String=''):String;
var i:word;
begin
  Result := '';
  For i:=1 to Length(Palavra) do
   If ((Palavra[i] in Characteres) and InPalavra) or
      (Not(Palavra[i] in Characteres) and Not InPalavra)then
        Result := Result + Palavra[i]
   else if Vnew <> '' Then
        Result := Result + VNew;
end;
Function  SoNumero(Palavra:String):String;
begin
   result :=  ValidaCharacteres(['0'..'9'],Palavra,True);
end;

Procedure AllOnExit(Janela : TWinControl;Objeto:TWinControl);
Var Loop : Word;
    Saltar : Boolean;
    Flist  : TList;
Begin
     FList := TList.create;
     Try
         Janela.GetTaborderlist(Flist);
         For Loop:=Flist.IndexOf(Objeto) + 1  To Flist.Count - 1 Do
              If TWinControl(Flist[Loop]) is TEditcontrole  then
                  TEditcontrole(Flist[Loop]).DoExit
              ELSE If (TWinControl(Flist[Loop]) is TMaskEdit) and Assigned(TMaskEdit(Flist[Loop]).OnExit) then
                  TMaskEdit(Flist[Loop]).OnExit(Flist[Loop])
              ELSE If (TWinControl(Flist[Loop]) is TEdit) and Assigned(TEdit(Flist[Loop]).OnExit) then
                  TEdit(Flist[Loop]).OnExit(Flist[Loop])
              else If (TWinControl(Flist[Loop]) is TComboBox) and Assigned(TComboBox(Flist[Loop]).OnExit) then
                  TComboBox(Flist[Loop]).OnExit(Flist[Loop])
              else If (TWinControl(Flist[Loop]) is TStringGrid) and Assigned(TStringGrid(Flist[Loop]).OnExit) then
                  TStringGrid(Flist[Loop]).OnExit(Flist[Loop])
              else If (TWinControl(Flist[Loop]) is TCheckBox) and Assigned(TCheckBox(Flist[Loop]).OnClick) then
                  TCheckBox(Flist[Loop]).OnClick(Flist[Loop])
              else If (TWinControl(Flist[Loop]) is TPanel) and Assigned(TPanel(Flist[Loop]).OnExit) then
                  TPanel(Flist[Loop]).OnExit(Flist[Loop])
              else If (TWinControl(Flist[Loop]) is TMemo) and Assigned(TMemo(Flist[Loop]).OnExit) then
                  TMemo(Flist[Loop]).OnExit(Flist[Loop]);
     finally
         FList.Destroy;
     end;

End;
Function  VerArqPath(Value:String):String;
begin
  result := value;
  If copy(value,1,3) = '../' then begin
    System.Delete(Result,1,3);
    Result := ExtractFilePath(Application.ExeName)+Result;
  end;
end;


Function  CopiaPasta(cFrom,CTo:String;B:Boolean):Boolean;
var
 OpStruc : TSHFileOpStruct;
 frombuf, tobuf : array[0..128] of Char;
begin
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, cFrom);
 StrPCopy(tobuf, cTo);
 with OpStruc do
  begin
   Wnd := Application.Handle;
   wFunc := FO_COPY;
   pFrom := @frombuf;
   pTo := @tobuf;
   fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted := False;
   hNameMappings := nil;
   lpszProgressTitle := nil;
  end; // with
  ShFileOperation(OpStruc);
end;

Function  CopiaArquivo(cFrom,CTo:String;B:Boolean):Boolean;
var
  Dados: TSHFileOpStruct;
  Teste : Integer;
  p: pchar;
begin
    If B then
      DeleteFile(PChar(CTo+'\'+ExtractFileName(CFrom)));

    FillChar(Dados,SizeOf(Dados), 0);
    with Dados do
    begin
      wFunc := FO_MOVE;
      pFrom := PChar(CFrom);
      pTo := PChar(CTo);
      fFlags:= FOF_ALLOWUNDO;
    end;
    Result := SHFileOperation(Dados) = 0;
    If Not Result then
       If MensConf('N�o foi poss�vel copiar o arquivo '+#13+Cfrom+' para '+Cto+#13+
                  'Deseja Repetir a C�pia ?') then
                    Result := CopiaArquivo(cFrom,CTo,B);

    {    Result := CopyFile(PCHar(CFrom),PChar(Cto),True);
    If Not Result then
      If MensConf('N�o foi poss�vel copiar o arquivo '+#13+Cfrom+' para '+Cto+#13+
                  'Deseja Repetir a C�pia ?') then
                    Result := CopiaArquivo(cFrom,CTo,B);}
end;

Function  ValidaArquivo(Value:String):String;
var
FDir:String;
begin
    Result := Value;
    While (Pos(':',Result) > -1) and (copy(Result,Pos(':',Result) + 1,1) <> '\') do
      Result := Copy(Result,Pos(':',Result)+ 1,Length(Result));
end;

Function  DeletaArquivos(Path:String):Integer;
var i:word;
    SR: TSearchRec;
    Count:Word;
    FPastas:Array of String;
begin
  try
    I := FindFirst(Path+'\*.*',faAnyFile,SR);
    While I = 0 do begin
        if (Sr.Attr and faDirectory = faDirectory) then begin
           If (Sr.Name <> '.') and (Sr.Name <> '..') then begin
              deletaarquivos(Path+'\'+Sr.Name);
              SetLength(FPastas,Length(FPastas) + 1);
              FPastas[Length(FPastas) - 1] := Path+'\'+Sr.Name;
           end;
         end else
             SysUtils.deletefile(Path+'\'+Sr.Name);
        I := FindNext(SR);
    end;
  finally
    SysUtils.Findclose(Sr);
    If Length(FPastas) > 0 then
      for i:=0 to Length(FPastas) - 1 do
        RemoveDir(FPastas[I]);
  end;
end;

Function  DeletaPasta(Path:String):Integer;
var
 OpStruc : TSHFileOpStruct;
 pathbuf: array[0..128] of Char;
begin
 FillChar(OpStruc, SizeOf(OpStruc), 0);
 with OpStruc do
  begin
    wFunc := FO_DELETE;
    pFrom := PChar(Path);
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  end; // with
  ShFileOperation(OpStruc);
end;

Function  MensOpcoes(mensagem:String;Opcoes:Array of String;find:integer=0;enables:string='';vertical:boolean=false;tempoerro:integer=0):Integer;
var
FFrmOpcao:TFrmOpcao;
i2,I,FLeft:integer;
oldheight,totwidth:integer;
maiorwidth:integer;
oldfont:tfont;
f:boolean;
fstart:cardinal;
begin
  FrmOpcao := TFrmOpcao.Create(application);
  totwidth := 0;
  maiorwidth := 0;
  Try
    With FrmOpcao do begin
         LbMensagem.Caption := Mensagem;


         for i:=Length(Opcoes) - 1 downto 0 do begin
            TBitBtn.Create(FrmOpcao).Name := 'ButtonOpcao'+IntToStr(I);
            With TBitBtn(FrmOpcao.FindComponent('ButtonOpcao'+IntToStr(I))) do begin
                Parent      := PanelOpcao;
                Caption     := '&'+Opcoes[i];
                if not vertical then begin
                  Width       := FrmOpcao.Canvas.TextWidth(Opcoes[i]) + 10;
                  If PanelOpcao.controlcount = 1 then
                    left      := PanelOpcao.Width - width - 10
                  else begin
                    left      := TBitBtn(PanelOpcao.controls[PanelOpcao.controlcount - 2]).Left - Width - 10;
                    if left < 0 then begin
                       fleft := left;
                       FrmOpcao.autosize            := false;
                       for i2:=0 to FrmOpcao.PanelOpcao.controlcount - 1 do
                        twincontrol(panelopcao.controls[i2]).left := twincontrol(panelopcao.controls[i2]).left - left;
                       FrmOpcao.width               := FrmOpcao.width - fleft + 10;
                       FrmOpcao.lbmensagem.autosize := false;
                       FrmOpcao.lbmensagem.align    := alClient;
                    end;
                  end;
                end else
                   try
                    oldfont := FrmOpcao.canvas.font;
                    FrmOpcao.canvas.font := font;

                    Height       := FrmOpcao.Canvas.TextHeight(Opcoes[i]) + 10;
                    maiorwidth   := iifs(MaiorWidth < FrmOpcao.Canvas.TextWidth(Opcoes[i]),FrmOpcao.Canvas.TextWidth(Opcoes[i]),MaiorWidth);
                    If PanelOpcao.controlcount = 1 then begin
                      FrmOpcao.autosize     := false;
                      FrmOpcao.width        := FrmOpcao.lbmensagem.width;
                      totwidth := FrmOpcao.lbmensagem.height;
                      FrmOpcao.lbmensagem.aLIGN    := alTop;
                      FrmOpcao.panelopcao.align    := alclient;
                      FrmOpcao.lbmensagem.height    := totwidth;
                      top                  := 0;
                    end else begin
                      top               := 0;
                      FrmOpcao.height := FrmOpcao.height + height + 12;
                      for i2:=panelopcao.controlcount - 2  downto 0  do
                        TBitBtn(PanelOpcao.controls[i2]).top := TBitBtn(PanelOpcao.controls[i2]).top + height + 10;
                    end;
                   finally
                    FrmOpcao.canvas.font := oldfont;
                   end;

                if not vertical then begin
                  top         := 2;
                  height      := PanelOpcao.Height - Top * 2;
                end else begin
                  left        := 5;
                  width       := panelopcao.width - 5;
                end;

                Color       := clWindow;
                ModalResult := MrOk;
                TabOrder    := 0;
                OnClick     := FClick;

                if enables <> '' then
                  with separastring(enables) do
                   try
                     enabled := IndexOf(IntToStr(I)) = -1;
                   finally
                     destroy;
                   end;
            end;
         end;


         If Find < length(Opcoes) then
          ActiveControl := TBitBtn(FrmOpcao.FindComponent('ButtonOpcao'+IntToStr(FInd)))
         else
          ActiveControl := TBitBtn(FrmOpcao.FindComponent('ButtonOpcao'+Opcoes[length(Opcoes) - 1]));

         If Length(Opcoes) = 1 then begin
            TBitBtn(FrmOpcao.FindComponent('ButtonOpcao0')).left := Width div 2 - TBitBtn(FrmOpcao.FindComponent('ButtonOpcao0')).Width div 2;
         end;
         
         f := false;
         if tempoerro <= 0 then
           f := ShowModal = mrok
         else begin
           Label1.Visible := true;
           Tag := 2;
           Show;
           BringToFront;
           FStart := GetTickCount;
           while tempoerro  >= GetTickCount - FStart  do begin
              Label1.caption := 'Tempo restante para confirmar a op��o selecionada '+FormatDateTime('hh:mm:ss',(TempoErro - (GetTickCount -  Fstart))/Msecsperday)+' s';
              Application.ProcessMessages;
              if frmopcao = nil then begin
                result := -1;
                exit;
              end else If not visible then begin
                f := Tag = 1;
                break;
              end;
           end;
           f := (tag = 1) or visible;
           if visible then visible := false;
         end;

         If f then begin
           for i:=0 to Length(Opcoes) - 1 do begin
               Result := I;
               If ('&'+Opcoes[i]) = TBitBtn(ActiveControl).Caption then
                break;
           end;
         end else result := -1;
    end;
  finally
    if FrmOpcao <> nil then FrmOpcao.Destroy;
  end;
end;

Function FBuscaPath(ArqIni:String):String;
Var
FFrmBuscaPath:TFrmBuscaPath;
begin
  FFrmBuscaPath := TFrmBuscaPath.Create(Application);
  With FFrmBuscaPath do begin
     Try
       If (ArqIni <> '') and FileExists(ArqIni)  then
         DirectoryListBox1.Directory := ArqIni
       else
         DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName);

       If ShowModal = MrOk then
           Result := DirectoryListBox1.Directory
       else
           Result := '';
     Finally
       FFrmBuscaPath.Destroy;
     end;
  end;
end;

Function  CopiaArquivos(PathFrom,PathTo,Extension:String):Boolean;
var i:word;
    SR: TSearchRec;
begin
  If Not DirectoryExists(PathTo) or Not DirectoryExists(PathFrom) then
   exit;

  try
    I := FindFirst(PathFrom+'\'+'*.'+IIfs(Extension <> '',Extension,'*'),faAnyFile,SR);
    While I = 0 do begin
        if (Sr.Attr and faDirectory = faDirectory) then begin
           If (Sr.Name <> '.') and (Sr.Name <> '..') then begin
              If Not DirectoryExists(PathTo+Sr.Name) then
                CreateDir(PathTo+Sr.Name);
              CopiaArquivos(PathFrom+Sr.Name,PathTo+Sr.Name,Extension);
           end;
         end else
            CopyFile(PChar(PathFrom+'\'+Sr.Name),PChar(PathTo+'\'+Sr.Name),False);
        I := FindNext(SR);
    end;
  finally
    SysUtils.Findclose(Sr);
  end;
end;

Function  CopiaArquivosFiltros(PathFrom,PathTo:String;Extensions:Array of String):Boolean;
var I:word;
begin
 for i:=0 to Length(Extensions) - 1 do
  CopiaArquivos(PAthFrom,PAthTo,Extensions[I])

end;
Function  RepeatChar(Value:String;Repeticao:Word):String;
var I:word;
begin
 Result := '';
 for i:=1 to Repeticao  do
   Result := Result + Value;
end;

Function  StringListtoStr(Value:TStringList):String;
var i:word;
begin
  If Value.Count > 0 then
    for i:=0 to Value.Count - 1 do
      Result := Result + Value[i];
end;

Function  TotRect(F:TWincontrol):TRect;
var P:TWinControl;
begin
    Result.Top    :=  F.Top;
    Result.Left   :=  F.Left;
    Result.Right  :=  F.Width;
    Result.Bottom :=  F.Height;
    P := F;
    while P.Parent <> Nil do begin
        Result.Top    :=  Result.Top  + P.Top;
        Result.Left   :=  Result.Left + P.Left;
        P := P.Parent;
    end;
end;

Function  VLComponent(F:TWincontrol):String;
begin
       Result := '';
       If TWinControl(F) Is TMaskEdit Then
           Result := IIfs(TMaskEdit(F).Text = FormatMaskText(TMaskEdit(F).EditMask,''),'',TMaskEdit(F).Text)
       else If TWinControl(F) Is TCustomEdit Then
           Result := TCustomEdit(F).Text
       Else If TWinControl(F) Is TPanel Then
           Result := TPanel(F).Caption
       Else If TWinControl(F) Is TCheckBox Then
           Result := IIfs(TCheckBox(F).Checked,'T','F')
       Else If TWinControl(F) Is TComboSql Then
           Result := TComboSql(F).ValorRetorno
       Else If TWinControl(F) Is TCustomComboBox Then
           Result := IIfs((TComboBox(F).ItemIndex = -1) or (TComboBox(F).Text = ''),'',TComboBox(F).Text);
end;

Procedure PTrocaPalavrasSL(var Value:TStringList;Origens,Destinos:Array of String);
var i:integer;
begin
 For i:=Value.Count - 1 downto 0  do
  Value[i] := TrocaPalavras(Value[I],Origens,Destinos);
end;

Function   GetValueObjectG(Objeto:TControl;Col,Row:LongInt):String;
begin
   If Not (Objeto is TStringGrid) then
     Result := GetValueObject(Objeto)
   else
     Result := TStringGrid(Objeto).Cells[col,Row];
end;

Function SqlParams(Var F:TStringList;FParams:TParams):TStringList;
var I2,I:Integer;
    FSql:String;
    SP:String;
begin



    Result := TStringList.Create;

    If (F = Nil) or (F.Count = 0) then
      exit;

    For i:=0 to F.Count - 1 do
      Fsql := IIfs(I = 0,'',' ')+UpperCase(F[I]);

    I := 1;
    While I <= Length(FSql) do begin
       If FSql[I] = '''' then begin
          I := I + Pos('''',Copy(FSql,I + 1,Length(FSql) - I)) + 1;
          Continue;
       end;

       If FSql[i] = ':' then begin
          I2 := I + 1;
          While (Length(Fsql) >= I2) and (FSql[I2] <> '') do begin
            SP := SP + Fsql[i2];
            I2 := I2 + 1;
          end;
          If Sp <> '' then
            Result.Add(SP);
          I := i2 + 1;                  
          Continue;
       end;
       Inc(I);
    end;
end;

Procedure TrocaStringParams(Var Query:TQuery;FParams:TParams;semaspas:Boolean=false);
var I:Integer;
    FValue:String;
    VParams:TParams;
begin

    If (FParams.Owner is TQuery) and (Tquery(FParams.Owner) = Query) then begin
       VParams := TParams.Create;
       try
        VParams.Assign(FParams);
        TrocaStringParams(Query,VParams,semaspas);
        Exit;
       finally
        Vparams.Destroy;
       end;
    end;

    For i:=FParams.Count - 1  DOWNto 0   do begin

        iF qUERY.PARAMCOUNT = 0 THEN
         Exit;

        If (Query.Params.FindParam(FParams[i].Name) = Nil) then
          Continue;

        FValue := FParams[i].AsString;

        If ((FValue <> 'NULL')) and (FParams[i].DataType IN [FtString,FtMemo,fTfIXEDcHAR])  then
           FValue :=  iifs(not semaspas,'''','')+FValue+iifs(not semaspas,'''','')
        else If FValue = ''  then
           FValue :=  '0';

        If (FParams[i].DataType = FtDate) or (FParams[i].DataType = FtDateTime) then
           FValue :=  ''''+DataBancoDados(StrtoDateTime(FValue))+''''
        else If (FParams[i].DataType in [FtFloat,FtCurrency,FtBcd])  then
           FValue :=  TrocaPalavras(FValue,[','],['.']);

        Query.Sql.Text := TrocaPalavras(uppercase(Query.sql.Text),[UpperCase(':'+FParams[i].Name)],[UpperCase(FValue)]);
    end;
end;

Procedure ValidaParamsNulo(Var Query:TQuery;FParams:TParams);
var I:Integer;
begin
    For i:=0 to FParams.Count - 1  do begin
        If (Query.ParamCount = 0) or (FParams.Count = 0) then
          exit;

        If (Query.Params.FindParam(FParams[i].name) <> Nil) and (FParams[i].IsNull) then begin
          If (FParams[i].DataType = FtString) or (FParams[i].DataType = FtMemo) or (FParams[i].DataType = FtFixedChar) then
             Query.Sql.Text := TrocaPalavra(Query.sql.Text,':'+FParams[i].Name,'''')
          else If (FParams[i].DataType = FtDate) or (FParams[i].DataType = FtDateTime) then
             Query.Sql.Text := TrocaPalavra(Query.sql.Text,':'+FParams[i].Name,''''+UpperCase(DataBancoDAdos(0))+'''')
          else
             Query.Sql.Text := TrocaPalavra(Query.sql.Text,':'+FParams[i].Name,'0');
        end;
    end;
end;
Function  StrtoStrings(F:String):TStringList;
begin
    Result := TStringList.Create;
    Result.Text := F;
end;
        
Function  StrtoInt64N(Valor:String):Int64;
begin
  If Valor = ''  then
   Result := 0
  else
   Result := StrtoInt64(Valor);
end;

function  ZeroEsquerda(Value:Double;Zeros:Word):String;
begin
  If Zeros = 0 then begin
     Result := FloattoStr(Value);
     exit;
  end;

  Result := FormatFloat(RepeatChar('0',Zeros),Value);
end;

Function  StrtoDateTimeF(Value:String;Mascara:String):TDateTime;
begin
  Result := 0;
  If MascaraCompleta(Mascara,Value) then
   exit;
  Result := StrtoDateTime(Value);
end;
Function  DateToStrBd(Value:TDateTime;FieldType:TFieldType):String;
begin
  If FieldType = FtDateTime then
    Result := VartoStr(TimeStampToMSecs(DateTimeToTimeStamp(Value)))
  else If FieldType = FtDate then begin
    Result := VarToStr(DateTimeToTimeStamp(Value).Date)
  end else If FieldType = FtTime then
    Result := VarToStr(DateTimeToTimeStamp(Value).Time);
end;

Procedure ShowMensOpcoes(mensagem:String;Opcoes:Array of String;Const FProc:TProcOpcoesMensagem;Flag:String);
var
I,FLetf:Word;
begin

  FrmOpcao := TFrmOpcao.Create(application);
  FrmOpcao.Proc := FProc;
  FrmOpcao.Flag := Flag; 
  With FrmOpcao do begin
      Try
         LbMensagem.Caption := Mensagem;
         for i:=Length(Opcoes) - 1 downto 0 do begin
            TBitBtn.Create(FrmOpcao).Name := 'ButtonOpcao'+IntToStr(I);
            With TBitBtn(FrmOpcao.FindComponent('ButtonOpcao'+IntToStr(I))) do begin
                Parent      := PanelOpcao;
                Caption     := Opcoes[i];
                Width       := FrmOpcao.Canvas.TextWidth(Opcoes[i]) + 10;
                If PanelOpcao.controlcount = 1 then
                  left      := PanelOpcao.Width - width - 10
                else
                  left      := TBitBtn(PanelOpcao.controls[PanelOpcao.controlcount - 2]).Left - Width - 10;
                top         := 2;
                height      := PanelOpcao.Height - Top * 2;
                Color       := ClWindow;
                TabOrder    := 0;
                OnClick     := FrmOpcao.ClickButtonMensOpcoes;
            end;
         end;

         ActiveControl := TBitBtn(FrmOpcao.FindComponent('ButtonOpcao0'));
         ShowModal;
      finally
        FrmOpcao.Destroy;
        FrmOpcao := Nil;
      end;    
  end;
end;

function  CopyRegDataSet(TabelaOrigem,TabelaDestino,DataBase:String;FCamposOrg,FCamposDest:TFaixas):Integer;
var
Query1,Query2:TQuery;
I,i2:Integer;
begin
   Result := 0;
   TabelaDestino := IIfs(TabelaDestino <> '',TabelaDestino,TabelaOrigem);
   Query1 := TQuery.Create(application);
   Query2 := TQuery.Create(application);
   Query1.DataBaseName := DataBase;
   Query2.DataBaseName := DataBase;
   TRY
         Query2.sql.clear;
         with query2 do begin
           sql.add('Select * from '+TabelaOrigem);
           for i:=0 to Length(FCamposOrg) - 1  do begin
             sql.add(IIfs(I = 0,' Where ',' And '));
             sql[sql.count - 1] := sql[sql.count - 1] +FCamposOrg[i].Campo
                                  +' '+FCamposOrg[i].Operacao+' '
                                  +''''+FCamposOrg[i].Valor+'''';
           end;
           Open;
         end;

         Query1.sql.clear;
         with query1 do begin
           sql.add('Insert Into '+TabelaDestino);
           sql.add('( ');
           for i:=0 to Query2.Fields.Count - 1 do
             sql[1] := Sql[1] + iifs(Sql[1] <> '( ',',','')+Query2.fields[I].FieldName;

           sql.add(' ) ');
           sql.add('Values (');
           sql.add('  ');
           for i:=0 to Query2.Fields.Count - 1 do begin
             sql.add(IIfs(I > 0,',:',':'));
             sql[sql.count - 1] := sql[sql.count - 1] + Query2.fields[I].FieldName;
           end;
           sql.add(' ) ');

           While Not Query2.Eof do begin
             For i:=0 to Query1.ParamCount - 1 do
                Query1.Params[I].Assign(Query2.FieldByName(Query1.Params[i].Name));

             for I:=0 to Length(FCamposDest) - 1 do
                If Query1.Params.FindParam(FCamposDest[I].Campo) <> Nil then
                   Query1.ParambyName(FCamposDest[I].Campo).Value := FCamposDest[I].Valor;
             execsql;
             Query2.Next;
           end;
         end;
    FINALLY
      Query1.Destroy;
      Query2.Destroy;
    END;
end;
function  ChrToByte(FChr:Char):Byte;
Var
I:Byte;
begin
  Result := 0;
  while Chr(Result) <> FChr do
    Inc(Result);
end;

Function  IncChar(Value:String;Repeticao:LongInt):String;
var i,i2,i3:LongInt;
begin
       If Repeticao < 0 then
         exit;

       Repeticao := IIfs(Repeticao = 0,1,Repeticao);
       Result    := Value;
       For i:=1 to Repeticao do
         If Result[Length(Result)] = 'Z' then begin
           For i2:=length(Result) downto 1  do
             If Result[I2] = 'Z' then
                 Result := Copy(Result,1,I2 - 1) +
                           'A' +
                           Copy(Result,I2 + 1,Length(Result) - I2)
             else Begin
                 Result := Copy(Result,1,I2 - 1) +
                           Chr(ChrToByte(Result[i2]) + 1) +
                           Copy(Result,I2,Length(Result) - I2);
                 Break;
             end;
             Result := IIfs(Result = RepeatChar('A',Length(result)),RepeatChar('A',Length(result) + 1),Result);
         end else
           Result :=Copy(Result,1,Length(Result) - 1) +
                    Chr(ChrToByte(Result[Length(Result)]) + 1);
end;



Function NextConjuntoCaracteres(Value,ValueIni:TStringList):TStringList;
var
I,BaseIni,Base:Integer;
begin
  Result := TStringList.Create;
  Result.AddStrings(Value);

  for i:=0 to Result.count - 1 do
   If Result[i] <> '' then
     break;

  If (Result.count = 0) or (I = Result.count) then
   exit;

  For BaseIni:=0 to Result.Count - 1 do
   If Result[BaseIni] <> '' then
    Break;

  For Base:=Result.Count - 1 downto BaseIni  do
   If Result[Base] <> '' then 
     Break;

  Result[Base]   := '';
  For i:=Base + 1 to Result.Count - 1 do
    Result[i] := ValueIni[i];
end;


Function  SeparadortoStrings(Value,Separador:String):TStringList;
var
I:Integer;
begin
  Result := TStringList.Create;

  If Pos(Separador,Value) = 0 then begin
    Result.Text := Value;
    exit;
  end;

  While Pos(Separador,Value) > 0 do begin  
    Result.Add(Copy(Value,1,Pos(Separador,Value) - 1));
    System.Delete(Value,1,Pos(Separador,Value) + Length(Separador) - 1);
  end;

  Result.Add(Value);
end;



Function  StringstoSeparador(Value:TStringList;Separador:String):String;
var i:Integer;
begin
  Result := '';
  For i:=0 to Value.Count - 1 do
   Result := Result + IIfs(I > 0,Separador,'')+Value[i];
end;


Procedure IndicetabSheets(FOwner:TWinControl);
var FCaption:String;
Ind,i,i2:Integer;
FPageControl:TPageControl;
Flist:Tlist;
begin
  FList := Tlist.Create;
  Try
      TWincontrol(FOwner).GetTabOrderList(FList);
      Ind := 1;
      For i:=0 to FList.Count - 1 do
        If (TWinControl(FList[i]) is TPageControl) and
            TWinControl(FList[i]).Visible then
               For i2:=0 to TPageControl(FList[i]).PageCount - 1 do
                     If TPageControl(FList[i]).Pages[i2].TabVisible then begin
                        FCaption := TPageControl(FList[i]).Pages[i2].Caption;
                        If Pos('&',FCaption) > 0 then
                         System.Delete(FCaption,Pos('&',FCaption),Pos('.',FCaption));
                        TPageControl(FList[i]).Pages[i2].Caption := '&'+IntToStr(Ind)+'.'+FCaption;
                        Ind := Ind + 1;
                     end;
    finally
      Flist.Destroy;
    end;
end;

Function StringstoStr(Value:String):String;
var I:Integer;
begin
  Result := '';
  With DivideMemo(Value) do
    Try
        For I:=0 to Count - 1 do
          Result := Result +IIfs(Result = '','',' ')+Strings[I];
    finally
       Destroy;
    end;
end;

Function  SelectNextFocus(Control:TWinControl;Ind:LongInt;Parent:TWinControl):TWinControl;
var FList:TList;
    I,I2:LongInt;
Begin
    Result := Nil;
    If (Control = nil) or (ind = 0) then
      exit;

    I2 := 0;

    Try
        If Parent = Nil then
          Parent := TWinControl(Control.Owner);

        FList := TList.Create;
        TWincontrol(Parent).GetTabOrderList(FList);
        If Ind > 0 then begin
           For I:=Flist.IndexOf(Control) + 1 to FList.Count - 1 do
             If  (TWinControl(FList[i]).CanFocus and
                  TWinControl(FList[i]).TabStop)  then begin
                       Inc(I2);
                       If I2 = Ind then begin
                         Result := FList[I];
                         Break;
                       end;
              end;
        end else begin
           For I:=Flist.IndexOf(Control) - 1 downto 0  do
             If  (TWinControl(FList[i]).CanFocus and
                  TWinControl(FList[i]).TabStop)  then begin
                       Dec(I2);
                       If Ind = I2 then begin
                         Result := FList[I];
                         Break;
                       end;  
              end;
        end;
    Finally
        Flist.Destroy;
    end;

end;

Procedure HabilitaTabSheets(FControl:TWinControl;fowner:TCustomForm=Nil);
var VControl:TWinControl;
Begin
  VControl := FControl.Parent;
  if fowner = nil then
   fowner := TCustomForm(FControl.Owner);
  While (VControl <> FOwner) do Begin
    If (VControl is TTabSheet) Then
      TTabSheet(VControl).PageControl.ActivePage := TTabSheet(VControl);
    VControl := VControl.Parent;
  end;
end;
Function  RectTotal(Control:TControl):TRect;
var FPArent:TControl;
begin
  FParent     := Control.Parent;
  Result.Top  := Control.Top;
  Result.Left := Control.Left;
  While (FPArent <> Nil) and (FParent <> Control.OWner)  do begin
    Result.Top  := Result.Top + FParent.Top;
    Result.Left := Result.Left + FParent.Left;
    FParent     := FParent.Parent;         
  end;
end;

Procedure  MensTodos(Mensagem:String;Var F:Word);
begin
   F := MessageDlg(Mensagem,mtinformation,[mbyes,mbno,mball,mbcancel],0);
end;

function  MonExtenso(psNro: string):string;
var nNro: Extended;
    sNroExt: string;
    nNroInt,nNroDec: LongInt;
begin
  try
    nNro := StrToFloatN(psNro);

    if nNro <= 0 then
      EXIT;

    nNroInt := Trunc(nNro);
    nNroDec := Round((nNro-nNroInt)*100);

    if nNroInt <> 0 then begin
      sNroExt := sNroExt + Extenso(IntToStr(nNroInt));
      if nNroInt = 1 then sNroExt := sNroExt + ' real'
                     else sNroExt := sNroExt + ' reais';
    end;
    if nNroDec <> 0 then begin
      sNroExt := sNroExt + ' e ' + Extenso(IntToStr(nNroDec));
      if nNroDec = 1 then sNroExt := sNroExt + ' centavo'
                     else sNroExt := sNroExt + ' centavos';
    end;
    MonExtenso := sNroExt;
  except
    MonExtenso := '';
  end;
end;

function  Extenso(psNro: string): string;
var nNro: Extended;
begin
  try
    nNro := StrToFloatN(psNro);
    if nNro <= 0 then
      EXIT;
    Extenso := CExtenso(psNro);
  except
    Extenso := '';
  end;
end;

function  CExtenso(psNro: string): string;
var sNroMOD,sNroInt: string;
    nNroInt: Integer;
begin
  CExtenso := '';
//  Exit;
  nNroInt  :=  StrToIntN(psNro);
  sNroMOD  := FloatToStr(nNroInt mod 10);
  if (nNroInt >= 1) and (nNroInt <= 10) then
    CExtenso := Trim(copy(csAte10, nNroInt * 6 - 5, 6))
  else
  if (nNroInt >= 11) and (nNroInt <= 19) then
    CExtenso := trim(copy(csAte19, (nNroInt - 10) * 9 - 8, 9))
  else
  if (nNroInt >= 20) and (nNroInt <= 99) then begin
    if (nNroInt >= 20) and (nNroInt <= 29) then
      CExtenso := 'vinte' + IIfs(nNroInt = 20, '', ' e ' + CExtenso(sNroMOD))
    else
    if (nNroInt >= 30) and (nNroInt <= 39) then
      CExtenso := 'trinta' + IIfs(nNroInt = 30, '', ' e ' + CExtenso(sNroMOD))
    else
    if (nNroInt >= 40) and (nNroInt <= 49) then
      CExtenso := 'quarenta' + IIfs(nNroInt = 40, '', ' e ' + CExtenso(sNroMOD))
    else
    if (nNroInt >= 50) and (nNroInt <= 59) then
      CExtenso := 'cinquenta' + IIfs(nNroInt = 50, '', ' e ' + CExtenso(sNroMOD))
    else
    if (nNroInt >= 60) and (nNroInt <= 69) then
      CExtenso := 'sessenta' + IIfs(nNroInt = 60, '', ' e ' + CExtenso(sNroMOD))
    else
    if (nNroInt >= 80) and (nNroInt <= 89) then
      CExtenso :=  'oitenta' + IIfs(nNroInt = 80, '', ' e ' + CExtenso(sNroMOD))
    else
      CExtenso :=  CExtenso(FloatToStr(Int(nNroInt/10))) + 'nta' + IIfs(StrToInt(sNroMOD) = 0, '', ' e '+ CExtenso(sNroMOD));
  end else begin
    if (nNroInt >= 100) and (nNroInt <= 999) then begin
      sNroMOD := FloatToStr(nNroInt mod 100);
      if (nNroInt >= 100) and (nNroInt <= 199) then
        CExtenso := IIfs(nNroInt = 100, 'cem', 'cento e ' + CExtenso(sNroMOD))
      else
      if (nNroInt >= 200) and (nNroInt <= 299) then
        CExtenso :=  'duzentos' + IIfs(nNroInt = 200, '', ' e ' + CExtenso(sNroMOD))
      else
      if (nNroInt >= 300) and (nNroInt <= 399) then
        CExtenso :=  'trezentos' + IIfs(nNroInt = 300, '', ' e ' + CExtenso(sNroMOD))
      else
      if (nNroInt >= 500) and (nNroInt <= 599) then
        CExtenso :=  'quinhentos' + IIfs(nNroInt = 500, '', ' e ' + CExtenso(sNroMOD))
      else
        CExtenso :=  CExtenso(FloatToStr(int(nNroInt/100))) + 'centos' + IIfs(StrToInt(sNroMOD) = 0, '', ' e '+ CExtenso(sNroMOD));
    end else begin
      if (nNroInt >= 1000) and (nNroInt <= 999999) then begin
        sNroMOD     := FloatToStr(nNroInt mod 1000);
        CExtenso := CExtenso(FloatToStr(nNroInt Div 1000)) + ' mil' + IIfs(StrToInt(sNroMOD) = 0, '', ' e ' + CExtenso(sNroMOD));
      end else begin
        if (nNroInt >= 1000000) and (nNroInt <= 999999999) then begin
          sNroInt  := FloatToStr(int(nNroInt/1000000));
          sNroMOD  := FloatToStr(nNroInt mod 1000000);
          CExtenso := CExtenso(sNroInt) + IIfs(StrToInt(sNroInt) = 1, ' milhao'  , ' milhoes') + IIfs(StrToInt(sNroMOD) = 0, '', ' e ' + CExtenso(sNroMOD));
        end else begin
          if (nNroInt > 999999999) { (nNroInt >= 1000000000) and (nNroInt <= 999999999999)} then begin
            sNroInt  := FloatToStr(int(nNroInt/1000000000));
            sNroMOD  := FloatToStr(nNroInt mod 1000000000);
            CExtenso := CExtenso(sNroInt) + IIfs(StrToInt(sNroInt) = 1,' bilhao', ' bilhoes') + IIfs(StrToInt(sNroMOD) = 0, '', ' e ' + CExtenso(sNroMOD))
          end; {else
            if (nNroInt >= 1000000000000) and (nNroInt <= 99999999999999) then begin
              sNroInt  := FloatToStr(int(nNroInt/1000000000000));
              sNroMOD  := FloatToStr(nNroInt mod 1000000000000);
              CExtenso := CExtenso(sNroInt) + IIfs(StrToInt(sNroInt) = 1, ' trilhao', ' trilhoes') + IIfs(StrToInt(sNroMOD) = 0, '', ' e ' + CExtenso(sNroMOD));
            end;}
        end;
      end;
    end;
  end;
end;

Function  FDataTypetoVarType(Value:TFieldType):Integer;
begin
  case Value of
     ftSmallInt               : Result := System.varSmallint;
     ftInteger                : Result := System.varInteger;
     ftBCD                    : Result := System.varCurrency;
     ftFloat                  : Result := System.varSingle;
     ftTime,ftDate,ftDateTime : Result := System.varDate;
     ftBoolean                : Result := System.varBoolean;
     ftString,FtMemo          : Result := System.varString;
  else
     Result := VarUnknown;
  end;
end;

procedure ParamsObjeto(Objeto:TWinControl;FParams:TParams;incluir:boolean=false);
Var Loop,Loop2 : Integer;
    Flist:TList;
    FNome:String;
Begin
     Try
         FList := TList.Create;
         TWinControl(Objeto).GetTabOrderList(FList);

         if incluir then
           For Loop := 0 To FList.Count -1 Do
            If  (TControl(FList[Loop]) Is TEditControle) and (UpperCase(TEditControle(FList[Loop]).DescCampo) <> '') and (FParams.findparam(TEditControle(FList[Loop]).DescCampo) = nil) THEN
             TParam(FParams.Add).Name := TEditControle(FList[Loop]).DescCampo
            else If (TControl(FList[Loop]) Is TMaskeditControle) and (UpperCase(TMaskeditControle(FList[Loop]).DescCampo) <> '') and (FParams.findparam(TMaskeditControle(FList[Loop]).DescCampo) = nil) THEN
             TParam(FParams.Add).Name := TMaskeditControle(FList[Loop]).DescCampo
            else If (TControl(FList[Loop]) Is TComboSql) and (UpperCase(TComboSql(FList[Loop]).DescCampo) <> '') and (FParams.findparam(TComboSql(FList[Loop]).DescCampo) = nil) THEN
             TParam(FParams.Add).Name := TComboSql(FList[Loop]).DescCampo
            else If (TControl(FList[Loop]) Is TCheckControle) and (UpperCase(TCheckControle(FList[Loop]).DescCampo) <> '') and (FParams.findparam(TCheckControle(FList[Loop]).DescCampo) = nil) THEN
             TParam(FParams.Add).Name := TCheckControle(FList[Loop]).DescCampo;




         for loop2:=0 to FParams.Count - 1 do Begin
           For Loop := 0 To FList.Count -1 Do
              If  ((TControl(FList[Loop]) Is TEditControle) and (UpperCase(TEditControle(FList[Loop]).DescCampo) = UpperCase(FParams[Loop2].Name))) or
                  ((TControl(FList[Loop]) Is TMaskEditControle) and (UpperCase(TMaskEditControle(FList[Loop]).DescCampo) = UpperCase(FParams[Loop2].Name))) or
                  ((TControl(FList[Loop]) Is TCheckControle) and (UpperCAse(TCheckControle(FList[Loop]).DescCampo) = UpperCase(FParams[Loop2].Name))) or
                  ((TControl(FList[Loop]) Is TComboSql) and (UpperCase(TComboSql(FList[Loop]).DescCampo) = UpperCase(FParams[Loop2].Name)))  Then
                      With FParams.ParambyName(FParams[Loop2].Name) do begin
                             Clear;
                             If (TWinControl(FList[Loop]) Is TEditControle) Then begin
                               Case TEditControle(FList[Loop]).Tipo of
                                 tpNumero:DataType  := ftInteger;
                                 tpDecimal:DataType := ftFloat;
                               end
                             end else If (TWinControl(FList[Loop]) Is TComboSql) Then
                                 DataType  := TipoCampotoDataType(TComboSql(FList[Loop]).TipoCampo)
                             else If (TWinControl(FList[Loop]) Is TCheckControle) Then
                                 DataType  := TipoCampotoDataType(TCheckcontrole(FList[Loop]).TipoValor)
                             else If (TWinControl(FList[Loop]) Is TMaskEditControle) and
                                     (TMaskEditControle(FList[Loop]).VerificaData or TMaskEditControle(FList[Loop]).VerificaHora) Then
                                  DataType  := ftDateTime;

                             If DataType = ftUnknown Then
                               DataType := ftString;

                             Case DataType of
                                FtString          : AsString  := GetValueObject(FList[Loop]);
                                FtFloat,FtCurrency: AsFloat   := StrtoFloatN(GetValueObject(FList[Loop]));
                                FtInteger         : AsInteger := StrtoIntN(GetValueObject(FList[Loop]));
                                FtDateTime        : begin
                                                      If (TWinControl(FList[Loop]) Is TMaskEditControle) and
                                                          TMaskEditControle(FList[Loop]).EditEmBranco Then
                                                           Clear
                                                      else
                                                           AsDateTime:= StrtoDateN(GetValueObject(FList[Loop]));
                                                    end;
                             end;
                     end;

                     If FParams[loop2].isnull and (QRGlobalEnvironment.IndexOf(FParams[loop2].Name) > -1) then begin
                        FParams[loop2].DataType := QREvResultTypetoDataType(QRGlobalEnvironment.Value(FParams[loop2].Name).Kind);
                        Case QRGlobalEnvironment.Value(FParams[loop2].Name).Kind of
                          resInt: FParams[loop2].AsFloat   := QRGlobalEnvironment.Value(FParams[loop2].Name).dblResult;
                          resDouble:FParams[loop2].AsInteger := QRGlobalEnvironment.Value(FParams[loop2].Name).IntResult;
                        else
                          FParams[loop2].AsString := QRGlobalEnvironment.Value(FParams[loop2].Name).StrResult;
                        end;
                    end;    
         end;
     finally
         Flist.Destroy;
     end;
end;
Function  StringStringList(FStrings:TStrings):String;
var i:integer;
begin
  For i:=0 to FStrings.Count - 1 do
   result := result +iifs(i <> 0,' ','')+FStrings[I];
end;

function  AssignVariantParams(FParam:TParam;Value:Variant):Variant;
begin
    Value := VarToStr(Value);

    Case FParam.DataType Of
      FtDateTime,FtDate,FtTime:FPAram.AsDateTime := StrtoDateN(Value);
      FtFloat,FtInteger,FtCurrency,
      FtWord,FtBCD:FPAram.Value := StrtoFloatN(Value);
    else
      FParam.Value := VarAsType(Value,FDataTypetoVarType(FPAram.DataType));
    end;

    Result := FParam.Value;
end;

Function  CompletaZeros(Zeros:Integer;Value:Double;Decimal:Boolean):String;
var F:Double;
begin
  F := IIfs(Decimal,Int(Value),Value);
  If Length(FloatToStr(F)) >= Zeros Then
    Result := FloatToStr(Value)
  else
    Result := StringOfChar('0',Zeros - Length(FloatToStr(F)))+FloatToStr(Value);
end;

Function  CopyPChar(Value:PChar;Ind:Integer;Count:Integer):PCHar;
begin
//   For i:= 0 to  


end;

Procedure InicioTabSheets(FParent:TWinControl);
var
i,i2:Integer;
FList:TList;
begin
  FList := TList.Create;
  Try
      FParent.GetTabOrderList(Flist);
      For i:=0 to FList.Count - 1 do
       If (TWinControl(FList[i]) is TPageControl) then
         For i2:=0 to TPageControl(FList[i]).PageCount - 1 do
          If TPageControl(FList[i]).Pages[i2].TabVisible Then begin
            TPageControl(FList[i]).ActivePageIndex := i2;
            Break;
          end;
  finally
      FList.Destroy;
  end;
end;

Procedure ComboDataType(Objeto:TComboBox);
begin
   With Objeto do begin
       Items.add('ftUnknown');
       Items.add('ftString');
       Items.add('ftSmallint');
       Items.add('ftInteger');
       Items.add('ftWord');
       Items.add('ftBoolean');
       Items.add('ftFloat');
       Items.add('ftCurrency');
       Items.add('ftBCD');
       Items.add('ftDate');
       Items.add('ftTime');
       Items.add('ftDateTime');
       Items.add('ftBytes');
       Items.add('ftVarBytes');
       Items.add('ftAutoInc');
       Items.add('ftBlob');
       Items.add('ftMemo');
       Items.add('ftGraphic');
       Items.add('ftFmtMemo');
       Items.add('ftParadoxOle');
       Items.add('ftDBaseOle');
       Items.add('ftTypedBinary');
       Items.add('ftCursor');
       Items.add('ftFixedChar');
       Items.add('ftWideString');
       Items.add('ftLargeint');
       Items.add('ftADT');
       Items.add('ftArray');
       Items.add('ftReference');
       Items.add('ftDataSet');
       Items.add('ftOraBlob');
       Items.add('ftOraClob');
       Items.add('ftVariant');
       Items.add('ftInterface');
       Items.add('ftIDispatch');
       Items.add('ftGuid');
   end;
end;

Function  FormatNomeTabela(Value:String):String;
begin
  Result := ValidaCharacteres(['A'..'Z','a'..'z','0'..'9','.'],TiraAcento(Value),True,'_');
end;

function tiraacento(texto:string):string;
var
i     : integer;
letra : string;
begin
  RESULT := '';
  for i:=1 to length(texto) do
   begin
     letra      :=  texto[i];
     if letra = '�' then letra := 'A'
     Else if letra = '�' then letra := 'E'
     Else if letra = '�' then letra := 'I'
     Else if letra = '�' then letra := 'O'
     Else if letra = '�' then letra := 'U'
     Else if letra = '�' then letra := 'A'
     Else if letra = '�' then letra := 'O'
     Else if letra = '�' then letra := 'A'
     Else if letra = '�' then letra := 'E'
     Else if letra = '�' then letra := 'I'
     Else if letra = '�' then letra := 'O'
     Else if letra = '�' then letra := 'U'
     Else if letra = '�' then letra := 'U'
     Else if letra = '�' then letra := 'C'
     Else if letra = '�' then letra := 'C'
     Else if letra = '�' then letra := 'a'
     Else if letra = '�' then letra := 'e'
     Else if letra = '�' then letra := 'i'
     Else if letra = '�' then letra := 'o'
     Else if letra = '�' then letra := 'u'
     Else if letra = '�' then letra := 'a'
     Else if letra = '�' then letra := 'o'
     Else if letra = '�' then letra := 'a'
     Else if letra = '�' then letra := 'e'
     Else if letra = '�' then letra := 'i'
     Else if letra = '�' then letra := 'o'
     Else if letra = '�' then letra := 'u'
     Else if letra = '�' then letra := 'u'
     Else if letra = '�' then letra := 'c';

     result := result + letra;
   end;
end;

function VDataTypeToVarType(FDatatype:TFieldType):Integer;
begin
  case FDataType of
     ftSmallInt               : Result := System.varSmallint;
     ftInteger                : Result := System.varInteger;
     ftBCD                    : Result := System.varCurrency;
     ftFloat                  : Result := System.varSingle;
     ftTime,ftDate,ftDateTime : Result := System.varDate;
     ftBoolean                : Result := System.varBoolean;
     ftString,FtMemo,FtBlob   : Result := System.varString;
  else
     Result := VarUnknown;
  end;
end;

function  SeparaString(Value:String;Separador:String = ','):TStringList;
var i:integer;
begin
  Result := TStringList.Create;
  Result.Add('');
  for i:=1 to Length(Value) do
   If Value[i] = Separador Then
     result.Add('')
   else
     result[Result.Count - 1] := result[Result.Count - 1] + Value[i];
end;
function  FtimeStamptoMsecs(FData:TTimeStamp):Comp;
begin
  Result := (FData.Date * MSecsPerDay) + (FData.Time);
end;

function  DateTimetoMsecs(FData:TDateTime):Comp;
var FTS : TTimeStamp;
begin
  Fts.Time := DateTimetoTimeStamp(Strtodatetime(FormatDateTime('hh:mm:ss',FData))).Time;
  FTs.Date := DateTimetoTimeStamp(FData).Date - DateTimetoTimeStamp(0).Date;
  Result   := FTimeStamptoMSecs(FTS);
end;

procedure Delay(MSec: Cardinal;ProcDelay:TProcDelay=Nil);
var
  Start: Cardinal;
  F:Boolean; 
begin
  Start := GetTickCount;
  repeat
    Application.ProcessMessages;
    F := False;
    if assigned(ProcDelay) Then
     ProcDelay(F);
    If F Then
     Exit; 
  until (GetTickCount - Start) >= MSec;
end;

function  UltPos(Subst,VStr:String):Integer;
var F:String;
begin
  Result := 0;
  F := VStr;
  repeat
    Result := Result + Pos(Subst,F);
    F      := Copy(VStr,Result + 1,Length(VStr));
  until Pos(Subst,F) = 0;
end;
procedure AssignFunction(VEnvironment:TQREvEnvironment;VName,valor:String;Vtipo:TQREvResultType;altera:boolean=False);
var
Vexp:String;
FValor:string;
begin
    FValor := Valor;
    If VTipo = ResDouble then begin
       Valor := FloatToStr(StrtoFloatN(Valor));
       Valor := TrocaPalavra(Valor,',','.');
       If Pos('.',Valor) = 0 Then
          Valor := Valor+'.0';
    end else If VTipo = ResString then
         Valor := ''''+Valor+'''';

    if VEnvironment.IndexOf(VName) < 0 then
       VEnvironment.AddFunction(VName,Valor)
    else begin
      VTipo := VEnvironment.Value(VName).kind;
      If Vtipo = ResDouble then
        VEnvironment.SetFloatConstant(VEnvironment.GetConstant(Vname),StrtoFloatN(FValor))
      else If Vtipo = ResInt then
        VEnvironment.SetIntegerConstant(VEnvironment.GetConstant(Vname),StrtoIntN(FValor))
      else begin
        Valor := copy(valor,2,length(Valor));
        Valor := copy(valor,1,length(Valor) - 1);
        VEnvironment.SetStringConstant(VEnvironment.GetConstant(Vname),Valor);
      end;
    end;     
end;
Function QREvResultTypeToDataType(Value:TQREvResultType):TFieldType;
begin
  Case VAlue of
   ResDouble: Result := ftFloat;
   ResInt   : Result := FtInteger;
  else
    Result := FtString;
  end;
end;
Function DataTypetoQREvResultType(Value:TFieldType):TQREvResultType;
begin
  Case VAlue of
   FtFloat,FtBcd,FtCurrency: Result := ResDouble;
   FtInteger,FtWord,FtSmallInt: Result := ResInt;
  else
    Result := resString;
  end;

end;
Procedure AssignEnvironment(OrgEnvironment:TQREvEnvironment;DestEnvironment:TQREvEnvironment);
var
Vexp:String;
I:integer;
begin
 OrgEnvironment.Prepare;
 Try
   For I:=0 to OrgEnvironment.Count - 1 do begin
     If OrgEnvironment.Value(OrgEnvironment[I]).kind  = ResDouble then begin
       Vexp := FloatToStr(OrgEnvironment.Value(OrgEnvironment[I]).dblResult)
     end else If OrgEnvironment.Value(OrgEnvironment[I]).kind = ResInt then
       Vexp := IntToStr(OrgEnvironment.Value(OrgEnvironment[I]).IntREsult)
     else
       Vexp := OrgEnvironment.Value(OrgEnvironment[I]).StrResult;
     AssignFunction(DestEnvironment,OrgEnvironment[i],Vexp,OrgEnvironment.Value(OrgEnvironment[i]).Kind,True);
   end;
  finally
     OrgEnvironment.Unprepare;
  end;
end;
Function  ValidaDataType(FDataType:TFieldType;Value:String):Variant;
begin
   Result := Value;
   case FDataType of
    FtDateTime,FtTime,FtDate:Result := StrtodateN(Value);
    FtFloat,FtCurrency,FtBCd:Result := StrtoFloatN(Value);
    FtInteger,FtWord,FtSmallInt:Result := StrtoIntN(Value);
   end;
end;

Function  ListIndexFullField(Sql:TStrings;database:String='bd'):TStringList;
var I,I2,QAspas,QAspas2,QParenteses,QParenteses2:Word;
    FSql:String;
    UltimoAs,FBr:Boolean;
begin
       If (Sql = Nil) or (Sql.Count = 0) then
        exit;

       If POS('SELECT*FROM',UpperCase(ValidaCharacteres([' '],StringstoStr(Sql.Text),False))) = 1 Then begin
         Result := ListFullField(Sql,DataBase);
         exit;
       end;


       UltimoAs := False;
       For i:=0 to Sql.Count - 1 do
         Fsql := FSql +IIfs(I = 0,'',' ')+UpperCase(Sql[I]);

       System.Delete(FSql,Pos('SELECT',FSql),6);

       I := TemWhereSql(FSql,'DISTINCT');
       If i >  0 Then
        System.Delete(FSql,I,8);
                
       I := 1;

       QParenteses := 0;
       QAspas := 0;
       Result := TStringList.Create;

       While  I <= Length(FSql) do begin

           If (Copy(Fsql,I,1) = '''') then
            If (Qaspas = 0) Then
              Inc(Qaspas)
            else
              Qaspas := Qaspas - 1;
              
            If QAspas = 0 Then
             If (Copy(Fsql,I,1) = '(') then
                Inc(QParenteses)
             else if (Qparenteses > 0) and (Copy(Fsql,I,1) = ')') then
                QParenteses := QParenteses - 1;
//or ((FSql[I] = ' ') and Not (Copy(FSql,I,3) = ' AS'))
             If (QParenteses > 0) or (Qaspas > 0) then begin
                 Inc(I);
                 Continue;
             end;


             If (FSql[I] = ',') or (Copy(Fsql,I - 1,6) = ' FROM ') or ((FSql[I] = ' ') and (Copy(FSql,I,3) = ' AS')) then begin
                 Result.Add('');
                 I2 := I - 1;
                 QParenteses2 := 0;
                 QAspas2 := 0;
                 FBr := False;
                 UltimoAs := (FSql[I] = ' ') and (Copy(FSql,I,3) = ' AS');
//Not((FSql[I2] = ' ') and (Result[Result.count - 1] <> ''))
                 While (I2 > 0) and
                       ((QParenteses2 > 0) or (FSql[I2] <> ',')) do begin

                        If (Copy(Fsql,I2,1) = '''') then
                          If (Qaspas2 = 0) Then
                            Inc(Qaspas2)
                          else
                            Qaspas2 := Qaspas2 - 1;

                        If Qaspas2 = 0 Then
                          If (Copy(Fsql,I2,1) = ')') then
                             Inc(QParenteses2)
                          else if (QParenteses2 > 0) and (Copy(Fsql,I2,1) = '(') then
                             QParenteses2 := QParenteses2 - 1;

                        Result[Result.count - 1] := FSql[I2] + Result[Result.count - 1];
                        I2 := I2 - 1;
                 end;

                 Result[Result.count - 1] := Trim(Result[Result.count - 1]);
                 If (Copy(Fsql,I - 1,6) = ' FROM ') then
                   exit;

                 If ((FSql[I] = ' ') and (Copy(FSql,I,3) = ' AS')) Then
                   For i:=I + 4 to Length(FSql) do begin
                     If ((FSql[i] = ' ') and FBr) or (Fsql[i] = ',') then
                       Break;
                     If (FSql[i] <> ' ') Then
                       FBr := True;
                   end;
                   
                 for i2:=i to Length(FSql) do
                  If (Copy(Fsql,I2,6) = ' FROM ') Then
                    exit
                  else if Fsql[i2] = ',' Then begin
                    i := i2 + 1;
                    break;
                  end;
                 Continue;
             end;
             Inc(I);
       end;
end;

Function InsereFaixaSql(Sql:TStrings;Alias,Valor:String;Fupper:Boolean=False;DataBase:String='Bd'):String;
Var
FValue,FSql,Fsql2:String;
FList:TStringList;
Vind,I,I2,QParenteses,Qaspas:Integer;
Function FInsereFaixaSql(FSql,Alias,Valor:String;FUpper:Boolean=False):String;
var I:Integer;
    QParenteses,Qaspas:Integer;
    TW:Boolean;
begin
     Result := FSql;
     QParenteses := 0;
     QAspas := 0;
     TW  := TemWhereSql(Result) > 0;
     For i:=1 to Length(Result) do begin
       If (Copy(Fsql,I,1) = '''') then
        If (Qaspas = 0) Then
          Inc(Qaspas)
        else
          Qaspas := Qaspas - 1;

       If (Copy(Result,I,1) = '(') then
          Inc(QParenteses)
       else if (Qparenteses > 0) and (Copy(Result,I,1) = ')') then
          QParenteses := QParenteses - 1;

       If (QParenteses = 0) and (Qaspas = 0) and
          ((Copy(UpperCase(Result),I,5) = 'UNION') or (Copy(UpperCase(Result),I,4) = 'PLAN') or (Copy(UpperCase(Result),I,5) = 'GROUP') or (Copy(UpperCase(Result),I,5) = 'ORDER') or
           (Not TW and ((Copy(UpperCase(Result),I,10) = '#$D#$AAND ') or (Copy(UpperCase(Result),I,5) = ' AND ') or (Copy(UpperCase(Result),I,10) = ' AND#$D#$A')))) Then
            Break;
     end;

     TW    := TemWhereSql(Result) > 0;
     Valor := TrocaPalavra(Valor,'?CAMPO',Alias);
     System.Insert(IIfs(TW,' AND ',' WHERE ')+Valor+IIfs(I = Length(Result) + 1,'',#$D#$A),
                   Result,
                   i);

end;

begin
     Result := '';
     FSql := Sql.Text;
     QParenteses := 0;
     Qaspas := 0;
     FSql2 := '';
     i := 1;
     i2 := 1;
     VInd := PosField(Sql,Alias,DataBase);

     While Length(FSql) >= I do begin
       If (Copy(Fsql,I,1) = '''') then
        If (Qaspas = 0) Then
          Inc(Qaspas)
        else
          Qaspas := Qaspas - 1;

       If (Copy(Fsql,I,1) = '(') then
          Inc(QParenteses)
       else if (Qparenteses > 0) and (Copy(Fsql,I,1) = ')') then
          QParenteses := QParenteses - 1;

       If (QParenteses = 0) and (Qaspas = 0) and ((UpperCase(Copy(Fsql,I,5)) = 'UNION') or (i = length(Fsql))) Then begin
         If i = length(Fsql) Then
          FSql2  := Copy(Fsql,I2,i)
         else
          FSql2  := Copy(Fsql,I2,I + Pos('SELECT',Copy(UpperCase(Fsql),i,Length(FSql))) - 2);

         FList := TStringList.Create;
         FList.Text := FSql2;
         With ListIndexFullField(FList,DataBase) do
          Try
            Fsql2  := FInsereFaixaSql(FSql2,Strings[VInd - 1],Valor,Fupper);
          finally
            Destroy;
            FList.Destroy;
          end;

         Result := Result + FSql2;
         If Length(FSql) = I Then
           exit
         else begin
           I      := I - 1 + Pos('SELECT',Copy(UpperCase(Fsql),i,Length(FSql)));
           i2     := i;
           Continue;           
         end;
       end;
       Inc(I);
     end;
     FList.Destroy;

end;

Function  TemWhereSql(Sql:String;Valor:String='WHERE'):Integer;
var I:Integer;
    QParenteses,Qaspas:Integer;
begin
     QParenteses := 0;
     QAspas := 0;
     Result := 0;
     For i:=1 to Length(Sql) do begin

       If (Copy(sql,I,1) = '''') then
        If (Qaspas = 0) Then
          Inc(Qaspas)
        else
          Qaspas := Qaspas - 1;

       If (Copy(Sql,I,1) = '(') then
          Inc(QParenteses)
       else if (Qparenteses > 0) and (Copy(Sql,I,1) = ')') then
          QParenteses := QParenteses - 1;

       If (QParenteses = 0) and (Qaspas = 0) and
          (Copy(UpperCase(Sql),I,Length(Valor)) = uppercase(valor)) Then begin
           Result := I;
           Exit;
       end;
     end;

end;

Function  FieldtoFullField(Sql:TStrings;Alias:String;DataBase:String='Bd'):String;
Var
Ind:Integer;
begin
  If POS('SELECT*FROM',UpperCase(ValidaCharacteres([' '],StringstoStr(Sql.Text),False))) = 1 Then begin
    With ListFullField(Sql,DataBase) do
     try
       Text := UpperCase(Text);
       If IndexOf(UpperCase(Alias)) > -1 Then
        Result := Alias
       else
        Result := '';
     finally
       Destroy;
     end;
     exit;
  end;

  Ind    := PosField(Sql,Alias);
  With ListIndexFullField(Sql) do
   try
    If Count >= Ind  Then
      Result := Strings[Ind - 1]
    else
      Result := '';
   finally
    Destroy;
   end;

end;
Function  TipoDataType(Value:TFieldType):TTipoDataType;
begin
  case Value of
   FtFloat,FtBcd,FtCurrency:Result := dtnumero;
   FtInteger,FtWord,FtSmallInt:Result := dtInteiro;
   FtDate,FtTime,FtDateTime:Result := dtData;
  else
   Result := dtCharacter;
  end;
end;

function tbKeyIsDown(const Key: integer): boolean;
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

Function  ListFullField(FSql:TStrings;FDataBase:String):TStringList;
var i:integer;
const
constsql:array[0..2] of String = ('GROUP','PLAN','ORDER');
begin
  REsult := TStringList.Create;
  With TQuery.Create(Application) do
   Try
     DataBasename := FDataBase;
     Sql.Clear;
     Sql.Text := FSql.Text;

     if TemWhereSql(Sql.Text,'Union') > 0 then
       Sql.Text := Copy(Sql.Text,1,TemWhereSql(Sql.Text,'Union') - 1);

     if TemWhereSql(Sql.Text) > 0 then
       Sql.Text := Copy(Sql.Text,1,TemWhereSql(Sql.Text) + 5)+
                   ' ''a'' = ''b'' And ' +
                   Copy(Sql.Text,TemWhereSql(Sql.Text) + 6,Length(Sql.Text))
     else begin
       For i:=0 to Length(ConstSql) - 1 do
        If TemWhereSql(Sql.Text,ConstSql[i]) > 0 then begin
           Sql.Text := Copy(Sql.Text,1,TemWhereSql(Sql.Text,ConstSql[i]) - 1)+
                        'Where ''a'' = ''b'' ' +
                        Copy(Sql.Text,TemWhereSql(Sql.Text,ConstSql[i]),Length(Sql.Text));
           break;
        end;
        if i > Length(ConstSql) - 1 then
          sql.add('Where ''a'' = ''b'' ');
     end;   


//     Sql.Add(IIfs(TemWhereSql(FSql.Text) = 0,'Where ','And ')+' ''a'' = ''b'' ');
     Open;
     For i:=0 to Fields.count - 1 do
      Result.Add(Fields[i].fieldname);
   finally
     Destroy;
   end;
end;
Function  UltimaLinhaFiltroSql(Sql:String):Integer;
const
constsql:array[0..3] of String = ('GROUP','PLAN','ORDER','UNION');
VAR
I:INTEGER;
begin
 For i:=0 to Length(constsql) - 1 do begin
   Result := TemWhereSql(Sql,ConstSql[i]);
   If Result > 0 Then
    exit;
 end;
end;

Function  IndexOfLike(List:TStringList;Palavra:String;Posicao:Word=0):Integer;
var i:integer;
    FPos:Integer;
begin
   Result := -1;
   With List do
    For i:=0 to Count - 1 do begin
      FPos := Pos(UpperCase(Palavra),Trim(UpperCase(Strings[i])));
      If (Fpos > 0) and
         ((Posicao = 1) or
         ((Posicao = 0) and (FPos = 1)) or
         ((Posicao = 2) and (FPos = Length(Trim(Strings[i])) - Length(Palavra)))) then begin
            Result := i;
            exit;
      end;
    end
end;

Function  ActivePageSel(FPage:TWinControl):TTabSheet;
var i:integer;
    FTBS:TTabSheet;
    FList:TList;
begin
  Result := Nil;
  FList  := TList.Create;
  Try
    TWinControl(FPage).GetTabOrderList(FList);
    For  i:=FList.count - 1 downto 0 do
     If (TWinControl(FList[i]) is TTabSheet) Then
      If TWinControl(FList[i]).CanFocus and TTabSheet(FList[i]).TabVisible Then begin
         Result := TTabSheet(FList[i]);
         Exit;          
      end;       
   finally
     FList.Destroy;
   end;
end;
function  MultiplicaString(Value:String;Qtde:Integer):String;
var i:integer;
begin
 result := '';
 for i:=1 to Qtde do
  result := result + value;
end;

Function TrocaStringParamsStr(FValue:String):String;
var
FQuery:TQuery;
FParams:TParams;
begin
  result := '';
  FParams := TParams.Create;
  Fquery := TQuery.create(Application);
  try
     FQuery.Sql.Text := FValue;
     FParams.Assign(FQuery.Params);
     TrocaStringParams(FQuery,FParams);
     Result := FQuery.Sql.Text;     
   finally
     FQuery.Destroy;
     FParams.Destroy; 
   end;
end;
Function  LocateGlobal(FDataSet:TdataSet;Campos:TStringList;FValues:Array of Variant;FContinua:Boolean=False):Boolean;
var
i:integer;
SavePlace:TBookMark;
begin
  Result := False;
  SavePlace := FDataSet.GetBookmark;
  FdataSet.DisableControls;
  Try
     If Not FContinua Then
      FDataSet.First;
     While not FDataSet.Eof Do begin
      for i:=0 to Campos.Count - 1 do
       If UpperCase(FDataSet.FieldByName(Campos[i]).AsString) <> UpperCase(VarToStr(FValues[i])) Then
         Break;
      Result := I = Campos.Count;
      If Result Then
       exit;
      FDataSet.Next;
     end;
     FDataSet.GotoBookmark(SavePlace);
     FDataSet.FreeBookmark(SavePlace);
  finally
     FdataSet.EnableControls;
  end;
end;

Function  FGridCons(FDataSet:TQuery;tit:string;FMulti:Boolean=False;FgridPrinc:integer=-1;FModal:Boolean=True;FBarra:Boolean=True;FCamposPesq:String = '';
          FColumnDataCell:TDrawColumnCellEvent=nil;FFecha:Boolean=true;FDesabFiltros:Boolean=False):Boolean;
var
i,imi,i2,vwidth:integer;
Vgrid:TDBGridControle;
f:boolean;
begin
   f := Frm_GridCons = Nil;
   if Frm_GridCons = Nil then begin
     Frm_GridCons := TFrm_GridCons.Create(application);
     if FCamposPesq <> '' Then begin
       If Frm_GridCons.CamposPesq <> Nil Then
        Frm_GridCons.CamposPesq.Destroy;
       Frm_GridCons.CamposPesq     := SeparaString(FCamposPesq);
       Frm_GridCons.Panel1.Visible := True;
     end else if not FDesabFiltros and (FGridPrinc = -1) then begin
       for i:=0 to FDataSet.FieldCount - 1 do
        if FDataSet.fields[i].Visible and (FDataSet.fields[i].FieldKind = fkData ) then
         Frm_GridCons.CamposPesq.Add(FDataSet.fields[i].FieldName);
       Frm_GridCons.Panel1.Visible := True;
     end;

//     If Frm_GridCons.CamposPesq <> Nil Then
  //    Frm_GridCons.Panel2.Visible :=  Frm_GridCons.CamposPesq.Count > 1;

//     Frm_GridCons.ToolBar1.Visible := FBarra;
     Frm_GridCons.vFecha := FFecha;
     if colorformgridcons <> '' Then
       Frm_GridCons.Color := Stringtocolor(Colorformgridcons);

   end;



   If FgridPrinc = -1 then begin
     Vgrid := Frm_GridCons.grid;
     if Pos('VENDAS',UpperCase(Application.ExeName)) > 0 then
       Frm_GridCons.Height := 470;
   end else begin
     Frm_GridCons.Height := 470;
     Vgrid := TDbGridControle.Create(Frm_GridCons);
     Vgrid.Parent := Frm_GridCons;
{     if Frm_GridCons.Panel1.Tag = 0 then begin
       Frm_GridCons.height := Frm_GridCons.height + Frm_GridCons.Panel1.Height;
       Frm_GridCons.Panel1.Tag := 1;
     end;}
     i2 := 0;
     for i:=0 to Frm_GridCons.controlCount - 1 do
      if (Frm_GridCons.controls[i] is TDbGridControle) then begin
       if TDbGridControle(Frm_GridCons.controls[i]).Align <> AlTop then begin
         TDbGridControle(Frm_GridCons.controls[i]).align                := AlTop;
         TDbGridControle(Frm_GridCons.controls[i]).alignEnableDetalhes  := AlTop;
         TDbGridControle(Frm_GridCons.controls[i]).alignDisableDetalhes := AlClient;
         TDbGridControle(Frm_GridCons.controls[i]).Height := (Frm_GridCons.Height - Frm_GridCons.Panel1.Height) div (i2 + 2);
       end;

       Inc(i2);
     end;

     VGrid.DataSource  := TDataSource.Create(Frm_GridCons);
     Vgrid.ShowHint    := True;
     Vgrid.Hint        := tit;
     Vgrid.datasource.dataset := FDataSet;
     VGrid.Name        := 'Grid'+inttoStr(i2);
     VGrid.Align       := AlClient;
     VGrid.TitleFont.assign(Frm_GridCons.grid.TitleFont);
     VGrid.ParentFont  := False;
     VGrid.Font.Assign(Frm_GridCons.Grid.Font);
     VGrid.OnKeyDown   := Frm_GridCons.grid.OnKeyDown;
     VGrid.OnDblClick  := Frm_GridCons.grid.OnDblClick;
     Vgrid.UltColAut   := true;
//     VGrid.Height      := Frm_GridCons.Height div i2;
     if FgridPrinc <= 1 then
      VGrid.DbGridPrinc := Frm_gridcons.Grid
     else begin
      Frm_GridCons.WindowState := wsMaximized;
      i2:=0;
      for i:=0 to Frm_GridCons.controlCount - 1 do
       if (Frm_GridCons.controls[i] is TDbGridControle) then begin
        inc(I2);
        if i2 = FgridPrinc then
         break;
       end;
       if i2 < Frm_GridCons.controlCount then
        VGrid.DbGridPrinc := TDbGridControle(TDbGridControle(Frm_GridCons.controls[i]));
     end;
   end;

  VGrid.OnDrawColumnCell := FColumnDataCell;
  If colorgridcons <> '' Then
    VGrid.Color := stringtocolor(colorgridcons);

  If colorfontgridcons <> '' Then
    VGrid.Font.Color := stringtocolor(colorfontgridcons);

  if Pos('VENDAS',UpperCase(Application.ExeName)) > 0 then
    VGrid.Font.Style := [fsbold]
  else
    VGrid.Font.Style := [];

  If ColorFormFontgridcons <> '' Then
    Frm_GridCons.Font.Color := stringtocolor(ColorFormFontgridcons);

   With Frm_GridCons do
    Try
      If FgridPrinc = -1 then
        caption := Tit;
      If Fmulti Then
        VGrid.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
      else
        VGrid.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
      if Vgrid = Grid Then
        Vgrid.datasource.dataset := FDataSet;
      vwidth := 0;

      for i:=0 to VGrid.Columns.Count - 1 do
        If VWidth + VGrid.Columns[i].Width >= Screen.Width Then begin
          VWidth := VWidth + (VWidth + VGrid.Columns[i].Width - Screen.Width );
          break;
        end else
          VWidth := VWidth + VGrid.Columns[i].Width;




       if vwidth < frm_gridcons.Width then begin
          for i:=VGrid.Columns.count - 1 downto 0 do
           if VGrid.Columns[i].Visible then
             break;

          VGrid.Columns[i].width := VGrid.Columns[i].width + (frm_gridcons.Width - vwidth - 5);
          vwidth := frm_gridcons.Width;
       end;
       if FirstColGridCons then begin
        for i:=0 to VGrid.Columns.count - 1  do
         if VGrid.Columns[i].Visible then
           break;
         if FirstColGridConsColor <> '' then
           VGrid.Columns[i].Color            := StringtoColor(FirstColGridConsColor);
         if FirstColGridConsFColor <> '' then
           VGrid.Columns[i].Font.Color       := StringtoColor(FirstColGridConsFColor);
       end;



       If F or (VWidth > Width) then
         Width := VWidth + Canvas.TextWidth('A') * 7;

       if f then begin
         VGrid.align := AlNone;
         VGrid.Width := Width;
         VGrid.align := AlClient;
       end;
//       clientWidth := Width;

//       Panel3.Left := Width - Panel3.Width - 30;
//       Panel2.Left := Panel3.Left  - Panel2.Width - 10;

       if vgrid.width > Width then
        vgrid.width := width - 2;


{      for i:=0 to VGrid.columns.count - 1 do
       if VGrid.columns[i].visible then
         vwidth := vwidth + VGrid.columns[i].width;

//      if vwidth > clientwidth then
      width := iifs(vwidth > Screen.Width,Screen.Width,vwidth);}

      if fmodal then
       showmodal;
      Result := ModalResult = mrok;
    finally
      If Not FMulti and Fmodal then
       destroy;
    end;
end;

procedure FassignParams(Org,Dest:Tquery);
var i:integer;
begin
  for i:=0 to dest.paramcount - 1 do begin
    if org.Active and (Org.Fields.FindField(Dest.Params[i].name) <> nil) then
      dest.ParamByName(Dest.Params[i].name).Assign(org.FieldbyName(Dest.Params[i].name));

    if org.params.FindParam(Dest.Params[i].name) <> nil then
      dest.ParamByName(Dest.Params[i].name).Assign(org.ParambyName(Dest.Params[i].name));
  end;
end;
Function  FWhereouAnd(FQuery:String):String;
begin
  If TemWhereSql(FQuery) > 0 then
    Result :=  ' And '
  else
    Result :=  ' Where ';
end;
function  GridVazio(FGrid:TStringGrid):Boolean;
var i,i2 :integer;
begin
  result := true;
  for i:=fgrid.fixedrows to fgrid.rowcount - 1 do
   for i2:=fgrid.fixedcols to fgrid.colcount - 1 do
    if (fgrid.colwidths[i2] > -1) and (fgrid.cells[i2,i] <> '') then begin
     result := false;
     exit;
    end;
end;

Procedure PesquisaListBox(obj:TListBox);
var
FValue:String;
i:integer;
begin
   fvalue := iifs(Fpesqlistbox = tform(obj.owner).name+obj.name,Foldpesqlistbox,'');
   if not InputQuery('Informe a descri��o','Informe a Descri��o',FValue) then begin
     exit;
   end;

   Foldpesqlistbox := fvalue;
   Fpesqlistbox    := tform(obj.owner).name+obj.name;

   for i:=obj.itemindex to obj.items.count - 1 do
    if Pos(uppercase(FValue),upperCase(Obj.items[i])) > 0 then begin
     obj.itemindex := i;
     exit;
    end;

   for i:=0 to obj.itemindex - 1 do
    if Pos(uppercase(FValue),upperCase(Obj.items[i])) > 0 then begin
     obj.itemindex := i;
     exit;
    end;
end;

function  LikeStrings(FValue:Tstrings;F:String;inicio:boolean=true):Integer;
var i:integer;
begin
 result := -1;
 with fvalue do
  for i:=0 to Count - 1 do
   if (Pos(upperCase(F),UpperCase(Fvalue[i])) > 0) and (not Inicio or (Pos(upperCase(F),UpperCase(Fvalue[i])) = 1)) then begin
     result := i;
     break;
   end;
end;

Function SubstituiCamposQuery(FValue:String;Exp:String='COUNT(*)'):String;
var
ind,ind2:integer;
begin
  ind    := TemWhereSql(Fvalue,'SELECT');
  Result := '';
  While ind > 0 do begin
    ind2   := TemWhereSql(Fvalue,'FROM');
    Result := Result + copy(FValue,Ind,6)+' '+Exp+' '+Copy(Fvalue,ind2,Length(FValue));
    FValue := Copy(Fvalue,ind2,Length(FValue));
    ind    := TemWhereSql(FValue,'SELECT');
  end;
end;

procedure CopyParams(Org,Dest:TParams);
var i:integer;
begin
  for i:=0 to org.count - 1 do
   if dest.findparam(org[i].name) = nil then
     TParam(Dest.Add).Assign(org[i])
   else
     Dest.ParamByName(Org[i].name).Assign(Org[i]);
end;

Function CaminhoExtensao(VPasta:String;Vexts:Array of String):String;
var i,i2:integer;
    SR: TSearchRec;
begin
  try
    result := '';
    I      := FindFirst(VPasta+'*.*',faAnyFile,SR);
    While I = 0 do begin
        if not (Sr.Attr and faDirectory = faDirectory) then begin
            for i2:=0 to Length(Vexts) - 1 do
             if uppercase(ExtractFileExt(sr.Name)) = UpperCase(Vexts[i2]) then begin
               result := ExtractFilePath(VPasta)+Sr.Name;
               exit;
             end;
        end;
        I := FindNext(SR);
    end;
  finally
    SysUtils.Findclose(Sr);
  end;
end;

Function NextFocusTbSheet(FControl:TWinControl;Ind:Integer=1):TWinControl;
var
FList        : TList;
FlistParent  : Tlist;
FWinControl,Fparent     : TWinControl;
FPageControl:TPageControl;
FIndPage,I : Word;
i2 : integer;
F:boolean;
begin
     with FControl do begin
             f := False;
             FParent := Parent;
             While (FParent <> Nil) and (FParent <> Owner) and Not(FParent is TTabSheet) do
              FParent := FParent.Parent;

             If (FParent is TTabSheet)  then begin
               FList := TList.Create;
               FParent.GetTabOrderList(FList);
               I := Flist.Count;
               If Ind >= 0 Then begin
                 if Flist.IndexOf(FControl) + 1 <= Flist.Count - 1 then
                     for i:=Flist.IndexOf(FControl) + 1 to Flist.Count - 1 do
                         If  (TWinControl(FList[I]).CanFocus)
                         and (TWinControl(FList[I]).TabStop)
                         and (TWinControl(FList[I]).DockClientCount = 0)  then
                           Break;
               end else begin
                 I := Flist.IndexOf(FControl);
                 if Flist.IndexOf(FControl) > 0 then
                     for i:=0 to Flist.IndexOf(FControl) - 1 do
                         If  (TWinControl(FList[I]).CanFocus)
                         and (TWinControl(FList[I]).TabStop)
                         and (TWinControl(FList[I]).DockClientCount = 0)  then
                           Break;
               end;


               If ((Ind >= 0) And (I = Flist.Count)) or ((Ind < 0) And (I = Flist.IndexOf(FControl))) then begin
                  FPageControl := TPageControl(FParent.Parent);
                  if Ind >= 0 then begin
                    FindPage     := IIFS(TPageControl(FParent.Parent).ActivePageIndex = TPageControl(FParent.Parent).PageCount - 1
                                    ,0,TPageControl(FParent.Parent).ActivePageIndex + 1);
                    F            := TPageControl(FParent.Parent).ActivePageIndex <> TPageControl(FParent.Parent).PageCount - 1;
                  end else begin
                    FindPage     := IIFS(TPageControl(FParent.Parent).ActivePageIndex = 0
                                    ,TPageControl(FParent.Parent).PageCount - 1,TPageControl(FParent.Parent).ActivePageIndex - 1);
                    F            := TPageControl(FParent.Parent).ActivePageIndex <> 0;
                  end;

                  while (FPageControl.pages[findpage].ControlCount = 0)
                        or Not FPageControl.pages[findpage].Enabled
                        or Not FPageControl.pages[findpage].TabVisible do begin
                    If (FIndPage = Ttabsheet(FParent).PageIndex) then
                      break;
                    FIndPage := FindPage + iifs(Ind >= 0,1,-1);
                  end;

                  If F and (FIndPage <> Ttabsheet(FParent).PageIndex) then begin
                      F := False;
                      FPageControl.Pages[FIndPage].GetTabOrderList(FList);
                      if Ind >= 0 then begin
                        for i:=0 to Flist.Count - 1 do
                             If  (TWinControl(FList[I]).CanFocus)
                             and (TWinControl(FList[I]).TabStop)
                             and (TWinControl(FList[I]).DockClientCount = 0)  then begin
                                FPageControl.ActivePageIndex := findpage;
                                f:= True;
                                Break;
                             end;
                      end else begin
                         for i:=Flist.Count - 1 downto 0  do
                             If  (TWinControl(FList[I]).CanFocus)
                             and (TWinControl(FList[I]).TabStop)
                             and (TWinControl(FList[I]).DockClientCount = 0)  then begin
                                FPageControl.ActivePageIndex := findpage;
                                f:= True;
                                Break;
                             end;

                         FPageControl.Pages[FPageControl.ActivePageIndex].GetTabOrderList(FList);

                         for i2:=FList.Count - 1 downto 0 do
                             If  (TWinControl(FList[i2]).CanFocus)
                             and (TWinControl(FList[i2]).TabStop)
                             and (TWinControl(FList[i2]).DockClientCount = 0)  then begin
                               HabilitaTabSheets(TWinControl(FList[i2]));
                               TWinControl(FList[i2]).Setfocus;
                               Break;
                             end;
                      end;
                  end;
                  
               end;
               Flist.Destroy;
             end;

             If Not F then begin
                 FWinControl := SelectNextFocus(FControl,iifs(ind >= 0,1,-1),TCustomForm(Owner));
                 If (FWinControl is TPageControl) then begin
                     While (FWincontrol is TPageControl) do
                       FWinControl := SelectNextFocus(FWincontrol,iifs(ind >= 0,1,-1),TCustomForm(Owner));

                     If (FWinControl <> FControl) and (FWinControl <> Nil) then begin
                         HabilitaTabSheets(FWinControl);
                         FWinControl.SetFocus;
                     end;  
                 end else
                   TCustomForm(Owner).perform(Wm_NextDlgCtl,iifs(ind >= 0,0,-1),0);
            end;
     end;

     for i:=2 to Abs(Ind) do
      NextFocusTbSheet(TCustomForm(FControl.Owner).ActiveControl);
end;


function FileLastModified(const TheFile: string):TdateTime;
var
  FileH: THandle;
  LocalFT: TFileTime;
  DosFT: DWORD;
  LastAccessedTime: TDateTime;
  FindData: TWin32FindData;
begin
  Result := 0;


  FileH := FindFirstFile(PChar(TheFile), FindData);
  if FileH <> INVALID_HANDLE_VALUE then
  begin
   Windows.FindClose(FileH) ;
   if (FindData.dwFileAttributes AND
       FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
     FileTimeToLocalFileTime(FindData.ftLastWriteTime, LocalFT);
     FileTimeToDosDateTime(LocalFT,LongRec(DosFT).Hi, LongRec(DosFT).Lo);
     LastAccessedTime := FileDateToDateTime(DosFT);
     Result := LastAccessedTime;
    end;
 end;
end;

Function PopMenuParent(FParent:TControl;Union:Boolean=False):TPopupMenu;
var
i:integer;
begin
    Result := Nil;
    While FParent <> Nil do Begin
      if TEdit(FParent).PopupMenu <> Nil then begin
        If Assigned(TEdit(FParent).PopupMenu.OnPopup) then
         TEdit(FParent).PopupMenu.OnPopup(TEdit(FParent).PopupMenu);
        If Result = Nil Then
           Result := TPopupMenu.Create(FParent)
         else begin
           Result.Items.Add(TMenuItem.Create(Result));
           Result.Items[Result.Items.Count - 1].Caption := '-';
         end;

         for i:=0 to TEdit(FParent).PopupMenu.Items.count - 1 do begin
           If not TEdit(FParent).PopupMenu.Items[i].Visible then
            continue;

           Result.Items.Add(TMenuItem.Create(Result));
           
           Result.Items[Result.Items.Count - 1].Caption := TEdit(FParent).PopupMenu.Items[i].Caption;
           Result.Items[Result.Items.Count - 1].OnClick := TEdit(FParent).PopupMenu.Items[i].OnClick;
           Result.Items[Result.Items.Count - 1].Tag     := TEdit(FParent).PopupMenu.Items[i].Tag;
           Result.Items[Result.Items.Count - 1].Enabled := TEdit(FParent).PopupMenu.Items[i].Enabled;
           Result.Items[Result.Items.Count - 1].Hint := TEdit(FParent).PopupMenu.Items[i].Hint;
           Result.Items[Result.Items.Count - 1].HelpContext := TEdit(FParent).PopupMenu.Items[i].HelpContext;
         end;
      end;
      if not union then
       exit;
      FParent := FParent.Parent;
    end;
end;

function CriaCampoBd(BancoDados,Tabela,Campo,Tipo:String):Boolean;
begin
  Result := False;
  with TQuery.Create(Application) do
   try
     try
       DataBaseName := BancoDados;
       Sql.Add('Alter Table '+Tabela+' Add '+Campo+' '+Tipo);
       Execsql;
       Result := True;
     except
     end;
   finally
    destroy;
   end;
end;


Function LocateGlobalStr(FDataSet:TdataSet;Campos:String;FValues:Array of Variant;FContinua:Boolean=False):Boolean;
Var
FList:TStringList;
begin
    FList := SeparaString(Campos);
    try
      Result := LocateGlobal(FDataSet,FList,FValues,FContinua);
    finally
      Flist.Destroy;
    end;
end;


begin
DataValidaDM    := 0;
DataValidaDMini := 0;
DataValidaDMnao := 0;
HORAMLOCAL:= 0;
MENSAGEMDATEM:= 1;
FfocusgradeGridCons:=false;
end.
