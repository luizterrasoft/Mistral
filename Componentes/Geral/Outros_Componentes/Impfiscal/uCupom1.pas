unit uCupom1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBTables, Mask, DBCtrls, PrgFiscal;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Session1: TSession;
    PrgFiscal1: TPrgFiscal;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MudapathAlias(const Alias, Path : String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uFatur1, dmCF;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
 res : Boolean;
begin
  Screen.Cursor := crHourGlass;
  res := PrgFiscal1.LeitStatus;
  if ( res = True ) then  begin
    Screen.Cursor := crDefault;
    FormCupomFiscal.ShowModal;
  end else begin
   Screen.Cursor := crDefault;
   MessageDlg('Não foi possível comunicar com o ECF!',
   mtWarning,[mbOK],0);
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
 case ComboBox1.ItemIndex of
 0:
   PrgFiscal1.ECFModel := teBematech;
 1:
   PrgFiscal1.ECFModel := teSweda;
 2:
   PrgFiscal1.ECFModel := teSchalterSP;
 3:
   PrgFiscal1.ECFModel := teYanco;
 4:
   PrgFiscal1.ECFModel := teElgin;
 5:
   PrgFiscal1.ECFModel := teZanthusIZs_e_Qz;
 6:
   PrgFiscal1.ECFModel := teCorisco;
 end;
 if ( ComBoBox1.ItemIndex = 5 ) then begin
    PrgFiscal1.ZanthusConfigura;
 end;
 
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Self.Close;
end;

procedure TForm1.MudapathAlias(const Alias, Path : String);
var
  AliasParams: TStringList;
begin
 Session.DeleteAlias(Alias);
 Session.AddStandardAlias(Alias, Path, 'PARADOX');
 Session.SaveConfigFile;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  MudapathAlias('SupFiscal', ExtractFilepath(Application.ExeName)+'dados');
end;

end.

