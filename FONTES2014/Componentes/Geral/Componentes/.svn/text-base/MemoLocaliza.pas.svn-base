unit MemoLocaliza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, BitBtnControle, EditControle, ExtCtrls;

type
  TFrm_memolocaliza = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Palavra: TEditControle;
    Panel2: TPanel;
    Label2: TLabel;
    PalavraSubst: TEditControle;
    Panel3: TPanel;
    BitBtnControle1: TBitBtnControle;
    BitBtnControle2: TBitBtnControle;
    BitBtnControle3: TBitBtnControle;
    BitBtnControle4: TBitBtnControle;
    procedure BitBtnControle4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnControle1Click(Sender: TObject);
  private
    { Private declarations }
  public
   FRet:Integer;
    { Public declarations }
  end;

var
  Frm_memolocaliza: TFrm_memolocaliza;

implementation

{$R *.dfm}

procedure TFrm_memolocaliza.BitBtnControle4Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_memolocaliza.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
   close;
end;

procedure TFrm_memolocaliza.BitBtnControle1Click(Sender: TObject);
begin
  Fret := TBitBtn(Sender).Tag;
end;

end.
