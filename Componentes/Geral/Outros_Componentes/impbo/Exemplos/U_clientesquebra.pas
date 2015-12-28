unit U_clientesquebra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBTables, RDprint;

type
  Tdfm_clientesquebra = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RDprint1: TRDprint;
    Query1: TQuery;
    Query1Codigo: TIntegerField;
    Query1Razao: TStringField;
    Query1Endereco: TStringField;
    Query1Bairro: TStringField;
    Query1Cidade: TStringField;
    Query1Estado: TStringField;
    Query1Cep: TStringField;
    Query1Data_Compra: TDateField;
    Query1Valor_Compra: TBCDField;
    Query1CGC_CPF: TStringField;
    Query1Inscricao: TStringField;
    CheckBox3: TCheckBox;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure quebracidade;
    procedure totalquebra;
    procedure BitBtn2Click(Sender: TObject);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dfm_clientesquebra: Tdfm_clientesquebra;
  linha    : integer;
  subtotal : double;
  cidadews : string;

implementation

{$R *.DFM}

procedure Tdfm_clientesquebra.BitBtn1Click(Sender: TObject);
var
     totalgeral : double;
begin
     // Ajusta preview de acordo com a op��o do cliente...
     rdprint1.OpcoesPreview.Preview := checkbox1.Checked;

     rdprint1.abrir;            // Inicia a montagem do relat�rio...

     // Chama setup e se clicar em "CANCELAR" ent�o abandona...
     if checkbox2.Checked then
        if RDprint1.Setup = false then
           begin
           showmessage('Cancelado pelo usu�rio...');
           exit;
           end;

     // Zera variaveis para iniciar o relat�rio...
     linha            := 7;
     subtotal         := 0;
     totalgeral       := 0;

     Query1.active    := true; // Abre a tabela classificando por CIDADE e RAZAO
     Query1.First;
     cidadews         := 'Forca quebra'; // For�a 1� Quebra...

     while not Query1.eof do
        begin

        // verifica e processa quebra da cidade...
        if Query1cidade.value <> cidadews then   // Quebra a cidade...
           begin
           totalquebra;  // Imprime total da quebra...
           quebracidade; // Imprime cabecalho da cidade...
           end;

        if linha > 63 then // Salto de Pagina chama automaticamente cabecalho/rodape...
           begin
           rdprint1.novapagina;
           quebracidade;
           end;

        // Detalhes do relat�rio...
        rdprint1.imp (linha,01,formatfloat('0000',Query1codigo.value));
        rdprint1.imp (linha,07,Query1razao.value);
        rdprint1.imp (linha,44,Query1cidade.value);
        rdprint1.imp (linha,66,Query1estado.value);
        rdprint1.imp (linha,70,Query1Data_Compra.asstring);
        // Este comando imprime valores alinhados � direita...
        rdprint1.ImpVal(Linha,81,'###,###,##0.00',Query1Valor_Compra.value,[]);
        inc(linha);

        // Soma o totais...
        subtotal   := subtotal   + Query1valor_compra.value;
        totalgeral := totalgeral + Query1valor_compra.value;
        Query1.next;
        end;

     // Imprime o total da quebra...
     totalquebra;

     // Imprime total geral...
     if linha > 61 then
        rdprint1.novapagina;
     rdprint1.imp(Linha,1,'-----------------------------------------------------------------------------------------------');
     inc(linha);
     rdprint1.impf  (linha,10,'Total Geral das Vendas ==> ',[negrito]);
     rdprint1.impval(linha,81,'###,###,##0.00',totalgeral,  [negrito]);

     rdprint1.fechar;  // Encerra o relat�rio...
     Query1.active:=false;  // Fecha a tabela...
end;

procedure Tdfm_clientesquebra.quebracidade;
begin
     if linha > 59 then
        rdprint1.novapagina;

     // Imprime o cabecalho da quebra...
     rdprint1.imp (linha,1,'-----------------------------------------------------------------------------------------------');
     inc(linha);
     rdprint1.impf(linha,1,'Cidade: ' + cidadews,[negrito]);
     inc(linha);
     rdprint1.imp(Linha,1,'-----------------------------------------------------------------------------------------------');
     inc(linha);
end;

procedure Tdfm_clientesquebra.totalquebra;
begin
     if cidadews = 'Forca quebra' then  // N�o tem sub-total ainda pois � o 1� vez
        begin
        cidadews := Query1cidade.value; // atualiza a quebra...
        exit;
        end;

     // Imprime total da quebra...
     if linha > 61 then
        begin
        rdprint1.novapagina;
        quebracidade;
        end
     else
        begin
        rdprint1.imp   (linha,1,'-----------------------------------------------------------------------------------------------');
        inc(linha);
        end;

     rdprint1.impf  (linha,10,'Total de Vendas por Cidade ==> ',[negrito]);
     rdprint1.impval(linha,81,'###,###,##0.00',subtotal,[negrito]);
     inc(linha);

     // atualizo variaveis de controle da quebra...
     cidadews := Query1cidade.value; // atualiza a quebra...
     subtotal := 0;

     // Op�ao para come�ar uma nova pagina...
     if checkbox3.Checked then
        rdprint1.Novapagina;

end;

procedure Tdfm_clientesquebra.BitBtn2Click(Sender: TObject);
begin
     close;
end;

procedure Tdfm_clientesquebra.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
     // Rodap�...
     rdprint1.imp (64,01,'===============================================================================================');
     rdprint1.impf(65,01,'Deltress Inform�tica Ltda',[italico]);
     rdprint1.impf(65,65,'Demonstra��o RdPrint 3.0',[comp17]);
end;

procedure Tdfm_clientesquebra.RDprint1NewPage(Sender: TObject;
  Pagina: Integer);
begin
     // Cabe�alho...
     rdprint1.imp (02,01,'===============================================================================================');
     rdprint1.impc(03,48,'RELAT�RIO DE CLIENTES', [expandido,NEGRITO]);
     rdprint1.impf(04,01,'Deltress Inform�tica Ltda',[normal]);
     rdprint1.impf(04,82,'P�gina: ' + formatfloat('000',pagina),[normal]);
     rdprint1.imp (05,01,'===============================================================================================');
     rdprint1.imp (06,01,'C�d.  [          Raz�o Social           ]  [      Cidade      ]  UF  [  Data  ]  [ Valor em R$]');
     Linha  := 7;
end;

end.
