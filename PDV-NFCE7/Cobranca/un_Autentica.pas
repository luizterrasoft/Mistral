unit un_Autentica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask;

type
  Tfrm_Autentica = class(TForm)
    Label1: TLabel;
    edtVezes: TMaskEdit;
    Label2: TLabel;
    Panel1: TPanel;
    botao_sair: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vezes: Integer;
    cliente,contrato: Real;
    prestacao: Integer;
    datapgto,vencimento: TDateTime;
    valor: Real;
    codloja,formapg: Real;
    horapgto: String;
  end;

var
  frm_Autentica: Tfrm_Autentica;

implementation

uses principal, funcoes1, funcoes2, procura, unDialogo, un_ListaMaisVend2,
  unLancReceb2,credito;

{$R *.DFM}

procedure Tfrm_Autentica.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Autentica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  F: textfile;
  empresa,valorS: String;
  result: Integer;
begin
  if (key=K_ENTER) then
  begin
    if (vezes=1) then
    begin
               {PROCESSAMENTO DE LIQUIDACAO DA PRESTACAO --->}
               {*************************************************************************************}
      QuitaPrestacao (cliente,contrato,prestacao,codloja,valor,datapgto,formapg);
      frm_LancReceb2.SalvarQuitacaoPrestacao(cliente,contrato,prestacao,valor,vencimento,datapgto,codloja,valor); {*}
               {*************************************************************************************}
      if (frm_principal.x_requisitar_forma_pgto) then
        if (trim(frm_LancReceb2.edtFormaPgto.text)='') then
          LancaFormaPgtoPrestacao(cliente,contrato,prestacao,0)
        else
          LancaFormaPgtoPrestacao(cliente,contrato,prestacao,formapg);
      frm_principal.BarraDicas.caption:='';
      frm_principal.ExibirDica ('Baixa do documento registrada...',5);
    end;
    if (vezes>frm_principal.x_qtde_autenticacao) then
      close
    else
      try
        empresa := form_tc2 (frm_principal.x_empresa,10,' ');
        while (Pos(' ',empresa)>0) do
          empresa[Pos(' ',empresa)]:='_';
        valorS  := form_nc  (valor,15);
        while (Pos(' ',valorS)>0) do
          valorS[Pos(' ',valorS)]:='*';
        result := WinExec (Pchar(
          frm_principal.x_pathsystem+'\IMPAUT.EXE '+
          empresa                +' '+
          form_nz   (cliente,6)  +' '+
          form_nz   (contrato,6) +' '+
          form_nz   (prestacao,2)+' '+
          FormatDateTime('ddmmyy',datapgto)   +' '+
          valorS),
          SW_SHOW);
        if (result=0) then
          frmDialogo.ExibirMensagem ('O sistema está sem memória! Tente fechar alguns aplicativos...',
            'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
            250,200);
        if (result=ERROR_BAD_FORMAT) then
          frmDialogo.ExibirMensagem ('O arquivo IMPAUT.EXE é inválido!',
            'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
            250,200);
        if (result=ERROR_FILE_NOT_FOUND) then
          frmDialogo.ExibirMensagem ('O programa IMPAUT.EXE não foi encontrado!',
            'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
            250,200);
        if (result=ERROR_PATH_NOT_FOUND) then
          frmDialogo.ExibirMensagem ('O caminho especificado é inválido!',
            'Gerador de relatórios',[mbOk],frm_principal.x_pathimg+'iconecancel.bmp',
            250,200);

                {****}
        vezes:=vezes+1;
        if (vezes>frm_principal.x_qtde_autenticacao) then
          close;
        edtVezes.text:=form_n(vezes,2);
        edtVezes.refresh;
      except
        showmessage('Erro! Tente novamente!');
      end;
  end;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_Autentica.FormCreate(Sender: TObject);
begin
  vezes:=1;
  edtVezes.text:=form_n(vezes,2);
end;

end.
