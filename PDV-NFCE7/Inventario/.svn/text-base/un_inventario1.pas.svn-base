unit un_inventario1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables,
  Gauges, CheckBoxOO, LabelOO;

type
  Tfrm_inventario1 = class(TForm)
    Panel3: TPanel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N4: TMenuItem;
    SAIR1: TMenuItem;
    gbItem_ProdCorTam: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    edtCor: TMaskEdit;
    pnCor: TPanel;
    edtFaixaTam: TMaskEdit;
    pnProduto: TPanel;
    pnLocal1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    edtGrupo: TMaskEdit;
    edtSubGrupo: TMaskEdit;
    edtCodigo: TMaskEdit;
    pnLocal2: TPanel;
    Label18: TLabel;
    edtRefInt: TMaskEdit;
    pnLocal3: TPanel;
    Label22: TLabel;
    edtRefFab: TMaskEdit;
    gbItem_cbarra: TPanel;
    Label16: TLabel;
    edtCBarra: TMaskEdit;
    pnDescItem2: TPanel;
    Panel1: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    edtQtde: TMaskEdit;
    edtUnidade: TMaskEdit;
    ds1: TDataSource;
    grade: TDBGrid;
    lblDel: TLabel;
    lblMensDel: TLabel;
    Imprimirlotedeinventrio1: TMenuItem;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Limpartodoolote1: TMenuItem;
    edtForn: TMaskEdit;
    Label13: TLabel;
    N2: TMenuItem;
    Novoproduto1: TMenuItem;
    Label7: TLabel;
    Label23: TLabel;
    btnIncluir1: TPanel;
    btnLimpar: TPanel;
    lbtipz: TLabel;
    qInventario: TQuery;
    qInventarioGRUPO: TFloatField;
    qInventarioSUBGRUPO: TFloatField;
    qInventarioPRODUTO: TFloatField;
    qInventarioCOR: TFloatField;
    qInventarioTAMANHO: TStringField;
    qInventarioDATA: TDateTimeField;
    qInventarioTIPZ: TStringField;
    qInventarioCBARRA: TStringField;
    qInventariocTam: TStringField;
    qInventariocCor: TStringField;
    chAtualizar: TCheckBoxOO;
    qInventarioSALDO: TFloatField;
    qInventarioDESCRICAO: TStringField;
    qInventarioREFINT: TStringField;
    qInventarioFORN: TFloatField;
    qInventarioREFFAB: TStringField;
    qInventarioUNID: TStringField;
    Fixarcornolanamento1: TMenuItem;
    Label3: TLabel;
    Label5: TLabel;
    pnTotalSaldo: TPanel;
    Label6: TLabel;
    Mudarformadeleituradocdigodebarras1: TMenuItem;
    lbleituracbarra: TLabelOO;
    Label9: TLabel;
    gbItem_cbarra_EAN13: TPanel;
    Label12: TLabel;
    lbleituracbarraEAN13: TLabelOO;
    Label24: TLabel;
    edtCBarraEAN13: TMaskEdit;
    pnDescItem2EAN13: TPanel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    LabelOO3: TLabelOO;
    LabelOO4: TLabelOO;
    botao_sair: TPanel;
    Label1: TLabel;
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SAIR1Click(Sender: TObject);
    procedure edtGrupoChange(Sender: TObject);
    procedure edtGrupoDblClick(Sender: TObject);
    procedure edtGrupoEnter(Sender: TObject);
    procedure edtGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSubGrupoChange(Sender: TObject);
    procedure edtSubGrupoDblClick(Sender: TObject);
    procedure edtSubGrupoEnter(Sender: TObject);
    procedure edtSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefIntChange(Sender: TObject);
    procedure edtRefIntDblClick(Sender: TObject);
    procedure edtRefIntEnter(Sender: TObject);
    procedure edtRefIntExit(Sender: TObject);
    procedure edtRefIntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabChange(Sender: TObject);
    procedure edtRefFabEnter(Sender: TObject);
    procedure edtRefFabExit(Sender: TObject);
    procedure edtRefFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnidadeEnter(Sender: TObject);
    procedure edtUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCBarraEnter(Sender: TObject);
    procedure edtCBarraExit(Sender: TObject);
    procedure edtCBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure edtCorChange(Sender: TObject);
    procedure edtCorDblClick(Sender: TObject);
    procedure edtCorEnter(Sender: TObject);
    procedure edtCorExit(Sender: TObject);
    procedure edtCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaixaTamChange(Sender: TObject);
    procedure edtFaixaTamDblClick(Sender: TObject);
    procedure edtFaixaTamEnter(Sender: TObject);
    procedure edtFaixaTamExit(Sender: TObject);
    procedure edtFaixaTamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeEnter(Sender: TObject);
    procedure gradeExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
    procedure edtSubGrupoExit(Sender: TObject);
    procedure Imprimirlotedeinventrio1Click(Sender: TObject);
    procedure Limpartodoolote1Click(Sender: TObject);
    procedure edtFornChange(Sender: TObject);
    procedure edtFornDblClick(Sender: TObject);
    procedure edtFornEnter(Sender: TObject);
    procedure edtFornExit(Sender: TObject);
    procedure edtFornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRefFabDblClick(Sender: TObject);
    procedure Novoproduto1Click(Sender: TObject);
    procedure btnIncluir1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure qInventarioCalcFields(DataSet: TDataSet);
    procedure chAtualizarClick(Sender: TObject);
    procedure Fixarcornolanamento1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
    procedure edtCBarraEAN13Enter(Sender: TObject);
    procedure edtCBarraEAN13Exit(Sender: TObject);
    procedure edtCBarraEAN13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    n_ordem_ctrf7: Integer;
    Modo: Integer;          {0-> chamado do menu principal, 1-> chamado da tela de estoque}
    n_grupo: Real;
    n_subgrupo: Real;
    n_produto: Real;
    n_loja: Real;
    n_cor: Real;
    n_tam: String;
    n_refi: String;
    n_reffab: String;
    n_forn: Real;
    n_tam_unico: Boolean;   {indica se o produto tem tamanho unico ou nao}
    n_cor_unica: Boolean;   {indica se a cor é unica ou não}
    tipz: String;           {indica se a entrada esta sendo dada fora ou nao}
    n_ordem_f7: Integer;
    procedure MudaFocoCodigo;
    procedure LimparEdits;
    procedure FocaCodigoLocal1;
    procedure FocaCodigoLocal2;
    procedure RefrescaTabela;
    procedure MudaFocoCodigoItem;
    function InformaProximaSequenciaLote:Integer;
  end;

var
  frm_inventario1: Tfrm_inventario1;

implementation

uses principal, funcoes1, funcoes2, procura, auxiliar, venda, mem_prnt, un_ConsultaProdutos, unMensagem,
  unDialogo, F8Lojas;

{$R *.DFM}

procedure Tfrm_inventario1.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_inventario1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  total: Real;
begin
  if (key=K_ESC) then
    close;
  if (shift=[ssShift, ssAlt]) then
     {          if (key=K_INSERT) then
          begin
               if (tipz='1') then
               begin
                    tipz:='2';
                    lbtipz.visible:=true;
                    grade.columns[7].font.color:=clNavy;
               end
               else if (tipz='2') then
               begin
                    tipz:='3';
                    lbtipz.visible:=true;
                    grade.columns[7].font.color:=clNavy;
               end
               else if (tipz='3') then
               begin
                    tipz:='1';
                    lbtipz.visible:=false;
                    grade.columns[7].font.color:=clWhite;
               end;
               lbtipz.caption:='Sr.:'+tipz;
               RefrescaTabela;
               qInventario.disablecontrols;
               qInventario.first;
               total:=0.00;
               while (not qInventario.eof) do
               begin
                    total := total + qInventario.fieldbyname('SALDO').AsFloat;
                    qInventario.next;
               end;
               pnTotalSaldo.caption := form_n(total,5);
               qInventario.enablecontrols;
          end;    };
  if (shift=[ssCtrl]) then
    if (key=K_F7) then
      MudaFocoCodigoItem;
end;

procedure Tfrm_inventario1.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_inventario1.edtGrupoChange(Sender: TObject);
begin
  if (Trim(edtGrupo.text)<>'') then
    n_grupo := strtofloat(Trim(edtGrupo.text))
  else
    n_grupo :=0;
end;

procedure Tfrm_inventario1.edtGrupoDblClick(Sender: TObject);
begin
  ChamandoF8GruposProdutos(edtGrupo,true);
end;

procedure Tfrm_inventario1.edtGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe grupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.edtGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtSubGrupo.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=K_F8) then
    ChamandoF8GruposProdutos(edtGrupo,true);
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_inventario1.edtSubGrupoChange(Sender: TObject);
begin
  if (Trim(edtSubGrupo.text)<>'') then
    n_subgrupo := strtofloat(Trim(edtSubGrupo.text))
  else
    n_subgrupo :=0;
end;

procedure Tfrm_inventario1.edtSubGrupoDblClick(Sender: TObject);
var
  grupo: Real;
begin
  if (Trim(edtGrupo.text)<>'') then
  begin
    grupo:=strtofloat(Trim(edtGrupo.text));
    ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
  end;
end;

procedure Tfrm_inventario1.edtSubGrupoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe subgrupos de produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.edtSubGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  grupo: Real;
begin
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCodigo.setfocus;
  if (key=K_CIMA) or (key=K_ESC) then
    edtGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=strtofloat(Trim(edtGrupo.text));
      ChamandoF8SubGrupos (edtSubGrupo,grupo,false);
    end;
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_inventario1.edtCodigoChange(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    n_produto := strtofloat(Trim(edtCodigo.text))
  else
    n_produto :=0;
end;

procedure Tfrm_inventario1.edtCodigoDblClick(Sender: TObject);
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

procedure Tfrm_inventario1.edtCodigoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe produtos cadastrados';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  grupo,subgrupo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCodigoExit(Sender);
    if (edtCor.enabled) and (edtCor.color<>clNavy) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) or (key=K_ESC) then
    edtSubGrupo.setfocus;
  if (key=K_F8) then
    if (Trim(edtGrupo.text)<>'') then
    begin
      grupo:=Trim(edtGrupo.text);
      subgrupo:=Trim(edtSubGrupo.text);
      ChamandoF8Produtos_2(edtCodigo,strtofloat(grupo),strtofloat(subgrupo),true);
    end;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_inventario1.edtRefIntChange(Sender: TObject);
begin
  if (Trim(edtRefInt.text)<>'') then
    n_refi := Trim(edtRefInt.text)
  else
    n_refi := '0';
end;

procedure Tfrm_inventario1.edtRefIntDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.y_RotinaChamadora := 3;
  frm_ConsultaProduto.showmodal;
  if (frm_ConsultaProduto.y_grupo<>'?') then
  begin
    edtGrupo.text    := frm_ConsultaProduto.y_grupo;
    edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
    edtCodigo.text   := frm_ConsultaProduto.y_produto;
    edtRefInt.text   := frm_ConsultaProduto.y_refint;
    edtRefFab.text   := frm_ConsultaProduto.y_reffab;
    FocaCodigoLocal1;
  end;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_inventario1.edtRefIntEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtRefIntExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  refinterna: String;
begin
  refinterna := Trim(edtRefInt.text);
  if (refinterna<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,   ');
      AddParam ('       PR_CODI,PR_UNID,PR_REFF,PR_FORN            ');
      AddParam ('From   PRODUTOS                                   ');
      AddParam ('Where (PR_REFI='+chr(39)+refinterna+chr(39)+')    ');
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

                  {*** sugerindo a ref. fabricante}
        edtRefFab.text    := Trim(Result('PR_REFF'));
        edtForn.text      := form_nz(Result('PR_FORN'),6);
        edtUnidade.text   := result('PR_UNID');
      end
      else
      begin
        edtRefFab.text    := '';
        edtForn.text      := '';
        edtUnidade.text   := '';
        pnProduto.caption:='<Produto nao encontrado>';
      end;
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      desconect;
      Free;

             {...}
      if (edtCor.color<>clNavy) then
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaeditVerde(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_inventario1.edtRefIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefIntExit(sender);
    if (edtCor.enabled) and (edtCor.color<>clNavy) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
    frm_ConsultaProduto.y_RotinaChamadora := 3;
    frm_ConsultaProduto.showmodal;
    if (frm_ConsultaProduto.y_grupo<>'?') then
    begin
      edtGrupo.text    := frm_ConsultaProduto.y_grupo;
      edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
      edtCodigo.text   := frm_ConsultaProduto.y_produto;
      edtRefInt.text   := frm_ConsultaProduto.y_refint;
      edtRefFab.text   := frm_ConsultaProduto.y_reffab;
      FocaCodigoLocal1;
    end;
    frm_ConsultaProduto.Free;
  end;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_ESC) or (key=38) then
  ;
end;

procedure Tfrm_inventario1.edtRefFabChange(Sender: TObject);
begin
  if (Trim(edtRefFab.text)<>'') then
    n_reffab := Trim(edtRefFab.text)
  else
    n_reffab := '0';
end;

procedure Tfrm_inventario1.edtRefFabEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtRefFabExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  codigoforn,reffabric: String;
begin
  codigoforn := Trim(edtForn.text);
  reffabric  := Trim(edtRefFab.text);
  if (reffabric<>'') and (codigoforn<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_GRUP,PR_SUBG,   ');
      AddParam ('       PR_CODI,PR_UNID,PR_REFF,PR_REFI            ');
      AddParam ('From   PRODUTOS                                   ');
      AddParam ('Where (PR_FORN='+codigoforn+') AND                ');
      AddParam ('      (PR_REFF='+chr(39)+reffabric+chr(39)+')     ');
      n_cor_unica:=false;
      n_tam_unico:=false;
      if (Execute) then
      begin
        n_grupo    := result('PR_GRUP');
        n_subgrupo := result('PR_SUBG');
        n_produto  := result('PR_CODI');
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

                {*** sugerindo a ref. fabricante}
        edtRefInt.text  := Trim(Result('PR_REFI'));
        edtUnidade.text := Trim(result('PR_UNID'));
      end
      else
      begin
        edtRefInt.text  := '';
        edtUnidade.text := '';
        pnProduto.caption:='<Produto nao encontrado>';
      end;
      edtGrupo.text    := form_nz (n_grupo,2);
      edtSubGrupo.text := form_nz (n_subgrupo,2);
      edtCodigo.text   := form_nz (n_produto,4);
      edtFornExit(Sender);
      desconect;
      Free;

           {...}
      if (edtCor.color<>clNavy) then
        if (n_cor_unica) then
        begin
          edtCor.text:='0';
          desabilitaeditVerde(edtCor);
          pnCor.caption:='Cor única';
        end
        else
          habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_inventario1.edtRefFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtRefFabExit(sender);
    if (edtCor.enabled) and (edtCor.color<>clNavy) then
      edtCor.setfocus
    else
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  end;
  if (key=K_CIMA) then
    edtForn.setfocus;
  if (key=K_F8) then
  begin
    Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
    frm_ConsultaProduto.y_RotinaChamadora := 3;
    frm_ConsultaProduto.showmodal;
    if (frm_ConsultaProduto.y_grupo<>'?') then
    begin
      edtGrupo.text    := frm_ConsultaProduto.y_grupo;
      edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
      edtCodigo.text   := frm_ConsultaProduto.y_produto;
      edtRefInt.text   := frm_ConsultaProduto.y_refint;
      edtRefFab.text   := frm_ConsultaProduto.y_reffab;
      FocaCodigoLocal1;
    end;
    frm_ConsultaProduto.Free;
  end;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F7) then
    MudaFocoCodigo;
end;

procedure Tfrm_inventario1.edtUnidadeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtQtde.setfocus;
  if (key=38) or (key=K_ESC) then
    if (gbItem_ProdCorTam.visible) then
    begin
      if (edtFaixaTam.enabled) then
        edtFaixaTam.setfocus
      else
      if (edtCor.enabled) and (edtCor.color<>clNavy) then
        edtCor.setfocus
      else
        FocaCodigoLocal2;
    end
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus
    else
    if (gbItem_CBarra_EAN13.visible) then
      edtCBarraEAN13.setfocus;
  if (key=k_F2) then
    grade.setfocus;   
end;

procedure Tfrm_inventario1.edtCBarraEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtCBarraExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cbarra: String;
  a : Integer;
  continua: Boolean;
begin
  cbarra := ReformataCodigoBarras(Trim(edtCBarra.text));
  continua := true;
  if (cbarra<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,ES_CEAN,       ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,       ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_REFF        ');
      AddParam ('From   ESTOQUE,PRODUTOS                               ');
      AddParam ('Where (ES_CBAR='+chr(39)+cbarra+chr(39)+') AND        ');
      AddParam ('      (ES_GRUP=PR_GRUP) AND                           ');
      AddParam ('      (ES_SUBG=PR_SUBG) AND                           ');
      AddParam ('      (ES_PROD=PR_CODI)                               ');
      if not (Execute) then
      begin
        a := length(edtCBarra.Text);
        cbarra := copy(edtCBarra.Text,1,(a-1));
        clearSql;
        AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,ES_CEAN,       ');
        AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,       ');
        AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_REFF        ');
        AddParam ('From   ESTOQUE,PRODUTOS                               ');
        AddParam ('Where (ES_CBAR='+chr(39)+cbarra+chr(39)+') AND        ');
        AddParam ('      (ES_GRUP=PR_GRUP) AND                           ');
        AddParam ('      (ES_SUBG=PR_SUBG) AND                           ');
        AddParam ('      (ES_PROD=PR_CODI)                               ');
        if (Execute) then
          continua := true
        else
          continua := false;
      end
      else
        continua := true;
      if (continua) then
      begin
        pnProduto.caption   := result('PR_DESC');
        pnDescItem2.caption := result('ES_DESC');
        pnDescItem2EAN13.caption := result('ES_DESC');
        n_grupo    := result('ES_GRUP');
        n_subgrupo := result('ES_SUBG');
        n_produto  := result('ES_PROD');
        n_cor      := result('ES_CORE');
        n_tam      := result('ES_TAMA');
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
        edtRefInt.text   := Trim(result('PR_REFI'));
        edtReffab.text   := Trim(result('PR_REFF'));
        edtUnidade.text  := Trim(result('PR_UNID'));
        edtGrupo.text    := form_nz (n_grupo,2);
        edtSubGrupo.text := form_nz (n_subgrupo,2);
        edtCodigo.text   := form_nz (n_produto,4);
        edtCor.text      := form_nz (n_cor,4);
        pnCor.caption    := ProcuraNomeCor(n_cor,self);
        edtFaixaTam.text := n_tam;
        edtCBarraEAN13.text := Trim(result('ES_CEAN'));
      end
      else
      begin
        pnProduto.caption   := '<Produto não encontrado>';
        pnDescItem2.caption := '<Item de produto não encontrado>';
        pnDescItem2EAN13.caption := '<Item de produto não encontrado>';
        edtUnidade.text     := '';
        edtGrupo.text    := '';
        edtSubGrupo.text := '';
        edtCodigo.text   := '';
        edtCor.text      := '';
        pnCor.caption    := '';
        edtFaixaTam.text := '';
        edtRefInt.text   := '';
        edtReffab.text   := '';
        edtCBarraEAN13.text := '';
      end;
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        if (edtCor.color=clNavy) then
          Fixarcornolanamento1.click;
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor única';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_inventario1.edtCBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCBarraExit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=k_F2) then
    grade.setfocus;
end;

procedure Tfrm_inventario1.FormCreate(Sender: TObject);
var
  total: Real;
begin
  n_grupo    :=0;
  n_subgrupo :=0;
  n_produto  :=0;
  n_loja     :=0;
  n_cor      :=-1;
  n_tam      :='-1';
  tipz       :='3';
  lbtipz.caption := 'Sr.:'+tipz;
  RefrescaTabela; {*}
  qInventario.disablecontrols;
  qInventario.first;
  total:=0.00;
  while (not qInventario.eof) do
  begin
    total := total + qInventario.fieldbyname('SALDO').AsFloat;
    qInventario.next;
  end;
  pnTotalSaldo.caption := form_n(total,5);
  qInventario.enablecontrols;

     {* Posicionando a forma de localizacao do produto *}
  gbItem_ProdCorTam.visible   := false;
  gbItem_CBarra.visible       := false;
  gbItem_CBarra_EAN13.visible := false;
  if (frm_principal.x_prevalecer_EAN13) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_CBarra_EAN13.visible := true;
  end
  else
  if (frm_principal.x_ordem_prod_cor_tam=1) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_ProdCorTam.visible   := true;
    gbItem_CBarra.visible       := false;
    gbItem_CBarra_EAN13.visible := false;
  end
  else
  if (frm_principal.x_ordem_cbarra=1) then
  begin
    n_ordem_ctrf7 := 1;
    gbItem_ProdCorTam.visible   := false;
    gbItem_CBarra.visible       := true;
    gbItem_CBarra_EAN13.visible := false;
  end;

     {* Posicionando a forma de localizacao do produto *}
  pnLocal1.visible := false;
  pnLocal1.left    := 37;
  pnLocal2.visible := false;
  pnLocal2.left    := 37;
  pnLocal3.visible := false;
  pnLocal3.left    := 37;
  n_ordem_f7       :=1;
  if (frm_principal.x_ordem_codigo=1) then
    pnLocal1.visible := true
  else
  if (frm_principal.x_ordem_refinterna=1) then
    pnLocal2.visible := true
  else
  if (frm_principal.x_ordem_reffabric=1) then
    pnLocal3.visible := true;
end;

procedure Tfrm_inventario1.MudaFocoCodigo;
begin
  if (gbItem_ProdCorTam.visible) then
  begin
    pnLocal1.visible:=false;
    pnLocal2.visible:=false;
    pnLocal3.visible:=false;
    n_ordem_f7 := n_ordem_f7 + 1;
    if (n_ordem_f7=4) then
      n_ordem_f7:=1
    else
    if (n_ordem_f7=0) then
      n_ordem_f7:=3;
    if (frm_principal.x_ordem_codigo=n_ordem_f7) then
    begin
      pnLocal1.visible := true;
      edtGrupo.setfocus;
    end
    else
    if (frm_principal.x_ordem_refinterna=n_ordem_f7) then
    begin
      pnLocal2.visible := true;
      edtRefInt.setfocus;
    end
    else
    if (frm_principal.x_ordem_reffabric=n_ordem_f7) then
    begin
      pnLocal3.visible := true;
      edtForn.setfocus;
    end;
  end;
end;

procedure Tfrm_inventario1.edtQtdeEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
     //************************************************************
  if (gbItem_CBarra.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      edtQtde.text := '1';
      if (pnDescItem2.caption<>'<Item de produto não encontrado>') then
        btnIncluir1Click(btnIncluir1);
    end;
  end
  else
  if (gbItem_CBarra_EAN13.visible) then
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      edtQtde.text := '1';
      if (pnDescItem2EAN13.caption<>'<Item de produto não encontrado>') then
        btnIncluir1Click(btnIncluir1);
    end;
     //************************************************************
end;

procedure Tfrm_inventario1.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnIncluir1Click(Sender);
  if (key=38) or (key=K_ESC) then
    if (gbItem_ProdCorTam.visible) then
    begin
      if (edtFaixaTam.enabled) then
        edtFaixaTam.setfocus
      else
      if (edtCor.enabled) and (edtCor.color<>clNavy) then
        edtCor.setfocus
      else
        FocaCodigoLocal2;
    end
    else
    if (gbItem_CBarra.visible) then
      edtCBarra.setfocus;
  if (key=k_F2) then
    grade.setfocus;   
end;

procedure Tfrm_inventario1.Limparcadastro1Click(Sender: TObject);
begin
  Novoproduto1.click;
end;

procedure Tfrm_inventario1.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  gbItem_ProdCorTam.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  Panel1.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  gbItem_Cbarra.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  gbItem_ProdCorTam.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TPanel) then
      TPanel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  botao_sair.caption:='SAIR';
  Lista.Free;
end;

{Controle de foco do produto ***}
procedure Tfrm_inventario1.FocaCodigoLocal1;
begin
  if (pnLocal1.visible) then
    edtGrupo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus
  else
  if (pnLocal3.visible) then
    edtForn.setfocus;
end;

{Controle de foco do produto ***}
procedure Tfrm_inventario1.FocaCodigoLocal2;
begin
  if (pnLocal1.visible) then
    edtCodigo.setfocus
  else
  if (pnLocal2.visible) then
    edtRefInt.setfocus
  else
  if (pnLocal3.visible) then
    edtRefFab.setfocus;
end;

procedure Tfrm_inventario1.RefrescaTabela;
begin
  qInventario.disablecontrols;
  qInventario.close;
  with (qInventario) do
  begin
    sql.clear;
    sql.Add('SELECT GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO,DATA,TIPZ,CBARRA,SALDO,    ');
    sql.Add('       DESCRICAO,REFINT,FORN,REFFAB,UNID                             ');
    sql.Add('FROM   LOTE_INVENTARIO                                               ');
    sql.Add('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)                          ');
    if (tipz='1') or (tipz='2') then
      sql.Add(' AND (TIPZ=:tipz)                                                 ');
    sql.Add('ORDER BY SEQ                                                         ');
    parambyname('loja').AsFloat := frm_principal.x_loja;
    parambyname('terminal').AsFloat := frm_principal.x_terminal;
    if (tipz='1') or (tipz='2') then
      parambyname('tipz').AsString := tipz;
  end;
  qInventario.open;
  qInventario.enablecontrols;
end;

procedure Tfrm_inventario1.edtCorChange(Sender: TObject);
begin
  if (Trim(edtCor.text)<>'') then
    n_cor := strtofloat(Trim(edtCor.text))
  else
    n_cor := -1;
end;

procedure Tfrm_inventario1.edtCorDblClick(Sender: TObject);
begin
  ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
end;

procedure Tfrm_inventario1.edtCorEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe cores cadastradas';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.edtCorExit(Sender: TObject);
var
  codigo: String;
begin
  codigo:=Trim(edtCor.text);
  if (codigo<>'') then
  begin
    pnCor.caption:=ProcuraNomeCor(strtofloat(codigo),self);
    edtCor.text:=form_nz(strtofloat(codigo),4);
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.edtCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
      edtQtde.setfocus;
  if (key=38) or (key=K_ESC) then
    FocaCodigoLocal2;
  if (key=K_F8) then
    ChamandoF8CoresProdutos(n_grupo,n_subgrupo,n_produto,edtCor);
  if (key=k_F2) then
    grade.setfocus;
end;

procedure Tfrm_inventario1.edtFaixaTamChange(Sender: TObject);
begin
  if (Trim(edtFaixaTam.text)<>'') then
    n_tam := Trim(edtFaixaTam.text)
  else
    n_tam := '-1';
end;

procedure Tfrm_inventario1.edtFaixaTamDblClick(Sender: TObject);
begin
  ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_inventario1.edtFaixaTamEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.caption:='exibe faixas de tamanho do produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.edtFaixaTamExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  faixa: String;
begin
     {Critica dos dados}
  if (Trim(edtFaixaTam.text)<>'') then
    with (clAux) do
    begin
      faixa := Trim(edtFaixaTam.text);
      clAux := TClassAuxiliar.Create;
      conect (databaseprodutos,self);
      ClearSql;
      AddParam ('Select PF_TAMA                                  ');
      AddParam ('From PRODUTOS_FAIXAS                            ');
      AddParam ('Where (PF_GRUP='+floattostr(n_grupo)+') AND     ');
      AddParam ('      (PF_SUBG='+floattostr(n_subgrupo)+') AND  ');
      AddParam ('      (PF_PROD='+floattostr(n_produto)+') AND   ');
      AddParam ('      (PF_TAMA='+chr(39)+faixa+chr(39)+')       ');
      if (not Execute) then
      begin
        frmDialogo.ExibirMensagem (' Faixa não permitida para o produto! '
          ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtFaixaTam.setfocus;
      end;
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.MudaFocoCodigoItem;
begin
  gbItem_CBarra_EAN13.visible := false;
  gbItem_CBarra.visible       := false;
  gbItem_ProdCorTam.visible   := false;
  n_ordem_ctrf7 := n_ordem_ctrf7 + 1;
  if (n_ordem_ctrf7=4) then
    n_ordem_ctrf7:=1;
  if (frm_principal.x_ordem_cbarra=n_ordem_ctrf7) then
  begin
    gbItem_CBarra.visible     := true;
    edtCBarra.setfocus;
  end
  else
  if (frm_principal.x_ordem_prod_cor_tam=n_ordem_ctrf7) then
  begin
    gbItem_ProdCorTam.visible := true;
    FocaCodigoLocal1;
  end
  else
  if (frm_principal.x_ordem_cbarra_ean13=n_ordem_ctrf7) then
  begin
    gbItem_CBarra_EAN13.visible     := true;
    edtCBarraEAN13.setfocus;
  end;
end;

procedure Tfrm_inventario1.edtFaixaTamKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtQtde.setfocus;
  if (key=38) or (key=K_ESC) then
    if (edtCor.enabled) and (edtCor.color<>clNavy) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  if (key=k_F2) then
    grade.setfocus;
  if (key=K_F8) then
    ChamandoF8Faixas (edtFaixaTam,n_grupo,n_subgrupo,n_produto,false);
end;

procedure Tfrm_inventario1.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clAux: TClassAuxiliar;
  cbarraant: String;
  total: Integer;
begin
  if (key=K_INSERT) then
    Novoproduto1.click;
  if (key=K_F2) then
    if (gbItem_ProdCorTam.visible) then
      FocaCodigoLocal1
    else
    if (gbItem_cBarra.visible) then
      edtCbarra.setfocus
    else
    if (gbItem_CBarra_EAN13.visible) then
      edtCBarraEAN13.setfocus;
  if (key=K_DELETE) then
  begin
    frmDialogo.posativ:=2;
    if (frmDialogo.ExibirMensagem ('Confirma exclusão do item selecionado?'
      ,'Inventário',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      qInventario.disablecontrols;
      qInventario.next;
      if (not qInventario.eof) then
      begin
        cbarraant:=qInventario.fieldbyname('CBARRA').AsString;
        qInventario.prior;
      end
      else
      begin
        qInventario.prior;
        if (not qInventario.bof) then
        begin
          cbarraant:=qInventario.fieldbyname('CBARRA').AsString;
          qInventario.next;
        end
        else
          cbarraant:='?';
      end;

              //*****************************************************************
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('VENDAS',self);
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM LOTE_INVENTARIO                      ');
      clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal) AND  ');
      clAux.AddParam ('      (CBARRA=:codigo_barras) AND                ');
      clAux.AddParam ('      (TIPZ=:tipz)                               ');
      clAux.consulta.parambyname('loja').AsFloat           := frm_principal.x_loja;
      clAux.consulta.parambyname('terminal').AsFloat       := frm_principal.x_terminal;
      clAux.consulta.parambyname('codigo_barras').AsString := qInventario.fieldbyname('CBARRA').AsString;
      clAux.consulta.parambyname('tipz').AsString          := qInventario.fieldbyname('TIPZ').AsString;
      clAux.Execute; {*}
      clAux.desconect;
      clAux.Free;
              //*****************************************************************
      RefrescaTabela;
      qInventario.disablecontrols;
      qInventario.first;
      total:=0;
      while (not qInventario.eof) do
      begin
        total := total + qInventario.fieldbyname('SALDO').AsInteger;
        qInventario.next;
      end;
      pnTotalSaldo.caption := form_n(total,5);
      qInventario.enablecontrols;
//              total := strtoint(trim(pnTotalSaldo.caption));
//              total := total - qInventario.fieldbyname('SALDO').AsInteger;
      pnTotalSaldo.caption := form_n(total,5);

      if (cbarraant<>'?') then
      begin
        qInventario.first;
        while (cbarraant<>qInventario.fieldbyname('CBARRA').AsString) do
          qInventario.next;
      end;
      qInventario.enablecontrols;
              //*****************************************************************
      grade.setfocus;
              //*****************************************************************
    end;
  end;
end;

procedure Tfrm_inventario1.gradeEnter(Sender: TObject);
begin
  lblDel.visible:=true;
  lblMensDel.visible:=true;
  lbF8.visible:=true;
  lbF8.caption:='INS->';
  lbF8Mens.caption:='lança novo produto';
  lbF8Mens.visible:=true;
end;

procedure Tfrm_inventario1.gradeExit(Sender: TObject);
begin
  lblDel.visible:=false;
  lblMensDel.visible:=false;
  lbF8.visible:=false;
  lbF8.caption:='F8->';
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.edtCodigoExit(Sender: TObject);
var
  clProd: TClassAuxiliar;
  grupo,subgrupo,codigo: String;
begin
  grupo    := Trim(edtGrupo.text);
  subgrupo := Trim(edtSubGrupo.text);
  codigo   := Trim(edtCodigo.text);
  if (grupo<>'') and (subgrupo<>'') and (codigo<>'') then
    with (clProd) do
    begin
      clProd := TClassAuxiliar.Create;
      conect (databaseprodutos, self);
      clearSql;
      AddParam ('Select PR_DESC,PR_CUNI,PR_TUNI,PR_UNID, ');
      AddParam ('       PR_REFF,PR_REFI,PR_FORN          ');
      AddParam ('From   PRODUTOS                         ');
      AddParam ('Where (PR_SUBG='+subgrupo+') AND        ');
      AddParam ('      (PR_GRUP='+grupo+') AND           ');
      AddParam ('      (PR_CODI='+codigo+')              ');
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

                {*** sugerindo a ref. fabricante/ref. interna}
        edtRefInt.text    := Trim(Result('PR_REFI'));
        edtRefFab.text    := Trim(Result('PR_REFF'));
        edtForn.text      := form_nz(Result('PR_FORN'),6);
        edtUnidade.text:=result('PR_UNID');
      end
      else
      begin
        edtRefInt.text    := '';
        edtRefFab.text    := '';
        edtForn.text      := '';
        pnProduto.caption:='<Produto nao encontrado>';
      end;
      edtGrupo.text    := form_nz (StrToFloat(grupo),2);
      edtSubGrupo.text := form_nz (StrToFloat(subgrupo),2);
      edtCodigo.text   := form_nz(StrToFloat(codigo),4);
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        if (edtCor.color<>clNavy) then
        begin
          edtCor.text:='0';
          desabilitaeditVerde(edtCor);
          pnCor.caption:='Cor única';
        end;
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.edtGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.edtSubGrupoExit(Sender: TObject);
begin
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
end;

procedure Tfrm_inventario1.Imprimirlotedeinventrio1Click(Sender: TObject);
var
  labeltipz: String;
  indGauge,totGauge: Integer;
  grupo,subgrupo,produto,cor: Real;
  unidade: String;
  reffabric,tamanho,refinterna,tam: String;
  SavePlace: TBookmark;
  total_qtde: Real;
begin
  SavePlace := qInventario.GetBookmark;

     {iniciando o processamento do relatorio}
  ds1.dataset.disablecontrols;
  mostra_mensagem ('Preparando listagem...Aguarde!');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  with (frm_mem_print) do
  begin
         {configurando o gerador de relatorios}
    PrepareReport;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_comando       := '15c';
    frm_principal.x_arq_impressao := 'p08.rel';
    frm_principal.x_tam_fonte     := 8;
    Title:= 'LOTE DE INVENTARIO';

    labeltipz:='|';
    if (tipz='2') or (tipz='3') then
    begin
      AddLine ('Sr..: '+tipz);
      labeltipz:='|Sr'
    end;
    AddLine (form_tc2('-',132,'-'));
    AddLine ('Data      |            |                                           |     |     |Codigo de          |      |       |');
    if (frm_principal.x_ordem_codigo=1) then
      AddLine ('Invent.   |Codigo      |Descricao                                  |Cor  |Tama |Barras             |Unid  |Qtde   '+labeltipz)
    else
    if (frm_principal.x_ordem_refinterna=1) then
      AddLine ('Invent.   |Ref.Interna |Descricao                                  |Cor  |Tama |Barras             |Unid  |Qtde   '+labeltipz)
    else
    if (frm_principal.x_ordem_reffabric=1) then
      AddLine ('Invent.   |Ref.Fabric. |Descricao                                  |Cor  |Tama |Barras             |Unid  |Qtde   '+labeltipz);
    AddLine (form_tc2('-',132,'-'));
    indGauge:=0;
    totGauge:=ds1.dataset.recordcount;
    ds1.dataset.first;
    total_qtde := 0;
    while (not ds1.dataset.eof) do
    begin
      grupo       := ds1.dataset.fieldbyname('GRUPO').AsFloat;
      subgrupo    := ds1.dataset.fieldbyname('SUBGRUPO').AsFloat;
      produto     := ds1.dataset.fieldbyname('PRODUTO').AsFloat;
      cor         := ds1.dataset.fieldbyname('COR').AsFloat;
      tam         := ds1.dataset.fieldbyname('TAMANHO').AsString;
      refinterna  := ds1.dataset.fieldbyname('REFINT').AsString;
      reffabric   := ds1.dataset.fieldbyname('REFFAB').AsString;
      unidade     := ds1.dataset.fieldbyname('UNID').AsString;

      if (tam='0') then
        tamanho:='UNICO'
      else
        tamanho:=tam;
      labeltipz:='';
      if (tipz='2') or (tipz='3') then
        labeltipz:=' '+ds1.dataset.fieldbyname('TIPZ').AsString
      else
        labeltipz:='';
      if (frm_principal.x_ordem_codigo=1) then
        AddLine (form_data(ds1.dataset.fieldbyname('DATA').AsDateTime)+' '+
          form_nz  (grupo,2)    +
          form_nz  (subgrupo,2) +
          form_nz  (produto,4)  +'     '+
          form_t   (ds1.dataset.fieldbyname('DESCRICAO').AsString,43)+' '+
          form_t   (ProcuraAbrevCor(cor,self),5)+' '+
          form_t   (tamanho,5)  +' '+
          form_t   (ds1.dataset.fieldbyname('CBARRA').AsString,20)+' '+
          form_t   (unidade,5)+' '+
          form_n   (ds1.dataset.fieldbyname('SALDO').AsFloat,9)+labeltipz)
      else
      if (frm_principal.x_ordem_refinterna=1) then
        AddLine (form_data(ds1.dataset.fieldbyname('DATA').AsDateTime)+' '+
          form_t(refinterna,11)+' '+
          form_t   (ds1.dataset.fieldbyname('DESCRICAO').AsString,43)+' '+
          form_t   (ProcuraAbrevCor(cor,self),5)+' '+
          form_t   (tamanho,5)  +' '+
          form_t   (ds1.dataset.fieldbyname('CBARRA').AsString,20)+' '+
          form_t   (unidade,5)+' '+
          form_n   (ds1.dataset.fieldbyname('SALDO').AsFloat,9)+labeltipz)
      else
      if (frm_principal.x_ordem_reffabric=1) then
        AddLine (form_data(ds1.dataset.fieldbyname('DATA').AsDateTime)+' '+
          form_t(reffabric,11)+' '+
          form_t   (ds1.dataset.fieldbyname('DESCRICAO').AsString,43)+' '+
          form_t   (ProcuraAbrevCor(cor,self),5)+' '+
          form_t   (tamanho,5)  +' '+
          form_t   (ds1.dataset.fieldbyname('CBARRA').AsString,20)+' '+
          form_t   (unidade,5)+' '+
          form_n   (ds1.dataset.fieldbyname('SALDO').AsFloat,9)+labeltipz);

              {prox. item -->}
      total_qtde := total_qtde + ds1.dataset.fieldbyname('SALDO').AsFloat;
      ds1.dataset.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.gauge1.refresh;
    end;
    AddLine (form_tc2('-',132,'-'));
    AddLine ('  Total de itens...: '+form_n(indGauge,8)+' '+
      form_Tc2(' ',70,' ')+
      form_n(total_qtde,15));
    AddLine ('');

         {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
  ds1.dataset.enablecontrols;
  qInventario.GotoBookmark(saveplace);
  qInventario.FreeBookmark(saveplace);
  grade.setfocus;
end;

procedure Tfrm_inventario1.Limpartodoolote1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  frmDialogo.posativ:=2;
  if (frmDialogo.ExibirMensagem ('Confirma limpeza do lote?'
    ,'Inventário',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM LOTE_INVENTARIO                  ');
    clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)  ');
    clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
    clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
    clAux.Execute; {*}
    clAux.desconect;
    clAux.Free;
    RefrescaTabela;
    pnTotalSaldo.caption := form_n(0,5);
    grade.setfocus;
  end;
end;

procedure Tfrm_inventario1.edtFornChange(Sender: TObject);
begin
  if (Trim(edtForn.text)<>'') then
    n_forn := strtofloat(Trim(edtForn.text))
  else
    n_forn := 0;
end;

procedure Tfrm_inventario1.edtFornDblClick(Sender: TObject);
begin
  ChamandoF8Forn(edtForn,true);
end;

procedure Tfrm_inventario1.edtFornEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtFornExit(Sender: TObject);
begin
  if (n_forn<>0) then
    edtForn.text := form_nz(n_forn,6);
end;

procedure Tfrm_inventario1.edtFornKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtRefFab.setfocus;
  if (key=K_ESC) or (key=38) then
  ;
  if (key=K_F7) then
    MudaFocoCodigo;
  if (key=K_F8) then
    ChamandoF8Forn(edtForn,true);
  if (key=k_F2) then
    grade.setfocus;
end;

procedure Tfrm_inventario1.edtRefFabDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ConsultaProduto,frm_ConsultaProduto);
  frm_ConsultaProduto.y_RotinaChamadora := 3;
  frm_ConsultaProduto.showmodal;
  if (frm_ConsultaProduto.y_grupo<>'?') then
  begin
    edtGrupo.text    := frm_ConsultaProduto.y_grupo;
    edtSubgrupo.text := frm_ConsultaProduto.y_subgrupo;
    edtCodigo.text   := frm_ConsultaProduto.y_produto;
    edtRefInt.text   := frm_ConsultaProduto.y_refint;
    edtRefFab.text   := frm_ConsultaProduto.y_reffab;
    FocaCodigoLocal1;
  end;
  frm_ConsultaProduto.Free;
end;

procedure Tfrm_inventario1.Novoproduto1Click(Sender: TObject);
begin
  if (edtCor.color<>clNavy) then
    habilitaeditVerde(edtCor);
  habilitaeditVerde(edtFaixaTam);
  edtGrupo.text       := '';
  edtSubGrupo.text    := '';
  edtCodigo.text      := '';
  edtRefInt.text      := '';
  edtForn.text        := '';
  edtRefFab.text      := '';
  if (edtCor.color<>clNavy) then
  begin
    edtCor.text     := '';
    pnCor.caption   := '';
  end;
  edtFaixaTam.text    := '';
  edtUnidade.text     := '';
  edtCBarra.text      := '';
  edtCBarraEAN13.text := '';
  edtQtde.text        := '';
  pnProduto.caption   := '';
  pnDescItem2.caption := '';
  pnDescItem2EAN13.caption := '';
  if (gbItem_ProdCorTam.visible) then
    FocaCodigoLocal1
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus
  else
  if (gbItem_CBarra_EAN13.visible) then
    edtCBarraEAN13.setfocus;
end;

procedure Tfrm_inventario1.btnIncluir1Click(Sender: TObject);
var
  clAux,clAux2,clAux3: TClassAuxiliar;
  continua: Boolean;
  quantidade_ja_existente: Real;
  codigo_barras: String;
  sequencia: Integer;
  tipzant: String;
  dif,total: Integer;
  fazpergunta: Boolean;
begin
  tipzant := tipz;
  if (tipz='3') then
    tipz:='1';

     {CRITICA AOS DADOS}
  continua:=true;
  if (gbItem_ProdCorTam.visible) then
  begin
    if (n_grupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Grupo não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_subgrupo=0) and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Subgrupo não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtSubGrupo.setfocus;
      continua:=false;
    end
    else
    if (n_produto=0)  and (pnLocal1.visible) then
    begin
      frmDialogo.ExibirMensagem (' Código do produto não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCodigo.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefInt.text)='')  and (pnLocal2.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Interna não pode ficar vazia! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtRefInt.setfocus;
      continua:=false;
    end
    else
    if (trim(edtForn.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Fornecedor não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtForn.setfocus;
      continua:=false;
    end
    else
    if (trim(edtRefFab.text)='')  and (pnLocal3.visible) then
    begin
      frmDialogo.ExibirMensagem (' Ref. Fabric. não pode ficar vazia! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtRefFab.setfocus;
      continua:=false;
    end
    else
    if (n_cor=-1) then
    begin
      frmDialogo.ExibirMensagem (' Cor não pode ficar vazia! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCor.setfocus;
      continua:=false;
    end
    else
    if (n_tam='-1') then
    begin
      frmDialogo.ExibirMensagem (' Tamanho não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtFaixaTam.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Saldo não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;
  end
  else
  if (gbItem_CBarra.visible) then
  begin
    if (Trim(edtCBarra.text)='') then
    begin
      frmDialogo.ExibirMensagem (' O código de barras não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (pnDescItem2.caption='<Item de produto não encontrado>') then
    begin
      frmDialogo.ExibirMensagem (' O item de produto não está cadastrado ou não existe! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarra.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Saldo não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;
  end
  else
  if (gbItem_CBarra_EAN13.visible) then
    if (Trim(edtCBarraEAN13.text)='') then
    begin
      frmDialogo.ExibirMensagem (' O código de barras EAN13 não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarraEAN13.setfocus;
      continua:=false;
    end
    else
    if (pnDescItem2EAN13.caption='<Item de produto não encontrado>') then
    begin
      frmDialogo.ExibirMensagem (' O item de produto não está cadastrado ou não existe! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtCBarraEAN13.setfocus;
      continua:=false;
    end
    else
    if (edtQtde.text='') then
    begin
      frmDialogo.ExibirMensagem (' Saldo não pode ficar vazio! '
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtde.setfocus;
      continua:=false;
    end;

    {...}
  if (continua) then
  begin
        {************************************************************************}
    clAux := TClassAuxiliar.Create;
    clAux.conect    (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam  ('SELECT ES_CBAR,                                 ');
    clAux.AddParam  ('       PR_DESC,PR_REFI,PR_FORN,PR_REFF,PR_UNID  ');
    clAux.AddParam  ('FROM   ESTOQUE,PRODUTOS                         ');
    clAux.AddParam  ('WHERE (ES_GRUP='+floattostr(n_grupo)+') AND     ');
    clAux.AddParam  ('      (ES_SUBG='+floattostr(n_subgrupo)+') AND  ');
    clAux.AddParam  ('      (ES_PROD='+floattostr(n_produto)+') AND   ');
    clAux.AddParam  ('      (ES_CORE='+floattostr(n_cor)+') AND       ');
    clAux.AddParam  ('      (ES_TAMA='+chr(39)+n_tam+chr(39)+') AND   ');
    clAux.AddParam  ('      (ES_GRUP=PR_GRUP) AND (ES_SUBG=PR_SUBG) AND (ES_PROD=PR_CODI) ');
    frm_mensagem.painel.visible:=true;
    frm_mensagem.gauge1.progress:=0;
    if (not clAux.Execute) then
      frmDialogo.ExibirMensagem ('Este item de COR/TAMANHO informados não está cadastrado para este produto!'
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
            {************************************************************************}
      codigo_barras := clAux.result('ES_CBAR'); {*}
            {************************************************************************}
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   ('VENDAS',self);
      clAux2.ClearSql;
      clAux2.AddParam ('SELECT DATA,SALDO FROM LOTE_INVENTARIO           ');
      clAux2.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal) AND  ');
      clAux2.AddParam ('      (CBARRA=:cbarra) AND                       ');
      clAux2.AddParam ('      (TIPZ=:tipz)                               ');
      clAux2.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
      clAux2.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
      clAux2.consulta.parambyname('cbarra').AsString  := codigo_barras;
      clAux2.consulta.parambyname('tipz').AsString    := tipz;
      if (clAux2.Execute) then
      begin
                {*****************************************************************************************************************}
        if (gbItem_CBarra.visible) then
        begin
          if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
            fazpergunta := false
          else
            fazpergunta := true;
        end
        else
        if (gbItem_CBarra_EAN13.visible) then
        begin
          if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
            fazpergunta := false
          else
            fazpergunta := true;
        end
        else
          fazpergunta := true;
                {*****************************************************************************************************************}
        if (fazpergunta) then
        begin
          frmDialogo.posativ:=1;
          if (frmDialogo.ExibirMensagem ('Item já lançado! Adicionar saldo?'
            ,'Venda',[mbYes,mbNo]
            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
          begin
            quantidade_ja_existente := clAux2.result('SALDO') + strtofloat(trim(edtQtde.text));
            dif := strtoint(trim(edtQtde.text)); {*}
          end
          else
          begin
            quantidade_ja_existente := strtofloat(trim(edtQtde.text));
            if (clAux2.result('SALDO')>strtofloat(trim(edtQtde.text))) then
              dif := strtoint(trim(edtQtde.text)) - clAux2.result('SALDO')
            else
              dif := strtoint(trim(edtQtde.text)); {*}
          end;
        end
        else
        begin
          quantidade_ja_existente := clAux2.result('SALDO') + strtofloat(trim(edtQtde.text));
          dif := strtoint(trim(edtQtde.text)); {*}
        end;
                //*******************************************************************************
        clAux3 := TClassAuxiliar.Create;
        clAux3.conect   ('VENDAS',self);
        clAux3.ClearSql;
        clAux3.AddParam ('UPDATE LOTE_INVENTARIO                            ');
        clAux3.AddParam ('SET    SALDO=:novosaldo,                          ');
        clAux3.AddParam ('       DATA=:novadata                             ');
        clAux3.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal) AND   ');
        clAux3.AddParam ('      (CBARRA=:cbarra) AND                        ');
        clAux3.AddParam ('      (TIPZ=:tipz)                                ');
        clAux3.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
        clAux3.consulta.parambyname('terminal').AsFloat    := frm_principal.x_terminal;
        clAux3.consulta.parambyname('cbarra').AsString     := codigo_barras;
        clAux3.consulta.parambyname('tipz').AsString       := tipz;
        clAux3.consulta.parambyname('novosaldo').AsFloat   := quantidade_ja_existente;
        clAux3.consulta.parambyname('novadata').AsDateTime := frm_principal.x_data_trabalho;
        clAux3.Execute;
        clAux3.desconect;
        clAux3.Free;
                //*******************************************************************************
      end
      else
      begin
        sequencia := InformaProximaSequenciaLote; {*}
        quantidade_ja_existente := strtofloat(trim(edtQtde.text)); {*}

                //*******************************************************************************
        clAux3 := TClassAuxiliar.Create;
        clAux3.conect   ('VENDAS',self);
        clAux3.ClearSql;
        clAux3.AddParam ('INSERT INTO LOTE_INVENTARIO(LOJA,TERMINAL,GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO,SALDO,TIPZ,DATA,SEQ,CBARRA,DESCRICAO,REFINT,FORN,REFFAB,UNID,TIPZANT)  ');
        clAux3.AddParam ('VALUES (:LOJA,:TERMINAL,:GRUPO,:SUBGRUPO,:PRODUTO,:COR,:TAMANHO,:SALDO,:TIPZ,:DATA,:SEQ,:CBARRA,:DESCRICAO,:REFINT,:FORN,:REFFAB,:UNID,:TIPZANT)     ');
        clAux3.consulta.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
        clAux3.consulta.parambyname('TERMINAL').AsFloat   := frm_principal.x_terminal;
        clAux3.consulta.parambyname('GRUPO').AsFloat      := n_grupo;
        clAux3.consulta.parambyname('SUBGRUPO').AsFloat   := n_subgrupo;
        clAux3.consulta.parambyname('PRODUTO').AsFloat    := n_produto;
        clAux3.consulta.parambyname('COR').AsFloat        := n_cor;
        clAux3.consulta.parambyname('TAMANHO').AsString   := n_tam;
        clAux3.consulta.parambyname('TIPZ').AsString      := tipz;
        clAux3.consulta.parambyname('DATA').AsDateTime    := frm_principal.x_data_trabalho;
        clAux3.consulta.parambyname('CBARRA').AsString    := codigo_barras;
        clAux3.consulta.parambyname('SALDO').AsFloat      := quantidade_ja_existente;
        clAux3.consulta.parambyname('SEQ').AsInteger      := sequencia;
        clAux3.consulta.parambyname('DESCRICAO').AsString := clAux.result('PR_DESC');
        clAux3.consulta.parambyname('REFINT').AsString    := clAux.result('PR_REFI');
        clAux3.consulta.parambyname('REFFAB').AsString    := clAux.result('PR_REFF');
        clAux3.consulta.parambyname('FORN').AsFloat       := clAux.result('PR_FORN');
        clAux3.consulta.parambyname('UNID').AsString      := clAux.result('PR_UNID');
        clAux3.consulta.parambyname('TIPZANT').AsString      := tipzant;
        clAux3.Execute;
        clAux3.desconect;
        clAux3.Free;
                //*******************************************************************************
        dif := strtoint(trim(edtQtde.text)); {*}
                //*******************************************************************************
      end;

            {*************************************************}
      if (chAtualizar.checked) then
      begin
        RefrescaTabela;
        qInventario.last;
      end;
      total := strtoint(trim(pnTotalSaldo.caption));
      total := total + (dif);
      pnTotalSaldo.caption := form_n(total,5);

            {*************************************************}
            {* Deslocamento do focu}
      edtQtde.text := '';
      if (gbItem_ProdCorTam.visible) then
      begin
        if (not n_tam_unico) then
        begin
          edtFaixaTam.text:='';
          edtFaixaTam.setfocus;
        end
        else
        if (not n_cor_unica) then
        begin
          edtCor.text:='';
          edtCor.setfocus;
        end
        else
          Novoproduto1.click;
      end
      else
      if (gbItem_cbarra.visible) then
        Novoproduto1.click
      else
      if (gbItem_cbarra_EAN13.visible) then
        Novoproduto1.click;
            {*************************************************}
    end;
    clAux.desconect;
    clAux.Free;
  end;
  tipz := tipzant;
end;

procedure Tfrm_inventario1.btnLimparClick(Sender: TObject);
begin
  Limpartodoolote1.click;
end;

function Tfrm_inventario1.InformaProximaSequenciaLote:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(SEQ) as MAX_SEQ FROM LOTE_INVENTARIO   ');
  clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)       ');
  clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  result := clAux.result('MAX_SEQ')+1;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_inventario1.qInventarioCalcFields(DataSet: TDataSet);
var
  clAux: TClassAuxiliar;
begin
  with (qInventario) do
  begin
    if (fieldbyname('cCor').IsNull) then
      if (fieldbyname('COR').AsFloat=0) then
        fieldbyname('cCor').AsString:='UNICA'
      else
        fieldbyname('cCor').AsString:=
          fieldbyname('COR').AsString+'/'+
          ProcuraAbrevCor(fieldbyname('COR').AsFloat,self);
    if (fieldbyname('cTam').IsNull) then
      if (fieldbyname('TAMANHO').AsString='0') then
        fieldbyname('cTam').AsString:='UNICO'
      else
        fieldbyname('cTam').AsString:=fieldbyname('TAMANHO').AsString;
  end;
end;

procedure Tfrm_inventario1.chAtualizarClick(Sender: TObject);
begin
  if (chAtualizar.checked) then
  begin
    RefrescaTabela;
    qInventario.last;
  end;
end;

procedure Tfrm_inventario1.Fixarcornolanamento1Click(Sender: TObject);
begin
  if (edtCor.color<>clNavy) then
  begin
    edtCor.color:=clNavy;
    edtCor.font.color:=clWhite;
    edtCor.readonly:=true;
  end
  else
  begin
    edtCor.color:=clWhite;
    edtCor.font.color:=clBlack;
    edtCor.readonly:=false;
  end;
end;

procedure Tfrm_inventario1.FormActivate(Sender: TObject);
begin
     {********************************************************************************}
  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    lbleituracbarra.caption := '>leitura manual da qtde.'
  else
  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    lbleituracbarra.caption := '>leitura direta';
     {********************************************************************************}
  if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    lbleituracbarraEAN13.caption := '>leitura manual da qtde.'
  else
  if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    lbleituracbarraEAN13.caption := '>leitura direta';
     {********************************************************************************}
  if (gbItem_ProdCorTam.visible) then
  begin
    if (edtFaixaTam.enabled) then
      edtFaixaTam.setfocus
    else
    if (edtCor.enabled) and (edtCor.color<>clNavy) then
      edtCor.setfocus
    else
      FocaCodigoLocal2;
  end
  else
  if (gbItem_CBarra.visible) then
    edtCBarra.setfocus
  else
  if (gbItem_CBarra_EAN13.visible) then
    edtCBarraEAN13.setfocus;
end;

procedure Tfrm_inventario1.Mudarformadeleituradocdigodebarras1Click(Sender: TObject);
begin
     {********************************************************************************}
  if (gbItem_CBarra.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 1;
      lbleituracbarra.caption := '>leitura direta';
    end
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 0;
      lbleituracbarra.caption := '>leitura manual da qtde.';
    end;
    Novoproduto1.click;
    edtCBarra.setfocus;
  end
  else
  if (gbItem_CBarra_EAN13.visible) then
  begin
    if (frm_principal.x_forma_de_leitura_codigo_barras=0) then //manual
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 1;
      lbleituracbarraEAN13.caption := '>leitura direta';
    end
    else
    if (frm_principal.x_forma_de_leitura_codigo_barras=1) then //direta
    begin
      frm_principal.x_forma_de_leitura_codigo_barras := 0;
      lbleituracbarraEAN13.caption := '>leitura manual da qtde.';
    end;
    Novoproduto1.click;
    edtCBarraEAN13.setfocus;
  end;
     {********************************************************************************}
end;

procedure Tfrm_inventario1.edtCBarraEAN13Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_inventario1.edtCBarraEAN13Exit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cbarra: String;
  a: Integer;
  continua: Boolean;
begin
  continua := true;
  cbarra := Trim(edtCBarraEAN13.text);
  if (cbarra<>'') then
    with (clAux) do
    begin
      clAux := TClassAuxiliar.Create;
      conect   (databaseprodutos, self);
      clearSql;
      AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,               ');
      AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,       ');
      AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_REFF        ');
      AddParam ('From   ESTOQUE,PRODUTOS                               ');
      AddParam ('Where (ES_CEAN='+chr(39)+cbarra+chr(39)+') AND        ');
      AddParam ('      (ES_GRUP=PR_GRUP) AND                           ');
      AddParam ('      (ES_SUBG=PR_SUBG) AND                           ');
      AddParam ('      (ES_PROD=PR_CODI)                               ');
      if not (Execute) then
      begin
        a := length(edtCBarraEAN13.Text);
        cbarra := copy(cbarra,1,(a-1));
        clearSql;
        AddParam ('Select ES_REFF,ES_CBAR,ES_DESC,PR_UNID,               ');
        AddParam ('       ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,       ');
        AddParam ('       PR_CUNI,PR_TUNI,PR_REFI,PR_DESC,PR_REFF        ');
        AddParam ('From   ESTOQUE,PRODUTOS                               ');
        AddParam ('Where (ES_CEAN='+chr(39)+cbarra+chr(39)+') AND        ');
        AddParam ('      (ES_GRUP=PR_GRUP) AND                           ');
        AddParam ('      (ES_SUBG=PR_SUBG) AND                           ');
        AddParam ('      (ES_PROD=PR_CODI)                               ');
        if (Execute) then
          continua := true
        else
          continua := false;
      end
      else
        continua := true;
      if (continua) then
      begin
        pnProduto.caption  := result('PR_DESC');
        pnDescItem2.caption := result('ES_DESC');
        pnDescItem2EAN13.caption := result('ES_DESC');
        n_grupo    := result('ES_GRUP');
        n_subgrupo := result('ES_SUBG');
        n_produto  := result('ES_PROD');
        n_cor      := result('ES_CORE');
        n_tam      := result('ES_TAMA');
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
        edtRefInt.text   := Trim(result('PR_REFI'));
        edtReffab.text   := Trim(result('PR_REFF'));
        edtUnidade.text  := Trim(result('PR_UNID'));
        edtGrupo.text    := form_nz (n_grupo,2);
        edtSubGrupo.text := form_nz (n_subgrupo,2);
        edtCodigo.text   := form_nz (n_produto,4);
        edtCor.text      := form_nz (n_cor,4);
        pnCor.caption    := ProcuraNomeCor(n_cor,self);
        edtFaixaTam.text := n_tam;
        edtCBarra.text   := Trim(result('ES_CBAR'));
      end
      else
      begin
        pnProduto.caption   := '<Produto não encontrado>';
        pnDescItem2.caption := '<Item de produto não encontrado>';
        pnDescItem2EAN13.caption := '<Item de produto não encontrado>';
        edtUnidade.text     := '';
        edtGrupo.text    := '';
        edtSubGrupo.text := '';
        edtCodigo.text   := '';
        edtCor.text      := '';
        pnCor.caption    := '';
        edtFaixaTam.text := '';
        edtRefInt.text   := '';
        edtReffab.text   := '';
        edtCBarra.text   := '';
      end;
      desconect;
      Free;

           {...}
      if (n_cor_unica) then
      begin
        if (edtCor.color=clNavy) then
          Fixarcornolanamento1.click;
        edtCor.text:='0';
        desabilitaeditVerde(edtCor);
        pnCor.caption:='Cor única';
      end
      else
        habilitaeditVerde(edtCor);
      if (n_tam_unico) then
      begin
        edtFaixaTam.text:='0';
        desabilitaeditVerde(edtFaixaTam);
      end
      else
        habilitaeditVerde(edtFaixaTam);
    end;
end;

procedure Tfrm_inventario1.edtCBarraEAN13KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    edtCBarraEAN13Exit(Sender);
    edtQtde.setfocus;
  end;
  if (key=K_CIMA) or (key=K_ESC) then
  ;
  if (key=k_F2) then
    grade.setfocus;
end;

end.
