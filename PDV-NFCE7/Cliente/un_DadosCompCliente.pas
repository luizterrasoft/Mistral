unit un_DadosCompCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, Mask, StdCtrls, ExtCtrls;

type
  Tfrm_DadosCompCliente = class(Tfrm_Auxformulario1)
    Label1: TLabel;
    Bevel1: TBevel;
    edtComprador1: TMaskEdit;
    edtComissao1: TMaskEdit;
    edtCelular1: TMaskEdit;
    Label28: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtComprador2: TMaskEdit;
    edtCelular2: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtComissao2: TMaskEdit;
    Bevel2: TBevel;
    Label8: TLabel;
    lblEndereco: TLabel;
    edtEndereco: TMaskEdit;
    Label9: TLabel;
    edtBairro: TMaskEdit;
    edtCidade: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    cbEstado: TComboBox;
    edtCep: TMaskEdit;
    Label14: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edtComprador1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtmaskeditformulario1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure edtComprador2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCelular2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtComissao2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    y_cliente: Real;
    flagAchou: Boolean;
  end;

var
  frm_DadosCompCliente: Tfrm_DadosCompCliente;

implementation

uses principal, funcoes1, funcoes2, auxiliar;

{$R *.DFM}

procedure Tfrm_DadosCompCliente.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  inherited;
  if (not flagAchou) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT * FROM CRECLI_COMP ');
    clAux.AddParam('WHERE (CC_CLIE='+floattostr(y_cliente)+')');
    if (clAux.Execute) then
    begin
      edtComprador1.text:=form_t (clAux.result('CC_NCO1'),50);
      edtCelular1.text  :=form_t (clAux.result('CC_TCO1'),15);
      edtComissao1.text :=form_nc(clAux.result('CC_CCO1'),6);
      edtComprador2.text:=form_t (clAux.result('CC_NCO2'),50);
      edtCelular2.text  :=form_t (clAux.result('CC_TCO2'),15);
      edtComissao2.text :=form_nc(clAux.result('CC_CCO2'),6);
               {***}
      edtEndereco.text  :=form_t (clAux.result('CC_ENDC'),50);
      edtBairro.text    :=form_t (clAux.result('CC_BAIC'),40);
      edtCidade.text    :=form_t (clAux.result('CC_CIDC'),30);
      cbEstado.text     :=form_t (clAux.result('CC_ESTC'),2);
      edtCep.text       :=Trim(clAux.result('CC_CEPC'));
    end
    else
    begin
      edtComprador1.text:='';
      edtCelular1.text  :='';
      edtComissao1.text :='';
      edtComprador2.text:='';
      edtCelular2.text  :='';
      edtComissao2.text :='';
               {***}
      edtEndereco.text  :='';
      edtBairro.text    :='';
      edtCidade.text    :='';
      cbEstado.text     :='';
      edtCep.text       :='';
    end;
    clAux.desconect;
    clAux.Free;
    flagAchou:=true;
  end;
  edtComprador1.setfocus;
end;

procedure Tfrm_DadosCompCliente.edtComprador1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCelular1.setfocus;
end;

procedure Tfrm_DadosCompCliente.edtCepKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_CIMA) then
    cbEstado.setfocus;
  if (key=K_ENTER) then
    botao1.click;
end;

procedure Tfrm_DadosCompCliente.edtmaskeditformulario1Exit(
  Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(Sender));
end;

procedure Tfrm_DadosCompCliente.edtmaskeditformulario1KeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(Sender));
end;

procedure Tfrm_DadosCompCliente.FormCreate(Sender: TObject);
begin
  flagAchou:=false;
end;

procedure Tfrm_DadosCompCliente.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {salvamento dos dados}
  clAux := TClassAuxiliar.Create;
  clAux.conect('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam('SELECT * FROM CRECLI_COMP ');
  clAux.AddParam('WHERE (CC_CLIE='+floattostr(y_cliente)+')');
  if (clAux.Execute) then
  begin
    clAux.ClearSql;
    clAux.AddParam('UPDATE CRECLI_COMP       ');
    clAux.AddParam('SET    CC_ENDC=:CC_ENDC, ');
    clAux.AddParam('       CC_BAIC=:CC_BAIC, ');
    clAux.AddParam('       CC_CIDC=:CC_CIDC, ');
    clAux.AddParam('       CC_ESTC=:CC_ESTC, ');
    clAux.AddParam('       CC_CEPC=:CC_CEPC, ');
    clAux.AddParam('       CC_NCO1=:CC_NCO1, ');
    clAux.AddParam('       CC_TCO1=:CC_TCO1, ');
    clAux.AddParam('       CC_CCO1=:CC_CCO1, ');
    clAux.AddParam('       CC_NCO2=:CC_NCO2, ');
    clAux.AddParam('       CC_TCO2=:CC_TCO2, ');
    clAux.AddParam('       CC_CCO2=:CC_CCO2, ');
    clAux.AddParam('       CC_TIME=:CC_TIME  ');
    clAux.AddParam('WHERE (CC_CLIE='+floattostr(y_cliente)+') ');
    clAux.consulta.parambyname('CC_ENDC').AsString := Trim(edtEndereco.text);
    clAux.consulta.parambyname('CC_BAIC').AsString := Trim(edtBairro.text);
    clAux.consulta.parambyname('CC_CIDC').AsString := Trim(edtCidade.text);
    clAux.consulta.parambyname('CC_ESTC').AsString := Trim(cbEstado.text);
    clAux.consulta.parambyname('CC_CEPC').AsString := Trim(edtCep.text);
    clAux.consulta.parambyname('CC_NCO1').AsString := Trim(edtComprador1.text);
    clAux.consulta.parambyname('CC_TCO1').AsString := Trim(edtCelular1.text);
    clAux.consulta.parambyname('CC_CCO1').Asfloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtComissao1.text)));
    clAux.consulta.parambyname('CC_NCO2').AsString := Trim(edtComprador2.text);
    clAux.consulta.parambyname('CC_TCO2').AsString := Trim(edtCelular2.text);
    clAux.consulta.parambyname('CC_CCO2').Asfloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtComissao2.text)));
    clAux.consulta.parambyname('CC_TIME').AsDateTime := frm_principal.x_data_trabalho;
    clAux.Execute;
  end
  else
  begin
    clAux.ClearSql;
    clAux.AddParam('INSERT INTO CRECLI_COMP(CC_CLIE,CC_ENDC,CC_BAIC,CC_CIDC,CC_ESTC,CC_CEPC,          ');
    clAux.AddParam('                        CC_NCO1,CC_TCO1,CC_CCO1,CC_NCO2,CC_TCO2,CC_CCO2,CC_TIME)  ');
    clAux.AddParam('VALUES (:CC_CLIE,:CC_ENDC,:CC_BAIC,:CC_CIDC,:CC_ESTC,:CC_CEPC,                    ');
    clAux.AddParam('        :CC_NCO1,:CC_TCO1,:CC_CCO1,:CC_NCO2,:CC_TCO2,:CC_CCO2,:CC_TIME)           ');
    clAux.consulta.parambyname('CC_CLIE').AsFloat  := y_cliente;
    clAux.consulta.parambyname('CC_ENDC').AsString := Trim(edtEndereco.text);
    clAux.consulta.parambyname('CC_BAIC').AsString := Trim(edtBairro.text);
    clAux.consulta.parambyname('CC_CIDC').AsString := Trim(edtCidade.text);
    clAux.consulta.parambyname('CC_ESTC').AsString := Trim(cbEstado.text);
    clAux.consulta.parambyname('CC_CEPC').AsString := Trim(edtCep.text);
    clAux.consulta.parambyname('CC_NCO1').AsString := Trim(edtComprador1.text);
    clAux.consulta.parambyname('CC_TCO1').AsString := Trim(edtCelular1.text);
    clAux.consulta.parambyname('CC_CCO1').Asfloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtComissao1.text)));
    clAux.consulta.parambyname('CC_NCO2').AsString := Trim(edtComprador2.text);
    clAux.consulta.parambyname('CC_TCO2').AsString := Trim(edtCelular2.text);
    clAux.consulta.parambyname('CC_CCO2').AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(edtComissao2.text)));
    clAux.consulta.parambyname('CC_TIME').AsDateTime := frm_principal.x_data_trabalho;
    clAux.Execute;
  end;
  clAux.desconect;
  clAux.Free;
  close;
end;

procedure Tfrm_DadosCompCliente.botao1Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_DadosCompCliente.edtComprador2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCelular2.SetFocus;
  if (key=K_CIMA) then
    edtComissao1.SetFocus;
end;

procedure Tfrm_DadosCompCliente.edtCelular2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtComissao2.SetFocus;
  if (key=K_CIMA) then
    edtComprador2.SetFocus;
end;

procedure Tfrm_DadosCompCliente.edtComissao2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtEndereco.SetFocus;
  if (key=K_CIMA) then
    edtCelular2.SetFocus;
end;

procedure Tfrm_DadosCompCliente.edtEnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtBairro.SetFocus;
  if (key=K_CIMA) then
    edtComissao2.SetFocus;
end;

procedure Tfrm_DadosCompCliente.edtBairroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCidade.SetFocus;
  if (key=K_CIMA) then
    edtEndereco.SetFocus;
end;

procedure Tfrm_DadosCompCliente.edtCidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) or (key=K_BAIXO) then
    cbEstado.SetFocus;
  if (key=K_CIMA) then
    edtBairro.SetFocus;
end;

procedure Tfrm_DadosCompCliente.cbEstadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key=K_ENTER) then
    edtCEP.SetFocus;
end;

end.
