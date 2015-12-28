unit aux1Contrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, cliente, Menus;

type
  Tfrm_aux1Contrato = class(TForm)
    btnProc: TButton;
    MainMenu1: TMainMenu;
    Label2: TLabel;
    edtLoja: TMaskEdit;
    pnLoja: TPanel;
    edtDataContrato: TMaskEdit;
    Label1: TLabel;
    btnCancel: TButton;
    Sair1: TMenuItem;
    pnInfo1: TPanel;
    Label58: TLabel;
    Label59: TLabel;
    Label3: TLabel;
    edtCliente: TMaskEdit;
    pnCliente: TPanel;
    pnInfo2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    bevel1: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataContratoEnter(Sender: TObject);
    procedure edtDataContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataContratoExit(Sender: TObject);
    procedure edtLojaDblClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    clClie: TClassCliente;
  end;

var
  frm_aux1Contrato: Tfrm_aux1Contrato;

implementation

uses cadcli, principal, loja, F8Lojas, funcoes1, funcoes2, f8Clientes,
  unDialogo;

{$R *.DFM}


{Ativacao do formulario}
procedure Tfrm_aux1Contrato.FormActivate(Sender: TObject);
begin
  if (frm_edtCliente.cdLoja<>0) then
    edtLoja.text := form_nz(frm_edtCliente.cdLoja,3);
  if (frm_edtCliente.datacontrato<>StrToDate('01/01/1900')) then
    edtDataContrato.text := DateToStr(frm_edtCliente.datacontrato)
  else
    edtDataContrato.text:=DateToStr(frm_principal.x_data_trabalho);
  if (frm_edtCliente.cdCliente<>0) then
    edtCliente.text := form_nz(frm_edtCliente.cdCliente,6);
  edtLoja.setfocus;
  edtCliente.setfocus;
  btnProc.setfocus;
  if (frm_Edtcliente.Modo=0) then
  begin
    label3.visible:=false;
    edtCliente.visible:=false;
    pnCliente.visible:=false;
    btnProc.top:=112;
    btnCancel.top:=112;
    frm_aux1Contrato.height:=196;
    pnInfo1.visible:=true;
    pnInfo2.visible:=false;
    bevel1.height:=136;
  end
  else
  if (frm_Edtcliente.Modo=2) then
  begin
    label3.visible:=true;
    edtCliente.visible:=true;
    pnCliente.visible:=true;
    btnProc.top:=176;
    btnProc.top:=176;
    frm_aux1Contrato.height:=290;
    pnInfo1.visible:=true;
    pnInfo2.visible:=true;
    bevel1.height:=214;
  end;
  edtLoja.setfocus;
end;

{Fechamento do formulario}
procedure Tfrm_aux1Contrato.SAIR1Click(Sender: TObject);
begin
  close;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.btnProcClick(Sender: TObject);
var
  continua: Boolean;
begin
     {CRITICA AS DATAS}
  if (not IsDate (edtDataContrato.text)) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do contrato',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      edtDataContrato.setfocus;
    except
    end;
    continua:=false;
  end
  else
    continua:=true;

     {...}
  if (continua) then
  begin
    close;
    with (frm_EdtCliente) do
    begin
      if (Trim(frm_aux1Contrato.edtLoja.text)<>'') then
        cdLoja := StrToInt(Trim(frm_aux1Contrato.edtLoja.text))
      else
        cdLoja := 0;
      frm_edtCliente.edtLoja.text:=form_nz(cdLoja,3);
      datacontrato := StrToDate(edtDataContrato.text);
      if (Modo=0) then
        caption := frm_principal.x_sistema+' - '+LB_LANC_CLIE_CONT+' - Loja: '+Trim(pnLoja.caption)+ '  - Data: '+edtDataContrato.text
      else
      if (Modo=2) then
      begin
        codigoInclusaoContrato:=0;
        if (Trim(edtCliente.text)<>'') then
          cdCliente := StrToInt(Trim(edtCliente.text))
        else
          cdCliente := 0;
        caption := frm_principal.x_sistema+' - '+LB_CADASTRO_CONTRAT+' - Loja: '+Trim(pnLoja.caption)+ '  - Data: '+edtDataContrato.text;
      end;
      pnTipoCad3.caption := 'Cliente: '+pnCliente.caption;
    end;
  end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtLojaEnter(Sender: TObject);
begin
  edtLoja.selectall;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtDataContrato.setfocus;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=edtLoja;
      showmodal;
    end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtDataContratoEnter(Sender: TObject);
begin
  edtDataContrato.selectall;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtDataContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    if (frm_edtCliente.Modo=0) then
      btnProc.click
    else
    if (frm_edtCliente.Modo=2) then
      edtCliente.setfocus;
  if (key=38) then
    edtLoja.setfocus;
end;

{Evento ONEXIT do edit da loja}
procedure Tfrm_aux1Contrato.edtLojaExit(Sender: TObject);
var
  clLoja: TClassLoja;
  codigo: String;
begin
  codigo:=Trim(edtLoja.text);
  if (codigo<>'') then
  begin
    clLoja := TClassLoja.Create;
    with (clLoja) do
    begin
      conect ('CREDITO',self);
      AddParam ('Select LO_CODI,LO_NOME ');
      AddParam ('From CRELOJA ');
      AddParam ('Where (LO_CODI='+codigo+')');
      if (not Execute) then
        pnLoja.caption:='<loja nao cadastrada>'
      else
        pnLoja.caption:=Result('LO_NOME');
      edtLoja.text := form_nz (StrToFloat(codigo),3);
      desconect;
      Free;
    end;
  end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.btnCancelClick(Sender: TObject);
begin
  close;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) or (key=K_F10) then
    btnCancel.click;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtDataContratoExit(Sender: TObject);
begin
  if (not IsDate (edtDataContrato.text) and (edtDataContrato.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do contrato',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      edtDataContrato.setfocus;
    except
    end;
  end;
end;

{Duplo clique em cima do edit da loja}
procedure Tfrm_aux1Contrato.edtLojaDblClick(Sender: TObject);
begin
  with (frm_f8Lojas) do
  begin
    left:=287;
    top :=76;
    edit:=edtLoja;
    showmodal;
  end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clClie: TClassCliente;
  codigo: String;
begin
  if (key=K_CIMA) then
    edtDataContrato.setfocus;
  if (key=K_ENTER) then
  begin
    codigo:=Trim(edtCliente.text);
    if (codigo<>'') then
    begin
      clClie := TClassCliente.Create;
      with (clClie) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select CL_CODI,CL_NOME ');
        AddParam ('From CRECLI ');
        AddParam ('Where (CL_CODI='+codigo+')');
        if (not Execute) then
          pnCliente.caption :='<cliente nao encontrado>'
        else
          pnCliente.caption := Result('CL_NOME');
        edtCliente.text:=form_nz (StrtoFloat(Trim(edtCliente.text)),6);
        desconect;
        Free;
      end;
    end;
    btnProc.setfocus;
  end;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtClienteExit(Sender: TObject);
var
  clClie: TClassCliente;
  codigo: String;
begin
  codigo:=Trim(edtCliente.text);
  if (codigo<>'') then
  begin
    clClie := TClassCliente.Create;
    with (clClie) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI,CL_NOME ');
      AddParam ('From CRECLI ');
      AddParam ('Where (CL_CODI='+codigo+')');
      if (not Execute) then
        pnCliente.caption :='<cliente nao encontrado>'
      else
        pnCliente.caption := Result('CL_NOME');
      edtCliente.text:=form_nz (StrtoFloat(Trim(edtCliente.text)),6);
      desconect;
      Free;
    end;
  end;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtClienteEnter(Sender: TObject);
begin
  edtCliente.selectall;
end;

{Navegacao-}
procedure Tfrm_aux1Contrato.edtClienteDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCliente;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

end.
