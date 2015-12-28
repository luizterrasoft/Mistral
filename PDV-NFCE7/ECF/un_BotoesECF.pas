unit un_BotoesECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,cupomfiscal,serial;

type
  Tfrm_BotoesECF = class(TForm)
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    botao6: TPanel;
    botao7: TPanel;
    botao8: TPanel;
    botao9: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4Click(Sender: TObject);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5Click(Sender: TObject);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao3Click(Sender: TObject);
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao7Click(Sender: TObject);
    procedure botao8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao8Click(Sender: TObject);
    procedure botao9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VeioVenda:Boolean; 
    procedure ApagaTudo;
    function CriticaReducaoZ:Boolean;
  end;

var
  frm_BotoesECF: Tfrm_BotoesECF;

implementation

uses principal, urano, urano1efc, unDialogo, auxiliar, funcoes1, funcoes2, venda,
  un_senhaSupervisor, procura, bematech, un_BotoesECF_LeituraMF, darumaFS345,
  dataregis, un_BotoesECF_OpcoesLeituraX, un_BotoesECF_Aliquotas,
  un_LancaVenda;

{$R *.DFM}

procedure Tfrm_BotoesECF.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesECF.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesECF.FormKeyDown(Sender: TObject; var Key: Word;
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
      botao8Click(Sender)
    else
    if (botao9.color=clWhite) then
      botao9Click(Sender);
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
    botao8Click(Sender)
  else
  if (key=105) or (key=Ord('9')) then
    botao9Click(Sender)
end;

procedure Tfrm_BotoesECF.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesECF.ApagaTudo;
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

procedure Tfrm_BotoesECF.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao1Click(Sender: TObject);
begin
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) or
      (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    begin
      Application.CreateForm(Tfrm_BotoesECF_OpcoesLeituraX, frm_BotoesECF_OpcoesLeituraX);
      frm_BotoesECF_OpcoesLeituraX.showmodal;
      frm_BotoesECF_OpcoesLeituraX.Free;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      frmDialogo.posativ:=2;
      if (frmDialogo.ExibirMensagem ('Confirma leitura X inicial?'
        ,'ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        if (BEMATECH_Inicializa=1) then
        begin
          BEMATECH_LeituraX;
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      frmDialogo.posativ:=1;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    begin
          
      if (frmDialogo.ExibirMensagem ('Confirma leitura X inicial?'
        ,'ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        frm_principal.PortaSerial.OpenPort(cpCom1);
        DATAREGISEFC_LeituraX('N','S');
        frm_principal.PortaSerial.Closeport;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
      if (frmDialogo.ExibirMensagem ('Confirma leitura X inicial?'
        ,'ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          DARUMAFS345_LeituraX;
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
end;

procedure Tfrm_BotoesECF.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

{//Neste tipo de cancelamento, o sistema deu erro em algum lugar do fechamento, deixando a VENDA na ECF aberta}
{//Este comando só 'cancela' o cupom aberto, não sendo contabilizado!!!}
{//POR ENQUANTO, SOMENTE A 'URANO' POSSUI ESTA FUNCIONALIDADE.}
procedure Tfrm_BotoesECF.botao4Click(Sender: TObject);
var
  codigoestado: Integer;
begin

  if not VeioVenda and (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;

  if VeioVenda or frm_senhaSupervisor.y_flag then
  begin
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        codigoestado := URANOEFC_CodigoEstadoImpressora;
        if (codigoestado=119) or (codigoestado=120) or (codigoestado=121) then {em pagamento/em venda de item/em comercial}
        begin
          frmDialogo.posativ:=2;
          if VeioVenda or(frmDialogo.ExibirMensagem ('Confirma cancelamento do cupom aberto?'
            ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            URANOEFC_CancelaVenda (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self)));
          frmDialogo.posativ:=1;
        end
        else
          frmDialogo.ExibirMensagem ('Impressora sem cupom em aberto!'
            ,'ECF',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        URANOEFC_Finaliza; //finaliza DLL usada
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    begin
      if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      begin
        codigoestado := URANOEFC_1EFC_CodigoEstadoImpressora;
        if (codigoestado=119) or (codigoestado=120) or (codigoestado=121) then {em pagamento/em venda de item/em comercial}
        begin
          frmDialogo.posativ:=2;
          if VeioVenda or (frmDialogo.ExibirMensagem ('Confirma cancelamento do cupom aberto?'
            ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            URANOEFC_1EFC_CancelaVenda (Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self)));
          frmDialogo.posativ:=1;
        end
        else
          frmDialogo.ExibirMensagem ('Impressora sem cupom em aberto!'
            ,'ECF',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        URANOEFC_1EFC_Finaliza; //finaliza DLL usada
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      frmDialogo.posativ:=2;
      if  VeioVenda or(frmDialogo.ExibirMensagem ('Confirma cancelamento do cupom aberto?'
        ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        if  (BEMATECH_Inicializa=1) then
        begin
          BEMATECH_CancelaCupom;
          BEMATECH_Finaliza; //finaliza DLL usada
          if not VeioVenda then
            frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
              ,'ECF',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end;
      frmDialogo.posativ:=1;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    begin
      frmDialogo.posativ:=2;
      if  VeioVenda or(frmDialogo.ExibirMensagem ('Confirma cancelamento do cupom aberto?'
        ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        DATAREGISEFC_CancelaCupomAberto;
        if not VeioVenda then
          frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
            ,'ECF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end;
      frmDialogo.posativ:=1;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    begin
      frmDialogo.posativ:=2;
      if  VeioVenda or (frmDialogo.ExibirMensagem ('Confirma cancelamento do cupom aberto?','ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          DARUMAFS345_CancelaCupom;
          DARUMAFS345_Finaliza; //finaliza DLL usada
          if not VeioVenda then
            frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
              ,'ECF',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        end;
      frmDialogo.posativ:=1;
    end;
    if VeioVenda then
      Frm_LancaVenda.FlistaProd.Clear;
  end;
end;

procedure Tfrm_BotoesECF.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

{//Esta rotina cancela o ÚLTIMO CUPOM confirmado, cancelando também a última venda por feita por ECF}
procedure Tfrm_BotoesECF.botao5Click(Sender: TObject);
var
  ultima_venda_ecf: Real;
begin
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      ultima_venda_ecf := RetornaCodigoDaUltimaVendaPorCupom(frm_principal.x_loja,frm_principal.x_terminal);
      if (ultima_venda_ecf=-1) then
        frmDialogo.ExibirMensagem ('Não foi encontrada a última venda realizada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        if (VerificaStatusDaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf)='2') then
          frmDialogo.ExibirMensagem ('Venda já se encontra cancelada!'
            ,'ECF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          frmDialogo.posativ:=2;
          if (frmDialogo.ExibirMensagem ('Confirma cancelamento do último cupom? (ATENÇÃO: Esta operação cancelará a venda vinculada ao cupom)'
            ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
            begin
                                   //nao necessita autorizacao
              URANOEFC_CancelaCupom ('0',Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self)));
              URANOEFC_Finaliza; //finaliza DLL usada
                                   {*****************************************************************}
              CancelaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf);
                                   {*****************************************************************}
              frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
                ,'ECF',[mbOK]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            end;
          frmDialogo.posativ:=1;
        end;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
    begin
      ultima_venda_ecf := RetornaCodigoDaUltimaVendaPorCupom(frm_principal.x_loja,frm_principal.x_terminal);
      if (ultima_venda_ecf=-1) then
        frmDialogo.ExibirMensagem ('Não foi encontrada a última venda realizada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        if (VerificaStatusDaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf)='2') then
          frmDialogo.ExibirMensagem ('Venda já se encontra cancelada!'
            ,'ECF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          frmDialogo.posativ:=2;
          if (frmDialogo.ExibirMensagem ('Confirma cancelamento do último cupom? (ATENÇÃO: Esta operação cancelará a venda vinculada ao cupom)'
            ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
            begin
                                   //nao necessita autorizacao
              URANOEFC_1EFC_CancelaCupom ('0',Pchar(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_caixa_ativo,self)));
              URANOEFC_1EFC_Finaliza; //finaliza DLL usada
                                   {*****************************************************************}
              CancelaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf);
                                   {*****************************************************************}
              frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
                ,'ECF',[mbOK]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            end;
          frmDialogo.posativ:=1;
        end;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      ultima_venda_ecf := RetornaCodigoDaUltimaVendaPorCupom(frm_principal.x_loja,frm_principal.x_terminal);
      if (ultima_venda_ecf=-1) then
        frmDialogo.ExibirMensagem ('Não foi encontrada a última venda realizada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        if (VerificaStatusDaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf)='2') then
          frmDialogo.ExibirMensagem ('Venda já se encontra cancelada!'
            ,'ECF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          frmDialogo.posativ:=2;
          if (frmDialogo.ExibirMensagem ('Confirma cancelamento do último cupom? (ATENÇÃO: Esta operação cancelará a venda vinculada ao cupom)'
            ,'ECF',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            if (BEMATECH_Inicializa=1) then
            begin
              BEMATECH_CancelaCupom;
              BEMATECH_Finaliza; //finaliza DLL usada
                                   {*****************************************************************}
              CancelaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf);
                                   {*****************************************************************}
              frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
                ,'ECF',[mbOK]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            end;
          frmDialogo.posativ:=1;
        end;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    begin
      ultima_venda_ecf := RetornaCodigoDaUltimaVendaPorCupom(frm_principal.x_loja,frm_principal.x_terminal);
      if (ultima_venda_ecf=-1) then
        frmDialogo.ExibirMensagem ('Não foi encontrada a última venda realizada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        if (VerificaStatusDaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf)='2') then
          frmDialogo.ExibirMensagem ('Venda já se encontra cancelada!'
            ,'ECF',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          frmDialogo.posativ:=2;
          if (frmDialogo.ExibirMensagem ('Confirma cancelamento do último cupom? (ATENÇÃO: Esta operação cancelará a venda vinculada ao cupom)','ECF',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          begin
            DATAREGISEFC_CancelaUltimoCupom;
                              {*****************************************************************}
            CancelaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf);
                              {*****************************************************************}
            frmDialogo.ExibirMensagem ('Cancelamento efetuado!'
              ,'ECF',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          end;
          frmDialogo.posativ:=1;
        end;
      end;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    begin
      ultima_venda_ecf := RetornaCodigoDaUltimaVendaPorCupom(frm_principal.x_loja,frm_principal.x_terminal);
      if (ultima_venda_ecf=-1) then
        frmDialogo.ExibirMensagem ('Não foi encontrada a última venda realizada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (VerificaStatusDaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf)='2') then
        frmDialogo.ExibirMensagem ('Venda já se encontra cancelada!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        frmDialogo.posativ:=2;
        if (frmDialogo.ExibirMensagem ('Confirma cancelamento do último cupom?','ECF',[mbYes,mbNo]
          ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          if (DARUMAFS345_Inicializa=1) then
          begin
            DARUMAFS345_CancelaCupom;
            DARUMAFS345_Finaliza; //finaliza DLL usada
                                   {*****************************************************************}
            CancelaVenda(frm_principal.x_loja,frm_principal.x_terminal,ultima_venda_ecf);
                                   {*****************************************************************}
            frmDialogo.ExibirMensagem ('Cancelamento efetuado com sucesso!'
              ,'ECF',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          end;
        frmDialogo.posativ:=1;
      end;
    end;
end;

procedure Tfrm_BotoesECF.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao6Click(Sender: TObject);
begin
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_BotoesECF_LeituraMF, frm_BotoesECF_LeituraMF);
    frm_BotoesECF_LeituraMF.showmodal;
    frm_BotoesECF_LeituraMF.Free;
  end;
end;

procedure Tfrm_BotoesECF.botao2Click(Sender: TObject);
begin
     //CRITICAS
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    frmDialogo.posativ:=2;
    if (frmDialogo.ExibirMensagem ('Confirma redução Z?'
      ,'ECF',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          URANOEFC_Relatorio_XZ (Pchar(trim('1')));
          URANOEFC_AvancaLinhas (Pchar(trim('08'))); //Avanco de linha ate o picote
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          URANOEFC_1EFC_Relatorio_XZ (Pchar(trim('1')));
          URANOEFC_1EFC_AvancaLinhas (Pchar(trim('08'))); //Avanco de linha ate o picote
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
      begin
        if (BEMATECH_Inicializa=1) then
        begin
          BEMATECH_ReducaoZ;
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
      begin
        DATAREGISEFC_LeituraX('N','S');
        DATAREGISEFC_ReducaoZ('S');
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          DARUMAFS345_ReducaoZ;
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
    frmDialogo.posativ:=1;
  end;
end;

procedure Tfrm_BotoesECF.botao3Click(Sender: TObject);
begin
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
    if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      if (frmDialogo.ExibirMensagem ('Estado da impressora: '+URANOEFC_EstadoImpressora
        ,'ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        URANOEFC_Finaliza//finaliza DLL usada
    ;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
    if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
      if (frmDialogo.ExibirMensagem ('Estado da impressora: '+URANOEFC_1EFC_EstadoImpressora
        ,'ECF',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        URANOEFC_1EFC_Finaliza//finaliza DLL usada
    ;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    if (BEMATECH_Inicializa=1) then
    begin
      if (BEMATECH_VerificaEstadoImpressora=1) then
        showmessage ('Impressora pronta!');
      BEMATECH_Finaliza; //finaliza DLL usada
    end;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
    showmessage('Rotina ainda não definida para esta impressora!')
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    if (DARUMAFS345_Inicializa=1) then
    begin
      DARUMAFS345_VerificaEstadoImpressora;
      DARUMAFS345_Finaliza; //finaliza DLL usada
    end;
end;

procedure Tfrm_BotoesECF.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao7.color := clWhite;
  botao7.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao7Click(Sender: TObject);
var
  result: Integer;
  Formas: String;
begin
  frmDialogo.posativ:=2;
  if (frmDialogo.ExibirMensagem ('Confirma programação das formas de pgto.?'
    ,'ECF',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    if (not frm_senhaSupervisor.y_flag) then
      frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          result := URANOEFC_FormaPagamento(Pchar('01'),Pchar('CHEQUE'));
          if (result=0) then
            result := URANOEFC_FormaPagamento(Pchar('02'),Pchar('CARTAO'));
          if (result=0) then
            result := URANOEFC_FormaPagamento(Pchar('03'),Pchar('OUTROS'));
          if (result=0) then
            result := URANOEFC_FormaPagamento(Pchar('05'),Pchar('CREDIARIO'));
          if (result=0) then
            showmessage('Atenção: As seguintes formas de pagamento foram programadas: '+#13#10+
              '01 - CHEQUE,'+#13#10+
              '02 - CARTAO,'+#13#10+
              '03 - OUTROS,'+#13#10+
              '05 - CREDIARIO');
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          result := URANOEFC_1EFC_FormaPagamento(Pchar('01'),Pchar('CHEQUE'));
          if (result=0) then
            result := URANOEFC_1EFC_FormaPagamento(Pchar('02'),Pchar('CARTAO'));
          if (result=0) then
            result := URANOEFC_1EFC_FormaPagamento(Pchar('03'),Pchar('OUTROS'));
          if (result=0) then
            result := URANOEFC_1EFC_FormaPagamento(Pchar('05'),Pchar('CREDIARIO'));
          if (result=0) then
            showmessage('Atenção: As seguintes formas de pagamento foram programadas: '+#13#10+
              '01 - CHEQUE,'+#13#10+
              '02 - CARTAO,'+#13#10+
              '03 - OUTROS,'+#13#10+
              '05 - CREDIARIO');
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
        showmessage('Rotina não disponível para esta impressora!')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        showmessage('Rotina ainda não definida para esta impressora!')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          result := DARUMAFS345_ProgramaFormasPagamento('DINHEIRO;CHEQUE A VISTA;CARTAO;DEB. AUTOMATICO;CREDIARIO;VALES RECEBIDOS');
          if (result=1) then
            showmessage('As novas formas de pagamento programadas foram: '+#13#10+
              'DINHEIRO;CHEQUE A VISTA;CARTAO;DEB. AUTOMATICO;CREDIARIO;VALES RECEBIDOS');
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end//*******************************************************************************
//*******************************************************************************
    ;
  end;
end;

procedure Tfrm_BotoesECF.botao8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao8.color := clWhite;
  botao8.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao8Click(Sender: TObject);
var
  Formas: String;
  result: Integer;
begin
  frmDialogo.posativ:=2;
  if (frmDialogo.ExibirMensagem ('Confirma verificação das formas de pgto. programadas?'
    ,'ECF',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    if (not frm_senhaSupervisor.y_flag) then
      frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
        frmDialogo.ExibirMensagem ('Rotina não disponível para esta impressora!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
        frmDialogo.ExibirMensagem ('Rotina não disponível para esta impressora!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
        frmDialogo.ExibirMensagem ('Rotina não disponível para esta impressora!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        frmDialogo.ExibirMensagem ('Rotina ainda não definida para esta impressora!'
          ,'ECF',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          setlength(Formas,275);
          result := DARUMAFS345_VerificaDescricaoFormasPagamento(Formas);
          if (result=1) then
            if (frmDialogo.ExibirMensagem ('As formas de pagamento programadas são: '+#13#10+' -> '+Formas
              ,'ECF',[mbYes,mbNo]
              ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          ;
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end//*******************************************************************************
//*******************************************************************************
    ;
  end;
end;

function Tfrm_BotoesECF.CriticaReducaoZ:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CX_DATA,CX_FUNC                    ');
  clAux.AddParam ('FROM   CAIXAS                             ');
  clAux.AddParam ('WHERE (CX_LOJA =  :loja) AND              ');
  clAux.AddParam ('      (CX_STAT <> :status) AND            ');
  clAux.AddParam ('      (CX_CAIX =  :terminal) AND          ');
  clAux.AddParam ('      (CX_DATA <= :data)                  ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('status').AsString  := KST_CAIXA_ENCERRADO;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  if (clAux.Execute) then
  begin
    clAux.first; {*} //exibe sempre o primeiro
    ExibeCritica ('Existe CAIXA NAO ENCERRADO neste       terminal > Data: '+form_data(clAux.result('CX_DATA')),'CAIXA',nil);
    ExibeCritica ('Encerre todos os CAIXAS pendentes, antes de prosseguir!','CAIXA',nil);

    result := true;
  end
  else
    result := false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_BotoesECF.botao9MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao9.color := clWhite;
  botao9.font.color := clTeal;
end;

procedure Tfrm_BotoesECF.botao9Click(Sender: TObject);
begin
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_BotoesECF_Aliquotas, frm_BotoesECF_Aliquotas);
    frm_BotoesECF_Aliquotas.showmodal;
    frm_BotoesECF_Aliquotas.Free;
  end;
end;

procedure Tfrm_BotoesECF.FormCreate(Sender: TObject);
begin
  VeioVenda := false;
end;

end.
