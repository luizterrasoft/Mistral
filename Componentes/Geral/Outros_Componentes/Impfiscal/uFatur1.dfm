�
 TFORMCUPOMFISCAL 0�0  TPF0TFormCupomFiscalFormCupomFiscalLeftLToppBorderIconsbiSystemMenu BorderStylebsSingleCaption!PrgFiscal - Aplica��o de Exemplo.ClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenterWindowStatewsMaximizedOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPageControlPageControl1Left Top)WidthOHeight�
ActivePage	TabSheet1AlignalClientTabOrder  	TTabSheet	TabSheet1CaptionCupom Fiscal TLabelLabel11Left� Top� Width"HeightCaptionTroco  TLabelLabel12Left� Top� WidthDHeightCaptionTotal Geral  TLabelLabel14LeftTop� Width;HeightCaptionDescontoFocusControlDescAdicional  TLabelLabel16LeftTop� Width1HeightCaptionUnitarioFocusControlUnitarioEdit  TLabelLabel15LeftTop� Width>HeightCaption	Acr�scimoFocusControl	Acrescimo  TLabelLabel17Left� Top� WidthDHeightCaption
Valor PagoFocusControlUnitarioEdit  TLabelLabel20LeftTop`WidthJHeightCaption
QuantidadeFocusControlQuantidadeEdit  TLabelLabel13LeftTopWidth>HeightCaption	Produtos:  TLabelLabel22LeftTop8Width,HeightCaptionC�digo  TLabelLabel23Left� Top8Width<HeightCaption	Descri��o  TButtonbtnRegistraLeft�TopWidth� Height!Caption	&RegistraFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnClickbtnRegistraClick  TButtonbtnNaoRegistraLeft�Top@Width� Height!Caption&N�o RegistraFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder OnClickbtnNaoRegistraClick  TButtonbtnCancelaUltimoItemLeft�TophWidth� Height!Caption&Cancela �ltimo itemFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnClickbtnCancelaUltimoItemClick  TDBGrid	ItemsGridLeftTopHWidthIHeight� ColorclInfoBk
DataSourcedmCupom.ItemsSrcOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExit ReadOnly	TabOrderTitleFont.CharsetANSI_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameVerdanaTitleFont.Style ColumnsExpanded	FieldNameProdutoWidthVisible	 Expanded	FieldNameQuantosVisible	 Expanded	FieldNameUnitarioTitle.CaptionUnit�rioWidth@Visible	 Expanded	FieldNameTotalWidth@Visible	 Expanded	FieldNameNumeroNFWidth@Visible	 Expanded	FieldNameSerieNFWidth@Visible	    TPanelPanel2LeftTopWidthIHeight1TabOrder TLabelNumeroCupomLeft� Top
WidthZHeightCaption000000Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel1Left$TopWidthXHeightCaptionCUPOMFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont   TDBEditDBEdit8Left� Top� WidthyHeight	DataField	ValorNota
DataSourcedmCupom.NotasSrcTabOrder
OnExitDBEdit8Exit  TDBEdit	AcrescimoLeftTop� WidthyHeight	DataFieldComissao(%)
DataSourcedmCupom.VendedoresSrcTabOrder	  TDBEditDescAdicionalLeftTop� WidthyHeight	DataFieldDesconto
DataSourcedmCupom.NotasSrcTabOrder  TDBEditUnitarioEditLeftTop� WidthyHeight	DataFieldUnitario
DataSourcedmCupom.ItemsSrcTabOrder  TDBEditQuantidadeEditLeftToppWidthyHeight	DataField
Quantidade
DataSourcedmCupom.ItemsSrcTabOrder  TDBLookupComboBoxProdutosLookupLeftPTopWidth	Height	DataField
CodProduto
DataSourcedmCupom.ItemsSrcKeyField
CodProduto	ListFieldCodProduto;Descricao
ListSourcedmCupom.ProdutosSrcTabOrder  TDBEditDBEdit9LeftTopHWidthyHeight	DataField
CodProduto
DataSourcedmCupom.ItemsSrcEnabledTabOrder  TDBEditDBEdit10Left� TopHWidth� Height	DataField	Descricao
DataSourcedmCupom.ProdutosSrcEnabledTabOrder   	TTabSheet	TabSheet2CaptionDados FechamentoFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFont TButtonbtnFecharCupomLeft� TopPWidth� Height)CaptionFec&har Cupom FiscalFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder OnClickbtnFecharCupomClick  	TGroupBox	GroupBox2Left"Top� WidthHeight� CaptionMensagem PromocionalTabOrder TEditMensagemLeftTop0Width	HeightTabOrder    TRadioGroupRadioGroup1LeftTop� WidthHeight� CaptionForma de PagamentoTabOrder  TPanelPanel4Left Top`Width@HeightQTabOrder TLabelLabel10LeftTopWidth3HeightCaptionCliente:  TButtonbtnDadosConsumidorLeft�TopWidthkHeightCaption
ConsumidorTabOrder OnClickbtnDadosConsumidorClick   	TCheckBox	CheckBox1LeftTop� WidthaHeightCaptionDinheiroChecked	State	cbCheckedTabOrder  	TCheckBox	CheckBox2LeftTop� WidthaHeightCaptionChequeTabOrder  	TCheckBox	CheckBox3LeftTopWidth� HeightCaptionCheque Pr�-DatadoTabOrder  TDBLookupComboBoxDBLookupComboBox2LeftPTophWidth	Height	DataField
CodCliente
DataSourcedmCupom.NotasSrcDropDownRows KeyField
CodCliente	ListFieldCodCliente;Nome
ListSourcedmCupom.ClientesSrcTabOrder   	TTabSheet	TabSheet3CaptionComandos/Leituras TButtonbtnLeituraXLeftGTopWidth� HeightCaption	Leitura XTabOrder OnClickbtnLeituraXClick  TButtonbtnReducaoZLeftGTop`Width� HeightCaption	Redu��o ZTabOrderOnClickbtnReducaoZClick  TRadioGroupRadioGroup2Left TopWidthHeight� CaptionLeitura da Mem. FiscalTabOrder  TButtonbtnMemFiscalLeft\Top� Width� HeightCaptionLeitura da Mem. FiscalTabOrderOnClickbtnMemFiscalClick  	TCheckBox
EntreDatasLeft8Top0WidthaHeightCaptionEntre datasTabOrderOnClickEntreDatasClick  	TCheckBoxEntreReducoesLeft8TopHWidthyHeightCaptionEntre Redu��esTabOrderOnClickEntreReducoesClick  	TGroupBox	GroupBox1Left Top WidthHeightyCaptionEmerg�nciasTabOrder TButtonButton1LeftTop(Width� HeightCaptionFechamento FinalTabOrder OnClickButton1Click  TButtonButton16LeftTop@Width� HeightCaptionFinaliza opera��esTabOrderOnClickButton16Click   TButtonButton2LeftGTop� Width� HeightCaptionTruncamentoTabOrder	OnClickButton2Click  TButtonButton3LeftGTop� Width� HeightCaptionHor�rio de Ver�oTabOrderOnClickButton3Click  TButtonButton4LeftGTop� Width� HeightCaptionArredondamentoTabOrderOnClickButton4Click  TButtonButton5LeftGTop(Width� HeightCaptionTotalizadores ParciaisTabOrderOnClickButton5Click  	TCheckBoxSaidaCheckBoxLeft`Top� Width� HeightCaptionSa�da em ArquivoTabOrder  TButtonButton7LeftGTopCWidth� HeightCaptionConsultar AliquotasTabOrder
OnClickButton7Click  TButtonButton13LeftHTop4Width� HeightCaptionLeitura X em ArquivoTabOrderOnClickButton13Click  TButtonButton14LeftGTop^Width� HeightCaptionCadastrar AliquotasTabOrderOnClickButton14Click  	TMaskEditData1Left8ToppWidthQHeightEditMask99/99/99;1;_	MaxLengthTabOrderText  /  /    	TMaskEditData2Left�ToppWidthQHeightEditMask99/99/99;1;_	MaxLengthTabOrderText  /  /     	TTabSheet	TabSheet4CaptionCupons Emitidos TLabelLabel3LeftTop0Width1HeightCaptionN�mero  TLabelLabel4Left� Top0WidthjHeightCaptionData de Emiss�o  TLabelLabel5LeftTop`WidthWHeightCaptionBase do ICMS  TLabelLabel6Left� Top`WidthXHeightCaptionValor do ICMS  TLabelLabel7LeftTop� Width;HeightCaptionDesconto  TLabelLabel8Left� Top� WidthgHeightCaptionValor Produto(s)  TLabelLabel9Left8Top0WidthdHeightCaptionValor do Cupom  TLabelLabelCancelLeft� TopWidthmHeightCaptionC A N C E L A D OFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel19Left8Top� WidthdHeightCaptionValor do Cupom  TLabelLabel18Left8Top`WidthsHeightCaptionValor do Desconto  TDBGridDBGrid1Left Top� WidthHeightx
DataSourcedmCupom.ItemsSrcTabOrder TitleFont.CharsetANSI_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameVerdanaTitleFont.Style ColumnsExpanded	FieldNameProdutoWidth,Visible	 Expanded	FieldName
QuantidadeTitle.CaptionQuant.Width2Visible	 Expanded	FieldNamePrecoUnitarioTitle.AlignmenttaRightJustifyTitle.CaptionUnit�rioWidth:Visible	 Expanded	FieldNameUnidadeTitle.CaptionUNVisible	 Expanded	FieldNameDescontoWidth@Visible	 Expanded	FieldName
CodProdutoWidth@Visible	    TDBNavigatorDBNavigator1LeftTopWidth� Height
DataSourcedmCupom.NotasSrcVisibleButtonsnbFirstnbPriornbNextnbLast TabOrder  TDBEditDBEdit1LeftTop@WidthyHeight	DataFieldNumeroNF
DataSourcedmCupom.NotasSrcTabOrderOnChangeDBEdit1Change  TDBEditDBEdit2Left� Top@WidthyHeight	DataFieldDataEmissao
DataSourcedmCupom.NotasSrc	MaxLengthTabOrder  TDBEditDBEdit3LeftToppWidthyHeight	DataFieldBaseICMS
DataSourcedmCupom.NotasSrcTabOrder  TDBEditDBEdit4Left� ToppWidthyHeight	DataField	ValorICMS
DataSourcedmCupom.NotasSrcTabOrder  TDBEditDBEdit5LeftTop� WidthyHeight	DataFieldDesconto
DataSourcedmCupom.NotasSrcTabOrder  TDBEditDBEdit6Left� Top� WidthyHeight	DataFieldValorProdutos
DataSourcedmCupom.NotasSrcTabOrder  TDBEditDBEdit7Left8Top@WidthyHeight	DataField	ValorNota
DataSourcedmCupom.NotasSrcFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFontTabOrder  TDBEditDescontoItemLeft8ToppWidthyHeight	DataFieldDesconto
DataSourcedmCupom.ItemsSrcTabOrder	  TDBEdit	ValorPagoLeft8Top� WidthyHeight	DataField	ValorNota
DataSourcedmCupom.NotasSrcTabOrder
    TPanelPanel1LeftOTop)Width� Height�AlignalRightTabOrder TButtonbtnAbrirCupomFiscalLeftTop WidthqHeight!Caption&AbrirFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrder OnClickbtnAbrirCupomFiscalClick  TButtonbtnCancelaUltimoCupomLeftTopvWidthqHeightCaptionCancela &�ltimoTabOrderOnClickbtnCancelaUltimoCupomClick  TButtonbtnFechamentoLeftTopIWidthqHeight&Caption&FecharFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style 
ParentFontTabOrderOnClickbtnFechamentoClick  TButtonButton8LeftTop� WidthqHeightCaption
Autom�ticaEnabledTabOrderOnClickButton8Click  TButtonButton9LeftTop� WidthqHeightCaptionManualEnabledTabOrderOnClickButton9Click  TButtonButton10LeftTop7WidthqHeightCaptionAbrirEnabledTabOrderOnClickButton10Click  TButtonButton11LeftTopQWidthqHeightCaptionRetirarEnabledTabOrder  TButtonButton12LeftTopkWidthqHeightCaptionSuprirEnabledTabOrderOnClickButton12Click   TPanelPanel3Left Top Width�Height)AlignalTopTabOrder TLabelLabel2Left� TopWidth� HeightCaptionEmiss�o de Cupom FiscalFont.CharsetANSI_CHARSET
Font.ColorclBlueFont.Height�	Font.NameVerdana
Font.Style 
ParentFont  TLabelLabel21Left�TopWidthMHeightCaptionImpressora:  TButtonButton6Left�TopWidthSHeightCaption&SairTabOrder OnClickButton6Click  	TComboBox	ComboBox1Left*TopWidth� Height
ItemHeightTabOrderTextBematechOnChangeComboBox1ChangeItems.StringsBematechSweda
SchalterSPYancoElginZanthusCorisco    
TPrgFiscal
PrgFiscal1ExecutedOnErrorPrgFiscal1ErrorECFModelteBematechIINumPortaLeftTop   