{** FORMULARIO BASICO PARA IMPLEMENTACAO DE TELAS AUXILIARES ** Oritentado a objeto **}
{** REPRESENTA O ANCESTRAL DE TODOS OS FORMULARIOS **}
{**** ATENCAO: Pode gerar conflito de data quando se captura o filtro de data.}
unit un_Auxformulario1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, Mask;

type
  Tfrm_Auxformulario1 = class(TForm)
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Panel4: TPanel;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    edtcomboboxformulario1: TComboBox;
    edteditformulario1: TEdit;
    edtmaskeditformulario1: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    botao1: TButton;
    CheckBox1: TCheckBox;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure edtmaskeditformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edteditformulario1Enter(Sender: TObject);
    procedure edteditformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcomboboxformulario1Enter(Sender: TObject);
    procedure edtcomboboxformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtmaskeditformulario1DblClick(Sender: TObject);
    procedure edtmaskeditformulario1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    flagFormata: Boolean;
  public
   { Public declarations }
    filtros: TStringList;
    function RetiraAcentos(palavra: String):String;
    procedure InicializaFiltros;
    procedure DestroiFiltros;
    procedure PreencheFiltroCheck(edit: TComponent; check: TCheckBox; posicao: Integer);
    procedure PreencheFiltro(edit: TComponent);
    procedure LimparEdits;
    procedure FormataMascarasEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure ExibeCritica (mensagem,assunto: String; edit: TObject);
    function VerificaVendedorInativo(loja,vendedor: Real): Boolean;
  end;

var
  frm_Auxformulario1: Tfrm_Auxformulario1;

implementation

uses principal, procura, MaskEditOO, funcoes1, funcoes2, unDialogo,
  CheckBoxOO, auxiliar;

{$R *.DFM}

procedure Tfrm_Auxformulario1.InicializaFiltros;
var
  i: Integer;
begin
  filtros:=TStringList.Create;
end;

procedure Tfrm_Auxformulario1.DestroiFiltros;
begin
  filtros.Free;
end;

procedure Tfrm_Auxformulario1.PreencheFiltro(edit: TComponent);
begin
  if (edit is TEdit) then
    if (TEdit(edit).text='') then
      filtros.Add('0')
    else
      filtros.Add(TEdit(edit).text);
  if (edit is TMaskEdit) then
    if (edit is TMaskEditOO) then
    begin
      if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
        (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
      begin
        if (TMaskEditOO(edit).zEntidadeOO='VENDAS') then //****
          filtros.Add(FormataDataVendas(TMaskEditOO(edit).GetValor))
        else
          filtros.Add(FormataData(TMaskEditOO(edit).GetValor));
      end
      else
        filtros.Add(TMaskEditOO(edit).GetValorFormatado);
    end
    else
    if (TMaskEdit(edit).text='') then
      filtros.Add('0')
    else
      filtros.Add(TMaskEdit(edit).text);
end;

procedure Tfrm_Auxformulario1.PreencheFiltroCheck(edit: TComponent; check: TCheckBox;
  posicao: Integer);
var
  i: Integer;
  noves: String;
begin
  if (edit is TEdit) then
    if (not check.checked) then
      filtros.Add(TEdit(edit).text)
    else
    if (posicao=1) then
      filtros.Add('0')
    else
    if (posicao=2) then
    begin
      noves:='';
      for i:=1 to 10 do
        noves:=noves+'9';
      filtros.Add(noves);
    end;
  if (edit is TMaskEdit) then
    if (edit is TMaskEditOO) then
    begin
      if (not check.checked) then
      begin
        if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
          (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
        begin
          if (TMaskEditOO(edit).zEntidadeOO='VENDAS') then //****
            filtros.Add(FormataDataVendas(TMaskEditOO(edit).GetValor))
          else
            filtros.Add(FormataData(TMaskEditOO(edit).GetValor));
        end
        else
          filtros.Add(TMaskEditOO(edit).GetValorFormatado);
      end
      else
      begin
        if (posicao=1) then
        begin
          if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
            (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
            filtros.Add('01/01/1900')
          else
            filtros.Add('0');
        end
        else
        if (posicao=2) then
          if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
            (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
          begin
            if (TMaskEditOO(edit).zEntidadeOO='VENDAS') then //****
              filtros.Add(FormataDataVendas(strtodate('31/12/5000')))
            else
              filtros.Add(FormataData(strtodate('31/12/5000')));
          end
          else
          begin
            noves:='';
            for i:=1 to TMaskEditOO(edit).zFieldLengthOO do
              noves:=noves+'9';
            filtros.Add(Copy(noves,1,10));
          end;
      end;
    end
    else
    if (not check.checked) then
      filtros.Add(TMaskEdit(edit).text)
    else
    if (posicao=1) then
      filtros.Add('0')
    else
    if (posicao=2) then
    begin
      noves:='';
      for i:=1 to 10 do
        noves:=noves+'9';
      filtros.Add(noves);
    end;
end;

procedure Tfrm_Auxformulario1.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Auxformulario1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Lista: TList;
  ind: Integer;
begin
  if (key=K_ESC) then
    close;
  if (key=K_F1) then
  begin
    Lista:=TList.Create;
    GetTabOrderList(Lista);
    ind:=0;
    while (ind<Lista.count) do
    begin
      if (TWinControl(Lista.items[ind]).focused) and
        (TWinControl(Lista.items[ind]) is TMaskEditOO) then
      begin
        frm_principal.ExibirDica(TMaskEditOO(Lista.items[ind]).zMensagemF1,5);
        break;
      end;
      ind:=ind+1;
    end;
    Lista.Free;
  end;
end;

procedure Tfrm_Auxformulario1.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TCheckBox) then
    begin
      TCheckBox(Lista.items[ind]).checked:=false;
      if (TWinControl(Lista.items[ind]) is TCheckBoxOO) then
        TCheckBoxOO(Lista.items[ind]).SetMarca(false);
    end;
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

procedure Tfrm_Auxformulario1.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
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

procedure Tfrm_Auxformulario1.Limparformulrio1Click(Sender: TObject);
begin
  LimparEdits;
end;

procedure Tfrm_Auxformulario1.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
  if (Sender is TMaskEditOO) then
    if (TMaskEditOO(Sender).zTipoPesquisaF8) then
    begin
      lbF8.visible:=true;
      lbF8Mens.visible:=true;
      lbF8Mens.caption:='exibe '+LowerCase(TMaskEditOO(Sender).zLabelEntidadeOO)+' cadastrados(as)';
    end;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    FocusControle(TWinControl(sender),true);
  if (key=K_CIMA) then
    FocusControle(TWinControl(sender),false);
  if (key=K_F8) then
    if (Sender is TMaskEditOO) then
      if (TMaskEditOO(Sender).zTipoPesquisaF8) then
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
          ChamandoF8Forn(TMaskEditOO(Sender),false)
        else
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
          ChamandoF8GruposProdutos(TMaskEditOO(Sender),false)
        else
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='SUBGRUPOS_PRODUTOS') then
          ChamandoF8SubGrupos2(TMaskEditOO(Sender),false)
        else
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
          ChamandoF8Forn(TMaskEditOO(Sender),false)
        else
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='LINHAS') then
          ChamandoF8Linhas(TMaskEditOO(Sender),false)
        else
        if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='COLECOES') then
          ChamandoF8Colecoes(TMaskEditOO(Sender),false);
end;

procedure Tfrm_Auxformulario1.edteditformulario1Enter(Sender: TObject);
begin
  TEdit(sender).selectall;
end;

procedure Tfrm_Auxformulario1.edteditformulario1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    FocusControle(TWinControl(sender),true);
  if (key=K_CIMA) then
    FocusControle(TWinControl(sender),false);
end;

procedure Tfrm_Auxformulario1.edtcomboboxformulario1Enter(Sender: TObject);
begin
  TComboBox(sender).selectall;
end;

procedure Tfrm_Auxformulario1.edtcomboboxformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    FocusControle(TWinControl(sender),true);
end;

procedure Tfrm_Auxformulario1.FormActivate(Sender: TObject);
var
  Lista: TList;
begin
  if (not flagFormata) then
  begin
    FormataMascarasEdits;
    flagFormata:=true;
  end;
  Lista := TList.Create;
  GetTabOrderList(Lista);
  TWinControl(Lista.items[0]).setfocus;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1Exit(Sender: TObject);
var
  codigo: String;
begin
  if (Sender is TMaskEditOO) then
  begin
    codigo := Trim(TMaskEditOO(Sender).text);
    if (codigo<>'') then
    begin
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
          ProcuraNomeForn(strtofloat(codigo),self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='CRELOJA') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
          ProcuraNomeLoja(strtofloat(codigo),self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
          ProcuraNomeGruposProdutos(strtofloat(codigo),self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
          ProcuraNomeForn(strtofloat(codigo),self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='COLECOES') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=ProcuraNomeEntidade(strtofloat(codigo),
          'ESTOQUE','COLECOES','Coleções','CO_CODI','CO_DESC',
          self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='LINHAS') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=ProcuraNomeEntidade(strtofloat(codigo),
          'ESTOQUE','LINHAS','Linhas','LI_CODI','LI_DESC',
          self)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='MESES') then
        TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
          nome_mes(strtoint(codigo));
      if (TMaskEditOO(Sender).zFieldTypeOO=ftInteger) then
        TMaskEditOO(Sender).text := form_nz(strtofloat(codigo),TMaskEditOO(Sender).zFieldLengthOO);
    end
    else
      TMaskEditOO(Sender).zPainelEntidadeOO.caption:='';

         {*****}
    if (TMaskEditOO(Sender).zTipoPesquisaF8) then
    begin
      lbF8.visible:=false;
      lbF8Mens.visible:=false;
    end;

         {**** formatacoes}
    TMaskEditOO(Sender).FormatarZerosDecimais;

         {**** criticas}
    if (TMaskEditOO(Sender).zFieldTypeOO=ftDate) or
      (TMaskEditOO(Sender).zFieldTypeOO=ftDateTime) then
      if (not TMaskEditOO(Sender).IsDate) then
        ExibeCritica('Formato de data incorreto!',TMaskEditOO(Sender).zNomeOO,TMaskEditOO(Sender));
  end;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1DblClick(
  Sender: TObject);
begin
  if (Sender is TMaskEditOO) then
    if (TMaskEditOO(Sender).zTipoPesquisaF8) then
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
        ChamandoF8Forn(TMaskEditOO(Sender),false)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
        ChamandoF8GruposProdutos(TMaskEditOO(Sender),false)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='SUBGRUPOS_PRODUTOS') then
        ChamandoF8SubGrupos2(TMaskEditOO(Sender),false)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
        ChamandoF8Forn(TMaskEditOO(Sender),false)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='LINHAS') then
        ChamandoF8Linhas(TMaskEditOO(Sender),false)
      else
      if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='COLECOES') then
        ChamandoF8Colecoes(TMaskEditOO(Sender),false);
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Sender is TMaskEditOO) then
    TMaskEditOO(Sender).FormatarEditNumerico;
end;

procedure Tfrm_Auxformulario1.ExibeCritica (mensagem,assunto: String; edit: TObject);
begin
  frmDialogo.ExibirMensagem (mensagem,assunto,[mbOk],
    frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  if (edit is TMaskEdit) then
    TMaskEdit(edit).setfocus
  else
  if (edit is TEdit) then
    TEdit(edit).setfocus;
end;

procedure Tfrm_Auxformulario1.FormataMascarasEdits;
var
  Lista: TList;
  i,ind: Integer;
  mascara: String;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskEditOO) then
    begin
               {**** cursor}
      if (TMaskEditOO(Lista.items[ind]).zTipoPesquisaF8) then
        TMaskEditOO(Lista.items[ind]).cursor := crHandPoint;

               {**** mascara}
      mascara:='';
      if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftUnknown) then
        mascara:=''
      else
      if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftInteger) then
      begin
        mascara:='!';
        for i:=1 to TMaskEditOO(Lista.items[ind]).zFieldLengthOO do
          mascara:=mascara+'9';
        mascara:=mascara+';1; '
      end
      else
      if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftFloat) then
        mascara:=''
      else
      if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftString) then
      begin
        mascara:='';
        for i:=1 to TMaskEditOO(Lista.items[ind]).zFieldLengthOO do
          mascara:=mascara+'c';
        mascara:=mascara+';1; '
      end
      else
      if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftDate) or
        (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftDateTime) then
        mascara:='!99/99/9999;1; ';
      TMaskEditOO(Lista.items[ind]).editMask  := mascara;
      TMaskEditOO(Lista.items[ind]).maxlength := TMaskEditOO(Lista.items[ind]).zFieldLengthOO;
    end;
    ind:=ind+1;
  end;
  botao_sair.caption:='SAIR';
  Lista.Free;
end;

procedure Tfrm_Auxformulario1.FormCreate(Sender: TObject);
begin
  flagFormata:=false;
end;

procedure Tfrm_Auxformulario1.CheckBox1Click(Sender: TObject);
begin
  if (Sender is TCheckBoxOO) then
    TCheckBoxOO(Sender).SetMarca(TCheckBoxOO(Sender).checked);
end;

procedure Tfrm_Auxformulario1.CheckBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Sender is TCheckBoxOO) then
    TCheckBoxOO(Sender).SetMarca(TCheckBoxOO(Sender).checked);
end;

function Tfrm_Auxformulario1.RetiraAcentos(palavra: String):String;
begin
  palavra:=UpperCase(palavra);
  while pos('É',palavra)<>0 do
    palavra[pos('É',palavra)]:='E';
  while pos('Ê',palavra)<>0 do
    palavra[pos('Ê',palavra)]:='E';
  while pos('Ã',palavra)<>0 do
    palavra[pos('Ã',palavra)]:='A';
  while pos('Á',palavra)<>0 do
    palavra[pos('Á',palavra)]:='A';
  while pos('À',palavra)<>0 do
    palavra[pos('À',palavra)]:='A';
  while pos('Ó',palavra)<>0 do
    palavra[pos('Ó',palavra)]:='O';
  while pos('ó',palavra)<>0 do
    palavra[pos('ó',palavra)]:='O';
  while pos('Ô',palavra)<>0 do
    palavra[pos('Ô',palavra)]:='O';
  while pos('Ò',palavra)<>0 do
    palavra[pos('Ò',palavra)]:='O';
  while pos('Í',palavra)<>0 do
    palavra[pos('Í',palavra)]:='I';
  while pos('Ì',palavra)<>0 do
    palavra[pos('Ì',palavra)]:='I';
  while pos('Î',palavra)<>0 do
    palavra[pos('Î',palavra)]:='I';
  while pos('Ç',palavra)<>0 do
    palavra[pos('Ç',palavra)]:='C';
  result:=palavra;
end;

function Tfrm_Auxformulario1.VerificaVendedorInativo(loja,
  vendedor: Real): Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect(DataBaseProdutos,Self);
  clAux.ClearSql;
  clAux.AddParam('SELECT * FROM VENDEDORES          ');
  clAux.AddParam('WHERE (VD_LOJA=:LOJA) AND         ');
  clAux.AddParam('      (VD_CODI=:VENDEDOR) AND     ');
  clAux.AddParam('      (VD_STAT='+QuotedStr('0')+')');
  clAux.consulta.ParamByName('LOJA').AsFloat     := loja;
  clAux.consulta.ParamByName('VENDEDOR').AsFloat := vendedor;
  clAux.consulta.Open;
  if (not clAux.consulta.IsEmpty) then
    Result := true
  else
    Result := false;
  clAux.Desconect;
  clAux.Free;
end;

end.
