unit unProbIniciar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,funcoesglobais,comobj,olectrls,db,dbtables,{NMsmtp,}ShellApi,JPEG;

type
  Tfrm_ProbIniciar = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    //procedure Label4Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ProbIniciar: Tfrm_ProbIniciar;

implementation

{$R *.DFM}

procedure Tfrm_ProbIniciar.FormActivate(Sender: TObject);
begin
  frm_probIniciar.caption:='';
end;

procedure Tfrm_ProbIniciar.Label10Click(Sender: TObject);
var
  Outlook: Olevariant;
  vMailItem: Variant;
//  NMSMTP1:TNMSMTP;

  dc : hdc;
  cv : TCanvas;
  aux : TBitmap;
  FJPeg:TJpegImage;

const
  olMailItem:Integer=0;


begin

  try
    Outlook := GetActiveOleObject('Outlook.Application');
  except
    Outlook := CreateOleObject('Outlook.Application');
  end;

  self.refresh;
  vMailItem := Outlook.CreateItem(olMailItem);
  vMailItem.Recipients.Add('suporte@mistralsistemas.com.br'); // 1o destinat�rio
  vMailItem.Recipients.Add('vinicius@mistralsistemas.com'); // 2o destinat�rio
  vMailItem.Recipients.Add('armando@mistralsistemas.com'); // 3o destinat�rio
  self.refresh;
  with TQuery.create(Application) do
    try
      databasename := 'VENDAS';
      sql.add('Select Empresa from Conf');
      try
        open;
        vMailItem.Subject := 'Erro no Cliente '+fieldbyname('Empresa').AsString+' Modulo '+Application.Title;
      except
        vMailItem.Subject := 'Erro de Conex�o '+Application.Title;
        ;
      end;
    finally
      destroy;
    end;


  vMailItem.Body := Memo1.Text; // Corpo do
  if FileExists(ExtractFilePath(Application.ExeName)+'ERRO'+copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName)) - 4)+'.jpg') then
    vMailItem.Attachments.Add(ExtractFilePath(Application.ExeName)+'ERRO'+copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName)) - 4)+'.jpg'); // arquivo
  vMailItem.Send;
  self.refresh;
  VarClear(Outlook);
end;

{procedure Tfrm_ProbIniciar.Label4Click(Sender: TObject);
begin
   Memo1.SetFocus;
   Memo1.SelectAll;
   keybd_event(VK_Control, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
   keybd_event(67, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
   keybd_event(67, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
   keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
   ShellExecute(Handle,nil,PChar('http://www.nativasoft.com.br/site/chamado.asp'), nil, nil, SW_HIDE);
end; }

procedure Tfrm_ProbIniciar.Panel1Click(Sender: TObject);
begin
  close;
end;

end.
