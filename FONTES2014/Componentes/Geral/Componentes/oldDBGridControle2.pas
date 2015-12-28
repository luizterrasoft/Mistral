unit DBGridControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids,Db,DbTables,tipoDef,FuncoesGlobais,Menus,DadosDbGrid,SelecaoRel,QrpRelatorio
  ,FuncPrint,QuickRpt,QrCtrls,Variants,comctrls,ConstantesAppl,QrExpr,MetadataParam;

type
  TRegField = Record
    Nome:String;
    visible:boolean;
    DisplayWidth:Integer;
    DisplayLabel:String;
    DisplayFormat:String;
    posicao:integer;
    Campo:String;
  end;

  TRegFields = Array of TRegField;

  TDBGridControle = class(TDBGrid)
  private
   FListFields:TRegFields;
   FParamsIni:TParams;
   nmontamenu :boolean;
   oldheight:Integer;
   FoldAfterScroll:TDataSetNotifyEvent;
   NewPop:TPopupMenu;
   FSqlEof:String;
   PrimeiraCons:Boolean;
   Fimp,FNupper: Boolean;
   FWidthAut: Boolean;
   FChange,FHeightAut: Boolean;
   TemShift:Boolean;
   VOrdem:String;
   FDadosDbGrid:TFrm_DadosDbGrid;
   FDbGridPrinc:TDbGridControle;
   FEnableDetalhes:Boolean;
   FAlignEnableDetalhes:Talign;
   FAlignDisableDetalhes:Talign;
   FToolBar:TToolBar;
   FMetaDataParam:TFrm_MetadataParam;
   Procedure MontaConsulta;
   Procedure ClickPop(Sender:TObject);
   Procedure ChangePgTotal(Sender:TObject);
   Procedure DeletaLinhaConcatena(VCampo:String);
   Procedure FAfterScroll(DataSet: TDataSet);
   procedure SetDbGridPrinc(Value:TDbGridControle);
   procedure FDataChange(Sender: TObject; Field: TField);
   procedure SetEnableDetalhes(Value:Boolean);
   Function  getdisabledetalhes:Boolean;
   Procedure  CarregaTamanhosCampos(Value:Boolean;FdataSet:TDataSet);

   { Private declarations }
  protected
   Function GetPopupMenu:TPopupMenu;Override;
    { Protected declarations }
  public
   FOldAlign:Talign;
   FSoma:Boolean;
   SlOIni,StrSep:TStringList;
   Camporetorno,FSqlIni,FoldSql:String;
   FAllDetals,FCreating:Boolean;
   FSqlPrinc:String;
   faixa1,faixa2,indfaixa:string;
   function  temdetalhes:Boolean;
   Procedure KeyPress(var Key:Char); override;
   procedure KeyDown(var Key: Word; Shift: TShiftState); override;
   Procedure MarcaTodos;
   Procedure Print(FQrSubDetail:TQRSubDetail=Nil);
   Procedure refreshData(FSqlR:String='');
   function  StrFaixas :String;
   constructor Create(AOwner: TComponent); override;
   Destructor  Destroy;Override;
   function   Columnbyname(FValue:String):TColumn;
   Procedure   CreateWnd;Override;
   Function    MetaData(Seleciona:Boolean=True):TStringList;
   Procedure   IncluiOption(FOption:TDbGridOption);
   Procedure   ExcluiOption(FOption:TDbGridOption);



    { Public declarations }
  published
    property ScrollBars;
    property NUperr :Boolean Read FNupper Write FNupper default False;
    property WidthAut :Boolean Read FWidthAut Write FWidthAut default False;
    property HeightAut :Boolean Read FHeightAut Write FHeightAut default False;
    property DbGridPrinc :TDbGridControle Read FDbGridPrinc Write SetDbGridPrinc;
    Property DisableDetalhes :boolean read getdisabledetalhes write SetEnableDetalhes;
    Property AlignEnableDetalhes :TAlign read FAlignEnableDetalhes write FAlignEnableDetalhes default AlTop;
    Property AlignDisableDetalhes:TAlign read FAlignDisableDetalhes write FAlignDisableDetalhes;
    Property ToolBar:TToolBar read FToolBar write FToolBar;
    { Published declarations }
  end;

procedure Register;


implementation

uses ImgList;


Var
FPesqporStr:Integer;
FPesqporInt:Integer;
FPesqporDt:Integer;
FPesqporFlt:Integer;

procedure Register;
begin
  RegisterComponents('Sistema', [TDBGridControle]);
end;

{ TDBGridControle }


Procedure TDBGridControle.IncluiOption(FOption:TDbGridOption);
var
OldOptions : Set of TDbgridOption;
begin
  OldOptions := Options;
  if Not(FOption in OldOptions) Then
     Include(OldOptions,FOption);
  Options := OldOptions;
end;

Procedure TDBGridControle.ExcluiOption(FOption:TDbGridOption);
var
OldOptions : Set of TDbgridOption;
begin
  OldOptions := Options;
  if Not(FOption in OldOptions) Then
     Exclude(OldOptions,FOption);
  Options := OldOptions;
end;

procedure TDBGridControle.KeyPress(var Key: Char);
const
constsql:array[0..4] of String = ('WHERE','GROUP','PLAN','UNION','ORDER');
consttab:array[0..3] of String = (',','LEFT','RIGTH','INNER');
var IndSqlPrinc,i,i2:integer;
    FSqlDetals,FCampoOrg,FFaixaPrinc,F,Fnometabela,FSqlPrinc:String;
    FAux:TQuery;
    FSList:TstringList;

begin

 If (IndFaixa = '') and (Key <> #0) and ((Key = #13) or (Key = #8) or (key = #27) or (key = #9) or tbKeyIsDown(Vk_Control) or tbKeyIsDown(Vk_Menu))  Then
   Exit;

 if TQuery(DataSource.DataSet).RequestLive then begin
  inherited KeyPress(Key);
  exit;
 end; 

 try

  If FDadosDbGrid = Nil Then begin
    PrimeiraCons := True;
    FDadosDbGrid := TFrm_DadosDbGrid.Create(Self);
    FDadosDbGrid.Edit1.Tag := 1;
    FDadosDbGrid.CkConcatena.enabled := False;
    FParamsIni.Clear;
    CopyParams(TQuery(DataSource.DataSet).Params,FParamsIni);
  end else
    FDadosDbGrid.CkConcatena.Enabled := True;



  FDadosDbGrid.ckPesqMestre.Visible  := FDbGridPrinc <> Nil;
  FDadosDbGrid.ckAllDetals.Visible   := FDbGridPrinc <> Nil;
  FDadosDbGrid.PageControl1.OnChange := ChangePgTotal;
  FChange := False;
  FDadosDbGrid.CkNupper.Enabled := Not FNupper;
  If FNupper Then
   FDadosDbGrid.CkNupper.Enabled := True;
  With FDadosDbGrid  do begin
    If FSoma Then begin
      FSoma := False;
      TabSheet1.TabVisible := False;
      TabSheet2.TabVisible := False;
      PageControl1.ActivePage := TabSheet3;
      ChangePgTotal(TabSheet3);
      ShowModal;
      exit;
    end;

   TabSheet1.TabVisible := True;
   TabSheet2.TabVisible := True;
   PageControl1.ActivePageIndex := 0;
   With GridOrdem.GetCombo[0,-1] do
       For i:=0 to Self.FieldCount - 1 do begin
         Items.Add(Self.Fields[i].DisplayLabel);
         Valores.add(InttoStr(I + 1));
       end;

   if CkConcatena.checked and (Vordem = '') Then
    for i:=GridOrdem.RowCount - 1 downto 1 do
     If GridOrdem.Cells[1,I] = IntToStr(Self.SelectedIndex + 1) then
      GridOrdem.DeletaLinha(I);


   If GridOrdem.Cells[0,GridOrdem.RowCount - 1] <> SelectedField.DisplayLabel Then begin
     If GridOrdem.Cells[0,1] <> '' Then
       GridOrdem.RowCount := GridOrdem.RowCount + 1;
     GridOrdem.Cells[0,GridOrdem.RowCount - 1] :=  Self.SelectedField.DisplayLabel;
     GridOrdem.Cells[1,GridOrdem.RowCount - 1] :=  IntToStr(Self.SelectedIndex + 1);
     GridOrdem.Cells[2,GridOrdem.RowCount - 1] :=  'Asc';
   end;

   If (Self.Owner is TForm) Then
    Caption := TForm(Self.Owner).Caption
   else
    Caption := Application.Title;
   Edit2.Text := '';
   Label1.Caption := selectedfield.displaylabel;
   Edit1.Tag := 1;
   Pesquisa.Items.Clear;
   If selectedfield.DataType in [FtDate,ftDateTime,ftTime] Then begin
    Pesquisa.Items.Add('Faixa Data');
    Pesquisa.Items.Add('Faixa Data/Hora');
    Pesquisa.Items.Add('Faixa Hora');
    Pesquisa.Items.Add('Dia');
    Pesquisa.Items.Add('Mes');
    Pesquisa.Items.Add('Ano');
    Pesquisa.Items.Add('Null');
    Pesquisa.Items.Add('Vazio');
    Edit1.EditMask := '99/99/99';
    Edit2.EditMask := '99/99/99';
    Edit1.Text     := Key+' /  /  ';
   end else begin
    Pesquisa.Items.Add('Inicio Palavra');
    Pesquisa.Items.Add('Palavra Inteira');
    Pesquisa.Items.Add('Final Palavra');
    Pesquisa.Items.Add('Valor Identico');
    Pesquisa.Items.Add('Faixa');
    Pesquisa.Items.Add('Faixa Inteiro');
    Pesquisa.Items.Add('Null');
    Pesquisa.Items.Add('Vazio');
    Edit1.EditMask := '';
    Edit2.EditMask := '';
    Edit1.Text := Key;
   end;

   if indfaixa <> '' Then begin
    pesquisa.ItemIndex := pesquisa.items.IndexOf(IndFaixa);
    if TipoDataType(Selectedfield.Datatype) = dtdata then begin
      Edit1.EditMask := '99/99/9999;1; ';
      Edit2.EditMask := '99/99/9999;1; ';
    end;
    edit1.Text := faixa1;
    edit2.Text := faixa2;
   end else if (tipodatatype(selectedfield.DataType) = dtCharacter) And (FPesqporStr > -1) Then
     Pesquisa.ItemIndex := FPesqporStr
   else if (tipodatatype(selectedfield.DataType) = dtData) And (FPesqporDt > -1) Then
     Pesquisa.ItemIndex := FPesqporDt
   else if (tipodatatype(selectedfield.DataType) = dtInteiro) And (FPesqporInt > -1) Then
     Pesquisa.ItemIndex := FPesqporInt
   else if (tipodatatype(selectedfield.DataType) = dtNumero) And (FPesqporFlt > -1) Then
     Pesquisa.ItemIndex := FPesqporFlt
   else
     Pesquisa.ItemIndex := IIfs(selectedfield.DataType in [FtFloat,ftBcd,ftCurrency],5,
                           IIfs(tipodatatype(selectedfield.DataType) = dtinteiro,3,0));

   Pesquisa.OnExit(Pesquisa);
   If CkSeparador.Checked and Not Edit2.Visible Then begin
    I := IndexOfLike(StrSep,Self.SelectedField.FieldName);
    If I >= 0 Then
     Edit1.Text := Copy(StrSep[i],length(Self.SelectedField.FieldName) + 2,length(StrSep[i]))+','+Edit1.Text;
   end;

   If (IndFaixa <> '') or (ShowModal = MrOk)   Then begin
      MontaConsulta;
      FAllDetals := CkAlldetals.Canfocus and CkAllDetals.Checked;
      PrimeiraCons := False;
      If CkPesqMestre.checked and CkPesqMestre.canfocus then begin
        FSqlDetals  := '';
        IndSqlPrinc := 1;
        repeat
           fsqlprinc   := Copy(TQuery(FDbgridPrinc.DataSource.dataset).sql.Text,IndSqlPrinc,Length(TQuery(FDbgridPrinc.DataSource.dataset).sql.Text));
           if TemWhereSql(FsqlPrinc,'UNION') > 0 then begin
             FsqlPrinc := Copy(FSqlPrinc,1,TemWhereSql(FsqlPrinc,'UNION') + 5);
             if TemWhereSql(FsqlPrinc,'ALL') > 0 then
               FsqlPrinc := Copy(FSqlPrinc,1,TemWhereSql(FsqlPrinc,'ALL') + 3);
           end;
           IndSqlPrinc := Length(fsqlprinc) + IndSqlPrinc;


           FNomeTabela := TrimLeft(StringstoStr(Copy(FSqlPrinc,TemWhereSql(FsqlPrinc,'FROM') + 5,Length(FSqlPrinc))));

           for i:=0 to Length(ConstSql) - 1 do
             if TemWhereSql(FNomeTabela,ConstSql[i]) > 0 then begin
                 FNomeTabela := Copy(FNomeTabela,1,TemWhereSql(FNomeTabela,ConstSql[i]) - 1);
                 break;
             end;

           for i:=0 to Length(ConstTab) - 1 do
             if TemWhereSql(FNomeTabela,ConstTab[i]) > 0 then begin
                 FNomeTabela := Copy(FNomeTabela,1,TemWhereSql(FNomeTabela,ConstTab[i]) - 1);
                 break;
             end;


            f := TrimRight(fnometabela);
            FnomeTabela := '';
            for i:=Length(F) downto 1 do begin
               if F[i] = ' ' then
                break;
               fnometabela := F[i] + FNomeTabela;
            end;

{           if Pos(' ',TrimLeft(StringstoStr(FNomeTabela))) > 0 then begin
             FNomeTabela := Copy(TrimLeft(StringstoStr(FNomeTabela)),1,Pos(' ',TrimLeft(StringstoStr(FNomeTabela))));
             FNomeTabela :=
           end;}

           F    := StringstoStr(Copy(TQuery(Self.DataSource.dataset).sql.text,TemWhereSql(TQuery(Self.DataSource.dataset).sql.text,'FROM'),Length(TQuery(Self.DataSource.dataset).sql.text)));

           for i:=1 to length(constsql) - 1 do
            if TemWhereSql(F,Constsql[i]) > 0 then begin
               F := Copy(F,1,TemWhereSql(F,Constsql[i]) - 1);
               break;
            end;

           FFaixaPrinc := 'EXISTS(Select *  '+F;

           try
             FAux           := TQuery.Create(Application);
             FAux.Sql.Text  := FFaixaPrinc;

             for i:=0 to FAux.ParamCount - 1 do begin
                If FDbgridPrinc.DataSource.dataset.FindField( TQuery(Self.DataSource.dataset).Params[i].name) = nil then
                 continue;
                FSList := DivideMemo(FSqlPrinc);
                try
                 FCampoOrg    := FieldtoFullField(FSList,FAux.Params[i].name);
                finally
                 FSList.Destroy
                end;
                If (Pos('.',FCampoOrg) = 0) and (Pos('(',FCampoOrg) = 0) then
                  FCampoOrg := FNomeTabela+'.'+FCampoOrg;
                Faux.Params[i].AsString := FCampoOrg;
             end;

             TrocaStringParams(FAux,FAux.Params,true);
             FFaixaPrinc := Faux.Sql.Text + ' ) ';

             if FdbgridPrinc.FSqlIni = '' then
               FdbgridPrinc.FSqlIni := TQuery(FDbgridPrinc.DataSource.dataset).Sql.Text;

             FAux.Sql.Text := FFaixaPrinc;
             if CkConcatena.Checked then
               f := TQuery(FDbgridPrinc.DataSource.dataset).Sql.Text
             else
               f := FdbgridPrinc.FSqlIni;

             for i:=0 to length(constsql) - 1 do
              if TemWhereSql(F,Constsql[i]) > 0 then begin
                 If I = 0 then
                   F := Copy(F,1,TemWhereSql(F,Constsql[i]) - 1)+
                        ' WHERE '+FFaixaPrinc+' And '#$D#$A+
                        Copy(F,TemWhereSql(F,Constsql[i]) + 6,Length(F))
                 else
                   F := Copy(F,1,TemWhereSql(F,Constsql[i]) - 1)+
                        ' WHERE '+FFaixaPrinc+#$D#$A+
                        Copy(F,TemWhereSql(F,Constsql[i]),Length(F));
                 break;
              end;
              if i = length(constsql) Then
               F := F+#$D#$A+' WHERE '+FFaixaPrinc;

              FSqlDetals := FSqlDetals + F; 

           finally
             FAux.destroy;
           end;
        until (TemWhereSql(FsqlPrinc,'UNION') = 0);

        FDbgridPrinc.FOldSql  := TQuery(FDbgridPrinc.DataSource.dataset).Sql.Text;
        FdbgridPrinc.refreshData(FSqlDetals);

      end;
   end else
      gridordem.deletalinha(GridOrdem.RowCount - 1);

  end;
 finally
  indfaixa := ''; 
 end;
 inherited KeyPress(Key);
end;

procedure TDBGridControle.MontaConsulta;
var VOini,VSql,FValor,OldSql,FVl1,Fvl2,Fnome,VValor,FOrdem:String;
    SlAux,StVl1,StVl2:TStringList;
    OldCampo:Integer;
    Fupper:Boolean;
    I,i2,i3:Integer;
    FVar:Variant;
    FList:TRegFields;
begin

   SetLength(Flist,0);
   SlAux  := TStringList.Create;




   If DataSource.DataSet.FieldList.Count > 0 then begin
     For i:=0 to DataSource.DataSet.FieldList.Count - 1 do begin
      SetLength(Flist,Length(Flist) + 1);
      With Flist[Length(Flist) - 1] do begin
        Nome         := DataSource.DataSet.FieldList[i].FieldName;
        DisplayLabel := DataSource.DataSet.FieldList[i].DisplayLabel;
        DisplayWidth := DataSource.DataSet.FieldList[i].DisplayWidth;
        Visible := DataSource.DataSet.FieldList[i].Visible;
        If TipoDataType(DataSource.DataSet.FieldList[i].DataType) in [dtnumero,dtinteiro] then
          DisplayFormat := TNumericField(DataSource.DataSet.FieldList[i]).DisplayFormat
        else If TipoDataType(DataSource.DataSet.FieldList[i].DataType) = dtData then
          DisplayFormat := TDateTimeField(DataSource.DataSet.FieldList[i]).DisplayFormat
       end;
     end;
   end else
     For i:=0 to DataSource.DataSet.Fields.Count - 1 do begin
      if (DataSource.DataSet.FieldDefs.Count > 0) and (DataSource.DataSet.FieldDefs.IndexOf(DataSource.DataSet.Fields[i].FieldName) = -1) then
       continue;
       
      SetLength(Flist,Length(Flist) + 1);
      With Flist[Length(Flist) - 1] do begin
        Nome         := DataSource.DataSet.Fields[i].FieldName;
        DisplayLabel := DataSource.DataSet.Fields[i].DisplayLabel;
        DisplayWidth := DataSource.DataSet.Fields[i].DisplayWidth;
        Visible := DataSource.DataSet.Fields[i].Visible;
        If TipoDataType(DataSource.DataSet.Fields[i].DataType) in [dtnumero,dtinteiro] then
          DisplayFormat := TNumericField(DataSource.DataSet.Fields[i]).DisplayFormat
        else If TipoDataType(DataSource.DataSet.Fields[i].DataType) = dtData then
          DisplayFormat := TDateTimeField(DataSource.DataSet.Fields[i]).DisplayFormat
       end;
     end;


   OldCampo := SelectedIndex;
   With TQuery(DataSource.DataSet) do begin
     Fupper := (FOldSql <> Sql.Text) and (FOldSql <> '');
     If (FSqlIni = '') and (FOldSql <> Sql.Text) Then begin
       FSqlIni := Sql.Text;

       i3 := TemWhereSql(StringsToStr(FSqlIni),'ORDER');
       SlOIni.Clear;
       if i3 > 0 then begin
        SlOIni.text := FSqlIni;
        slaux       := ListIndexFullField(SlOini);
        voini       := SlAux.Text;
        SlAux.text  := Strtiraespaco(VOini);
        SlOIni.Text := UpperCase(Trim(copy(StringsToStr(FSqlIni),i3 + 5,length(StringsToStr(FSqlIni)))));
        If Pos('BY',UpperCase(SlOIni.Text)) > 0 then
          SlOIni.Text := Copy(SlOIni.Text,Pos('BY',UpperCase(SlOIni.Text)) + 2,length(SlOIni.text));
        SlOIni  := SeparaString(StringsToStr(SlOIni.Text),',');
        for i3:=0 to SlOIni.Count - 1 do begin
          if Pos(' ASC',SlOIni[i3]) > 0 then
            SlOIni[i3] := Copy(SlOIni[i3],1,Pos(' ASC',SlOIni[i3]));
          if Pos(' DESC',SlOIni[i3]) > 0 then
            SlOIni[i3] := Copy(SlOIni[i3],1,Pos(' DESC',SlOIni[i3]));
          if sonumero(StrTiraespaco(SlOIni[i3])) <> StrTiraespaco(SlOIni[i3]) then
            SlOIni[i3] := IntToStr(SlAux.IndexOf(StrTiraespaco(SlOIni[i3])) + 1)
          else
            SlOIni[i3] := StrTiraespaco(SlOIni[i3]);
        end;
       end;

     end;
     Try
      If VOrdem = '' Then begin
         With FDadosDbGrid do begin

          case tipodatatype(selectedfield.DataType) of
             dtCharacter:FPesqporStr := Pesquisa.ItemIndex;
             dtData: FPesqporDt := Pesquisa.ItemIndex;
             dtInteiro:FPesqporInt :=Pesquisa.ItemIndex;
             dtNumero:FPesqporFlt :=Pesquisa.ItemIndex;
          end;

           VValor := '';
           If (Pesquisa.Text = 'Vazio') or (Pesquisa.Text = 'Null') or Not(Edit1.EditEmBranco and (Edit2.EditEmbranco or (Pos('FAIXA',UpperCase(Pesquisa.Text)) = 0))) then begin
             If CkSeparador.Checked and (Pos('FAIXA',UpperCase(Pesquisa.Text)) = 0) then begin
               StVl1  := SeparaString(Edit1.Text);
               VValor := '( ';
             end else begin
               StVl1 := TStringList.Create;
               Stvl1.Add(Edit1.Text);
             end;

             If Pesquisa.Text = 'Null' Then
                 FValor := '?Campo1 is ?Vl1'
             else If (Pesquisa.Text = 'Valor Identico') or (Pesquisa.Text = 'Vazio') Then begin
                 FValor := '?Campo1 = ?Vl1';
                 If Pesquisa.Text = 'Vazio' Then begin
                   Edit1.Clear;
                   Stvl1[0] := '';
                 end;
             end else If Pos('PALAVRA',UpperCase(Pesquisa.Text)) > 0  Then
                 FValor := '?Campo1  Like ?Vl1'
             else If Pos('FAIXA',UpperCase(Pesquisa.Text)) > 0  Then
                  FValor := Iifs(Not Edit1.EditEmBranco,'?Campo1 >= ?Vl1','')+
                            Iifs((Not Edit1.EditEmBranco) and (Not Edit2.EditEmBranco),' And ','')+
                            Iifs(Not Edit2.EditEmBranco,'?Campo1 <= ?Vl2','');

             FVl2 := Edit2.Text;
             For i:=0 to StVl1.Count - 1 do begin
                 If (Pesquisa.Text = 'Null') Then
                    StVl1[i]  := 'Null'
                 else if (TipoDataType(Self.SelectedField.DataType) = dtData) then begin
                    StVl1[i]  := ''''+DataBancoDados(StrtoDateN(StVl1[i]))+'''';
                    FVl2  := ''''+DataBancoDados(StrtoDateN(FVl2))+'''';
                 end else if (Pos('PALAVRA',UpperCase(Pesquisa.Text)) > 0) and (Pos('%',StVl1[i]) = 0) Then
                    StVl1[i]  := ''''+IIfs(Pesquisa.Text <> 'Inicio Palavra','%','')+
                                 Stvl1[i]+
                                 IIfs(Pesquisa.Text <> 'Final Palavra','%','')+''''
                 else if ((TipoDataType(Self.SelectedField.DataType) = dtCharacter) and (Pesquisa.Text <> 'Faixa Inteiro'))  then begin
                    StVl1[i] := ''''+StVl1[i]+'''';
                    FVl2 := ''''+FVl2+'''';
                 end else if (TipoDataType(Self.SelectedField.DataType) = dtData) and (Pesquisa.Text = 'Vazio') Then
                    StVl1[i] := DataBancoDados(0)
                 else if (TipoDataType(Self.SelectedField.DataType) in [dtInteiro,DtNumero]) and (Pesquisa.Text = 'Vazio') Then
                    StVl1[i] := '0';


                 VValor := VValor+IIfs(CkSeparador.Checked and (I <> 0),' OR ','')+Fvalor;
                 if Not FDadosDbGrid.CkNupper.Checked and ((Pesquisa.Text <> 'Null') and ((TipoDataType(Self.SelectedField.DataType) = dtCharacter) and (Pesquisa.Text <> 'Faixa Inteiro')) or (Pos('PALAVRA',UpperCase(Pesquisa.Text)) > 0)) then begin
                   VValor   := Trocapalavra(VValor,'?Campo1','Upper( ( ?Campo ) )');
                   Stvl1[i] := 'Upper('+StVl1[i]+')';
                   FVl2     := 'Upper('+FVl2+')';
                 end else
                   VValor := Trocapalavra(VValor,'?Campo1','( ?Campo )');
                 VValor := Trocapalavras(VValor,['?Vl1','?Vl2'],[StVl1[i],FVl2]);
             end;
             VValor := VValor + IIfs(CkSeparador.Checked,')','');
             If CkDiferente.Checked then Vvalor := 'Not( '+VValor+' )';
           end;
           Fnome  := Self.SelectedField.FieldName;
//           If Not FDadosDbGrid.CkConcatena.Checked Then
           Sql.Delete(Sql.Count - 1);
         end;

          Close;

         If Not FDadosDbGrid.CkConcatena.Checked  Then
            Sql.Text := FSqlIni
         else begin
            if FSqlEof <> '' Then
             Sql.Text := FSqlEof;
            DeletaLinhaConcatena(FNome);

         end;


         If (FDadosDbGrid.Pesquisa.Text = 'Null') or (FDadosDbGrid.Pesquisa.Text = 'Vazio') or Not(FDadosDbGrid.Edit1.EditEmBranco and (FDadosDbGrid.Edit2.EditEmbranco or (Pos('FAIXA',UpperCase(FDadosDbGrid.Pesquisa.Text)) = 0))) then begin
           Sql.Text := InsereFaixaSql(Sql,FNome,VValor,False,TQuery(Self.DataSource.DataSet).DataBaseName);
         end;


         FOrdem := '';
         For i:=1 to FDadosDbGrid.GridOrdem.RowCount - 1 do
          If FDadosDbGrid.GridOrdem.cells[0,i] <> '' Then begin
           if sloini.indexof(FDadosDbGrid.GridOrdem.cells[1,i]) > -1 then
            continue;
           FOrdem := FOrdem+IIfs(FOrdem <> '',',','')+FDadosDbGrid.GridOrdem.cells[1,i]+' '+FDadosDbGrid.GridOrdem.cells[2,i];
          end;
       end else begin
          If SloIni.IndexOf(IntToStr(PosField(Sql,SelectedField.FieldName,TQuery(Self.DataSource.DataSet).DataBaseName))) = -1 then
           FOrdem  := IntToStr(PosField(Sql,SelectedField.FieldName,TQuery(Self.DataSource.DataSet).DataBaseName))+IIfs(Vordem = 'D',' Desc ','')
          else
           FOrdem  := ''; 
          If Vordem <> 'T' Then
            If TipoDataType(SelectedField.DataType) = dtCharacter then
             FVar := Copy(SelectedField.AsString,1,255)
            else
             FVar := SelectedField.Value;
          Close;
          If VOrdem = 'T' Then
            Sql.Text := FSqlIni
          else If ((FDadosDbGrid = nil) or Not FDadosDbGrid.CkConcatena.Checked) Then begin
            VSql := Sql.Text;
            System.Delete(VSql,TemWhereSql(UpperCase(VSql),'ORDER'),Length(VSql));
            I := TemWhereSql(UpperCase(FSqlIni),'ORDER');
            If I > 0 Then begin
              VSql := VSql + 'ORDER BY ';
              For i:=I + 5 to Length(FSqlIni) do
               If Not((UpperCase(Copy(FSqlIni,I,2)) = 'BY') or (UpperCase(Copy(FSqlIni,I - 1,2)) = 'BY')) Then
                VSql := VSql + FSqlIni[i];
            end;
            Sql.Text := VSql;
          end;
       end;

        If (Fordem <> '') Then begin
//         If Not Fupper and ((FDadosDbGrid = nil) or Not FDadosDbGrid.CkConcatena.Checked) Then
         If Not Fupper or (FDadosDbGrid = nil) Then
           Sql.add('');
          Sql[Sql.Count - 1] := Sql[Sql.Count - 1] + IIfs(TemWhereSql(Sql.Text,'ORDER') > 0,',',' Order By ')+FOrdem;
        end;

        CopyParams(FParamsIni,TQuery(Self.DataSource.DataSet).Params);
        if (fdbgridprinc <> nil) and (fDbGridPrinc.DataSource <> nil) and (fDbGridPrinc.DataSource.dataset <> nil) then
         FassignParams(Tquery(fDbGridPrinc.DataSource.dataSet),TQuery(Self.DataSource.DataSet));
        Open;

        if eof then
         for i3:=0 to TForm(Self.Owner).ComponentCount - 1 do
          if (TForm(Self.Owner).Components[i3] is TDbGridControle) then
           If (TDbGridControle(TForm(Self.Owner).Components[i3]).DbGridPrinc = Self) then
            TDbGridControle(TForm(Self.Owner).Components[i3]).FAfterScroll(TDbGridControle(TForm(Self.Owner).Components[i3]).DataSource.DataSet);

        
        SelectedIndex := OldCampo;

        If Vordem = '' Then begin
          If Eof  and (FSqlEof = '') and FDadosDbGrid.CkConcatena.enabled Then
           FSqlEof := FoldSql
          else if not eof then
           FSqlEof := '';
        end else if vordem <> 'T' then begin
           Locate(SelectedField.FieldName,FVar,[loCaseInsensitive])
        end;
        FOldSql  := Sql.Text;
        For i:=0 to lENGTH(Flist) - 1 do
         If FindField(Flist[i].nome) <> Nil then
           With FieldByName(Flist[i].nome) do begin
             DisplayLabel := FList[i].DisplayLabel;
             DisplayWidth := FList[i].DisplayWidth;
             Visible := FList[i].Visible;
             If TipoDataType(DataType) in [dtnumero,dtinteiro] then
               TNumericField(Fields[i]).DisplayFormat := FList[i].DisplayFormat
             else If TipoDataType(DataType) = dtData then
               TDateTimeField(Fields[i]).DisplayFormat := FList[i].DisplayFormat
          end;
     finally
       If StVl1 <> Nil Then StVl1.Destroy;
       If StVl2 <> Nil Then StVl2.Destroy;
       If FDadosDbGrid <> Nil Then begin
        If FDadosDbGrid.CkSeparador.Checked and not FDadosDbGrid.Edit2.Visible Then begin
           i :=  IndexOfLike(StrSep,Self.SelectedField.FieldName);
           If i = -1 Then
             StrSep.Add(Self.SelectedField.FieldName+' '+FDadosDbGrid.Edit1.Text)
           else
             StrSep[i] := Self.SelectedField.FieldName+' '+FDadosDbGrid.Edit1.Text;
        end else
           StrSep.clear;
         FDadosDbGrid.Edit1.VerificaData := False;
         FDadosDbGrid.Edit2.VerificaData := False;
         FDadosDbGrid.Edit1.VerificaHora := False;
         FDadosDbGrid.Edit2.VerificaHora := False;
         FDadosDbGrid.Edit1.EditMask := '';
         FDadosDbGrid.Edit2.EditMask := '';
         FDadosDbGrid.Edit1.tEXT := '';
         FDadosDbGrid.Edit2.Text := '';
         If Not FDadosDbGrid.CkConcatena.Checked Then
          FDadosDbGrid.GridOrdem.Limpa;
       end;
     end;
     slaux.destroy;
   end;
end;

function TDBGridControle.GetPopupMenu: TPopupMenu;
Var i,i2:integer;
FNomes :array[0..15] of String;
Fpopupmenu:TPopupMenu;
begin
  if TQuery(DataSource.DataSet).RequestLive then begin
   inherited GetPopupMenu;
   exit;
  end;

   Fnomes[0]  := 'Faixas<Alt + F>';
   FNomes[1]  := '-';
   FNomes[2]  := 'Ordem Crescente<Alt + C>';
   FNomes[3]  := 'Ordem Decrescente<Alt + D>';
   FNomes[4]  :=  '-';
   FNomes[5]  := 'Imprimir<Alt + I>';
   FNomes[6]  :=  '-';
   FNomes[7]  :=  'Todos Registros<Alt + T>';
   FNomes[8]  :=  '-';
   FNomes[9]  :=  'Atualizar<Alt + A>';
   FNomes[10] :=  '-';
   FNomes[11] :=  'Somas<Alt + S>';
   FNomes[12] :=  '-';
   FNomes[13] :=  '-';
   FNomes[14] :=  '-';
   FNomes[15] :=  'Marca Todos<Alt + M>';



  If NewPop = Nil Then NewPop := TPopupMenu.Create(Self);
  Result := NewPop;
  NewPop.Items.Clear;
  FpopupMenu := PopMenuParent(Self,True);
  With Result do begin
   If FPopupMenu <> Nil Then begin
      For i:=0 to FPopupMenu.Items.Count - 1 do begin
       Items.Add(TMenuItem.Create(Result));
       Items[Items.Count - 1].Caption := FPopupMenu.Items[i].Caption;
       Items[Items.Count - 1].OnClick := FPopupMenu.Items[i].OnClick;
      end;
      Items.Add(TMenuItem.Create(Result));
      Items[Items.Count - 1].Caption := '-';
      try
       FpopupMenu.Destroy;
      except
       //
      end;
   end;


   if (ftoolbar <> Nil) then
    while ftoolbar.Componentcount > 0 do begin
      TGraphicControl(ftoolbar.Components[ftoolbar.ComponentCount - 1]).Parent := nil;
      ftoolbar.Components[ftoolbar.ComponentCount - 1].Destroy;
    end;


   if temdetalhes then
     FNomes[13] := iifs(DisableDetalhes,'Exibir Detalhes ','Inibir Detalhes ')+'<Alt + E>';

   i2 := 0;
   For i:=0 to Length(Fnomes) - 1 do begin
     If (I = 13) and not temdetalhes then
        continue;

     If (I > 13) and Not(DgMultiSelect in Options) then begin
      Fnomes[i] := '-';
      continue;
     end;

     Items.Add(TMenuItem.Create(Result));
     Items[Items.Count - 1].Caption := FNomes[i];
     Items[Items.Count - 1].OnClick := ClickPop;
     Items[Items.Count - 1].visible := (not(I in [12,13])) or temdetalhes;
     if (Fnomes[i] <> '-')  then
      inc(I2);
   end;




  If Not(csLoading in ComponentState) then
   FOR i:=Length(Fnomes) - 1 downto 0 do
     if (ftoolbar <> Nil) and (Fnomes[i] <> '-')  then
      with TToolButton.Create(Ftoolbar) do begin
        Parent     := FToolBar;
        ShowHint   := True;
        Hint       := Fnomes[i];
        Style      := tbsButton;
        OnClick    := ClickPop;
        if ftoolbar.Images <> nil then
          ImageIndex := i2 - FToolBar.ButtonCount;
      end;

  end;
end;





procedure TDBGridControle.ClickPop(Sender: TObject);
var
FKey :Char;
F,I:Integer;
FValue:String;
begin
  FKey := #0;
  
  If (Sender is TmenuItem) then
   FValue := TMenuItem(Sender).Caption
  else if (Sender is TToolButton) then
   FValue := TToolButton(Sender).Hint;


  If ((Pos('Faixas',FValue) > 0) or
      (Pos('Somas',FValue) > 0)) then begin
   FSoma := Pos('Somas',FValue) > 0;
   KeyPress(FKey);
  end else if Pos('Imprimir',ValidaCharacteres(['&'],FValue,False)) > 0 Then
   Print
  else if Pos('Atualizar',ValidaCharacteres(['&'],FValue,False)) > 0 Then
   RefreshData
  else if Pos('Detalhes',ValidaCharacteres(['&'],FValue,False)) > 0 Then begin
   try
     nmontamenu := true;
     DisableDetalhes  := Pos('Exibir',ValidaCharacteres(['&'],FValue,false)) = 0;
     FValue  := iifs(DisableDetalhes,'Exibir Detalhes<Alt + E>','Inibir Detalhes<Alt + E>');
   finally
     nmontamenu := false;
   end;
  end else if Pos('Marca Todos',ValidaCharacteres(['&'],FValue,False)) > 0 Then begin
   marcatodos
  end else If ((Pos('Ordem',ValidaCharacteres(['&'],FValue,False)) > 0) or
               (Pos('Todos',ValidaCharacteres(['&'],FValue,False)) > 0))  then
   Try
     If Pos('Ordem',ValidaCharacteres(['&'],FValue,False)) > 0 then
       Vordem := IIfs(Pos('Crescente',FValue) > 0,'C','D')
     else
       Vordem := 'T';
     MontaConsulta;
   finally
     Vordem := '';
   end;
end;

procedure TDBGridControle.ChangePgTotal(Sender: TObject);
var i,i2:integer;
    SavePlace:TBookMark;
begin
  If FChange or (FDadosDbGrid.PageControl1.ActivePage <> FDadosDbGrid.TabSheet3) Then
   exit;

  Try
      DataSource.DataSet.DisableControls;
      With FDadosDbGrid.GridTotal do
         With DataSource.DataSet do begin
            Limpa;
            Campos.Add('');
            For i:=0 to Fields.Count - 1 do
              If TipoDataType(Fields[I].DataType) = dtnumero then begin
                 Campos.Add(Fields[I].FieldName);
                 Cells[0,RowCount - 1] := Fields[I].DisplayName;
                 RowCount := RowCount + 1;
              end;
            Cells[0,RowCount - 1] := 'QTDE REGISTROS';
            SavePlace := GetBookmark;
            If SelectedRows.Count = 0 Then begin
                  First;
                  While Not Eof do begin
                    for i:=1 to RowCount - 2 do

                      If FieldByName(Campos[i]) is TNumericField Then
                       cells[1,I] := FormatFloat(TNumericField(FieldByName(Campos[i])).DisplayFormat,StrtoFloatN(cells[1,I]) + FieldByName(Campos[i]).AsFloat)
                      else
                       cells[1,I] := FloatToStr(StrtoFloatN(cells[1,I]) + FieldByName(Campos[i]).AsFloat);

                    cells[1,RowCount - 1] := IntToStr(StrtoIntN(cells[1,RowCount - 1]) + 1);
                    Next;
                  end;
            end else
                  For i2:=0 to Self.SelectedRows.Count - 1 do begin
                     GotoBookmark(pointer(SelectedRows.Items[i2]));
                     for i:=1 to RowCount - 2 do
                       If FieldByName(Campos[i]) is TNumericField Then
                        cells[1,I] := FormatFloat(TNumericField(FieldByName(Campos[i])).DisplayFormat,StrtoFloatN(cells[1,I]) + FieldByName(Campos[i]).AsFloat)
                       else
                        cells[1,I] := FloatToStr(StrtoFloatN(cells[1,I]) + FieldByName(Campos[i]).AsFloat);
                      cells[1,RowCount - 1] := IntToStr(StrtoIntN(cells[1,RowCount - 1]) + 1);
                  end;

            for i:=1 to RowCount - 2 do
              If FieldByName(Campos[i]) is TNumericField Then
               Cells[2,I] := FormatFloat(TNumericField(FieldByName(Campos[i])).DisplayFormat,StrtoFloatN(Cells[1,I])/StrtoIntN(Cells[1,RowCount - 1]))
            else
               Cells[2,I] := FloatToStr(StrtoFloatN(Cells[1,I])/StrtoIntN(Cells[1,RowCount - 1]));

            GotoBookmark(SavePlace);
            FreeBookmark(SavePlace);
         end;
         FChange := True;
     finally
         DataSource.DataSet.EnableControls;
     end;
end;

procedure TDBGridControle.KeyDown(var Key: Word; Shift: TShiftState);
var FKey:Char;
begin
  Try
    FKey := #0;

    if TQuery(DataSource.DataSet).RequestLive then Begin
      inherited KeyDown(Key,Shift);
      exit;
    end;

    If (Key = Vk_Return) and (DataSource.DataSet.Eof) then
       Key := 0;
    if (key  = vk_f1)  then begin
      GetPopupMenu;
      newpop.Popup(clientrect.Top,clientrect.left);
    end else If (ssAlt in Shift) and (Key in [70,83]) then begin
      FSOma := Key = 83;
      KeyPress(FKey);
    end else If (ssAlt in Shift) and (Key = 69) then
      DisableDetalhes  := Not Disabledetalhes
    else If (ssAlt in Shift) and (Key = 77) and (DgMultiSelect in Options) then
      MarcaTodos
    else If (ssAlt in Shift) and (Key = 73) then
      Print
    else If (ssAlt in Shift) and (Key = 65) then
      RefreshData
    else If (ssAlt in Shift) and (Key in [67,68,84]) then begin
      Vordem := iifs(Key = 67,'C',IIfs(key = 68,'D','T'));
      MontaConsulta;
    end else
      inherited KeyDown(Key,Shift);
  finally
    VOrdem := '';
  end;

end;

procedure TDBGridControle.MarcaTodos;
var
F,I:Integer;
begin
    DataSource.dataSet.First;
    keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    Try
      F := datasource.dataset.recordcount;
      f := iifs(f <= 0,rowcount,f);
      FOR I:=1 TO F do begin
         keybd_event(VK_Down, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
         keybd_event(VK_down, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      end;
    finally
       keybd_event(VK_down, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
       keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
end;

procedure TDBGridControle.Print(FQrSubDetail:TQRSubDetail=Nil);
var FRelatorio:TFrm_QrpRelatorio;
    VDataSet:TDataSet;
    i:Integer;
    SavePlace:TBookMark;
begin
  Fimp := true;
  SavePlace := DataSource.DataSet.GetBookmark;
  CPrint.Zoom := 100;
  cPrint.Preview := True;
  Cprint.VerificaTamanho := True;
  CPrint.Modal   := True;
  if FQrSubDetail = Nil then begin
    FRelatorio            := TFrm_QrpRelatorio.Create(TForm(Self.Owner));
    VDataSet              := FRelatorio.Relatorio.DataSet;
    FRelatorio.BringToFront;
  end else begin
    FRelatorio            := TFrm_QrpRelatorio(FQrSubDetail.Owner);
    With TDataSource.create(FRelatorio) do begin
      DataSet             := FRelatorio.Relatorio.DataSet;
      OnDataChange        := FDataChange;
    end;
  end;

  try
      If  FQrSubDetail = Nil then
        If  Self.SelectedRows.Count = 0 Then
            Frelatorio.Relatorio.DataSet := Self.DataSource.DataSet
        else begin
            Frelatorio.Relatorio.DataSet := TQuery.Create(Frelatorio);
            With TQuery(Frelatorio.Relatorio.DataSet) do begin
              DataBaseName := TQuery(Self.DataSource.DataSet).DataBaseName;
              Sql.Text := TQuery(Self.DataSource.DataSet).Sql.Text;
              i := UltimaLinhaFiltroSql(Sql.Text);
              If I = 0 Then
               i := length(Sql.Text) + 1;
              Sql.Text := Copy(Sql.Text,1,I - 1)+
                          IIfs(TemWhereSql(TQuery(Self.DataSource.DataSet).Sql.Text) > 0,'And ','Where ')+
                          Self.StrFaixas+
                          Copy(Sql.Text,I,Length(Sql.Text));
              Params.AssignValues(TQuery(Self.DataSource.DataSet).Params);
              Open;
            end;
         end;




      DadosRelatorio.Titulo        := TForm(Self.Owner).Caption;
      DadosRelatorio.Cabecalho     := True;
      DadosRelatorio.DadosCabecalho.NomeEmpresa := True;

      With TSelecaoRel.Create(TForm(Self.Owner)) do
       try
         if FQrSubDetail = Nil then begin
          BandaTitulo     := FRelatorio.Titulo;
          Banda           := FRelatorio.Detalhes;
          FRelatorio.Font.Size           := Font.Size;
          FRelatorio.Relatorio.Font.Size := Font.Size;
         end else begin
          BandaTitulo   := FQrSubDetail.HeaderBand.ChildBand;
          Banda         := FQrSubDetail;
         end;
         Relatorio      := Frelatorio.relatorio;
         for i:=0 to Self.DataSource.DataSet.Fields.Count - 1 do
          if Self.DataSource.DataSet.Fields[i].Visible and
            ((Self.Columns.Count = 0) or
             ((Self.Columnbyname(Self.DataSource.DataSet.Fields[i].fieldname) <> Nil) and
               Self.Columnbyname(Self.DataSource.DataSet.Fields[i].fieldname).Visible))then
           with TItemSelRel(Items.Add) do begin
           if FQrSubDetail <> Nil then
             dATASET     := FQrSubDetail.DataSet
            else
             dataset     := Frelatorio.Relatorio.DataSet;

            Flag      := FGDbText;
            Campo     := Self.DataSource.DataSet.Fields[i].FieldName;
            Tipo      := Self.DataSource.DataSet.Fields[i].DataType;
            SemCheckControle := true;
            checked := true;
            if Self.Columnbyname(Self.DataSource.DataSet.Fields[i].fieldname) <> nil then begin
              Tamanho := Self.Columnbyname(Self.DataSource.DataSet.Fields[i].fieldname).Width;
              Titulo  := Self.Columnbyname(Self.DataSource.DataSet.Fields[i].fieldname).Title.Caption;
            end else BEGIN
              Tamanho := FRelatorio.Canvas.textWidth('W') * Self.DataSource.DataSet.Fields[i].DisplayWidth;
              Titulo    := Self.DataSource.DataSet.Fields[i].DisplayLabel;
            end;

            If TipoDataType(Self.DataSource.DataSet.Fields[i].DataType) = dtnumero then begin
              Alignment := taRightJustify;
//              AligntoBand := True;
              Total := True;
            end;

            If Self.DataSource.DataSet.Fields[i] is TFloatField Then
              mascara :=  TNumericField(Self.DataSource.DataSet.Fields[i]).DisplayFormat
            else If Self.DataSource.DataSet.Fields[i] is TDateTimeField Then
              mascara :=  TDateTimeField(Self.DataSource.DataSet.Fields[i]).DisplayFormat;
          end;
          
          if Self.Columns.Count > 0 then
           for i:=0 to Self.columns.Count - 1 do
             if Items.ItemsPorCampo(Self.columns[i].fieldname) <> nil then
               if i >= Items.Count then
                Items.ItemsPorCampo(Self.columns[i].fieldname).Index := Items.Count - 1
               else
                Items.ItemsPorCampo(Self.columns[i].fieldname).Index := i;


          CriaControlsReport;
          if FQrSubDetail = nil then begin
            for i:=0 to TForm(Owner).ComponentCount - 1 do
             if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) and TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc.Canfocus then begin
               TDbGridControle(TForm(Owner).Components[i]).Print(
                  CriaSubDetail(TDbGridControle(TForm(Owner).Components[i]).Hint,
                                FRelatorio.Relatorio,
                                TDbGridControle(TForm(Owner).Components[i]).DataSource.dataset)
                               );
             end;

            CriaTotal(FRelatorio.TotalRelatorio);
            Imprelatorio(FRelatorio.Relatorio,FRelatorio);
            DeletaControlsReport;
          end;
       finally
         if FQrSubDetail = nil then destroy;
       end;
 finally
   if FQrSubDetail = nil then begin
      DataSource.DataSet.GotoBookmark(SavePlace);
      DataSource.DataSet.FreeBookmark(SavePlace);
      Frelatorio.Destroy;
      Frelatorio := Nil;
   end;
   Fimp := false;
 end;
end;

procedure TDBGridControle.refreshData(FSqlR:String='');
var
    SavePlace:TBookMark;
    i:integer;
    FList:TRegFields;
begin

   SetLength(Flist,0);
   If DataSource.DataSet.FieldList.Count > 0 then begin
     For i:=0 to DataSource.DataSet.FieldList.Count - 1 do begin
      SetLength(Flist,Length(Flist) + 1);
      With Flist[Length(Flist) - 1] do begin
        Nome         := DataSource.DataSet.FieldList[i].FieldName;
        DisplayLabel := DataSource.DataSet.FieldList[i].DisplayLabel;
        DisplayWidth := DataSource.DataSet.FieldList[i].DisplayWidth;
        Visible      := DataSource.DataSet.FieldList[i].Visible;

        If TipoDataType(DataSource.DataSet.FieldList[i].DataType) in [dtnumero,dtinteiro] then
          DisplayFormat := TNumericField(DataSource.DataSet.FieldList[i]).DisplayFormat
        else If TipoDataType(DataSource.DataSet.FieldList[i].DataType) = dtData then
          DisplayFormat := TDateTimeField(DataSource.DataSet.FieldList[i]).DisplayFormat
       end;
     end;
   end else
     For i:=0 to DataSource.DataSet.Fields.Count - 1 do begin
      SetLength(Flist,Length(Flist) + 1);
      With Flist[Length(Flist) - 1] do begin
        Nome         := DataSource.DataSet.Fields[i].FieldName;
        DisplayLabel := DataSource.DataSet.Fields[i].DisplayLabel;
        DisplayWidth := DataSource.DataSet.Fields[i].DisplayWidth;
        Visible      := DataSource.DataSet.Fields[i].Visible;
        If TipoDataType(DataSource.DataSet.Fields[i].DataType) in [dtnumero,dtinteiro] then
          DisplayFormat := TNumericField(DataSource.DataSet.Fields[i]).DisplayFormat
        else If TipoDataType(DataSource.DataSet.Fields[i].DataType) = dtData then
          DisplayFormat := TDateTimeField(DataSource.DataSet.Fields[i]).DisplayFormat
       end;
     end;


   SavePlace := DataSource.DataSet.GetBookmark;
   Try
     DataSource.DataSet.Close;
     if FSqlR <> '' Then
      TQuery(DataSource.DataSet).Sql.Text := FSqlR;
     DataSource.DataSet.Open;
   finally
     if FSqlR = '' Then
       DataSource.DataSet.GotoBookmark(SavePlace);
     DataSource.DataSet.FreeBookmark(SavePlace);
   end;

   With DataSource.DataSet do
     For i:=0 to lENGTH(Flist) - 1 do
      If FindField(Flist[i].nome) <> Nil then
        With FieldByName(Flist[i].nome) do begin
          DisplayLabel := FList[i].DisplayLabel;
          DisplayWidth := FList[i].DisplayWidth;
          Visible := FList[i].Visible;
          If TipoDataType(DataType) in [dtnumero,dtinteiro] then
            TNumericField(Fields[i]).DisplayFormat := FList[i].DisplayFormat
          else If TipoDataType(DataType) = dtData then
            TDateTimeField(Fields[i]).DisplayFormat := FList[i].DisplayFormat
        end;

end;

function TDBGridControle.StrFaixas :String;
var
I,i2:Integer;
FCampoRetorno:TStringList;
VSql:String;
begin
  Result := '';
  If DataSource.DataSet.eof Then
    exit;
    
  If Camporetorno = '' Then begin
   FCampoRetorno := TStringList.Create;
   For i:=0 to DataSource.DataSet.Fields.count - 1 do
    if (DataSource.DataSet.Fields[i].FieldKind = fkData) then
     FCampoRetorno.Add(DataSource.DataSet.Fields[i].FieldName);
  end else
   FCampoRetorno := SeparaString(CampoRetorno);
     
  If SelectedRows.Count > 0 Then begin
     Result :=  ' ( ';
     For i:=0 to SelectedRows.Count - 1 do begin
        DataSource.DataSet.GotoBookmark(pointer(SelectedRows.Items[i]));
        Result := Result +IIfs(i = 0,' ( ',' Or ( ');
        For i2:=0 to FCampoRetorno.Count - 1 do begin
         Case TipoDataType(DataSource.DataSet.FieldByName(FCampoRetorno[i2]).DataType) of
           dtcharacter:Result := Result+' '+FieldtoFullField(TQuery(DataSource.DataSet).Sql,FcampoRetorno[i2])+' = '''+DataSource.DataSet.FieldByName(FcampoRetorno[i2]).AsString+'''';
           dtnumero
           ,dtinteiro: Result := Result+' '+FieldtoFullField(TQuery(DataSource.DataSet).Sql,FcampoRetorno[i2])+' = '+TrocaPalavra(DataSource.DataSet.FieldByName(FcampoRetorno[i2]).AsString,',','.');
           dtdata:     Result := Result+' '+FieldtoFullField(TQuery(DataSource.DataSet).Sql,FcampoRetorno[i2])+' = '''+DataBancoDados(DataSource.DataSet.FieldByName(FcampoRetorno[i2]).AsDateTime)+'''';
         end;
         If I2 <> FCampoRetorno.Count - 1 then
          Result := Result +' And ';
        end;
        Result := Result + ' ) ';
     end;
     Result := Result + ' ) ';
  end else If (FSqlIni <> '') and (TQuery(DataSource.DataSet).Sql.Text = FOldSql) Then begin
     VSql := FSqlIni;
     I    := UltimaLinhaFiltroSql(VSql);
     If I > 0 Then
      VSql := Copy(VSql,1,I - 1);
      
     Result := Copy(TQuery(DataSource.DataSet).Sql.Text,Length(VSql)
              ,Length(TQuery(DataSource.DataSet).Sql.Text) - Length(VSql));

     If TemWhereSql(Result) > 0 Then
       System.Delete(Result,TemWhereSql(Result),5)
     else If TemWhereSql(TrimLeft(Result),'AND ') = 1 Then
       System.Delete(Result,TemWhereSql(Result,'AND'),3);

     i := TemWhereSql(Result,'ORDER');
     If I > 0 Then
      Result := Copy(Result,1,I - 1);

     i := TemWhereSql(Result,'Union');
     If I > 0 Then
      Result := Copy(Result,1,i - 1);

     i := TemWhereSql(Result,'Plan');
     If i > 0 Then
      Result := Copy(Result,1,i - 1);

     i := TemWhereSql(Result,'Group');
     If i > 0 Then
      Result := Copy(Result,1,i - 1);
  end;


  end;

constructor TDBGridControle.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  StrSep := TStringList.Create;
  FSoma := False;
  SlOIni := TStringList.Create;
  Fimp := false;
  nmontamenu :=False;
  FParamsIni := TParams.Create;
  FAllDetals := false;  
end;

destructor TDBGridControle.Destroy;
begin
  if dbgridprinc <> nil then
    TQuery(FDbGridPrinc.DataSource.DataSet).AfterScroll := FOldAfterScroll;    
  StrSep.Destroy;
  inherited Destroy;
  SlOIni.destroy;
  FParamsIni.destroy;
end;

procedure TDBGridControle.DeletaLinhaConcatena(VCampo: String);
var
I:integer;
FValue:String;
FStrings:Tstringlist;
begin
 With TQuery(DataSource.DataSet) do begin
   FValue := FieldtoFullField(Sql,VCampo,DataBaseName);
   for i:=Sql.Count - 1 downto 0 do
     If Pos(UpperCase(' ( '+FValue+' ) '),UpperCase(Sql[i])) > 0 then
        Sql.Delete(I);
 end;
end;


function  TDBGridControle.Columnbyname(FValue:String):TColumn;
var i:integer;
begin
  result := nil;
  for i:=0 to columns.count - 1 do
   if UpperCase(FValue) = UpperCase(Columns[i].fieldname) then begin
    result := columns[i];
    exit;
   end;
end;

Procedure TDBGridControle.FAfterScroll(DataSet: TDataSet);
var
i:integer;
FList:TRegFields;
begin

  If Fimp then
   exit;


  If Assigned(FOldAfterScroll) then
   FOldAfterScroll(Self.DataSource.DataSet);

  CarregaTamanhosCampos(False,Self.DataSource.DataSet);

  for i:=0 to TForm(Owner).ComponentCount - 1 do
   if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) then
    TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc.FAfterScroll(TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc.DataSource.dataSet);

  if (DbGridPrinc <> nil) and (Dbgridprinc.datasource <> nil) and (Dbgridprinc.datasource.dataset <> nil) then begin
     TQuery(Self.DataSource.DataSet).close;
     if (Self.FSqlIni <> '') and FAllDetals Then
      TQuery(Self.DataSource.DataSet).Sql.Text := Self.FSqlIni;
     FassignParams(Tquery(DbGridPrinc.DataSource.dataSet),TQuery(Self.DataSource.DataSet));
     TQuery(Self.DataSource.DataSet).open;
  end;

  CarregaTamanhosCampos(True,Self.DataSource.DataSet);

end;

procedure TDbGridControle.SetDbGridPrinc(Value:TDbGridControle);
var f:boolean;
begin
   f := false;
   if (value <> FDbGridPrinc) then
    If Value = nil then
     TQuery(FDbGridPrinc.DataSource.DataSet).AfterScroll := FOldAfterScroll
    else If (Value.DataSource <> Nil) and (Value.DataSource.DataSet <> Nil) Then begin
     FoldAfterScroll := TQuery(Value.DataSource.DataSet).AfterScroll;
     TQuery(Value.DataSource.DataSet).AfterScroll := FAfterScroll;
     f := true;
    end;
    FDbGridPrinc := Value ;
    If f and Value.DataSource.DataSet.Active then
     FAfterScroll(Value.DataSource.DataSet);
end;

procedure TDbGridControle.FDataChange(Sender: TObject; Field: TField);
var i:integer;
begin
    for i:=0 to TForm(Owner).ComponentCount - 1 do
     if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) and TDbGridControle(TForm(Owner).Components[i]).Canfocus then begin
        TDbGridControle(TForm(Owner).Components[i]).DataSource.DataSet.close;
        FassignParams(TQuery(Self.DataSource.dataSet),TQuery(TDbGridControle(TForm(Owner).Components[i]).DataSource.DataSet));
        TDbGridControle(TForm(Owner).Components[i]).DataSource.DataSet.open;
     end;
end;

procedure TDbGridControle.SetEnableDetalhes(Value:Boolean);
var i:integer;
f:boolean;
begin
  f := false;
  IF value <> FEnableDetalhes then
   for i:=0 to TForm(Owner).ComponentCount - 1 do
    if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) then begin
     TDbGridControle(TForm(Owner).Components[i]).Visible := Not Value;
     f := true;
    end;

  FEnableDetalhes := Value;

  if not f then
   exit;
   
  If Not Value then begin
   Align    := FAlignEnableDetalhes;
   if oldheight <> 0 then
    height   := oldheight;
  end else begin
   oldheight := height;
   Align     := FAlignDisableDetalhes;
  end;

  If (Ftoolbar <> nil) and Not(csLoading in ComponentState) then
   If Not nmontamenu then
     GetPopupMenu
   else
     for i:=0 to FtoolBar.ButtonCount - 1 do
      if Pos('DETALHES',uppercase(Ftoolbar.buttons[i].Hint)) > 0 then begin
        Ftoolbar.buttons[i].Hint := iifs(Not Value,'Inibir Detalhes','Exibir Detalhes')+' <Alt + E>';
        break;
      end;
end;

function  TDbGridControle.getdisabledetalhes:Boolean;
var i:integer;
begin
  result := false;
  for i:=0 to TForm(Owner).ComponentCount - 1 do
   if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) and
      not TDbGridControle(TForm(Owner).Components[i]).Visible  then begin
    Result := true;
    break;
   end;
end;


function  TDbGridControle.temdetalhes:Boolean;
var i:integer;
begin
   Result := False;
   for i:=0 to TForm(Owner).ComponentCount - 1 do
    if (TForm(Owner).Components[i] is TDbGridControle) and (TDbGridControle(TForm(Owner).Components[i]).DbGridPrinc = Self) then begin
     Result := true;
     break;
    end;
end;

procedure TdbgridControle.CreateWnd;
begin
   inherited CreateWnd;
   if not FCreating and  not (csDesigning in ComponentState) then begin
      FCreating := True;
      GetPopupMenu;
   end;
end;


Procedure  TdbgridControle.CarregaTamanhosCampos(Value:Boolean;FDataSet:TDataSet);
var
i:integer;
OldFont:TFont;
begin
   if Not FDataSet.Active or (value and (length(FListFields) = 0)) then
    exit;

   if not value then begin
      SetLength(FListFields,0);
      For i:=0 to FDataSet.Fields.Count - 1 do begin
        SetLength(FListFields,Length(FListFields) + 1);
        With FListFields[Length(FListFields) - 1] do begin
          Nome         := FDataSet.Fields[i].FieldName;
          DisplayLabel := FDataSet.Fields[i].DisplayLabel;
          DisplayWidth := FDataSet.Fields[i].DisplayWidth;
          Visible      := FDataSet.Fields[i].Visible;

//          if Columnbyname(FDataSet.Fields[i].FieldName) <> Nil Then
  {        else begin
            oldfont      := TCustomForm(Owner).Canvas.Font;
            TCustomForm(Owner).Canvas.Font := Self.Font;
            DisplayWidth := Columnbyname(FDataSet.Fields[i].FieldName).Width div TCustomForm(Owner).Canvas.TextWidth('W');
            TCustomForm(Owner).Canvas.Font := oldfont;
          end;}
          
          If TipoDataType(FDataSet.Fields[i].DataType) in [dtnumero,dtinteiro] then
            DisplayFormat := TNumericField(FDataSet.Fields[i]).DisplayFormat
          else If TipoDataType(FDataSet.Fields[i].DataType) = dtData then
            DisplayFormat := TDateTimeField(FDataSet.Fields[i]).DisplayFormat

         end;
       end;
   end else
      With FDataSet do
       For i:=0 to lENGTH(FListFields) - 1 do
        If FindField(FListFields[i].nome) <> Nil then
          With FieldByName(FListFields[i].nome) do begin
            DisplayLabel := FListFields[i].DisplayLabel;
            DisplayWidth := FListFields[i].DisplayWidth;
            Visible      := FListFields[i].Visible;
            If TipoDataType(DataType) in [dtnumero,dtinteiro] then
              TNumericField(Fields[i]).DisplayFormat := FListFields[i].DisplayFormat
            else If TipoDataType(DataType) = dtData then
              TDateTimeField(Fields[i]).DisplayFormat := FListFields[i].DisplayFormat
          end;



end;

Function TdbgridControle.MetaData(Seleciona:Boolean=True):TStringList;
var
i,i2:integer;
Fvalue,FTabela:String;
OldFont:TFont;
SavePlace:TBookMark;
FQuery:TQuery;
v:boolean;
const
constsql:array[0..4] of String = ('GROUP','HAVING','PLAN','ORDER','UNION');

begin
  Result      := TStringList.Create;
  Result.Text := '';

  if (DataSource = nil) or (DataSource.dataset = Nil) then
   exit;

  if fMetaDataParam = nil then
    fMetaDataParam := Tfrm_MetaDataParam.Create(Self);

  for i:=fMetaDataParam.Campos.RowCount - 1 downto 1  do
    if (fMetaDataParam.Campos.cells[1,i] <> '') and (DataSource.DataSet.Fields.FindField(fMetaDataParam.Campos.cells[1,i]) = nil) then
     fMetaDataParam.Campos.DeletaLinha(I);

  FQuery := TQuery.create(Self);
  With FQuery do
   try
     FQuery.Sql.Text := TQuery(Self.DataSource.DataSet).Sql.Text;
     FQuery.Params.Assign(TQuery(Self.DataSource.DataSet).Params);
     TrocaStringparams(FQuery,FQuery.Params);
     Fvalue   := StringstoStr(Text)+' ';
   finally
     destroy;
   end;

  Fvalue   := TrimLeft(Copy(UpperCase(Fvalue),temwheresql(Fvalue,'FROM')+4,Length(Fvalue)));
  Fvalue   := Copy(UpperCase(Fvalue),1,Pos(' ',Fvalue));
  If Pos(',',FValue) > 0 then
    FValue := Copy(FValue,1,Pos(',',FValue) - 1);

 FMetadataParam.Tabela.Text :=  TrimRight(FValue);

  for i:=0 to DataSource.DataSet.FieldCount - 1 do
    if FMetaDataParam.Campos.Cols[1].IndexOf(DataSource.DataSet.Fields[i].FieldName) = -1 then begin
      if FMetaDataParam.Campos.cells[1,1] <> '' then
       FMetaDataParam.Campos.rowcount := FMetaDataParam.Campos.rowcount + 1;
      FMetaDataParam.Campos.cells[0,FMetaDataParam.Campos.rowcount - 1] := '»';
      FMetaDataParam.Campos.cells[1,FMetaDataParam.Campos.rowcount - 1] := UpperCAse(DataSource.DataSet.Fields[i].FieldName);
    end;

  if not seleciona then
    FMetaDataParam.Campos.Marcatodos
  else If fMetaDataParam.ShowModal <> MrOk then
   exit;


  if fMetaDataParam.delete.checked then begin
    result.add('DELETE FROM '+fmetadataparam.Tabela.Text);
    if temwheresql(TQuery(DataSource.DataSet).Sql.Text) > 0 Then begin
     i2 := length(TQuery(DataSource.DataSet).Sql.text);
     for i:=0 to Length(ConstSql) - 1 do
      if temwheresql(TQuery(DataSource.DataSet).Sql.Text,ConstSql[i]) > 0 Then begin
        i2 :=  temwheresql(TQuery(DataSource.DataSet).Sql.Text,ConstSql[i]);
        i2 :=  i2 - temwheresql(TQuery(DataSource.DataSet).Sql.Text);
        break;
      end;
     Result.Add(TrimRight(Copy(TQuery(DataSource.DataSet).Sql.Text,temwheresql(TQuery(DataSource.DataSet).Sql.Text),i2)));
    end;
    result[result.count - 1] := result[result.count - 1]+ ' ;'; 
  end;

  FTabela := 'INSERT INTO '+fmetadataparam.Tabela.Text+' ( ';
  for i:=1 to  fmetadataparam.campos.rowcount - 1 do
   if fmetadataparam.campos.linhamarcada(i) then
     FTabela := FTabela+IIfs(I > 1,',','')+fmetadataparam.campos.cells[1,I];

  FTabela := FTabela+' ) Values ( ';


  with TQuery(DataSource.DataSet) do
    try
       DisableControls;
       SavePlace := GetBookmark;
       first;
       while not eof do begin
         Result.Add(FTabela);
         v := false;
         for i:=0 to FmetaDataParam.Campos.RowCount - 1 do begin
          if fmetadataparam.campos.linhamarcada(i) then begin
            if fmetadataparam.campos.cells[2,i] = '' then begin
              if Not FieldByName(fmetadataparam.campos.cells[1,i]).IsNull Then
               FValue := FieldByName(fmetadataparam.campos.cells[1,i]).AsString
              else
               FValue := 'NULL';
            end else
               With TqrEvaluator.create do
                try
                   DataSets.Clear;
                   DataSets.Add(Self.DataSource.DataSet);
                   Environment := QRGlobalEnvironment;
                   Environment.Prepare;
                   With Calculate(StringstoStr(fmetadataparam.campos.cells[2,i])) do
                      if kind = resError then
                            raise Exception.Create('Erro na Função do metada do dbgridcontrole'+Self.Name+#13+
                                                   'Campo '+fmetadataparam.campos.cells[1,i]+#13+
                                                   StrResult)
                      else if kind = resint Then
                            Fvalue := InttoStr(IntResult)
                      else if kind = resdouble  then
                            Fvalue := FloattoStr(DblResult)
                      else
                            Fvalue := strresult;

                finally
                   Destroy;
                end;

            if fvalue <> 'NULL' then
             case TipoDataType(FieldByNAme(fmetadataparam.campos.cells[1,i]).DataType) of
              dtnumero,dtinteiro:FValue := TrocaPalavra(FloatToStr(StrtofloatN(Fvalue)),',','.');
              dtdata            :FValue := ''''+DataBancoDados(StrtoDateN(FValue))+'''';
             else begin
               Fvalue := TrocaPalavra(Fvalue,'''','''''');
               Fvalue := ''''+Fvalue+'''';
             end;
             end;

             with dividememo(Fvalue) do
              try
               Result[Result.Count - 1] := Result[Result.Count - 1] +iifs(v,',','')+Strings[0];
               for i2:=1 to Count - 1 do
                Result.Add(Strings[i2]);
               v := true; 
              finally
               destroy;
              end;
          end;
         end;
         Result[result.Count - 1] := Result[result.Count - 1] + ' ); ';

         next;
       end;
    finally
       GotoBookmark(SavePlace);
       FreeBookmark(SavePlace);
       EnableControls;
    end;
end;



begin
FPesqporStr:=-1;
FPesqporInt:=-1;
FPesqporDt:=-1;
FPesqporFlt:=-1;
end.


