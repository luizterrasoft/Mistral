unit URetornoNfe_AtualizaVenda;

interface

uses Classes, SysUtils, URetornoNfe;

type
  TRetornoNfe_AtualizaVenda = class(TRetornoNfe)
  protected
    _caixa: Double;
    _loja: Double;
    _venda: Double;
    _numeroNota: String;
    _protocolo: String;
    _dataNota: String;
    _horaNota: String;
    _chave: String;
    _fatura: Byte; // 0 = Não há fatura / 1 = Houve fatura
  public
    constructor Create;
    destructor Destroy; override;
    procedure LerArquivo(nomeArquivo: String); override;
  end;

implementation

{ TRetornoNfe_AtualizaVenda }

constructor TRetornoNfe_AtualizaVenda.Create;
var
  i: Integer;
begin
  inherited;
  //******************************
  ListarArquivos('ret');
  i := 0;
  while (i < _arquivos.Count) do
  begin
    LerArquivo(_arquivos[i]);
    Inc(i);
  end;
end;

destructor TRetornoNfe_AtualizaVenda.Destroy;
begin
  inherited;
end;

procedure TRetornoNfe_AtualizaVenda.LerArquivo(nomeArquivo: String);
var
  linha: String;
  cliente,contratoAntigo: Real;
begin
  linha := '';
  
  AssignFile(arq,Caminho+nomeArquivo);
  Reset(arq);
  Readln(arq,linha);

  _caixa := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
  delete(linha,1,Pos(Chr(59),linha));

  _loja := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
  delete(linha,1,Pos(Chr(59),linha));

  _venda:= StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
  delete(linha,1,Pos(Chr(59),linha));

  _numeroNota := Copy(linha,1,Pos(chr(59),linha)-1);
  delete(linha,1,Pos(Chr(59),linha));

  _protocolo := Copy(linha,1,Pos(chr(59),linha)-1);
  delete(linha,1,Pos(Chr(59),linha));

  _dataNota := Copy(linha,1,Pos(chr(59),linha)-1);
  delete(linha,1,Pos(Chr(59),linha));

  _horaNota := Copy(linha,1,Pos(chr(59),linha)-1);
  delete(linha,1,Pos(Chr(59),linha));

  _chave := Copy(linha,1,Pos(chr(59),linha)-1);
  delete(linha,1,Pos(Chr(59),linha));

  _fatura := StrToInt(Copy(linha,1,Pos(chr(59),linha)-1));
  delete(linha,1,Pos(Chr(59),linha));

  CloseFile(arq);

  qVenda.ClearSql;
  qVenda.AddParam('SELECT * FROM VENDAS       ');
  qVenda.AddParam('WHERE (VE_CAIX=:caixa) AND ');
  qVenda.AddParam('      (VE_LOJA=:loja) AND  ');
  qVenda.AddParam('      (VE_CODI=:venda)     ');
  qVenda.consulta.ParamByName('caixa').AsFloat := _caixa;
  qVenda.consulta.ParamByName('loja').AsFloat  := _loja;
  qVenda.consulta.ParamByName('venda').AsFloat := _venda;
  qVenda.consulta.Open;
  if (not qVenda.consulta.IsEmpty) then
  begin
    qVenda.consulta.Close;
    qVenda.consulta.SQL.Clear;
    qVenda.AddParam('UPDATE VENDAS SET VE_NUMERO_NFE=:numeroNfe,    ');
    qVenda.AddParam('                  VE_PROTOCOLO_NFE=:protocolo, ');
    qVenda.AddParam('                  VE_DATA_NFE=:dataNfe,        ');
    qVenda.AddParam('                  VE_HORA_NFE=:horaNfe,        ');
    qVenda.AddParam('                  VE_CHAVE_NFE=:chaveNfe       ');
    qVenda.AddParam('WHERE (VE_CAIX=:caixa) AND (VE_LOJA=:loja) AND ');
    qVenda.AddParam('      (VE_CODI=:venda)                         ');
    qVenda.consulta.ParamByName('numeroNfe').AsString := _numeroNota;
    qVenda.consulta.ParamByName('protocolo').AsString := _protocolo;
    qVenda.consulta.ParamByName('dataNfe').AsDateTime := StrToDate(_dataNota);
    qVenda.consulta.ParamByName('horaNfe').AsString   := _horaNota;
    qVenda.consulta.ParamByName('chaveNfe').AsString  := _chave;
    qVenda.consulta.ParamByName('caixa').AsFloat      := _caixa;
    qVenda.consulta.ParamByName('loja').AsFloat       := _loja;
    qVenda.consulta.ParamByName('venda').AsFloat      := _venda;
    qVenda.consulta.ExecSQL;
    if (_fatura = 1) then
    begin
      qVenda.ClearSql;
      qVenda.AddParam('SELECT CR_CLIE,CR_CONT     ');
      qVenda.AddParam('FROM CREDIARIOS            ');
      qVenda.AddParam('WHERE (CR_CAIX=:caixa) AND ');
      qVenda.AddParam('      (CR_LOJA=:loja) AND  ');
      qVenda.AddParam('      (CR_VEND=:venda)     ');
      qVenda.consulta.ParamByName('caixa').AsFloat := _caixa;
      qVenda.consulta.ParamByName('loja').AsFloat  := _loja;
      qVenda.consulta.ParamByName('venda').AsFloat := _venda;
      qVenda.consulta.Open;
      if (not qVenda.consulta.IsEmpty) then
      begin
        contratoAntigo := qVenda.Result('CR_CONT');
        cliente        := qVenda.Result('CR_CLIE');
        //**********************************************************
        qVenda.consulta.Close;
        qVenda.ClearSql;
        qVenda.AddParam('UPDATE CREDIARIOS SET CR_CONT=:numeroNfe, ');
        qVenda.AddParam('                      CR_CODI=:numeroNfe2 ');
        qVenda.AddParam('WHERE (CR_CAIX=:caixa) AND                ');
        qVenda.AddParam('      (CR_LOJA=:loja) AND                 ');
        qVenda.AddParam('      (CR_VEND=:venda)                    ');
        qVenda.consulta.ParamByName('numeroNfe').AsFloat  := StrToFloat(_numeroNota);
        qVenda.consulta.ParamByName('numeroNfe2').AsFloat := StrToFloat(_numeroNota);
        qVenda.consulta.ParamByName('caixa').AsFloat      := _caixa;
        qVenda.consulta.ParamByName('loja').AsFloat       := _loja;
        qVenda.consulta.ParamByName('venda').AsFloat      := _venda;
        qVenda.Execute;
        //**********************************************************
        qCrediario.consulta.Close;
        qCrediario.ClearSql;
        qCrediario.AddParam('UPDATE CRECTABR SET CR_CODI=:numeroNfe ');
        qCrediario.AddParam('WHERE (CR_CLIE=:cliente) AND           ');
        qCrediario.AddParam('      (CR_CODI=:contrato)              ');
        qCrediario.consulta.ParamByName('numeroNfe').AsFloat := StrToFloat(_numeroNota);
        qCrediario.consulta.ParamByName('cliente').AsFloat   := cliente;
        qCrediario.consulta.ParamByName('contrato').AsFloat  := contratoAntigo;
        qCrediario.Execute;
        //*************************************
        qCrediario.consulta.Close;
        qCrediario.ClearSql;
        qCrediario.AddParam('UPDATE CREPRABR SET PC_CONT=:numeroNfe ');
        qCrediario.AddParam('WHERE (PC_CLIE=:cliente) AND           ');
        qCrediario.AddParam('      (PC_CONT=:contrato)              ');
        qCrediario.consulta.ParamByName('numeroNfe').AsFloat := StrToFloat(_numeroNota);
        qCrediario.consulta.ParamByName('cliente').AsFloat   := cliente;
        qCrediario.consulta.ParamByName('contrato').AsFloat  := contratoAntigo;
        qCrediario.Execute;
        //*************************************
      end;
    end;
    if (FileExists(Caminho+nomeArquivo)) then
      RenameFile(Caminho+nomeArquivo,Caminho+Copy(nomeArquivo,1,Length(nomeArquivo)-4)+'.ret.p');
  end;
  qVenda.consulta.Close;
  qCrediario.consulta.Close;
end;

end.
 