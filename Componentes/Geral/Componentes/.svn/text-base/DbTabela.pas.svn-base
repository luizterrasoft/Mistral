unit DbTabela;

interface
Uses Classes,Forms,DbTables,DbRegistro,TipoDef;

Type
  TDbTabela = class(TComponent)
  private
    { Private declarations }
    FTabela    : String;
    FDataBaseName : TDataBase;
    FRegistro1 : TDbRegistro;
    FAtivado : Boolean;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    Procedure Ativa;
    destructor destroy ; override;
    Procedure GravaReg;
    Procedure Recupera;
    Procedure Exclui;
    Procedure Adiciona(VarCampo : String ; VarTipo : TTipoCampo;Objeto : TObject; VarChave : Boolean);
  published
    { Published declarations }
    Property Tabela : String read FTabela write FTabela;
    Property DataBaseName : TDataBase read FDataBaseName write FDataBaseName;
  end;

procedure Register;

Implementation

constructor TDbTabela.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TDbRegistro.Create;
    FAtivado := False;
end;

Procedure TDbTabela.Ativa;
Begin
    If Not FAtivado Then Begin
      FRegistro1.Tabela := FTabela;
      FRegistro1.BancoDeDados := FDataBaseName;
      FRegistro1.Ativar;
      FAtivado := True;
    End;
End;

destructor  TDbTabela.Destroy ;
Begin
  FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TDbTabela.GravaReg;
Begin
        //SetValue;
        FRegistro1.Grava;
End;

Procedure TDbTabela.Recupera;
Begin
//    FRegistro1.AddValue('CODIGO'     ,FCodigo);
      FRegistro1.LerChaves;
      FRegistro1.Recupera;
      FRegistro1.EscreveValores;
//    GetValue;
End;

Procedure TDbTabela.Exclui;
Begin
//    FRegistro1.AddValue('CODIGO'     ,FCodigo);
//    FRegistro1.Exclui;
End;

{Procedure TDbTabela.SetValue;
Begin
{        FRegistro1.AddValue('DESCRICAO'  ,FDescricao);
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


        FRegistro1.AddValue('CODIGO'     ,FCodigo);
End;}


{Procedure TDbTabela.GetValue;
Begin
{     FDescricao  :=  FRegistro1.GetValue('DESCRICAO'  );
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

     FCodServ    :=  FRegistro1.GetValue('CODSERV'    );
     FCFO        :=  FRegistro1.GetValue('CFO'        );
     FCodTrib    :=  FRegistro1.GetValue('CODTRIB'    );
     FMensagem   :=  FRegistro1.GetValue('MENSAGEM'   );
     FRelVenda   :=  IIfs(FRegistro1.GetValue('RELVENDA'   ) = 'S',True,False);
     FEntSai     :=  FRegistro1.GetValue('TIPO'       );
     FCliente    :=  FRegistro1.GetValue('CLIENTE'    );
     FNatureza   :=  FRegistro1.GetValue('NATUREZA'   );
     FModelo     :=  FRegistro1.GetValue('MODELO'   );
     FCodigo     :=  FRegistro1.GetValue('CODIGO'     );
End; }


Procedure TDbTabela.Adiciona(VarCampo : String ; VarTipo : TTipoCampo;Objeto : TObject;VarChave:Boolean);
Begin
    FRegistro1.Add(VarCampo,VarTipo ,Objeto,VarChave);
End;

procedure Register;
begin
  RegisterComponents('Sistema Db', [TDbTabela]);
end;

End.
