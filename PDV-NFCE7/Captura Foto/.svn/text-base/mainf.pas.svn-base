unit mainf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, VideoCap, ExtCtrls,inifiles, StdCtrls, Clipbrd,
  ComCtrls, Buttons,vfw,mmsystem, Jpeg, BotaoSair;

type
  TMain = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckPrev: TCheckBox;
    GroupBox2: TGroupBox;
    BtSPict: TButton;
    Edtfoto: TEdit;
    Panel2: TPanel;
    VideoCap1: TVideoCap;
    BitBtn1: TBitBtn;
    procedure VideoTreiber1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckPrevClick(Sender: TObject);
    procedure VideoFormat1Click(Sender: TObject);
    procedure VideoQuelle1Click(Sender: TObject);
    procedure BtSPictClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private-Deklarationen}
  public
    abril: Integer;
    { Public-Deklarationen}
  end;

var
  Main: TMain;

implementation

uses DlgTreiber, dlgaufz, aboutx, principal, un_frmConsulta1, credito,
  unDialogo, cadcli;

{$R *.DFM}

procedure TMain.VideoTreiber1Click(Sender: TObject);
var
  DrvList:TStrings;
begin
  DlgEinstell:=TDlgEinstell.Create(Self);
  drvList:=  GetDriverList;
  dlgEinstell.Combobox1.Items:= drvList;
  VideoCap1.DriverOpen:= false;
  dlgEinstell.ComboBox1.Itemindex:= VideoCap1.DriverIndex;
  if DlgEinstell.ShowModal = mrOK then
    videoCap1.DriverIndex:= dlgEinstell.combobox1.ItemIndex;

  VideoCap1.DriverOpen:= true;
  DlgEinstell.Free;
  drvList.Clear;
  drvList.Free;
end;

procedure TMain.FormCreate(Sender: TObject);
var
  ini:TInifile;

begin
  Edtfoto.Text := ExtractFilePath(Application.ExeName) + 'Foto.jpg';
  ini:= TInifile.Create('vcap.ini');
  if (VideoCap1.DriverOpen) then
  begin
    VideoCap1.Driverindex := 0;
    VideoCap1.Driverindex := ini.readInteger('Driver','index',0);
  end;
  ini.free;
end;

procedure TMain.FormDestroy(Sender: TObject);
var
  ini:TInifile;

begin
  ini:= TInifile.Create('vcap.ini');
  ini.writeInteger('Driver','index',videoCap1.Driverindex);
  ini.free;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  Edtfoto.text:= frm_principal.x_path_fotos_clientes;
end;

procedure TMain.CheckPrevClick(Sender: TObject);
begin
  VideoCap1.VideoPreview:=CheckPrev.Checked;

end;

procedure TMain.VideoFormat1Click(Sender: TObject);
begin
  VideoCap1.DlgVFormat;
end;

procedure TMain.VideoQuelle1Click(Sender: TObject);
begin
  VideoCap1.DlgVSource;
end;

procedure TMain.BtSPictClick(Sender: TObject);
var
  BMP : TBitMap;
  JPG : TJpegImage;
begin
  VideoCap1.SaveToClipboard;
  BMP := TBitMap.Create;
  BMP.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
  JPG := TJpegImage.Create;
  JPG.Assign(BMP);
  JPG.SaveToFile(Edtfoto.Text);
  edtFoto.Text := 'C:\NATIVA\CREDITO\FOTO\'+frm_Consulta1.edtCpf.Text+'.jpg';
  JPG.SaveToFile(Edtfoto.Text);
//  BMP.SaveToFile(EditSPict.Text+'.bmp');
  JPG.Free;
//  BMP.Free;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
  DlgVPara.Show;
end;

procedure TMain.BitBtn1Click(Sender: TObject);
var
  BMP : TBitMap;
  JPG : TJpegImage;
begin
  if (VideoCap1.DriverOpen) then
  begin
    VideoCap1.SaveToClipboard;
    BMP := TBitMap.Create;
    BMP.LoadFromClipboardFormat(cf_BitMap,ClipBoard.GetAsHandle(cf_Bitmap),0);
    JPG := TJpegImage.Create;
    JPG.Assign(BMP);
    JPG.SaveToFile(Edtfoto.Text);
    edtFoto.Text := 'C:\NATIVA\CREDITO\FOTO\'+frm_Consulta1.edtCpf.Text+'.jpg';
    JPG.SaveToFile(Edtfoto.Text);
//  BMP.SaveToFile(EditSPict.Text+'.bmp');
    JPG.Free;
//  BMP.Free;
    if (abril=1) then
      CarregaFotoCliente_(frm_Consulta1.edtCpf.Text,frm_Consulta1.foto_cliente)
    else
    if (abril=2) then
      CarregaFotoCliente_(frm_edtCliente.edtCpf.Text,frm_edtCliente.foto_cliente);
    Close;
  end;
end;

procedure TMain.FormActivate(Sender: TObject);
begin
  try
    VideoCap1.DriverOpen:=true;
  except
    frmDialogo.ExibirMensagem ('Favor conectar drive de captura!'
      ,'Vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end;
  if (VideoCap1.DriverOpen) then
  begin
    VideoCap1.VideoPreview:=CheckPrev.Checked;
    if (abril=1) then
      Edtfoto.Text := frm_principal.x_path_fotos_clientes+'\'+frm_Consulta1.edtCpf.Text+'.jpg'
    else
    if (abril=2) then
      Edtfoto.Text := frm_principal.x_path_fotos_clientes+'\'+frm_edtCliente.edtCpf.Text+'.jpg'
  end;
end;

procedure TMain.BotaoSair1Click(Sender: TObject);
begin
  Close;
end;

end.
