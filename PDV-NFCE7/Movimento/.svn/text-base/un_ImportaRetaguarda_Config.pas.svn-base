unit un_ImportaRetaguarda_Config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BotaoSair, ExtCtrls;

type
  Tfrm_ImportaRetaguarda_Config = class(TForm)
    Panel1: TPanel;
    frm_ImportaRetaguarda_Config: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    BotaoSair1: TBotaoSair;
    chPRODUTOS: TCheckBox;
    chPRODUTOS_FAIXAS: TCheckBox;
    chESTOQUE: TCheckBox;
    chITENS_TABELAS_PRECOS: TCheckBox;
    chPRECOS_PROMOCIONAIS: TCheckBox;
    chGRUPOS_PRODUTOS: TCheckBox;
    chSUBGRUPOS_PRODUTOS: TCheckBox;
    chCORES: TCheckBox;
    chTAMANHOS: TCheckBox;
    chTAMANHOS_FAIXAS: TCheckBox;
    chCOLECOES: TCheckBox;
    chLINHAS: TCheckBox;
    chMATERIAIS: TCheckBox;
    chMODELOS: TCheckBox;
    chADMINISTRADORAS: TCheckBox;
    chALIQUOTAS_PRODUTOS: TCheckBox;
    btnMarcarTudo: TPanel;
    btnDesmarcarTudo: TPanel;
    chCBARRAS: TCheckBox;
    chCRELOJA: TCheckBox;
    chUSERS: TCheckBox;
    chVENDEDORES: TCheckBox;
    chFORNECEDORES: TCheckBox;
    chBANCOS: TCheckBox;
    chSEQVENDAS: TCheckBox;
    chCONF: TCheckBox;
    chADMINISTRADORAS_LOJAS: TCheckBox;
    chCONTAS: TCheckBox;
    chGRUPOSCONTAS: TCheckBox;
    chMTV_ATDO: TCheckBox;
    procedure btnMarcarTudoClick(Sender: TObject);
    procedure btnDesmarcarTudoClick(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ImportaRetaguarda_Config: Tfrm_ImportaRetaguarda_Config;

implementation

{$R *.DFM}

procedure Tfrm_ImportaRetaguarda_Config.btnMarcarTudoClick(
  Sender: TObject);
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TCheckBox) then
      TCheckBox(Lista.items[ind]).checked:=true;
    ind:=ind+1;
  end;
  Lista.Free;
end;

procedure Tfrm_ImportaRetaguarda_Config.btnDesmarcarTudoClick(
  Sender: TObject);
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TCheckBox) then
      TCheckBox(Lista.items[ind]).checked:=false;
    ind:=ind+1;
  end;
  Lista.Free;
end;

procedure Tfrm_ImportaRetaguarda_Config.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
