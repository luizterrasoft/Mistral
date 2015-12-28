unit BuscaPath;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons;
                    
type
  TFrmBuscaPath = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Label3: TLabel;
    Label1: TLabel;
    FileListBox1: TFileListBox;
    BitBtn3: TBitBtn;
    BParams: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
                      
var
  FrmBuscaPath: TFrmBuscaPath;

implementation

{$R *.DFM}

procedure TFrmBuscaPath.DriveComboBox1Change(Sender: TObject);
begin
   DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;

procedure TFrmBuscaPath.DirectoryListBox1Change(Sender: TObject);
begin
   FileListBox1.Directory := DirectoryListBox1.Directory;
end;

procedure TFrmBuscaPath.SpeedButton1Click(Sender: TObject);
var NomePasta:String;
begin
  If Not InputQuery('Nome Da Pasta','',NomePasta) Then
   exit;
   
  If (NomePasta <> '') and Not CreateDir(DirectoryListBox1.Directory+'\'+NomePasta) then
    ShowMessage('Não foi possível criar a pasta desejada')
  else if NomePasta <> '' Then
    DirectoryListBox1.Update;
end;

procedure TFrmBuscaPath.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key = Vk_Insert) then
   SpeedButton1Click(Sender);
end;

end.
