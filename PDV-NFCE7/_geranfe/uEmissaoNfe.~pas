unit uEmissaoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TfrmEmissaoNfe = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    Ca1: TMenuItem;
    Incluir1: TMenuItem;
    grboxInfVend: TGroupBox;
    pnVendas: TPanel;
    lblnvenda: TLabel;
    lblCliente: TLabel;
    ldlDtEmissao: TLabel;
    lblDtSaida: TLabel;
    lblCodigo: TLabel;
    lblPedCompra: TLabel;
    lblCidade: TLabel;
    lblCnpjCpf: TLabel;
    lblSerinalNFe: TLabel;
    lblNnoFiscal: TLabel;
    edtNotFiscal: TEdit;
    edtSerialNFe: TEdit;
    edtCliente: TEdit;
    edtCnpjCpf: TEdit;
    edtCidade: TEdit;
    edtEmisao: TEdit;
    edtSaida: TEdit;
    edtPedCompra: TEdit;
    edtCodigo: TEdit;
    edtNvenda: TEdit;
    gruImpTotal: TGroupBox;
    Label3: TLabel;
    lblSeguro: TLabel;
    lblVlIcms: TLabel;
    lblVlFrete: TLabel;
    lblIcms: TLabel;
    lblOutros: TLabel;
    lblIcmsSub: TLabel;
    lblTotNota: TLabel;
    lblVlIcmsSub: TLabel;
    lblVlIpi: TLabel;
    lblTotProd: TLabel;
    lbllVlrDesc: TLabel;
    edtBcIcms: TEdit;
    edtTotProd: TEdit;
    edtVlDesc: TEdit;
    edtVlIcms: TEdit;
    edtVlFrete: TEdit;
    edtBIcmsSub: TEdit;
    edtSeguro: TEdit;
    edtVIcmsSub: TEdit;
    edtOutros: TEdit;
    edtTotNota: TEdit;
    edtVlIpi: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    gruTipeTribNota: TGroupBox;
    lblNfSaida: TLabel;
    lblNfEntrada: TLabel;
    lblCfop: TLabel;
    lblCsosn: TLabel;
    lblSitIpi: TLabel;
    lblSitPis: TLabel;
    lblSitCofins: TLabel;
    edtCfop: TEdit;
    edtCsosn: TEdit;
    edtSitIpi: TEdit;
    edtSitPis: TEdit;
    edtSitCofins: TEdit;
    Panel1: TPanel;
    btnNovo: TButton;
    btnServico: TBitBtn;
    btnExcluir: TBitBtn;
    StatusBar1: TStatusBar;
    lblDescCfop: TLabel;
    rdgTpNota: TRadioGroup;
    lblDescCsosn: TLabel;
    lblDescSitIpi: TLabel;
    lblDescSitPis: TLabel;
    lblDescSitCofins: TLabel;
    gbxEnvioeAutoNfe: TGroupBox;
    lblXmlNfe: TLabel;
    lblPtrotocolo: TLabel;
    lblDataHora: TLabel;
    lblNsalvar: TLabel;
    lblNenviar: TLabel;
    lblNimpDanfe: TLabel;
    lblNeniaNfeCliente: TLabel;
    gbxExportacao: TGroupBox;
    lblUfEmbarque: TLabel;
    lblLocEmbarque: TLabel;
    edtUfEmbarque: TEdit;
    edtLocEmbarque: TEdit;
    edtXmlNfe: TEdit;
    edtProtocolo: TEdit;
    edtDataHora: TEdit;
    btnEnvioNfeCliente: TButton;
    GroupBox2: TGroupBox;
    EdtInfoAdicionais: TEdit;
    GroupBox1: TGroupBox;
    lblTransportadora: TLabel;
    lblMarca: TLabel;
    lblEspecie: TLabel;
    lblQtdeVolume: TLabel;
    lblPbruto: TLabel;
    lblPliquido: TLabel;
    lblPlaca: TLabel;
    sbtnTranspo: TSpeedButton;
    edtTransportadora: TEdit;
    editMarca: TEdit;
    edtEspecie: TEdit;
    estQtdVolume: TEdit;
    edtPbruto: TEdit;
    edtPliquido: TEdit;
    edtPlaca: TEdit;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    imgSalvar: TImage;
    ImgEnviarCliente: TImage;
    imgImprimir: TImage;
    imgEnviar: TImage;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure edtNvendaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNotFiscalEnter(Sender: TObject);
    procedure btnServicoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtNvendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNvendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    codigo,Nvenda, TotNota, Tipreg, Linha : string;
    nreg,i,ind1, ind2 : integer;

//*****>>>
  // Variaveis para a Geração do Arquivo Ini
  sLogoMarca,sPathArq : String;
  sSalvaArq : boolean;
  sCertificado,sSenha,sSerial : String;
  sRazao,sFantasia,sCNPJ,sIE,sEndereco,sNum,sBairro,sCidade,sCEP,sUF,sCodMun : String;
  sAmbiente,sFormas : integer;
  sUFWS,sHost,sPorta,sUsuario,sSenhaWS : String;
  //

// <<***********
    // Variaveis para a Leitura do arquivo de Integração
    {10} X_NOME, X_CPF, X_RG, X_TIPOLOG, X_LOGRADOURO, X_NUMERO, X_COMPLEMENTO, X_BAIRRO, X_CODCIDADE,X_CEP, X_UF,X_CODPAIS, X_TELEFONE, X_EMAIL, X_CAMPO_X1, X_CAMPO_X2 : STRING;

    {12} X_CODIGO,X_NCM,X_DESCRICAO,X_UNIDADE,X_TIPO,X_MVA,X_PR_COMPRA,X_MARGEM,X_PR_VENDA,X_ALIQ_IPI,X_ORIGEMPROD,X_REF_INTERNA : array[1..10] of string;

    {20} X_NUM_CAIXA, X_NUM_LOJA, X_NUM_VENDA, X_CNPJ_CPF, X_TIPO_NOTA, X_CNPJ_CPF_Transp, X_NOMECLIENTE, X_DT_VENDA, X_FORMA_PGTO, X_INFO_ADICIONAIS : string;
         X_EXTRA1, X_EXTRA2, X_EXTRA3,X_EXTRA4 : string;                    
    {21} X_NUM_VENDA21, X_ITEM, X_COD_PROD, X_VALUNIT, X_QTDE, X_PERC_DESC, XX_EXTRA1, XX_EXTRA2, XX_EXTRA3,XX_EXTRA4 : array [1..10] of String;

    {22} X_NUM_VENDA22, X_NUM_FATURA, X_VALOR_FATURA, X_VENCIMENTO : String;

    procedure LerArqRemessa;
    procedure LerRegistro10;
    procedure LerRegistro12;
    procedure LerRegistro20;
    procedure LerRegistro21;
    procedure LerRegistro22;
  end;

var
  frmEmissaoNfe: TfrmEmissaoNfe;

const
  {teclas de funcao *** - configuracao}
  NULO     = 0;
  K_F1     = 112;
  K_F2     = 113;
  K_F3     = 114;
  K_F4     = 115;
  K_F5     = 116;
  K_F6     = 117;
  K_F7     = 118;
  K_F8     = 119;
  K_F9     = 120;
  K_F10    = 121;
  K_F11    = 122;
  K_F12    = 123;
  K_ENTER  = 13;
  K_ESC    = 27;
  K_ESQ    = 37;
  K_BAIXO  = 40;
  K_CIMA   = 38;
  K_DIR    = 39;
  K_INSERT = 45;
  K_DELETE = 46;
  K_HOME   = 36;
  K_END    = 35;
  K_PGUP   = 33;
  K_PGDOWN = 34;
  K_BACK   = 8;
  VK_F8    = K_BACK  ;

implementation

{$R *.dfm}

procedure TfrmEmissaoNfe.edtNvendaEnter(Sender: TObject);
var
key : integer;
begin
  // Abre Janela com Notas *.rem no Caminho C:\MistralNFE\INTEGRACAO
  if (key=K_F8) then    // F8 - Para Buscar Nota
    // ChamandoF8Forn(edtForn,true);
     Begin
     //  pnBuscaNotas.Visible := true;
     //  LerArqRemessa;
     End;
end;

procedure TfrmEmissaoNfe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Analisa se alguma tecla foi pressionada
end;

procedure TfrmEmissaoNfe.edtNotFiscalEnter(Sender: TObject);
begin
   // F3 - GERA SEQUENCIAL
   // F8 - BUSCAR O NUMERO DA NOTA
end;

procedure TfrmEmissaoNfe.btnServicoClick(Sender: TObject);
begin
 // DmNFe.ACBrNFe1.Configuracoes.WebServices.Salvar := true;
 // DmNFe.ACBrNFe1.WebServices.StatusServico.Executar;
 // RetornoWS.Lines.Clear;
 // RetornoWS.Lines.Text := UTF8Encode(DmNFe.ACBrNFe1.WebServices.StatusServico.RetWS);
  //
 //  RetornoWS.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'retornoexe.xml');
 // WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+'retornoexe.xml');
  //
{  Dados.Lines.Clear;
  Dados.Lines.Add('Tipo Ambiente: '+ TpAmbToStr(DmNFe.ACBrNFe1.WebServices.StatusServico.tpAmb));
  Dados.Lines.Add('Versão Aplicativo: '+DmNFe.ACBrNFe1.WebServices.StatusServico.verAplic);
  Dados.Lines.Add('Status: '+IntToStr(DmNFe.ACBrNFe1.WebServices.StatusServico.cStat));
  Dados.Lines.Add('Motivo: '+DmNFe.ACBrNFe1.WebServices.StatusServico.xMotivo);
  Dados.Lines.Add('UF'+IntToStr(DmNFe.ACBrNFe1.WebServices.StatusServico.cUF));
  Dados.Lines.Add('Data Hora Recebimento: '+DateTimeToStr(DmNFe.ACBrNFe1.WebServices.StatusServico.dhRecbto));
  Dados.Lines.Add('Data Hora Reterno: '+DateTimeToStr(DmNFe.ACBrNFe1.WebServices.StatusServico.dhRetorno));
  Dados.Lines.Add('Observação: '+DmNFe.ACBrNFe1.WebServices.StatusServico.xObs);
}
end;

procedure TfrmEmissaoNfe.FormShow(Sender: TObject);
begin
    // DmNFe.AtualizaConfigAcBr;
end;

procedure TfrmEmissaoNfe.LerArqRemessa;
var arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
begin
 ind1 :=0; ind2 :=0;
// try
// [ 1 ] Associa a variável do programa "arq" ao arquivo externo "tabuada.txt"
// na unidade de disco "d"
//AssignFile(arq, 'C:\MistralNFe\INTEGRACAO\REMESSA-NFE\NFE20141010096404230.REM');

  AssignFile(arq, 'C:\MistralNFe\INTEGRACAO\REMESSA-NFE\NFE20141217096404243.REM');

{$I-} // desativa a diretiva de Input
Reset(arq); // [ 3 ] Abre o arquivo texto para leitura
{$I+} // ativa a diretiva de Input

if (IOResult <> 0) then  // verifica o resultado da operação de abertura
   ShowMessage('Erro na abertura do arquivo !!!')
else
    begin // [ 11 ] verifica se o ponteiro de arquivo atingiu a marca de final de arquivo
      readln(arq, linha); // [ 6 ] Lê uma linha do arquivo
      while (not eof(arq) { and (linha<>'')} ) do
      begin
        nreg := nreg + 1;
        tipreg := copy(linha, 1, 2);
        if tipreg = '10' then
           LerRegistro10;

        if tipreg = '12' then
           begin
             ind1 := ind1 + 1;
             LerRegistro12;
           end;
        if tipreg = '20' then
           LerRegistro20;

        if tipreg = '21' then
           begin
             inc(ind2);
             LerRegistro21;
           end;

      readln(arq, linha); // [ 6 ] Lê uma linha do arquivo

      end;

     if tipreg = '21' then
        begin
         inc(ind2);
         LerRegistro21;
     end;

     CloseFile(arq); // [ 8 ] Fecha o arquivo texto aberto
    end;
end;

procedure TfrmEmissaoNfe.LerRegistro10;
begin
{Tipo 10 = Nome, Cpf, Rg, TipoLog, Logradouro, Numero, Complemento, Bairro, CodiCidade, CodigoPais, Cep, ??.Telefone,?? Email }

    i := pos(';', linha); delete(linha, 1, i);

    {01} i := pos(';', linha); X_NOME        := copy(linha, 1, i-1); delete(linha, 1, i); {lbl01.Caption:=X_NOME;        label201.Caption := '01 Nome';        }
    {02} i := pos(';', linha); X_CPF         := copy(linha, 1, i-1); delete(linha, 1, i); {lbl02.Caption:=X_CPF;         label202.Caption := '02 CPF';         }
    {03} i := pos(';', linha); X_RG          := copy(linha, 1, i-1); delete(linha, 1, i); {lbl03.Caption:=X_RG;          label203.Caption := '03 RG';          }
    {04} i := pos(';', linha); X_TIPOLOG     := copy(linha, 1, i-1); delete(linha, 1, i); {lbl04.Caption:=X_TIPOLOG;     label204.Caption := '04 TpLogr';      }
    {05} i := pos(';', linha); X_LOGRADOURO  := copy(linha, 1, i-1); delete(linha, 1, i); {lbl05.Caption:=X_LOGRADOURO;  label205.Caption := '05 Logr';        }
    {06} i := pos(';', linha); X_NUMERO      := copy(linha, 1, i-1); delete(linha, 1, i); {lbl06.Caption:=X_NUMERO;      label206.Caption := '06 Num.';        }
    {07} i := pos(';', linha); X_COMPLEMENTO := copy(linha, 1, i-1); delete(linha, 1, i); {lbl07.Caption:=X_COMPLEMENTO; label207.Caption := '07 Comp';        }
    {08} i := pos(';', linha); X_BAIRRO      := copy(linha, 1, i-1); delete(linha, 1, i); {lbl08.Caption:=X_BAIRRO;      label208.Caption := '08 Bairro';      }
    {09} i := pos(';', linha); X_CODCIDADE   := copy(linha, 1, i-1); delete(linha, 1, i); {lbl09.Caption:=X_CODCIDADE;   label209.Caption := '09 Cod.Cid';     }
    {09a} i := pos(';', linha); X_UF          := copy(linha, 1, i-1); delete(linha, 1, i); //lbl09.Caption:=X_UF;        //  label209.Caption := '09 Cod.Cid'; }
    {11} i := pos(';', linha); X_CEP         := copy(linha, 1, i-1); delete(linha, 1, i); {lbl11.Caption:=X_CEP;         label211.Caption := '11 CEP';         }
    {10} i := pos(';', linha); X_CODPAIS     := copy(linha, 1, i-1); delete(linha, 1, i); {lbl10.Caption:=X_CODPAIS;     label210.Caption := '10 Cod.Pais';    }
//    {12} i := pos(';', linha); X_CAMPO_X1    := copy(linha, 1, i-1); delete(linha, 1, i); {lbl12.Caption:=X_CAMPO_X1;    label212.Caption := '12 X1';        }
    {13} i := pos(';', linha); X_TELEFONE    := copy(linha, 1, i-1); delete(linha, 1, i); {lbl13.Caption:=X_TELEFONE;    label213.Caption := '13 Telefo';      }
    {14} i := pos(';', linha); X_CAMPO_X2    := copy(linha, 1, i-1); delete(linha, 1, i); {lbl14.Caption:=X_CAMPO_X2;    label214.Caption := '14 X2';          }
    {15} i := pos(';', linha); X_EMAIL       := copy(linha, 1, i-1); delete(linha, 1, i);
                                                                     X_EMAIL := 'Xmarialuiza@gmail.com'; {lbl15.Caption:=X_EMAIL; label215.Caption := '15 Email'; }
end;

procedure TfrmEmissaoNfe.LerRegistro12;
begin
  {Tipo 12 = Descricao Item, Unidade Item, qtitem, Codigo Item, Descrcao Item, Cod Barra Item }
    i := pos(';', linha); delete(linha, 1, i);

    {16} i := pos(';', linha); X_CODIGO     [ind1] := copy(linha, 1, i-1); delete(linha, 1, i);  {lbl16.Caption:=X_CODIGO [ind1];   label216.Caption := '16 Codigo'; }
    {17} i := pos(';', linha); X_NCM        [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl17.Caption:=X_NCM[ind1];        label217.Caption := '17 NCM';    }
    {18} i := pos(';', linha); X_DESCRICAO  [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl18.Caption:=X_DESCRICAO[ind1];  label218.Caption := '18 Descr';  }
    {19} i := pos(';', linha); X_UNIDADE    [ind1] := copy(linha, 1, i-1); delete(linha, 1, i);  {lbl19.Caption:=X_UNIDADE[ind1];   label219.Caption := '19 Unid';   }
    {20} i := pos(';', linha); X_TIPO       [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl20.Caption:=X_TIPO[ind1];       label220.Caption := '20 Tipo';   }
    {21} i := pos(';', linha); X_MVA        [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl21.Caption:=X_MVA[ind1];        label221.Caption := '21 MVA';     }
    {22} i := pos(';', linha); X_PR_COMPRA  [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl22.Caption:=X_PR_COMPRA[ind1];  label222.Caption := '22 PR Compra'; }
    {23} i := pos(';', linha); X_MARGEM     [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl23.Caption:=X_MARGEM[ind1];     label223.Caption := '23 Margem';    }
    {24} i := pos(';', linha); X_PR_VENDA   [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl24.Caption:=X_PR_VENDA[ind1];   label224.Caption := '24 PR Venda';  }
    {25} i := pos(';', linha); X_ALIQ_IPI   [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl25.Caption:=X_ALIQ_IPI[ind1];   label225.Caption := '25 Aliq IPI';  }
    {26} i := pos(';', linha); X_ORIGEMPROD [ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl26.Caption:=X_ORIGEMPROD[ind1]; label226.Caption := '26 Origem Pro'; }
    {27} i := pos(';', linha); X_REF_INTERNA[ind1] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl27.Caption:=X_REF_INTERNA[ind1]; label227.Caption := '27 Ref Inter';  }
 end;

procedure TfrmEmissaoNfe.LerRegistro20;
begin
  { Tipo 20 = Numero Da Nota, CPF, NomeCliente, DataEmissa, TipoPagto, DescricaoPagto, Valor }

    i := pos(';', linha); delete(linha, 1, i);

    {28} i := pos(';', linha); X_NUM_CAIXA       := copy(linha, 1, i-1); delete(linha, 1, i); {lbl28.Caption:=X_NUM_CAIXA;       label228.Caption := '28 N. Cx';              }
    {29} i := pos(';', linha); X_NUM_LOJA        := copy(linha, 1, i-1); delete(linha, 1, i); {lbl29.Caption:=X_NUM_LOJA;        label229.Caption  := '29 N. Lj';            }
    {30} i := pos(';', linha); X_NUM_VENDA       := copy(linha, 1, i-1); delete(linha, 1, i); {lbl30.Caption:=X_NUM_VENDA;       label230.Caption := '30 N. Vnd';           }
    {31} i := pos(';', linha); X_CNPJ_CPF        := copy(linha, 1, i-1); delete(linha, 1, i); {lbl31.Caption:=X_CNPJ_CPF;        label231.Caption  := '31 CNPJ_CPF';       }
    {32} i := pos(';', linha); X_TIPO_NOTA       := copy(linha, 1, i-1); delete(linha, 1, i); {lbl32.Caption:=X_TIPO_NOTA;       label232.Caption := '32 TP NoTa';         }
    {33} i := pos(';', linha); X_CNPJ_CPF_TRANSP := copy(linha, 1, i-1); delete(linha, 1, i); {lbl33.Caption:=X_CNPJ_CPF_TRANSP; label233.Caption := '33 CNPJ_CPF_TRANSP';}
    {34} i := pos(';', linha); X_NOMECLIENTE     := copy(linha, 1, i-1); delete(linha, 1, i); {lbl34.Caption:=X_NOMECLIENTE;     label234.Caption := '34 N.Cli';    }
    {35} i := pos(';', linha); X_DT_VENDA        := copy(linha, 1, i-1); delete(linha, 1, i); {lbl35.Caption:=X_DT_VENDA;        label235.Caption := '35 Dt Vnd';   }
    {36} i := pos(';', linha); X_FORMA_PGTO      := copy(linha, 1, i-1); delete(linha, 1, i); {lbl36.Caption:=X_FORMA_PGTO;      label236.Caption := '36 F.Pagto'; }
    {37} i := pos(';', linha); X_INFO_ADICIONAIS := copy(linha, 1, i-1); delete(linha, 1, i); {lbl37.Caption:=X_INFO_ADICIONAIS; label237.Caption := '37 Info Adc';}

    {38} i := pos(';', linha); X_EXTRA1          := copy(linha, 1, i-1); delete(linha, 1, i); {lbl38.Caption:=X_EXTRA1; label238.Caption := '38 Ext 1'; }
    {39} i := pos(';', linha); X_EXTRA2          := copy(linha, 1, i-1); delete(linha, 1, i); {lbl39.Caption:=X_EXTRA2; label239.Caption := '39 Ext 2'; }
    {40} i := pos(';', linha); X_EXTRA3          := copy(linha, 1, i-1); delete(linha, 1, i); {lbl40.Caption:=X_EXTRA3; label240.Caption := '40 Ext 3'; }
    {41} i := pos(';', linha); X_EXTRA4          := copy(linha, 1, i-1); delete(linha, 1, i); {lbl41.Caption:=X_EXTRA4; label241.Caption := '41 Ext 4';}

end;

procedure TfrmEmissaoNfe.LerRegistro21;
begin
    {21 - X_NUM_VENDA, X_ITEM, X_COD_PROD, X_VALUNIT, X_QTDE, X_PERC_DESC : String;  }

    i := pos(';', linha); delete(linha, 1, i);

    {42} i := pos(';', linha); X_NUM_VENDA21 [ind2] := copy(linha, 1, i-1); delete(linha, 1, i); {lbl42.Caption:=X_NUM_VENDA21[ind2]; label242.Caption := '42 N.Venda';}
    {43} i := pos(';', linha); X_ITEM      [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl43.Caption:=X_ITEM[ind2]; label243.Caption := '43 Item';            }
    {44} i := pos(';', linha); X_COD_PROD  [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl44.Caption:=X_COD_PROD[ind2]; label244.Caption := '44 Cod Pro';     }
    {45} i := pos(';', linha); X_VALUNIT   [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl45.Caption:=X_VALUNIT[ind2]; label245.Caption := '45 Val Unit';     }
    {46} i := pos(';', linha); X_QTDE      [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl46.Caption:=X_QTDE[ind2]; label246.Caption := '46 Qtde ';          }
    {47} i := pos(';', linha); X_PERC_DESC [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl47.Caption:=X_PERC_DESC[ind2]; label247.Caption := '47 Perc Desc';}

    {471} i := pos(';', linha); XX_EXTRA1  [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl47a.Caption:=XX_EXTRA1[ind2]; label47a.Caption := '47a Ext 1';}
    {472} i := pos(';', linha); XX_EXTRA2  [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl47b.Caption:=XX_EXTRA2[ind2]; label47b.Caption := '47b Ext 2';}
    {473} i := pos(';', linha); XX_EXTRA3  [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl47c.Caption:=XX_EXTRA3[ind2]; label47c.Caption := '47c Ext 3';}
    {474} i := pos(';', linha); XX_EXTRA4  [ind2]:= copy(linha, 1, i-1); delete(linha, 1, i); {lbl47d.Caption:=XX_EXTRA4[ind2]; label47d.Caption := '47d Ext 4';}

end;

procedure TfrmEmissaoNfe.LerRegistro22;
begin
    {22 - X_NUM_VENDA, X_NUM_FATURA, X_VALOR_FATURA, X_VENCIMENTO : String; }
    i := pos(';', linha); delete(linha, 1, i);

    {48} i := pos(';', linha); X_NUM_VENDA22    := copy(linha, 1, i-1); delete(linha, 1, i); {lbl48.Caption:=X_NUM_VENDA22; label248.Caption := '48 Num. Venda'; }
    {49} i := pos(';', linha); X_NUM_FATURA   := copy(linha, 1, i-1); delete(linha, 1, i); {lbl49.Caption:=X_NUM_FATURA; label249.Caption := '49 Num Fatura';    }
    {50} i := pos(';', linha); X_VALOR_FATURA := copy(linha, 1, i-1); delete(linha, 1, i); {lbl50.Caption:=X_VALOR_FATURA; label250.Caption := '50 Val. Fatura';}
    {51} i := pos(';', linha); X_VENCIMENTO   := copy(linha, 1, i-1); delete(linha, 1, i); {lbl51.Caption:=X_VENCIMENTO; label251.Caption := '51 Vencto '; }

end;

procedure TfrmEmissaoNfe.BitBtn1Click(Sender: TObject);
begin
  //
end;

procedure TfrmEmissaoNfe.edtNvendaKeyPress(Sender: TObject; var Key: Char);
begin
 { if (key=VK_F8) then    // F8 - Para Buscar Nota
     FrmLocaliza.ShowModal;
{     Begin
       pnBuscaNotas.Visible := true;
       LerArqRemessa;
     End;
}

end;


procedure TfrmEmissaoNfe.edtNvendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Abre Janela com Notas *.rem no Caminho C:\MistralNFE\INTEGRACAO
  if (key=VK_F8) then    // F8 - Para Buscar Nota
    // ChamandoF8Forn(edtForn,true);
     Begin
      // pnBuscaNotas.Visible := true;
       LerArqRemessa;
     End;
  if (key=VK_ESCAPE) then
     Begin
      // pnBuscaNotas.Visible := false;
     End;
end;

procedure TfrmEmissaoNfe.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmissaoNfe.SpeedButton2Click(Sender: TObject);
begin
//

//
end;

End.
