unit Direito;

interface
Uses Classes,Forms,DbTables,Registro,TipoDef;

Type
  TDireito = class(TComponent)
  private
    { Private declarations }
    FCodigo       : String ;
    FSistema      : String ; 
    FCodMenu      : Word;
    FDireitos     : Word;

    FRegistro1  : TRegistro;
    FAtivado  : Boolean;
    FDataBase : TDataBase;

    Procedure SetValue;
    Procedure GetValue;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    destructor destroy ; override;
  public
    { Public declarations }
    Procedure GravaReg;
    Function  Recupera : Boolean;
    Procedure Exclui;
    Procedure Ativa;
    Procedure Proximo;
  published
    { Published declarations }
    property Codigo     : String   Read FCodigo        write FCodigo  ;
    property CodMenu    : Word     Read FCodMenu       write FCodMenu ;
    property Sistema    : String   Read FSistema       write FSistema ;
    property Direitos   : Word     Read FDireitos      write FDireitos;
    property BancoDeDados : TDataBase read FDataBase write FDataBase;
  end;

procedure Register;

Implementation

constructor TDireito.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TRegistro.Create;
    FRegistro1.Ativar;
    FRegistro1.Tabela := 'DIREITOS';
    FAtivado   := False;
end;

destructor  TDireito.Destroy ;
Begin
  FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TDireito.GravaReg;
Begin
        SetValue;
        FRegistro1.Grava;
End;

Function TDireito.Recupera : Boolean;
Begin
    FRegistro1.AddValue('CODGRUPO'     ,FCodigo);
    FRegistro1.AddValue('CODMENU'     ,FCodMenu);
    FRegistro1.AddValue('SISTEMA'     ,FSistema);

    Result := FRegistro1.Recupera;
    GetValue;
End;


Procedure TDireito.Exclui;
Begin
    FRegistro1.AddValue('CODGRUPO'     ,FCodigo);
    FRegistro1.AddValue('CODMENU'     ,FCodMenu);
    FRegistro1.AddValue('SISTEMA'     ,FSistema);
    FRegistro1.Exclui;
End;

Procedure TDireito.SetValue;
Begin
        FRegistro1.AddValue('CODGRUPO'           ,FCodigo       );
        FRegistro1.AddValue('SISTEMA'            ,FSistema      );
        FRegistro1.AddValue('CODMENU'             ,FCodMenu    );
        FRegistro1.AddValue('DIREITO'             ,FDireitos    );
End;


Procedure TDireito.GetValue;
Begin
    FCodigo       :=  FRegistro1.GetValue('CODGRUPO'          );
    FCodMenu      :=  FRegistro1.GetValue('CODMENU'            );
    FSistema      :=  FRegistro1.GetValue('SISTEMA'            );
    FDireitos     :=  FRegistro1.GetValue('DIREITO'            );

End;


Procedure TDireito.Ativa;
Begin
    If FAtivado Then Exit;

    FRegistro1.BancoDeDados := FDataBase;
    FRegistro1.AddChave('CODGRUPO'   ,varString);
    FRegistro1.AddChave('CODMENU'    ,VarInteger);
    FRegistro1.AddChave('SISTEMA'    ,VarString);
    FRegistro1.Add('DIREITO'         ,VarInteger);
    FAtivado := True;
End;

Procedure TDireito.Proximo;
Begin
    FRegistro1.RecNext;
End;

procedure Register;
begin
  RegisterComponents('Entidades', [TDireito]);
end;

End.
