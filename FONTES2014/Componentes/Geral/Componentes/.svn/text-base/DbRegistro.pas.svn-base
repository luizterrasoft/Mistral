unit DbRegistro;

interface
Uses DbCampo,dbtables,Forms,TipoDef,Db,SysUtils;

Type
  TDbRegistro = Class(TObject)
   Private
      FTabela : String;
      FBancoDeDados : TDataBase;
      FCampos : Array of TDbCampo;
      FCamposC: Array of TDbCampo;
      FTamanho : Word;
      FTamanhoC : Word;
      FPesquisa : TQuery;
      FAchou   : Boolean;
      FOrdQuery : String;
      FFim      : Boolean;
      Procedure SetValor(Var Value1:TDbCampo ;Value2 : TField);
      Procedure ValorSet(Var Value2 : TParam ; Value1 : TDbCampo);
      Function FindPosition(Value:String):Word;
      Function Upper(Value:String):String;
      Procedure Ativa;
      Procedure Limpa;
      Function NaoENulo(Value:Word) : Boolean;
   protected
      {}
   public
      Procedure Add(Value1:String;Value2:TTipoCampo ; Objeto : TObject;FChave : Boolean);
      Procedure AddChave(Value1:String;Value2:TTipoCampo ; Objeto : TObject);
      Procedure AddValue(Value1:String;Value2 : Variant);
      Function GetValue(Value1:String): Variant;
      Procedure SetOrdQuery(Value : String);
      Procedure LerChaves;
      Procedure LerValores;
      Procedure EscreveValores;
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

Procedure TDbRegistro.Add(Value1:String;Value2:TTipoCampo; Objeto : TObject;FChave:Boolean);
Var Objeto3 : TDbCampo;
Begin
       If Not FChave Then Begin
               Inc(FTamanho);
               SetLength(FCampos,FTamanho);
               Objeto3 := TDbCampo.Create;
               FCampos[FTamanho-1] := Objeto3;
               FCampos[FTamanho-1].Nome := Upper(Value1);
               FCampos[FTamanho-1].Tipo := Value2;
               FCampos[FTamanho-1].Posicao := FTamanho-1;
               FCampos[FTamanho-1].Chave  := False;
               FCampos[FTamanho-1].Objeto  := Objeto;
       End
       Else Begin
               AddChave(Value1,Value2,Objeto);
       End;

End;


Procedure TDbRegistro.AddChave(Value1:String;Value2:TTipoCampo; Objeto : TObject);
Var Objeto1,Objeto2 : TDbCampo;
Begin
       Inc(FTamanho);
       SetLength(FCampos,FTamanho);
       Objeto1 := TDbCampo.Create;
       FCampos[FTamanho-1] := Objeto1;
       FCampos[FTamanho-1].Nome := Upper(Value1);
       FCampos[FTamanho-1].Tipo := Value2;
       FCampos[FTamanho-1].Posicao := FTamanho-1;
       FCampos[FTamanho-1].Chave  := True;
       FCampos[FTamanho-1].Objeto  := Objeto;

       Inc(FTamanhoC);
       SetLength(FCamposC,FTamanhoC);
       Objeto2 := TDbCampo.Create;
       FCamposC[FTamanhoC-1] := Objeto2;
       FCamposC[FTamanhoC-1].Nome := Upper(Value1);
       FCamposC[FTamanhoC-1].Tipo := Value2;
       FCamposC[FTamanhoC-1].Posicao := FTamanho-1;
       FCamposC[FTamanhoC-1].Chave  := True;
       FCamposC[FTamanhoC-1].Objeto  := Objeto;
End;

Procedure TDbRegistro.AddValue(Value1:String;Value2 : Variant);
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

Function TDbRegistro.Upper(Value:String):String;
Var Loop : Word;
Begin
      For Loop := 1 To Length(Value) Do
            If Value[Loop] in ['a'..'z'] Then
               Value[Loop] := Chr(Ord(Value[Loop])-32);
     Result := Value;
End;


Function TDbRegistro.FindPosition(Value:String) : Word;
Var Loop : Word;
Begin
      Result := 0;
      For Loop := 0 To FTamanho -1 Do
           If Value = FCampos[Loop].Nome Then Begin
                Result := Loop;
                Exit;
           End;
End;

Function TDbRegistro.GetValue(Value1:String):Variant;
Var Posicao : Word;
Begin
       Posicao := FindPosition(Value1);
       Result := FCampos[Posicao].Valor;
End;

Procedure TDbRegistro.Ativa;
Begin
      FPesquisa.DataBaseName := FBancoDeDados.DataBaseName;
End;

Procedure TDbRegistro.Grava;
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


Function TDbRegistro.Recupera;
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

Procedure TDbRegistro.Limpa;
Var Loop : Word;
Begin
     For Loop := 0 To FTamanho-1 Do
           FCampos[Loop].ClearValue;

     For Loop := 0 To FTamanhoC-1 Do
           FCamposC[Loop].ClearValue;

End;


Procedure TDbRegistro.Exclui;
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

Procedure TDbRegistro.Free;
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

Procedure TDbRegistro.Ativar;
Begin
    FPesquisa := TQuery.Create(Application);
    FTamanho := 0;
    FTamanhoC := 0;
End;

Procedure TDbRegistro.SetValor(Var Value1:TDbCampo ;Value2 : TField);
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

Procedure TDbRegistro.RecNext;
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

Function TDbRegistro.NaoENulo(Value:Word) : Boolean;
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

Procedure TDbRegistro.ValorSet(Var Value2 : TParam ; Value1 : TDbCampo);
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

Procedure TDbRegistro.LerValores;
Var Posicao : Word;
Begin
    For Posicao := 0 To FTamanho -1 Do
        FCampos[Posicao].PutValor;
End;

Procedure TDbRegistro.EscreveValores;
Var Posicao : Word;
Begin
    For Posicao := 0 To FTamanho -1 Do
        FCampos[Posicao].ReadValor;
End;

Procedure TDbRegistro.LerChaves;
Var Posicao : Word;
Begin
    For Posicao := 0 To FTamanhoC -1 Do
        FCamposC[Posicao].PutValor;
End;

Procedure TDbRegistro.SetOrdQuery(Value : String);
Begin
   FOrdQuery := Value;
End;

end.
