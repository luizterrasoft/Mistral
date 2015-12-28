unit unSenha_Atdo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DB, DBTables, Buttons, PanelOO, MaskEditOO;

type
  TfrmSenha_Atdo = class(TForm)
    Label1: TLabel;
    edtSenha: TMaskEdit;
    lblDiaSemana: TLabel;
    btnOk: TPanel;
    btnCancel: TPanel;
    Label3: TLabel;
    edtVend: TMaskEditOO;
    pnVend: TPanelOO;
    Image2: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image3: TImage;
    Bevel4: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtVendEnter(Sender: TObject);
    procedure edtVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtVendExit(Sender: TObject);
    procedure edtVendDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flagEntra: Boolean;
    tentativas: Integer;
  end;

var
  frmSenha_Atdo: TfrmSenha_Atdo;

implementation

uses principal, DM3, DM2, funcoes1, procura, unDialogo, auxiliar, un_senhaSupervisor, funcoes2,
  unSenha, un_LancaAtendimento;

{$R *.DFM}

procedure TfrmSenha_Atdo.FormActivate(Sender: TObject);
var
  hR : THandle;
begin     
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

     {...}
  flagEntra:=false;
  edtVend.setfocus;
end;

procedure TfrmSenha_Atdo.edtSenhaEnter(Sender: TObject);
begin
  edtSenha.selectall;
end;

{Botao de pesquisa pelo usuario ***}
procedure TfrmSenha_Atdo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    btnCancelClick(Sender);
end;

procedure TfrmSenha_Atdo.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnOkClick(Sender);
  if (key=K_CIMA) then
    edtVend.setfocus;
end;

procedure TfrmSenha_Atdo.btnOkClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
  dataMaior,data: TDateTime;
  continua: Boolean;
begin
  if (trim(edtSenha.text)<>'') then
  begin
    continua:=true;
    if (continua) then
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect(databaseprodutos,self);
      clAux.ClearSql;
      with (clAux.consulta) do
      begin
        sql.clear;
        sql.add ('Select VD_CODI,VD_NOME,VD_SENH   ');
        sql.add ('From   VENDEDORES                ');
        sql.add ('Where (VD_CODI=:codigo) AND      ');
        sql.add ('      (VD_CARG=:cargo) AND       ');
        sql.add ('      (VD_LOJA=:loja)            ');
        parambyname('codigo').AsFloat := edtVend.GetValor;
        parambyname('loja').AsFloat   := frm_principal.x_loja;
        parambyname('cargo').AsString := 'VENDEDOR COMUM';
        open;
        if (recordcount=0) then
        begin
                        {palavra-chave de acesso - Modo demo do sistema ***}
          if (LowerCase(Trim(edtSenha.text))='abcd') then
          begin
            frm_principal.x_vendedor      := -1;
            flagEntra:=true;
            frmSenha_Atdo.close;
          end
          else
          begin
                             {Apos tres tentativas, o sistema fecha ***}
            if (tentativas<3) then
            begin
              edtSenha.text:='';
              edtSenha.setfocus;
              flagEntra:=false;
              tentativas:=tentativas+1;
            end
            else
              btnCancelClick(Sender);
          end;
        end
        else
        if (trim(edtSenha.text)<>fieldbyname('VD_SENH').AsString) then
        begin
                             {Apos tres tentativas, o sistema fecha ***}
          if (tentativas<3) then
          begin
            edtSenha.text:='';
            edtSenha.setfocus;
            flagEntra:=false;
            tentativas:=tentativas+1;
          end
          else
            btnCancelClick(Sender); 
        end
        else
        begin
                            {Configurando o usuario do sistema ***}
          frm_principal.x_vendedor := edtVend.GetValor;
          flagEntra:=true;
          frmSenha_Atdo.close;
        end;
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
end;

procedure TfrmSenha_Atdo.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSenha_Atdo.edtVendEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure TfrmSenha_Atdo.edtVendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend);   
  if (key=K_ENTER) or (key=K_BAIXO) then
  begin
    if (edtVend.GetValor<>0) then
    begin
      pnVend.caption:=ProcuraNomeVend(frm_principal.x_loja,edtVend.GetValor,self,true);
      edtVend.text:=form_nz(edtVend.GetValor,6);
    end
    else
      pnVend.caption:='';
    edtSenha.setfocus;
  end;
  if (key=K_CIMA) then
  ;
end;

procedure TfrmSenha_Atdo.edtVendExit(Sender: TObject);
begin
  if (edtVend.GetValor<>0) then
  begin
    pnVend.caption:=ProcuraNomeVend(frm_principal.x_loja,edtVend.GetValor,self,true);
    if pnvend.caption = '<Vendedor não cadastrado>' then
    begin
      frmDialogo.ExibirMensagem ('Vendedor não cadastrado ou sem status para vendedor! '
        ,'Atendimentos',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtvend.setfocus; 
    end;
    edtVend.text:=form_nz(edtVend.GetValor,6);
  end
  else
    pnVend.caption:='';
end;

procedure TfrmSenha_Atdo.edtVendDblClick(Sender: TObject);
begin
  ChamandoF8Vend(frm_principal.x_loja,edtVend);
end;

procedure TfrmSenha_Atdo.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;  
end;

end.
