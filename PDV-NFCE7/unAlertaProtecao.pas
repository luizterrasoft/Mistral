unit unAlertaProtecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, BotaoSair, StdCtrls, LabelOO, Mask, MaskEditOO,
  Buttons;

type
  Tfrm_AlertaProtecao = class(TForm)
    Image2: TImage;
    Bevel1: TBevel;
    lblAlerta: TLabelOO;
    LabelOO2: TLabelOO;
    lblLicenca: TLabelOO;
    LabelOO3: TLabelOO;
    Bevel2: TBevel;
    lblCodigo: TLabelOO;
    LabelOO5: TLabelOO;
    edtChave1: TMaskEditOO;
    Bevel3: TBevel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Timer1: TTimer;
    lblaviso1: TLabelOO;
    procedure btnCancelClick(Sender: TObject);
    procedure edtChave1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtChave1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ativou: Boolean;
    tecla: Integer;
    procedure FocusControle (controle: TWinControl; direcao: Boolean; tecla: Integer);
  end;

var
  frm_AlertaProtecao: Tfrm_AlertaProtecao;

implementation

{$R *.dfm}

procedure Tfrm_AlertaProtecao.FocusControle
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

procedure Tfrm_AlertaProtecao.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_AlertaProtecao.edtChave1Enter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_AlertaProtecao.FormCreate(Sender: TObject);
begin
  ativou:=false;
  tecla:=27;
end;

procedure Tfrm_AlertaProtecao.FormActivate(Sender: TObject);
begin
  if (not ativou) then
  begin
    Timer1.enabled:=true;
    ativou:=true;
  end;
end;

procedure Tfrm_AlertaProtecao.btnOkClick(Sender: TObject);
begin        
  tecla:=13;
  close;
end;

procedure Tfrm_AlertaProtecao.edtChave1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    btnOk.click;
end;

procedure Tfrm_AlertaProtecao.Timer1Timer(Sender: TObject);
begin
  lblAlerta.visible := not lblAlerta.visible;
end;

procedure Tfrm_AlertaProtecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.enabled:=false;
end;

end.
