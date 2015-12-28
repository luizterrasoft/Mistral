unit un_Importacao_FTP_Crediario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, Psock, NMFtp;

type
  Tfrm_ImportaFTP_Crediario = class(TForm)
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
    flag_importa: Integer;
    arquivos_host: array[1..100]of Integer;
    flag: Boolean;
    totarq: Integer;
    indice: Integer;
  end;

var
  frm_ImportaFTP_Crediario: Tfrm_ImportaFTP_Crediario;

implementation

uses principal, funcoes1, funcoes2, procura;

{$R *.DFM}

procedure Tfrm_ImportaFTP_Crediario.timerTimer(Sender: TObject);
begin
  if (NMFTP1.connected) then
    pnStatus.caption := 'Ativado'
  else
    pnStatus.caption := 'Desativado';
  if (flag) then
    close;
end;

procedure Tfrm_ImportaFTP_Crediario.FormCreate(Sender: TObject);
begin
  timer.enabled:=true;
  pnServidorFtp.caption := ' Host: '+frm_principal.x_ftp_host;
  pnUsuarioFtp.caption  := ' Usuário: '+frm_principal.x_ftp_userid;
  pnDiretorioInicial.caption := ' Diretório inicial: '+frm_principal.x_ftp_diretorio_inicial;
end;

procedure Tfrm_ImportaFTP_Crediario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    NMFTP1.disconnect;
  except
  end;
end;

procedure Tfrm_ImportaFTP_Crediario.FormActivate(Sender: TObject);
var
  nome_arquivo: String;
begin
  if (not flag) then
  begin
         {conexao local com a internet, usando Dial Up}
    with (NMFTP1) do
      if (not NMFTP1.connected) then
      begin
        Vendor   := NMOS_AUTO;
        Host     := frm_principal.x_ftp_host;
        UserID   := frm_principal.x_ftp_userid;
        Password := frm_principal.x_ftp_password;
        try
          Connect;
          if (trim(frm_principal.x_ftp_diretorio_inicial)<>'') then
            ChangeDir('/'+trim(frm_principal.x_ftp_diretorio_inicial));
          Mode(MODE_BYTE);
        except
          try
            Disconnect;
          except
          end;
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
        if (flag_importa=0) then {IMPORTACAO DO ARQUIVO DA MATRIZ}
        begin
          DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP');
          try
            NMFTP1.Download ('MATRIZ.ZIP','C:\NATIVA\CREDITO\MOVIMENTO\MATRIZ.ZIP');
            memo1.lines.Add (' 01 MATRIZ.ZIP: Recebido');
          except
            memo1.lines.Add (' 01 MATRIZ.ZIP: Erro!! ou Não encontrado!!');
          end;
        end
        else  {IMPORTACAO DOS ARQUIVOS DAS FILIAIS}
        begin
          indice:=1;
          while (indice<=totarq) do
          begin
            DeleteFile ('C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+form_nz(arquivos_host[indice],2)+'.ZIP');
            try
              NMFTP1.Download ('LOJA'+form_nz(arquivos_host[indice],2)+'.ZIP',
                'C:\NATIVA\CREDITO\MOVIMENTO\LOJA'+form_nz(arquivos_host[indice],2)+'.ZIP');
              memo1.lines.Add (' '+form_nz(indice,2)+' LOJA'+form_nz(arquivos_host[indice],2)+'.ZIP: Recebido')
            except
              memo1.lines.Add (' '+form_nz(indice,2)+' LOJA'+form_nz(arquivos_host[indice],2)+'.ZIP: Erro!! ou Não encontrado!!');
            end;
            indice:=indice+1;
            gauge1.progress:=Round((indice/totarq)*100);
          end;
        end;
        flag:=true;
        gauge1.progress := 0;
        gauge1.visible  := false;
      end
      else
        disconnect;
  end
  else
    close;
end;

procedure Tfrm_ImportaFTP_Crediario.NMFTP1PacketRecvd(Sender: TObject);
begin
  gauge1.progress    := Round((NMFTP1.BytesRecvd/NMFTP1.BytesTotal)*100);
  pnBRecebido.caption := inttostr(NMFTP1.BytesRecvd)+' bytes recebidos de '+inttostr(NMFTP1.BytesTotal);
  pnBRecebido.refresh;
end;

end.
