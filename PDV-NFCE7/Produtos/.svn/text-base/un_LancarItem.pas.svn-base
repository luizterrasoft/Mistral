unit un_LancarItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Mask, Db, DBTables;

type
  Tfrm_LancarItem = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    pnProduto: TPanel;
    pnCor: TPanel;
    Label34: TLabel;
    edtCor: TMaskEdit;
    Label35: TLabel;
    edtFaixaTam: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnSalvar: TButton;
    qLancaItem: TQuery;
    Label12: TLabel;
    edtRefFab: TMaskEdit;
    edtCodigoBarra: TMaskEdit;
    Label16: TLabel;
    Label8: TLabel;
    edtDesc: TMaskEdit;
    pnLocal1: TPanel;
    Label2: TLabel;
    edtGrupo: TMaskEdit;
    edtSubGrupo: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtCodigo: TMaskEdit;
    pnLocal2: TPanel;
    Label4: TLabel;
    edtRefInt: TMaskEdit;
    Label7: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    Label18: TLabel;
    pnUnidade: TPanel;
    procedure SAIR1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtCodigoBarraEnter(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtDescEnter(Sender: TObject);
    procedure edtDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_cor: Real;
    n_tam: String;
    jaCriou: Boolean;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}

    {...}
    Modo: Integer;          {0-> inclusao de item, 1-> alteracao de item}

    {...}
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure LimparEdits;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure MudaFocoCodigo;
  end;

var
  frm_LancarItem: Tfrm_LancarItem;

implementation

uses principal, unDialogo, produtos, funcoes1, funcoes2, procura, auxiliar, estoques;

{$R *.DFM}

procedure Tfrm_LancarItem.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancarItem.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_LancarItem.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_LancarItem.GetTabOrderList(Lista);
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

procedure Tfrm_LancarItem.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  if (key=38) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_LancarItem.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    if (edtCor.enabled) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancarItem.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItem.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItem.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItem.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItem.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho cadastradas para o produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_LancarItem.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do grupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar grupos cadastrados.',5);
end;

procedure Tfrm_LancarItem.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) then
    edtGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=strtofloat(Trim(edtGrupo.text));
      ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
    end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do subgrupo do produto: Formato: 999; Tecle <F8/Duplo clique> para selecionar subgrupos cadastrados.',5);
end;

procedure Tfrm_LancarItem.LimparEdits;
begin
  if (Modo=1) then {alteracao}
  begin
    edtRefFab.text:='';
    edtCodigoBarra.text:='';
    edtDesc.setfocus;
    pnUnidade.caption:='';
  end
  else
  if (Modo=0) then {inclusao}
  begin
    edtGrupo.text:='';
    edtSubGrupo.text:='';
    edtCodigo.text:='';
    edtRefInt.text:='';
    pnProduto.caption:='';
    edtDesc.text:='';
    if (edtCor.enabled) then
    begin
      edtCor.text:='';
      pnCor.caption:='';
    end;
    if (edtFaixaTam.enabled) then
      edtFaixaTam.text:='';
    edtRefFab.text:='';
    edtCodigoBarra.text:='';
    pnUnidade.caption:='';
    FocaCodigoLocal1;
  end;
end;

procedure Tfrm_LancarItem.FormActivate(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  if (not jaCriou) then
  begin
    if (Modo=0) then
    begin
      LimparEdits;
      habilitaEdit(edtGrupo);
      habilitaEdit(edtSubgrupo);
      habilitaEdit(edtCodigo);
      habilitaEdit(edtCor);
      habilitaEdit(edtFaixaTam);
      pnProduto.caption := '';
      pnCor.caption     := '';
      edtGrupo.text     := '';
      edtSubGrupo.text  := '';
      edtCodigo.text    := '';
      edtCor.text       := '';
      edtFaixaTam.text  := '';
      FocaCodigoLocal1;
    end
    else
    if (Modo=1) then
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select * ');
      clAux.AddParam ('From   PRODUTOS ');
      clAux.AddParam ('Where (PR_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('      (PR_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('      (PR_CODI='+floattostr(n_produto)+') ');
      clAux.Execute;
      pnProduto.caption := clAux.result('PR_DESC');
      edtRefInt.text    := form_t (clAux.result('PR_REFI'),12);
      clAux.ClearSql;
      clAux.AddParam ('Select * ');
      clAux.AddParam ('From   ESTOQUE ');
      clAux.AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      clAux.Execute;
      edtGrupo.text     := form_nz(n_grupo,3);
      edtSubgrupo.text  := form_nz(n_subgrupo,3);
      edtCodigo.text    := form_nz(n_produto,6);
      edtCor.text       := form_nz(n_cor,2);
      pnCor.caption     := ProcuraNomeCor(n_cor,self);
      edtFaixaTam.text  := form_t(n_tam,5);
      edtDesc.text      := clAux.result('ES_DESC');
      edtCodigoBarra.text := clAux.result('ES_CBAR');
      edtRefFab.text    := clAux.result('ES_REFF');
      clAux.desconect;
      clAux.Free;
      desabilitaEdit(edtRefInt);
      desabilitaEdit(edtGrupo);
      desabilitaEdit(edtSubgrupo);
      desabilitaEdit(edtCodigo);
      desabilitaEdit(edtCor);
      desabilitaEdit(edtFaixaTam);
      edtDesc.setfocus;
    end;
    jaCriou:=true;
  end;
end;

procedure Tfrm_LancarItem.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clProd: TClassProdutos;
  grupo,subgrupo,codigo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    grupo    := Trim(edtGrupo.text);
    subgrupo := Trim(edtSubGrupo.text);
    codigo   := Trim(edtCodigo.text);
    if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID ');
        AddParam ('From   PRODUTOS ');
        AddParam ('Where (PR_SUBG='+subgrupo+') AND ');
        AddParam ('      (PR_GRUP='+grupo+') AND ');
        AddParam ('      (PR_CODI='+codigo+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
          pnUnidade.caption:=Result('PR_UNID');
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (StrToFloat(grupo),3);
        edtSubGrupo.text := form_nz (StrToFloat(subgrupo),3);
        edtCodigo.text   := form_nz(StrToFloat(codigo),6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaedit(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaedit(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaedit(edtFaixaTam);
        end
        else
          habilitaedit(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  end;
  if (key=K_CIMA) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=Trim(edtGrupo.text);
      subgrupo:=Trim(edtSubGrupo.text);
      ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
    end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Código do produto: Formato: 999999',5);
end;

procedure Tfrm_LancarItem.btnSalvarClick(Sender: TObject);
begin
  Salvar1.click;
end;

procedure Tfrm_LancarItem.Salvar1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
     {CRITICA AOS DADOS}
  if (n_grupo=0) then
  begin
    frmDialogo.ExibirMensagem (' Grupo fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (n_subgrupo=0) then
  begin
    frmDialogo.ExibirMensagem (' SubGrupo fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (n_produto=0) then
  begin
    frmDialogo.ExibirMensagem (' Cod. do produto fornecido não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    FocaCodigoLocal1;
  end
  else
  if (Trim(edtCor.text)='') then
  begin
    frmDialogo.ExibirMensagem (' Cor fornecida não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtCor.setfocus;
  end
  else
  if (Trim(edtFaixaTam.text)='') then
  begin
    frmDialogo.ExibirMensagem (' Faixa de tamanho fornecida não pode ficar em branco! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFaixaTam.setfocus;
  end
  else
    with (qLancaItem) do
    begin
      clAux:=TClassAuxiliar.Create;
      clAux.conect   ('ESTOQUE',self);
      clAux.ClearSql;
      clAux.AddParam ('Select ES_DESC ');
      clAux.AddParam ('From   ESTOQUE ');
      clAux.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND ');
      clAux.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND ');
      clAux.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
      clAux.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND ');
      clAux.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')  ');
      if (not clAux.Execute) then
      begin
        frm_principal.barraDicas.caption:='Lançando um item de produto...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Insert into ESTOQUE(ES_GRUP,ES_SUBG,ES_PROD,    ');
        sql.Add ('                    ES_CORE,ES_TAMA,    ');
        sql.Add ('                    ES_CBAR,ES_REFF,ES_DESC)    ');
        sql.Add ('Values             (:ES_GRUP,:ES_SUBG,:ES_PROD, ');
        sql.Add ('                    :ES_CORE,:ES_TAMA, ');
        sql.Add ('                    :ES_CBAR,:ES_REFF,:ES_DESC) ');
        parambyname('ES_GRUP').AsFloat  := n_grupo;
        parambyname('ES_SUBG').AsFloat  := n_subgrupo;
        parambyname('ES_PROD').AsFloat  := n_produto;
        parambyname('ES_CORE').AsFloat  := n_cor;
        parambyname('ES_TAMA').AsString := n_tam;
        parambyname('ES_DESC').AsString := Trim(edtDesc.text);
        parambyname('ES_CBAR').AsString := Trim(edtCodigoBarra.text);
        parambyname('ES_REFF').AsString := Trim(edtRefFab.text);
        ExecSql;
        LimparEdits;
        if (Modo=0) then
          FocaCodigoLocal1
        else
        if (Modo=1) then
          edtDesc.setfocus;
        frm_LancarItem.close;
      end
      else
      begin
        frm_principal.barraDicas.caption:='Alterando um item de produto...';
        frm_principal.refresh;
        sql.clear;
        sql.Add ('Update ESTOQUE   ');
        sql.Add ('Set    ES_CBAR=:ES_CBAR,ES_REFF=:ES_REFF,   ');
        sql.Add ('       ES_DESC=:ES_DESC ');
        sql.Add ('Where  (ES_GRUP=:ES_GRUP) AND ');
        sql.Add ('       (ES_SUBG=:ES_SUBG) AND ');
        sql.Add ('       (ES_PROD=:ES_PROD) AND ');
        sql.Add ('       (ES_CORE=:ES_CORE) AND ');
        sql.Add ('       (ES_TAMA=:ES_TAMA)     ');
        parambyname('ES_GRUP').AsFloat  := n_grupo;
        parambyname('ES_SUBG').AsFloat  := n_subgrupo;
        parambyname('ES_PROD').AsFloat  := n_produto;
        parambyname('ES_CORE').AsFloat  := n_cor;
        parambyname('ES_TAMA').AsString := n_tam;
        parambyname('ES_DESC').AsString := Trim(edtDesc.text);
        parambyname('ES_CBAR').AsString := Trim(edtCodigoBarra.text);
        parambyname('ES_REFF').AsString := Trim(edtRefFab.text);
        ExecSql;
        frm_principal.barraDicas.caption:='';
        frm_principal.refresh;
        frm_LancarItem.close;
      end;
      clAux.desconect;
      clAux.Free;
      frm_principal.barraDicas.caption:='';
      frm_principal.refresh;
    end;
end;

procedure Tfrm_LancarItem.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_LancarItem.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_LancarItem.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_LancarItem.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor :=0;
end;

procedure Tfrm_LancarItem.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '';
end;

procedure Tfrm_LancarItem.edtCorExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa,codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),2);
  end;
  if (n_tam_unico) then
  begin
         {Pesquisa o item de estoque, no cadastro de itens de estoque ***}
    faixa := '0';
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC ');
      AddParam ('From   ESTOQUE ');
      AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (ES_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (not Execute) then
      begin
        edtDesc.text        :='';
        edtRefFab.text      :='';
        edtCodigoBarra.text :='';
      end
      else
      begin
        edtDesc.text        := Trim(result('ES_DESC'));
        edtRefFab.text      := Trim(result('ES_REFF'));
        edtCodigoBarra.text := Trim(result('ES_CBAR'));
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_LancarItem.edtCodigoBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnSalvar.click;
  if (key=38) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_LancarItem.edtRefFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_LancarItem.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItem.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8Cores(edtCor,true);
end;

procedure Tfrm_LancarItem.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_LancarItem.edtCodigoBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItem.Limparformulrio1Click(Sender: TObject);
begin
  if (Modo=0) then
  begin
    habilitaEdit(edtCor);
    habilitaEdit(edtFaixaTam);
    n_cor_unica:=false;
    n_tam_unico:=false;
  end;   
  LimparEdits;
  if (Modo=0) then
    FocaCodigoLocal1
  else
  if (Modo=1) then
    edtRefFab.setfocus;
end;

procedure Tfrm_LancarItem.edtDescEnter(Sender: TObject);
begin
  if (Trim(edtDesc.text)='') then
    edtDesc.text:=ExibeNomeProduto(form_nz(n_grupo,3)+form_nz(n_subgrupo,3)+
      form_nz(n_produto,6), n_cor,n_Tam);
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItem.edtDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    FocusControle(TWinControl(sender),true);
  if (key=38) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtGrupo.enabled) then
      FocaCodigoLocal2;
end;

procedure Tfrm_LancarItem.FormCreate(Sender: TObject);
begin
  n_cor_unica:=false;
  n_tam_unico:=false;

     {* Posicionando a forma de localizacao do produto *}
  if (frm_principal.x_ordem_codigo=1) then
  begin
    pnLocal1.visible := true;
    pnLocal1.left    := 16;
    pnLocal2.visible := false;
    pnLocal2.left    := 16;
  end
  else
  if (frm_principal.x_ordem_refinterna=1) then
  begin
    pnLocal1.visible := false;
    pnLocal1.left    := 16;
    pnLocal2.visible := true;
    pnLocal2.left    := 16;
  end;
end;

{Verificando se o item que se deseja entrar ja nao esta lancado ****}
procedure Tfrm_LancarItem.edtCodigoExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  clAux:=TClassAuxiliar.Create;
  clAux.conect   ('ESTOQUE',self);
  clAux.ClearSql;
  clAux.AddParam ('Select ES_DESC ');
  clAux.AddParam ('From   ESTOQUE ');
  clAux.AddParam ('Where  (ES_GRUP='+floattostr(n_grupo)+') AND ');
  clAux.AddParam ('       (ES_PROD='+floattostr(n_produto)+') AND ');
  clAux.AddParam ('       (ES_SUBG='+floattostr(n_subgrupo)+') AND ');
  clAux.AddParam ('       (ES_CORE='+floattostr(n_cor)+') AND ');
  clAux.AddParam ('       (ES_TAMA='+chr(39)+n_tam+chr(39)+')  ');
  if (clAux.Execute) then
  begin
    frmDialogo.ExibirMensagem (' Item já lançado! '
      ,'Estoque',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtCodigo.setfocus;
  end;
  clAux.desconect;
  clAux.Free;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItem.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_LancarItem.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clProd: TClassProdutos;
  refinterna: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    refinterna := Trim(edtRefInt.text);
    if (refinterna<>'') then
      with (clProd) do
      begin
        clProd := TClassProdutos.Create;
        conect ('ESTOQUE', self);
        clearSql;
        AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP, ');
        AddParam ('       PR_SUBG,PR_CODI,PR_UNID          ');
        AddParam ('From   PRODUTOS                         ');
        AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+') ');
        frm_principal.BarraDicas.caption:='Buscando produto...Aguarde!';
        frm_principal.refresh;
        n_cor_unica:=false;
        n_tam_unico:=false;
        if (Execute) then
        begin
          n_grupo := result('PR_GRUP');
          n_subgrupo := result('PR_SUBG');
          n_produto := result('PR_CODI');
          pnProduto.caption:=result('PR_DESC');
          if (result('PR_CUNI')='1') then
            n_cor_unica:=true
          else
          if (result('PR_CUNI')='0') then
            n_cor_unica:=false;
          if (result('PR_TUNI')='1') then
            n_tam_unico:=true
          else
          if (result('PR_TUNI')='0') then
            n_tam_unico:=false;
          pnUnidade.caption:=Result('PR_UNID');
        end
        else
          pnProduto.caption:='<Produto nao encontrado>';
        frm_principal.BarraDicas.caption:='';
        edtGrupo.text    := form_nz (n_grupo,3);
        edtSubGrupo.text := form_nz (n_subgrupo,3);
        edtCodigo.text   := form_nz (n_produto,6);
        desconect;
        Free;

               {...}
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaedit(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaedit(edtCor);
        if (n_tam_unico) then
        begin
          edtFaixaTam.text:='0';
          desabilitaedit(edtFaixaTam);
        end
        else
          habilitaedit(edtFaixaTam);
      end;
    if (edtCor.enabled) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtDesc.setfocus;
  end;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F1) then
    frm_principal.ExibirDica (' Ref. interna do produto: Formato: 999999999999',5);
end;

{Controle de foco do produto ***}
procedure Tfrm_LancarItem.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_LancarItem.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus;
end;

procedure Tfrm_LancarItem.MudaFocoCodigo;
begin
  if (pnLocal1.visible) then
  begin
    pnLocal1.visible:=false;
    pnLocal2.visible:=true;
    edtRefInt.setfocus;
  end
  else
  if (pnLocal2.visible) then
  begin
    pnLocal1.visible:=true;
    pnLocal2.visible:=false;
    edtGrupo.setfocus;
  end;
end;

procedure Tfrm_LancarItem.edtFaixaTamExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa: String;
begin
     {Critica dos dados}
  faixa := Trim(edtFaixaTam.text);
  if (not VerificaFaixasTamProduto(n_grupo,n_subgrupo,n_produto,faixa))
    and (Trim(edtFaixaTam.text)<>'') then
  begin
    frmDialogo.ExibirMensagem (' Faixa não permitida para o produto! '
      ,'Item de produto',[mbOK]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200);
    edtFaixaTam.setfocus;
  end
  else
  begin
         {Pesquisa o item de estoque, no cadastro de itens de estoque ***}
    clAux := TClassAuxiliar.Create;
    with (clAux) do
    begin
      conect   ('ESTOQUE',self);
      ClearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC ');
      AddParam ('From   ESTOQUE ');
      AddParam ('Where (ES_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (ES_CORE='+floattostr(n_cor)+') AND ');
      AddParam ('      (ES_TAMA='+chr(39)+faixa+chr(39)+') ');
      if (not Execute) then
      begin
        edtDesc.text        :='';
        edtRefFab.text      :='';
        edtCodigoBarra.text :='';
      end
      else
      begin
        edtDesc.text        := Trim(result('ES_DESC'));
        edtRefFab.text      := Trim(result('ES_REFF'));
        edtCodigoBarra.text := Trim(result('ES_CBAR'));
      end;
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItem.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_LancarItem.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_LancarItem.edtCodigoDblClick(Sender: TObject);
var
  grupo,subgrupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    subgrupo:=strtofloat(Trim(edtSubGrupo.text));
    ChamandoF8Produtos_2(edtCodigo,grupo,subgrupo,true);
  end;
end;

procedure Tfrm_LancarItem.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_LancarItem.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

end.
