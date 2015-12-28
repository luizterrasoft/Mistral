unit AplicDelphi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    NumCmd: TEdit;
    Label2: TLabel;
    Arg: TEdit;
    Label3: TLabel;
    TamRet: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    SaiRet: TEdit;
    Label6: TLabel;
    SaiTamRet: TEdit;
    Label7: TLabel;
    RetZAPIF_ECF: TEdit;
    Enviar: TButton;
    Configurar: TButton;
    LeituraX: TButton;
    Venda: TButton;
    VendaAutentica: TButton;
    Cheque: TButton;
    Limpar: TButton;
    Fechar: TButton;
    Resultado: TMemo;
    CNFVinculado: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ConfigurarClick(Sender: TObject);
    procedure LeituraXClick(Sender: TObject);
    procedure FecharClick(Sender: TObject);
    procedure LimparClick(Sender: TObject);
    procedure VendaClick(Sender: TObject);
    procedure VendaAutenticaClick(Sender: TObject);
    procedure ChequeClick(Sender: TObject);
    procedure EnviarClick(Sender: TObject);
    procedure CNFVinculadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{Declarar as funcoes da dll do ECF}
function ZAPIF (n_com : Integer ; parg , pret : PChar; tam : integer ; result , tamret : PChar) : Integer ;
stdcall ; external 'ZAPIF.DLL' ;

//procedure ZConfECF ( ) ;  // versao 4.00
//stdcall ; external 'ZAPIF.DLL' ;
procedure ZConfECF ;
stdcall ; external 'ZAPIF.DLL' ;

var
  Form1: TForm1;
  ret,cmd:Integer;
  A: array [0..40] of Char;
  B: array [0..300] of Char;
  C: array [0..40] of Char;
  D: array [0..300] of Char;
  result,argum ,tam_ret,pretorno :PChar;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
     Form1.Left := 193;  // posicao da janale
     Form1.Top  := 106;
     Resultado.Text:='';
end;

procedure TForm1.ConfigurarClick(Sender: TObject);
begin
     ZConfECF ( );
end;

procedure TForm1.LeituraXClick(Sender: TObject);
begin
     result:=A;
     argum:=B;

     argum:='\1\'; // com rel gerencial
     ret:= ZAPIF (70,argum,NIL,0,result,NIL);
     if ret = 0 then
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- OK'; // retorno da ZAPIF
           Resultado.Text:='';
           SaiTamRet.Text:='';
        end
     else
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
           SaiTamRet.Text:='';
        end;

     argum:='\1\ZAPIF DELPHI\\'; // texto rel gerencial
     ret:= ZAPIF (8,argum,NIL,0,result,NIL);
     if ret = 0 then
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- OK'; // retorno da ZAPIF
           Resultado.Text:='';
           SaiTamRet.Text:='';
        end
     else
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
           SaiTamRet.Text:='';
        end;
     argum:='\0\\\\\\\\\'; // fim da impressao
     ret:= ZAPIF (21,argum,NIL,0,result,NIL);
     if ret = 0 then
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- OK'; // retorno da ZAPIF
           Resultado.Text:='';
           SaiTamRet.Text:='';
        end
     else
        begin
           RetZAPIF_ECF.Text:=result;
           SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
           SaiTamRet.Text:='';
        end
end;

procedure TForm1.FecharClick(Sender: TObject);
begin
Application.Terminate();
end;

procedure TForm1.LimparClick(Sender: TObject);
begin
     SaiRet.Text:= '';
     Resultado.Text:='';
     SaiTamRet.Text:='';
     RetZAPIF_ECF.Text:='';
end;

procedure TForm1.VendaClick(Sender: TObject);
begin
     result:=A;
     argum:=B;

  // Abrir cupom fiscal
  argum:='\\';
  ret:= ZAPIF (10,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Registrar item
  //Inserir codigo do item
  argum:='\1234567890\';
  ret:= ZAPIF (12,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Descricao do item
  argum:='\Leite MUUUUUU\';
  ret:= ZAPIF (13,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Registrar o item
  argum:='\2,00\3000\L\600\T1800\\';
  ret:= ZAPIF (11,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Totalizar
  argum:='\\600\';
  ret:= ZAPIF (17,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Forma de pagamento - Dinheiro com troco
  argum:='\1\\1000\';
  ret:= ZAPIF (24,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Finalizar
  argum:='\0\----------------------------------------\              VOLTE SEMPRE              \           LOJAS SUPER BARATO           \----------------------------------------\\\\\';
  ret:= ZAPIF (21,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
end;

procedure TForm1.VendaAutenticaClick(Sender: TObject);
begin
  //****************************
  //** Venda com autenticação **
  //****************************
     result:=A;
     argum:=B;
     tam_ret:=C;
     pretorno:=D;

  // Abrir cupom fiscal
  argum:='\1\';
  ret:= ZAPIF (10,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Registrar item
  argum:='\1234567890\';
  ret:= ZAPIF (12,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Descricao do item
  argum:='\Cafe Ronaldinho\';
  ret:= ZAPIF (13,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Registrar o item
  argum:='\5,00\2000\kg\1000\T1800\\';
  ret:= ZAPIF (11,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  argum:='\\1000\';
  ret:= ZAPIF (17,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Forma de pagamento - Dinheiro com troco
  argum:='\2\\1000\';
  ret:= ZAPIF (24,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // colocar o papel
  Application.MessageBox('Colocar Papel para Autenticar','Teste',MB_OK );
  // Teste papel presente para autenticar
  pretorno := '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\';
  while pretorno = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\' do
  begin
    argum:='\0\0\0\0\0\0\0\0\1\0\0\0\0\0\0\0\';
    pretorno:=D;
    ret:= ZAPIF (41,argum,pretorno,40,result,tam_ret);
    if (ret<>0) then
    begin
         RetZAPIF_ECF.Text:=result;
         SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
         Exit;
    end;
  end;

  //Autenticacao
  argum:='\Autent 01\Autent 02\';
  ret:= ZAPIF (5,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  //Finalizar
  argum:='\0\----------------------------------------\              VOLTE SEMPRE              \           LOJAS SUPER BARATO           \----------------------------------------\\\\\';
  ret:= ZAPIF (21,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end

end;

procedure TForm1.ChequeClick(Sender: TObject);
begin
  //*************************
  //** Impressao de Cheque **
  //*************************
   result:=A;
   argum:=B;

  //Impressao de Cheque
  argum:='\341\150000\Zanthus\Sao Paulo\15101999\CPF:123.456.789-0\Fone:5182-2484\REAL\REAIS\';
  ret:= ZAPIF (27,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end
end;

procedure TForm1.EnviarClick(Sender: TObject);
var
   T:array [0..16] of Char;
   Buf:PChar;
   Cmd,ret,len,tam : integer;
begin
   Buf:=T;
   result:=A;
   argum:=B;
   tam_ret:=C;
   pretorno:=D;
       // limpa os campos
     SaiRet.Text:= '';
     Resultado.Text:='';
     SaiTamRet.Text:='';
     RetZAPIF_ECF.Text:='';
     //Pegar os valores;
     // argumentos
     len:=Arg.GetTextLen();
     if len = 0 then
        argum:=NIL
      else
          Arg.GetTextBuf(argum,len+1);
     // tamanho do buffer de retorno
     len:=TamRet.GetTextLen();
     if len = 0 then
        tam:=0
     else begin
          TamRet.GetTextBuf(Buf,len+1);
          tam:=StrToInt(Buf);
     end;
     // numero do comando
     len:=NumCmd.GetTextLen();
     NumCmd.GetTextBuf(Buf,len+1);
     Cmd:=StrToInt(Buf);
        if len = 0 then
           begin
              ShowMessage ('Comando Inválido');
           end
        else
         begin
              D:=''; // limpa buffer pretorno
              C:=''; // limpa buffer tam_ret
              ret:= ZAPIF (Cmd,argum,pretorno,tam,result,tam_ret);
              if ret = 0 then
                 begin
                   RetZAPIF_ECF.Text:=result;
                   SaiRet.Text:=IntToStr(ret) + '- OK'; // retorno da ZAPIF
                   Resultado.Text:=pretorno;
                   SaiTamRet.Text:=tam_ret;
                 end
              else
                  begin
                   RetZAPIF_ECF.Text:=result;
                   SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
                   SaiTamRet.Text:=tam_ret;
                  end
          end
end;


procedure TForm1.CNFVinculadoClick(Sender: TObject);
begin
     result:=A;
     argum:=B;

  // Abrir cupom nao fiscal vinculado
  argum:='\0\';
  ret:= ZAPIF (4,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // Pula linha
  argum:='\4\';
  ret:= ZAPIF (6,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  // Imprimir texto 1
  argum:='\1\OPERACAO CONSOLIDADA \\';
  ret:= ZAPIF (8,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // Pula linha
  argum:='\4\';
  ret:= ZAPIF (6,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;

  // Imprimir texto 2
  argum:='\0\------------------------------\\';
  ret:= ZAPIF (8,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // Imprimir texto 3
  argum:='\0\RECONHECO E PAGAREI IMPORTANCIA ACIMA\\';
  ret:= ZAPIF (8,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // Pula linha
  argum:='\4\';
  ret:= ZAPIF (6,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
  // Finaliza operacao
  argum:='\0\\\\\\\\\';
  ret:= ZAPIF (21,argum,NIL,0,result,NIL);
  if (ret<>0) then
  begin
     RetZAPIF_ECF.Text:=result;
     SaiRet.Text:=IntToStr(ret) + '- ERRO'; // retorno da ZAPIF
     Exit;
  end;
end;

end.
