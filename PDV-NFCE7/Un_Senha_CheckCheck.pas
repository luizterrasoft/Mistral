unit Un_Senha_CheckCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, EditControle, Pesquisa, PanelControle, DB,
  DBTables,funcoes1,funcoesglobais;

type
  TFrm_Senha_CheckCheck = class(TForm)
    Panel1: TPanel;
    Senha: TEditControle;
    lblCMC7: TLabel;
    btnAplicar: TButton;
    botao_sair: TPanel;
    Query1: TQuery;
    procedure SenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAplicarClick(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    FSenhaMaster:Boolean;
    FFunc       :String;
    { Public declarations }
  end;

var
  Frm_Senha_CheckCheck: TFrm_Senha_CheckCheck;

implementation

{$R *.dfm}

procedure TFrm_Senha_CheckCheck.SenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    BtnAplicar.click;
end;

procedure TFrm_Senha_CheckCheck.btnAplicarClick(Sender: TObject);
begin
  query1.sql.clear;
  query1.sql.add('Select ck_SenhaM from CheckCheck');
  query1.open;

  if Query1.FieldByName('Ck_SenhaM').AsString = criptografar(Senha.Text) then
  begin
    FFunc := 'MASTER';
    BtnAplicar.ModalResult := MrOk;
    close;
    FSenhaMaster := true;
    Exit;
  end;

  query1.sql.clear;
  query1.sql.add('Select UsAlias  from Users');
  query1.sql.add('Where uspassword =:Codigo');
  Query1.ParamByName('Codigo').AsString := criptografar(Senha.Text);
  query1.open;

  if not query1.eof then
  begin
    FFunc := Query1.FieldByNAme('UsAlias').AsString;
    BtnAplicar.ModalResult := MrOk;
    close;
  end
  else
  begin
    Mensagem('Senha inválida');
    Senha.setfocus;
    Senha.Clear;
    BtnAplicar.ModalResult := Mrnone;
    exit;
  end;
end;

procedure TFrm_Senha_CheckCheck.botao_sairClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TFrm_Senha_CheckCheck.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if KEY = VK_ESCAPE then
    CLOSE;
end;

end.
