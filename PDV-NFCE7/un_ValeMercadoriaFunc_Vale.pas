unit un_ValeMercadoriaFunc_Vale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair, PanelOO,
  MaskEditOO, LabelOO;

type
  Tfrm_ValeMercadoriaFunc_Vale = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    botao2: TPanel;
    LabelOO1: TLabelOO;
    edtDoc: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtFunc: TMaskEditOO;
    pnFunc: TPanelOO;
    Bevel1: TBevel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure edtFuncExit(Sender: TObject);
    procedure edtFuncDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    resultado: Integer;
    y_funcionario: Real;
    y_documento: String;
  end;

var
  frm_ValeMercadoriaFunc_Vale: Tfrm_ValeMercadoriaFunc_Vale;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura;

procedure Tfrm_ValeMercadoriaFunc_Vale.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.FormCreate(Sender: TObject);
begin
  inherited;
  resultado:=27;
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.FormActivate(Sender: TObject);
begin
  inherited;
  edtDoc.setfocus;
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.edtFuncKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    botao2Click(Sender);
  if (key=38) then
    edtDoc.setfocus;
  if (key=K_F8) then
    ChamandoF8TodosFuncionarios(frm_principal.x_loja,edtFunc);
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.botao2Click(Sender: TObject);
begin
  if (edtDoc.GetValor='') then
    ExibeCritica('O Número do documento de Vale não pode ficar vazio!','Vendas',edtDoc)
  else
  if (edtFunc.GetValor=0) then
    ExibeCritica('O código do funcionário não pode ficar vazio!','Vendas',edtFunc)
  else
  if (trim(pnFunc.caption)='') then
  begin
    edtDoc.Setfocus;
    edtFunc.Setfocus;
  end
  else
  if (trim(pnFunc.caption)='<Vendedor não cadastrado>') then
    ExibeCritica('Funcionário não cadastrado!','Vendas',edtFunc)
  else
  begin
    y_documento   := edtDoc.GetValor;
    y_funcionario := edtFunc.GetValor;
    resultado:=13;
    close;
  end;
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.edtFuncExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=trim(edtFunc.text);
  if (codigo<>'') then
  begin
    pnFunc.caption:=ProcuraNomeVend(frm_principal.x_loja,strtofloat(codigo),self);
    edtfunc.text:=form_nz(strtofloat(codigo),6);
  end;
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.edtFuncDblClick(Sender: TObject);
begin
  ChamandoF8TodosFuncionarios(frm_principal.x_loja,edtFunc);
end;

procedure Tfrm_ValeMercadoriaFunc_Vale.N1Click(Sender: TObject);
begin
  botao2Click(Sender);
end;

end.
