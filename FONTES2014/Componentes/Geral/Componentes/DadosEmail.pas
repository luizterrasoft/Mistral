unit DadosEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EditControle, Buttons;

type
  TFrm_DadosEmail = class(TForm)
    Host: TEditControle;
    LoginUsuario: TEditControle;
    Password: TEditControle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Porta: TEditControle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_DadosEmail: TFrm_DadosEmail;

implementation

{$R *.DFM}

end.
