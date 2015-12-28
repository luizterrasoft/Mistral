unit un_config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Mask, ComCtrls;

type
  Tfrm_configVendas = class(TForm)
    fichario: TPageControl;
    pagina2: TTabSheet;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    cbImpressora: TComboBox;
    chSaltoNat: TCheckBox;
    TabSheet4: TTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    rdColEtiq: TRadioGroup;
    rdTextoEtiq: TRadioGroup;
    edtEspaco: TMaskEdit;
    pagina4: TTabSheet;
    rdF8Cli: TRadioGroup;
    pagina7: TTabSheet;
    Bevel12: TBevel;
    Label27: TLabel;
    edtEmailMatriz: TEdit;
    rdTipoLoja: TRadioGroup;
    rdTipoExp: TRadioGroup;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtHostFtp: TEdit;
    edtUserid: TEdit;
    edtSenha: TEdit;
    pagina8: TTabSheet;
    Bevel3: TBevel;
    Bevel11: TBevel;
    Label26: TLabel;
    btnProcurarWord: TSpeedButton;
    Label28: TLabel;
    Label25: TLabel;
    btnProcurar: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtWinWord: TEdit;
    edtPath: TEdit;
    edtArquivoProposta: TEdit;
    edtPathImagem: TEdit;
    pagina9: TTabSheet;
    rdVideoEntrada: TRadioGroup;
    rdCoresEntrada: TRadioGroup;
    rdVideoSaida: TRadioGroup;
    rdCoresSaida: TRadioGroup;
    chModificarVideo: TCheckBox;
    Panel1: TPanel;
    Image2: TImage;
    Label6: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    botao_sair: TPanel;
    btnAplicar: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_configVendas: Tfrm_configVendas;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2;

procedure Tfrm_configVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnAplicarClick(Sender);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_configVendas.btnAplicarClick(Sender: TObject);
begin
  showmessage('Aplicando alteracoes');
end;

procedure Tfrm_configVendas.botao_sairClick(Sender: TObject);
begin
  close;
end;

end.
