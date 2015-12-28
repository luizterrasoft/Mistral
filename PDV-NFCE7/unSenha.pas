unit unSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DB, DBTables, Buttons;

type
  TfrmSenha = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    edtData: TMaskEdit;
    lblDiaSemana: TLabel;
    btnOk: TPanel;
    btnCancel: TPanel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataEnter(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtDataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagData: Boolean;
    flagEntra: Boolean;
    tentativas: Integer;
  end;

var
  frmSenha: TfrmSenha;

implementation

uses principal, DM3, DM2, funcoes1, procura, unDialogo, auxiliar;

{$R *.DFM}

procedure TfrmSenha.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  if (not flagData) then
  begin
    Label2.visible  := false;
    edtData.visible := false;
    Bevel1.height   := 115;
    frmSenha.height := 129;
  end
  else
  begin
    Label2.visible  := true;
    edtData.visible := true;
    Bevel1.height   := 118;
    frmSenha.height := 145;
  end;
     
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

     {...}
  flagEntra:=false;
  edtData.setfocus;
end;


{Botao de pesquisa pelo usuario ***}
procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not flagEntra) then
    frm_principal.close;
end;

procedure TfrmSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    btnCancelClick(Sender);
end;

procedure TfrmSenha.edtDataEnter(Sender: TObject);
begin
  edtData.selectall;
  if (edtData.text='  /  /    ') then
    edtData.text:=datetostr(date);
end;

procedure TfrmSenha.edtDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnOkClick(Sender);
end;

procedure TfrmSenha.btnOkClick(Sender: TObject);
var
  dataMaior,data: TDateTime;
  continua: Boolean;
begin
   {CRITICA AS DATAS}
  if (flagData) then
    try
      data := strtodate(edtData.text);
      continua:=true;
    except
      showmessage('A data informada é inválida!');
      edtData.setfocus;
      continua:=false;
      data:=date;
    end
  else
    data:=date;

   {...}
  if (data<>date) then
    if (Application.MessageBox(Pchar('A data informada ('+datetostr(data)+') não confere '+
      'com a data do computador ('+datetostr(date)+'). Continua mesmo assim? '),
      'Senha',4+32)=6) then
      continua:=true
    else
      continua:=false;
  if (continua) then
  begin
        {Configurando o usuario do sistema ***}
    frm_principal.x_data_trabalho := data;
    flagEntra:=true;
    frmSenha.close;
  end;
end;

procedure TfrmSenha.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSenha.edtDataChange(Sender: TObject);
var
  letraInicial: String;
begin
  if (edtData.text<>'  /  /    ') then
    try
      lblDiaSemana.caption:=FormatDateTime('dddd',strtodate(edtData.text));
      letraInicial:=Copy(lblDiaSemana.caption,1,1);
      lblDiaSemana.caption:='['+UpperCase(letraInicial)+Copy(lblDiaSemana.caption,2,Length(lblDiaSemana.caption)-1)+']';
    except
      lblDiaSemana.caption:=' ';
    end;
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
end;

end.
