unit BRADESCO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,Printers, DBCtrls, ComCtrls, Grids, Gauges,
  Mask, Spin, RDprint;

type
  TDFM_BRADESCO = class(TForm)
    msg1: TEdit;
    Label3: TLabel;
    msg2: TEdit;
    SAIR: TBitBtn;
    IMPRIMIR: TBitBtn;
    Bevel1: TBevel;
    Faturamento: TLabel;
    msg3: TEdit;
    Bevel2: TBevel;
    Label4: TLabel;
    Bevel3: TBevel;
    Label5: TLabel;
    NOSSONUM: TMaskEdit;
    Label6: TLabel;
    parcelas: TSpinEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Anda: TGauge;
    vencimento: TMaskEdit;
    Label2: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    taxa: TEdit;
    valor: TEdit;
    RDprint1: TRDprint;
    procedure FormShow(Sender: TObject);
    procedure IMPRIMIRClick(Sender: TObject);
    procedure SAIRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DFM_BRADESCO : TDFM_BRADESCO;
  proximo     : double;

implementation
{$R *.DFM}

procedure TDFM_BRADESCO.FormShow(Sender: TObject);
begin
     proximo               := 1;
     nossonum.text         := formatfloat('000,000',proximo);
     Anda.Progress         := 0;
     vencimento.text       := datetostr(date);
end;

procedure TDFM_BRADESCO.IMPRIMIRClick(Sender: TObject);
var
     a              : integer;
     saltar         : boolean;
     dia, mes, ano  : word;
     datavenc       : tdatetime;
     Mora           : double;
     valortxt       : string;
begin
     if MessageDlg('Impressora esta Pronta ?  ' + #13 +
                   'Confirma impress�o ?', mtconfirmation, [mbno, mbyes], 0) = mrno then
                   exit;
     Screen.Cursor    := crHourGlass;
     // parametros iniciais para impressao
     imprimir.enabled := false;
     sair.enabled     := false;
     anda.MaxValue    := parcelas.value;
     Anda.Progress    :=0;

     rdprint1.abrir;
     rdprint1.setup;
     saltar           := false;
     for a:=0 to (parcelas.value - 1) do
        begin
        // calcula a data do vencimento...
        decodedate(strtodate(vencimento.text),ano,mes,dia);
        mes := mes + a;
        if mes > 12 then
           begin
           mes := mes - 12;
           inc(ano);
           end;
        if (mes = 2) and (dia > 28) then dia := 28;
        if ((mes = 4) or (mes = 6) or (mes = 9) or (mes = 11)) and (dia > 30) then dia := 30;
           datavenc := encodedate(ano,mes,dia);
        // Calcula a taxa de permanencia...
        mora := trunc(strtofloat(valor.text) * strtofloat(taxa.text) / 30);
        mora := mora / 100;

        // Aqui come�a realmente a impressao do boleto...
        with Rdprint1 do
           begin
           if saltar then novapagina;  // Nao salta pagina no primeiro boleto
           impf(01,01,'Ate o vencimento,pagavel em qualquer agencia.',[comp12]);
           impf(01,55, datetostr(datavenc),[negrito]);
           imp(05,01, datetostr(date));
           imp(05,12, nossonum.text);
           imp(05,25, 'CA');
           imp(05,31, '01');
           //valor duplicata - qtde

           // valortxt usado para fazer o alinhamento a direita do valor...
           valortxt := formatfloat('###,###,###,##0.00',strtofloat(Valor.text));
           imp(07,36 -length(valortxt), valortxt);

           //valor duplicata - valor doc
           impf(07,62 - length(valortxt), valortxt,[negrito]);

           //Tx Permanencia
           valortxt :=  formatfloat('###,###,###,##0.00',mora);
           imp(09,40 - length(valortxt), valortxt);

           // Instru�oes
           imp(12,01, msg1.text);
           imp(13,01, msg2.text);
           imp(14,01, msg3.text);

           // dados do sacado...
           imp(19,01, edit1.text);
           imp(20,01, edit2.text);
           imp(21,01, edit3.text + ' - ' + edit4.text + '/' + edit5.text);
           end;

        // Proxima parcela...
        saltar := true;
        Anda.Progress:= anda.progress + 1;
        proximo := proximo + 1;
        nossonum.text := formatfloat('000,000',proximo);
        end;
     rdprint1.fechar;
     showmessage('Final de processamento...');
     Anda.Progress        := 0;
     Screen.Cursor        := crDefault;
     imprimir.enabled     := True;
     sair.enabled         := True;
end;

procedure TDFM_BRADESCO.SAIRClick(Sender: TObject);
begin
     Close;
end;

end.
