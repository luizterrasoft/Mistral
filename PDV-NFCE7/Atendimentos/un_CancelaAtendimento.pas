unit un_CancelaAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario2, Menus, BotaoSair, StdCtrls, Mask, ExtCtrls, PanelOO,
  MaskEditOO, LabelOO;

type
  Tfrm_CancelaAtendimento = class(Tfrm_Auxformulario2)
    LabelOO1: TLabelOO;
    edtMotivo: TMaskEditOO;
    pnMotivo: TPanelOO;
    btnSuspender: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    procedure btnSuspenderClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure edtMotivoDblClick(Sender: TObject);
    procedure edtMotivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_terminal,y_numero: Real;
    tecla: Integer;
    tipocancelamento: Integer;
  end;

var
  frm_CancelaAtendimento: Tfrm_CancelaAtendimento;

implementation

{$R *.DFM}

uses auxiliar, principal, funcoes1, funcoes2, procura, un_BuscaAtendimento;

procedure Tfrm_CancelaAtendimento.btnSuspenderClick(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_CancelaAtendimento.FormActivate(Sender: TObject);
begin
  inherited;
  edtMotivo.setfocus;
end;

procedure Tfrm_CancelaAtendimento.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  numero: Real;
begin
  if (edtMotivo.GetValor=0) then
    ExibeCritica ('O código do motivo não pode ficar vazio!','Atendimentos',edtMotivo)
  else
  if (tipocancelamento=0) then //SOMENTE O SELECIONADO
  begin
               //--- Executando a suspensão ----------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('UPDATE ATENDIMENTOS              ');
    clAux.AddParam ('SET    AT_MOTI=:motivo,          ');
    clAux.AddParam ('       AT_STAT=:status           ');
    clAux.AddParam ('WHERE (AT_LOJA=:loja) AND        ');
    clAux.AddParam ('      (AT_CAIX=:terminal) AND    ');
    clAux.AddParam ('      (AT_CODI=:numero)          ');
    clAux.consulta.parambyname('terminal').AsFloat := y_terminal;
    clAux.consulta.parambyname('numero').AsFloat   := y_numero;
    clAux.consulta.parambyname('motivo').AsFloat   := edtMotivo.GetValor;
    clAux.consulta.parambyname('status').AsString  := '2';
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.Execute; {*}
    clAux.desconect;
    clAux.Free;

    tecla := 13;
    close;
  end
  else
  if (tipocancelamento=1) then //TODOS OS FILTRADOS
  begin
    frm_BuscaAtendimento.qAtendimentos.disablecontrols;
    frm_BuscaAtendimento.qAtendimentos.first;
    while (not frm_BuscaAtendimento.qAtendimentos.eof) do
    begin
                   //--- Executando a suspensão ----------------------------------------
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('UPDATE ATENDIMENTOS              ');
      clAux.AddParam ('SET    AT_MOTI=:motivo,          ');
      clAux.AddParam ('       AT_STAT=:status           ');
      clAux.AddParam ('WHERE (AT_LOJA=:loja) AND        ');
      clAux.AddParam ('      (AT_CAIX=:terminal) AND    ');
      clAux.AddParam ('      (AT_CODI=:numero)          ');
      clAux.consulta.parambyname('terminal').AsFloat := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_CAIX').AsFloat;
      clAux.consulta.parambyname('numero').AsFloat   := frm_BuscaAtendimento.qAtendimentos.fieldbyname('AT_CODI').AsFloat;
      clAux.consulta.parambyname('motivo').AsFloat   := edtMotivo.GetValor;
      clAux.consulta.parambyname('status').AsString  := '2';
      clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
      clAux.Execute; {*}
      clAux.desconect;
      clAux.Free;

                   {---->}
      frm_BuscaAtendimento.qAtendimentos.next;
    end;
    frm_BuscaAtendimento.qAtendimentos.first;
    frm_BuscaAtendimento.qAtendimentos.enablecontrols;

    tecla := 13;
    close;
  end;
end;

procedure Tfrm_CancelaAtendimento.edtMotivoDblClick(Sender: TObject);
begin
  ChamandoF8MotivosSuspensAtdo(edtMotivo,false);
end;

procedure Tfrm_CancelaAtendimento.edtMotivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnSuspenderClick(Sender);
  if (key=K_F8) then
    ChamandoF8MotivosSuspensAtdo(edtMotivo,false);
end;

procedure Tfrm_CancelaAtendimento.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  edtMotivo.setfocus;
end;

procedure Tfrm_CancelaAtendimento.FormCreate(Sender: TObject);
begin
  tecla:=27;
end;

end.
