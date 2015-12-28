unit Usuario;

interface
Uses Classes,Forms,DbTables,Registro,TipoDef;

Type
  //varInteger,varCurrency,varDate ,varBoolean,varString
  TUsuario = class(TComponent)
  private
    { Private declarations }
    FCodigo  : String ;
    FNome    : String;
    FSenha   : String;
    FSenhaB  : String;
    FGrupo   : String;
    FBarraTarefa : Boolean;
    FAdm     : Boolean;

    FRegistro1  : TRegistro;
    FAtivado  : Boolean;
    FDataBase : TDataBase;
    Procedure SetValue;
    Procedure GetValue;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Empresas :Array of String;
    Procedure GravaReg;
    Function Recupera : Boolean;
    Procedure Exclui;
    Procedure Ativa;
    constructor Create(AOwner: TComponent);override;
    destructor destroy ; override;
  published
    { Published declarations }
    property Codigo  : String  Read FCodigo   write FCodigo  ;
    property Nome    : String  Read FNome     write FNome    ;
    property Senha   : String  Read FSenha    write FSenha   ;
    property SenhaB  : String  Read FSenhaB   write FSenhaB  ;
    property Grupo   : String  Read FGrupo    write FGrupo   ;
    property BarraTarefa : Boolean Read FBarraTarefa Write FBarraTarefa default false;
    property Adm     : Boolean Read FAdm      write FAdm    default false ;
    property BancoDeDados : TDataBase read FDataBase write FDataBase;
  end;

procedure Register;

Implementation

constructor TUsuario.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TRegistro.Create;
    FRegistro1.Ativar;
    FRegistro1.Tabela := 'USUARIO';
    FAtivado   := False;
end;

destructor  TUsuario.Destroy ;
Begin
   FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TUsuario.GravaReg;
Begin
        SetValue;
        FRegistro1.Grava;
End;

Function TUsuario.Recupera : Boolean;
var
Pesquisa:Tquery;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    Result := FRegistro1.Recupera;
    GetValue;

End;

Procedure TUsuario.Exclui;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Exclui;
End;

Procedure TUsuario.SetValue;
Begin
        FRegistro1.AddValue('CODIGO'     ,FCodigo  );
        FRegistro1.AddValue('NOME'       ,FNome    );
        FRegistro1.AddValue('SENHA'      ,FSenha );
        FRegistro1.AddValue('SENHAB'     ,FSenhaB );
        FRegistro1.AddValue('GRUPO'      ,FGrupo  );
        FRegistro1.AddValue('USABARRATAREFA'      ,IIfs(FBarraTarefa,'S','N')  );
        FRegistro1.AddValue('ADMINISTRADOR'      ,IIfs(FAdm,'S','N') );

End;


Procedure TUsuario.GetValue;
Begin
    FCodigo :=  FRegistro1.GetValue('CODIGO'  );
    FNome   :=  FRegistro1.GetValue('NOME'    );
    FSenha  :=  FRegistro1.GetValue('SENHA'   );
    FSenhaB :=  FRegistro1.GetValue('SENHAB'  );
    FGrupo  :=  FRegistro1.GetValue('GRUPO'    );
    FBarraTarefa  :=  IIfs(FRegistro1.GetValue('USABARRATAREFA'    )='S',True,False);
    FAdm    :=  IIfs(FRegistro1.GetValue('ADMINISTRADOR'    )='S',True,False);

End;


Procedure TUsuario.Ativa;
Begin
    If FAtivado Then Exit;

    FRegistro1.BancoDeDados := FDataBase;
    FRegistro1.AddChave('CODIGO'     ,varString);
    FRegistro1.Add('NOME'    ,VarString);
    FRegistro1.Add('SENHA'   ,VarString);
    FRegistro1.Add('SENHAB'  ,VarString);
    FRegistro1.Add('GRUPO'   ,VarString);
    FRegistro1.Add('ADMINISTRADOR'   ,VarString);
    FRegistro1.Add('USABARRATAREFA'  ,VarString);

    FAtivado := True;
End;

procedure Register;
begin
  RegisterComponents('Entidades', [TUsuario]);
end;

End.
