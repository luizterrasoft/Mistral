unit un_ConfigFuncionamentoDoSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  Tfrm_ConfigFuncionamentoDoSistema = class(TForm)
    Panel5: TPanel;
    botao_sair: TPanel;
    botao1: TPanel;
    Label3: TLabel;
    rdTipoFunc: TRadioGroup;
    Bevel1: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: Boolean;
  end;

var
  frm_ConfigFuncionamentoDoSistema: Tfrm_ConfigFuncionamentoDoSistema;

implementation

uses principal, auxiliar;

{$R *.dfm}

procedure Tfrm_ConfigFuncionamentoDoSistema.FormActivate(Sender: TObject);
begin
  if (not ativou) then
  begin
    rdTipoFunc.itemindex := frm_principal.x_tipo_funcionamento_sistema;
    ativou:=true;
  end;
end;

procedure Tfrm_ConfigFuncionamentoDoSistema.FormCreate(Sender: TObject);
begin
  ativou:=false;
end;

procedure Tfrm_ConfigFuncionamentoDoSistema.botao1Click(Sender: TObject);
var
  clFunc: TClassAuxiliar;
begin
  if (rdTipoFunc.itemindex<>frm_principal.x_tipo_funcionamento_sistema) then
  begin
    showmessage ('A alteração do funcionamento só será válida na próxima'+#13+'vez que o sistema for executado!');
          
    clFunc := TClassAuxiliar.Create;
    clFunc.conect   ('C:\NATIVA',self);
    clFunc.ClearSql;
    clFunc.AddParam ('UPDATE TIPOFUNCVENDAS.DBF SET TIPO=:tipo');
    clFunc.consulta.parambyname('tipo').AsFloat := rdTipoFunc.itemindex;
    clFunc.Execute;
    clFunc.desconect;
    clFunc.Free;
  end;
  close;
end;

procedure Tfrm_ConfigFuncionamentoDoSistema.botao_sairClick(
  Sender: TObject);
begin
  close;
end;

procedure Tfrm_ConfigFuncionamentoDoSistema.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

end.
