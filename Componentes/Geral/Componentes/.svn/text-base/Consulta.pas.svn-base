unit Consulta;

interface                                                            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask,
  ComCtrls,TipoDef;

type
  TFrmConsulta = class(TForm)
    GridConsulta: TDBGrid;
    Pesquisa: TQuery;
    SourcePesquisa: TDataSource;
    Painel: TPanel;
    Confirma: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cWhere: TEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Data1: TMaskEdit;
    Data2: TMaskEdit;
    NaPalavra: TCheckBox;
    Query1: TQuery;
    Query2: TQuery;
    procedure FormShow(Sender: TObject);
    procedure GridConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure ConfirmaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Data1Exit(Sender: TObject);
  private
    { Private declarations }
    FLabel : Array of String;
    Automatico : Char;
    Procedure MontaConsulta(OrdenaPor,ValorOrdenadoPor : String;Gera:Char);
  public
    { Public declarations }
    FCampoConsulta:Array of String;
    FOrderBy,FgroupBy,FColunas,FWhere,FFWhere,FTabela,FDataBaseName,FCampoDeRetorno,FValorCampoDeRetorno,FCodigo : String;
    FNupper:Boolean;
    Procedure F(cVar : Array of String);
  end;

var
  FrmConsulta: TFrmConsulta;
  FValorDeRetorno : String;

implementation
uses FuncoesGlobais;
{$R *.DFM}

procedure TFrmConsulta.FormShow(Sender: TObject);
Var
    ValueN : TFloatField;
    ValueC : TStringField;
    ValueD : TDateTimeField;
    ValueI : TIntegerField;
    i:word;
begin
     //FColunas := 'CODIGO,DESCRICAO';
     //FTabela  := 'CONTACONTABIL';
     //FWhere   := 'CODIGO = ''01''';

     //SetLength(FLabel,0);
     //SetLength(F/Label,Length(FLabel)+1);
     //FLabel[Length(FLabel)-1]   := 'Código';
     //SetLength(FLabel,Length(FLabel)+1);
     //FLabel[Length(FLabel)-1]   := 'Descrição';
     FFWhere := FWhere;
     Pesquisa.DataBaseName := FDataBaseName;


     With Query2 Do Begin
          Sql.Clear;
          DataBaseName := Pesquisa.DataBaseName;
          Sql.Add( 'SELECT '+FColunas+ ' FROM '+FTabela+' WHERE ''a'' = ''b'' '+IIfs(FWhere <> '','And '+FWhere,''));
          Open;
     End;

     If FCodigo = '' then begin
           Query2.Close;
           Query1.Close;
           MontaConsulta('',FValorCampoDeRetorno,'S');
           exit;
     end;


     With Query1 Do Begin
        Sql.Clear;
        DataBaseName := Pesquisa.DataBaseName;
        Sql.Add('SELECT GERAAUTO FROM PESQUISA');
        Sql.Add('WHERE CODIGO = :CODIGO');
        Params[0].AsString := FCodigo;
        Open;

        If FieldByName('GERAAUTO').AsString <> '' then
           Automatico := FieldByName('GERAAUTO').AsString[1];

        Sql.Clear;
        Sql.Add('SELECT ALIAS,CAMPO,TIPO,MASCARA,TAMANHO,LINHA FROM IPESQUISA');
        Sql.Add('WHERE CODIGO = :CODIGO');
        sql.add('Order By Linha');
        Params[0].AsString := FCodigo;
        Open;

        I:=0;
        While Not Eof Do Begin
           If Query2.FieldDefs.Items[I].DataType = ftString Then Begin
                ValueC := TStringField.Create(Pesquisa);
                ValueC.FieldName := Query2.FieldDefs.Items[I].Name;
                ValueC.DataSet   := Pesquisa;
                If FieldByName('TAMANHO').AsString <> '' Then
                   ValueC.DisplayWidth  := FieldByName('TAMANHO').AsInteger
                Else
                   ValueC.DisplayWidth  := Query2.FieldDefs.Items[I].Size;
           End
           Else If (Query2.FieldDefs.Items[I].DataType = FtFloat) Or
                   (Query2.FieldDefs.Items[I].DataType = ftCurrency) Then Begin

                ValueN := TFloatField.Create(Pesquisa);
                ValueN.FieldName := Query2.FieldDefs.Items[I].Name;
                ValueN.DataSet   := Pesquisa;

                If FieldByName('MASCARA').AsString <> '' Then
                    ValueN.DisplayFormat := FieldByName('MASCARA').AsString
                Else
                    ValueN.DisplayFormat := '0.00';

                If FieldByName('TAMANHO').AsString <> '' Then
                   ValueN.DisplayWidth  := FieldByName('TAMANHO').AsInteger
                Else
                   ValueN.DisplayWidth  := Query2.FieldDefs.Items[I].Size;
           End
           Else If (Query2.FieldDefs.Items[I].DataType = ftDate) Or
                   (Query2.FieldDefs.Items[I].DataType = ftTime) Or
                   (Query2.FieldDefs.Items[I].DataType = ftDateTime) Then Begin

                ValueD := TDateTimeField.Create(Pesquisa);
                ValueD.FieldName := Query2.FieldDefs.Items[I].Name;
                ValueD.DataSet   := Pesquisa;

                If FieldByName('TAMANHO').AsString <> '' Then
                   ValueD.DisplayWidth  := FieldByName('TAMANHO').AsInteger
                Else
                   ValueD.DisplayWidth  := Query2.FieldDefs.Items[I].Size;

           End
           Else If Query2.FieldDefs.Items[I].DataType = ftInteger Then Begin
                ValueI := TIntegerField.Create(Pesquisa);
                ValueI.FieldName := Query2.FieldDefs.Items[I].Name;
                ValueI.DataSet   := Pesquisa;
                ValueI.DisplayFormat := FieldByName('MASCARA').AsString;

                If FieldByName('TAMANHO').AsString <> '' Then
                   ValueI.DisplayWidth  := FieldByName('TAMANHO').AsInteger
                Else
                   ValueI.DisplayWidth  := Query2.FieldDefs.Items[I].Size;
           End;
           Inc(i);
           Next;
        End;
     End;

     Query2.Close;
     Query1.Close;
     MontaConsulta(FCampoDeRetorno,FValorCampoDeRetorno,Automatico);
end;

procedure TFrmConsulta.GridConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If Not (Key  In ['a'..'z','A'..'Z','0'..'9'] ) Then Exit;
     PageControl1.ActivePageIndex := IIFS(gridconsulta.selectedfield.DataType = FtDateTime,1,0);
     Painel.Visible := True;
     Label1.Caption := gridconsulta.selectedfield.displaylabel+':';
//     cWhere.SetFocus;
     If PageControl1.ActivePageIndex = 0 then begin
       cWhere.SetFocus ;
       cWhere.Text := Key;
       cWhere.SelLength := 0;
       cWhere.SelStart := 2;
     end
     Else Begin
       Data1.SetFocus ;
       Data1.Text := Key+' /  /  ';
       Data1.SelLength := 0;
       Data1.SelStart := 1;
     End;

 end;

procedure TFrmConsulta.ConfirmaClick(Sender: TObject);
begin
     Painel.Visible := False;
     GridConsulta.SetFocus;
     If FFWhere <> '' then
       FWhere :=  FFWhere+' And '
     else
       FWhere := '';


     If GridConsulta.SelectedField.DataType = ftString Then 
         FWhere := FWhere + IIfs(Cwhere.Text <> '',IIfs(Not FNUpper,'UPPER','')+'('+FCampoConsulta[GridConsulta.SelectedIndex] + ') LIKE '+IIfs(Not FNUpper,'UPPER','')+'('''+Iifs(NaPalavra.Checked,'%','')+IIfs(Not FNUpper,UpperCase(cWhere.Text),CWhere.Text)+'%'')','''a'' = ''a''')
     Else If (GridConsulta.SelectedField.DataType = ftDateTime) or (GridConsulta.SelectedField.DataType = ftDate) Then begin
        If Data1.Text <> '  /  /  ' then
           Fwhere :=   FWhere+  FCampoConsulta[GridConsulta.SelectedIndex] +' >= :'+GridConsulta.SelectedField.Name+'1';

         If Data2.Text <> '  /  /  ' then begin
           If Data1.Text <> '  /  /  ' then
              Fwhere :=  Fwhere+' And '+FCampoConsulta[GridConsulta.SelectedIndex] +' <= :'+GridConsulta.SelectedField.Name+'1'
           else
              Fwhere :=  Fwhere + FCampoConsulta[GridConsulta.SelectedIndex] +' <= :'+GridConsulta.SelectedField.Name+'2';
         end;
      end
     else if cWhere.Text <> '' then
          FWhere := Fwhere + FCampoConsulta[GridConsulta.SelectedIndex] + ' = '+cWhere.Text;

     MontaConsulta(GridConsulta.SelectedField.FieldName,'','S');
     Data1.Clear;
     Data2.Clear;
     cWhere.Text := '';
end;

Procedure TFrmConsulta.MontaConsulta(OrdenaPor,ValorOrdenadoPor : String;Gera : Char);
Var Loop : Word;
    vordenar : string;
Begin
       Pesquisa.Sql.Clear;
{       If FFWhere <> '' Then
         FWhere := FWhere + ' AND '+ FFWhere;}

     If ValorOrdenadoPor <> '' Then Begin
         Gera := 'S';
         If FWhere <> '' Then
               FWhere := FWhere + ' AND '+ OrdenaPor+' = ''' + ValorOrdenadoPor + ''''
         Else
               FWhere := OrdenaPor+' = ''' + ValorOrdenadoPor + '''';
     End;


     If FWhere <> '' Then Begin
         If Gera = 'S' Then
             Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela+' WHERE '+FWhere)
         Else
//             Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela+' WHERE '+OrdenaPor+' IS NULL AND '+OrdenaPor+ ' IS NOT NULL' );
               Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela+' WHERE ''a'' = ''b'' ' );

     End
     Else Begin
         If Gera = 'S' Then
             Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela)
         Else
//             Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela+' WHERE '+OrdenaPor+' IS NULL AND '+OrdenaPor+ ' IS NOT NULL' );
               Pesquisa.Sql.Add( 'SELECT '+ FColunas + ' FROM '+FTabela+' WHERE ''a'' = ''b'' ' );
     End;

     If Pesquisa.ParamCount <> 0  then begin
        For Loop:=0 to Pesquisa.ParamCount - 1 do begin

             If Cwhere.Text <> '' then
               Pesquisa.Params[Loop].Value := Cwhere.Text;

             If (Data1.Text <> '  /  /  ') then begin
               Pesquisa.Params[Loop].AsDateTime := StrToDateTime(Data1.Text);
               Data1.Clear;
               continue;
             end;

             If Data2.Text <> '  /  /  ' then begin
                Pesquisa.Params[Loop].AsDateTime := StrToDateTime(Data2.Text);
                continue;
             end;
        end;
     end;

     If FGroupBy <> '' then
       Pesquisa.Sql.Add('GROUP BY '+FGroupBy);

     If OrdenaPor <> '' then begin
       If Pesquisa.FieldList.Count > 0 then
         Pesquisa.Sql.Add( 'ORDER BY '+IIfs(FOrderBy <> '',FOrderBy+',','')+IntToStr(GridConsulta.DataSource.DataSet.fieldbyname(OrdenaPor).Index + 1))
       else
         Pesquisa.Sql.Add( 'ORDER BY '+IIfs(FOrderBy <> '',FOrderBy+',','')+InttOStr(PosField(Pesquisa.Sql,OrdenaPor)));
     end;


     Data1.Clear;
     Data2.Clear;


     Pesquisa.Open;

     Pesquisa.First;

     For Loop := 0 To GridConsulta.FieldCount -1 Do
           GridConsulta.Fields[Loop].DisplayLabel := FLabel[Loop];
End;

Procedure TFrmConsulta.F(cVar : Array of String);
var nTam,Loop : Word;
Begin
    nTam := Length(cVar);
    SetLength(FLabel,nTam);
    For Loop := 0 To nTam-1 Do FLabel[Loop] := cVar[Loop];
End;

procedure TFrmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFrmConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If Key = VK_ESCAPE Then Close;
      
      If (Key = VK_Return) And Not Painel.Visible Then Begin
            FValorDeRetorno := Pesquisa.FieldByName(FCampoDeRetorno).AsString;
            Close;
      End;
end;

procedure TFrmConsulta.Data1Exit(Sender: TObject);
begin

      If TMaskEdit(Sender).Text = '  /  /  ' then
        exit;
      Try
         StrToDate(TMaskEdit(Sender).Text);
      Except
          ShowMessage('Data inválida');
          TMaskEdit(Sender).SetFocus;
      End;
end;

end.
