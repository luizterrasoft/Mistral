unit un_FechamentoVenda_ValeMerc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask, PanelOO;

type
  Tfrm_FechamentoVenda_ValeMerc = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Image2: TImage;
    Label2: TLabel;
    Label12: TLabel;
    Confirmardados1: TMenuItem;
    botao1: TPanel;
    botaoSair: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtNParc: TMaskEdit;
    Bevel4: TBevel;
    edtNDoc: TMaskEdit;
    Label1: TLabel;
    edtCodFunc: TMaskEdit;
    pnFunc: TPanelOO;
    Label6: TLabel;
    pnValor: TPanelOO;
    Label7: TLabel;
    edtloja: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNParcEnter(Sender: TObject);
    procedure edtNParcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNDocEnter(Sender: TObject);
    procedure edtCodFuncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodFuncEnter(Sender: TObject);
    procedure edtCodFuncExit(Sender: TObject);
    procedure edtCodFuncDblClick(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure edtlojaDblClick(Sender: TObject);
    procedure edtlojaEnter(Sender: TObject);
    procedure edtlojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtlojaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    tecla: Integer;
    y_valor: Real;
    xloja: Real;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_FechamentoVenda_ValeMerc: Tfrm_FechamentoVenda_ValeMerc;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, un_F8Adm,
  unDialogo;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_ValeMerc.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (not JaChamou) then
  begin
    Limparformulrio1.click;
    pnValor.caption:=trim(form_nc(y_valor,15));
    JaChamou:=true;
  end;
  if (frm_principal.x_loja< 9) then
    edtloja.Text := FormatFloat('00',frm_principal.x_loja)
  else
    edtloja.Text := FormatFloat('00',frm_principal.x_loja);
  edtloja.setfocus;
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  if (direcao) then
  begin
    if (ind<Lista.count) then
      proxcontrole:=Lista.items[ind+1]
    else
      proxcontrole:= Lista.items[0];
  end
  else
  if (ind>0) then
    proxcontrole:=Lista.items[ind-1]
  else
    proxcontrole:=Lista.items[Lista.count-1];
  proxcontrole.setfocus;
  Lista.Free;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.FormCreate(Sender: TObject);
begin
  tecla:=27;
  jaChamou:=false;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
  edtNParc.setfocus;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.LimparEdits;
begin
  edtNParc.text   := '';
  edtNDoc.text    := '';
  edtCodFunc.text := '';
  pnFunc.caption  := '';
end;

procedure Tfrm_FechamentoVenda_ValeMerc.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtNParcEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtNParcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Confirmardados1.click;
  if (key=K_CIMA) then
    edtNDoc.setfocus;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtNDocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNParc.setfocus;
  if (key=K_CIMA) then
    edtCodFunc.setfocus;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtNDocEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtCodFuncKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNDoc.setfocus;
  if (key=K_CIMA) then
    edtloja.SetFocus;
  if (key=K_F8) then
    ChamandoF8TodosFuncionarios (xloja,edtCodFunc);
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtCodFuncEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtCodFuncExit(Sender: TObject);
begin
  if (trim(edtCodFunc.text)<>'') then
  begin
    pnFunc.caption  := ProcuraNomeVend(xloja,strtofloat(trim(edtCodFunc.text)),self);
    if (Trim(pnFunc.Caption)='<Vendedor não cadastrado>') then
      ExibeCritica ('O funcionário deve ser informado!','Vale Mercadoria',edtCodFunc);
    edtCodFunc.text := form_nz(strtofloat(trim(edtCodFunc.text)),6);
  end
  else
    pnFunc.caption := '';
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtCodFuncDblClick(Sender: TObject);
begin
  ChamandoF8TodosFuncionarios (xloja,edtCodFunc);
end;

procedure Tfrm_FechamentoVenda_ValeMerc.Confirmardados1Click(
  Sender: TObject);
begin
  if (trim(edtCodFunc.text)='') then
    ExibeCritica ('O funcionário deve ser informado!','Vale Mercadoria',edtCodFunc)
  else
  if (trim(edtNDoc.text)='') then
    ExibeCritica ('O número do documento deve ser informado!','Vale Mercadoria',edtNDoc)
  else
  if (trim(edtNParc.text)='') then
    ExibeCritica ('O num. de parcelas deve ser informado!','Vale Mercadoria',edtNParc)
  else
  begin
          //.... ????
          
    tecla := 13;
    close;
  end;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtlojaDblClick(Sender: TObject);
begin
  edtloja.Text := ChamandoF8Lojas;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtlojaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtlojaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodFunc.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    edtloja.Text := ChamandoF8Lojas;
end;

procedure Tfrm_FechamentoVenda_ValeMerc.edtlojaExit(Sender: TObject);
begin
  if Trim(edtloja.Text)<> '' then
  begin
    if ProcuraNomeLoja(StrToFloat(edtloja.Text),self)='<loja nao cadastrada>' then
      ExibeCritica ('Loja não cadastrada!','Vale Mercadoria',edtloja)
    else
      xloja := StrToFloat(edtloja.Text);
  end
  else
    xloja := frm_principal.x_loja;
  edtCodFunc.Text := '';
end;

end.
