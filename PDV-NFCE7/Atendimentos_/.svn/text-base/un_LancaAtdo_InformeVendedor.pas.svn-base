unit un_LancaAtdo_InformeVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair,
  MaskEditOO, PanelOO, LabelOO;

type
  Tfrm_LancaAtdo_InformeVendedor = class(Tfrm_Auxformulario1)
    LabelOO1: TLabelOO;
    pnVend: TPanelOO;
    edtCodigo: TMaskEditOO;
    btnConfirmar: TPanel;
    Label1: TLabel;
    edtSenha: TMaskEdit;
    LabelOO2: TLabelOO;
    LabelOO3: TLabelOO;
    Bevel2: TBevel;
    btnSairSemSelecionar: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    Panel1: TPanel;
    procedure BotaoSair2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaEnter(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure btnSairSemSelecionarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    resultado: Integer;
    function SenhaCorreta(codigo_vendedor: Real; senha: String):Boolean;
  end;

var
  frm_LancaAtdo_InformeVendedor: Tfrm_LancaAtdo_InformeVendedor;

implementation

uses principal, procura, funcoes1, funcoes2, unDialogo, auxiliar;

{$R *.DFM}

procedure Tfrm_LancaAtdo_InformeVendedor.BotaoSair2Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  inherited;

     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

  edtCodigo.text := '';
  pnVend.caption := '';
  edtCodigo.setfocus;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSenha.setfocus;
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtCodigo);
end;

procedure Tfrm_LancaAtdo_InformeVendedor.btnConfirmarClick(
  Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtCodigoExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=trim(edtCodigo.text);
  if (codigo<>'') then
  begin
    pnVend.caption := ProcuraNomeVend(frm_principal.x_loja,strtofloat(codigo),self);
    edtCodigo.text   := form_nz(strtofloat(codigo),6);
  end
  else
    pnVend.caption := '';
end;

procedure Tfrm_LancaAtdo_InformeVendedor.N1Click(Sender: TObject);
begin
  if (edtCodigo.GetValor=0) then
    ExibeCritica('Informe o código do vendedor!','Vendedor',edtCodigo)
  else
  if (trim(edtSenha.text)='') then
    ExibeCritica('Informe a senha do vendedor!','Vendedor',edtSenha)
  else
  if (not SenhaCorreta(edtCodigo.GetValor,edtSenha.text)) then
    ExibeCritica('Senha incorreta! Tente novamente!','Vendedor',edtSenha)
  else
  begin
    if (trim(pnVend.caption)='') then
    begin
      pnVend.caption := ProcuraNomeVend(frm_principal.x_loja,edtCodigo.GetValor,self);
      edtCodigo.text := form_nz(edtCodigo.GetValor,6);
    end;
    frm_principal.x_vendedor := edtCodigo.GetValor;
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
    begin
      resultado := 13;
      close;
    end;
  end;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  Image2.picture := frm_principal.Image1.picture; 
  resultado:=27;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtCodigoDblClick(
  Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtCodigo);
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnConfirmarClick(Sender);
  if (key=K_CIMA) then
    edtCodigo.setfocus;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.edtSenhaEnter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

function Tfrm_LancaAtdo_InformeVendedor.SenhaCorreta(codigo_vendedor: Real; senha: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databaseprodutos,self);
  clAux.ClearSql;
  clAux.AddParam ('Select VD_CODI,VD_NOME,VD_SENH   ');
  clAux.AddParam ('From   VENDEDORES                ');
  clAux.AddParam ('Where (VD_CODI=:codigo) AND      ');
  clAux.AddParam ('      (VD_CARG=:cargo) AND       ');
  clAux.AddParam ('      (VD_LOJA=:loja)            ');
  clAux.consulta.parambyname('codigo').AsFloat := codigo_vendedor;
  clAux.consulta.parambyname('loja').AsFloat   := frm_principal.x_loja;
  clAux.consulta.parambyname('cargo').AsString := 'VENDEDOR COMUM';
  if (clAux.Execute) then
  begin
    if (trim(clAux.result('VD_SENH'))=trim(senha)) then
      result := true
    else
      result := false;
  end
  else
    result := false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.Limparformulrio1Click(
  Sender: TObject);
begin
  edtCodigo.text := '';
  pnVend.caption := '';
  edtSenha.text  := '';
  edtCodigo.setfocus;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.btnSairSemSelecionarClick(
  Sender: TObject);
begin
  frm_principal.x_vendedor := 0;
  resultado := 13;
  close;
end;

procedure Tfrm_LancaAtdo_InformeVendedor.botao_sairClick(Sender: TObject);
begin
  close;

end;

end.
