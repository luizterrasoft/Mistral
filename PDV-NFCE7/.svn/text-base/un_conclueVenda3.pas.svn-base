unit un_conclueVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, Mask, Menus, ComCtrls;

type
  Tfrm_ConclueVenda = class(TForm)
    ds: TDataSource;
    qFormas: TQuery;
    qFormasVF_CAIX: TFloatField;
    qFormasVF_LOJA: TFloatField;
    qFormasVF_VEND: TFloatField;
    qFormasVF_FPGT: TFloatField;
    qFormasVF_VALO: TFloatField;
    qFormasnomeForma: TStringField;
    qFormasvalorPago: TStringField;
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Inserirforma1: TMenuItem;
    qFormasVF_ORDE: TSmallintField;
    qFormasordem: TStringField;
    Limparedits1: TMenuItem;
    Salvavenda1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodForma: TMaskEdit;
    pnForma: TPanel;
    edtValor: TMaskEdit;
    PageControl1: TPageControl;
    paginaCheque: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCodBanco: TMaskEdit;
    edtNomeBanco: TMaskEdit;
    edtAgencia: TMaskEdit;
    edtConta: TMaskEdit;
    edtNumero: TMaskEdit;
    paginaDebitoCartao: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    edtCodAdm: TMaskEdit;
    pnAdm: TPanel;
    edtCartao: TMaskEdit;
    paginaCrediario: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    edtCliente: TMaskEdit;
    edtContrato: TMaskEdit;
    Panel4: TPanel;
    grade: TDBGrid;
    Panel5: TPanel;
    botao_sair: TPanel;
    Button1: TButton;
    Bevel2: TBevel;
    Label14: TLabel;
    edtSerie: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtNota: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    pnSaldoAPagar: TPanel;
    pnTotalVenda: TPanel;
    Label17: TLabel;
    edtNome: TMaskEdit;
    chFlag: TCheckBox;
    Label18: TLabel;
    edtCpf: TMaskEdit;
    procedure SAIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorExit(Sender: TObject);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodFormaEnter(Sender: TObject);
    procedure edtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qFormasCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure edtCodFormaExit(Sender: TObject);
    procedure edtCodFormaDblClick(Sender: TObject);
    procedure Inserirforma1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Limparedits1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure edtCodBancoEnter(Sender: TObject);
    procedure edtNomeBancoEnter(Sender: TObject);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtContaEnter(Sender: TObject);
    procedure edtAgenciaEnter(Sender: TObject);
    procedure edtCodBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmEnter(Sender: TObject);
    procedure edtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCartaoEnter(Sender: TObject);
    procedure edtCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmExit(Sender: TObject);
    procedure edtCodAdmDblClick(Sender: TObject);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeDblClick(Sender: TObject);
    procedure edtSerieEnter(Sender: TObject);
    procedure edtNotaEnter(Sender: TObject);
    procedure edtSerieKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    x_caixa,x_loja,x_venda: real;
    x_total_venda: real; {armazena o total da venda efetuada}
    x_saldo_venda: real; {armazena o total que falta para ser pago}
    function ProximaOrdem(loja,caixa,venda: real):integer;
    function RetornaSaldoVenda:real;
    function CalculaTroco:real;
    procedure RefrescaTabela;
  end;

var
  frm_ConclueVenda: Tfrm_ConclueVenda;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, un_F8Adm, f8Vend,
  un_VerDadosPgto;

procedure Tfrm_ConclueVenda.SAIR1Click(Sender: TObject);
begin
     close;
end;

procedure Tfrm_ConclueVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ESC) then close;
end;

procedure Tfrm_ConclueVenda.edtValorExit(Sender: TObject);
begin
     FormatarZerosDecimais (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtValorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     FormatarEditNumerico (TMaskEdit(sender));
end;

procedure Tfrm_ConclueVenda.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) then
     begin
          if (Trim(pnSaldoAPagar.caption)='0,00') then
          begin
               showmessage('Não há saldo a pagar para esta venda!');
          end
          else if (Trim(edtCodForma.text)='02') then
          begin
               PageControl1.activepageindex := 0;
               PageControl1.visible         := true;
               PaginaCheque.tabvisible      := true;
               edtCodBanco.setfocus;
          end
          else if (Trim(edtCodForma.text)='04') or
                  (Trim(edtCodForma.text)='05') then
          begin
               PageControl1.activepageindex := 1;
               PageControl1.visible         := true;
               PaginaDebitoCartao.tabvisible      := true;
               edtCodAdm.setfocus;
          end
          else if (Trim(edtCodForma.text)='03') then
          begin
               PageControl1.activepageindex := 2;
               PageControl1.visible         := true;
               PaginaCrediario.tabvisible      := true;
               edtCliente.setfocus;
          end
          else Inserirforma1.click;
     end;
     if (key=K_CIMA) then edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodFormaEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodFormaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_F2) then grade.setfocus;   
     if (key=K_F8) then ChamandoF8FormaPgto (edtCodForma,false);
     if (key=K_ENTER) or (key=K_BAIXO) then edtValor.setfocus;
     if (key=K_CIMA) then ;
end;

procedure Tfrm_ConclueVenda.qFormasCalcFields(DataSet: TDataSet);
begin
     with (qFormas) do
     begin
          if (fieldbyname('nomeForma').IsNull) then
              fieldbyname('nomeForma').AsString :=
                   byname('valorPago').IsNull) then
              fieldbyname('valorPago').AsString :=
              form_nc(fieldbyname('VF_VALO').AsFloat,8);
          if (fieldbyname('ordem').IsNull) then
              fieldbyname('ordem').AsString :=
              form_nz(fieldbyname('VF_ORDE').AsInteger,2);
     end;
end;

procedure Tfrm_ConclueVenda.FormActivate(Sender: TObject);
begin
     if (Trim(pnTotalVenda.caption)='') then
        pnTotalVenda.caption:=form_nc(x_total_venda,10);
     if (x_saldo_venda=0.00) then
     begin
          x_saldo_venda := RetornaSaldoVenda;
          pnSaldoAPagar.caption:=form_nc(x_saldo_venda,10);
     end;
     RefrescaTabela;
     edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodFormaExit(Sender: TObject);
var
codigo: string;
begin
     codigo := Trim(edtCodForma.text);
     if (codigo<>'') then
     begin
          edtCodForma.text:=form_nz(strtofloat(codigo),2);
          pnForma.caption:=ProcuraNomeFormaPgto(strtofloat(codigo),self);
     end;
end;

procedure Tfrm_ConclueVenda.edtCodFormaDblClick(Sender: TObject);
begin
     ChamandoF8FormaPgto (edtCodForma,false);
end;

procedure Tfrm_ConclueVenda.Inserirforma1Click(Sender: TObject);
var
sequencia_ordem: integer;
clAux: TClassAuxiliar;
begin
     {CRITICA AOS DADOS}
     if (Trim(edtCodForma.text)='') then
     begin
          showmessage('Informe o código da forma de pgto!');
          edtCodForma.setfocus;
     end
     else if (Trim(edtValor.text)='') then
     begin
          showmessage('Informe o valor a ser pago!');
          edtValor.setfocus;
     end
     else if (Trim(edtCartao.text)='') and
             ((Trim(edtCodForma.text)='04') or (Trim(edtCodForma.text)='05'))then
     begin
          showmessage('Informe o número do cartão de crédito!');
          edtCartao.setfocus;
     end
     else if (Trim(pnSaldoAPagar.caption)='0,00') then
     begin
          showmessage('Não há saldo a pagar para esta venda!');
     end
     else
     begin
          {******}
          sequencia_ordem := ProximaOrdem(x_loja,x_caixa,x_venda);
          clAux := TClassAuxiliar.Create;
          clAux.conect ('CAIXA',self);
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO VENDAS_FORMA_PAGAMENTO       ');
          clAux.AddParam (' (VF_CAIX,VF_LOJA,VF_VEND,VF_FPGT,       ');
          clAux.AddParam ('  VF_ORDE,VF_VALO)                       ');
          clAux.AddParam ('VALUES                                   ');
          clAux.AddParam (' (:VF_CAIX,:VF_LOJA,:VF_VEND,:VF_FPGT,   ');
          clAux.AddParam ('  :VF_ORDE,:VF_VALO)                     ');
          clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
          clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
          clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
          clAux.consulta.parambyname('VF_FPGT').AsFloat   := strtofloat(Trim(edtCodForma.text));
          clAux.consulta.parambyname('VF_ORDE').AsInteger := sequencia_ordem;
          clAux.consulta.parambyname('VF_VALO').AsFloat   := strtofloat(RetiraFormatacaoNumero(Trim(edtValor.text)));
          clAux.Execute;
          clAux.desconect;
          clAux.Free;

          {****** - Cheque a vista}
          if (Trim(edtCodForma.text)='02') then
          begin
              clAux := TClassAuxiliar.Create;
              clAux.conect ('CAIXA',self);
              clAux.ClearSql;
              clAux.AddParam ('INSERT INTO CHEQUES                              ');
              clAux.AddParam (' (CH_CAIX,CH_LOJA,CH_VEND,CH_BANC,               ');
              clAux.AddParam ('  CH_NBAN,CH_AGEN,CH_CONT,CH_NUME,CH_ORDE)       ');
              clAux.AddParam ('VALUES                                           ');
              clAux.AddParam (' (:CH_CAIX,:CH_LOJA,:CH_VEND,:CH_BANC,           ');
              clAux.AddParam ('  :CH_NBAN,:CH_AGEN,:CH_CONT,:CH_NUME,:CH_ORDE)  ');
              clAux.consulta.parambyname('CH_LOJA').AsFloat   := x_loja;
              clAux.consulta.parambyname('CH_CAIX').AsFloat   := x_caixa;
              clAux.consulta.parambyname('CH_VEND').AsFloat   := x_venda;
              if (Trim(edtCodBanco.text)<>'') then
                 clAux.consulta.parambyname('CH_BANC').AsInteger  := strtoint(edtCodBanco.text);
              clAux.consulta.parambyname('CH_NBAN').AsString  := Trim(edtNomeBanco.text);
              clAux.consulta.parambyname('CH_AGEN').AsString  := Trim(edtAgencia.text);
              clAux.consulta.parambyname('CH_CONT').AsString  := Trim(edtConta.text);
              if (Trim(edtNumero.text)<>'') then
                 clAux.consulta.parambyname('CH_NUME').AsFloat := strtofloat(Trim(edtNumero.text));
              clAux.consulta.parambyname('CH_ORDE').AsInteger := sequencia_ordem;
              clAux.Execute;
              clAux.desconect;
              clAux.Free;
          end
          else {****** - Cartao de credito/debito automatico}
          if (Trim(edtCodForma.text)='04') or (Trim(edtCodForma.text)='05') then
          begin
              clAux := TClassAuxiliar.Create;
              clAux.conect ('CAIXA',self);
              clAux.ClearSql;
              clAux.AddParam ('INSERT INTO CARTOES                                      ');
              clAux.AddParam (' (CA_CAIX,CA_LOJA,CA_VEND,CA_NUME,CA_ORDE,CA_CADM)       ');
              clAux.AddParam ('VALUES                                                   ');
              clAux.AddParam (' (:CA_CAIX,:CA_LOJA,:CA_VEND,:CA_NUME,:CA_ORDE,:CA_CADM) ');
              clAux.consulta.parambyname('CA_LOJA').AsFloat   := x_loja;
              clAux.consulta.parambyname('CA_CAIX').AsFloat   := x_caixa;
              clAux.consulta.parambyname('CA_VEND').AsFloat   := x_venda;
              if (Trim(edtCodAdm.text)<>'') then
                 clAux.consulta.parambyname('CA_CADM').AsInteger  := strtoint(edtCodAdm.text);
              clAux.consulta.parambyname('CA_NUME').AsString  := Trim(edtCartao.text);
              clAux.consulta.parambyname('CA_ORDE').AsInteger := sequencia_ordem;
              clAux.Execute;
              clAux.desconect;
              clAux.Free;
          end
          else {****** - Dinheiro}
          if (Trim(edtCodForma.text)='01') then
          begin
              clAux := TClassAuxiliar.Create;
              clAux.conect ('CAIXA',self);
              clAux.ClearSql;
              clAux.AddParam ('INSERT INTO TROCOS                               ');
              clAux.AddParam (' (TR_CAIX,TR_LOJA,TR_VEND,TR_VALO,               ');
              clAux.AddParam ('  TR_ORDE)                                       ');
              clAux.AddParam ('VALUES                                           ');
              clAux.AddParam (' (:TR_CAIX,:TR_LOJA,:TR_VEND,:TR_VALO,           ');
              clAux.AddParam ('  :TR_ORDE)                                      ');
              clAux.consulta.parambyname('TR_LOJA').AsFloat   := x_loja;
              clAux.consulta.parambyname('TR_CAIX').AsFloat   := x_caixa;
              clAux.consulta.parambyname('TR_VEND').AsFloat   := x_venda;
              clAux.consulta.parambyname('TR_VALO').AsFloat := CalculaTroco;
              clAux.consulta.parambyname('TR_ORDE').AsInteger := sequencia_ordem;
              clAux.Execute;
              clAux.desconect;
              clAux.Free;
          end;

          {...}
          x_saldo_venda := RetornaSaldoVenda;
          pnSaldoAPagar.caption := form_nc(x_saldo_venda,10);
          Limparedits1.click;
          RefrescaTabela;
     end;
end;

function Tfrm_ConclueVenda.ProximaOrdem(loja,caixa,venda: real):integer;
var
clAux: TClassAuxiliar;
begin
     clAux := TClassAuxiliar.Create;
     clAux.conect ('CAIXA',self);
     clAux.ClearSql;
     clAux.AddParam ('SELECT MAX(VF_ORDE) as MAXIMA_ORDEM  ');
     clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO        ');
     clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
     clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
     clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
     clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
     clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
     clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
     clAux.Execute;
     result := clAux.result('MAXIMA_ORDEM') + 1;
     clAux.desconect;
     clAux.Free;
end;

procedure Tfrm_ConclueVenda.RefrescaTabela;
begin
     with (qFormas) do
     begin
          close;
          parambyname('caixa').AsFloat        := x_caixa;
          parambyname('loja').AsFloat         := x_loja;
          parambyname('codigo_venda').AsFloat := x_venda;
          open;
     end;
end;

function Tfrm_ConclueVenda.RetornaSaldoVenda:real;
var
dif: real;
clAux: TClassAuxiliar;
begin
     clAux := TClassAuxiliar.Create;
     clAux.conect ('CAIXA',self);
     clAux.ClearSql;
     clAux.AddParam ('SELECT SUM(VF_VALO) as TOTAL_PAGO    ');
     clAux.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO        ');
     clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND         ');
     clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND         ');
     clAux.AddParam ('      (VF_VEND=:VF_VEND)             ');
     clAux.consulta.parambyname('VF_LOJA').AsFloat   := x_loja;
     clAux.consulta.parambyname('VF_CAIX').AsFloat   := x_caixa;
     clAux.consulta.parambyname('VF_VEND').AsFloat   := x_venda;
     clAux.Execute;
     dif := x_total_venda - clAux.result('TOTAL_PAGO');
     if (dif<0) then result:=0.00
     else result := dif;
     clAux.desconect;
     clAux.Free;
end;

procedure Tfrm_ConclueVenda.FormCreate(Sender: TObject);
begin
     PageControl1.visible:=false;
     paginaCheque.tabvisible:=false;
     paginaDebitoCartao.tabvisible:=false;
     PaginaCrediario.tabvisible:=false;
     x_total_venda := 0.00;
     x_saldo_venda := 0.00;
end;

procedure Tfrm_ConclueVenda.Limparedits1Click(Sender: TObject);
begin
     edtCodForma.text := '';
     pnForma.caption  := '';
     edtValor.text    := '';
     PageControl1.visible:=false;
     paginaCheque.tabvisible:=false;
     paginaDebitoCartao.tabvisible:=false;
     PaginaCrediario.tabvisible:=false;
     edtCodForma.setfocus;
end;

procedure Tfrm_ConclueVenda.botao_sairClick(Sender: TObject);
begin
     SAIR1.click;
end;

procedure Tfrm_ConclueVenda.edtCodBancoEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNomeBancoEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNumeroEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtContaEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtAgenciaEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodBancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtNomeBanco.setfocus;
     if (key=K_CIMA) then edtValor.setfocus;
end;

procedure Tfrm_ConclueVenda.edtNomeBancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtAgencia.setfocus;
     if (key=K_CIMA) then edtCodBanco.setfocus;
end;

procedure Tfrm_ConclueVenda.edtAgenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtConta.setfocus;
     if (key=K_CIMA) then edtCpf.setfocus;
end;

procedure Tfrm_ConclueVenda.edtContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtNumero.setfocus;
     if (key=K_CIMA) then edtAgencia.setfocus;
end;

procedure Tfrm_ConclueVenda.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) then Inserirforma1.click;
     if (key=K_CIMA) then edtNome.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodAdmEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtCartao.setfocus;
     if (key=K_CIMA) then edtValor.setfocus;
     if (key=K_F8) then
     begin
         with (frm_f8Adm) do
         begin
           left:=287;
           top :=76;
           edit:=edtCodAdm;
           btnCadastro.visible:=false;
           showmodal;
           btnCadastro.visible:=true;
         end;
     end;
end;

procedure Tfrm_ConclueVenda.edtCartaoEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) then Inserirforma1.click;
     if (key=K_CIMA) then edtCodAdm.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCodAdmExit(Sender: TObject);
var
codigo: string;
begin
     codigo := Trim(edtCodAdm.text);
     if (codigo<>'') then
     begin
          pnAdm.caption := ProcuraNomeAdm(strtofloat(codigo),self);
          edtCodAdm.text := form_nz(strtofloat(codigo),3);          
     end;
end;

procedure Tfrm_ConclueVenda.edtCodAdmDblClick(Sender: TObject);
begin
     with (frm_f8Adm) do
     begin
       left:=287;
       top :=76;
       edit:=edtCodAdm;
       btnCadastro.visible:=false;
       showmodal;
       btnCadastro.visible:=true;
     end;
end;

procedure Tfrm_ConclueVenda.edtContratoEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtContrato.setfocus;
     if (key=K_CIMA) then edtValor.setfocus;
end;

procedure Tfrm_ConclueVenda.edtContratoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
clAux: TClassAuxiliar;
begin
     if (key=K_ENTER) then
     begin
          {Buscando a existencia do contrato de crediario ****}
          if (Trim(edtCliente.text)<>'') and
             (Trim(edtContrato.text)<>'') then
          begin
              clAux := TClassAuxiliar.Create;
              clAux.conect ('CREDITO',self);
              clAux.ClearSql;
              clAux.AddParam ('SELECT * FROM CRECTABR        ');
              clAux.AddParam ('WHERE (CR_CLIE=:cliente) AND  ');
              clAux.AddParam ('      (CR_CODI=:contrato)     ');
              clAux.consulta.parambyname('cliente').AsFloat  := strtofloat(Trim(edtCliente.text));
              clAux.consulta.parambyname('contrato').AsFloat := strtofloat(Trim(edtContrato.text));
              if (clAux.Execute) then
              begin
                   showmessage('Contrato existe! Venda OK!');
              end
              else
              begin
                   frm_principal.ChamandoClienteContrato (0,false);
              end;
              clAux.desconect;
              clAux.Free;
          end;
     end;
     if (key=K_CIMA) then edtCliente.setfocus;
end;

function Tfrm_ConclueVenda.CalculaTroco:real;
var
valor_pago: real;
begin
     if (Trim(edtValor.text)<>'') then
         valor_pago := strtofloat(Trim(edtValor.text))
     else valor_pago := 0.00;
     result := valor_pago - x_saldo_venda;
end;

procedure Tfrm_ConclueVenda.edtClienteEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
clAux: TClassAuxiliar;
begin
     if (key=K_F2) then edtCodForma.setfocus;
     if (key=K_DELETE) then
     begin
          if Application.MessageBox('Confirma exclusão do pagamento?','',4+32)=6 then
          begin
              clAux := TClassAuxiliar.Create;
              clAux.conect ('CAIXA',self);
              if (qFormas.fieldbyname('VF_FPGT').AsFloat=1) then {deletando o troco}
              begin
                   clAux.ClearSql;
                   clAux.AddParam ('DELETE FROM TROCOS            ');
                   clAux.AddParam ('WHERE (TR_LOJA=:TR_LOJA) AND  ');
                   clAux.AddParam ('      (TR_CAIX=:TR_CAIX) AND  ');
                   clAux.AddParam ('      (TR_VEND=:TR_VEND) AND  ');
                   clAux.AddParam ('      (TR_ORDE=:TR_ORDE)      ');
                   clAux.consulta.parambyname('TR_LOJA').AsFloat := x_loja;
                   clAux.consulta.parambyname('TR_CAIX').AsFloat := x_caixa;
                   clAux.consulta.parambyname('TR_VEND').AsFloat := x_venda;
                   clAux.consulta.parambyname('TR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
                   clAux.Execute;
              end
              else if (qFormas.fieldbyname('VF_FPGT').AsFloat=2) then {deletando o cheque}
              begin
                   clAux.ClearSql;
                   clAux.AddParam ('DELETE FROM CHEQUES           ');
                   clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
                   clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
                   clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
                   clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
                   clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
                   clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
                   clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
                   clAux.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
                   clAux.Execute;
              end
              else if (qFormas.fieldbyname('VF_FPGT').AsFloat=3) then {deletando o contrato do crediario ????}
              begin
                   {clAux.ClearSql;
                   clAux.AddParam ('DELETE FROM CHEQUES           ')
                   clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
                   clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
                   clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
                   clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
                   clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
                   clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
                   clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
                   clAux.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
                   clAux.Execute;}
              end
              else if (qFormas.fieldbyname('VF_FPGT').AsFloat=4) then {deletando cartao de credito}
              begin
                   clAux.ClearSql;
                   clAux.AddParam ('DELETE FROM CARTOES           ');
                   clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
                   clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
                   clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
                   clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
                   clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
                   clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
                   clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
                   clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
                   clAux.Execute;
              end
              else if (qFormas.fieldbyname('VF_FPGT').AsFloat=5) then {debito automatico}
              begin
                   clAux.ClearSql;
                   clAux.AddParam ('DELETE FROM CARTOES           ');
                   clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
                   clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
                   clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
                   clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
                   clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
                   clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
                   clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
                   clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
                   clAux.Execute;
              end;

              {*** Excluindo a forma de pagamento}
              clAux.ClearSql;
              clAux.AddParam ('DELETE FROM VENDAS_FORMA_PAGAMENTO  ');
              clAux.AddParam ('WHERE (VF_LOJA=:VF_LOJA) AND        ');
              clAux.AddParam ('      (VF_CAIX=:VF_CAIX) AND        ');
              clAux.AddParam ('      (VF_VEND=:VF_VEND) AND        ');
              clAux.AddParam ('      (VF_ORDE=:VF_ORDE)            ');
              clAux.consulta.parambyname('VF_LOJA').AsFloat := x_loja;
              clAux.consulta.parambyname('VF_CAIX').AsFloat := x_caixa;
              clAux.consulta.parambyname('VF_VEND').AsFloat := x_venda;
              clAux.consulta.parambyname('VF_ORDE').AsInteger :=
                  qFormas.fieldbyname('VF_ORDE').AsInteger;
              clAux.Execute;
              clAux.desconect;
              clAux.Free;
              RefrescaTabela;
              x_saldo_venda := RetornaSaldoVenda;
              pnSaldoAPagar.caption := form_nc(x_saldo_venda,10);
          end;
     end;
     if (key=K_ENTER) then
     begin
          clAux := TClassAuxiliar.Create;
          clAux.conect ('CAIXA',self);
          if (qFormas.fieldbyname('VF_FPGT').AsFloat=1) then {exibindo o troco}
          begin
               clAux.ClearSql;
               clAux.AddParam ('SELECT * FROM TROCOS          ');
               clAux.AddParam ('WHERE (TR_LOJA=:TR_LOJA) AND  ');
               clAux.AddParam ('      (TR_CAIX=:TR_CAIX) AND  ');
               clAux.AddParam ('      (TR_VEND=:TR_VEND) AND  ');
               clAux.AddParam ('      (TR_ORDE=:TR_ORDE)      ');
               clAux.consulta.parambyname('TR_LOJA').AsFloat := x_loja;
               clAux.consulta.parambyname('TR_CAIX').AsFloat := x_caixa;
               clAux.consulta.parambyname('TR_VEND').AsFloat := x_venda;
               clAux.consulta.parambyname('TR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
               clAux.Execute;
               frm_VerDadosPgto.Memo1.lines.clear;
               frm_VerDadosPgto.Memo1.lines.Add('  -- Dinheiro -------------------------------------------------------');
               frm_VerDadosPgto.Memo1.lines.Add(' Valor pago...: $ '+form_nc(qFormas.fieldbyname('VF_VALO').AsFloat,10));
               frm_VerDadosPgto.Memo1.lines.Add(' Valor troco..: $ '+form_nc(clAux.result('TR_VALO'),10));
               frm_VerDadosPgto.Memo1.lines.Add('  -------------------------------------------------------------------');
          end
          else if (qFormas.fieldbyname('VF_FPGT').AsFloat=2) then {exibindo o cheque}
          begin
               clAux.ClearSql;
               clAux.AddParam ('SELECT * FROM CHEQUES         ');
               clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
               clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
               clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
               clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
               clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
               clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
               clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
               clAux.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
               clAux.Execute;
               frm_VerDadosPgto.Memo1.lines.clear;
               frm_VerDadosPgto.Memo1.lines.Add(' --- Cheque à vista ------------------------------------------------');
               frm_VerDadosPgto.Memo1.lines.Add(' Cod/Banco......: '+form_n (clAux.result('CH_BANC'),3));
               frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
               frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
               frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
               frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
               frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
          end
          else if (qFormas.fieldbyname('VF_FPGT').AsFloat=4) then {exibindo cartao de credito}
          begin
               clAux.ClearSql;
               clAux.AddParam ('SELECT * FROM CARTOES         ');
               clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
               clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
               clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
               clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
               clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
               clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
               clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
               clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
               clAux.Execute;
               frm_VerDadosPgto.Memo1.lines.clear;
               frm_VerDadosPgto.Memo1.lines.Add(' --- Cartão de crédito ---------------------------------------------');
               frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
                    ProcuraNomeAdm(clAux.result('CA_CADM'),self));
               frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+form_n (clAux.result('CA_NUME'),10));
               frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
          end
          else if (qFormas.fieldbyname('VF_FPGT').AsFloat=5) then {exibindo dados do debito automatico}
          begin
               clAux.ClearSql;
               clAux.AddParam ('SELECT * FROM CARTOES         ');
               clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
               clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
               clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
               clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
               clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
               clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
               clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
               clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
               clAux.Execute;
               frm_VerDadosPgto.Memo1.lines.clear;
               frm_VerDadosPgto.Memo1.lines.Add(' --- Debito Automatico ---------------------------------------------');
               frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
                    ProcuraNomeAdm(clAux.result('CA_CADM'),self));
               frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+form_n (clAux.result('CA_NUME'),10));
               frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
          end;
          clAux.desconect;
          clAux.Free;
          frm_VerDadosPgto.showmodal;
     end;
end;

procedure Tfrm_ConclueVenda.gradeDblClick(Sender: TObject);
var
clAux: TClassAuxiliar;
begin
    clAux := TClassAuxiliar.Create;
    clAux.conect ('CAIXA',self);
    if (qFormas.fieldbyname('VF_FPGT').AsFloat=1) then {exibindo o troco}
    begin
         clAux.ClearSql;
         clAux.AddParam ('SELECT * FROM TROCOS          ');
         clAux.AddParam ('WHERE (TR_LOJA=:TR_LOJA) AND  ');
         clAux.AddParam ('      (TR_CAIX=:TR_CAIX) AND  ');
         clAux.AddParam ('      (TR_VEND=:TR_VEND) AND  ');
         clAux.AddParam ('      (TR_ORDE=:TR_ORDE)      ');
         clAux.consulta.parambyname('TR_LOJA').AsFloat := x_loja;
         clAux.consulta.parambyname('TR_CAIX').AsFloat := x_caixa;
         clAux.consulta.parambyname('TR_VEND').AsFloat := x_venda;
         clAux.consulta.parambyname('TR_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
         clAux.Execute;
         frm_VerDadosPgto.Memo1.lines.clear;
         frm_VerDadosPgto.Memo1.lines.Add('  -- Dinheiro -------------------------------------------------------');
         frm_VerDadosPgto.Memo1.lines.Add(' Valor pago...: $ '+form_nc(qFormas.fieldbyname('VF_VALO').AsFloat,10));
         frm_VerDadosPgto.Memo1.lines.Add(' Valor troco..: $ '+form_nc(clAux.result('TR_VALO'),10));
         frm_VerDadosPgto.Memo1.lines.Add('  -------------------------------------------------------------------');
    end
    else if (qFormas.fieldbyname('VF_FPGT').AsFloat=2) then {exibindo o cheque}
    begin
         clAux.ClearSql;
         clAux.AddParam ('SELECT * FROM CHEQUES         ');
         clAux.AddParam ('WHERE (CH_LOJA=:CH_LOJA) AND  ');
         clAux.AddParam ('      (CH_CAIX=:CH_CAIX) AND  ');
         clAux.AddParam ('      (CH_VEND=:CH_VEND) AND  ');
         clAux.AddParam ('      (CH_ORDE=:CH_ORDE)      ');
         clAux.consulta.parambyname('CH_LOJA').AsFloat := x_loja;
         clAux.consulta.parambyname('CH_CAIX').AsFloat := x_caixa;
         clAux.consulta.parambyname('CH_VEND').AsFloat := x_venda;
         clAux.consulta.parambyname('CH_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
         clAux.Execute;
         frm_VerDadosPgto.Memo1.lines.clear;
         frm_VerDadosPgto.Memo1.lines.Add(' --- Cheque à vista ------------------------------------------------');
         frm_VerDadosPgto.Memo1.lines.Add(' Cod/Banco......: '+form_n (clAux.result('CH_BANC'),3));
         frm_VerDadosPgto.Memo1.lines.Add(' Nome banco.....: '+form_t (clAux.result('CH_NBAN'),30));
         frm_VerDadosPgto.Memo1.lines.Add(' Agência........: '+form_t (clAux.result('CH_AGEN'),10));
         frm_VerDadosPgto.Memo1.lines.Add(' Conta/Corrente.: '+form_t (clAux.result('CH_CONT'),20));
         frm_VerDadosPgto.Memo1.lines.Add(' Número cheque..: '+form_n (clAux.result('CH_NUME'),10));
         frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end
    else if (qFormas.fieldbyname('VF_FPGT').AsFloat=4) then {exibindo cartao de credito}
    begin
         clAux.ClearSql;
         clAux.AddParam ('SELECT * FROM CARTOES         ');
         clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
         clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
         clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
         clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
         clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
         clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
         clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
         clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
         clAux.Execute;
         frm_VerDadosPgto.Memo1.lines.clear;
         frm_VerDadosPgto.Memo1.lines.Add(' --- Cartão de crédito ---------------------------------------------');
         frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
              ProcuraNomeAdm(clAux.result('CA_CADM'),self));
         frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+form_n (clAux.result('CA_NUME'),10));
         frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end
    else if (qFormas.fieldbyname('VF_FPGT').AsFloat=5) then {exibindo dados do debito automatico}
    begin
         clAux.ClearSql;
         clAux.AddParam ('SELECT * FROM CARTOES         ');
         clAux.AddParam ('WHERE (CA_LOJA=:CA_LOJA) AND  ');
         clAux.AddParam ('      (CA_CAIX=:CA_CAIX) AND  ');
         clAux.AddParam ('      (CA_VEND=:CA_VEND) AND  ');
         clAux.AddParam ('      (CA_ORDE=:CA_ORDE)      ');
         clAux.consulta.parambyname('CA_LOJA').AsFloat := x_loja;
         clAux.consulta.parambyname('CA_CAIX').AsFloat := x_caixa;
         clAux.consulta.parambyname('CA_VEND').AsFloat := x_venda;
         clAux.consulta.parambyname('CA_ORDE').AsInteger := qFormas.fieldbyname('VF_ORDE').AsInteger;
         clAux.Execute;
         frm_VerDadosPgto.Memo1.lines.clear;
         frm_VerDadosPgto.Memo1.lines.Add(' --- Debito Automatico ---------------------------------------------');
         frm_VerDadosPgto.Memo1.lines.Add(' Administradora.: '+form_nz(clAux.result('CA_CADM'),3)+'-'+
              ProcuraNomeAdm(clAux.result('CA_CADM'),self));
         frm_VerDadosPgto.Memo1.lines.Add(' N. do cartão...: '+form_n (clAux.result('CA_NUME'),10));
         frm_VerDadosPgto.Memo1.lines.Add(' -------------------------------------------------------------------');
    end;
    clAux.desconect;
    clAux.Free;
    frm_VerDadosPgto.showmodal;
end;

procedure Tfrm_ConclueVenda.edtSerieEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtNotaEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

procedure Tfrm_ConclueVenda.edtSerieKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtNota.setfocus;
     if (key=K_CIMA) then ;
end;

procedure Tfrm_ConclueVenda.edtNotaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtCodForma.setfocus;
     if (key=K_CIMA) then edtSerie.setfocus;
end;

procedure Tfrm_ConclueVenda.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (key=K_ENTER) or (key=K_BAIXO) then edtAgencia.setfocus;
     if (key=K_CIMA) then edtNomeBanco.setfocus;
end;

procedure Tfrm_ConclueVenda.edtNomeEnter(Sender: TObject);
begin
     TMaskEdit(sender).selectall;
end;

end.
