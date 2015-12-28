unit un_MudarOp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus;

type
  Tfrm_MudarOp = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtOp1: TMaskEdit;
    pnOp1: TPanel;
    edtOp2: TMaskEdit;
    pnOp2: TPanel;
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
    procedure edtOp1Enter(Sender: TObject);
    procedure edtOp2Enter(Sender: TObject);
    procedure edtOp2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtOp2DblClick(Sender: TObject);
    procedure botao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_operador: Real;
  end;

var
  frm_MudarOp: Tfrm_MudarOp;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, f8Users, auxiliar;

{$R *.DFM}

procedure Tfrm_MudarOp.edtOp1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarOp.edtOp2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarOp.edtOp2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: String;
begin
  if (key=K_ENTER) then
  begin
    codigo:=Trim(edtOp2.text);
    if (codigo<>'') then
    begin
      edtOp2.text:=form_nz(strtofloat(codigo),4);
      pnOp2.caption:=ProcuraNomeUsuario(strtofloat(codigo),self);
      botao1Click(Sender);
    end;
  end;
  if (key=K_F8) then
    with (frm_f8Users) do
    begin
      left:=287;
      top :=76;
      edit:=edtOp2;
      showmodal;
    end;
end;

procedure Tfrm_MudarOp.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarOp.Limparformulrio1Click(Sender: TObject);
begin
  edtOp2.text:='';
  pnOp2.caption:='';
  edtOp2.setfocus;
end;

procedure Tfrm_MudarOp.Abrirsesso1Click(Sender: TObject);
var
  clConf: TClassAuxiliar;
begin
     {CRITICA}   
  if (Trim(edtOp2.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do novo operador não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtOp2.setfocus;
  end
  else
  begin
    y_operador := strtofloat(Trim(edtOp2.text));
          {*************************************************************}
    clConf := TClassAuxiliar.Create;
    clConf.conect   ('VENDAS',self);
    clConf.ClearSql;
    clConf.AddParam ('UPDATE CONF SET CODIGO_OPERADOR=:codigo_operador ');
    clConf.consulta.parambyname('codigo_operador').AsFloat := y_operador;
    clConf.Execute;
    clConf.desconect;
    clConf.Free;
          {*************************************************************}
    close;
  end;
end;

procedure Tfrm_MudarOp.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_MudarOp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    botao_sairClick(sender);
end;

procedure Tfrm_MudarOp.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (y_operador=-1) then
  begin
    edtOp1.text := '0000';
    pnOp1.caption := 'ADMINISTRADOR';
  end
  else
  begin
    edtOp1.text   := form_nz(y_operador,4);
    pnOp1.caption := ProcuraNomeUsuario(y_operador,self);
  end;
  edtOp2.setfocus;
end;

procedure Tfrm_MudarOp.edtOp2DblClick(Sender: TObject);
begin
  with (frm_f8Users) do
  begin
    left:=287;
    top :=76;
    edit:=edtOp2;
    showmodal;
  end;
end;

procedure Tfrm_MudarOp.botao1Click(Sender: TObject);
begin
  Abrirsesso1.click;
end;

end.
