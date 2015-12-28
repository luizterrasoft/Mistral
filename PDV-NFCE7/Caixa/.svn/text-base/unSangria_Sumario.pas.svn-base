unit unSangria_Sumario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, BotaoSair;

type
  TfrmSangria_Sumario = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    BotaoSair1: TBotaoSair;
    Memo2: TMemo;
    Memo3: TMemo;
    Label2: TLabel;
    procedure BotaoSair1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSangria_Sumario: TfrmSangria_Sumario;

implementation

{$R *.dfm}

procedure TfrmSangria_Sumario.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSangria_Sumario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=27) then
    close;
end;

end.
