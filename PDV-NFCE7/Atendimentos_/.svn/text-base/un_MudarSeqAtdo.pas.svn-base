unit un_MudarSeqAtdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Menus;

type
  Tfrm_MudarSeqAtdo = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Abrirsesso1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    Label3: TLabel;
    edtCodAtdo: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    botao1: TPanel;
    Label5: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Bevel4: TBevel;
    Label10: TLabel;
    Label1: TLabel;
    edtCodAtdoSusp: TMaskEdit;
    procedure botao_sairClick(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Abrirsesso1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAtdoEnter(Sender: TObject);
    procedure edtCodAtdoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure edtCodAtdoSuspKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    escolheuSequencialCorreto: Boolean;
    y_maximo_codigo_atdo_lancado: Real;
    function UltimoAtdoRegistradoNoEstoque:Real;
  end;

var
  frm_MudarSeqAtdo: Tfrm_MudarSeqAtdo;

implementation

uses unDialogo, principal, funcoes1, funcoes2, procura, F8Lojas, auxiliar,
  un_ALERTA;

{$R *.DFM}

procedure Tfrm_MudarSeqAtdo.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_MudarSeqAtdo.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MudarSeqAtdo.Limparformulrio1Click(Sender: TObject);
begin
  edtCodAtdo.text     :='';
  edtCodAtdoSusp.text :='';
  edtCodAtdo.setfocus;
end;

procedure Tfrm_MudarSeqAtdo.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  edtCodAtdo.text     := floattostr(frm_principal.x_codigo_atendimento);
  edtCodAtdoSusp.text := floattostr(frm_principal.x_codigo_atendimento_suspenso);
  edtCodAtdo.setfocus;
end;

procedure Tfrm_MudarSeqAtdo.Abrirsesso1Click(Sender: TObject);
var
  clConf: TClassAuxiliar;
begin
  if (Trim(edtCodAtdo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do atendimento não pode ficar vazio!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAtdo.setfocus;
  end
  else
  if (Trim(edtCodAtdoSusp.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código do atendimento SUSPENSO não pode ficar vazio!'
      ,'Configuração da loja',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAtdoSusp.setfocus;
  end
  else
  if (strtofloat(Trim(edtCodAtdo.text))<UltimoAtdoRegistradoNoEstoque) then
  begin
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('Erro: O código do atdo. não pode ser menor que ');
    frm_ALERTA.Memo1.lines.Add('      o código da último atdo. lançado: '+trim(form_n(y_maximo_codigo_atdo_lancado,15)));
    frm_ALERTA.showmodal;
    edtCodAtdo.setfocus;
  end
  else
  begin
          {*************************************************************}
    frm_principal.x_codigo_atendimento          := strtofloat(Trim(edtCodAtdo.text));
    frm_principal.x_codigo_atendimento_suspenso := strtofloat(Trim(edtCodAtdoSusp.text));

          {*************************************************************}
    clConf := TClassAuxiliar.Create;
    clConf.conect   ('C:\NATIVA',self);
    clConf.ClearSql;
    clConf.AddParam ('UPDATE SEQATDO.DBF SET ULTIMO_ATDO=:ultimo_atdo ');
    clConf.consulta.parambyname('ultimo_atdo').AsFloat := frm_principal.x_codigo_atendimento;
    clConf.Execute;
    clConf.desconect;
    clConf.Free;

          {*************************************************************}
    clConf := TClassAuxiliar.Create;
    clConf.conect   ('C:\NATIVA',self);
    clConf.ClearSql;
    clConf.AddParam ('UPDATE SEQATDO.DBF SET ULTIMO_ATDO_SUSP=:ultimo_atdo_susp ');
    clConf.consulta.parambyname('ultimo_atdo_susp').AsFloat := frm_principal.x_codigo_atendimento_suspenso;
    clConf.Execute;
    clConf.desconect;
    clConf.Free;

          {*************************************************************}
    escolheuSequencialCorreto:=true;
    close;
  end;
end;

procedure Tfrm_MudarSeqAtdo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    botao_sairClick(sender);
end;

procedure Tfrm_MudarSeqAtdo.edtCodAtdoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_MudarSeqAtdo.edtCodAtdoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodAtdoSusp.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_MudarSeqAtdo.FormCreate(Sender: TObject);
begin
  escolheuSequencialCorreto := false;   
  edtCodAtdo.text    := floattostr(frm_principal.x_codigo_atendimento);
end;

procedure Tfrm_MudarSeqAtdo.botao1Click(Sender: TObject);
begin
  Abrirsesso1.click;
end;

//So pode ser usada se o sistema estiver ON-LINE, acessando o alias 'ESTOQUE'
function Tfrm_MudarSeqAtdo.UltimoAtdoRegistradoNoEstoque:Real;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(AT_CODI) as MAXIMO_SEQUENCIAL ');
  clAux.AddParam ('FROM ATENDIMENTOS                        ');
  clAux.AddParam ('WHERE (AT_LOJA=:loja) AND                ');
  clAux.AddParam ('      (AT_CAIX=:caixa)                   ');
  clAux.consulta.parambyname('loja').AsFloat  := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  y_maximo_codigo_atdo_lancado := clAux.Result('MAXIMO_SEQUENCIAL');
  result := y_maximo_codigo_atdo_lancado;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_MudarSeqAtdo.edtCodAtdoSuspKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Abrirsesso1.click;
  if (key=K_CIMA) then
    edtCodAtdo.setfocus;
end;

end.
