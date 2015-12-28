unit UVendaNfe_Registro22;

interface

uses SysUtils, StrUtils, funcoes2, UVendaNfe;

type
  TVendaNfe_Registro22 = class(TVendaNfe)
  protected
    _tipo: String;
    _venda: Real;
    _fatura: Real;
    _valorFatura: Real;
    _vencimento: TDateTime;
  private
    function getFatura: Real;
    function getTipo: String;
    function getValorFatura: Real;
    function getVencimento: TDateTime;
    function getVenda: Real;
    procedure setFatura(const Value: Real);
    procedure setTipo(const Value: String);
    procedure setValorFatura(const Value: Real);
    procedure setVencimento(const Value: TDateTime);
    procedure setVenda(const Value: Real);            
  public
    constructor Create;
    procedure EscreveRegistro(nomeArquivo: String); override;

    property Tipo: String             read getTipo            write setTipo;
    property Venda: Real              read getVenda           write setVenda;
    property Fatura: Real             read getFatura          write setFatura;
    property ValorFatura: Real        read getValorFatura     write setValorFatura;
    property Vencimento: TDateTime    read getVencimento      write setVencimento;   
  end;

implementation

{ TVendaNfe_Registro22 }

constructor TVendaNfe_Registro22.Create;
begin
  inherited;
  _tipo := '22';
end;

procedure TVendaNfe_Registro22.EscreveRegistro(nomeArquivo: String);
begin
  AssignFile(arq,Caminho+nomeArquivo);
  Append(arq);
  Writeln(arq,Tipo                                                  +Separador+
              FloatToStr(Venda)                                     +Separador+
              FloatToStr(Fatura)                                    +Separador+
              Trim(AnsiReplaceStr(form_nc(ValorFatura,15),'.',''))  +Separador+
              form_data(Vencimento)                                 +Separador);
  CloseFile(arq);
end;

function TVendaNfe_Registro22.getFatura: Real;
begin
  Result := _fatura;
end;

function TVendaNfe_Registro22.getTipo: String;
begin
  Result := _tipo;
end;

function TVendaNfe_Registro22.getValorFatura: Real;
begin
  Result := _valorFatura;
end;

function TVendaNfe_Registro22.getVencimento: TDateTime;
begin
  Result := _vencimento;
end;

function TVendaNfe_Registro22.getVenda: Real;
begin
  Result := _venda;
end;

procedure TVendaNfe_Registro22.setFatura(const Value: Real);
begin
  _fatura := Value;
end;

procedure TVendaNfe_Registro22.setTipo(const Value: String);
begin
  _tipo := Trim(Value);
end;

procedure TVendaNfe_Registro22.setValorFatura(const Value: Real);
begin
  _valorFatura := Value;
end;

procedure TVendaNfe_Registro22.setVencimento(const Value: TDateTime);
begin
  _vencimento := Value;
end;

procedure TVendaNfe_Registro22.setVenda(const Value: Real);
begin
  _venda := Value;
end;

end.
 