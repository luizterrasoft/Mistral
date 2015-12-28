unit un_Envia_Email_Crediario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  Tfrm_Envia_Exp_Cred_Email = class(TForm)
    odAnexos: TOpenDialog;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    edtPara: TEdit;
    Label1: TLabel;
    edtCC: TEdit;
    edtCCO: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtAssunto: TEdit;
    Label4: TLabel;
    cbxPrioridade: TComboBox;
    BitBtn1: TBitBtn;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    mmMensagem: TMemo;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Envia_Exp_Cred_Email: Tfrm_Envia_Exp_Cred_Email;

implementation

uses un_Exportacao_Trigger;

{$R *.dfm}

procedure Tfrm_Envia_Exp_Cred_Email.BitBtn1Click(Sender: TObject);
   begin
       if odAnexos.Execute then
       ListBox1.Items.Add(odAnexos.FileName);
   end;

procedure Tfrm_Envia_Exp_Cred_Email.BitBtn2Click(Sender: TObject);
var xAnexo : Integer;
begin
IdMessage.Recipients.EMailAddresses := edtPara.Text;
IdMessage.CCList.EMailAddresses := edtCC.Text;
IdMessage.BccList.EMailAddresses := edtCCO.Text;

//Trata a Prioridade da mensagem
case cbxPrioridade.ItemIndex of
0 : IdMessage.Priority := mpHigh;
1 : IdMessage.Priority := mpNormal;
2 : IdMessage.Priority := mpLow;
end;

IdMessage.Subject := edtAssunto.Text;
IdMessage.Body := mmMensagem.Lines;

if cbxConfirmaLeitura.Checked then
IdMessage.ReceiptRecipient.Text := IdMessage.From.Text; // Auto Resposta

//Tratando os arquivos anexos
for xAnexo := 0 to ListBox1.Items.Count-1 do
TIdAttachment.create(idmessage.MessageParts, TFileName(ListBox1.Items.Strings[xAnexo]));

IdSMTP.Connect;
try
IdSMTP.Send(IdMessage);
finally
IdSMTP.Disconnect;
end;
Application.MessageBox('Email enviado com sucesso!', 'Confirmação', MB_ICONINFORMATION + MB_OK);
end;


end;

end.
