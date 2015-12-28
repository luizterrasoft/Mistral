unit UVendaNfe_Registro20;

interface

uses SysUtils, StrUtils, UVendaNfe, funcoes2;

type
  TVendaNfe_Registro20 = class(TVendaNfe)
  protected
    _tipo           : String;
    _caixa          : Real;
    _loja           : Real;
    _venda          : Real;
    _cpfCnpjCliente : String;
    _tipoNota       : String;
    _cpfCnjpTransportadora : String;
    _nomeCliente    : String;
    _dataVenda      : TDateTime;
    _desconto       : Real;
    _tipoDesconto   : String;

    //incluir campos --> 16/07/2012
     _formpg       : Real;
     _InfoAdic     : String;
     _valorliquido : String;

  private
    function getCpfCnpjCliente: String;
    function getCpfCnpjTransportadora: String;
    function getTipo: String;
    function getTipoNota: String;
    function getVenda: Real;
    function getCaixa: Real;
    function getLoja: Real;
    function getDesconto : Real;
    function getTipoDesconto : String;

    //incluir campos --> 16/07/2012
    function getformpg       : Real;
    function getInfoAdic     : String;
    function getvalorliquido : String;

    procedure setCpfCnpjCliente(const Value: String);
    procedure setCpfCnpjTransportadora(const Value: String);
    procedure setTipo(const Value: String);
    procedure setTipoNota(const Value: String);
    procedure setVenda(const Value: Real);
    procedure setCaixa(const Value: Real);
    procedure setLoja(const Value: Real);
    procedure setDesconto(const Value:Real);
    procedure setTipoDesconto(const Value:String);

    //incluir campos --> 16/07/2012
    procedure setformpg(const Value:Real);
    procedure setInfoAdic(const Value:String);
    procedure setvalorliquido(const Value:String);

    function getDataVenda: TDateTime;
    function getNomeCliente: String;
    procedure setDataVenda(const Value: TDateTime);
    procedure setNomeCliente(const Value: String);
  public
    constructor Create;
    procedure EscreveRegistro(nomeArquivo: String); override;

    property Tipo: String                     read getTipo                    write setTipo;
    property Caixa: Real                      read getCaixa                   write setCaixa;
    property Loja: Real                       read getLoja                    write setLoja;
    property Venda: Real                      read getVenda                   write setVenda;
    property CpfCnpjCliente: String           read getCpfCnpjCliente          write setCpfCnpjCliente;
    property TipoNota: String                 read getTipoNota                write setTipoNota;
    property CpfCnpjTransportadora: String    read getCpfCnpjTransportadora   write setCpfCnpjTransportadora;
    property NomeCliente: String              read getNomeCliente             write setNomeCliente;
    property DataVenda: TDateTime             read getDataVenda               write setDataVenda;
    property desconto : Real                  read getDesconto                write setDesconto;
    property tipoDesconto : String            read getTipoDesconto            write setTipoDesconto;

    //incluir campos --> 16/07/2012
    property formpg   : Real                  read getformpg                  write setformpg;
    property InfoAdic : String                read getInfoAdic                write setInfoAdic;
    property valorliquido : String            read getvalorliquido            write setvalorliquido;

  end;

implementation

{ TVendaNfe_Registro20 }

constructor TVendaNfe_Registro20.Create;
begin
  inherited;
  _tipo                  := '20';
  _tipoNota              := '0'; //Sa�da
  _cpfCnjpTransportadora := '0'; //Sem transportadora
end;

procedure TVendaNfe_Registro20.EscreveRegistro(nomeArquivo: String);
begin
  AssignFile(arq,Caminho+nomeArquivo);
  Append(arq);
  Writeln(arq,Tipo                    +Separador+
              FloatToStr(Caixa)       +Separador+
              FloatToStr(Loja)        +Separador+
              FloatToStr(Venda)       +Separador+
              CpfCnpjCliente          +Separador+
              TipoNota                +Separador+
              CpfCnpjTransportadora   +Separador+
              NomeCliente             +Separador+
              form_data(DataVenda)    +Separador+
              FloatToStr(desconto)    +Separador+
              Trim(tipoDesconto)      +Separador+
              FloatToStr(formpg)      +Separador+
              InfoAdic                +Separador+
              valorliquido            +Separador);
  CloseFile(arq);
end;

function TVendaNfe_Registro20.getCaixa: Real;
begin
  Result := _caixa;
end;

function TVendaNfe_Registro20.getCpfCnpjCliente: String;
begin
  Result := _cpfCnpjCliente;
end;

function TVendaNfe_Registro20.getCpfCnpjTransportadora: String;
begin
  Result := _cpfCnjpTransportadora;
end;

function TVendaNfe_Registro20.getDataVenda: TDateTime;
begin
  Result := _dataVenda;
end;

function TVendaNfe_Registro20.getDesconto: Real;
begin
  Result := _desconto;
end;

function TVendaNfe_Registro20.getLoja: Real;
begin
  Result := _loja;
end;

function TVendaNfe_Registro20.getNomeCliente: String;
begin
  Result := _nomeCliente;
end;

function TVendaNfe_Registro20.getTipo: String;
begin
  Result := _tipo;
end;

function TVendaNfe_Registro20.getTipoDesconto: String;
begin
  Result := _tipoDesconto;
end;

function TVendaNfe_Registro20.getformpg : Real;
begin
   Result := _formpg;
end;

function TVendaNfe_Registro20.getInfoAdic : String;
begin
   Result := _InfoAdic;
end;

function TVendaNfe_Registro20.getvalorliquido : String;
begin
   Result := _valorliquido;
end;

function TVendaNfe_Registro20.getTipoNota: String;
begin
  Result := _tipoNota;
end;

function TVendaNfe_Registro20.getVenda: Real;
begin
  Result := _venda;
end;

procedure TVendaNfe_Registro20.setCaixa(const Value: Real);
begin
  _caixa := Value;
end;

procedure TVendaNfe_Registro20.setCpfCnpjCliente(const Value: String);
begin
  _cpfCnpjCliente := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),'.',''),'/','')),1,14);;
end;

procedure TVendaNfe_Registro20.setCpfCnpjTransportadora(
  const Value: String);
begin
  _cpfCnjpTransportadora := Copy(Trim(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(Value,'-',''),'.',''),'/','')),1,14);;
end;

procedure TVendaNfe_Registro20.setDataVenda(const Value: TDateTime);
begin
  _dataVenda := Value;
end;

procedure TVendaNfe_Registro20.setDesconto(const Value: Real);
begin
  _desconto := Value;
end;

procedure TVendaNfe_Registro20.setLoja(const Value: Real);
begin
  _loja := Value;
end;

procedure TVendaNfe_Registro20.setNomeCliente(const Value: String);
begin
  _nomeCliente := Trim(Value);
end;

procedure TVendaNfe_Registro20.setTipo(const Value: String);
begin
  _tipo := Trim(Value);
end;

procedure TVendaNfe_Registro20.setTipoDesconto(const Value: String);
begin
  _tipoDesconto := Value;
end;

procedure TVendaNfe_Registro20.setformpg(const Value: Real);
begin
    _formpg:= Value;
end;

procedure TVendaNfe_Registro20.setInfoAdic(const Value: String);
begin
    _InfoAdic:= Value;
end;

procedure TVendaNfe_Registro20.setvalorliquido(const Value: String);
begin
    _valorliquido:= Value;
end;

procedure TVendaNfe_Registro20.setTipoNota(const Value: String);
begin
  _tipoNota := Trim(Value);
end;

procedure TVendaNfe_Registro20.setVenda(const Value: Real);
begin
  _venda := Value;
end;

end.
