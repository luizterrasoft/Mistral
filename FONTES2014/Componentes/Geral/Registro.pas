unit Registro;

interface
Uses Campo,dbtables,Forms,TipoDef,Db,SysUtils;

Type
  TRegistro = Class(TObject)
   Private
      FTabela : String;
      FBancoDeDados : TDataBase;
      FCampos : Array of TCampo;
      FCamposC: Array of TCampo;
      FTamanho : Word;
      FTamanhoC : Word;
      FPesquisa : TQuery;
      FAchou   : Boolean;
      FOrdQuery : String;
      FFim      : Boolean;
      Procedure SetValor(Var Value1:TCampo ;Value2 : TField);
      Procedure ValorSet(Var Value2 : TParam ; Value1 : TCampo);
      Function FindPosition(Value:String):Word;
      Function Upper(Value:String):String;
      Procedure Ativa;
      Procedure Limpa;
      Function NaoENulo(Value:Word) : Boolean;
   protected
      {}
   public
      Procedure Add(Value1:String;Value2:TTipoCampo);
      Procedure AddChave(Value1:String;Value2:TTipoCampo);
      Procedure AddValue(Value1:String;Value2 : Variant);
      Function GetValue(Value1:String): Variant;
      Procedure SetOrdQuery(Value : String);
      Procedure RecNext;
      Procedure Grava;
      Procedure Exclui;
      Function Recupera : Boolean;
      procedure Ativar;
      procedure Free;
   Published
      property Tabela : String read FTabela write FTabela;
      property BancoDeDados : TDataBase read FBancoDeDados write FBancoDeDados;
      Property Fim  : Boolean read FFim default True;
  End;

implementation

Procedure TRegistro.Add(Value1:String;Value2:TTipoCampo);
Var Objeto : TCampo;
Begin
       Inc(FTamanho);
       SetLength(FCampos,FTamanho);
       Objeto := TCampo.Create;
       FCampos[FTamanho-1] := Objeto;
       FCampos[FTamanho-1].Nome := Upper(Value1);
       FCampos[FTamanho-1].Tipo := Value2;
       FCampos[FTamanho-1].Posicao := FTamanho-1;
       FCampos[FTamanho-1].Chave  := False;
End;


Procedure TRegistro.AddChave(Value1:String;Value2:TTipoCampo);
Var Objeto,Objeto2 : TCampo;
Begin
       Inc(FTamanho);
       SetLength(FCampos,FTamanho);
       Objeto := TCampo.Create;
       FCampos[FTamanho-1] := Objeto;
       FCampos[FTamanho-1].Nome := Upper(Value1);
       FCampos[FTamanho-1].Tipo := Value2;
       FCampos[FTamanho-1].Posicao := FTamanho-1;
       FCampos[FTamanho-1].Chave  := True;

       Inc(FTamanhoC);
       SetLength(FCamposC,FTamanhoC);
       Objeto2 := TCampo.Create;
       FCamposC[FTamanhoC-1] := Objeto;
       FCamposC[FTamanhoC-1].Nome := Upper(Value1);
       FCamposC[FTamanhoC-1].Tipo := Value2;
       FCamposC[FTamanhoC-1].Posicao := FTamanho-1;
       FCamposC[FTamanhoC-1].Chave  := True;
End;

Procedure TRegistro.AddValue(Value1:String;Value2 : Variant);
Var Posicao : Word;
Begin
       Posicao := FindPosition(Value1);

     If FCampos[Posicao].Tipo = VarString Then
          FCampos[Posicao].Valor := Value2
      Else If FCampos[Posicao].Tipo = varInteger Then
          FCampos[Posicao].Valor := Value2
      Else If FCampos[Posicao].Tipo = varBoolean Then
          FCampos[Posicao].Valor := Value2
      Else If FCampos[Posicao].Tipo = varCurrency Then
          FCampos[Posicao].Valor := Value2
      Else If FCampos[Posicao].Tipo = varDate Then
          FCampos[Posicao].Valor := Value2;
End;

Function TRegistro.Upper(Value:String):String;
Var Loop : Word;
Begin
      For Loop := 1 To Length(Value) Do
            If Value[Loop] in ['a'..'z'] Then
               Value[Loop] := Chr(Ord(Value[Loop])-32);
     Result := Value;
End;


Function TRegistro.FindPosition(Value:String) : Word;
Var Loop : Word;
Begin
      Result := 0;
      For Loop := 0 To FTamanho -1 Do
           If Value = FCampos[Loop].Nome Then Begin
                Result := Loop;
                Exit;
           End;
End;

Function TRegistro.GetValue(Value1:String):Variant;
Var Posicao : Word;
Begin
       Posicao := FindPosition(Value1);
       Result := FCampos[Posicao].Valor;
End;

Procedure TRegistro.Ativa;
Begin
      FPesquisa.DataBaseName := 'bd';//BancoDeDados.DatabaseName;
End;

Procedure TRegistro.Grava;
Var Loop : Word;
    Objeto : TParam;
Begin
      Ativa;
      If Not FAchou Then Begin
          With FPesquisa Do Begin
              Sql.Clear;
              Sql.Add('INSERT INTO '+FTabela+' ('+FCampos[0].Nome);

              For Loop := 1 To FTamanho -1 Do
                    Sql.Add(','+FCampos[Loop].Nome);

              Sql.Add(') VALUES ( :'+FCampos[0].Nome);

              Objeto := Params[0];
              ValorSet(Objeto,FCampos[0]);

              For Loop := 1 To FTamanho -1 Do Begin
                 If NaoENulo(Loop) Then Begin
                   Sql.Add(', :'+FCampos[Loop].Nome);
                   Objeto := Params[ParamCount-1];
                   ValorSet(Objeto,FCampos[Loop]);
                 End
                 Else
                    Sql.Add(', NULL');
              End;

              Sql.Add(')');
              ExecSql;
          End;
      End
      Else Begin
          With FPesquisa Do Begin
              Sql.Clear;
              Sql.Add('UPDATE '+FTabela+ ' SET ');

              Sql.Add(FCampos[0].Nome +' = :'+ FCampos[0].Nome);
              Objeto := Params[0];
              ValorSet(Objeto,FCampos[0]);

              For Loop := 1 To FTamanho -1 Do Begin
                  If NaoENulo(Loop) Then Begin
                     Sql.Add(','+FCampos[Loop].Nome +' = :'+ FCampos[Loop].Nome);
                     Objeto := Params[ParamCount-1];
                     ValorSet(Objeto,FCampos[Loop]);
                  End
                  Else
                     Sql.Add(','+FCampos[Loop].Nome +' = Null');
              End;

              If FTamanhoC > 0 Then Begin
                   Sql.Add('WHERE '+FCamposC[0].Nome+' = :' + FCamposC[0].Nome);
                   Objeto := Params[0];
                   ValorSet(Objeto,FCamposC[0]);

                   For Loop := 1 To FTamanhoC-1 Do Begin
                      Sql.Add('AND '+FCamposC[Loop].Nome+' = :' + FCamposC[Loop].Nome);
                      Objeto := Params[ParamCount-1];
                      ValorSet(Objeto,FCamposC[Loop]);
                   End;
              End;

              ExecSql;
          End;
      End;
      Limpa;
End;


Function TRegistro.Recupera;
Var Loop : Word;
    Objeto : TParam;
Begin
      FAchou := True;
      Ativa;
      With FPesquisa Do Begin
          Sql.Clear;
          Sql.Add('SELECT * FROM '+FTabela);
          If FTamanhoC > 0 Then Begin
               Sql.Add('WHERE '+FCamposC[0].Nome+' = :' + FCamposC[0].Nome);
               Objeto := Params[0];
               ValorSet(Objeto,FCamposC[0]);

               For Loop := 1 To FTamanhoC-1 Do Begin
                  Sql.Add('AND '+FCamposC[Loop].Nome+' = :' + FCamposC[Loop].Nome);
                  Objeto := Params[ParamCount-1];
                  ValorSet(Objeto,FCamposC[Loop]);
               End;

               If FOrdQuery <> '' Then
                    Sql.Add('ORDER BY '+FOrdQuery);

               Open;
               If Eof Then
                   FAChou := False;

               FFim := Not FAchou;

               For Loop := 0 To FTamanho -1 Do
                     SetValor(FCampos[Loop],FieldByName(FCampos[Loop].Nome));
          End;
      End;
      Result := FAchou;
End;

Procedure TRegistro.Limpa;
Var Loop : Word;
Begin
     For Loop := 0 To FTamanho-1 Do
           FCampos[Loop].ClearValue;

     For Loop := 0 To FTamanhoC-1 Do
           FCamposC[Loop].ClearValue;

End;


Procedure TRegistro.Exclui;
Var Loop : Word;
    Objeto : TParam;
Begin
      Ativa;
      With FPesquisa Do Begin
          Sql.Clear;
          Sql.Add('DELETE FROM '+FTabela);
          If FTamanhoC > 0 Then Begin
               Sql.Add('WHERE '+FCamposC[0].Nome+' = :' + FCamposC[0].Nome);
               Objeto := Params[0];
               ValorSet(Objeto,FCamposC[0]);

               For Loop := 1 To FTamanhoC-1 Do Begin
                  Sql.Add('AND '+FCamposC[Loop].Nome+' = :' + FCamposC[Loop].Nome);
                  Objeto := Params[ParamCount-1];
                  ValorSet(Objeto,FCamposC[Loop]);
               End;
               ExecSql;
          End;
      End;
End;

Procedure TRegistro.Free;
Var Loop : Word;
Begin
    SetLength(FCampos,0);
    SetLength(FCamposC,0);
    For Loop := 0 To FTamanho -1 Do
         FCampos[Loop].Destroy;

    For Loop := 0 To FTamanhoC -1 Do
         FCamposC[Loop].Destroy;

  If FPesquisa <> Nil  Then
      FPesquisa.Destroy;
End;

Procedure TRegistro.Ativar;
Begin
    FPesquisa := TQuery.Create(Application);
    FTamanho := 0;
    FTamanhoC := 0;
End;

Procedure TRegistro.SetValor(Var Value1:TCampo ;Value2 : TField);
Begin
    If Value1.Tipo = VarString Then
         Value1.Valor := Value2.AsString
     Else If Value1.Tipo = varInteger Then
         Value1.Valor := Value2.AsInteger
     Else If Value1.Tipo = varBoolean Then
         Value1.Valor := Value2.AsBoolean
     Else If Value1.Tipo = varCurrency Then
         Value1.Valor := Value2.AsCurrency
     Else If Value1.Tipo = varDate Then
         Value1.Valor := Value2.AsDateTime;
End;

Procedure TRegistro.RecNext;
Var Loop : Word;
Begin
      With FPesquisa Do Begin

               If Not Eof Then
                  Next
               Else
                  FFim := True;   

               For Loop := 0 To FTamanho -1 Do
                     SetValor(FCampos[Loop],FieldByName(FCampos[Loop].Nome));;
      End;
End;

Function TRegistro.NaoENulo(Value:Word) : Boolean;
Var  DataNula : TDateTime ;
Begin
    Result := True;
    DataNula := StrToDateTime('0:00:00');
    If FCampos[Value].Tipo = VarString Then Begin
         If FCampos[Value].Valor = '' Then
               Result := False;
    End
    Else If FCampos[Value].Tipo = VarInteger Then Begin
         If FCampos[Value].Valor = 0 Then
               Result := False;
    End
    Else If FCampos[Value].Tipo = VarCurrency Then Begin
         If FCampos[Value].Valor = 0.0 Then
               Result := False;
    End
    Else If FCampos[Value].Tipo = varDate Then Begin
         If FCampos[Value].Valor = DataNula Then
               Result := False;
    End
End;

Procedure TRegistro.ValorSet(Var Value2 : TParam ; Value1 : TCampo);
Begin
    If Value1.Tipo = VarString Then
         Value2.AsString := Value1.Valor
     Else If Value1.Tipo = varInteger Then
         Value2.AsInteger := Value1.Valor
     Else If Value1.Tipo = varBoolean Then
         Value2.AsBoolean  := Value1.Valor
     Else If Value1.Tipo = varCurrency Then
         Value2.AsCurrency  := Value1.Valor
     Else If Value1.Tipo = varDate Then
         Value2.AsDateTime := Value1.Valor;
End;

Procedure TRegistro.SetOrdQuery(Value : String);
Begin
   FOrdQuery := Value;
End;

end.
