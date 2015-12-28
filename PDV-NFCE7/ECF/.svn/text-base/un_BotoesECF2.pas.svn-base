unit un_BotoesECF2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cupomfiscal, serial;

type
  Tfrm_BotoesECF2 = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    btnFechar: TPanel;
    botao11: TPanel;
    botao10: TPanel;
    botao9: TPanel;
    botao8: TPanel;
    botao7: TPanel;
    botao6: TPanel;
    botao5: TPanel;
    botao4: TPanel;
    botao3: TPanel;
    botao2: TPanel;
    botao14: TPanel;
    botao1: TPanel;
    botao12: TPanel;
    botao13: TPanel;
    procedure botao14Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao12MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_BotoesECF2: Tfrm_BotoesECF2;

implementation

uses principal, urano, urano1efc, unDialogo, auxiliar, funcoes1, funcoes2, venda,
  un_senhaSupervisor, procura, bematech, un_BotoesECF_LeituraMF, darumaFS345, darumaFS700,
  dataregis, un_BotoesECF_OpcoesLeituraX, un_BotoesECF_Aliquotas,
  un_LancaVenda, un_BotoesECF;

{$R *.dfm}

procedure Tfrm_BotoesECF2.botao14Click(Sender: TObject);
begin
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_BotoesECF, frm_BotoesECF);
    frm_BotoesECF.showmodal;
    frm_BotoesECF.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_BotoesECF2.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesECF2.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesECF2.ApagaTudo;
begin
  botao1.color       := clTeal;
  botao1.font.color  := clWhite;
  botao2.color       := clTeal;
  botao2.font.color  := clWhite;
  botao3.color       := clTeal;
  botao3.font.color  := clWhite;
  botao4.color       := clTeal;
  botao4.font.color  := clWhite;
  botao5.color       := clTeal;
  botao5.font.color  := clWhite;
  botao6.color       := clTeal;
  botao6.font.color  := clWhite;
  botao7.color       := clTeal;
  botao7.font.color  := clWhite;
  botao8.color       := clTeal;
  botao8.font.color  := clWhite;
  botao9.color       := clTeal;
  botao9.font.color  := clWhite;
  botao10.color      := clTeal;
  botao10.font.color := clWhite;
  botao11.color      := clTeal;
  botao11.font.color := clWhite;
  botao12.color      := clTeal;
  botao12.font.color := clWhite;
  botao13.color      := clTeal;
  botao13.font.color := clWhite;
  botao14.color      := clTeal;
  botao14.font.color := clWhite;
end;

procedure Tfrm_BotoesECF2.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color      := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color      := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color      := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color      := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color      := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color      := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao7.color      := clWhite;
  botao7.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao8.color      := clWhite;
  botao8.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao9MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao9.color      := clWhite;
  botao9.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao10MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao10.color      := clWhite;
  botao10.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao11.color      := clWhite;
  botao11.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao12MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao12.color      := clWhite;
  botao12.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao13MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao13.color      := clWhite;
  botao13.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao14.color      := clWhite;
  botao14.font.color := clTeal;
end;

procedure Tfrm_BotoesECF2.botao1Click(Sender: TObject);
begin
        {if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) or
             (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
          begin
               Application.CreateForm(Tfrm_BotoesECF_OpcoesLeituraX, frm_BotoesECF_OpcoesLeituraX);
               frm_BotoesECF_OpcoesLeituraX.showmodal;
               frm_BotoesECF_OpcoesLeituraX.Free;
          end
          else }if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
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
  begin
    if (frmDialogo.ExibirMensagem ('Confirma leitura X inicial?'
      ,'ECF',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (DARUMAFS345_Inicializa=1) then
      begin
        DARUMAFS345_LeituraX;
        DARUMAFS345_Finaliza; //finaliza DLL usada
      end;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS700) then
    if (frmDialogo.ExibirMensagem ('Confirma leitura X inicial?'
      ,'ECF',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  ;
end;

end.
