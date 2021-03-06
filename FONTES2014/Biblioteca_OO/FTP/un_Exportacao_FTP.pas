unit un_Exportacao_FTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Psock, NMFtp, ExtCtrls, Buttons, Gauges, StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdNNTP;

type
  Tfrm_ExportaFTP = class(TForm)
    Panel3: TPanel;
    timer: TTimer;
 //   NMFTP1: TNMFTP;
    Panel4: TPanel;
    pnStatus: TPanel;
    pnNomeArquivo: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    pnBEnviado: TPanel;
    Panel2: TPanel;
    pnServidorFtp: TPanel;
    pnUsuarioFtp: TPanel;
    pnDiretorioInicial: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure NMFTP1PacketSent(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flag: boolean;
    DEU_CERTO: boolean;
    nome_arquivo: string;
    nome_arquivo_host: string;
  end;

var
  frm_ExportaFTP: Tfrm_ExportaFTP;

implementation

uses principal;
//, un_ExportaRetaguarda;

{$R *.DFM}

procedure Tfrm_ExportaFTP.FormActivate(Sender: TObject);
var
  F: file of byte;
  Fsize: integer;
begin
{  if (not flag) then
  begin
    pnNomeArquivo.caption := nome_arquivo;
    {conexao local com a internet, usando Dial Up}
 {   DEU_CERTO := false;
    with (NMFTP1) do
    begin
      if (not NMFTP1.connected) then
      begin
        Vendor   := NMOS_AUTO;
        Host     := frm_principal.x_ftp_host;
        UserID   := frm_principal.x_ftp_userid;
        Password := frm_principal.x_ftp_password;
        TimeOut  := 0;
        try
          Connect;
          if (trim(frm_principal.x_ftp_diretorio_inicial)<>'') then
              ChangeDir(trim(frm_principal.x_ftp_diretorio_inicial));
          Mode(MODE_BYTE);
          gauge1.visible  := true;
          gauge1.progress := 0;
          try
            AssignFile (F,nome_arquivo);
            Reset      (F);
            FSize := FileSize(F);
            CloseFile  (F);
            Allocate   (FSize);
          except
          end;
          Upload (nome_arquivo,nome_arquivo_host);
          gauge1.progress := 0;
          gauge1.visible  := false;
          flag:=true;
          disconnect;
          DEU_CERTO := true;
        except
          showmessage('Erro! Ocorreu um erro na conex�o com o FTP! Verifique as configura��es de sua conta. ');
          showmessage('N�o foi poss�vel Transferir o arquivo...!');
          flag:=true;
        end;
        if (DEU_CERTO) then
          DeleteFile(nome_arquivo);
      end
      else
        Disconnect;
    end;
  end
  else
   close;
}
end;

procedure Tfrm_ExportaFTP.timerTimer(Sender: TObject);
begin
{     if (NMFTP1.connected) then pnStatus.caption := 'Ativado'
     else pnStatus.caption := 'Desativado';
     if (flag) then close;
}end;

procedure Tfrm_ExportaFTP.NMFTP1PacketSent(Sender: TObject);
begin
{     gauge1.progress    := Round((NMFTP1.BytesSent/NMFTP1.BytesTotal)*100);
     pnBEnviado.caption := inttostr(NMFTP1.BytesSent)+' bytes enviados de '+inttostr(NMFTP1.BytesTotal);
     pnBEnviado.refresh;
}end;

procedure Tfrm_ExportaFTP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     NMFTP1.disconnect;
end;

procedure Tfrm_ExportaFTP.FormCreate(Sender: TObject);
begin
     timer.enabled:=true;
     pnServidorFtp.caption      := ' Host: '+frm_principal.x_ftp_host;
     pnUsuarioFtp.caption       := ' Usu�rio: '+frm_principal.x_ftp_userid;
     pnDiretorioInicial.caption := ' Diret�rio inicial: '+frm_principal.x_ftp_diretorio_inicial;
end;

end.
