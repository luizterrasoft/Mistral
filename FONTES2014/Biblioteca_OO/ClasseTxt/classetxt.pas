{*** classe geral de acesso a entidade plano de pagamento}
unit classetxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables;

{-- Definicao da estrutura necessaria para armazenar informacoes de layout do arquivo TXT lido --}
type
  TStructTXT = record
    nomecampo: string;       {armazena o nome do campo}
    pos: integer;            {posicao do campo na linha lida}
    tam: integer;            {tamanho do campo na linha lida}
    tipo: TFieldType;        {tipo do campo}
  end;

{-- Definicao da classe de acesso a arquivos TXT --}
type
  TClassTXT = class(TObject)
  private
     arq: textfile;          {ponteiro do arquivo TXT instanciado}
     linha: string;          {var. que armazenara linha a linha}
     tipoacesso: integer;    {define o tipo de acesso ao arquivo}
  public
     aStructArq: array[1..50]of TStructTXT; {estrutura do arquivo TXT - preenchido pelo metodo invocador da classe}
     procedure Open          (nomearquivo: string; tacesso: integer); {abre o arquivo e define o tipo de acesso}
     procedure Close;        {fecha o arquivo}
     procedure First;        {coloca o ponteiro no inicio do arquivo}
     procedure Last;         {coloca o ponteiro no final do arquivo}
     procedure Next;         {move o ponteiro para a proxima linha do arquivo}
     function  FieldInfo     (nomecampo: string):TStructTXT; {devolve info. de estrutura de um campo do arquivo}
     function  FieldByName   (nomecampo: string):variant;  {retorna o valor de uma campo do arquivo}
     function  FindKey       (nomecampos: string; valores: string):boolean; {realiza pesquisa por valo de campo}
     function  Feof          :boolean; {verifica se o ponteiro de arquivo chegou no final}
     function  RecordCount   :integer; {retorna a qtde. de linhas do arquivo}
     function  GetLinha      :string; {retorna a linha atual}
  end;

implementation

procedure TClassTXT.Open(nomearquivo: string; tacesso: integer);
begin
     try
       AssignFile(arq,nomearquivo);
       tipoacesso:=tacesso;
       if (tipoacesso=0) then Rewrite(arq)
               else if (tipoacesso=1) then Reset(arq)
       else if (tipoacesso=2) then Append(arq);
     except
       Raise;
     end;
end;

function  TClassTXT.Feof:boolean;
begin
     result:=false;
     if (tipoacesso=1) then
     begin
          if (Eof(arq)) then
             result:=true;
     end
end;

procedure TClassTXT.Close;
begin
     CloseFile(arq);
end;

procedure TClassTXT.Next;
begin
     ReadLn(arq,linha);
end;

procedure TClassTXT.First;
begin
     if (tipoacesso=1) then
     begin
          Reset(arq);
          Next;
     end;
end;

procedure TClassTXT.Last;
begin
end;

function TClassTXT.FieldInfo(nomecampo: string):TStructTXT;
var
achou: boolean;
i: integer;
begin
     achou:=false;
     i:=1;
     while (aStructArq[i].nomecampo<>'[FIM]') do
     begin
          if (trim(aStructArq[i].nomecampo)=trim(nomecampo)) then
          begin
               achou:=true; 
               break;
          end;
          i:=i+1;
     end;
     if (achou) then
     begin
          result.nomecampo := aStructArq[i].nomecampo;
          result.pos       := aStructArq[i].pos;
          result.tam       := aStructArq[i].tam;
          result.tipo      := aStructArq[i].tipo;
     end
     else
     begin
          result.nomecampo := '[?]';
          result.pos       := -1;
          result.tam       := -1;
          result.tipo      := ftUnknown;
     end;
end;

function TClassTXT.FieldByName(nomecampo: string):variant;
var
campo: TStructTXT;
aux: string;
begin
     campo := FieldInfo(nomecampo);
     if (campo.nomecampo<>'[?]') then
     begin
          aux := Copy(linha,campo.pos,campo.tam);
          if (trim(aux)='') then
          begin
              if (campo.tipo=ftString) then result := ''
              else if (campo.tipo=ftInteger) then result := 0
              else if (campo.tipo=ftFloat) then result := 0.00
              else if (campo.tipo=ftDateTime) then result := strtodate('01/01/1900');
          end
          else
          begin
              if (campo.tipo=ftString) then
                  result := trim(aux)
              else if (campo.tipo=ftInteger) then
                  result := strtoint(trim(aux))
              else if (campo.tipo=ftFloat) then
                  result := strtofloat(trim(aux))
              else if (campo.tipo=ftDateTime) then
                  result := strtodate(trim(aux));
          end;
     end
     else result := '?';
end;

function TClassTXT.FindKey(nomecampos: string; valores: string):boolean;
var
listanomecampos: TStringList;
listavalores: TStringList;
campo: TStructTXT;
achou: boolean;
i: integer;
aux: string;
begin
     listanomecampos := TStringList.Create;
     i:=1;aux:='';
     while (i<=Length(trim(nomecampos))) do
     begin
          if (nomecampos[i]=';') or (nomecampos[i]=',') then
          begin
               listanomecampos.Add(aux);
               aux:='';
          end
          else aux:=aux+nomecampos[i];
          i:=i+1;
     end;
     listanomecampos.Add(aux);
     listavalores := TStringList.Create;
     i:=1;aux:='';
     while (i<=Length(trim(valores))) do
     begin
          if (valores[i]=';') or (valores[i]=',') then
          begin
               listavalores.Add(aux);
               aux:='';
          end
          else aux:=aux+valores[i];
          i:=i+1;
     end;
     listavalores.Add(aux);
     if (tipoacesso=1) then
     begin
          First;
          while (not Feof) do
          begin
               achou:=false;
               i:=0;
               while (i<listanomecampos.count) do
               begin
                    campo := FieldInfo(listanomecampos[i]);
                    if (campo.tipo=ftString) then
                    begin
                         if (FieldByName(listanomecampos[i])=trim(listavalores[i])) then
                             achou:=true
                         else achou:=false;
                    end
                    else if (campo.tipo=ftInteger) then
                    begin
                         if (FieldByName(listanomecampos[i])=strtoint(trim(listavalores[i]))) then
                             achou:=true
                         else achou:=false;
                    end
                    else if (campo.tipo=ftFloat) then
                    begin
                         if (FieldByName(listanomecampos[i])=strtofloat(trim(listavalores[i]))) then
                             achou:=true
                         else achou:=false;
                    end
                    else if (campo.tipo=ftDateTime) then
                    begin
                         if (FieldByName(listanomecampos[i])=strtodate(trim(listavalores[i]))) then
                             achou:=true
                         else achou:=false;
                    end;
                    i:=i+1;
               end;
               if (achou) then
               begin
                    result:=true;
                    break;
               end;
               Next;
          end;
     end
     else result:=false;
     listanomecampos.Free;
     listavalores.Free;
end;

function TClassTXT.RecordCount:integer;
var
i: integer;
begin
     if (tipoacesso=1) then
     begin
         i:=0;
         First;
         while (not Feof) do
         begin
              Next;
              i:=i+1;
         end;
         Reset(arq);
         result:=i+1;
     end;
end;

function TClassTXT.GetLinha:string;
begin
     if (not Feof) then
         result:=linha
     else result:='?';
end;

end.
