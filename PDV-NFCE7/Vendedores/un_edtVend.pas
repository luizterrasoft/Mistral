unit un_edtVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Menus, Buttons, ExtCtrls, vendedores;

type
  Tfrm_edtVend = class(TForm)
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Panel4: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelainclusao: TSpeedButton;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Incluirplano1: TMenuItem;
    Cancelarincluso1: TMenuItem;
    Excluirplano1: TMenuItem;
    Salvar1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    Outros1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Label2: TLabel;
    Bevel3: TBevel;
    edtCodigo: TMaskEdit;
    Label1: TLabel;
    edtNome: TMaskEdit;
    Label3: TLabel;
    edtCpf: TMaskEdit;
    Label14: TLabel;
    edtIden: TMaskEdit;
    Label15: TLabel;
    edtOExp: TMaskEdit;
    Label17: TLabel;
    edtNasc: TMaskEdit;
    Label18: TLabel;
    edtEnde: TMaskEdit;
    Label19: TLabel;
    edtBair: TMaskEdit;
    Label20: TLabel;
    edtCida: TMaskEdit;
    cbEsta: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    edtCep: TMaskEdit;
    Label25: TLabel;
    edtEmail: TMaskEdit;
    Label26: TLabel;
    edtTel: TMaskEdit;
    Label27: TLabel;
    edtCelu: TMaskEdit;
    Label28: TLabel;
    edtDatCont: TMaskEdit;
    Label29: TLabel;
    cbCargo: TComboBox;
    Label31: TLabel;
    edtCotaVista: TMaskEdit;
    Panel1: TPanel;
    imgFoto: TImage;
    Label36: TLabel;
    Label37: TLabel;
    Auxiliares1: TMenuItem;
    Salvar2: TMenuItem;
    btnComi: TButton;
    btnCalcular: TButton;
    Label32: TLabel;
    edtCotaPrazo: TMaskEdit;
    GroupBox1: TGroupBox;
    Label33: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    Label30: TLabel;
    edtComiss1: TMaskEdit;
    Label35: TLabel;
    edtComiss2: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtIdenEnter(Sender: TObject);
    procedure edtOExpEnter(Sender: TObject);
    procedure edtEndeEnter(Sender: TObject);
    procedure edtBairEnter(Sender: TObject);
    procedure edtCidaEnter(Sender: TObject);
    procedure cbEstaEnter(Sender: TObject);
    procedure edtCepEnter(Sender: TObject);
    procedure edtEmailEnter(Sender: TObject);
    procedure edtTelEnter(Sender: TObject);
    procedure edtCeluEnter(Sender: TObject);
    procedure edtNascEnter(Sender: TObject);
    procedure edtDatContEnter(Sender: TObject);
    procedure edtCargoEnter(Sender: TObject);
    procedure cbCargoEnter(Sender: TObject);
    procedure edtCotaVistaEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIdenKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOExpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEndeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBairKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCeluKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNascKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDatContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCotaVistaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCotaVistaExit(Sender: TObject);
    procedure edtCotaVistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Outros1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtNascExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstaExit(Sender: TObject);
    procedure Salvar2Click(Sender: TObject);
    procedure edtDatContExit(Sender: TObject);
    procedure btnComiClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure edtCotaPrazoEnter(Sender: TObject);
    procedure edtCotaPrazoExit(Sender: TObject);
    procedure edtCotaPrazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCotaPrazoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtComiss1Enter(Sender: TObject);
    procedure edtComiss2Enter(Sender: TObject);
    procedure edtComiss1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtComiss1Exit(Sender: TObject);
    procedure edtComiss2Exit(Sender: TObject);
    procedure edtComiss2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtComiss1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtComiss2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    modo: Integer;
    codigoinclusao: Integer;
    antNome: String;
    procedure LimparEdits;
    procedure HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
    procedure PreencheEditsVend (clVend: TClassVend);
    procedure CarregaFoto(codigo: Real);
  end;

var
  frm_edtVend: Tfrm_edtVend;

implementation

uses principal, f8Vend, unDialogo, f8Session, funcoes1, funcoes2, Rl_tite,
  mem_prnt, unMensagem, F8Lojas, procura;

{$R *.DFM}

procedure Tfrm_edtVend.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtVend.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_edtVend.LimparEdits;
begin
  edtCodigo.text:='';
  edtNome.text:='';
  edtCpf.text:='';
  edtIden.text:='';
  edtOExp.text:='';
  edtEnde.text:='';
  edtBair.text:='';
  edtCida.text:='';
  cbEsta.text:='';
  edtCep.text:='';
  edtEmail.text:='';
  edtTel.text:='';
  edtCelu.text:='';
  edtNasc.text:='';
  edtDatCont.text:='';
  cbCargo.text:='';
  edtCotaVista.text:='';
  edtCotaPrazo.text:='';
  edtComiss1.text:='';
  edtComiss2.text:='';
  edtLoja.text:='';
  pnLoja.caption:='';
end;

procedure Tfrm_edtVend.FormActivate(Sender: TObject);
begin
  edtCodigo.setfocus;
  if (btnIncluir.Glyph.Empty) then
    btnIncluir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_incluir.bmp');
  if (btnCancelaInclusao.Glyph.Empty) then
    btnCancelaInclusao.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_cancelincluir.bmp');
  if (btnExcluir.Glyph.Empty) then
    btnExcluir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_excluir.bmp');
  if (btnSalvar.Glyph.Empty) then
    btnSalvar.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_salvar.bmp');
  if (btnImprimir.Glyph.Empty) then
    btnImprimir.Glyph.LoadFromFile
    (frm_principal.x_pathimg+'btn_imprimir.bmp');
end;

procedure Tfrm_edtVend.edtCodigoEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtNomeEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCpfEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtIdenEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtOExpEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtEndeEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtBairEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCidaEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.cbEstaEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCepEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtEmailEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtTelEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCeluEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtNascEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtDatContEnter(Sender: TObject);
begin
  if (edtDatCont.text='  /  /    ') then
    edtDatCont.text:=datetostr(date);   
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCargoEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.cbCargoEnter(Sender: TObject);
begin
  cbCargo.selectall;
end;

procedure Tfrm_edtVend.edtCotaVistaEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtCodigo.text)='') then
      with (frm_f8Vend) do
      begin
        left:=287;
        top :=76;
        edit:=edtCodigo;
        btnCadastro.visible:=false;
        showmodal;
        btnCadastro.visible:=true;
      end
    else
      edtNome.setfocus;
  if (key=K_F8) then
    if (Modo=0) then
      with (frm_f8Vend) do
      begin
        left:=287;
        top :=76;
        edit:=edtCodigo;
        btnCadastro.visible:=false;
        showmodal;
        btnCadastro.visible:=true;
      end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do vendedor: Formato: 9999 (Até 04 dígitos) - <F8/Duplo clique> Exibe vendedores cadastrados ',10);
end;

procedure Tfrm_edtVend.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCpf.setfocus;
  if (key=K_CIMA) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do vendedor: até 40 caracteres.',10);
end;

procedure Tfrm_edtVend.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtIden.setfocus;
  if (key=K_CIMA) then
    edtNome.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   C.P.F. do vendedor: formato 999.999.999/99',10);
end;

procedure Tfrm_edtVend.edtIdenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtOExp.setfocus;
  if (key=K_CIMA) then
    edtCpf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Identidade do vendedor: até 25 dígitos',10);
end;

procedure Tfrm_edtVend.edtOExpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtEnde.setfocus;
  if (key=K_CIMA) then
    edtIden.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Orgão Expedidor da identidade: até 10 dígitos',10);
end;

procedure Tfrm_edtVend.edtEndeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtBair.setfocus;
  if (key=K_CIMA) then
    edtOExp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço do vendedor: até 50 caracteres',10);
end;

procedure Tfrm_edtVend.edtBairKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCida.setfocus;
  if (key=K_CIMA) then
    edtEnde.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Bairro do vendedor: até 30 caracteres',10);
end;

procedure Tfrm_edtVend.edtCidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    cbEsta.setfocus;
  if (key=K_CIMA) then
    edtBair.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cidade do vendedor: até 25 caracteres',10);
end;

procedure Tfrm_edtVend.cbEstaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtCep.setfocus;   
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Estado do vendedor: até 02 caracteres (escolha os possíveis)',10);
end;

procedure Tfrm_edtVend.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtEmail.setfocus;
  if (key=K_CIMA) then
    cbEsta.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   CEP do vendedor: formato 99999-99',10);
end;

procedure Tfrm_edtVend.edtEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtTel.setfocus;
  if (key=K_CIMA) then
    edtCep.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   E-mail do vendedor: até 50 caracteres',10);
end;

procedure Tfrm_edtVend.edtTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCelu.setfocus;
  if (key=K_CIMA) then
    edtEmail.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Telefone do vendedor: até 15 dígitos',10);
end;

procedure Tfrm_edtVend.edtCeluKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNasc.setfocus;
  if (key=K_CIMA) then
    edtCelu.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Celular do vendedor: até 15 dígitos',10);
end;

procedure Tfrm_edtVend.edtNascKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDatCont.setfocus;
  if (key=K_CIMA) then
    edtCelu.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de nascimento: Formato: 99/99/9999 ',10);
end;

procedure Tfrm_edtVend.edtDatContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    cbCargo.setfocus;
  if (key=K_CIMA) then
    edtNasc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de contratação na empresa: Formato: 99/99/9999 ',10);
end;

procedure Tfrm_edtVend.cbCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    edtComiss1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Categoria de vendedor: até 30 caracteres (selecione as opções sugeridas)',10);
end;

procedure Tfrm_edtVend.edtCotaVistaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtComiss2.setfocus;
  if (key=K_CIMA) then
    edtComiss1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cota mensal do total de contratos à vista: Formato: 9999,99 ',10);
end;

procedure Tfrm_edtVend.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: Boolean);
begin
  if (menu1) then
    Incluirplano1.enabled:=true
  else
    Incluirplano1.enabled:=false;
  if (menu2) then
  begin
    Cancelarincluso1.enabled:=true;
    btnCancelainclusao.enabled:=true;
  end
  else
  begin
    Cancelarincluso1.enabled:=false;
    btnCancelainclusao.enabled:=false;
  end;
  if (menu3) then
    Excluirplano1.enabled:=true
  else
    Excluirplano1.enabled:=false;
  if (menu4) then
    Salvar1.enabled:=true
  else
    Salvar1.enabled:=false;
  if (menu5) then
    Limparcadastro1.enabled:=true
  else
    Limparcadastro1.enabled:=false;
  if (menu6) then
    Imprimirplanos1.enabled:=true
  else
    Imprimirplanos1.enabled:=false;
end;

{Inclusao ***}
procedure Tfrm_edtVend.Incluirplano1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_VENDEDOR, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenus (false,true,false,true,true,true);
    if (CodigoInclusao=0) then
      CodigoInclusao := Round(MaxiCod2 ('VENDEDORES',frm_principal.barraDicas));
    LimparEdits;
    imgFoto.visible:=false;
    edtCodigo.text := form_nz (CodigoInclusao,4);
    edtCodigo.setfocus;
  end;
end;

procedure Tfrm_edtVend.Cancelarincluso1Click(Sender: TObject);
begin
  imgFoto.visible:=false;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

procedure Tfrm_edtVend.Limparcadastro1Click(Sender: TObject);
begin
  imgFoto.visible:=false;
  HabilitaMenus (true,false,false,false,true,true);
  LimparEdits;
  edtCodigo.text:='';
  edtCodigo.setfocus;
end;

{Exclusao ***}
procedure Tfrm_edtVend.Excluirplano1Click(Sender: TObject);
var
  clVend: TClassVend;
  codigo: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_USUARIO, 'E')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') and (Trim(edtNome.text)<>'') then
      with (clVend) do
        if (frmDialogo.ExibirMensagem ('Confirma exclusão do vendedor?'
          ,'Exclusão ',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
          clVend := TClassVend.Create;
          conect   ('ESTOQUE', self);
          ClearSql;
          AddParam ('Delete from VENDEDORES ');
          AddParam ('Where (VD_CODI='+codigo+')');
          Execute;
          desconect;
          Free;
          with (frm_f8Vend) do
            ds.dataset.close;
          HabilitaMenus (true,false,false,false,true,true);
          LimparEdits;
          edtCodigo.text:='';
          edtCodigo.setfocus;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_VENDEDOR,'E',strtoint(codigo),'','');
          frm_principal.ExibirDica (' Vendedor excluído com sucesso...',5);
        end
        else
          edtCodigo.setfocus;
  end;
end;

{Salvamento ***}
procedure Tfrm_edtVend.Salvar1Click(Sender: TObject);
var
  clVend: TClassVend;
  codigo: String;
begin
    {CRITICA do cadastro ***}
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do vendedor não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtNome.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Nome da vendedor não pode ficar vazio!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.setfocus;
  end
  else
  begin
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
      with (clVend) do
      begin
        clVend := TClassVend.Create;
        conect ('ESTOQUE', self);
        ClearSql;
        AddParam ('Select VD_CODI ');
        AddParam ('From   VENDEDORES ');
        AddParam ('Where  (VD_CODI='+codigo+')');
        frm_principal.BarraDicas.caption:='Salvando o vendedor...Aguarde!';
        frm_principal.refresh;
        if (Execute) then
        begin
          if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_VENDEDOR, 'A')) then
            frm_principal.ExibirDica ('Operação não permitida...',5)
          else
          begin
            ClearSql;
            ClearFields;
            inVD_CODI := strtofloat(codigo);
            inVD_NOME := Trim(edtNome.text);
            inVD_CPF  := Trim(edtCpf.text);
            inVD_IDEN := Trim(edtIden.text);
            inVD_OEXP := Trim(edtOExp.text);
            inVD_ENDE := Trim(edtEnde.text);
            inVD_BAIR := Trim(edtBair.text);
            inVD_CIDA := Trim(edtCida.text);
            inVD_ESTA := Trim(cbEsta.text);
            inVD_CEP  := Trim(edtCep.text);
            inVD_EMAI := Trim(edtEmail.text);
            inVD_TELE := Trim(edtTel.text);
            inVD_CELU := Trim(edtCelu.text);
            if (edtNasc.text<>'  /  /    ') then
              inVD_DTNA := strtodate(edtNasc.text);
            if (edtDatCont.text<>'  /  /    ') then
              inVD_DCON := strtodate(edtDatCont.text);
            inVD_CARG := Trim(cbCargo.text);
            if (Trim(edtCotaVista.text)<>'') then
              inVD_COTA := strtofloat(RetiraFormatacaoNumero(Trim(edtCotaVista.text)));
            if (Trim(edtCotaPrazo.text)<>'') then
              inVD_COTP := strtofloat(RetiraFormatacaoNumero(Trim(edtCotaPrazo.text)));
            if (Trim(edtComiss1.text)<>'') then
              inVD_COMA := strtofloat(RetiraFormatacaoNumero(Trim(edtComiss1.text)));
            if (Trim(edtComiss2.text)<>'') then
              inVD_COMP := strtofloat(RetiraFormatacaoNumero(Trim(edtComiss2.text)));
            if (Trim(edtLoja.text)<>'') then
              inVD_LOJA := strtofloat(RetiraFormatacaoNumero(Trim(edtLoja.text)));
            UpdateAll;
            HabilitaMenus (true,false,true,true,true,true);
            frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
            if (antNome<>inVD_NOME) then
              with (frm_f8Vend) do
                ds.dataset.close;
            with (frm_principal) do
              GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
                MODULE_VENDEDOR,'A',strtoint(codigo),'','');
            edtCodigo.setfocus;
          end;
        end
        else
        if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_VENDEDOR, 'I')) then
          frm_principal.ExibirDica ('Operação não permitida...',5)
        else
        begin
          ClearSql;
          ClearFields;
          inVD_CODI := strtofloat(codigo);
          inVD_NOME := Trim(edtNome.text);
          inVD_CPF  := Trim(edtCpf.text);
          inVD_IDEN := Trim(edtIden.text);
          inVD_OEXP := Trim(edtOExp.text);
          inVD_ENDE := Trim(edtEnde.text);
          inVD_BAIR := Trim(edtBair.text);
          inVD_CIDA := Trim(edtCida.text);
          inVD_ESTA := Trim(cbEsta.text);
          inVD_CEP  := Trim(edtCep.text);
          inVD_EMAI := Trim(edtEmail.text);
          inVD_TELE := Trim(edtTel.text);
          inVD_CELU := Trim(edtCelu.text);
          if (edtNasc.text<>'  /  /    ') then
            inVD_DTNA := strtodate(edtNasc.text);
          if (edtDatCont.text<>'  /  /    ') then
            inVD_DCON := strtodate(edtDatCont.text);
          inVD_CARG := Trim(cbCargo.text);
          if (Trim(edtCotaVista.text)<>'') then
            inVD_COTA := strtofloat(RetiraFormatacaoNumero(Trim(edtCotaVista.text)));
          if (Trim(edtCotaPrazo.text)<>'') then
            inVD_COTP := strtofloat(RetiraFormatacaoNumero(Trim(edtCotaPrazo.text)));
          if (Trim(edtComiss1.text)<>'') then
            inVD_COMA := strtofloat(RetiraFormatacaoNumero(Trim(edtComiss1.text)));
          if (Trim(edtComiss2.text)<>'') then
            inVD_COMP := strtofloat(RetiraFormatacaoNumero(Trim(edtComiss2.text)));
          if (Trim(edtLoja.text)<>'') then
            inVD_LOJA := strtofloat(RetiraFormatacaoNumero(Trim(edtLoja.text)));
          Insert;
          if (CodigoInclusao=inVD_CODI) then
            CodigoInclusao:=0;
          HabilitaMenus (true,false,false,false,true,true);
          frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
          btnIncluir.Click;
          with (frm_f8Vend) do
            ds.dataset.close;
          with (frm_principal) do
            GravaLog (x_codigousuario,date,Copy(timetostr(time),1,5),
              MODULE_VENDEDOR,'I',strtoint(codigo),'','');
        end;
        desconect;
        Free;
      end;
  end;
end;

{Busca pelo vendedor --}
procedure Tfrm_edtVend.PreencheEditsVend (clVend: TClassVend);
begin
  with (clVend) do
  begin
    edtCodigo.text:=form_nz(Result('VD_CODI'),4);
    edtNome.text  :=Result('VD_NOME');
    edtCpf.text   :=Result('VD_CPF');
    edtIden.text  :=Result('VD_IDEN');
    edtOExp.text  :=Result('VD_OEXP');
    edtEnde.text  :=Result('VD_ENDE');
    edtBair.text  :=Result('VD_BAIR');
    edtCida.text  :=Result('VD_CIDA');
    cbEsta.text   :=Result('VD_ESTA');
    edtCep.text   :=Result('VD_CEP');
    edtEmail.text :=Result('VD_EMAI');
    edtTel.text   :=form_t(Result('VD_TELE'),15);
    edtCelu.text  :=form_t(Result('VD_CELU'),15);
    if (Result('VD_DTNA')<>strtodate('01/01/1900')) then
      edtNasc.text  :=datetostr(Result('VD_DTNA'));
    if (Result('VD_DCON')<>strtodate('01/01/1900')) then
      edtDatCont.text:=datetostr(Result('VD_DCON'));
    cbCargo.text := Result('VD_CARG');
    edtCotaVista.text := form_nc(Result('VD_COTA'),10);
    edtCotaPrazo.text := form_nc(Result('VD_COTP'),10);
    edtComiss1.text := form_nc(Result('VD_COMA'),5);
    edtComiss2.text := form_nc(Result('VD_COMP'),5);
    if (result('VD_LOJA')<>0) then
    begin
      edtLoja.text := form_nz(result('VD_LOJA'),2);
      pnLoja.caption := ProcuraNomeLoja(result('VD_LOJA'),self);
    end;
  end;
end;

{Busca pelo Vendedor ***}
procedure Tfrm_edtVend.edtCodigoExit(Sender: TObject);
var
  clVend: TClassVend;
  codigo: String;
begin
  codigo:=sem_brancos(edtCodigo.text);
  if (codigo<>'') then
    with (clVend) do
    begin
      clVend := TClassVend.Create;
      conect ('ESTOQUE', self);
      clearSql;
      AddParam ('Select VD_CODI,VD_NOME,VD_CPF,VD_IDEN,VD_OEXP,VD_DTNA,  ');
      AddParam ('       VD_ENDE,VD_BAIR,VD_CIDA,VD_ESTA,VD_CEP,VD_EMAI,  ');
      AddParam ('       VD_TELE,VD_CELU,VD_DCON,VD_CARG,VD_NIVE,VD_SUPE, ');
      AddParam ('       VD_COTA,VD_COMA,VD_COMP,VD_COTP,VD_LOJA          ');
      AddParam ('From   VENDEDORES                                       ');
      AddParam ('Where (VD_CODI='+codigo+')                              ');
      frm_principal.BarraDicas.caption:='Buscando vendedores...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
      begin
        CarregaFoto(strtofloat(codigo));
        frm_principal.BarraDicas.caption:='';
        if (btnCancelainclusao.enabled) then
          HabilitaMenus (false,true,false,true,true,true)
        else
          HabilitaMenus (true,false,false,true,true,true);
        LimparEdits;
      end
      else
      begin
        CarregaFoto(strtofloat(codigo));
        frm_principal.BarraDicas.caption:='';
        HabilitaMenus (true,false,true,true,true,true);
        if (Cancelarincluso1.enabled) then
          CodigoInclusao:=0;
        PreencheEditsVend (clVend);
        antNome := Trim(edtNome.text);
      end;
      edtCodigo.text := form_nz (StrToFloat(codigo),4);
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_edtVend.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Vend) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_edtVend.btnIncluirClick(Sender: TObject);
begin
  Incluirplano1.click;
end;

procedure Tfrm_edtVend.btnCancelainclusaoClick(Sender: TObject);
begin
  Cancelarincluso1.click;
end;

procedure Tfrm_edtVend.btnExcluirClick(Sender: TObject);
begin
  Excluirplano1.click;
end;

procedure Tfrm_edtVend.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_edtVend.edtCotaVistaExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtCotaVista);
end;

procedure Tfrm_edtVend.edtCotaVistaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtCotaVista);
end;

procedure Tfrm_edtVend.Outros1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rl_tite, frm_rl_tite);
  with (frm_rl_tite) do
  begin
    tabela_nm:='VENDEDORES';
    caption:='Vendedores ';
    with (frm_rl_tite.cmb_campos.items) do
    begin
      clear;
      add('Codigo             VD_CODI  ;9999                                    ;I');
      add('Nome do vendedor   VD_NOME  ;cccccccccccccccccccccccccccccccccccccccc;T');
      add('Nascimento         VD_DTNA  ;99/99/9999                              ;D');
      add('Endereço           VD_ENDE  ;cccccccccccccccccccccccccccccccccccccccc;T');
      add('Bairro             VD_BAIR  ;cccccccccccccccccccccccccccccc          ;T');
      add('Cidade             VD_CIDA  ;cccccccccccccccccccccccccccccc          ;T');
      add('Estado             VD_ESTA  ;cc                                      ;T');
      add('Data contratação   VD_DCON  ;99/99/9999                              ;D');
      add('Cargo              VD_CARG  ;ccccccccccccccccc                       ;T');
      add('Nivel              VD_NIVE  ;9                                       ;N');
      add('Supervisor         VD_SUPE  ;ccccccccccccccccc                       ;T');
      add('Cota               VD_COTA  ;9,999.99                                ;N');
    end;
    left := 32;
    top  := 20;
    showmodal;
  end;
end;

procedure Tfrm_edtVend.Imprimirplanos1Click(Sender: TObject);
var
  clVend: TClassVend;
  totvend: Integer;
  indGauge,totGauge: Integer;
begin
     {Inicio da visualizacao da impressao ***}
  Mostra_mensagem('Preparando relatorio...');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  with (clVend) do
  begin
    clVend := TClassVend.Create;
    conect ('ESTOQUE', self);
    clearSql;
    AddParam ('Select VD_CODI,VD_NOME,VD_CPF,VD_IDEN,VD_OEXP,VD_DTNA,  ');
    AddParam ('       VD_ENDE,VD_BAIR,VD_CIDA,VD_ESTA,VD_CEP,VD_EMAI,  ');
    AddParam ('       VD_TELE,VD_CELU,VD_DCON,VD_CARG,VD_NIVE,VD_SUPE, ');
    AddParam ('       VD_COTA                                          ');
    AddParam ('From   VENDEDORES                                       ');
    frm_principal.BarraDicas.caption:='Buscando vendedores...Aguarde!';
    frm_principal.refresh;
    Execute;
  end;
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'c10.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 10;
    frm_principal.x_tipo_fonte    := 'Arial';
    Title:= 'CADASTRO DE VENDEDORES';

        {cabecalhos}
    AddLine(form_tc('-',132,'-'));
    AddLine('     |                              |                |            |          |   Data   |   |    $   |            ');
    AddLine('Cod  | Nome do vendedor             |CPF/CNPJ        |  Telefone  |  Celular | Contrat. |Niv|  Cota  | Supervisor ');
    AddLine(form_tc('-',132,'-'));
    totvend:=0;
    clVend.first;
    indGauge:=0;
    totGauge:=clVend.reccount;
    while (not clVend.eof) do
    begin
      AddLine(form_nz   (clVend.Result('VD_CODI'),4)  +'  '+
        form_t    (clVend.Result('VD_NOME'),30) +' '+
        ExibeCpf  (clVend.Result('VD_CPF'))     +'   '+
        form_t    (clVend.Result('VD_TELE'),13) +' '+
        form_t    (clVend.Result('VD_CELU'),10) +' '+
        form_data (clVend.Result('VD_DCON'))    +' '+
        form_t    (clVend.Result('VD_NIVE'),2)  +' '+
        form_nc   (clVend.Result('VD_COTA'),9)  +' '+
        form_t    (clVend.Result('VD_SUPE'),20));
      totvend := totvend + 1;
      clVend.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de vendedores  ---> '+form_nz (totvend,3));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_principal.BarraDicas.caption:='';
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
  clVend.desconect;
  clVend.Free;
end;

procedure Tfrm_edtVend.btnImprimirClick(Sender: TObject);
begin
  Imprimirplanos1.click;
end;

procedure Tfrm_edtVend.edtNascExit(Sender: TObject);
begin
  if (not IsDate (edtNasc.text) and (edtNasc.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de Nascimento',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      edtNasc.setfocus;
    except
    end;
  end;
end;

procedure Tfrm_edtVend.CarregaFoto(codigo: Real);
begin
     {try
        with (imgFoto) do
        begin
             visible:=true;
             picture.LoadFromFile(frm_principal.x_pathsystem
                 +'FotoVend\'+form_nz(codigo,4)+'.BMP');
        end;
     except
        imgFoto.visible:=false;
     end;}
end;

procedure Tfrm_edtVend.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    SAIR1.click;
end;

procedure Tfrm_edtVend.cbEstaExit(Sender: TObject);
begin
  cbEsta.text:=UpperCase(cbEsta.text);
end;

procedure Tfrm_edtVend.Salvar2Click(Sender: TObject);
begin
  Salvar1.click;
end;

{navegacao---}
procedure Tfrm_edtVend.edtDatContExit(Sender: TObject);
begin
  if (not IsDate (edtDatCont.text) and (edtDatCont.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data da Contratação',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      edtDatCont.setfocus;
    except
    end;
  end;
end;

{navegacao---}
procedure Tfrm_edtVend.btnComiClick(Sender: TObject);
begin
  showmessage('Rotina não disponível!');
end;

procedure Tfrm_edtVend.btnCalcularClick(Sender: TObject);
begin
  showmessage('Rotina não disponível!');
end;

procedure Tfrm_edtVend.edtCotaPrazoEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtCotaPrazoExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtCotaPrazo);
end;

procedure Tfrm_edtVend.edtCotaPrazoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLoja.setfocus;
  if (key=K_CIMA) then
    edtComiss2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cota mensal do total de contrato à prazo: Formato: 9999,99 ',10);
end;

procedure Tfrm_edtVend.edtCotaPrazoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtCotaPrazo);
end;

procedure Tfrm_edtVend.edtLojaEnter(Sender: TObject);
begin
  TMaskedit(sender).selectall;
end;

procedure Tfrm_edtVend.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSalvar.click;
  if (key=K_CIMA) then
    edtCotaPrazo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Loja a qual o vendedor pertence: Formato: 99 ',10);
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

procedure Tfrm_edtVend.edtLojaDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_edtVend.edtLojaExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtLoja.text);
  if (codigo<>'') then
  begin
    pnLoja.caption:=ProcuraNomeLoja(strtofloat(codigo),self);
    edtLoja.text:=form_nz(strtofloat(codigo),2);
  end;
end;

procedure Tfrm_edtVend.edtComiss1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtVend.edtComiss2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_edtVend.edtComiss1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCotaVista.setfocus;
  if (key=K_CIMA) then
    cbCargo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Comissão à vista: Formato: 9999,99 ',10);
end;

procedure Tfrm_edtVend.edtComiss1Exit(Sender: TObject);
begin
  FormatarZerosDecimais (edtComiss1);
end;

procedure Tfrm_edtVend.edtComiss2Exit(Sender: TObject);
begin
  FormatarZerosDecimais (edtComiss2);
end;

procedure Tfrm_edtVend.edtComiss2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCotaPrazo.setfocus;
  if (key=K_CIMA) then
    edtCotaVista.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Comissão à prazo: Formato: 9999,99 ',10);
end;

procedure Tfrm_edtVend.edtComiss1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtComiss1);
end;

procedure Tfrm_edtVend.edtComiss2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtComiss2);
end;

end.
