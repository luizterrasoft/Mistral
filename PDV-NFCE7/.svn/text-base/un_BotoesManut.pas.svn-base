unit un_BotoesManut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_BotoesManut = class(TForm)
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesManut: Tfrm_BotoesManut;

implementation

uses principal, un_senhaSupervisor, unMensagem, auxiliar, funcoes1, funcoes2, procura,
  unDialogo, un_senhaCaixa, un_ListaItensEstoque, un_inventario1,
  un_ImportarContagem, un_ExportarContagem, un_Indexar;

{$R *.DFM}

procedure Tfrm_BotoesManut.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesManut.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesManut.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_Indexar,frm_Indexar);
  frm_Indexar.showmodal;
  frm_Indexar.Free;
end;

procedure Tfrm_BotoesManut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao2.color=clWhite) then
      botao2Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender);
end;

procedure Tfrm_BotoesManut.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesManut.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
end;

procedure Tfrm_BotoesManut.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesManut.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesManut.botao2Click(Sender: TObject);
var
  clAtualizaVersao: TClassAuxiliar;
begin
  if (frmDialogo.ExibirMensagem ('Confirma atualização do banco de dados'
    ,'Vendas',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
          //*******************************************************************************8
    clAtualizaVersao := TClassAuxiliar.Create;
    clAtualizaVersao.conect   ('VENDAS',self);
    clAtualizaVersao.ClearSql;
    clAtualizaVersao.AddParam ('UPDATE CONF SET VERSAO_SISTEMA=:versao_sistema ');
    clAtualizaVersao.consulta.parambyname('versao_sistema').AsDateTime := strtodate('01/01/1900');
    clAtualizaVersao.Execute;
    clAtualizaVersao.desconect;
    clAtualizaVersao.Free;

         //*******************************************************************************8
    frm_principal.AjustaBancoDeDadosVENDAS;
    frm_principal.AjustaBancoDeDadosCREDIARIO;
  end;
end;

end.
