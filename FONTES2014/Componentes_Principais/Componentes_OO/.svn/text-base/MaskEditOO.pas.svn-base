unit MaskEditOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, extctrls;

type
  {Define os tipos de maskeditOO trabalhados nos formularios}
  tipoMaskEditOO = (ftUnknown,ftInteger,ftFloat,ftString,ftDate,ftDateTime);

type
  TMaskEditOO = class(TMaskEdit)
  private
    { Private declarations }
    nome: string; {nome do campo a que representa}
    valor: variant; {armazena o valor do atributo 'text', em seu tipo real}
    fieldtype: tipoMaskEditOO; {tipo do dado que o maskeditOO contem}
    fieldlength: integer; {tamanho da mascara do edit}
    tipo: integer; {sem uso !!!}
    campo: string; {armazena o nome do campo o qual esta relacionado, se existir}
    entidade: string; {armazena o nome da tabela no BD o qual esta relacionado, se existir}
    label_entidade: string; {armazena o label exibivel da entidade}
    tipoPesquisaF8: boolean; {se verdadeiro, implementa a consulta de F8}
    painelEntidade: TPanel; {painel que exibira o resultado da consulta, ativado pelo evento OnExit}
    mensagemF1: string; {armazena a mensagem de ajuda que deve ser exibida no F1}

    {**** metodos de formatacao p/ uso interno ****}
    function RetiraSimboloMoeda(formato: string):string;
    function sem_brancos(texto:string):string;
    function form_t(s:string; tam:byte):string;
    function RetiraFormatacaoNumero (valor: string):string;
    function Tsem_brancos(s:string):string;
    function form_n(n:real; tam:byte):string;
    function form_nz   (n:real; tam:byte):string;
    function form_data (data : TDateTime):string;
    function form_nc   (n:real; tam:byte):string;
    function form_nc2  (n:real; tam, dec:byte):string;
    function form_nz2  (n:real; tam:byte):string;
    function inverte(s:string):string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure Clear; {limpa o conteudo do edit}
    procedure FormatarEditNumerico; {formatacao de ftFloat}
    procedure FormatarZerosDecimais; {formatacao de ftFloat}
    function IsDate:boolean; {formatacao de ftDate/ftDateTime}
    procedure SetValor(valor: variant); {seta o valor do atributo 'text', recebendo qualquer tipo como parametro}
    function  GetValor:variant; {retorna o valor do atributo 'text', em seu tipo real}
    function  GetValorFormatado:string; {retorna o valor do atributo 'text', em seu tipo real - FORMATADO}
  published
    { Published declarations }
    property zNomeOO: string read nome write nome;
    property zFieldTypeOO: tipoMaskEditOO read fieldtype write fieldtype;
    property zFieldLengthOO: integer read fieldlength write fieldlength;
    property zTipoOO: integer read tipo write tipo; {sem uso!!!}
    property zCampoOO: string read campo write campo;
    property zEntidadeOO: string read entidade write entidade;
    property zLabelEntidadeOO: string read label_entidade write label_entidade;
    property zPainelEntidadeOO: TPanel read painelEntidade write painelEntidade;
    property zTipoPesquisaF8: boolean read tipoPesquisaF8 write tipoPesquisaF8;
    property zMensagemF1: string read mensagemF1 write mensagemF1;
  end;

procedure Register;

implementation

constructor TMaskEditOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     tipo       := -1; {sem uso!!!}
     fieldtype  := ftUnknown;
     fieldlength:= 0;
     campo      := '';
     entidade   := '';
     label_entidade := '';
     font.style := [fsBold];
     text       := '';
     painelEntidade := nil;
     CharCase   := ecUpperCase;
end;

procedure TMaskEditOO.FormatarEditNumerico;
var
numero: string;
tam: integer;
begin
     if (fieldtype=ftFloat) then {** somente para floats}
     begin
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
           else if (numero[tam]<>'1') and (numero[tam]<>'2') and
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
           begin
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
             begin
                if (tam=2) and (numero[tam-1]='0') then
                begin
                  numero[tam]:=' ';
                  text:=Trim(numero);
                  selstart:=tam;
                end;
             end;
           end;
         end;
     end;
end;

procedure TMaskEditOO.FormatarZerosDecimais;
begin
     if (fieldtype=ftFloat) then {** somente para floats}
     begin
         text:=Trim(text);
         if (text='') or (text='0,') or (text='0,0') or
            (text='0,00') or (text=',00') or (text=',0') or
            (text='0')
         then text:='0,00'
         else
         begin
             if Pos(',',text)=0 then
               text:=text+',00'
             else
             begin
                 if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=1) then
                     text:=text+'0'
                 else if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=0) then
                     text:=text+'00';
             end;
         end;
     end;
end;

function TMaskEditOO.RetiraFormatacaoNumero (valor: string):string;
begin
     valor:=Trim(valor);
     while (Pos('.',valor)<>0) do
          Delete (valor,Pos('.',valor),1);
     RetiraFormatacaoNumero:=valor;
end;

function TMaskEditOO.GetValor:variant;
begin
     if (fieldtype=ftUnknown) then
          valor:=-1
     else if (fieldtype=ftInteger) then
     begin
          if (Trim(text)<>'') then
              valor:=strtofloat(Trim(text))
          else valor:=0;
     end
     else if (fieldtype=ftFloat) then
     begin
          if (Trim(text)<>'') then
              valor:=strtofloat(RetiraFormatacaoNumero(Trim(text)))
          else valor:=0.00;
     end
     else if (fieldtype=ftString) then
     begin
          if (Trim(text)<>'') then
              valor:=Trim(text)
          else valor:='';
     end
     else if (fieldtype=ftDate) then
     begin
          if (text='  /  /    ') then
              valor:=strtodate('01/01/1900')
          else valor:=strtodate(text);
     end
     else if (fieldtype=ftDateTime) then
     begin
          if (text='  /  /    ') then
              valor:=strtodate('01/01/1900')
          else valor:=strtodate(text);
     end;
     result:=valor;
end;

function TMaskEditOO.form_t(s:string; tam:byte):string;
var
  formato:string;
begin
  formato:=s+'                                            '
  +'                                                                    ';
  formato:=copy(formato, 1, tam);
  form_t:=formato;
end;

function TMaskEditOO.GetValorFormatado:string;
begin
     if (fieldtype=ftUnknown) then
          valor:=form_n(-1,fieldlength)
     else if (fieldtype=ftInteger) then
     begin
          if (Trim(text)<>'') then
              valor:=form_nz(strtofloat(Trim(text)),fieldlength)
          else valor:=form_nz(0,fieldlength);
     end
     else if (fieldtype=ftFloat) then
     begin
          if (Trim(text)<>'') then
              valor:=form_nc(strtofloat(RetiraFormatacaoNumero(Trim(text))),fieldlength)
          else valor:=form_nc(0.00,fieldlength);
     end
     else if (fieldtype=ftString) then
     begin
          if (Trim(text)<>'') then
              valor:=form_t(text,fieldlength)
          else valor:=form_t(' ',fieldlength);
     end
     else if (fieldtype=ftDate) then
     begin
          if (text='  /  /    ') then
              valor:=form_data(strtodate('01/01/1900'))
          else valor:=form_data(strtodate(text));
     end
     else if (fieldtype=ftDateTime) then
     begin
          if (text='  /  /    ') then
              valor:=form_data(strtodate('01/01/1900'))
          else valor:=form_data(strtodate(text));
     end;
     result:=valor;
end;

function TMaskEditOO.sem_brancos(texto:string):string;
var
cont: byte;
begin
    cont:=0;
    while pos(' ',texto)<>0 do
      delete(texto,pos(' ',texto),1);
    sem_brancos:=texto;
end;

function TMaskEditOO.inverte(s:string):string;
var
retorno: string;
cont: longint;
begin
    retorno:=' ';
    for cont:=2 to length(s) do
      retorno:=retorno+' ';
    for cont:=1 to length(s) do
      retorno[(length(s)-cont)+1]:=s[cont];
    inverte:=retorno;
end;

function TMaskEditOO.Tsem_brancos(s:string):string;
var
retorno: string;
begin
    retorno:=sem_brancos(s);
    retorno:=sem_brancos(inverte(retorno));
    retorno:=inverte(retorno);
    if (retorno='') or (length(retorno)=0) then
      retorno:='*';
    Tsem_brancos:=retorno;
end;

function TMaskEditOO.form_nz(n:real; tam:byte):string;
var
formato: string;
begin
     str(n:tam:0,formato);
     formato:='00000000000000000000000000000000000000000'+Tsem_brancos(formato);
     formato:=copy(formato, (length(formato)-tam)+1, tam);
     form_nz:=formato;
end;

function TMaskEditOO.form_nz2(n:real; tam:byte):string;
var
formato: string;
begin
     str(n:tam:2,formato);
     formato:='00000000000000000000000000000000000000000'+Tsem_brancos(formato);
     formato:=copy(formato, (length(formato)-tam)+1, tam);
     form_nz2:=formato;
end;

function TMaskEditOO.form_data(data : TDateTime):string;
var
ano, mes, dia : word;
year : string[4];
month, day : string[2];
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

function TMaskEditOO.RetiraSimboloMoeda(formato: string):string;
var
i: integer;
concat: string;
begin
     i:=1;concat:='';
     while (i<=Length(formato)) do
     begin
          if (formato[i]<>'1')  and (formato[i]<>'2') and (formato[i]<>'3') and
             (formato[i]<>'4')  and (formato[i]<>'5') and (formato[i]<>'6') and
             (formato[i]<>'7')  and (formato[i]<>'8') and (formato[i]<>'9') and
             (formato[i]<>'0') and (formato[i]<>'.')  and (formato[i]<>',') then
             concat:=concat+' '
          else concat:=concat+formato[i];
          i:=i+1;
     end;
     RetiraSimboloMoeda:=concat;
end;

function TMaskEditOO.form_nc(n:real; tam:byte):string;
var
formato: string;
begin
     formato:=floattostrF(n, ffcurrency, 15, 2);
     formato:=RetiraSimboloMoeda(formato);
     formato:='                                                                        '
     +'                                  '+Tsem_brancos(formato);
     formato:=copy(formato, (length(formato)-tam)+1, tam);
     form_nc:=formato;
end;

function TMaskEditOO.form_nc2(n:real; tam, dec:byte):string;
var
formato: string;
begin
     formato:=floattostrF(n, ffcurrency, 15, dec);
     formato:=RetiraSimboloMoeda(formato);
     formato:='                                                                        '
     +'                                  '+Tsem_brancos(formato);
     formato:=copy(formato, (length(formato)-tam)+1, tam);
     form_nc2:=formato;
end;

function TMaskEditOO.form_n(n:real; tam:byte):string;
var
formato: string;
begin
     str(n:tam:0,formato);
     formato:='                                         '+Tsem_brancos(formato);
     formato:=copy(formato, (length(formato)-tam)+1, tam);
     form_n:=formato;
end;

procedure TMaskEditOO.SetValor(valor: variant);
begin
     if (fieldtype=ftInteger) then
        text := form_nz(valor,fieldlength)
     else if (fieldtype=ftFloat) then
        text := form_nc(valor,fieldlength)
     else if (fieldtype=ftString) then
        text := form_t(valor,fieldlength)
     else if (fieldtype=ftDate) then
        text := form_data(valor)
     else if (fieldtype=ftDateTime) then
        text := form_data(valor)
     else
        text := '';
end;

function TMaskEditOO.IsDate:boolean;
var
param: string;
data: Tdatetime;
begin
   try
      param:=text;
      if (Length(param)<>10) then
           result := false
      else
      begin
           if (param='  /  /    ') then
               result:=true
           else
           begin
                data   := strtodate(param);
                result := true;
           end;
      end;
   except
      result := false;
   end;
end;

procedure TMaskEditOO.Clear; {limpa o conteudo do edit}
begin
     text:='';   
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TMaskEditOO]);
end;

end.
