unit GrupoDeTrabalho;

interface
Uses Classes,Forms,DbTables,Registro,TipoDef;

Type
  //varInteger,varCurrency,varDate ,varBoolean,varString
  TGrupoTrabalho = class(TComponent)
  private
    { Private declarations }
    FCodigo       : String ;
    FDescricao    : String;
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
    Function Recupera : Boolean;
    Procedure Exclui;
    Procedure Ativa;
  published
    { Published declarations }
    property Codigo     : String    Read FCodigo        write FCodigo       ;
    property Descricao  : String    Read FDescricao     write FDescricao    ;
    property BancoDeDados : TDataBase read FDataBase write FDataBase;
  end;

procedure Register;

Implementation

constructor TGrupoTrabalho.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TRegistro.Create;
    FRegistro1.Ativar;
    FRegistro1.Tabela := 'GRUPODETRABALHO';
    FAtivado   := False;
end;

destructor  TGrupoTrabalho.Destroy ;
Begin
  FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TGrupoTrabalho.GravaReg;
Begin
        SetValue;
        FRegistro1.Grava;
End;

Function TGrupoTrabalho.Recupera :Boolean;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    Result := FRegistro1.Recupera;
    GetValue;
End;

Procedure TGrupoTrabalho.Exclui;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Exclui;
End;

Procedure TGrupoTrabalho.SetValue;
Begin
        FRegistro1.AddValue('CODIGO'           ,FCodigo       );
        FRegistro1.AddValue('DESCRICAO'             ,FDescricao    );
End;


Procedure TGrupoTrabalho.GetValue;
Begin
    FCodigo       :=  FRegistro1.GetValue('CODIGO'          );
    FDescricao    :=  FRegistro1.GetValue('DESCRICAO'            );
End;


Procedure TGrupoTrabalho.Ativa;
Begin
    If FAtivado Then Exit;

    FRegistro1.BancoDeDados := FDataBase;
    FRegistro1.AddChave('CODIGO'     ,varString);
    FRegistro1.Add('DESCRICAO'            ,VarString);
    FAtivado := True;
End;

procedure Register;
begin
  RegisterComponents('Entidades', [TGrupoTrabalho]);
end;

End.
