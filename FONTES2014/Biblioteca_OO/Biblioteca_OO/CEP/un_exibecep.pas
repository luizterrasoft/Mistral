unit un_exibecep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls;

type
  Tfrm_ExibeCep = class(TForm)
    btnSim: TSpeedButton;
    btnNao: TSpeedButton;
    lblCep: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblUf: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    exibiu: boolean;
    cep: string; {parametros de ENTRADA}
    endereco,bairro,cidade,uf: string; {parametros de SAIDA}
  end;

var
  frm_ExibeCep: Tfrm_ExibeCep;

implementation

uses principal,auxiliar, unDialogo, procura, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_ExibeCep.FormActivate(Sender: TObject);
var
clAux: TClassAuxiliar;
tipo: string;
begin
     if (not exibiu) then
     begin
          clAux := TClassAuxiliar.Create;
          clAux.conect    ('CEP',self);
          clAux.ClearSql;
          clAux.AddParam  ('SELECT * FROM CEP                      ');
          clAux.AddParam  ('WHERE (CEP='+chr(39)+cep+chr(39)+')  ');
          if (clAux.Execute) then
          begin
               lblCep.caption := 'Endereço do CEP:'+cep;
               if (trim(clAux.result('TIPO'))='RUA') then tipo:='R'
               else if (trim(clAux.result('TIPO'))='AVENIDA') then tipo:='AV'
               else tipo:=trim(clAux.result('TIPO'));
               lblEndereco.caption := clAux.result('TIPO')+' '+
                                      clAux.result('LOGRADOURO');
               lblBairro.caption   := clAux.result('BAIRRO1');
               lblCidade.caption   := clAux.result('CIDADE');
               lblUf.caption       := clAux.result('UF');
          end
          else
          begin
               lblCep.caption      := 'Endereço do CEP:'+cep;
               lblEndereco.caption := '[CEP não encontrado]';
               lblBairro.caption   := '';
               lblCidade.caption   := '';
               lblUf.caption       := '';
               close;
          end;
          clAux.desconect;
          clAux.Free;
          exibiu:=true;
     end;
end;

procedure Tfrm_ExibeCep.btnNaoClick(Sender: TObject);
begin
     close;
end;

procedure Tfrm_ExibeCep.btnSimClick(Sender: TObject);
begin
     if (lblEndereco.caption='[CEP não encontrado]') then
          endereco := ''
     else endereco := lblEndereco.caption;
     bairro   := lblBairro.caption;
     cidade   := lblCidade.caption;
     uf       := lblUf.caption;
     close;
end;

procedure Tfrm_ExibeCep.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) then btnSim.click;
     if (key=K_ESC) then btnNao.click;
end;

end.
