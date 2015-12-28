unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PrgFiscal;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button13: TButton;
    Button14: TButton;
    PrgFiscal1: TPrgFiscal;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno1 pretorno: ' + pretorno + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno2 result: ' + result + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno3 tam_ret: ' + tam_ret + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno4 D: ' + D + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno5 argum: ' + argum + '- ', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno1 pretorno: ' + pretorno + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno2 result: ' + result + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno3 tam_ret: ' + tam_ret + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno4 D: ' + D + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno5 argum: ' + argum + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\0\0\0\0\1\0\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno1 pretorno: ' + pretorno + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno2 result: ' + result + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno3 tam_ret: ' + tam_ret + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno4 D: ' + D + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno5 argum: ' + argum + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  //Teste, leitura de status da impressora
  argum:='\0\0\0\0\0\0\0\1\0\0\0\0\0\0\0\0\';
  pretorno:=D;
  ret:= ZAPIF(41,argum,pretorno,40,result,tam_ret);
  if ( ret <> 0 ) then
  begin
     MessageDlg('Erro no ECF, como a seguir: ' + IntToStr(ret) + '- ERRO', mtInformation, [mbOk],0);
  end
  else if ( ret = 0 ) then
  begin
     MessageDlg('Mensagem de retorno: ' + IntToStr(ret) + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno1 pretorno: ' + pretorno + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno2 result: ' + result + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno3 tam_ret: ' + tam_ret + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno4 D: ' + D + '- ', mtInformation, [mbOk],0);
     MessageDlg('Mensagem de retorno5 argum: ' + argum + '- ', mtInformation, [mbOk],0);
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
 ZConfECF();
end;

end.
