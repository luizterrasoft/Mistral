unit Ajuda;

interface

uses
  Forms,dbtables,extctrls,Classes,
  Consulta,TipoDef;
   
Type

  TAjuda = class(TComponent)
  private
    { Private declarations }
    FFCodigo    : String;
    FFCampo     : String;
    FFTamanho   : Integer;
    FFLargura   : Integer;
    FFCampoDeRetorno : String;
    FFFiltro    : String;
    FFTabelas   : String;
    FArray      : Array of String;
    FFValorDeRetorno : String;
    FFValorCampoDeRetorno : String;
    FDataBaseName: String;
    FFDatabase: TDataBase;
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy ; override;
  public
    { Public declarations }
    FFCampoConsulta: Array of String;
    OrderBy,groupBy:String;
    Distinct,Nupper:Boolean;
    Procedure Limpa;
    Procedure Execute;
    Procedure InLabel(cVar :String);
  published
    { Published declarations }
    property  Codigo    : String   read FFCodigo write FFCodigo;
    property  Campo     : String   read FFCampo write FFCampo;
    property  Filtro    : String   read FFFiltro Write FFFiltro;
    property  Tabelas   : String   read FFTabelas Write FFTabelas;
    property  Tamanho   : Integer  read FFTamanho write FFTamanho default 0;
    Property  DataBaseName :String read FDataBaseName Write FDataBaseName;
    Property  DataBase  : TDataBase read FFDatabase  write FFDatabase;
    property  Largura   : Integer  read FFLargura  write FFLargura default 0;
    property  CampoDeRetorno : String read FFCampoDeRetorno write FFCampoDeRetorno;
    property  ValorDeRetorno : String read FFValorDeRetorno write FFValorDeRetorno;
    property  ValorCampoDeRetorno : String read FFValorCampoDeRetorno write FFValorCampoDeRetorno;
  end;

procedure Register;

Implementation

constructor TAjuda.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor  TAjuda.Destroy ;
Begin
  inherited Destroy;
End;

Procedure TAjuda.Limpa;
Begin
   SetLength(FArray,0);
   Campo     := '';
   Filtro    := '';
   Tabelas   := '';
End;

Procedure TAjuda.InLabel(cVar :String);
Begin
   SetLength(FArray,Length(FArray)+1);
   FArray[Length(FArray)-1]   := cVar;
End;

Procedure TAjuda.Execute;
var i : Word;
Begin
    FrmConsulta := TFrmConsulta.Create(Application);

    If FFLargura > 0 Then
        FrmConsulta.Width := FFLargura;

    If FFTamanho > 0 Then
        FrmConsulta.Height := FFTamanho;

    FrmConsulta.FDataBaseName := Self.FDataBaseName;

    FrmConsulta.FColunas      := FFCampo;
    For i:=0 to Length(Self.FFCampoConsulta) - 1 do begin
        SetLength( FrmConsulta.FCampoConsulta,Length( FrmConsulta.FCampoConsulta) + 1);
        FrmConsulta.FCampoConsulta[i]  := Self.FFCampoConsulta[i];
    end;
    FrmConsulta.FNUpper := NUpper;
    FrmConsulta.FGroupBy := GroupBy;
    FrmConsulta.FOrderBy := OrderBy;
    FrmConsulta.FWhere  := FFFiltro;
    FrmConsulta.FTabela := FFTabelas;
    FrmConsulta.FCodigo := FFCodigo;
    FrmConsulta.FCampoDeRetorno := FFCampoDeRetorno;
    FrmConsulta.FValorCampoDeRetorno := FFValorCampoDeRetorno;
    FrmConsulta.F(FArray);
    FrmConsulta.ShowModal;
    FFValorDeRetorno := Consulta.FValorDeRetorno;
    Consulta.FValorDeRetorno := '';
    FrmConsulta.Destroy;
End;

procedure Register;
begin
  RegisterComponents('Sistema', [TAjuda]);
end;

End.
