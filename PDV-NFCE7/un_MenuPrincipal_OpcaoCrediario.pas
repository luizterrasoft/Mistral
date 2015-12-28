unit un_MenuPrincipal_OpcaoCrediario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_MenuPrincipal_OpcaoCrediario = class(TForm)
    botao1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TPanel;
    botao6: TPanel;
    botao7: TPanel;
    botao8: TPanel;
    Bevel1: TBevel;
    Botao10: TPanel;
    Botao11: TPanel;
    Botao12: TPanel;
    botao9: TPanel;
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao4Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure botao6Click(Sender: TObject);
    procedure botao7Click(Sender: TObject);
    procedure botao8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Botao10Click(Sender: TObject);
    procedure Botao11Click(Sender: TObject);
    procedure Botao12Click(Sender: TObject);
    procedure botao9Click(Sender: TObject);
    procedure botao9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Modos : Integer;
    procedure ApagaTudo;
  end;

var
  frm_MenuPrincipal_OpcaoCrediario: Tfrm_MenuPrincipal_OpcaoCrediario;

implementation

uses un_LancaVenda, un_VendaDeVales, un_SumarioVendas, funcoes1, funcoes2,
  un_SinteseVendasPorDia, un_ListaVendas, un_ConsultaVenda, principal,
  unDiarEmiCont, unDialogo, unDiarPrestAVenc, unPrestRecCli, unDiarioReceb,
  un_senhaSupervisor, un_frmConsulta1, venda, unRecCheqDev, unRelRecCheqDev,
  Un_MenuPrincipal_OpcaoListaCrediario, unConfigLocal2, un_SenhaAdmin,
  un_ConfigCobranca, unVersoPropostaCredito, unPropostaCredito;

{$R *.DFM}

procedure Tfrm_MenuPrincipal_OpcaoCrediario.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
  botao7.color := clTeal;
  botao7.font.color := clWhite;
  botao8.color := clTeal;
  botao8.font.color := clWhite;
  botao9.color := clTeal;
  botao9.font.color := clWhite;
  botao10.color := clTeal;
  botao10.font.color := clWhite;
  botao11.color := clTeal;
  botao11.font.color := clWhite;
  botao12.color := clTeal;
  botao12.font.color := clWhite;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  TPanel(Sender).color := clWhite;
  TPanel(Sender).font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao1Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    if (databasecredito='CREDITO') then
      frm_principal.ChamandoLancReceb2(0,frm_principal.x_loja,0) //ON LINE
    else
      frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end
  else
    frmDialogo.ExibirMensagem ('Não foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao6.color=clWhite) then
      botao6Click(Sender)
    else
    if (botao7.color=clWhite) then
      botao7Click(Sender)
    else
    if (botao8.color=clWhite) then
      botao8Click(Sender)
//          else if (botao9.color=clWhite) then botao9Click(Sender)
    else
    if (botao10.color=clWhite) then
      botao10Click(Sender)
    else
    if (botao11.color=clWhite) then
      botao11Click(Sender)
    else
    if (botao12.color=clWhite) then
      botao12Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao6Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao7Click(Sender)
//     else if (key=100) or (key=Ord('4')) then botao9Click(Sender)
  else
  if (key=100) or (key=Ord('4')) then
    botao8Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao10Click(Sender)
  else
  if (key=102) or (key=Ord('6')) then
    botao11Click(Sender)
  else
  if (key=103) or (key=Ord('7')) then
    botao12Click(Sender)
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao2Click(Sender: TObject);
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
      frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
      begin
        Application.CreateForm(Tfrm_DiarEmiCont, frm_DiarEmiCont);
        frm_DiarEmiCont.showmodal;
        frm_DiarEmiCont.Free;
        frm_senhaSupervisor.y_flag:=false;
      end;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao3Click(Sender: TObject);
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
      frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
      begin
        Application.CreateForm(Tfrm_DiarPrestAVenc, frm_DiarPrestAVenc);
        frm_DiarPrestAVenc.showmodal;
        frm_DiarPrestAVenc.Free;
        frm_senhaSupervisor.y_flag:=false;
      end;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao4Click(Sender: TObject);
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
      frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
      begin
        Application.CreateForm(Tfrm_PrestRecCli, frm_PrestRecCli);
        frm_PrestRecCli.showmodal;
        frm_PrestRecCli.Free;
        frm_senhaSupervisor.y_flag:=false;
      end;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao5Click(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_DiarioRecebe, frm_DiarioRecebe);
      frm_DiarioRecebe.showmodal;
      frm_DiarioRecebe.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao6Click(Sender: TObject);
begin
  if (databasecredito='CREDITO') then
  begin
    Application.CreateForm(Tfrm_Consulta1, frm_Consulta1);
    with (frm_Consulta1) do
    begin
      caption := frm_principal.x_sistema+' - '+LB_POS_FINANC_CONS;
      Modo    := 3;
      frm_principal.x_frente_loja := frm_principal.x_loja;
      total_contrato_caixa := '';
            {************************************************}
      btnLanc.visible      := false;
      Lancamento1.enabled  := false;
      btnRenova.visible    := true;
      Renovao1.enabled     := true;
      btnRenegocia.visible := false;
      if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
      begin
        btnBaixa.visible     := true;
        Baixa1.enabled       := true;
      end
      else
      begin
        btnBaixa.visible     := false;
        Baixa1.enabled       := false;
      end;

      if Frm_Principal.codclientecad <> '' then
      begin
        edtcodcli.Text := Frm_Principal.codclientecad;
        btnConsulta.onclick(Sender);
//              ActiveControl := edtcodcli;
        btnLanc.enabled := false;
      end;
            {************************************************}
      showmodal;
      Free;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao7Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_CADASTRO_CLIENTE) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Modos := 1;
      if (databasecredito='CREDITO') then
        frm_principal.ChamandoClienteContrato (1,false)
      else
        frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
          ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end;
  end
  else
  begin
    Modos := 1;
    if (databasecredito='CREDITO') then
      frm_principal.ChamandoClienteContrato (1,false)
    else
      frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
        ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao8Click(Sender: TObject);
begin
  if (databasecredito='CREDITO') then //somente ONLINE
  begin
          //Alguns clientes optam por nao exibir esta opcao do CREDIARIO - marreta!!!
    if (RetornaApelidoEmpresa='CUNHA MODAS') then
      frmDialogo.ExibirMensagem ('Opção não liberada a pedido do cliente!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
      begin
        if (frm_principal.x_solicitar_senha_RECEB_CHEQ_DEV) then
        begin
          frm_senhaSupervisor.showmodal;
          if (frm_senhaSupervisor.y_flag) then
          begin
            Application.CreateForm(Tfrm_RecCheqDev, frm_RecCheqDev);
            with (frm_RecCheqDev) do
            begin
              showmodal;
              Free;
            end;
          end;
          frm_senhaSupervisor.y_flag:=false;
        end
        else
        begin
          Application.CreateForm(Tfrm_RecCheqDev, frm_RecCheqDev);
          with (frm_RecCheqDev) do
          begin
            showmodal;
            Free;
          end;
        end;
      end
      else
        frmDialogo.ExibirMensagem ('Não foi definido um CAIXA ativo ainda!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;


procedure Tfrm_MenuPrincipal_OpcaoCrediario.FormDestroy(Sender: TObject);
begin
  frm_MenuPrincipal_OpcaoCrediario := nil;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.Botao10Click(Sender: TObject);
begin
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_MenuPrincipal_OpcaoListaCrediario, frm_MenuPrincipal_OpcaoListaCrediario);
    with (frm_MenuPrincipal_OpcaoListaCrediario) do
    begin
      showmodal;
      Free;
    end;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.Botao11Click(Sender: TObject);
begin
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_ConfigLocaL2,frm_ConfigLocaL2);
    with (frm_ConfigLocaL2) do
    begin
      fvendas := true;
      showmodal;
      Free;
    end;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.Botao12Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_SenhaAdmin, frm_SenhaAdmin);
  frm_SenhaAdmin.caption := 'Configuração geral do sistema';
  frm_SenhaAdmin.color   := clteal;
  frm_SenhaAdmin.FVendas := true;
  frm_SenhaAdmin.showmodal;
  if (frm_SenhaAdmin.tecla=13) then
  begin
    Application.CreateForm(Tfrm_ConfigCobranca, frm_ConfigCobranca);
    frm_ConfigCobranca.fvendas := true;
    frm_ConfigCobranca.Panel3.color := clteal;
    frm_ConfigCobranca.showmodal;
    frm_ConfigCobranca.Free;
  end;
  frm_SenhaAdmin.Free;
end;


procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao9Click(Sender: TObject);
begin
  Modos := 1;
  if (databasecredito='CREDITO') then
    frm_principal.ChamandoClienteContrato (0,true)
  else
    frmDialogo.ExibirMensagem ('Sistema de Crediário inacessível!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_OpcaoCrediario.botao9MouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  TPanel(Sender).color := clWhite;
  TPanel(Sender).font.color := clTeal;
end;

end.
