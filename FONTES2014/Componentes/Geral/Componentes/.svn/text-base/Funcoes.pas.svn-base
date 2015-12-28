unit Funcoes;

interface

Uses Classes,stdctrls,extctrls,controls,Dialogs,Ajuda,dbtables,Forms;

Procedure LimpaCampos(Janela : TComponent);
Function VerificaCampos(Janela : TComponent):Boolean;
Procedure MontaPesquisa(pObjeto : TWinControl;pCodigo,pTabela,pFiltro : String;BancoDeDados:TDataBase);

implementation

Procedure LimpaCampos(Janela : TComponent);
Var Loop : Integer;
Begin
     For Loop := 0 To Janela.ComponentCount -1 Do  Begin
         If Janela.Components[Loop].Tag Mod 2 = 1 Then Begin
               If Janela.Components[Loop] Is TCustomEdit Then
                  TCustomEdit(Janela.Components[Loop]).Text := ''
               Else If Janela.Components[Loop] Is TPanel Then
                  TPanel(Janela.Components[Loop]).Caption := ''
               Else If Janela.Components[Loop] Is TCheckBox Then
                  TCheckBox(Janela.Components[Loop]).Checked := False;
         End;
     End;
End;


Function VerificaCampos(Janela : TComponent):Boolean;
Var Loop : Integer;
Begin
     Result := True;
     For Loop := 0 To Janela.ComponentCount -1 Do  Begin
         If Janela.Components[Loop].Tag Mod 3 = 1 Then Begin
               If (Janela.Components[Loop] Is  TCustomEdit) And (TCustomEdit(Janela.Components[Loop]).Text = '') Then Begin
                       MessageDlg('Informação obrigatória', mtInformation,[mbOk], 0);
                       TWinControl(Janela.Components[Loop]).SetFocus;
                       Result := False;
                       Exit;
               End;
         End;
     End;
End;


Procedure MontaPesquisa(pObjeto : TWinControl;pCodigo,pTabela,pFiltro : String;BancoDeDados:TDataBase);
Var CAjuda : TAjuda;
    Query : TQuery;
Begin              
         CAjuda := TAjuda.Create(Application);
         Query  := TQuery.Create(Application);
         Query.DataBaseName := BancoDeDados.DataBaseName;

         { Case o parametro que tenha o nome da tabela seja branca
          este considera o codigo ;         }
         If pTabela = '' Then pTabela := pCodigo;

         // Seleciona campo de retorno
         Query.Sql.Add('SELECT RETORNO FROM PESQUISA WHERE CODIGO = :CODIGO');
         Query.Params[0].AsString := pCodigo;
         Query.Open;
         CAjuda.CampoDeRetorno := Query.FieldByName('RETORNO').AsString;

         Query.Sql.Clear;
         Query.Sql.Add('SELECT LINHA,CAMPO,LABEL FROM IPESQUISA WHERE CODIGO = :CODIGO');
         Query.Sql.Add('ORDER BY LINHA');
         Query.Params[0].AsString := pCodigo;
         Query.Open;
         CAjuda.Campo := Query.FieldByName('CAMPO').AsString;
         CAjuda.InLabel(Query.FieldByName('LABEL').AsString);
         Query.Next;

         While Not Query.Eof Do Begin
              CAjuda.Campo := CAjuda.Campo+','+Query.FieldByName('CAMPO').AsString;
              CAjuda.InLabel(Query.FieldByName('LABEL').AsString);
              Query.Next;
         End;

         If TEdit(PObjeto).Text <> '' Then
              CAjuda.Filtro := pFiltro
         Else
              CAjuda.Filtro := '';
              
         CAjuda.Tabelas := pTabela;
         CAjuda.DataBase := BancoDeDados;
         CAjuda.Execute;
         CAjuda.Limpa;
         Tedit(PObjeto).Text := CAjuda.ValorDeRetorno;
         Tedit(PObjeto).SetFocus;
         Query.Destroy;
         CAjuda.Destroy;
End;

end.
