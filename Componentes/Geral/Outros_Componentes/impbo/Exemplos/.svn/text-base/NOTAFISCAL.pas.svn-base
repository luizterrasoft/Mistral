unit NOTAFISCAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, DBTables, RDprint, StdCtrls, Mask, ExtCtrls, DBCtrls;

type
  TDFM_NOTA = class(TForm)
    Button1: TButton;
    RDprint1: TRDprint;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1Sequencia: TAutoIncField;
    Table1Pedido: TIntegerField;
    Table1Codigo: TIntegerField;
    Table1Descricao: TStringField;
    Table1Unidade: TStringField;
    Table1Quantidade: TIntegerField;
    Table1Unitario: TBCDField;
    Button2: TButton;
    Table2: TTable;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Table2Codigo: TIntegerField;
    Table2Razao: TStringField;
    Table2Endereco: TStringField;
    Table2Bairro: TStringField;
    Table2Cidade: TStringField;
    Table2Estado: TStringField;
    Table2Cep: TStringField;
    Table2Data_Compra: TDateField;
    Table2Valor_Compra: TBCDField;
    Table2CGC_CPF: TStringField;
    Table2Inscricao: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label3: TLabel;
    Faturamento: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    msg1: TEdit;
    msg2: TEdit;
    vencimento: TEdit;
    NUMERO: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    DATAEM: TMaskEdit;
    bruto: TEdit;
    desconto: TEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    liquido: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    Table1Subtotal: TCurrencyField;
    CheckBox1: TCheckBox;
    Button3: TButton;
    ValorDpl: TEdit;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure descontoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DFM_NOTA: TDFM_NOTA;

implementation

{$R *.DFM}

procedure TDFM_NOTA.Button1Click(Sender: TObject);
var
     subtotal, total : currency;
     linha : integer;
     traco : string;
begin
     total    := 0;
     Traco    := '-------------------------------------------------------';
     // Parametros para o CUPOM FISCAL
     rdprint1.TamanhoQteLinhas      := 1;      // Linhas (deve ser 1 quando for CUPOM)
     rdprint1.TamanhoQteColunas     := 55;     // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
     rdprint1.FonteTamanhoPadrao    := s20cpp; // Fonte Comprimido em 20 cpp
     rdprint1.OpcoesPreview.Preview := false;

     // Cabeçalho do Cupom...
     with rdprint1 do
        begin
        abrir;
        impc(02,28,'SUPERMERCADO PAG & LEV LTDA',[Comp12, Negrito]);
        impc(03,28,'Av. Sampaio Vidal, 78',[Comp12]);
        impc(04,28,'17500-000 - Marília - SP',[Comp12]);
        impc(05,28,'Fone (14) 1234-5678',[Comp12]);
        imp (07,01,'Nº ' + NUMERO.TEXT +
                   '   ' + datetimetostr(now) +
                   '    Op.: ' + Edit1.text);

        // Dados do Cliente...
        imp (08,01,traco);
        impf(09,01,table2razao.value,[comp12]);
        impf(10,01,table2endereco.value,[comp12]);
        impf(11,01,table2cep.value    + ' - ' +
                   table2cidade.value + ' - ' +
                   table2estado.VALUE, [comp12]);

        // Titulo dos Itens...
        imp (12,01,traco);
        imp (13,01,'Qte Descrição dos Produtos        UN Unitário Sub-Total');
        imp (14,01,traco);
        end;

     // Imprime itens do pedido...
     linha := 15;
     table1.first;
     while not table1.eof do
        begin
        with rdprint1 do
           begin
           impval(linha,01,'##0',table1quantidade.value,[]);
           impf  (linha,05,table1descricao.value,[]);
           impf  (linha,35,table1unidade.VALUE,  []);
           impval(linha,38,'#,##0.00', table1unitario.value,[]);
           subtotal := table1quantidade.value * table1unitario.value;
           total    := total + subtotal;
           impval(linha,47,'##,##0.00', subtotal, []);
           inc(linha);
           end;
        table1.next;
        end;

     // Parte final do Cupom... (daqui pra frente continuo incrementando a LINHA
     with rdprint1 do
        begin
        // Total...
        imp   (linha,01,traco);
        inc   (linha);
        imp   (linha,01,'Total Geral do Cupom');
        impval(linha,42,'###,###,##0.00',total,[]);
        // Desconto Global
        inc (linha);
        imp (linha,01,'(-) Desconto Global');
        impval(linha,42,'-##,###,##0.00',strtofloat(desconto.text),[]);
        // Total Liquido...
        inc (linha);
        impf(linha,01,'VALOR A PAGAR R$',[comp12,negrito]);
        impval(linha,33,'###,###,##0.00',Total - strtofloat(desconto.text),[comp12,negrito]);
        // Final...
        inc (linha);
        imp (linha,01,traco);
        inc (linha);
        impc(linha,28,'Obrigado pela preferência',[comp12]);
        inc (linha);
        inc (linha);
        impc(linha,28,'VOLTE SEMPRE',[Normal]);
        inc (linha);
        inc (linha);
        impc(linha,28,'***  SEM VALOR FISCAL  ***',[]);

        // Avança 7 linhas em Branco...
        linha := linha + 7;
        imp (linha,01,' '); // Para forçar impressão da página

   {===========================================================================}
   {        Mostra preview com tamanho variavel de um cupom nao Fiscal         }
   {                                                                           }
   {              ISTO NAO DEVERIA SER FEITO, NÃO ESTA PREVISTO NOS            }
   {               RECURSOS DO RDPRINT,  USE POR SUA CONTA E RISCO...          }
   {===========================================================================}
   {}      rdprint1.OpcoesPreview.Preview := true;                            {}
   {}      rdprint1.TamanhoQteLinhas      := linha; // Qte de linhas do cupom {}
   {===========================================================================}

        fechar;
        end;
    // Restaura valores normais para imprimir Cupom Não Fiscal...
    rdprint1.OpcoesPreview.Preview := false;
    rdprint1.TamanhoQteLinhas      := 1;
end;

procedure TDFM_NOTA.Button2Click(Sender: TObject);
var
     subtotal, total : currency;
     linha : integer;
begin
     total    := 0;
     // Parametros para o NOTA FISCAL...
     rdprint1.TamanhoQteLinhas      := 66;     // Linhas (deve ser 1 quando for CUPOM)
     rdprint1.TamanhoQteColunas     := 96;     // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
     rdprint1.FonteTamanhoPadrao    := s12cpp; // Fonte Comprimido em 20 cpp
     rdprint1.OpcoesPreview.Preview := true;
     RDprint1.Abrir;

     if checkbox1.Checked then
        with RDprint1 do
           begin
           // Dados da Empresa
           box( 2, 1,09,96,false);
           // Destinatario
           box(10, 1,16,96,false);
           Linhav(83,10,16,3,false);
           // Fatura
           box(17, 1,20,96,false);
           // Dados do produto
           box(21, 1,37,96,false);
           Linhav( 7,21,37,3,false);
           Linhav(43,21,37,3,false);
           Linhav(45,21,37,3,false);
           Linhav(48,21,37,3,false);
           Linhav(51,21,37,3,false);
           Linhav(55,21,37,3,false);
           Linhav(68,21,37,3,false);
           Linhav(80,21,37,3,false);
           Linhav(83,21,37,3,false);
           Linhav(86,21,37,3,false);
           // Calculo do Imposto
           box(38, 1,42,96,false);
           // Transportador
           box(43, 1,49,96,false);
           // Dados adicionais
           box(50, 1,59,96,false);
           Linhav(12,50,59,3,false);
           Linhav(52,50,59,3,false);
           // Canhoto
           box(60, 1,64,96,false);
           Linhav(22,60,64,3,false);
           Linhav(76,60,64,3,false);
           end;


     // imprime novo cabecalho da nota...
     RDprint1.imp (03,62,'X');
     RDprint1.impf(03,78,numero.text,[expandido,negrito]);
     RDprint1.imp (08,02,edit8.text);
     RDprint1.imp (08,30,edit7.text);

     // Destinatario / Remetente
     RDprint1.imp(11,02,table2razao.value);
     RDprint1.imp(11,51,table2codigo.asstring);
     RDprint1.imp(11,63,table2cgc_cpf.value);
     RDprint1.imp(13,02,table2endereco.value);
     RDprint1.imp(13,46,table2bairro.value);
     RDprint1.imp(13,70,table2cep.value);
     RDprint1.imp(15,02,table2cidade.value);
     RDprint1.imp(15,38,'[telefone]');
     RDprint1.imp(15,58,table2estado.value);
     RDprint1.imp(15,62,table2inscricao.value);

     // Data de Emissao e Saida...
     RDprint1.imp(11,85,dataem.text);
     RDprint1.imp(13,85,formatdatetime('dd/mm/yyyy',date));
     RDprint1.imp(15,85,formatdatetime('HH:MM', now));

     // Fatura / Duplicatas
     RDprint1.imp(18,03,'A');
     RDprint1.imp(18,06,vencimento.text);
     RDprint1.imp(18,25,valordpl.text);

     // Itens da Nota Fiscal...
     linha := 23; // Linha inicial dos produtos...
     Table1.first;
     while not table1.eof do
        begin
        RDprint1.imp(linha,02,Table1codigo.asstring);
        RDprint1.imp(linha,08,Table1descricao.value);
        RDprint1.imp(linha,44,'A');
        RDprint1.imp(linha,46,'00');
        RDprint1.imp(linha,49,Table1unidade.value);
        RDprint1.impval(linha,52,'##0',table1quantidade.value,[]);
        RDprint1.impval(linha,57,'###,##0.00', table1unitario.value,[]);
        subtotal := table1quantidade.value * table1unitario.value;
        total    := total + subtotal;
        RDprint1.impval(linha,69,'###,##0.00', subtotal, []);
        RDprint1.imp(linha,81, '18');
        // IPI...(Diniz)
        RDprint1.imp(linha,84, '00');
        RDprint1.imp(linha,92, '0,00');

        inc(linha);
        if linha = 36 then
           begin
           showmessage('ATENÇÃO: Quantidade de itens excedeu os limites da Nota Fiscal...');
           break;
           end;
        table1.next;
        end;

     // Desconto Global...
     if desconto.text <> '0,00' then
        begin
        RDprint1.imp(linha,08,'(-) Desconto Global de ');
        RDprint1.impval(linha,68,'-###,##0.00',strtofloat(desconto.text),[]);
        end;
     // Faz a somatoria a imprimir os totais...
     RDprint1.impval(39,02,'###,###,###,##0.00',total - strtofloat(desconto.text),[]);
     RDprint1.impval(39,25,'###,###,###,##0.00',((total-strtofloat(desconto.text))*18)/100,[]);
     RDprint1.impval(41,77,'###,###,###,##0.00',total - strtofloat(desconto.text),[]);

     // Dados do Transportador...
     RDprint1.imp(44,02,edit2.text);
     RDprint1.imp(44,60,'1');
     RDprint1.imp(44,63,edit4.text);
     RDprint1.imp(44,74,edit6.text);
     RDprint1.imp(44,77,'[ CGC ]');
     RDprint1.imp(46,02,edit3.text);
     RDprint1.imp(46,51,edit5.text);
     RDprint1.imp(46,74,edit6.text);
     RDprint1.imp(46,77,'[Inscrição]');

     // Volumes e Peso...
     RDprint1.imp(48,02,'[ volumes ]');
     RDprint1.imp(48,14,'Vol./Caixas         Diversos');
     RDprint1.imp(48,70,'[ p.bruto ]');
     RDprint1.imp(48,84,'[ p.Liqui ]');

     // Observaçoeos...
     RDprint1.imp(51,14,msg1.text);
     RDprint1.imp(52,14,msg2.text);

     RDprint1.impf(62,78,numero.text,[expandido,negrito]);

     // final da nota fiscal...
     RDprint1.impf(65,01,'Deltress Informática Ltda - (14) 427-5322',[Comp20]);
     RDprint1.fechar;
end;

procedure TDFM_NOTA.Table1CalcFields(DataSet: TDataSet);
begin
     table1subtotal.value := table1quantidade.value * table1unitario.value;
end;

procedure TDFM_NOTA.FormShow(Sender: TObject);
begin
     table1.Active := true;
     table2.Active := true;
//     DBLookupComboBox1.text := table2razao.value;
     Button3Click(Sender);
end;

procedure TDFM_NOTA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     table1.Active := false;
     table2.Active := false;
end;

procedure TDFM_NOTA.Button3Click(Sender: TObject);
var
     totalws : currency;
begin
     // Totaliza a nota fiscal e calcula desconto...
     totalws := 0;
     table1.First;
     while not table1.Eof do
       begin
       totalws := totalws + table1quantidade.value * table1unitario.value;
       table1.Next;
       end;
     bruto.text    := formatfloat('###,###,##0.00',totalws);
     liquido.text  := formatfloat('###,###,##0.00',totalws - strtofloat(desconto.text));
     valordpl.text := formatfloat('###,###,##0.00',totalws - strtofloat(desconto.text));
end;

procedure TDFM_NOTA.descontoExit(Sender: TObject);
begin
     Button3Click(Sender);
end;

end.
