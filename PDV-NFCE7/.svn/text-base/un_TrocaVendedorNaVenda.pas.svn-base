unit un_TrocaVendedorNaVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, BotaoSair, Menus, StdCtrls, Mask, ExtCtrls, PanelOO,
  LabelOO, MaskEditOO;

type
  Tfrm_TrocaVendedorNaVenda = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    LabelOO2: TLabelOO;
    pnVend: TPanelOO;
    LabelOO5: TLabelOO;
    edtNovoVendedor: TMaskEditOO;
    Bevel3: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    botao2: TPanel;
    LabelOO6: TLabelOO;
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtNovoVendedorEnter(Sender: TObject);
    procedure edtNovoVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure edtNovoVendedorDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tecla: Integer;
  end;

var
  frm_TrocaVendedorNaVenda: Tfrm_TrocaVendedorNaVenda;

implementation

{$R *.DFM}

uses auxiliar,procura,principal, unDialogo, funcoes1, funcoes2,
  un_TrocaVendedorNaVenda_EscolhaVendedor;

procedure Tfrm_TrocaVendedorNaVenda.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_TrocaVendedorNaVenda.edtNovoVendedorEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_TrocaVendedorNaVenda.edtNovoVendedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtNovoVendedor);
end;

procedure Tfrm_TrocaVendedorNaVenda.botao2Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_TrocaVendedorNaVenda.edtNovoVendedorDblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtNovoVendedor);
end;

procedure Tfrm_TrocaVendedorNaVenda.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  numerovenda: Real;
  novovendedor: Real;
begin
  if (trim(edtNovoVendedor.text)<>'') then
    if (frmDialogo.ExibirMensagem ('Confirma troca de vendedor?         Novo vendedor: '+
      ProcuraNomeVend(frm_principal.x_loja,strtofloat(trim(edtNovoVendedor.text)),self)
      ,'Vendas',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      tecla:=13; 
      close;
    end;
end;

procedure Tfrm_TrocaVendedorNaVenda.Limparformulrio1Click(Sender: TObject);
begin
  edtNovoVendedor.text := '';
  pnVend.caption       := '';
  edtNovoVendedor.setfocus;
end;

procedure Tfrm_TrocaVendedorNaVenda.FormCreate(Sender: TObject);
begin
  inherited;
  tecla:=27;
end;

procedure Tfrm_TrocaVendedorNaVenda.FormActivate(Sender: TObject);
begin
  inherited;
  edtNovoVendedor.setfocus;
end;

end.
