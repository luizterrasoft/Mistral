unit U_RECURSOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, RDprint, printers, Winspool, ComCtrls;

type
  TDFM_RECURSOS = class(TForm)
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button5: TButton;
    Label2: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Button8: TButton;
    BitBtn4: TBitBtn;
    RDprint1: TRDprint;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Bevel3: TBevel;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label7: TLabel;
    Bevel4: TBevel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    RDprint2: TRDprint;
    Bevel5: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RDprint1Erro(Sender: TObject; Mensagem: String);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RDprint1BeforePrint(Sender: TObject; var Continuar: Boolean);
    procedure RDprint1AfterPrint(Sender: TObject);
    procedure RDprint1Preview(Sender: TObject);
    procedure RDprint1Load(Sender: TObject; var ArquivoLocal: String);
    procedure RDprint1Save(Sender: TObject; var ArquivoLocal: String);
    procedure RDprint1Cancel(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DFM_RECURSOS  : TDFM_RECURSOS;

implementation

uses BRADESCO, U_clientessimples, Etiquetas, U_clientesquebra, NOTAFISCAL;
{$R *.DFM}


procedure TDFM_RECURSOS.BitBtn1Click(Sender: TObject);
begin
     // Inicio...
     with rdprint1 do
        begin
        abrir;  // inicializa o arquivo de impressao...
        if setup then  // abre tela para escolha da impressora e modelo...
           begin
           rdprint1.box (5,50,10,58,false); // False = Linha simples
           rdprint1.box (5,70,10,78,true);  // True  = Linha dupla

           impf(02,01,'RDPRINT 3.0',[EXPANDIDO, NEGRITO]);
           impf(02,25,'- COMPONENTE DE IMPRESSÃO',[NORMAL, NEGRITO]);
           impf(03,01,'NOTAS FISCAIS, DUPLICATAS, BOLETOS E RELATÓRIOS EM GERAL',[NORMAL]);

           impf(05,01,'CARACTERíSTICAS:',[NORMAL, NEGRITO]);
           impf(06,01,'* Preview real com zoom',[NORMAL]);
           impf(07,01,'* Setup para usuário final',[NORMAL]);
           impf(08,01,'* Impressão rápida e precisa',[normal]);
           impf(09,01,'* Montagem dinâmica de páginas,',[NORMAL]);
           impf(10,01,'* Fontes em 5,10,12,17 e 20 cpp',[NORMAL]);
           impf(11,01,'* Imprime 6 e 8 linhas / polegada',[NORMAL]);
           impf(12,01,'* Negrito,itálico,sublinhado',[NORMAL]);

           impf(15,01,'Exemplos:',[EXPANDIDO, negrito]);
           impf(16,01,'Normal em 10 cpp e italico',[NORMAL, italico]);
           impf(17,01,'Comprimido em 12 cpp negrito e italico',[comp12,negrito,italico]);


           impf(27,01,'Acento 1 : áéíóú ÁÉÍÓÚ',[normal]);
           impf(27,40,'Acento 2 : àèìòù ÀÈÌÒÙ',[normal]);
           impf(28,01,'Acento 3 : âêîôû ÂÊÎÔÛ',[normal]);
           impf(28,40,'Acento 4 : ãõ ñ  ÃÕ Ñ',[normal]);
           impf(29,01,'Acento 5 : äëïöü ÄËÏÖÜ',[normal]);
           impf(29,40,'Cedilha  : ç Ç',[normal]);
           impf(30,01,'Especiais: Primeiro=1º  Primeira=1ª  1/4=¼  1/2=½  3/4=¾   Parágrafo=§',[normal]);

           impf(21,01,'DELTRESS INFORMÁTICA',[EXPANDIDO, negrito]);
           imp (22,01,'   R.Nassimen Mussi, 575 - Jd.Itaipú');
           impf(23,01,'     17519-570  -  Marília  -  SP',[NORMAL]);
           impf(24,01,'       Fone/Fax (14) 427-5322',[normal, negrito]);
           impf(25,01,'   E-mail: deltress@mii.zaz.com.br',[normal]);
           impf(18,01,'Se precisar de mais espaco passe para 17cpp + sublinhado',[comp17,sublinhado]);
           impf(19,01,'Sua descrição é maior ainda, então use 20cpp',[comp20]);


           // Teste pessoal

           impf(40,01,'12345678901234567890 DELTRESS Deltress Informática',[normal]);
           impf(41,01,'12345678901234567890 DELTRESS Deltress Informática',[comp12]);
           impf(42,01,'12345678901234567890 DELTRESS Deltress Informática',[comp17]);
           impf(43,01,'12345678901234567890 DELTRESS Deltress Informática',[comp20]);

           impf(45,01,'12345678901234567890 DELTRESS Deltress Informática',[normal,sublinhado]);
           impf(46,01,'12345678901234567890 DELTRESS Deltress Informática',[comp12,sublinhado]);
           impf(47,01,'12345678901234567890 DELTRESS Deltress Informática',[comp17,sublinhado]);
           impf(48,01,'12345678901234567890 DELTRESS Deltress Informática',[comp20,sublinhado]);

           impf(50,01,'12345678901234567890 DELTRESS Deltress Informática',[normal,negrito]);
           impf(51,01,'12345678901234567890 DELTRESS Deltress Informática',[comp12,negrito]);
           impf(52,01,'12345678901234567890 DELTRESS Deltress Informática',[comp17,negrito]);
           impf(53,01,'12345678901234567890 DELTRESS Deltress Informática',[comp20,negrito]);

           fechar;   // Finaliza e inicia impressao ou preview
           end
        else
           showmessage('Relatório Cancelado');
        end;
end;

procedure TDFM_RECURSOS.RDprint1Erro(Sender: TObject; Mensagem: String);
begin
     showmessage('Mensagem do componente => ' + mensagem);
end;


procedure TDFM_RECURSOS.Button3Click(Sender: TObject);
begin
     // Como chekar se a impressora esta pronta
     if rdprint1.OnLine(RDPRINT1.PortaComunicacao) then
        showmessage(rdprint1.ErroPRN)
     else
        showmessage(rdprint1.ErroPRN);
end;

procedure TDFM_RECURSOS.Button4Click(Sender: TObject);
var
     linha : integer;
begin
     rdprint1.abrir;
     for linha := 0 to memo1.Lines.Count - 1 do
        begin
        rdprint1.ImpF(linha +1,2,memo1.lines[linha],[normal]);
        end;
     rdprint1.fechar;
end;

procedure TDFM_RECURSOS.BitBtn2Click(Sender: TObject);
begin
     memo1.Width := memo1.Width - 5;
end;

procedure TDFM_RECURSOS.BitBtn3Click(Sender: TObject);
begin
     memo1.Width := memo1.Width + 5;
end;

procedure TDFM_RECURSOS.Button5Click(Sender: TObject);
begin
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
        impF (15,01,'123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456',[COMP12]);
        impF (16,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890' +
                    '123456789012345678901234567890123456789012345678901234567',[COMP17]);
        impF (17,01,'12345678901234567890123456789012345678901234567890123456789012345678901234567890' +
                    '12345678901234567890123456789012345678901234567890123456789012345678901234567890',[COMP20]);
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

        imp  (64, 01,'_________');
        fechar;
        end;
end;

procedure TDFM_RECURSOS.Button8Click(Sender: TObject);
begin
     rdprint1.abrir;

     //  Desenhando Linhas Horizontais
     RDprint1.impF(02, 01, '1) "LINHAH" - Linhas Horizontais:',[negrito]);
     // Traço Duplo
     RDprint1.ImpF(04,01,'Traço Duplo',[italico]);
     RDprint1.LinhaH(06,2,34,0,True);
     RDprint1.LinhaH(08,2,34,1,true);
     RDprint1.LinhaH(10,2,34,2,true);
     RDprint1.LinhaH(12,2,34,3,true);
     // Traço Simples
     RDprint1.ImpF(14,01,'Traço Simples',[italico]);
     RDprint1.LinhaH(16,2,34,0,false);
     RDprint1.LinhaH(18,2,34,1,false);
     RDprint1.LinhaH(20,2,34,2,false);
     RDprint1.LinhaH(22,2,34,3,false);


     //  Desenhando Linhas Verticais
     RDprint1.impF(02, 41, '2) "LINHAV" - Linhas Verticais:',[negrito]);
     // Traço Duplo
     RDprint1.ImpF(04,42,'Traço Duplo',[italico]);
     RDprint1.LinhaV(42,6,22,0,True);
     RDprint1.LinhaV(45,6,22,1,true);
     RDprint1.LinhaV(48,6,22,2,true);
     RDprint1.LinhaV(51,6,22,3,true);
     // Traço Simples
     RDprint1.ImpF(04,60,'Traço Simples',[italico]);
     RDprint1.LinhaV(60,6,22,0,false);
     RDprint1.LinhaV(63,6,22,1,false);
     RDprint1.LinhaV(66,6,22,2,false);
     RDprint1.LinhaV(69,6,22,3,false);



     //  Desenhando Box...
     RDprint1.impF(25, 01, '3) "BOX" - Desenhando Caixas Simples / Duplas:',[negrito]);
     rdprint1.Box(27,2,32,38,False);
     rdprint1.Box(27,42,32,78,True);



     //  Desenhando Box complexos
     RDprint1.impF(34, 01, '4) "IMPBOX" - Desenhando Caixas Simples / Duplas:',[negrito]);
     // Exemplo de um Box com linhas duplas...
     rdprint1.impBox(35,2,'A====================T==========B');
     rdprint1.impBox(36,2,'I                    I          I');
     rdprint1.impBox(37,2,'I                    I          I');
     rdprint1.impBox(38,2,'[====================#==========]');
     rdprint1.impBox(39,2,'I                    I          I');
     rdprint1.impBox(40,2,'I                    I          I');
     rdprint1.impBox(41,2,'D====================V==========C');

     // Exemplo de um Box com linhas simples...
     rdprint1.impBox(35,42,'a------------t-----------------b');
     rdprint1.impBox(36,42,'i            i                 i');
     rdprint1.impBox(37,42,'i            i                 i');
     rdprint1.impBox(38,42,'<------------+----------------->');
     rdprint1.impBox(39,42,'i            i                 i');
     rdprint1.impBox(40,42,'i            i                 i');
     rdprint1.impBox(41,42,'d------------v-----------------c');


     RDprint1.impF(45, 01, '5) "IMPVAL" - Impressão de Valores com Mascaras e Alinhamento',[negrito]);
     rdprint1.ImpVal(47,5,'###,###,##0.00;;0.00',123345.78,[]);
     rdprint1.ImpVal(48,5,'###,###,##0.00;;0.00',12.78,[]);
     rdprint1.ImpVal(49,5,'###,###,##0.00;;0.00',1.78,[]);
     rdprint1.ImpVal(50,5,'###,###,##0.00;;#',0.00,[]);
     rdprint1.ImpVal(51,5,'###,###,##0.00;;0.00',1245.78,[]);


     rdprint1.fechar;

end;

procedure TDFM_RECURSOS.BitBtn4Click(Sender: TObject);
begin
     // Carrega e visualiza um relatório salvo com o RDprint 3.0 (Formato RDP)...
     if opendialog1.execute then
        begin
        rdprint1.Abrir;
        rdprint1.LerRDP(opendialog1.filename);
        rdprint1.Fechar;
        end;
end;

procedure TDFM_RECURSOS.RDprint1BeforePrint(Sender: TObject;
  var Continuar: Boolean);
var
     msg : string;
begin
     msg := '';
     msg := msg + 'Porta:'   +  rdprint1.PortaComunicacao + #13;
     msg := msg + 'Inicial:' + inttostr(rdprint1.PaginaInicial)+ #13;
     msg := msg + 'Final:'   + inttostr(rdprint1.PaginaFinal)+ #13;
     case rdprint1.impressora of
        epson         : msg := msg + 'Impressora: Epson'+ #13;
        HP            : msg := msg + 'Impressora: HP'+ #13;
        grafico       : msg := msg + 'Impressora: Grafico'+ #13;
        personalizado : msg := msg + 'Impressora: Personalizada'+ #13;
        rima          : msg := msg + 'Impressora: Rima'+ #13;
        end;

     msg := msg + 'Continuar impressão ?';
     if MessageDlg(msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Continuar := true
     else
        continuar := false;
end;

procedure TDFM_RECURSOS.RDprint1AfterPrint(Sender: TObject);
begin
     showmessage('Fim da Impressão');
end;

procedure TDFM_RECURSOS.RDprint1Preview(Sender: TObject);
begin
     showmessage('Vou mostrar o preview agora...');
end;

procedure TDFM_RECURSOS.RDprint1Load(Sender: TObject; var ArquivoLocal: String);
begin
     showmessage('Vou LER o arquivo ' + ArquivoLocal);
end;

procedure TDFM_RECURSOS.RDprint1Save(Sender: TObject; var ArquivoLocal: String);
begin
     showmessage('Vou Salvar o arquivo ' + ArquivoLocal);
end;

procedure TDFM_RECURSOS.RDprint1Cancel(Sender: TObject);
begin
     Showmessage('Vai Cancelar...');
end;

procedure TDFM_RECURSOS.BitBtn5Click(Sender: TObject);
begin
     DFM_NOTA.showmodal;
end;

procedure TDFM_RECURSOS.BitBtn7Click(Sender: TObject);
begin
     DFM_ETQ.showmodal;
end;

procedure TDFM_RECURSOS.BitBtn8Click(Sender: TObject);
begin
     DFM_CLIENTESSIMPLES.showmodal;
end;

procedure TDFM_RECURSOS.BitBtn9Click(Sender: TObject);
begin
     DFM_CLIENTESQUEBRA.showmodal;
end;

procedure TDFM_RECURSOS.BitBtn6Click(Sender: TObject);
begin
     DFM_BRADESCO.showmodal;
end;

procedure TDFM_RECURSOS.BitBtn10Click(Sender: TObject);
begin
     if not RDprint2.SetPrinterbyName(edit1.text) then
        begin
        Showmessage('Impressora Não Localizada...');
        exit;
        end;
     RDprint2.Abrir;
     RDprint2.Imp(01,01,'Imprimindo na impressora selecionada por SetPrintByName');
     RDprint2.Imp(03,01,'Impressora escolhida foi : ' + Edit1.text);
     RDprint2.Fechar;
end;

procedure TDFM_RECURSOS.BitBtn11Click(Sender: TObject);
begin
     if not RDprint2.SetPrinterbyPorta(edit2.text) then
        begin
        Showmessage('Impressora Não Localizada...');
        exit;
        end;
     RDprint2.Abrir;
     RDprint2.Imp(01,01,'Imprimindo na impressora selecionada por SetPrinterByPorta');
     RDprint2.Imp(03,01,'Impressora escolhida foi : ' + Edit2.text);
     RDprint2.Fechar;
end;

end.
