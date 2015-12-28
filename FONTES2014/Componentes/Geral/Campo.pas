unit Campo;

interface
Uses TipoDef,Variants;

Type

  TCampo = Class(TObject)
   Private
      FNome : String;
      FTipo : TTipoCampo;
      FValor: Variant;
      FPosicao : Word;
      FChave   : Boolean;
      Procedure SetValor(Value : Variant);
   protected
    {}
   public
    Procedure ClearValue;
   Published
      property Nome : String read FNome write FNome;
      property Tipo : TTipoCampo read FTipo write FTipo;
      property Valor : Variant read FValor write SetValor;
      property Posicao : Word read FPosicao write FPosicao;
      property Chave  : Boolean read FChave write FChave;
  End;

implementation

Procedure TCampo.SetValor(Value : Variant);
Var Resultado : Integer;
Begin
    Resultado := VarType(Value);
    If (Resultado = $0003) or  (Resultado = $0006) or (Resultado = $0007) or (Resultado = $000B) or (Resultado = $0100) Then
        FValor := Value;
End;


Procedure TCampo.ClearValue;
Begin
     Case  FTipo of
        varInteger : FValor := 0;
        varCurrency: FValor := 0.0;
        varDate    : FValor := 0;
        varBoolean : FValor := False;
        varString  : FValor := '';
     End;
End;


end.
