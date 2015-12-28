unit un_FechamentoVenda_Vales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask, LabelOO;

type
  Tfrm_FechamentoVenda_Vales = class(TForm)
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
    edtNumero: TMaskEdit;
    Label11: TLabel;
    edtValor: TMaskEdit;
    Bevel4: TBevel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblvalidade: TLabelOO;
    cblista: TComboBox;
    Label8: TLabel;
    edtnomecliente: TMaskEdit;
    edttelefone: TMaskEdit;
    edtcliente: TEdit;
    edtcpfcnpj: TMaskEdit;
    Label9: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure listaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcpfcnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnomeclienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edttelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cblistaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcpfcnpjEnter(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtclienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    jaChamou: Boolean;
    tecla: Integer;
    y_numero: String;
    y_valor: Real;
    y_tipo_vale: String;
    y_forma_pagamento: Real; //INDICA SE É VALE 'EMITIDO' OU 'RECEBIDO'
    y_cpfcnpj,y_cliente,y_telefone: String;
    cnpj:String;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
  end;

var
  frm_FechamentoVenda_Vales: Tfrm_FechamentoVenda_Vales;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, un_F8Adm,
  unDialogo, un_FechamentoVenda_Adm, un_LancaVenda, f8Clientes,
  un_FechamentoVenda;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_Vales.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Vales.FormActivate(Sender: TObject);
begin
  edtValor.SelectAll;
  if (not JaChamou) then
  begin
    if (y_forma_pagamento=KFPGT_VALES) then //RECEBIDO
    begin
      frm_FechamentoVenda_Vales.Caption := 'Vale Recebido';
      Label2.caption  := '[Dados Relativos ao Vale Recebido]';
      Label12.caption := '[Dados Relativos ao Vale Recebido]';
      cblista.Items.Add('Presente');
      cblista.Items.Add('Simples');
      cblista.Items.Add('Troco');
      cblista.Items.Add('Desconto');
      cblista.Items.Add('Brinde');
      cblista.Items.Add('Bônus');
      cblista.Items.Add('Troca');
      cblista.Items.Add('Devolução');
      cblista.ItemIndex := 1;
    end
    else
    if (y_forma_pagamento=KFPGT_VALES_EMI) then //EMITIDO
    begin
      frm_FechamentoVenda_Vales.Caption := 'Vale Emitido';
      Label2.caption  := '[Dados Relativos ao Vale Emitido]';
      Label12.caption := '[Dados Relativos ao Vale Emitido]';
      cblista.Items.Add('Troca');
      cblista.Items.Add('Devolução');
      cblista.ItemIndex := 0;
    end;
    Limparformulrio1.click;
    edtValor.text := trim(form_nc(y_valor,10));
    JaChamou:=true;
  end;
  edtNumero.setfocus;
end;

procedure Tfrm_FechamentoVenda_Vales.FocusControle(controle: TWinControl; direcao: Boolean);
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

procedure Tfrm_FechamentoVenda_Vales.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_Vales.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Vales.FormCreate(Sender: TObject);
begin
  tecla:=27;
  jaChamou:=false;
end;

procedure Tfrm_FechamentoVenda_Vales.Confirmardados1Click(
  Sender: TObject);
var
  ClAux: TClassAuxiliar;
  Continua: Boolean;
begin
  Continua := true;
  if (trim(edtNumero.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O Nº do vale não pode ficar vazio!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero.setfocus;
    Continua := false;
  end
  else
    Continua := true;
  if (trim(edtValor.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O valor do Vale não pode ficar NULO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValor.setfocus;
    Continua := false;
  end
  else
    Continua := true;
  ClAux := TClassAuxiliar.Create;
  ClAux.conect   (databaseprodutos,self);
  ClAux.ClearSql;
  ClAux.AddParam ('Select VE_NUME,VF_FPGT From VALES_RECEBIDOS,VENDAS_FORMA_PAGAMENTO       ');
  ClAux.AddParam ('Where (VE_CAIX=VF_CAIX) AND (VE_LOJA=VF_LOJA) AND (VE_VEND=VF_VEND) AND  ');
  ClAux.AddParam ('(VE_NUME=:NUME) AND (VE_LOJA=:VE_LOJA) AND (VF_FPGT=:VF_FPGT)         ');
  ClAux.consulta.ParamByName('NUME').AsString := trim(edtNumero.Text);
  ClAux.consulta.ParamByName('VE_LOJA').AsFloat := frm_principal.x_loja;
  if (y_forma_pagamento=KFPGT_VALES) then //RECEBIDO
    ClAux.consulta.ParamByName('VF_FPGT').AsFloat:= 6
  else
  if (y_forma_pagamento=KFPGT_VALES_EMI) then //EMITIDO
    ClAux.consulta.ParamByName('VF_FPGT').AsFloat:= 7;
  if (ClAux.Execute) then
  begin
    frmDialogo.ExibirMensagem ('Nº do vale já cadastrado!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero.setfocus;
    Continua := false;
  end
  else
    Continua := true;
  if (Continua) then
  begin
    frmDialogo.posativ:=1;
    if (frmDialogo.ExibirMensagem ('Confirma o lançamento do Vale?'
      ,'Venda',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',380,300)=mrYes) then
    begin
      if (y_forma_pagamento=KFPGT_VALES) then //RECEBIDO
      begin
        if (cblista.itemindex=0) then
          y_tipo_vale:='P'
        else
        if (cblista.itemindex=1) then
          y_tipo_vale:='S'
        else
        if (cblista.itemindex=2) then
          y_tipo_vale:='T'
        else
        if (cblista.itemindex=3) then
          y_tipo_vale:='D'
        else
        if (cblista.itemindex=4) then
          y_tipo_vale:='B'
        else
        if (cblista.itemindex=5) then
          y_tipo_vale:='O'
        else
        if (cblista.itemindex=6) then
          y_tipo_vale:='R'
        else
        if (cblista.itemindex=7) then
          y_tipo_vale:='V';
      end
      else
      if (y_forma_pagamento=KFPGT_VALES_EMI) then //EMITIDO
        if (cblista.itemindex=0) then
          y_tipo_vale:='R'
        else
        if (cblista.itemindex=1) then
          y_tipo_vale:='V';
      y_numero := trim(edtNumero.text);
      y_valor  := strtofloat(RetiraFormatacaoNumero(trim(edtValor.text)));
      y_cpfcnpj := Trim(edtcpfcnpj.Text);
      y_cliente := Trim(Copy(edtnomecliente.Text,1,30));
      y_telefone := Trim(edttelefone.Text);
      tecla:=13;
      close;
    end;
  end;
end;

procedure Tfrm_FechamentoVenda_Vales.Limparformulrio1Click(
  Sender: TObject);
begin
  LimparEdits;
  edtNumero.setfocus;
end;

procedure Tfrm_FechamentoVenda_Vales.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_FechamentoVenda_Vales.GetTabOrderList(Lista);
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

procedure Tfrm_FechamentoVenda_Vales.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_Vales.edtNumeroEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Vales.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtcpfcnpj.setfocus;
  if (key=K_CIMA) then
  ;
end;

procedure Tfrm_FechamentoVenda_Vales.edtValorEnter(Sender: TObject);
begin
  if (trim(edtValor.text)='') then
    edtValor.text := trim(form_nc(y_valor,10));
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Vales.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtNumero.SetFocus;
     //if (key=K_CIMA) then edtNumero.setfocus;
end;

procedure Tfrm_FechamentoVenda_Vales.listaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao1Click(botao1);
end;

procedure Tfrm_FechamentoVenda_Vales.edtcpfcnpjKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtcliente.SetFocus;
  if (key=K_CIMA) then
    edtValor.setfocus;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtcpfcnpj;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;

end;

procedure Tfrm_FechamentoVenda_Vales.edtnomeclienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    cblista.SetFocus;
  if (key=K_CIMA) then
    edtcpfcnpj.setfocus;

end;

procedure Tfrm_FechamentoVenda_Vales.edttelefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    botao1.SetFocus;
  if (key=K_CIMA) then
    cblista.setfocus;
end;

procedure Tfrm_FechamentoVenda_Vales.cblistaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edttelefone.SetFocus;
end;

procedure Tfrm_FechamentoVenda_Vales.edtcpfcnpjEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Vales.MaskEdit1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Vales.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtnomecliente.SetFocus;
  if (key=K_CIMA) then
    edtNumero.setfocus;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtcliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
      edtcliente.SetFocus;
      edtcpfcnpj.SetFocus;
    end;

end;

procedure Tfrm_FechamentoVenda_Vales.edtclienteExit(Sender: TObject);
var
  ClAux: TClassAuxiliar;
  codigo: String;
begin
         {exibindo dados do cliente}
  codigo := Trim(edtCliente.text);
  if (codigo<>'') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecredito,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT CL_CODI,CL_NOME,CL_CPF,CL_FONE      ');
    clAux.AddParam ('FROM   CRECLI                              ');
    clAux.AddParam ('WHERE (CL_CODI='+codigo+')                 ');
    if (clAux.Execute) then
    begin
      edtnomecliente.text := clAux.result('CL_NOME');
      edtcpfcnpj.text  := clAux.result('CL_CPF');
      edttelefone.Text := ClAux.Result('CL_FONE');
    end;
    ClAux.Desconect;
    ClAux.Free;
  end;

end;

end.
