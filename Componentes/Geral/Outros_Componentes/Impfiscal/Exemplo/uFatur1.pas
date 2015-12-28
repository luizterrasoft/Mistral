unit uFatur1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RXCtrls, RxLookup, ComCtrls, Grids, DBGrids, StdCtrls, Mask,
  ToolEdit, CurrEdit, DBCtrls, ExtCtrls, RXDBCtrl, DosMove, Bde, Shellapi, PrgFiscal;

type
  TFormCupomFiscal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btnRegistra: TButton;
    btnNaoRegistra: TButton;
    btnCancelaUltimoItem: TButton;
    ItemsGrid: TDBGrid;
    Panel1: TPanel;
    btnAbrirCupomFiscal: TButton;
    btnCancelaUltimoCupom: TButton;
    btnFechamento: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Panel2: TPanel;
    NumeroCupom: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Button6: TButton;
    btnFecharCupom: TButton;
    GroupBox2: TGroupBox;
    RadioGroup1: TRadioGroup;
    Panel4: TPanel;
    Mensagem: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    btnLeituraX: TButton;
    btnReducaoZ: TButton;
    RadioGroup2: TRadioGroup;
    btnMemFiscal: TButton;
    EntreDatas: TCheckBox;
    EntreReducoes: TCheckBox;
    btnDadosConsumidor: TButton;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    LabelCancel: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    SaidaCheckBox: TCheckBox;
    Button7: TButton;
    Button13: TButton;
    DescontoItem: TDBEdit;
    ValorPago: TDBEdit;
    DBEdit8: TDBEdit;
    Acrescimo: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label10: TLabel;
    Button14: TButton;
    Data1: TMaskEdit;
    Data2: TMaskEdit;
    Troco: TCurrencyEdit;
    Label11: TLabel;
    Red1: TCurrencyEdit;
    Red2: TCurrencyEdit;
    Label12: TLabel;
    TotalGeral: TCurrencyEdit;
    Label14: TLabel;
    DescAdicional: TDBEdit;
    Label16: TLabel;
    UnitarioEdit: TDBEdit;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    QuantidadeEdit: TDBEdit;
    Label13: TLabel;
    ProdutosLookup: TDBLookupComboBox;
    Label18: TLabel;
    PrgFiscal1: TPrgFiscal;
    Label21: TLabel;
    ComboBox1: TComboBox;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Button16: TButton;
    procedure btnAbrirCupomFiscalClick(Sender: TObject);
    procedure ProdutosLookUpEnter(Sender: TObject);
    procedure ProdutosLookUpExit(Sender: TObject);
    procedure btnRegistraClick(Sender: TObject);
    procedure PrgFiscal1Error(ErrorCode: Integer; MsgError: string);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFechamentoClick(Sender: TObject);
    procedure btnFecharCupomClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ValorPagoExit(Sender: TObject);
    procedure btnDadosConsumidorClick(Sender: TObject);
    procedure btnCancelaUltimoItemClick(Sender: TObject);
    procedure btnLeituraXClick(Sender: TObject);
    procedure btnReducaoZClick(Sender: TObject);
    procedure btnMemFiscalClick(Sender: TObject);
    procedure EntreDatasClick(Sender: TObject);
    procedure EntreReducoesClick(Sender: TObject);
    function LimitaTamanho(Cabecalho, Texto: string; Tamanho: integer): string;
    procedure Button1Click(Sender: TObject);
    procedure btnCancelaUltimoCupomClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure btnNaoRegistraClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure MudapathAlias(const Alias, Path : String);
    function AtualizaVariaveis():Boolean;
    procedure Button16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fNumeroCupom, ValPg1: double;
    nError: integer;
    Trc, Tot, Un, Acr, Desc, ValPg, Quant, Sub : Double;
    Uni, Acri, Desci, ValPgi, Quanti : Integer;
    CodigoProd, DescricaoProd, Tributo, UnidadeProd : String;
    ValorUnitProd, QuantidadeProd, AcrescimoProd, DescontoProd, ValorPagoProd,
    ValorTotalsemDescAcr : Double;
  end;


var
  FormCupomFiscal: TFormCupomFiscal;
  Aliquotas: TAliquota; // array para armazenar as aliquotas
  ProdutoEscolhido: double;


implementation

uses dmCF,  uConsumidor, uFatur5, uFatur6, uCupom1;

{$R *.DFM}



procedure TFormCupomFiscal.btnAbrirCupomFiscalClick(Sender: TObject);
var
  vNumCupom: integer;
  sNumCupom: string;
  DataMovimento: string;
  fControle: double;
begin
{ Abrindo o cupom fiscal e inserindo um novo registro em notas
  Antes de abrir o cupom fiscal, checar a data do movimento do ECF
}

//  DataMovimento := Form1.PrgFiscal1.ReturnVar(23);
//  DataMoVimento := Copy(DataMovimento, 1, 2) + '/' +
//    Copy(DataMovimento, 3, 2) + '/' + Copy(DataMovimento, 5, 2);
//  if StrToDate(DataMovimento) <> date then
//  begin
//    MessageDlg('O ECF indica ' + DataMovimento + ' e o computador indica ' +
//      DateToStr(date) + '. Não é recomendável continuar. Favor acertar as datas!'
//      , mtWarning, [mbOk], 0);
//    Exit;
//  end;

  PageControl1.ActivePage := TabSheet1;
  PrgFiscal1.AbreCuponFisc;
  if PrgFiscal1.Executed then
  begin
    vNumCupom := PrgFiscal1.NumSeqCupFisc;
    fNumeroCupom := vNumCupom;
    sNumCupom := IntToStr(vNumCupom);
    while length(sNumCupom) < 6 do sNumCupom := '0' + sNumCupom;
    NumeroCupom.Caption := sNumCupom;
    dmCupom.Notas.Insert;
  end
  else
  begin
  // verificar se existe um cupom aberto
    if nError = 10 then
    begin
      vNumCupom := PrgFiscal1.NumSeqCupFisc;
      fNumeroCupom := vNumCupom;
      sNumCupom := IntToStr(vNumCupom);
      while length(sNumCupom) < 6 do sNumCupom := '0' + sNumCupom;
      NumeroCupom.Caption := sNumCupom;
      dmCupom.Notas.IndexName := 'byControleNumeroSerie';
      // tentar o último controle usado
      dmCupom.Controle.Open;
      fControle := dmCupom.ControleProximoControle.Value - 1;
      dmCupom.Controle.Close;
      if dmCupom.Notas.FindKey([fControle, fNumeroCupom, 'CF']) = False then
        showmessage('Não existe o cupom ' + sNumCupom) else QuantidadeEdit.SetFocus;
    end;
  end;
end;

procedure TFormCupomFiscal.ProdutosLookUpEnter(Sender: TObject);
begin
  if ProdutosLookUp.Text = '' then
    ProdutosLookUp.DropDown;
end;

procedure TFormCupomFiscal.ProdutosLookUpExit(Sender: TObject);
begin
 // o produto foi escolhido
  if dmCupom.Items.State <> dsInsert then
    dmCupom.Items.Insert;
  dmCupom.ItemsCodProduto.Value := dmCupom.ProdutosCodProduto.Value;
  ItemsGrid.Refresh;
end;

procedure TFormCupomFiscal.btnRegistraClick(Sender: TObject);
var
  oItem: TItem;
  i: integer;
  vAliq, DescricaoOriginal, DescricaoAumentada, UnidadeDoItem: string;
begin
  Uni := Length(UnitarioEdit.Text);
  Acri := Length(Acrescimo.Text);
  Desci := Length(DescAdicional.Text);
  ValPgi := Length(DBEdit8.Text);
  Quanti := Length(QuantidadeEdit.Text);
  Un := StrToFloat(Copy(UnitarioEdit.Text,3,Uni-1));
  Acr := StrToFloat(Copy(Acrescimo.Text,1,Acri));
  Desc := StrToFloat(Copy(DescAdicional.Text,3,Desci-1));
  ValPg := StrToFloat(Copy(DBEdit8.Text,3,ValPgi-1));
  Quant := StrToFloat(Copy(QuantidadeEdit.Text,1,Quanti));
  ValPg1 := ValPg;

  // validar a quantidade
  if StrToFloat(QuantidadeEdit.Text) <= 0 then
  begin
    MessageDlg('Quantidade inválida. Verifique!', mtWarning, [mbOK], 0);
    dmCupom.Items.Cancel;
    QuantidadeEdit.SetFocus;
    Exit;
  end;

  // validar o preço unitário
  if Un <= 0 then
  begin
    MessageDlg('Preço Unitário inválido. Verifique!', mtWarning, [mbOK], 0);
    dmCupom.Items.Cancel;
    UnitarioEdit.SetFocus;
    Exit;
  end;

  // validar o desconto por item
  if DescontoProd >= StrToFloat(QuantidadeEdit.Text) * Un then
  begin
    MessageDlg('Desconto superior ao valor da venda. Verifique!', mtWarning, [mbOK], 0);
    dmCupom.Items.Cancel;
    QuantidadeEdit.SetFocus;
    Exit;
  end;

  // incluir o produto vendido na tabela de itens do Cupom
//  dmCupom.Items.Insert;
//  dmCupom.Items.Post;
//  dbiSaveChanges(dmCupom.Items.Handle);
//  dmCupom.Items.Refresh;

  // prepara o objeto Item para enviar ao ECF
  dmCupom.Items.FindKey([dmCupom.ItemsControle, dmCupom.ItemsNumeroItem]);
  dmCupom.Produtos.FindKey([dmCupom.ItemsCodProduto]);
  UnidadeDoItem := dmCupom.ProdutosUnidade.Value;
  DescricaoOriginal := dmCupom.ProdutosDescricao.Value;
//  oItem.Codigo := FormatFloat('#############', dmCupom.ItemsCodProduto.Value);
//  oItem.Descricao := dmCupom.ItemsProduto.Value;
//  while length(oItem.Descricao) < 29 do
//    oItem.Descricao := oItem.Descricao + ' ';
  oItem.Tributo := '';
  if dmCupom.ItemsTributo.Value = 'Tributado' then
  begin
    for i := 1 to 16 do
    begin
      if Aliquotas[i] = dmCupom.ItemsAliquotaFiscal.Value then
      begin
        vAliq := IntToStr(i);
        while length(vAliq) < 2 do vAliq := '0' + vAliq;
        oItem.Tributo := vAliq;
        break;
      end;
    end;
  end;

  AtualizaVariaveis;

   // incluir o produto vendido na tabela de itens do Cupom
   dmCupom.Items.Insert;
   dmCupom.Items.Post;
   dbiSaveChanges(dmCupom.Items.Handle);
   dmCupom.Items.Refresh;

  if ( PrgFiscal1.ECFModel = teBematech ) or ( PrgFiscal1.ECFModel = teBematechII ) then begin
   if dmCupom.ItemsTributo.Value = 'Isento' then oItem.Tributo := 'II';
   if dmCupom.ItemsTributo.Value = 'Subs. Tributária' then oItem.Tributo := 'FF';
   if dmCupom.ItemsTributo.Value = 'Não Incidente' then oItem.Tributo := 'NN';
   if dmCupom.ItemsTributo.Value = 'Não Sujeito ao ICMS 1' then oItem.Tributo := '#1';
   if oItem.Tributo = '' then
   begin
     MessageDlg('Aliquota deste produto não cadastrada na Impressora Fiscal',
       mtWarning, [mbOK], 0);
//     dmCupom.Items.Delete;
//     Exit;
   end;
  end;

  oItem.Codigo     := CodigoProd;
  oItem.Descricao  := DescricaoProd;
  while length(oItem.Descricao) < 29 do begin
    oItem.Descricao := oItem.Descricao + ' ';
  end;
  oItem.Tributo    := 'FF';
  oItem.Quantidade := QuantidadeProd;
  oItem.ValorUnit  := ValorUnitProd;
  oItem.Desconto   := DescontoProd;
  oItem.ValorPago  := ValorPagoProd;
  oItem.Unidade    := UnidadeProd;

  MessageDlg('Codigo: '+CodigoProd, mtInformation,[mbOk],0);
  MessageDlg('Descricao: '+DescricaoProd, mtInformation,[mbOk],0);
  MessageDlg('Tributo: '+oItem.Tributo, mtInformation,[mbOk],0);
  MessageDlg('Quantidade: '+FloatToStr(QuantidadeProd), mtInformation,[mbOk],0);
  MessageDlg('Valor unitario: '+FloatToStr(ValorUnitProd), mtInformation,[mbOk],0);
  MessageDlg('Desconto: '+FloatToStr(DescontoProd), mtInformation,[mbOk],0);
  MessageDlg('Valor pago: '+FloatToStr(ValorPagoProd), mtInformation,[mbOk],0);


  //imprime item no ECF -  A Descricao será aumentada
  if ( PrgFiscal1.ECFModel <> teZanthusIZs_e_Qz ) then begin
   DescricaoAumentada := LimitaTamanho('',DescricaoOriginal,60) + UnidadeDoItem;
   PrgFiscal1.AumentaDescrItem(DescricaoAumentada);
  end;
   PrgFiscal1.VendaItemFisc(oItem, fdValor, 2);
   QuantidadeEdit.Text := FloatToStr(QuantidadeProd);
   QuantidadeEdit.SetFocus;

end;

procedure TFormCupomFiscal.PrgFiscal1Error(ErrorCode: Integer;
  MsgError: string);
begin
  nError := ErrorCode;
  MessageDlg(MsgError, mtWarning, [mbOK], 0);
end;

procedure TFormCupomFiscal.FormCreate(Sender: TObject);
begin
  MudapathAlias('SupFiscal', ExtractFilepath(Application.ExeName)+'dados');
end;

procedure TFormCupomFiscal.FormShow(Sender: TObject);
var
  DataMovimento: string;
  HoraECF, HoraDif: string;
begin

//  if ( PrgFiscal1.ECFModel <> teZanthusIZs_e_Qz ) then begin
//   PrgFiscal1.IniciaDia('','','');
//  end;

  ComboBox1.SetFocus;
end;


procedure TFormCupomFiscal.btnFechamentoClick(Sender: TObject);
begin
  //muda para a página Dados do Fechamento
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFormCupomFiscal.btnFecharCupomClick(Sender: TObject);
var
  FormaDePagamento: string;
  TextoFechamento: string;
  Linha0, Linha1, Linha2, Linha3: string[48];
  Linha4, Linha5, Linha6, Linha7: string[48];
  vAcDesc: double;
  vAD: char;
  subTotal: currency;
begin
  if ValPg = 0 then
  begin
    MessageDlg('Você deve informar o valor pago!',
      mtWarning, [mbOK], 0);
    ValorPago.SetFocus;
    Exit;
  end;

  // verificar se o sub-total do ECF é igual ao ValorTotal do Formulário
  subTotal := PrgFiscal1.LeitVlrSTotIt;
  if subTotal - ValPg <> 0 then
    MessageDlg('O sub-total acumulado pelo ECF não coincide com o valor calculado',
      mtWarning, [mbOK], 0);

  Linha1 := ''; Linha2 := ''; Linha3 := ''; Linha4 := ''; Linha5 := ''; Linha6 := ''; Linha7 := '';
  //envia dados para o Fechamento do Cupom Fiscal

{ inicia o fechamento do cupom fiscal, informando o valor
do acréscimo ou desconto}
  if Desc <> 0 then
  begin
    vAcDesc := Desc;
    vAD := 'd';
  end
  else
  begin
    if Acr <> 0 then
    begin
      vAcDesc := Acr;
      vAD := 'a';
    end
    else
    begin
      vAcDesc := 0;
      vAD := 'a';
    end;
  end;
  PrgFiscal1.IniFechCupfisc(vAcDesc, vAD, '*','');
  if CheckBox1.Checked then FormaDePagamento := 'Dinheiro';
  if CheckBox2.Checked then FormaDePagamento := 'Cheque';
  if CheckBox3.Checked then FormaDePagamento := 'Cheque Pré-Datado';

  PrgFiscal1.EfetFormPag(ValPg, FormaDePagamento, FormaDePagamento, 's');
    // Inicializa as linhas de Texto do Fechamento
  Linha0 := LimitaTamanho(' ', dmCupom.ParametrosMsgPromocional.Value, 48);
  if (DadosConsumidorForm.Edit1.Text <> '') and
    (DBLookUpComboBox2.Text = '') then
  begin
    Linha1 := LimitaTamanho('Nome: ', DadosConsumidorForm.Edit1.Text, 48);
    Linha2 := LimitaTamanho('Endereco: ', DadosConsumidorForm.Edit2.Text, 48);
    Linha3 := LimitaTamanho('Cidade: ', DadosConsumidorForm.Edit3.Text, 40);
    Linha4 := LimitaTamanho('UF: ', DadosConsumidorForm.Edit4.Text, 8);
    Linha5 := LimitaTamanho('CNPJ: ', DadosConsumidorForm.Edit5.Text, 24);
    Linha6 := LimitaTamanho('Inscr.: ', DadosConsumidorForm.Edit6.Text, 24);
    Linha7 := LimitaTamanho(' ', '-------------------------------------------------------', 48); Linha7 := LimitaTamanho('**', 'Obrigado. Volte Sempre', 48);
  end;
  if DBLookUpComboBox2.Text <> '' then
  begin
    dmCupom.Clientes.FindKey([dmCupom.NotasCodCliente]);
    Linha1 := LimitaTamanho('Nome: ', dmCupom.ClientesNome.Value, 48);
    Linha2 := LimitaTamanho('Endereco: ', dmCupom.ClientesEndereco.Value, 48);
    Linha3 := LimitaTamanho('Cidade: ', dmCupom.ClientesMunicipio.Value, 40);
    Linha4 := LimitaTamanho('UF: ', dmCupom.ClientesUF.Value, 8);
    Linha5 := LimitaTamanho('CNPJ: ', dmCupom.ClientesCNPJ.Value, 24);
    Linha6 := LimitaTamanho('Inscr.: ', dmCupom.ClientesIE.Value, 24);
    Linha7 := LimitaTamanho(' ', '-------------------------------------------------------', 48);
  end;
  TextoFechamento := Linha1 + Linha2 + Linha3 + Linha4 + Linha5 + Linha6 + Linha7 + Linha0;
  PrgFiscal1.TermFechCupFisc(TextoFechamento);
  Linha1 := ''; Linha2 := ''; Linha3 := ''; Linha4 := ''; Linha5 := ''; Linha6 := ''; Linha7 := '';
  if Desc <> 0 then
    dmCupom.NotasDesconto.Value := Desc;
  dmCupom.Notas.Post;
  dbiSaveChanges(dmCupom.Notas.Handle); // grava na tabela
  dmCupom.Notas.Refresh;
  DescAdicional.text := FloatToStr(0);
  Acrescimo.text := FloatToStr(0);
  ValorPago.text := FloatToStr(0);
  Troco.text := FloatToStr(0);
  TotalGeral.text := FloatToStr(0);
  PageControl1.ActivePage := TabSheet1;
  btnAbrirCupomFiscal.SetFocus;
end;


procedure TFormCupomFiscal.Button6Click(Sender: TObject);
begin
  PrgFiscal1.FinalizaDia('','','');
  Application.Terminate;
end;

procedure TFormCupomFiscal.ValorPagoExit(Sender: TObject);
begin
  Troco.text := FloatToStr(StrToFloat(ValorPago.text) - StrToFloat(TotalGeral.text) + StrToFloat(DescAdicional.text) -
    StrToFloat(Acrescimo.text));
end;

procedure TFormCupomFiscal.btnDadosConsumidorClick(Sender: TObject);
begin
  DadosConsumidorForm.ShowModal;
end;

procedure TFormCupomFiscal.btnCancelaUltimoItemClick(Sender: TObject);
var
 ultimate : integer;
begin
  if MessageDlg('Confirma o Cancelamento do último produto registrado?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ultimate := dmcupom.Items.RecNo;
    PrgFiscal1.CancItemAnter(ultimate);
    if PrgFiscal1.Executed then
    begin
      dmCupom.Items.Delete;
      ProdutosLookUp.SetFocus;
    end
    else
      ProdutosLookUp.SetFocus;
  end
  else Exit;
end;

procedure TFormCupomFiscal.btnLeituraXClick(Sender: TObject);
begin
  PrgFiscal1.EmiteLeituraX;
end;

procedure TFormCupomFiscal.btnReducaoZClick(Sender: TObject);
var
  Retorno, Hora: string;
begin
 // verificar o horário antes da Redução Z
 // DDMMAAHHMMSS
  Retorno := PrgFiscal1.ReturnVar(23);
  Hora := Copy(Retorno, 7, 2) + ':' + Copy(Retorno, 9, 2);
  if MessageDlg('Atenção: são ' + Hora + '!. Caso A redução Z seja emitida, ' +
    'o ECF ficará bloqueado até às 23:59 horas' +
    'Confirma a Redução Z?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    PrgFiscal1.EmiteReducaoZ else Exit;
end;

procedure TFormCupomFiscal.btnMemFiscalClick(Sender: TObject);
var
  saida: char;
  SaidaMP20FI, ArqUsuario: TextFile;
  linha: string;
begin
  //Leitura da memória Fiscal por datas ou reduções
  if SaidaCheckBox.Checked then saida := 'R' else saida := 'I';
  if (EntreDatas.Checked = False) and (EntreReducoes.Checked = False) then
  begin
    MessageDlg('Informe se a leitura será feita por datas ou pelo número das reduções Z',
    mtWarning,[mbOK], 0);
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  if EntreDatas.Checked = True then
    PrgFiscal1.LeitMemFiscal(Data1.Text, Data2.Text, mfData, saida);

  if EntreReducoes.Checked = True then
    PrgFiscal1.LeitMemFiscal(Red1.text, Red2.text, mfRed, saida);

  if (saida = 'R') and (PrgFiscal1.Executed = True) then
  begin
    AssignFile(SaidaMP20FI, 'MP20FI.RET');
    Reset(SaidaMP20FI);
    AssignFile(ArqUsuario, 'Leitura.txt');
    Rewrite(ArqUsuario);
    try
      while not EOF(SaidaMP20FI) do
      begin
        Readln(SaidaMP20FI, linha);
        Writeln(ArqUsuario, linha);
      end;
    finally
      CloseFile(ArqUsuario);
      CloseFile(SaidaMP20FI);
    end;
  ShellExecute(0,Nil,PChar('Leitura.txt'),Nil,Nil,SW_NORMAL);
  end;
  Screen.Cursor := crDefault;
end;

procedure TFormCupomFiscal.EntreDatasClick(Sender: TObject);
begin
  if (EntreDatas.Checked = True) then
  begin
    Data1.Visible := True;
    Data2.Visible := True;
    EntreReducoes.Checked := False;
    Red1.Visible := False;
    Red2.Visible := False;
    Data1.SetFocus;
  end;
end;

procedure TFormCupomFiscal.EntreReducoesClick(Sender: TObject);
begin
  if (EntreReducoes.Checked = True) then
  begin
    Red1.Visible := True;
    Red2.Visible := True;
    EntreDatas.Checked := False;
    Data1.Visible := False;
    Data2.Visible := False;
    Red1.SetFocus;
  end;
end;

function TFormCupomFiscal.LimitaTamanho(Cabecalho, Texto: string; Tamanho: integer): string;
begin
  Result := Copy(Texto, 1, Tamanho - Length(cabecalho));
  Result := Cabecalho + Result;
  while length(Result) < Tamanho do Result := Result + ' ';
end;

procedure TFormCupomFiscal.Button1Click(Sender: TObject);
begin
 { comando para Terminar o fechamento no caso de erro do
  componente: ele não encontra o arquivo de retorno da dll}
  PrgFiscal1.TermFechCupFisc('*** Obrigado! Volte Sempre ***');

end;

procedure TFormCupomFiscal.btnCancelaUltimoCupomClick(Sender: TObject);
begin
  if MessageDlg('Cancelar o último Cupom Fiscal Emitido ou em Emissão?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    PrgFiscal1.CanUltCupFisc;
    if PrgFiscal1.Executed then // cupom cancelado
    begin
      dmCupom.Notas.Last; // posiciona no último cupom
      with dmCupom.Items do
      begin
        First;
        while not EOF do
        begin
          dmCupom.Items.Delete;
          dmCupom.Items.Next;
        end;
      end;
      if (dmCupom.Notas.State <> dsInsert) or (dmCupom.Notas.State <> dsEdit) then
        dmCupom.Notas.Edit;
      dmCupom.NotasBaseICMS.Value := 0;
      dmCupom.NotasValorICMS.Value := 0;
      dmCupom.NotasValorProdutos.Value := 0;
      dmCupom.NotasDesconto.Value := 0;
      dmCupom.NotasValorNota.Value := 0;
      dmCupom.NotasCodCliente.AsString := '';
      dmCupom.NotasOBS1.Value := '99'; // cancelado
    end;
  end;
end;

procedure TFormCupomFiscal.DBEdit1Change(Sender: TObject);
begin
  if dmCupom.NotasOBS1.Value = '99' then
    LabelCancel.Visible := True else LabelCancel.Visible := False;
end;

procedure TFormCupomFiscal.btnNaoRegistraClick(Sender: TObject);
begin
  //elimina o último item da grade de itens
  dmCupom.Items.Last;
  dmCupom.Items.Delete;
end;

procedure TFormCupomFiscal.Button3Click(Sender: TObject);
begin
  if MessageDlg('Confirma Entrada/Saída do Horário de Verão?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
    PrgFiscal1.MudaHoraVerao('S');
end;

procedure TFormCupomFiscal.Button2Click(Sender: TObject);
begin
  if MessageDlg('Confirma Truncamento das Operações matemáticas?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
    PrgFiscal1.TruncArredonda('0');

end;

procedure TFormCupomFiscal.Button4Click(Sender: TObject);
begin
  if MessageDlg('Confirma Arredondamento das Operações matemáticas?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
    PrgFiscal1.TruncArredonda('1');

end;

procedure TFormCupomFiscal.Button5Click(Sender: TObject);
begin
  FormTotais := TFormTotais.Create(Self);
  FormTotais.ShowModal;
end;

procedure TFormCupomFiscal.Button7Click(Sender: TObject);
begin
  FormAliquotas := TFormAliquotas.Create(Self);
  FormAliquotas.ShowModal;
end;

procedure TFormCupomFiscal.Button13Click(Sender: TObject);
begin
 // Leitura X em Arquivo

end;

procedure TFormCupomFiscal.Button14Click(Sender: TObject);
begin
 PrgFiscal1.CadAliqTribut(12);
end;


procedure TFormCupomFiscal.DBEdit8Exit(Sender: TObject);
var
 Trc, Tot, Un, Acr, Desc, ValPg, Quant, Sub : Double;
 Uni, Acri, Desci, ValPgi, Quanti : Integer;
begin
 Trc   := 0;
 Tot   := 0;
 Un    := 0;
 Acr   := 0;
 Desc  := 0;
 ValPg := 0;
 Quant := 0;
 Sub   := 0;
 Uni   := 0;
 Acri  := 0;
 Desci := 0;
 ValPgi:= 0;
 Quanti := 0;
 Uni := Length(UnitarioEdit.Text);
 Acri := Length(Acrescimo.Text);
 Desci := Length(DescAdicional.Text);
 ValPgi := Length(DBEdit8.Text);
 Quanti := Length(QuantidadeEdit.Text);
 Un := StrToFloat(Copy(UnitarioEdit.Text,3,Uni-1));
 Acr := StrToFloat(Copy(Acrescimo.Text,1,Acri));
 Desc := StrToFloat(Copy(DescAdicional.Text,3,Desci-1));
 ValPg := StrToFloat(Copy(DBEdit8.Text,3,ValPgi-1));
 Quant := StrToFloat(Copy(QuantidadeEdit.Text,1,Quanti));
 Sub := Un * Quant;
 Trc := Sub * Acr / 100 + Sub - Desc;
 Tot := Trc;
 Trc := ValPg - Trc;
 Troco.Text := FloatToStr(Trc);
 TotalGeral.Value := Tot;

end;

procedure TFormCupomFiscal.ComboBox1Change(Sender: TObject);
var
 res : Boolean;
 DataMovimento: string;
 HoraECF, HoraDif: string;
begin
 case ComboBox1.ItemIndex of
 0:
   PrgFiscal1.ECFModel := teBematechII;
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
    PrgFiscal1.IniciaDia('','','');
 end;

   // checa diferença de horário
  if ( PrgFiscal1.ECFModel = teBematech ) or ( PrgFiscal1.ECFModel = teBematechII ) then begin
   DataMovimento := PrgFiscal1.ReturnVar(23);
   if PrgFiscal1.Executed then
   begin
     HoraECF := Copy(DataMovimento, 7, 2) + ':' + Copy(DataMovimento, 9, 2);
     HoraDif := TimeToStr(StrToTime(HoraECF) - SysUtils.Time);
     MessageDlg('Os relógios internos do ECF e computador apresentam ' +
       'a seguinte diferença de tempo (HH:MM:SS): ' + HoraDif,
       mtWarning, [mbOK], 0);
   end;
  end;

  // Carregar Aliquotas
  Aliquotas := PrgFiscal1.ConAliqTribut;
  if PrgFiscal1.Executed = False then
  begin
    MessageDlg('Problemas ao Carregar Aliquotas', mtWarning, [mbOK], 0);
  end;

  Screen.Cursor := crHourGlass;
  PrgFiscal1.LeitStatus;

  if ( PrgFiscal1.Executed = True ) then  begin
    Screen.Cursor := crDefault;
  end else begin
    Screen.Cursor := crDefault;
    MessageDlg('Problemas ao se comunicar com o ECF! Verifique..',
    mtWarning,[mbOK],0);
    Screen.Cursor := crDefault;
  end;

  PageControl1.ActivePage := TabSheet1;

end;

procedure TFormCupomFiscal.MudapathAlias(const Alias, Path : String);
var
  AliasParams: TStringList;
begin
 Session.DeleteAlias(Alias);
 Session.AddStandardAlias(Alias, Path, 'PARADOX');
 Session.SaveConfigFile;
end;

function TFormCupomFiscal.AtualizaVariaveis():Boolean;
begin
    //Limpa as variaveis.
    CodigoProd           := '';
    DescricaoProd        := '';
    Tributo              := '';
    ValorUnitProd        := 0 ;
    QuantidadeProd       := 0 ;
    AcrescimoProd        := 0 ;
    DescontoProd         := 0 ;
    ValorPagoProd        := 0 ;
    ValorTotalsemDescAcr := 0 ;

    //Faz a transferência dos dados.
    CodigoProd           := FormatFloat('#############', dmCupom.ItemsCodProduto.Value);
    DescricaoProd        := dmCupom.ProdutosDescricao.Value;
    ValorUnitProd        := dmCupom.ItemsPrecoUnitario.Value;
    QuantidadeProd       := dmCupom.ItemsQuantidade.Value;
    AcrescimoProd        := dmCupom.VendedoresComissao.Value;
    DescontoProd         := dmCupom.ItemsDesconto.Value;
    ValorPagoProd        := ValPg;
    UnidadeProd          := dmCupom.ProdutosUnidade.Value;
    ValorTotalsemDescAcr := dmCupom.ItemsQuantidade.Value * dmCupom.ItemsPrecoUnitario.Value;

    Result := True;

end;



procedure TFormCupomFiscal.Button16Click(Sender: TObject);
begin
 PrgFiscal1.Emergencia('','');
end;

end.

