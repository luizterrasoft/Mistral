unit un_MenuPrincipal_Opcao1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_MenuPrincipal_Opcao1 = class(TForm)
    botao1: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TPanel;
    botao7: TPanel;
    botao3: TPanel;
    botao2: TPanel;
    Timer1: TTimer;
    botao6: TPanel;
    Bevel1: TBevel;
    Botao8: TPanel;
    Botao9: TPanel;
    botao10: TPanel;
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao4Click(Sender: TObject);
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao7Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao10Click(Sender: TObject);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure Botao8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Botao8Click(Sender: TObject);
    procedure Botao9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure botao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
    procedure Miolo_1_2;
    procedure Verifica_SeFaz_Ativo;
  end;

var
  frm_MenuPrincipal_Opcao1: Tfrm_MenuPrincipal_Opcao1;

implementation

uses un_LancaVenda, un_VendaDeVales, un_SumarioVendas, funcoes1, funcoes2,
  un_SinteseVendasPorDia, un_ListaVendas, un_ConsultaVenda, principal,
  un_LancaVenda_InformeVendedor, unDialogo, un_senhaSupervisor,
  un_CancelaVenda, un_ValeMercadoriaFunc, un_ListaMaisVend2,
  un_botoesListagensAtdo, un_botoesOutrasFuncoes, un_ConsultaProdutos,
  Un_ConsProdutosEstoque, AuxiliarNFE;

{$R *.DFM}

procedure Tfrm_MenuPrincipal_Opcao1.ApagaTudo;
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
  botao9.color := clTeal;
  botao9.font.color := clWhite;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;


procedure Tfrm_MenuPrincipal_Opcao1.Miolo_1_2;
Begin

  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    un_lancavenda_informevendedor.ultvendedor := 0;
    Application.CreateForm(Tfrm_LancaVenda_InformeVendedor, frm_LancaVenda_InformeVendedor);
    frm_LancaVenda_InformeVendedor.showmodal;
    if (frm_LancaVenda_InformeVendedor.resultado=13) then
    begin

      Application.CreateForm(Tfrm_LancaVenda,frm_LancaVenda);
      frm_LancaVenda.MODO      := 'VENDEDOR';
      frm_LancaVenda.showmodal;
      frm_LancaVenda.Free;
    end;
    frm_LancaVenda_InformeVendedor.Free;
    frm_MenuPrincipal_Opcao1.show;
    frm_senhaSupervisor.y_flag := false;

  end
  else
    frmDialogo.ExibirMensagem ('N�o foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);

//  end;

end;

procedure Tfrm_MenuPrincipal_Opcao1.botao1Click(Sender: TObject);
begin
  Verifica_SeFaz_Ativo;
  if frm_principal.MOD_NFE = 1 then
     Begin
      frm_principal.x_modelo_NF := '55';
      frm_principal.Tipo_Nota := 'NFE';
      Miolo_1_2;
     End
  else
     ShowMessage('ESTE M�DULO DE NFE N�O ESTA LIBERADO PARA SUA EMPRESA!');
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao2Click(Sender: TObject);
begin
 Verifica_SeFaz_Ativo;
 if (ServicoSeFazAtivo() = 'OK') Then
    Begin
      if frm_principal.MOD_NFCE = 1 then
         Begin
          frm_principal.x_modelo_NF := '65';
          frm_principal.Tipo_Nota := 'NFCE';

          Miolo_1_2;
         End
      else
         ShowMessage('ESTE M�DULO DE NFCE N�O ESTA LIBERADO PARA SUA EMPRESA!');
    end
  else
         ShowMessage('Servi�o SEFAZ / INTERNET - INATIVO(S) - FAVOR VERIFICAR');
 end;


procedure Tfrm_MenuPrincipal_Opcao1.botao10Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_LancaVenda,frm_LancaVenda);
    frm_LancaVenda.MODO      := 'ATENDIMENTO';
    frm_principal.x_vendedor := 0;
    frm_LancaVenda.showmodal;
    frm_LancaVenda.Free;
    frm_MenuPrincipal_Opcao1.show;
    frm_senhaSupervisor.y_flag := false;

  end
  else
    frmDialogo.ExibirMensagem ('N�o foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;


procedure Tfrm_MenuPrincipal_Opcao1.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
      botao8Click(Sender)
    else
    if (botao9.color=clWhite) then
      botao9Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender)
//     else if (key=99) or (key=Ord('3')) then botao3Click(Sender)
//     else if (key=100) or (key=Ord('4')) then botao4Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao5Click(Sender)
  else
  if (key=102) or (key=Ord('6')) then
    botao8Click(Sender)
  else
  if (key=103) or (key=Ord('7')) then
    botao9Click(Sender)
  else
  if (key=104) or (key=Ord('8')) then
    botao6Click(Sender)
  else
  if (key=105) or (key=Ord('9')) then
    botao7Click(Sender);
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao4Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_VendaDeVales, frm_VendaDeVales);
    frm_VendaDeVales.caption  := 'EMISS�O DE VALES AVULSOS';
    frm_VendaDeVales.y_flagFecharAposSalvar := false;
    frm_VendaDeVales.showmodal;
    frm_VendaDeVales.Free;
  end
  else
    frmDialogo.ExibirMensagem ('N�o foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao7.color := clWhite;
  botao7.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  TPanel(Sender).color := clWhite;
  TPanel(Sender).font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao7Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_botoesOutrasFuncoes, frm_botoesOutrasFuncoes);
      frm_botoesOutrasFuncoes.showmodal;
      frm_botoesOutrasFuncoes.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_botoesOutrasFuncoes, frm_botoesOutrasFuncoes);
    frm_botoesOutrasFuncoes.showmodal;
    frm_botoesOutrasFuncoes.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_MenuPrincipal_Opcao1.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao3Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    Application.CreateForm(Tfrm_ValeMercadoriaFunc, frm_ValeMercadoriaFunc);
    frm_ValeMercadoriaFunc.showmodal;
    frm_ValeMercadoriaFunc.Free;
  end
  else
    frmDialogo.ExibirMensagem ('N�o foi definido um CAIXA ativo ainda!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;


procedure Tfrm_MenuPrincipal_Opcao1.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao6Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_LISTAGENS_VENDAS) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_botoesListagensAtdo, frm_botoesListagensAtdo);
      frm_botoesListagensAtdo.showmodal;
      frm_botoesListagensAtdo.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_botoesListagensAtdo, frm_botoesListagensAtdo);
    frm_botoesListagensAtdo.showmodal;
    frm_botoesListagensAtdo.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_MenuPrincipal_Opcao1.botao5Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_CONSULTA_VENDA) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_ConsultaVenda, frm_ConsultaVenda);
      frm_ConsultaVenda.left   := 0;
      frm_ConsultaVenda.top    := 0;
      frm_ConsultaVenda.width  := 800;
      frm_ConsultaVenda.height := 600;
      frm_ConsultaVenda.Modo   := K_MODO_CONSULTA_VENDA_NORMAL;
      frm_ConsultaVenda.showmodal;
      frm_ConsultaVenda.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_ConsultaVenda, frm_ConsultaVenda);
    frm_ConsultaVenda.left   := 0;
    frm_ConsultaVenda.top    := 0;
    frm_ConsultaVenda.width  := 800;
    frm_ConsultaVenda.height := 600;
    frm_ConsultaVenda.Modo   := K_MODO_CONSULTA_VENDA_NORMAL;
    frm_ConsultaVenda.showmodal;
    frm_ConsultaVenda.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_MenuPrincipal_Opcao1.Botao8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Apagatudo;
  botao8.color := clWhite;
  botao8.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal_Opcao1.Botao8Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.codigo_loja := frm_principal.x_loja;
  frm_ConsultaProduto.y_RotinaChamadora:=0;
  frm_ConsultaProduto.showmodal;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_MenuPrincipal_Opcao1.Botao9Click(Sender: TObject);
begin
  if not frm_principal.x_ConsEstoqOutras and not frm_principal.x_ConsEstoqLoja then
  begin
    frmDialogo.ExibirMensagem ('Consulta de Itens de Estoque das Lojas n�o Habilitada'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    exit;                           
  end;


  if (frm_principal.x_solicitar_senha_Saldo) then
  begin
    frm_senhaSupervisor.showmodal;
    if not frm_senhaSupervisor.y_flag then
      exit;
  end;

  Frm_ConsProdutosEstoque := TFrm_ConsProdutosEstoque.create(Application);
  Frm_ConsProdutosEstoque.showmodal;
  Frm_ConsProdutosEstoque.destroy;
end;

procedure Tfrm_MenuPrincipal_Opcao1.FormDestroy(Sender: TObject);
begin
  frm_MenuPrincipal_Opcao1 := nil;
end;


procedure Tfrm_MenuPrincipal_Opcao1.Verifica_SeFaz_Ativo;
begin
 if ServicoSeFazAtivo() = 'OK' Then
    frm_principal.x_internet_ok := true         {+#13#10+}
 else
    if (frmDialogo.ExibirMensagem ('INTERNET INSTAVEL! - Confirma Instabilidade da Internet ?'
                           ,'Venda',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',25[[lz0,200)=mrYes) then
      frm_principal.x_internet_ok := false
    else
      frm_principal.x_internet_ok := true;

end;

end.
