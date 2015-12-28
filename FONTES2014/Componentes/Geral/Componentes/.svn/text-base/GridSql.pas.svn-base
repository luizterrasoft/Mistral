unit GridSql;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, GridControl ,DbTables,Db,FuncoesGlobais,TipoDef,ComboSql,StdCtrls{,RdPrint},Math,DigTexto,Variants;
  

type

  TDadosgrid = record                                     
    field:string;
    Coluna:word;
    linha:word;
    mascara:string;
    Valor:String;
    semmascara:boolean;
  end;

  TMontaGridDataSetEvent = procedure(Var DadosGrid:TDadosGrid;Var DeletaLinha:Boolean) of object;

  TTituloGrid = Class(TstringList)
    Private
    FGrid : TStringGrid;
    FVertical: boolean;
    FAtuaCanvas: boolean;
    FAutomatico: boolean;
    procedure Add(Value: String);
    Procedure Assign(Source: TPersistent);Override;
    function GetStrings(Index: Integer): string;
    procedure SetStrings(Index: Integer; const Value: string);
    Public
      Constructor Create(Grid: TStringGrid);
      Procedure refresh(Inicio:Word);
      property Strings[Index: Integer]: string read GetStrings write SetStrings; default;
      property Verrtical:boolean read FVertical write FVertical;
      property AtuaCanvas:boolean read FAtuaCanvas write FAtuaCanvas;
      property Automatico:boolean read FAutomatico write FAutomatico;
    { Public declarations }
  end;

  TComboGrid = Record
    Objeto:TComboSql;
    Col:SmallInt;
    Lin:Smallint;
    ColAtua:SmallInt;
    LinAtua:SmallInt;
    ColunaRetorno:SmallInt;
    IncluiLinha:Boolean;
  end;


  TMascaraGrid = record
    Mascara : String;
    Coluna  : Word;
  end;

  TParametrosGridSql = Record
    Campo :String;
    Valor: Array of Variant;
    Tipo :TTipocampo;
    Unico :Boolean;
    Composto :Boolean;
    Operacao :String;
    Interno : Boolean;
    VerificaNulo:Boolean;
    Nulo        :Boolean;
 end;

 TCampoAltera = Record
   Campo:String;
   Tipo:TTipoCampo;
   Coluna:Integer;
   Nulo : boolean;
   Valor:Variant;
 end;


 TGridSql = class(TGridControl)
  private
    Combos:Array of TComboGrid;
    LinhaSelecionada,LinhaAMarcar : Word;
    AgrupaLocal : Array of String;
    pesquisa  : tquery;
    Parametros:Array of Tparametrosgridsql;
    CamposAlt :Array of TCampoAltera;
    VarCampos : Tstringlist;
    VarTitVert,VarTitHorz: TTituloGrid;
    vartabela,varbanco,VarOrdenar: String;
    FMovCombo,SaiSelect,SaiKeyPress,varmarcador,VarNEdit,FAltMarcado : boolean;
    VarColumnMarcada : integer;
    SelectSaiCombo,FDelMarcado: Boolean;
    FMascaras  : Array of TMascaraGrid;
    FSql: TStringList;
    FMontaGridDataSet: TMontaGridDataSetEvent;
    FMouseDown,FExitCombo,FDistinct: Boolean;
    fF3Editor: Boolean;
    procedure SetCampos(const Value: Tstringlist);
    procedure SetTitHorz(const Value: TTituloGrid);
    procedure SetTitVert(const Value: TTituloGrid);
    Procedure SqlLocal(Qry:TQuery;CamposLocal:Boolean);
    Procedure SetCampoAlt(Coluna:Integer;Campo:TCampoAltera);
    Procedure SetBanco(Value:String);
    Function  GetCampoAlt(Coluna:Integer):TCampoAltera;
    Procedure SetCampoInt(Campo:String;TipoCampo:TTipoCampo;Value:Boolean);
    Function  GetCampoInt(Campo:String;TipoCampo:TTipoCampo):Boolean;
    Procedure Agrupar(IndAgrupa:Word);
    Procedure PrimeiraCelulaPermitida;
    Procedure DeletaParametro(Ind:Integer);
    Procedure DeletaParametroUnico(Ind:Integer);
    function GetMascara(Coluna: Word): String;
    procedure SetMascara(Coluna: Word; const Value: String);
    procedure SetSql(const Value: TStringList);
    function  GetFieldValue(Campo: String; Linha: Word): String;
    procedure SetFieldValue(Campo: String; Linha: Word;const Value: String);
    function  GetGetCombo(FColuna,FLinha: SmallInt): TComboSql;
    { Private declarations }
  protected
    LimpaGridmontagrid : boolean;
    function SelectCell(ACol, ARow: Longint): Boolean; override;
    Procedure CreateWnd;Override;
    Procedure ExitCombo(Sender:TObject);
    Procedure ChangeCombo(Sender:TObject);
    Procedure KeyDownCombo(Sender:TObject;var Key: Word; Shift: TShiftSTate);
    procedure ColWidthsChanged; Override;
    procedure RowHeightsChanged; Override;
    { Protected declarations }
  public
     Marcando:Boolean;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy ; override;
     Function  ColunaCampo(Campo:String):SmallInt;
     Function  ComboGrid(Combo:Tcombosql):Boolean;
     Procedure DeletaCamposAlt;
     Procedure IncluiOption(FOption:TGridOption);
     Procedure ExcluiOption(FOption:TGridOption);
     Procedure adicionaparametros(Campo,Operacao:string;Valor:Variant;Tipo:TTipoCampo;Unico:Boolean);
     Procedure AdicionaParametrosCompostos(Campo,Operacao:String;Const Valor:Array of Variant;Tipo:TTipoCampo;Unico:Boolean);
     Procedure MontaGrid;
     Procedure MarcaTodos;
     Procedure DesmarcaTodos;
     Procedure DeletaCombos;
     Procedure LimpaLinhasMarcadas;
     Function  TotalMarcado(Coluna,LinhaInicial: Integer):Double;
     Function  LinhaMarcada(Linha:Integer):Boolean;
     Function  QuantidadeMarcados:Integer;
     Function  LinhaMarcacao:Word;
     Function  RetornaSoma(Coluna,Linha:Word;Const CamposAgrupa:Array of String;Marcador:Boolean):Double;
     Function  Somacoluna(Coluna:Integer):Double;
     Function  SetCombo(Col,Lin,ColRet: SmallInt):TComboSql;
     Procedure MontaGridDataSet(DataSet:TDataSet;ColIni:Word);
     Procedure AlterarDados;
     Procedure Agrupa(Const CamposAgrupa:Array of String);
     Procedure VerificaParametroNulo(Parametro:String;Nulo,Unico:Boolean);
     Property  AlteraCampo[Coluna:Integer]:TCampoAltera read GetCampoAlt Write SetCampoAlt;
     Property  CampoInterno[Campo:String;TipoCampo:TTipoCAmpo]:Boolean read GetCampoInt Write SetCampoInt;
     Property  Mascaras[Coluna:Word]:String read GetMascara Write SetMascara;
     Property  FieldValue[Campo:String;Linha:Word]:String read GetFieldValue Write SetFieldValue;
     Property  GetCombo[Coluna,Linha:SmallInt]:TComboSql read GetGetCombo;
     Procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);Override;
     Procedure editortexto(ACol,Arow:LongInt);

     //     function SelectCell(ACol, ARow: Longint): Boolean; override;
    { Public declarations }
  published
     Procedure Click;Override;
     Procedure DblClick;Override;
     Procedure DoEnter;Override;
     Procedure TopLeftChanged;Override;
     Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
     Procedure KeyPress(var Key:Char); override;
     Property Campos : Tstringlist read VarCampos write SetCampos;
     Property Tabela :String read vartabela write vartabela;
     Property BancodeDados :String read varBanco write SetBanco;
     Property Ordernar :String Read VarOrdenar Write VarOrdenar;
     Property TituloHorizontal : TTituloGrid read VarTitHorz write SetTitHorz;
     Property TituloVertical   : TTituloGrid read VarTitVert write SetTitVert;
     Property Sql              : TStringList read FSql write SetSql;
     Property Marcador         : Boolean     read VarMarcador  write varmarcador Default False;
     Property ColunaMarcada    : Integer     read VarColumnMarcada write VarColumnMarcada;
     Property NaoEditaDesmarcado : Boolean    read VarNEdit         write VarNEdit Default False;
     Property F3Editor : Boolean    read fF3Editor         write fF3Editor;
     Property SoAlteraMarcados : Boolean Read FAltMarcado Write FAltMarcado Default False;
     Property Distinct           : Boolean Read FDistinct Write FDistinct Default False;
     Property DeletaAltMarcados  : Boolean Read FDelMarcado Write FDelMarcado default false;
     Property OnMontaGridDataSet : TMontaGridDataSetEvent Read FMontaGridDataSet Write FMontaGridDataSet;
    { Published declarations }
  end;
procedure Register;


const
marcacao = '»';

implementation

procedure Register;
begin
  RegisterComponents('RodrigoComponentes', [TGridSql]);
end;

{ TGridSql }

procedure TGridSql.adicionaparametros(Campo,Operacao: string;Valor:Variant;Tipo: TTipoCampo;Unico:Boolean);
var
i,i2,i3: Integer;
begin

   for i:=0 to length(Parametros) - 1 do begin
        if (uppercase(parametros[i].campo) = uppercase(Campo)) and
           (uppercase(parametros[i].operacao) = uppercase(operacao)) and
           not (parametros[i].Interno) then begin
              parametros[i].valor[0]  := Valor;
              parametros[i].Tipo      := tipo;
              parametros[i].Unico     := unico;
              exit;
         end;// fim do se
   end;// fim do for


    SetLength(Parametros,Length(Parametros) + 1);
    SetLength(Parametros[Length(Parametros) - 1].Valor,1);
    parametros[Length(Parametros) - 1].valor[0] :=  Valor;
    parametros[Length(Parametros) - 1].tipo     :=  tipo;
    parametros[Length(Parametros) - 1].campo    :=  campo;
    parametros[Length(Parametros) - 1].Unico    :=  Unico;
    parametros[Length(Parametros) - 1].Composto :=  False;
    parametros[Length(Parametros) - 1].Operacao :=  Operacao;
    parametros[Length(Parametros) - 1].Interno  :=  False;
end;

procedure TGridSql.AdicionaParametrosCompostos(Campo,Operacao: String;
  const Valor: array of Variant; Tipo: TTipoCampo; Unico: Boolean);
var
i,i2,i3 : Integer;
begin
    for i:=0 to length(Parametros) - 1 do begin
       if (Uppercase(Campo) = Uppercase(Parametros[i].Campo)) then begin
         for i2:=0 to length(VAlor) - 1 do
          begin
            SetLength(Parametros[i].valor,length(Parametros[i].valor) + 1);
            Parametros[i].valor[length(Parametros[i].valor) - 1] := Valor[i2]
          end; // fim do for
          Parametros[i].Composto := True;
          Parametros[i].Unico    := Unico;
          exit;
       end; //fim do se
    end;// fim do for


    SetLength(Parametros,Length(Parametros) + 1);
     for i2:=0 to length(VAlor) - 1 do begin
        SetLength(Parametros[Length(Parametros) - 1].Valor,Length(Parametros[Length(Parametros) - 1].valor) + 1);
        parametros[Length(Parametros) - 1].valor[Length(Parametros[Length(Parametros) - 1].valor) - 1]  :=  Valor[i2];
     end;
     parametros[Length(Parametros) - 1].tipo     :=  tipo;
     parametros[Length(Parametros) - 1].campo    :=  campo;
     parametros[Length(Parametros) - 1].Operacao :=  Operacao;
     parametros[Length(Parametros) - 1].Unico    :=  Unico;
     parametros[Length(Parametros) - 1].Composto :=  True;
     parametros[Length(Parametros) - 1].Interno  :=  False;
end;


procedure TGridSql.Agrupa(Const CamposAgrupa:Array of string);
var
i : Word;
begin
  setlength(Agrupalocal,Length(CamposAgrupa));
  for i:=0 to length(camposagrupa) - 1 do
    AgrupaLocal[i] := CAmposAgrupa[i];
end;

procedure TGridSql.Agrupar(IndAgrupa:Word);
var
i,i2 : word;
begin
        For i:=IndAgrupa + 1 to RowCount - 1 do begin
              for i2:=0 to Length(AgrupaLocal) - 1 do begin
                  If Cells[ColunaCampo(AgrupaLocal[i2]),IndAgrupa] <> Cells[ColunaCampo(AgrupaLocal[i2]),i] then
                   break;
              end;


              If i2 > Length(AgrupaLocal) - 1 then
                 DeletaLinha(I) ;
        end;

      if IndAgrupa < RowCount - 1 then
       Agrupar(IndAgrupa + 1);


end;

procedure TGridSql.AlterarDados;
var
pesquisalocal:TQuery;
i,i2,i3,OldRow:Word;
temcampo:boolean;
valorlocal : variant;
begin

   If Length(CamposAlt) = 0 then
    exit;

   Oldrow := Row;
   pesquisaLocal := TQuery.create(application);



   with pesquisaLocal do begin
    databasename := VarBanco;

      for i:=FixedRows  to rowcount - 1 do begin
        LinhaSelecionada := i;
       if FAltMarcado and  Not(LinhaMarcada(I)) then
         Continue;

         PesquisaLocal.sql.clear;
         Sql.Add('UPDATE '+VarTabela+' SET  ');
            for i2:=0 to Length(CamposAlt) - 1 do begin

                if ParamCount <> 0 then
                  sql.add(' ,');

                sql.add(CamposAlt[i2].Campo+'      = :Alt'+CamposAlt[i2].Campo);
                   If (VarType(CamposAlt[i2].Valor) = $0000) and (CamposAlt[i2].Coluna > -1)  then begin
                       If CamposAlt[i2].Tipo = VarString        then
                            ValorLocal := Cells[CamposAlt[i2].Coluna,LinhaSelecionada]
                       else If (CamposAlt[i2].Tipo = VarDate)  then begin
                           If (Cells[CamposAlt[i2].Coluna,LinhaSelecionada] <> '') and (Cells[CamposAlt[i2].Coluna,LinhaSelecionada] <> '  /  /  ') then
                              ValorLocal := StrtoDateTime(Cells[CamposAlt[i2].Coluna,LinhaSelecionada])
                           else
                              ValorLocal := Unassigned;
                       end Else If CamposAlt[i2].Tipo = VarCurrency then
                          ValorLocal := StrtoFloatN(Cells[CamposAlt[i2].Coluna,LinhaSelecionada])
                       else If CamposAlt[i2].Tipo = VarInteger  then
                          ValorLocal := StrtoIntN(Cells[CamposAlt[i2].Coluna,LinhaSelecionada]);
                  end else 
                        ValorLocal := CamposAlt[i2].Valor;

                If VarisEmpty(ValorLocal) then begin
                     ParamByName('Alt'+CamposAlt[i2].Campo).DataType := VarTypeToDataType(TipoCampoToVariant(CamposAlt[i2].Tipo));
                     ParamByName('Alt'+CamposAlt[i2].Campo).Clear;
                 end
                else If CamposAlt[i2].Tipo = VarString then
                   ParamByName('Alt'+CamposAlt[i2].Campo).AsString      := ValorLocal
                else If (CamposAlt[i2].Tipo = VarDate) then
                   ParamByName('Alt'+CamposAlt[i2].Campo).AsDateTime   := ValorLocal
                Else If (CamposAlt[i2].Tipo = VarCurrency) then
                   ParamByName('Alt'+CamposAlt[i2].Campo).AsFloat      := ValorLocal
                else If CamposAlt[i2].Tipo = VarInteger then
                  ParamByName('Alt'+CamposAlt[i2].Campo).AsInteger     := ValorLocal;
         end;



       SqlLocal(PesquisaLocal,True);
       PesquisaLocal.execsql;
      end;

     If FAltMarcado then begin
        If FDelMarcado then begin
           Row := 1;
           LimpaLinhasMarcadas;
         end
        else begin
           Row := OldRow;
           DesmarcaTodos;
        end;

     end;

     destroy;

   end;





end;

procedure TGridSql.Click;
var
OldOptions    : Set of TgridOption;
FONSelectCell : TSelectCellEvent;
begin
     FOnSelectCell := OnSelectCell;
     OnSelectCell  := Nil; 
     OldOptions := Options;
     If (VarMarcador) and (VarNEdit) then begin
        If Cells[varcolumnmarcada,Row] <> Marcacao then begin
          if goEditing in Options then
            Exclude(OldOptions,goEditing);

          if not (goRowSelect in OldOptions) then
            Include(OldOptions, goRowSelect);
        end
       else begin
          if not (goEditing in OldOptions) then
            Include(OldOptions, goEditing);

          if goRowSelect in OldOptions then
            Exclude(OldOptions, goRowSelect);

       end;
//      PrimeiraCelulaPermitida;
    end;
    Options       := OldOptions;
    OnSelectCell  := FOnSelectCell;


    inherited Click;




     If VarNEDit and linhaMarcada(Row) and (Col = VarColumnMarcada) then begin
          SaiSelect := True;
          SelectCell(Col,Row);
//          SysUtils.Abort;
     end;


end;

function TGridSql.ColunaCampo(Campo: String):SmallInt;
var
i,i2 : Word;
FCampo:String;
begin

   Result := -1;

   If (Campo = '') or (VarCampos.Count = 0) then
    exit;

   for i:=0 to VarCampos.Count - 1 do begin
         If Pos(' AS ',UpperCase(VarCampos[i])) > 0 then
           FCampo := StrTiraEspaco(Copy(UpperCase(VarCampos[i]),Pos(' AS ',UpperCase(VarCampos[i])) + Length(' AS '),Length(UpperCase(VarCampos[i])) - Pos(' AS ',UpperCase(VarCampos[I])) - Length(' AS ') + 1));

          If (Uppercase(Campo) = UpperCase(VarCampos[i]))  or  (Uppercase(Campo) = UpperCase(FCampo))   then begin
            Result := I;
            Exit;
          end;
   end;

end;

constructor TGridSql.Create(AOwner: TComponent);
begin
    inherited Create(Aowner);
    Marcando := false;
    limpagridmontagrid := true;
    pesquisa  := tquery.create(Self);
    varcampos := TstringList.create;
    FMovCombo := False;
    FExitCombo:= False;
    If vartitVert = nil then  VarTitVert := TTituloGrid.Create(Self);
    If vartithorz = nil then  VarTitHorz := TTituloGrid.Create(Self);
    FSql := TStringList.Create;
    saiselect := false;
    SaiKeyPress := False;
    FMouseDown := False;
end;


procedure TGridSql.DblClick;
begin
   if varmarcador then begin
    if Cells[varcolumnmarcada,row] <> Marcacao then
      Cells[varcolumnmarcada,row] := Marcacao
    else
      Cells[varcolumnmarcada,row] := '';
    Click;
//    PrimeiraCelulaPermitida;
  end;

  inherited  DblClick;
end;

procedure TGridSql.DesmarcaTodos;
var
i,oldrow : integer;

begin
  Marcando := true;
  for i:=fixedrows to RowCount - 1 do
    if Cells[varcolumnmarcada,I] = Marcacao then begin
      LinhaAMarcar := I;
      Cells[VarColumnMarcada,i] := '';
      inherited  DblClick;
    end;
  Marcando := false;
  click;
end;

destructor TGridSql.Destroy;
begin
  if varcampos <> nil then
   varcampos.destroy;

  if vartitvert <> nil then
   vartitVert.destroy;

  if VarTitHorz <> nil then
   varTitHorz.destroy;

  If Pesquisa <> nil then Pesquisa.Destroy;
  If FSql <> nil then FSql.Destroy;

  inherited destroy;
end;

procedure TGridSql.DoEnter;

begin
  inherited DoEnter;
//  Click;
end;


function TGridSql.GetCampoAlt(Coluna:Integer):TCampoAltera;
var
i : word;
begin
   For i:=0 to Length(CamposAlt) - 1 do begin
     If CamposAlt[i].Coluna = Coluna then
       Result := CAmposAlt[i];
   end;
end;

function TGridSql.GetCampoInt(Campo: String;TipoCampo:TTipoCampo): Boolean;
var
i : Word;
begin
   For i:=0 to length(Parametros) - 1 do begin
     If Not(UpperCase(Parametros[i].Campo) = UpperCase(Campo)) then
      continue;

     Result := Parametros[i].Interno;
   end;
end;

procedure TGridSql.KeyDown(var Key: Word; Shift: TShiftSTate);
var oldmovcelula : boolean;
begin
   if  VarMarcador and (Shift=[ssCtrl]) and (key = 77) then begin
     dblclick;
     SaiKeyPress := True;
   end;

   If (shift = [ssctrl]) and (key = vk_f3) and F3editor Then
    EditorTexto(Col,Row);
    
   inherited KeyDown(Key,Shift);


end;

function TGridSql.LinhaMarcada(Linha: Integer): Boolean;
begin
   Result := (Cells[VarColumnMarcada,Linha] = Marcacao);
end;

procedure TGridSql.MarcaTodos;
var
i : integer;
begin
  Marcando := true;
  for i:=fixedrows to RowCount - 1 do
    if Cells[varcolumnmarcada,I] <> Marcacao then begin
      LinhaAMarcar := I;
      Cells[VarColumnMarcada,i] := Marcacao;
      inherited  DblClick;
    end;
  Marcando := false;
  click;
end;

procedure TGridSql.MontaGrid;
var
i,i2,I3,I4: Word;
camposlocal : string;
ColunasAgrupa : Array of Word;
OldRow      : word;
begin
  If LimpaGridmontagrid then
   Limpa;
  with pesquisa do begin
    databasename := VarBanco;
    sql.clear;
    sql.add('Select ');
       for i:=0 to  VarCampos.Count - 1 do begin
          if VarCampos.Strings[i] = '' then
           continue;

          if camposlocal <> '' then
           camposlocal := camposlocal+','+VarCampos.Strings[i]
          else
           camposlocal := VarCampos.Strings[i];
       end;

    sql.add(camposlocal);
    sql.add('From '+VarTabela);
    If FSql.Text <> '' then begin
//      WhereouAnd(Pesquisa);
      For i:=0 to Fsql.Count - 1 do
        sql.add(FSql[I])
    end;
    sqllocal(Pesquisa,False);
    if varordenar <> '' then
      sql.add('Order By '+VarOrdenar);

     open;

   if eof then Begin
    Limpa;
    exit;
   end;

      If Length(AgrupaLocal) <> 0 then begin
        SetLength(ColunasAgrupa,Length(AgrupaLocal));
        For i:=0 to Length(AgrupaLocal) - 1 do
          ColunasAgrupa[I] := ColunaCampo(AgrupaLocal[i]);
      end;

      if not LimpaGridmontagrid then
         i2       := RowCount - FixedRows + 1
      else
         i2       := Fixedrows;

      OldRow   := RowCount - FixedRows;

      rowcount := RowCount - FixedRows + Recordcount;

      While not eof do begin
          for i:=0 to  Varcampos.Count - 1 do begin
             if varcampos.strings[i] = '' then
              continue;


            If not (Pos(' as ',VarCampos.Strings[i]) > 0) then
               CamposLocal := VarCampos.Strings[i]
            else
               CamposLocal := Copy(VarCampos.strings[i],Pos(' as ',VarCampos.strings[i]) + Length(' as '),Length(VarCampos.Strings[i]) - Pos(' as ',VarCampos.strings[i]) - Length(' as ') + 1);

            if (fieldbyname(CamposLocal).DataType = FtFloat) or (fieldbyname(CamposLocal).DataType = FtCurrency)then begin
                If GetMascara(I2) = '' then
                  Cells[i,i2] := FormatFloat('#,##0.00',FieldByName(CamposLocal).AsFloat)
                else
                  Cells[i,i2] := FormatFloat(GetMascara(i),FieldByName(CamposLocal).AsFloat);
              end
            else if (fieldbyname(CamposLocal).DataType = FtDate) or (fieldbyname(CamposLocal).DataType = FtDateTime)then begin
                If FieldByName(CamposLocal).AsDateTime <> 0 then
                   If GetMascara(I) = '' then
                      Cells[i,i2] := FormatDateTime('dd/mm/yy',FieldByName(CamposLocal).AsDateTime)
                   else
                      Cells[i,i2] := FormatDateTime(GetMascara(i),FieldByName(CamposLocal).AsDateTime);
              end
            else
               Cells[i,i2] := FieldByName(CamposLocal).AsString;


         end;

         pesquisa.next;

         If Length(AgrupaLocal) <> 0 then begin
             For i3:=i2 - 1 downto  FixedRows  do begin
                  For i4:=0 to Length(ColunasAgrupa) - 1 do
                    If Cells[ColunasAgrupa[i4],i2] <> Cells[ColunasAgrupa[i4],i3] then
                     break;

                  If Not(I4 <= Length(ColunasAgrupa) - 1) then begin
                    DeletaLinha(I3);
                    Break;
                  end;
             end;

             If i3 >= FixedRows then
              Continue;
           end;

        if not limpagridmontagrid then begin
            For i3:=Oldrow downto FixedRows   do begin
              for i4:=Fixedcols to varcampos.count - 1 do
                If (VarCampos[i4] <> '') and (Cells[i4,i2] <> Cells[i4,i3]) then
                  break;

                If Not(I4 <= varcampos.count - 1) then
                  For i4:=fixedcols to colcount - 1 do
                    If (I4 > VarCampos.Count - 1) or (VarCampos[i4] = '') then
                     Cells[i4,i2] := Cells[i4,i3];
            end;
          end;



         inc(i2);
    end;

        if not limpagridmontagrid then begin
          While OldRow >= FixedRows do begin
            LimpaLinhaGrid(Self,OldRow);
            OldRow := OldRow - 1;
          end;



        end;

   end;




    {        if not limpagridmontagrid then begin
            For i3:=OldRow downto FixedRows  do begin
              for i4:=Fixedcols to varcampos.count - 1 do
                If (VarCampos[i4] <> '') and (Cells[i4,i2] <> Cells[i4,i3]) then
                  break;

                If Not(I4 <= varcampos.count - 1) then begin
                  For i4:=fixedcols to colcount - 1 do
                    If (I4 > VarCampos.Count - 1) or (VarCampos[i4] = '') then
                     Cells[i4,i2] := Cells[i4,i3];


                  Break;
                end;
            end;

           If OldRow >= FixedRows then begin
             DeletaLinha(OldRow);
             OldRow := OldRow - 1;
             Continue;
           end;
        end;

   end;}

{  If Length(AgrupaLocal) <> 0 then
    Agrupar(FixedRows);}
end;


function TGridSql.SelectCell(ACol, ARow: Integer): Boolean;
var
i,FCol,Frow : Integer;
FCombo:TComboSql;
FP,FPS:TRect;
FOldExit:TNotifyEvent;
FOldCombo:TComboSql;
begin


     If SaiSelect then begin
       for i:=VarColumnMarcada + 1 to ColCount - 1 do begin
         if not(CellSkip[i]) then begin
            SaiSelect := False;
            Col := i;
            Exit;
         end;
       end;
     end;


     Result :=  Inherited SelectCell(ACol, ARow);

     If Not FMovCombo and Not CellSkip[ACol] and
        (TForm(Owner).activecontrol <> Nil) and
        (TForm(Owner).activecontrol.Classtype = Tcombosql) AND
        (ComboGrid(TComboSql(TForm(Owner).ActiveControl))) and
        (GetCombo[ACol,ARow] = Nil) AND
        TComboSql(TForm(Owner).activecontrol).Visible then begin
          Try
            FOldCombo   := TComboSql(TForm(Owner).activecontrol);
            FoldExit    := FolDcOMBO.OnExit;
            FOldCombo.OnExit := Nil;
            FSaidoEnter := True;
            PulaSelectCell := True;
            SetFocus;
            FOldCombo.Visible := False;
          finally
            FOldCombo.OnExit := FoldExit;
            FSaidoEnter := False;
            PulaSelectCell := False;
          end;
     end;         

     If (Arow >= FixedRows) and (goEditing in Options) and
     (((Result or FromPulaCelula) and (GetCombo[ACol,ARow] <> Nil)) or (Not Result and Not CellSkip[ACol] and (GetCombo[Col,Row] <> Nil))) and
     ((TForm(Owner).ActiveControl = Self)
      or ((TForm(Owner).activecontrol.Classtype = Tcombosql)
      and (ComboGrid(TComboSql(TForm(Owner).ActiveControl))))) then begin
         If ((Result or FromPulaCelula) and (GetCombo[ACol,ARow] <> Nil)) then begin
            Fcol := Acol;
            FRow := ARow;
         end else begin
            Fcol := col;
            FRow := Row;
         end;

         FCombo         := GetCombo[FCol,FRow];
         FCombo.Visible := True;
         FCombo.Font    := Self.Font;

         For i:=0 to Length(Combos) - 1 do
          If Combos[I].Objeto = FCombo then
            Break;

          Combos[I].ColAtua := Fcol;
          Combos[I].LinAtua := FRow;
          FP      := CellRect(Fcol,FRow);
          FSaidoExit := True;
          FCombo.SetFocus;


          FCombo.Top     := Top + FP.Top + 1;
          FCombo.Left    := Left + FP.Left + 1;
          FCombo.Width   := FP.Right + Left + 1 - Left - FP.Left;
          FCombo.Height  := FP.Bottom + Top + 1 - Top - FP.Top;

          FSaidoExit      := False;


          If Combos[i].ColunaRetorno > -1 then 
            FCombo.OldValue := VarAsType(Cells[Combos[i].ColunaRetorno,FRow],TipoCampoToVariant(FCombo.TipoCampo));

          If FCombo.Style <> CsDropDownList then
            FCombo.Text      := Cells[Fcol,FRow]
          else begin
              FCombo.ItemIndex := -1;
              For i:=0 to FCombo.Items.Count - 1 do
               If FCombo.Items[I] = Cells[FCOl,FRow] then begin
                  FCombo.ItemIndex := I;
                  Break;
               end;
          end;


     end;
     FExitCombo := False;
end;

procedure TGridSql.PrimeiraCelulaPermitida;
var i:word;
begin
   for i:=0 to ColCount - 1 do begin
     If (i <> VarColumnMarcada) and Not(CellSkip[i]) then begin
       Col  := i;
       exit;
     end;
   end;
end;

function TGridSql.QuantidadeMarcados: Integer;
var
i : integer;
begin
  result := 0;
  for i:=0 to rowcount - 1 do
    if LinhaMarcada(i) then
      inc(result);
end;



procedure TGridSql.SetBanco(Value: String);
begin
   Pesquisa.DataBaseName := Value;
   VarBanco              := Value;
end;

procedure TGridSql.SetCampoAlt(Coluna:Integer;Campo:TCampoAltera);
var
i : Integer;
begin
   For i:=0 to Length(CamposAlt) - 1 do begin
   If UpperCase(CamposAlt[i].Campo) = UpperCase(Campo.Campo) then
     Break;
  end;

  If i > Length(CamposAlt) - 1 then
   SetLength(CamposAlt,Length(CamposAlt) + 1);

  CamposAlt[i]        := Campo;
  CamposAlt[i].Coluna := Coluna;
end;

procedure TGridSql.SetCampoInt(Campo: String;TipoCampo:TTipoCampo;Value: Boolean);
var
i : Integer;
begin
   For i:=0 to length(Parametros) - 1 do begin
     If (UpperCase(Parametros[i].Campo) = UpperCase(Campo))
        and (Parametros[i].Interno) then
      break;
   end;

  If i > length(Parametros) - 1 then
     SetLength(Parametros,Length(Parametros) + 1);

  Parametros[i].Campo    := Campo;
  Parametros[i].Interno  := True;
  Parametros[i].Operacao := '=';
  Parametros[i].Composto := False;
  Parametros[i].Unico    := True;
  Parametros[i].Tipo     := TipoCampo;
end;

procedure TGridSql.SetCampos(const Value: Tstringlist);
var
i,i2 : integer;
begin
{   for i:=0 to value.count - 1 do begin

      If Value[i] = CamposAlt[i] then begin
         CamposAlt[i] := false;
         continue;
      end;

      For i2:=0 to VarCampos.Count - 1 do begin
         If Uppercase(VarCampos[i2]) = Uppercase(Value[i]) then
           break;
      end;

      If i2 <= VarCampos.Count - 1 then
       CamposAlt[i] := true
      else
       CamposAlt[i] := False;
   end;}

   VarCAmpos.Assign(VAlue);
end;


procedure TGridSql.SetTitHorz(const Value: TTituloGrid);
var
i : integer;
begin
    VarTitHorz.Assign(VAlue);

{   if vartithorz.Count = 0 then
    exit;

   for i:=0 to vartithorz.count - 1 do begin
     cells[i,0] := vartithorz.strings[i];
   end;}
end;

procedure TGridSql.SetTitVert(const Value: TTituloGrid);
var
i : integer;
begin
    VarTitVert.Assign(VAlue);

{   if vartitVert.Count = 0 then
    exit;

   for i:=0 to vartitVert.count - 1 do begin
     cells[0,i] := vartitVert.strings[i];
   end;}

end;



procedure TGridSql.SqlLocal(Qry: TQuery;CamposLocal:Boolean);
var
i,i2 : word;
temcampo:Boolean;
begin
   If Length(Parametros) = 0 then
    exit;

   TemCampo := False;
   i2 := 0;
   with qry do begin
    for i:=0 to Length(Parametros) - 1 do begin

              If not CamposLocal and Parametros[i].Interno then
                continue;

              If Parametros[i].Interno and (Cells[ColunaCampo(Parametros[i].CAmpo),LinhaSelecionada] = '') then
                continue;

              if Not(TemCAmpo) then begin
                  sql.add('Where  ');
                  TemCampo := True;
               end
              else
                  sql.add('And    ');


               if  (Parametros[i].Composto) then begin
                    Sql.add(Parametros[i].Campo+' '+Parametros[i].Operacao+'  (');
                    if Parametros[i].Tipo <> Varstring then
                        sql.add(Parametros[i].Valor[0])
                     else
                        sql.add(''+Parametros[i].Valor[0]+'');

                    for i2:=1 to Length(Parametros[i].Valor) - 1 do begin
                      if Parametros[i].Tipo <> Varstring then
                        sql.add(','+Parametros[i].Valor[i2])
                     else
                        sql.add(','+''+Parametros[i].Valor[i2]+'');
                    end;
                    sql.add(')');

                    Continue;
              end;

              if  (Parametros[i].Interno) then begin
                SetLength(Parametros[i].Valor,1);
                if Parametros[i].Tipo = VarString then
                  Parametros[i].Valor[0] := Cells[ColunaCampo(Parametros[i].CAmpo),LinhaSelecionada]
                else if Parametros[i].Tipo = VarInteger then
                  Parametros[i].Valor[0] := StrtoIntN(Cells[ColunaCampo(Parametros[i].CAmpo),LinhaSelecionada]);
              end;

               if Not Parametros[i].VerificaNulo then
                   If Uppercase(Parametros[i].Operacao) = 'LIKE' then begin
                     sql.add('Upper'+'('+Parametros[i].Campo+') '+Parametros[i].Operacao+' '+':'+Parametros[i].Campo+IntToStr(I))
                   end else If Uppercase(Parametros[i].Operacao) <> '<>NULL' then
                     sql.add(Parametros[i].Campo +' '+Parametros[i].Operacao+' '+':'+Parametros[i].Campo+IntToStr(I))
                   else begin
                     sql.add('( '+Parametros[i].Campo +' <> '+':'+Parametros[i].Campo+IntToStr(I));
                     sql.add( ' or  '+Parametros[i].Campo +' Is Null )');
                   end
               else begin
                    sql.add(Parametros[i].Campo);
                    If not Parametros[i].Nulo then
                      sql.add(' Is Not Null ')
                    else
                      sql.add(' Is Null ');
                      //                  sql.add(' is  Null ');
                    continue;
               end;

              if Parametros[i].Tipo = Varstring then begin
                If Uppercase(Parametros[i].Operacao) <> 'LIKE' then
                    Parambyname(Parametros[i].Campo+IntToStr(I)).AsString     := Parametros[i].valor[i2]
                else
                    Parambyname(Parametros[i].Campo+IntToStr(I)).AsString     := UpperCase(Parametros[i].valor[i2])+'%';
              end else if  Parametros[i].Tipo = VarInteger then
                 Parambyname(Parametros[i].Campo+IntToStr(I)).AsInteger := Parametros[i].valor[i2]
              else if  Parametros[i].Tipo = VarCurrency then
                Parambyname(Parametros[i].Campo+IntToStr(I)).AsFloat    := Parametros[i].valor[i2]
              else if  Parametros[i].Tipo = VarDate then
                Parambyname(Parametros[i].Campo+IntToStr(I)).AsDateTime := Parametros[i].valor[i2];

    end;


    DeletaParametroUnico(0);
    {     for i:=0 to Length(Parametros) - 1 do begin
        if Parametros[i].Unico then
          continue;

        for i2:=i to Length(Parametros) - 2 do
          parametros[i2] := parametros[i2 + 1];

     end;}

    i2:= i;
   end;
end;

function TGridSql.TotalMarcado(Coluna,LinhaInicial: Integer):Double;
var
i : integer;
totalmarcadolocal:currency;
begin
   Result := 0;
   For i:=Linhainicial to rowcount - 1 do
     If LinhaMarcada(i) then
       result := StrtoFloatN(Cells[Coluna,i]) + result;
end;

procedure TGridSql.KeyPress(var Key: Char);
var Fcol,Frow,OldQtdLin,I:word;
    VincluiLinha:boolean;
begin
   If SaiKeyPress then begin
     SaiKeyPress := False;
     Abort;
   end;

   VIncluiLinha := (Key = #13) and IncluiLinha and Not((Col <> ColCount -1) And ((Col <> Limite) Or (Limite = -1)));

   inherited KeyPress(Key);

   if VincluiLinha and (GetCombo[col,Row] <> Nil) and (GetCombo[Fcol,FRow] = Nil)  then
      SelectCell(col,row);

end;

procedure TGridSql.LimpaLinhasMarcadas;
var i:Word;
begin
   For i:=FixedRows to RowCount - 1 do begin
      If Not(LinhaMarcada(i)) then
         continue;

         DeletaLinha(I);
         LimpaLinhasMarcadas;
   end;
end;

procedure TGridSql.VerificaParametroNulo(Parametro: String;Nulo,Unico:Boolean);
begin
  SetLength(Parametros,Length(Parametros) + 1);
  Parametros[Length(Parametros) - 1].Campo        := Parametro;
  Parametros[Length(Parametros) - 1].Interno      := False;
  Parametros[Length(Parametros) - 1].Composto     := False;
  Parametros[Length(Parametros) - 1].Unico        := Unico;
  Parametros[Length(Parametros) - 1].VerificaNulo := True;
  Parametros[Length(Parametros) - 1].Nulo         := Nulo;
end;

procedure TGridSql.DeletaParametro(Ind: Integer);
var
i,i2: integer;
begin
  For i:=Ind to Length(Parametros) - 2 do
    Parametros[i] := Parametros[i + 1];

  SetLength(Parametros,Length(Parametros) - 1);
end;

procedure TGridSql.DeletaParametroUnico(Ind: Integer);
var
i,i2: integer;
begin
  For i:=Ind to Length(Parametros) - 1 do begin
   If Parametros[i].Unico then
    continue;
   Break;
 end;

 If I > Length(Parametros) - 1 then
  exit;

 DeletaParametro(i);
 DeletaParametroUnico(Ind + 1);
end;




function TGridSql.GetMascara(Coluna: Word): String;
var i : integer;
begin
   Result := '';
   For i:=0 to Length(FMascaras) - 1 do
     If FMascaras[i].Coluna = Coluna then begin
       Result := FMascaras[I].Mascara;
       Exit;
     end;

end;

procedure TGridSql.SetMascara(Coluna: Word; const Value: String);
var i: Integer;
begin
   For i:=0 to Length(FMascaras) - 1 do
     If FMascaras[i].Coluna = Coluna then begin
       FMascaras[i].Mascara := Value;
       Exit;
     end;

   SetLength(FMascaras,Length(FMascaras) + 1);
   FMascaras[Length(FMascaras) - 1].Mascara := Value;
   FMascaras[Length(FMascaras) - 1].Coluna  := Coluna;
end;



procedure TGridSql.CreateWnd;
var i:integer;
begin
  inherited CreateWnd;

  if VarTitHorz.count > 0 then
   For i:=0 to ColCount - 1 do
    If VarTitHorz.count > I then
     Cells[I,0] := VarTitHorz[I];
end;

procedure TGridSql.SetSql(const Value: TStringList);
begin
  FSql.Assign(Value);
end;



function TGridSql.LinhaMarcacao: Word;
begin
  If Not Marcando then
    Result := Row
  else
    Result := LinhaAMarcar;
end;


procedure TGridSql.MontaGridDataSet(DataSet: TDataSet;ColIni:Word);
var i,i2:Integer;
    FDadosGrid:TDadosGrid;
    FDeletaLinha:Boolean;
begin

   VarCampos.clear;
   With DataSet do begin

     while colini > VarCampos.count do
       VarCampos.Add('');

      for i := 0 to Fields.Count - 1 do
        VarCampos.Add(Fields[i].Fieldname);

       ColCount := VarCampos.Count;
       Limpa;
       First;
       While Not Eof do begin
           for i:=0 to VarCampos.Count - 1 do begin
             If (I >= colIni) and Not Fieldbyname(VarCampos[i]).IsNull then
                cells[i,Rowcount - 1] := fieldbyname(VarCampos[i]).AsString;


                FDadosGrid.Mascara  := '';
                If Assigned(FMontaGridDataSet) then begin
                      FdeletaLinha        := False;
                      FDadosGrid.Valor    := cells[i,Rowcount - 1];
                      FDadosGrid.Linha    := RowCount;
                      FDadosGrid.Coluna   := I;
                      FDadosGrid.Field    := VarCampos[I];
                      FMontaGridDataSet(FDadosGrid,FDeletaLinha);
                      If FdeletaLinha then begin
                         deletalinha(RowCount - 1);
                         Break;
                      end;
                      Cells[i,rowcount - 1] := FDadosGrid.Valor;
                end;
                If VarCampos[i] <> '' then
                  if ((Fieldbyname(VarCampos[i]).datatype = ftdate) or (fieldbyname(VarCampos[i]).datatype = ftdatetime)) and Not FieldByName(VarCampos[i]).IsNull then
                      cells[i,Rowcount - 1] := FormatDateTime(IIfs(FDadosGrid.Mascara = '','dd/mm/yy',FDadosGrid.Mascara),StrtoDateN(FieldValue[VarCampos[i],RowCount - 1]))
                  else if ((fieldbyname(VarCampos[i]).datatype = ftcurrency) or (fieldbyname(VarCampos[i]).datatype = ftfloat)) and not FDadosGrid.SemMascara then
                     cells[i,Rowcount - 1] := FormatFloat(IIfs((FDadosGrid.Mascara = '') and Not FDadosGrid.SemMascara,'#,##0.00',FDadosGrid.Mascara),StrtoFloatN(FieldValue[VarCampos[i],RowCount - 1]));
           end;

           Next;


           If FDistinct then
             for i:=RowCount - 2 downto fixedrows do
               If Rows[RowCount - 1].Text = Rows[I].Text then begin
                   deletaLinha(RowCount - 1);
                   Break;
               end;


            If Length(AgrupaLocal) <> 0 then begin
               For I:=RowCount - 2 downto  FixedRows  do begin
                  For I2:=0 to Length(AgrupaLocal) - 1 do
                    If FieldValue[AgrupaLocal[i2],RowCount - 1] <> FieldValue[AgrupaLocal[i2],I] then
                      break;

                  If I2 > Length(AgrupaLocal) - 1 then begin
                     deletaLinha(RowCount - 1);
                     Break;
                  end;
               end;
               If I >= FixedRows then
                 Break;
           end;



           If Not Eof and (Not FDeletaLinha or (RowCount > FixedRows + 1)) then
             RowCount := RowCount + 1;
       end;




   end;
end;

function TGridSql.GetFieldValue(Campo: String; Linha: Word): String;
var i:SmallInt;
begin
            Result := '';
{            If VarCampos.Count > 0 then
              for i:=0 to VarCampos.Count - 1 do begin
                  If Pos(' AS ',UpperCase(VarCampos[i])) > 0 then
                    FCampo := StrTiraEspacos(Copy(VarCampos[i],Pos(' AS ',VarCampos[i]) + Length(' AS '),Length(VarCampos[i]) - Pos(' AS ',VarCampos[I]) - Length(' AS ') + 1));

                  If (Uppercase(Campo) = UpperCase(VarCampos[i]))  or  (Uppercase(Campo) = FCampo)   then begin
                    Result := Cells[I,Linha];
                    Exit;
                  end;
              end;}
            If (VarCampos.Count > 0) then begin
              I := ColunaCampo(Campo);

              If I > -1 then
               Result := Cells[I,Linha];
            end;

end;

procedure TGridSql.SetFieldValue(Campo: String; Linha: Word;
  const Value: String);
var i:SmallInt;
begin
{          If VarCampos.Count > 0 then
            for i:=0 to VarCampos.Count - 1 do begin
                 If Pos(' AS ',UpperCase(VarCampos[i])) > 0 then
                   FCampo := StrTiraEspacos(Copy(VarCampos[i],Pos(' AS ',VarCampos[i]) + Length(' AS '),Length(VarCampos[i]) - Pos(' AS ',VarCampos[I]) - Length(' AS ') + 1));

                  If (Uppercase(Campo) = UpperCase(VarCampos[i]))  or  (Uppercase(Campo) = FCampo)   then begin
                    Cells[I,Linha] := Value;
                    Exit;
                  end;
            end;}
            If (VarCampos.Count > 0) then begin
              I := ColunaCampo(Campo);

              If I > -1 then
                Cells[I,Linha] := Value;
            end;
end;

procedure TGridSql.ExcluiOption(FOption: TGridOption);
var
OldOptions : Set of TgridOption;
begin
  PulaSelectCell := True;
  OldOptions := Options;
  if FOption in OldOptions then
     Exclude(OldOptions,FOption);
  Options := OldOptions;
  PulaSelectCell := False;
end;

procedure TGridSql.IncluiOption(FOption: TGridOption);
var
OldOptions : Set of TgridOption;
begin
  PulaSelectCell := True;
  OldOptions := Options;
  if Not(FOption in OldOptions) Then
     Include(OldOptions,FOption);
  Options := OldOptions;
  PulaSelectCell := False;
end;

function TGridSql.GetGetCombo(FColuna,FLinha:SmallInt): TComboSql;
var i:word;
begin
   Result := Nil;
   If Length(Combos) > 0 then
     For i:=0 to Length(Combos) - 1 do
       If ((FColuna = Combos[I].Col) or (Combos[I].Col = -1)) and
          ((FLinha = Combos[I].Lin) or (Combos[I].Lin = -1)) then
            Result := Combos[I].Objeto;
end;


function TGridSql.SetCombo(Col,Lin,ColRet: SmallInt):TComboSql;
var i:word;
begin
       Result := Nil;
       If (Length(Combos) > 0) then
         for i:=0 to  Length(Combos) - 1 do
           If (Combos[I].Col = Col) and (Combos[I].Lin = Lin) then
               break;

        If (Length(Combos) <> 0) and (I <= Length(Combos) - 1) then begin
           Result := Combos[I].Objeto;
           exit;
        end;


        SetLength(Combos,Length(Combos) + 1);

        Combos[Length(Combos) - 1].Col := Col;
        Combos[Length(Combos) - 1].Lin := Lin;
        Combos[Length(Combos) - 1].ColunaRetorno := ColRet;

        TComboSql.Create(Owner).Name := 'Cb'+Name+IntTostr(Length(Combos));
        Combos[Length(Combos) - 1].Objeto := TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos))));
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).Visible     := False;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).Style       := csDropDownList;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).Retorno     := RcValorRetorno;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).Parent      := Self.Parent;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).Visible     := False;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).OnExit      := ExitCombo;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).OnChange    := ChangeCombo;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).TabOrder    := Self.TabOrder + Length(Combos);
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).TipoCampo   := VarString;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).OnKeyDown   := KeyDownCombo;
        TComboSql(Owner.FindComponent('Cb'+Name+IntTostr(Length(Combos)))).DesativaTecl:= True;

        Result := Combos[Length(Combos) - 1].Objeto;
end;

procedure TGridSql.ExitCombo(Sender: TObject);
var OldCol,OldRow,i:Integer;
begin
     FMovCombo   := True;
     FExitCombo  := True;
     Try
          If (Tform(Owner).ActiveControl <> Self) and
             Not((Tform(Owner).ActiveControl is TComboSql)
             and (ComboGrid(TcomboSql(Tform(Owner).ActiveControl))))  then begin
               If Not(Inherited SelectCell(Col,Row)) then
                  TComboSql(Sender).SetFocus
               else Begin
                  TComboSql(Sender).Visible := False;
                  If Assigned(OnExit) then
                   OnExit(Self);
               end;
          end else begin
               FSaidoEnter := True;
               TComboSql(Sender).Visible := False;
          end;
     finally
           FMovCombo  := False;
     end;
end;


procedure TGridSql.DeletaCombos;
var i:word;
begin
    If Length(Combos) = 0 then
      exit;

    For i:=0 to Length(Combos) - 1 do begin
        If Tform(Owner).ActiveControl = TComboSql(Owner.Components[Combos[I].Objeto.ComponentIndex]) then begin
            FSaidoEnter := True;
            Self.SetFocus;
        end;
        TComboSql(Owner.Components[Combos[I].Objeto.ComponentIndex]).Parent := Nil;
        Owner.Components[Combos[I].Objeto.ComponentIndex].Destroy;
        Combos[I].Objeto := Nil;
    end;

    SetLength(Combos,0); 
end;


procedure TGridSql.KeyDownCombo(Sender: TObject; var Key: Word;
  Shift: TShiftSTate);
var I,FCol,FRow:Word;
    FChar:Char;
    VIncluiLinha:boolean;
begin
       FCol := Col;
       FRow := Row;


       If ((Key = Vk_Delete) and (Shift = [ssCtrl])) or (Key in [Vk_Insert,vk_left,vk_right]) or
          ((Shift = [ssShift]) and (key in [vk_up,vk_down]))   then begin
           self.keydown(Key,Shift);
           If key in [vk_up,vk_down,vk_left,vk_right] Then
            key := 0;             
           If ((Col <> FCol) or (Row <> Frow)) and
              (TForm(Owner).ActiveControl = TComboSql(Sender)) then begin
                      If (GetCombo[Col,Row] = Nil) or (GetCombo[col,row] <> GetCombo[fcol,frow]) then begin
                          FSaidoEnter := True;
                          SetFocus;
                       end;
                       SelectCell(Col,Row);
            end;
       end;

       If Not Movimentacelula then
         exit;

       If (Key = Vk_return) and Not TComboSql(Sender).DroppedDown then begin
           FChar := #13;
           VIncluiLinha := IncluiLinha and Not((Col <> ColCount -1) And ((Col <> Limite) Or (Limite = -1)));
           FMovCombo  := True;
           Try
              KeyPress(FChar);
           finally
              FMovCombo  := False;
           end;
           If ((Col <> FCol) or (Row <> Frow)) and
              (TForm(Owner).ActiveControl = TComboSql(Sender)) then begin
                      If (GetCombo[Col,Row] = Nil) or (GetCombo[col,row] <> GetCombo[fcol,frow]) then begin
                          FSaidoEnter := True;
                          SetFocus;
                       end;

                       If (VIncluiLinha) then
                          SelectCell(Col,Row);
            end;
       end;
end;


procedure TGridSql.TopLeftChanged;
var i,i2:word;
OldPula:Boolean;
begin
       If FDupl and (Row = RowCount) Then
        Try
          FDupl := False;
          OldPula := PulaSelectCell;
          PulaSelectCell := True;
          Row := RowCount - 1;
        finally
          PulaSelectCell := OldPula;
        end;

       Inherited TopLeftChanged;

       If Length(Combos) = 0 then
        exit;

       for i:=0 to Length(Combos) - 1 do begin
             If (Combos[I].Objeto <> Nil) and Combos[I].Objeto.Visible then begin
                     Combos[I].Objeto.Left :=  Self.Left;
                     If Combos[I].ColAtua > 0 then
                       for i2:=0 to Combos[I].ColAtua - 1 do
                         Combos[I].Objeto.Left := Combos[I].Objeto.Left + ColWidths[I2];

                      Combos[I].Objeto.Top   := Self.Top + (Combos[I].LinAtua - TopRow) + 1;
                      If Combos[I].LinAtua > 0 then
                       for i2:=TopRow to Combos[I].LinAtua - 1 do
                         Combos[I].Objeto.Top := Combos[I].Objeto.Top + RowHeights[I2];
             end;
       end;
end;

procedure TGridSql.DeletaCamposAlt;
begin
   SetLength(CamposAlt,0);
end;

procedure TGridSql.ChangeCombo(Sender: TObject);
var i:word;
begin
     If Length(Combos) > 0  then begin
           For i:=0 to Length(Combos) - 1 do
             If TComboSql(Sender) = Combos[I].Objeto then
               Break;

           If (I <= Length(Combos) - 1) then begin
               cells[Combos[I].ColAtua,Combos[I].LinAtua] := TComboSql(Sender).Text;
               If (Combos[I].ColunaRetorno > -1)   then
                 cells[Combos[I].ColunaRetorno,Combos[I].LinAtua] := VarToStr(TComboSql(Sender).ValorRetorno);
           end;
    end;
end;

function TGridSql.retornasoma(Coluna,linha:Word;Const CamposAgrupa:Array of String
;Marcador:Boolean):Double;
var i,i2:word;
begin

   result := 0;
   for i:=fixedrows to rowcount - 1 do
     if not marcador or linhamarcada(I) then begin
        if (length(CamposAgrupa) > 0) and (Linha >= fixedrows) then begin
          for i2:=0 to length(CamposAgrupa) - 1 do
           if fieldvalue[camposagrupa[i2],I] <> cells[colunacampo(camposagrupa[i2]),Linha] then
             break;

           If i2 <= length(CamposAgrupa) - 1 then
             continue;
        end;


       result := result + strtofloatN(cells[coluna,I]);
     end;







end;


function TGridSql.ComboGrid(Combo: Tcombosql): Boolean;
var i:word;
begin
       Result := False;
       If Length(Combos) > 0 then
        For i:=0 to Length(Combos) - 1 do
          If Combos[I].Objeto = combo then begin
              Result := True;
              Exit;
          end;

end;


procedure TGridSql.ColWidthsChanged;
Var
FP:TRect;
i:iNTEGER;
begin
   inherited ColWidthsChanged;

   For i:=Col to ColCount - 1 do begin
       If GetCombo[I,Row] = Nil then
        continue; 

       FP := CellRect(I,Row);
       With GetCombo[I,Row] do begin
        Top     := Self.Top + FP.Top + 1;
        Left    := Self.Left + FP.Left + 1;
        Width   := FP.Right + Self.Left + 1 - Self.Left - FP.Left;
        Height  := FP.Bottom + Self.Top + 1 - Self.Top - FP.Top;
       end;       
   end;


end;

procedure TGridSql.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var OldCol,OldRow:Integer;
begin
  inherited MouseUp(Button,Shift,X,Y);
  MousetoCell(X,Y,OldCol,OldRow);
  If (TForm(Owner).ActiveControl = Self) and ((OldCol <= FixedCols - 1) or (OldRow <= FixedRows - 1)) and (GetCombo[Col,Row] <> Nil) then begin
     GetCombo[Col,Row].Visible := True;
     GetCombo[Col,Row].SetFocus;
  end;    
  FMouseDown := False;
end;

procedure TGridSql.RowHeightsChanged;
Var
FP:TRect;
i:iNTEGER;
begin
   inherited RowHeightsChanged;

   For i:=Row to RowCount - 1 do begin
       If GetCombo[Col,I] = Nil then
        continue; 

       FP := CellRect(Col,I);
       With GetCombo[Col,I] do begin
        Top     := Self.Top + FP.Top + 1;
        Left    := Self.Left + FP.Left + 1;
        Width   := FP.Right + Self.Left + 1 - Self.Left - FP.Left;
        Height  := FP.Bottom + Self.Top + 1 - Self.Top - FP.Top;
       end;       
   end;
end;

procedure TGridSql.editortexto(ACol,Arow:LongInt);
begin
      With TFrmDigTexto.Create(Application) do
       Try
         Position := poScreenCenter;

         If Fixedrows > 0 Then
           Caption  := Self.Cells[Acol,0]
         else if fixedcols > 0 then
           Caption  := Self.Cells[0,aROW];

         Texto.Lines.Clear;
         Texto.Lines.Text := Self.Cells[ACol,ARow];
         ShowModal;
         Self.Cells[ACol,ARow] := DigTexto.VarRetorno;
       finally
         Destroy;
       end;

end;

function TGridSql.Somacoluna(Coluna: Integer): Double;
begin
  Result := RetornaSoma(Coluna,Fixedrows,[],VarMarcador);
end;

{ TTituloGrid }

procedure TTituloGrid.Add(Value:String);
begin


end;



procedure TTituloGrid.Assign(Source: TPersistent);
var i : integer;
begin
  inherited Assign(Source);

  If Not(Source is TTituloGrid) then
   exit;

  For i:=0 to FGrid.Colcount - 1 do
    FGrid.Cells[I,0] := TTituloGrid(Source)[I];

end;

constructor TTituloGrid.Create(Grid: TStringGrid);
begin
   inherited Create;
   FGrid := Grid;
end;

function TTituloGrid.GetStrings(Index: Integer): string;
begin
   Result := TstringList(self)[Index];
end;

procedure TTituloGrid.refresh(Inicio:Word);
var vwIDTH,Tamanho,Qtde,I,uLTcOL:integer;
begin

   If (FGrid.Align = AlClient) and (FGrid.Parent <> Nil) then
    VWidth:= FGrid.Parent.Width
   else
    VWidth := FGrid.Width;
    
   Qtde    := 0;
   Tamanho := 0;
   If Not FVertical then begin
      For i:=0 to FGrid.ColCount - 1 do
        if (FGrid.ColWidths[I] > 0) and ((I > Inicio) OR ((I = 0) AND (inicio = 0)))  then begin
           Qtde := Qtde + 1;
           UltCol := I;
        end else if (FGrid.ColWidths[I] > 0) then
            Tamanho := tamanho  + FGrid.ColWidths[I];



       For i:=0 to FGrid.ColCount - 1 do begin
          If count <= I then
           Break;

          Fgrid.Cells[I,0] := Strings[I];
          if (FGrid.ColWidths[I] > 0)  and ((I > Inicio) OR ((I = 0) AND (inicio = 0))) then
            If FAutomatico then
              Fgrid.ColWidths[I]  := Floor((VWidth - Tamanho)/Qtde  - 3)
            else If AtuaCanvas  then
              Fgrid.ColWidths[I]  := FGrid.Canvas.TextWidth(Strings[I]) + 3;
       end;
{       If ((FGrid.Width - Tamanho) div Qtde - 1) * Qtde > (FGrid.Width - Tamanho) then
         Fgrid.ColWidths[UltCol] := Fgrid.ColWidths[UltCol]
                                    - (((FGrid.Width - Tamanho) div Qtde - 1) * Qtde);}
   end else begin
      For i:=Fgrid.FixedRows to FGrid.RowCount - 1 do
        if (FGrid.RowHeights[I] > 0) and (I > Inicio) then
           Qtde := Qtde + 1
        else if (FGrid.RowHeights[I] > 0) then
           Tamanho := Tamanho + FGrid.RowHeights[I];

       For i:=0 to FGrid.RowCount - 1 do begin
          If count <= I then
           Break;
          Fgrid.Cells[0,I] := Strings[I];
          if (FGrid.RowHeights[I] > 0) and (I > Inicio) then
            If FAutomatico  then
               Fgrid.RowHeights[I]  := Floor((FGrid.Height - Tamanho)/Qtde)
            else If AtuaCanvas  then
              Fgrid.RowHeights[I]  := FGrid.Canvas.TextHeight(Strings[I]) + 3;
       end;
   end;


end;

procedure TTituloGrid.SetStrings(Index: Integer; const Value: string);
begin
   TstringList(self)[Index] := Value;

   If Index <= FGrid.ColCount - 1 then
    FGrid.Cells[Index,0] := Value;
end;


end.
