unit TipoDeOperacao;

interface
Uses Classes,Forms,DbTables,Registro,TipoDef,ObjSelecao,FuncoesGlobais,SysUtils,Db,stdctrls;

Type
  //varInteger,varCurrency,varDate ,varBoolean,varString
  ES = String[1];
  TTipoDeOperacao = class(TComponent)
  private
    { Private declarations }
    FCodigo : String ;
    FDescricao : String;
    FIcms : Boolean;
    FIpi   : Boolean;
    FIpiBaseIcms : Boolean;
    FIss : Boolean;
    FPis : Boolean;
    FCofins : Boolean;
    FSubstTrib : Boolean;
    FII : Boolean;
    FMovEst : Boolean;
    FCusto : Boolean;
    FDev   : Boolean;
    FTransf : Boolean;
    FInterno : Boolean;
    FBoleto  : Boolean;
    FFinanc   : Boolean;
    FCodServ : String;
    FCFO : String;
    FCodTrib : String;
    FMensagem : String;
    FEntSai   : ES;
    FCliente  : ES;
    FRelVenda : Boolean;
    FDataBase : TDataBase;
    FNatureza : String;
    FModelo   : String;
    FConsumo  : Boolean;
    FISSDestacado : Boolean;

    FFinancOrc  : Boolean;
    FFinancPed  : Boolean;
    FMovEstOrc  : Boolean;
    FMovEstPed  : Boolean;

    FRegistro1 : TRegistro;
    FAtivado  : Boolean;
    FDevolucaoDocumento : Boolean;
    FTipoTabPreco: String;

    FEmprestimo: Boolean;
    FRetEmprestimo: Boolean;
    FSubCategoria: Integer;
    FCategoria: Integer;
    FConta: String;
    FSituacao: String;
    FSeqAutomatico: Boolean;
    FGeraPedido: Boolean;
    FVERIFICAATEND: Boolean;
    FLimiteCred: Boolean;
    FNCLIENTEATEND: Boolean;
    FATENDAUT: Boolean;
    FCALCCOMISSAO: Boolean;
    FALTERARPRECO: Boolean;
    FMediaAltPreco: Integer;
    FCadSelecao: TCadSelecao;
    FTipoDeVariacao: String;
    FFreteDest: Boolean;
    FFxAtendAut: Boolean;
    FDesabCed: Boolean;
    FCriaNDoc: Boolean;
    Fnverifqatend: Boolean;
    FImpAfterAlt: Boolean;
    FConfigImpAlt: Boolean;
    FConfigImp: Boolean;
    FPergImp: Boolean;
    FNVERIFATENDEMP: Boolean;
    FPergDuplItem: Boolean;
    FINSITEMAUT: Boolean;
    Procedure SetValue;
    Procedure GetValue;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    destructor destroy ; override;
    Function IIFs(Value1:Boolean;Value2,Value3:Variant) : Variant;
  public
    { Public declarations }
    ImpAut         :Boolean;
    ImpFinanc      :Boolean;
    FinancAut      :Boolean;
    FinancObr      :Boolean;
    AltComiss      :Boolean;
    ImpTxt         :Boolean;
    ImpDadosEmpresa:Boolean;
    ImpTransp      :Boolean;
    ImpFP          :Boolean;
    IMPOBSCED      :Boolean;
    AlteraData     :Boolean;
    AlteraPreco    :Boolean;
    IMPRESFAV      :Boolean;
    IMPDESCPRODPERC      :Boolean;
    DesabilitaDesctProd: Boolean;
    StrechImpDesc: Boolean;
    LTCRED: Boolean;
    Procedure GravaReg;
    Procedure Recupera;
    Procedure Exclui;
    Procedure Ativa;
  published
    { Published declarations }
    property Codigo : String read FCodigo write FCodigo;
    property Descricao : String read FDescricao write FDescricao;
    property Icms : Boolean read FIcms write FIcms default False;
    property Ipi   : Boolean read FIpi write FIpi Default False;
    property IpiBaseIcms : Boolean read FIpiBaseIcms write FIpiBaseIcms default False;
    property Iss : Boolean read FIss write FIss default False;
    property Pis : Boolean read FPis write FPis default False;
    property Cofins : Boolean read FCofins write FCofins default false;
    property SusbtTrib : Boolean read FSubstTrib write FSubstTrib default False;
    property II : Boolean read FII write FII default False;
    property MovEst : Boolean read FMovEst write FMovEst default False;
    property Custo : Boolean read FCusto write FCusto default False;
    property Dev   : Boolean read FDev write FDev default False;
    property Transf : Boolean read FTransf write FTransf Default False;
    property Interno : Boolean read FInterno write FInterno Default False;
    property Boleto  : Boolean read FBoleto write FBoleto Default False;
    property Financ  : Boolean read FFinanc write FFinanc Default False;
    property CodServ : String read FCodServ write FCodServ;
    property CFO : String read FCfo write FCfo;
    property CodTrib : String read FCodTrib write FCodTrib;
    property Mensagem : String read FMensagem write FMensagem;
    property EntSai  : ES read FEntSai write FEntSai;
    property Cliente  : ES read FCliente write FCliente;
    property RelVenda : Boolean read FRelVenda write FRelVenda;
    property BancoDeDados : TDataBase read FDataBase write FDataBase;
    Property Natureza  : String read FNatureza write FNatureza;
    property Modelo    : String read FModelo write FModelo;
    property Consumo   : Boolean read FConsumo write FConsumo default False;
    property FinancOrc  : Boolean read FFinancOrc   write  FFinancOrc   default False ;
    property FinancPed  : Boolean read FFinancPed   write  FFinancPed   default False ;
    property MovEstOrc  : Boolean read FMovEstOrc   write  FMovEstOrc   default False ;
    property MovEstPed  : Boolean read FMovEstPed   write  FMovEstPed   default False ;
    property IssDestacado  : Boolean read FIssDestacado   write  FIssDestacado   default False ;
    property DevolucaoDocumento  : Boolean read FDevolucaoDocumento   write  FDevolucaoDocumento   default False ;
    property TipoTabPreco  : String read FTipoTabPreco   write  FTipoTabPreco ;
    property Conta  : String read FConta   write  FConta ;
    property Situacao  : String read FSituacao   write  FSituacao ;
    property Categoria  : Integer read FCategoria   write  FCategoria ;
    property SubCategoria  : Integer read FSubCategoria   write  FSubCategoria ;
    property Emprestimo  : Boolean read FEmprestimo   write  FEmprestimo ;
    property RetEmprestimo  : Boolean read FRetEmprestimo   write  FRetEmprestimo ;
    property SeqAutomatico  : Boolean read FSeqAutomatico   write  FSeqAutomatico ;
    property GeraPedido  : Boolean read FGeraPedido   write  FGeraPedido ;
    property VERIFICAATEND  : Boolean read FVERIFICAATEND   write  FVERIFICAATEND ;
    property LimiteCred  : Boolean read FLimiteCred   write  FLimiteCred ;
    property ATENDAUT  : Boolean read FATENDAUT   write  FATENDAUT;
    property CALCCOMISSAO  : Boolean read FCALCCOMISSAO   write  FCALCCOMISSAO;
    property NCLIENTEATEND  : Boolean read FNCLIENTEATEND   write  FNCLIENTEATEND;
    property ALTERARPRECO  : Boolean read FALTERARPRECO   write  FALTERARPRECO;
    property MediaAltPreco  : Integer read FMediaAltPreco   write  FMediaAltPreco;
    property CadSelecao     : TCadSelecao read FCadSelecao   write  FCadSelecao;
    property TipoDeVariacao : String read FTipoDeVariacao   write  FTipoDeVariacao;
    property FreteDest  : Boolean read FFreteDest   write  FFreteDest;
    property FxAtendAut  : Boolean read FFxAtendAut   write  FFxAtendAut;
    property DesabCed  : Boolean read FDesabCed   write  FDesabCed;
    property CriaNDoc  : Boolean read FCriaNDoc   write  FCriaNDoc;
    property ImpAfterAlt  : Boolean read FImpAfterAlt   write  FImpAfterAlt;
    property nverifqatend  : Boolean read Fnverifqatend   write  Fnverifqatend;
    property ConfigImpAlt  : Boolean read FConfigImpAlt   write  FConfigImpAlt;
    property ConfigImp  : Boolean read FConfigImp   write  FConfigImp;
    property PergImp  : Boolean read FPergImp   write  FPergImp;
    property NVERIFATENDEMP  : Boolean read FNVERIFATENDEMP   write  FNVERIFATENDEMP;
    property INSITEMAUT  : Boolean read FINSITEMAUT   write  FINSITEMAUT;
    property PergDuplItem  : Boolean read FPergDuplItem   write  FPergDuplItem;
  end;
  
procedure Register;

Implementation

constructor TTipoDeOperacao.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TRegistro.Create;
    FRegistro1.Ativar;
    FRegistro1.Tabela := 'TIPODEOPERACAO';
    FTipoTabPreco := 'C';
    FAtivado   := False;
end;

destructor  TTipoDeOperacao.Destroy ;
Begin
  FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TTipoDeOperacao.GravaReg;
Begin
        SetValue;
        FRegistro1.Grava;
End;

Procedure TTipoDeOperacao.Recupera;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Recupera;
    GetValue;
End;

Function TTipoDeOperacao.IIFs(Value1 : Boolean;Value2,Value3:Variant) : Variant;
Begin
    If Value1 Then Result := Value2 Else Result := Value3;
End;

Procedure TTipoDeOperacao.Exclui;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Exclui;
End;

Procedure TTipoDeOperacao.SetValue;
var i:integer;
Begin
        FRegistro1.AddValue('DESCRICAO'  ,FDescricao);
        FRegistro1.AddValue('ICMS'       ,IIFs(FIcms,'S','N'));
        FRegistro1.AddValue('IPI'        ,IIFs(FIpi,'S','N'));
        FRegistro1.AddValue('IPIBASEICMS',IIFs(FIpiBaseIcms,'S','N'));
        FRegistro1.AddValue('ISS'        ,IIFs(FIss,'S','N'));
        FRegistro1.AddValue('PIS'        ,IIFs(FPis,'S','N'));
        FRegistro1.AddValue('COFINS'     ,IIFs(FCofins,'S','N'));
        FRegistro1.AddValue('SUBSTTRIB'  ,IIFs(FSubstTrib,'S','N'));
        FRegistro1.AddValue('II'         ,IIFs(FII,'S','N'));
        FRegistro1.AddValue('MOVEST'     ,IIFs(FMovEst,'S','N'));
        FRegistro1.AddValue('CUSTO'      ,IIFs(FCusto,'S','N'));
        FRegistro1.AddValue('DEV'        ,IIFs(FDev,'S','N'));
        FRegistro1.AddValue('TRANSF'     ,IIFs(FTransf,'S','N'));
        FRegistro1.AddValue('INTERNO'    ,IIFs(FInterno,'S','N'));
        FRegistro1.AddValue('BOLETO'     ,IIFs(FBoleto,'S','N'));
        FRegistro1.AddValue('FINANC'     ,IIFs(FFinanc,'S','N'));
        FRegistro1.AddValue('CODSERV'    ,FCodServ);
        FRegistro1.AddValue('CFO'        ,FCFO);
        FRegistro1.AddValue('CODTRIB'    ,FCodTrib);
        FRegistro1.AddValue('MENSAGEM'   ,FMensagem);
        FRegistro1.AddValue('RELVENDA'   ,IIFs(FRelVenda,'S','N'));
        FRegistro1.AddValue('TIPO'       ,FEntSai) ;
        FRegistro1.AddValue('CLIENTE'    ,FCliente) ;
        FRegistro1.AddValue('NATUREZA'   ,FNatureza) ;
        FRegistro1.AddValue('MODELO'     ,FModelo) ;
        FRegistro1.AddValue('CONSUMO'    ,IIFs(FConsumo,'S','N'));

        FRegistro1.AddValue('FINANCORC'  ,IIFs(FFinancOrc,'S','N'));
        FRegistro1.AddValue('FINANCPED'  ,IIFs(FFinancPed,'S','N'));
        FRegistro1.AddValue('MOVESTORC'  ,IIFs(FMovEstOrc,'S','N'));
        FRegistro1.AddValue('MOVESTPED'  ,IIFs(FMovEstPed,'S','N'));
        FRegistro1.AddValue('ISSDESTACADO',IIFs(FISSDestacado,'S','N'));
        FRegistro1.AddValue('DEVOLUCAODOCUMENTO'    ,IIFs(FDevolucaoDocumento,'S','N'));
        FRegistro1.AddValue('CLIENTEVENDEDOR',FTipoTabPreco);
        FRegistro1.AddValue('EMPRESTIMO'    ,IIFs(FEMPRESTIMO,'S','N'));
        FRegistro1.AddValue('SEQAUTOMATICO'    ,IIFs(FSEQAUTOMATICO,'S','N'));
        FRegistro1.AddValue('GERAPEDIDO'    ,IIFs(FGeraPedido,'S','N'));
        FRegistro1.AddValue('VERIFICAATEND'    ,IIFs(FVERIFICAATEND,'S','N'));
        FRegistro1.AddValue('LIMITECRED'    ,IIFs(FLimiteCred,'S','N'));

        FRegistro1.AddValue('RETORNOEMPRESTIMO'    ,IIFs(FRETEMPRESTIMO,'S','N'));
        FRegistro1.AddValue('CONTA'     ,FCONTA);
        FRegistro1.AddValue('CATEGORIA'     ,FCATEGORIA);
        FRegistro1.AddValue('SUBCATEGORIA'     ,FSUBCATEGORIA);
        FRegistro1.AddValue('SITUACAO'     ,FSITUACAO);

        FRegistro1.AddValue('IMPAUT'    ,IIFs(ImpAut         ,'S','N'));
        FRegistro1.AddValue('IMPFINANC'    ,IIFs(ImpFinanc      ,'S','N'));
        FRegistro1.AddValue('FINANCAUT'    ,IIFs(FinancAut      ,'S','N'));
        FRegistro1.AddValue('FINANCOBR'    ,IIFs(FinancObr      ,'S','N'));
        FRegistro1.AddValue('ALTCOMISS'    ,IIFs(AltComiss      ,'S','N'));
        FRegistro1.AddValue('IMPTXT'    ,IIFs(ImpTxt         ,'S','N'));
        FRegistro1.AddValue('IMPDADOSEMPRESA'    ,IIFs(ImpDadosEmpresa,'S','N'));
        FRegistro1.AddValue('IMPTRANSP'    ,IIFs(ImpTransp      ,'S','N'));
        FRegistro1.AddValue('IMPFP'    ,IIFs(ImpFP          ,'S','N'));
        FRegistro1.AddValue('IMPOBSCED'    ,IIFs(IMPOBSCED  ,'S','N'));
        FRegistro1.AddValue('ALTERADATA'    ,IIFs(AlteraData     ,'S','N'));
        FRegistro1.AddValue('ALTERAPRECO'    ,IIFs(AlteraPreco    ,'S','N'));
        FRegistro1.AddValue('IMPRESFAV',IIFs(ImpResFav    ,'S','N'));
        FRegistro1.AddValue('IMPDESCPRODPERC'    ,IIFs(IMPDESCPRODPERC,'S','N'));
        FRegistro1.AddValue('DESABILITADESCTPROD',IIFs(DESABILITADESCTPROD,'S','N'));
        FRegistro1.AddValue('STRECHIMPDESC'    ,IIFs(STRECHIMPDESC,'S','N'));
        FRegistro1.AddValue('LTCRED'    ,IIFs(LTCRED,'S','N'));
        FRegistro1.AddValue('NCLIENTEATEND'    ,IIFs(FNCLIENTEATEND,'S','N'));
        FRegistro1.AddValue('ALTERARPRECO'    ,IIFs(FALTERARPRECO,'S','N'));
        FRegistro1.AddValue('FRETEDEST'    ,IIFs(FFRETEDEST,'S','N'));
        FRegistro1.AddValue('FXATENDAUT'    ,IIFs(FXATENDAUT,'S','N'));
        FRegistro1.AddValue('CRIANDOC'    ,IIFs(fCriaNDoc,'S','N'));
        FRegistro1.AddValue('NVERIFQATEND'    ,IIFs(NVERIFQATEND,'S','N'));
        FRegistro1.AddValue('CONFIGIMPALT'    ,IIFs(ConfigImpaLT,'S','N'));
        FRegistro1.AddValue('CONFIGIMP'    ,IIFs(CONFIGIMP,'S','N'));
        FRegistro1.AddValue('PERGIMP'    ,IIFs(PERGIMP,'S','N'));
        FRegistro1.AddValue('PERGDUPLITEM'    ,IIFs(PERGDUPLITEM,'S','N'));
        FRegistro1.AddValue('NVERIFATENDEMP'    ,IIFs(NVERIFATENDEMP,'S','N'));
        FRegistro1.AddValue('INSITEMAUT'    ,IIFs(INSITEMAUT,'S','N'));
        FRegistro1.AddValue('IMPAFTERALT'    ,IIFs(fIMPAFTERALT,'S','N'));
        FRegistro1.AddValue('DESABCED'    ,IIFs(DESABCED,'S','N'));
        FRegistro1.AddValue('ATENDAUT'    ,IIFs(FATENDAUT,'S','N'));
        FRegistro1.AddValue('CALCCOMISSAO'    ,IIFs(FCALCCOMISSAO,'S','N'));

        FRegistro1.AddValue('MEDIAALTPRECO'    ,FMediaAltPreco);
        FRegistro1.AddValue('TIPODEVARIACAO'    ,FTipoDeVariacao);
        FRegistro1.AddValue('CODIGO'     ,FCodigo);

        If FCadSelecao <> Nil Then
          For i:=0 to FCadSelecao.Items.Count - 1 do
            With FCadSelecao.Items[i] do
              FRegistro1.AddValue(Campo,VarAsType(Valor,FDataTypetoVarType(Tipo)));
End;


Procedure TTipoDeOperacao.GetValue;
var i:integer;
Begin
     FDescricao  :=  FRegistro1.GetValue('DESCRICAO'  );
     FIcms       :=  IIfs(FRegistro1.GetValue('ICMS'       ) = 'S',True,False);
     FIpi        :=  IIfs(FRegistro1.GetValue('IPI'        ) = 'S',True,False);
     FIpiBaseIcms:=  IIfs(FRegistro1.GetValue('IPIBASEICMS') = 'S',True,False);
     FIss        :=  IIfs(FRegistro1.GetValue('ISS'        ) = 'S',True,False);
     FPis        :=  IIfs(FRegistro1.GetValue('PIS'        ) = 'S',True,False);
     FCofins     :=  IIfs(FRegistro1.GetValue('COFINS'     ) = 'S',True,False);
     FSubstTrib  :=  IIfs(FRegistro1.GetValue('SUBSTTRIB'  ) = 'S',True,False);
     FII         :=  IIfs(FRegistro1.GetValue('II'         ) = 'S',True,False);
     FMovEst     :=  IIfs(FRegistro1.GetValue('MOVEST'     ) = 'S',True,False);
     FCusto      :=  IIfs(FRegistro1.GetValue('CUSTO'      ) = 'S',True,False);
     FDev        :=  IIfs(FRegistro1.GetValue('DEV'        ) = 'S',True,False);
     FTransf     :=  IIfs(FRegistro1.GetValue('TRANSF'     ) = 'S',True,False);
     FInterno    :=  IIfs(FRegistro1.GetValue('INTERNO'    ) = 'S',True,False);
     FBoleto     :=  IIfs(FRegistro1.GetValue('BOLETO'     ) = 'S',True,False);
     FConsumo    :=  IIfs(FRegistro1.GetValue('CONSUMO'    ) = 'S',True,False);
     FFinanc     :=  IIfs(FRegistro1.GetValue('FINANC'     ) = 'S',True,False);

     FFinancORc   :=  IIfs(FRegistro1.GetValue('FINANCORC'   ) = 'S',True,False);
     FFinancPEd   :=  IIfs(FRegistro1.GetValue('FINANCPED'   ) = 'S',True,False);
     FMovEstOrc   :=  IIfs(FRegistro1.GetValue('MOVESTORC'   ) = 'S',True,False);
     FMovEstPed   :=  IIfs(FRegistro1.GetValue('MOVESTPED'   ) = 'S',True,False);
     FIssDestacado:=  IIfs(FRegistro1.GetValue('ISSDESTACADO'   ) = 'S',True,False);
     FTipoTabPreco:=  FRegistro1.GetValue('CLIENTEVENDEDOR');

     FCodServ    :=  FRegistro1.GetValue('CODSERV'    );
     FCFO        :=  FRegistro1.GetValue('CFO'        );
     FCodTrib    :=  FRegistro1.GetValue('CODTRIB'    );
     FMensagem   :=  FRegistro1.GetValue('MENSAGEM'   );
     FRelVenda   :=  IIfs(FRegistro1.GetValue('RELVENDA'   ) = 'S',True,False);
     FEntSai     :=  FRegistro1.GetValue('TIPO'       );
     FCliente    :=  FRegistro1.GetValue('CLIENTE'    );
     FNatureza   :=  FRegistro1.GetValue('NATUREZA'   );
     FModelo     :=  FRegistro1.GetValue('MODELO'   );

     FEMPRESTIMO   :=  IIfs(FRegistro1.GetValue('EMPRESTIMO'   ) = 'S',True,False);
     FRETEMPRESTIMO   :=  IIfs(FRegistro1.GetValue('RETORNOEMPRESTIMO'   ) = 'S',True,False);
     FSEQAUTOMATICO   :=  IIfs(FRegistro1.GetValue('SEQAUTOMATICO'   ) = 'S',True,False);
     FGERAPEDIDO   :=  IIfs(FRegistro1.GetValue('GERAPEDIDO'   ) = 'S',True,False);
     FVERIFICAATEND   :=  IIfs(FRegistro1.GetValue('VERIFICAATEND') = 'S',True,False);
     FLIMITECRED   :=  IIfs(FRegistro1.GetValue('LIMITECRED') = 'S',True,False);

     FCONTA     :=  FRegistro1.GetValue('CONTA'     );
     FSITUACAO     :=  FRegistro1.GetValue('SITUACAO'     );
     FCATEGORIA     :=  FRegistro1.GetValue('CATEGORIA'     );
     FSUBCATEGORIA     :=  FRegistro1.GetValue('SUBCATEGORIA'     );

     ImpAut                           :=  IIfs(FRegistro1.GetValue('IMPAUT') = 'S',True,False);
     ImpFinanc                        :=  IIfs(FRegistro1.GetValue('IMPFINANC') = 'S',True,False);
     FinancAut                        :=  IIfs(FRegistro1.GetValue('FINANCAUT') = 'S',True,False);
     FinancObr                        :=  IIfs(FRegistro1.GetValue('FINANCOBR') = 'S',True,False);
     AltComiss                        :=  IIfs(FRegistro1.GetValue('ALTCOMISS') = 'S',True,False);
     ImpTxt                           :=  IIfs(FRegistro1.GetValue('IMPTXT') = 'S',True,False);
     ImpDadosEmpresa                  :=  IIfs(FRegistro1.GetValue('IMPDADOSEMPRESA') = 'S',True,False);
     ImpTransp                        :=  IIfs(FRegistro1.GetValue('IMPTRANSP') = 'S',True,False);
     ImpFP                            :=  IIfs(FRegistro1.GetValue('IMPFP') = 'S',True,False);
     IMPOBSCED                        :=  IIfs(FRegistro1.GetValue('IMPOBSCED') = 'S',True,False);
     AlteraData                       :=  IIfs(FRegistro1.GetValue('ALTERADATA') = 'S',True,False);
     AlteraPreco                      :=  IIfs(FRegistro1.GetValue('ALTERAPRECO') = 'S',True,False);
     IMPRESFAV                        :=  IIfs(FRegistro1.GetValue('IMPRESFAV') = 'S',True,False);
     IMPDESCPRODPERC                  :=  IIfs(FRegistro1.GetValue('IMPDESCPRODPERC') = 'S',True,False);
     STRECHIMPDESC                    :=  IIfs(FRegistro1.GetValue('STRECHIMPDESC') = 'S',True,False);
     LTCRED                    :=  IIfs(FRegistro1.GetValue('LTCRED') = 'S',True,False);
     DESABILITADESCTPROD              :=  IIfs(FRegistro1.GetValue('DESABILITADESCTPROD') = 'S',True,False);

     FATENDAUT   :=  IIfs(FRegistro1.GetValue('ATENDAUT') = 'S',True,False);
     FCALCCOMISSAO   :=  IIfs(FRegistro1.GetValue('CALCCOMISSAO') = 'S',True,False);

     FNCLIENTEATEND   :=  IIfs(FRegistro1.GetValue('NCLIENTEATEND') = 'S',True,False);
     FALTERARPRECO   :=  IIfs(FRegistro1.GetValue('ALTERARPRECO') = 'S',True,False);
     FFRETEDEST   :=  IIfs(FRegistro1.GetValue('FRETEDEST') = 'S',True,False);
     FFxAtendAut   :=  IIfs(FRegistro1.GetValue('FXATENDAUT') = 'S',True,False);
     FDESABCED   :=  IIfs(FRegistro1.GetValue('DESABCED') = 'S',True,False);
     FCRIANDOC   :=  IIfs(FRegistro1.GetValue('CRIANDOC') = 'S',True,False);
     FIMPAFTERALT   :=  IIfs(FRegistro1.GetValue('IMPAFTERALT') = 'S',True,False);
     FNVERIFQATEND   :=  IIfs(FRegistro1.GetValue('NVERIFQATEND') = 'S',True,False);
     FCONFIGIMP   :=  IIfs(FRegistro1.GetValue('CONFIGIMP') = 'S',True,False);
     FCONFIGIMPALT   :=  IIfs(FRegistro1.GetValue('CONFIGIMPALT') = 'S',True,False);
     FPERGIMP   :=  IIfs(FRegistro1.GetValue('PERGIMP') = 'S',True,False);
     FPERGDUPLITEM   :=  IIfs(FRegistro1.GetValue('PERGDUPLITEM') = 'S',True,False);
     FNVERIFATENDEMP   :=  IIfs(FRegistro1.GetValue('NVERIFATENDEMP') = 'S',True,False);
     FINSITEMAUT   :=  IIfs(FRegistro1.GetValue('INSITEMAUT') = 'S',True,False);

     FMediaAltPreco   :=  FRegistro1.GetValue('MEDIAALTPRECO');
     FTIPODEVARIACAO   :=  FRegistro1.GetValue('TIPODEVARIACAO');

     FCodigo     :=  FRegistro1.GetValue('CODIGO'     );

     If FCadSelecao <> nil then
      For i:=0 to FCadSelecao.Items.Count - 1 do
       With FCadSelecao.Items[i] do begin
         SetValueObject(Objeto,FRegistro1.GetValue(UpperCase(CAmpo)));
         TEdit(Objeto).OnExit(Objeto);        
      end;
End;


Procedure TTipoDeOperacao.Ativa;
var i:integer;
Begin
    If FAtivado Then Exit;

    FRegistro1.BancoDeDados := FDataBase;
    FRegistro1.AddChave('CODIGO'     ,varString);
    FRegistro1.Add('DESCRICAO'  ,VarString);
    FRegistro1.Add('ICMS'       ,VarString);
    FRegistro1.Add('IPI'        ,VarString);
    FRegistro1.Add('IPIBASEICMS',VarString);
    FRegistro1.Add('ISS'        ,VarString);
    FRegistro1.Add('PIS'        ,VarString);
    FRegistro1.Add('COFINS'     ,VarString);
    FRegistro1.Add('SUBSTTRIB'  ,VarString);
    FRegistro1.Add('II'         ,VarString);
    FRegistro1.Add('MOVEST'     ,VarString);
    FRegistro1.Add('CUSTO'      ,VarString);
    FRegistro1.Add('DEV'        ,VarString);
    FRegistro1.Add('TRANSF'     ,VarString);
    FRegistro1.Add('INTERNO'    ,VarString);
    FRegistro1.Add('BOLETO'     ,VarString);
    FRegistro1.Add('FINANC'     ,VarString);
    FRegistro1.Add('CODSERV'    ,VarString);
    FRegistro1.Add('CFO'        ,VarString);
    FRegistro1.Add('CODTRIB'    ,VarString);
    FRegistro1.Add('MENSAGEM'   ,VarString);
    FRegistro1.Add('RELVENDA'   ,VarString);
    FRegistro1.Add('TIPO'       ,VarString);
    FRegistro1.Add('CLIENTE'    ,VarString);
    FRegistro1.Add('NATUREZA'   ,VarString);
    FRegistro1.Add('MODELO'     ,VarString);
    FRegistro1.Add('CONSUMO'    ,VarString);

    FRegistro1.Add('FINANCORC'    ,VarString);
    FRegistro1.Add('FINANCPED'    ,VarString);
    FRegistro1.Add('MOVESTORC'    ,VarString);
    FRegistro1.Add('MOVESTPED'    ,VarString);
    FRegistro1.Add('ISSDESTACADO' ,VarString);
    FRegistro1.Add('CLIENTEVENDEDOR' ,VarString);
    FRegistro1.Add('EMPRESTIMO' ,VarString);
    FRegistro1.Add('SEQAUTOMATICO' ,VarString);
    FRegistro1.Add('GERAPEDIDO' ,VarString);
    FRegistro1.Add('VERIFICAATEND' ,VarString);
    FRegistro1.Add('LIMITECRED' ,VarString);
    FRegistro1.Add('RETORNOEMPRESTIMO' ,VarString);
    FRegistro1.Add('CONTA' ,VarString);
    FRegistro1.Add('SITUACAO' ,VarString);
    FRegistro1.Add('CATEGORIA' ,VarInteger);
    FRegistro1.Add('SUBCATEGORIA' ,VarInteger);

    FRegistro1.Add('IMPAUT' ,VarString);
    FRegistro1.Add('IMPFINANC' ,VarString);
    FRegistro1.Add('FINANCAUT' ,VarString);
    FRegistro1.Add('FINANCOBR' ,VarString);
    FRegistro1.Add('ALTCOMISS' ,VarString);
    FRegistro1.Add('IMPTXT' ,VarString);
    FRegistro1.Add('IMPDADOSEMPRESA' ,VarString);
    FRegistro1.Add('IMPTRANSP' ,VarString);
    FRegistro1.Add('IMPFP' ,VarString);
    FRegistro1.Add('IMPOBSCED' ,VarString);
    FRegistro1.Add('ALTERADATA' ,VarString);
    FRegistro1.Add('ALTERAPRECO' ,VarString);
    FRegistro1.Add('IMPRESFAV' ,VarString);
    FRegistro1.Add('IMPDESCPRODPERC',VarString);
    FRegistro1.Add('DESABILITADESCTPROD',VarString);
    FRegistro1.Add('STRECHIMPDESC',VarString);
    FRegistro1.Add('LTCRED',VarString);

    FRegistro1.Add('NCLIENTEATEND' ,VarString);
    FRegistro1.Add('ALTERARPRECO' ,VarString);
    FRegistro1.Add('FRETEDEST' ,VarString);
    FRegistro1.Add('FXATENDAUT' ,VarString);
    FRegistro1.Add('CRIANDOC' ,VarString);
    FRegistro1.Add('IMPAFTERALT' ,VarString);
    FRegistro1.Add('NVERIFQATEND' ,VarString);
    FRegistro1.Add('CONFIGIMPALT' ,VarString);
    FRegistro1.Add('CONFIGIMP' ,VarString);
    FRegistro1.Add('PERGIMP' ,VarString);
    FRegistro1.Add('PERGDUPLITEM' ,VarString);
    FRegistro1.Add('NVERIFATENDEMP' ,VarString);
    FRegistro1.Add('INSITEMAUT' ,VarString);
    FRegistro1.Add('DESABCED' ,VarString);
    FRegistro1.Add('ATENDAUT' ,VarString);
    FRegistro1.Add('CALCCOMISSAO' ,VarString);    
    FRegistro1.Add('MEDIAALTPRECO' ,VarInteger);
    FRegistro1.Add('TIPODEVARIACAO' ,VarString);

    If FCadSelecao <> Nil Then
    For i:=0 to FCadSelecao.Items.Count - 1 do
       With FCadSelecao.Items[i] do
           FRegistro1.Add(Campo,IIFs(Tipo in [ftdateTime,ftTime,FtDate],varDate
                                    ,iifs(tipo in [ftinteger,ftword],varinteger
                                    ,iifs(tipo in [ftcurrency,ftfloat,ftbcd],vardouble
                                    ,varstring))));




    FAtivado := True;
End;

procedure Register;
begin
  RegisterComponents('Sistema', [TTipoDeOperacao]);
end;

End.
