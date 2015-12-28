unit OpcoesMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,FuncoesGlobais,Buttons;


type



  TFrmOpcao = class(TForm)
    PanelOpcao: TPanel;
    LbMensagem: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
   Proc:TProcOpcoesMensagem;
   Flag:String;
   procedure fclick(sender: TObject);
   procedure ClickButtonMensOpcoes(Sender: TObject);
    { Public declarations }
  end;

var
  FrmOpcao: TFrmOpcao;

implementation

{$R *.DFM}

procedure TFrmOpcao.FormCreate(Sender: TObject);
begin
  Image1.Picture.Icon := Application.Icon;
end;

procedure TFrmOpcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

Procedure TFrmOpcao.ClickButtonMensOpcoes(Sender:TObject);
var Fecha:Boolean;
    I:Integer;
begin
   Fecha := False;
   Proc(TBitBtn(Sender).Caption,Self.Flag,Fecha);
   If Fecha then begin
      Close;
   end;
end;

procedure TFrmOpcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   IF KEY = VK_ESCAPE THEN
    CLOSE;
end;

procedure TFrmOpcao.FormKeyPress(Sender: TObject; var Key: Char);
var
vkey:string;
begin
  IF KEY IN ['0'..'9'] THEN begin
   vkey := iifs(key = '0','10',strtointn(key) - 1);
   IF (findcomponent('ButtonOpcao'+VKey) <> nil) and
      (findcomponent('ButtonOpcao'+VKey) is TBitBtn) and
      (TBitBtn(findcomponent('ButtonOpcao'+VKey)).enabled)   then begin
        TBitBtn(findcomponent('ButtonOpcao'+VKey)).setfocus;
        TBitBtn(findcomponent('ButtonOpcao'+VKey)).Click;
   end;
 end;
end;

PROCEDURE TFrmOpcao.fclick(sender:TObject);
begin
   TWinControl(Sender).SetFocus;
   if Self.Tag = 2 then
    visible := false;
   tag := 1;
end;

procedure TFrmOpcao.FormDestroy(Sender: TObject);
begin
  FrmOpcao := nil;
end;

end.
