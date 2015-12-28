unit DbCampo;

interface
Uses TipoDef,stdctrls;

Type

  TDbCampo = Class(TObject)
   Private
      FNome : String;
      FTipo : TTipoCampo;
      FValor: Variant;
      FPosicao : Word;
      FChave   : Boolean;
      FObjeto  : TObject;
      Procedure SetValor(Value : Variant);
   protected
    {}
   public
    Procedure ClearValue;
    Procedure ReadValor;
    Procedure PutValor;
   Published
      property Nome : String read FNome write FNome;
      property Tipo : TTipoCampo read FTipo write FTipo;
      property Valor : Variant read FValor write SetValor;
      property Posicao : Word read FPosicao write FPosicao;
      property Chave  : Boolean read FChave write FChave;
      property Objeto : TObject read FObjeto write FObjeto;
  End;

implementation

Procedure TDbCampo.SetValor(Value : Variant);
Var Resultado : Integer;
Begin
    Resultado := VarType(Value);
    If (Resultado = $0003) or  (Resultado = $0006) or (Resultado = $0007) or (Resultado = $000B) or (Resultado = $0100) Then
        FValor := Value;
End;


Procedure TDbCampo.ClearValue;
Begin
     Case  FTipo of
        varInteger : FValor := 0;
        varCurrency: FValor := 0.0;
        varDate    : FValor := 0;
        varBoolean : FValor := False;
        varString  : FValor := '';
     End;
End;

Procedure TDbCampo.ReadValor;
Begin
    If Objeto is TEdit Then
       TEdit(Objeto).Text := FValor;
End;

Procedure TDbCampo.PutValor;
Begin
    If Objeto is TEdit Then
       FValor := TEdit(Objeto).Text;
End;


end.
