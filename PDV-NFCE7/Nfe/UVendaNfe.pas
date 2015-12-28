unit UVendaNfe;

interface

uses SysUtils, principal,strutils;

type
  TVendaNfe = class
  protected
    _separador: String;
    _caminho: String;
  private
    function getCaminho: String;
    function getSeparador: String;
    procedure setCaminho(const Value: String);
  public
    arq: TextFile;
    constructor Create;
    procedure EscreveRegistro(nomeArquivo: String); virtual; abstract;

    property Separador: String    read getSeparador;
    property Caminho: String      read getCaminho       write setCaminho;
  end;

implementation

{ TVendaNfe }

constructor TVendaNfe.Create;
begin
  _separador := ';';
  _caminho   := frm_principal.x_path_integracao_nfe;
  if RightStr(_caminho,1)<>'\' then
    _caminho := _caminho+'\';
  _caminho := _caminho+'REMESSA-NFE\';
  if not DirectoryExists(_caminho) then
    CreateDir(_caminho);
  _caminho := _caminho+'NFE';
  //_caminho   := 'C:\NATIVA\VENDAS\NFE\REMESSA-NFE\'+FormatDateTime('YYYYMM',frm_principal.x_data_trabalho)+'\NFE';
end;

function TVendaNfe.getCaminho: String;
begin
  Result := _caminho;
end;

function TVendaNfe.getSeparador: String;
begin
  Result := _separador;
end;

procedure TVendaNfe.setCaminho(const Value: String);
begin
  _caminho := Trim(Value);
end;

end.
 