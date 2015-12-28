unit un_FrmInfoAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, ComCtrls;

type
  TFrm_InfoAdicionais = class(TForm)
    Panel1: TPanel;
    btnConfirma: TButton;
    btnCancela: TButton;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    gruTipeTribNota: TGroupBox;
    lblNfSaida: TLabel;
    lblNfEntrada: TLabel;
    lblCfop: TLabel;
    lblCsosn: TLabel;
    lblSitIpi: TLabel;
    lblSitPis: TLabel;
    lblSitCofins: TLabel;
    lblDescCfop: TLabel;
    lblDescCsosn: TLabel;
    lblDescSitIpi: TLabel;
    lblDescSitPis: TLabel;
    lblDescSitCofins: TLabel;
    edtCfop: TEdit;
    edtCsosn: TEdit;
    edtSitIpi: TEdit;
    edtSitPis: TEdit;
    edtSitCofins: TEdit;
    rdgTpNota: TRadioGroup;
    GroupBox2: TGroupBox;
    GrpTransportadora: TGroupBox;
    lblTransportadora: TLabel;
    lblMarca: TLabel;
    lblEspecie: TLabel;
    lblQtdeVolume: TLabel;
    lblPbruto: TLabel;
    lblPliquido: TLabel;
    lblPlaca: TLabel;
    sbtnTranspo: TSpeedButton;
    edtTransportadora: TEdit;
    editMarca: TEdit;
    edtEspecie: TEdit;
    estQtdVolume: TEdit;
    edtPbruto: TEdit;
    edtPliquido: TEdit;
    edtPlaca: TEdit;
    rdgFrete: TRadioGroup;
    MemoInfoAd: TMemo;
    gruImpTotal: TGroupBox;
    Label3: TLabel;
    lblSeguro: TLabel;
    lblVlIcms: TLabel;
    lblVlFrete: TLabel;
    lblIcms: TLabel;
    lblOutros: TLabel;
    lblIcmsSub: TLabel;
    lblTotNota: TLabel;
    lblVlIcmsSub: TLabel;
    lblVlIpi: TLabel;
    lblTotProd: TLabel;
    lbllVlrDesc: TLabel;
    edtBcIcms: TEdit;
    edtTotProd: TEdit;
    edtValDesc: TEdit;
    edtValorICMS: TEdit;
    edtValFrete: TEdit;
    edtBIcmsSub: TEdit;
    edtSeguro: TEdit;
    edtVIcmsSub: TEdit;
    edtOutros: TEdit;
    edtTotNota: TEdit;
    edtValorlPI: TEdit;
    procedure btnCancelaClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure edtCfopExit(Sender: TObject);
    procedure edtSitIpiExit(Sender: TObject);
    procedure edtSitPisExit(Sender: TObject);
    procedure edtSitCofinsExit(Sender: TObject);
    procedure EdtInfoAdicionaisKeyPress(Sender: TObject; var Key: Char);
    procedure edtCsosnExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdgTpNotaClick(Sender: TObject);
    procedure edtCfopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    ICMS, ICMS_APROV, ALIQ_AICMS : String;  y_base_icms, calculo_icms, aprov_credito : real;
    Confirma_Impressao : Boolean;
  end;

var
  Frm_InfoAdicionais: TFrm_InfoAdicionais;

implementation

uses AuxiliarNFE, principal, un_FechamentoVenda;

{$R *.dfm}

procedure TFrm_InfoAdicionais.FormActivate(Sender: TObject);
begin
  y_base_icms  := frm_FechamentoVenda.y_BaseICMS;
  calculo_icms := y_base_icms * 1.25;
  ICMS_APROV  := '2.24'; // FloatToStr(calculo_icms);
  ALIQ_AICMS  := '1.25';

 If Frm_principal.Tipo_Nota = 'NFCE' then
    rdgTpNota.Visible := false;

   MemoInfoAd.Clear;
   If Frm_Principal.Tipo_Nota = 'NFE' then
      Begin
       MemoInfoAd.Lines.add('Documento emitido por ME ou EPP optante pelo Simples Nacional.');
       MemoInfoAd.Lines.add('Nao gera direito a credito fiscal de IPI.');
       MemoInfoAd.Lines.add('PROCON-RJ - Rua da Ajuda N 05 - subsolo - Central do Brasil - Telefone 151');
       MemoInfoAd.Lines.add('ALERJ - Palacio Tiradentes - Rua Primeiro de Marco, S/N - Praca XV - Tel:2588-1000 ');
       MemoInfoAd.Lines.add('Permite o aproveitamento do credito ICMS no valor de R$ '+ICMS_APROV+' correspodente a aliquota de '+ALIQ_AICMS+'%, nos termos do Art. 23 da LC 123/2006');
      end
   else
      Begin
       MemoInfoAd.Lines.add('PROCON-RJ - Rua da Ajuda Nº 05 - subsolo - Central do Brasil - Telefone 151');
       MemoInfoAd.Lines.add('ALERJ - Palácio Tiradentes - Rua Primeiro de Março, S/N - Praça XV - Tel: 2588-1000');
      End;

end;

procedure TFrm_InfoAdicionais.btnCancelaClick(Sender: TObject);
begin
  Confirma_Impressao := false;
  Close;
end;

procedure TFrm_InfoAdicionais.btnConfirmaClick(Sender: TObject);
begin
  Confirma_Impressao := true;
  close;
end;

procedure TFrm_InfoAdicionais.edtCfopExit(Sender: TObject);
begin
   if EdtCFOP.Text <> '' then
      lblDescCfop.Caption := BuscaCFOP(strTofloat(EdtCFOP.Text), Self);
   end;

procedure TFrm_InfoAdicionais.edtSitIpiExit(Sender: TObject);
begin
   if edtSitIpi.Text <> '' then
      lblDescSitIPI.Caption := BuscaIPI(strTofloat(edtSitIpi.Text), Self);
end;

procedure TFrm_InfoAdicionais.edtSitPisExit(Sender: TObject);
begin
   if edtSitPis.Text <> '' then
      lblDescSitPis.Caption := BuscaPIS(strTofloat(edtSitPis.Text), Self);

end;

procedure TFrm_InfoAdicionais.edtSitCofinsExit(Sender: TObject);
begin
   if edtSitCOFINS.Text <> '' then
      lblDescSitCOFINS.Caption := BuscaCOFINS(strTofloat(edtSitCOFINS.Text), Self);

end;

procedure TFrm_InfoAdicionais.EdtInfoAdicionaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then
   Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;

end;

procedure TFrm_InfoAdicionais.edtCsosnExit(Sender: TObject);
begin
   if edtCSOSN.Text <> '' then
      lblDescCSOSN.Caption := BuscaCSOSN(strTofloat(edtCSOSN.Text), Self);
end;


procedure TFrm_InfoAdicionais.rdgTpNotaClick(Sender: TObject);
var x : integer;
begin

  if rdgTpNota.ItemIndex = 0 then // Nota de Entrada
     begin
       x := 0;  // Não permitir CFOP 5,6,7
     end;

end;

procedure TFrm_InfoAdicionais.edtCfopKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (key=K_F2) then
//    grade.setfocus;
  if (key=K_F8) then
      ChamandoF8CFOP (edtCfop,false);
{  if (key=K_ENTER) or (key=K_BAIXO) then
    if (Trim(edtCodForma.text)<>'') then
    begin
//
    end
    else
      edtNDoc.setfocus;
  if (key=K_CIMA) then
}

end;

end.
