unit un_VerEstoqueLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls;

type
  Tfrm_VerEstoqueLoja = class(TForm)
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
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    tipz: String;
  end;

var
  frm_VerEstoqueLoja: Tfrm_VerEstoqueLoja;

implementation

{$R *.DFM}

uses principal, funcoes1, funcoes2, procura, auxiliar;

procedure Tfrm_VerEstoqueLoja.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VerEstoqueLoja.Panel8Click(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_VerEstoqueLoja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_VerEstoqueLoja.FormActivate(Sender: TObject);
var
  clAux,clAux2: TClassAuxiliar;
begin
     {Exibindo o titulo selecionado no formulario anterior ****}
  if (n_grupo<>0) and (n_subgrupo<>0)
    and (n_produto<>0) and (n_loja<>0) and (n_cor<>-1) and (n_tam<>'-1') then
  begin
    Memo1.lines.Clear;
    clAux := TClassAuxiliar.Create;
    clAux.conect ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('Select * From ESTOQUE_LOJA ');
    clAux.AddParam ('Where (EL_GRUP='+floattostr(n_grupo)+') AND ');
    clAux.AddParam ('      (EL_SUBG='+floattostr(n_subgrupo)+') AND ');
    clAux.AddParam ('      (EL_PROD='+floattostr(n_produto)+') AND ');
    clAux.AddParam ('      (EL_LOJA='+floattostr(n_loja)+') AND ');
    clAux.AddParam ('      (EL_CORE='+floattostr(n_cor)+') AND ');
    clAux.AddParam ('      (EL_TAMA='+chr(39)+n_tam+chr(39)+')     ');
    if (clAux.Execute) then
    begin
      Memo1.lines.Add ('');
      Memo1.lines.Add (' Código do grupo.......: '+form_nz(clAux.result('EL_GRUP'),3)+'/'+
        ProcuraNomeGruposProdutos(clAux.result('EL_GRUP'),self));
      Memo1.lines.Add (' Código do subgrupo....: '+form_nz(clAux.result('EL_SUBG'),3)+'/'+
        ProcuraNomeSubgruposProdutos(clAux.result('EL_GRUP'),
        clAux.result('EL_SUBG'),self));
      Memo1.lines.Add (' Código do produto.....: '+form_nz(clAux.result('EL_PROD'),6));
      if (clAux.result('EL_CORE')=0) then
        Memo1.lines.Add (' Cor...................: ÚNICA')
      else
        Memo1.lines.Add (' Cor...................: '+form_nz(clAux.result('EL_CORE'),2)+'/'+
          ProcuraNomeCor(clAux.result('EL_CORE'),self));
      if (clAux.result('EL_TAMA')='0') then
        Memo1.lines.Add (' Tamanho...............: ÚNICO')
      else
        Memo1.lines.Add (' Tamanho...............: '+clAux.result('EL_TAMA'));

               {Dados do item do produto}
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect ('ESTOQUE',self);
      clAux2.ClearSql;
      clAux2.AddParam ('Select ES_DESC,ES_REFF,ES_CBAR ');
      clAux2.AddParam ('From   ESTOQUE ');
      clAux2.AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND ');
      clAux2.AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux2.AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND ');
      clAux2.AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      clAux2.AddParam ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+')     ');
      clAux2.Execute;
      Memo1.lines.Add ('');
      Memo1.lines.Add (' ---------------------------------------------------------- ');
      Memo1.lines.Add (' Descrição do item.....: '+clAux2.result('ES_DESC'));
      Memo1.lines.Add (' Ref. do fabricante....: '+clAux2.result('ES_REFF'));
      Memo1.lines.Add (' Codigo de barras......: '+clAux2.result('ES_CBAR'));
      clAux2.desconect;
      clAux2.Free;

               {...}
      Memo1.lines.Add ('');
      Memo1.lines.Add (' ---------------------------------------------------------- ');
      Memo1.lines.Add (' Loja...: '+form_nz(clAux.Result('EL_LOJA'),2)+'/'+
        ProcuraNomeLoja(clAux.Result('EL_LOJA'),self));
      Memo1.lines.Add (' ---------------------------------------------------------- ');
      if (tipz='1') then
      begin
        Memo1.lines.Add (' Qdte..................: '+form_n   (clAux.result('EL_QTD1'),10));
        Memo1.lines.Add (' Preço de venda........: '+form_nc  (clAux.result('EL_PVE1'),10));
        Memo1.lines.Add (' Preço custo/médio.....: '+form_nc2 (clAux.result('EL_PCU1'),10,3));
      end
      else
      if (tipz='2') then
      begin
        Memo1.lines.Add (' Qdte.02...............: '+form_n   (clAux.result('EL_QTD2'),10));
        Memo1.lines.Add (' Preço de venda.02.....: '+form_nc  (clAux.result('EL_PVE2'),10));
        Memo1.lines.Add (' Preço custo/médio.02..: '+form_nc2 (clAux.result('EL_PCU2'),10,3));
      end;
    end
    else
      Memo1.lines.Add ('<Item de estoque não localizado>');
    clAux.desconect;
    clAux.Free;
  end;
end;

end.
