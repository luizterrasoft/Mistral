unit un_VerHistoricoPromocoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO;

type
  Tfrm_VerHistoricoPromocoes = class(TForm)
    BotaoSair1: TBotaoSair;
    LabelOO1: TLabelOO;
    lblDescricao: TLabelOO;
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
    Memo1: TMemo;
    LabelOO2: TLabelOO;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: boolean;
    y_grupo,y_subgrupo,y_produto: real;
    y_cor: real;
    y_tamanho: string;
  end;

var
  frm_VerHistoricoPromocoes: Tfrm_VerHistoricoPromocoes;

implementation

{$R *.dfm}

procedure Tfrm_VerHistoricoPromocoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ESC) then close;
end;

procedure Tfrm_VerHistoricoPromocoes.FormCreate(Sender: TObject);
begin
     ativou     := false;

     y_grupo    := 0;
     y_subgrupo := 0;
     y_produto  := 0;
     y_cor      := 0;
     y_tamanho  := -1;
end;

procedure Tfrm_VerHistoricoPromocoes.FormActivate(Sender: TObject);
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
               lblDescricao.caption := clAux.result('ES_DESC');
               lblPrecoPrincipal.caption := form_nc(clAux.result('ES_PVE1'),10);
          end;
          clAux.desconect;
          clAux.Free;

          {...}
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
          else lblPrecoPromocional.caption := 'N/EXISTE';
          clAux.desconect;
          clAux.Free;

          //historico de precos
          memo1.lines.clear;
          memo1.lines.Add (' ');

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
               memo1.lines.Add (' '+form_nc(clAux.result('PP_PRE1'),10)+
                                ' - Duração: '+form_data(clAux.result('PP_DAT1'))+
                                ' a '+form_data(clAux.result('PP_DAT2')));
          end
          else memo1.lines.Add (' N/ EXISTE');
          clAux.desconect;
          clAux.Free;

          ativou := true;
     end;
end;

end.
