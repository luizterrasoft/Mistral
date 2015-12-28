unit unDiarioReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, Mask;

type
  Tfrm_DiarioRecebe = class(TForm)
    gPlano: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    edtInicial1: TMaskEdit;
    edtFinal1: TMaskEdit;
    pnPlano1: TPanel;
    pnPlano2: TPanel;
    ch1: TCheckBox;
    gContrato: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtInicial2: TMaskEdit;
    edtFinal2: TMaskEdit;
    ch2: TCheckBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtInicial3: TMaskEdit;
    edtFinal3: TMaskEdit;
    pnLoja1: TPanel;
    pnLoja2: TPanel;
    ch3: TCheckBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edtInicial4: TMaskEdit;
    edtFinal4: TMaskEdit;
    ch4: TCheckBox;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Registrarbaixadodocumento1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    lbF8mens: TLabel;
    lbF8: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    btnConfere: TButton;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtInicial5: TMaskEdit;
    edtFinal5: TMaskEdit;
    ch5: TCheckBox;
    chResumo: TCheckBox;
    chSalto: TCheckBox;
    rdOrdem: TRadioGroup;
    chSoResumo: TCheckBox;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure btnConfereClick(Sender: TObject);
    procedure edtInicial1Click(Sender: TObject);
    procedure edtInicial1Enter(Sender: TObject);
    procedure edtInicial1Exit(Sender: TObject);
    procedure edtInicial1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal1Click(Sender: TObject);
    procedure edtFinal1Enter(Sender: TObject);
    procedure edtFinal1Exit(Sender: TObject);
    procedure edtFinal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial2Enter(Sender: TObject);
    procedure edtInicial2Exit(Sender: TObject);
    procedure edtInicial2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal2Enter(Sender: TObject);
    procedure edtFinal2Exit(Sender: TObject);
    procedure edtFinal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial3DblClick(Sender: TObject);
    procedure edtInicial3Enter(Sender: TObject);
    procedure edtInicial3Exit(Sender: TObject);
    procedure edtInicial3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal3DblClick(Sender: TObject);
    procedure edtFinal3Enter(Sender: TObject);
    procedure edtFinal3Exit(Sender: TObject);
    procedure edtFinal3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial4Enter(Sender: TObject);
    procedure edtInicial4Exit(Sender: TObject);
    procedure edtInicial4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal4Enter(Sender: TObject);
    procedure edtFinal4Exit(Sender: TObject);
    procedure edtFinal4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtInicial5Enter(Sender: TObject);
    procedure edtFinal5Enter(Sender: TObject);
    procedure edtInicial5Exit(Sender: TObject);
    procedure edtFinal5Exit(Sender: TObject);
    procedure edtInicial5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFinal5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ch1Click(Sender: TObject);
    procedure ch1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch2Click(Sender: TObject);
    procedure ch2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch3Click(Sender: TObject);
    procedure ch3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch4Click(Sender: TObject);
    procedure ch4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ch5Click(Sender: TObject);
    procedure ch5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Registrarbaixadodocumento1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chSoResumoClick(Sender: TObject);
    procedure chSoResumoExit(Sender: TObject);
    procedure chResumoClick(Sender: TObject);
    procedure chResumoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparEdits;
  end;

var
  frm_DiarioRecebe: Tfrm_DiarioRecebe;

implementation

uses f8planos, principal, unDialogo, F8Lojas, funcoes1, funcoes2, credito,
  mem_prnt, procura, prestcontrato, unMensagem;

{$R *.DFM}

procedure Tfrm_DiarioRecebe.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_DiarioRecebe.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_DiarioRecebe.btnConfereClick(Sender: TObject);
begin
  Registrarbaixadodocumento1.click;
end;

procedure Tfrm_DiarioRecebe.edtInicial1Click(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    edit := edtInicial1;
    btnCadastro.visible:=true;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_DiarioRecebe.edtInicial1Enter(Sender: TObject);
begin
  edtInicial1.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe planos cadastrados';
end;

procedure Tfrm_DiarioRecebe.edtInicial1Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtInicial1.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtInicial1.text));
    pnPlano1.caption:=ProcuraTipoPlano (codigo,self);
    edtInicial1.text:=form_nz(codigo,4);
  end
  else
    edtInicial1.text:='0000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarioRecebe.edtInicial1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      edit                := edtInicial1;
      btnCadastro.visible := true;
      showmodal;
      btnCadastro.visible := true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. inicial: Formato 999',10);
end;

procedure Tfrm_DiarioRecebe.edtFinal1Click(Sender: TObject);
begin
  with (frm_f8planos) do
  begin
    edit := edtFinal1;
    btnCadastro.visible:=true;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_DiarioRecebe.edtFinal1Enter(Sender: TObject);
begin
  edtFinal1.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe planos cadastrados';
end;

procedure Tfrm_DiarioRecebe.edtFinal1Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtFinal1.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtFinal1.text));
    pnPlano2.caption:=ProcuraTipoPlano (codigo,self);
    edtFinal1.text:=form_nz(codigo,4);
  end
  else
    edtFinal1.text:='0000';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarioRecebe.edtFinal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial2.setfocus;
  if (key=K_CIMA) then
    edtInicial1.setfocus;
  if (key=K_F8) then
    with (frm_f8planos) do
    begin
      edit:=edtFinal1;
      btnCadastro.visible:=true;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano de pagto. final: Formato 999',10);
end;

procedure Tfrm_DiarioRecebe.edtInicial2Enter(Sender: TObject);
begin
  edtInicial2.selectall;
end;

procedure Tfrm_DiarioRecebe.edtInicial2Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end;
  if (edtInicial2.text='  /  /    ') then
    edtInicial2.text:='01/01/1900';
end;

procedure Tfrm_DiarioRecebe.edtInicial2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal2.setfocus;
  if (key=K_CIMA) then
    edtFinal1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.edtFinal2Enter(Sender: TObject);
begin
  edtFinal2.selectall;
end;

procedure Tfrm_DiarioRecebe.edtFinal2Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end;
  if (edtFinal2.text='  /  /    ') then
    edtFinal2.text:='31/12/5000';
end;

procedure Tfrm_DiarioRecebe.edtFinal2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial3.setfocus;
  if (key=K_CIMA) then
    edtInicial2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final dos contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.edtInicial3DblClick(Sender: TObject);
begin
     { with (frm_f8Lojas) do
       begin
         left:=287;
         top :=76;
         edit:=edtInicial3;
         showmodal;
       end;}
end;

procedure Tfrm_DiarioRecebe.edtInicial3Enter(Sender: TObject);
begin
  edtInicial3.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_DiarioRecebe.edtInicial3Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtInicial3.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtInicial3.text));
    pnLoja1.caption:=ProcuraNomeLoja (codigo,self);
    edtInicial3.text:=form_nz(codigo,3);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarioRecebe.edtInicial3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal3.setfocus;
  if (key=K_CIMA) then
    edtFinal2.setfocus;
  if (key=K_F8) then
     {with (frm_f8Lojas) do
         begin
           left:=287;
           top :=76;
           edit:=edtInicial3;
           showmodal;
         end;};
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja inicial: Formato 999',10);
end;

procedure Tfrm_DiarioRecebe.edtFinal3DblClick(Sender: TObject);
begin
    { with (frm_f8Lojas) do
       begin
         left:=287;
         top :=76;
         edit:=edtFinal3;
         showmodal;
       end;}
end;

procedure Tfrm_DiarioRecebe.edtFinal3Enter(Sender: TObject);
begin
  edtFinal3.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe lojas cadastradas';
end;

procedure Tfrm_DiarioRecebe.edtFinal3Exit(Sender: TObject);
var
  codigo: Real;
begin
  if (Trim(edtFinal3.text)<>'') then
  begin
    codigo:=strtofloat(Trim(edtFinal3.text));
    pnLoja2.caption:=ProcuraNomeLoja (codigo,self);
    edtFinal3.text:=form_nz(codigo,3);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_DiarioRecebe.edtFinal3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial4.setfocus;
  if (key=K_CIMA) then
    edtInicial3.setfocus;
  if (key=K_F8) then
     {with (frm_f8Lojas) do
         begin
           left:=287;
           top :=76;
           edit:=edtFinal3;
           showmodal;
         end;};
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código da loja final: Formato 999',10);
end;

procedure Tfrm_DiarioRecebe.edtInicial4Enter(Sender: TObject);
begin
  edtInicial4.selectall;
end;

procedure Tfrm_DiarioRecebe.edtInicial4Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial4.text) and (edtInicial4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial4.setfocus;
  end;
  if (edtInicial4.text='  /  /    ') then
    edtInicial4.text:='01/01/1900';
end;

procedure Tfrm_DiarioRecebe.edtInicial4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal4.setfocus;
  if (key=K_CIMA) then
    edtFinal3.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.edtFinal4Enter(Sender: TObject);
begin
  edtFinal4.selectall;
end;

procedure Tfrm_DiarioRecebe.edtFinal4Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal4.text) and (edtFinal4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal4.setfocus;
  end;
  if (edtFinal4.text='  /  /    ') then
    edtFinal4.text:='31/12/5000';
end;

procedure Tfrm_DiarioRecebe.edtFinal4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInicial5.setfocus; 
  if (key=K_CIMA) then
    edtInicial4.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de vencimento das prestações: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.edtInicial5Enter(Sender: TObject);
begin
  edtInicial5.selectall;
end;

procedure Tfrm_DiarioRecebe.edtFinal5Enter(Sender: TObject);
begin
  edtFinal5.selectall;
end;

procedure Tfrm_DiarioRecebe.edtInicial5Exit(Sender: TObject);
begin
  if (not IsDate (edtInicial5.text) and (edtInicial5.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do contrato',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial5.setfocus;
  end;
  if (edtInicial5.text='  /  /    ') then
    edtInicial5.text:='01/01/1900';
end;

procedure Tfrm_DiarioRecebe.edtFinal5Exit(Sender: TObject);
begin
  if (not IsDate (edtFinal5.text) and (edtFinal5.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do contrato',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal5.setfocus;
  end;
  if (edtFinal5.text='  /  /    ') then
    edtFinal5.text:='31/12/5000';
end;

procedure Tfrm_DiarioRecebe.edtInicial5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtFinal5.setfocus;
  if (key=K_CIMA) then
    edtFinal4.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data inicial do contratos: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.edtFinal5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfere.click; 
  if (key=K_CIMA) then
    edtInicial5.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data final do contrato: Formato 99/99/9999',10);
end;

procedure Tfrm_DiarioRecebe.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtInicial1.enabled:=true;   
  edtInicial1.setfocus;
  LimparEdits;
end;

procedure Tfrm_DiarioRecebe.FormActivate(Sender: TObject);
begin
     //... Questao de SEGURANCAO no sistema!!!!
     //......................................................................
  edtInicial3.text := form_nz(frm_principal.x_loja,2);
  edtInicial3Exit(edtInicial3);
  edtFinal3.text   := form_nz(frm_principal.x_loja,2);
  edtFinal3Exit(edtFinal3);
     //......................................................................
  edtInicial1.enabled:=true;
  edtInicial1.setfocus;
end;

procedure Tfrm_DiarioRecebe.LimparEdits;
begin
  edtInicial1.text:='';
  edtFinal1.text:='';
  edtInicial2.text:='';
  edtFinal2.text:='';
  edtInicial4.text:='';
  edtFinal4.text:='';
  edtInicial5.text:='';
  edtFinal5.text:='';
  ch1.checked      := false;
  habilitaEditRelat(edtInicial1);
  habilitaEditRelat(edtFinal1);
  ch2.checked      := false;
  habilitaEditRelat(edtInicial2);
  habilitaEditRelat(edtFinal2);
  ch3.checked      := false;
  habilitaEditRelat(edtInicial4);
  habilitaEditRelat(edtFinal4);
  ch5.checked      := false;
  habilitaEditRelat(edtInicial5);
  habilitaEditRelat(edtFinal5);
end;

procedure Tfrm_DiarioRecebe.ch1Click(Sender: TObject);
begin
  if (ch1.checked) then
  begin
    desabilitaEditRelat(edtInicial1);
    desabilitaEditRelat(edtFinal1);
    edtInicial2.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
    edtInicial1.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch1.checked) then
  begin
    desabilitaEditRelat(edtInicial1);
    desabilitaEditRelat(edtFinal1);
    edtInicial2.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial1);
    habilitaEditRelat(edtFinal1);
    edtInicial1.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch2Click(Sender: TObject);
begin
  if (ch2.checked) then
  begin
    desabilitaEditRelat(edtInicial2);
    desabilitaEditRelat(edtFinal2);
    edtInicial3.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial2);
    habilitaEditRelat(edtFinal2);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch2.checked) then
  begin
    desabilitaEditRelat(edtInicial2);
    desabilitaEditRelat(edtFinal2);
    edtInicial3.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial2);
    habilitaEditRelat(edtFinal2);
    edtInicial2.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch3Click(Sender: TObject);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch3.checked) then
  begin
    desabilitaEditRelat(edtInicial3);
    desabilitaEditRelat(edtFinal3);
    edtInicial4.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial3);
    habilitaEditRelat(edtFinal3);
    edtInicial3.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch4Click(Sender: TObject);
begin
  if (ch4.checked) then
  begin
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
    edtInicial5.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
    edtInicial4.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch4.checked) then
  begin
    desabilitaEditRelat(edtInicial4);
    desabilitaEditRelat(edtFinal4);
    edtInicial5.setfocus;
  end
  else
  begin
    habilitaEditRelat(edtInicial4);
    habilitaEditRelat(edtFinal4);
    edtInicial4.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch5Click(Sender: TObject);
begin
  if (ch5.checked) then
  begin
    desabilitaEditRelat(edtInicial5);
    desabilitaEditRelat(edtFinal5);
  end
  else
  begin
    habilitaEditRelat(edtInicial5);
    habilitaEditRelat(edtFinal5);
    edtInicial5.setfocus;
  end;
end;

procedure Tfrm_DiarioRecebe.ch5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ch5.checked) then
  begin
    desabilitaEditRelat(edtInicial5);
    desabilitaEditRelat(edtFinal5);
  end
  else
  begin
    habilitaEditRelat(edtInicial5);
    habilitaEditRelat(edtFinal5);
    edtInicial5.setfocus;
  end;
end;

{Opcao de impressao do relatorio ***}
procedure Tfrm_DiarioRecebe.Registrarbaixadodocumento1Click(
  Sender: TObject);
var
  clPrestCont: TClassPrestContrat;
  plano1,plano2,data1,data2,loja1,loja2,data3,data4,data5,data6: String;
  indGauge,totGauge,lojaant: Integer;
  recebant: TDateTime;
  totvalorloja,totvalor,totpago,totpagoloja: Real;
  totacre,totdcre,totacreloja,totdcreloja: Real;
  nomeloja,nome: String;
  tot_valor,tot_receb,tot_desc,tot_acre,dif: Real;
  total1,total2,total3,total4: Real;
  perc1,perc2,perc3,perc4: Real;
  testeloja,flagResumo,flagRelat: Boolean;
  ordemSec,obs,dias_variacao: String;
  diferenca: Real;
begin
  {CRITICA AS DATAS}
  if (not IsDate (edtInicial2.text) and (edtInicial2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data de recebimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial2.setfocus;
  end
  else
  if (not IsDate (edtFinal2.text) and (edtFinal2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data de recebimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal2.setfocus;
  end
  else
  if (not IsDate (edtInicial4.text) and (edtInicial4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial4.setfocus;
  end
  else
  if (not IsDate (edtFinal4.text) and (edtFinal4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data de vencimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal4.setfocus;
  end
  else
  if (not IsDate (edtInicial5.text) and (edtInicial5.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtInicial5.setfocus;
  end
  else
  if (not IsDate (edtFinal5.text) and (edtFinal5.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data dos contratos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtFinal5.setfocus;
  end
  else
  begin
     {FORMATACAO DOS DADOS DE ENTRADA ***}
    if (chSoResumo.checked) then
      chResumo.checked:=true;
    if (Trim(edtInicial1.text)='') and (not ch1.checked) then
      edtInicial1.text:='0000';
    if (Trim(edtFinal1.text)='') and (not ch1.checked) then
      edtFinal1.text:='9999';
    if (edtInicial2.text='  /  /    ') and (not ch2.checked) then
      edtInicial2.text:='01/01/1900';
    if (edtFinal2.text='  /  /    ') and (not ch2.checked) then
      edtFinal2.text:='31/12/5000';
    if (Trim(edtInicial3.text)='') and (not ch3.checked) then
      edtInicial3.text:='000';
    if (Trim(edtFinal3.text)='') and (not ch3.checked) then
      edtFinal3.text:='999';
    if (edtInicial4.text='  /  /    ') and (not ch4.checked) then
      edtInicial4.text:='01/01/1900';
    if (edtFinal4.text='  /  /    ') and (not ch4.checked) then
      edtFinal4.text:='31/12/5000';
    if (edtInicial5.text='  /  /    ') and (not ch5.checked) then
      edtInicial5.text:='01/01/1900';
    if (edtFinal5.text='  /  /    ') and (not ch5.checked) then
      edtFinal5.text:='31/12/5000';

     {Perguntas..}
    if (frmDialogo.ExibirMensagem ('Considerar loja onde a prestação foi liq.?',
      'Diario de recebimentos',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',
      250,200)=mrYes) then
      flagRelat:=true
    else
      flagRelat:=false;

     {filtros que serao aplicados às prestacoes}
    if (ch1.checked) then
    begin
      plano1 := '00';
      plano2 := '99999';
    end
    else
    begin
      plano1 := Trim(edtInicial1.text);
      plano2 := Trim(edtFinal1.text);
    end;
    if (ch2.checked) then
    begin
      data1  := FormataData(strtodate('01/01/1900'));
      data2  := FormataData(strtodate('31/12/5000'));
    end
    else
    begin
      data1  := FormataData(strtodate(Trim(edtInicial2.text)));
      data2  := FormataData(strtodate(Trim(edtFinal2.text)));
    end;
    if (ch3.checked) then
    begin
      loja1  := '00';
      loja2  := '99999';
    end
    else
    begin
      loja1  := Trim(edtInicial3.text);
      loja2  := Trim(edtFinal3.text);
    end;
    if (ch4.checked) then
    begin
      data3  := FormataData(strtodate('01/01/1900'));
      data4  := FormataData(strtodate('31/12/5000'));
    end
    else
    begin
      data3  := FormataData(strtodate(Trim(edtInicial4.text)));
      data4  := FormataData(strtodate(Trim(edtFinal4.text)));
    end;
    if (ch5.checked) then
    begin
      data5  := FormataData(strtodate('01/01/1900'));
      data6  := FormataData(strtodate('31/12/5000'));
    end
    else
    begin
      data5  := FormataData(strtodate(Trim(edtInicial5.text)));
      data6  := FormataData(strtodate(Trim(edtFinal5.text)));
    end;
    if (rdOrdem.itemindex=0) then
      ordemSec := 'CL_NOME'
    else
    if (rdOrdem.itemindex=1) then
      ordemSec := 'PC_CLIE'
    else
    if (rdOrdem.itemindex=2) then
      ordemSec := 'PC_CONT';

     {...}
    with (frm_mem_print) do
    begin
        {configurando o gerador de relatorios}
      PrepareReport;
      frm_principal.x_col_impressao := 132;
      frm_principal.x_arq_impressao := 'g04.rel';
      frm_principal.x_comando       := '15c';
      frm_principal.x_tam_fonte     := 8;
      Title:= 'DIÁRIO DE RECEBIMENTOS';
      frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}

        {iniciando o processamento do relatorio}
        {1. parte}
      mostra_mensagem ('Preparando relatório...Aguarde!');
      frm_mensagem.painel.visible:=true;
      frm_mensagem.gauge1.progress:=0;
      clPrestCont := TClassPrestContrat.Create;
      with (clPrestCont) do
      begin
        conect   ('CREDITO', self);
        ClearSql;
        AddParam ('Select PC_LOJA,PC_CONT,PC_CLIE,PC_NPRE,PC_PORT,PC_TPRE,     ');
        AddParam ('       PC_VALO,PC_DCON,PC_DVTO,PC_FATO,PC_AVAL,PC_PLAN,     ');
        AddParam ('       PC_DTPG,PC_VPAG,PC_LJPG                              ');
        AddParam ('From   CREPRABR,CRECTABR,CRECLI                             ');
        AddParam ('Where (PC_PLAN>='+plano1+')  AND (PC_PLAN<='+plano2+')  AND ');
        AddParam ('      (PC_DTPG>='+chr(39)+data1+chr(39)+') AND              ');
        AddParam ('      (PC_DTPG<='+chr(39)+data2+chr(39)+') AND              ');
        if (flagrelat) then
          AddParam ('   (PC_LJPG>='+loja1+') AND (PC_LJPG<='+loja2+')   AND ')
        else
          AddParam ('   (PC_LOJA>='+loja1+') AND (PC_LOJA<='+loja2+')  AND  ');
        AddParam ('      (PC_DVTO>='+chr(39)+data3+chr(39)+') AND              ');
        AddParam ('      (PC_DVTO<='+chr(39)+data4+chr(39)+') AND              ');
        AddParam ('      (PC_DCON>='+chr(39)+data5+chr(39)+') AND              ');
        AddParam ('      (PC_DCON<='+chr(39)+data6+chr(39)+') AND              ');
        AddParam ('      (PC_STAT='+chr(39)+'1'+chr(39)+') AND                 ');
        AddParam ('      (PC_CLIE=CR_CLIE) AND (PC_CONT=CR_CODI) AND           ');
        AddParam ('      (PC_CLIE=CL_CODI)                                     ');
        if (flagRelat) then
          AddParam ('Order By PC_LJPG,PC_DTPG,'+ordemSec+'                  ')
        else
          AddParam ('Order By PC_LOJA,PC_DTPG,'+ordemSec+'                  ');
        Execute;

             {iniciando impressao}
        if (not chSalto.checked) then
        begin
          if (ch1.checked) then
            AddLine('Planos..............: TODOS OS PLANOS')
          else
            AddLine('Planos..............: '+plano1+' a '+plano2);
          if (ch2.checked) then
            AddLine('Data de recebimento.: TODAS AS PRESTACOES')
          else
            Addline ('Data de recebimento.: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
          if (ch3.checked) then
          begin
            if (flagRelat) then
              AddLine('Loja do recebimento.: TODOS AS LOJAS')
            else
              AddLine('Lojas...............: TODOS AS LOJAS');
          end
          else
          if (flagRelat) then
            AddLine('Loja do recebimento.: '+loja1+' a '+loja2) 
          else
            AddLine('Lojas...............: '+loja1+' a '+loja2);
          if (ch4.checked) then
            AddLine('Data de vencimento..: TODAS AS PRESTACOES')
          else
            Addline ('Data de vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
          if (ch5.checked) then
            AddLine('Data dos contratos..: TODAS OS CONTRATOS')
          else
            Addline ('Data dos contratos..: '+Trim(edtInicial5.text)+' a '+Trim(edtFinal5.text));
          if (rdOrdem.itemindex=0) then
            AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
          else
          if (rdOrdem.itemindex=1) then
            AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
          else
          if (rdOrdem.itemindex=2) then
            AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
        end;

             {...}
        clPrestCont.first;
        recebant     := strtodate('01/01/1900');
        lojaant      := -1;
        totvalor     := 0.00;
        totpago      := 0.00;
        totvalorloja := 0.00;
        totpagoloja  := 0.00;
        totacre      := 0.00;
        totacreloja  := 0.00;
        totdcre      := 0.00;
        totdcreloja  := 0.00;
        indGauge     := 0;
        totGauge     := clPrestCont.reccount;
        while (not clPrestCont.eof) do
        begin
                  {Ordem: LOJA>>Data de pagamento}
                  {encontra loja diferente-}
          if (flagRelat) then
          begin
            if (clPrestCont.Result('PC_LJPG')<>lojaant) then
              testeLoja:=true
            else
              testeLoja:=false;
          end
          else
          if (clPrestCont.Result('PC_LOJA')<>lojaant) then
            testeLoja:=true
          else
            testeLoja:=false;
          if (testeLoja) then
          begin
            if (lojaant<>-1) then
            begin
              AddLine(form_tc('-',132,'-'));
              AddLine(form_tc(' ',67,' ')
                +'Total de '+datetostr(recebant)+' '+
                form_nc(totpago,14)+' '+
                form_nc(totvalor,14));
              AddLine(form_tc(' ',76,' ')
                +'Acrescimos: '+
                form_nc(totacre,13)+'     '
                +'Descontos: '+
                form_nc(totdcre,11));
              recebant := clPrestCont.Result('PC_DVTO');
              AddLine(form_tc(' ',67,' ')
                +'Total da loja '+form_n(lojaant,3)+'   '+
                form_nc(totpagoloja,14)+' '+
                form_nc(totvalorloja,14));
              AddLine(form_tc(' ',76,' ')
                +'Acrescimos: '+
                form_nc(totacreloja,13)+'     '
                +'Descontos: '+
                form_nc(totdcreloja,11));
              if (chSalto.checked) then
                AddLine(chr(12)+form_tc(' ',131,' '))
              else
                AddLine('');
            end;
            totvalor     := 0.00;
            totpago      := 0.00;
            totacre      := 0.00;
            totdcre      := 0.00;
            totvalorloja := 0.00;
            totpagoloja  := 0.00;
            totacreloja  := 0.00;
            totdcreloja  := 0.00;
            if (flagRelat) then
              lojaant := clPrestCont.Result('PC_LJPG')
            else
              lojaant := clPrestCont.Result('PC_LOJA');
            nomeloja     := ProcuraNomeLoja (lojaant, self);
            if (chSalto.checked) then
            begin
              if (ch1.checked) then
                AddLine('Planos..............: TODOS OS PLANOS')
              else
                AddLine('Planos..............: '+plano1+' a '+plano2);
              if (ch2.checked) then
                AddLine('Data de recebimento.: TODAS AS PRESTACOES')
              else
                Addline ('Data de recebimento.: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
              if (ch3.checked) then
              begin
                if (flagRelat) then
                  AddLine('Loja do recebimento.: TODOS AS LOJAS')
                else
                  AddLine('Lojas...............: TODOS AS LOJAS');
              end
              else
              if (flagRelat) then
                AddLine('Loja do recebimento.: '+loja1+' a '+loja2) 
              else
                AddLine('Lojas...............: '+loja1+' a '+loja2);
              if (ch4.checked) then
                AddLine('Data de vencimento..: TODAS AS PRESTACOES')
              else
                Addline ('Data de vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
              if (ch5.checked) then
                AddLine('Data dos contratos..: TODAS OS CONTRATOS')
              else
                Addline ('Data dos contratos..: '+Trim(edtInicial5.text)+' a '+Trim(edtFinal5.text));
              if (rdOrdem.itemindex=0) then
                AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
              else
              if (rdOrdem.itemindex=1) then
                AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
              else
              if (rdOrdem.itemindex=2) then
                AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
            end;
            AddLine (form_tc('-',132,'-'));
            AddLine (form_nz(lojaant,3)+' - '+nomeloja);
            AddLine (form_tc('-',132,'-'));
            AddLine ('Data do   | DOCTO.  NUMERO |                             | No. |   Data   | Dias de |    Valor       |    Valor  da | Diferenca |O ');
            AddLine ('Recebto.  |Lj   Cli    Ctr | Nome do Cliente             |Prest|  Vencto  | Variacao| Total Recebido |    Prestacao | Calculada |B.');
            AddLine (form_tc('-',132,'-'));
          end;

                  {separando por data de vencimento ***}
          if (clPrestCont.Result('PC_DTPG')<>recebant) then
          begin
            if (recebant<>strtodate('01/01/1900')) then
            begin
              AddLine(form_tc('-',132,'-'));
              AddLine(form_tc(' ',67,' ')
                +'Total de '+datetostr(recebant)+' '+
                form_nc(totpago,14)+' '+
                form_nc(totvalor,14));
              AddLine(form_tc(' ',76,' ')
                +'Acrescimos: '+
                form_nc(totacre,13)+'     '
                +'Descontos: '+
                form_nc(totdcre,11));
              AddLine('');
            end;
            totpago   := 0.00;
            totvalor  := 0.00;
            totacre      := 0.00;
            totdcre      := 0.00;
            recebant  := clPrestCont.Result('PC_DTPG');
          end;

                  {impressao das linhas ***}
          nome := ProcuraNomeClienteCod (clPrestCont.Result('PC_CLIE'),self);
          if (clPrestCont.Result('PC_DTPG')-clPrestCont.Result('PC_DVTO')>0) then
            dias_variacao:=form_n(clPrestCont.Result('PC_DTPG')-clPrestCont.Result('PC_DVTO'),3)+'apos'
          else
          if (clPrestCont.Result('PC_DTPG')-clPrestCont.Result('PC_DVTO')=0) then
            dias_variacao:=''
          else
            dias_variacao:=form_n((-1)*(clPrestCont.Result('PC_DTPG')-clPrestCont.Result('PC_DVTO')),3)+'ant';
          diferenca := clPrestCont.Result('PC_VPAG')-clPrestCont.Result('PC_VALO');
          obs := '';
          if (clPrestCont.Result('PC_VPAG')=0.00) then
          begin
            diferenca := 0.00;
            obs := 'RN';
          end
          else
          if (clPrestCont.Result('PC_VPAG')>clPrestCont.Result('PC_VALO')) then
          begin
            totacre := totacre  + diferenca;
            totacreloja := totacreloja + diferenca;
            obs := 'AC';
          end
          else
          if (clPrestCont.Result('PC_VPAG')<clPrestCont.Result('PC_VALO')) then
          begin
            totdcre := totdcre  + diferenca;
            totdcreloja := totdcreloja + diferenca;
            obs := 'DC';
          end;
          AddLine (form_data (clPrestCont.Result('PC_DTPG'))   +' '+
            form_nz   (clPrestCont.Result('PC_LOJA'),2) +'.'+
            form_nz   (clPrestCont.Result('PC_CLIE'),6) +'.'+
            form_nz   (clPrestCont.Result('PC_CONT'),6) +' '+
            form_t    (nome,30) +' '+
            form_nz   (clPrestCont.Result('PC_NPRE'),2) +'/'+
            form_nz   (clPrestCont.Result('PC_TPRE'),2) +' '+
            form_data (clPrestCont.Result('PC_DVTO'))   +' '+
            form_t    (dias_variacao,9)+' '+
            form_nc   (clPrestCont.Result('PC_VPAG'),15)+' '+
            form_nc   (clPrestCont.Result('PC_VALO'),14)+' '+
            form_nc   (diferenca,11)+' '+
            obs);
          totvalor     := totvalor + clPrestCont.Result('PC_VALO');
          totpago      := totpago  + clPrestCont.Result('PC_VPAG');
          totvalorloja := totvalorloja + clPrestCont.Result('PC_VALO');
          totpagoloja  := totpagoloja  + clPrestCont.Result('PC_VPAG');
          clPrestCont.next;
          indGauge:=indGauge+1;
          frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
          frm_mensagem.gauge1.refresh;
        end;
        AddLine(form_tc('-',132,'-'));
        AddLine(form_tc(' ',67,' ')
          +'Total de '+datetostr(recebant)+' '+
          form_nc(totpago,14)+' '+
          form_nc(totvalor,14));
        AddLine(form_tc(' ',76,' ')
          +'Acrescimos: '+
          form_nc(totacre,13)+'     '
          +'Descontos: '+
          form_nc(totdcre,11));
        AddLine(form_tc(' ',67,' ')
          +'Total da loja '+form_n(lojaant,3)+'   '+
          form_nc(totpagoloja,14)+' '+
          form_nc(totvalorloja,14));
        AddLine(form_tc(' ',76,' ')
          +'Acrescimos: '+
          form_nc(totacreloja,13)+'     '
          +'Descontos: '+
          form_nc(totdcreloja,11));

             {...}
        frm_mem_print.flagPodeImprimir := true; {*}
        if (chResumo.checked) then
        begin
          frm_mem_print.flagPodeImprimir := (not chSoResumo.checked); {*}
          if (chSalto.checked) then
            AddLine(chr(12)+form_tc(' ',131,' '))
          else
            AddLine('');
          frm_mem_print.flagPodeImprimir := true; {*}

             {... Calculando linha de totais ...}
          frm_mensagem.pn_mensagem.caption := 'Calculando linha de totais...';
          frm_mensagem.pn_mensagem.refresh;
          clPrestCont.first;
          indGauge := 0;
          while (not clPrestCont.eof) do
          begin
            total1 := total1 + result('PC_VPAG');
            total2 := total2 + result('PC_VALO');
            dif := result('PC_VPAG') - result('PC_VALO');
            if (dif<0) then
              total4:=total4+((-1)*dif)
            else
              total3:=total3+dif;
            clPrestCont.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;

             {2. parte - Resumo geral dos recebimentos por loja -------------->}
          if (chSalto.checked) then
          begin
            if (ch1.checked) then
              AddLine('Planos..............: TODOS OS PLANOS')
            else
              AddLine('Planos..............: '+plano1+' a '+plano2);
            if (ch2.checked) then
              AddLine('Data de recebimento.: TODAS AS PRESTACOES')
            else
              Addline ('Data de recebimento.: '+Trim(edtInicial2.text)+' a '+Trim(edtFinal2.text));
            if (ch3.checked) then
            begin
              if (flagRelat) then
                AddLine('Loja do recebimento.: TODOS AS LOJAS')
              else
                AddLine('Lojas...............: TODOS AS LOJAS');
            end
            else
            if (flagRelat) then
              AddLine('Loja do recebimento.: '+loja1+' a '+loja2) 
            else
              AddLine('Lojas...............: '+loja1+' a '+loja2);
            if (ch4.checked) then
              AddLine('Data de vencimento..: TODAS AS PRESTACOES')
            else
              Addline ('Data de vencimento..: '+Trim(edtInicial4.text)+' a '+Trim(edtFinal4.text));
            if (ch5.checked) then
              AddLine('Data dos contratos..: TODAS OS CONTRATOS')
            else
              Addline ('Data dos contratos..: '+Trim(edtInicial5.text)+' a '+Trim(edtFinal5.text));
            if (rdOrdem.itemindex=0) then
              AddLine('Ordem da listagem...: NOME DO CLIENTE    ')
            else
            if (rdOrdem.itemindex=1) then
              AddLine('Ordem da listagem...: CÓDIGO DO CLIENTE  ')
            else
            if (rdOrdem.itemindex=2) then
              AddLine('Ordem da listagem...: CÓDIGO DO CONTRATO ');
          end;
          AddLine ('(Resumo geral)');
          AddLine (form_tc('-',132,'-'));
          AddLine ('Nome da Loja           Codigo |  Recebimentos  % Part. |  Prestacoes   % Part  | Acrescimos   % Part. |  Descontos   % Part. ');
          AddLine (form_tc('-',132,'-'));
          clPrestCont.first;
          if (flagRelat) then
            lojaant   := clPrestCont.Result('PC_LJPG')
          else
            lojaant   := clPrestCont.Result('PC_LOJA');
          tot_valor := 0.00;
          perc1:=0.00;
          tot_receb := 0.00;
          perc2:=0.00;
          tot_desc  := 0.00;
          perc2:=0.00;
          tot_acre  := 0.00;
          perc3:=0.00;
          frm_mensagem.pn_mensagem.caption := 'Montando resumo por loja...';
          frm_mensagem.pn_mensagem.refresh;
          indGauge  := 0;
          while (not clPrestCont.eof) do
          begin
                  {Ordem: LOJA>>>}
            if (flagRelat) then
            begin
              if (clPrestCont.Result('PC_LJPG')<>lojaant) then
                testeLoja:=true
              else
                testeLoja:=false;
            end
            else
            if (clPrestCont.Result('PC_LOJA')<>lojaant) then
              testeLoja:=true
            else
              testeLoja:=false;
            if (testeLoja) then
            begin
              if (total1<>0.00) then
                perc1 := Round((tot_receb/total1)*100)
              else
                perc1:=0.00;
              if (total2<>0.00) then
                perc2 := Round((tot_valor/total2)*100)
              else
                perc2:=0.00;
              if (total3<>0.00) then
                perc3 := Round((tot_acre/total3)*100)
              else
                perc3:=0.00;
              if (total4<>0.00) then
                perc4 := Round((tot_desc/total4)*100)
              else
                perc4:=0.00;
              AddLine (form_t  (ProcuraNomeLoja(lojaant,self),25)+' '+
                form_nz (lojaant,2)+'       '+
                form_nc (tot_receb,10)+'  '+form_nc(perc1,6)+'      '+
                form_nc (tot_valor,10)+'  '+form_nc(perc2,6)+'     '+
                form_nc (tot_acre,10) +'  '+form_nc(perc3,6)+'     '+
                form_nc (tot_desc,10) +'  '+form_nc(perc4,6));
              if (flagRelat) then
                lojaant   := clPrestCont.Result('PC_LJPG')
              else
                lojaant   := clPrestCont.Result('PC_LOJA');
              tot_valor := 0.00;
              perc1:=0.00;
              tot_receb := 0.00;
              perc2:=0.00;
              tot_desc  := 0.00;
              perc2:=0.00;
              tot_acre  := 0.00;
              perc3:=0.00;
            end;

                  {impressao das linhas ***}
            dif := result('PC_VPAG') - result('PC_VALO');
            if (dif<0) then
              tot_desc:=tot_desc+((-1)*dif)
            else
              tot_acre:=tot_acre+dif;
            tot_receb:=tot_receb+result('PC_VPAG');
            tot_valor:=tot_valor+result('PC_VALO');
            clPrestCont.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          if (total1<>0.00) then
            perc1 := Round((tot_receb/total1)*100)
          else
            perc1:=0.00;
          if (total2<>0.00) then
            perc2 := Round((tot_valor/total2)*100)
          else
            perc2:=0.00;
          if (total3<>0.00) then
            perc3 := Round((tot_acre/total3)*100)
          else
            perc3:=0.00;
          if (total4<>0.00) then
            perc4 := Round((tot_desc/total4)*100)
          else
            perc4:=0.00;
          AddLine (form_t  (ProcuraNomeLoja(lojaant,self),25)+' '+
            form_nz (lojaant,2)+'       '+
            form_nc (tot_receb,10)+'  '+form_nc(perc1,6)+'      '+
            form_nc (tot_valor,10)+'  '+form_nc(perc2,6)+'     '+
            form_nc (tot_acre,10) +'  '+form_nc(perc3,6)+'     '+
            form_nc (tot_desc,10) +'  '+form_nc(perc4,6));
          AddLine(form_tc('-',132,'-'));
          AddLine('Total da empresa...:          '+form_nc(total1,15)+'         '+form_nc(total2,15)+'        '+
            form_nc(total3,15)+'        '+form_nc(total4,15));
          AddLine('');
        end;
      end;
      clPrestCont.desconect;
      clPrestCont.Free;

        {salto de pagina}
      if (frm_principal.x_salto) then
        AddLine(chr(18)+chr(12))
      else
        AddLine(chr(18));

      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
    end;
  end;
end;

procedure Tfrm_DiarioRecebe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_DiarioRecebe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frm_principal.x_ordem_diario_receb1 := rdOrdem.itemindex;
end;

procedure Tfrm_DiarioRecebe.FormCreate(Sender: TObject);
begin
  rdOrdem.itemindex := frm_principal.x_ordem_diario_receb1;
end;

procedure Tfrm_DiarioRecebe.chSoResumoClick(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarioRecebe.chSoResumoExit(Sender: TObject);
begin
  if (chSoResumo.checked) then
    chResumo.checked:=true;
end;

procedure Tfrm_DiarioRecebe.chResumoClick(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

procedure Tfrm_DiarioRecebe.chResumoExit(Sender: TObject);
begin
  if (not chResumo.checked) then
    chSoResumo.checked:=false;
end;

end.
