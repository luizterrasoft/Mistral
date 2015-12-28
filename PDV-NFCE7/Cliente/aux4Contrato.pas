unit aux4Contrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls;

type
  Tfrm_Aux4Contrato = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    edtCpf: TMaskEdit;
    procedure edtCpfEnter(Sender: TObject);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Aux4Contrato: Tfrm_Aux4Contrato;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, contratos, unDialogo, cadcli;

procedure Tfrm_Aux4Contrato.edtCpfEnter(Sender: TObject);
begin
  edtCpf.selectall;
end;

procedure Tfrm_Aux4Contrato.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassContrato;
  cpf: String;
begin
  if (key=K_ENTER) then
    if (frm_principal.x_critica_cnpj) then
    begin
      cpf := Trim(edtCpf.text);
      if (cpf<>'') then
      begin
        if (length(cpf)=11) then
        begin
          if (not IsCPf(cpf)) then
          begin
            frmDialogo.ExibirMensagem (' CPF inválido! '
              ,'CPF',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtCpf.setfocus;
          end
          else
          begin
            clAux:=TClassContrato.Create;
            with (clAux) do
            begin
              conect ('CREDITO',self);
              ClearSql;
              AddParam ('Update CRECLI ');
              AddParam ('Set CL_CPF='+chr(39)+cpf+chr(39)+' ');
              AddParam ('Where CL_CODI='+floattostr(frm_edtCliente.cdCliente)+'');
              Execute;
              desconect;
              Free;
            end;
            frm_Aux4Contrato.close;
          end;
        end
        else
        begin
          if (not IsCgc(cpf)) then
          begin
            frmDialogo.ExibirMensagem (' CGC inválido! '
              ,'Cgc',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtCpf.setfocus;
          end
          else
          begin
            clAux:=TClassContrato.Create;
            with (clAux) do
            begin
              conect ('CREDITO',self);
              ClearSql;
              AddParam ('Update CRECLI ');
              AddParam ('Set CL_CPF='+chr(39)+cpf+chr(39)+' ');
              AddParam ('Where CL_CODI='+floattostr(frm_edtCliente.cdCliente)+'');
              Execute;
              desconect;
              Free;
            end;
            frm_Aux4Contrato.close;
          end;
        end;
      end
      else
      begin
        frmDialogo.ExibirMensagem (' Em plano de cheque o campo CPF/CNPJ não pode ficar vazio! '
          ,'Cpf/Cgc',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtCpf.setfocus;
      end;
    end{...};
end;


end.
