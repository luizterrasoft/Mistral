unit un_ExibeCaixas_NovoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, Mask, StdCtrls, ExtCtrls, BotaoSair, PanelOO,
  MaskEditOO, LabelOO;

type
  Tfrm_ExibeCaixas_NovoCaixa = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    LabelOO1: TLabelOO;
    edtFunc: TMaskEditOO;
    pnFunc: TPanelOO;
    LabelOO2: TLabelOO;
    LabelOO3: TLabelOO;
    edtValorInicial1: TMaskEditOO;
    Bevel1: TBevel;
    LabelOO4: TLabelOO;
    botao2: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label9: TLabel;
    edtSenha: TMaskEdit;
    Bevel3: TBevel;
    edtValorInicial2: TMaskEditOO;
    lblValor2: TLabelOO;
    lbtipz: TLabel;
    Image2: TImage;
    Label6: TLabel;
    Label12: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtmaskeditformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFuncDblClick(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    procedure FocusControle2(controle: TWinControl; direcao: Boolean);
    function JaExisteCaixa(func: Real):Boolean;
  end;

var
  frm_ExibeCaixas_NovoCaixa: Tfrm_ExibeCaixas_NovoCaixa;

implementation

uses principal, procura, funcoes1, funcoes2, auxiliar, venda;

{$R *.DFM}

procedure Tfrm_ExibeCaixas_NovoCaixa.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.edtmaskeditformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (TMaskEdit(Sender).name='edtValorInicial1') and ((key=K_ENTER) or (key=K_BAIXO)) then
    FocusControle2(TWinControl(sender),true)
  else
  if (TMaskEdit(Sender).name='edtValorInicial1') and (key=K_CIMA) then
    FocusControle2(TWinControl(sender),false)
  else
  if (TMaskEdit(Sender).name='edtFunc') and (key=K_F8) then
    ChamandoF8Caixa(frm_principal.x_loja,edtFunc)
  else
    inherited;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.edtFuncDblClick(Sender: TObject);
begin
  ChamandoF8Caixa(frm_principal.x_loja,edtFunc);
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.botao2Click(Sender: TObject);
begin
  N1.click;
end;

function Tfrm_ExibeCaixas_NovoCaixa.JaExisteCaixa(func: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CX_CAIX FROM CAIXAS     ');
  clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
  clAux.AddParam ('      (CX_DATA=:data) AND      ');
  clAux.AddParam ('      (CX_FUNC=:func)          ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('func').AsFloat     := func;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (edtFunc.GetValor=0) then
    ExibeCritica('O funcionário deve ser informado','Caixa',edtFunc)
  else
  if (JaExisteCaixa(edtFunc.GetValor)) then
    ExibeCritica('Já foi aberto um caixa para este funcionário!','Caixa',edtFunc)
  else
  if (edtSenha.text='') then
    ExibeCritica('Informe a senha do funcionário operador de caixa','Caixa',edtSenha)
  else
  if (not ChecaSenhaCaixa(edtFunc.GetValor,edtSenha.text)) then
    ExibeCritica('Senha do caixa não confere!','Caixa',edtSenha)
  else
  if (ProcuraNomeVendCaixa(frm_principal.x_loja,edtFunc.GetValor,self)='<Operador não cadastrado>') then
    ExibeCritica('Funcionário não é operador de caixa!','Caixa',edtSenha)
  else
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO CAIXAS(CX_LOJA,CX_CAIX,CX_DATA,CX_FUNC,CX_STAT,CX_VINI,CX_VIN2,CX_ABRE) ');
    clAux.AddParam ('VALUES (:CX_LOJA,:CX_CAIX,:CX_DATA,:CX_FUNC,:CX_STAT,:CX_VINI,:CX_VIN2,:CX_ABRE) ');
    clAux.consulta.parambyname('CX_LOJA').AsFloat    := frm_principal.x_loja;
    clAux.consulta.parambyname('CX_CAIX').AsFloat    := frm_principal.x_terminal;
    clAux.consulta.parambyname('CX_DATA').AsDateTime := frm_principal.x_data_trabalho;
    clAux.consulta.parambyname('CX_FUNC').AsFloat    := edtFunc.GetValor;
    clAux.consulta.parambyname('CX_STAT').AsString   := KST_CAIXA_ABERTO; //SITUACAO INICIAL - Aberto
    clAux.consulta.parambyname('CX_VINI').AsFloat    := edtValorInicial1.GetValor;
    clAux.consulta.parambyname('CX_VIN2').AsFloat    := edtValorInicial2.GetValor;
    clAux.consulta.parambyname('CX_ABRE').AsString   := TimeToStr(Time); //HORA INICIAL - Aberto
    clAux.Execute; {*}
    if DataBaseProdutos = 'ESTOQUE' then
      try
        claux.consulta.databasename := 'ESTOQUE';
        ClAux.Execute;
      except
      end;

    clAux.desconect;
    clAux.Free;
    close;
  end;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.edtmaskeditformulario1Exit(Sender: TObject);
begin
  inherited;
  if (edtFunc.GetValor<>0) then
  begin
    pnFunc.caption := ProcuraNomeVendCaixa(frm_principal.x_loja,edtFunc.GetValor,self);
    edtFunc.text   := form_nz(edtFunc.GetValor,6);
  end
  else
    pnFunc.caption := '';
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.edtSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_CIMA) then
    if (edtValorInicial2.visible) then
      edtValorInicial2.setfocus
    else
      edtValorInicial1.setfocus;
  if (key=K_ENTER) then
    botao2Click(Sender);
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.edtSenhaEnter(Sender: TObject);
begin
  edtSenha.selectall;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.FocusControle2(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_ExibeCaixas_NovoCaixa.GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  if (direcao) then
  begin
    if (ind<Lista.count) then
    begin
      if (TMaskEdit(Lista.items[ind+1]).visible) then
      begin
        proxcontrole:= Lista.items[ind+1];
        proxcontrole.setfocus;
      end
      else
        FocusControle2(Lista.items[ind+1],direcao);
    end
    else
    begin
      proxcontrole:= Lista.items[0];
      proxcontrole.setfocus;
    end;
  end
  else
  if (ind>0) then
  begin
    if (TMaskEdit(Lista.items[ind-1]).visible) then
    begin
      proxcontrole:= Lista.items[ind-1];
      proxcontrole.setfocus;
    end
    else
      FocusControle2(Lista.items[ind-1],direcao);
  end
  else
  begin
    proxcontrole:= Lista.items[Lista.count-1];
    proxcontrole.setfocus;
  end;
  Lista.Free;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lblValor2.visible:=true;
        edtValorInicial2.visible:=true;
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        lblValor2.visible:=false;
        edtValorInicial2.visible:=false;
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  Image2.picture := frm_principal.Image1.picture;
end;

procedure Tfrm_ExibeCaixas_NovoCaixa.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  inherited;

    {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
end;

end.
