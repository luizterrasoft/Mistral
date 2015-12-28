unit un_MudarSeqVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus, CheckBoxOO;

type
  Tfrm_MudarSeqVenda = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Label3: TLabel;
    edtCodVenda: TMaskEdit;
    Label4: TLabel;
    edtNotaFiscal: TMaskEdit;
    edtRomaneio: TMaskEdit;
    lblRomaneio: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    botao1: TPanel;
    Label5: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Bevel4: TBevel;
    Bevel3: TBevel;
    Label10: TLabel;
    Label1: TLabel;
    edtCupom: TMaskEdit;
    Label2: TLabel;
    edtCodVale: TMaskEdit;
    Label6: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodVendaEnter(Sender: TObject);
    procedure edtCodVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtNotaFiscalEnter(Sender: TObject);
    procedure edtRomaneioEnter(Sender: TObject);
    procedure edtNotaFiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao1Click(Sender: TObject);
    procedure edtCupomEnter(Sender: TObject);
    procedure edtCupomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRomaneioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodValeEnter(Sender: TObject);
    procedure edtCodValeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    escolheuSequencialCorreto: Boolean;
    y_maximo_codigo_venda_lancado: Real;
    y_maximo_codigo_vale_lancado: Real;
    function UltimaVendaRegistradaNoEstoque:Real;
    function UltimaValeRegistradoNoContas:Real;
  end;

var
  frm_MudarSeqVenda: Tfrm_MudarSeqVenda;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, F8Lojas, auxiliar,
  un_ALERTA;

{$R *.DFM}

procedure Tfrm_MudarSeqVenda.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_MudarSeqVenda.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarSeqVenda.Limparformulrio1Click(Sender: TObject);
begin
  edtCodVenda.text    :='';
  edtCodVale.text     :='';
  edtNotaFiscal.text  :='';
  edtCupom.text       :='';
  edtRomaneio.text    :='';
  edtCodVenda.setfocus;
end;

procedure Tfrm_MudarSeqVenda.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtCodVenda.text   := floattostr(frm_principal.x_codigo_venda);
  edtCodVale.text    := floattostr(frm_principal.x_codigo_vale_mercadoria);
  edtNotaFiscal.text := floattostr(frm_principal.x_nota_fiscal);
  edtCupom.text      := floattostr(frm_principal.x_cupom_fiscal);
  edtRomaneio.text   := floattostr(frm_principal.x_romaneio);
  edtCodVenda.setfocus;
end;

procedure Tfrm_MudarSeqVenda.Abrirsesso1Click(Sender: TObject);
var
  clSeq: TClassAuxiliar;
begin
  if (Trim(edtCodVenda.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código da venda não pode ficar vazio!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodVenda.setfocus;
  end
  else
  if (Trim(edtCodVale.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código da vale mercadoria não pode ficar vazio!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodVale.setfocus;
  end
  else
  if (strtofloat(Trim(edtCodVenda.text))<UltimaVendaRegistradaNoEstoque) and
    (frm_principal.x_ativar_alerta_sequencial_venda) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: O código da venda não pode ser menor que ');
    frm_ALERTA.Memo1.lines.Add('      o código da última venda lançada: '+trim(form_n(y_maximo_codigo_venda_lancado,15)));
    frm_ALERTA.showmodal;
    edtCodVenda.setfocus;
  end
  else
  if (strtofloat(Trim(edtCodVenda.text))<UltimaValeRegistradoNoContas) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: O código do vale mercadoria não pode ser menor que ');
    frm_ALERTA.Memo1.lines.Add('      o código do último vale lançado: '+trim(form_n(y_maximo_codigo_vale_lancado,15)));
    frm_ALERTA.showmodal;
    edtCodVenda.setfocus;
  end
  else
  if (Trim(edtNotaFiscal.text)='') then
  begin
    frmDialogo.ExibirMensagem ('A nota fiscal não pode ficar vazia!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNotaFiscal.setfocus;
  end
  else
  if (Trim(edtRomaneio.text)='') and (edtRomaneio.visible) then
  begin
    frmDialogo.ExibirMensagem ('O romaneio não pode ficar vazio!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtRomaneio.setfocus;
  end
  else
  begin
          {*************************************************************}
    frm_principal.x_codigo_venda := strtofloat(Trim(edtCodVenda.text));
    frm_principal.x_codigo_vale_mercadoria := strtofloat(Trim(edtCodVale.text));
    frm_principal.x_nota_fiscal  := strtofloat(Trim(edtNotaFiscal.text));
    frm_principal.x_cupom_fiscal := strtofloat(Trim(edtCupom.text));
    frm_principal.x_romaneio     := strtofloat(Trim(edtRomaneio.text));
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET ULTIMA_VENDA=:ultima_venda ');
    clSeq.consulta.parambyname('ultima_venda').AsFloat := frm_principal.x_codigo_venda;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET ULTIMO_VALE_MERCADORIA=:ultimo_vale_mercadoria ');
    clSeq.consulta.parambyname('ultimo_vale_mercadoria').AsFloat := frm_principal.x_codigo_vale_mercadoria;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET NOTA_FISCAL=:nota_fiscal ');
    clSeq.consulta.parambyname('nota_fiscal').AsFloat := frm_principal.x_nota_fiscal;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET CUPOM_FISCAL=:cupom_fiscal ');
    clSeq.consulta.parambyname('cupom_fiscal').AsFloat := frm_principal.x_cupom_fiscal;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('UPDATE SEQVENDAS.DBF SET ROMANEIO=:romaneio ');
    clSeq.consulta.parambyname('romaneio').AsFloat := frm_principal.x_romaneio;
    clSeq.Execute;
    clSeq.desconect;
    clSeq.Free;
          {*************************************************************}
    escolheuSequencialCorreto:=true;
    close;
  end;
end;

procedure Tfrm_MudarSeqVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    botao_sairClick(sender);
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
      if (lblRomaneio.visible) then
      begin
        lblRomaneio.visible:=false;
        edtRomaneio.visible:=false;
      end
      else
      begin
        lblRomaneio.visible:=true;
        edtRomaneio.visible:=true;
        edtRomaneio.setfocus;
      end
end;

procedure Tfrm_MudarSeqVenda.edtCodVendaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqVenda.edtCodVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodVale.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_MudarSeqVenda.FormCreate(Sender: TObject);
begin
  escolheuSequencialCorreto := false;
  edtCodVenda.text    := floattostr(frm_principal.x_codigo_venda);
  edtNotaFiscal.text  := floattostr(frm_principal.x_nota_fiscal);
  edtCupom.text       := floattostr(frm_principal.x_cupom_fiscal);
  edtRomaneio.text    := floattostr(frm_principal.x_romaneio);
end;

procedure Tfrm_MudarSeqVenda.edtNotaFiscalEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqVenda.edtRomaneioEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqVenda.edtNotaFiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCupom.setfocus;
  if (key=K_CIMA) then
    edtCodVale.setfocus;
end;

procedure Tfrm_MudarSeqVenda.botao1Click(Sender: TObject);
begin
  Abrirsesso1.click;
end;

//So pode ser usada se o sistema estiver ON-LINE, acessando o alias 'ESTOQUE'
function Tfrm_MudarSeqVenda.UltimaVendaRegistradaNoEstoque:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(VE_CODI) as MAXIMO_SEQUENCIAL ');
  clAux.AddParam ('FROM VENDAS                              ');
  clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                ');
  clAux.AddParam ('      (VE_CAIX=:caixa)                   ');
  clAux.consulta.parambyname('loja').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  y_maximo_codigo_venda_lancado := clAux.Result('MAXIMO_SEQUENCIAL');
  result := y_maximo_codigo_venda_lancado;
  clAux.desconect;
  clAux.Free;
end;

//So pode ser usada se o sistema estiver ON-LINE, acessando o alias 'ESTOQUE'
function Tfrm_MudarSeqVenda.UltimaValeRegistradoNoContas:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecontas,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(VA_NUME) as MAXIMO_SEQUENCIAL ');
  clAux.AddParam ('FROM VALES_MERCADORIAS                   ');
  clAux.AddParam ('WHERE (VA_LOJA=:loja) AND                ');
  clAux.AddParam ('      (VA_CAIX=:caixa)                   ');
  clAux.consulta.parambyname('loja').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  y_maximo_codigo_vale_lancado := clAux.Result('MAXIMO_SEQUENCIAL');
  result := y_maximo_codigo_vale_lancado;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_MudarSeqVenda.edtCupomEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqVenda.edtCupomKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtRomaneio.visible) then
      edtRomaneio.setfocus
    else
    if (key=K_ENTER) then
      botao1Click(Sender);
  if (key=K_CIMA) then
    edtNotaFiscal.setfocus;
end;

procedure Tfrm_MudarSeqVenda.edtRomaneioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(Sender);
  if (key=K_CIMA) then
    edtCupom.setfocus;
end;

procedure Tfrm_MudarSeqVenda.edtCodValeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqVenda.edtCodValeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNotaFiscal.setfocus;
  if (key=K_CIMA) then
    edtCodVenda.setfocus;
end;

end.
