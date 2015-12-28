unit uFrmParamNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrmParamNF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblCFOP: TLabel;
    lblCSOSN: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCFOP: TEdit;
    edtCSOSN: TEdit;
    edtCFOP3: TEdit;
    edtCFOP4: TEdit;
    edtCFOP5: TEdit;
    btnOK: TButton;
    procedure edtCFOPExit(Sender: TObject);
    procedure edtCSOSNExit(Sender: TObject);
    procedure edtCFOP3Exit(Sender: TObject);
    procedure edtCFOP4Change(Sender: TObject);
    procedure edtCFOP5Change(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      ModeloNF : String;
  end;

var
  FrmParamNF: TFrmParamNF;


implementation

{$R *.dfm}

procedure TFrmParamNF.edtCFOPExit(Sender: TObject);
begin
   ModeloNF := '65';
   if (Trim(EdtCFOP.Text) = '6201') or (Trim(EdtCFOP.Text)= '6202') then
      begin
         ModeloNF := '55';
         ShowMessage('Esta será uma NFE');
      end;

   If (Trim(EdtCFOP.Text) = '6201') then
       lblCFOP.Caption := 'Devolução de Compra para Industrialização ';
   If (Trim(EdtCFOP.Text) = '6202') then
       lblCFOP.Caption := 'Devolução de Compra para Comercialização ';
   If (Trim(EdtCFOP.Text) = '6915') then
       lblCFOP.Caption := 'Devolução ... ';
   If (Trim(EdtCFOP.Text) = '5102') then
       lblCFOP.Caption := 'Venda de Mercadoria Adquirida Recebida de Terceiro ';

end;

procedure TFrmParamNF.edtCSOSNExit(Sender: TObject);
begin
  lblCSOSN.Caption := 'lblCSOSN';
end;

procedure TFrmParamNF.edtCFOP3Exit(Sender: TObject);
begin
   Label8.Caption := 'CFOP';
end;

procedure TFrmParamNF.edtCFOP4Change(Sender: TObject);
begin
  Label9.Caption := 'CFOP';
end;

procedure TFrmParamNF.edtCFOP5Change(Sender: TObject);
begin
   Label10.Caption := 'CFOP';
end;

procedure TFrmParamNF.btnOKClick(Sender: TObject);
begin
  close;
end;

end.
