unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, TEF, ExtCtrls;

type
  TForm1 = class(TForm)
    TEF1: TTEF;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    TipoOperacao: TRadioGroup;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    RadioGroup2: TRadioGroup;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

Uses Unit2;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Tef1.Confirmacao;
end;

//============== Verifica/ativa gerenciador padrao =================
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if Tef1.CheckGerenciador=True then
     ShowMessage('Gerenciador Padrão Ok')
  else
     ShowMessage('Não foi possível ativar o Gerenciador Padrão');
end;
//================= envia forma de pagamento =======================
procedure TForm1.BitBtn3Click(Sender: TObject);
var
 x:String;
 tipo,i,j:Integer;
 Valor:Double;
begin
 Valor:=0.01;
 if RadioGroup1.ItemIndex=0 then
    Valor:=0.01;  // valor da operacao
 if RadioGroup1.ItemIndex=1 then
    Valor:=1;     // valor da operacao
 if RadioGroup1.ItemIndex=2 then
    Valor:=2;     // valor da operacao

 if TipoOperacao.ItemIndex = 0 then
    Tipo:=0                   // cartao
 else
    Tipo:=1;                  // cheque

 if Tef1.Tef(Tipo,Valor) then
  begin
    i:=0;
    while i=0 do
     begin
       if Tef1.TemResposta then
        begin
          x:=Tef1.LeCampos;
          Cupom.Memo1.Clear;
          for j:=1 to Tef1.Linhas_Tef do
           begin
             Cupom.Memo1.Lines.Add(Tef1.MAT_CUPOM[j]);
           end;
           ShowMessage(Tef1.Mensagem_Tef);
           if Tef1.Linhas_Tef<>0 then
              Cupom.ShowModal;
           Tef1.ApagaResposta;
           Break;
        end;
     end;
  end
 else
    ShowMessage('Sem Sucesso !');
end;

//=============== Funcao administrativa ==========================

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  i,j:Integer;
  x:String;
begin
 if Tef1.ADM then
  begin
    i:=0;
    while i=0 do
     begin
       if Tef1.TemResposta then
        begin
          x:=Tef1.LeCampos;
          Cupom.Memo1.Clear;
          for j:=1 to Tef1.Linhas_Tef do
           begin
             Cupom.Memo1.Lines.Add(tef1.MAT_CUPOM[j]);
           end;
           ShowMessage(Tef1.Mensagem_Tef);
           if Tef1.Linhas_Tef<>0 then
              Cupom.ShowModal;
          Break;
        end;
     end;
  end
 else
    ShowMessage('Sem Sucesso !');
 Tef1.ApagaResposta;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Tef1.NaoConfirmacao;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex=0 then
     Tef1.Rede:=0
  else
     Tef1.Rede:=1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Tef1.ApagaResposta;
end;





end.
