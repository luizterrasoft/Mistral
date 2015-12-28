unit un_Transf_Lancamento_Salvar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Menus, StdCtrls, LabelOO, Mask, MaskEditOO, PanelOO,
  DB, DBTables;

type
  Tfrm_Transf_Lancamento_Salvar = class(TForm)
    BotaoSair1: TBotaoSair;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmarsalvamento1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    edtNumero: TMaskEditOO;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    edtLojaDestino: TMaskEditOO;
    pnLojaDestino: TPanelOO;
    Bevel1: TBevel;
    botao2: TPanel;
    lbTipz: TLabelOO;
    panel1: TPanel;
    rdOpcao: TRadioGroup;
    Label1: TLabel;
    edtLojaOrigem: TMaskEditOO;
    pnLojaOrigem: TPanelOO;
    mniNovaTransferncia1: TMenuItem;
    qVerifConf: TQuery;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtLojaDestinoEnter(Sender: TObject);
    procedure edtLojaDestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmarsalvamento1Click(Sender: TObject);
    procedure edtLojaDestinoDblClick(Sender: TObject);
    procedure edtLojaDestinoExit(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLojaOrigemEnter(Sender: TObject);
    procedure edtLojaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaOrigemDblClick(Sender: TObject);
    procedure edtLojaOrigemExit(Sender: TObject);
    procedure rdOpcaoClick(Sender: TObject);
    procedure mniNovaTransferncia1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoInclusao : Integer;
    exibiu: Boolean;
    tipz: String;
    resultado: Integer;
    y_documento: Real;
    y_lojaorigem: Real;
    y_lojadestino: Real;
    y_opcao: Integer;
    ModoOperando: String;   {ENTRADAS / SAIDA}
    function JaExisteTransfLojaComEsteNumero(lojaorigem,documento: Real; operacao: Integer):Boolean;
    function JaExisteTransfLojaComEsteNumero1(lojaorigem,documento: Real; operacao: Integer):Boolean;
    function JaExisteTransfLojaComEsteNumero2(lojaorigem,documento,lojadest: Real):Boolean;
  end;

var
  frm_Transf_Lancamento_Salvar: Tfrm_Transf_Lancamento_Salvar;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar, F8Lojas, unDialogo, DM16;

procedure Tfrm_Transf_Lancamento_Salvar.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Lancamento_Salvar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaDestinoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaDestinoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    edtNumero.setfocus;
  if (key=K_ENTER) then
  begin
    edtLojaDestinoExit(edtLojaDestino);
    botao2Click(Sender);
  end;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLojaDestino;
      showmodal;
    end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.botao2Click(Sender: TObject);
begin
  Confirmarsalvamento1.click;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtLojaDestino.setfocus;
//     if (key=K_CIMA) then edtLojaOrigem.setfocus;
end;

procedure Tfrm_Transf_Lancamento_Salvar.Limparformulrio1Click(
  Sender: TObject);
begin
  edtNumero.text        := '';
  edtLojaDestino.text   := '';
  pnLojaDestino.caption := '';
  edtNumero.setfocus;
end;

procedure Tfrm_Transf_Lancamento_Salvar.FormCreate(Sender: TObject);
begin
  exibiu:=false;
  tipz:='1';
  lbTipz.caption:='Sr.1';
  resultado:=27;
  y_documento:=-1;
  y_lojadestino:=-1;
  y_opcao:=0;
{     if (not frm_principal.x_online) then
     begin
       edtLojaOrigem.Enabled := True;
       edtLojaOrigem.Color := clWhite;
     end
     else
     begin
       edtNumero.SetFocus;
//       edtLojaOrigem.Enabled := False;
       edtLojaOrigem.Color := clTeal;
     end;}
end;

procedure Tfrm_Transf_Lancamento_Salvar.Confirmarsalvamento1Click(Sender: TObject);
var
  mensagem: String;
begin
  if (edtLojaOrigem.GetValor<>0) and (edtNumero.GetValor<>0) and (edtLojaDestino.GetValor<>0) then
  begin
    edtLojaDestinoExit(Sender);
    if (edtLojaDestino.GetValor=edtLojaOrigem.GetValor) then
    begin
      if (rdOpcao.itemindex=0) then //SAIDA
      begin
        frmDialogo.ExibirMensagem ('A loja de destino não pode ser a mesma de origem!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtLojaDestino.setfocus;
      end
      else
      if (rdOpcao.itemindex=1) then //ENTRADA
      begin
        frmDialogo.ExibirMensagem ('A loja de origem não pode ser a mesma de destino!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtLojaOrigem.setfocus;
      end;
    end

    else
    if (JaExisteTransfLojaComEsteNumero(edtLojaOrigem.GetValor,edtNumero.GetValor,rdOpcao.itemindex)) then
    begin
      frmDialogo.ExibirMensagem ('Já existe um doc. com este número!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtNumero.setfocus;
    end
          //-------------------------
    else
    if (rdOpcao.ItemIndex=0) and (JaExisteTransfLojaComEsteNumero1(edtLojaOrigem.GetValor,edtNumero.GetValor,rdOpcao.itemindex)) then
    begin
      frmDialogo.ExibirMensagem ('Já existe uma Entrada com este número!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtNumero.setfocus;
    end
    else
    if (JaExisteTransfLojaComEsteNumero2(edtLojaOrigem.GetValor,edtNumero.GetValor,edtLojaDestino.GetValor)) then
    begin
      frmDialogo.ExibirMensagem ('Já existe uma Entrada para outra loja com este número!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtNumero.setfocus;
    end
          //-------------------------
    else
    if (rdOpcao.itemindex=2) and (frm_principal.x_online) then {*}
    begin
      frmDialogo.ExibirMensagem ('Opção disponível apenas para OFF LINE!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      rdOpcao.setfocus;
    end
    else
    if (trim(pnLojaDestino.caption)='<loja nao cadastrada>') then
    begin
      frmDialogo.ExibirMensagem ('Loja de destino não cadastrada! Informe a loja de destino correta!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtLojaDestino.setfocus;
    end
    else
    begin
      if (rdOpcao.itemindex=0) then
        mensagem:='SAÍDA para a loja '+form_nz(edtLojaDestino.GetValor,2)
      else
      if (rdOpcao.itemindex=1) then
        mensagem:='ENTRADA a partir da loja '+form_nz(edtLojaOrigem.GetValor,2);
      frmDialogo.posativ:=1;
      if (frmDialogo.ExibirMensagem ('Confirma '+mensagem+'?'
        ,'Vendas',[mbYes,mbNo],
        frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
        y_lojaorigem  := edtLojaOrigem.GetValor;
        y_documento   := edtNumero.GetValor;
        y_lojadestino := edtLojaDestino.GetValor;
        y_opcao       := rdOpcao.itemindex;
        resultado:=13;
        close;
      end;
    end;
  end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaDestinoDblClick(
  Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLojaDestino;
    showmodal;
  end;
end;

function Tfrm_Transf_Lancamento_Salvar.JaExisteTransfLojaComEsteNumero(lojaorigem,documento: Real; operacao: Integer):Boolean;
var
  trstat: String;
  clAux: TClassAuxiliar;
begin
  if (operacao=0) then
    trstat := '1' //SAIDA
  else
  if (operacao=1) then
    trstat := '2'; //ENTRADA

  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT TR_NUME,TR_STAT FROM TRANSF_LOJA                  ');
  clAux.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) AND ');
  clAux.AddParam ('      (TR_STAT=:operacao)                                ');
  clAux.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux.consulta.parambyname('documento').AsFloat  := documento;
  clAux.consulta.parambyname('operacao').AsString  := trstat;
  result := clAux.Execute;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_Transf_Lancamento_Salvar.JaExisteTransfLojaComEsteNumero1(lojaorigem,documento: Real; operacao: Integer):Boolean;
var
  trstat: String;
  clAux1: TClassAuxiliar;
begin
  if (operacao=0) then
    trstat := '1' //SAIDA
  else
  if (operacao=1) then
    trstat := '2'; //ENTRADA

  clAux1 := TClassAuxiliar.Create;
  clAux1.conect   (databaseprodutos,self);
  clAux1.ClearSql;
  clAux1.AddParam ('SELECT TR_NUME,TR_STAT FROM TRANSF_LOJA                  ');
  clAux1.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) AND ');
  clAux1.AddParam ('      (TR_STAT=:operacao)                                ');
  clAux1.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux1.consulta.parambyname('documento').AsFloat  := documento;
  clAux1.consulta.parambyname('operacao').AsString  := '2';
  result := clAux1.Execute;
  clAux1.desconect;
  clAux1.Free;
end;

function Tfrm_Transf_Lancamento_Salvar.JaExisteTransfLojaComEsteNumero2(lojaorigem,documento,lojadest: Real):Boolean;
var
  trstat: String;
  clAux1: TClassAuxiliar;
begin
  clAux1 := TClassAuxiliar.Create;
  clAux1.conect   (databaseprodutos,self);
  clAux1.ClearSql;
  clAux1.AddParam ('SELECT TR_NUME,TR_STAT FROM TRANSF_LOJA                  ');
  clAux1.AddParam ('WHERE (TR_LOJ1=:lojaorigem) AND (TR_NUME=:documento) AND ');
  clAux1.AddParam ('      (TR_LOJ2<>:lojadest)                               ');
  clAux1.consulta.parambyname('lojaorigem').AsFloat := lojaorigem;
  clAux1.consulta.parambyname('documento').AsFloat  := documento;
  clAux1.consulta.parambyname('lojadest').AsString  := edtLojaDestino.Text;
  result := clAux1.Execute;
  clAux1.desconect;
  clAux1.Free;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaDestinoExit(Sender: TObject);
begin
  if (edtLojaDestino.GetValor<>0) then
  begin
    edtLojaDestino.text:=form_nz(edtLojaDestino.GetValor,2);
    pnLojaDestino.caption:=ProcuraNomeLoja(edtLojaDestino.GetValor,self);
  end
  else
    pnLojaDestino.caption:='';
end;

procedure Tfrm_Transf_Lancamento_Salvar.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Lancamento_Salvar.FormActivate(Sender: TObject);
begin
  if (not exibiu) then
  begin
    if (ModoOperando='SAIDA') then
      rdOpcao.itemindex:=0
    else
    if (ModoOperando='ENTRADA') then
      rdOpcao.itemindex:=1;
    rdOpcaoClick(rdOpcao);
    exibiu:=true;
  end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaOrigemEnter(
  Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaOrigemKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLojaOrigem;
      showmodal;
    end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaOrigemDblClick(
  Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLojaOrigem;
    showmodal;
  end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.edtLojaOrigemExit(Sender: TObject);
begin
  if (edtLojaOrigem.GetValor<>0) then
  begin
    pnLojaOrigem.caption:=ProcuraNomeLoja(edtLojaOrigem.GetValor,self);
    edtLojaOrigem.text:=form_nz(edtLojaOrigem.GetValor,2);
  end
  else
    pnLojaOrigem.caption:='';
end;

procedure Tfrm_Transf_Lancamento_Salvar.rdOpcaoClick(Sender: TObject);
begin
  if (rdOpcao.itemindex=0) then //SAIDA
  begin
    edtLojaOrigem.text      := form_nz(frm_principal.x_loja,2);
    edtLojaOrigemExit(edtLojaOrigem);
    edtLojaOrigem.readonly  := true;
    edtLojaOrigem.Enabled := false;
    edtLojaOrigem.Color := clTeal;
    edtLojaDestino.readonly := false;
    edtLojaDestino.text     := '';
    pnLojaDestino.caption   := '';
//    edtNumero.setfocus;
  end
  else
  if (rdOpcao.itemindex=1) then //ENTRADA
  begin
    edtLojaDestino.text     := form_nz(frm_principal.x_loja,2);
    edtLojaDestinoExit(edtLojaDestino);
    edtLojaOrigem.readonly  := false;
    edtLojaDestino.readonly := true;
    edtLojaOrigem.text      := '';
    pnLojaOrigem.caption    := '';
    edtLojaOrigem.Enabled := true;
    edtLojaOrigem.Color := clWhite;
    edtLojaOrigem.setfocus;
  end;
end;

procedure Tfrm_Transf_Lancamento_Salvar.mniNovaTransferncia1Click(
  Sender: TObject);
begin
  if (CodigoInclusao=0) then
    CodigoInclusao := Round(MaxiCod_estoque ('TRANSFERENCIAS',frm_principal.barraDicas));
  edtNumero.text := form_nz(CodigoInclusao,8);
  edtNumero.setfocus;
end;

procedure Tfrm_Transf_Lancamento_Salvar.FormShow(Sender: TObject);
begin
with qVerifConf do
    begin
      Close;
      Open;
      if FieldByName('GERA_SEQ').AsString = 'S' then
        if (CodigoInclusao=0) or (CodigoInclusao<>0) then
        begin
          CodigoInclusao := Round(MaxiCod_estoque ('TRANSFERENCIAS',frm_principal.barraDicas));
          edtNumero.text := form_nz(CodigoInclusao,8);
          edtNumero.ReadOnly := True;
          edtNumero.Font.Color := clYellow;
          edtNumero.Color := clTeal;
          edtLojaDestino.SetFocus;
        end;

    end;
end;

end.
