{Unit que guarda algumas funcoes de uso geral pelo sistema }
unit funcoes1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, dbTables, gauges, DB,funcoesglobais;

type
  TLogExpImp       = record
    ImpExp          : String;
    Data            : TDateTime;
    Inicio          : TdateTime;
    Fim             : TdateTime;
    Tabela          : String;
    LojaOrg         : Real;
    LojaDest        : Real;
    Sucesso         : String;
    Parcial         : String;
    Usuario         : String;
    Reg             : Real;
    RegNew          : Real;
  end;


procedure habilitaEdit          (sender: TObject);
procedure desabilitaEdit        (sender: TObject);
procedure habilitaEditCinza     (sender: TObject);
procedure desabilitaEditCinza   (sender: TObject);
procedure habilitaEditRelat     (sender: TObject);
procedure desabilitaEditRelat   (sender: TObject);
procedure habilitaEditVerde   (sender: TObject);
procedure desabilitaEditVerde   (sender: TObject);
procedure habilitaEditAzul   (sender: TObject);
procedure desabilitaEditAzul   (sender: TObject);
function  PodeSetFocus          (sender: TObject):Boolean;
function  IsDate                (param:  String):Boolean;
function  IsCpf                 (str:  String):Boolean;
function  IsCgc                 (cgc:  String):Boolean;
procedure FormatarEditNumerico  (objeto: TObject);
procedure FormatarZerosDecimais (objeto: TObject);
procedure PosicionaFormLDireito (formulario: TForm);
function  ExibeCPF              (numero: String):String;
function  ExibeCGC              (numero: String):String;
function  DevolveCpfFormatado   (cpf: String):String;
function  FormataCNPJ           (cnpj: String):String;
function  BuscaImpressoraPadrao :String;
function  AcrescentaAno2000     (data,ano: String):String;
procedure EsvaziarTabela        (tabela: TTable);
function  CriticaCNPJ           (edit: TMaskEdit):Boolean;
function  VerDiretorioWindows   :String;
function  OperacaoPermitida     (codigousuario,codigomodulo: Integer; tipo: String):Boolean;
function Criptografar (palavra: String):String;
function Descriptografar (palavra: String):String;
function CodificarEmpresa (empresa: String):Integer;
function FormataDataVendas (data: TDateTime):String;
function FormataData (data: TDateTime):String;
procedure RefreshObjeto(formulario: TWinControl);
procedure CriaTabela(local,nome: String; tipo: TTableType;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList; qtdecampos: Integer);
function InverteStringDataVendas(datastring: String):String;
function InverteStringData(datastring: String):String;
function DeterminaFormatoAceitavelDeData_VENDAS:Integer;
function DeterminaFormatoAceitavelDeData_CREDITO:Integer;
procedure LogExportacao(FLogExportacao:TLogExpImp;grava:Boolean=false);
function DevolvePrecoItem(loja: Real; grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;

function ConverteBinarioDecimal(str: String):Integer;
function ConverteDecimalBinario(num: Integer):String;
function CalculaChaveSecreta (posicao_letra: Integer; empresa: String; Month,Year: Word; flag: Boolean):String;
function SomaDigitos(dig: String):String;

implementation

uses principal, funcoes2, unDialogo, DM3, auxiliar;

{habilita os edits - a cor branca e nao o read-only ***}
procedure habilitaEdit   (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clWhite;
    TEdit     (sender).readonly := false;
    TEdit     (sender).enabled  := true;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clWhite;
    TMaskEdit (sender).readonly := false;
    TMaskEdit (sender).enabled  := true;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clWhite;
    TComboBox (sender).enabled  := true;
  end;
end;

procedure habilitaEditCinza   (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clWhite;
    TEdit     (sender).readonly := false;
    TEdit     (sender).enabled  := true;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clWhite;
    TMaskEdit (sender).readonly := false;
    TMaskEdit (sender).enabled  := true;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clWhite;
    TComboBox (sender).enabled  := true;
  end;
end;

{habilita os edits - a cor branca e nao o read-only ***}
procedure habilitaEditRelat   (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clWhite;
    TEdit     (sender).readonly := false;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clWhite;
    TMaskEdit (sender).readonly := false;
  end;
  if (sender is TComboBox) then
    TComboBox (sender).color    := clWhite;
end;

{faz o contrario da funcao anterior}
procedure desabilitaEdit (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clTeal;
    TEdit     (sender).readonly := true;
    TEdit     (sender).enabled  := false;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clTeal;
    TMaskEdit (sender).readonly := true;
    TMaskEdit (sender).enabled  := false;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clTeal;
    TComboBox (sender).enabled  := false;
  end;
end;

procedure desabilitaEditCinza (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clSilver;
    TEdit     (sender).readonly := true;
    TEdit     (sender).enabled  := false;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clSilver;
    TMaskEdit (sender).readonly := true;
    TMaskEdit (sender).enabled  := false;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clSilver;
    TComboBox (sender).enabled  := false;
  end;
end;

{faz o contrario da funcao anterior}
procedure desabilitaEditRelat (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clBtnFace;
    TEdit     (sender).readonly := true;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clBtnFace;
    TMaskEdit (sender).readonly := true;
  end;
  if (sender is TComboBox) then
    TComboBox (sender).color    := clBtnFace;
end;

{Converte Decimal em Binario para chave do sistema}
function ConverteDecimalBinario(num: Integer):String;
var
  pos: Integer;
  base,resto: Integer;
  sBinario: String;
begin
     //ate o numero '255'
  base:=num;
  sBinario:='';
  pos := 1;
  while (pos<=8) and (base>1) do
  begin
    resto    := base mod 2;
    base     := base div 2;
    pos      := pos + 1;
    sBinario := inttostr(resto) + sBinario;
  end;
  sBinario   := inttostr(base) + sBinario;
  while (length(sBinario)<8) do
    sBinario := '0' + sBinario;
  result := sBinario;
end;

{Converte binario em Decimal para chave do sistema}
function ConverteBinarioDecimal(str: String):Integer;
var
  sBinario: String;
  vOrdemBits: array [1..8] of Integer;
  pos,valor: Integer;
begin
  vOrdemBits[1] := 128;
  vOrdemBits[2] := 64;
  vOrdemBits[3] := 32;
  vOrdemBits[4] := 16;
  vOrdemBits[5] := 8;
  vOrdemBits[6] := 4;
  vOrdemBits[7] := 2;
  vOrdemBits[8] := 1;

     //numeros ate 255
  valor := 0;
  pos := 1;
  sBinario := str;
  while (pos<=8) do
  begin
    if (sBinario[pos]='1') then
      valor := valor + vOrdemBits[pos];
    pos := pos + 1;
  end;
  result := valor;
end;

function CalculaChaveSecreta (posicao_letra: Integer; empresa: String; Month,Year: Word; flag: Boolean):String;
var
  nome_codigo_empresa,nome_sec: String;
  meses: array[1..12] of String[3];
  chave_secreta: String;
  indpos,cont: Integer;
  numpart,numero_letra_sec: Integer;
  letra_sec: Char;
  sNumpart: String;
  Day: Word;
begin
  meses[1]  := 'N';
  meses[2]  := 'E';
  meses[3]  := 'A';
  meses[4]  := 'B';
  meses[5]  := 'I';
  meses[6]  := 'U';
  meses[7]  := 'L';
  meses[8]  := 'G';
  meses[9]  := 'T';
  meses[10] := 'O';
  meses[11] := 'V';
  meses[12] := 'Z';

    //definindo o nome codigo da EMPRESA
  if (Pos('KIK',UpperCase(empresa))>0) then
    nome_codigo_empresa:='KIK'
  else if (Pos('SILHUETA',UpperCase(empresa))>0) then
    nome_codigo_empresa:='SILH'
  else if (Pos('CALCADOS & CIA',UpperCase(empresa))>0) or
          (Pos('CAL�ADOS & CIA',UpperCase(empresa))>0) or
          (Pos('GILTEX',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa:='CALC'
  else if (Pos('TEREZINHA',UpperCase(empresa))>0) then
    nome_codigo_empresa:='TERE'
  else if (Pos('EMPRESA TESTE',UpperCase(empresa))>0) then
    nome_codigo_empresa:='TEST'
  else if (Pos('GIZA',UpperCase(empresa))>0) then
    nome_codigo_empresa:='GIZA'
  else if (Pos('GUTH',UpperCase(empresa))>0) then
    nome_codigo_empresa:='GUTH'
  else if (Pos('DANTAS',UpperCase(empresa))>0) then
    nome_codigo_empresa:='DANT'
  else if (Pos('VOX POPULI',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa:='VOX'
  else if (Pos('AGM',UpperCase(empresa))>0) then
    nome_codigo_empresa:='AGMR'
  else if (Pos('VARADERO MODAS LTDA',UpperCase(empresa))>0) or
          (Pos('VARADERO MODAS LTDA.',UpperCase(empresa))>0) then
    nome_codigo_empresa:='VARA'
  else if (Pos('GILEADE',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa:='GILE'
  else if (Pos('MAROMBA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa:='MARO'
  else if (Pos('ACUPUNTURA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'ACUP'
  else if (Pos('SHOWA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'SHOW'
  else if (Pos('MARINA MORENA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'MARI'
  else if (Pos('CASA OLIVEIRA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'CASA'
  else if (Pos('TRIJOB',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'TRIJ'
  else if (Pos('GILSON MARTINS',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'GILS'
  else if (Pos('PETIT BALLET',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'PETI'
  else if (Pos('QUALI OTICA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'QUAL'
  else if (Pos('BIA CALCADOS',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'BIAC'
  else if (Pos('GENTE PEQUENA',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'GENT'
  else if (Pos('ANDRE SCALERCIO',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'ANDR'
  else if (Pos('AGITO DOS PES',UpperCase(frm_principal.x_empresa))>0) then
    nome_codigo_empresa := 'AGIT'
  else if ( (Pos('G&L',UpperCase(frm_principal.x_empresa))>0) ) or ((Pos('GEL',UpperCase(frm_principal.x_empresa))>0)) then
    nome_codigo_empresa := 'G&L';


  nome_codigo_empresa := nome_codigo_empresa + meses[Month] + Copy(form_nz(Year,4),3,2); //GERA 08 CARACTERES

    //calculando o nome secreto de liberacao, dependera do mes
    //OBS: esta etapa permite que os valores para 'chave-secreta' variem bastante dentro de um m�s
    //**********************************************************************************************
  if (Month=1)       then
    nome_sec := 'ABCD'
  else if (Month=2)  then
    nome_sec := 'EFGH'
  else if (Month=3)  then
    nome_sec := 'IJLM'
  else if (Month=4)  then
    nome_sec := 'NOPQ'
  else if (Month=5)  then
    nome_sec := 'RSTU'
  else if (Month=6)  then
    nome_sec := 'VXWZ'
  else if (Month=7)  then
    nome_sec := 'abcd'
  else if (Month=8)  then
    nome_sec := 'efgh'
  else if (Month=9)  then
    nome_sec := 'ijlm'
  else if (Month=10) then
    nome_sec := 'nopq'
  else if (Month=11) then
    nome_sec := 'rstu'
  else if (Month=12) then
    nome_sec := 'vxwz';

    //**********************************************************************************************
    //pegando a posicao da letra dentro de 'nome_sec'
  indpos := 1;
  cont   := 1;
  while (cont<=(posicao_letra+strtoint(Copy(form_nz(Year,4),3,2)))) do
  begin
    indpos:=indpos+1;
    cont:=cont+1;
    if (indpos>length(trim(nome_sec))) then
      indpos:=1;
  end;
  letra_sec        := nome_sec[indpos];
  numero_letra_sec := Ord(letra_sec);

    //calculando a CHAVE SECRETA DE LIBERACAO
    //**********************************************************************************************
  chave_secreta:='';
  indpos:=1;
  while (indpos<=6) do //06 digitos
  begin
    numpart       := numero_letra_sec + Ord(nome_codigo_empresa [indpos]);
    if (flag) then
      chave_secreta := chave_secreta + ' ' + form_nz(numpart,3)
    else
    begin
      sNumpart      := inttostr(numpart);
      chave_secreta := chave_secreta + SomaDigitos(Copy(sNumpart,Length(sNumpart),1));
    end;
    indpos        := indpos + 1;
  end;

  result := chave_secreta;
end;

function SomaDigitos(dig: String):String;
var
  sNum: String;
  i,num: Integer;
begin
  i:=1;
  num:=0;
  while (i<=Length(dig)) do
  begin
    num:=num+strtoint(dig[i]);
    i:=i+1;
  end;
  sNum   := inttostr(num);
  result := Copy(sNum,Length(sNum),1);
end;

{Verifica se pode chamar o metodo setfocus para o componente}
function  PodeSetFocus   (sender: TObject):Boolean;
begin
  if (sender is TEdit) then
    if (TEdit(sender).color=clWhite) then
      result:=true
    else
      result:=false;
  if (sender is TMaskEdit) then
    if (TMaskEdit(sender).color=clWhite) then
      result:=true
    else
      result:=false;
  if (sender is TComboBox) then
    if (TComboBox(sender).color=clBtnFace) then
      result:=true
    else
      result:=false;
end;

{funcao que verifica se o texto fornecido � uma data v�lida ***} 
function  IsDate (param:  String):Boolean;
var
  data: Tdatetime;
begin
  try
    data   := strtodate(param);
    result := true;
  except
    result := false;
  end;
end;

{Procedimento que cuida da formatacao do numero em edits e maskedits ***}
{Este proc. deve estar no evento ONKEYUP dos objetos edit e maskedti que guardam}
{informacoes numericas}
procedure FormatarEditNumerico (objeto: TObject);
var
  numero: String;
  ind,tam: Integer;
begin
     {Para objeto Edit}
  if (objeto is TEdit) then
    with TEdit(objeto) do
      if Trim(text)<>'' then
      begin
        numero:=text;
        tam:=Length(text);
        if (numero[tam]='.') then
        begin
          if Pos(',',numero)=0 then
          begin
            if (tam=1) then
            begin
              numero[tam]:=' ';
              text:=Trim(numero);
              selstart:=tam;
            end
            else
            begin
              numero[tam]:=',';
              text:=Trim(numero);
              selstart:=tam;
            end;
          end
          else
          begin
            numero[tam]:=' ';
            text:=Trim(numero);
            selstart:=tam;
          end;
        end
        else
        if (numero[tam]<>'1') and (numero[tam]<>'2') and
          (numero[tam]<>'3') and (numero[tam]<>'4') and
          (numero[tam]<>'5') and (numero[tam]<>'6') and
          (numero[tam]<>'7') and (numero[tam]<>'8') and
          (numero[tam]<>'9') and (numero[tam]<>'0') and
          (numero[tam]<>',')
        then
        begin
          numero[tam]:=' ';
          text:=Trim(numero);
          selstart:=tam;
        end
        else
        if (Pos(',',numero)<>0) then
        begin
          if (Length(Copy(numero,Pos(',',numero)+1,tam-Pos(',',numero)))>2) then
          begin
            numero[tam]:=' ';
            text:=Trim(numero);
            selstart:=tam;
          end;
        end
        else
        if (tam=2) and (numero[tam-1]='0') then
        begin
          numero[tam]:=' ';
          text:=Trim(numero);
          selstart:=tam;
        end;
      end;

     {Para objeto Maskedit}
  if (objeto is TMaskEdit) then
    with TMaskEdit(objeto) do
      if Trim(text)<>'' then
      begin
        numero:=text;
        tam:=Length(text);
        if (numero[tam]='.') then
        begin
          if Pos(',',numero)=0 then
          begin
            if (tam=1) then
            begin
              numero[tam]:=' ';
              text:=Trim(numero);
              selstart:=tam;
            end
            else
            begin
              numero[tam]:=',';
              text:=Trim(numero);
              selstart:=tam;
            end;
          end
          else
          begin
            numero[tam]:=' ';
            text:=Trim(numero);
            selstart:=tam;
          end;
        end
        else
        if (numero[tam]<>'1') and (numero[tam]<>'2') and
          (numero[tam]<>'3') and (numero[tam]<>'4') and
          (numero[tam]<>'5') and (numero[tam]<>'6') and
          (numero[tam]<>'7') and (numero[tam]<>'8') and
          (numero[tam]<>'9') and (numero[tam]<>'0') and
          (numero[tam]<>',')
        then
        begin
          numero[tam]:=' ';
          text:=Trim(numero);
          selstart:=tam;
        end
        else
        if (Pos(',',numero)<>0) then
        begin
          if (Length(Copy(numero,Pos(',',numero)+1,tam-Pos(',',numero)))>2) then
          begin
            numero[tam]:=' ';
            text:=Trim(numero);
            selstart:=tam;
          end
          else
          begin
            if (numero[tam]=',') and (Pos(',',numero)<tam) then
            begin
              numero[tam]:=' ';
              text:=Trim(numero);
              selstart:=tam;
            end;
          end;
        end
        else
        if (tam=2) and (numero[tam-1]='0') then
        begin
          numero[tam]:=' ';
          text:=Trim(numero);
          selstart:=tam;
        end;
      end;
end;

{Este procedimento verifica se o usuario colocou em Edit ou maskedit
 alguma das strings consideradas nulas pelo sistema }
{Ele deve ser colocado para se executado dentro do evento ONEXIT}
procedure FormatarZerosDecimais (objeto: TObject);
begin
     {Para edit}
  if (objeto is TEdit) then
    with TEdit(objeto) do
    begin
      text:=Trim(text);
      if (text='') or (text='0,') or (text='0,0') or
        (text='0,00') or (text=',00') or (text=',0') or
        (text='0')
      then
        text:='0,00'
      else
      if Pos(',',text)=0 then
        text:=text+',00'
      else
      if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=1) then
        text:=text+'0'
      else
      if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=0) then
        text:=text+'00';
    end;

     {Para Maskedit}
  if (objeto is TMaskEdit) then
    with TEdit(objeto) do
    begin
      text:=Trim(text);
      if (text='') or (text='0,') or (text='0,0') or
        (text='0,00') or (text=',00') or (text=',0') or
        (text='0')
      then
        text:='0,00'
      else
      if Pos(',',text)=0 then
        text:=text+',00'
      else
      if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=1) then
        text:=text+'0'
      else
      if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=0) then
        text:=text+'00';
    end;
end;

{Procedimento que posiciona um formulario no lado direito}
procedure PosicionaFormLDireito (formulario: TForm);
begin
  with (formulario) do
  begin
    left   := 190;
    top    := 0;
    width  := 610;
    height := 553;
  end;
end;

{Funcao que verifica o CPF escrito em um edit,maskedit}
{A mascara deve ser: "999\.999\.999\-99;0; "}
{� colocada no evento ONEXIT do maskedit}
function  IsCpf (str:  String):Boolean;
var
  tam,dgg,sdg: Integer;
  x1,x2,x3,x4,x5,x6,x7,x8,x9: Integer;
  xx,dd,k1,rr,d1,digito1: Integer;
  y1,y2,y3,y4,y5,y6,y7,y8,y9,y10: Integer;
  yy,tt,k2,ss,d2,digito2: Integer;
begin
  tam:=Length(str);
  if (tam<>11) then
    IsCpf:=false
  else
  begin
    sdg:=strtoint(str[tam-1])+strtoint(str[tam]);
    x1 :=10*strtoint(str[1]);
    x2 := 9*strtoint(str[2]);
    x3 := 8*strtoint(str[3]);
    x4 := 7*strtoint(str[4]);
    x5 := 6*strtoint(str[5]);
    x6 := 5*strtoint(str[6]);
    x7 := 4*strtoint(str[7]);
    x8 := 3*strtoint(str[8]);
    x9 := 2*strtoint(str[9]);
    xx := (x1+x2+x3+x4+x5+x6+x7+x8+x9);
    dd := Trunc(xx/11);
    k1 := dd*11;
    rr := xx - k1;
    d1 := 11 - rr;
    if (d1>9) then
      digito1:=0
    else
      digito1:=d1;
    y1 :=11*strtoint(str[1]);
    y2 :=10*strtoint(str[2]);
    y3 := 9*strtoint(str[3]);
    y4 := 8*strtoint(str[4]);
    y5 := 7*strtoint(str[5]);
    y6 := 6*strtoint(str[6]);
    y7 := 5*strtoint(str[7]);
    y8 := 4*strtoint(str[8]);
    y9 := 3*strtoint(str[9]);
    y10:= 2*strtoint(str[10]);
    yy := (y1+y2+y3+y4+y5+y6+y7+y8+y9+y10);
    tt := Trunc(yy/11);
    k2 := tt*11;
    ss := yy - k2;
    d2 := 11 - ss;
    if (d2>9) then
      digito2:=0
    else
      digito2:=d2;
    dgg:=digito1+digito2;
    if (dgg=sdg) then
      IsCpf:=true
    else
      IsCpf:=false;
  end;
end;

{Funcao que verifica o CGC escrito em um edit,maskedit}
{A mascara deve ser: "!99\.999\.999\\9999\-99;0; "}
{� colocada no evento ONEXIT do maskedit}
function  IsCgc (cgc:  String):Boolean;
var
  xx,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,yy,dd,tt,rr,d1,d2,ss,dg1,dg2,k1,k2: Integer;
  y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13: Integer;
  sdg,dgg: String;
begin
  if (Length(Trim(cgc))<>14) then
    IsCgc:=false
  else
  begin
    sdg := Copy(cgc,13,1)+Copy(cgc,14,1);
    x1  := StrtoInt(Copy(cgc,1,1))*5;
    x2  := StrToInt(Copy(cgc,2,1))*4;
    x3  := StrToInt(Copy(cgc,3,1))*3;
    x4  := StrToInt(Copy(cgc,4,1))*2;
    x5  := StrToInt(Copy(cgc,5,1))*9;
    x6  := StrToInt(Copy(cgc,6,1))*8;
    x7  := StrToInt(Copy(cgc,7,1))*7;
    x8  := StrToInt(Copy(cgc,8,1))*6;
    x9  := StrToInt(Copy(cgc,9,1))*5;
    x10 := StrToInt(Copy(cgc,10,1))*4;
    x11 := StrToInt(Copy(cgc,11,1))*3;
    x12 := StrToInt(Copy(cgc,12,1))*2;
    xx  := x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12;
    dd  := Trunc(xx/11);
    k1  := dd*11;
    rr  := xx-k1;
    d1  := 11-rr;
    if (d1>9) then
      dg1:=0
    else
      dg1:=d1;
    y1  := StrToInt(Copy(cgc,1,1))*6;
    y2  := StrToInt(Copy(cgc,2,1))*5;
    y3  := StrToInt(Copy(cgc,3,1))*4;
    y4  := StrToInt(Copy(cgc,4,1))*3;
    y5  := StrToInt(Copy(cgc,5,1))*2;
    y6  := StrToInt(Copy(cgc,6,1))*9;
    y7  := StrToInt(Copy(cgc,7,1))*8;
    y8  := StrToInt(Copy(cgc,8,1))*7;
    y9  := StrToInt(Copy(cgc,9,1))*6;
    y10 := StrToInt(Copy(cgc,10,1))*5;
    y11 := StrToInt(Copy(cgc,11,1))*4;
    y12 := StrToInt(Copy(cgc,12,1))*3;
    y13 := StrToInt(Copy(cgc,13,1))*2;
    yy  := y1+y2+y3+y4+y5+y6+y7+y8+y9+y10+y11+y12+y13;
    tt  := Trunc(yy/11);
    k2  := tt*11;
    ss  := yy-k2;
    d2  := 11-ss;
    if (d2>9) then
      dg2:=0
    else
      dg2:=d2;
    dgg := inttostr(dg1) + inttostr(dg2);
    if (dgg=sdg) then
      IsCgc:=true
    else
      IsCgc:=false;
  end;
end;

{Funcao que retorna a impressora padrao no momento ***}
{Todo o tratamento de excecao � feito}
function  BuscaImpressoraPadrao :String;
begin
  try
    BuscaImpressoraPadrao:=printer.printers[printer.printerindex];
  except
  end;
end;

{Funcao de exibicao do CPF}
function ExibeCPF (numero: String):String;
begin
  try
    numero:=form_t(numero,11);
    numero:=Copy(numero,1,3)+'.'+Copy(numero,4,3)+'.'+Copy(numero,7,3)+'-'+
      Copy(numero,10,2);
    ExibeCPF:=numero;
  except
  end;
end;

{Funcao de exibicao do CPF}
function ExibeCGC (numero: String):String;
begin
  try
    numero:=form_t(numero,14);
    numero:=Copy(numero,1,2)+'.'+Copy(numero,3,3)+'.'+Copy(numero,6,3)+'/'+
      Copy(numero,9,4)+'-'+Copy(numero,13,2);
    ExibeCGC:=numero;
  except
  end;
end;

{Funcao que acrescenta os dois primeiros digitos do ano ***}
function  AcrescentaAno2000     (data,ano: String):String;
begin
  Result := Copy (data,1,6) + ano + Copy(data,9,2);
end;

{Funcao de criptografia simples ***}
{A chave utilizada e o caractere Chr(30)}
function Criptografar (palavra: String):String;
var
  i: Integer;
  caractere: Char;
  novapalavra: String;
begin
  novapalavra:='';
  palavra:=Trim(palavra);
  i:=1;
  while (i<=Length(palavra)) do
  begin
    caractere := Chr(Ord(palavra[i])+30);
    novapalavra := novapalavra + caractere;
    i:=i+1;
  end;
  result:=novapalavra;
end;

{Funcao de retorno do valor criptografado ***}
{A chave utilizada e o caractere Chr(30)}
function Descriptografar (palavra: String):String;
var
  i: Integer;
  caractere: Char;
  novapalavra: String;
begin
  novapalavra:='';
  palavra:=Trim(palavra);
  i:=1;
  while (i<=Length(palavra)) do
  begin
    caractere := Chr(Ord(palavra[i])-30);
    novapalavra := novapalavra + caractere;
    i:=i+1;
  end;
  result:=novapalavra;
end;

{Funcao que codifica o nome da empresa ****}
function CodificarEmpresa (empresa: String):Integer;
var
  comeco,meio,fim: Char;
  res: Integer;
begin
  empresa := Trim(empresa);
  if (empresa<>'') then
  begin
    comeco  := empresa[1];
    meio    := empresa[Round(Length(empresa)/2)];
    fim     := empresa[Length(empresa)];
    res     := Round((Ord(comeco)+Ord(meio)+Ord(fim))/3);
    result  := res;
  end
  else
    result := -1;
end;

procedure EsvaziarTabela (tabela: TTable);
begin
  if (not tabela.active) then
    tabela.open;
  tabela.first;
  while (not tabela.IsEmpty) do
    tabela.delete;
end;

{Funcao de formatacao da data de acordo com o }
{banco de dados escolhido para uso no sistema ***}
function FormataDataVendas (data: TDateTime):String;
begin
  if (frm_principal.x_formato_data_local=KFD_DIA_MES_ANO) then
    result:=FormatDateTime('dd/mm/yyyy',data)
  else
  if (frm_principal.x_formato_data_local=KFD_MES_DIA_ANO) then
    result:=FormatDateTime('mm/dd/yyyy',data);
end;

{Funcao de formatacao da data de acordo com o }
{banco de dados escolhido para uso no sistema ***}
function FormataData (data: TDateTime):String;
begin
  if (frm_principal.x_formato_data_local_crediario=KFD_DIA_MES_ANO) then
    result:=FormatDateTime('dd/mm/yyyy',data)
  else
  if (frm_principal.x_formato_data_local_crediario=KFD_MES_DIA_ANO) then
    result:=FormatDateTime('mm/dd/yyyy',data);
end;

{Funcao que devolve o CPF formatado, considerando todas as possiveis formas}
{em que ele se encontra armazenado no campo das tabelas ****}
function  DevolveCpfFormatado   (cpf: String):String;
var
  x: Real;
begin
  cpf:=Trim(cpf);
  if (Trim(cpf)<>'') then
  begin
    x:=strtofloat(cpf);
    if (x=0) then
      DevolveCpfFormatado:='' {nulo ''}
    else
    begin
      if (Length(cpf)=11) then
        DevolveCpfFormatado:=cpf {cpf}
      else
      if (Copy(cpf,1,3)='000') then
      begin
        cpf := Copy(cpf,4,11);
        DevolveCpfFormatado:=cpf; {cpf}
      end
      else
        DevolveCpfFormatado:=cpf{cnpj};
    end;
  end
  else
    DevolveCpfFormatado:='' {nulo ''}
end;

{Formatacao condiciona do CPf/CGC ***}
function  FormataCNPJ (cnpj: String):String;
begin
  if (Length(cnpj)=11) then
    FormataCNPJ := ExibeCpf (cnpj)
  else
  if (cnpj='') then
    FormataCNPJ:=''
  else
    FormataCNPJ:=ExibeCgc(cnpj);
end;

function  VerDiretorioWindows   :String;
var
  cam: Pchar;
  caminho: String;
  ind: Integer;
begin
  cam := StrAlloc(MAX_PATH);
  GetWindowsDirectory (cam,MAX_PATH);
  ind := 0;
  caminho:='';
  while (ind<strLen(cam)) do
  begin
    caminho := caminho + cam[ind];
    ind:=ind+1;
  end;
  StrDispose(cam);
  result:=caminho;
end;

{faz o contrario da funcao anterior - cor verde}
procedure desabilitaEditVerde (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clTeal;
    TEdit     (sender).readonly := true;
    TEdit     (sender).font.color := clTeal;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clTeal;
    TMaskEdit (sender).readonly := true;
    TMaskEdit (sender).font.color := clTeal;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clTeal;
    TComboBox (sender).font.color := clTeal;
  end;
end;

{habilita os edits - a cor verde e nao o read-only ***}
procedure habilitaEditVerde   (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clWhite;
    TEdit     (sender).readonly := false;
    TEdit     (sender).font.color := clBlack;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clWhite;
    TMaskEdit (sender).readonly := false;
    TMaskEdit (sender).font.color := clBlack;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clWhite;
    TComboBox (sender).font.color := clBlack;
  end;
end;

{faz o contrario da funcao anterior - cor verde}
procedure desabilitaEditAzul (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clNavy;
    TEdit     (sender).readonly := true;
    TEdit     (sender).font.color := clNavy;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clNavy;
    TMaskEdit (sender).readonly := true;
    TMaskEdit (sender).font.color := clNavy;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clNavy;
    TComboBox (sender).font.color := clNavy;
  end;
end;

{habilita os edits - a cor verde e nao o read-only ***}
procedure habilitaEditAzul   (sender: TObject);
begin
  if (sender is TEdit) then
  begin
    TEdit     (sender).color    := clWhite;
    TEdit     (sender).readonly := false;
    TEdit     (sender).font.color := clBlack;
  end;
  if (sender is TMaskEdit) then
  begin
    TMaskEdit (sender).color    := clWhite;
    TMaskEdit (sender).readonly := false;
    TMaskEdit (sender).font.color := clBlack;
  end;
  if (sender is TComboBox) then
  begin
    TComboBox (sender).color    := clWhite;
    TComboBox (sender).font.color := clBlack;
  end;
end;

{Funcao que critica edits de CPF,CGC ***}
function  CriticaCNPJ (edit: TMaskEdit):Boolean;
var
  cpf: String;
begin
     {...}
  CriticaCNPJ := true;
  if (frm_principal.x_critica_cnpj) then
  begin
    cpf := Trim(edit.text);
    if (cpf<>'') then
      if (length(cpf)<=11) then
      begin
        if (not IsCPf(cpf)) then
        begin
          CriticaCNPJ := false;
          frmDialogo.ExibirMensagem (' CPF inv�lido! '
            ,'CPF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edit.setfocus;
        end;
      end
      else
      if (not IsCgc(cpf)) then
      begin
        CriticaCNPJ := false;
        frmDialogo.ExibirMensagem (' CNPJ inv�lido! '
          ,'CNPJ',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edit.setfocus;
      end;
  end;
end;

{Verifica se � permitido uma acao pelo usuario - se ele tem permissao ***}
function  OperacaoPermitida (codigousuario,codigomodulo: Integer; tipo: String):Boolean;
begin
     {Controle de permissao a nivel de usu�rio - Padr�o}
  if (frm_principal.x_nivel_permissao=0) then
  begin
    with (DMperm.qVerificaPerm) do
    begin
      sql.clear;
      sql.add('Select PERUSER,PERMODULE,PERTYPE ');
      sql.add('From PERMS ');
      sql.add('Where (PERUSER='+inttostr(codigousuario)+') AND ');
      sql.add('      (PERMODULE='+inttostr(codigomodulo)+') AND ');
      sql.add('      (PERTYPE='+chr(39)+tipo+chr(39)+') ');
      open;
      if (recordcount=0) then
        OperacaoPermitida:=false
      else
        OperacaoPermitida:=true;
      close;
    end
  end
  else {Controle de permissao a nivel de grupo de usu�rio}
    with (DMperm.qVerificaPerm) do
    begin
      sql.clear;
      sql.add('Select PGRGRUPO,PGRMODULE,PGRTYPE ');
      sql.add('From GRUPO_PERMS,USERS ');
      sql.add('Where (USCODE='+inttostr(codigousuario)+') AND ');
      sql.add('      (USGRUPO=PGRGRUPO) AND ');
      sql.add('      (PGRMODULE='+inttostr(codigomodulo)+') AND ');
      sql.add('      (PGRTYPE='+chr(39)+tipo+chr(39)+') ');
      open;
      if (recordcount=0) then
        OperacaoPermitida:=false
      else
        OperacaoPermitida:=true;
      close;
    end;
  frm_principal.x_codigomodulo := codigomodulo;
end;

procedure MontaEstruturaTabelaVendas(nometabela: String);
begin

end;

procedure RefreshObjeto(formulario: TWinControl);
var
  Lista: TList;
  ind: Integer;
  controle: TWinControl;
begin
  Lista:=TList.Create;
  formulario.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    controle := TWinControl(Lista.items[ind]);
    if (TWinControl(Lista.items[ind]).visible) then
      if (controle is TPanel) or (controle is TGroupBox) then
        RefreshObjeto(controle)
      else
        TWinControl(Lista.items[ind]).refresh;
    ind:=ind+1;
  end;
  Lista.Free;
end;

procedure CriaTabela(local,nome: String; tipo: TTableType;
  NomeCampos,TamanhoCampos,TipoCampos: TStringList; qtdecampos: Integer);
var
  i: Integer;
  tabela: TTable;
begin
  tabela := TTable.Create(frm_principal);
  with (tabela) do
  begin
    DatabaseName := local;
    TableName    := nome;
    TableType    := tipo;
    with (FieldDefs) do
    begin
      Clear;
      i:=0;
      while (i<qtdecampos) do
      begin
        with (AddFieldDef) do
        begin
          Name     := NomeCampos[i];
          if (TipoCampos[i]='I') then
          begin
            DataType  := ftInteger;
            Precision := 0;
          end
          else
          if (Copy(TipoCampos[i],1,1)='N') then
          begin
            DataType  := ftFloat;
            Precision := strtoint(Copy(TipoCampos[i],2,1));
          end
          else
          if (TipoCampos[i]='C') then {OK}
          begin
            DataType  := ftString;
            Size      := strtoint(TamanhoCampos[i]);
          end
          else
          if (TipoCampos[i]='D') then {OK}
            DataType  := ftDate;
          Required := false;
        end;
        i:=i+1;
      end;
    end;
    CreateTable;
  end;
  tabela.Free;
end;

{* converte uma string mm/dd/yyyy em dd/mm/yyyy *, se exigir - para o 'VENDAS'}
function InverteStringDataVendas(datastring: String):String;
var
  dia,mes,ano: String;
begin
  if (trim(datastring)<>'') then
    if (frm_principal.x_formato_data_local=KFD_MES_DIA_ANO) then
    begin
      mes := Copy(datastring,1,2);
      dia := Copy(datastring,4,2);
      ano := Copy(datastring,7,4);
      result:=dia+'/'+mes+'/'+ano;
    end
    else
    if (frm_principal.x_formato_data_local=KFD_DIA_MES_ANO) then
      result:=datastring;
end;

{* converte uma string mm/dd/yyyy em dd/mm/yyyy *, se exigir - para o 'CREDIARIO'}
function InverteStringData(datastring: String):String;
var
  dia,mes,ano: String;
begin
  if (trim(datastring)<>'') then
    if (frm_principal.x_formato_data_local_crediario=KFD_MES_DIA_ANO) then
    begin
      mes := Copy(datastring,1,2);
      dia := Copy(datastring,4,2);
      ano := Copy(datastring,7,4);
      result:=dia+'/'+mes+'/'+ano;
    end
    else
    if (frm_principal.x_formato_data_local_crediario=KFD_DIA_MES_ANO) then
      result:=datastring;
end;

function DeterminaFormatoAceitavelDeData_VENDAS:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('DROP TABLE TESTE_DATA ');
  try
    clAux.Execute;
  except
  end;

  clAux.ClearSql;
  if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
    clAux.AddParam ('CREATE TABLE TESTE_DATA (DATA TIMESTAMP) ')
  else
  if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
    clAux.AddParam ('CREATE TABLE TESTE_DATA (DATA DATETIME) ');
  try
    clAux.Execute;
  except
  end;
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO TESTE_DATA(DATA) VALUES(:data) ');
  clAux.consulta.parambyname('data').AsDateTime := strtodate('31/12/2005');
  clAux.Execute;
  clAux.ClearSql;
  clAux.AddParam ('SELECT DATA FROM TESTE_DATA WHERE (DATA='+chr(39)+'31/12/2005'+chr(39)+') '); {* DD/MM/YYYY}
  try
    clAux.Execute;
    result := KFD_DIA_MES_ANO;
  except
    clAux.ClearSql;
    clAux.AddParam ('SELECT DATA FROM TESTE_DATA WHERE (DATA='+chr(39)+'12/31/2005'+chr(39)+') '); {* MM/DD/YYYY}
    try
      clAux.Execute;
      result := KFD_MES_DIA_ANO;
    except
      showmessage ('ATEN��O: Formato de data indefinido!');
      result := KFD_NAO_DEFINIDO;
    end;
  end;
  clAux.ClearSql;
  clAux.AddParam ('DROP TABLE TESTE_DATA ');
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function DeterminaFormatoAceitavelDeData_CREDITO:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',frm_principal);

  clAux.ClearSql;
  clAux.AddParam ('DROP TABLE TESTE_DATA ');
  try
    clAux.Execute;
  except
  end;

  clAux.ClearSql;
  if (frm_principal.x_banco_de_dados_crediario=KDB_INTERBASE) then
    clAux.AddParam ('CREATE TABLE TESTE_DATA (DATA TIMESTAMP) ')
  else
  if (frm_principal.x_banco_de_dados_crediario=KDB_SQL_SERVER) then
    clAux.AddParam ('CREATE TABLE TESTE_DATA (DATA DATETIME) ');
  try
    clAux.Execute;
  except
  end;
  clAux.ClearSql;
  clAux.AddParam ('INSERT INTO TESTE_DATA(DATA) VALUES(:data) ');
  clAux.consulta.parambyname('data').AsDateTime := strtodate('31/12/2005');
  clAux.Execute;
  clAux.ClearSql;
  clAux.AddParam ('SELECT DATA FROM TESTE_DATA WHERE (DATA='+chr(39)+'31/12/2005'+chr(39)+') '); {* DD/MM/YYYY}
  try
    clAux.Execute;
    result := KFD_DIA_MES_ANO;
  except
    clAux.ClearSql;
    clAux.AddParam ('SELECT DATA FROM TESTE_DATA WHERE (DATA='+chr(39)+'12/31/2005'+chr(39)+') '); {* MM/DD/YYYY}
    try
      clAux.Execute;
      result := KFD_MES_DIA_ANO;
    except
      showmessage ('ATEN��O: Formato de data indefinido!');
      result := KFD_NAO_DEFINIDO;
    end;
  end;
  clAux.ClearSql;
  clAux.AddParam ('DROP TABLE TESTE_DATA ');
  clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

procedure LogExportacao(FLogExportacao:TLogExpImp;grava:Boolean=false);
var
  Fquery:TQuery;
begin
  FQuery := TQuery.Create(Application);
  with FQuery do
  begin
    databasename := databasecredito;
    sql.add('Insert into Imp_exp  ');
    sql.add('(Ix_LojaOrg,');
    sql.add(' Ix_LojaDest,');
    sql.add(' Ix_ImpExp,');
    sql.add(' Ix_Data,');
    sql.add(' Ix_Inicio,');
    sql.add(' Ix_Fim,');
    sql.add(' Ix_Tabela,');
    sql.add(' Ix_Usuario,');
    sql.add(' Ix_Parcial,');
    sql.add(' Ix_Reg,');
    sql.add(' Ix_RegNew,');
    sql.add(' Ix_Erro');
    sql.add(')');
    sql.add('Values(:LojaOrg');
    sql.add(',:LojaDest');
    sql.add(',:ImpExp');
    sql.add(',:Data');
    sql.add(',:Inicio');
    sql.add(',:Fim');
    sql.add(',:Tabela');
    sql.add(',:Usuario');
    sql.add(',:Parcial');
    sql.add(',:Reg');
    sql.add(',:RegNew');
    sql.add(',:Erro');
    sql.add(')');
    with FLogExportacao do
    begin
      parambyname('LojaOrg').AsFloat := LojaOrg;
      parambyname('LojaDest').AsFloat := LojaDest;
      parambyname('data').AsDateTime := Data;
      parambyname('Inicio').AsDateTime := Inicio;
      parambyname('Fim').AsDateTime := Fim;
      parambyname('Tabela').AsString := Tabela;
      parambyname('ImpExp').AsString := ImpExp;
      if (frm_principal.pnCaixaAtiva.caption=' Caixa: INDEFINIDO') then
        parambyname('Usuario').AsString := 'INDEFINIDO'
      else
        parambyname('Usuario').AsString := Trimright(Copy(frm_Principal.PnCaixaAtiva.Caption,16,Length(frm_Principal.PnCaixaAtiva.Caption)));

      parambyname('Parcial').AsString := Parcial;
      parambyname('Reg').AsFloat := Reg;
      parambyname('RegNew').AsFloat := RegNew;
      parambyname('Erro').AsString := Sucesso;
    end;
    try
      if grava then
        execsql;
    except
       //
    end;
  end;
end;


function DevolvePrecoItem(loja: Real; grupo,subgrupo,produto,cor: Real; tamanho,tipz: String):Real;
var
  clAux: TClassAuxiliar;
  continua: Boolean;
begin
     {1o nivel de procura de preco - TABELAS_PRECOS (2,3,4,...)}
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',frm_principal);
  clAux.ClearSql;
  clAux.AddParam ('Select PP_PRE1,PP_PRE2                                                                ');
  clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                            ');
  clAux.AddParam ('Where (PP_LOJA='+floattostr(loja)+') AND                                              ');
  clAux.AddParam ('      (PP_GRUP='+floattostr(grupo)+') AND                                             ');
  clAux.AddParam ('      (PP_SUBG='+floattostr(subgrupo)+') AND                                          ');
  clAux.AddParam ('      (PP_PROD='+floattostr(produto)+') AND                                           ');
  clAux.AddParam ('      (PP_CORE='+floattostr(cor)+') AND                                               ');
  clAux.AddParam ('      (PP_TAMA='+chr(39)+tamanho+chr(39)+') AND                                       ');
  clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
  clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
  clAux.AddParam ('Order by PP_DAT2                                                                      ');
  if (clAux.Execute) then
  begin
    clAux.last; {IMPORTANTE: pega sempre a ultima, caso haja mais de uma tabela}
    if (clAux.result('PP_PRE'+tipz)<>0.00) then
    begin
      result := clAux.result('PP_PRE'+tipz);
      flagDevolvePrecoItem := 2; //flag de preco promocional
      continua := false;
    end
    else
      continua := true;
  end
  else
    continua := true;

     {...}
  if (continua) then
  begin
         {2o nivel de procura de preco - TABELAS PRECOS (1) - PRECO DIFERENCIADO}
    clAux.ClearSql;
    clAux.AddParam ('Select IP_PRE1,IP_PRE2                                   ');
    clAux.AddParam ('From   ITENS_TABELAS_PRECOS                              ');
    clAux.AddParam ('Where (IP_LOJA='+floattostr(loja)+') AND                 ');
    clAux.AddParam ('      (IP_GRUP='+floattostr(grupo)+') AND                ');
    clAux.AddParam ('      (IP_SUBG='+floattostr(subgrupo)+') AND             ');
    clAux.AddParam ('      (IP_PROD='+floattostr(produto)+') AND              ');
    clAux.AddParam ('      (IP_CORE='+floattostr(cor)+') AND                  ');
    clAux.AddParam ('      (IP_TAMA='+chr(39)+tamanho+chr(39)+') AND          ');
    clAux.AddParam ('      (IP_TABE=1)                                        ');
    if (clAux.Execute) then
    begin
      if (clAux.result('IP_PRE'+tipz)<>0.00) then
      begin
        result := clAux.result('IP_PRE'+tipz);
        flagDevolvePrecoItem := 1; //flag de preco diferencial
        continua := false;
      end
      else
        continua := true;
    end
    else
      continua := true;

         {...}
    if (continua) then
    begin
             {3o nivel de procura de preco - TABELAS PRECOS (1) - PRECO PRINCIPAL}
      clAux.ClearSql;
      clAux.AddParam ('Select ES_PVE1,ES_PVE2                                   ');
      clAux.AddParam ('From   ESTOQUE                                           ');
      clAux.AddParam ('Where (ES_GRUP='+floattostr(grupo)+') AND                ');
      clAux.AddParam ('      (ES_SUBG='+floattostr(subgrupo)+') AND             ');
      clAux.AddParam ('      (ES_PROD='+floattostr(produto)+') AND              ');
      clAux.AddParam ('      (ES_CORE='+floattostr(cor)+') AND                  ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+tamanho+chr(39)+')              ');
      if (clAux.Execute) then
      begin
        result := clAux.result('ES_PVE'+tipz);
        flagDevolvePrecoItem := 0; //flag de preco principal
      end
      else
      begin
        result := 0.00;
        flagDevolvePrecoItem := -1; {*}
      end;
    end;
  end;
  clAux.desconect;
  clAux.Free;
end;

end.
