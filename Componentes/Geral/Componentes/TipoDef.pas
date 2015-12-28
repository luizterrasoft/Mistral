unit TipoDef;

interface
Type
//  *********Tipo criado para ser usado em campo e registro *************************
     TTipoCampo = (varInteger,varCurrency,varDate ,varBoolean,varString,VarMemo,VarGraphic,VarDouble,VarNull);
 //  *********** fim ****************

Function IIFs(Value1:Boolean;Value2,Value3:Variant) : Variant;

implementation

Function IIFs(Value1 : Boolean;Value2,Value3:Variant) : Variant;
Begin
    If Value1 Then Result := Value2 Else Result := Value3;
End;


end.



