unit Pesquisa;

interface

uses
  extctrls,Classes,stdctrls,
  dbtables;

Type

  TParametroPesquisa = Record
    Valor:String;
    Indice : Integer;
  end;

  TPesquisa = class(TComponent)
  private
    { Private declarations }
    FSql       : TStrings;
    FDescricao : TPanel;
    FCampo     : String;
    FDatabase  : TDataBase;
    FFiltro1   : TEdit;
    FFiltro2   : TEdit;
    FFiltro3   : TEdit;
    FFiltro4   : TEdit;
    FParametros:Array of Variant;
    FDataBaseName: String;
    Procedure SetParametro(Index:Word;Value:Variant);
    Function  GetParametro(Index:Word):Variant;
    Procedure SetFSql(Value : TStrings);
  protected
    { Protected declarations }
  public
//    Parametros: Array of TParametroPesquisa;
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy ; override;
    Property Parametro[ind:Word] : Variant Read GetParametro Write SetParametro;
    { Public declarations }
  published
    { Published declarations }
    property Sql : TStrings Read FSql Write SetFSql;
    property Descricao : TPanel Read FDescricao Write FDescricao;
    property Campo : String Read FCampo Write FCampo;
    property Database : TDatabase Read FDataBase Write FDataBase;
    property DataBaseName : String Read FDataBaseName Write FDataBaseName;
    property Filtro1 : Tedit read FFiltro1 write FFiltro1;
    property Filtro2 : Tedit read FFiltro2 write FFiltro2;
    property Filtro3 : Tedit read FFiltro3 write FFiltro3;
    property Filtro4 : Tedit read FFiltro4 write FFiltro4;
  end;

procedure Register;

Implementation

constructor TPesquisa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSql   := TStringList.Create;
  //FDataBase := TDataBase.Create(inherited Create(AOwner));
end;

destructor  TPesquisa.Destroy ;
Begin
   If FSql <> Nil Then
       FSql.Destroy;
   //FDataBase.Destroy;
  inherited Destroy;
End;

function TPesquisa.GetParametro(Index: Word): Variant;
begin
   Result := FParametros[index];
end;

Procedure TPesquisa.SetFSql(Value : TStrings);
Begin
          FSql.Assign(Value);
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TPesquisa]);
end;


procedure TPesquisa.SetParametro(Index: Word; Value: Variant);
begin
   If Index > Length(FParametros) - 1 then SetLength(FParametros,Index + 1);
   FParametros[Index] := Value;
end;

End.





