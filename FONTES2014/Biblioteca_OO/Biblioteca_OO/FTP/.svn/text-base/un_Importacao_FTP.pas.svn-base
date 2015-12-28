unit un_Importacao_FTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, Psock, NMFtp;

type
  Tfrm_ImportaFTP = class(TForm)
    NMFTP1: TNMFTP;
    timer: TTimer;
    Gauge1: TGauge;
    pnBRecebido: TPanel;
    Panel4: TPanel;
    pnStatus: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    pnDiretorioInicial: TPanel;
    pnUsuarioFtp: TPanel;
    pnServidorFtp: TPanel;
    procedure timerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure NMFTP1PacketRecvd(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    arquivoLocal,arquivoRemoto: string;
    flag: boolean;
  end;

var
  frm_ImportaFTP: Tfrm_ImportaFTP;

implementation

uses principal, funcoes1, funcoes2, procura;

{$R *.DFM}

procedure Tfrm_ImportaFTP.timerTimer(Sender: TObject);
begin
     if (NMFTP1.connected) then
          pnStatus.caption := 'Ativado'
     else pnStatus.caption := 'Desativado';
     if (flag) then close;
end;

procedure Tfrm_ImportaFTP.FormCreate(Sender: TObject);
begin
     timer.enabled:=true;
     pnServidorFtp.caption := ' Host: '+frm_principal.x_ftp_host;
     pnUsuarioFtp.caption  := ' Usuário: '+frm_principal.x_ftp_userid;
     pnDiretorioInicial.caption := ' Diretório inicial: '+frm_principal.x_ftp_diretorio_inicial;
end;

procedure Tfrm_ImportaFTP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     try NMFTP1.disconnect; except end;
end;

procedure Tfrm_ImportaFTP.FormActivate(Sender: TObject);
var
nome_arquivo: string;
begin
     if (not flag) then
     begin
         {conexao local com a internet, usando Dial Up}
         with (NMFTP1) do
         begin
              if (not NMFTP1.connected) then
              begin
                  Vendor   := NMOS_AUTO;
                  Host     := frm_principal.x_ftp_host;
                  UserID   := frm_principal.x_ftp_userid;
                  Password := frm_principal.x_ftp_password;
                  try
                     Connect;
                     if (trim(frm_principal.x_ftp_diretorio_inicial)<>'') then
                         ChangeDir(trim(frm_principal.x_ftp_diretorio_inicial));
                     Mode(MODE_BYTE);
                  except
                     showmessage('Erro! Não foi possível receber os arquivos...Tente novamente mais tarde!');
                     flag:=true;
                  end;

                  {Recebendo os arquivos}
                  gauge1.visible  := true;
                  gauge1.progress := 0;
                  memo1.lines.clear;
                  memo1.lines.Add ('');
                  memo1.lines.Add ('  - Recebendo Arquivos: -');
                  memo1.lines.Add ('');
                  DeleteFile (Pchar(arquivoLocal));
                  try
                     NMFTP1.Download (Pchar(arquivoRemoto),Pchar(arquivoLocal));
                     memo1.lines.Add (' '+Pchar(arquivoRemoto)+': Recebido');
                  except
                     memo1.lines.Add (' '+Pchar(arquivoRemoto)+': Erro!! ou Não encontrado!!');
                  end;
                  flag:=true;
                  gauge1.progress := 0;
                  gauge1.visible  := false;
              end
              else disconnect;
         end;
     end
     else close;
end;

procedure Tfrm_ImportaFTP.NMFTP1PacketRecvd(Sender: TObject);
begin
     gauge1.progress     := Round((NMFTP1.BytesRecvd/NMFTP1.BytesTotal)*100);
     pnBRecebido.caption := inttostr(NMFTP1.BytesRecvd)+' bytes recebidos de '+inttostr(NMFTP1.BytesTotal);
     pnBRecebido.refresh;
end;

end.
