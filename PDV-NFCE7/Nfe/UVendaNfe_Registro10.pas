unit UVendaNfe_Registro10;

interface

uses SysUtils, StrUtils, UVendaNfe;

type
  TVendaNfe_Registro10 = class(TVendaNfe)
  protected
    _tipo: String;
    _nome: String;
    _cpfCnpj: String;
    _rgIe: String;
    _tipoLogradouro: String;
    _logradouro: String;
    _numero: Integer;
    _complemento: String;
    _bairro: String;
    _ibgeCidade: Integer;
    _ibgeUf: Integer;
    _cep: String;
    _codPais: String;
    _telefone: String;
    _fax: String;
    _email: String;
  private
    function getBairro: String;
    function getCep: String;
    function getCodPais: String;
    function getComplemento: String;
    function getCpfCnpj: String;
    function getEmail: String;
    function getFax: String;
    function getIbgeCidade: Integer;
    function getIbgeUf: Integer;
    function getLogradouro: String;
    function getNome: String;
    function getNumero: Integer;
    function getRgIe: String;
    function getTelefone: String;
    function getTipo: String;
    function getTipoLogradouro: String;
    procedure setBairro(const Value: String);
    procedure setCep(const Value: String);
    procedure setCodPais(const Value: String);
    procedure setComplemento(const Value: String);
    procedure setCpfCnpj(const Value: String);
    procedure setEmail(const Value: String);
    procedure setFax(const Value: String);
    procedure setIbgeCidade(const Value: Integer);
    procedure setIbgeUf(const Value: Integer);
    procedure setLogradouro(const Value: String);
    procedure setNome(const Value: String);
    procedure setNumero(const Value: Integer);
    procedure setRgIe(const Value: String);
    procedure setTelefone(const Value: String);
    procedure setTipo(const Value: String);
    procedure setTipoLogradouro(const Value: String);
  public
    constructor Create;
    procedure EscreveRegistro(nomeArquivo: String); override;

    property Tipo: String               read getTipo                write setTipo;
    property Nome: String               read getNome                write setNome;
    property CpfCnpj: String            read getCpfCnpj             write setCpfCnpj;
    property RgIe: String               read getRgIe                write setRgIe;
    property TipoLogradouro: String     read getTipoLogradouro      write setTipoLogradouro;
    property Logradouro: String         read getLogradouro          write setLogradouro;
    property Numero: Integer            read getNumero              write setNumero;
    property Complemento: String        read getComplemento         write setComplemento;
    property Bairro: String             read getBairro              write setBairro;
    property IbgeCidade: Integer        read getIbgeCidade          write setIbgeCidade;
    property IbgeUf: Integer            read getIbgeUf              write setIbgeUf;
    property Cep: String                read getCep                 write setCep;
    property CodPais: String            read getCodPais             write setCodPais;
    property Telefone: String           read getTelefone            write setTelefone;
    property Fax: String                read getFax                 write setFax;
    property Email: String              read getEmail               write setEmail;
  end;

implementation

{ TVendaNfe_Registro10 }

constructor TVendaNfe_Registro10.Create;
begin
  inherited;
  _tipo := '10';
end;

procedure TVendaNfe_Registro10.EscreveRegistro(nomeArquivo: String);
begin
  AssignFile(arq,Caminho+nomeArquivo);
  ReWrite(arq);
  WriteLn(arq,Tipo                  +Separador+
              Nome                  +Separador+
              CpfCnpj               +Separador+
              RgIe                  +Separador+
              TipoLogradouro        +Separador+
              Logradouro            +Separador+
              IntToStr(Numero)      +Separador+
              Complemento           +Separador+
              Bairro                +Separador+
              IntToStr(IbgeCidade)  +Separador+
              IntToStr(IbgeUf)      +Separador+
              Cep                   +Separador+
              CodPais               +Separador+
              Telefone              +Separador+
              Fax                   +Separador+
              Email                 +Separador);
  CloseFile(arq);
end;

function TVendaNfe_Registro10.getBairro: String;
begin
  Result := _bairro;
end;

function TVendaNfe_Registro10.getCep: String;
begin
  Result := _cep;
end;

function TVendaNfe_Registro10.getCodPais: String;
begin
  Result := _codPais;
end;

function TVendaNfe_Registro10.getComplemento: String;
begin
  Result := _complemento;
end;

function TVendaNfe_Registro10.getCpfCnpj: String;
begin
  Result := _cpfCnpj;
end;

function TVendaNfe_Registro10.getEmail: String;
begin
  Result := _email;
end;

function TVendaNfe_Registro10.getFax: String;
begin
  Result := _fax;
end;

function TVendaNfe_Registro10.getIbgeCidade: Integer;
begin
  Result := _ibgeCidade;
end;

function TVendaNfe_Registro10.getIbgeUf: Integer;
begin
  Result := _ibgeUf;
end;

function TVendaNfe_Registro10.getLogradouro: String;
begin
  Result := _logradouro;
end;

function TVendaNfe_Registro10.getNome: String;
begin
  Result := _nome;
end;

function TVendaNfe_Registro10.getNumero: Integer;
begin
  Result := _numero;
end;

function TVendaNfe_Registro10.getRgIe: String;
begin
  Result := _rgIe;
end;

function TVendaNfe_Registro10.getTelefone: String;
begin
  Result := _telefone;
end;

function TVendaNfe_Registro10.getTipo: String;
begin
  Result := _tipo;
end;

function TVendaNfe_Registro10.getTipoLogradouro: String;
begin
  Result := _tipoLogradouro;
end;

procedure TVendaNfe_Registro10.setBairro(const Value: String);
begin
  _bairro := Copy(Trim(Value),1,30);
end;

procedure TVendaNfe_Registro10.setCep(const Value: String);
begin
  _cep := Trim(AnsiReplaceStr(Value,'-',''));
end;

procedure TVendaNfe_Registro10.setCodPais(const Value: String);
begin
  _codPais := Trim(Value);
end;

procedure TVendaNfe_Registro10.setComplemento(const Value: String);
begin
  _complemento := Copy(Trim(Value),1,15);
end;

procedure TVendaNfe_Registro10.setCpfCnpj(const Value: String);
begin
  _cpfCnpj := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),'.',''),'/','')),1,14);
end;

procedure TVendaNfe_Registro10.setEmail(const Value: String);
begin
  _email := Copy(Trim(Value),1,70);
end;

procedure TVendaNfe_Registro10.setFax(const Value: String);
begin
  _fax := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),')',''),'(','')),1,13);
end;

procedure TVendaNfe_Registro10.setIbgeCidade(const Value: Integer);
begin
  _ibgeCidade := Value;
end;

procedure TVendaNfe_Registro10.setIbgeUf(const Value: Integer);
begin
  _ibgeUf := Value;
end;

procedure TVendaNfe_Registro10.setLogradouro(const Value: String);
begin
  _logradouro := Copy(Trim(Value),1,40);
end;

procedure TVendaNfe_Registro10.setNome(const Value: String);
begin
  _nome := Copy(Trim(Value),1,50);
end;

procedure TVendaNfe_Registro10.setNumero(const Value: Integer);
begin
  _numero := Value;
end;

procedure TVendaNfe_Registro10.setRgIe(const Value: String);
begin
  _rgIe := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),'.',''),'/','')),1,15);
end;

procedure TVendaNfe_Registro10.setTelefone(const Value: String);
begin
  _telefone := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),')',''),'(','')),1,13);
end;

procedure TVendaNfe_Registro10.setTipo(const Value: String);
begin
  _tipo := Trim(Value);
end;

procedure TVendaNfe_Registro10.setTipoLogradouro(const Value: String);
begin
  _tipoLogradouro := Copy(Trim(Value),1,12);
end;

end.
