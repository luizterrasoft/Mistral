unit un_MudarSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Menus;

type
  Tfrm_MudarSituacao = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    btnMudarSituacao: TButton;
    Label1: TLabel;
    edtSituacao: TMaskEdit;
    pnSituacao: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Panel1: TPanel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtSituacaoEnter(Sender: TObject);
    procedure edtSituacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMudarSituacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSituacaoExit(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure edtSituacaoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_situacao: String;
  end;

var
  frm_MudarSituacao: Tfrm_MudarSituacao;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura, unDialogo,auxiliar, f8Vend,
  un_F8Sit;

procedure Tfrm_MudarSituacao.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarSituacao.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarSituacao.Limparformulrio1Click(Sender: TObject);
begin
  edtSituacao.text   := '';
  pnSituacao.caption := '';
  edtSituacao.setfocus;
end;

procedure Tfrm_MudarSituacao.edtSituacaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cooperados cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_MudarSituacao.edtSituacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnMudarSituacao.click;
  if (key=K_ESC) then
    close;
  if (key=K_F8) then
    with (frm_f8Sit) do
    begin
      left:=287;
      top :=76;
      edit:=edtSituacao;
      showmodal;
    end;
end;

procedure Tfrm_MudarSituacao.btnMudarSituacaoClick(Sender: TObject);
begin
  Abrirsesso1.click;
end;

procedure Tfrm_MudarSituacao.FormActivate(Sender: TObject);
begin
  edtSituacao.setfocus;
end;

procedure Tfrm_MudarSituacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_MudarSituacao.edtSituacaoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo := Trim(edtSituacao.text);
  if (codigo<>'') then
    pnSituacao.caption:=ProcuraNomeSit(codigo,self);
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_MudarSituacao.Abrirsesso1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA}
  if (Trim(edtSituacao.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código da situação não pode ser nulo!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSituacao.setfocus;
  end
  else
  if (Trim(edtSituacao.text)='9') then
  begin
    frmDialogo.ExibirMensagem ('O fechamento de caixa não pode ser feito deste ponto do sistema!'
      ,'Salvar',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtSituacao.setfocus;
  end
  else
  begin
          {***}
    clAux := TClassAuxiliar.Create;
    clAux.conect  ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam('UPDATE SESSAO_CAIXA                                           ');
    clAux.AddParam('SET    SC_STAT=:status                                        ');
    clAux.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND      ');
    clAux.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND     ');
    clAux.AddParam('      (SC_DATA='+chr(39)+FormataData(date)+chr(39)+')         ');
    clAux.consulta.parambyname('status').AsString := Trim(edtSituacao.text);
    clAux.Execute;

          {*** Armazena no historico a situacao atual}
    clAux.ClearSql;
    clAux.AddParam('INSERT INTO HISTORICO_SITUACOES(HS_LOJA,HS_CAIX,HS_DATA,      ');
    clAux.AddParam('       HS_STAT,HS_HORA)                                       ');
    clAux.AddParam('VALUES (:HS_LOJA,:HS_CAIX,:HS_DATA,:HS_STAT,:HS_HORA)         ');
    clAux.consulta.parambyname('HS_LOJA').AsFloat    := frm_principal.x_loja;
    clAux.consulta.parambyname('HS_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux.consulta.parambyname('HS_DATA').AsDateTime := date;
    clAux.consulta.parambyname('HS_STAT').AsString   := Trim(edtSituacao.text);
    clAux.consulta.parambyname('HS_HORA').AsString   := FormatDateTime('hh:nn',time);
    clAux.Execute;
    clAux.desconect;
    clAux.Free;

    y_situacao := Trim(edtSituacao.text);
    close;
  end;
end;

procedure Tfrm_MudarSituacao.edtSituacaoDblClick(Sender: TObject);
begin
  with (frm_f8Sit) do
  begin
    left:=287;
    top :=76;
    edit:=edtSituacao;
    showmodal;
  end;
end;

end.
