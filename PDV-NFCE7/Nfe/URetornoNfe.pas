unit URetornoNfe;

interface

uses Classes, SysUtils, principal, auxiliar,StrUtils;

type
  TRetornoNfe = class
  protected
    _separador: String;
    _caminho: String;
    _arquivos: TStringList;
  private
    function getCaminho: String;
    function getSeparador: String;
  public
    arq: TextFile;
    qVenda: TClassAuxiliar;
    qCrediario: TClassAuxiliar;
    constructor Create;
    destructor Destroy; override;
    procedure LerArquivo(nomeArquivo: String); virtual; abstract;
    procedure ListarArquivos(extensao: String);

    property Separador: String    read getSeparador;
    property Caminho: String      read getCaminho;
  end;

implementation

{ TRetornoNfe }

constructor TRetornoNfe.Create;
begin
  _separador := ';';
  _caminho   := frm_principal.x_path_integracao_nfe;  
  if RightStr(_caminho,1)<>'\' then
    _caminho := _caminho+'\';
  _caminho := _caminho+'REMESSA-PAF\';
  if not DirectoryExists(_caminho) then
    CreateDir(_caminho);
  //_caminho   := 'C:\NATIVA\VENDAS\NFE\REMESSA-PAF\'+FormatDateTime('YYYYMM',frm_principal.x_data_trabalho)+'\';
  _arquivos  := TStringList.Create;
  //******************************
  qVenda := TClassAuxiliar.Create;
  if frm_principal.x_online then
    qVenda.Conect('ESTOQUE',nil)
  else
    qVenda.Conect('VENDAS',nil);
  qVenda.ClearSql;
  //******************************
  qCrediario := TClassAuxiliar.Create;
  qCrediario.Conect('CREDITO',nil);
  qCrediario.ClearSql;
  //******************************
end;

destructor TRetornoNfe.Destroy;
begin
  _arquivos.Free;
  qVenda.Desconect;
  qVenda.Free;
  qCrediario.Desconect;
  qCrediario.Free;
end;

function TRetornoNfe.getCaminho: String;
begin
  Result := _caminho;
end;

function TRetornoNfe.getSeparador: String;
begin
  Result := _separador;
end;

procedure TRetornoNfe.ListarArquivos(extensao: String);
var
  Rec: TSearchRec;
begin
  _arquivos.Clear;
  if (FindFirst(Caminho + '*.'+ extensao, faAnyFile, Rec) = 0) then
    try
      repeat
        _arquivos.Add(Rec.Name);
      until
        FindNext(Rec) <> 0;
    finally
      FindClose(Rec);
    end;
end;

end.
 