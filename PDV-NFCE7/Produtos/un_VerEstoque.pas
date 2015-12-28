unit un_VerEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls;

type
  Tfrm_VerEstoque = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    Panel1: TPanel;
    Panel8: TPanel;
    procedure SAIR1Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_cor: Real;
    n_tam: String;
  end;

var
  frm_VerEstoque: Tfrm_VerEstoque;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar;

procedure Tfrm_VerEstoque.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VerEstoque.Panel8Click(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_VerEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_VerEstoque.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {Exibindo o titulo selecionado no formulario anterior ****}
  if (n_grupo<>0) and (n_subgrupo<>0)
    and (n_produto<>0) and (n_cor<>-1) and (n_tam<>'-1') then
  begin
    Memo1.lines.Clear;
    clAux := TClassAuxiliar.Create;
    clAux.conect ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('Select * From ESTOQUE ');
    clAux.AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND ');
    clAux.AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
    clAux.AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND ');
    clAux.AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
    clAux.AddParam ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+')     ');
    if (clAux.Execute) then
    begin
      Memo1.lines.Add ('');
      Memo1.lines.Add (' Código do grupo.......: '+form_nz(clAux.result('ES_GRUP'),3)+'/'+
        ProcuraNomeGruposProdutos(clAux.result('ES_GRUP'),self));
      Memo1.lines.Add (' Código do subgrupo....: '+form_nz(clAux.result('ES_SUBG'),3)+'/'+
        ProcuraNomeSubgruposProdutos(clAux.result('ES_GRUP'),
        clAux.result('ES_SUBG'),self));
      Memo1.lines.Add (' Código do produto.....: '+form_nz(clAux.result('ES_PROD'),6));
      if (clAux.result('ES_CORE')=0) then
        Memo1.lines.Add (' Cor...................: ÚNICA')
      else
        Memo1.lines.Add (' Cor...................: '+form_nz(clAux.result('ES_CORE'),2)+'/'+
          ProcuraNomeCor(clAux.result('ES_CORE'),self));
      if (clAux.result('ES_TAMA')='0') then
        Memo1.lines.Add (' Tamanho...............: ÚNICO')
      else
        Memo1.lines.Add (' Tamanho...............: '+clAux.result('ES_TAMA'));
      Memo1.lines.Add (' ------------------------------------------');
      Memo1.lines.Add (' Descrição do item.....: '+clAux.result('ES_DESC'));
      Memo1.lines.Add (' Ref. fabricante.......: '+clAux.result('ES_REFF'));
      Memo1.lines.Add (' Código de barras......: '+clAux.result('ES_CBAR'));
    end
    else
      Memo1.lines.Add ('<Item não localizado>');
    clAux.desconect;
    clAux.Free;
  end;
end;

end.
