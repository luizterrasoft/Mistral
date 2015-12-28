unit Un_MenuPrincipal_OpcaoListaCrediario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrm_MenuPrincipal_OpcaoListaCrediario = class(TForm)
    Label1: TLabel;
    btnFechar: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    botao9: TPanel;
    Label2: TLabel;
    Bevel1: TBevel;
    procedure btnFecharClick(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure botao9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    procedure Apagatudo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MenuPrincipal_OpcaoListaCrediario: Tfrm_MenuPrincipal_OpcaoListaCrediario;

implementation

uses unDialogo, principal, unDiarEmiCont, unDiarPrestAVenc, unPrestRecCli,
  unDiarioReceb, unRelRecCheqDev,venda;

{$R *.dfm}

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao2Click(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
  begin
         //Alguns clientes optam por nao exibir esta opcao do CREDIARIO - marreta!!!
    if (RetornaApelidoEmpresa='CUNHA MODAS') then
      frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      Application.CreateForm(Tfrm_DiarEmiCont, frm_DiarEmiCont);
      frm_DiarEmiCont.showmodal;
      frm_DiarEmiCont.Free;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao3Click(
  Sender: TObject);
begin
     //Alguns clientes optam por nao exibir esta opcao do CREDIARIO - marreta!!!
  if (databasecredito='CREDITO') then
  begin
    if (RetornaApelidoEmpresa='CUNHA MODAS') then
      frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      Application.CreateForm(Tfrm_DiarPrestAVenc, frm_DiarPrestAVenc);
      frm_DiarPrestAVenc.showmodal;
      frm_DiarPrestAVenc.Free;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;


procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao4Click(
  Sender: TObject);
begin
  if (databasecredito='CREDITO') then
  begin
         //Alguns clientes optam por nao exibir esta opcao do CREDIARIO - marreta!!!
    if (RetornaApelidoEmpresa='CUNHA MODAS') then
      frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      Application.CreateForm(Tfrm_PrestRecCli, frm_PrestRecCli);
      frm_PrestRecCli.showmodal;
      frm_PrestRecCli.Free;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao5Click(
  Sender: TObject);
begin
  if (databasecredito='CREDITO') then
  begin
    Application.CreateForm(Tfrm_DiarioRecebe, frm_DiarioRecebe);
    frm_DiarioRecebe.showmodal;
    frm_DiarioRecebe.Free;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao9Click(
  Sender: TObject);
begin
  if (databasecredito='CREDITO') then //SO ON LINE
  begin
         //Alguns clientes optam por nao exibir esta opcao do CREDIARIO - marreta!!!
    if (RetornaApelidoEmpresa='CUNHA MODAS') then
      frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      Application.CreateForm(Tfrm_RelRecCheqDev, frm_RelRecCheqDev);
      with (frm_RelRecCheqDev) do
      begin
        LimparEdits;
        showmodal;
        Free;
      end;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);

end;

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.FormKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;

  if (key=13) then
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
    if (botao9.color=clWhite) then
      botao9Click(Sender);
      
  if (key=97) or (key=Ord('1')) then
    botao2Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao3Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao4Click(Sender)
  else
  if (key=100) or (key=Ord('4')) then
    botao5Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao9Click(Sender);
end;


procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.Apagatudo;
begin
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao9.color := clTeal;
  botao9.font.color := clWhite;
end;     

procedure Tfrm_MenuPrincipal_OpcaoListaCrediario.botao2MouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  self.apagatudo;
  TPanel(Sender).color := clWhite;
  TPanel(Sender).font.color := clTeal;
end;

end.
