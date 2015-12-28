{*** FORMULARIO DE CLASSE PAI - Para efetuar quaisquer cadastros gerais ***}
unit un_formulario1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Menus, Mask, auxiliar, dbtables, principal,
  un_F8formulario1;

type
  Tfrm_formulario1 = class(TForm)
    Panel3: TPanel;
    Bevel1: TBevel;
    Bevel8: TBevel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lbF8: TLabel;
    lbF8Mens: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel4: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnCancelainclusao: TSpeedButton;
    botao_sair: TPanel;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Incluirplano1: TMenuItem;
    Cancelarincluso1: TMenuItem;
    Excluirplano1: TMenuItem;
    Salvar1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N1: TMenuItem;
    Imprimirplanos1: TMenuItem;
    Outros1: TMenuItem;
    N2: TMenuItem;
    SAIR1: TMenuItem;
    Auxiliares1: TMenuItem;
    Salvar2: TMenuItem;
    edtmaskeditformulario1: TMaskEdit;
    Label122: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
    procedure Incluirplano1Click(Sender: TObject);
    procedure Cancelarincluso1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure Excluirplano1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure edtmaskeditformulario1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelainclusaoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Outros1Click(Sender: TObject);
    procedure Imprimirplanos1Click(Sender: TObject);
    procedure edtmaskeditformulario1DblClick(Sender: TObject);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtmaskeditformulario1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    antNome: string;
    flagFormata: boolean;
  public
    { Public declarations }
    {** Atributos do objeto 'formulario1'}
    Modo: integer;
    CodigoInclusao: integer;
    formulario: TForm;
    database: string; {nome do database da entidade}
    entidade: string; {armazena o nome da entidade que se esta trabalhando}
    labelentidade: string; {contem o LABEL da entidade - Ex. 'Cliente'}
    module: integer; {contem o codigo do modulo do cadastro respectivo}
    edtchaveprimaria: TMaskEdit; {contem o objeto o qual sera dado focu inicial - chave primaria de id. da entidade}
    edtchavenome: TMaskEdit;
    tamanhoedtchaveprimaria: integer; {contem o tamanho de formatacao do edit de chave primaria}
    formf8: Tfrm_F8formulario1; {formulario de F8 para o campo de identificacao}
    camposchaveprimaria: TStringList; {contem um vetor de strings com as chaves primarias da entidade - usado em SELECTS}
    qtdecampos: integer; {contem a qtde. de campos da entidade}
    qtdecamposlistagem: integer; {contem a qtde. de campos da entidade nas listagens}
    atributosentidade: array[1..99] of TRegistroCampo; {contem informacoes sobre cada atributo da entidade em questao}
    tamanholistagem: integer; {pode assumir os valores de 80 e 132 (colunas)}
    arquivolistagem: string; {indica o nome do arquivo de listagem padrão}

    {** Métodos do formulario1}
    procedure LimparEdits; {metodo que se encarrega da limpeza dos objetos de edicao presentes nos formularios}
    procedure AjustaMenus; {metodo que ajusta o nome dos menus, de acordo com o 'labelentidade'}
    procedure AjustaMaxLength; {metodo que ajusta o maxlength dos objetos de edicao}
    procedure FocusControle {metodo encarregado da navegacao nos objetos de edicao}
      (controle: TWinControl; direcao: boolean; tecla: integer);
    procedure HabilitaMenus {metodo que se encarrega da habilitacao dos menus, dependendo de cada operacao}
      (menu1,menu2,menu3,menu4,menu5,menu6: boolean);
    procedure ExibeEntidade;
    procedure ImprimeEntidade (tabela: TQuery);
    procedure PreencheEditsEntidade (clAux: TClassAuxiliar);
    procedure FormataMascarasEdits;
    procedure ExibeCritica (mensagem,assunto: string; edit: TObject);
  end;

var
  frm_formulario1: Tfrm_formulario1;

implementation

{$R *.DFM}

uses funcoes1, funcoes2, unDialogo, Rl_tite, unMensagem, mem_prnt, MaskEditOO,
  f8Clientes, f8Dent, procura;

procedure Tfrm_formulario1.SAIR1Click(Sender: TObject);
begin
     close;
end;

procedure Tfrm_formulario1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_formulario1.botao_sairClick(Sender: TObject);
begin
     SAIR1.click;
end;

procedure Tfrm_formulario1.LimparEdits;
var
Lista: TList;
ind: integer;
begin
     Lista:=TList.Create;
     formulario.GetTabOrderList(Lista);
     ind:=0;
     while (ind<Lista.count) do
     begin
          if (TWinControl(Lista.items[ind]) is TMaskedit) then
              TMaskEdit(Lista.items[ind]).text:='';
          if (TWinControl(Lista.items[ind]) is TPanel) then
              TPanel(Lista.items[ind]).caption:='';
          if (TWinControl(Lista.items[ind]) is TRadioGroup) then
              TRadioGroup(Lista.items[ind]).itemindex:=0;
          if (TWinControl(Lista.items[ind]) is TCheckBox) then
              TCheckBox(Lista.items[ind]).checked:=false;
          ind:=ind+1;
     end;
     botao_sair.caption:='SAIR';
     Lista.Free;
end;

procedure Tfrm_formulario1.FocusControle
      (controle: TWinControl; direcao: boolean; tecla: integer);
var
Lista: TList;
proxcontrole: TWinControl;
ind,indAnt: integer;
flagFocus: boolean;
begin
     flagFocus:=true;
     Lista:=TList.Create;
     formulario.GetTabOrderList(Lista);
     ind:=TWinControl(controle).TabOrder;
     indAnt:=ind;
     if (direcao) then
     begin
          while (true) do
          begin
              ind:=ind+1;
              if (TWinControl(Lista.items[ind]).enabled) then
              begin
                   if (ind<=Lista.count) then proxcontrole:=Lista.items[ind]
                   else proxcontrole:= Lista.items[0];
                   break;
              end
              else
              begin
                   if (TWinControl(Lista.items[ind]).Name='edtObs') then
                   begin
                       if (tecla=13) then
                       begin
                            btnSalvar.click;
                            flagFocus:=false;
                            break;
                       end
                       else if (tecla=40) then proxcontrole:= Lista.items[indAnt];
                   end;
              end;
          end;
     end
     else
     begin
          while (true) do
          begin
              ind:=ind-1;
              if (ind>=0) then
              begin
                   if (TWinControl(Lista.items[ind]).enabled) then
                   begin
                        proxcontrole:=Lista.items[ind];
                        break;
                   end;
              end
              else
              begin
                   flagFocus:=false;
                   break;
              end;
          end;
     end;
     if (flagFocus) then proxcontrole.setfocus;
     Lista.Free;
end;

procedure Tfrm_formulario1.HabilitaMenus (menu1,menu2,menu3,menu4,menu5,menu6: boolean);
begin
     if (menu1) then
        Incluirplano1.enabled:=true
     else Incluirplano1.enabled:=false;
     if (menu2) then
     begin
        Cancelarincluso1.enabled:=true;
        btnCancelainclusao.enabled:=true;
     end
     else
     begin
       Cancelarincluso1.enabled:=false;
       btnCancelainclusao.enabled:=false;
     end;
     if (menu3) then
        Excluirplano1.enabled:=true
     else Excluirplano1.enabled:=false;
     if (menu4) then
        Salvar1.enabled:=true
     else Salvar1.enabled:=false;
     if (menu5) then
        Limparcadastro1.enabled:=true
     else Limparcadastro1.enabled:=false;
     if (menu6) then
        Imprimirplanos1.enabled:=true
     else Imprimirplanos1.enabled:=false;
end;

procedure Tfrm_formulario1.Incluirplano1Click(Sender: TObject);
begin
     if (not OperacaoPermitida(frm_principal.x_codigousuario, module, 'I')) then
        frm_principal.ExibirDica ('Operação não permitida...',5)
     else
     begin
          HabilitaMenus (false,true,false,true,true,true);
          if (CodigoInclusao=0) then
           CodigoInclusao := Round(MaxiCod2(entidade,frm_principal.barraDicas));
          LimparEdits;
          edtchaveprimaria.text := form_nz (CodigoInclusao,tamanhoedtchaveprimaria);
          edtchaveprimaria.setfocus;
     end;
end;

procedure Tfrm_formulario1.AjustaMenus;
begin
     Incluirplano1.caption   :='Incluir '+LowerCase(labelentidade);
     Excluirplano1.caption   :='Excluir '+LowerCase(labelentidade);
     Imprimirplanos1.caption :='Imprimir '+LowerCase(labelentidade)+' cadastrado(s)';
end;

procedure Tfrm_formulario1.Cancelarincluso1Click(Sender: TObject);
begin
     HabilitaMenus (true,false,false,false,true,true);
     LimparEdits;
     edtchaveprimaria.text:='';
     edtchaveprimaria.setfocus;
end;

procedure Tfrm_formulario1.Limparcadastro1Click(Sender: TObject);
begin
     HabilitaMenus (true,false,false,false,true,true);
     LimparEdits;
     edtchaveprimaria.text:='';
     edtchaveprimaria.setfocus;
end;

procedure Tfrm_formulario1.Excluirplano1Click(Sender: TObject);
var
clAux: TClassAuxiliar;
codigo: string;
begin
     if (not OperacaoPermitida(frm_principal.x_codigousuario, module, 'E')) then
        frm_principal.ExibirDica ('Operação não permitida...',5)
     else
     begin
        codigo := Trim(edtchaveprimaria.text);
        if (codigo<>'') then
        begin
          with (clAux) do
          begin
            if (frmDialogo.ExibirMensagem ('Confirma exclusão do '+labelentidade+'?'
                ,'Exclusão do '+labelentidade,[mbYes,mbNo]
                ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            begin
              clAux := TClassAuxiliar.Create;
              conect (database, self);
              ClearSql;
              AddParam ('Delete from '+entidade+'                      ');
              AddParam ('Where ('+camposchaveprimaria[0]+'='+codigo+') ');
              Execute;
              desconect;
              Free;
              HabilitaMenus (true,false,false,false,true,true);
              LimparEdits;
              with (formf8) do
                 ds.dataset.close;
              edtchaveprimaria.text:='';
              edtchaveprimaria.setfocus;
              with (frm_principal) do
                  GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                            module,'E',strtoint(codigo),'','');
              frm_principal.ExibirDica (labelentidade+' excluído com sucesso...',5);
            end
            else edtchaveprimaria.setfocus;
          end;
        end;
     end;
end;

procedure Tfrm_formulario1.Salvar1Click(Sender: TObject);
var
clAux: TClassAuxiliar;
tipo,campo: string;
Lista: TList;
codigo: string;
ind: integer;
begin
    codigo := Trim(edtchaveprimaria.text);
    if (codigo<>'') then
    begin
       with (clAux) do
       begin
           clAux := TClassAuxiliar.Create;
           conect (database, self);
           ClearSql;
           AddParam ('Select '+camposchaveprimaria[0]+'              ');
           AddParam ('From   '+entidade+'                            ');
           AddParam ('Where  ('+camposchaveprimaria[0]+'='+codigo+') ');
           frm_principal.BarraDicas.caption:='Salvando o '+labelentidade+'...Aguarde!';
           frm_principal.refresh;
           Lista:=TList.Create;
           formulario.GetTabOrderList(Lista);
           if (Execute) then
           begin
               if (not OperacaoPermitida(frm_principal.x_codigousuario,module, 'A')) then
                  frm_principal.ExibirDica ('Operação não permitida...',5)
               else
               begin
                   ClearSql;
                   AddParam('UPDATE '+entidade+' SET ');
                   AddParam(atributosentidade[1].nome+'=:'+atributosentidade[1].nome);
                   ind:=2;
                   while (ind<=qtdecampos) do
                   begin
                        AddParam(',');
                        AddParam(atributosentidade[ind].nome+'=:'+atributosentidade[ind].nome);
                        ind:=ind+1;
                   end;
                   AddParam('WHERE ('+camposchaveprimaria[0]+'='+codigo+') ');
                   ind:=0;
                   while (ind<Lista.count) do
                   begin
                     if (TWinControl(Lista.items[ind]).tag<>0) then
                     begin
                        tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                        campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                        if (TWinControl(Lista.items[ind]) is TMaskedit) then
                        begin
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := TMaskEdit(Lista.items[ind]).text
                           else if (tipo='i') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(Trim(TMaskEdit(Lista.items[ind]).text))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='m') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(TMaskEdit(Lista.items[ind]).text)))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='d') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsDateTime  := strtodate(Trim(TMaskEdit(Lista.items[ind]).text))
                              else consulta.parambyname(campo).AsDateTime  := strtodate('01/01/1900');
                           end;
                        end
                        else if (TWinControl(Lista.items[ind]) is TPanel) then
                        begin
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := TPanel(Lista.items[ind]).caption
                           else if (tipo='i') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(Trim(TPanel(Lista.items[ind]).caption))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='m') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(TPanel(Lista.items[ind]).caption)))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='d') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsDateTime  := strtodate(Trim(TPanel(Lista.items[ind]).caption))
                              else consulta.parambyname(campo).AsDateTime  := strtodate('01/01/1900');
                           end;
                        end
                        else if (TWinControl(Lista.items[ind]) is TRadioGroup) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := inttostr(TRadioGroup(Lista.items[ind]).itemindex)
                           else if (tipo='i') then
                              consulta.parambyname(campo).AsFloat := TRadioGroup(Lista.items[ind]).itemindex;
                        end
                        else if (TWinControl(Lista.items[ind]) is TCheckBox) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                           begin
                                if (TCheckBox(Lista.items[ind]).checked) then
                                    consulta.parambyname(campo).AsString := '1'
                                else consulta.parambyname(campo).AsString := '0';
                           end
                           else if (tipo='i') then
                           begin
                                if (TCheckBox(Lista.items[ind]).checked) then
                                    consulta.parambyname(campo).AsInteger := 1
                                else consulta.parambyname(campo).AsInteger := 0;
                           end;
                        end;
                     end;
                     {faltam para o tipo checkbox}
                     ind:=ind+1;
                   end;
                   Execute;
                   HabilitaMenus (true,false,true,true,true,true);
                   frm_principal.ExibirDica (' Cadastro alterado com sucesso...',5);
                   if (edtchavenome<>nil) then
                   begin
                       if (antNome<>trim(edtchavenome.text)) then
                       begin
                           if (formf8<>nil) then
                           begin
                                with (formf8) do
                                     ds.dataset.close;
                           end;
                       end;
                   end;
                   with (frm_principal) do
                         GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                                   module,'A',strtoint(codigo),'','');
                   edtchaveprimaria.setfocus;
               end;
           end
           else
           begin
               if (not OperacaoPermitida(frm_principal.x_codigousuario, module, 'I')) then
                  frm_principal.ExibirDica ('Operação não permitida...',5)
               else
               begin
                   ClearSql;
                   AddParam('INSERT INTO '+entidade+'(');
                   AddParam(atributosentidade[1].nome);
                   ind:=2;
                   while (ind<=qtdecampos) do
                   begin
                        AddParam(',');
                        AddParam(atributosentidade[ind].nome);
                        ind:=ind+1;
                   end;
                   AddParam(')');
                   AddParam('Values');
                   AddParam('(');
                   AddParam(':'+atributosentidade[1].nome);
                   ind:=2;
                   while (ind<=qtdecampos) do
                   begin
                        AddParam(',');
                        AddParam(':'+atributosentidade[ind].nome);
                        ind:=ind+1;
                   end;
                   AddParam(')');
                   ind:=0;
                   while (ind<Lista.count) do
                   begin
                     if (TWinControl(Lista.items[ind]).tag<>0) then
                     begin
                        if (TWinControl(Lista.items[ind]) is TMaskedit) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := TMaskEdit(Lista.items[ind]).text
                           else if (tipo='i') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(Trim(TMaskEdit(Lista.items[ind]).text))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='m') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(TMaskEdit(Lista.items[ind]).text)))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='d') then
                           begin
                              if (Trim(TMaskEdit(Lista.items[ind]).text)<>'') then
                              consulta.parambyname(campo).AsDateTime  := strtodate(Trim(TMaskEdit(Lista.items[ind]).text))
                              else consulta.parambyname(campo).AsDateTime  := strtodate('01/01/1900');
                           end;
                        end
                        else if (TWinControl(Lista.items[ind]) is TPanel) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := TPanel(Lista.items[ind]).caption
                           else if (tipo='i') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(Trim(TPanel(Lista.items[ind]).caption))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='m') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsFloat  := strtofloat(RetiraFormatacaoNumero(Trim(TPanel(Lista.items[ind]).caption)))
                              else consulta.parambyname(campo).AsFloat  := 0;
                           end
                           else if (tipo='d') then
                           begin
                              if (Trim(TPanel(Lista.items[ind]).caption)<>'') then
                              consulta.parambyname(campo).AsDateTime  := strtodate(Trim(TPanel(Lista.items[ind]).caption))
                              else consulta.parambyname(campo).AsDateTime  := strtodate('01/01/1900');
                           end;
                        end
                        else if (TWinControl(Lista.items[ind]) is TRadioGroup) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                              consulta.parambyname(campo).AsString := inttostr(TRadioGroup(Lista.items[ind]).itemindex)
                           else if (tipo='i') then
                              consulta.parambyname(campo).AsFloat := TRadioGroup(Lista.items[ind]).itemindex;
                        end
                        else if (TWinControl(Lista.items[ind]) is TCheckBox) then
                        begin
                           tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
                           campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
                           if (tipo='c') then
                           begin
                                if (TCheckBox(Lista.items[ind]).checked) then
                                    consulta.parambyname(campo).AsString := '1'
                                else consulta.parambyname(campo).AsString := '0';
                           end
                           else if (tipo='i') then
                           begin
                                if (TCheckBox(Lista.items[ind]).checked) then
                                    consulta.parambyname(campo).AsInteger := 1
                                else consulta.parambyname(campo).AsInteger := 0;
                           end;
                        end;
                     end;
                     {faltam para o tipo checkbox}
                     ind:=ind+1;
                   end;
                   Execute;
                   if (CodigoInclusao=strtoint(codigo)) then
                       CodigoInclusao:=0;
                   if (formf8<>nil) then
                   begin
                        with (formf8) do
                             ds.dataset.close;
                   end;
                   HabilitaMenus (true,false,false,false,true,true);
                   frm_principal.ExibirDica (' Cadastro realizado com sucesso...',5);
                   btnIncluir.Click;
                   with (frm_principal) do
                         GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                                   module,'I',strtoint(codigo),'','');
               end;
           end;
           Lista.Free;
           desconect;
           Free;
       end;
    end;
end;

procedure Tfrm_formulario1.ExibeEntidade;
var
clAux: TClassAuxiliar;
codigo: string;
begin
     codigo := Trim(edtchaveprimaria.text);
     if (codigo<>'') then
     begin
          with (clAux) do
          begin
               clAux := TClassAuxiliar.Create;
               conect (database, self);
               clearSql;
               AddParam ('Select *                                       ');
               AddParam ('From  '+entidade+'                             ');
               AddParam ('Where ('+camposchaveprimaria[0]+'='+codigo+')  ');
               frm_principal.BarraDicas.caption:='Buscando '+labelentidade+'...Aguarde!';
               frm_principal.refresh;
               if (not Execute) then
               begin
                   frm_principal.BarraDicas.caption:='';
                   if (btnCancelainclusao.enabled) then
                      HabilitaMenus (false,true,false,true,true,true)
                   else HabilitaMenus (true,false,false,true,true,true);
                   LimparEdits;
               end
               else
               begin
                   frm_principal.BarraDicas.caption:='';
                   HabilitaMenus (true,false,true,true,true,true);
                   if (Cancelarincluso1.enabled) then CodigoInclusao:=0;
                   PreencheEditsEntidade (clAux);
               end;
               edtchaveprimaria.text:=form_nz(strtoint(codigo),tamanhoedtchaveprimaria);
               desconect;
               Free;
          end;
     end;
     lbF8.visible:=false;
     lbF8Mens.visible:=false;
end;

procedure Tfrm_formulario1.PreencheEditsEntidade (clAux: TClassAuxiliar);
var
Lista: TList;
tam,ind: integer;
campo,tipo: string;
begin
     Lista:=TList.Create;
     formulario.GetTabOrderList(Lista);
     ind:=1;
     while (ind<Lista.count) do
     begin
       if (TWinControl(Lista.items[ind]).tag<>0) then
       begin
          if (TWinControl(Lista.items[ind]) is TMaskedit) then
          begin
               tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
               campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
               tam   := atributosentidade[TWinControl(Lista.items[ind]).tag].tamanho;
               if (tipo='c') then
                 TMaskEdit(Lista.items[ind]).text:=Trim(clAux.result(campo))
               else if (tipo='i') then
                 TMaskEdit(Lista.items[ind]).text:=form_nz(clAux.result(campo),tam)
               else if (tipo='m') then
                 TMaskEdit(Lista.items[ind]).text:=form_nc(clAux.result(campo),tam)
               else if (tipo='d') then
                 TMaskEdit(Lista.items[ind]).text:=form_data(clAux.result(campo));
          end
          else if (TWinControl(Lista.items[ind]) is TPanel) then
          begin
               tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
               campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
               tam   := atributosentidade[TWinControl(Lista.items[ind]).tag].tamanho;
               if (tipo='c') then
                 TPanel(Lista.items[ind]).caption:=Trim(clAux.result(campo))
               else if (tipo='i') then
                 TPanel(Lista.items[ind]).caption:=form_nz(clAux.result(campo),tam)
               else if (tipo='m') then
                 TPanel(Lista.items[ind]).caption:=form_nc(clAux.result(campo),tam)
               else if (tipo='d') then
                 TPanel(Lista.items[ind]).caption:=form_data(clAux.result(campo));
          end
          else if (TWinControl(Lista.items[ind]) is TRadioGroup) then
          begin
               tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
               campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
               tam   := atributosentidade[TWinControl(Lista.items[ind]).tag].tamanho;
               if (tipo='c') then
                   TRadioGroup(Lista.items[ind]).itemindex:=strtoint(Trim(clAux.result(campo)))
               else if (tipo='i') then
                   TRadioGroup(Lista.items[ind]).itemindex:=clAux.result(campo);
          end
          else if (TWinControl(Lista.items[ind]) is TCheckBox) then
          begin
               tipo  := atributosentidade[TWinControl(Lista.items[ind]).tag].tipo;
               campo := atributosentidade[TWinControl(Lista.items[ind]).tag].nome;
               tam   := atributosentidade[TWinControl(Lista.items[ind]).tag].tamanho;
               if (tipo='c') then
               begin
                    if (Trim(clAux.result(campo))='1') then
                         TCheckBox(Lista.items[ind]).checked:=true
                    else if (Trim(clAux.result(campo))='0') then
                         TCheckBox(Lista.items[ind]).checked:=false;
               end
               else if (tipo='i') then
               begin
                    if (clAux.result(campo)=1) then
                         TCheckBox(Lista.items[ind]).checked:=true
                    else if (clAux.result(campo)=0) then
                         TCheckBox(Lista.items[ind]).checked:=false;
               end;
          end;
       end;
       ind:=ind+1;
     end;
     if (edtchavenome<>nil) then
         antNome := Trim(edtchavenome.text);
end;

procedure Tfrm_formulario1.edtmaskeditformulario1Enter(Sender: TObject);
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

procedure Tfrm_formulario1.edtmaskeditformulario1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then FocusControle(TWinControl(sender),true,key);
     if (key=K_CIMA) then FocusControle(TWinControl(sender),false,key);
     if (key=K_F8) then
     begin
          if (Sender is TMaskEditOO) then
          begin
               if (TMaskEditOO(Sender).zTipoPesquisaF8) then
               begin
                   if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='DENTISTAS') then
                       ChamandoF8Dent(TMaskEditOO(Sender),false)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='TRATAMENTOS_CLINICOS') then
                       ChamandoF8Tratamentos(TMaskEditOO(Sender),false)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
                       ChamandoF8GruposProdutos(TMaskEditOO(Sender),false)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PRODUTOS') then
                       ChamandoF8Produtos(TMaskEditOO(Sender),false)
                   else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                       ChamandoF8Forn(TMaskEditOO(Sender),false)
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
                   end;
               end;
          end
          else if (Sender is TMaskEdit) then
          begin
               if (entidade='GRUPOS_PRODUTOS') then
                   ChamandoF8GruposProdutos(TMaskEdit(Sender),false)
          end;
     end;
end;

procedure Tfrm_formulario1.FormActivate(Sender: TObject);
var
Lista: TList;
begin
     if (not flagFormata) then
     begin
         FormataMascarasEdits;
         if (btnIncluir.Glyph.Empty) then
            btnIncluir.Glyph.LoadFromFile
            (frm_principal.x_pathimg+'btn_incluir.bmp');
         if (btnCancelaInclusao.Glyph.Empty) then
            btnCancelaInclusao.Glyph.LoadFromFile
            (frm_principal.x_pathimg+'btn_cancelincluir.bmp');
         if (btnExcluir.Glyph.Empty) then
            btnExcluir.Glyph.LoadFromFile
            (frm_principal.x_pathimg+'btn_excluir.bmp');
         if (btnSalvar.Glyph.Empty) then
            btnSalvar.Glyph.LoadFromFile
            (frm_principal.x_pathimg+'btn_salvar.bmp');
         if (btnImprimir.Glyph.Empty) then
            btnImprimir.Glyph.LoadFromFile
            (frm_principal.x_pathimg+'btn_imprimir.bmp');
         flagFormata:=true;
     end;
     Lista := TList.Create;
     GetTabOrderList(Lista);
     TWinControl(Lista.items[0]).setfocus;
end;

procedure Tfrm_formulario1.btnIncluirClick(Sender: TObject);
begin
     Incluirplano1.click;
end;

procedure Tfrm_formulario1.btnCancelainclusaoClick(Sender: TObject);
begin
     Cancelarincluso1.click;
end;

procedure Tfrm_formulario1.btnExcluirClick(Sender: TObject);
begin
     Excluirplano1.click;
end;

procedure Tfrm_formulario1.btnSalvarClick(Sender: TObject);
begin
     Salvar1.click;
end;

procedure Tfrm_formulario1.btnImprimirClick(Sender: TObject);
begin
     Imprimirplanos1.click;
end;

procedure Tfrm_formulario1.AjustaMaxLength;
var
Lista: TList;
tam,ind: integer;
begin
     Lista:=TList.Create;
     formulario.GetTabOrderList(Lista);
     ind:=1;
     while (ind<Lista.count) do
     begin
       if (TWinControl(Lista.items[ind]).tag<>0) then
       begin
          tam   := atributosentidade[TWinControl(Lista.items[ind]).tag].tamanho;
          if (TWinControl(Lista.items[ind]) is TMaskedit) then
              TMaskEdit(Lista.items[ind]).maxlength := tam
          else if (TWinControl(Lista.items[ind]) is TPanel) then
          else if (TWinControl(Lista.items[ind]) is TRadioGroup) then;
       end;
       ind:=ind+1;
     end;
end;

procedure Tfrm_formulario1.Outros1Click(Sender: TObject);
var
y,ind: integer;
letratipo,mascara: string;
begin
     Application.CreateForm(Tfrm_rl_tite, frm_rl_tite);
     with (frm_rl_tite) do
     begin
       tabela_nm:=entidade;
       caption:=labelentidade;
       with (frm_rl_tite.cmb_campos.items) do
       begin
            clear;
            ind:=1;
            while (ind<=qtdecampos) do
            begin
                 if (atributosentidade[ind].tipo='i') then
                 begin
                      letratipo:='I';
                      mascara:='';
                      y:=1;
                      while (y<=atributosentidade[ind].tamanho) do
                      begin
                           mascara:=mascara+'9';
                           y:=y+1;
                      end;
                 end
                 else if (atributosentidade[ind].tipo='c') then
                 begin
                      letratipo:='T';
                      mascara:='';
                      y:=1;
                      while (y<=atributosentidade[ind].tamanho) do
                      begin
                           mascara:=mascara+'c';
                           y:=y+1;
                      end;
                 end
                 else if (atributosentidade[ind].tipo='d') then
                 begin
                      letratipo:='D';
                      mascara:='99/99/9999';
                 end
                 else if (atributosentidade[ind].tipo='m') then
                 begin
                      letratipo:='N';
                      mascara:=form_nc(99999999999999,atributosentidade[ind].tamanho);
                 end;
                 add(
                     form_t (atributosentidade[ind].labelcampo, 19)+
                     form_t (atributosentidade[ind].nome,       09)+';'+
                     form_t (mascara,                           40)+';'+
                     form_t (letratipo,                         01)
                 );
                 ind:=ind+1;
            end;
       end;
       left := 32;
       top  := 20;
       showmodal;
     end;
end;

procedure Tfrm_formulario1.ImprimeEntidade (tabela: TQuery);
var
ind,total: integer;
indGauge,totGauge: integer;
linha,linhatopocabecalho,linhacabecalho: string;
begin
     {Inicio da visualizacao da impressao ***}
     Mostra_mensagem('Preparando relatório...');
     frm_mensagem.painel.visible:=true;
     frm_mensagem.gauge1.progress:=0;
     with (frm_mem_print) do
     begin
        {configurando o gerador de relatorios}
        PrepareReport;
        frm_principal.x_col_impressao := 80;
        frm_principal.x_arq_impressao := arquivolistagem;
        frm_principal.x_comando       := '12c';
        frm_principal.x_tam_fonte     := 10;
        frm_principal.x_tipo_fonte    := 'Arial';
        Title:= 'CADASTRO DE '+UpperCase(labelentidade);

        {cabecalhos}
        AddLine(form_tc('-',tamanholistagem,'-'));
        ind:=1;
        linhatopocabecalho:='';
        while (ind<=qtdecamposlistagem) do
        begin
             if (atributosentidade[ind].flagImprime) then
                linhatopocabecalho := linhatopocabecalho +
                        form_tc2(' ',atributosentidade[ind].tamanhoimpressao,' ') + '|';
             ind:=ind+1;
        end;
        AddLine(linhatopocabecalho);
        ind:=1;
        linhacabecalho:='';
        while (ind<=qtdecamposlistagem) do
        begin
             if (atributosentidade[ind].flagImprime) then
                linhacabecalho := linhacabecalho + form_tc2(atributosentidade[ind].labelcampo,
                               atributosentidade[ind].tamanhoimpressao,' ') + '|';
             ind:=ind+1;
        end;
        AddLine(linhacabecalho);
        AddLine(form_tc('-',tamanholistagem,'-'));
        total:=0;
        tabela.first;
        indGauge:=0;totGauge:=tabela.recordcount;
        while (not tabela.eof) do
        begin
             linha:='';
             ind:=1;
             while (ind<=qtdecamposlistagem) do
             begin
                  if (atributosentidade[ind].flagImprime) then
                  begin
                       if (atributosentidade[ind].tipo='i') then
                       begin
                            linha:=linha + form_nz  (tabela.fieldbyname(atributosentidade[ind].nome).AsFloat,
                                                                atributosentidade[ind].tamanhoimpressao)+' ';
                       end
                       else if (atributosentidade[ind].tipo='c') then
                       begin
                            linha:=linha + form_t  (tabela.fieldbyname(atributosentidade[ind].nome).AsString,
                                                                atributosentidade[ind].tamanhoimpressao)+' ';
                       end
                       else if (atributosentidade[ind].tipo='d') then
                       begin
                            linha:=linha + form_data (tabela.fieldbyname(atributosentidade[ind].nome).AsDateTime)+' ';
                       end
                       else if (atributosentidade[ind].tipo='m') then
                       begin
                            linha:=linha + form_nc (tabela.fieldbyname(atributosentidade[ind].nome).AsFloat,
                                                    atributosentidade[ind].tamanhoimpressao)+' ';
                       end;
                  end;
                  ind:=ind+1;
             end;
             AddLine(linha);
             total := total + 1;
             tabela.next;
             indGauge:=indGauge+1;
             frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
             frm_mensagem.gauge1.refresh;
        end;
        AddLine(form_tc('-',tamanholistagem,'-'));
        AddLine('Total de '+lowercase(labelentidade)+'  ---> '+form_n (total,tamanhoedtchaveprimaria));
        AddLine('');

        {salto de pagina}
        if (frm_principal.x_salto) then AddLine(chr(18)+chr(12))
        else AddLine(chr(18));
     end;
     frm_principal.BarraDicas.caption:='';
     frm_mem_print.windowstate:=wsMaximized;
     esconde_mensagem;
     frm_mem_print.showmodal;
end;

procedure Tfrm_formulario1.Imprimirplanos1Click(Sender: TObject);
var
clAux: TClassAuxiliar;
begin
     clAux := TClassAuxiliar.Create;
     with (clAux) do
     begin
       conect   (database, self);
       clearSql;
       AddParam ('Select *                             ');
       AddParam ('From   '+entidade+'                  ');
       AddParam ('Order by '+camposchaveprimaria[0]+'  ');
       frm_principal.BarraDicas.caption:='Buscando '+labelentidade+'...Aguarde!';
       frm_principal.refresh;
       Execute;
     end;
     ImprimeEntidade (clAux.consulta);
     clAux.desconect;
     clAux.Free;
end;

procedure Tfrm_formulario1.edtmaskeditformulario1DblClick(Sender: TObject);
begin
    if (Sender is TMaskEditOO) then
    begin
         if (TMaskEditOO(Sender).zTipoPesquisaF8) then
         begin
             if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='DENTISTAS') then
                 ChamandoF8Dent(TMaskEditOO(Sender),false)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='TRATAMENTOS_CLINICOS') then
                 ChamandoF8Tratamentos(TMaskEditOO(Sender),false)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
                 ChamandoF8GruposProdutos(TMaskEditOO(Sender),false)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='PRODUTOS') then
                 ChamandoF8Produtos(TMaskEditOO(Sender),false)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                 ChamandoF8Forn(TMaskEditOO(Sender),false)
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
             end;
         end;
    end
    else if (Sender is TMaskEdit) then
    begin
         if (entidade='GRUPOS_PRODUTOS') then
             ChamandoF8GruposProdutos(TMaskEdit(Sender),false)
    end;
end;

procedure Tfrm_formulario1.edtmaskeditformulario1Exit(Sender: TObject);
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
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='GRUPOS_PRODUTOS') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeGrupoProduto(strtofloat(codigo),self)
             else if (UpperCase(TMaskEditOO(Sender).zEntidadeOO)='FORNECEDORES') then
                TMaskEditOO(Sender).zPainelEntidadeOO.caption:=
                ProcuraNomeForn(strtofloat(codigo),self)
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

procedure Tfrm_formulario1.edtmaskeditformulario1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (Sender is TMaskEditOO) then
     begin
          TMaskEditOO(Sender).FormatarEditNumerico;
     end;
end;

procedure Tfrm_formulario1.FormataMascarasEdits;
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

procedure Tfrm_formulario1.FormCreate(Sender: TObject);
begin
     flagFormata:=false;
end;

procedure Tfrm_formulario1.ExibeCritica (mensagem,assunto: string; edit: TObject);
begin
     frmDialogo.ExibirMensagem (mensagem,assunto,[mbOk],
        frm_principal.x_pathimg+'iconeerro.bmp',250,200);
     if (edit is TMaskEdit) then
         TMaskEdit(edit).setfocus;
end;

end.
