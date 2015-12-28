unit un_BotoesConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_BotoesConfig = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    botao6: TPanel;
    btnFechar: TPanel;
    botao7: TPanel;
    Botao8: TPanel;
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure botao6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao7Click(Sender: TObject);
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Botao8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesConfig: Tfrm_BotoesConfig;

implementation

uses principal, un_senhaSupervisor, un_MudarLoja, un_MudarTerminal, procura,
  un_MudarECF, un_MudarSeqVenda, unDialogo, un_configSenhas, funcoes1, funcoes2,
  un_configLocal, un_ConfigFuncionamentoDoSistema;

{$R *.dfm}

procedure Tfrm_BotoesConfig.botao1Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption=' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_MudarLoja,frm_MudarLoja);
    frm_MudarLoja.y_loja := frm_principal.x_loja;
    frm_MudarLoja.showmodal;
    if (frm_MudarLoja.y_loja<>frm_principal.x_loja) then
    begin
      frm_principal.x_loja := frm_MudarLoja.y_loja;
      frm_principal.pnLoja.caption := ' Loja: '+form_nz(frm_principal.x_loja,2)+'/'+
        form_t(ProcuraNomeLoja(frm_principal.x_loja,self),9);
      if (frm_principal.x_loja=0) then
        frm_principal.pnLoja.color:=clRed
      else
        frm_principal.pnLoja.color:=clTeal;
    end;
    frm_MudarLoja.Free;
  end
  else
    frmDialogo.ExibirMensagem ('Existe CAIXA ativo no momento! Esta opção não é permitida!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_BotoesConfig.botao2Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption=' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_MudarTerminal,frm_MudarTerminal);
    frm_MudarTerminal.y_terminal := frm_principal.x_terminal;
    frm_MudarTerminal.showmodal;
    if (frm_MudarTerminal.y_terminal<>frm_principal.x_terminal) then
    begin
      frm_principal.x_terminal := frm_MudarTerminal.y_terminal;
      frm_principal.pnCaixa.caption := ' N. Terminal: '+form_nz(frm_principal.x_terminal,2);
      if (frm_principal.x_terminal=0) then
        frm_principal.pnCaixa.color:=clRed
      else
        frm_principal.pnCaixa.color:=clTeal;
    end;
    frm_MudarTerminal.Free;
  end
  else
    frmDialogo.ExibirMensagem ('Existe CAIXA ativo no momento! Esta opção não é permitida!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_BotoesConfig.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MudarEcf,frm_MudarEcf);
  frm_MudarEcf.y_ecf := frm_principal.x_ecf;
  frm_MudarEcf.showmodal;
  if (frm_MudarEcf.y_ecf<>frm_principal.x_ecf) then
  begin
    frm_principal.x_ecf := frm_MudarEcf.y_ecf;
    if (frm_principal.x_ecf_habilita_modo_fiscal) then
    begin
      if (frm_principal.x_ecf=0) then
        frm_principal.pnEcf.color:=clRed
      else
        frm_principal.pnEcf.color:=clTeal;
      frm_principal.pnEcf.caption := ' ECF: '+form_nz(frm_principal.x_ecf,2);
    end
    else
    begin
      frm_principal.pnEcf.color:=clTeal;
      frm_principal.pnEcf.caption := ' ECF';
    end;
  end;
  frm_MudarEcf.Free;
end;

procedure Tfrm_BotoesConfig.botao4Click(Sender: TObject);
begin
  if (frm_principal.x_terminal<>0) and (frm_principal.x_loja<>0) then
  begin
    Application.CreateForm(Tfrm_MudarSeqVenda,frm_MudarSeqVenda);
    frm_MudarSeqVenda.showmodal;
    if (frm_MudarSeqVenda.escolheuSequencialCorreto) then
      frm_principal.lblSeq.color := clTeal
    else
      frm_principal.lblSeq.color := clRed;
    frm_principal.lblSeq.caption := 'Última Venda: '+floattostr(frm_principal.x_codigo_venda);
    frm_MudarSeqVenda.Free;
  end
  else
    frmDialogo.ExibirMensagem ('O códigos de loja/terminal devem ser definido antes!'
      ,'Opções',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_BotoesConfig.botao5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_configSenhas, frm_configSenhas);
  frm_configSenhas.showmodal;
  frm_configSenhas.Free;
end;

procedure Tfrm_BotoesConfig.botao6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_configLocal, frm_configLocal);
  frm_ConfigLocal.fichario.activepage := frm_ConfigLocal.pagina1;
  frm_ConfigLocal.showmodal;
  frm_ConfigLocal.Free;
end;

procedure Tfrm_BotoesConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao2.color=clWhite) then
      botao2Click(Sender)
    else
    if (botao3.color=clWhite) then
      botao3Click(Sender)
    else
    if (botao4.color=clWhite) then
      botao4Click(Sender)
    else
    if (botao5.color=clWhite) then
      botao5Click(Sender)
    else
    if (botao6.color=clWhite) then
      botao6Click(Sender)
    else
    if (botao7.color=clWhite) then
      botao7Click(Sender)
    else
    if (botao8.color=clWhite) then
      botao8Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao3Click(Sender)
  else
  if (key=100) or (key=Ord('4')) then
    botao4Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao5Click(Sender)
  else
  if (key=102) or (key=Ord('6')) then
    botao6Click(Sender)
  else
  if (key=103) or (key=Ord('7')) then
    botao7Click(Sender)
  else
  if (key=104) or (key=Ord('8')) then
    botao8Click(Sender);
end;

procedure Tfrm_BotoesConfig.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
  botao7.color := clTeal;
  botao7.font.color := clWhite;
  botao8.color := clTeal;
  botao8.font.color := clWhite;
end;

procedure Tfrm_BotoesConfig.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesConfig.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.botao7Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConfigFuncionamentoDoSistema, frm_ConfigFuncionamentoDoSistema);
  frm_ConfigFuncionamentoDoSistema.showmodal;
  frm_ConfigFuncionamentoDoSistema.Free;
end;

procedure Tfrm_BotoesConfig.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  Tpanel(Sender).color := clWhite;
  Tpanel(Sender).font.color := clTeal;
end;

procedure Tfrm_BotoesConfig.Botao8Click(Sender: TObject);
begin
  frm_principal.ChamandoAtualizarBancoDeDados;
end;

end.
