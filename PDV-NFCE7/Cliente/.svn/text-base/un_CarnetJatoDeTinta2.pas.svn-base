{*** MODELO SEM LINHAS DE GRADE **** Para ser impresso no formulario padrao de carnet para matricial}
{** Posicionamento da pagina - Encostado do lado direito da impressora}
unit un_CarnetJatoDeTinta2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables;

type
  Tfrm_CarnetJatoDeTinta2 = class(TForm)
    carnet: TQuickRep;
    bandaCarnet: TQRBand;
    qrEMPRESA: TQRLabel;
    qrCLIENTE: TQRLabel;
    qrVENCIMENTO: TQRLabel;
    qrPRESTACAO: TQRLabel;
    QRLabel6: TQRLabel;
    qrMULTA: TQRLabel;
    qrVALORPRESTACAO: TQRLabel;
    qrJUROS: TQRLabel;
    qrCONTRATO: TQRLabel;
    qrCODCLIENTE: TQRLabel;
    qrLOJA1: TQRLabel;
    QRLabel12: TQRLabel;
    qrTOTALAPAGAR: TQRLabel;
    qrOBSERVACAO1: TQRLabel;
    qrOBSERVACAO2: TQRLabel;
    qrNOMELOJA: TQRLabel;
    QRLabel19: TQRLabel;
    qrCLIENTE2: TQRLabel;
    QRLabel21: TQRLabel;
    qrDV: TQRLabel;
    qrDOCUMENTO: TQRLabel;
    qrPDC: TQRLabel;
    qrLOJAPGTO: TQRLabel;
    qrNUMEROPRESTACAO: TQRLabel;
    QRLabel16: TQRLabel;
    qrDIAS: TQRLabel;
    qrLOCALPGTO: TQRLabel;
    qrDATAPGTO: TQRLabel;
    qrJUROSDIA: TQRLabel;
    qrMULTA2: TQRLabel;
    qrVENCIMENTO2: TQRLabel;
    QRLabel30: TQRLabel;
    qrVALORPRESTACAO2: TQRLabel;
    qrMULTA3: TQRLabel;
    qrTOTALJUROS: TQRLabel;
    qrTOTALAPAGAR2: TQRLabel;
    QRLabel1: TQRLabel;
    tbl_tempCarnetJatoDeTinta: TTable;
    tbl_tempCarnetJatoDeTintaLINHA: TFloatField;
    procedure carnetBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bandaCarnetBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure bandaCarnetAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure carnetAfterPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ind: Integer;
    qtdeCarnets: Integer;
    procedure LimparQrs;
  public
    { Public declarations }
    flagImprimiu: Boolean;
    arquivo_carnet: textfile;
    nome_arquivo: String;
  end;

var
  frm_CarnetJatoDeTinta2: Tfrm_CarnetJatoDeTinta2;

implementation

uses funcoes1,funcoes2,procura, principal, credito;

{$R *.DFM}

procedure Tfrm_CarnetJatoDeTinta2.carnetBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  carnet.page.leftmargin:=frm_principal.x_margem_esquerda_carnet_jt; {**}
  carnet.page.topmargin :=frm_principal.x_margem_superior_carnet_jt; {**}
  flagImprimiu:=false;
  qtdeCarnets:=0;
  ind:=1;
  AssignFile (arquivo_carnet,nome_arquivo);
  Reset      (arquivo_carnet);
end;

procedure Tfrm_CarnetJatoDeTinta2.bandaCarnetBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  campo01,campo02,campo03,campo04,campo05,campo06,campo07,campo08: String;
  campo09,campo10,campo11,campo12,campo13,campo14,campo15,campo16: String;
  campo17,campo18: String;
  separador,linha: String;
begin
  if (qtdeCarnets=3) then
  begin
    carnet.NewPage;
    qtdeCarnets:=0;
  end;
  Readln(arquivo_carnet,linha);
  campo01   := Copy(linha,1,2); {codigo da loja}
  separador := Copy(linha,3,1); {]}
  campo02   := Copy(linha,4,6); {codigo do cliente}
  separador := Copy(linha,10,1); {]}
  campo03   := Copy(linha,11,6); {codigo do contrato}
  separador := Copy(linha,17,1); {]}
  campo04   := Copy(linha,18,2); {n. da prestacao}
  separador := Copy(linha,20,1); {]}
  campo05   := Copy(linha,21,30); {nome da empresa}
  separador := Copy(linha,51,1); {]}
  campo06   := Copy(linha,52,20); {nome da loja}
  separador := Copy(linha,72,1); {]}
  campo07   := Copy(linha,73,30); {nome do cliente}
  separador := Copy(linha,103,1); {]}
  campo08   := Copy(linha,104,2); {total de prestacoes}
  separador := Copy(linha,106,1); {]}
  campo09   := Copy(linha,107,10); {vencimento}
  separador := Copy(linha,117,1); {]}
  campo10   := Copy(linha,118,10); {valor da prestacao}
  separador := Copy(linha,128,1); {]}
  campo11   := Copy(linha,129,4); {pdc}
  separador := Copy(linha,133,1); {]}
  campo12   := Copy(linha,134,1); {digito verificador}
  separador := Copy(linha,135,1); {]}
  campo13   := Copy(linha,136,10); {multa}
  separador := Copy(linha,146,1); {]}
  campo14   := Copy(linha,147,10); {moras}
  separador := Copy(linha,157,1); {]}
  campo15   := Copy(linha,158,23); {obs1}
  separador := Copy(linha,181,1); {]}
  campo16   := Copy(linha,182,23); {obs2}
  separador := Copy(linha,205,1); {]}
  campo17   := Copy(linha,206,34); {local de pagamento}
     {***}
  LimparQrs;
  qrEMPRESA.caption    := ' '+UpperCase(campo05);
  qrNOMELOJA.caption   := ' '+UpperCase(campo06);
  qrCLIENTE.caption    := ' '+campo07;
  qrCLIENTE2.caption   := ' '+campo07;
  qrPRESTACAO.caption  := ' '+campo04;
  qrVENCIMENTO.caption := ' '+campo09;
  qrVENCIMENTO2.caption := ' '+campo09;
  qrVALORPRESTACAO.caption := ' '+campo10+' ';
  qrVALORPRESTACAO2.caption := ' '+campo10+' ';
  qrPDC.caption        := ' '+campo11;
  qrDOCUMENTO.caption  := ''+campo01+'.'+campo02+'.'+campo03+'.'+campo04;
  qrDV.caption         := ' '+campo12;
  if (Trim(campo04)='') then
    qrNUMEROPRESTACAO.caption := form_t('ENTR.',5)
  else
    qrNUMEROPRESTACAO.caption := campo04+'/'+campo08;
  qrLOJA1.caption      := campo01;
  qrCODCLIENTE.caption := campo02;
  qrCONTRATO.caption   := campo03;
  if (Trim(campo13)<>'0,00') then
    qrMULTA3.caption     := campo13;
  if (Trim(campo14)<>'0,00') then
    qrTOTALJUROS.caption     := campo14;
  qrOBSERVACAO1.caption    := ' '+campo15;
  qrOBSERVACAO2.caption    := ' '+campo16;
  qrLOCALPGTO.caption      := '        '+campo17;
end;

procedure Tfrm_CarnetJatoDeTinta2.LimparQrs;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  bandaCarnet.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]).tag=0) then
      if (TWinControl(Lista.items[ind]) is TQRLabel) then
        TQRLabel(Lista.items[ind]).caption:='';
    ind:=ind+1;
  end;
  Lista.Free;
end;

procedure Tfrm_CarnetJatoDeTinta2.bandaCarnetAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  qtdeCarnets := qtdeCarnets + 1;
end;

procedure Tfrm_CarnetJatoDeTinta2.carnetAfterPrint(Sender: TObject);
begin
  try
    CloseFile  (arquivo_carnet);
    DeleteFile (nome_arquivo);
    flagImprimiu:=true;
  except
    flagImprimiu:=false;
  end;
end;

procedure Tfrm_CarnetJatoDeTinta2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    CloseFile  (arquivo_carnet);
    DeleteFile (nome_arquivo);
  except
  end;
end;

procedure Tfrm_CarnetJatoDeTinta2.FormCreate(Sender: TObject);
begin
  ChecaExistenciaArquivo_TEMPCARNETJATODETINTA;
end;

end.
