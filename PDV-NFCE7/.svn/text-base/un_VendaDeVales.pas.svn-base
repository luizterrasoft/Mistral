unit un_VendaDeVales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, StdCtrls, Mask, ExtCtrls, BotaoSair,
  MaskEditOO, LabelOO;

type
  Tfrm_VendaDeVales = class(Tfrm_Auxformulario1)
    BotaoSair1: TBotaoSair;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    botao2: TPanel;
    LabelOO1: TLabelOO;
    edtNumero: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtValor: TMaskEditOO;
    rdTipo: TRadioGroup;
    lbtipz: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_flagFecharAposSalvar: Boolean;
    tipz: String;
    function JaExisteValeComEsteNumero(numero: String):Boolean;
  end;

var
  frm_VendaDeVales: Tfrm_VendaDeVales;

implementation

uses principal, auxiliar, funcoes1, funcoes2, unDialogo, un_AjudaComandos;

{$R *.DFM}

procedure Tfrm_VendaDeVales.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_VendaDeVales.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    botao2Click(Sender);
  if (key=38) then
    edtNumero.setfocus;
end;

procedure Tfrm_VendaDeVales.N1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  tipo_vale: String;
begin
  if (edtNumero.GetValor='') then
    ExibeCritica('O número do vale deve ser informado!','Caixa',edtNumero)
  else
  if (edtValor.GetValor=0.00) then
    ExibeCritica('O valor do vale deve ser informado!','Caixa',edtValor)
  else
  if (JaExisteValeComEsteNumero(edtNumero.GetValor)) then {*}
    ExibeCritica('Já existe vale lançado com este número!','Caixa',edtNumero)
  else
  if (frmDialogo.ExibirMensagem ('Confirma emissão do Vale?'
    ,'Caixa',[mbYes,mbNo]
    ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
  begin
    if (rdTipo.itemindex=0) then
      tipo_vale:='P'
    else
    if (rdTipo.itemindex=1) then
      tipo_vale:='S'
    else
    if (rdTipo.itemindex=2) then
      tipo_vale:='T'
    else
    if (rdTipo.itemindex=3) then
      tipo_vale:='D'
    else
    if (rdTipo.itemindex=4) then
      tipo_vale:='B'
    else
    if (rdTipo.itemindex=5) then
      tipo_vale:='O';
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('INSERT INTO VALES_EMITIDOS (VA_LOJA,VA_CAIX,VA_FUNC,VA_DATA,VA_NUME,VA_VALO,VA_TIPO,VA_TIPZ)');
    clAux.AddParam ('VALUES (:VA_LOJA,:VA_CAIX,:VA_FUNC,:VA_DATA,:VA_NUME,:VA_VALO,:VA_TIPO,:VA_TIPZ)');
    clAux.consulta.parambyname('VA_LOJA').AsFloat    := frm_principal.x_loja; {*}
    clAux.consulta.parambyname('VA_CAIX').AsFloat    := frm_principal.x_terminal; {*}
    clAux.consulta.parambyname('VA_FUNC').AsFloat    := frm_principal.x_caixa_ativo; {*}
    clAux.consulta.parambyname('VA_NUME').AsString   := edtNumero.GetValor; {*}
    clAux.consulta.parambyname('VA_DATA').AsDateTime := frm_principal.x_data_trabalho;
    clAux.consulta.parambyname('VA_VALO').AsFloat    := edtValor.GetValor;
    clAux.consulta.parambyname('VA_TIPO').AsString   := tipo_vale;
    clAux.consulta.parambyname('VA_TIPZ').AsString   := tipz;
    clAux.Execute; {*}
    clAux.desconect;
    clAux.Free;
    if (y_flagFecharAposSalvar) then
      close
    else
    begin
      Limparformulrio1.click;
      edtNumero.setfocus;
    end;
  end;
end;

function Tfrm_VendaDeVales.JaExisteValeComEsteNumero(numero: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecontas,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VA_FUNC FROM VALES_EMITIDOS   ');
  clAux.AddParam ('WHERE (VA_LOJA=:loja) AND      ');
  clAux.AddParam ('      (VA_CAIX=:terminal) AND  ');
  clAux.AddParam ('      (VA_DATA=:data) AND      ');
  clAux.AddParam ('      (VA_FUNC=:func) AND      ');
  clAux.AddParam ('      (VA_NUME=:numero)        ');
  clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  clAux.consulta.parambyname('func').AsFloat     := frm_principal.x_caixa_ativo;
  clAux.consulta.parambyname('numero').AsString  := numero;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_VendaDeVales.botao2Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_VendaDeVales.Limparformulrio1Click(Sender: TObject);
begin
  inherited;
  botao2.caption := 'Salvar lançamento - [F5]';
  BotaoSair1.caption := 'SAIR';
end;

procedure Tfrm_VendaDeVales.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key=K_F1) then
  begin
    ListaAtalhosF1.clear;
    ListaAtalhosF1.Add('  [F1]     - Ajuda ');
    ListaAtalhosF1.Add('  [CTRL+L] - Limpar formulário ');
    ListaAtalhosF1.Add('  [F5]     - Salvar');
    ListaAtalhosF1.Add('  [ESC]    - Sair');
    Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
    frm_AjudaComandos.showmodal;
    frm_AjudaComandos.Free;
  end;
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
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
    end;
end;

procedure Tfrm_VendaDeVales.FormCreate(Sender: TObject);
begin
  inherited;
  y_flagFecharAposSalvar:=false;
  tipz:='1';
  lbtipz.caption:='Sr.: '+tipz;
end;

end.
