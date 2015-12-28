unit unAlertaProtecao_Manutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO, Mask, MaskEditOO,
  Buttons;

type
  Tfrm_AlertaProtecao_Manutencao = class(TForm)
    Image2: TImage;
    Bevel1: TBevel;
    lblLicenca: TLabelOO;
    LabelOO5: TLabelOO;
    edtChave1: TMaskEditOO;
    Bevel3: TBevel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbMes: TComboBox;
    LabelOO1: TLabelOO;
    edtAno: TMaskEditOO;
    procedure btnCancelClick(Sender: TObject);
    procedure edtChave1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtChave1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAnoEnter(Sender: TObject);
    procedure edtAnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: Boolean;
    tecla: Integer;
    procedure FocusControle (controle: TWinControl; direcao: Boolean; tecla: Integer);
  end;

var
  frm_AlertaProtecao_Manutencao: Tfrm_AlertaProtecao_Manutencao;

implementation

uses unAlertaProtecao, principal, auxiliar, funcoes1, funcoes2;

{$R *.dfm}

procedure Tfrm_AlertaProtecao_Manutencao.FocusControle
  (controle: TWinControl; direcao: Boolean; tecla: Integer);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind,indAnt: Integer;
  flagFocus: Boolean;
begin
  flagFocus:=true;
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  indAnt:=ind;
  if (direcao) then
  begin
    while (true) do
    begin
      ind:=ind+1;
      if (TWinControl(Lista.items[ind]).enabled) then
      begin
        if (ind<=Lista.count) then
          proxcontrole:=Lista.items[ind]
        else
          proxcontrole:= Lista.items[0];
        break;
      end
      else
      if (TWinControl(Lista.items[ind]).Name='edtObs') then
        if (tecla=13) then
        begin
          flagFocus:=false;
          break;
        end
        else
        if (tecla=40) then
          proxcontrole:= Lista.items[indAnt];
    end;
  end
  else
    while (true) do
    begin
      ind:=ind-1;
      if (TWinControl(Lista.items[ind]).enabled) then
      begin
        if (ind>=0) then
          proxcontrole:=Lista.items[ind]
        else
          proxcontrole:= Lista.items[Lista.count-1];
        break;
      end;
    end;
  if (flagFocus) then
    proxcontrole.setfocus;
  Lista.Free;
end;

procedure Tfrm_AlertaProtecao_Manutencao.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AlertaProtecao_Manutencao.edtChave1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AlertaProtecao_Manutencao.FormCreate(Sender: TObject);
begin
  ativou:=false;
  tecla:=27;
end;

procedure Tfrm_AlertaProtecao_Manutencao.btnOkClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  posicao: Integer;
  codigo: String;
  chave_calculada: String;
  chave_secreta: String;
  Month,Year,Day: Word;
begin
  chave_secreta := trim(edtChave1.text);

  if (cbMes.itemindex>=0) and
    (cbMes.itemindex<=11) and
    (edtAno.GetValor<>0) and
    (trim(chave_secreta)<>'')
  then
  begin
    Month   := cbMes.itemindex+1;
    Year    := edtAno.GetValor;

    clAux := TClassAuxiliar.Create;
    clAux.conect   ('ESTOQUE',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT CODIGO FROM ARQ_PROT  ');
    clAux.AddParam ('WHERE (MES=:MES) AND         ');
    clAux.AddParam ('      (ANO=:ANO)             ');
    clAux.consulta.parambyname('MES').AsInteger := Month;
    clAux.consulta.parambyname('ANO').AsInteger := Year;
    if (not clAux.Execute) then
    begin
      posicao := 5;
      codigo  := ConverteDecimalBinario(posicao);
      chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));

              //7. - VERIFICACAO:"SE ACERTOU O CODIGO DE SEGURANCA?"
      if (chave_secreta=chave_calculada) then
      begin
        clAux.ClearSql;
        clAux.AddParam ('INSERT INTO ARQ_PROT (MES,ANO,CODIGO,CHAVESECRETA,TRIES)   ');
        clAux.AddParam ('VALUES (:MES,:ANO,:CODIGO,:CHAVESECRETA,:TRIES)            ');
        clAux.consulta.parambyname('MES').AsInteger          := Month;
        clAux.consulta.parambyname('ANO').AsInteger          := Year;
        clAux.consulta.parambyname('CODIGO').AsString        := '00000101';
        clAux.consulta.parambyname('CHAVESECRETA').AsString  := chave_secreta;
        clAux.consulta.parambyname('TRIES').AsInteger        := 0;
        clAux.Execute;

        tecla:=13;
        showmessage ('Mês: '+cbMes.text+' - Ano: '+edtAno.text+' LIBERADO!');
      end
      else
      begin
        showmessage ('Chave secreta incorreta para a Mês/Ano considerados!');
        showmessage ('Obtenha a chave secreta correta com o suporte!');
      end;
    end
    else
      showmessage ('Mês/Ano já se encontram liberados!');
    clAux.desconect;
    clAux.Free;

    close;
  end;
end;

procedure Tfrm_AlertaProtecao_Manutencao.edtChave1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnOk.click;
  if (key=38) then
    edtAno.setfocus;
end;

procedure Tfrm_AlertaProtecao_Manutencao.cbMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    edtAno.setfocus;
end;

procedure Tfrm_AlertaProtecao_Manutencao.edtAnoEnter(Sender: TObject);
begin
  tmaskedit(sender).selectall;
end;

procedure Tfrm_AlertaProtecao_Manutencao.edtAnoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    edtChave1.setfocus;
  if (key=38) then
    cbMes.setfocus;
end;

end.
