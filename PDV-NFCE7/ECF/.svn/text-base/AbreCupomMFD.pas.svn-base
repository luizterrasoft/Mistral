unit AbreCupomMFD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, BotaoSair, Buttons, Menus;

type
  Tfrm_AbreCupomMFD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtcliente: TEdit;
    edtnome: TEdit;
    edtendereco: TEdit;
    BitBtnCmdOK: TBitBtn;
    BotaoSair1: TBotaoSair;
    Label6: TLabel;
    edtbairro: TEdit;
    Label8: TLabel;
    edtuf: TEdit;
    Label4: TLabel;
    edtinsc: TEdit;
    Label5: TLabel;
    edtcep: TEdit;
    Label7: TLabel;
    edtcidade: TEdit;
    edtcpfcnpj: TEdit;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmardados1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Confirma1: TMenuItem;
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnCmdOKClick(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtinscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtenderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtbairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtufKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcpfcnpjExit(Sender: TObject);
    procedure edtcpfcnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtclienteExit(Sender: TObject);
    procedure Confirma2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Confirma1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AbreCupomMFD: Tfrm_AbreCupomMFD;

implementation

uses Principal, un_FechamentoVenda,funcoes1, Funcoes2, procura, auxiliar,
  f8Clientes;

{$R *.DFM}

procedure Tfrm_AbreCupomMFD.cmdOKClick(Sender: TObject);
begin
  frm_FechamentoVenda.y_cgc := edtcpfcnpj.Text;
  frm_FechamentoVenda.y_nome := edtnome.Text;
  frm_FechamentoVenda.y_endereco := edtendereco.Text;
  frm_FechamentoVenda.y_insc := edtinsc.Text;
  frm_FechamentoVenda.y_bairro := edtbairro.Text;
  frm_FechamentoVenda.y_cep := edtcep.Text;
  frm_FechamentoVenda.y_uf := edtuf.Text;
  frm_FechamentoVenda.y_cidade := edtcidade.Text;
  Close;
end;

procedure Tfrm_AbreCupomMFD.cmdCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_AbreCupomMFD.FormActivate(Sender: TObject);
begin
  edtcpfcnpj.Text := '';
  edtinsc.Text := '';
  edtendereco.Text := '';
  edtbairro.Text := '';
  edtuf.Text := 'RJ';
  edtcep.Text := '';
  edtcidade.Text := 'Rio de Janeiro';
  edtcpfcnpj.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.BitBtnCmdOKClick(Sender: TObject);
begin
  frm_FechamentoVenda.y_cgc := edtcpfcnpj.Text;
  frm_FechamentoVenda.y_nome := edtnome.Text;
  frm_FechamentoVenda.y_endereco := edtendereco.Text;
  frm_FechamentoVenda.y_insc := edtinsc.Text;
  frm_FechamentoVenda.y_bairro := edtbairro.Text;
  frm_FechamentoVenda.y_cep := edtcep.Text;
  frm_FechamentoVenda.y_uf := edtuf.Text;
  frm_FechamentoVenda.y_cidade := edtcidade.Text;
  frm_FechamentoVenda.Memo2.Lines.Clear;
  frm_FechamentoVenda.Memo2.Lines.Add('------------------------------------------------');
  frm_FechamentoVenda.Memo2.Lines.Add(trim(edtnome.Text));
  frm_FechamentoVenda.Memo2.Lines.Add(trim(edtendereco.Text));
  if (Trim(edtbairro.Text)<>'') and (trim(edtuf.Text)<>'') then
    frm_FechamentoVenda.Memo2.Lines.Add(form_t(edtbairro.Text,36)+'       UF:'+edtuf.Text)
  else
  if (Trim(edtbairro.Text)<>'') and (trim(edtuf.Text)='') then
    frm_FechamentoVenda.Memo2.Lines.Add(edtbairro.Text);
  if (Trim(edtcidade.Text)<>'') and (Trim(edtcep.Text)<>'') then
    frm_FechamentoVenda.Memo2.Lines.Add(form_t(edtcidade.Text,35)+'CEP:'+Trim(edtcep.Text))
  else
  if (Trim(edtcidade.Text)<>'') and (Trim(edtcep.Text)='') then
    frm_FechamentoVenda.Memo2.Lines.Add(edtcidade.Text);

  if (trim(edtcpfcnpj.Text)<>'') and (trim(edtinsc.Text)<>'') then
    frm_FechamentoVenda.Memo2.Lines.Add(form_t(edtcpfcnpj.Text,34)+'IE:'+trim(edtinsc.Text))
  else
  if (trim(edtcpfcnpj.Text)<>'') and (trim(edtinsc.Text)='') then
    frm_FechamentoVenda.Memo2.Lines.Add(trim(edtcpfcnpj.Text));
  frm_FechamentoVenda.Memo2.Lines.Add('Vendedor: '+form_nz(frm_principal.x_vendedor,6)+'/'+
    form_t(ProcuraNomeVend(frm_principal.x_loja,frm_principal.x_vendedor,self),30));
  frm_FechamentoVenda.Memo2.Lines.Add('------------------------------------------------');
  Close;
end;

procedure Tfrm_AbreCupomMFD.BotaoSair1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_AbreCupomMFD.edtinscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtnome.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtnomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtendereco.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtenderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtbairro.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtbairroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtuf.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtufKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtcidade.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtcidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtcep.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtcepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    BitBtnCmdOK.SetFocus;
end;

procedure Tfrm_AbreCupomMFD.edtcpfcnpjExit(Sender: TObject);
var
  cnpj:String;
begin
  cnpj:=Trim(edtcpfcnpj.Text);
  if (Length(cnpj)=11) then
  begin
    cnpj := ExibeCpf (cnpj);
    edtcpfcnpj.text:=cnpj;
    Label4.Caption := 'Identidade';
  end
  else
  begin
    cnpj := ExibeCgc (cnpj);
    edtcpfcnpj.Text:=cnpj;
    Label4.Caption := 'Insc. Estadual';
  end;
end;

procedure Tfrm_AbreCupomMFD.edtcpfcnpjKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtinsc.SetFocus;
  if (key=K_F8) then
  begin
    with (frm_f8Clientes) do
    begin
      edit:=edtCliente;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
    edtcliente.SetFocus;
    edtcpfcnpj.SetFocus;
  end;

end;

procedure Tfrm_AbreCupomMFD.edtclienteExit(Sender: TObject);
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
    clAux.AddParam ('SELECT CL_CODI,CL_NOME,CL_IDEN,CL_ENDE,CL_BAIR,');
    clAux.AddParam ('       CL_ESTA,CL_CIDA,CL_CEP,CL_CPF           ');
    clAux.AddParam ('FROM   CRECLI                                  ');
    clAux.AddParam ('WHERE (CL_CODI='+codigo+')                     ');
    if (clAux.Execute) then
    begin
      edtnome.text := clAux.result('CL_NOME');
      edtcpfcnpj.text  := clAux.result('CL_CPF');
      edtinsc.Text := clAux.result('CL_IDEN');
      edtendereco.Text := Copy(ClAux.Result('CL_ENDE'),1,30);
      edtbairro.Text := ClAux.Result('CL_BAIR');
      edtuf.Text := ClAux.Result('CL_ESTA');
      edtcidade.Text := ClAux.Result('CL_CIDA');
      if (Trim(ClAux.Result('CL_CEP'))<>'') then
        edtcep.Text := Copy(ClAux.Result('CL_CEP'),1,5)+'-'+
          Copy(ClAux.Result('CL_CEP'),6,3);
    end;
    ClAux.Desconect;
    ClAux.Free;
  end;

end;

procedure Tfrm_AbreCupomMFD.Confirma2Click(Sender: TObject);
begin
  BitBtnCmdOK.Click;
end;

procedure Tfrm_AbreCupomMFD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;

end;

procedure Tfrm_AbreCupomMFD.Confirma1Click(Sender: TObject);
begin
  BitBtnCmdOK.Click;
end;

procedure Tfrm_AbreCupomMFD.Sair2Click(Sender: TObject);
begin
  Close;
end;

end.
