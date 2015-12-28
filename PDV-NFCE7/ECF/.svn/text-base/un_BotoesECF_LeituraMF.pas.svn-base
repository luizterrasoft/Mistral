unit un_BotoesECF_LeituraMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, MaskEditOO, ComCtrls, Menus;

type
  Tfrm_BotoesECF_LeituraMF = class(TForm)
    btnOk: TPanel;
    Bevel1: TBevel;
    Image2: TImage;
    Label3: TLabel;
    Label10: TLabel;
    PageControl1: TPageControl;
    pagina: TTabSheet;
    pagina2: TTabSheet;
    pagina3: TTabSheet;
    pagina4: TTabSheet;
    Label1: TLabel;
    edtData1: TMaskEditOO;
    edtData2: TMaskEditOO;
    Label2: TLabel;
    Label4: TLabel;
    edtArquivo1: TMaskEditOO;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label5: TLabel;
    edtData3: TMaskEditOO;
    edtData4: TMaskEditOO;
    Label6: TLabel;
    Label7: TLabel;
    edtArquivo3: TMaskEditOO;
    Label8: TLabel;
    edtReducao1: TMaskEditOO;
    edtReducao2: TMaskEditOO;
    Label9: TLabel;
    Label11: TLabel;
    edtArquivo2: TMaskEditOO;
    Label12: TLabel;
    edtReducao3: TMaskEditOO;
    edtReducao4: TMaskEditOO;
    Label13: TLabel;
    Label14: TLabel;
    edtArquivo4: TMaskEditOO;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Bevel6: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    botao_sair: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure edtData1Enter(Sender: TObject);
    procedure edtData1Exit(Sender: TObject);
    procedure edtData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData2Enter(Sender: TObject);
    procedure edtData2Exit(Sender: TObject);
    procedure edtData2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtArquivo1Enter(Sender: TObject);
    procedure edtArquivo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducao1Enter(Sender: TObject);
    procedure edtReducao2Enter(Sender: TObject);
    procedure edtArquivo2Enter(Sender: TObject);
    procedure edtData3Exit(Sender: TObject);
    procedure edtData3Enter(Sender: TObject);
    procedure edtData4Enter(Sender: TObject);
    procedure edtArquivo3Enter(Sender: TObject);
    procedure edtReducao1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducao2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtArquivo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtData4Exit(Sender: TObject);
    procedure edtArquivo3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducao3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducao4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducao3Enter(Sender: TObject);
    procedure edtReducao4Enter(Sender: TObject);
    procedure edtArquivo4Enter(Sender: TObject);
    procedure edtArquivo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl1Change(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_BotoesECF_LeituraMF: Tfrm_BotoesECF_LeituraMF;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,urano,bematech,unDialogo,darumaFS345,urano1efc;

procedure Tfrm_BotoesECF_LeituraMF.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  PageControl1.ActivePage:=pagina;
  edtData1.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData1Exit(Sender: TObject);
begin
  if (not IsDate (edtData1.text) and (edtData1.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data inicial de leitura',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData1.setfocus;
  end;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtData2.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData2Exit(Sender: TObject);
begin
  if (not IsDate (edtData2.text) and (edtData2.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data final de leitura',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData2.setfocus;
  end;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtArquivo1.enabled) then
      edtArquivo1.setfocus
    else
    if (key=K_ENTER) then
      btnOkClick(Sender);
  if (key=K_CIMA) then
    edtData1.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.btnOkClick(Sender: TObject);
var
  Arquivo,Inicio,Fim: String;
begin
  if (PageControl1.activepageindex=0) then
  begin
    if (edtData1.GetValor=strtodate('01/01/1900')) then
    begin
      frmDialogo.ExibirMensagem (' A data inicial não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData1.setfocus;
    end
    else
    if (edtData2.GetValor=strtodate('01/01/1900')) then
    begin
      frmDialogo.ExibirMensagem (' A data final não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData2.setfocus;
    end
    else
    if (edtData1.GetValor>edtData2.GetValor) then
    begin
      frmDialogo.ExibirMensagem (' A data inicial não pode ser maior que a final! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData2.setfocus;
    end
    else
    if (frmDialogo.ExibirMensagem ('Confirma leitura da memória fiscal?'
      ,'Leitura da Memória Fiscal',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := FormatDateTime('ddmmyy',edtData1.GetValor);
          Fim     := FormatDateTime('ddmmyy',edtData2.GetValor);
          Arquivo := '';
          URANOEFC_LeituraMF (Pchar(trim('0')), //por data
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := FormatDateTime('ddmmyy',edtData1.GetValor);
          Fim     := FormatDateTime('ddmmyy',edtData2.GetValor);
          Arquivo := '';
          URANOEFC_1EFC_LeituraMF (Pchar(trim('0')), //por data
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
      begin
        if (BEMATECH_Inicializa=1) then
        begin
          BEMATECH_LeituraMemoriaFiscalData (form_data(edtData1.GetValor),
            form_data(edtData2.GetValor));
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        showmessage('Rotina ainda não disponível para a impressora DATAREGIS')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          DARUMAFS345_LeituraMemoriaFiscalData (form_data(edtData1.GetValor),
            form_data(edtData2.GetValor));
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
  end
  else
  if (PageControl1.activepageindex=1) then
  begin
    if (edtReducao1.GetValor=0) then
    begin
      frmDialogo.ExibirMensagem (' A redução inicial não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao1.setfocus;
    end
    else
    if (edtReducao2.GetValor=0) then
    begin
      frmDialogo.ExibirMensagem (' A redução final não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao2.setfocus;
    end
    else
    if (edtReducao1.GetValor>edtReducao2.GetValor) then
    begin
      frmDialogo.ExibirMensagem (' A redução inicial não pode ser maior que a final! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao2.setfocus;
    end
    else
    if (frmDialogo.ExibirMensagem ('Confirma leitura da memória fiscal?'
      ,'Leitura da Memória Fiscal',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := inttostr(edtReducao1.GetValor);
          Fim     := inttostr(edtReducao2.GetValor);
          Arquivo := '';
          URANOEFC_LeituraMF (Pchar(trim('1')), //por reducao
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := inttostr(edtReducao1.GetValor);
          Fim     := inttostr(edtReducao2.GetValor);
          Arquivo := '';
          URANOEFC_1EFC_LeituraMF (Pchar(trim('1')), //por reducao
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
      begin
        if (BEMATECH_Inicializa=1) then
        begin
          Inicio  := inttostr(edtReducao1.GetValor);
          Fim     := inttostr(edtReducao2.GetValor);
          BEMATECH_LeituraMemoriaFiscalReducao (Inicio, Fim);
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        showmessage('Rotina não disponível para a impressora DATAREGIS')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          Inicio  := inttostr(edtReducao1.GetValor);
          Fim     := inttostr(edtReducao2.GetValor);
          DARUMAFS345_LeituraMemoriaFiscalReducao (Inicio, Fim);
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
  end
  else
  if (PageControl1.activepageindex=2) then
  begin
    if (edtData3.GetValor=strtodate('01/01/1900')) then
    begin
      frmDialogo.ExibirMensagem (' A data inicial não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData3.setfocus;
    end
    else
    if (edtData4.GetValor=strtodate('01/01/1900')) then
    begin
      frmDialogo.ExibirMensagem (' A data final não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData4.setfocus;
    end
    else
    if (edtData3.GetValor>edtData4.GetValor) then
    begin
      frmDialogo.ExibirMensagem (' A data inicial não pode ser maior que a final! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtData4.setfocus;
    end
    else
    if (edtArquivo3.GetValor='') and //somente para a URANO
      (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      frmDialogo.ExibirMensagem (' O nome do arquivo a ser gerado não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtArquivo3.setfocus;
    end
    else
    if (frmDialogo.ExibirMensagem ('Confirma leitura da memória fiscal?'
      ,'Leitura da Memória Fiscal',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := FormatDateTime('ddmmyy',edtData3.GetValor);
          Fim     := FormatDateTime('ddmmyy',edtData4.GetValor);
          Arquivo := edtArquivo3.GetValor;
          URANOEFC_LeituraMF (Pchar(trim('2')), //por data, serial
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := FormatDateTime('ddmmyy',edtData3.GetValor);
          Fim     := FormatDateTime('ddmmyy',edtData4.GetValor);
          Arquivo := edtArquivo3.GetValor;
          URANOEFC_1EFC_LeituraMF (Pchar(trim('2')), //por data, serial
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
      begin
        if (BEMATECH_Inicializa=1) then
        begin
          BEMATECH_LeituraMemoriaFiscalSerialData (form_data(edtData3.GetValor),
            form_data(edtData4.GetValor));
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        showmessage('Rotina não disponível para a impressora DATAREGIS')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          DARUMAFS345_LeituraMemoriaFiscalSerialData (form_data(edtData3.GetValor),
            form_data(edtData4.GetValor));
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
  end
  else
  if (PageControl1.activepageindex=3) then
    if (edtReducao3.GetValor=0) then
    begin
      frmDialogo.ExibirMensagem (' A redução inicial não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao3.setfocus;
    end
    else
    if (edtReducao4.GetValor=0) then
    begin
      frmDialogo.ExibirMensagem (' A redução final não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao4.setfocus;
    end
    else
    if (edtReducao3.GetValor>edtReducao4.GetValor) then
    begin
      frmDialogo.ExibirMensagem (' A redução inicial não pode ser maior que a final! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtReducao4.setfocus;
    end
    else
    if (edtArquivo4.GetValor='') and //somente para a URANO
      (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      frmDialogo.ExibirMensagem (' O nome do arquivo a ser gerado não pode ficar em branco! '
        ,'Leitura da Memória Fiscal',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtArquivo4.setfocus;
    end
    else
    if (frmDialogo.ExibirMensagem ('Confirma leitura da memória fiscal?'
      ,'Leitura da Memória Fiscal',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
      begin
        if (URANOEFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := inttostr(edtReducao3.GetValor);
          Fim     := inttostr(edtReducao4.GetValor);
          Arquivo := trim(edtArquivo4.text);
          URANOEFC_LeituraMF (Pchar(trim('3')), //por reducao, serial
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO_1EFC) then
      begin
        if (URANOEFC_1EFC_Inicializa(Pchar(frm_principal.x_ecf_porta_comunicacao))=0) then
        begin
          Inicio  := inttostr(edtReducao3.GetValor);
          Fim     := inttostr(edtReducao4.GetValor);
          Arquivo := trim(edtArquivo4.text);
          URANOEFC_1EFC_LeituraMF (Pchar(trim('3')), //por reducao, serial
            Pchar(trim(Inicio)),
            Pchar(trim(Fim)),
            Pchar(trim(Arquivo)));
          URANOEFC_1EFC_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
      begin
        if (BEMATECH_Inicializa=1) then
        begin
          Inicio  := inttostr(edtReducao3.GetValor);
          Fim     := inttostr(edtReducao4.GetValor);
          BEMATECH_LeituraMemoriaFiscalSerialReducao (Inicio, Fim);
          BEMATECH_Finaliza; //finaliza DLL usada
        end;
      end
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DATAREGIS) then
        showmessage('Rotina não disponível para a impressora DATAREGIS')
      else
      if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_DARUMAFS345) then
        if (DARUMAFS345_Inicializa=1) then
        begin
          Inicio  := inttostr(edtReducao3.GetValor);
          Fim     := inttostr(edtReducao4.GetValor);
          DARUMAFS345_LeituraMemoriaFiscalSerialReducao (Inicio, Fim);
          DARUMAFS345_Finaliza; //finaliza DLL usada
        end;
end;

procedure Tfrm_BotoesECF_LeituraMF.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkClick(Sender);
  if (key=K_CIMA) then
    edtData2.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo2Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData3Exit(Sender: TObject);
begin
  if (not IsDate (edtData3.text) and (edtData3.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data inicial fornecida não é válida! '
      ,'Data inicial de leitura',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData3.setfocus;
  end;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData4Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtReducao2.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtArquivo2.enabled) then
      edtArquivo2.setfocus
    else
    if (key=K_ENTER) then
      btnOkClick(Sender);
  if (key=K_CIMA) then
    edtReducao1.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkClick(Sender);
  if (key=K_CIMA) then
    edtReducao2.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtData4.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtArquivo3.enabled) then
      edtArquivo3.setfocus
    else
    if (key=K_ENTER) then
      btnOkClick(Sender);
  if (key=K_CIMA) then
    edtData3.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtData4Exit(Sender: TObject);
begin
  if (not IsDate (edtData4.text) and (edtData4.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data final fornecida não é válida! '
      ,'Data final de leitura',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtData4.setfocus;
  end;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkClick(Sender);
  if (key=K_CIMA) then
    edtData4.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_ENTER) then
    edtReducao4.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    if (edtArquivo4.enabled) then
      edtArquivo4.setfocus
    else
    if (key=K_ENTER) then
      btnOkClick(Sender);
  if (key=K_CIMA) then
    edtReducao3.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao3Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtReducao4Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo4Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_BotoesECF_LeituraMF.edtArquivo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkClick(Sender);
  if (key=K_CIMA) then
    edtReducao4.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.PageControl1Change(Sender: TObject);
begin
  if (PageControl1.activepageindex=0) then
  begin
    edtArquivo1.enabled:=false;
    edtArquivo1.color:=clTeal;
    edtArquivo1.font.color:=clWhite;
  end
  else
  if (PageControl1.activepageindex=1) then
  begin
    edtArquivo2.enabled:=false;
    edtArquivo2.color:=clTeal;
    edtArquivo2.font.color:=clWhite;
  end
  else
  if (PageControl1.activepageindex=2) then
  begin
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      edtArquivo3.enabled:=true;
      edtArquivo3.color:=clWhite;
      edtArquivo3.font.color:=clBlack;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      edtArquivo3.enabled:=false;
      edtArquivo3.color:=clTeal;
      edtArquivo3.font.color:=clWhite;
    end;
  end
  else
  if (PageControl1.activepageindex=3) then
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_URANO) then
    begin
      edtArquivo4.enabled:=true;
      edtArquivo4.color:=clWhite;
      edtArquivo4.font.color:=clBlack;
    end
    else
    if (frm_principal.x_ecf_modelo_impressora=KMODELO_ECF_BEMATECH) then
    begin
      edtArquivo4.enabled:=false;
      edtArquivo4.color:=clTeal;
      edtArquivo4.font.color:=clWhite;
    end;
end;

procedure Tfrm_BotoesECF_LeituraMF.Limparformulrio1Click(Sender: TObject);
begin
  edtData1.text    := '';
  edtData2.text    := '';
  edtArquivo1.text := '';
  edtReducao1.text := '';
  edtReducao2.text := '';
  edtArquivo2.text := '';
  edtData3.text    := '';
  edtData4.text    := '';
  edtArquivo3.text := '';
  edtReducao3.text := '';
  edtReducao4.text := '';
  edtArquivo4.text := '';
  if (PageControl1.activepageindex=0) then
    edtData1.setfocus
  else
  if (PageControl1.activepageindex=1) then
    edtReducao1.setfocus
  else
  if (PageControl1.activepageindex=2) then
    edtData3.setfocus
  else
  if (PageControl1.activepageindex=3) then
    edtReducao3.setfocus;
end;

procedure Tfrm_BotoesECF_LeituraMF.botao_sairClick(Sender: TObject);
begin
  close;
end;

end.
