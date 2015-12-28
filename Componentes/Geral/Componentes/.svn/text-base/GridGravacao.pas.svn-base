unit GridGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, GridControl, GridSql,Gravacao,FuncoesGlobais,TipoDef;

type

  TColunaGravacao = Record
     Coluna:Integer;
     Chave : Boolean;
     Mascara : String;
     Obrigatorio : Boolean;
     ObrigatorioTabela:Boolean;
     Negativa : Boolean;
     Tipo : TTipoCampo;
     TipoVariant : Integer;
  end;

  TParametrosGridGravacao = Record
    Parametro     : String;
    Operacao      : String;
    CampoGravacao : String;
    Gravacao      : TGravacao;
    Tipo          : TTipoCampo;
    Unico         : Boolean;
  end;

  TGridGravacao = class;

  TCamposGridGravacao = Class(TStringList)
    Private
    FGrid : TGridGravacao;
    function GetStrings(Index: Integer): string;
    procedure SetStrings(Index: Integer; const Value: string);
    Public
      Constructor Create(Grid: TGridGravacao);
      property Strings[Index: Integer]: string read GetStrings write SetStrings; default;
    { Public declarations }
  end;


  TVetorColunaGRavacao = Array of TcolunaGravacao;

  TGridGravacao = class(TGridSql)
  private
    IndicesRegistro : Array of Word;
    OldPosRetorno   :  TEventGrav;
    OldBeforeRetorno  :  TEventGrav;
    FCamposGravacao:  TCamposGridGravacao;
    CampoLocal     :  TCampoGravacao;
    FGravacao      :  TGravacao;
    FMontaGridGrava: Boolean;
    procedure SeTCamposGridGravacao(const Value: TCamposGridGravacao);
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    procedure SetGravacao(const Value: TGravacao);
    procedure SetCells(ACol, ARow: Integer; const Value: String);
    Function GetCells(ACol, ARow: Integer):String;
    procedure SetColCount(const Value: Integer);
    Function  GetParam(Parametro,Operacao:String):Integer;
    Procedure AlimentaRegistro(Linha:Word);
    Procedure CreateWnd;Override;
    Function  GetColCount : Integer;
    { Private declarations }
  protected
    Procedure SizeChanged(OldColCount,OldRowCount:LongInt);Override;
    function   SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure KeyPress(var Key: Char);override;
    Procedure PosRetornoGridGravacao(Sender : TObject);
    Procedure BeforeRetornoGridGravacao(Sender : TObject);
    { Protected declarations }
  public
    Parametros : Array of TParametrosGridGravacao;
    ColunasGravacao : TVetorColunaGRavacao;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    Procedure DeletaLinha(Linha:Integer);Override;
    Procedure AddParametros(Parametro,Operacao:String);
    property  Cells[ACol, ARow: Integer]: string  Read GetCells write SetCells;
    Property  IndiceParametro[Parametro,Operacao:String]: Integer Read GetParam;
    { Public declarations }
  published
   Procedure Click;Override;
   Procedure DoExit;Override;
   Property CamposGravacao :TCamposGridGravacao  Read FCamposGravacao Write SeTCamposGridGravacao;
   Property Gravacao      :TGravacao Read FGravacao Write SeTGravacao;
   Property ColCount    : Integer Read GetColCount Write SetColCount;
   Property MontaGridGravacao : Boolean Read FMontaGridGrava Write FMontaGridGrava Default False;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TGridGravacao]);
end;

{ TGridGravacao }

procedure TGridGravacao.AddParametros(Parametro, Operacao: String);
begin
 If GetParam(Parametro,Operacao) <> -1 then
  exit;

 SetLength(Parametros,Length(Parametros) + 1);
 Parametros[Length(Parametros) - 1].Operacao  := Operacao;
 Parametros[Length(Parametros) - 1].Parametro := Parametro;
end;

procedure TGridGravacao.AlimentaRegistro(Linha: Word);
var i:integer;
    campos : TCamposGRavacao;
begin
   for i:=fixedcols to colcount - 1 do

      If ColunasGravacao[i].ObrigatorioTabela and (Cells[i,linha] = '') then begin
         If Indicesregistro[linha] > 0 then
           FGravacao.deletaregistro(Indicesregistro[linha] - 1);
        exit;
      end;


   for i:=fixedcols to FCamposGravacao.count - 1 do begin
      If (FCamposGravacao[i] = '')  then
        Continue;


      SetLength(campos,Length(Campos) + 1);
      Campos[Length(Campos) - 1].Campo := FCamposGravacao[i];
      if IndicesRegistro[i] = 0 then
          IndicesRegistro[i]  := Length(FGravacao.Registros) + 1;

      Campos[Length(Campos) - 1].Registro        := IndicesRegistro[i] - 1;
      Campos[Length(Campos) - 1].Campo           := FCamposGravacao[I];
      Campos[Length(Campos) - 1].Tipo            := ColunasGravacao[i].Tipo;
      Campos[Length(Campos) - 1].Chave           := ColunasGravacao[i].Chave;

      if (Cells[i,Linha] = '')  then
        Campos[Length(Campos) - 1].Valor := Unassigned
      else if Campos[Length(Campos) - 1].Tipo = VarDate then
        Campos[Length(Campos) - 1].Valor := StrtoDAteTime(Cells[i,Linha])
      else if Campos[Length(Campos) - 1].Tipo = VarString then
         Campos[Length(Campos) - 1].Valor := Cells[i,Linha]
      else if Campos[Length(Campos) - 1].Tipo = VarInteger then
         Campos[Length(Campos) - 1].Valor := StrtoInt(Cells[i,Linha])
      else  if (Campos[Length(Campos) - 1].Tipo = VarCurrency) and Not(ColunasGravacao[I].Negativa) then
         Campos[Length(Campos) - 1].Valor := StrtoFloatN(Cells[i,Linha])
      else  if (Campos[Length(Campos) - 1].Tipo = VarCurrency) and (ColunasGravacao[I].Negativa) then
        Campos[Length(Campos) - 1].Valor := -(StrtoFloatN(Cells[i,Linha]));

       if VariantVazia(Campos[Length(Campos) - 1].Valor) then
           Campos[Length(Campos) - 1].Valor := Unassigned;


   end;

  FGravacao.AlimentaRegistros(Campos);


end;

procedure TGridGravacao.BeforeRetornoGridGravacao(Sender: TObject);
begin
   if Assigned(OldBeforeRetorno) then
    OldBeforeRetorno(Self);

  If FGravacao = nil then exit;

  FGravacao.NaoZeraRegistros := FMontaGridGRava;

end;

procedure TGridGravacao.Click;
begin
 inherited Click;
end;

constructor TGridGravacao.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  LimpaGridMontaGrid := False;
  CampoLocal.Objeto       := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  FCamposGravacao := TCamposGridGravacao.Create(TGridGravacao(Self));
end;

procedure TGridGravacao.CreateWnd;
var i,i2 : integer;
    CampoLocal : TcampoGravacao;
begin
    inherited CreateWnd;

    If (FGravacao = nil) then
      exit;

     if Assigned(FGravacao.PosRetorno) then
       OldPosRetorno := FGravacao.PosRetorno;

     if Assigned(FGravacao.BeforeRetorno) then
       OldBeforeRetorno := FGravacao.BeforeRetorno;

      FGravacao.Posretorno := PosRetornoGridGravacao;
      FGravacao.Beforeretorno := BeforeRetornoGridGravacao;

    if (FGravacao.Tabela <> '') and (FGravacao.BancodeDados <> '') then begin
      For i:=0 to Length(FGravacao.Campos) - 1 do begin
         For i2:=0 to colcount - 1 do begin
           if Uppercase(FGravacao.Campos[i].Campo) = Uppercase(FCamposGravacao[i2]) then begin
              ColunasGRavacao[i2].tipo := GetTipoCampoTabela(FGravacao.Tabela,FGravacao.BancodeDados,FCamposGravacao[i2]);
              FGravacao.Campos[i].Tipo := ColunasGRavacao[i2].tipo;
           end;
         end;
       end;
   end;

end;

procedure TGridGravacao.DeletaLinha(Linha: Integer);
var
i : integer;
begin
  For i:=Linha downto fixedrows do
   If IndicesRegistro[I] <> 0 then begin
    IndicesRegistro[I] := IndicesRegistro[I] - 1;
  end;

  If (FGravacao <> Nil) and (IndicesRegistro[Linha] <> 0) then FGravacao.DeletaRegistro(IndicesRegistro[Linha] - 1);
  inherited DeletaLinha(Linha);
end;

destructor TGridGravacao.Destroy;
begin
  If FCamposGravacao <> Nil then  FCamposGravacao.Destroy;
  inherited Destroy;
end;

procedure TGridGravacao.DoExit;
var i,i2,i3:integer;
begin
  inherited DoExit;



   For i:=FixedRows to RowCount - 1 do begin

      For i2:=0 to ColCount - 1 do begin
          If (I = RowCount - 1) and (SaiEmBranco) and (Cells[i2,i] = '') and (Not CellSkip[i2]) then
            break;

          If (ColunasGravacao[i2].Obrigatorio) and (Cells[I2,I] = '') then begin
              ShowMessage('Dado Obrigatório');
              Col := I2;
              Row := I;
              SetFocus;
              Exit;
          end;

      end;
      AlimentaRegistro(I);
  end;
end;

function TGridGravacao.GetCells(ACol, ARow: Integer): String;
begin
    Result := TstringGrid(Self).Cells[Acol,Arow];
end;

function TGridGravacao.GetColCount: Integer;
begin
    Result := TstringGrid(Self).ColCount;
end;



function TGridGravacao.GetParam(Parametro, Operacao: String): Integer;
var i : Integer;
begin
  Result := -1;
  For i:=0 to Length(Parametros) - 1 do
   If (Uppercase(Parametros[i].Parametro) = Uppercase(Parametro)) and
      (Uppercase(Parametros[i].Operacao) = Uppercase(Operacao)) then
         Result := I;
end;




procedure TGridGravacao.KeyPress(var Key: Char);
var varkey : Char;
    I : Integer;
begin
{  If (Key = #13) and (IncluiLinha) and ((Col = Limite) Or ((Col = ColCount - 1) and (Limite = -1))) and
     (Row = RowCount - 1)    Then begin
         For i:=0 to ColCount - 1 do begin
             if (ColunasGravacao[I].Obrigatorio) and (Cells[I,Row] = '') then begin
               ShowMessage('Dado Obrigatório');
               Col := I;
               Exit;
            end;
         end;
     end;}

  inherited KeyPress(Key);
end;

procedure TGridGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
var
i,i2,i3,colunamarcada : integer;
begin
    If (FGravacao.QtdeRegistros = 0) or (FGravacao.EstadoGravacao in [GRInsert,GRDelete])  then begin
       Limpa;
       Exit;
    end;

     If (FGravacao.QtdeRegistros) <> (RowCount - Fixedrows) then begin
        limpa;
        RowCount := FGravacao.QtdeRegistros + FixedRows;
     end;

    for i:=0 to FCamposGravacao.Count - 1 do begin
      If Uppercase(FCamposGravacao[i])  = Uppercase(FGravacao.CampoMarcado) then begin
         ColunaMarcada := i;
         break;
      end;
    end;

    if Not((VarType(Valor) = $0005) or (VarType(Valor) = $0006)) then
        Cells[ColunaMarcada + FixedCols,Fgravacao.RegistroMarcado + FixedRows] := VarToStr(Valor)
    else If Not ColunasGravacao[ColunaMarcada].Negativa then
       Cells[ColunaMarcada + FixedCols,Fgravacao.RegistroMarcado + FixedRows] := FormatFloat(ColunasGravacao[ColunaMarcada].Mascara,Valor)
    else
       Cells[ColunaMarcada + FixedCols,Fgravacao.RegistroMarcado + FixedRows] := FormatFloat(ColunasGravacao[ColunaMarcada].Mascara,-(Valor));

    

end;


procedure TGridGravacao.PosRetornoGridGravacao(Sender: TObject);
var i,i2,i3:integer;
begin
    LimpaGridMontaGrid := (FGravacao.QtdeRegistros = 0);

    If  FMontaGridGrava then begin
       For i:=0 to Length(Parametros) - 1 do begin
           if Parametros[i].Gravacao = Nil then
            continue;

           For i2:=0 to Length(Parametros[i].Gravacao.Registros) do
             If Parametros[i].Gravacao.Registros[i2].Linha = Parametros[i].Gravacao.RegistroMarcado then
              break;

           For i3:=0 to Length(Parametros[i].Gravacao.Registros[i2].Campos) - 1 do
             If Uppercase(Parametros[i].Gravacao.Registros[i2].Campos[i3].Campo) = Uppercase(Parametros[i].CampoGravacao) then
              Break;

           adicionaparametros(Parametros[i].Parametro,Parametros[i].Operacao,Parametros[i].Gravacao.Registros[i2].Campos[i3].Valor,Parametros[i].Tipo,Parametros[i].Unico);
       end;

       MontaGrid;
    end;






    If Assigned(OldPosRetorno) then begin
        OldPosRetorno(Self);
    end;



end;

function TGridGravacao.SelectCell(ACol, ARow: Integer): Boolean;
var i,i2 :integer;
begin
    Result :=  inherited SelectCell(Acol,Arow);
end;



procedure TGridGravacao.SeTCamposGridGravacao(const Value: TCamposGridGravacao);
var
i : integer;
OldCampos : TstringList;
begin
     OldCAmpos := FCamposGravacao;
    FCamposGravacao.Assign(Value);

    If FGravacao = nil then
     exit;

    For i:=0 to OldCampos.Count - 1 do begin
     If OldCAmpos[i] = '' then
       continue;

     FGravacao.DeletaCampo(OldCampos[i]);
   end;


    If Value.Count > ColCount then
      Colcount := Value.Count;

    For i:=0 to Value.Count - 1 do begin
       If Value[i] = '' then
        continue;

       CampoLocal.Campo          := Value[i];
       CampoLocal.Coluna         := I;
       CampoLocal.Tipo           := GetTipoCampoTabela(FGravacao.Tabela,FGravacao.BancodeDados,Value[i]);
       ColunasGravacao[i].Tipo := CampoLocal.Tipo;
       FGravacao.CamposGravacao(CampoLocal);
    end;
end;

procedure TGridGravacao.SetCells(ACol, ARow: Integer; const Value: String);
var i : integer;
begin

   TStringGrid(Self).Cells[Acol,Arow] := Value;


   If (Acol < FixedCols) or  (ARow < FixedRows) or  (FCamposGravacao[ACol] = '') or (FGravacao = Nil) then
     Exit;

  AlimentaRegistro(Arow);

{   For i:=0 to colcount - 1 do
    If (ColunasGravacao[I].ObrigatorioTabela) and (Cells[i,arow] = '') then begin
      FGravacao.DeletaRegistro(Indicesregistro[ARow] - 1);
      exit;
    end;

        FGRavacao.RegistroMarcado  := ARow - FixedRows;

        If IndicesRegistro[ARow] = 0 then
         IndicesRegistro[ARow] := Length(FGravacao.Registros) + 1;

        CampoLocal.Registro       := IndicesRegistro[ARow] - 1;
        CampoLocal.Campo          := FCamposGravacao[Acol];
        CampoLocal.Tipo           := ColunasGravacao[Acol].tipo;
        CampoLocal.Chave          := ColunasGravacao[Acol].Chave;
        CampoLocal.Negativa       := ColunasGravacao[Acol].Negativa;

        if (Cells[Acol,Arow] = '')  then
           CampoLocal.Valor := Unassigned
        else if CampoLocal.Tipo = VarDate then
           CampoLocal.Valor := StrtoDAteTime(Cells[Acol,Arow])
        else if CampoLocal.Tipo = VarString then
           CampoLocal.Valor := Cells[Acol,Arow]
        else if CampoLocal.Tipo = VarInteger then
           CampoLocal.Valor := StrtoInt(Cells[Acol,Arow])
        else if (CampoLocal.Tipo = VarCurrency) and Not(ColunasGravacao[Acol].Negativa) then
          CampoLocal.Valor := StrtoFloatN(Cells[Acol,Arow])
        else if (CampoLocal.Tipo = VarCurrency) and (ColunasGravacao[Acol].Negativa) then
          CampoLocal.Valor := -(StrtoFloatN(Cells[Acol,Arow]));

        If VariantVazia(CampoLocal.Valor) then
           CampoLocal.Valor := Unassigned;

        FGRavacao.CamposGravacao(CampoLocal);}
end;

procedure TGridGravacao.SetColCount(const Value: Integer);
var i: integer;
begin
   SetLEngth(ColunasGravacao,Value);
   TStringGrid(Self).ColCount := Value;
end;


procedure TGridGravacao.SeTGravacao(const Value: TGravacao);
var i : integer;
begin

    If FGravacao <> Nil then begin
      For i:=0 to FCamposGravacao.Count - 1 do begin
        If FCamposGravacao[i] = '' then
         continue;

        Fgravacao.DeletaCampo(FCamposGravacao[i]);
      end;
    end;

    FGravacao := Value;

    If (Value  = Nil) or (Value.Tabela = '') then
     exit;

     For i:=0 to FCamposGravacao.Count - 1 do begin
       If FCamposGravacao[i] = '' then
        continue;

       CampoLocal.Campo          := FCamposGravacao[i];
       CampoLocal.Tipo           := ColunasGravacao[i].Tipo;
       CampoLocal.Coluna         := I;
       FGravacao.CamposGravacao(CampoLocal);
    end;
end;



{ TCamposGridGravacao }

constructor TCamposGridGravacao.Create(Grid: TGridGravacao);
begin
  Fgrid := Grid;
  inherited Create;
end;

function TCamposGridGravacao.GetStrings(Index: Integer): string;
begin
   Result := TstringList(self)[Index];
end;

procedure TCamposGridGravacao.SetStrings(Index: Integer; const Value: string);
begin
   TstringList(self)[Index] := Value;

   If Value = '' then
    exit;

  with fgrid do begin
   If Index <= ColCount - 1 then
     if (Gravacao.Tabela <> '') and (Gravacao.BancodeDados <> '') then
       ColunasGravacao[index].Tipo := GetTipoCampoTabela(Gravacao.Tabela,Gravacao.BancodeDados,Value)
     else
       ColunasGravacao[index].Tipo := VarNull
   else
      Colcount := Index + 1;
 end;
end;

procedure TGridGravacao.SizeChanged(OldColCount, OldRowCount: Longint);
Begin
    If OldRowCount <> RowCount Then
          SetLength(IndicesRegistro,RowCount);
end;

end.
