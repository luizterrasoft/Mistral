unit un_MudarTerminal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus;

type
  Tfrm_MudarTerminal = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtNumero1: TMaskEdit;
    edtNumero2: TMaskEdit;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    botao1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    procedure edtNumero1Enter(Sender: TObject);
    procedure edtNumero2Enter(Sender: TObject);
    procedure edtNumero2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_terminal: Real;
  end;

var
  frm_MudarTerminal: Tfrm_MudarTerminal;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, f8Users, auxiliar;

{$R *.DFM}

procedure Tfrm_MudarTerminal.edtNumero1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarTerminal.edtNumero2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarTerminal.edtNumero2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender);
end;

procedure Tfrm_MudarTerminal.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarTerminal.Limparformulrio1Click(Sender: TObject);
begin
  edtNumero2.text:='';
  edtNumero2.setfocus;
end;

procedure Tfrm_MudarTerminal.Abrirsesso1Click(Sender: TObject);
var
  clSeq: TClassAuxiliar;
begin
     {CRITICA}
  if (Trim(edtNumero2.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O novo número do caixa não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero2.setfocus;
  end
  else
  begin
    y_terminal := strtofloat(Trim(edtNumero2.text));
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    if (frm_principal.x_tipo_funcionamento_sistema<>0) then
      clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET CODIGO_TERMINAL=:codigo_terminal ')
    else
      clSeq.AddParam ('UPDATE SEQATDO.DBF SET CODIGO_TERMINAL=:codigo_terminal ');

    clSeq.consulta.parambyname('codigo_terminal').AsFloat := y_terminal;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    close;
  end;
end;

procedure Tfrm_MudarTerminal.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_MudarTerminal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    botao_sairClick(sender);
end;

procedure Tfrm_MudarTerminal.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtNumero1.text := floattostr(y_terminal);
  edtNumero2.text := floattostr(y_terminal);
  edtNumero2.setfocus;
end;

procedure Tfrm_MudarTerminal.botao1Click(Sender: TObject);
begin
  Abrirsesso1.click;
end;

end.
