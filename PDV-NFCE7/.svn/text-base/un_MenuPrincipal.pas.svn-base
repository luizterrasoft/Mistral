unit un_MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tfrm_MenuPrincipal = class(TForm)
    botao_sair: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TPanel;
    Bevel1: TBevel;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao4: TPanel;
    botao5: TPanel;
    botao6: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao_sairClick(Sender: TObject);
    procedure botao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ApagaTudo;
  end;

var
  frm_MenuPrincipal: Tfrm_MenuPrincipal;

implementation

uses un_MenuPrincipal_Opcao1;

{$R *.DFM}

procedure Tfrm_MenuPrincipal.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
end;

procedure Tfrm_MenuPrincipal.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_MenuPrincipal.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_MenuPrincipal.botao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MenuPrincipal_Opcao1, frm_MenuPrincipal_Opcao1);
  frm_MenuPrincipal_Opcao1.showmodal;
  frm_MenuPrincipal_Opcao1.Free;
end;

end.
