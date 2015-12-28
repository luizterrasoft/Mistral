unit un_ConsultaCodigoDeBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO, Mask, MaskEditOO, Menus;

type
  Tfrm_ConsultaCodigoDeBarras = class(TForm)
    BotaoSair1: TBotaoSair;
    Panel1: TPanel;
    Bevel1: TBevel;
    edtCodigoDeBarras: TMaskEditOO;
    LabelOO2: TLabelOO;
    btnBuscar: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label10: TLabel;
    lbl_cor: TLabel;
    lbl_tamanho: TLabel;
    lbl_Produto: TLabel;
    lbl_preco: TLabel;
    lbl_promocao: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulario1: TMenuItem;
    lbtipz: TLabel;
    LabelOO3: TLabelOO;
    Timer1: TTimer;
    lbl_linha: TLabelOO;
    lbl_colecao: TLabelOO;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoDeBarrasEnter(Sender: TObject);
    procedure edtCodigoDeBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure Limparformulario1Click(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagexibe: Boolean;
    tipz: String;
  end;

var
  frm_ConsultaCodigoDeBarras: Tfrm_ConsultaCodigoDeBarras;

implementation

uses principal, unDialogo, auxiliar, procura, funcoes1, funcoes2, venda;

{$R *.dfm}

procedure Tfrm_ConsultaCodigoDeBarras.FormActivate(Sender: TObject);
begin
  if (not flagexibe) then
    Limparformulario1.click;
  edtCodigoDeBarras.setfocus;
end;

procedure Tfrm_ConsultaCodigoDeBarras.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
  flagexibe:=false;
  Timer1.enabled:=false;
end;

procedure Tfrm_ConsultaCodigoDeBarras.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='1';
        lbtipz.visible:=true;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_ConsultaCodigoDeBarras.edtCodigoDeBarrasEnter(
  Sender: TObject);
begin
  edtCodigoDeBarras.selectall;
end;

procedure Tfrm_ConsultaCodigoDeBarras.edtCodigoDeBarrasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnBuscarClick(btnBuscar);
end;

procedure Tfrm_ConsultaCodigoDeBarras.btnBuscarClick(Sender: TObject);
var
  clProd,clAux: TClassAuxiliar;
begin
  if (edtCodigoDeBarras.GetValor='') then
  begin
    frmDialogo.ExibirMensagem ('Informe um código de barras para consulta!'
      ,'Atendimentos',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodigoDeBarras.setfocus;
  end
  else
  begin
    Timer1.enabled := true;

    lbl_produto.font.color := clWhite;
    lbl_produto.caption  := '';
    lbl_cor.caption      := '';
    lbl_tamanho.caption  := '';
    lbl_linha.caption    := '';
    lbl_colecao.caption  := '';
    lbl_preco.caption    := '';
    lbl_promocao.visible := false;

          {...}
    clProd := TClassAuxiliar.Create;
    clProd.conect   (databaseprodutos,self);
    clProd.ClearSql;
    clProd.AddParam ('SELECT PR_DESC,ES_CORE,ES_TAMA,PR_COLE,PR_LINH,                      ');
    clProd.AddParam ('       ES_GRUP,ES_SUBG,ES_PROD                                       ');
    clProd.AddParam ('FROM   PRODUTOS,ESTOQUE                                              ');
    clProd.AddParam ('WHERE (ES_CBAR='+chr(39)+edtCodigoDeBarras.GetValor+chr(39)+') AND   ');
    clProd.AddParam ('      (PR_GRUP=ES_GRUP) AND (PR_SUBG=ES_SUBG) AND (PR_CODI=ES_PROD)  ');
    if (clProd.Execute) then
    begin
      lbl_produto.font.color := clWhite;
      lbl_produto.caption    := clProd.result('PR_DESC');
      if (clProd.result('PR_LINH')<>0) then
        lbl_linha.caption      := 'LINHA: '+ProcuraNomeLinha(clProd.result('PR_LINH'),self)
      else
        lbl_linha.caption      := '';
      if (clProd.result('PR_COLE')<>0) then
        lbl_colecao.caption    := 'COLEÇÃO: '+ProcuraNomeColecao(clProd.result('PR_COLE'),self)
      else
        lbl_colecao.caption    := '';
      ;
      lbl_cor.caption        := 'COR: '+ProcuraNomeCor(clProd.result('ES_CORE'),self);
      lbl_tamanho.caption    := 'TAMANHO: '+clProd.result('ES_TAMA');

               //busca pelo preco
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,frm_principal);
      clAux.ClearSql;
      clAux.AddParam ('Select PP_PRE1,PP_PRE2                                                                ');
      clAux.AddParam ('From   PRECOS_PROMOCIONAIS                                                            ');
      clAux.AddParam ('Where (PP_LOJA='+floattostr(frm_principal.x_loja)+') AND                              ');
      clAux.AddParam ('      (PP_GRUP='+floattostr(clProd.result('ES_GRUP'))+') AND                          ');
      clAux.AddParam ('      (PP_SUBG='+floattostr(clProd.result('ES_SUBG'))+') AND                          ');
      clAux.AddParam ('      (PP_PROD='+floattostr(clProd.result('ES_PROD'))+') AND                          ');
      clAux.AddParam ('      (PP_CORE='+floattostr(clProd.result('ES_CORE'))+') AND                          ');
      clAux.AddParam ('      (PP_TAMA='+chr(39)+clProd.result('ES_TAMA')+chr(39)+') AND                      ');
      clAux.AddParam ('      (PP_DAT1<='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+') AND   '); {*}
      clAux.AddParam ('      (PP_DAT2>='+chr(39)+FormataData(frm_principal.x_data_trabalho)+chr(39)+')       '); {*}
      clAux.AddParam ('Order by PP_DAT2                                                                      ');
      if (clAux.Execute) then
      begin
        lbl_promocao.visible := true;

        clAux.last; {IMPORTANTE: pega sempre a ultima, caso haja mais de uma tabela}
        lbl_preco.caption := 'Preço R$ '+form_nc(clAux.result('PP_PRE'+tipz),8);
      end
      else
      begin
        lbl_promocao.visible := false;

                   {2o nivel de procura de preco - TABELAS PRECOS (1) - PRECO DIFERENCIADO}
        clAux.ClearSql;
        clAux.AddParam ('Select IP_PRE1,IP_PRE2                                              ');
        clAux.AddParam ('From   ITENS_TABELAS_PRECOS                                         ');
        clAux.AddParam ('Where (IP_LOJA='+floattostr(frm_principal.x_loja)+') AND            ');
        clAux.AddParam ('      (IP_GRUP='+floattostr(clProd.result('ES_GRUP'))+') AND        ');
        clAux.AddParam ('      (IP_SUBG='+floattostr(clProd.result('ES_SUBG'))+') AND        ');
        clAux.AddParam ('      (IP_PROD='+floattostr(clProd.result('ES_PROD'))+') AND        ');
        clAux.AddParam ('      (IP_CORE='+floattostr(clProd.result('ES_CORE'))+') AND        ');
        clAux.AddParam ('      (IP_TAMA='+chr(39)+clProd.result('ES_TAMA')+chr(39)+') AND    ');
        clAux.AddParam ('      (IP_TABE=1)                                                   ');
        if (clAux.Execute) then
          lbl_preco.caption := 'Preço R$ '+form_nc(clAux.result('IP_PRE'+tipz),8)
        else
        begin
                        {3o nivel de procura de preco - TABELAS PRECOS (1) - PRECO PRINCIPAL}
          clAux.ClearSql;
          clAux.AddParam ('Select ES_PVE1,ES_PVE2                                                    ');
          clAux.AddParam ('From   ESTOQUE                                                            ');
          clAux.AddParam ('Where (ES_GRUP='+floattostr(clProd.result('ES_GRUP'))+') AND              ');
          clAux.AddParam ('      (ES_SUBG='+floattostr(clProd.result('ES_SUBG'))+') AND              ');
          clAux.AddParam ('      (ES_PROD='+floattostr(clProd.result('ES_PROD'))+') AND              ');
          clAux.AddParam ('      (ES_CORE='+floattostr(clProd.result('ES_CORE'))+') AND              ');
          clAux.AddParam ('      (ES_TAMA='+chr(39)+clProd.result('ES_TAMA')+chr(39)+')              ');
          if (clAux.Execute) then
            lbl_preco.caption := 'Preço R$ '+form_nc(clAux.result('ES_PVE'+tipz),8)
          else
          begin
            lbl_produto.font.color := clRed;
            lbl_produto.caption := '[PRODUTO NÃO ENCONTRADO]';
          end;
        end;
      end;
      clAux.desconect;
      clAux.Free;
    end
    else
    begin
      lbl_produto.font.color := clRed;
      lbl_produto.caption := '[PRODUTO NÃO ENCONTRADO]';
    end;
    clProd.desconect;
    clProd.Free;

    edtCodigoDeBarras.text := '';
    edtCodigoDeBarras.setfocus;
  end;
end;

procedure Tfrm_ConsultaCodigoDeBarras.Limparformulario1Click(
  Sender: TObject);
begin
  edtCodigoDeBarras.text := '';
  lbl_produto.caption    := '';
  lbl_produto.font.color := clWhite;
  lbl_cor.caption        := '';
  lbl_tamanho.caption    := '';
  lbl_preco.caption      := '';
  lbl_linha.caption      := '';
  lbl_colecao.caption    := '';
  lbl_promocao.visible   := false;
  edtCodigoDeBarras.setfocus;
end;

procedure Tfrm_ConsultaCodigoDeBarras.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConsultaCodigoDeBarras.Timer1Timer(Sender: TObject);
begin
  lbl_preco.visible := not lbl_preco.visible;
end;

end.
