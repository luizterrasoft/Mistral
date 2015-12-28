unit un_VisaoPrecosPraticados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO, Grids, GridControl,
  GridSql,funcoesglobais;

type
  Tfrm_VisaoPrecosPraticados = class(TForm)
    BotaoSair1: TBotaoSair;
    LabelOO1: TLabelOO;
    lblDescricao1: TLabelOO;
    Bevel1: TBevel;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    LabelOO5: TLabelOO;
    LabelOO6: TLabelOO;
    lblPrecoPrincipal: TLabelOO;
    lblPrecoDiferenciado: TLabelOO;
    lblPrecoPromocional: TLabelOO;
    Bevel2: TBevel;
    Bevel3: TBevel;
    LabelOO2: TLabelOO;
    lblDescricao2: TLabelOO;
    Memo1: TGridSql;
    LabelOO7: TLabelOO;
    lblPrecoPrincipalant: TLabelOO;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure Memo1GetCellColor(Sender: TObject; ARow, Acol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: Boolean;
    y_grupo,y_subgrupo,y_produto: Real;
    y_cor: Real;
    y_tamanho: String;
  end;

var
  frm_VisaoPrecosPraticados: Tfrm_VisaoPrecosPraticados;

implementation

uses principal, auxiliar, funcoes1, funcoes2;

{$R *.dfm}

procedure Tfrm_VisaoPrecosPraticados.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_VisaoPrecosPraticados.FormCreate(Sender: TObject);
begin
  ativou     := false;

  y_grupo    := 0;
  y_subgrupo := 0;
  y_produto  := 0;
  y_cor      := 0;
  y_tamanho  := '-1';
  memo1.colwidths[1] := -1;
  memo1.colwidths[2] := -1;
end;

procedure Tfrm_VisaoPrecosPraticados.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (not ativou) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT ES_DESC,ES_PVE1 FROM ESTOQUE          ');
    clAux.AddParam ('WHERE (ES_GRUP=:grupo) AND                   ');
    clAux.AddParam ('      (ES_SUBG=:subgrupo) AND                ');
    clAux.AddParam ('      (ES_PROD=:produto) AND                 ');
    clAux.AddParam ('      (ES_CORE=:cor) AND                     ');
    clAux.AddParam ('      (ES_TAMA=:tamanho)                     ');
    clAux.consulta.parambyname('grupo').AsFloat    := y_grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := y_subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := y_produto;
    clAux.consulta.parambyname('cor').AsFloat      := y_cor;
    clAux.consulta.parambyname('tamanho').AsString := y_tamanho;
    if (clAux.Execute) then
    begin
      lblDescricao1.caption     := Copy(clAux.result('ES_DESC'),1,50);
      lblDescricao2.caption     := Copy(clAux.result('ES_DESC'),51,80);
      lblPrecoPrincipal.caption := form_nc(clAux.result('ES_PVE1'),10);
    end;
    clAux.desconect;
    clAux.Free;
//if (frm_principal.x_online) then
//begin
//Marcio-------------------------------------------------------------------
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT PRECO,NOVOPRECO FROM HISTORICO_PRECOS ');
    clAux.AddParam ('WHERE (GRUPO=:grupo) AND                   ');
    clAux.AddParam ('      (SUBGRUPO=:subgrupo) AND                ');
    clAux.AddParam ('      (PRODUTO=:produto) AND                ');
    clAux.AddParam ('      (COR=:cor) AND                     ');
    clAux.AddParam ('      (TAMANHO=:tamanho)                     ');
    clAux.AddParam ('Order by data                                ');
    clAux.consulta.parambyname('grupo').AsFloat    := y_grupo;
    clAux.consulta.parambyname('subgrupo').AsFloat := y_subgrupo;
    clAux.consulta.parambyname('produto').AsFloat  := y_produto;
    clAux.consulta.parambyname('cor').AsFloat      := y_cor;
    clAux.consulta.parambyname('tamanho').AsString := y_tamanho;
    if (clAux.Execute) then
    begin
      clAux.Last;
      lblPrecoPrincipalant.caption := form_nc(clAux.result('PRECO'),10)
    end
    else
      lblPrecoPrincipalant.caption := 'N/EXISTE';
    clAux.desconect;
    clAux.Free;

//Marcio-------------------------------------------------------------------
//end else lblPrecoPrincipalant.caption := 'N/EXISTE';

          {...}
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('Select IP_PRE1                                                                 ');
    clAux.AddParam ('From   ITENS_TABELAS_PRECOS                                                    ');
    clAux.AddParam ('Where (IP_LOJA='+floattostr(frm_principal.x_loja)+') AND                       ');
    clAux.AddParam ('      (IP_GRUP='+floattostr(y_grupo)+') AND                                    ');
    clAux.AddParam ('      (IP_SUBG='+floattostr(y_subgrupo)+') AND                                 ');
    clAux.AddParam ('      (IP_PROD='+floattostr(y_produto)+') AND                                  ');
    clAux.AddParam ('      (IP_CORE='+floattostr(y_cor)+') AND                                      ');
    clAux.AddParam ('      (IP_TAMA='+chr(39)+y_tamanho+chr(39)+') AND                              ');
    clAux.AddParam ('      (IP_TABE=1)                                                              ');
    if (clAux.Execute) then
      lblPrecoDiferenciado.caption := form_nc(clAux.result('IP_PRE1'),10)
    else
      lblPrecoDiferenciado.caption := 'N/EXISTE';
    clAux.desconect;
    clAux.Free;

          {...}
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select PP_PRE1                                                                               ');
    clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                                   ');
    clAux.AddParam ('Where (PP_LOJA='+floattostr(frm_principal.x_loja)+') AND                                     ');
    clAux.AddParam ('      (PP_GRUP='+floattostr(y_grupo)+') AND                                                  ');
    clAux.AddParam ('      (PP_SUBG='+floattostr(y_subgrupo)+') AND                                               ');
    clAux.AddParam ('      (PP_PROD='+floattostr(y_produto)+') AND                                                ');
    clAux.AddParam ('      (PP_CORE='+floattostr(y_cor)+') AND                                                    ');
    clAux.AddParam ('      (PP_TAMA='+chr(39)+y_tamanho+chr(39)+') AND                                            ');
    clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+') AND    '); {*}
    clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataDataVendas(frm_principal.x_data_trabalho)+chr(39)+')        '); {*}
    clAux.AddParam ('Order by PP_DAT2                                                                             ');
    if (clAux.Execute) then
    begin
      clAux.last;
      lblPrecoPromocional.caption := form_nc(clAux.result('PP_PRE1'),10);
    end
    else
      lblPrecoPromocional.caption := 'N/EXISTE';
    clAux.desconect;
    clAux.Free;

          //historico de precos
    memo1.Limpa;

    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('Select PP_PRE1,PP_DAT1,PP_DAT2                                                               ');
    clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                                   ');
    clAux.AddParam ('Where (PP_LOJA='+floattostr(frm_principal.x_loja)+') AND                                     ');
    clAux.AddParam ('      (PP_GRUP='+floattostr(y_grupo)+') AND                                                  ');
    clAux.AddParam ('      (PP_SUBG='+floattostr(y_subgrupo)+') AND                                               ');
    clAux.AddParam ('      (PP_PROD='+floattostr(y_produto)+') AND                                                ');
    clAux.AddParam ('      (PP_CORE='+floattostr(y_cor)+') AND                                                    ');
    clAux.AddParam ('      (PP_TAMA='+chr(39)+y_tamanho+chr(39)+')                                                ');
    clAux.AddParam ('Order by PP_DAT2                                                                             ');
    if (clAux.Execute) then
    begin
      clAux.first;
      while (not clAux.eof) do
      begin
        memo1.cells[0,memo1.rowcount - 1] := ' Preço: '+form_nc(clAux.result('PP_PRE1'),10)+
          ' - Duração: '+form_data(clAux.result('PP_DAT1'))+
          ' a '+form_data(clAux.result('PP_DAT2'));
        memo1.cells[1,memo1.rowcount - 1] := clAux.consulta.fieldbyname('PP_DAT1').AsString;
        memo1.cells[2,memo1.rowcount - 1] := clAux.consulta.fieldbyname('PP_DAT2').AsString;
        clAux.next;
        if not claux.eof then
          memo1.rowcount := memo1.rowcount + 1;
      end;
    end
    else
      memo1.cells[0,0] := ' N/ EXISTE';
    clAux.desconect;
    clAux.Free;

    ativou := true;
  end;
end;

procedure Tfrm_VisaoPrecosPraticados.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VisaoPrecosPraticados.Memo1GetCellColor(Sender: TObject;
  ARow, Acol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
  Afont.Assign(Memo1.Font);
  AFont.Color := clblack;   
  if (memo1.cells[1,ARow] <> '') and (strtodaten(memo1.cells[1,ARow]) <= frm_principal.x_data_trabalho) then
    if (memo1.cells[2,ARow] <> '') and (frm_principal.x_data_trabalho > strtodaten(memo1.cells[2,ARow])) then
      AFont.Color := clred
    else
      AFont.Color := clblue;
end;

end.
