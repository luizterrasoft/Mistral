unit un_LancaVenda_AlteraPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, MaskEditOO, LabelOO, ExtCtrls;

type
  Tfrm_LancaVenda_AlteraPreco = class(TForm)
    btnOk: TPanel;
    btnCancel: TPanel;
    LabelOO1: TLabelOO;
    LabelOO2: TLabelOO;
    edtPrecoSugerido: TMaskEditOO;
    edtNovoPreco: TMaskEditOO;
    Bevel1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNovoPrecoEnter(Sender: TObject);
    procedure edtNovoPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNovoPrecoExit(Sender: TObject);
    procedure edtNovoPrecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tecla: Integer;
  end;

var
  frm_LancaVenda_AlteraPreco: Tfrm_LancaVenda_AlteraPreco;

implementation

uses unDialogo, principal, funcoes1, funcoes2;

{$R *.DFM}

procedure Tfrm_LancaVenda_AlteraPreco.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_LancaVenda_AlteraPreco.btnOkClick(Sender: TObject);
begin
  if (edtNovoPreco.GetValor=0) then
    frmDialogo.ExibirMensagem ('Preço não pode ficar vazio!'
      ,'Venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  begin
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_LancaVenda_AlteraPreco.FormCreate(Sender: TObject);
begin
  tecla:=27;
end;

procedure Tfrm_LancaVenda_AlteraPreco.FormActivate(Sender: TObject);
begin
  edtNovoPreco.setfocus;
end;

procedure Tfrm_LancaVenda_AlteraPreco.edtNovoPrecoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_LancaVenda_AlteraPreco.edtNovoPrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    btnOkClick(Sender);
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_LancaVenda_AlteraPreco.edtNovoPrecoExit(Sender: TObject);
begin
  FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_LancaVenda_AlteraPreco.edtNovoPrecoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (TMaskEdit(sender));
end;

end.
