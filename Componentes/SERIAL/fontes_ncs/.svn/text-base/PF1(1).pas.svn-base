unit PF1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PrintFast, StdCtrls, Db, DBTables, ExtCtrls, Buttons, PFReport, PFColumn,
  PFBand;

type
  TDemoPF = class(TForm)
    Panel1: TPanel;
    TPracas: TTable;
    TPracasCODIGO: TStringField;
    TPracasNOME: TStringField;
    TClientes: TTable;
    TClientesCODIGO: TStringField;
    TClientesNOME: TStringField;
    TClientesENDERECO: TStringField;
    TClientesBAIRRO: TStringField;
    TClientesCIDADE: TStringField;
    TClientesUF: TStringField;
    TClientesCEP: TStringField;
    TClientesCX_POSTAL: TStringField;
    TClientesFONE: TStringField;
    TClientesFAX: TStringField;
    TClientesCONTATO: TStringField;
    TClientesCGC: TStringField;
    TClientesINSCRICAO: TStringField;
    TCliVendas: TTable;
    TCliVendasCODIGO: TStringField;
    TCliVendasNOME: TStringField;
    srcVendas: TDataSource;
    PrintFast1: TPrintFast;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel7: TBevel;
    VendItem: TTable;
    Produto: TTable;
    srcVendItem: TDataSource;
    BitBtn20: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    QR_X: TQuery;
    PFBand1: TPFBand;
    PFColumn1: TPFColumn;
    PFColumn2: TPFColumn;
    PFColumn3: TPFColumn;
    PFColumn4: TPFColumn;
    PFBand2: TPFBand;
    PFBand3: TPFBand;
    TVendas: TTable;
    PFBand4: TPFBand;
    PFBand5: TPFBand;
    PFBand6: TPFBand;
    PFBand7: TPFBand;
    PFColumn5: TPFColumn;
    PFColumn6: TPFColumn;
    PFColumn7: TPFColumn;
    TVendasCONTROLE: TIntegerField;
    TVendasNRO_NOTA: TStringField;
    TVendasSER_NOTA: TStringField;
    TVendasDT_EMISS: TDateField;
    TVendasCOD_CLIENTE: TStringField;
    TVendasCFOP: TStringField;
    TVendasVENDEDOR: TStringField;
    TVendasDT_SAIDA: TDateField;
    TVendasHR_SAIDA: TStringField;
    TVendasCTA_FRETE: TStringField;
    TVendasICM_FRETE: TFloatField;
    TVendasENC_FIN: TFloatField;
    TVendasICM_ENC: TFloatField;
    TVendasOBSERV1: TStringField;
    TVendasOBSERV2: TStringField;
    TVendasCOD_TRANS: TStringField;
    TVendasPLACA: TStringField;
    TVendasPRACA_CLI: TStringField;
    TVendasPERC_DESC: TFloatField;
    TVendasPERC_ACRE: TFloatField;
    TVendasPEDD_IMP: TStringField;
    TVendasNOME_CLI: TStringField;
    TVendasDE_MANIF: TStringField;
    TVendasTIPO_NOTA: TStringField;
    TVendasCLI_FORN: TStringField;
    TVendasTT_PBRUTO: TFloatField;
    TVendasTT_PLIQUI: TFloatField;
    TVendasNTQUANTID: TFloatField;
    TVendasNTESPECIE: TStringField;
    TVendasNTMARCA: TStringField;
    ProdutoCODIGO: TStringField;
    ProdutoGRUPO: TStringField;
    ProdutoREFERENCIA: TStringField;
    ProdutoUNIDADE: TStringField;
    ProdutoREF_TECNICA: TMemoField;
    ProdutoSALDO_INI: TFloatField;
    ProdutoSALDO_ATU: TFloatField;
    ProdutoEST_MINIMO: TFloatField;
    ProdutoULTM_COMPRA: TDateField;
    ProdutoULTM_VENDA: TDateField;
    ProdutoLOCALIZACAO: TStringField;
    ProdutoPESO_BRUTO: TFloatField;
    ProdutoPESO_LIQUI: TFloatField;
    Label2: TLabel;
    TVendasVL_COMISS: TFloatField;
    TVendasVL_FRETE: TFloatField;
    TVendasVL_DESC: TFloatField;
    TVendasVL_IPI: TFloatField;
    TVendasVL_ICM: TFloatField;
    TVendasTOT_PROD: TFloatField;
    TVendasTOT_NOTA: TFloatField;
    TVendasBASE_ICMS: TFloatField;
    TVendasBASE_IPI: TFloatField;
    TVendasTOT_ISS: TFloatField;
    TVendasVLR_PAGO: TFloatField;
    TVendasTROCO: TFloatField;
    TVendasVLR_ACRE: TFloatField;
    VendItemCONTROLE: TIntegerField;
    VendItemCOD_PRODUTO: TStringField;
    VendItemSEQ_PRODUTO: TIntegerField;
    VendItemNRO_NOTA: TStringField;
    VendItemSER_NOTA: TStringField;
    VendItemCOD_CLIENTE: TStringField;
    VendItemCOD_SITTRIB: TStringField;
    VendItemQUANTIDADE: TFloatField;
    VendItemVL_UNITARIO: TFloatField;
    VendItemPERC_ICMS: TFloatField;
    VendItemREDU_ICMS: TFloatField;
    VendItemVL_ICMS: TFloatField;
    VendItemPERC_DESC: TFloatField;
    VendItemVL_DESC: TFloatField;
    VendItemPERC_IPI: TFloatField;
    VendItemVL_IPI: TFloatField;
    VendItemVL_TOTAL: TFloatField;
    VendItemDT_NOTA: TDateField;
    VendItemVENDEDOR: TStringField;
    VendItemBASE_ICMS: TFloatField;
    VendItemBASE_IPI: TFloatField;
    VendItemTBL_PRECO: TStringField;
    VendItemCLAS_FISC: TStringField;
    VendItemEDITA: TStringField;
    VendItemTT_PBRUTO: TFloatField;
    VendItemTT_PLIQUI: TFloatField;
    VendItemVL_TTPROD: TFloatField;
    VendItemCLI_FORN: TStringField;
    ProdutoFORNECEDOR: TStringField;
    ProdutoPRECO_CUST: TFloatField;
    ProdutoCUSTO_MINI: TFloatField;
    ProdutoPRECO_VEND: TFloatField;
    ProdutoMESES_GRNT: TIntegerField;
    ProdutoPERC_COMIS: TFloatField;
    PFReport1: TPFReport;
    ProdutoNOME: TStringField;
    procedure RelPracas;
    procedure RelCliSintetico;
    procedure RelCliAnalitico;
    procedure RelVendasCli;
    procedure EtiquetasCli;
    procedure PrintEtiq;
    procedure RelVendCliPFRep;
    procedure RelVendProdPFRep;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RelVendasProd;
    procedure BitBtn19Click(Sender: TObject);
    procedure ConfImpr;
    procedure FormShow(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PFBand2BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand1BeforePrint(Sender: TObject; Linha: TStrings);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PFBand3BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand3AfterPrint(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure PFBand4BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand4AfterPrint(Sender: TObject);
    procedure PFBand5BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand6BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand7BeforePrint(Sender: TObject; Linha: TStrings);
    procedure PFBand7AfterPrint(Sender: TObject);
    procedure PFColumn7BeforePrint(Sender: TObject; var Linha: String);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
  private
  public
//    function StrVazio(const cStr:shortstring;const nLen:smallint;const Pos:ShortString):shortstring;
  end;

var
  DemoPF: TDemoPF;

  var vNome,vNome2,vEnde,vEnde2,vCid,vCid2,vUF,vUF2,vCEP,vCEP2 : string;

implementation

{$R *.DFM}

Uses Unit1,
     Unit2,
     Unit3,
     Unit4,
     Unit5,
     Unit6,
     Unit7, Unit8;

var
  FRelatorio : byte;
  Total, TotGeral:^Real;

function StrZero(const cStr:string;const nLen:smallint):string;
var
   nI:byte;
begin
  Result:='';
  for nI:=1 to (Abs(nLen)-Length(cStr)) do
    Result:=Result+'0';
  if nLen > 0 then
    Result:=Result+cStr
  else
    Result:=cStr+Result;
end;

function StrVazio(const cStr:shortstring;const nLen:smallint;const Pos:ShortString):shortstring;
var
   nI:smallint;
begin
  Result:='';
  for nI:=1 to ((nLen)-Length(cStr)) do
    Result:=Result+' ';
  if UpperCase(Pos) = 'D' then
    Result:=cStr+Result
  else
    Result:=Result+cStr;
end;

Procedure TDemoPF.RelPracas;
begin
   PrintFast1.HeaderData.Left2      := 'Praças';
   PrintFast1.HeaderData.ColHeader1 := 'Codigo,0;Nome,11';
   PrintFast1.PageWidth := 80;
   PrintFast1.QtLines   := 66;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      with TPracas do
      begin
         First;
         while not eof do
         begin
            PrintFast1.ImprString('',TPracasCODIGO.value,0,false);
            PrintFast1.ImprString('',TPracasNOME.value,11,true);
            next;
         end;
      end;
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.RelCliSintetico;
begin
   PrintFast1.HeaderData.Left2      := 'Rel. Clientes (Sintetico)';
   PrintFast1.HeaderData.ColHeader1 := 'Codigo,0;Nome,8;Telefone,60;Fax,92';
   PrintFast1.PageWidth := 122;
   PrintFast1.QtLines   := 66;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      PrintFast1.ImprComo(pCompr175); // comprime em 17,5
      with TClientes do
      begin
         First;
         while not eof do
         begin
            PrintFast1.ImprString('',TClientesCODIGO.value,0,false);
            PrintFast1.ImprString('',TClientesNOME.value,8,false);
            PrintFast1.ImprString('',TClientesFONE.value,60,false);
            PrintFast1.ImprString('',TClientesFAX.value,92,true);
            next;
         end;
      end;
      PrintFast1.ImprComo(tCompr175); // tira compressao 17,5
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.RelCliAnalitico;
begin
   PrintFast1.HeaderData.Left2 := 'Rel. Clientes (Analitico)';
   PrintFast1.HeaderData.ColHeader1 := '';
   PrintFast1.PageWidth := 112;
   PrintFast1.QtLines   := 61;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      PrintFast1.ImprComo(pCompr175); // comprime em 17,5
      with TClientes do
      begin
         First;
         while not eof do
         begin
            PrintFast1.ImprString('','Codigo..: '+TClientesCODIGO.value,0,false);
            PrintFast1.ImprString('','Nome: '+TClientesNOME.value,17,true);
            PrintFast1.ImprString('','Endereco: '+TClientesENDERECO.value,0,false);
            PrintFast1.ImprString('','Cidade :'+Copy(TClientesCIDADE.value,1,20),52,false);
            PrintFast1.ImprString('','Bairro..: '+TClientesBAIRRO.value,82,true);
            PrintFast1.ImprString('','UF: '+TClientesUF.value,0,false);
            PrintFast1.ImprString('','CEP: '+TClientesCEP.value,8,false);
            PrintFast1.ImprString('','CGC: '+TClientesCGC.value,25,false);
            PrintFast1.ImprString('','Inscricao: '+TClientesINSCRICAO.value,44,true);
            PrintFast1.ImprString('','Fone:...: '+TClientesFONE.value,0,false);
            PrintFast1.ImprString('','Fax: '+TClientesFAX.value,30,true);
            PrintFast1.ImprString('',PrintFast1.Repete('*',112),0,true);
            next;
         end;
      end;
      PrintFast1.ImprComo(tCompr175); // tira compressao 17,5
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.RelVendasCli;
var vCli : string;
    vttCli,vttGeral : Real;
begin
   vttCli   := 0;
   vttGeral := 0;
   PrintFast1.HeaderData.Left2 := 'Vendas por Cliente';
   PrintFast1.HeaderData.ColHeader1 := 'Nro.Nota,5;Ser,15;Emissao,20;Valor,35';
   PrintFast1.PageWidth := 80;
   PrintFast1.QtLines   := 61;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      with TVendas do
      begin
         First;
         while not eof do
         begin
            PrintFast1.ImprString(pNegrito,'Cliente.: '+TCliVendasNOME.value,0,true);
            PrintFast1.ImprComo(tNegrito);
            vCli := TVendasCOD_CLIENTE.value;
            while not eof and (TVendasCOD_CLIENTE.value = vCli) do
            begin
               PrintFast1.ImprString('',TVendasNRO_NOTA.value,5,false);
               PrintFast1.ImprString('',TVendasSER_NOTA.value,15,false);
               PrintFast1.ImprString('',DateToStr(TVendasDT_EMISS.value),20,false);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('###,##0.00',TVendasTOT_NOTA.value),35,true);
               vttCli := vttCli+TvendasTOT_NOTA.value;
               vttGeral := vttGeral+TvendasTOT_NOTA.value;
               next;
            end;
            PrintFast1.ImprString(pNegrito,PrintFast1.MascaraVlr('###,##0.00',vttCli),35,true);
            PrintFast1.ImprString(tNegrito,' ',0,true);
            vttCli := 0;
         end;
         PrintFast1.ImprString(pNegrito,'Total Geral'+PrintFast1.Repete('.',20),0,false);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vttGeral),33,true);
         PrintFast1.ImprString(tNegrito,' ',0,true);
      end;
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.EtiquetasCli;
var    vcol1 : boolean;
begin
   PrintFast1.PageWidth := 112;
   PrintFast1.QtLines   := 61;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      PrintFast1.ImprComo(pCompr175); // comprime em 17,5
      with TClientes do
      begin
         First;
         vCol1 := true;
         while not eof do
         begin
            if vCol1 then
            begin
               vNome   := Copy(TClientesNOME.value,1,30);
               vEnde   := Copy(TClientesENDERECO.value,1,38);
               vCid    := Copy(TClientesCIDADE.value,1,20);
               vUF     := TClientesUF.value;
               vCep    := TCLientesCEP.value;
               vNome2:=''; vEnde2:=''; vCid2:=''; vUF2:=''; vCep2:='';
            end
            else
            begin
               vNome2   := Copy(TClientesNOME.value,1,30);
               vEnde2   := Copy(TClientesENDERECO.value,1,38);
               vCid2    := Copy(TClientesCIDADE.value,1,20);
               vUF2     := TClientesUF.value;
               vCep2    := TCLientesCEP.value;
            end;
            if vCOl1 then
               vCol1 := false
            else
            begin
               PrintEtiq;
               vCol1 := true;
            end;
            next;
         end;
      end;
      PrintEtiq;
      PrintFast1.ImprComo(tCompr175); // tira compressao 17,5
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.PrintEtiq;
begin
   PrintFast1.ImprString('',vNome,0,false);
   PrintFast1.ImprString('',vNome2,40,true);
   PrintFast1.ImprString('',vEnde,0,false);
   PrintFast1.ImprString('',vEnde2,40,true);
   PrintFast1.ImprString('',vCid,0,false);
   PrintFast1.ImprString('',vCid2,40,true);
   PrintFast1.ImprString('',vUF,0,false);
   PrintFast1.ImprString('',vUF2,40,true);
   PrintFast1.ImprString('',vCEP,0,false);
   PrintFast1.ImprString('',vCEP2,40,true);
   PrintFast1.ImprString('','',0,true);
end;

procedure TDemoPF.BitBtn3Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := true;
   RelPracas;
   label1.visible := false; repaint;   
end;

procedure TDemoPF.BitBtn4Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := true;
   RelPracas;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn5Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := true;
   RelCliSintetico;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn6Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := true;
   RelCliSintetico;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn7Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := true;
   RelCliAnalitico;
   label1.visible := false; repaint;   
end;

procedure TDemoPF.BitBtn8Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := true;
   RelCliAnalitico;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn9Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := true;
   RelVendasCli;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn10Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := true;
   RelVendasCli;
   label1.visible := false; repaint;   
end;

procedure TDemoPF.BitBtn11Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := false;
   EtiquetasCli;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn12Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := false;
   EtiquetasCli;
   label1.visible := false; repaint;   
end;

procedure TDemoPF.BitBtn14Click(Sender: TObject);
begin
   close;
end;

procedure TDemoPF.BitBtn13Click(Sender: TObject);
begin
   S_Pracas := TS_Pracas.Create(Self);
   S_Pracas.Showmodal;
end;

procedure TDemoPF.BitBtn15Click(Sender: TObject);
begin
   S_CliSint := TS_CliSint.Create(Self);
   S_CliSint.Showmodal;
end;

procedure TDemoPF.BitBtn16Click(Sender: TObject);
begin
   S_CliAnal := TS_CliAnal.Create(Self);
   S_CliAnal.showmodal;
end;

procedure TDemoPF.BitBtn17Click(Sender: TObject);
begin
   S_VendasCli := TS_VendasCli.Create(Self);
   S_VendasCli.showmodal;
end;

procedure TDemoPF.BitBtn18Click(Sender: TObject);
begin
   S_EtiqCli := TS_EtiqCli.Create(Self);
   S_EtiqCli.showmodal;
end;

procedure TDemoPF.BitBtn1Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := false;
   PrintFast1.PageHeader := true;
   RelVendasProd;
   label1.visible := false; repaint;
end;

procedure TDemoPF.BitBtn2Click(Sender: TObject);
begin
   label1.visible := true; repaint;
   PrintFast1.Preview.ShowPreview := true;
   PrintFast1.PageHeader := true;
   RelVendasProd;
   label1.visible := false; repaint;
end;

procedure TDemoPF.RelVendasProd;
var vProd : string;
    vttProd,vttGeral : Real;
begin
   vttProd  := 0;
   vttGeral := 0;
   PrintFast1.HeaderData.Left2 := 'Vendas por Produto';
   PrintFast1.HeaderData.ColHeader1 := 'Nro.Nota,5;Ser,15;Emissao,20;Quantidade,36;Valor,51';
   PrintFast1.PageWidth := 80;
   PrintFast1.QtLines   := 66;
   ConfImpr;
   if PrintFast1.IniciaImpr then
   begin
      with Venditem do
      begin
         First;
         while not eof do
         begin
            PrintFast1.ImprString(pNegrito,'Produto.: '+ProdutoNOME.value,0,true);
            PrintFast1.ImprComo(tNegrito);
            vprod := VenditemCOD_PRODUTO.value;
            while not eof and (VenditemCOD_PRODUTO.value = vprod) do
            begin
               PrintFast1.ImprString('',VenditemNRO_NOTA.value,5,false);
               PrintFast1.ImprString('',VenditemSER_NOTA.value,15,false);
               PrintFast1.ImprString('',DateToStr(VenditemDT_NOTA.value),20,false);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('###,##0.000',VenditemQUANTIDADE.value),35,false);
               PrintFast1.ImprString('',PrintFast1.MascaraVlr('###,##0.00',VenditemVL_TOTAL.value),45,true);
               vttProd  := vttProd+VenditemVL_TOTAL.value;
               vttGeral := vttGeral+venditemVL_TOTAL.value;
               next;
            end;
            PrintFast1.ImprString(pNegrito,PrintFast1.MascaraVlr('###,##0.00',vttProd),46,true);
            PrintFast1.ImprString(tNegrito,' ',0,true);
            vttProd := 0;
         end;
         PrintFast1.ImprString(pNegrito,'Total Geral'+PrintFast1.Repete('.',20),0,false);
         PrintFast1.ImprString('',PrintFast1.MascaraVlr('#,###,##0.00',vttGeral),44,true);
         PrintFast1.ImprString(tNegrito,' ',0,true);
      end;
      PrintFast1.Ejeta;
      PrintFast1.FimImpr;
   end;
end;

procedure TDemoPF.BitBtn19Click(Sender: TObject);
begin
   S_VendasProd := TS_VendasProd.Create(Self);
   S_VendasProd.showmodal;
end;

procedure TDemoPF.ConfImpr;
begin
   //Tipo de Impressora.
   if ComboBox2.ItemIndex = 0 then PrintFast1.PrinterName := pfCanonBJC4000;
   if ComboBox2.ItemIndex = 1 then PrintFast1.PrinterName := pfDeskjet500;
   if ComboBox2.ItemIndex = 2 then PrintFast1.PrinterName := pfDeskjet600;
   if ComboBox2.ItemIndex = 3 then PrintFast1.PrinterName := pfEmiliaPS;
   if ComboBox2.ItemIndex = 4 then PrintFast1.PrinterName := pfEpson24pinos;
   if ComboBox2.ItemIndex = 5 then PrintFast1.PrinterName := pfEpson9pinos;
   if ComboBox2.ItemIndex = 6 then PrintFast1.PrinterName := pfEpsonStylusC2;
   if ComboBox2.ItemIndex = 7 then PrintFast1.PrinterName := pfPadraoIBM;
   if ComboBox2.ItemIndex = 8 then PrintFast1.PrinterName := pfRima;
   //Porta da Impressora.
   if ComboBox1.ItemIndex = 0  then PrintFast1.PrinterPort := '';
   if ComboBox1.ItemIndex = 1  then PrintFast1.PrinterPort := 'LPT1';
   if ComboBox1.ItemIndex = 2  then PrintFast1.PrinterPort := 'LPT2';
   if ComboBox1.ItemIndex = 3  then PrintFast1.PrinterPort := 'LPT3';
   if ComboBox1.ItemIndex = 4  then PrintFast1.PrinterPort := 'LPT4';
   if ComboBox1.ItemIndex = 5  then PrintFast1.PrinterPort := 'LPT5';
   if ComboBox1.ItemIndex = 6  then PrintFast1.PrinterPort := 'LPT6';
   if ComboBox1.ItemIndex = 7  then PrintFast1.PrinterPort := 'LPT7';
   if ComboBox1.ItemIndex = 8  then PrintFast1.PrinterPort := 'LPT8';
   if ComboBox1.ItemIndex = 9  then PrintFast1.PrinterPort := 'LPT9';
   if ComboBox1.ItemIndex = 10 then PrintFast1.PrinterPort := 'COM1';
   if ComboBox1.ItemIndex = 11 then PrintFast1.PrinterPort := 'COM2';
   if ComboBox1.ItemIndex = 12 then PrintFast1.PrinterPort := 'COM3';
   if ComboBox1.ItemIndex = 13 then PrintFast1.PrinterPort := 'COM4';
end;

procedure TDemoPF.FormShow(Sender: TObject);
begin
   ComboBox1.ItemIndex := 1;
   ComboBox2.ItemIndex := 5;
   TPracas.Open;
   TClientes.Open;
   TVendas.Open;
   TCliVendas.Open;
   VendItem.Open;
   Produto.Open;
end;

procedure TDemoPF.BitBtn21Click(Sender: TObject);
begin
   FRelatorio:=1;
   label1.visible:=true; repaint;
   PrintFast1.Preview.ShowPreview:=false;
   PrintFast1.PageHeader:=true;
   RelVendCliPFRep;
   label1.visible:=false; repaint;
end;

procedure TDemoPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   TPracas.Close;
   TClientes.Close;
   TVendas.Close;
   TCliVendas.Close;
   VendItem.Close;
   Produto.Close;
end;

procedure TDemoPF.PFBand2BeforePrint(Sender: TObject; Linha: TStrings);
begin
  if FRelatorio = 1 then
    PrintFast1.ImprString('','Cliente: '+QR_X.FieldByName('nome').AsString,0,true)
  else
    PrintFast1.ImprString('','Produto: '+QR_X.FieldByName('cod_produto').AsString+' - '+QR_X.FieldByName('nome').AsString,0,true);
end;

procedure TDemoPF.PFBand1BeforePrint(Sender: TObject; Linha: TStrings);
begin
  if FRelatorio = 1 then
  begin
    Total^:=Total^+QR_X.FieldByName('tot_nota').AsFloat;
    TotGeral^:=TotGeral^+QR_X.FieldByName('tot_nota').AsFloat;
  end
  else
  begin
    Total^:=Total^+QR_X.FieldByName('vl_total').AsFloat;
    TotGeral^:=TotGeral^+QR_X.FieldByName('vl_total').AsFloat;
  end;
end;

procedure TDemoPF.FormCreate(Sender: TObject);
var oPath : String;
begin
  New(Total);
  New(TotGeral);
  Total^:=0;
  TotGeral^:=0;

  oPath := ExtractFilePath(Application.ExeName);
  TCliVendas.DatabaseName := oPath;
  TPracas.DatabaseName    := oPath;
  TClientes.DatabaseName  := oPath;
  TVendas.DatabaseName    := oPath;
  Produto.DatabaseName    := oPath;
  VendItem.DatabaseName   := oPath;
  QR_X.DatabaseName       := oPath;    
end;

procedure TDemoPF.FormDestroy(Sender: TObject);
begin
  Dispose(Total);
  Dispose(TotGeral);
end;

procedure TDemoPF.PFBand3BeforePrint(Sender: TObject; Linha: TStrings);
begin
  if FRelatorio = 1 then
    PrintFast1.ImprString('','Total: '+StrVazio(FloatToStrf(Total^,ffCurrency,20,2),15,'E'),26,true)
  else
    PrintFast1.ImprString('','Total: '+StrVazio(FloatToStrf(Total^,ffCurrency,20,2),15,'E'),50,true);
end;

procedure TDemoPF.PFBand3AfterPrint(Sender: TObject);
begin
  Total^:=0;
end;

procedure TDemoPF.RelVendCliPFRep; // Realtório de Vendas por cliente usando PrintFast Report
begin
   FRelatorio:=1;
   PrintFast1.HeaderData.Left3 := 'Vendas p/Cliente';
   PrintFast1.HeaderData.ColHeader1 := '';
   PrintFast1.HeaderData.ColHeader1 := 'Nota,3;Serie,12;Emissao,20;Valor,43';
   PrintFast1.PageWidth := 80;
   PrintFast1.QtLines   := 61;
   ConfImpr;
   PFReport1.DataSet:=QR_X;
   PFReport1.Title:=nil;
   PFReport1.PrintTitle := False;
   PFReport1.PageHeader:=nil;
   PFReport1.PrintPageHeader := False;
   PFReport1.PageFooter:=nil;
   PFReport1.PrintPageFooter := False;
   PFReport1.Summary:=PFBand4;
   PFReport1.PrintSummary:=true;
   PFBand2.HowPrint:=pfNegrito;
   PFBand3.HowPrint:=pfNegrito;
   PFBand4.HowPrint:=pfNegrito;
   PFBand2.Expression:='cod_cliente';
   PFColumn1.Expression:='nro_nota';
   PFColumn2.Expression:='ser_nota';
   PFColumn3.Expression:='dt_emiss';
   PFColumn4.Expression:='tot_nota';
   PFColumn4.Mask:='###,##0.00';
   PFColumn1.ColWidth:=8;
   PFColumn2.ColWidth:=7;
   PFColumn3.ColWidth:=15;
   PFColumn4.ColWidth:=12;
   PFColumn4.Alignment:=taRightJustify;
   PFReport1.GroupHeader[0]:=PFBand2;
   PFReport1.GroupFooter[0]:=PFBand3;
   PFReport1.Detail[0]:=PFBand1;
   PFBand1.Column[0]:=PFColumn1;
   PFBand1.Column[1]:=PFColumn2;
   PFBand1.Column[2]:=PFColumn3;
   PFBand1.Column[3]:=PFColumn4;
   QR_X.SQL.Clear;
   QR_X.SQL.Add('Select a.nro_nota, a.ser_nota, a.dt_emiss, a.cod_cliente, ');
   QR_X.SQL.Add('a.tot_nota, b.nome ');
   QR_X.SQL.Add('From VENDDEVO a Join ACADCLIE b On a.cod_cliente=b.codigo ');
   QR_X.SQL.Add('Order By a.cod_cliente');
   QR_X.Open;
   PFReport1.Execute ;
   QR_X.Close;
end;

procedure TDemoPF.BitBtn22Click(Sender: TObject);
begin
   FRelatorio:=1;
   label1.visible:=true; repaint;
   PrintFast1.Preview.ShowPreview:=true;
   PrintFast1.PageHeader:=true;
   RelVendCliPFRep;
   label1.visible:=false; repaint;
end;

procedure TDemoPF.BitBtn23Click(Sender: TObject);
begin
   S_VendCliRep:=TS_VendCliRep.Create(Self);
   S_VendCliRep.showmodal;
end;

procedure TDemoPF.BitBtn24Click(Sender: TObject);
begin
   FRelatorio:=2;
   label1.visible:=true; repaint;
   PrintFast1.Preview.ShowPreview:=false;
   PrintFast1.PageHeader:=true;
   RelVendProdPFRep;
   label1.visible:=false; repaint;
end;

procedure TDemoPF.RelVendProdPFRep;
begin
   PrintFast1.HeaderData.Title1:='';
   PrintFast1.HeaderData.Title2:='';
   PrintFast1.HeaderData.Left2:='';
   PrintFast1.HeaderData.ColHeader1:='';
   PrintFast1.PageWidth:=120;
   PFReport1.Title:=PFBand5;
   PFReport1.Summary:=PFBand4;
   PFReport1.PageHeader:=PFBand7;
   PFReport1.PageFooter:=PFBand6;
   PFReport1.PrintPageHeader:=true;
   PFReport1.PrintPageFooter:=true;
   PFReport1.PrintTitle:=true;
   PFReport1.PrintSummary:=true;
   PrintFast1.PageWidth:=140;
   PrintFast1.QtLines:=61;
   ConfImpr;
   PFReport1.DataSet:=QR_X;
   PFReport1.Summary:=PFBand4;
   PFReport1.PrintSummary:=true;
   PFReport1.LinesFooter:=2;
   PrintFast1.PageHeader:=false;
   PFBand2.HowPrint:=pfNegrito;     // GroupHeader
   PFBand3.HowPrint:=pfNegrito;     // GroupFooter
   PFBand4.HowPrint:=pfNegrito;     // Sumário
   PFBand7.HowPrint:=pfNegrito;     // PageHeader
   PFBand6.HowPrint:=pfNegrito;     // PageFooter
   PFBand1.HowPrint:=pfCompr175;    // Detail
   PFBand2.Expression:='cod_produto';
   PFColumn1.Expression:='nro_nota';
   PFColumn2.Expression:='ser_nota';
   PFColumn3.Expression:='dt_nota';
   PFColumn4.Expression:='quantidade';
   PFColumn5.Expression:='vl_unitario';
   PFColumn6.Expression:='vl_total';
   PFColumn7.Expression:='vl_desc';
   PFColumn1.ColWidth:=15; //   nro_nota
   PFColumn2.ColWidth:=10;  //   ser_nota
   PFColumn3.ColWidth:=15; //   dt_nota
   PFColumn4.ColWidth:=15; //   quantidade
   PFColumn5.ColWidth:=18; //   vl_unitario
   PFColumn6.ColWidth:=19; //   desconto
   PFColumn7.ColWidth:=23; //   vl_total
   PFColumn1.ColHeader:='Nro Nota';
   PFColumn2.ColHeader:='Serie';
   PFColumn3.ColHeader:='Dt. Emissao';
   PFColumn4.ColHeader:='Quantidade';
   PFColumn5.ColHeader:='Valor Unitario';
   PFColumn6.ColHeader:='Total';
   PFColumn7.ColHeader:='Desconto/Acrescimo';
   PFColumn4.Mask:='###,##0.000';
   PFColumn5.Mask:='###,##0.00';
   PFColumn6.Mask:='###,###,##0.00';
   PFColumn7.Mask:='###,##0.00';
   PFColumn6.Alignment:=taRightJustify;
   PFColumn4.Alignment:=taRightJustify;
   PFColumn5.Alignment:=taRightJustify;
   PFColumn7.Alignment:=taRightJustify;
   PFColumn2.Alignment:=taCenter;
   PFColumn3.Alignment:=taCenter;
   PFReport1.GroupHeader[0]:=PFBand2;
   PFReport1.GroupFooter[0]:=PFBand3;
   PFReport1.Detail[0]:=PFBand1;
   PFBand1.Column[0]:=PFColumn1; // Nº da Nota
   PFBand1.Column[1]:=PFColumn2; // Série da Nota
   PFBand1.Column[2]:=PFColumn3; // Data Emissão da Nota
   PFBand1.Column[3]:=PFColumn4; // Quantidade
   PFBand1.Column[4]:=PFColumn5; // valor unitario
   PFBand1.Column[5]:=PFColumn7; // Desconto
   PFBand1.Column[6]:=PFColumn6; // total
   QR_X.SQL.Clear;
   QR_X.SQL.Add('Select a.cod_produto, a.nro_nota, a.ser_nota, a.dt_nota, ');
   QR_X.SQL.Add('a.quantidade, a.vl_unitario, a.vl_total, a.vl_ipi, a.vl_desc, b.nome ');
   QR_X.SQL.Add('From VENDITEM a Join ACADPROD b On a.cod_produto=b.codigo ');
   QR_X.SQL.Add('Order By a.cod_produto');
   QR_X.Open;
   Total^:=0;
   TotGeral^:=0;
   PFReport1.Execute ;
   QR_X.Close;
end;

procedure TDemoPF.PFBand4BeforePrint(Sender: TObject; Linha: TStrings);
begin
  if FRelatorio = 1 then
  begin
    PrintFast1.ImprString('',PrintFast1.Repete('-',14),34,true);
    PrintFast1.ImprString('','Total Geral: '+StrVazio(FloatToStrf(TotGeral^,ffCurrency,20,2),15,'E'),20,true);
  end
  else
  begin
    PrintFast1.ImprString('',PrintFast1.Repete('-',14),138,true);
    PrintFast1.ImprString('','Total Geral: '+StrVazio(FloatToStrf(TotGeral^,ffCurrency,20,2),15,'E'),124,true);
  end;
end;

procedure TDemoPF.PFBand4AfterPrint(Sender: TObject);
begin
    TotGeral^:=0;
end;

procedure TDemoPF.PFBand5BeforePrint(Sender: TObject; Linha: TStrings);
begin
  PrintFast1.ImprString('','NCS Consultoria, Sistemas e Redes',0,true);
end;

procedure TDemoPF.PFBand6BeforePrint(Sender: TObject; Linha: TStrings);
begin
  PrintFast1.ImprString('',PrintFast1.Repete('-',80),0,true);
  PrintFast1.ImprString('','NCS Consultoria Sistemas e Redes(e-mail:suporte@ncs.com.br Fone:(0xx44)226-4606)',0,true);
end;

procedure TDemoPF.PFBand7BeforePrint(Sender: TObject; Linha: TStrings);
begin
   PrintFast1.ImprString('','Relatório de Vendas por Produto - PrintFast Report',0,false);
   PrintFast1.ImprString('','Pag.:'+StrZero(IntToStr(PFReport1.PageNumber),6),69,true);
end;

procedure TDemoPF.PFBand7AfterPrint(Sender: TObject);
begin
  PrintFast1.ImprString('',PrintFast1.Repete('-',80),0,true);
end;

procedure TDemoPF.PFColumn7BeforePrint(Sender: TObject; var Linha: String);
begin
  if not QR_X.Active then exit;
  Linha:=FloatToStr(abs(QR_X.FieldByName('vl_desc').AsFloat-QR_X.FieldByName('vl_ipi').AsFloat));
end;

procedure TDemoPF.BitBtn25Click(Sender: TObject);
begin
   FRelatorio:=2;
   label1.visible:=true; repaint;
   PrintFast1.Preview.ShowPreview:=true;
   PrintFast1.PageHeader:=true;
   RelVendProdPFRep;
   label1.visible:=false; repaint;
end;

procedure TDemoPF.BitBtn26Click(Sender: TObject);
begin
   S_VendProdRep:=TS_VendProdRep.Create(Self);
   S_VendProdRep.showmodal;
end;

procedure TDemoPF.BitBtn20Click(Sender: TObject);
begin
   WinExec('HH PFHelp.chm', SW_SHOWNORMAL);
end;

end.
