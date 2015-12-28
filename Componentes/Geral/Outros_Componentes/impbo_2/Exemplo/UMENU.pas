unit UMENU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, RDprint;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    DataSource1: TDataSource;
    Table1: TTable;
    Table1Codigo: TStringField;
    Table1Razao: TStringField;
    Table1Cidade: TStringField;
    Table1Estado: TStringField;
    Table1Cep: TStringField;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button5: TButton;
    Edit1: TEdit;
    RDprint1: TRDprint;
    RadioGroup1: TRadioGroup;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Button6: TButton;
    Label2: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Rprint1Erro(Sender: TObject; Mensagem: String);
    procedure Button2Click(Sender: TObject);
    procedure RDprint1Erro(Sender: TObject; Mensagem: String);
    procedure Button3Click(Sender: TObject);
    procedure Rodape(Sender: TObject);
    procedure Cabecalho(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1  : TForm1;
  pagina : integer;
  linha  : integer;

implementation

uses BRADESCO;
{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     //  Voce pode setar tambem o modelo da impressora
     //  rdprint1.Impressora := epson;
     //  rdprint1.impressora := HP;

     // Configurações do Componente... (opcional)
     rdprint1.TamanhoQteLPP      := seis;
     rdprint1.PreviewZoom        := strtoint(edit1.text);
     rdprint1.Preview            := checkbox1.Checked;
     rdprint1.UsaGerenciadorImpr := checkbox2.Checked;
     rdprint1.UsaNovoMetodoPrint := checkbox3.Checked;
     rdprint1.TestarPorta        := checkbox4.Checked;

     // Fonte Default (Opcional)
     case radiogroup1.itemindex of
       0 : begin
           rdprint1.FonteTamanhoPadrao := s10cpp;
           rdprint1.TamanhoQteColunas  := 80;
           end;
       1 : begin
           rdprint1.FonteTamanhoPadrao := s12cpp;
           rdprint1.TamanhoQteColunas  := 96;
           end;
       2 : begin
           rdprint1.FonteTamanhoPadrao := s17cpp;
           rdprint1.TamanhoQteColunas  := 136;
           end;
       3 : begin
           rdprint1.FonteTamanhoPadrao := s20cpp;
           rdprint1.TamanhoQteColunas  := 160;
           end;
       end;

     // Programação dos Eventos: desliga eventos cabecalho/rodape
     rdprint1.OnBeforeNewPage := nil;
     rdprint1.OnNewPage       := nil;

     // Inicio...
     with rdprint1 do
        begin
        abrir;  // inicializa o arquivo de impressao...
        if setup then  // abre tela para escolha da impressora e modelo...
           begin
           impf(01,01,'RDPRINT 2.0',[EXPANDIDO, NEGRITO]);
           impf(01,25,'- COMPONENTE DE IMPRESSÃO',[NORMAL, NEGRITO]);
           impf(02,01,'NOTAS FISCAIS, DUPLICATAS, BOLETOS E RELATÓROS EM GERAL',[NORMAL]);
           impf(04,01,'CARACTERíSTICAS:',[NORMAL, NEGRITO]);
           impf(05,01,'* Preview real com zoom',[NORMAL]);
           impf(06,01,'* Setup para usuário final',[NORMAL]);
           impf(07,01,'* Impressão rápida e precisa',[normal]);
           impf(08,01,'* Montagem dinâmica de páginas,',[NORMAL]);
           impf(09,01,'* Fontes em 5,10,12,17 e 20 cpp',[NORMAL]);
           impf(10,01,'* Imprime 6 e 8 linhas / polegada',[NORMAL]);
           impf(11,01,'* Negrito,itálico,sublinhado',[NORMAL]);
           impf(25,01,'Acento 1 : áéíóú ÁÉÍÓÚ',[normal]);
           impf(25,40,'Acento 2 : àèìòù ÀÈÌÒÙ',[normal]);
           impf(26,01,'Acento 3 : âêîôû ÂÊÎÔÛ',[normal]);
           impf(26,40,'Acento 4 : ãõ ñ  ÃÕ Ñ',[normal]);
           impf(13,01,'Exemplos:',[EXPANDIDO, negrito]);
           impf(14,01,'Normal em 10 cpp e italico',[NORMAL, italico]);
           impf(15,01,'Comprimido em 12 cpp negrito e italico',[comp12,negrito,italico]);

           impf(27,01,'Acento 5 : äëïöü ÄËÏÖÜ',[normal]);
           impf(27,40,'Cedilha  : ç Ç',[normal]);
           impf(28,01,'Especiais: Primeiro=1º  Primeira=1ª  1/4=¼  1/2=½  3/4=¾   Parágrafo=§',[normal]);

           impf(19,01,'DELTRESS INFORMÁTICA',[EXPANDIDO, negrito]);
           imp (20,01,'   R.Nassimen Mussi, 575 - Jd.Itaipú');
           impf(21,01,'     17519-570  -  Marília  -  SP',[NORMAL]);
           impf(22,01,'       Fone/Fax (14) 427-5322',[normal, negrito]);
           impf(23,01,'   E-mail: deltress@mii.zaz.com.br',[normal]);
           impf(16,01,'Se precisar de mais espaco passe para 17cpp + sublinhado',[comp17,sublinhado]);
           impf(17,01,'Sua descrição é maior ainda, então use 20cpp',[comp20]);

           imp (30,01,'   R.Nassimen Mussi, 575 - Jd.Itaipú 1');
           imp (30,01,'   R.Nassimen Mussi, 575 - Jd.Itaipú   2');
           imp (30,01,'   R.Nassimen Mussi, 575 - Jd.Itaipú     3');
           fechar;   // Finaliza e inicia impressao ou preview
           end
        else
           showmessage('Relatorio cancelado');   
        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     linha  := 0;
     pagina := 1;
     // Liga evento cabecalho/rodape
     rdprint1.OnBeforeNewPage := rodape;
     rdprint1.OnNewPage       := cabecalho;

     // Configurações do Componente... (opcional)
     rdprint1.TamanhoQteLPP      := seis;
     rdprint1.PreviewZoom        := strtoint(edit1.text);
     rdprint1.Preview            := checkbox1.Checked;
     rdprint1.UsaGerenciadorImpr := checkbox2.Checked;
     rdprint1.UsaNovoMetodoPrint := checkbox3.Checked;
     rdprint1.TestarPorta        := checkbox4.Checked;

     // Fonte Default (Opcional)
     case radiogroup1.itemindex of
       0 : begin
           rdprint1.FonteTamanhoPadrao := s10cpp;
           rdprint1.TamanhoQteColunas  := 80;
           end;
       1 : begin
           rdprint1.FonteTamanhoPadrao := s12cpp;
           rdprint1.TamanhoQteColunas  := 96;
           end;
       2 : begin
           rdprint1.FonteTamanhoPadrao := s17cpp;
           rdprint1.TamanhoQteColunas  := 136;
           end;
       3 : begin
           rdprint1.FonteTamanhoPadrao := s20cpp;
           rdprint1.TamanhoQteColunas  := 160;
           end;
       end;

     table1.active            := true;
     rdprint1.abrir;
     while not table1.eof do
        begin
        if linha > 64 then // Salto de Pagina chama automaticamente cabecalho/rodape
           rdprint1.novapagina;
        rdprint1.imp  (linha,01,table1razao.value);
        rdprint1.impf (linha,45,table1cidade.value,[comp20]);
        rdprint1.imp  (linha,68,table1estado.value);
        rdprint1.imp  (linha,72,table1cep.value);
        inc(linha);
        table1.next;
        end;
//     rdprint1.setup;
     rdprint1.fechar;
     table1.active:=false;
end;

procedure TForm1.Rprint1Erro(Sender: TObject; Mensagem: String);
begin
     showmessage(mensagem);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     dfm_bradesco.showmodal;
end;

procedure TForm1.RDprint1Erro(Sender: TObject; Mensagem: String);
begin
     showmessage('Mesagem do componente => ' + mensagem);
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
     // Como chekar se a impressora esta pronta
     if rdprint1.OnLine(RDPRINT1.PortaComunicacao) then
        showmessage(rdprint1.ErroPRN)
     else
        showmessage(rdprint1.ErroPRN);
end;

procedure TForm1.Rodape(Sender: TObject);
begin
     // Rodapé...
     rdprint1.impf(65,01,'===============================================================================',[normal]);
     rdprint1.impf(66,01,'Deltress Informática Ltda',[comp17,italico]);
     rdprint1.impf(66,65,'Demonstração RdPrint',[comp17]);
end;

procedure TForm1.Cabecalho(Sender: TObject);
begin
     // Cabeçalho...
     rdprint1.impf(01,01,'===============================================================================',[normal]);
     rdprint1.impf(02,20,'RELATÓRIO DE CLIENTES', [expandido,NEGRITO]);
     rdprint1.impf(03,01,'Deltress Informática Ltda',[normal]);
     rdprint1.impf(03,72,'Pag: ' + formatfloat('000',pagina),[normal]);
     rdprint1.impf(04,01,'===============================================================================',[normal]);
     inc(pagina);
     linha  := 5;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
     linha : integer;
begin
     rdprint1.OnBeforeNewPage := nil;
     rdprint1.OnNewPage       := nil;

     // Configurações do Componente... (opcional)
     rdprint1.TamanhoQteLPP      := seis;
     rdprint1.PreviewZoom        := strtoint(edit1.text);
     rdprint1.Preview            := checkbox1.Checked;
     rdprint1.UsaGerenciadorImpr := checkbox2.Checked;
     rdprint1.UsaNovoMetodoPrint := checkbox3.Checked;
     rdprint1.TestarPorta        := checkbox4.Checked;

     // Fonte Default (Opcional)
     case radiogroup1.itemindex of
       0 : begin
           rdprint1.FonteTamanhoPadrao := s10cpp;
           rdprint1.TamanhoQteColunas  := 80;
           end;
       1 : begin
           rdprint1.FonteTamanhoPadrao := s12cpp;
           rdprint1.TamanhoQteColunas  := 96;
           end;
       2 : begin
           rdprint1.FonteTamanhoPadrao := s17cpp;
           rdprint1.TamanhoQteColunas  := 136;
           end;
       3 : begin
           rdprint1.FonteTamanhoPadrao := s20cpp;
           rdprint1.TamanhoQteColunas  := 160;
           end;
       end;

     rdprint1.abrir;
     for linha := 0 to memo1.Lines.Count - 1 do
        begin
        rdprint1.ImpF(linha +1,2,memo1.lines[linha],[normal]);
        end;
     rdprint1.fechar;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
     memo1.Width := memo1.Width - 5;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
     memo1.Width := memo1.Width + 5;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     // O Exemplo abaixo só funciona com o NOVO MÉTHODO DE IMPRESSÃO
     // Este, permite uma impressão mais realista, ou seja, 100% = preview alem
     // de oferecer novos recursos como:
     // SUBSCRIÇÃO DE TEXTOS: Negrito forçado para aqueles casos em que não era possível
     // ALINHAMENTO PERFEITO: Não importa quais as fontes utilizadas o alinhamento será sempre perfeito
     // ENVIO DE COMANDOS:    Além de textos voce poderá enviar suas próprias sequencias ASCII (IMPASCII)
     // CAIXA: Voce pode facilmente criar caixas, e preenche-la como se fosse um formulário veja exemplo abaixo.
     rdprint1.TamanhoQteLPP   := oito;
     rdprint1.OnBeforeNewPage := nil;
     rdprint1.OnNewPage       := nil;

     // Configurações do Componente... (opcional)
     rdprint1.TamanhoQteLPP      := seis;
     rdprint1.PreviewZoom        := strtoint(edit1.text);
     rdprint1.Preview            := checkbox1.Checked;
     rdprint1.UsaGerenciadorImpr := checkbox2.Checked;
     rdprint1.UsaNovoMetodoPrint := checkbox3.Checked;
     rdprint1.TestarPorta        := checkbox4.Checked;

     // Fonte Default (Opcional)
     case radiogroup1.itemindex of
       0 : begin
           rdprint1.FonteTamanhoPadrao := s10cpp;
           rdprint1.TamanhoQteColunas  := 80;
           end;
       1 : begin
           rdprint1.FonteTamanhoPadrao := s12cpp;
           rdprint1.TamanhoQteColunas  := 96;
           end;
       2 : begin
           rdprint1.FonteTamanhoPadrao := s17cpp;
           rdprint1.TamanhoQteColunas  := 136;
           end;
       3 : begin
           rdprint1.FonteTamanhoPadrao := s20cpp;
           rdprint1.TamanhoQteColunas  := 160;
           end;
       end;

     with Rdprint1 do
        begin
        abrir;

//*** teste 1 - Desenhando formulário e preenchendo...

        // Primeiro monto a caixa.... (fica mais facil montar e visualizar)
        imp (01,01,'+---------------------------------------+----------------------------+');
        imp (02,01,'|                                       |                            |');
        imp (03,01,'+--------------+--------+---------------+----------------------------+');
        imp (04,01,'|              |        |                                            |');
        imp (05,01,'|              |        |                                            |');
        imp (06,01,'|              |        |                                            |');
        imp (07,01,'|              |        |                                            |');
        imp (08,01,'|              |        |                                            |');
        imp (09,01,'|              |        |                                            |');
        imp (10,01,'+--------------+--------+--------------------------------------------+');

        // Depois é só preencher....
        imp (02,03,'RECIBO DE PAGAMENTO');
        imp (02,03,'RECIBO DE PAGAMENTO');  // Provoca reimpressão (negrito)
        imp (02,03,'RECIBO DE PAGAMENTO');  // Provoca reimpressão (negrito)
        imp (02,43,'Janeiro/2000');
        imp (4,19,'001');
        imp (5,19,'002');
        imp (6,19,'003');
        imp (7,19,'004');
        impf(4,28,'Salário Base Mensal',[comp12]);
        impf(5,28,'Horas Extras 50%',[comp12]);
        impf(6,28,'Adicional Insalubridade',[comp12]);
        impf(7,28,'INSS sobre salários',[comp12]);
        impf(4,03,'R$  325,00',[Italico]);
        impf(5,03,'R$   37,98',[Italico]);
        impf(6,03,'R$   20,40',[Italico]);
        impf(7,03,'R$   13,78',[Italico]);

//*** teste 2 - Posicionamento real (Preview x Impressão)

        impf (12,01,'1234567890123456789012345678901234567890',[expandido]);
        impF (13,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890',[]);
        impF (14,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890',[NORMAL]);
        impF (15,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890',[COMP12]);
        impF (16,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890',[COMP17]);
        impF (17,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890',[COMP20]);
        imp (18,01,'UM');
        imp (18,20,'VINTE');
        imp (18,60,'SESSENTA');
        impF(19,01,'UM',[NORMAL]);
        impF(19,20,'VINTE',[NORMAL]);
        impF(19,60,'SESSENTA',[NORMAL]);
        impF(20,01,'UM',[COMP12]);
        impF(20,20,'VINTE',[COMP12]);
        impF(20,60,'SESSENTA',[COMP12]);
        impF(21,01,'UM',[COMP17]);
        impF(21,20,'VINTE',[COMP17]);
        impF(21,60,'SESSENTA',[COMP17]);
        impF(22,01,'UM',[COMP20]);
        impF(22,20,'VINTE',[COMP20]);
        impF(22,60,'SESSENTA',[COMP20]);
        impF(23,01,'UM',[EXPANDIDO]);
        impF(23,20,'VINTE',[EXPANDIDO]);
        impF(23,60,'SESSENTA',[EXPANDIDO]);

//*** teste 3 - Alinhamento à direita, só funciona corretamente se a fonte for igual a default

        impd (25, 15, '153,78', []);
        impd (26, 15, '123,178,37', []);
        impd (27, 15, '2.125,75', []);
        impd (28, 15, '123.456.125,55', []);
        impd (29, 15, '0,02', []);

        impd (25, 75, 'Novo recurso para a', []);
        impd (26, 75, 'impressão de texto e valores', []);
        impd (27, 75, 'alinhados à direita', []);
        impd (28, 75, 'Para isso voce deve informar', []);
        impd (29, 75, 'a coluna da direita como coluna de impressão', []);

//*** teste 4 - Impressão Centralizada

        impc (31, 10,'*', []);
        impc (32, 10,'***', []);
        impc (33, 10,'*****', []);
        impc (34, 10,'*******', []);
        impc (35, 10,'*********', []);
        impc (36, 10,'*******', []);
        impc (37, 10,'*****', []);
        impc (38, 10,'***', []);
        impc (39, 10,'*', []);

        imp  (31, 50,'|');
        impc (32, 50,'Novo recurso para a', []);
        impc (33, 50,'impressão de texto centralizados', [comp12]);
        impc (34, 50,'Informe a posição inicial (limite a direita)', [comp17]);
        impc (35, 50,'e o tamanho máximo da string a ser centralizada', [comp20]);
        impc (36, 50,'Ex: IMPC (1,25,50,''esta linha''[]''', [normal]);
        impc (37, 50,'DELTRESS', [EXPANDIDO]);

        imp  (42, 01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890');
        imp  (41, 10, '1');
        imp  (41, 20, '2');
        imp  (41, 30, '3');
        imp  (41, 40, '4');
        imp  (41, 50, '5');
        imp  (41, 60, '6');
        imp  (41, 70, '7');
        imp  (41, 80, '8');
        impc (43, 10,'*', []);
        impc (44, 10,'***', []);
        impc (45, 10,'*****', []);
        impc (46, 10,'*******', []);
        impc (47, 10,'*********', []);
        impc (48, 10,'*******', []);
        impc (49, 10,'*****', []);
        impc (50, 10,'***', []);
        impc (51, 10,'*', []);

        impc (43, 50,'A|A',[]);
        impc (44, 50,'Novo recurso para a', []);
        impc (45, 50,'impressão de texto centralizados', [comp12]);
        impc (46, 50,'Informe a posição inicial (limite a direita)', [comp17]);
        impc (47, 50,'e o tamanho máximo da string a ser centralizada', [comp20]);
        impc (48, 50,'Ex: IMPC (1,25,50,''esta linha''[]''', [normal]);
        impc (49, 50,'DELTRESS', [EXPANDIDO]);

        impc (53, 15,'*', []);
        impc (54, 15,'**', []);
        impc (55, 15,'***', []);
        impc (56, 15,'****', []);
        impc (57, 15,'*****', []);
        impc (58, 15,'******', []);
        impc (59, 15,'*******', []);
        impc (60, 15,'********', []);
        impc (61, 15,'*********', []);
        impc (62, 15,'**********', []);
        impc (63, 15,'***********', []);

        impc (53, 50,'B|B',[]);
        impc (54, 50,'**********|**********', []);
        impc (55, 50,'***************|***************', []);
        impc (56, 50,'************|************', []);
        impc (57, 50,'********************|********************', []);
        impc (58, 50,'********|********', []);
        impc (59, 50,'****|****', []);

        fechar;
        end;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
     // Valida Opçoes..
     // Se for usar gerenciador de impressão, então deve: 1) Usar o Novo Metodo
     //                                                   2) Desligar o TestarPorta
     checkbox3.checked := checkbox2.checked;
     checkbox4.checked := not checkbox2.checked;
     checkbox4.enabled := not checkbox2.checked;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
     // Se quizer testar porta, não pode usar o gerenciador...
     checkbox2.enabled := not checkbox4.checked;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
     checkbox2.Enabled := checkbox3.Checked;
     if checkbox3.checked = false then
        begin
        checkbox2.Enabled := false;
        checkbox2.checked := false;
        end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
     coluna : integer;
begin
     // Liga evento cabecalho/rodape
     rdprint1.OnBeforeNewPage := nil;
     rdprint1.OnNewPage       := nil;

     // Configurações do Componente... (opcional)
     rdprint1.TamanhoQteLPP      := seis;
     rdprint1.PreviewZoom        := strtoint(edit1.text);
     rdprint1.Preview            := checkbox1.Checked;
     rdprint1.UsaGerenciadorImpr := checkbox2.Checked;
     rdprint1.UsaNovoMetodoPrint := checkbox3.Checked;
     rdprint1.TestarPorta        := checkbox4.Checked;

     // Fonte Default (Opcional)
     case radiogroup1.itemindex of
       0 : begin
           rdprint1.FonteTamanhoPadrao := s10cpp;
           rdprint1.TamanhoQteColunas  := 80;
           end;
       1 : begin
           rdprint1.FonteTamanhoPadrao := s12cpp;
           rdprint1.TamanhoQteColunas  := 96;
           end;
       2 : begin
           rdprint1.FonteTamanhoPadrao := s17cpp;
           rdprint1.TamanhoQteColunas  := 136;
           end;
       3 : begin
           rdprint1.FonteTamanhoPadrao := s20cpp;
           rdprint1.TamanhoQteColunas  := 160;
           end;
       end;

     // Altura do Formulário (no caso é a altura da etiqueta...)
     rdprint1.TamanhoQteLinhas := 6; //(linhas utéis + espaço entre etiquetas)

     coluna := 0;  // este valor é usado para não saltar pagina na primeira etiqueta...

     table1.active            := true;
     rdprint1.abrir;
     while not table1.eof do
        begin
        if coluna <> 0 then   // Na primeira vez que passar aqui não saltara pagina
           rdprint1.Novapagina;

        // Primeira carreira...
        coluna := 01;
        rdprint1.imp (01,coluna,table1razao.value);
        rdprint1.imp (02,coluna,'Endereço Rua/Av ...');  // Não tem no cadastro
        rdprint1.imp (03,coluna,table1cidade.value + ' - ' + table1estado.value);
        rdprint1.imp (04,coluna,table1cep.value);
        rdprint1.impf(05,coluna+30,'Código: ' + table1codigo.value,[comp20]);
        table1.next; // proximo registro

        // Segunda carreira...
        if not table1.eof then // se não for fim do arquivo
           begin
           coluna := 41;
           rdprint1.imp (01,coluna,table1razao.value);
           rdprint1.imp (02,coluna,'Endereço Rua/Av ...');  // Não tem no cadastro
           rdprint1.imp (03,coluna,table1cidade.value + ' - ' + table1estado.value);
           rdprint1.imp (04,coluna,table1cep.value);
           rdprint1.impf(05,coluna+30,'Código: ' + table1codigo.value,[comp20]);
           table1.next;
           end;

        end;
     rdprint1.fechar;
     rdprint1.TamanhoQteLinhas := 66; // Voltar o valor original...
     table1.active:=false;
end;

end.
