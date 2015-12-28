unit unSobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, LabelOO, jpeg, UrlMon;

type
  TfrmSobre = class(TForm)
    lbdata: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    lbllocal: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    btnEditar: TPanel;
    Bevel2: TBevel;
    Image1: TImage;
    procedure Panel1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarClick(Sender: TObject);
    procedure Label13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.DFM}

uses auxiliar, principal, funcoes1, funcoes2, procura, un_DadosAutenticacao;

procedure TfrmSobre.Panel1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSobre.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,15,15);
  SetWindowRgn(Handle,hR,true);
  lbdata.caption := 'Versão '+form_data(frm_principal.x_data_versao_sistema);
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
var
  clAux: TClassAuxiliar;
  caminho: String;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.AddParam ('SELECT * FROM CONF');
  clAux.Execute;
  clAux.first;
  if (Trim(clAux.Result('EMPRESA'))='EMPRESA MODELO') then
  begin
    memo1.lines.clear;
    memo1.lines.Add (' - Programa sem autenticação -');
  end
  else
  begin
    memo1.lines.clear;
    memo1.lines.Add ('Programa autenticado para:');
    memo1.lines.Add (form_tc2('-',30,'-'));
    memo1.lines.Add (clAux.Result('EMPRESA'));
    memo1.lines.Add (clAux.Result('ENDERECO')+', '+clAux.Result('BAIRRO'));
    memo1.lines.Add (clAux.Result('CEP')+' '+Trim(clAux.Result('CIDADE'))+'-'+clAux.Result('UF'));
    memo1.lines.Add (form_tc2('-',30,'-'));
    if (clAux.Result('BANCO_DE_DADOS')=0) then
      memo1.lines.Add ('Banco de dados....: INTERBASE 6.0')
    else
    if (clAux.Result('BANCO_DE_DADOS')=1) then
      memo1.lines.Add ('Banco de dados....: SQL SERVER');
    if (clAux.Result('FORMATO_DATA')=0) then
      memo1.lines.Add    ('Formato de data...: dd/mm/yyyy')
    else
    if (clAux.Result('FORMATO_DATA')=1) then
      memo1.lines.Add ('Formato de data...: mm/dd/yyyy');
    if (clAux.Result('NIVEL_PERMISSAO')=0) then
      memo1.lines.Add ('Nível de permissão: a nível de usuário')
    else
    if (clAux.Result('NIVEL_PERMISSAO')=1) then
      memo1.lines.Add ('Nível de permissão: a nível de grupos');
    memo1.lines.Add ('Usuário logado no banco: '+frm_principal.x_usuario_logado_no_banco);
  end;
  clAux.desconect;
  clAux.Free;
  try
    caminho := ExtractFilePath( Application.ExeName);
    memo1.lines.Add ('Caminho do aplicativo..: '+caminho);
    if (UpperCase(Copy(caminho,1,1))='C') then
      lblLocal.caption := 'Aplicativo Executado Localmente.'
    else
      lblLocal.caption := 'Aplicativo Executado da Rede.';
  except
    memo1.lines.Add ('Caminho do aplicativo..: <desconhecido>');
    lblLocal.caption := '';
  end;
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure TfrmSobre.btnEditarClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_DadosAutenticacao,frm_DadosAutenticacao);
  frm_DadosAutenticacao.showmodal;
  frm_DadosAutenticacao.Free;
end;

procedure TfrmSobre.Label13Click(Sender: TObject);
begin
  HlinkNavigateString(nil, 'http://www.mistralsistemas.com.br');
end;

end.
