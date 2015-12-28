unit Etiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RDprint, StdCtrls, ExtCtrls, Buttons;

type
  TDFM_ETQ = class(TForm)
    Button6: TButton;
    RDprint1: TRDprint;
    Table1: TTable;
    DataSource1: TDataSource;
    MODELO: TRadioGroup;
    Table1Codigo: TIntegerField;
    Table1Razao: TStringField;
    Table1Endereco: TStringField;
    Table1Bairro: TStringField;
    Table1Cidade: TStringField;
    Table1Estado: TStringField;
    Table1Cep: TStringField;
    Table1Data_Compra: TDateField;
    Table1Valor_Compra: TBCDField;
    Table1CGC_CPF: TStringField;
    Table1Inscricao: TStringField;
    BitBtn1: TBitBtn;
    RDprint2: TRDprint;
    Memo1: TMemo;
    Image1: TImage;
    Label1: TLabel;
    procedure Button6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DFM_ETQ: TDFM_ETQ;

implementation

{$R *.DFM}

procedure TDFM_ETQ.Button6Click(Sender: TObject);
var
     coluna : integer;
begin
     // Ajusta a largura da folha de acordo com o n�mero de colunas
     case modelo.ItemIndex of
       0 : rdprint1.TamanhoQteColunas :=  40;
       1 : rdprint1.TamanhoQteColunas :=  80;
       2 : rdprint1.TamanhoQteColunas := 120;
       end;

     table1.active := true;  // Abre arquivo de clientes
     table1.first;
     rdprint1.abrir;         // inicia cria��o do relat�rio...
     while not table1.eof do
        begin

        // Primeira Coluna...
        coluna := 01;
        rdprint1.imp (01,coluna,table1razao.value);
        rdprint1.imp (02,coluna,table1endereco.value);
        rdprint1.imp (03,coluna,table1cidade.value + ' - ' + table1estado.value);
        rdprint1.impf(04,coluna,table1cep.value,[negrito]);
        rdprint1.impf(05,coluna + 30 ,'C�digo: ' + table1codigo.asstring,[comp20]);
        table1.next;

        // Segunda Coluna...
        if modelo.itemindex > 0 then
         if not table1.eof then // se n�o for fim do arquivo
           begin
           coluna := 41;
           rdprint1.imp (01,coluna,table1razao.value);
           rdprint1.imp (02,coluna,table1endereco.value);
           rdprint1.imp (03,coluna,table1cidade.value + ' - ' + table1estado.value);
           rdprint1.impf(04,coluna,table1cep.value,[negrito]);
           rdprint1.impf(05,coluna + 30 ,'C�digo: ' + table1codigo.asstring,[comp20]);
           table1.next;
           end;

        // Terceira Coluna...
        if modelo.itemindex > 1 then
         if not table1.eof then // se n�o for fim do arquivo
           begin
           coluna := 81;
           rdprint1.imp (01,coluna,table1razao.value);
           rdprint1.imp (02,coluna,table1endereco.value);
           rdprint1.imp (03,coluna,table1cidade.value + ' - ' + table1estado.value);
           rdprint1.impf(04,coluna,table1cep.value,[negrito]);
           rdprint1.impf(05,coluna + 30 ,'C�digo: ' + table1codigo.asstring,[comp20]);
           table1.next;
           end;

        rdprint1.Novapagina; // Salta para a pr�xima etiqueta
        end;

     rdprint1.fechar; // Finaliza Relat�rio (Mostra preview ou inicia impress�o)
     table1.active := false; // Fecha arquivo
end;



procedure TDFM_ETQ.BitBtn1Click(Sender: TObject);
var
     linha : integer;
begin
     // Inicia as variaveis com espa�amento necess�rio para as margens...
     linha              := 3;

     table1.active      := true; // Abre a tabela...
     table1.first;
     rdprint2.abrir; // inicia cria��o do relat�rio...
     // Inicia a impress�o...
     while not table1.eof do
        begin
        // Primeira Coluna...
        rdprint2.impf(linha+1,03,table1razao.value,[comp12]);
        rdprint2.imp (linha+2,03,table1endereco.value);
        rdprint2.imp (linha+3,03,table1cidade.value + ' - ' + table1estado.value);
        rdprint2.imp (linha+4,03,table1cep.value);
        rdprint2.impf(linha+5,28,'C�digo: ' + table1codigo.asstring,[comp20]);
        table1.next; // proximo registro

        // Segunda Coluna...
        if not table1.eof then // se n�o for fim do arquivo...
           begin
           rdprint2.impf(linha+1,43,table1razao.value,[comp12]);
           rdprint2.imp (linha+2,43,table1endereco.value);
           rdprint2.imp (linha+3,43,table1cidade.value + ' - ' + table1estado.value);
           rdprint2.impf(linha+4,43,table1cep.value,[negrito]);
           rdprint2.impf(linha+5,68,'C�digo: ' + table1codigo.asstring,[comp20]);
           table1.next;
           end;

        linha := linha + 6; // Incrementa variavel, salta para a pr�xima etiqueta

        // Nova pagina quando imprime as 10 etiquetas na pagina...
        if linha >= 62 then
           begin
           rdprint2.Novapagina;
           linha := 3; // retorna � 1. etiqueta da pagina...
           end;

        end;
     rdprint2.fechar; // Finaliza Relat�rio (Mostra preview ou inicia impress�o)
     table1.active := false; // Fecha arquivo
end;

end.
