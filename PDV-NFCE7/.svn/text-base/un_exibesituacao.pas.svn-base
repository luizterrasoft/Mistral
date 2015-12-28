unit un_exibesituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  Tfrm_ExibeSituacao = class(TForm)
    Panel1: TPanel;
    btnAbresessao: TButton;
    Bevel1: TBevel;
    btnSair: TButton;
    btnRetornar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAbresessaoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    achou,flagFecha: Boolean;
    y_situacao_mensagem: String;
  end;

var
  frm_ExibeSituacao: Tfrm_ExibeSituacao;

implementation

uses un_abresessao,procura,funcoes1,funcoes2, principal, auxiliar,
  un_senhaSupervisor, un_senhaCaixa;

{$R *.DFM}

procedure Tfrm_ExibeSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (flagFecha) then
    Application.Terminate;
end;

procedure Tfrm_ExibeSituacao.btnAbresessaoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_senhaSupervisor, frm_senhaSupervisor);
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_AbreSessao,frm_AbreSessao);
    frm_AbreSessao.showmodal;
    frm_AbreSessao.Free;
  end;
  frm_senhaSupervisor.Free;
end;

procedure Tfrm_ExibeSituacao.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExibeSituacao.FormActivate(Sender: TObject);
begin
  if (not achou) then
  begin
    panel1.caption := 'CAIXA '+ProcuraNomeSit(y_situacao_mensagem,self);
    achou:=true;
  end;
  if (y_situacao_mensagem='9') then
  begin
    btnAbreSessao.visible:=true;
    btnAbreSessao.top:=224;
    btnRetornar.visible:=false;
  end
  else
  begin
    btnAbreSessao.visible:=false;
    btnRetornar.visible:=true;
    btnRetornar.top:=224;
  end;
end;

procedure Tfrm_ExibeSituacao.btnRetornarClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {***}
  clAux := TClassAuxiliar.Create;
  clAux.conect  ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam('UPDATE SESSAO_CAIXA                                                              ');
  clAux.AddParam('SET    SC_STAT=:status                                                           ');
  clAux.AddParam('WHERE (SC_LOJA='+floattostr(frm_principal.x_loja)+') AND                         ');
  clAux.AddParam('      (SC_CAIX='+floattostr(frm_principal.x_terminal)+') AND                        ');
  clAux.AddParam('      (SC_DATA='+chr(39)+FormataData(date)+chr(39)+')                            ');
  clAux.consulta.parambyname('status').AsString := '1';
  clAux.Execute;
     {frm_principal.botaoCaixa.caption := ' CAIXA '+form_nz(frm_principal.x_terminal,2)+' '+
             ProcuraNomeSit('1',self);}

     {*** Armazena no historico a situacao atual}
  clAux.ClearSql;
  clAux.AddParam('INSERT INTO HISTORICO_SITUACOES(HS_LOJA,HS_CAIX,HS_DATA,      ');
  clAux.AddParam('       HS_STAT,HS_HORA)                                       ');
  clAux.AddParam('VALUES (:HS_LOJA,:HS_CAIX,:HS_DATA,:HS_STAT,:HS_HORA)         ');
  clAux.consulta.parambyname('HS_LOJA').AsFloat    := frm_principal.x_loja;
  clAux.consulta.parambyname('HS_CAIX').AsFloat    := frm_principal.x_terminal;
  clAux.consulta.parambyname('HS_DATA').AsDateTime := date;
  clAux.consulta.parambyname('HS_STAT').AsString   := '1';
  clAux.consulta.parambyname('HS_HORA').AsString   := FormatDateTime('hh:nn',time);
  clAux.Execute;
  clAux.desconect;
  clAux.Free;

     {***}
  flagFecha:=false;
  close;
end;

procedure Tfrm_ExibeSituacao.FormCreate(Sender: TObject);
begin
  achou:=false;
end;

end.
