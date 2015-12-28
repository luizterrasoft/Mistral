unit UVendaNfe_Registro12;

interface

uses SysUtils, StrUtils, UVendaNfe, funcoes2;

type
  TVendaNfe_Registro12 = class(TVendaNfe)
  protected
    _tipo: String;
    _codigoProduto: String;
    _ncm: String;
    _descricao: String;
    _descricaoMestre : String; {* descricao da tabela mestre sem o tamanho*}
    _unidade: String;
    _tipoProduto: Integer;
    _mva: Real;
    _precoCusto: Real;
    _margem: Real;
    _precoVenda: Real;
    _ipi: Real;
    _origem: Integer;
    _refInterna: String;
    _codBarras: String;
  private
    function getDescricao: String;
    function getDescricaoMestre: String;
    function getIpi: Real;
    function getMargem: Real;
    function getMva: Real;
    function getNcm: String;
    function getOrigem: Integer;
    function getPrecoCusto: Real;
    function getPrecoVenda: Real;
    function getTipo: String;
    function getTipoProduto: Integer;
    function getUnidade: String;
    function getCodigoProduto: String;
    function getRefInterna: String;
    function getCodBarras:String;
    procedure setCodigoProduto(const Value: String);
    procedure setDescricaoMestre(Const Value:String);
    procedure setDescricao(const Value: String);
    procedure setIpi(const Value: Real);
    procedure setMargem(const Value: Real);
    procedure setMva(const Value: Real);
    procedure setNcm(const Value: String);
    procedure setOrigem(const Value: Integer);
    procedure setPrecoCusto(const Value: Real);
    procedure setPrecoVenda(const Value: Real);
    procedure setTipo(const Value: String);
    procedure setTipoProduto(const Value: Integer);
    procedure setUnidade(const Value: String);
    procedure setRefInterna(const Value: String);
    procedure setCodBarras(const Value: String);
  public
    constructor Create;
    procedure EscreveRegistro(nomeArquivo: String); override;

    property Tipo: String           read getTipo          write setTipo;
    property CodigoProduto: String  read getCodigoProduto write setCodigoProduto;
    property Ncm: String            read getNcm           write setNcm;
    property Descricao: String      read getDescricao     write setDescricao;
    property DescricaoMestre:String read getDescricaoMestre write setDescricaoMestre;
    property Unidade: String        read getUnidade       write setUnidade;
    property TipoProduto: Integer   read getTipoProduto   write setTipoProduto;
    property Mva: Real              read getMva           write setMva;
    property PrecoCusto: Real       read getPrecoCusto    write setPrecoCusto;
    property Margem: Real           read getMargem        write setMargem;
    property PrecoVenda: Real       read getPrecoVenda    write setPrecoVenda;
    property Ipi: Real              read getIpi           write setIpi;
    property Origem: Integer        read getOrigem        write setOrigem;
    property RefInterna: String     read getRefInterna    write setRefInterna;
    property codBarras:String       read getCodBarras     write setCodBarras;
  end;

implementation

{ TVendaNfe_Registro12 }

constructor TVendaNfe_Registro12.Create;
begin
  inherited;
  _tipo := '12';
  _ipi  := 0.00;
end;

procedure TVendaNfe_Registro12.EscreveRegistro(nomeArquivo: String);
begin
  AssignFile(arq,Caminho+nomeArquivo);
  Append(arq);
  Writeln(arq,Tipo                                                +Separador+
              CodigoProduto                                       +Separador+
              Ncm                                                 +Separador+
              Descricao                                           +Separador+
              Unidade                                             +Separador+
              IntToStr(TipoProduto)                               +Separador+
              Trim(AnsiReplaceStr(form_nc(Mva,9),'.',''))         +Separador+
              Trim(AnsiReplaceStr(form_nc(PrecoCusto,18),'.','')) +Separador+
              Trim(AnsiReplaceStr(form_nc(Margem,9),'.',''))      +Separador+
              Trim(AnsiReplaceStr(form_nc(PrecoVenda,18),'.','')) +Separador+
              Trim(AnsiReplaceStr(form_nc(Ipi,9),'.',''))         +Separador+
              IntToStr(Origem)                                    +Separador+
              Trim(RefInterna)                                    +Separador+
              DescricaoMestre                                     +Separador+
              codBarras                                           +Separador);
  CloseFile(arq);
end;

function TVendaNfe_Registro12.getCodBarras: String;
begin
  Result := _codBarras;
end;

function TVendaNfe_Registro12.getCodigoProduto: String;
begin
  Result := _codigoProduto;
end;

function TVendaNfe_Registro12.getDescricao: String;
begin
  Result := _descricao; 
end;

function TVendaNfe_Registro12.getDescricaoMestre: String;
begin
  Result := _descricaoMestre;
end;

function TVendaNfe_Registro12.getIpi: Real;
begin
  Result := _ipi;
end;

function TVendaNfe_Registro12.getMargem: Real;
begin
  Result := _margem;
end;

function TVendaNfe_Registro12.getMva: Real;
begin
  Result := _mva;
end;

function TVendaNfe_Registro12.getNcm: String;
begin
  Result := _ncm;
end;

function TVendaNfe_Registro12.getOrigem: Integer;
begin
  Result := _origem;
end;

function TVendaNfe_Registro12.getPrecoCusto: Real;
begin
  Result := _precoCusto;
end;

function TVendaNfe_Registro12.getPrecoVenda: Real;
begin
  Result := _precoVenda;
end;

function TVendaNfe_Registro12.getRefInterna: String;
begin
  Result := _refInterna;
end;

function TVendaNfe_Registro12.getTipo: String;
begin
  Result := _tipo;
end;

function TVendaNfe_Registro12.getTipoProduto: Integer;
begin
  Result := _tipoProduto;
end;

function TVendaNfe_Registro12.getUnidade: String;
begin
  Result := _unidade;
end;

procedure TVendaNfe_Registro12.setCodBarras(const Value: String);
begin
  _codBarras := Value;
end;

procedure TVendaNfe_Registro12.setCodigoProduto(const Value: String);
begin
  _codigoProduto := Trim(Value);
end;

procedure TVendaNfe_Registro12.setDescricao(const Value: String);
begin
  _descricao := Copy(Trim(Value),1,60);
end;

procedure TVendaNfe_Registro12.setDescricaoMestre(const Value: String);
begin
  _descricaoMestre := Copy(Trim(Value),1,60);
end;

procedure TVendaNfe_Registro12.setIpi(const Value: Real);
begin
  _ipi := Value;
end;

procedure TVendaNfe_Registro12.setMargem(const Value: Real);
begin
  _margem := Value;
end;

procedure TVendaNfe_Registro12.setMva(const Value: Real);
begin
  _mva := Value;
end;

procedure TVendaNfe_Registro12.setNcm(const Value: String);
begin
  _ncm := Copy(Trim(Value),1,8);
end;

procedure TVendaNfe_Registro12.setOrigem(const Value: Integer);
begin
  _origem := Value;
end;

procedure TVendaNfe_Registro12.setPrecoCusto(const Value: Real);
begin
  _precoCusto := Value;
end;

procedure TVendaNfe_Registro12.setPrecoVenda(const Value: Real);
begin
  _precoVenda := Value;
end;

procedure TVendaNfe_Registro12.setRefInterna(const Value: String);
begin
  _refInterna := Trim(Value);
end;

procedure TVendaNfe_Registro12.setTipo(const Value: String);
begin
  _tipo := Trim(Value);
end;

procedure TVendaNfe_Registro12.setTipoProduto(const Value: Integer);
begin
  _tipoProduto := Value;
end;

procedure TVendaNfe_Registro12.setUnidade(const Value: String);
begin
  _unidade := Copy(Trim(Value),1,5);
end;

end.
 