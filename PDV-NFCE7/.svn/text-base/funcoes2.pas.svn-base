unit Funcoes2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  DBTables, DB, DBCtrls, Forms, Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls,
  Printers, Mask, FileCtrl;

function codifica_senha(senha:String):String;
function inverte(s:String):String;
function sem_brancos(texto:String):String;
function Tsem_brancos(s:String):String;
function nsem_brancos(texto:String):Longint;
function form_data(data : TDateTime):String;
function form_nz(n:Real; tam:Byte):String;
function form_nz2(n:Real; tam:Byte):String;
{form_nz(987, 5)='00987'}
function form_nc(n:Real; tam:Byte):String;
{form_nc(987, 8)='  987,00'}
function form_tce(s:String; tam:Byte):String;
{form_tc('casa',10)='      casa'}
function form_nc2(n:Real; tam, dec:Byte):String;
{form_nc2(987, 8, 3)=' 987,000'}
function form_nc3(n:Real; tam:Byte; ch:Char):String;
{{form_nc3(987, 8, 'X')='XX987,00'}
function form_nc4(n:Real; tam:Byte):String;
function form_n(n:Real; tam:Byte):String;
{form_n(987, 5)='  987'}
function form_nv(n:Real; tam:Byte):String;
function form_t(s:String; tam:Byte):String;
function form_tz(c:String; tam:Byte):String;
function form_td(s:String; tam:Byte):String;
{form_t('casa', 5)='casa '}
function form_tc(s:String; tam:Byte; caracter:String):String;
{form_tc('casa', 5, '#')='casa#'}
function form_tc2(s:String; tam:Byte; caracter:String):String;
function StrFToFloat(s:String):Double;
function dec_time(Date:TDateTime; t:Byte):Word;
function DatetoStrFull(data:Tdatetime):String;
function nome_mes(no_mes:Integer):String;
function Tpos(s:String; ts:TStrings):Integer;
function mensagem_de_erro(erro:String):String;
function eleva(a,x:Real):Real;
function valor_valido(valor:String; inteira, decimal:Byte):Boolean;
function valida_dbe(dbe:Tobject; key:Char):Char;
function gera_extenso(valor:Real; ex1, ex2, ex3:Longint; var linha1,
  linha2, linha3:String):String;
function exten(valores, divisor:Longint; xvalor:Real; vescrito:String):String;
function escreve(valor:Real; vescrito:String):String;
function dec_date(Date:TDateTime; t:Byte):Word;
function year(Date:TDateTime):Word;
function month(Date:TDateTime):Word;
function day(Date:TDateTime):Word;
function DaysInMonth(Year,Month:Word):Byte;
procedure espera(msecs:Integer);
procedure mostra_mensagem(s:String);
procedure esconde_mensagem;
procedure procura_editor(formulario:TWinControl; campo:String);
function RetiraSimboloMoeda(formato: String):String;
procedure ExibeCritica (mensagem,assunto: String; edit: TObject);

{funcoes de impressao no canvas da impressora}
procedure ImpLin(col,lin: Integer;texto: String);
function RetiraFormatacaoNumero (valor: String):String;
function EliminarFormatacao(sTexto:String):String;


implementation

{**** SA_TUDO ****}
uses Principal, unMensagem, unDialogo;

var
  milhas:array [1..37] of String;
  valor1, valor2, valor3:Longint;

procedure ImpLin(col,lin: Integer;texto: String);
begin
  Printer.Canvas.Textout(col,lin,texto);
end;

function codifica_senha(senha:String):String;
{Codifica a senha do usuário}
var
  retorno:String;
  cont:Integer;
  fator:array[1..6] of Byte;
  aux:Integer;
begin
  fator[1]:=3;
  fator[2]:=5;
  fator[3]:=7;
  fator[4]:=11;
  fator[5]:=13;
  fator[6]:=17;
  retorno:=senha;
  for cont:=1 to 6 do
  begin
    aux:=ord(retorno[cont]);
    aux:=aux*fator[cont];
    aux:=aux mod 255;
    if aux mod 2 = 0 then
      aux:=aux+20;
    if aux mod 3 = 0 then
      aux:=aux+30;
    if aux mod 4 = 0 then
      aux:=aux+40;
    while aux>255 do
      aux:=ord(codifica_senha(chr(aux))[1]);
    retorno[cont]:=chr(aux);
  end;
  codifica_senha:=retorno;
end;

function inverte(s:String):String;
var
  retorno:String;
  cont:Longint;
begin
  retorno:=' ';
  for cont:=2 to length(s) do
    retorno:=retorno+' ';
  for cont:=1 to length(s) do
    retorno[(length(s)-cont)+1]:=s[cont];
  inverte:=retorno;
end;

function sem_brancos(texto:String):String;
var
  cont:Byte;
begin
  cont:=0;
  while pos(' ',texto)=1 do
    delete(texto,pos(' ',texto),1);
  sem_brancos:=texto;
end;

function Tsem_brancos(s:String):String;
var
  retorno:String;
begin
  retorno:=sem_brancos(s);
  retorno:=sem_brancos(inverte(retorno));
  retorno:=inverte(retorno);
  if (retorno='') or (length(retorno)=0) then
    retorno:='*';
  Tsem_brancos:=retorno;
end;

function nsem_brancos(texto:String):Longint;
begin
  while pos(' ',texto)<>0 do
    delete(texto,pos(' ',texto),1);
  if texto='' then
    nsem_brancos:=0
  else
    try
      nsem_brancos:=strtoint(texto);
    except
    end;
end;

function form_nz(n:Real; tam:Byte):String;
var
  formato:String;
begin
  str(n:tam:0,formato);
  formato:='00000000000000000000000000000000000000000'+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nz:=formato;
end;

function form_nz2(n:Real; tam:Byte):String;
var
  formato:String;
begin
  str(n:tam:2,formato);
  formato:='00000000000000000000000000000000000000000'+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nz2:=formato;
end;


function form_data(data : TDateTime):String;
var
  ano, mes, dia : Word;
  year : String[4];
  month, day : String[2];
begin
  DecodeDate(data, ano, mes, dia);
  year:= form_nz(ano,4);
  if mes<10 then
    month:='0'+inttostr(mes)
  else
    month:=inttostr(mes);
  if dia<10 then
    day:='0'+inttostr(dia)
  else
    day:=inttostr(dia);
  form_data:= day + '/'+ month+'/'+ year;
end;

function form_nc(n:Real; tam:Byte):String;
var
  formato:String;
begin
  formato:=floattostrF(n, ffcurrency, 15, 2);
  formato:=RetiraSimboloMoeda(formato);
  if (n<0.00) then
    formato:='-'+trim(formato);
  formato:='                                                                        '
    +'                                  '+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nc:=formato;
end;

function form_tce(s:String; tam:Byte):String;
var
  formato: String;
begin
  formato:=s;
  formato:='                                                                        '
    +'                                  '+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_tce:=formato;
end;

function form_nc2(n:Real; tam, dec:Byte):String;
var
  formato:String;
begin
  formato:=floattostrF(n, ffcurrency, 15, dec);
  formato:=RetiraSimboloMoeda(formato);
  formato:='                                                                        '
    +'                                  '+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nc2:=formato;
end;

function form_nc3(n:Real; tam:Byte; ch:Char):String;
var
  formato:String;
begin
  formato:=floattostrF(n, ffcurrency, 15, 2);
  formato:=RetiraSimboloMoeda(formato);
  formato:=form_tc(ch, 130, ch)+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nc3:=formato;
end;

function form_n(n:Real; tam:Byte):String;
var
  formato:String;
begin
  str(n:tam:0,formato);
  formato:='                                         '+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_n:=formato;
end;

function form_nv(n:Real; tam:Byte):String;
begin
  if n=int(n) then
    form_nv:=form_n(n, tam)
  else
    form_nv:=form_nc(n, tam);
end;

function form_t(s:String; tam:Byte):String;
var
  formato:String;
begin
  formato:=s+'                                            '
    +'                                                                    ';
  formato:=copy(formato, 1, tam);
  form_t:=formato;
end;

function form_td(s:String; tam:Byte):String;
var
  formato:String;
begin
  formato:='                                         '+Tsem_brancos(s);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_td:=formato;
end;

function form_tc(s:String; tam:Byte; caracter:String):String;
var
  formato:String;
  cont:Longint;
begin
  formato:=Tsem_brancos(s);
  for cont:=1 to 332 do
    formato:=formato+caracter;
  formato:=copy(formato, 1, tam);
  form_tc:=formato;
end;

function form_tc2(s:String; tam:Byte; caracter:String):String;
var
  formato:String;
  cont:Longint;
begin
  formato:=s;
  for cont:=1 to 332 do
    formato:=formato+caracter;
  formato:=copy(formato, 1, tam);
  form_tc2:=formato;
end;

function StrFToFloat(s:String):Double;
var
  cont:Integer;
  retorno:String;
begin
  retorno:='';
  for cont:=1 to length(s) do
    if (s[cont]<>'.') and (s[cont]<>' ') then
      retorno:=retorno+s[cont];
  StrFToFloat:=StrToFloat(retorno);
end;

function DatetoStrFull(data:Tdatetime):String;
var
  meses:array[1..12] of String[15];
  ano, mes, dia:Word;
begin
  meses[1]:='Janeiro';
  meses[2]:='Fevereiro';
  meses[3]:='Março';
  meses[4]:='Abril';
  meses[5]:='Maio';
  meses[6]:='Junho';
  meses[7]:='Julho';
  meses[8]:='Agosto';
  meses[9]:='Setembro';
  meses[10]:='Outubro';
  meses[11]:='Novembro';
  meses[12]:='Dezembro';
  decodedate(data, ano, mes, dia);
  DatetoStrFull:=inttostr(dia)+' de '+meses[mes]+' de '+inttostr(ano);
end;

function nome_mes(no_mes:Integer):String;
var
  meses:array[1..12] of String[15];
begin
  meses[1]:='Janeiro  ';
  meses[2]:='Fevereiro';
  meses[3]:='Março    ';
  meses[4]:='Abril    ';
  meses[5]:='Maio     ';
  meses[6]:='Junho    ';
  meses[7]:='Julho    ';
  meses[8]:='Agosto   ';
  meses[9]:='Setembro ';
  meses[10]:='Outubro ';
  meses[11]:='Novembro';
  meses[12]:='Dezembro';
  nome_mes:=meses[no_mes];
end;

function Tpos(s:String; ts:TStrings):Integer;
var
  cont:Longint;
begin
  Tpos:=-1;
  for cont:=0 to ts.count do
    if pos(s, ts[cont])>0 then
    begin
      Tpos:=cont;
      break;
    end;
end;

function mensagem_de_erro(erro:String):String;
var
  retorno, aux:String;
  cont:Longint;
begin
  retorno:=erro;
  if pos('Key violation',erro)<>0 then
    retorno:='Registro duplicado';
  if (pos('is not a valid date',erro)<>0) then
    retorno:='Data Inválida';
  retorno:=retorno+' ';
  retorno[length(retorno)]:=chr(0);
  mensagem_de_erro:=retorno;
end;

function eleva(a,x:Real):Real;
begin
  eleva:=exp(x*ln(a));
end;

function valor_valido(valor:String; inteira, decimal:Byte):Boolean;
var
  retorno:Boolean;
  vl:Real;
begin
  retorno:=true;
  try
    vl:=strtofloat(valor);
  except
    retorno:=false;
  end;
  if (length(valor)>inteira+decimal+1) and (retorno) then
    retorno:=false;
  if (pos(',', valor)<>0) and (retorno) then
  begin
    if length(copy(valor, 1, pos(',',valor)-1))>inteira then
      retorno:=false;
    if length(copy(valor, pos(',',valor)+1, length(valor)-pos(',',valor)))>decimal then
      retorno:=false;
  end
  else
  if length(valor)>inteira then
    retorno:=false;
  if valor='' then
    retorno:=false;
  valor_valido:=retorno;
end;

function valida_dbe(dbe:Tobject; key:Char):Char;
begin
  if dbe is TDBEdit then
    with dbe as tdbedit do
    begin
      if (inttostr(tag)<>'0') and (inttostr(tag)<>'') then
        if (datasource.dataset.fieldbyname(datafield).datatype=ftcurrency) or
          (datasource.dataset.fieldbyname(datafield).datatype=ftfloat) then
          if key='.' then
            key:=',';
      if (ord(key)<>8) and (ord(key)<>27) and (ord(key)<>37) and (ord(key)<>38) and (ord(key)<>39) and (ord(key)<>40) then
        if (inttostr(tag)<>'0') and (inttostr(tag)<>'') and (seltext='') then
        begin
          if hint='' then
            hint:='0';
          if not valor_valido(copy(text,1,selstart)+key+
            copy(text,selstart+1,length(text)-selstart),tag,strtoint(hint)) then
            key:=chr(0);
        end;
    end
  else
  if dbe is TEdit then
    with dbe as TEdit do
      if (ord(key)<>8) and (ord(key)<>27) and (ord(key)<>37) and (ord(key)<>38) and (ord(key)<>39) and (ord(key)<>40) then
        if (inttostr(tag)<>'0') and (inttostr(tag)<>'') and (seltext='') then
        begin
          if hint='' then
            hint:='0';
          if not valor_valido(copy(text,1,selstart)+key+copy(text,selstart+1,length(text)-selstart),tag,strtoint(hint)) then
            key:=chr(0);
        end;
  valida_dbe:=key;
end;

function dec_time(Date:TDateTime; t:Byte):Word;
var
  Agora : TDateTime;
  hora, minuto, segundo, mili : Word;
begin
  decodetime(date, hora, minuto, segundo, mili);
  case t of
    1: dec_time:= hora;
    2: dec_time:= minuto;
    3: dec_time:= segundo;
  end;
end;

function dec_date(Date:TDateTime; t:Byte):Word;
var
  v_year, v_month, v_day:Word;
begin
  decodedate(Date, v_year, v_month, v_day);
  case t of
    1:dec_date:=v_year;
    2:dec_date:=v_month;
    3:dec_date:=v_day;
  end;
end;

function year(Date:TDateTime):Word;
begin
  year:=dec_date(Date,1);
end;

function month(Date:TDateTime):Word;
begin
  month:=dec_date(Date,2);
end;

function day(Date:TDateTime):Word;
begin
  day:=dec_date(Date,3);
end;

function DaysInMonth(Year,Month:Word):Byte;
var
  n_days:array[1..12] of Byte;
begin
  n_days[1]:=31;
  if (year mod 4)=0 then
    n_days[2]:=29
  else
    n_days[2]:=28;
  n_days[3]:=31;
  n_days[4]:=30;
  n_days[5]:=31;
  n_days[6]:=30;
  n_days[7]:=31;
  n_days[8]:=31;
  n_days[9]:=30;
  n_days[10]:=31;
  n_days[11]:=30;
  n_days[12]:=31;
  DaysInMonth:=n_days[month];
end;

procedure espera(msecs:Integer);
var
  FirstTickCount:Longint;
begin
  FirstTickCount:=GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount-FirstTickCount) >= Longint(msecs));
end;

procedure mostra_mensagem(s:String);
begin
  frm_mensagem.pn_mensagem.caption:=s;
  if not frm_mensagem.showing then
    frm_mensagem.show;
  frm_mensagem.refresh;
end;

procedure esconde_mensagem;
begin
  frm_mensagem.gauge1.progress:=0;
  frm_mensagem.painel.visible:=false;
  if frm_mensagem.showing then
    frm_mensagem.close;
end;

procedure procura_editor(formulario: TWinControl; campo:String);
var
  cont:Longint;
begin
  for cont:=0 to formulario.controlcount-1 do
    if (formulario.controls[cont] is Tdbedit) then
      with formulario.controls[cont] as tdbedit do
        if datafield=campo then
        begin
          with formulario.controls[cont] as tdbedit do
            setfocus;
          break;
        end;
end;

function gera_extenso(valor:Real; ex1, ex2, ex3:Longint; var linha1,
  linha2, linha3:String):String;
var
  letras:set of Char;
  extenso:array[1..3]  of String;
  vl:Real;
  vpont, i, k:Longint;
  ex:array[1..3] of Longint;
  vescrito, estens:String;
  traco:Char;
  volta, continua:Boolean;
begin
  ex[1]:=ex1;
  ex[2]:=ex2;
  ex[3]:=ex3;
  letras:=['N', 'R', 'S', 'A', 'E', 'I', 'O', 'U'];
  vl:=valor;
  estens:='';
  vescrito:=escreve(vl,estens);
  if copy(vescrito, 1, 2)='UM' then
    vescrito:='H'+vescrito;
  extenso[1]:=vescrito;
  if length(extenso[1])<ex1-2 then
    extenso[1]:=extenso[1]+copy('****************************************************************'+
      '********************************************************************************', 1, ex1-length(extenso[1]));
  extenso[2]:=copy('*******************************************************************'+
    '*************************************************************', 1, ex2);
  extenso[3]:=copy('*******************************************************************'+
    '*************************************************************', 1, ex3);
  if length(vescrito)>ex1 then
  begin
    i:=1;
    k:=2;
    vpont:=ex1;
    continua:=true;
    while continua do
    begin
      volta:=false;
      if not (copy(extenso[i],vpont,1)[1] in letras) then
      begin
        if(copy(extenso[i],vpont,1)=' ') or (copy(extenso[i],vpont-1,1)=' ') then
          traco:=' '
        else
          traco:='-';
        extenso[i]:=copy(vescrito, 1, vpont-1)+traco;
        extenso[k]:=copy(vescrito, vpont, length(vescrito));
      end
      else
      begin
        vpont:=vpont-1;
        volta:=true;
      end;
      if not volta then
      begin
        extenso[k]:=sem_brancos(extenso[k]);
        if length(extenso[k])<=(ex[k]-2) then
        begin
          extenso[k]:=extenso[k]+' '+copy('************************************'+
            '****************************************************************',
            1 ,ex[k]-1-length(extenso[k]));
          continua:=false;
        end
        else
        begin
          vescrito:=extenso[k];
          i:=i+1;
          k:=k+1;
          vpont:=ex[k];
        end;
      end;
    end;
  end;
  linha1:=extenso[1];
  linha2:=extenso[2];
  linha3:=extenso[3];
end;

function exten(valores, divisor:Longint; xvalor:Real; vescrito:String):String;
var
  ok:Real;
  num:Longint;
  x: Real;
begin
  ok:=0;
  while divisor>=1 do
  begin
    num:=valores div divisor;
    if (divisor=1) and (num<>0) then
    begin
      if ok=1 then
        vescrito:=vescrito+' E ';
      vescrito:=vescrito+milhas[num];
    end;
    if (divisor=10) and (num<>0) then
    begin
      if ok=1 then
        vescrito:=vescrito+' E ';
      if num=1 then
      begin
        vescrito:=vescrito+milhas[round(int(valores))];
        divisor:=0;
      end
      else
      begin
        vescrito:=vescrito+milhas[num+18];
        ok:=1;
      end;
    end;
    if (divisor=100) and (num<>0) then
      if (valores/100)=1 then
        vescrito:=vescrito+milhas[28]
      else
      begin
        vescrito:=vescrito+milhas[num+28];
        ok:=1;
      end;
    valores:=valores-(num*divisor);
    divisor:=divisor div 10;
  end;
  exten:=vescrito;
end;

function escreve(valor:Real; vescrito:String):String;
begin
  milhas[01]:='UM';
  milhas[02]:='DOIS';
  milhas[03]:='TREIS';
  milhas[04]:='QUATRO';
  milhas[05]:='CINCO';
  milhas[06]:='SEIS';
  milhas[07]:='SETE';
  milhas[08]:='OITO';
  milhas[09]:='NOVE';
  milhas[10]:='DEZ';
  milhas[11]:='ONZE';
  milhas[12]:='DOZE';
  milhas[13]:='TREZE';
  milhas[14]:='QUATORZE';
  milhas[15]:='QUINZE';
  milhas[16]:='DEZESSEIS';
  milhas[17]:='DEZESSETE';
  milhas[18]:='DEZOITO';
  milhas[19]:='DEZENOVE';
  milhas[20]:='VINTE';
  milhas[21]:='TRINTA';
  milhas[22]:='QUARENTA';
  milhas[23]:='CINQUENTA';
  milhas[24]:='SESSENTA';
  milhas[25]:='SETENTA';
  milhas[26]:='OITENTA';
  milhas[27]:='NOVENTA';
  milhas[28]:='CEM';
  milhas[29]:='CENTO';
  milhas[30]:='DUZENTOS';
  milhas[31]:='TREZENTOS';
  milhas[32]:='QUATROCENTOS';
  milhas[33]:='QUINHENTOS';
  milhas[34]:='SEISCENTOS';
  milhas[35]:='SETECENTOS';
  milhas[36]:='OITOCENTOS';
  milhas[37]:='NOVECENTOS';
  valor1:=round(int(valor/1000));
  valor2:=round(int(valor-valor1*1000));
  valor3:=round((valor-int(valor))*100);
  vescrito:='';
  if valor1>0 then
  begin
    vescrito:=vescrito+exten(valor1,100, valor, vescrito);
    vescrito:=vescrito+' MIL ';
  end;
  if valor2>0 then
    if (valor2>=100) and (valor1 > 0) then
      vescrito:=vescrito+'E '+exten(valor2,100, valor, '')
    else
      vescrito:=vescrito+exten(valor2,100, valor, '');
  vescrito:=vescrito+' REAIS';
  if valor3>0 then
  begin
    vescrito:=vescrito+' E '+exten(valor3,10, valor, '');
    if valor3=1 then
      vescrito:=vescrito+' CENTAVO'
    else
      vescrito:=vescrito+' CENTAVOS';
  end;
  escreve:=vescrito;
end;

{Funcao que retira a formatacao de numero ***}
function RetiraFormatacaoNumero (valor: String):String;
begin
  valor:=Trim(valor);
  while (Pos('.',valor)<>0) do
    Delete (valor,Pos('.',valor),1);
  RetiraFormatacaoNumero:=valor;
end;

{Funcao que retira os simbolos de moeda da formatacao de numeros ****}
function RetiraSimboloMoeda(formato: String):String;
var
  i: Integer;
  concat: String;
begin
  i:=1;
  concat:='';
  while (i<=Length(formato)) do
  begin
    if (formato[i]<>'1')  and (formato[i]<>'2') and (formato[i]<>'3') and
      (formato[i]<>'4')  and (formato[i]<>'5') and (formato[i]<>'6') and
      (formato[i]<>'7')  and (formato[i]<>'8') and (formato[i]<>'9') and
      (formato[i]<>'0') and (formato[i]<>'.')  and (formato[i]<>',') then
      concat:=concat+' '
    else
      concat:=concat+formato[i];
    i:=i+1;
  end;
  RetiraSimboloMoeda:=concat;
end;

function form_tz(c:String; tam:Byte):String;
var
  formato:String;
begin
  formato:=trim(c);
  formato:='00000000000000000000000000000000000000000'+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_tz:=formato;
end;

function form_nc4(n:Real; tam:Byte):String;
var
  formato:String;
begin
  formato:=floattostrF(n, ffcurrency, 15, 2);
  formato:=RetiraSimboloMoeda(formato);
  if (n<0.00) then
    formato:='-'+trim(formato);
  formato:='                                                                        '
    +'                                  '+Tsem_brancos(formato);
  formato:=copy(formato, (length(formato)-tam)+1, tam);
  form_nc4:=formato;
end;

procedure ExibeCritica (mensagem,assunto: String; edit: TObject);
begin
  frmDialogo.ExibirMensagem (mensagem,assunto,[mbOk],
    frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  if (edit is TMaskEdit) then
    TMaskEdit(edit).setfocus
  else
  if (edit is TEdit) then
    TEdit(edit).setfocus;
end;
// * * * Dica extraída do Deephi 2.0 * * * //
// * * * * [Evoluindo sem Limites] * * * * //
// * * * * Número: 0563 Testada:  * * * * //

function EliminarFormatacao(sTexto:String):String;
var
  iPos : Integer;
  iTamanho : Integer;
  sTextoSemFormato : String;
  sCaractere : String;
  sCaracMascaras : String;
begin
  Result := sTexto;
  if sTexto = ''  then
    Exit;
  sTextoSemFormato := '';
  sCaracMascaras := ',./><_+=[]{}()-$&@*';
  iTamanho := Length(sTexto);
  for iPos := 1 to iTamanho do
  begin
    sCaractere := Copy(sTexto,iPos,1);
    if Pos(sCaractere,sCaracMascaras) = 0 then
      sTextoSemFormato := sTextoSemFormato + sCaractere;
  end;
  Result := sTextoSemFormato;
end;


end.
