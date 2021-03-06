unit URetornoNfe_CancelaVenda;

interface

uses Classes, SysUtils, URetornoNfe, Venda;

type
  TRetornoNfe_CancelaVenda = class(TRetornoNfe)
  protected
    _caixa: Double;
    _loja: Double;
    _venda: Double;
    _protocoloCancelamento: String;
//    _fatura: Byte; // 0 = N�o h� fatura / 1 = Houve fatura
     _fatura: Real; // numero do contrato do cliente
  public
    constructor Create;
    destructor Destroy; override;
    procedure LerArquivo(nomeArquivo: String); override;
  end;

implementation

{ TRetornoNfe_CancelaVenda }

constructor TRetornoNfe_CancelaVenda.Create;
var
  i: Integer;
begin
  inherited;
  //******************************
  ListarArquivos('can');
  i := 0;
  while (i < _arquivos.Count) do
  begin
    LerArquivo(_arquivos[i]);
    Inc(i);
  end;
end;

destructor TRetornoNfe_CancelaVenda.Destroy;
begin
  inherited;
end;

procedure TRetornoNfe_CancelaVenda.LerArquivo(nomeArquivo: String);
var
  linha: String;
  cliente: Real;
  NReg, Coln1, coln2  : Real;

begin
  linha := ''; // logica antiga do junior
  _fatura:= 0;
  try
    AssignFile(arq,Caminho+nomeArquivo);
    Reset(arq);
    while not Eoln(arq) do
    begin
        Readln(arq,linha);
        //nova logica
        if copy(linha,1,2) = '20'
          then
          begin
             { _caixa := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
              delete(linha,1,Pos(Chr(59),linha));
              }
              NReg:= StrToFloat(Copy(linha,1,Pos(';',linha)-1));
              delete(linha,1,Pos(';',linha));

              _caixa := StrToFloat(Copy(linha,1,Pos(';',linha)-1));
              delete(linha,1,Pos(';',linha));

              _loja := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
              delete(linha,1,Pos(Chr(59),linha));

              _venda:= StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
              delete(linha,1,Pos(Chr(59),linha));
          end;
               { LOGICA ANTIGA
              _protocoloCancelamento := Copy(linha,1,Pos(chr(59),linha)-1);
              delete(linha,1,Pos(Chr(59),linha));
               }
        if copy(linha,1,2) = '22'
          then
          begin
              Coln1:= StrToFloat(Copy(linha,1,Pos(';',linha)-1));
              delete(linha,1,Pos(';',linha));

              Coln2:= StrToFloat(Copy(linha,1,Pos(';',linha)-1));
              delete(linha,1,Pos(';',linha));

              _fatura := StrToFloat(Copy(linha,1,Pos(';',linha)-1));
              delete(linha,1,Pos(';',linha));
          end;
    end;

    CloseFile(arq);
    CancelaVenda(_loja,_caixa,_venda);

    if (_fatura > 0) then
      Excluicrediario(_loja,_caixa,_venda);

    if (FileExists(Caminho+nomeArquivo)) then
      RenameFile(Caminho+nomeArquivo,Caminho+Copy(nomeArquivo,1,Length(nomeArquivo)-4)+'.can.p');
  except

  end;

{  linha := ''; // logica antiga do junior
  try
    AssignFile(arq,Caminho+nomeArquivo);
    Reset(arq);
    Readln(arq,linha);

    _caixa := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
    delete(linha,1,Pos(Chr(59),linha));

    _loja := StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
    delete(linha,1,Pos(Chr(59),linha));

    _venda:= StrToFloat(Copy(linha,1,Pos(chr(59),linha)-1));
    delete(linha,1,Pos(Chr(59),linha));


    _protocoloCancelamento := Copy(linha,1,Pos(chr(59),linha)-1);
    delete(linha,1,Pos(Chr(59),linha));

    _fatura := StrToInt(Copy(linha,1,Pos(chr(59),linha)-1));
    delete(linha,1,Pos(Chr(59),linha));

    CloseFile(arq);

    CancelaVenda(_loja,_caixa,_venda);

    if (_fatura = 1) then
      Excluicrediario(_loja,_caixa,_venda);

    if (FileExists(Caminho+nomeArquivo)) then
      RenameFile(Caminho+nomeArquivo,Caminho+Copy(nomeArquivo,1,Length(nomeArquivo)-4)+'.can.p');
  except

  end;
  }
end;

end.
