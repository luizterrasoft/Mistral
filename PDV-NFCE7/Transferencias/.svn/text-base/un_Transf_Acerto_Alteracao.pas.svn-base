unit un_Transf_Acerto_Alteracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, Mask, MaskEditOO, LabelOO;

type
  Tfrm_Transf_Acerto_Alteracao = class(TForm)
    Bevel1: TBevel;
    LabelOO1: TLabelOO;
    edtQtdeAtual: TMaskEditOO;
    LabelOO2: TLabelOO;
    edtNovaQtde: TMaskEditOO;
    btnSalvar: TPanel;
    BotaoSair1: TBotaoSair;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNovaQtdeEnter(Sender: TObject);
    procedure edtNovaQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeAtualEnter(Sender: TObject);
    procedure edtQtdeAtualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tecla: Integer;
  end;

var
  frm_Transf_Acerto_Alteracao: Tfrm_Transf_Acerto_Alteracao;

implementation

{$R *.dfm}

procedure Tfrm_Transf_Acerto_Alteracao.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Transf_Acerto_Alteracao.FormCreate(Sender: TObject);
begin
  tecla:=27;
end;

procedure Tfrm_Transf_Acerto_Alteracao.btnSalvarClick(Sender: TObject);
begin
  if (edtNovaQtde.GetValor<>0) then
  begin
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_Transf_Acerto_Alteracao.edtNovaQtdeEnter(Sender: TObject);
begin
  edtNovaQtde.selectall;
end;

procedure Tfrm_Transf_Acerto_Alteracao.edtNovaQtdeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnSalvarClick(btnSalvar);
  if (key=38) then
    edtQtdeAtual.setfocus;
end;

procedure Tfrm_Transf_Acerto_Alteracao.edtQtdeAtualEnter(Sender: TObject);
begin
  edtQtdeAtual.selectall;
end;

procedure Tfrm_Transf_Acerto_Alteracao.edtQtdeAtualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNovaQtde.setfocus;
  if (key=38) then
  ;
end;

procedure Tfrm_Transf_Acerto_Alteracao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

procedure Tfrm_Transf_Acerto_Alteracao.FormActivate(Sender: TObject);
begin
  edtNovaQtde.setfocus;
end;

end.
