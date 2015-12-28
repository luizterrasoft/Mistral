unit un_BotoesECF_Aliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, MaskEditOO, LabelOO, BotaoSair;

type
  Tfrm_BotoesECF_Aliquotas = class(TForm)
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    edtValor: TMaskEditOO;
    btnSalvar: TPanel;
    BotaoSair1: TBotaoSair;
    rdVinculo: TRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BotoesECF_Aliquotas: Tfrm_BotoesECF_Aliquotas;

implementation

{$R *.dfm}

uses funcoes1, funcoes2, principal, unDialogo, bematech, darumaFS345,urano,Urano1efc,dataregis;

procedure Tfrm_BotoesECF_Aliquotas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_BotoesECF_Aliquotas.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesECF_Aliquotas.edtValorEnter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_BotoesECF_Aliquotas.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnSalvarClick(btnSalvar);
end;

procedure Tfrm_BotoesECF_Aliquotas.edtValorExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_BotoesECF_Aliquotas.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_BotoesECF_Aliquotas.btnSalvarClick(Sender: TObject);
var
  sValor: String;
  res: Integer;
begin

  if (edtValor.GetValor=0) then
  begin
    frmDialogo.ExibirMensagem (' O valor da alíquota não pode ficar vazio! '
      ,'Leitura MF',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    EXIT;
  end
  else
  if (rdVinculo.itemindex=-1) then
  begin
    frmDialogo.ExibirMensagem (' O vínculo desejado deve ser informado! '
      ,'Leitura MF',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    EXIT;
  end;

  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
  begin
//         showmessage ('Comando ainda não implementado!');
    URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao));
    if URANOEFC_CarregaAliquota(Pchar(copy(formatfloat('0000',EdtValor.GetValor * 100),1,4))) = 0 then
      showmessage ('Alíquota programada com sucesso!');
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
  begin
//         showmessage ('Comando ainda não implementado!');
    URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao));
    if URANOEFC_1EFC_CarregaAliquota(Pchar(copy(formatfloat('0000',EdtValor.GetValor * 100),1,4))) = 0 then
      showmessage ('Alíquota programada com sucesso!');
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
  begin
    if (edtValor.GetValor=0) then
      frmDialogo.ExibirMensagem (' O valor da alíquota não pode ficar vazio! '
        ,'Leitura MF',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    if (rdVinculo.itemindex=-1) then
      frmDialogo.ExibirMensagem (' O vínculo desejado deve ser informado! '
        ,'Leitura MF',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      BEMATECH_Inicializa;
      sValor := form_nz(Int(edtValor.GetValor*100),4);
      res    := BEMATECH_ProgramaAliquotas(sValor,rdVinculo.itemindex);
      if (res=1) then
        showmessage ('Alíquota programada com sucesso!');
    end;
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
  begin
      //   showmessage ('Comando ainda não implementado!');
    if DATAREGISEFC_TributosGrava(EdtValor.GetValor) then
      showmessage ('Alíquota programada com sucesso!');
  end
  else
  if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
    if (edtValor.GetValor=0) then
      frmDialogo.ExibirMensagem (' O valor da alíquota não pode ficar vazio! '
        ,'Leitura MF',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    if (rdVinculo.itemindex=-1) then
      frmDialogo.ExibirMensagem (' O vínculo desejado deve ser informado! '
        ,'Leitura MF',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    if (DARUMAFS345_Inicializa=1) then
    begin
      sValor := form_nz(Int(edtValor.GetValor*100),4);
      res    := DARUMAFS345_ProgramaAliquota(sValor,inttostr(rdVinculo.itemindex));
      if (res=1) then
        showmessage ('Alíquota programada com sucesso!');
      DARUMAFS345_Finaliza; //finaliza DLL usada
    end;
end;

end.
