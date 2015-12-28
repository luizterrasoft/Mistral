unit un_LancaVenda_InformeVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair,
  MaskEditOO, PanelOO, LabelOO,funcoesglobais;

type
  Tfrm_LancaVenda_InformeVendedor = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    pnVend: TPanelOO;
    edtCodigo: TMaskEditOO;
    btnConfirmar: TPanel;
    LabelOO2: TLabelOO;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    resultado: Integer;
  end;

var
  frm_LancaVenda_InformeVendedor: Tfrm_LancaVenda_InformeVendedor;
  ultvendedor:Integer;

implementation

uses principal, procura, funcoes1, funcoes2, unDialogo, un_LancaVenda;

{$R *.DFM}

procedure Tfrm_LancaVenda_InformeVendedor.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancaVenda_InformeVendedor.FormActivate(Sender: TObject);
begin
  inherited;
  edtCodigo.text := '';
  pnVend.caption := '';
  edtCodigo.setfocus;
  if ultvendedor <> 0 then
  begin
    edtcodigo.text := inttostr(ultvendedor);
    edtcodigo.onexit(edtcodigo);
    edtcodigo.selectall;
  end;
end;

procedure Tfrm_LancaVenda_InformeVendedor.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaVenda_InformeVendedor.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfirmarClick(Sender);
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtCodigo);
end;

procedure Tfrm_LancaVenda_InformeVendedor.btnConfirmarClick(
  Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_LancaVenda_InformeVendedor.edtCodigoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=trim(edtCodigo.text);
  if (codigo<>'') then
  begin
    pnVend.caption := ProcuraNomeVend(frm_principal.x_loja,strtofloat(codigo),self);
    if (trim(pnVend.caption)='<Vendedor não cadastrado>') then
    begin
      resultado := 27;
      frmDialogo.ExibirMensagem ('Vendedor não cadastrado!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      pnVend.caption := '';
      edtCodigo.text := '';
      edtCodigo.setfocus;
    end
    else
      edtCodigo.text   := form_nz(strtofloat(codigo),6);
  end
  else
    pnVend.caption := '';
end;

procedure Tfrm_LancaVenda_InformeVendedor.N1Click(Sender: TObject);
begin
  if (edtCodigo.GetValor = 0) then
    ExibeCritica('Informe o código do vendedor!','Caixa',edtCodigo)
  else
  begin
    pnVend.Caption := ProcuraNomeVend(frm_principal.x_loja,edtCodigo.GetValor,self);
    edtCodigo.Text := form_nz(edtCodigo.GetValor,6);
    frm_principal.x_vendedor := edtCodigo.GetValor;
    if (Trim(pnVend.Caption) = '<Vendedor não cadastrado>') then
    begin
      resultado := 27;
      frmDialogo.ExibirMensagem ('Vendedor não cadastrado!'
        ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      pnVend.Caption := '';
      edtCodigo.Text := '';
      edtCodigo.SetFocus;
    end
    else if (VerificaVendedorInativo(frm_principal.x_loja,edtCodigo.GetValor)) then
    begin
      resultado := 27;
      frmDialogo.ExibirMensagem ('Vendedor inativo!'
        ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      pnVend.Caption := '';
      edtCodigo.Text := '';
      edtCodigo.SetFocus;
    end
    else
    begin
      ultvendedor := StrtoIntN(edtCodigo.Text);
      resultado := 13;
      Close;
    end;
  end;
end;

procedure Tfrm_LancaVenda_InformeVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  resultado:=27;
end;

procedure Tfrm_LancaVenda_InformeVendedor.edtCodigoDblClick(
  Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtCodigo);
end;

begin
  ultvendedor :=0;
end.
