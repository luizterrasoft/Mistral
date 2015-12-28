unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, urano,
  StdCtrls, procura;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses principal;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  URANOEFC_Pagamento(Pchar(trim(edit1.text)),
    Pchar(trim(edit2.text)),
    Pchar(trim(edit3.text)),
    Pchar(trim(edit4.text)));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  URANOEFC_FechaCupom (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self))); //fechamento do cupom
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  URANOEFC_Finaliza; //finaliza DLL usada
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  URANOEFC_CancelaVenda (Pchar(ProcuraNomeUsuario(frm_principal.x_codigousuario,self)));
end;

end.
