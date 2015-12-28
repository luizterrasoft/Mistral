unit un_BotoesConfig_Atdo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_BotoesConfig_Atdo = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    btnFechar: TPanel;
    botao5: TPanel;
    botao6: TPanel;
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
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
    procedure botao3Click(Sender: TObject);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5Click(Sender: TObject);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesConfig_Atdo: Tfrm_BotoesConfig_Atdo;

implementation

uses principal, un_senhaSupervisor, un_MudarLoja, un_MudarTerminal, procura,
  un_MudarECF, un_MudarSeqVenda, unDialogo, un_configSenhas, funcoes1, funcoes2,
  un_configLocal, un_ConfigLocal_Atdo, un_MudarSeqAtdo,
  un_ConfigFuncionamentoDoSistema, un_configSenhas_Atdo;

{$R *.dfm}

procedure Tfrm_BotoesConfig_Atdo.botao1Click(Sender: TObject);
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
end;

procedure Tfrm_BotoesConfig_Atdo.botao2Click(Sender: TObject);
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
end;

procedure Tfrm_BotoesConfig_Atdo.botao4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConfigLocal_Atdo, frm_ConfigLocal_Atdo);
  frm_ConfigLocal_Atdo.fichario.activepage := frm_ConfigLocal_Atdo.pagina2;
  frm_ConfigLocal_Atdo.showmodal;
  frm_ConfigLocal_Atdo.Free;
end;

procedure Tfrm_BotoesConfig_Atdo.FormKeyDown(Sender: TObject; var Key: Word;
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
      botao6Click(Sender);
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
    botao6Click(Sender);
end;

procedure Tfrm_BotoesConfig_Atdo.ApagaTudo;
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
end;

procedure Tfrm_BotoesConfig_Atdo.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesConfig_Atdo.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MudarSeqAtdo,frm_MudarSeqAtdo);
  frm_MudarSeqAtdo.showmodal;
  if (frm_MudarSeqAtdo.escolheuSequencialCorreto) then
    frm_principal.lblSeq.color := clTeal
  else
    frm_principal.lblSeq.color := clRed;
  frm_principal.lblSeq.caption := 'Último Atdo.: '+floattostr(frm_principal.x_codigo_atendimento);
  frm_MudarSeqAtdo.Free;
end;

procedure Tfrm_BotoesConfig_Atdo.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao5Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConfigFuncionamentoDoSistema, frm_ConfigFuncionamentoDoSistema);
  frm_ConfigFuncionamentoDoSistema.showmodal;
  frm_ConfigFuncionamentoDoSistema.Free;
end;

procedure Tfrm_BotoesConfig_Atdo.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_BotoesConfig_Atdo.botao6Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_configSenhas_Atdo, frm_configSenhas_Atdo);
  frm_configSenhas_Atdo.showmodal;
  frm_configSenhas_Atdo.Free;
end;

end.
