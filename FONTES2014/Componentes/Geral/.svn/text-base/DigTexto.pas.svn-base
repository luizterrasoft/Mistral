unit DigTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmDigTexto = class(TForm)
    Texto: TMemo;
    procedure TextoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TamanhoLinha : Integer;
  end;

var
  FrmDigTexto: TFrmDigTexto;
  VarRetorno : String;

implementation

{$R *.DFM}

procedure TFrmDigTexto.TextoKeyPress(Sender: TObject; var Key: Char);
Var posicao : Word;
begin
      posicao :=  Texto.Perform(EM_LINEFROMCHAR,Texto.SelStart, 0);
      If (TamanhoLinha > 0) and (Length(Texto.Lines.Strings[Posicao]) >= TamanhoLinha) Then
          Key := #13;
end;

procedure TFrmDigTexto.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var Loop : Word;
begin
       VarRetorno := '';
       //For Loop := 0 To Texto.Lines.Count Do
       //    VarRetorno := VarRetorno + Texto.Lines.Strings[Loop];
       VarRetorno := Texto.Text;
end;

procedure TFrmDigTexto.FormShow(Sender: TObject);
var I:word;
begin
  self.canvas.font := Texto.Font;
  Self.Height      := Self.Canvas.TextHeight('W') * (Texto.Lines.Count + 3) +
                     (Self.Height - Texto.Height);
  If Texto.Lines.Count > 0 then
    Texto.SelStart     := Length(Texto.Lines.Text) + 2;
end;

procedure TFrmDigTexto.TextoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Self.WindowState <> wsMaximized) and
     (Self.Canvas.TextHeight('W') * (Texto.Lines.Count + 3) + (Self.Height - Texto.Height) <= Screen.Width) then begin
        Self.Height  := Self.Canvas.TextHeight('W') * (Texto.Lines.Count + 3) +
                       (Self.Height - Texto.Height);
        Self.Top     := Screen.Height div 2 - Self.Height div 2;
        Self.Width   := Screen.Width;

  end;                     
end;

procedure TFrmDigTexto.FormCreate(Sender: TObject);
begin
    Self.Width   := Screen.Width;
end;

end.
