unit AuxiliarNFE;

interface

uses Messages, DB, Dialogs, auxiliar, classes, SysUtils, IniFiles;

type
//  TClassAuxiliar = class(TObject)
//  private
//  public

    TChavess = Record
      Campo : String;
      Valor : Variant;
      Tipo  : TFieldType;
    end;

//  end;


function ServicoSeFazAtivo() : string;
function ImprimeDanfe() : boolean;
function BuscaCFOP(codigo: real; componente: TComponent ): String;
function  BuscaCSOSN(codigo: real; componente: TComponent ): String;
function  BuscaIPI(codigo: real; componente: TComponent ): String;
function  BuscaPIS(codigo: real; componente: TComponent ): String;
function  BuscaCOFINS(codigo: real; componente: TComponent ): String;


function ChecaStatusSefaz(NomeArquivo : String; NumDoc : String) : TStringList;
function ChecaStatusArqRetorno(NomeArquivo : String) : string;
Function Explode(Texto, Separador : String) : TStrings;

procedure ChamandoF8CFOP(y_edit: TObject; cadastro: Boolean);


//VAR

//const

implementation

uses un_F8CFOP;

function ServicoSeFazAtivo : string;
 var  lArq : TStringList;
Begin

  lArq := TStringList.Create;

  lArq.Text := 'NFe.StatusServico';

  lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUS.TXT');

  while not FileExists('C:\MIstralNF\TXT\SAINFESTATUS.TXT') do
  Sleep(1000);

  if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUS.TXT') = 'OK:' then
     Result := 'OK'
  else
     Result := 'INATIVO... ';

  DeleteFile('C:\MIstralNF\TXT\SAINFESTATUS.TXT');
End;

function ChecaStatusSefaz(NomeArquivo : String; NumDoc : String) : TStringList;
var arq: TextFile;

ArqINI : TIniFile;
    linha, linhaAux, tiporeg, Resultado : string;
    x,i,tam : integer;

    // NFE23
    Header_NF : string;
    lArq, Lista : TStringList;

begin

 Lista := TStringList.Create;

 AssignFile(arq, NomeArquivo);

{$I-} // desativa a diretiva de Input
  Reset(arq);
//
 {$I+} // ativa a diretiva de Input
if (IOResult <> 0)
     then Resultado := 'Erro na abertura do arquivo !!!'
 else begin

     begin readln(arq, linha);

      If pos('OK:',linha) = 1 then
         begin
            i:= pos(':',linha); tam := Length(linha);
            delete(linha, i+1, tam-i);
            Lista.add(linha);
         end;
      If pos('ERRO:',linha) = 1 then
         Begin
           i:= pos(':',linha); tam := Length(linha);
           delete(linha, i+1, tam-i);
           Lista.add(linha);
         End;

     end;
    CloseFile(arq);

 x:= Pos('.',NomeArquivo);

 Header_NF := 'NFE'+NumDoc ;

 Begin
  Try
    ArqIni := TIniFile.Create(NomeArquivo);
  Except
  on E:Exception do
      begin
        MessageDlg('Erro ao conectar!'#13'Erro: ' + e.Message, mtError, [mbOK], 0);
        Abort;
      end;
  end;

    // ENVIO
    {1} Lista.add(ArqINI.ReadString('ENVIO','Versao',''));
    {2} Lista.add(ArqINI.ReadString('ENVIO','TpAmb',''));
    {3} Lista.add(ArqIni.ReadString('ENVIO','VerAplic',''));
    {4} Lista.add(ArqIni.ReadString('ENVIO','CStat',''));
    {5} Lista.add(ArqINI.ReadString('ENVIO','Xmotivo',''));
    {6} Lista.add(ArqINI.ReadString('ENVIO','CUF',''));
    {7} Lista.add(ArqIni.ReadString('ENVIO','NRec',''));
    {8} Lista.add(ArqIni.ReadString('ENVIO','DhRecbto',''));
    {9} Lista.add(ArqIni.ReadString('ENVIO','TMed',''));
    {10} Lista.add(ArqIni.ReadString('ENVIO','Msg',''));

    // RETORNO
    {11} Lista.add(ArqIni.ReadString('RETORNO','Versao',''));
    {12} Lista.add(ArqIni.ReadString('RETORNO','TpAmb',''));
    {13} Lista.add(ArqIni.ReadString('RETORNO','VerAplic',''));
    {14} Lista.add(ArqIni.ReadString('RETORNO','NRec',''));
    {15} Lista.add(ArqIni.ReadString('RETORNO','CStat',''));
    {16} Lista.add(ArqIni.ReadString('RETORNO','XMotivo',''));
    {17} Lista.add(ArqIni.ReadString('RETORNO','CUF',''));

    // NFE99
    {18} Lista.add(ArqINI.ReadString(Header_NF,'Versao',''));
    {19} Lista.add(ArqINI.ReadString(Header_NF,'TpAmb',''));
    {20} Lista.add(ArqIni.ReadString(Header_NF,'VerAplic',''));
    {21} Lista.add(ArqIni.ReadString(Header_NF,'CStat',''));
    {22} Lista.add(ArqINI.ReadString(Header_NF,'Xmotivo',''));
    {23} Lista.add(ArqINI.ReadString(Header_NF,'CUF',''));
    {24} Lista.add(ArqIni.ReadString(Header_NF,'ChNFe',''));

    {25} Lista.add(ArqINI.ReadString(Header_NF,'DhRecbto',''));
    {26} Lista.add(ArqIni.ReadString(Header_NF,'NProt',''));
    {27} Lista.add(ArqIni.ReadString(Header_NF,'DigVal',''));
    {28} Lista.add(ArqIni.ReadString(Header_NF,'Arquivo',''));

    Result := Lista;
    ArqINI.Free;

  end;

    end;
end;

function ChecaStatusArqRetorno(NomeArquivo : String) : string;

var arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
linha, linhaAux, tiporeg : string;
i,tam : integer;

begin

 AssignFile(arq, NomeArquivo);

{$I-} // desativa a diretiva de Input
  Reset(arq);
//
 {$I+} // ativa a diretiva de Input
if (IOResult <> 0)
     then Result := 'Erro na abertura do arquivo !!!'
 else begin
 // while (not eof(arq)) do
     begin readln(arq, linha);

      If pos('OK:',linha) = 1 then
         begin
            i:= pos(':',linha); tam := Length(linha);
            delete(linha, i+1, tam-i);
            Result := Linha;
         end;
      If pos('ERRO:',linha) = 1 then
         Begin
           i:= pos(':',linha); tam := Length(linha);
           delete(linha, i+1, tam-i);
           Result := linha;

         End;

     end;
    CloseFile(arq);

    end;
end;


function ImprimeDanfe() : boolean;
 var  lArq : TStringList;
 begin

  lArq := TStringList.Create;

  lArq.Text := 'NFe.ImprimeDanfe';

  lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUS.TXT');

  while not FileExists('C:\MIstralNF\TXT\SAINFESTATUS.TXT') do
  Sleep(1000);

  if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUS.TXT') = 'OK:' then
     Result :=  true  // 'OK'
  else
     Result := false; // 'INATIVO... ';

  DeleteFile('C:\MIstralNF\TXT\SAINFESTATUS.TXT');

// Marcar a Nota como Impressa
End;

function  BuscaCFOP(codigo: real; componente: TComponent ): String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    BuscaCFOP := '<CFOP não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select CFOP.DESCRICAO                 ');
      AddParam ('From   CFOP                 ');
      AddParam ('Where (CFOP='+floattostr(codigo)+')  ');
      if (not Execute) then
        BuscaCFOP := '<CFOP não cadastrada>'
      else
        BuscaCFOP := Result('DESCRICAO');
      desconect;
      Free;
    end;
  end;
end;

function  BuscaCSOSN(codigo: real; componente: TComponent ): String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    BuscaCSOSN := '<CSOSN não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select CSOSN,DESCRICAO                 ');
      AddParam ('From   CSOSN                 ');
      AddParam ('Where (CSOSN='+floattostr(codigo)+')  ');
      if (not Execute) then
        BuscaCSOSN := '<CSOSN não cadastrada>'
      else
        BuscaCSOSN := Result('DESCRICAO');
      desconect;
      Free;
    end;
  end;
end;

function  BuscaIPI(codigo: real; componente: TComponent ): String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    BuscaIPI := '<IPI não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select IPI,DESCRICAO                 ');
      AddParam ('From   CST_IPI                 ');
      AddParam ('Where (IPI='+floattostr(codigo)+')  ');
      if (not Execute) then
        BuscaIPI := '<IPI não cadastrada>'
      else
        BuscaIPI := Result('DESCRICAO');
      desconect;
      Free;
    end;
  end;
end;

function  BuscaPIS(codigo: real; componente: TComponent ): String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    BuscaPIS := '<PIS não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select PIS,DESCRICAO                 ');
      AddParam ('From   CST_PIS                 ');
      AddParam ('Where (PIS='+floattostr(codigo)+')  ');
      if (not Execute) then
        BuscaPIS := '<IPI não cadastrada>'
      else
        BuscaPIS := Result('DESCRICAO');
      desconect;
      Free;
    end;
  end;
end;

function  BuscaCOFINS(codigo: real; componente: TComponent ): String;
var
  clAux: TClassAuxiliar;
begin
  if (codigo=-1) then
    BuscaCOFINS := '<COFINS não cadastrada>'
  else
  begin
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      Conect   ('VENDAS',componente);
      AddParam ('Select COFINS,DESCRICAO                 ');
      AddParam ('From   CST_COFINS                 ');
      AddParam ('Where (COFINS='+floattostr(codigo)+')  ');
      if (not Execute) then
        BuscaCOFINS := '<COFINS não cadastrada>'
      else
        BuscaCOFINS := Result('DESCRICAO');
      desconect;
      Free;
    end;
  end;
end;

Function Explode(Texto, Separador : String) : TStrings;
var
    strItem       : String; 
    ListaAuxUTILS : TStrings; 
    NumCaracteres, 
    TamanhoSeparador, 
    I : Integer; 
Begin 
    ListaAuxUTILS    := TStringList.Create; 
    strItem          := ''; 
    NumCaracteres    := Length(Texto); 
    TamanhoSeparador := Length(Separador); 
    I                := 1; 
    While I <= NumCaracteres Do 
      Begin 
        If (Copy(Texto,I,TamanhoSeparador) = Separador) or (I = NumCaracteres) Then 
          Begin 
            if (I = NumCaracteres) then strItem := strItem + Texto[I]; 
            ListaAuxUTILS.Add(trim(strItem)); 
            strItem := ''; 
            I := I + (TamanhoSeparador-1); 
          end 
        Else 
            strItem := strItem + Texto[I]; 

        I := I + 1; 
      End; 
    Explode := ListaAuxUTILS;

end;

procedure ChamandoF8CFOP (y_edit: TObject; cadastro: Boolean);
begin
  with (frm_F8CFOP) do
  begin
    left:=50;
    top :=82;
    edit:=y_edit;
    showmodal;
  end;
end;




end.
