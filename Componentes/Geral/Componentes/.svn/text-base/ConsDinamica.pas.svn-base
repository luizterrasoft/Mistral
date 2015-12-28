unit ConsDinamica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, DBGridControle,GridControl,FuncoesGlobais,StdCtrls,GridSql,MaskEdit;
type

  TConsDinamica = Record
    Comp:TWinControl;
    Codigo:String;
    Tabela:String;
    Filtro:String;
    DataBase:String;
    CampoRetorno:String;
  end;


  TFrmConsDinamica = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   VDbGrid:TDbGridControle;
    { Private declarations }
  public
    { Public declarations }
  end;

Function  MontaConsDinamica(Dados:TConsDinamica):TRetConsDin;
Function  MontaGridDinamico(Dados:TConsDinamica;FOwner:TWincontrol;FParent:TWinControl;Fgrid:TDbGridControle=Nil;AlteraDin:Boolean=True):TDbGridControle;
Procedure DbRegistroToGridSql(Dados:TConsDinamica;FListRetorno:TStringList;IND:Boolean);
FUNCTION  MASCARARETORNOPESQUISA(Campo:TField):String;

var
  FrmConsDinamica: TFrmConsDinamica;
  
implementation


Function  MontaConsDinamica(Dados:TConsDinamica):TRetConsDin;
var FQuery,FQuery2,FQuery3:TQuery;
    FDbGrid:TDbGridControle;
    FVAlue,FFiltro:String;
    I,i2,i3:Integer;
    OldInsL,OldSkip:Boolean;
    ListRetorno:TStringList;
begin
  Result.Faixas   := '';
  Result.Execute  := False;
  FrmConsDinamica := TFrmConsDinamica.Create(Application);
  FQuery          := TQuery.Create(Application);
  ListRetorno     := TStringList.Create;
  Try
    FQuery.DataBaseName := Dados.DataBase;
    FQuery.Sql.Add('SELECT Descricao,RETORNO,Tabela,TAMANHO,LARGURA,NUPPER,FOrderBy,FDistinct,FgroupBy,Filtro,FJoins,MarcaTodos FROM PESQUISA WHERE CODIGO = :CODIGO');
    FQuery.Params[0].AsString := UpperCase(Dados.Codigo);
    FQuery.Open;

    If FQuery.Eof Then begin
      Mensagem('Não foi encontrada a pesquisa com o código '+UpperCase(Dados.Codigo)+#13+
              'Cadastre-a na montagem de pesquisa.');
      Exit;
    end;

    FrmConsDinamica.Caption := IIfs(FQuery.FieldByName('Descricao').AsString <> '',FQuery.FieldByName('Descricao').AsString,'Consulta '+Dados.Codigo);

    If Dados.CampoRetorno = '' Then
     Dados.CampoRetorno := FQuery.FieldByName('Retorno').AsString;

    ListRetorno  := separastring(Dados.CampoRetorno);
    FrmConsDinamica.VDbGrid := MontaGridDinamico(Dados,FrmConsDinamica,FrmConsDinamica);

    With FrmConsDinamica.VDbGrid do begin
     ScrollBars := ssVertical;
     Result.Execute := FrmConsDinamica.ShowModal = MrOk;
     If Not Result.Execute Then
      exit;

     Result.Faixas  := StrFaixas;
     If Dados.Comp = Nil Then
      exit;

     If (Dados.Comp <> Nil) Then
       If (Dados.Comp is TGridControl) and (FQuery.FieldByName('MarcaTodos').AsString = 'T') and (SelectedRows.Count = 0) Then Begin
           With TGridControl(Dados.Comp) do
            try
               OldInsL        := InserindoLinha;
               InserindoLinha := True;
               DataSource.DataSet.First;
               I := DataSource.DataSet.RecordCount;
               If I = - 1 then begin
                 I := 0;
                 While Not DataSource.DataSet.Eof do begin
                   I := I + 1;
                   DataSource.DataSet.Next;
                 end;
                 DataSource.DataSet.First;
               end;
               I2 := 0;
               While Not DataSource.DataSet.Eof do begin
                   i2 := i2 + 1;
                   DbRegistroToGridSql(Dados,ListRetorno,i2 = I);
                   DataSource.DataSet.Next;
               end;
             finally
               InserindoLinha := OldInsL;
             end;
       end else If Not((Dados.Comp is TGridControl) and (SelectedRows.Count > 1)) Then begin
          Fvalue := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(ListRetorno[0]));
          SetValueObject(Dados.Comp,FValue);
          If (Dados.Comp is TGridSql) and (ListRetorno.Count > 1) Then
            If (Dados.Comp is TGridSql) and (ListRetorno.Count > 1) Then
              With TGridSql(Dados.Comp) do
                for i2:=0 to Campos.Count - 1 do
                  If (i2 <> Col) and (ListRetorno.IndexOf(campos[i2]) > -1) then
                    Cells[I2,Row] := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(ListRetorno[ListRetorno.IndexOf(campos[i2])]));
       end ELSE
         With TGridControl(Dados.Comp) do
          try
             OldInsL        := InserindoLinha;
             InserindoLinha := True;
             For i:=0 to SelectedRows.Count - 1 do begin
                 DataSource.DataSet.GotoBookmark(pointer(SelectedRows.Items[i]));
                 DbRegistroToGridSql(Dados,ListRetorno,I = SelectedRows.Count - 1);
             end;
           finally
             InserindoLinha := OldInsL;
           end;


     If (Dados.Comp <> nil) and (Dados.Comp.ClassName <> 'TMenuItem') and  Dados.Comp.CanFocus Then begin
       HabilitaTabSheets(Dados.Comp);
       Try
        If (Dados.Comp is TGridControl)  Then begin
         OldInsL := TGridControl(Dados.Comp).PulaSelectCell;
         TGridControl(Dados.Comp).PulaSelectCell := True;
        end;
        Dados.Comp.SetFocus;
       finally
        If (Dados.Comp is TGridControl)  Then
         TGridControl(Dados.Comp).PulaSelectCell := OldInsL;
       end;
     end;
    end;
  finally
    FQuery.Destroy;
    ListRetorno.destroy;
    FrmConsDinamica.Destroy;
    FrmConsDinamica := Nil;
  end;
end;

Function MontaGridDinamico(Dados:TConsDinamica;FOwner:TWincontrol;FParent:TWinControl;Fgrid:TDbGridControle=Nil;AlteraDin:Boolean=True):TDbGridControle;
var FQuery,FQuery2,FQuery3:TQuery;
    FDbGrid:TDbGridControle;
    VCampo,FValue,V,OldSql,VFiltro,FFiltro:String;
    FCampo:TField;
    I,VWidth:Integer;
    OldFont:TFont;
    VData:Boolean;
begin
 Try
  FQuery          := TQuery.Create(Application);
  FQuery.DataBaseName := Dados.DataBase;
  FQuery.Sql.Add('SELECT RETORNO,Tabela,TAMANHO,LARGURA,NUPPER,FOrderBy,FDistinct,FgroupBy,Filtro,FJoins,GeraAuto FROM PESQUISA WHERE CODIGO = :CODIGO');
  FQuery.Params[0].AsString := UpperCase(Dados.Codigo);
  FQuery.Open;
  If Dados.Camporetorno = '' then
   Dados.CampoRetorno := FQuery.FieldByName('Retorno').AsString;


  FQuery2          := TQuery.Create(Application);
  FQuery2.DataBaseName := Dados.DataBase;
  FQuery2.Sql.Add('SELECT LINHA,CAMPOMEMO,CAMPO,ALIAS,LABEL,TAMANHO,MASCARA,SEMMASCARA FROM IPESQUISA WHERE CODIGO = :CODIGO');
  FQuery2.Sql.Add('ORDER BY LINHA');
  FQuery2.Params[0].AsString := UpperCase(Dados.Codigo);
  FQuery2.Open;


{  FQuery3   := TQuery.Create(Application);
  FQuery3.DataBaseName := Dados.DataBase;}

  With FOwner do begin
   If Fgrid = nil then
     Result := TDBGridControle.Create(FOwner)
   else
     result := Fgrid;
       
   With Result do begin
     If (FQuery.FieldByName('Tamanho').AsInteger > 0) and Alteradin Then
      FOwner.Height := FQuery.FieldByName('Tamanho').AsInteger;
      CampoRetorno  := Dados.CampoRetorno;

     If FParent = nil Then
       Parent     := FOwner
     else
       Parent     := FParent;

     Align      := alClient;
     If Fgrid = Nil Then begin
       DataSource := TDataSource.Create(FOwner);
       DataSource.DataSet := TQuery.Create(FOwner);
     end;
     TQuery(DataSource.DataSet).databasename := Dados.DataBase;
     If (Dados.Comp = Nil) OR ((Dados.Comp is TGridControl) and TGridControl(Dados.Comp).IncluiLinha) Then
       Result.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
     else
       Result.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
   end;

   TQuery(Result.DataSource.DataSet).Sql.Clear;
   With TQuery(Result.DataSource.DataSet) do begin
      Sql.Add('Select '+IIfs(FQuery.FieldByName('FDistinct').AsString = 'T','Distinct ',''));
      FQuery2.First;
      While not FQuery2.eof do begin
          Sql.Add(IIfs(Sql.Count = 1,'',',')+FQuery2.FieldByName('Campo').AsString+IIfs(FQuery2.FieldByName('Alias').AsString <> '',' as '+FQuery2.FieldByName('Alias').AsString,''));
          FQuery2.Next;
      end;
      Sql.Add(' From '+IIfs(FQuery.FieldByName('Tabela').AsString <> '',FQuery.FieldByName('Tabela').AsString,IIfs(Dados.Tabela <> '',Dados.Tabela,Dados.Codigo))+iifs(FQuery.FieldByName('FJoins').AsString <> '','  '+FQuery.FieldByName('FJoins').AsString,''));
      FFiltro  := Dados.Filtro+IIfs((Dados.Filtro <> '') and (FQuery.FieldByName('Filtro').AsString <> ''),' And ','')+FQuery.FieldByName('Filtro').AsString;
      VFiltro  := '';

      If (Dados.Comp <> Nil) and (GetValueObject(Dados.Comp) <> '') Then
         With SeparaString(Dados.CampoRetorno) do
          try
            for i:=0 to Count - 1 do begin
                 FValue := '';
                 if i = 0 Then
                  FValue := GetValueObject(Dados.Comp)
                 else
                  Fvalue := TGridSql(dados.Comp).FieldValue[Strings[i],TGridSql(dados.Comp).Row];

                 If FValue = '' Then
                  Continue;

                 If VFiltro <> '' Then begin
                  VFiltro := VFiltro+' AND ';
                  VCampo  := FieldtoFullField(Sql,Strings[i]);
                 end else
                  VCampo  := Strings[i];

                 Vdata := (Dados.Comp is TMaskEditControle) and (TMaskEditControle(Dados.Comp).Verificadata or TMaskEditControle(Dados.Comp).VerificaHora);
                 If Not VData Then
                   VFiltro := VFiltro + 'Upper('+VCampo+') = Upper('''+FValue+''')'
                 else
                   VFiltro := VFiltro + VCampo +' = '''+DataBancoDados(StrtodateN(FValue))+'''';

                 If Not(Dados.Comp is TgridSql) then
                   break;
            end;
           finally
              Destroy;
           end;

      With StrtoStrings(Sql.Text) do
       try
           If (FFiltro <> '') Then
              Add('Where '+FFiltro);
           If (FQuery.FieldByName('FGroupBy').AsString <> '') then
              Add('Group By '+FQuery.FieldByName('FGroupBy').AsString);
           If FQuery.FieldByName('FOrderBy').AsString <> '' Then
              Add('Order By '+FQuery.FieldByName('FOrderBy').AsString);
           OldSql := Text;
       finally
           Destroy;
       end;

       V := '';
       If (FQuery.FieldByName('geraauto').AsString <> 'S') and (VFiltro = '') Then
         V := 'Where ''a'' = ''b''';
       If FFiltro <> '' Then
         V := V+IIfs(V <> '',' And ','Where ')+FFiltro;
       If VFiltro <> '' Then
         V := V+IIfs(V <> '',' And ','Where ')+VFiltro;
       Sql.add(V);
       If FQuery.FieldByName('FGroupBy').AsString <> '' Then
        sql.add('Group By '+FQuery.FieldByName('FGroupBy').AsString);
       If FQuery.FieldByName('FOrderBy').AsString <> '' Then
        sql.add('Order By '+FQuery.FieldByName('FOrderBy').AsString);

       Open;

       VWidth := 0;
       If Alteradin Then
         If FQuery.FieldByName('Largura').AsInteger = 0 Then begin
           for i:=0 to result.Columns.Count - 1 do
             If VWidth + result.Columns[i].Width >= Screen.Width Then begin
               VWidth := VWidth + (VWidth + result.Columns[i].Width - Screen.Width);
               break;
             end else
               VWidth := VWidth + result.Columns[i].Width;

           OldFont := Tform(FOwner).Canvas.Font;
           Tform(FOwner).Canvas.Font := Result.Font;
           If VWidth > FOwner.Width Then
             FOwner.Width := VWidth + Tform(FOwner).Canvas.TextWidth('W') * 3;
           Tform(FOwner).Canvas.Font := OldFont;
         end else
           FOwner.Width := FQuery.FieldByName('Largura').AsInteger;

      If (VFiltro <> '') or (FQuery.FieldByName('geraauto').AsString <> 'S')  Then begin
         Result.FSqliNi  := OldSql;
         Result.FOldSql  := Sql.Text;
      end;

      FQuery2.First;
      While Not FQuery2.Eof do begin
        If FindField(IIfs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)) <> Nil Then
         With FieldByName(IIfs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)) do begin
            If FQuery2.FieldByName('Label').AsString <> '' Then
               DisplayLabel := FQuery2.FieldByName('Label').AsString;
             If FQuery2.FieldByName('TAMANHO').AsInteger > 0 Then
               DisplayWidth  := FQuery2.FieldByName('TAMANHO').AsInteger;

             If TipoDataType(DataType)
                In [dtnumero,dtinteiro] Then
                  If FQuery2.FieldByName('MASCARA').AsString <> '' Then
                     TnumericField(FieldByName(IIfs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString))).DisplayFormat := FQuery2.FieldByName('MASCARA').AsString
                   Else If (TipoDataType(DataType) <> DTinteiro) and
                           (FQuery2.FieldByName('SEMMASCARA').AsString <> 'T') then
                     TnumericField(FieldByName(IIfs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString))).DisplayFormat := '0.00';

             If (TipoDataType(DataType) = dtData) and
                (FQuery2.FieldByName('MASCARA').AsString <> '') Then
                   TDateTimeField(FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString))).DisplayFormat := FQuery2.FieldByName('MASCARA').AsString;
         end;
         FQuery2.Next;
      end;
//      Open;

   end;
  end;
 finally
  If FQuery <> Nil Then Fquery.Destroy;
  If FQuery2 <> Nil Then FQuery2.Destroy;
  If FQuery3 <> Nil Then FQuery3.Destroy;
 end;

end;


FUNCTION MASCARARETORNOPESQUISA(Campo:TField):String;
begin
     If Not Campo.IsNull and
           (TipoDataType(Campo.DataType) = dtNumero) and
           (TNumericField(Campo).DisplayFormat <> '') Then
       Result  := FormatFloat(TNUmericField(Campo).DisplayFormat,
                  Campo.AsFloat)
     else If Not Campo.IsNull and
           (TipoDataType(Campo.DataType) = dtData) and
           (TDateTimeField(Campo).DisplayFormat <> '') Then
       Result  := FormatDateTime(TDateTimeField(Campo).DisplayFormat,
                  Campo.AsDAteTime)
     else
       Result  := Campo.AsString;
end;


Procedure DbRegistroToGridSql(Dados:TConsDinamica;FListRetorno:TStringList;IND:Boolean);
var
i2,i3:Integer;
FValue:String;
begin
    With FrmConsDinamica.VDbGrid do
       With TGridControl(Dados.Comp) do begin
          Fvalue := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(fListRetorno[0]));
          Cells[Col,Row] := FValue;
          If (Dados.Comp is TGridSql) and (FListRetorno.Count > 1) Then
           With TGridSql(Dados.Comp) do
            for i2:=0 to Campos.Count - 1 do begin
             i3 := FListRetorno.IndexOf(campos[i2]);
             If (i2 <> Col) and (i3 > 0) then
              Cells[I2,Row] := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(FListRetorno[i3]));
            end;
          If Ind Then
            Exit;
          Insert(Row + 1,tRUE);
       end;
end;



{$R *.DFM}

procedure TFrmConsDinamica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
VGrid:TDbGridControle;
begin
  If (Key = Vk_Return) and Not((VDbGrid <> Nil) and VDbGrid.DataSource.DataSet.eof and (VDbGrid.DataSource.DataSet.Recordcount = 0)) Then begin
     Close;
     ModalResult := mrok;
  end else if Key = Vk_Escape Then begin
    Close;
    ModalResult := mrcancel;
  end;
  
end;

end.

{ Try
  FQuery          := TQuery.Create(Application);
  FQuery.DataBaseName := Dados.DataBase;
  FQuery.Sql.Add('SELECT RETORNO,Tabela,TAMANHO,LARGURA,NUPPER,FOrderBy,FDistinct,FgroupBy,Filtro,FJoins,GeraAuto FROM PESQUISA WHERE CODIGO = :CODIGO');
  FQuery.Params[0].AsString := UpperCase(Dados.Codigo);
  FQuery.Open;
  If Dados.Camporetorno = '' then
   Dados.CampoRetorno := FQuery.FieldByName('Retorno').AsString;


  FQuery2          := TQuery.Create(Application);
  FQuery2.DataBaseName := Dados.DataBase;
  FQuery2.Sql.Add('SELECT LINHA,CAMPOMEMO,CAMPO,ALIAS,LABEL,TAMANHO,MASCARA,SEMMASCARA FROM IPESQUISA WHERE CODIGO = :CODIGO');
  FQuery2.Sql.Add('ORDER BY LINHA');
  FQuery2.Params[0].AsString := UpperCase(Dados.Codigo);
  FQuery2.Open;


  FQuery3   := TQuery.Create(Application);
  FQuery3.DataBaseName := Dados.DataBase;
  With FOwner do begin
   Result := TDBGridControle.Create(FOwner);
   With Result do begin
     If FQuery.FieldByName('Tamanho').AsInteger > 0 Then
      FOwner.Height := FQuery.FieldByName('Tamanho').AsInteger;
      CampoRetorno  := Dados.CampoRetorno;

     If FParent = nil Then
       Parent     := FOwner
     else
       Parent     := FParent;

     Align      := alClient;
     DataSource := TDataSource.Create(FOwner);
     DataSource.DataSet := TQuery.Create(FOwner);
     TQuery(DataSource.DataSet).databasename := Dados.DataBase;
     If (Dados.Comp = Nil) OR ((Dados.Comp is TGridControl) and TGridControl(Dados.Comp).IncluiLinha) Then
       Result.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect]
     else
       Result.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
   end;

   FQuery3.Sql.Add('Select '+IIfs(FQuery.FieldByName('FDistinct').AsString = 'T','Distinct ',''));
   While not FQuery2.eof do begin
      FQuery3.Sql.Add(IIfs(FQuery3.Sql.Count = 1,'',',')+FQuery2.FieldByName('Campo').AsString+IIfs(FQuery2.FieldByName('Alias').AsString <> '',' as '+FQuery2.FieldByName('Alias').AsString,''));
      FQuery2.Next;
   end;


   FQuery3.Sql.Add(' From '+IIfs(FQuery.FieldByName('Tabela').AsString <> '',FQuery.FieldByName('Tabela').AsString,IIfs(Dados.Tabela <> '',Dados.Tabela,Dados.Codigo))+iifs(FQuery.FieldByName('FJoins').AsString <> '','  '+FQuery.FieldByName('FJoins').AsString,''));
   FQuery3.sql.add('Where ''a'' = ''b''');
   If FQuery.FieldByName('FGroupBy').AsString <> '' Then
    FQuery3.sql.add('Group By '+FQuery.FieldByName('FGroupBy').AsString);
   FQuery3.Open;

   FQuery2.First;
   While Not FQuery2.Eof do begin
          Case TipoDataType(FQuery3.FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)).DataType) of
            DtCharacter :FCampo := TStringField.Create(FOwner);
            DtData :FCampo := TDateTimeField.Create(FOwner);
            DtNumero :FCampo := TFloatField.Create(FOwner);
            DtInteiro :FCampo := TIntegerField.Create(FOwner);
         end;

         FCampo.FieldName    := iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString);
         FCampo.DisplayLabel := IIfs(FQuery2.FieldByName('Label').AsString <> '',FQuery2.FieldByName('Label').AsString,FCampo.FieldName);
         FCampo.DataSet      := Result.DataSource.DataSet;

         If FQuery2.FieldByName('TAMANHO').AsInteger > 0 Then
            FCampo.DisplayWidth  := FQuery2.FieldByName('TAMANHO').AsInteger
         Else
            FCampo.DisplayWidth  :=  FQuery3.FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)).Size;


         If TipoDataType(FQuery3.FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)).DataType)
            In [dtnumero,dtinteiro] Then
              If FQuery2.FieldByName('MASCARA').AsString <> '' Then
                 TnumericField(FCampo).DisplayFormat := FQuery2.FieldByName('MASCARA').AsString
               Else If (TipoDataType(FQuery3.FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)).DataType) <> DTinteiro) and
                       (FQuery2.FieldByName('SEMMASCARA').AsString <> 'T') then
                 TnumericField(FCampo).DisplayFormat := '0.00';

         If (TipoDataType(FQuery3.FieldByName(iifs(FQuery2.FieldByName('Alias').AsString <> '',FQuery2.FieldByName('Alias').AsString,FQuery2.FieldByName('Campo').AsString)).DataType) = dtData) and
            (FQuery2.FieldByName('MASCARA').AsString <> '') Then
               TDateTimeField(FCampo).DisplayFormat := FQuery2.FieldByName('MASCARA').AsString;


         FQuery2.Next;
   end;

   With TQuery(Result.DataSource.DataSet) do begin
      Sql.Text := FQuery3.Text;
      FFiltro  := Dados.Filtro+IIfs((Dados.Filtro <> '') and (FQuery.FieldByName('Filtro').AsString <> ''),' And ','')+FQuery.FieldByName('Filtro').AsString;
      VFiltro  := '';
      If (Dados.Comp <> Nil) and (GetValueObject(Dados.Comp) <> '') Then
         With SeparaString(Dados.CampoRetorno) do
          try
            for i:=0 to Count - 1 do begin
              If (FQuery3.FindField(Strings[i]) <> Nil)  Then begin
                 FValue := '';
                 if i = 0 Then
                  FValue := GetValueObject(Dados.Comp)
                 else
                  Fvalue := TGridSql(dados.Comp).FieldValue[Strings[i],TGridSql(dados.Comp).Row];

                 If FValue = '' Then
                  Continue;

                 If VFiltro <> '' Then begin
                  VFiltro := VFiltro+' AND ';
                  VCampo  := FieldtoFullField(FQuery3.Sql,Strings[i]);
                 end else
                  VCampo  := Strings[i];


                 Case TipoDataType(FQuery3.FieldByName(Strings[i]).DataType) of
                   DtCharacter :VFiltro := VFiltro +  'Upper('+VCampo+') = Upper('''+FValue+''')';
                   DtData :VFiltro := VFiltro + VCampo+' = '''+DataBancodados(StrtoDateN(FValue))+'''';
                   DtInteiro,DtNumero :VFiltro := VFiltro + VCampo +' = '+FValue;
                  end;
              end;
              If Not(Dados.Comp is TgridSql) then
                break;
            end;    
           finally
              Destroy;
           end;

      With StrtoStrings(Sql.Text) do
       try
           If (FFiltro <> '') Then
              Strings[Count - IIfs(FQuery.FieldByName('FGroupBy').AsString <> '',2,1)] := 'Where '+FFiltro
           else
              Delete(Count - IIfs(FQuery.FieldByName('FGroupBy').AsString <> '',2,1));
           OldSql := Text;
       finally
           Destroy;
       end;

       V := '';
       If (FQuery.FieldByName('geraauto').AsString <> 'S') and (VFiltro = '') Then
         V := 'Where ''a'' = ''b''';
       If FFiltro <> '' Then
         V := V+IIfs(V <> '',' And ','Where ')+FFiltro;
       If VFiltro <> '' Then
         V := V+IIfs(V <> '',' And ','Where ')+VFiltro;

       If V = '' Then
         Sql.Delete(Sql.Count - IIfs(FQuery.FieldByName('FGroupBy').AsString <> '',2,1))
       else
         Sql[sql.count - IIfs(FQuery.FieldByName('FGroupBy').AsString <> '',2,1)] := V;

      Open;

      VWidth := 0;
       If FQuery.FieldByName('Largura').AsInteger = 0 Then begin
         for i:=0 to result.Columns.Count - 1 do
           If VWidth + result.Columns[i].Width >= Screen.Width Then begin
             VWidth := VWidth + (VWidth + result.Columns[i].Width - Screen.Width);
             break;
           end else
             VWidth := VWidth + result.Columns[i].Width;

         OldFont := Tform(FOwner).Canvas.Font;
         Tform(FOwner).Canvas.Font := Result.Font;
         If VWidth > FOwner.Width Then 
           FOwner.Width := VWidth + Tform(FOwner).Canvas.TextWidth('W') * 3;
         Tform(FOwner).Canvas.Font := OldFont;

       end else
        FOwner.Width := FQuery.FieldByName('Largura').AsInteger;

      If (VFiltro <> '') or (FQuery.FieldByName('geraauto').AsString <> 'S')  Then begin
       Result.FSqliNi  := OldSql;
       Result.FOldSql  := Sql.Text;
      end;
   end;
  end;
 finally
  If FQuery <> Nil Then Fquery.Destroy;
  If FQuery2 <> Nil Then FQuery2.Destroy;
  If FQuery3 <> Nil Then FQuery3.Destroy;
 end;
}
{         With TGridControl(Dados.Comp) do
          try
             OldInsL        := InserindoLinha;
             InserindoLinha := True;
             For i:=0 to SelectedRows.Count - 1 do begin
                    DataSource.DataSet.GotoBookmark(pointer(SelectedRows.Items[i]));
                    Fvalue := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(ListRetorno[0]));
                    Cells[Col,Row] := FValue;
                    If (Dados.Comp is TGridSql) and (ListRetorno.Count > 1) Then
                     With TGridSql(Dados.Comp) do
                      for i2:=0 to Campos.Count - 1 do begin
                       i3 := ListRetorno.IndexOf(campos[i2]);
                       If (i2 <> Col) and (i3 > 0) then
                        Cells[I2,Row] := MascaraRetornoPesquisa(DataSource.DataSet.FieldByName(ListRetorno[i3]));                      end;

                    If I = SelectedRows.Count - 1 Then
                      break;
                    Insert(Row + 1,tRUE);
             end;
           finally
             InserindoLinha := OldInsL;
           end;}

