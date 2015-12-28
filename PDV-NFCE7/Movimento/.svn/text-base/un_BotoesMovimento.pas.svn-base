unit un_BotoesMovimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_BotoesMovimento = class(TForm)
    Bevel1: TBevel;
    btnFechar: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3Click(Sender: TObject);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
    procedure ExcluirRegistrosOffLineEnviados;
  end;

var
  frm_BotoesMovimento: Tfrm_BotoesMovimento;

implementation

uses principal, un_senhaSupervisor, unMensagem, auxiliar, funcoes1, funcoes2, procura,
  unDialogo, un_senhaCaixa;

{$R *.DFM}

procedure Tfrm_BotoesMovimento.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_BotoesMovimento.FormActivate(Sender: TObject);
var
  hR: THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

procedure Tfrm_BotoesMovimento.botao1Click(Sender: TObject);
begin
  frm_principal.ChamandoExportaRetaguarda;
end;

procedure Tfrm_BotoesMovimento.botao2Click(Sender: TObject);
begin
  frm_principal.ChamandoImportaRetaguarda;
end;

procedure Tfrm_BotoesMovimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (key=13) then
    if (botao1.color=clWhite) then
      botao1Click(Sender)
    else
    if (botao2.color=clWhite) then
      botao2Click(Sender)
    else
    if (botao3.color=clWhite) then
      botao3Click(Sender)
    else
    if (botao4.color=clWhite) then
      botao4Click(Sender)
    else
    if (botao5.color=clWhite) then
      botao5Click(Sender);
  if (key=97) or (key=Ord('1')) then
    botao1Click(Sender)
  else
  if (key=98) or (key=Ord('2')) then
    botao2Click(Sender)
  else
  if (key=99) or (key=Ord('3')) then
    botao3Click(Sender)
  else
  if (key=100) or (key=Ord('4')) then
    botao4Click(Sender)
  else
  if (key=101) or (key=Ord('5')) then
    botao5Click(Sender);
end;

procedure Tfrm_BotoesMovimento.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
end;

procedure Tfrm_BotoesMovimento.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
end;

procedure Tfrm_BotoesMovimento.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_BotoesMovimento.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_BotoesMovimento.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_BotoesMovimento.ExcluirRegistrosOffLineEnviados;
var
  clAux,clAux2: TClassAuxiliar;
  indGauge,totGauge: Integer;
begin
  if (not frm_senhaSupervisor.y_flag) then
    frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
         //1. Buscando VENDAS ------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VE_LOJA,VE_CAIX,VE_CODI               ');
    clAux.AddParam ('FROM   VENDAS                                ');
    clAux.AddParam ('WHERE (VE_ONLI='+chr(39)+'0'+chr(39)+') AND  '); //vendas realizadas OFF-LINE
    clAux.AddParam ('      (VE_ENVI='+chr(39)+'1'+chr(39)+')      '); //vendas 'ENVIADAS' pela exportacao
    clAux.Execute;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.reccount;
    mostra_mensagem('Excluindo vendas OFF-LINE enviadas...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    while (not clAux.eof) do
    begin
              {***************************************************}
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   ('VENDAS',self);
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM VENDAS                                  ');
      clAux2.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND                        ');
      clAux2.AddParam ('      (VE_CAIX=:VE_CAIX) AND                        ');
      clAux2.AddParam ('      (VE_CODI=:VE_CODI)                            ');
      clAux2.consulta.parambyname('VE_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('VE_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('VE_CODI').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM ITENS_VENDAS                            ');
      clAux2.AddParam ('WHERE (IV_LOJA=:IV_LOJA) AND                        ');
      clAux2.AddParam ('      (IV_CAIX=:IV_CAIX) AND                        ');
      clAux2.AddParam ('      (IV_VEND=:IV_VEND)                            ');
      clAux2.consulta.parambyname('IV_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('IV_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('IV_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO                  ');
      clAux2.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND                        ');
      clAux2.AddParam ('      (VF_CAIX=:VF_CAIX) AND                        ');
      clAux2.AddParam ('      (VF_VEND=:VF_VEND)                            ');
      clAux2.consulta.parambyname('VF_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('VF_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('VF_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM CARTOES                                 ');
      clAux2.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND                        ');
      clAux2.AddParam ('      (CR_CAIX=:CR_CAIX) AND                        ');
      clAux2.AddParam ('      (CR_VEND=:CR_VEND)                            ');
      clAux2.consulta.parambyname('CR_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('CR_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('CR_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM CARTOES_PARCELAS                        ');
      clAux2.AddParam ('WHERE (PC_LOJA=:PC_LOJA) AND                        ');
      clAux2.AddParam ('      (PC_CAIX=:PC_CAIX) AND                        ');
      clAux2.AddParam ('      (PC_VEND=:PC_VEND)                            ');
      clAux2.consulta.parambyname('PC_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('PC_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('PC_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM CREDIARIOS                              ');
      clAux2.AddParam ('WHERE (CR_LOJA=:CR_LOJA) AND                        ');
      clAux2.AddParam ('      (CR_CAIX=:CR_CAIX) AND                        ');
      clAux2.AddParam ('      (CR_VEND=:CR_VEND)                            ');
      clAux2.consulta.parambyname('CR_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('CR_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('CR_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM CHEQUES                                 ');
      clAux2.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND                        ');
      clAux2.AddParam ('      (CH_CAIX=:CH_CAIX) AND                        ');
      clAux2.AddParam ('      (CH_VEND=:CH_VEND)                            ');
      clAux2.consulta.parambyname('CH_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('CH_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('CH_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM VALES_RECEBIDOS                         ');
      clAux2.AddParam ('WHERE (VE_LOJA=:VE_LOJA) AND                        ');
      clAux2.AddParam ('      (VE_CAIX=:VE_CAIX) AND                        ');
      clAux2.AddParam ('      (VE_VEND=:VE_VEND)                            ');
      clAux2.consulta.parambyname('VE_LOJA').AsFloat := clAux.result('VE_LOJA');
      clAux2.consulta.parambyname('VE_CAIX').AsFloat := clAux.result('VE_CAIX');
      clAux2.consulta.parambyname('VE_VEND').AsFloat := clAux.result('VE_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.desconect;
      clAux2.Free;
              {***************************************************}
              {---->}
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;

         //2. Buscando ATENDIMENTOS ------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT AT_LOJA,AT_CAIX,AT_CODI               ');
    clAux.AddParam ('FROM   ATENDIMENTOS                          ');
    clAux.AddParam ('WHERE (AT_ONLI='+chr(39)+'0'+chr(39)+') AND  '); //vendas realizadas OFF-LINE
    clAux.AddParam ('      (AT_ENVI='+chr(39)+'1'+chr(39)+')      '); //vendas 'ENVIADAS' pela exportacao
    clAux.Execute;
    clAux.first;
    indGauge:=0;
    totGauge:=clAux.reccount;
    mostra_mensagem('Excluindo atendimentos OFF-LINE enviadas...Aguarde!');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    while (not clAux.eof) do
    begin
              {***************************************************}
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   ('VENDAS',self);
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM ATEMDIMENTOS                            ');
      clAux2.AddParam ('WHERE (AT_LOJA=:AT_LOJA) AND                        ');
      clAux2.AddParam ('      (AT_CAIX=:AT_CAIX) AND                        ');
      clAux2.AddParam ('      (AT_CODI=:AT_CODI)                            ');
      clAux2.consulta.parambyname('AT_LOJA').AsFloat := clAux.result('AT_LOJA');
      clAux2.consulta.parambyname('AT_CAIX').AsFloat := clAux.result('AT_CAIX');
      clAux2.consulta.parambyname('AT_CODI').AsFloat := clAux.result('AT_CODI');
      clAux2.Execute;
              {***************************************************}
      clAux2.ClearSql;
      clAux2.AddParam ('DELETE FROM ITENS_ATENDIMENTOS                      ');
      clAux2.AddParam ('WHERE (IA_LOJA=:IA_LOJA) AND                        ');
      clAux2.AddParam ('      (IA_CAIX=:IA_CAIX) AND                        ');
      clAux2.AddParam ('      (IA_VEND=:IA_VEND)                            ');
      clAux2.consulta.parambyname('IA_LOJA').AsFloat := clAux.result('AT_LOJA');
      clAux2.consulta.parambyname('IA_CAIX').AsFloat := clAux.result('AT_CAIX');
      clAux2.consulta.parambyname('IA_VEND').AsFloat := clAux.result('AT_CODI');
      clAux2.Execute;
              {***************************************************}
              {---->}
      clAux.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    esconde_mensagem;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_BotoesMovimento.botao3Click(Sender: TObject);
begin
  if (frmDialogo.ExibirMensagem ('Confirma exclusão das vendas OFF-LINE enviadas? (todos os terminais)'
    ,'Movimento',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    ExcluirRegistrosOffLineEnviados;
end;

procedure Tfrm_BotoesMovimento.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_BotoesMovimento.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_BotoesMovimento.botao4Click(Sender: TObject);
begin
  frm_principal.ChamandoExportaTrigger_Crediario;
end;

procedure Tfrm_BotoesMovimento.botao5Click(Sender: TObject);
begin
  frm_principal.ChamandoImportaTrigger_Crediario;
end;

end.
