unit un_FechamentoVenda_Adm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask;

type
  Tfrm_FechamentoVenda_Adm = class(TForm)
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
    edtCodAdm: TMaskEdit;
    pnAdm: TPanel;
    Label11: TLabel;
    edtCartao: TMaskEdit;
    Bevel4: TBevel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmDblClick(Sender: TObject);
    procedure edtCodAdmEnter(Sender: TObject);
    procedure edtCodAdmExit(Sender: TObject);
    procedure edtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCartaoEnter(Sender: TObject);
    procedure edtCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    tecla: Integer;
    y_data_compra: TDateTime;
    y_total_financiado: Real;
    y_sequencia_ordem: Integer;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    function IsAdmDebitoAut(codigo: Real):Boolean;
  end;

var
  frm_FechamentoVenda_Adm: Tfrm_FechamentoVenda_Adm;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, un_F8Adm,
  unDialogo;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_Adm.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Adm.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (not JaChamou) then
  begin
    Limparformulrio1.click;
    JaChamou:=true;
  end;
  edtCodAdm.setfocus;
end;

procedure Tfrm_FechamentoVenda_Adm.FocusControle(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_FechamentoVenda_Adm.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_Adm.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Adm.FormCreate(Sender: TObject);
begin
  tecla:=27;
  jaChamou:=false;
end;

procedure Tfrm_FechamentoVenda_Adm.Confirmardados1Click(Sender: TObject);
var
  clAux,clAdm: TClassAuxiliar;
  vencimento: TDateTime;
  incremento,percentual: Real;
  incremento_dias: Integer;
begin
  if (trim(edtCodAdm.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código da Administradora não pode ficar vazio!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (trim(pnAdm.caption)='') then
  begin
    frmDialogo.ExibirMensagem ('A Administradora não se encontra cadastrada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (strtofloat(trim(edtCodAdm.text))=0) then
  begin
    frmDialogo.ExibirMensagem ('O código da Administradora não pode ficar NULO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (trim(edtCartao.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O N. do Cartão de Débito não pode ficar vazio!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  if (not IsAdmDebitoAut(strtofloat(trim(edtCodAdm.text)))) then
  begin
    frmDialogo.ExibirMensagem ('A Administradora não é de DÉBITO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (Pos(';',trim(edtCartao.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o número do cartão de crédito!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  begin
          //Buscando dados das ADMINISTRADORA DE 'CARTAO DE DEBITO'
    clAdm := TClassAuxiliar.Create;
    clAdm.conect   (databaseprodutos,self);
    clAdm.ClearSql;
    clAdm.AddParam ('SELECT AM_DESC,AM_CODI,AM_QTDE,AM_PARM,AM_PDES,                      ');
    clAdm.AddParam ('       AM_TDES,AM_PARC,AL_LOJA,AL_TAXA,AL_DIAS                       ');
    clAdm.AddParam ('FROM   ADMINISTRADORAS,ADMINISTRADORAS_LOJAS                         ');
    clAdm.AddParam ('WHERE (AM_CODI='+trim(edtCodAdm.text)+') AND (AM_CODI=AL_CADM) AND   ');
    clAdm.AddParam ('      (AL_LOJA='+floattostr(frm_principal.x_loja)+') AND             ');
    clAdm.AddParam ('      (AM_TIPO=0)                                                    '); //debito
    if (not clAdm.Execute) then
    begin
      frmDialogo.ExibirMensagem ('Administradora de DÉBITO não cadastrada!'
        ,'Venda',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodAdm.setfocus;
    end
    else
    begin
      vencimento      := y_data_compra; {*}
      incremento      := clAdm.Result('AL_DIAS');
      incremento_dias := trunc(incremento);
      percentual      := clAdm.Result('AL_TAXA');

              {... - GERANDO PARCELA UNICA}
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('VENDAS',self);
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CARTOES_PARCELAS_LOCAL                                                                                                                  ');
      clAux.AddParam ('(PC_LOJA,PC_CAIX,PC_VEND,PC_ORDE,PC_NPAR,PC_VALO,PC_TOTA,PC_TOTJ,PC_STAT,PC_PERJ,PC_VALJ,PC_VENC,PC_DEBI,PC_DBAI,PC_DIAS,PC_PERC)                   ');
      clAux.AddParam ('VALUES                                                                                                                                              ');
      clAux.AddParam ('(:PC_LOJA,:PC_CAIX,:PC_VEND,:PC_ORDE,:PC_NPAR,:PC_VALO,:PC_TOTA,:PC_TOTJ,:PC_STAT,:PC_PERJ,:PC_VALJ,:PC_VENC,:PC_DEBI,:PC_DBAI,:PC_DIAS,:PC_PERC)   ');
      clAux.consulta.parambyname('PC_LOJA').AsFloat    := frm_principal.x_loja;
      clAux.consulta.parambyname('PC_CAIX').AsFloat    := frm_principal.x_terminal;
      clAux.consulta.parambyname('PC_VEND').AsFloat    := frm_principal.x_venda;
      clAux.consulta.parambyname('PC_ORDE').AsInteger  := y_sequencia_ordem;
      clAux.consulta.parambyname('PC_NPAR').AsInteger  := 1;
      clAux.consulta.parambyname('PC_VALO').AsFloat    := y_total_financiado;
      clAux.consulta.parambyname('PC_TOTA').AsFloat    := y_total_financiado;
      clAux.consulta.parambyname('PC_TOTJ').AsFloat    := y_total_financiado;
      clAux.consulta.parambyname('PC_STAT').AsString   := '0'; //em aberto
      clAux.consulta.parambyname('PC_PERJ').AsFloat    := 0.00;
      clAux.consulta.parambyname('PC_VALJ').AsFloat    := 0.00;
      clAux.consulta.parambyname('PC_VENC').AsDateTime := vencimento;
      clAux.consulta.parambyname('PC_DEBI').AsDateTime := vencimento + (incremento);
      clAux.consulta.parambyname('PC_DIAS').AsInteger  := incremento_dias;
      clAux.consulta.parambyname('PC_PERC').AsFloat    := percentual;
      clAux.consulta.parambyname('PC_DBAI').AsDateTime := strtodate('01/01/1900');
      clAux.Execute; {*}
      clAux.desconect;
      clAux.Free;

      tecla:=13;
      close;
    end;
    clAdm.desconect;
    clAdm.Free;
  end;
end;

procedure Tfrm_FechamentoVenda_Adm.Limparformulrio1Click(
  Sender: TObject);
begin
  LimparEdits;
  edtCodAdm.setfocus;
end;

procedure Tfrm_FechamentoVenda_Adm.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_FechamentoVenda_Adm.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    ind:=ind+1;
  end;
  botaoSair.caption:='SAIR';
end;

procedure Tfrm_FechamentoVenda_Adm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_Adm.edtCodAdmDblClick(Sender: TObject);
begin
  with (frm_f8Adm) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodAdm;
    loja:=frm_principal.x_loja;
    tipo:=0; //debito
    RefrescaTabela;
    label2.caption:='Administradoras de Cartão de Débito';
    label12.caption:='Administradoras de Cartão de Débito';
    showmodal;
  end;
end;

procedure Tfrm_FechamentoVenda_Adm.edtCodAdmEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Adm.edtCodAdmExit(Sender: TObject);
var
  codigo: String;
begin
  codigo := Trim(edtCodAdm.text);
  if (codigo<>'') then
    if (strtofloat(codigo)=0) then
      edtCodAdm.setfocus
    else
    begin
      pnAdm.caption := ProcuraNomeAdm(strtofloat(codigo),0,self); //debito
      edtCodAdm.text := form_nz(strtofloat(codigo),3);
    end;
end;

procedure Tfrm_FechamentoVenda_Adm.edtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCartao.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Adm) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodAdm;
      loja:=frm_principal.x_loja;
      tipo:=0; //debito
      RefrescaTabela;
      label2.caption:='Administradoras de Cartão de Débito';
      label12.caption:='Administradoras de Cartão de Débito';
      showmodal;
    end;
end;

procedure Tfrm_FechamentoVenda_Adm.edtCartaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Adm.edtCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    Confirmardados1.click;
  if (key=K_CIMA) then
    edtCodAdm.setfocus;
end;

function Tfrm_FechamentoVenda_Adm.IsAdmDebitoAut(codigo: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    Conect   (databaseprodutos,self);
    AddParam ('Select AM_CODI,AM_DESC                      ');
    AddParam ('From   ADMINISTRADORAS                      ');
    AddParam ('Where (AM_CODI='+floattostr(codigo)+') AND  ');
    AddParam ('      (AM_TIPO='+inttostr(0)+')             '); //debito
    if (not Execute) then
      IsAdmDebitoAut := false
    else
      IsAdmDebitoAut := true;
    desconect;
    Free;
  end;
end;

end.
