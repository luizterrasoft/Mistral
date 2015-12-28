unit UIdentificaCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, BotaoSair, Buttons, Menus, StrUtils, Mask;

type
  Tfrm_IdentificaCliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCliente: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    btnConfirmar: TBitBtn;
    BotaoSair1: TBotaoSair;
    Label6: TLabel;
    edtBairro: TEdit;
    Label8: TLabel;
    edtUF: TEdit;
    Label4: TLabel;
    edtInsc: TEdit;
    Label5: TLabel;
    edtCEP: TEdit;
    Label7: TLabel;
    edtCidade: TEdit;
    Principal1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Confirmardados1: TMenuItem;
    N1: TMenuItem;
    SAIR1: TMenuItem;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Confirma1: TMenuItem;
    edtCPFCNPJ: TMaskEdit;
    lbl1: TLabel;
    cbbTipoLogradouro: TComboBox;
    edtNumero: TEdit;
    lbl2: TLabel;
    edtComplemento: TEdit;
    lbl3: TLabel;
    edtPais: TEdit;
    lbl4: TLabel;
    lblCodCidadeIBGE: TLabel;
    lblCodUFIBGE: TLabel;
    lblCodPais: TLabel;
    edtEMAIL: TEdit;
    Label9: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    procedure cmdCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure BotaoSair1Click(Sender: TObject);
    procedure edtInscKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtBairroKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtUFKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtCEPKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtCPFCNPJExit(Sender: TObject);
    procedure edtCPFCNPJKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure Confirma2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure Confirma1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure edtCPFCNPJEnter(Sender: TObject);
    procedure cbbTipoLogradouroKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtComplementoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCidadeEnter(Sender: TObject);
    procedure edtPaisKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtPaisEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtEMAILKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure edtCPFCNPJKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreencheComboTipoLogradouro;
    procedure PreparaGuiaDadosCadastraisParaPessoaJuridica;
  end;

var
  frm_IdentificaCliente: Tfrm_IdentificaCliente;

implementation

uses principal, un_FechamentoVenda, funcoes1, funcoes2, procura, auxiliar,
     f8Clientes, f8Cidade, f8Pais, unDialogo;


{$R *.DFM}

Function SoNumero(Campo : String) : String;
 Var
   A:Integer;
begin
  Result := '';
  If Campo <> '' then
     For A:= 0 To Length(Campo) do
          begin
            If Campo[A] in ['0'..'9'] then
               begin
                 Result:= Result + Campo[A];
               end
          end
end;

procedure Tfrm_IdentificaCliente.cmdCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IdentificaCliente.FormActivate(Sender: TObject);
begin
  edtCliente.Text             := '';
  edtCPFCNPJ.Text             := '';
  edtInsc.Text                := '';
  cbbTipoLogradouro.ItemIndex := -1;
  edtEndereco.Text            := '';
  edtBairro.Text              := '';
  edtUF.Text                  := '';
  edtCEP.Text                 := '';
  edtCidade.Text              := '';
  edtCPFCNPJ.SetFocus;
end;

procedure Tfrm_IdentificaCliente.btnConfirmarClick(Sender: TObject);
var
  Num : Integer;
begin
 if (frm_principal.x_habilita_integracao_nfe) then
 begin
  if (Trim(edtCPFCNPJ.Text) = '') then
  begin
    if (frmDialogo.ExibirMensagem ('Este cliente não será cadastrado, pois não há CPF/CNPJ válido. Deseja continuar?'
                                  ,'Identifica Cliente',[mbYes,mbNo]
                                  ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrNo) then
    begin
      edtCPFCNPJ.SetFocus;
      Exit;
    end;
  end;

 //logica antiga
{  if (Length(sonumero(edtCPFCNPJ.Text)) > 11) then
     begin
          if (Trim(edtInsc.Text)='') then
          begin
              if (frmDialogo.ExibirMensagem ('Insrição Estadual em branca. Deseja gravar como isento?'
                                            ,'Identifica Cliente',[mbYes,mbNo]
                                            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              begin
                  edtInsc.Text := 'Isento';
              end
              else
              begin
                 edtInsc.SetFocus;
                 abort;
              end;
          end;
     end
     else
     begin
        if (frmDialogo.ExibirMensagem ('Identidade em branca. Deseja gravar assim mesmo?'
                                      ,'Identifica Cliente',[mbYes,mbNo]
                                      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
            edtInsc.Text := '';
        end
        else
        begin
           edtInsc.SetFocus;
           abort;
        end;
    end; }

  if (Length(sonumero(edtCPFCNPJ.Text)) > 11) then
     begin
          if (Trim(edtInsc.Text)='') then
          begin
              if (frmDialogo.ExibirMensagem ('Insrição Estadual em branca. Deseja gravar como isento?'
                                            ,'Identifica Cliente',[mbYes,mbNo]
                                            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              begin
                  edtInsc.Text := 'Isento';
              end
              else
              begin
                 edtInsc.SetFocus;
                 abort;
              end;
          end;
     end
     else
     begin
          if (Trim(edtInsc.Text)='') then
          begin
              if (frmDialogo.ExibirMensagem ('Identidade em branca. Deseja gravar assim mesmo?'
                                            ,'Identifica Cliente',[mbYes,mbNo]
                                            ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
              begin
                  edtInsc.Text := '';
              end
              else
              begin
                 edtInsc.SetFocus;
                 abort;
              end;
          end;
    end;


  if (Trim(edtNome.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o nome do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.SetFocus;
    Exit;
  end

  else if (Trim(edtCEP.Text)='') then
  begin
    frmDialogo.ExibirMensagem('É necessário inserir o CEP do cliente!',
                              'Salvar Cliente',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCEP.SetFocus;
    Exit;
  end;

  if (StrToInt(lblCodCidadeIBGE.Caption) = 0) or (StrTOInt(lblCodUFIBGE.Caption) = 0) then
  begin
    frmDialogo.ExibirMensagem ('É necessário atualizar a cidade deste cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCidade.SetFocus;
    Exit;
  end

  else if (cbbTipoLogradouro.ItemIndex = -1) then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o tipo de logradouro do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    cbbTipoLogradouro.SetFocus;
    Exit;
  end

  else if (Trim(edtEndereco.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o endereço do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtEndereco.SetFocus;
    Exit;
  end

  else if (Trim(edtNumero.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o número do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumero.SetFocus;
    Exit;
  end
   {
  else if (Trim(edtComplemento.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o complemento do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtComplemento.SetFocus;
    Exit;
  end
  }

  else if (Trim(edtBairro.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o bairro do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtBairro.SetFocus;
    Exit;
  end
   {
  else if (Trim(edtEMAIL.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o email do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtEMAIL.SetFocus;
    Exit;
  end
  }

  else if (Trim(edtCidade.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o cidade do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCidade.SetFocus;
    Exit;
  end;

 end
 else if (Trim(edtCPFCNPJ.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir CPFCNPJ do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCPFCNPJ.SetFocus;
    Exit;
  end;
       {
  else if (Trim(edtNome.Text)='') then
  begin
    frmDialogo.ExibirMensagem ('É necessário inserir o nome do cliente!',
                               'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNome.SetFocus;
    Exit;
  end;
      }
 try

 finally
  begin
     Num := StrToInt(edtNumero.Text);
     if (Trim(edtCliente.Text) <> '') then
      frm_FechamentoVenda.y_codigoCliente := StrToFloat(edtCliente.Text)
    else
      frm_FechamentoVenda.y_codigoCliente := 0;
    frm_FechamentoVenda.y_cgc             := edtCPFCNPJ.Text;
    frm_FechamentoVenda.y_nome            := edtNome.Text;
    frm_FechamentoVenda.y_tipo_logradouro := cbbTipoLogradouro.Text;
    frm_FechamentoVenda.y_endereco        := edtEndereco.Text;
    frm_FechamentoVenda.y_numero          := Num;
    frm_FechamentoVenda.y_complemento     := edtComplemento.Text;
    frm_FechamentoVenda.y_insc            := edtInsc.Text;
    frm_FechamentoVenda.y_bairro          := edtBairro.Text;
    frm_FechamentoVenda.y_cep             := edtCEP.Text;
    frm_FechamentoVenda.y_cidade          := edtCidade.Text;
    frm_FechamentoVenda.y_uf              := edtUF.Text;
    frm_FechamentoVenda.y_cod_cidadeIBGE  := StrToInt(lblCodCidadeIBGE.Caption);
    frm_FechamentoVenda.y_cod_ufIBGE      := StrToInt(lblCodUFIBGE.Caption);
    frm_FechamentoVenda.y_pais            := Trim(edtPais.Text);
    frm_FechamentoVenda.y_cod_pais        := Trim(lblCodPais.Caption);
    frm_FechamentoVenda.y_email           := Trim(edtEMAIL.Text);
    Close;
  end;
 end;
end;

procedure Tfrm_IdentificaCliente.BotaoSair1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IdentificaCliente.edtInscKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtNome.SetFocus;
  if (key = K_CIMA) then
    edtCPFCNPJ.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtCEP.SetFocus;
  if (key = K_CIMA) then
    edtInsc.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtEnderecoKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtNumero.SetFocus;
  if (key = K_CIMA) then
    cbbTipoLogradouro.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtBairroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtEMAIL.SetFocus;
  if (key = K_CIMA) then
    edtComplemento.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtUFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtPais.SetFocus;
  if (key = K_CIMA) then
    edtCidade.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtCidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    //edtUF.SetFocus;
    edtPais.SetFocus;
  if (key = K_CIMA) then
    edtEMAIL.SetFocus;
  if (key = K_F8) then
  begin
    Application.CreateForm(TFrmF8Cidade,FrmF8Cidade);
    with (Frmf8Cidade) do
    begin
      edit            := edtCidade;
      labelCidadeIBGE := lblCodCidadeIBGE;
      editUF          := edtUF;
      labelUFIBGE     := lblCodUFIBGE;
      ShowModal;
      Free;
      if (UpperCase(edtCidade.Text) = 'EXTERIOR') then
      begin
        edtCEP.Clear;
        edtEndereco.Clear;
        edtNumero.Clear;
        edtComplemento.Clear;
        edtBairro.Clear;
        edtUF.Clear;
        //***************************************
        edtCEP.Enabled              := false;
        cbbTipoLogradouro.Enabled   := false;
        cbbTipoLogradouro.ItemIndex := -1;
        edtEndereco.Enabled         := false;
        edtNumero.Enabled           := false;
        edtComplemento.Enabled      := false;
        edtBairro.Enabled           := false;
        edtUF.Enabled               := false;
        //***************************************
        edtCEP.Color                := clBtnFace;
        cbbTipoLogradouro.Color     := clBtnFace;
        edtEndereco.Color           := clBtnFace;
        edtNumero.Color             := clBtnFace;
        edtComplemento.Color        := clBtnFace;
        edtBairro.Color             := clBtnFace;
        edtUF.Color                 := clBtnFace;
        //***************************************
        lblCodUFIBGE.Caption        := '0';
        edtPais.Text                := '';
        lblCodPais.Caption          := '00';
      end
      else
      begin
        edtCEP.Enabled              := true;
        cbbTipoLogradouro.Enabled   := true;
        edtEndereco.Enabled         := true;
        edtNumero.Enabled           := true;
        edtComplemento.Enabled      := true;
        edtBairro.Enabled           := true;
        edtUF.Enabled               := true;
        //***************************************
        edtCEP.Color                := clWhite;
        cbbTipoLogradouro.Color     := clWhite;
        edtEndereco.Color           := clWhite;
        edtNumero.Color             := clWhite;
        edtComplemento.Color        := clWhite;
        edtBairro.Color             := clWhite;
        edtUF.Color                 := clWhite;
        //***************************************
        edtPais.Text                := 'BRASIL';
        lblCodPais.Caption          := '01058';
        if (Trim(edtCEP.Text) = '') then
          edtCEP.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_IdentificaCliente.edtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    cbbTipoLogradouro.SetFocus;
  if (key = K_CIMA) then
    edtNome.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtCPFCNPJExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  cnpj: String;
begin
  if (CriticaCNPJ(edtCPFCNPJ)) then
  begin
    cnpj  := Trim(edtCPFCNPJ.Text);

    {if (Length(cnpj)<=11) then
    begin
      PreparaGuiaDadosCadastraisParaPessoaJuridica;
      edtNome.SetFocus;
    end;}
    clAux := TClassAuxiliar.Create;
    clAux.Conect(databasecredito,Self);
    clAux.ClearSql;
    if (cnpj <> '') then
    begin
      clAux.AddParam ('SELECT CL_CODI,CL_NOME,CL_IDEN,CL_ENDE,CL_BAIR,         ');
      clAux.AddParam ('       CL_ESTA,CL_CIDA,CL_CEP,CL_CPF,CL_EMAI,          ');
      clAux.AddParam ('       CL_TIPO_LOGRADOURO,CL_NUMERO,CL_COMPLEMENTO,     ');
      clAux.AddParam ('       CL_IBGE_CIDADE,CL_IBGE_UF,CL_PAIS,CL_CODIGO_PAIS ');
      clAux.AddParam ('FROM   CRECLI                                           ');
      clAux.AddParam ('WHERE (CL_CPF='+QuotedStr(cnpj)+')                      ');
      clAux.consulta.Open;
      if (not clAux.consulta.IsEmpty) then
      begin
        edtCliente.Text             := clAux.Result('CL_CODI');
        edtNome.Text                := clAux.Result('CL_NOME');
        edtCPFCNPJ.Text             := clAux.Result('CL_CPF');
        edtInsc.Text                := clAux.Result('CL_IDEN');
        cbbTipoLogradouro.ItemIndex := cbbTipoLogradouro.Items.IndexOf(clAux.Result('CL_TIPO_LOGRADOURO'));
        edtEndereco.Text            := clAux.Result('CL_ENDE');
        edtNumero.Text              := IntToStr(clAux.Result('CL_NUMERO'));
        edtComplemento.Text         := clAux.Result('CL_COMPLEMENTO');
        edtBairro.Text              := clAux.Result('CL_BAIR');
        edtUF.Text                  := clAux.Result('CL_ESTA');
        edtCidade.Text              := clAux.Result('CL_CIDA');
        lblCodCidadeIBGE.Caption    := IntToStr(clAux.Result('CL_IBGE_CIDADE'));
        lblCodUFIBGE.Caption        := IntToStr(clAux.Result('CL_IBGE_UF'));
        edtUF.Text                  := clAux.Result('CL_ESTA');
        edtPais.Text                := clAux.Result('CL_PAIS');
        edtEMAIL.Text               := clAux.Result('CL_EMAI');
        lblCodPais.Caption          := clAux.Result('CL_CODIGO_PAIS');
        if (Trim(ClAux.Result('CL_CEP')) <> '') then
          edtCEP.Text := Copy(ClAux.Result('CL_CEP'),1,5)+'-'+Copy(ClAux.Result('CL_CEP'),6,3);
        frm_FechamentoVenda.y_clienteCadastrado := true;
      end
      else
      begin
        if (frm_principal.x_online) then
        begin
          clAux.ClearSql;
          clAux.AddParam('SELECT MAX(CL_CODI) as ULT_CODIGO FROM CRECLI');
          clAux.consulta.Open;
          edtCliente.Text := clAux.Result('ULT_CODIGO') + 1;
        end
        else
        begin
          clAux.ClearSql;
          clAux.AddParam('SELECT CODIGO FROM GEN_CRECLI');
          clAux.consulta.Open;
          edtCliente.Text := clAux.Result('CODIGO') + 1;
        end;
        frm_FechamentoVenda.y_clienteCadastrado := false;


        edtInsc.Text     := '';
        edtNome.Text     := '';
        edtEndereco.Text := '';
        edtBairro.Text   := '';
        edtUF.Text       := 'RJ';
        edtCEP.Text      := '';
        edtEMAIL.Text    := '';
        edtCidade.Text   := 'Rio de Janeiro';
        lblCodCidadeIBGE.Caption := '3304557';
        lblCodUFIBGE.Caption     := '33';
        lblCodPais.Caption       := '01058';
        edtPais.Text     := 'Brasil';
      end;

      if (Length(cnpj) = 11) then
      begin
        cnpj := ExibeCpf(cnpj);
        edtCPFCNPJ.Text := cnpj;
        Label4.Caption  := 'Identidade';
      //  PreparaGuiaDadosCadastraisParaPessoaJuridica;
      //  edtNome.SetFocus;
        edtInsc.SetFocus;
      end
      else
      begin
        cnpj := ExibeCgc(cnpj);
        edtCPFCNPJ.Text := cnpj;
        Label4.Caption  := 'Insc. Estadual';
      end;
    end;
  end;
end;

procedure Tfrm_IdentificaCliente.edtCPFCNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  codigo: String;
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtInsc.SetFocus;
  if (key=K_F8) then
  begin
    codigo := Trim(edtCliente.Text);
    edtCliente.Text := '';
    with (frm_f8Clientes) do
    begin
      edit := edtCliente;
      btnCadastro.visible := false;
      ShowModal;
      btnCadastro.visible := true;
      edtCPFCNPJ.Text     := '';
    end;

    if (Trim(edtCliente.Text) = '') then
      edtCliente.Text := codigo;

    edtCliente.SetFocus;
    edtCPFCNPJ.SetFocus;
  end;
end;

procedure Tfrm_IdentificaCliente.edtClienteExit(Sender: TObject);
var
  ClAux: TClassAuxiliar;
  codigo,cnpj: String;
begin
  {exibindo dados do cliente}
  clAux := TClassAuxiliar.Create;
  clAux.Conect(databasecredito,Self);
  clAux.ClearSql;

  codigo := Trim(edtCliente.Text);
  if (codigo <> '') then
  begin
    clAux.AddParam ('SELECT CL_CODI,CL_NOME,CL_IDEN,CL_ENDE,CL_BAIR,         ');
    clAux.AddParam ('       CL_ESTA,CL_CIDA,CL_CEP,CL_CPF,CL_EMAI,          ');
    clAux.AddParam ('       CL_TIPO_LOGRADOURO,CL_NUMERO,CL_COMPLEMENTO,     ');
    clAux.AddParam ('       CL_IBGE_CIDADE,CL_IBGE_UF,CL_PAIS,CL_CODIGO_PAIS ');
    clAux.AddParam ('FROM   CRECLI                                           ');
    clAux.AddParam ('WHERE (CL_CODI='+codigo+')                              ');
    clAux.consulta.Open;
    if (not clAux.consulta.IsEmpty) then
    begin
      edtNome.Text                := clAux.Result('CL_NOME');
      edtCPFCNPJ.Text             := clAux.Result('CL_CPF');
      edtInsc.Text                := clAux.Result('CL_IDEN');
      cbbTipoLogradouro.ItemIndex := cbbTipoLogradouro.Items.IndexOf(clAux.Result('CL_TIPO_LOGRADOURO'));
      edtEndereco.Text            := clAux.Result('CL_ENDE');
      edtNumero.Text              := IntToStr(clAux.Result('CL_NUMERO'));
      edtComplemento.Text         := clAux.Result('CL_COMPLEMENTO');
      edtBairro.Text              := clAux.Result('CL_BAIR');
      edtUF.Text                  := clAux.Result('CL_ESTA');
      edtCidade.Text              := clAux.Result('CL_CIDA');
      lblCodCidadeIBGE.Caption    := IntToStr(clAux.Result('CL_IBGE_CIDADE'));
      lblCodUFIBGE.Caption        := IntToStr(clAux.Result('CL_IBGE_UF'));
      edtEMAIL.Text               := ClAux.Result('CL_EMAI');
      edtPais.Text                := clAux.Result('CL_PAIS');
      lblCodPais.Caption          := clAux.Result('CL_CODIGO_PAIS');
      if (Trim(ClAux.Result('CL_CEP')) <> '') then
        edtCEP.Text := Copy(ClAux.Result('CL_CEP'),1,5)+'-'+Copy(ClAux.Result('CL_CEP'),6,3);
      frm_FechamentoVenda.y_clienteCadastrado := true;
    end;
  end;  
  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_IdentificaCliente.Confirma2Click(Sender: TObject);
begin
  btnConfirmar.Click;
end;

procedure Tfrm_IdentificaCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key=VK_F5) then
    btnConfirmar.Click;
  if (key=K_ESC) then
    Close;
end;

procedure Tfrm_IdentificaCliente.Confirma1Click(Sender: TObject);
begin
  btnConfirmar.Click;
end;

procedure Tfrm_IdentificaCliente.Sair2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_IdentificaCliente.edtCPFCNPJEnter(Sender: TObject);
begin
  if (Trim(edtCPFCNPJ.Text) <> '') then
    edtCPFCNPJ.Text := AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(AnsiReplaceStr(edtCPFCNPJ.Text,'-',''),'.',''),'/',''),' ','');
  edtCPFCNPJ.SelectAll;
end;

procedure Tfrm_IdentificaCliente.cbbTipoLogradouroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtEndereco.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtComplementoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) then
    edtBairro.SetFocus;
  if (key = K_CIMA) then
    edtNumero.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtCidadeEnter(Sender: TObject);
begin
  if (Trim(edtCidade.Text) = '') then
  begin
    Application.CreateForm(TFrmF8Cidade,FrmF8Cidade);
    with (Frmf8Cidade) do
    begin
      edit            := edtCidade;
      labelCidadeIBGE := lblCodCidadeIBGE;
      editUF          := edtUF;
      labelUFIBGE     := lblCodUFIBGE;
      ShowModal;
      Free;
      if (UpperCase(edtCidade.Text) = 'EXTERIOR') then
      begin
        edtCEP.Clear;
        edtEndereco.Clear;
        edtNumero.Clear;
        edtComplemento.Clear;
        edtBairro.Clear;
        edtUF.Clear;
        //***************************************
        edtCEP.Enabled              := false;
        cbbTipoLogradouro.Enabled   := false;
        cbbTipoLogradouro.ItemIndex := -1;
        edtEndereco.Enabled         := false;
        edtNumero.Enabled           := false;
        edtComplemento.Enabled      := false;
        edtBairro.Enabled           := false;
        edtUF.Enabled               := false;
        //***************************************
        edtCEP.Color                := clBtnFace;
        cbbTipoLogradouro.Color     := clBtnFace;
        edtEndereco.Color           := clBtnFace;
        edtNumero.Color             := clBtnFace;
        edtComplemento.Color        := clBtnFace;
        edtBairro.Color             := clBtnFace;
        edtUF.Color                 := clBtnFace;
        //***************************************
        lblCodUFIBGE.Caption        := '0';
        edtPais.Text                := '';
        lblCodPais.Caption          := '00';
      end
      else
      begin
        edtCEP.Enabled              := true;
        cbbTipoLogradouro.Enabled   := true;
        edtEndereco.Enabled         := true;
        edtNumero.Enabled           := true;
        edtComplemento.Enabled      := true;
        edtBairro.Enabled           := true;
        edtUF.Enabled               := true;
        //***************************************
        edtCEP.Color                := clWhite;
        cbbTipoLogradouro.Color     := clWhite;
        edtEndereco.Color           := clWhite;
        edtNumero.Color             := clWhite;
        edtComplemento.Color        := clWhite;
        edtBairro.Color             := clWhite;
        edtUF.Color                 := clWhite;
        //***************************************
        edtPais.Text                := 'BRASIL';
        lblCodPais.Caption          := '01058';
        if (Trim(edtCEP.Text) = '') then
          edtCEP.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_IdentificaCliente.edtPaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    btnConfirmar.Click;
  if (key = K_CIMA) then
    edtCidade.SetFocus;
  if (key = K_F8) then
  begin
    Application.CreateForm(TFrmF8Pais,FrmF8Pais);
    with (Frmf8Pais) do
    begin
      edit         := edtPais;
      labelCodPais := lblCodPais;
      ShowModal;
      Free;
      btnConfirmar.SetFocus;
    end;
  end;
end;

procedure Tfrm_IdentificaCliente.edtPaisEnter(Sender: TObject);
begin
  if (Trim(edtPais.Text) = '') then
  begin
    Application.CreateForm(TFrmF8Pais,FrmF8Pais);
    with (Frmf8Pais) do
    begin
      edit         := edtPais;
      labelCodPais := lblCodPais;
      ShowModal;
      Free;
      btnConfirmar.SetFocus;
    end;
  end;
end;

procedure Tfrm_IdentificaCliente.FormCreate(Sender: TObject);
begin
  PreencheComboTipoLogradouro;
end;

procedure Tfrm_IdentificaCliente.PreencheComboTipoLogradouro;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam('SELECT * FROM TIPOS_LOGRADOURO');
  clAux.AddParam('ORDER BY TIPO_LOGRADOURO      ');
  clAux.consulta.Open;
  if (not clAux.consulta.IsEmpty) then
  begin
    while (not clAux.Eof) do
    begin
      cbbTipoLogradouro.Items.Add(clAux.Result('TIPO_LOGRADOURO'));
      clAux.Next;
    end;
  end;
  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_IdentificaCliente.edtNumeroExit(Sender: TObject);
begin
  {
  if (Trim(edtNumero.Text) = '') then
    edtNumero.Text := '0';
    }
end;

procedure Tfrm_IdentificaCliente.edtNumeroKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtComplemento.SetFocus;
  if (key = K_CIMA) then
    edtEndereco.SetFocus;
end;

procedure Tfrm_IdentificaCliente.edtNomeKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key in[chr(39)]) then
    Key:= #0;
end;

procedure Tfrm_IdentificaCliente.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;
end;

procedure Tfrm_IdentificaCliente.edtEMAILKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtCidade.SetFocus;
  if (key = K_CIMA) then
    edtEMAIL.SetFocus;
end;

procedure Tfrm_IdentificaCliente.PreparaGuiaDadosCadastraisParaPessoaJuridica;
begin
  edtInsc.color := clBtnFace;
  edtInsc.text  := '';
  edtInsc.readonly := true;
end;

procedure Tfrm_IdentificaCliente.edtCPFCNPJKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;
end;

end.
