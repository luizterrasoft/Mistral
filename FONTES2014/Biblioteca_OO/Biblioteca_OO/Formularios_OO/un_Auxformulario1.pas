{** FORMULARIO BASICO PARA IMPLEMENTACAO DE TELAS AUXILIARES ** Oritentado a objeto **}
{** REPRESENTA O ANCESTRAL DE TODOS OS FORMULARIOS **}
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
    edtmaskeditformulario1: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    botao1: TButton;
    CheckBox1: TCheckBox;
    lbF8Mens: TLabel;
    lbF8: TLabel;
    edtcomboboxformulario1: TComboBox;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure edtmaskeditformulario1KeyDown(Sender: TObject; var Key: Word;
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
    procedure edtcomboboxformulario1Enter(Sender: TObject);
    procedure edtcomboboxformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    flagFormata: boolean;
  public
   { Public declarations }
    filtros: TStringList;
    function RetiraAcentos(palavra: string):string;
    procedure InicializaFiltros;
    procedure DestroiFiltros;
    procedure PreencheFiltroCheck(edit: TComponent; check: TCheckBox; posicao: integer);
    procedure PreencheFiltro(edit: TComponent);
    procedure LimparEdits;
    procedure FormataMascarasEdits;
    procedure FocusControle(controle: TWinControl; direcao: boolean);
    procedure ExibeCritica (mensagem,assunto: string; edit: TObject);
  end;

var
  frm_Auxformulario1: Tfrm_Auxformulario1;

implementation

uses principal, procura, MaskEditOO, funcoes1, funcoes2, unDialogo,
     CheckBoxOO, f8Clientes;

{$R *.DFM}

procedure Tfrm_Auxformulario1.InicializaFiltros;
var
i: integer;
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
     begin
          if (TEdit(edit).text='') then filtros.Add('0')
          else filtros.Add(TEdit(edit).text);
     end;
     if (edit is TMaskEdit) then
     begin
          if (edit is TMaskEditOO) then
          begin
               if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
                  (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
                    filtros.Add(FormataData(TMaskEditOO(edit).GetValor))
               else filtros.Add(TMaskEditOO(edit).GetValorFormatado);
          end
          else
          begin
              if (TMaskEdit(edit).text='') then filtros.Add('0')
              else filtros.Add(TMaskEdit(edit).text);
          end;
     end;
end;
procedure Tfrm_Auxformulario1.PreencheFiltroCheck(edit: TComponent; check: TCheckBox;
   posicao: integer);
var
i: integer;
noves: string;
begin
     if (edit is TEdit) then
     begin
          if (not check.checked) then
              filtros.Add(TEdit(edit).text)
          else
          begin
               if (posicao=1) then filtros.Add('0')
               else if (posicao=2) then
               begin
                    noves:='';
                    for i:=1 to 10 do
                       noves:=noves+'9';
                    filtros.Add(noves);
               end;
          end;
     end;
     if (edit is TMaskEdit) then
     begin
          if (edit is TMaskEditOO) then
          begin
               if (not check.checked) then
               begin
                    if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
                       (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
                         filtros.Add(FormataData(TMaskEditOO(edit).GetValor))
                    else filtros.Add(TMaskEditOO(edit).GetValorFormatado);
               end
               else
               begin
                    if (posicao=1) then
                    begin
                         if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
                            (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
                            filtros.Add('01/01/1900')
                         else filtros.Add('0');
                    end
                    else if (posicao=2) then
                    begin
                         if (TMaskEditOO(edit).zFieldTypeOO=ftDate) or
                            (TMaskEditOO(edit).zFieldTypeOO=ftDateTime) then
                             filtros.Add(FormataData(strtodate('31/12/5000')))
                         else
                         begin
                             noves:='';
                             for i:=1 to TMaskEditOO(edit).zFieldLengthOO do
                                noves:=noves+'9';
                             filtros.Add(Copy(noves,1,10));
                         end;
                    end;
               end;
          end
          else
          begin
               if (not check.checked) then
                   filtros.Add(TMaskEdit(edit).text)
               else
               begin
                    if (posicao=1) then filtros.Add('0')
                    else if (posicao=2) then
                    begin
                         noves:='';
                         for i:=1 to 10 do
                            noves:=noves+'9';
                         filtros.Add(noves);
                    end;
               end;
          end;
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
ind: integer;
begin
     if (key=K_ESC) then close;
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
ind: integer;
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

procedure Tfrm_Auxformulario1.FocusControle(controle: TWinControl; direcao: boolean);
var
Lista: TList;
proxcontrole: TWinControl;
ind: integer;
begin
     Lista:=TList.Create;
     GetTabOrderList(Lista);
     ind:=TWinControl(controle).TabOrder;
     if (direcao) then
     begin
          if (ind<Lista.count) then proxcontrole:=Lista.items[ind+1]
          else proxcontrole:= Lista.items[0];
     end
     else
     begin
          if (ind>0) then proxcontrole:=Lista.items[ind-1]
          else proxcontrole:=Lista.items[Lista.count-1];
     end;
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
     begin
          if (TMaskEditOO(Sender).zTipoPesquisaF8) then
          begin
               lbF8.visible:=true;
               lbF8Mens.visible:=true;
               lbF8Mens.caption:='exibe '+LowerCase(TMaskEditOO(Sender).zLabelEntidadeOO)+' cadastrados(as)';
          end;
     end;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then FocusControle(TWinControl(sender),true);
     if (key=K_CIMA) then FocusControle(TWinControl(sender),false);
     if (key=K_F8) then
     begin
          if (Sender is TMaskEditOO) then
          begin
               if (TMaskEditOO(Sender).zTipoPesquisaF8) then
               begin
                   if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='DENTISTAS') then
                       ChamandoF8Dent(TMaskEditOO(Sender),true)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='CLIENTES') then
                   begin
                       with (frm_f8Clientes) do
                       begin
                           edit:=TMaskEditOO(Sender);
                           btnCadastro.visible:=false;
                           Modo:=0;
                           y_cliente:=-1;
                           infobusca:=0;
                           showmodal;
                           btnCadastro.visible:=true;
                       end;
                   end
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='SERVICOS') then
                         ChamandoF8Serv(TMaskEditOO(Sender),true)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PRODUTOS') then
                         ChamandoF8Produtos(TMaskEditOO(Sender),true)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='ESPECIALIDADES') then
                         ChamandoF8Especial(TMaskEditOO(Sender),true)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                         ChamandoF8Forn(TMaskEditOO(Sender),false)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='TRATAMENTOS_CLINICOS') then
                         ChamandoF8Tratamentos(TMaskEditOO(Sender),true)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PLANO_PGTO') then
                         ChamandoF8PlanoPgto(TMaskEditOO(Sender),true);
               end;
          end;
     end;
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
codigo: string;
begin
    if (Sender is TMaskEditOO) then
    begin
         codigo := Trim(TMaskEditOO(Sender).text);
         if (codigo<>'') then
         begin
             if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='DENTISTAS') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeDentista(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PRODUTOS') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeProduto(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeForn(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='TRATAMENTOS_CLINICOS') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeTrat(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='CLIENTES') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeCliente(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='ESPECIALIDADES') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeEspecial(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='SERVICOS') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeServ(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='CLIENTES') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeCliente(strtofloat(codigo),self);
             if (TMaskEditOO(Sender).zFieldTypeOO=ftInteger) then
                 TMaskEditOO(Sender).text := form_nz(strtofloat(codigo),TMaskEditOO(Sender).zFieldLengthOO);
         end
         else TMaskEditOO(Sender).zPainelEntidadeOO.caption:='';

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
         begin
              if (not TMaskEditOO(Sender).IsDate) then
                  ExibeCritica('Formato de data incorreto!',TMaskEditOO(Sender).zNomeOO,TMaskEditOO(Sender));
         end;
    end;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1DblClick(
  Sender: TObject);
begin
    if (Sender is TMaskEditOO) then
    begin
         if (TMaskEditOO(Sender).zTipoPesquisaF8) then
         begin
             if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='DENTISTAS') then
                 ChamandoF8Dent(TMaskEditOO(Sender),true)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='CLIENTES') then
             begin
                 with (frm_f8Clientes) do
                 begin
                     edit:=TMaskEditOO(Sender);
                     btnCadastro.visible:=false;
                     Modo:=0;
                     y_cliente:=-1;
                     infobusca:=0;
                     showmodal;
                     btnCadastro.visible:=true;
                 end;
             end
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='SERVICOS') then
                 ChamandoF8Serv(TMaskEditOO(Sender),true)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PRODUTOS') then
                 ChamandoF8Produtos(TMaskEditOO(Sender),true)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='ESPECIALIDADES') then
                 ChamandoF8Especial(TMaskEditOO(Sender),true)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                         ChamandoF8Forn(TMaskEditOO(Sender),false)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='TRATAMENTOS_CLINICOS') then
                 ChamandoF8Tratamentos(TMaskEditOO(Sender),true)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PLANO_PGTO') then
                 ChamandoF8PlanoPgto(TMaskEditOO(Sender),true);
         end;
    end;
end;

procedure Tfrm_Auxformulario1.edtmaskeditformulario1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Sender is TMaskEditOO) then
     begin
          TMaskEditOO(Sender).FormatarEditNumerico;
     end;
end;

procedure Tfrm_Auxformulario1.ExibeCritica (mensagem,assunto: string; edit: TObject);
begin
     frmDialogo.ExibirMensagem (mensagem,assunto,[mbOk],
        frm_principal.x_pathimg+'iconeerro.bmp',250,200);
     if (edit is TMaskEdit) then TMaskEdit(edit).setfocus
     else if (edit is TEdit) then TEdit(edit).setfocus;
end;

procedure Tfrm_Auxformulario1.FormataMascarasEdits;
var
Lista: TList;
i,ind: integer;
mascara: string;
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
               else if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftInteger) then
               begin
                    mascara:='!';
                    for i:=1 to TMaskEditOO(Lista.items[ind]).zFieldLengthOO do
                        mascara:=mascara+'9';
                    mascara:=mascara+';1; '
               end
               else if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftFloat) then
                    mascara:=''
               else if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftString) then
               begin
                    mascara:='';
                    for i:=1 to TMaskEditOO(Lista.items[ind]).zFieldLengthOO do
                        mascara:=mascara+'c';
                    mascara:=mascara+';1; '
               end
               else if (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftDate) or
                       (TMaskEditOO(Lista.items[ind]).zFieldTypeOO=ftDateTime) then
                    mascara:='!99/99/9999;1; ';
               if (trim(TMaskEditOO(Lista.items[ind]).editMask)='') then
               begin
                    TMaskEditOO(Lista.items[ind]).editMask  := mascara;
                    TMaskEditOO(Lista.items[ind]).maxlength := TMaskEditOO(Lista.items[ind]).zFieldLengthOO;
               end;
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

function Tfrm_Auxformulario1.RetiraAcentos(palavra: string):string;
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

procedure Tfrm_Auxformulario1.edtcomboboxformulario1Enter(Sender: TObject);
begin
     TComboBox(sender).selectall;
end;

procedure Tfrm_Auxformulario1.edtcomboboxformulario1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) then FocusControle(TWinControl(sender),true);
end;

end.
