unit un_TrataNFENFCE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IniFiles, auxiliar;

type
 TResultArray = array of string;

  Tfrm_TrataNFENFCE = class(TForm)
    Panel1: TPanel;
    gbxEnvioeAutoNfe: TGroupBox;
    lblXmlNfe: TLabel;
    lblPtrotocolo: TLabel;
    lblDataHora: TLabel;
    lblNsalvar: TLabel;
    lblNenviar: TLabel;
    lblNimpDanfe: TLabel;
    lblEnviaNfeCliente: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    spdbtImprimir: TSpeedButton;
    imgSalvar: TImage;
    ImgEnviarCliente: TImage;
    imgImprimir: TImage;
    imgEnviar: TImage;
    gbxExportacao: TGroupBox;
    lblUfEmbarque: TLabel;
    lblLocEmbarque: TLabel;
    edtUfEmbarque: TEdit;
    edtLocEmbarque: TEdit;
    edtXmlNfe: TEdit;
    edtProtocolo: TEdit;
    edtDataHora: TEdit;
    btnEnvioNfeCliente: TButton;
    btnSair: TButton;
    lblStatusNF: TLabel;
    Label1: TLabel;
    lblNomeCliente: TLabel;
    Label3: TLabel;
    edtEmailCliente: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spdbtImprimirClick(Sender: TObject);
    procedure btnEnvioNfeClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    DadosSefaz : TResultArray;

    sRetVersao, sRetTpAmb, sVerAplic, sNRec, sCSTat, sXMOTIVO, sCUF : String;

    lArq : TStringList;    sCSTaTusDanfe : String;

    sArquivoEntNfe, sArquivoEntNfe2, sArquivoSaiNfe  : String;

    procedure GRAVA_DADOS_RETORNO_NFE;

  end;

var
  frm_TrataNFENFCE: Tfrm_TrataNFENFCE;

implementation

uses un_FechamentoVenda, principal, AuxiliarNFE;

{$R *.dfm}

procedure Tfrm_TrataNFENFCE.FormShow(Sender: TObject);
var
    NDOC, Tipo_Nota : string;  x: integer;
begin
  Tipo_Nota := frm_FechamentoVenda.Tipo_Nota;
  btnSair.Enabled := False;
  spdbtImprimir.Enabled := True;

  NDOC := trim(Frm_FechamentoVenda.edtNDoc.Text);
  lblNomeCliente.Caption := Frm_fechamentoVenda.y_nome;
  edtEmailCliente.Text := Frm_fechamentoVenda.y_email;

  if trim(edtEmailCliente.Text)='' then
       Begin
         edtEmailCliente.Visible := false;
         label3.Visible := false;
         ImgEnviarCliente.Visible := False;
         btnEnvioNfeCliente.Visible := False;
         lblEnviaNfeCliente.Visible := False;
    end;

    sArquivoEntNfe := ExtractFilePath(Application.ExeName)+'TXT\ENTNFE'+NDOC+'.TXT';
    sArquivoEntNfe2 := ExtractFilePath(Application.ExeName)+Tipo_Nota+'\ENTNFE'+NDOC+'.TXT';
    sArquivoSaiNfe := ExtractFilePath(Application.ExeName)+'TXT\SAINFE'+NDOC+'.TXT';

    edtDataHora.Text  := Frm_fechamentoVenda.vrAux3[25];
    edtProtocolo.Text := Frm_fechamentoVenda.vrAux3[26];
    edtXmlNfe.Text    := Frm_fechamentoVenda.vrAux3[28];

     lblStatusNF.Caption := 'Status da '+TIPO_NOTA+' Num. '+NDOC+ '= '+Frm_fechamentoVenda.vrAux3[15]+' '+Frm_fechamentoVenda.vrAux3[16];//+' ('+sCampo1+')';
     if Frm_fechamentoVenda.vrAux3[15] <> '100' then
        Begin
          ShowMessage('NFE - Não Autorizada - CSTAT='+Frm_fechamentoVenda.vrAux3[15]+#13#10+Frm_fechamentoVenda.vrAux3[16]);
          Close;
        End;

//     if Frm_fechamentoVenda.vrAux3[15] = '100' then
//        GRAVA_DADOS_RETORNO_NFE;
end;

procedure Tfrm_TrataNFENFCE.btnSairClick(Sender: TObject);
begin
  edtEmailCliente.Visible := true;
  label3.Visible := true;
  ImgEnviarCliente.Visible := true;
  btnEnvioNfeCliente.Visible := true;
  lblEnviaNfeCliente.Visible := True;
  Close;
end;

procedure Tfrm_TrataNFENFCE.spdbtImprimirClick(Sender: TObject);
begin

  lArq := TStringList.Create;

  If trim(edtXmlNfe.Text) <> '' then
    Begin
      lArq.Text := 'NFe.ImprimirDanfe("'+edtXmlNfe.Text+'")';

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUS.TXT');

      while not FileExists('C:\MIstralNF\TXT\SAINFESTATUS.TXT') do

      Sleep(1000);
      //
      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUS.TXT') = 'OK:' then
         sCSTaTusDanfe := 'OK:'
      else
         sCSTaTusDanfe := 'ERRO:';

  // Rotina para Testar se foi tudo com Sucesso

  // Carregar a Imagem do Botão Verde

     ShowMEssage('Nota Enviada Com sucesso');
     spdbtImprimir.Enabled := false;
     
     btnSair.Enabled := True;

  begin
      lArq.Text := 'NFe.ImprimirDanfePDF("'+edtXmlNfe.Text+'")';
      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUS.TXT');
      while not FileExists('C:\MIstralNF\TXT\SAINFESTATUS.TXT') do

      Sleep(1000);
      //
      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUS.TXT') = 'OK:' then
         sCSTaTusDanfe := 'OK:'
      else
         sCSTaTusDanfe := 'ERRO:';

     ShowMEssage('Arquivo PDF Gerado com sucesso');
     btnSair.SetFocus;

end;

   End;
end;

procedure Tfrm_TrataNFENFCE.btnEnvioNfeClienteClick(Sender: TObject);
begin

  lArq := TStringList.Create;

  If trim(edtEmailCliente.Text) <> '' then
    Begin

      lArq.Text := 'NFe.EnviarEmail("'+trim(edtEmailCliente.Text)+'","'+edtXmlNfe.Text+'")';

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFESTATUS.TXT');

      // Carregar a Imagem do Botão Verde

      btnEnvioNfeCliente.Enabled := false;

      while not FileExists('C:\MIstralNF\TXT\SAINFESTATUS.TXT') do
      Sleep(1000);

      if ChecaStatusArqRetorno('C:\MIstralNF\TXT\SAINFESTATUS.TXT') = 'OK:' then
         ShowMessage('Nota Enviada com Sucesso ')
      else
         ShowMessage('ERRO NA IMPRESSAO DO ARQUIVO ');

      btnSair.SetFocus;
  End;

end;


procedure Tfrm_TrataNFENFCE.GRAVA_DADOS_RETORNO_NFE;
var
  clVend: TClassAuxiliar;
  icms: Real;
begin
{  clVend := TClassAuxiliar.Create;
//  clVend.conect   (databaseprodutos,self);
  clVend.conect   (databasevendas, self);
  clVend.ClearSql;
  clVend.AddParam ('INSERT INTO DADOSNFE                     ');
  clVend.AddParam (' (ID,ENV_VERSAO, NFE_CSTAT, NFE_CHNFE, NFE_ARQUIVO, NFE_NUMERO) ');
  clVend.AddParam ('VALUES                                   ');
  clVend.AddParam (' (:ID, :ENV_VERSAO, :NFE_CSTAT, :NFE_CHNFE, :NFE_ARQUIVO, :NFE_NUMERO) ');

  clVend.consulta.parambyname('ID').AsInteger         := StrtoInt(Frm_FechamentoVenda.edtNDoc.Text);

  clVend.consulta.parambyname('ENV_VERSAO').AsString  := ' ';
  clVend.consulta.parambyname('NFE_CSTAT').AsString   := Frm_fechamentoVenda.vrAux3[15];
  clVend.consulta.parambyname('NFE_CHNFE').AsString   := Frm_fechamentoVenda.vrAux3[24];;
  clVend.consulta.parambyname('NFE_ARQUIVO').AsString := Frm_fechamentoVenda.vrAux3[28];
  clVend.consulta.parambyname('NFE_NUMERO').AsInteger := StrtoInt(Frm_FechamentoVenda.edtNDoc.Text);

  clVend.Execute;
  clVend.desconect;
  clVend.Free;
}
end;

end.
