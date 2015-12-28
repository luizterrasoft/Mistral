unit Rl_tite;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, ExtCtrls, Menus, DB, DBTables, Grids,
  DBGrids;

type
  Tfrm_rl_tite = class(TForm)
    cmb_campos: TComboBox;
    Label1: TLabel;
    rdg_range: TRadioGroup;
    msk_inter1: TMaskEdit;
    msk_inter2: TMaskEdit;
    cmd_adiciona: TButton;
    cmd_limpar: TButton;
    MainMenu1: TMainMenu;
    qry_print: TQuery;
    DataSource1: TDataSource;
    msk_atual: TMaskEdit;
    mem_consulta: TMemo;
    mem_sql: TMemo;
    mem_where: TMemo;
    chk_tot: TCheckBox;
    chk_subtot: TCheckBox;
    Principal1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    SQL1: TMenuItem;
    chk_branco: TCheckBox;
    chk_outros: TCheckBox;
    Panel1: TPanel;
    Button3: TButton;
    botao_sair: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    procedure cmd_adicionaClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure cmd_limparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_camposClick(Sender: TObject);
    procedure rdg_rangeClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SQL1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure msk_atualClick(Sender: TObject);
    procedure msk_inter1Click(Sender: TObject);
    procedure msk_inter2Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
    campo:String[7];
  public
    { Public declarations }
    tabela:TTable;
    tabela_nm:String;
    ordem:String;
    vd_nm:String;
    cl_no:Integer;
    fo_no:Integer;
    relat_no:Byte;
  end;

var
  frm_rl_tite: Tfrm_rl_tite;

implementation

{$R *.DFM}

{***sa_tudo***}
uses funcoes1,funcoes2, Principal, mem_prnt, cf_tbl, relat, unDialogo;

{Comando de adicionar ao relatorio de outros ****}
procedure Tfrm_rl_tite.cmd_adicionaClick(Sender: TObject);
var
  tipo: Char;
  cont: Integer;
  text_and: String;
  descricao: String;
  cp: String;
  cpos: Integer;
  cpos2: Integer;
  branco: String[1];
begin
  if chk_branco.checked then
    branco:=' '
  else
    branco:='';
  cp:=copy(cmb_campos.items[cmb_campos.itemindex],20, 9);
  tipo:=cmb_campos.items[cmb_campos.itemindex][71];
  mem_sql.lines.clear;
  mem_sql.lines.add('Select * from '+tabela_nm);
  if mem_where.lines.count=0 then
    mem_where.lines.add('where');
  if pos('Order By', ordem)=0 then
    ordem:='Order By '+ordem;
  if pos(cp, ordem)=0 then
    if pos(',', ordem)=0 then
      ordem:=ordem+cp+','
    else
    if ordem[length(ordem)]=',' then
      ordem:=ordem+' '+cp
    else
      ordem:=ordem+', '+cp;
  with mem_where.lines do
  begin
    campo:=cp;
    cpos:=Tpos(cp, mem_where.lines);
    if (cpos > 1) or ((cpos=-1) and (count>1)) then
      text_and:='and '
    else
      text_and:='';
    if rdg_range.itemindex=1 then
    begin
      campo:='';
      if tipo='I' then
      begin
        if cpos=-1 then
          add(text_and+cp+'='+tsem_brancos(msk_atual.text))
        else
          strings[cpos]:=text_and+cp+'='+tsem_brancos(msk_atual.text)
      end
      else
      if tipo='D' then
      begin
        if cpos=-1 then
          add(text_and+cp+'='+chr(39)+
            copy(msk_atual.text,4,3)+copy(msk_atual.text,1,3)+copy(msk_atual.text,7,4)+chr(39))
        else
          strings[cpos]:=text_and+cp+'='+chr(39)+
            copy(msk_atual.text,4,3)+copy(msk_atual.text,1,3)+copy(msk_atual.text,7,4)+chr(39);
      end
      else
      if tipo='T' then
        if cpos=-1 then
          add(text_and+cp+' LIKE '+chr(39)+tsem_brancos(msk_atual.text)+branco+'%'+chr(39))
        else
          strings[cpos]:=text_and+cp+' LIKE '+chr(39)+tsem_brancos(msk_atual.text)+branco+'%'+chr(39)
    end
    else
    if rdg_range.itemindex=2 then
    begin
      campo:=cp;
      if tipo='I' then
      begin
        if cpos=-1 then
          add(text_and+cp+'>='+tsem_brancos(msk_inter1.text)
            +' and '+cp+'<='+tsem_brancos(msk_inter2.text))
        else
          strings[cpos]:=text_and+cp+'>='+tsem_brancos(msk_inter1.text)
            +' and '+cp+'<='+tsem_brancos(msk_inter2.text);
      end
      else
      if tipo='D' then
      begin
        if cpos=-1 then
          add(text_and+cp+'>='+chr(39)+
            copy(msk_inter1.text,4,3)+copy(msk_inter1.text,1,3)+copy(msk_inter1.text,7,4)+chr(39)+
            ' and '+
            cp+'<='+chr(39)+
            copy(msk_inter2.text,4,3)+copy(msk_inter2.text,1,3)+copy(msk_inter2.text,7,4)+chr(39))
        else
          strings[cpos]:=text_and+cp+'>='+chr(39)+
            copy(msk_inter1.text,4,3)+copy(msk_inter1.text,1,3)+copy(msk_inter1.text,7,4)+chr(39)+
            ' and '+
            cp+'<='+chr(39)+
            copy(msk_inter2.text,4,3)+copy(msk_inter2.text,1,3)+copy(msk_inter2.text,7,4)+chr(39);
      end
      else
      if tipo='T' then
        if cpos=-1 then
          add(text_and+cp+'>='+chr(39)+tsem_brancos(msk_inter1.text)+chr(39)
            +' and '+cp+'<='+chr(39)+tsem_brancos(msk_inter2.text)+chr(39))
        else
          strings[cpos]:=text_and+cp+'>='+chr(39)+tsem_brancos(msk_inter1.text)+chr(39)
            +' and '+cp+'<='+chr(39)+tsem_brancos(msk_inter2.text)+chr(39);
    end
    else
    if text_and='' then
      clear
    else
    if cpos>-1 then
      delete(cpos);
  end;
  if mem_where.lines.count>1 then
    for cont:=0 to mem_where.lines.count-1 do
      mem_sql.lines.add(mem_where.lines[cont]);
  if ordem[length(ordem)]=',' then
    mem_sql.lines.add(copy(ordem, 1, length(ordem)-1))
  else
    mem_sql.lines.add(ordem);
  if rdg_range.itemindex=0 then
    descricao:='(tudo)'
  else
  if rdg_range.itemindex=1 then
    descricao:='(Atual ['+tsem_brancos(msk_atual.text)+'])'
  else
  if rdg_range.itemindex=2 then
    descricao:='(Intervalo de ['+Tsem_brancos(msk_inter1.text)+'] até ['
      +Tsem_Brancos(msk_inter2.text)+'])';
  cpos2:=tpos(copy(cmb_campos.items[cmb_campos.itemindex], 1, 19),mem_consulta.lines);
  if cpos2=-1 then
  begin
    mem_consulta.lines.add(copy(cmb_campos.items[cmb_campos.itemindex], 1, 19));
    mem_consulta.lines.add('  '+descricao);
  end
  else
  begin
    mem_consulta.lines[cpos2]:=copy(cmb_campos.items[cmb_campos.itemindex], 1, 19);
    mem_consulta.lines[cpos2+1]:='  '+descricao;
  end;
end;

{Saida da tela ***}
procedure Tfrm_rl_tite.Sair1Click(Sender: TObject);
begin
  frm_rl_tite.close;
end;

{Comando de limpeza ****}
procedure Tfrm_rl_tite.cmd_limparClick(Sender: TObject);
begin
  mem_consulta.clear;
  ordem := 'Order By ';
  mem_where.clear;
  mem_sql.clear;
  campo := '';
  vd_nm := '';
  cl_no := 0;
  fo_no := 0;
end;

{Ativacao do formulario ***}
procedure Tfrm_rl_tite.FormActivate(Sender: TObject);
begin
  cmb_campos.itemindex := 0;
  if tpos(tabela_nm, mem_sql.lines)<0 then
    cmd_limparClick(frm_rl_tite);
end;

{Acao de clicagem dos campos ***}
procedure Tfrm_rl_tite.cmb_camposClick(Sender: TObject);
begin
  chk_branco.checked  := false;
  msk_atual.text      := '';
  msk_inter1.text     := '';
  msk_inter2.text     := '';
  msk_atual.editmask  := Trim(copy(cmb_campos.items[cmb_campos.itemindex],30, 40));
  msk_inter1.editmask := Trim(copy(cmb_campos.items[cmb_campos.itemindex],30, 40));
  msk_inter2.editmask := Trim(copy(cmb_campos.items[cmb_campos.itemindex],30, 40));
end;

procedure Tfrm_rl_tite.rdg_rangeClick(Sender: TObject);
begin
  msk_atual.enabled  := (rdg_range.itemindex=1);
  msk_inter1.enabled := (rdg_range.itemindex=2);
  msk_inter2.enabled := (rdg_range.itemindex=2);
end;

procedure Tfrm_rl_tite.Button3Click(Sender: TObject);
begin
  try
        {protegendo o codigo}
    Mostra_mensagem ('Preparando Relatório. Aguarde...');
    qry_print.close;
    frm_mem_print.preparereport;
    with (qry_print) do
    begin
      close;
      sql:=mem_sql.lines;
      open;
    end;
    if (UpperCase(tabela_nm)='CRECTABR') then
      imprime_contratos (qry_print);
    if (UpperCase(tabela_nm)='CRECLI') then
      imprime_clientes (qry_print);
    qry_print.close;
    qry_print.databasename:='CREDITO';
  except
    esconde_mensagem;
    frmDialogo.ExibirMensagem ('Erro na filtragem! Preencha corretamente o formulário...'
      ,'Outros relatórios',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    cmb_campos.setfocus;
  end;
end;

{Acao do botao de numero 05 ***}
procedure Tfrm_rl_tite.Button5Click(Sender: TObject);
var
  cp: String;
  opos: Integer;
begin
  cp:=copy(cmb_campos.items[cmb_campos.itemindex],22, 7);
  opos:=Tpos('Order By', mem_sql.lines);
  if opos>-1 then
  begin
    if pos(cp, ordem)>0 then
    begin
      if ordem[pos(cp, ordem)-2]=',' then
        delete(ordem, pos(cp, ordem)-2,2);
      delete(ordem, pos(cp, ordem), length(cp));
    end;
    mem_sql.lines[opos]:=ordem;
    if mem_sql.lines[opos]='Order By ' then
      mem_sql.lines.delete(opos);
  end;
end;

{Opcao de exibir o sql ***}
procedure Tfrm_rl_tite.SQL1Click(Sender: TObject);
begin
  sql1.checked:=not sql1.checked;
  mem_sql.visible:=sql1.checked;
end;

{Desativacao do formulario ***}
procedure Tfrm_rl_tite.FormDeactivate(Sender: TObject);
begin
  tag:=0;
end;

{Pergunta pelo atual - radio buttons do formulario ***}
procedure Tfrm_rl_tite.msk_atualClick(Sender: TObject);
begin
  rdg_range.itemindex:= 1;
end;

procedure Tfrm_rl_tite.msk_inter1Click(Sender: TObject);
begin
  rdg_range.itemindex := 2;
end;

procedure Tfrm_rl_tite.msk_inter2Click(Sender: TObject);
begin
  rdg_range.itemindex := 2;
end;


procedure Tfrm_rl_tite.botao_sairClick(Sender: TObject);
begin
  Sair1.click;
end;

end.
