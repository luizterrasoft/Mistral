{*** ALTERACOES PARA INCLUIR A PESSOA JURIDICA JA FORAM INICIADAS **** Data: 16/07/2003}
{*** ALTERACOES PARA PESQUISA DE CEP ***}
{*** ALTERACOES PARA CAMPO LIVRE NO CLIENTE E CAMPO OBSERVACAO NO CONTRATO E CAMPO FORMA DE PAGAMENTO NA PRESTACAO}
unit cadcli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Grids, Menus, cliente, contratos, Cep,db,dbtables,
  jpeg;

type
  Tfrm_edtCliente = class(TForm)
    fichario: TPageControl;
    pagina1: TTabSheet;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label9: TLabel;
    lblNome: TLabel;
    Label1: TLabel;
    lblEndereco: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtNasc: TMaskEdit;
    edtNome: TMaskEdit;
    edtCodigo: TMaskEdit;
    edtEndereco: TMaskEdit;
    edtBairro: TMaskEdit;
    edtCep: TMaskEdit;
    edtCidade: TMaskEdit;
    edtIdentidade: TMaskEdit;
    edtOrgExped: TMaskEdit;
    edtCpf: TMaskEdit;
    edtEmail: TMaskEdit;
    edtFax: TMaskEdit;
    edtCelular: TMaskEdit;
    edtTelefone: TMaskEdit;
    cbEstadoCivil: TComboBox;
    edtConjuge: TMaskEdit;
    edtPai: TMaskEdit;
    edtMae: TMaskEdit;
    cbEstado: TComboBox;
    pagina2: TTabSheet;
    Bevel6: TBevel;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label40: TLabel;
    edtNomeEmp: TMaskEdit;
    edtEndEmp: TMaskEdit;
    edtCargo: TMaskEdit;
    edtCartProf: TMaskEdit;
    edtAdmissaoEmp: TMaskEdit;
    edtSalario: TMaskEdit;
    edtLimCred: TMaskEdit;
    pagina3: TTabSheet;
    edtTelEmp: TMaskEdit;
    Label19: TLabel;
    edtRef1: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    edtTelRef1: TMaskEdit;
    Label28: TLabel;
    edtTelRef2: TMaskEdit;
    Label32: TLabel;
    edtRef2: TMaskEdit;
    Bevel2: TBevel;
    edtContrato: TMaskEdit;
    Label36: TLabel;
    Label38: TLabel;
    edtNotaFiscal: TMaskEdit;
    Label39: TLabel;
    edtSerieNota: TMaskEdit;
    Label41: TLabel;
    Label42: TLabel;
    edtPortador: TMaskEdit;
    pnPortador: TPanel;
    Bevel4: TBevel;
    Label43: TLabel;
    edtValMerc: TMaskEdit;
    Label44: TLabel;
    edtValEntrada: TMaskEdit;
    edtPlano: TMaskEdit;
    Label45: TLabel;
    pnPlano: TPanel;
    Label46: TLabel;
    edtNumParc: TMaskEdit;
    Label47: TLabel;
    edtFator: TMaskEdit;
    grade_lancamentos: TStringGrid;
    btnGerarPrestacoes: TSpeedButton;
    pnTotalDevido: TPanel;
    Label48: TLabel;
    edtObs: TMaskEdit;
    menu: TMainMenu;
    Lancamentos: TMenuItem;
    Limpareditspagina11: TMenuItem;
    pn_menucadcli: TPanel;
    pnPagina1: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnSalvar1: TSpeedButton;
    btnImpCarnet: TSpeedButton;
    edtCodAval: TMaskEdit;
    pnAval: TPanel;
    Mudaralojaedatadocontraot1: TMenuItem;
    Gerarprestacoes1: TMenuItem;
    Salvarocliente1: TMenuItem;
    pnTipoCad2: TPanel;
    pnTipoCad3: TPanel;
    Salvarocontrato1: TMenuItem;
    Imprimircarnet1: TMenuItem;
    Prosseguecadastro1: TMenuItem;
    Retornacadastro1: TMenuItem;
    Novocontrato1: TMenuItem;
    SAIR1: TMenuItem;
    botao_sair: TPanel;
    btnIncluir2: TSpeedButton;
    btnCancelainclusao2: TSpeedButton;
    btnExcluir2: TSpeedButton;
    btnSalvar2: TSpeedButton;
    btnImprimir2: TSpeedButton;
    btnImpIndiv2: TSpeedButton;
    Formulario11: TMenuItem;
    Formulario21: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pnMensForm10: TPanel;
    Label49: TLabel;
    Bevel7: TBevel;
    Label53: TLabel;
    Label52: TLabel;
    Label71: TLabel;
    Label70: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label75: TLabel;
    Label74: TLabel;
    pnMensForm11: TPanel;
    Label2: TLabel;
    Bevel10: TBevel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    pnMensForm00: TPanel;
    Label50: TLabel;
    lbLimpar: TLabel;
    Label51: TLabel;
    Label35: TLabel;
    Label57: TLabel;
    Bevel5: TBevel;
    pnMensForm01: TPanel;
    Label67: TLabel;
    Bevel11: TBevel;
    Label68: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    btnIncluir1: TSpeedButton;
    btnExcluir1: TSpeedButton;
    btnCancelainclusao1: TSpeedButton;
    pnMensForm20: TPanel;
    Label54: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Bevel9: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label66: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    pnMensForm22: TPanel;
    Label123: TLabel;
    Bevel12: TBevel;
    Label124: TLabel;
    Label125: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Incluircliente1: TMenuItem;
    Cancelarinclusaocliente1: TMenuItem;
    Exclusaodocliente1: TMenuItem;
    Limparcadastro1: TMenuItem;
    N4: TMenuItem;
    Imprimirclienteindividual1: TMenuItem;
    Imprimirclientescadastrados1: TMenuItem;
    Outrosrelatrios1: TMenuItem;
    Salvarcliente1: TMenuItem;
    N5: TMenuItem;
    SAIR2: TMenuItem;
    Incluircontrato1: TMenuItem;
    Cancelarinclusaocontrato1: TMenuItem;
    Exclusodocontrato1: TMenuItem;
    Salvarcontrato1: TMenuItem;
    Limparcadastro2: TMenuItem;
    N6: TMenuItem;
    Imprimircontratoindividual1: TMenuItem;
    Imprimircontratoscadastrados1: TMenuItem;
    Outrosrelatrios2: TMenuItem;
    N7: TMenuItem;
    SAIR3: TMenuItem;
    Gerarcheques1: TMenuItem;
    Label14: TLabel;
    Label27: TLabel;
    btnEdtGrade: TButton;
    btnCancelGrade: TButton;
    btnSalvarGrade: TButton;
    lbF8mens: TLabel;
    lbF8: TLabel;
    N1: TMenuItem;
    Editarvalores1: TMenuItem;
    Cancelarediodevalores1: TMenuItem;
    Salvarvaloreseditados1: TMenuItem;
    N8: TMenuItem;
    Editarvalores2: TMenuItem;
    Cancelarediodevalores2: TMenuItem;
    Salvarvaloreseditados2: TMenuItem;
    Label82: TLabel;
    edtSpc: TMaskEdit;
    Label83: TLabel;
    edtCFun: TMaskEdit;
    Label147: TLabel;
    edtTPro: TMaskEdit;
    PopUpMenuHistorico: TPopupMenu;
    Relatriode1: TMenuItem;
    Posiofinanceiracontratosemaberto1: TMenuItem;
    Consultadecheques1: TMenuItem;
    btnHist: TSpeedButton;
    Label148: TLabel;
    pnDtca: TPanel;
    pnUltc: TPanel;
    Label150: TLabel;
    pnQtdc: TPanel;
    Bevel13: TBevel;
    Label153: TLabel;
    lbUltimo: TLabel;
    Label156: TLabel;
    edtPDC: TMaskEdit;
    Label149: TLabel;
    Label157: TLabel;
    pnValidade: TPanel;
    Label158: TLabel;
    edtSexo: TMaskEdit;
    Panel5: TPanel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    edtRamal: TMaskEdit;
    Label162: TLabel;
    edtLoja: TMaskEdit;
    Label163: TLabel;
    edtDatContrato: TMaskEdit;
    pnDSPC: TPanel;
    btnConsulta: TSpeedButton;
    Label164: TLabel;
    pnSaldoDevedor: TPanel;
    btnCalc: TSpeedButton;
    lbl_Cpf: TLabel;
    lbl_banco: TLabel;
    btnImpProposta: TSpeedButton;
    pnEmail: TPanel;
    Image1: TImage;
    pnDesatualizado: TPanel;
    btnDadosComp: TBitBtn;
    Label3: TLabel;
    edtLivre: TMaskEdit;
    btnOutrasObservacoes: TBitBtn;
    Button1: TButton;
    pnTipoCad1: TPanel;
    Label4: TLabel;
    Label37: TLabel;
    Label100: TLabel;
    Label99: TLabel;
    lbF8mens2: TLabel;
    lbF82: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label69: TLabel;
    BitBtnProsseguir: TBitBtn;
    BitBtnProsseguir2: TBitBtn;
    BitBtnConfirmar: TBitBtn;
    BitBtnRetornar2: TBitBtn;
    BitBtnRetornar: TBitBtn;
    BitBtnRetornar1: TBitBtn;
    pagina5: TTabSheet;
    Bevel8: TBevel;
    BitBtn3: TBitBtn;
    Panel55: TPanel;
    foto_cliente: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel11: TPanel;
    Label76: TLabel;
    Bevel19: TBevel;
    Label141: TLabel;
    Label142: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    Label236: TLabel;
    Label237: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Panel8: TPanel;
    Label77: TLabel;
    edtQtdeBoleta: TMaskEdit;
    btnEditarBoletas: TBitBtn;
    cbbTipoLogradouro: TComboBox;
    lbl1: TLabel;
    edtComplemento: TMaskEdit;
    lbl3: TLabel;
    edtNumero: TMaskEdit;
    lbl2: TLabel;
    edtPais: TMaskEdit;
    lbl4: TLabel;
    lblCodPais: TLabel;
    lblCodCidadeIBGE: TLabel;
    lblCodUFIBGE: TLabel;
    edtUF: TMaskEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    btnSalvar: TSpeedButton;
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNascKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCelularKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFaxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIdentidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtExpedicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOrgExpedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbEstadoCivilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtOutrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConjugeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRef1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtRef2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProsseguirClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtNascExit(Sender: TObject);
    procedure btnGerarPrestacoesClick(Sender: TObject);
    procedure edtNomeEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEndEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAdmissaoEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBairroEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCartProfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSerieCartProfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSalarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLimCredKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelRef1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTelRef2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtObsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProsseguir2Click(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnRetornar2Click(Sender: TObject);
    procedure edtContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNotaFiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSerieNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAvalistaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPortadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValMercKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumParcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFatorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPortadorExit(Sender: TObject);
    procedure edtPlanoExit(Sender: TObject);
    procedure Limpareditspagina11Click(Sender: TObject);
    procedure edtAdmissaoEmpExit(Sender: TObject);
    procedure edtSalarioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLimCredKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValMercKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValEntradaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFatorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSalarioExit(Sender: TObject);
    procedure edtLimCredExit(Sender: TObject);
    procedure edtValMercExit(Sender: TObject);
    procedure edtValEntradaExit(Sender: TObject);
    procedure edtFatorExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNumParcExit(Sender: TObject);
    procedure edtCodAvalEnter(Sender: TObject);
    procedure edtCodAvalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAvalExit(Sender: TObject);
    procedure edtPeriKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure Mudaralojaedatadocontraot1Click(Sender: TObject);
    procedure Gerarprestacoes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Salvarocliente1Click(Sender: TObject);
    procedure botao_sair2Click(Sender: TObject);
    procedure btnSalvar1Click(Sender: TObject);
    procedure botao_sairClick(Sender: TObject);
    procedure Prosseguecadastro1Click(Sender: TObject);
    procedure Retornacadastro1Click(Sender: TObject);
    procedure pagina2Enter(Sender: TObject);
    procedure pagina1Enter(Sender: TObject);
    procedure pagina3Enter(Sender: TObject);
    procedure Salvarocontrato1Click(Sender: TObject);
    procedure Novocontrato1Click(Sender: TObject);
    procedure edtCodigoDblClick(Sender: TObject);
    procedure edtCodAvalDblClick(Sender: TObject);
    procedure ficharioChange(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure btnSalvar2Click(Sender: TObject);
    procedure Incluircliente1Click(Sender: TObject);
    procedure Cancelarinclusaocliente1Click(Sender: TObject);
    procedure Exclusaodocliente1Click(Sender: TObject);
    procedure Limparcadastro1Click(Sender: TObject);
    procedure SAIR2Click(Sender: TObject);
    procedure Salvarcliente1Click(Sender: TObject);
    procedure SAIR3Click(Sender: TObject);
    procedure Incluircontrato1Click(Sender: TObject);
    procedure Cancelarinclusaocontrato1Click(Sender: TObject);
    procedure Exclusodocontrato1Click(Sender: TObject);
    procedure Salvarcontrato1Click(Sender: TObject);
    procedure Limparcadastro2Click(Sender: TObject);
    procedure Outrosrelatrios1Click(Sender: TObject);
    procedure Outrosrelatrios2Click(Sender: TObject);
    procedure Imprimircontratoscadastrados1Click(Sender: TObject);
    procedure btnIncluir2Click(Sender: TObject);
    procedure btnCancelainclusao2Click(Sender: TObject);
    procedure btnExcluir2Click(Sender: TObject);
    procedure btnImpIndiv2Click(Sender: TObject);
    procedure btnImprimir2Click(Sender: TObject);
    procedure btnIncluir1Click(Sender: TObject);
    procedure btnCancelainclusao1Click(Sender: TObject);
    procedure btnExcluir1Click(Sender: TObject);
    procedure Imprimirclientescadastrados1Click(Sender: TObject);
    procedure Imprimircontratoindividual1Click(Sender: TObject);
    procedure cbEstadoExit(Sender: TObject);
    procedure Gerarcheques1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtPortadorDblClick(Sender: TObject);
    procedure edtPlanoDblClick(Sender: TObject);
    procedure Imprimirclienteindividual1Click(Sender: TObject);
    procedure btnEdtGradeClick(Sender: TObject);
    procedure btnCancelGradeClick(Sender: TObject);
    procedure btnSalvarGradeClick(Sender: TObject);
    procedure grade_lancamentosGetEditMask(Sender: TObject; ACol,
      ARow: Longint; var Value: String);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grade_lancamentosDrawCell(Sender: TObject; Col, Row: Longint;
      Rect: TRect; State: TGridDrawState);
    procedure grade_lancamentosSetEditText(Sender: TObject; ACol,
      ARow: Longint; const Value: String);
    procedure edtPortadorEnter(Sender: TObject);
    procedure edtPlanoEnter(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCpfEnter(Sender: TObject);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNascEnter(Sender: TObject);
    procedure edtCepEnter(Sender: TObject);
    procedure edtEnderecoEnter(Sender: TObject);
    procedure edtBairroEnter(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure cbEstadoEnter(Sender: TObject);
    procedure edtTelefoneEnter(Sender: TObject);
    procedure edtCelularEnter(Sender: TObject);
    procedure edtFaxEnter(Sender: TObject);
    procedure edtEmailEnter(Sender: TObject);
    procedure edtIdentidadeEnter(Sender: TObject);
    procedure edtOrgExpedEnter(Sender: TObject);
    procedure cbEstadoCivilEnter(Sender: TObject);
    procedure edtConjugeEnter(Sender: TObject);
    procedure edtPaiEnter(Sender: TObject);
    procedure edtMaeEnter(Sender: TObject);
    procedure edtNomeEmpEnter(Sender: TObject);
    procedure edtCargoEnter(Sender: TObject);
    procedure edtEndEmpEnter(Sender: TObject);
    procedure edtAdmissaoEmpEnter(Sender: TObject);
    procedure edtTelEmpEnter(Sender: TObject);
    procedure edtCartProfEnter(Sender: TObject);
    procedure edtSalarioEnter(Sender: TObject);
    procedure edtLimCredEnter(Sender: TObject);
    procedure edtRef1Enter(Sender: TObject);
    procedure edtTelRef1Enter(Sender: TObject);
    procedure edtRef2Enter(Sender: TObject);
    procedure edtTelRef2Enter(Sender: TObject);
    procedure edtObsEnter(Sender: TObject);
    procedure edtContratoEnter(Sender: TObject);
    procedure edtNotaFiscalEnter(Sender: TObject);
    procedure edtSerieNotaEnter(Sender: TObject);
    procedure edtValMercEnter(Sender: TObject);
    procedure edtValEntradaEnter(Sender: TObject);
    procedure edtNumParcEnter(Sender: TObject);
    procedure edtFatorEnter(Sender: TObject);
    procedure Editarvalores1Click(Sender: TObject);
    procedure Cancelarediodevalores1Click(Sender: TObject);
    procedure Salvarvaloreseditados1Click(Sender: TObject);
    procedure Editarvalores2Click(Sender: TObject);
    procedure Cancelarediodevalores2Click(Sender: TObject);
    procedure Salvarvaloreseditados2Click(Sender: TObject);
    procedure edtSpcEnter(Sender: TObject);
    procedure edtCFunEnter(Sender: TObject);
    procedure edtTProEnter(Sender: TObject);
    procedure edtSpcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCFunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtTProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure grade_lancamentosKeyPress(Sender: TObject; var Key: Char);
    procedure Relatriode1Click(Sender: TObject);
    procedure Posiofinanceiracontratosemaberto1Click(Sender: TObject);
    procedure Consultadecheques1Click(Sender: TObject);
    procedure btnHistClick(Sender: TObject);
    procedure btnImpCarnetClick(Sender: TObject);
    procedure grade_lancamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPDCEnter(Sender: TObject);
    procedure edtPDCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSexoEnter(Sender: TObject);
    procedure edtSexoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContratoExit(Sender: TObject);
    procedure edtSpcExit(Sender: TObject);
    procedure edtCFunExit(Sender: TObject);
    procedure edtTProExit(Sender: TObject);
    procedure edtRamalEnter(Sender: TObject);
    procedure edtRamalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaEnter(Sender: TObject);
    procedure edtDatContratoEnter(Sender: TObject);
    procedure edtDatContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDatContratoExit(Sender: TObject);
    procedure edtLojaExit(Sender: TObject);
    procedure edtNomeChange(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure edtCpfExit(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnImpPropostaClick(Sender: TObject);
    procedure ficharioChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnDadosCompClick(Sender: TObject);
    procedure edtCepDblClick(Sender: TObject);
    procedure edtLivreEnter(Sender: TObject);
    procedure edtLivreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOutrasObservacoesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtnProsseguirClick(Sender: TObject);
    procedure BitBtnProsseguir2Click(Sender: TObject);
    procedure BitBtnRetornar2Click(Sender: TObject);
    procedure BitBtnRetornarClick(Sender: TObject);
    procedure BitBtnRetornar1Click(Sender: TObject);
    procedure edtSexoChange(Sender: TObject);
    procedure ficharioDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtQtdeBoletaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditarBoletasClick(Sender: TObject);
    procedure edtPaisEnter(Sender: TObject);
    procedure edtUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtComplementoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbbTipoLogradouroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeBoletaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    nunprestacao :Integer;

  public
    { Public declarations }
    salvar_geral  : String;
    atualizaPlano: Boolean;
    atualizaMultiBoleta: Boolean;
    fechamentoVenda: Boolean;
    contratoComum: Boolean;
    {0-> para inclusao 1-> para renovacao}
    CodigoInclusaoCliente: Integer;
    CodigoInclusaoContrato: Integer;
    antNome: String;
    MostraAuxLoja: Boolean;
    modoContrato: Integer;
    modo: Integer; {0-> Lancamento; 1-> Manutencao cliente; 2-> Manutencao contrato ***}
    cdLoja: Integer; {Parametro do formulario que indica qual a loja ativa no cadastro ***}
    cdCliente: Integer; {Param. usado para armazenar o codigo do cliente; unica laco entre as paginas ***}
    datacontrato: TDateTime;      {Parametro que indica qual a data do contrato}
    cdCheq: Integer;  {... - Parametro de cheque}
    cdCarn: Integer; {... - Parametro de carnet}
    flagConsulta: Boolean; {* flag que informa se a rotina é chamada da consulta}
    PodeChamarCheques: Boolean;
    regspc: String;
    boInsert: Boolean;
    PodeFecharForm: Boolean;
    flagEditCheq: Boolean;
    flagInc2,flagCanc2,flagExc2,flagSalv2,flagIndiv2: Boolean;
    auxCliente,auxContrato: Integer;
    ultima_pagina_acessada: Integer;
    antdifpdev: Real;
    antPainel: String;
    valor_do_contrato_renegociacao: Real;
    motivobloqueio: String;
    cont : Boolean;
    function  PreencheGradeContrato (cliente,contrato: Real):Boolean;
    function  ContratoSendoPago (cliente,contrato: Real):Boolean;
    function  ContratoEdeCheque (cliente,contrato: Real):Boolean;
    function  NumParcContrato (cliente,contrato: Real):Integer;
    function  ExisteContrato(cliente,contrato: Real):Boolean;
    function  ExisteCliente(cliente: Real):Boolean;
    function  LojaCadastrada(codLoja: Real):Boolean;
    function  PlanoCadastrado(codPlano: String):Boolean;
    function  VerificaSeClienteTemPrestacaoComAtraso(cliente: Real):Boolean;
    function  VerificaSeClientePrimeiraCompra(cliente: Real):Boolean;
    function  PagouPrestacaoUltimoContratoComAtraso(cliente: Real; dias: Integer):Boolean;
    function  VerificaDataUltimoContrato(cliente: Real):TDateTime;
    function  CriticaLancamentoContrato:Boolean;
    procedure LimparObservacoes;
    procedure SalvaObservacoes(cliente: Real);
    procedure PreencheObservacoes(cliente: Real);
    procedure PreencheEditsCliente (classe: TClassCliente; pagina: Integer);
    procedure PreencheEditsContrato (classe: TClassContrato);
    procedure LimparEdits (pagina: Integer);
    procedure IniciarGradeLancamentos;
    procedure HabilitaMenuCliente (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
    procedure HabilitaMenuContrato (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
    procedure DefinirAtalhos (iModo: Integer);
    function ConfirmaCadastroCrediario(Cliente, Contrato: String): boolean;
    function LiberaVendaZerado: boolean;
    function ClienteSemCEP(cliente: Real): Boolean;
    procedure PreparaGuiaDadosCadastraisParaPessoaJuridica;
    procedure PreparaGuiaDadosCadastraisParaPessoaFisica;
    procedure PreencheComboTipoLogradouro;
  end;

var
  frm_edtCliente: Tfrm_edtCliente;

implementation

uses f8planos, F8Lojas, principal, f8Port, funcoes1,funcoes2 , loja, plano, portador,
  prestacoes, aux1Contrato, unDialogo, f8Clientes, prestcontrato,
  Rl_tite, Mem_prnt, aux2Contrato, cheques, DM4, aux3Contrato, relat,
  unConsCheq, unEmissCarnet2, f8Avalista, un_frmConsulta1, credito,
  procura, unMensagem, auxiliar, unPropostaCredito,
  unVersoPropostaCredito,DM16, un_DadosCompCliente, un_exibecep,
  aux5Contrato, un_principal_imagens, un_MenuPrincipal_OpcaoCrediario,
  un_Cons_CheckCheck, mainf, un_senhaSupervisor, un_InfBoletaVenda,un_FechamentoVenda,un_FechamentoVenda_Cred,
  USenhaConfirmacao, f8Cidade, f8Pais;

{$R *.DFM}

{Esta funcao pode ser usada como padrao em todos os edits no evento OnEnter ****}
{Somente nos casos comuns em que o evento só for usado para redirecionamento ***}
{Clique de botao ***}
procedure Tfrm_edtCliente.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clCli: TClassCliente;
  clLoja: TClassLoja;
  clAux: TClassAuxiliar;
  codigo: String;
begin
  if (key=K_ESC) then
    close;
  if (key=13) or (key=40) then
  begin
         {Primeira Busca do cadastro do cliente - PRIMEIRA BUSCA}
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
    begin
      edtCodigo.text := form_nz (StrToFloat(codigo),6);
      with (clCli) do
      begin
        clCli := TClassCliente.Create;
        Conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_DTNA,CL_CEP,CL_ENDE, CL_BAIR,  ');
        AddParam ('       CL_CIDA,CL_ESTA,CL_FONE,CL_CELU,CL_FAX,CL_EMAI,CL_IDEN,  ');
        AddParam ('       CL_OEXP,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,CL_EMPR,CL_REF1, ');
        AddParam ('       CL_REF2,CL_SALA,CL_CPRO,CL_TRF1,CL_TRF2,CL_EEMP,CL_FEMP, ');
        AddParam ('       CL_CARG,CL_LIMC,CL_OBSE,CL_DADM,CL_VALI,CL_RSPC,CL_TPRO, ');
        AddParam ('       CL_CFUN,CL_ULTC,CL_QTDC,CL_DTCA,CL_PDC,CL_SEXO ,CL_REMP, ');
        AddParam ('       CL_DSPC,CL_ALTE,CL_DULP,CL_LIVR,CL_TIPO_LOGRADOURO,      ');
        AddParam ('       CL_NUMERO,CL_COMPLEMENTO,CL_IBGE_CIDADE,CL_IBGE_UF,      ');
        AddParam ('       CL_PAIS,CL_CODIGO_PAIS                                   ');
        AddParam ('From   CRECLI                                                   ');
        AddParam ('Where (CL_CODI='+codigo+')                                      ');
        frm_principal.BarraDicas.caption:='Buscando cliente...Aguarde!';
        frm_principal.refresh;
        if (not Execute) then
        begin
          Button1.Enabled := false;
          if (flagConsulta) then
          begin
            if (not frm_principal.x_alteracao_salario_limite_consulta) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end;
            //****************************************************
            //BLOQUEIA ALTERAÇÃO DE SALÁRIO APOS A 1ª COMPRA
            //****************************************************
            clAux := TCLassAuxiliar.Create;
            clAux.Conect('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam('SELECT * ');
            clAux.AddParam('FROM CRECTABR');
            clAux.AddParam('WHERE (CR_CLIE='+codigo+')');
            if (clAux.Execute) then
              if (frm_principal.x_bloqueia_alteracao_salario_compra) then
              begin
                edtSalario.color    := clBtnFace;
                edtSalario.readonly := true;
              end
              else
              begin
                edtSalario.color    := clWhite;
                edtSalario.readonly := false;
              end;
            clAux.Desconect;
            clAux.Free;
            //****************************************************
            if (not frm_principal.x_alteracao_limite_credito) then
            begin
              edtLimCred.color    := clBtnFace;
              edtLimCred.readonly := true;
            end
            else
            begin
              edtLimCred.color    := clWhite;
              edtLimCred.readonly := false;
            end;
            if (not frm_principal.x_alteracao_observacao_consulta) then
            begin
              edtObs.color    := clWhite;
              edtObs.readonly := false;
              btnOutrasObservacoes.enabled := true;
            end;
          end;
          frm_principal.BarraDicas.caption:='';
          {******************************************* - alteracao: 16/07/2003}
          if (btnCancelainclusao2.enabled) then
            HabilitaMenuCliente (false,true,false,true,true,false,true,true)
          else
          begin
            if (Modo=0) then
              HabilitaMenuCliente (false,false,false,true,true,false,true,true)
            else
              HabilitaMenuCliente (true,false,false,true,true,false,true,true);
          end;
          {***********************************************}
          LimparEdits(1);
          LimparEdits(2);
          edtCpf.text:='';
          modoContrato:=0;
          pnTipoCad1.caption := 'PRIMEIRO CONTRATO';
          pnTipoCad2.caption := 'PRIMEIRO CONTRATO';
          pnTipoCad3.caption := 'PRIMEIRO CONTRATO';
          //****************************************************
          //BLOQUEIA ALTERAÇÃO DE SALÁRIO APOS A 1ª COMPRA
          //****************************************************
          clAux := TCLassAuxiliar.Create;
          clAux.Conect('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam('SELECT *                    ');
          clAux.AddParam('FROM CRECTABR               ');
          clAux.AddParam('WHERE (CR_CLIE='+codigo+')  ');
          if (clAux.Execute) then
          begin
            if (frm_principal.x_bloqueia_alteracao_salario_compra) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end
          end
          else
          begin
            if (frm_principal.x_bloqueia_alteracao_salario_compra) then
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end
            else
            if (not frm_principal.x_alteracao_salario_limite_consulta) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end;
          end;
          clAux.Desconect;
          clAux.Free;
          //****************************************************

          {preenchendo alguns dados sobre a loja ***}
          {if (cdLoja<>0) then
          begin
            clLoja := TClassLoja.Create;
            with (clLoja) do
            begin
              conect   ('CREDITO',self);
              AddParam ('Select LO_CODI,LO_NOME,LO_CIDA,LO_ESTA    ');
              AddParam ('From CRELOJA                              ');
              AddParam ('Where (LO_CODI='+floattostr(cdLoja)+')    ');
              if (Execute) then
              begin
                edtCidade.text := Result('LO_CIDA');
                cbEstado.text := Result('LO_ESTA');
              end;
              desconect;
              Free;
            end;
          end;}

          {proximo focu ***}
          edtContrato.text:='000001';
          lbUltimo.caption:='000000';
          edtCpf.setfocus;
        end
        else
        begin
          Button1.Enabled := true;
          if (flagConsulta) then
          begin
            if (not frm_principal.x_alteracao_salario_limite_consulta) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end;
            //****************************************************
            //BLOQUEIA ALTERAÇÃO DE SALÁRIO APOS A 1ª COMPRA
            //****************************************************
            clAux := TCLassAuxiliar.Create;
            clAux.Conect('CREDITO',self);
            clAux.ClearSql;
            clAux.AddParam('SELECT * ');
            clAux.AddParam('FROM CRECTABR');
            clAux.AddParam('WHERE (CR_CLIE='+codigo+')');
            if (clAux.Execute) then
              if (frm_principal.x_bloqueia_alteracao_salario_compra) then
              begin
                edtSalario.color    := clBtnFace;
                edtSalario.readonly := true;
              end
              else
              begin
                edtSalario.color    := clWhite;
                edtSalario.readonly := false;
              end;
            clAux.Desconect;
            clAux.Free;
            //****************************************************
            if (not frm_principal.x_alteracao_limite_credito) then
            begin
              edtLimCred.color    := clBtnFace;
              edtLimCred.readonly := true;
            end
            else
            begin
              edtLimCred.color    := clWhite;
              edtLimCred.readonly := false;
            end;
            if (not frm_principal.x_alteracao_observacao_consulta) then
            begin
              edtObs.color    := clBtnFace;
              edtObs.readonly := true;
              btnOutrasObservacoes.enabled := false;
            end;
          end;
          //****************************************************
          //BLOQUEIA ALTERAÇÃO DE SALÁRIO APOS A 1ª COMPRA
          //****************************************************
          clAux := TCLassAuxiliar.Create;
          clAux.Conect('CREDITO',self);
          clAux.ClearSql;
          clAux.AddParam('SELECT * ');
          clAux.AddParam('FROM CRECTABR');
          clAux.AddParam('WHERE (CR_CLIE='+codigo+')');
          if (clAux.Execute) then
          begin
            if (frm_principal.x_bloqueia_alteracao_salario_compra) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            if (not frm_principal.x_alteracao_salario_limite_consulta) then
            begin
              edtSalario.color    := clBtnFace;
              edtSalario.readonly := true;
            end
            else
            begin
              edtSalario.color    := clWhite;
              edtSalario.readonly := false;
            end;
          end
          else
          if (frm_principal.x_bloqueia_alteracao_salario_compra) then
          begin
            edtSalario.color    := clWhite;
            edtSalario.readonly := false;
          end
          else
          if (not frm_principal.x_alteracao_salario_limite_consulta) then
          begin
            edtSalario.color    := clBtnFace;
            edtSalario.readonly := true;
          end
          else
          begin
            edtSalario.color    := clWhite;
            edtSalario.readonly := false;
          end;
          clAux.Desconect;
          clAux.Free;
          //****************************************************
          motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(trim(edtCodigo.text)));
          frm_principal.BarraDicas.caption:='';
          HabilitaMenuCliente (true,false,true,true,true,true,true,true);
          pnTipoCad1.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          pnTipoCad2.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          pnTipoCad3.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          modoContrato:=1;
          PreencheEditsCliente (clCli,1);
          PreencheEditsCliente (clCli,2);
          CarregaFotoCliente_(Result('CL_CPF'),foto_cliente);

          {procura pelo maximo cadastrado para o cliente ***}
          with (DMcontrato.qMaxiCont) do
          begin
            frm_principal.BarraDicas.caption:='Procurando o próximo número de contrato...';
            frm_principal.refresh;
            close;
            parambyname('cliente').asFloat:=strtofloat(codigo);
            open;
            lbUltimo.caption:=form_nz(fieldbyname('MAXIMO').AsInteger,6);
            edtContrato.text:=form_nz(fieldbyname('MAXIMO').AsInteger+1,6);
            frm_principal.BarraDicas.caption:='';
          end;

          {proximo focu ***}
          if (Modo=0) or (modo=1) then
            if (motivobloqueio<>'-1') then
            begin
              frmDialogo.ExibirMensagem (' Atenção, cliente se encontra bloqueado! '
                ,'Crediário',[mbOK]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
              edtCpf.setfocus;
            end
            else
            if frm_principal.clienteaut or
              (frmDialogo.ExibirMensagem ('Ir direto para o cadastro do contrato?'
              ,'Cadastro do cliente',[mbYes,mbNo],
              frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            begin
              fichario.activepage:=pagina3;
              edtContrato.setfocus;
            end
            else
              edtCpf.SetFocus;
//                      if (Modo=1) then edtCpf.setfocus;
          if (Modo=2) then
            edtCpf.setfocus;
        end;
        desconect;
        Free;
      end;
    end;
  end;
  if (key=K_F8) then
  begin
    with (frm_f8Clientes) do
    begin
      edit:=edtCodigo;
      showmodal;
    end;
    edtCodigo.SetFocus;
  end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do cliente; Formato: 999999 (Até 06 dígitos) - <F8/Duplo clique> Exibe clientes cadastrados ',10);
end;

procedure Tfrm_edtCliente.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtSexo.readonly) then
     if (edtNasc.ReadOnly)then
      edtCep.setfocus
     else
      edtNasc.SetFocus
     else
      edtSexo.setfocus;
  if (key=38) then
    edtCpf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtNascKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCep.setfocus;
  if (key=38) then
    edtSexo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do nascimento do cliente: formato 99/99/9999 ',10);
end;

procedure Tfrm_edtCliente.edtEnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNumero.setfocus;
  if (key=38) then
    edtCep.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço do cliente; Informe Rua ou Av., e Numero - Até 50 caracteres. ',15);
end;

procedure Tfrm_edtCliente.edtBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtCidade.setfocus;
  if (key = K_CIMA) then
    //edtEndereco.setfocus;
    edtComplemento.SetFocus;
  if (key = K_F1) then
    frm_principal.ExibirDica ('   Bairro do cliente; Informe o bairro do endereço - Até 30 caracteres. ',15);
end;

procedure Tfrm_edtCliente.edtCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtPais.SetFocus;
  if (key = K_CIMA) then
    edtBairro.SetFocus;
  if (key = K_F1) then
    frm_principal.ExibirDica ('   Cidade do cliente; Até 20 caracteres. ',10);
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

procedure Tfrm_edtCliente.edtEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCep.setfocus;
  if (key=38) then
    edtCidade.setfocus;
end;

procedure Tfrm_edtCliente.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
  begin
    if (frm_principal.x_pesquisa_cep) then
      if (trim(edtEndereco.Text) = '') then
        ProcuraCep(trim(edtCep.Text),edtEndereco,edtBairro,edtCidade,cbEstado);
    cbbTipoLogradouro.SetFocus;
  end;
  if (key = K_CIMA) then
    edtNasc.SetFocus;
  if (key = K_F1) then
    frm_principal.ExibirDica ('   Cep do cliente: Formato: 99999-999 ',10);
  if (key = K_F8) then
    if (frm_principal.x_pesquisa_cep) then
      ChamandoF8Cep(edtCep);
end;

procedure Tfrm_edtCliente.cbEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    edtTelefone.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Estado onde reside(mora) o cliente; Até 2 caracteres ou escolha opções clicando na seta. ',15);
end;

procedure Tfrm_edtCliente.edtTelefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtCelular.SetFocus;
  if (key = K_CIMA) then
    edtPais.SetFocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Telefone do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtCelularKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtFax.setfocus;
  if (key=38) then
    edtTelefone.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Celular do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtFaxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtEmail.setfocus;
  if (key=38) then
    edtCelular.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fax do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtIdentidade.setfocus;
  if (key=38) then
    edtFax.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço de e-mail do cliente: digite até 30 caracteres. ',15);
end;

procedure Tfrm_edtCliente.edtIdentidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
   if edtOrgExped.ReadOnly then
     Salvarocliente1.Click
   else
     edtOrgExped.setfocus;  

  if (key=38) then
    edtEmail.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   RG do cliente: Digite até 25 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtExpedicaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtOrgExped.setfocus;
  if (key=38) then
    edtIdentidade.setfocus;
end;

procedure Tfrm_edtCliente.edtOrgExpedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    cbEstadoCivil.setfocus;
  if (key=38) then
    edtIdentidade.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Orgão emissor do RG do cliente: Digite até . ',15);
end;

procedure Tfrm_edtCliente.edtCpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNome.setfocus;
  if (key=38) then
    edtCodigo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cpf do cliente; Formato: 999.999.999-99 ',10);
end;

{Tratamento diferenciado ***}
procedure Tfrm_edtCliente.cbEstadoCivilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    edtConjuge.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Estado civil do cliente: escolha entre as opções disponíveis. ',15);
end;

{Tratamento diferenciado ***}
procedure Tfrm_edtCliente.edtOutrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (modoContrato=0) then
      if PodeSetFocus(edtConjuge) then
        edtConjuge.setfocus
      else
        edtPai.setfocus{inclusao};
  if (key=38) then
    cbEstadoCivil.setfocus;
end;

{Tratamento diferenciado ***}
procedure Tfrm_edtCliente.edtConjugeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPai.setfocus;
  if (key=38) then
    cbEstadoCivil.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do conjuge do cliente: até 40 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtPaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtMae.setfocus;
  if (key=38) then
    edtConjuge.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do pai do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtMaeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    btnProsseguirclick(sender);
  if (key=38) then
    edtPai.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome da mãe do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtRef1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtTelRef1.setfocus;
  if (key=38) then
    edtLimCred.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Referência N. 01: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtRef2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtTelRef2.setfocus;
  if (key=38) then
    edtTelRef1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Referência N. 02: até 30 caracteres. ',10);
end;

{Botao de avanco para pagina 2 ***}
procedure Tfrm_edtCliente.btnProsseguirClick(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;

{Botao de retorno para pagina 1 ***}
procedure Tfrm_edtCliente.BitBtn2Click(Sender: TObject);
begin
  fichario.activepage:=pagina1;
  edtRef2.setfocus;
end;

{No evento OnChange do objeto combobox, a escolha entre outros é verificada ***}
{Tratamento de data personalizada ***}
procedure Tfrm_edtCliente.edtNascExit(Sender: TObject);
begin
  if (not IsDate (edtNasc.text) and (edtNasc.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de nascimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      fichario.activepage:=pagina1;
      edtNasc.setfocus;
    except
    end;
  end;
end;

{No evento OnExit do codigo, é verificada a presenca de uma foto do cliente }
{cadastrada no sistema, na pasta \FOTOS}
{Botao de ativacao da rotina de geracao automatica das prestacoes devidas ***}
{pelo cliente em questaio - }
procedure Tfrm_edtCliente.btnGerarPrestacoesClick(Sender: TObject);
begin
  Gerarprestacoes1.click;
end;

procedure Tfrm_edtCliente.edtNomeEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCargo.setfocus;
  if (key=38) then
    btnRetornarClick(sender);
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome da empresa onde trabalha o cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtEndEmp.setfocus;
  if (key=38) then
    edtNomeEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do cargo ocupado pelo cliente: até 20 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtEndEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtAdmissaoEmp.setfocus;
  if (key=38) then
    edtCargo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço de trabalho do cliente; Informe Rua ou Av., e Numero - Até 50 caracteres. ',15);
end;

procedure Tfrm_edtCliente.edtAdmissaoEmpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtTelEmp.setfocus;
  if (key=38) then
    edtEndEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de admissão no emprego: formato 99/99/9999. ',15);
end;

procedure Tfrm_edtCliente.edtTelEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRamal.setfocus;
  if (key=38) then
    edtAdmissaoEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone do trabalho do cliente: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtBairroEmpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCartProf.setfocus;
  if (key=38) then
    edtTelEmp.setfocus;
end;

procedure Tfrm_edtCliente.edtCartProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSalario.setfocus;
  if (key=38) then
    edtRamal.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. da carteira profissional: Digite até 20 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtSerieCartProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSalario.setfocus;
  if (key=38) then
    edtCartProf.setfocus;
end;

procedure Tfrm_edtCliente.edtSalarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtLimCred.setfocus;
  if (key=38) then
    edtCartProf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Salário do cliente: formato 99,99. ',15);
end;

procedure Tfrm_edtCliente.edtLimCredKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRef1.setfocus;
  if (key=38) then
    edtSalario.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Limite de crédito do cliente: formato 99,99. ',15);
end;

procedure Tfrm_edtCliente.edtTelRef1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRef2.setfocus;
  if (key=38) then
    edtRef1.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone da ref. 01: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtTelRef2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtObs.setfocus;
  if (key=38) then
    edtRef2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone da ref. 02: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente.edtObsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    if (btnDadosComp.visible) then
      btnDadosComp.click
    else
      edtLivre.setfocus{************************************ - alteracao: 16/07/2003}{********************************************};
  if (key=38) then
    edtTelRef2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Observação adicional ao cadastro: até 50 caracteres. ',10);
end;

{Botao 2 de prosseguir no cadastro ***}
procedure Tfrm_edtCliente.btnProsseguir2Click(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;

{Botao de Retorno a pagina 1}
procedure Tfrm_edtCliente.btnRetornarClick(Sender: TObject);
begin
  Retornacadastro1.click;
end;

{Botao de Retorno a pagina 2}
procedure Tfrm_edtCliente.btnRetornar2Click(Sender: TObject);
begin
  Retornacadastro1.click;
end;

procedure Tfrm_edtCliente.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clContrato: TClassContrato;
  codigo: String;
  continua: Boolean;
//********************************
  clAux: TClassAuxiliar;
  codCliente, codContrato: String;
  verificarModo: Boolean;
  totalValor,totalEntrada: Real;
  entrada: Real;
//********************************
begin
  if (key=13) or (key=40) then
  begin
    atualizaPlano := false;
    if (Trim(edtCodigo.Text) <> '') then
      codCliente := Trim(edtCodigo.Text)
    else
      codCliente := Trim(frm_Consulta1.edtCodCli.Text);
    codContrato   := Trim(edtContrato.Text);
    contratoComum := false;
    //**********VERIFICA SE O CONTRATO JÁ FOI LANÇADO*********************
    clAux := TClassAuxiliar.Create;
    clAux.Conect('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam('SELECT *                      ');
    clAux.AddParam('FROM CRECTABR                 ');
    clAux.AddParam('WHERE (CR_CLIE=:cliente) AND  ');
    clAux.AddParam('      (CR_CODI=:contrato) AND ');
    clAux.AddParam('      (CR_LOJA=:loja)         ');
    clAux.consulta.ParamByName('cliente').AsFloat  := strtofloat(codCliente);
    clAux.consulta.ParamByName('contrato').AsFloat := strtofloat(Trim(edtContrato.Text));
    clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
    if (clAux.Execute) then
    begin
      edtDatContrato.SetFocus;
      frm_principal.jaGravou := true;
      verificarModo          := true;
      modo := 2;
    end
    else
    begin
      //*** VERIFICA SE JÁ LANÇOU A VENDA DO CONTRATO ******************
      clAux.Conect(DataBaseProdutos,self);
      clAux.ClearSql;
      clAux.AddParam('SELECT *                                  ');
      clAux.AddParam('FROM CREDIARIOS                           ');
      clAux.AddParam('WHERE (CR_CLIE=:cliente) AND              ');
      clAux.AddParam('      (CR_CONT=:contrato) AND             ');
      clAux.AddParam('      (CR_LOJA=:loja) AND                 ');
      clAux.AddParam('      (CR_PLAN = '+chr(39)+'0'+chr(39)+') ');
      clAux.consulta.ParamByName('cliente').AsFloat  := strtofloat(codCliente);
      clAux.consulta.ParamByName('contrato').AsFloat := strtofloat(Trim(edtContrato.Text));
      clAux.consulta.ParamByName('loja').AsFloat     := frm_principal.x_loja;
      if (clAux.Execute) then
      begin
        edtContrato.Text         := form_nz(strtofloat(Trim(edtContrato.Text)),6);
        edtLoja.Text             := form_nz(clAux.Result('CR_LOJA'),3);
        edtValMerc.Text          := form_nc(clAux.Result('CR_TOTA'),10);
        edtValEntrada.Text       := form_nc(clAux.Result('CR_VENT'),10);
        edtDatContrato.Text      := datetostr(frm_principal.x_data_trabalho);
        edtQtdeBoleta.Text       := '1';
        btnEditarBoletas.Enabled := false;
        edtLoja.Enabled          := false;
        edtValMerc.Enabled       := false;
        edtValEntrada.Enabled    := false;
        atualizaPlano            := true;
        verificarModo            := false;
        edtDatContrato.SetFocus;
        continua                 := true;
        IniciarGradeLancamentos;
        modo := 0;
        frm_principal.jaGravou   := false;
        contratoComum            := true;
      end
      else
      begin
        modo                   := 0;
        verificarModo          := true;
        frm_principal.jaGravou := false;
        edtValEntrada.ReadOnly := false;
        edtPlano.Text          := '';
        edtNumParc.Text        := '';
        if (Trim(edtValEntrada.Text) <> '') then
          entrada := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada.Text)));
        dataContrato := frm_principal.x_data_trabalho;
      end;
    end;
    clAux.Desconect;
    clAux.Free;
    //***************************************************************************************
    if (Modo=2) and (verificarModo) then
      if (cdCliente=0) then
      begin
        frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
          ,'Aviso',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        Mudaralojaedatadocontraot1.click;
        edtContrato.setfocus;
      end
      else
      begin
        if Trim(edtContrato.text) = '' then
          with TQuery.Create(application) do
            try
              databasename  := 'CREDITO';
              Sql.add ('Select MAX(CR_CODI) as cod from CRECTABR');
              Sql.add ('Where  (CR_CLIE='+inttostr(cdCliente)+')         ');
              open;
              edtcontrato.text := formatfloat('000000',fieldbyname('Cod').AsInteger + 1);
            finally
              destroy;
            end;

        codigo:=sem_brancos(Trim(edtContrato.text));
        if (codigo<>'') then
        begin
          clContrato := TClassContrato.Create;
          with (clContrato) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA,  ');
            AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH,  ');
            AddParam ('       CR_TOT2,CR_VDEV,CR_BOLE,CR_QBOL                                   ');
            AddParam ('From   CRECTABR                                                          ');
            AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+')         ');
            frm_principal.BarraDicas.caption:='Buscando contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
              continua:=true;
              boInsert:=true;
              PodeChamarCheques:=false;
              frm_principal.BarraDicas.caption:='';
              if (btnCancelainclusao1.enabled) then
                HabilitaMenuContrato (false,true,false,true,true,false,true,true)
              else
                HabilitaMenuContrato (true,false,false,true,true,true,true,true);
              if (Trim(pnTipoCad3.caption)<>'') then
                AntPainel:=pnTipoCad3.caption;
              IniciarGradeLancamentos;
              LimparEdits(3);
              pnTipoCad3.caption:=AntPainel;
              edtLoja.setfocus;
              btnEdtGrade.enabled:=false;
              btnCancelGrade.enabled:=false;
              btnSalvarGrade.enabled:=false;
              BitbtnConfirmar.enabled:=false;
            end
            else
            if (flagConsulta) then
            begin
              if (not frm_principal.x_alteracao_contrato_consulta) then
              begin
                frmDialogo.ExibirMensagem ('Contrato já lançado! Alteração de contrato não é permitida neste ponto do sistema! '
                  ,'Salvar',[mbOK]
                  ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                edtContrato.SetFocus;
              end
              else
              begin
                if (frm_principal.x_senha_ger_alt_cons) then
                begin
                  frm_senhaSupervisor.showmodal;
                  if (frm_senhaSupervisor.y_flag) then
                    continua := true
                  else
                    continua := false;
                end
                else
                  continua := true;
                if (not continua) then
                  edtContrato.SetFocus
                else
                begin
                  boInsert:=false;
                  PodeChamarCheques:=true;
                  frm_principal.BarraDicas.caption:='';
                  HabilitaMenuContrato (true,false,true,true,true,true,true,true);
                  if (Cancelarinclusaocontrato1.enabled) then
                    CodigoInclusaoContrato:=0;
                  PreencheEditsContrato (clContrato);
                  PreencheGradeContrato (clContrato.Result('CR_CLIE'),
                    clContrato.Result('CR_CODI'));
                  btnEdtGrade.enabled:=true;
                  btnCancelGrade.enabled:=false;
                  btnSalvarGrade.enabled:=false;
                end;
              end;
            end
            else
            begin
              boInsert:=false;
              PodeChamarCheques:=true;
              frm_principal.BarraDicas.caption:='';
              HabilitaMenuContrato (true,false,true,true,true,true,true,true);
              if (Cancelarinclusaocontrato1.enabled) then
                CodigoInclusaoContrato:=0;
              PreencheEditsContrato (clContrato);
              PreencheGradeContrato (clContrato.Result('CR_CLIE'),
                clContrato.Result('CR_CODI'));
              btnEdtGrade.enabled:=true;
              btnCancelGrade.enabled:=false;
              btnSalvarGrade.enabled:=false;
            end{Quando for alteracao pela consulta, travar se a config. estiver marcada};
            edtContrato.text := form_nz (StrtoFloat(codigo),6);
            if (continua) then
              edtLoja.setfocus
            else
              edtContrato.SetFocus;
            desconect;
            Free;
          end;
        end;
      end{caso nao seja definido, antes, um cliente ***};
    if (Modo=0) and (verificarModo) then
      if (cdCliente=0) then
      begin
        frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
          ,'Cadastro de cliente',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina1;
        edtCodigo.setfocus;
      end
      else
      begin
        if Trim(edtContrato.text) = '' then
          with TQuery.Create(application) do
            try
              databasename  := 'CREDITO';
              Sql.add ('Select MAX(CR_CODI) as cod from CRECTABR');
              Sql.add ('Where  (CR_CLIE='+inttostr(cdCliente)+')         ');
              open;
              edtcontrato.text := formatfloat('000000',fieldbyname('Cod').AsInteger + 1);
            finally
              destroy;
            end;

        codigo:=Trim(edtContrato.text);
        if (codigo<>'') then
        begin
          clContrato := TClassContrato.Create;
          with (clContrato) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA,  ');
            AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH,  ');
            AddParam ('       CR_TOT2,CR_VDEV,CR_BOLE,CR_QBOL                                   ');
            AddParam ('From   CRECTABR                                                          ');
            AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+')         ');
            frm_principal.BarraDicas.caption:='Buscando contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
              continua:=true;
              boInsert:=true;
              PodeChamarCheques:=false;
              frm_principal.BarraDicas.caption:='';
              IniciarGradeLancamentos;
              LimparEdits(3);
              edtValEntrada.Text := floattostr(entrada);
              FormatarZerosDecimais(edtValEntrada);
              edtLoja.text := form_nz(frm_principal.x_loja,3);
              pnTipoCad3.caption:=pnTipoCad2.caption;
              btnEdtGrade.enabled:=false;
              btnCancelGrade.enabled:=false;
              btnSalvarGrade.enabled:=false;
            end
            else
            begin
              if (not frm_principal.x_alteracao_contrato_consulta) then
              begin
                frmDialogo.ExibirMensagem ('Contrato já lançado! Alteração de contrato não é permitida neste ponto do sistema! '
                  ,'Salvar',[mbOK]
                  ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                edtContrato.SetFocus;
              end
              else
              if (frm_principal.x_senha_ger_alt_cons) then
              begin
                frm_senhaSupervisor.showmodal;
                if (frm_senhaSupervisor.y_flag) then
                  continua := true
                else
                  continua := false;
              end
              else
                continua := true;
              if (not continua) then
                edtContrato.SetFocus
              else
              begin
                boInsert:=false;
                PodeChamarCheques:=true;
                frm_principal.BarraDicas.caption:='';
                PreencheEditsContrato (clContrato);
                PreencheGradeContrato (clContrato.Result('CR_CLIE'),
                  clContrato.Result('CR_CODI'));
                btnEdtGrade.enabled:=true;
                btnCancelGrade.enabled:=false;
                btnSalvarGrade.enabled:=false;
              end;
            end;
            if (continua) then
              edtLoja.setfocus
            else
              edtContrato.SetFocus;
            edtContrato.text := form_nz (StrtoFloat(codigo),6);
            desconect;
            Free;
          end;
        end;
      end{caso nao seja definido, antes, um cliente ***};
    if (Modo=1) and (verificarModo) then
      if (cdCliente=0) then
      begin
        frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
          ,'Cadastro de cliente',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina1;
        edtCodigo.setfocus;
      end
      else
      begin
        if Trim(edtContrato.text) = '' then
          with TQuery.Create(application) do
            try
              databasename  := 'CREDITO';
              Sql.add ('Select MAX(CR_CODI) as cod from CRECTABR');
              Sql.add ('Where  (CR_CLIE='+inttostr(cdCliente)+')         ');
              open;
              edtcontrato.text := formatfloat('000000',fieldbyname('Cod').AsInteger + 1);
            finally
              destroy;
            end;

        codigo:=Trim(edtContrato.text);
        if (codigo<>'') then
        begin
          clContrato := TClassContrato.Create;
          with (clContrato) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA,  ');
            AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH,  ');
            AddParam ('       CR_TOT2,CR_VDEV,CR_BOLE,CR_QBOL                                   ');
            AddParam ('From   CRECTABR                                                          ');
            AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+')         ');
            frm_principal.BarraDicas.caption:='Buscando contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
              continua:=true;
              Modo:=0;
              boInsert:=true;
              PodeChamarCheques:=false;
              frm_principal.BarraDicas.caption:='';
              IniciarGradeLancamentos;
              LimparEdits(3);
              edtLoja.text := form_nz(frm_principal.x_loja,3);
              edtDatContrato.Text := DateToStr(frm_principal.x_data_trabalho);
              FormatarZerosDecimais(edtValEntrada);
              pnTipoCad3.caption:=pnTipoCad2.caption;
              btnEdtGrade.enabled:=false;
              btnCancelGrade.enabled:=false;
              btnSalvarGrade.enabled:=false;
            end
            else
            begin
              if (not frm_principal.x_alteracao_contrato_consulta) then
              begin
                frmDialogo.ExibirMensagem ('Contrato já lançado! Alteração de contrato não é permitida neste ponto do sistema! '
                  ,'Salvar',[mbOK]
                  ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                edtContrato.SetFocus;
              end
              else
              if (frm_principal.x_senha_ger_alt_cons) then
              begin
                frm_senhaSupervisor.showmodal;
                if (frm_senhaSupervisor.y_flag) then
                  continua := true
                else
                  continua := false;
              end
              else
                continua := true;
              if (not continua) then
                edtContrato.SetFocus
              else
              begin
                boInsert:=false;
                PodeChamarCheques:=true;
                frm_principal.BarraDicas.caption:='';
                PreencheEditsContrato (clContrato);
                PreencheGradeContrato (clContrato.Result('CR_CLIE'),
                  clContrato.Result('CR_CODI'));
                btnEdtGrade.enabled:=true;
                btnCancelGrade.enabled:=false;
                btnSalvarGrade.enabled:=false;
              end;
            end;
            if (continua) then
              edtLoja.setfocus
            else
              edtContrato.SetFocus;
            edtContrato.text := form_nz (StrtoFloat(codigo),6);
            desconect;
            Free;
          end;
        end;
      end{caso nao seja definido, antes, um cliente ***};

  end;
  if (key=38) then
    if (Modo=0) then
    begin
      fichario.activepage:=pagina2;
      edtObs.setfocus;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do contrato: Formato: 999999 (Até 06 dígitos) - <F8/Duplo clique> Exibe clientes cadastrados ',10);
end;

procedure Tfrm_edtCliente.edtDataContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPortador.setfocus;
  if (key=38) then
    edtLoja.setfocus;
end;

procedure Tfrm_edtCliente.edtNotaFiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSerieNota.setfocus;
  if (key=38) then
    edtDatContrato.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número da nota fiscal:  até 08 dígitos',10);
end;

procedure Tfrm_edtCliente.edtSerieNotaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtQtdeBoleta.setfocus;
  if (key=38) then
    edtNotaFiscal.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nº de série da nota fiscal: 01 caractere apenas. ',10);
end;

procedure Tfrm_edtCliente.edtAvalistaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPortador.setfocus;
  if (key=38) then
    edtSerieNota.setfocus;
end;

procedure Tfrm_edtCliente.edtPortadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    if (edtValmerc.Enabled) then
      edtValMerc.setfocus
    else
      edtPlano.SetFocus;
  if (key=38) then
    edtCodAval.setfocus;
  if (key=K_F8) then
  begin
    with (frm_f8Port) do
    begin
      left:=287;
      top :=76;
      edit:=edtPortador;
      btnCadastro.visible:=true;
      showmodal;
      edtPortador.SetFocus;
    end;
    edtValMerc.SetFocus;
  end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do portador: Formato: 9999 (Até 04 dígitos) - <F8/Duplo clique> Exibe portadores cadastrados ',10);
end;

procedure Tfrm_edtCliente.edtValMercKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtValEntrada.setfocus;
  if (key=38) then
    edtPortador.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor do contrato: Formato: 999,99  ',10);
end;

procedure Tfrm_edtCliente.edtValEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPlano.setfocus;
  if (key=38) then
    edtValMerc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor da entrada: Formato: 999,99  ',10);
end;

procedure Tfrm_edtCliente.edtPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
    if (Trim(edtPlano.Text) <> '') then
      frm_InfBoletaVenda.codigoPlano := strtofloat(Trim(edtPlano.Text));
    edtNumParc.setfocus;
  end;
  if (key=K_CIMA) then
    if (edtValEntrada.Enabled) then
      edtValEntrada.setfocus
    else
      edtPortador.SetFocus;
  if (key=K_F8) then
    with (frm_f8Planos) do
    begin
      edit:=edtPlano;
      btnCadastro.visible:=false;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano: Formato: 999 (Até 03 dígitos) - <F8/Duplo clique> Exibe planos cadastrados  ',10);
end;

procedure Tfrm_edtCliente.edtNumParcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clPrest: TClassPrestacoes;
  numprest,codplan: String;
  continua: Boolean;
begin
  continua := true;
  if (key=13) then
  begin
    clPrest  := TClassPrestacoes.Create;
    codplan  := Trim(edtPlano.text);
    numprest := Trim(edtNumParc.text);
    if (numprest<>'0') and (numprest <> '') then
    begin
      if (codplan<>'') then
      begin
        with (clPrest) do
        begin
          conect ('CREDITO', self);
          ClearSql;
          AddParam ('Select PR_CODI,PR_NPRE,PR_PERI,PR_FATO                  ');
          AddParam ('From   CREDPREST                                        ');
          AddParam ('Where  (PR_CODI='+codplan+') AND (PR_NPRE='+numprest+') ');
          if (Execute) then
//                   edtFator.text := form_nc (Result('PR_FATO'),8);
            edtNumParc.text := form_nz (StrtoFloat(numprest),2);

          clearsql;
          AddParam ('Select PL_QTPR                    ');
          AddParam ('From   CREDPLANO                  ');
          AddParam ('Where  (PL_CODI='+codplan+') ');
          execute;
          if (Result('PL_QTPR') > 0) and (StrtoFloat(edtNumParc.text) > Result('PL_QTPR')) then
          begin
            frmDialogo.ExibirMensagem ('O número de parcelas não pode ser maior do que o número informado no plano '+FloatToStr(Result('PL_QTPR'))+' !'
              ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua := false;
          end;
        end;
        clprest.desconect;
        clprest.Free;
      end;
    end
    else
    begin
      frmDialogo.ExibirMensagem ('O número de parcelas não pode ser ZERO!'
        ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      continua := false;
    end;
    if (continua) then
      Gerarprestacoes1.click
    else
    begin
      edtNumParc.SetFocus;
      edtNumParc.SetFocus;
    end;   
  end;
  if (key=38) then
    edtPlano.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nº de parcelas do plano: formato 99 (Até 02 dígitos) ',10);
end;

procedure Tfrm_edtCliente.edtFatorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{     if (key=13) then Gerarprestacoes1.click;
     if (key=38) then edtNumParc.setfocus;
     if (key=K_F1) then
        frm_principal.ExibirDica ('   Fator de juros das prestações: Formato; 9,99. ',10);}
end;

procedure Tfrm_edtCliente.edtPortadorExit(Sender: TObject);
var
  clPort: TClassPort;
  codigo: String;
begin
  codigo:=Trim(edtPortador.text);
  if (codigo<>'') then
    with (clPort) do
    begin
      clPort := TClassPort.Create;
      conect ('CREDITO', self);
      ClearSql;
      AddParam ('Select PO_CODI,PO_NOME ');
      AddParam ('From CREPORT ');
      AddParam ('Where (PO_CODI='+codigo+')');
      frm_principal.BarraDicas.caption:='Buscando portador...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
        pnPortador.caption := '<Portador nao encontrado>'
      else
        pnPortador.caption := Result('PO_NOME');
      frm_principal.BarraDicas.caption:='';
      if (codigo<>'') then
        edtPortador.text:=form_nz (StrtoFloat(codigo),4)
      else
        edtPortador.text:='';
      desconect;
      Free;
    end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF82.visible:=false;
  lbF8Mens2.visible:=false;
end;

{Procedimento de limpeza da pagina 1 ***}
procedure Tfrm_edtCliente.LimparEdits (pagina: Integer);
begin
  if (pagina=1) then
  begin
    edtCpf.Text         := '';
    edtNome.text        := '';
    edtEndereco.text    := '';
    edtNumero.Text      := '';
    edtComplemento.Text := '';
    edtBairro.text      := '';
    edtCidade.text      := '';
    edtUF.Text          := '';
    edtPais.Text        := '';
    cbEstado.text       := '';
    edtCep.text         := '';
    if (Length(cbbTipoLogradouro.Text)>0) then
    begin
      cbbTipoLogradouro.Clear;
      PreencheComboTipoLogradouro;
    end;
    edtSexo.text        := '';
    edtNasc.text        := '';
    edtTelefone.text    := '';
    edtCelular.text     := '';
    edtFax.text         := '';
    edtEmail.text       := '';
    edtIdentidade.text  := '';
    edtOrgExped.text    := '';
    cbEstadoCivil.text  := '';
    edtConjuge.text     := '';
    edtPai.text         := '';
    edtMae.text         := '';

    if (pnTipoCad1.visible) then
      pnTipoCad1.caption :='';
    pnDesatualizado.visible:=false;
    edtEndereco.color:=clWhite;
    edtEndereco.font.color:=clBlack;
    edtBairro.color:=clWhite;
    edtBairro.font.color:=clBlack;
    edtCidade.color:=clWhite;
    edtCidade.font.color:=clBlack;
       {******************************** - alteracao: 16/07/2003}
    lblEndereco.caption := 'Endereço';
    lblNome.caption     := 'Nome';
       {***********************************}
  end
  else
  if (pagina=2) then
  begin
    edtNomeEmp.text       := '';
    edtCargo.text         := '';
    edtEndEmp.text        := '';
    edtAdmissaoEmp.text   := '';
    edtTelEmp.text        := '';
    edtCartProf.text      := '';
    edtSalario.text       := '';
    edtLimCred.text       := '';
    pnSaldoDevedor.caption:= '';
    edtRef1.text          := '';
    edtTelRef1.text       := '';
    edtRef2.text          := '';
    edtTelRef2.text       := '';
    edtObs.text           := '';
    LimparObservacoes;
    if (pnTipoCad2.visible) then
      pnTipoCad2.caption :='';
    edtSpc.text           := '';
    edtCfun.text          := '';
    edtTPro.text          := '';
    edtPDC.text           := '';
    edtLivre.text         := '';
    pnDSPC.caption        := '';
    pnDtca.caption        := '';
    pnUltc.caption        := '';
    pnQtdc.caption        := '';
    pnValidade.caption    := '';
       {******************************** - alteracao: 16/07/2003}
    btnDadosComp.visible:=false;
       {***********************************}
  end
  else
  if (pagina=3) then
  begin
    edtContrato.text      := '';
//       edtLoja.text          := '';
    edtDatContrato.text   := '';
//       edtNotaFiscal.text    := '';
//       edtSerieNota.text     := '';
    edtCodAval.text       := '';
    edtPortador.text      := '';
    pnPortador.caption    := '';
    pnAval.caption        := '';
    pnPlano.caption       := '';
    pnTotalDevido.caption := '';
    if (valor_do_contrato_renegociacao=0) and (not edtValMerc.readonly) then  //em renegociacao ele nunca limpa
      edtValMerc.text    := '';
    if (not edtValEntrada.readonly) then
      edtValEntrada.text := '';
//       edtPlano.text         := '';
    pnPlano.caption       := '';
//       edtNumParc.text       := '';
//       edtFator.text         := '';
    if (pnTipoCad3.visible) then
      pnTipoCad3.caption :='';
    lbl_cpf.caption := 'CNPJ do cliente: ';
    lbl_banco.caption := 'Banco/Agência: ';
  end;
end;

{Ao sair do edit do plano, exibe no painel, o tipo de plano de pgto ***}
procedure Tfrm_edtCliente.edtPlanoExit(Sender: TObject);
var
  clAux: TClassContrato;
  clPlano: TClassPlano;
  clPrest: TClassPrestacoes;
  codigo: String;
  continua: Boolean;
begin
  codigo:=Trim(edtPlano.text);
  if (codigo<>'') then
  begin
    if (VerificaRestricaoQtdeMaximaCrediario(StrToFloat(Trim(edtPlano.Text)))>0) then
    begin
      if (InformaQtCredAberto(cdCliente,StrToFloat(Trim(edtPlano.Text))))>=(VerificaRestricaoQtdeMaximaCrediario(StrToFloat(Trim(edtPlano.Text)))) then
      begin
        frmDialogo.ExibirMensagem ('Limite máximo de contrato em aberto atingido!'
          ,'Limite de Contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.ActivePage := pagina1;
        edtCodigo.SetFocus;
        continua := false;
      end
      else
        continua := true;
    end
    else
      continua := true;
    if (continua) then
      with (clPlano) do
      begin
             {buscando o plano ***}
        clPlano := TClassPlano.Create;
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_TIPO,PL_CHEQ,PL_CARN,PL_LOCA  ');
        AddParam ('From   CREDPLANO                                ');
        AddParam ('where (PL_CODI='+codigo+')                      ');
        cdCheq:=0;
        cdCarn:=0;
        if (not Execute) then
          pnPlano.caption := '<Plano nao encontrado>'
        else
        begin
                  {verificando se o plano tem cheque ***}
          pnPlano.caption := Result('PL_TIPO');
          cdCheq := strtoint(Result('PL_CHEQ'));
          flagEditCheq := Result('PL_CHEQ');

                  {verifica se permite imprimir carnet ou nao ***}
                  {Se permitir carnet e se for local --}
          cdCarn := strtoint(Result('PL_CARN'));
          if (Result('PL_LOCA')='1') then
            cdCarn:=0;

                  {buscando a ultima prestacao ***}
          clPrest  := TClassPrestacoes.Create;
          with (clPrest) do
          begin
            conect ('CREDITO', self);
            ClearSql;
            AddParam ('Select PR_CODI,PR_NPRE,PR_PERI,PR_FATO   ');
            AddParam ('From   CREDPREST                         ');
            AddParam ('Where  (PR_CODI='+codigo+')              ');
            AddParam ('Order By PR_NPRE                         ');
            if (Execute) then
            begin
              last;
              edtNumParc.text := '';
              if (Trim(edtNumParc.text)='') then
                edtNumParc.text := form_nz(Result('PR_NPRE'),2);
              edtNumParc.SetFocus;
            end
            else
              edtNumParc.text := '00';
            desconect;
            Free;
          end;
        end;
        edtPlano.text := form_nz (StrtoFloat(codigo),3);
        desconect;
        Free;
      end;
  end
  else
    edtNumParc.text := '0';
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF82.visible:=false;
  lbF8Mens2.visible:=false;
end;

{Menu invisivel do formulario ***}
procedure Tfrm_edtCliente.Limpareditspagina11Click(Sender: TObject);
begin
  if (fichario.activepage=pagina1) then
  begin
    pnTipoCad1.caption:='';
    edtCodigo.text:='';
    edtCpf.text   :='';
    LimparEdits(1);
    edtCodigo.setfocus;

  end;
  if (fichario.activepage=pagina2) then
  begin
    EdtNomeEmp.setfocus;
    LimparEdits(2);
  end;
  if (fichario.activepage=pagina3) then
  begin
    antdifpdev := 0;
    AntPainel:=pnTipoCad3.caption;
    pnTipoCad3.caption:=AntPainel;
    IniciarGradeLancamentos;
    edtContrato.setfocus;
         //LimparEdits(3);
  end;
end;

{Duplo clique no botao de sair, fecha o formulario}
{Procedimento que preenche os edits do formulario com as informacoes}
{presentes nos campos da classe cliente do mesmo formulario}
{Para tanto, a classe deve ter sido inicializada ou uma excecao sera gerada ***}
procedure Tfrm_edtCliente.PreencheEditsCliente (classe: TClassCliente; pagina: Integer);
var
  cpf: String;
begin
  if (pagina=1) then
  begin
    edtCodigo.text     := inttostr(classe.Result('CL_CODI'));
    edtCpf.text        := classe.Result('CL_CPF');
    {********************************* - alteracao: 16/07/2003}
    cpf:=Trim(edtCpf.text);
    if (Length(cpf)<=11) then
    begin
      lblEndereco.caption  :='Endereço';
      lblNome.caption      :='Nome';
      btnDadosComp.visible :=false;
    end
    else
    begin
      lblEndereco.caption :='Endereço p/ entrega';
      lblNome.caption     :='Razão Social';
      btnDadosComp.visible:=true;
    end;
    {***********************************}
    edtNome.Text       := classe.Result('CL_NOME');
    antNome            := Trim(edtNome.text);
    edtSexo.Text       := classe.Result('CL_SEXO');
    if (classe.Result('CL_DTNA')<>StrToDate('01/01/1900')) then
      edtNasc.Text    := DateToStr(classe.Result('CL_DTNA'))
    else
      edtNasc.Text  := '';
    edtCep.Text        := classe.Result('CL_CEP');
    cbbTipoLogradouro.ItemIndex := cbbTipoLogradouro.Items.IndexOf(classe.Result('CL_TIPO_LOGRADOURO'));
    edtEndereco.Text       := classe.Result('CL_ENDE');
    edtNumero.Text         := IntToStr(classe.Result('CL_NUMERO'));
    edtComplemento.Text    := classe.Result('CL_COMPLEMENTO');
    edtBairro.Text         := classe.Result('CL_BAIR');
    edtCidade.Text         := classe.Result('CL_CIDA');
    edtUF.Text             := classe.Result('CL_ESTA');
    lblCodCidadeIBGE.Caption := IntToStr(classe.Result('CL_IBGE_CIDADE'));
    lblCodUFIBGE.Caption := IntToStr(classe.Result('CL_IBGE_UF'));
    edtPais.Text       := classe.Result('CL_PAIS');
    lblCodPais.Caption := classe.Result('CL_CODIGO_PAIS');
    edtTelefone.Text   := classe.Result('CL_FONE');
    edtCelular.Text    := classe.Result('CL_CELU');
    edtFax.Text        := classe.Result('CL_FAX');
    edtEmail.Text      := classe.Result('CL_EMAI');
    edtIdentidade.Text := classe.Result('CL_IDEN');
    edtOrgExped.Text   := classe.Result('CL_OEXP');

    if (classe.Result('CL_ECIV')='0') then
      cbEstadoCivil.text:='SOLTEIRO'
    else
    if (classe.Result('CL_ECIV')='1') then
      cbEstadoCivil.text:='CASADO'
    else
    if (classe.Result('CL_ECIV')='2') then
      cbEstadoCivil.text:='SEPARADO'
    else
    if (classe.Result('CL_ECIV')='3') then
      cbEstadoCivil.text:='VIUVO'
    else
    if (classe.Result('CL_ECIV')='4') then
      cbEstadoCivil.text:='OUTROS...';


    edtConjuge.text    := classe.Result('CL_CONJ');
    edtPai.text        := classe.Result('CL_NPAI');
    edtMae.text        := classe.Result('CL_NMAE');
    if (classe.Result('CL_ALTE')='1') then
    begin
      pnDesatualizado.visible:=true;
      edtEndereco.color:=clRed;
      edtEndereco.font.color:=clWhite;
      edtBairro.color:=clRed;
      edtBairro.font.color:=clWhite;
      edtCidade.color:=clRed;
      edtCidade.font.color:=clWhite;
    end
    else
    if (classe.Result('CL_ALTE')='0') then
    begin
      pnDesatualizado.visible:=false;
      edtEndereco.color:=clWhite;
      edtEndereco.font.color:=clBlack;
      edtBairro.color:=clWhite;
      edtBairro.font.color:=clBlack;
      edtCidade.color:=clWhite;
      edtCidade.font.color:=clBlack;
    end;
  end
  else
  if (pagina=2) then
  begin
    edtNomeEmp.text  := classe.Result('CL_EMPR');
    edtCargo.text    := classe.Result('CL_CARG');
    edtEndEmp.text   := classe.Result('CL_EEMP');
    edtTelEmp.text   := classe.Result('CL_FEMP');
    edtRamal.text    := classe.Result('CL_REMP');
    edtCartProf.text := classe.Result('CL_CPRO');
    edtSalario.text  := form_nc(classe.Result('CL_SALA'),10);
    edtLimCred.text  := form_nc(classe.Result('CL_LIMC'),10);
    pnSaldoDevedor.caption := form_nc(InformaSaldoDevedor(classe.Result('CL_CODI'),-1,false),10);
    edtRef1.text     := classe.Result('CL_REF1');
    edtTelRef1.text  := classe.Result('CL_TRF1');
    edtRef2.text     := classe.Result('CL_REF2');
    edtTelRef2.text  := classe.Result('CL_TRF2');
    edtObs.text      := classe.Result('CL_OBSE');
    PreencheObservacoes(classe.Result('CL_CODI'));
    if (classe.Result('CL_DADM')<>StrToDate('01/01/1900')) then
      edtAdmissaoEmp.text := DateToStr(classe.Result('CL_DADM'));
    edtSpc.text      := classe.Result('CL_RSPC');
    edtCfun.text     := classe.Result('CL_CFUN');
    edtTpro.text     := classe.Result('CL_TPRO');
    edtPDC.text      := classe.Result('CL_PDC');
    edtLivre.text    := classe.Result('CL_LIVR');
    if (classe.Result('CL_DSPC')<>strtodate('01/01/1900')) then
      pnDSPC.caption := form_data(classe.Result('CL_DSPC'))
    else
      pnDSPC.caption := '';
    if (classe.Result('CL_DTCA')<>strtodate('01/01/1900')) then
      pnDtca.caption := form_data(classe.Result('CL_DTCA'))
    else
      pnDtca.caption := '';
    if (classe.Result('CL_ULTC')<>strtodate('01/01/1900')) then
      pnUltc.caption := form_data(classe.Result('CL_ULTC'))
    else
      pnUltc.caption := '';
    pnQtdc.caption := form_t(classe.Result('CL_QTDC'),5);
    pnValidade.caption := form_data(classe.Result('CL_VALI'));
  end;
end;

{inicializando a grade de lancamentos de prestacoes devidas ***}
procedure Tfrm_edtCliente.IniciarGradeLancamentos;
var
  ind: Integer;
begin
  ind:=1;
  with (grade_lancamentos) do
  begin
    while (ind<rowcount) do
    begin
      Rows[ind].Clear;
      ind:=ind+1;
    end;
    Cells[0,0] := 'Prestações';
    Cells[1,0] := 'Valor';
    Cells[2,0] := 'Vencto.';
    Cells[3,0] := 'Cheque';
    rowcount := 2;
  end;
end;

{Verificando formatacao da data ***}
procedure Tfrm_edtCliente.edtAdmissaoEmpExit(Sender: TObject);
begin
  if (not IsDate (edtAdmissaoEmp.text) and (edtAdmissaoEmp.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data de admissão',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      fichario.activepage:=pagina2;
      edtAdmissaoEmp.setfocus;
    except
    end;
  end;
end;

{Verificando formatacao de numero com virgula como ponto decimal ***}
procedure Tfrm_edtCliente.edtSalarioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtSalario);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente.edtLimCredKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtLimCred);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente.edtValMercKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValMerc);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente.edtValEntradaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (edtValEntrada);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente.edtFatorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//     FormatarEditNumerico (edtFator);
end;

{Formata o resultado, em termos de casas decimais ***}
procedure Tfrm_edtCliente.edtSalarioExit(Sender: TObject);
var
  limite,valor: Real;
begin
  FormatarZerosDecimais (edtSalario);

     {sugerindo o limite de credito ***}
  if (Trim(edtSalario.text)<>'') then
  begin
    valor  := strtofloat(RetiraFormatacaoNumero(Trim(edtSalario.text)));
    if (frm_principal.x_perc_lim_cred<>0) then
    begin
      limite := (frm_principal.x_perc_lim_cred*valor)/100;
      edtLimCred.text := form_nc(limite,10);
    end;
  end
  else
    edtLimCred.text:='0,00';
end;

{Formata o resultado, em termos de casas decimais ***}
procedure Tfrm_edtCliente.edtLimCredExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtLimCred);
end;

{Navegacao-}
procedure Tfrm_edtCliente.edtValMercExit(Sender: TObject);
var
  valor_mercadoria: Real;
begin
  RetiraFormatacaoNumero (edtValMerc.text);
  FormatarZerosDecimais (edtValMerc);

     {CRITICA PARA RENEGOCIACAO APENAS}
  if (valor_do_contrato_renegociacao<>-1) then
  begin
    edtValMerc.readonly := true;
    if (trim(edtValMerc.text)<>'') then
      valor_mercadoria := strtofloat(RetiraFormatacaoNumero(trim(edtValMerc.text)))
    else
      valor_mercadoria := 0.00;
    if (valor_mercadoria<valor_do_contrato_renegociacao) then
    begin
      frmDialogo.ExibirMensagem (' Valor da mercadoria não pode ser menor que '+form_nc(valor_do_contrato_renegociacao,10)+'! '
        ,'Valor mercadoria',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      try
        fichario.activepage:=pagina3;
        edtValMerc.setfocus;
      except
      end;
    end;
  end;
end;

{Navegacao-}
{O valor da entrada deve ser sempre menor que o valor do contrato---}
procedure Tfrm_edtCliente.edtValEntradaExit(Sender: TObject);
begin
     {... Formatacao}
  RetiraFormatacaoNumero (edtValEntrada.text);
  FormatarZerosDecimais (edtValEntrada);
end;

{Navegacao-}
procedure Tfrm_edtCliente.edtFatorExit(Sender: TObject);
begin
//     FormatarZerosDecimais (edtFator);
end;

{Ativacao do formulario ***}
procedure Tfrm_edtCliente.FormActivate(Sender: TObject);
var
  vkey:Word;
begin
  edtQtdeBoleta.Text := '1';
  if (Modo=0) then {Config. no LANCAMENTO DE CLIENTES E CONTRATOS}
  begin
    pagina1.tabvisible  := true;
    pagina2.tabvisible  := true;
    pagina3.tabvisible  := true;
    pagina5.tabvisible  := true;
    BitbtnProsseguir2.visible := true;
    botao_sair.visible  := false;
    bitbtnRetornar2.visible := true;
    btnIncluir2.visible := false;
    btnCancelainclusao2.visible := false;
    btnExcluir2.visible := false;
    btnSalvar.Visible := True;
    btnSalvar2.visible := true;
    btnImprimir2.visible := false;
    btnImpIndiv2.visible := false;
    btnIncluir1.visible := false;
    btnCancelainclusao1.visible := false;
    btnExcluir1.visible := false;
    btnSalvar1.visible := true;
    btnImpCarnet.visible := true;
    fichario.activepage := pagina1;
    pnMensForm00.visible := true;
    pnMensForm01.visible := false;
    pnMensForm10.visible := true;
    pnMensForm11.visible := false;
    pnMensForm20.visible := true;
    pnMensForm22.visible := false;
    pnTipoCad1.visible := true;
    pnTipoCad2.visible := true;
    pnTipoCad3.visible := true;
    formulario11.visible := false;
    formulario21.visible := false;
    Lancamentos.visible  := false;
    edtCpf.SetFocus;
    edtCodigo.setfocus;
    if (btnSalvar1.Glyph.Empty) then
      btnSalvar1.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnSalvar2.Glyph.Empty) then
      btnSalvar2.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnSalvar.Glyph.Empty) then
      btnSalvar.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (frm_MenuPrincipal_OpcaoCrediario<>nil) then
    begin
      if (frm_MenuPrincipal_OpcaoCrediario.Modos=1) then
        cont := false
      else
        cont := true;
    end
    else
      cont := true;
    if (cont) then
    begin
      Application.CreateForm (Tfrm_Aux1Contrato, frm_Aux1Contrato);
      if (MostraAuxLoja) then
      begin
        MostraAuxLoja := false;
        frm_aux1Contrato.showmodal;
      end;
      frm_aux1Contrato.Free;
    end;
  end;
  if (Modo=1) then {Config. do forumlario para CADASTRO DE CLIENTE}
  begin
    fichario.activepage := pagina1;
    pagina1.tabvisible  := true;
    pagina2.tabvisible  := true;
    pagina3.tabvisible  := true;
    pagina5.tabvisible  := true;
    bitbtnProsseguir2.visible := true;
    botao_sair.visible  := false;
    btnIncluir2.visible := true;
    btnCancelainclusao2.visible := true;
    btnExcluir2.visible := true;
    btnSalvar.Visible := True;
    btnSalvar2.visible := true;
    btnImprimir2.visible := true;
    btnImpIndiv2.visible := true;
    pnTipoCad1.visible := false;
    pnTipoCad2.visible := false;
    pnMensForm00.visible := false;
    pnMensForm01.visible := true;
    pnMensForm10.visible := false;
    pnMensForm11.visible := true;
    formulario11.visible := false;
    formulario21.visible := false;
    Lancamentos.visible  := false;
    edtCpf.SetFocus;
    edtCodigo.setfocus;
    if (btnIncluir2.Glyph.Empty) then
      btnIncluir2.Glyph := frm_principal_imagens.btnIncluir.Glyph;
    if (btnCancelaInclusao2.Glyph.Empty) then
      btnCancelaInclusao2.Glyph := frm_principal_imagens.btnCancelaInclusao.Glyph;
    if (btnExcluir2.Glyph.Empty) then
      btnExcluir2.Glyph := frm_principal_imagens.btnExcluir.Glyph;
    if (btnSalvar2.Glyph.Empty) then
      btnSalvar2.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnSalvar.Glyph.Empty) then
      btnSalvar.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnImprimir2.Glyph.Empty) then
      btnImprimir2.Glyph := frm_principal_imagens.btnImprimir.Glyph;
    if (btnImpIndiv2.Glyph.Empty) then
      btnImpIndiv2.Glyph := frm_principal_imagens.btnImprimir.Glyph;
    if (not frm_principal.x_alteracao_salario_limite_consulta) then
    begin
      edtSalario.color    := clBtnFace;
      edtSalario.readonly := true;
    end
    else
    begin
      edtSalario.color    := clWhite;
      edtSalario.readonly := false;
    end;
    if (not frm_principal.x_alteracao_limite_credito) then
    begin
      edtLimCred.color    := clBtnFace;
      edtLimCred.readonly := true;
    end
    else
    begin
      edtLimCred.color    := clWhite;
      edtLimCred.readonly := false;
    end;
  end;
  if (Modo=2) then {Config. do forumlario para ALTERAÇÃO DE CONTRATOS}
  begin
    fichario.activepage:=pagina3;
    pagina1.tabvisible  := false;
    pagina2.tabvisible  := false;
    pagina3.tabvisible  := true;
    pagina5.tabvisible  := true;
    bitbtnRetornar2.visible := false;
    btnIncluir1.visible := true;
    btnCancelainclusao1.visible := true;
    btnExcluir1.visible := true;
    btnSalvar1.visible := true;
    btnImpCarnet.visible := true;
    pnTipoCad3.visible := false;
    pnMensForm20.visible := false;
    pnMensForm22.visible := true;
    formulario11.visible := false;
    formulario21.visible := false;
    Lancamentos.visible  := false;
    Label69.Visible:= false;
    pnTipoCad3.visible := true;
    edtContrato.setfocus;
    if (btnIncluir1.Glyph.Empty) then
      btnIncluir1.Glyph := frm_principal_imagens.btnIncluir.Glyph;
    if (btnCancelaInclusao1.Glyph.Empty) then
      btnCancelaInclusao1.Glyph := frm_principal_imagens.btnCancelaInclusao.Glyph;
    if (btnExcluir1.Glyph.Empty) then
      btnExcluir1.Glyph := frm_principal_imagens.btnExcluir.Glyph;
    if (btnSalvar1.Glyph.Empty) then
      btnSalvar1.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (not frm_principal.x_alteracao_salario_limite_consulta) then
    begin
      edtSalario.color    := clBtnFace;
      edtSalario.readonly := true;
    end
    else
    begin
      edtSalario.color    := clWhite;
      edtSalario.readonly := false;
    end;
    if (not frm_principal.x_alteracao_limite_credito) then
    begin
      edtLimCred.color    := clBtnFace;
      edtLimCred.readonly := true;
    end
    else
    begin
      edtLimCred.color    := clWhite;
      edtLimCred.readonly := false;
    end;
  end;
  if (Modo=4) then {RENOVACAO DE DENTRO DA CONSULTA}
  begin
    if (flagConsulta) then
    begin
      if (not frm_principal.x_alteracao_salario_limite_consulta) then
      begin
        edtSalario.color    := clBtnFace;
        edtSalario.readonly := true;
      end
      else
      begin
        edtSalario.color    := clWhite;
        edtSalario.readonly := false;
      end;
      if (not frm_principal.x_alteracao_limite_credito) then
      begin
        edtLimCred.color    := clBtnFace;
        edtLimCred.readonly := true;
      end
      else
      begin
        edtLimCred.color    := clWhite;
        edtLimCred.readonly := false;
      end;
      if (not frm_principal.x_alteracao_observacao_consulta) then
      begin
        edtObs.color    := clBtnFace;
        edtObs.readonly := true;
        btnOutrasObservacoes.enabled := false;
      end
      else
      begin
        edtObs.color    := clWhite;
        edtObs.readonly := false;
        btnOutrasObservacoes.enabled := true;
      end;
    end;
    pagina1.tabvisible  := true;
    pagina2.tabvisible  := true;
    pagina3.tabvisible  := true;
    pagina5.tabvisible  := true;
    bitbtnProsseguir2.visible := true;
    botao_sair.visible  := false;
    bitbtnRetornar2.visible := true;
    btnIncluir2.visible := false;
    btnCancelainclusao2.visible := false;
    btnExcluir2.visible := false;
    btnSalvar2.visible := true;
    btnSalvar.Visible := True;
    btnImprimir2.visible := false;
    btnImpIndiv2.visible := false;
    btnIncluir1.visible := false;
    btnCancelainclusao1.visible := false;
    btnExcluir1.visible := false;
    btnSalvar1.visible := true;
    btnImpCarnet.visible := true;
    fichario.activepage := pagina1;
    pnMensForm00.visible := true;
    pnMensForm01.visible := false;
    pnMensForm10.visible := true;
    pnMensForm11.visible := false;
    pnMensForm20.visible := true;
    pnMensForm22.visible := false;
    pnTipoCad1.visible := true;
    pnTipoCad2.visible := true;
    pnTipoCad3.visible := true;
    formulario11.visible := false;
    formulario21.visible := false;
    Lancamentos.visible  := false;
    edtCodigo.setfocus;
    if (btnSalvar1.Glyph.Empty) then
      btnSalvar1.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnSalvar2.Glyph.Empty) then
      btnSalvar2.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    if (btnSalvar.Glyph.Empty) then
      btnSalvar.Glyph := frm_principal_imagens.btnSalvar.Glyph;
    Modo:=0;
  end;
  PodeFecharForm:=true;
  DefinirAtalhos (Modo);
  vkey := 13;
  if (frm_MenuPrincipal_OpcaoCrediario<>nil) then
  begin
    if (frm_MenuPrincipal_OpcaoCrediario.Modos=1) then
      cont := false
    else
      cont := true;
  end
  else
    cont := true;
  if (cont) then
  begin
    if frm_principal.clienteaut then
    begin
      if trim(edtCodigo.text) = '' then
        if Trim(frm_consulta1.edtcodcli.text) <> '' then
          edtCodigo.text := frm_consulta1.edtcodcli.text
        else
        if Trim(frm_consulta1.edtcpf.text) <> '' then

          with Tquery.create(application) do
            try
              databasename := 'CREDITO';
              sql.add('Select cl_codi from crecli where cl_cpf = '''+Trim(frm_consulta1.edtcpf.text)+''' ');
              open;
              edtCodigo.text := fieldbyname('Cl_Codi').AsString;
            finally
              destroy;
            end;
      edtCodigo.onkeydown(edtcodigo,vkey,[]);
      if (fichario.activepageindex = 0) and frm_consulta1.edtCpf.canfocus and (trim(frm_consulta1.edtCpf.text) <> '') then
      begin
        edtcpf.text := trim(frm_consulta1.edtCpf.text);
        edtcpf.onkeydown(edtcpf,vkey,[]);
      end;
      frm_principal.clienteaut := false;
    end;
    if (Modo<>2) then
    begin
      edtCpf.SetFocus;
      edtCodigo.SetFocus;
    end;
  end;

end;

{Buscando o numero da parcela}
procedure Tfrm_edtCliente.edtNumParcExit(Sender: TObject);
var
  clPrest: TClassPrestacoes;
  numprest,codplan: String;
begin
  nunprestacao := StrToInt(edtNumParc.Text);
{     clPrest  := TClassPrestacoes.Create;
     codplan  := Trim(edtPlano.text);
     numprest := Trim(edtNumParc.text);
     if (numprest<>'') then
     begin
        if (codplan<>'') then
        begin
            with (clPrest) do
            begin
                 conect ('CREDITO', self);
                 ClearSql;
                 AddParam ('Select PR_CODI,PR_NPRE,PR_PERI,PR_FATO                  ');
                 AddParam ('From   CREDPREST                                        ');
                 AddParam ('Where  (PR_CODI='+codplan+') AND (PR_NPRE='+numprest+') ');
                 if (Execute) then
//                   edtFator.text := form_nc (Result('PR_FATO'),8);
                 edtNumParc.text := form_nz (StrtoFloat(numprest),2);

                 clearsql;
                 AddParam ('Select PL_QTPR                    ');
                 AddParam ('From   CREDPLANO                  ');
                 AddParam ('Where  (PL_CODI='+codplan+') ');
                 execute;
                 if (Result('PL_QTPR') > 0) and (StrtoFloat(edtNumParc.text) > Result('PL_QTPR')) then begin
                    frmDialogo.ExibirMensagem ('O número de parcelas não pode ser maior do que o número informado no plano '+FloatToStr(Result('PL_QTPR'))+' !'
                     ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
                    edtNumParc.setfocus;
                 end;
            end;
            clprest.desconect;
            clprest.Free;
        end;
     end
     else
     begin
          frmDialogo.ExibirMensagem ('O número de parcelas não pode ser ZERO!'
           ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtNumParc.setfocus;
     end;        }
end;

procedure Tfrm_edtCliente.edtCodAvalEnter(Sender: TObject);
begin
  edtCodAval.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe avalistas cadastrados';
  lbF82.visible:=true;
  lbF8Mens2.visible:=true;
  lbF8Mens2.caption:='exibe avalistas cadastrados';
end;

procedure Tfrm_edtCliente.edtCodAvalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPortador.setfocus;
  if (key=38) then
    edtQtdeBoleta.setfocus;
  if (key=K_F8) then
    with (frm_f8Avalistas) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodAval;
      showmodal;
      edtCodAval.SetFocus;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do avalista: Formato: 999999 (Até 06 dígitos) - <F8/Duplo clique> Exibe avalistas cadastrados ',10);
end;

{Evento onExit}
{Evento onexit do codigo do avalista}
procedure Tfrm_edtCliente.edtCodAvalExit(Sender: TObject);
var
  clClie: TClassCliente;
  codigo: String;
begin
  codigo:=Trim(edtCodAval.text);
  if (codigo<>'') then
     {clClie := TClassCliente.Create;
        with (clClie) do
        begin
          conect ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_NOME ');
          AddParam ('From CRECLI ');
          AddParam ('Where (CL_CODI='+codigo+')');
          if (not Execute) then
             pnAval.caption :='<avalista nao encontrado>'
          else pnAval.caption :=Result('CL_NOME');
          if (Trim(edtCodAval.text)<>'') then
          begin
             edtCodAval.text:=form_nz (StrtoFloat(Trim(edtCodAval.text)),6);
             edtValMerc.SetFocus;
          end
          else
          begin
             edtCodAval.text:='';
             edtValMerc.SetFocus;
          end;
          desconect;
          Free;
        end;};
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF82.visible:=false;
  lbF8Mens2.visible:=false;
end;

{Navegacao -}
procedure Tfrm_edtCliente.edtPeriKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnGerarPrestacoes.click;
//     if (key=38) then edtFator.setfocus;
end;

{Opcao de mudanca da loja de cadastro}
{procedure Tfrm_edtCliente.Mudaralojaedatadocontraot1Click(Sender: TObject);
begin
     Application.CreateForm (Tfrm_Aux1Contrato, frm_Aux1Contrato);
     if (not frm_aux1Contrato.showing) then
     begin
        frm_Aux1Contrato.Left:=67;
        frm_Aux1Contrato.Top :=50;
        frm_aux1Contrato.showmodal;
     end;
     frm_aux1Contrato.Free;
end;}

{Opcao de geracoes das prestacoes ***}
procedure Tfrm_edtCliente.Gerarprestacoes1Click(Sender: TObject);
var
  clPrest: TClassPrestacoes;
  dataCont,data: TDateTime;
  inc,res,peri,ind,numparc: Integer;
  dif,fator,valor,entrada,vparc,vparcr: Real;
  codplan: String;
  Year,Month,Day: Word;
  dia_x: Word;
  vparcs,vparcrs: String;
begin
     {CRITICA AOS DADOS ***---}
  if (Trim(edtContrato.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Código do contrato não encontrado!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtContrato.setfocus;
  end
  else
  if (edtDatContrato.text='  /  /    ') then
  begin
    frmDialogo.ExibirMensagem ('Data do contrato não pode ficar vazia!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtDatContrato.setfocus;
  end
  else
  if (Trim(edtValMerc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Valor da mercadoria não encontrado!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValMerc.setfocus;
  end
  else
  if (Trim(edtValEntrada.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Valor da entrada não encontrado!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtValEntrada.setfocus;
  end
  else
  if (Trim(edtNumParc.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Número de parcelas não encontrado!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumParc.setfocus;
  end
  else
  if (Trim(edtPlano.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Plano não pode ficar vazio!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtPlano.setfocus;
  end
  else
  begin
          {buscando cada prestacao do plano----}
//          if (Trim(edtFator.text)='') then edtFator.text:='0,00';
    codplan := Trim(edtPlano.text);
    clPrest := TClassPrestacoes.Create;
    with (clPrest) do
    begin
      conect   ('CREDITO',self);
      AddParam ('Select PR_CODI,PR_PERI,PR_NPRE    ');
      AddParam ('From   CREDPREST                  ');
      AddParam ('Where  (PR_CODI='+codplan+')      ');
      AddParam ('Order by PR_NPRE                  ');
      Execute;
    end;

          {calculando as parcelas}
    valor   := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text));
    entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
    numparc := StrtoInt(Trim(edtNumParc.text));
    fator   := 0.00;
          //StrToFloat(RetiraFormatacaoNumero(edtFator.text));
    vparc   := (valor - entrada);

          {se o fator for diferente de ZERO, ele é multiplicado pelo valor ***}
          {senao, apenas se divide o valor pelo numero de parcelas ***}
    if (fator<>0) then
      vparc := (vparc*fator)
    else
    begin
      dif     := 0.00;
      vparc   := (vparc/numparc);
      vparcs  := floattostr(vparc);
      vparcr  := vparc*100;
      vparcr  := Round(vparc*100);
      vparcr  := vparcr/100;
      vparcrs := floattostr(vparcr);
      if (vparcs<>vparcrs) then
      begin
        vparc := vparc*100;
        vparc := Int(vparc);
        vparc := vparc/100;
        dif   := (vparc*numparc);
        dif   := (valor - entrada) - dif;
      end;
    end;

          {geracao e impressao das prestacoes ***}
    clPrest.first;
    peri     := clPrest.Result('PR_PERI');
    dataCont := strtodate(edtDatContrato.text);
    if (dataCont=StrToDate('01/01/1900')) then
      data := frm_principal.x_data_trabalho + peri
    else
    begin
      DecodeDate(dataCont, Year, Month, dia_x);
      if ((peri mod 30)=0) then
      begin
        inc  := Round(Int(peri/30));
        data := RetornaData(dataCont,dia_x,inc);
      end
      else
        data := dataCont + peri;
    end;
    with (grade_lancamentos) do
    begin
      RowCount := numparc+1;
      ind:=1;
      while (ind<=numparc) do
      begin
        Cells[0,ind] := inttostr(ind)+'a.';
        if (ind=1) then
          Cells[1,ind] := form_nc (vparc+dif,13)
        else
          Cells[1,ind] := form_nc (vparc,13);
        Cells[2,ind] := FormatDateTime('dd/mm/yy',data);
        ind:=ind+1;
        clPrest.next;
        peri := clPrest.Result('PR_PERI');
        DecodeDate(data, Year, Month, dia_x);
        if ((peri mod 30)=0) then
        begin
          inc  := Round(Int(peri/30));
          data := RetornaData(data,dia_x,inc);
        end
        else
          data := data + peri;
      end;
    end;
    clPrest.desconect;
    clPrest.Free;
    btnEdtGrade.enabled:=true;
    btnCancelGrade.enabled:=false;
    btnSalvarGrade.enabled:=false;
    if (PodeFecharForm) then
      if (boInsert) then
      begin
        btnEdtGrade.enabled:=true;
        Application.CreateForm(Tfrm_Aux3Contrato, frm_Aux3Contrato);
        frm_Aux3Contrato.lb_texto.caption:='Confirma inclusão do contrato?';
        res:=frm_Aux3Contrato.showmodal;
        frm_Aux3Contrato.Free;
        if (res=1) then
          btnSalvar1.click;
        if (res=2) then
        begin
          if (Modo=0) then
            Limpareditspagina11.click;
          if (Modo=2) then
            Limparcadastro2.click;
        end;
        if (res=3) then
          btnEdtGrade.Onclick(Sender);
      end
      else
      begin
        btnEdtGrade.enabled:=true;
        Application.CreateForm(Tfrm_Aux3Contrato, frm_Aux3Contrato);
        frm_Aux3Contrato.lb_texto.caption:='Confirma alteração do contrato?';
        res:=frm_Aux3Contrato.showmodal;
        frm_Aux3Contrato.Free;
        if (res=1) then
          btnSalvar1.click;
        if (res=2) then
        begin
          if (Modo=0) then
            Limpareditspagina11.click;
          if (Modo=2) then
            Limparcadastro2.click;
        end;
        if (res=3) then
          btnEdtGrade.Onclick(Sender);
      end;
  end;
end;

{O formulario so tem permissao de fechar caso esta variavel libere ***}
{O formulario so nao esta liberado para fechar quando se estiver editando as
 prestacoes/cheques direto no formulario ***}
procedure Tfrm_edtCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (PodeFecharForm) then
    Action := caFree
  else
    Action := caNone;
end;

{Opcao de salvaento do cliente ***}
procedure Tfrm_edtCliente.Salvarocliente1Click(Sender: TObject);
var
  clClie: TClassCliente;
  clAux: TClassAuxiliar;
  codigo: String;
  edit : TEdit;
  cpf : String;
begin

  if (frm_principal.x_HabilitaValidacoes) then
  begin
    if (Trim(edtCodigo.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Codigo não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtCodigo.setfocus;
      Exit;
    end
    else
    if (frm_principal.x_critica_CNPJ) and (Trim(edtCpf.text)='') then
    begin
      frmDialogo.ExibirMensagem ('CPF/CNPJ do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtCpf.setfocus;
      Exit;
    end
    else
    if (Trim(edtNome.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Nome do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtNome.setfocus;
      Exit;
    end
    else
    if (Trim(edtCep.text)='') then
    begin
      frmDialogo.ExibirMensagem ('CEP do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtCep.setfocus;
      Exit;
    end
    else
    if (Trim(cbbTipoLogradouro.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Tipo Logradouro do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      cbbTipoLogradouro.setfocus;
      Exit;
    end
    else
    if (Trim(edtEndereco.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Endereço do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtEndereco.setfocus;
      Exit;
    end
    else
    if (Trim(edtNumero.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Número do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtNumero.setfocus;
      Exit;
    end
    else
    if (Trim(edtComplemento.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Complemento do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtComplemento.setfocus;
      Exit;
    end
    else
    if (Trim(edtBairro.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Bairro do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtBairro.setfocus;
      Exit;
    end
    else
    if (Trim(edtCidade.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Cidade do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtCidade.setfocus;
      Exit;
    end
    else
    if (Trim(edtEmail.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Email do cliente não pode ficar vazio!'
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtEmail.setfocus;
      Exit;
    end;

 end;

    if (ProcuraNomeClienteCpf(Trim(edtCpf.text),self)<>'<Cliente não cadastrado>') and
       (ProcuraNomeClienteCod(strtofloat(Trim(edtCodigo.text)),self)='<Cliente não cadastrado>') then
    begin
      {Exibindo o nome do cliente com o CPF/CGC cadastrado}
      clAux := TClassAuxiliar.Create;
      clAux.conect ('CREDITO',self);
      clAux.ClearSql;
      clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME ');
      clAux.AddParam ('From   CRECLI ');
      clAux.AddParam ('Where (CL_CPF='+chr(39)+Trim(edtCpf.text)+chr(39)+') ');
      clAux.Execute;
      frmDialogo.ExibirMensagem (' Já existe cliente cadastrado com este CPF/CNPJ: '+
        'Cliente: '+form_nz(clAux.result('CL_CODI'),6)+'/'+form_t(clAux.result('CL_NOME'),40)
        ,'CPF/CNPJ',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      clAux.desconect;
      clAux.Free;
      fichario.activepage:=pagina1;
      edtCpf.setfocus;
      Exit;
    end

    else if (Trim(edtCpf.Text)='') then
    begin
      frmDialogo.ExibirMensagem ('É necessário inserir o CPF do cliente!',
        'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtCpf.SetFocus;
      Exit;
    end

    else if (Trim(edtNome.Text)='') then
    begin
      frmDialogo.ExibirMensagem ('É necessário inserir o nome do cliente!',
        'Salvar Cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina1;
      edtNome.SetFocus;
      Exit;
    end;
  try

  finally

    begin
      {formatacao dos dados}
      if salvar_geral <> 'S'
         then
            salvar_geral:= 'N';

      clClie := TClassCliente.Create;
      with (clClie) do
      begin
        conect ('CREDITO',self);
        ClearFields;
        inCL_CODI         := StrToFloat(Trim(edtCodigo.text));
        inCL_NOME         := Trim(edtNome.text);
        inCL_ENDE         := Trim(edtEndereco.text);
        if (Trim(edtSexo.text)<>'') then
          inCL_SEXO         := Trim(edtSexo.text);
        if (edtNasc.text<>'  /  /    ') then
          inCL_DTNA      := strtodate (edtNasc.text)
        else
          inCL_DTNA      := strtodate ('01/01/1900');
        inCL_BAIR         := Trim(edtBairro.text);
        inCL_CIDA         := Trim(edtCidade.text);
        inCL_ESTA         := Trim(cbEstado.text);
        inCL_CEP          := Trim(edtCep.text);
        inCL_FONE         := Trim(edtTeleFone.text);
        inCL_FAX          := Trim(edtFax.text);
        inCL_CELU         := Trim(edtCelular.text);
        inCL_EMAI         := Trim(edtEmail.text);
        inCL_IDEN         := Trim(edtIdentidade.text);
        inCL_OEXP         := Trim(edtOrgExped.text);
        inCL_CPF          := Trim(edtCpf.text);
        inCL_TIPO_LOGRADOURO := Trim(cbbTipoLogradouro.Text);
        inCL_NUMERO          := Trim(edtNumero.Text);
        inCL_COMPLEMENTO     := Trim(edtComplemento.Text);
        inCL_IBGE_CIDADE     := StrToInt(lblCodCidadeIBGE.Caption);
        inCL_IBGE_UF         := StrToInt(lblCodUFIBGE.Caption);
        inCL_PAIS            := Trim(edtPais.Text);
        inCL_CODIGO_PAIS     := lblCodPais.Caption;
        if (Trim(cbEstadoCivil.text)='SOLTEIRO') then
          inCL_ECIV := '0'
        else
        if (Trim(cbEstadoCivil.text)='CASADO') then
          inCL_ECIV := '1'
        else
        if (Trim(cbEstadoCivil.text)='SEPARADO') then
          inCL_ECIV := '2'
        else
        if (Trim(cbEstadoCivil.text)='VIUVO') then
          inCL_ECIV := '3'
        else
        if (Trim(cbEstadoCivil.text)='OUTROS...') then
          inCL_ECIV := '4';
        inCL_CONJ         := Trim(edtConjuge.text);
        inCL_NPAI         := Trim(edtPai.text);
        inCL_NMAE         := Trim(edtMae.text);
        inCL_REF1         := Trim(edtRef1.text);
        inCL_TRF1         := Trim(edtTelRef1.text);
        inCL_REF2         := Trim(edtRef2.text);
        inCL_TRF2         := Trim(edtTelRef2.text);
        inCL_EMPR         := Trim(edtNomeEmp.text);
        inCL_CARG         := Trim(edtCargo.text);
        inCL_EEMP         := Trim(edtEndEmp.text);
        inCL_FEMP         := Trim(edtTelEmp.text);
        inCL_REMP         := Trim(edtRamal.text);
        inCL_CPRO         := Trim(edtCartProf.text);
        if (Trim(edtSalario.text)<>'') then
          inCL_SALA := StrtoFloat(RetiraFormatacaoNumero(edtSalario.text));
        if (Trim(edtLimCred.text)<>'') then
          inCL_LIMC := StrtoFloat(RetiraFormatacaoNumero(edtLimCred.text));
        if (edtAdmissaoEmp.text<>'  /  /    ') then
          inCL_DADM := strtodate (edtAdmissaoEmp.text)
        else
          inCL_DADM := strtodate ('01/01/1900');
        inCL_OBSE := Trim(edtObs.text);

            {Dados de analise de credito}
        if (Trim(edtSpc.text)='') then
          inCL_RSPC:='N'
        else
          inCL_RSPC    := Trim(edtSpc.text);
        if (Trim(edtCfun.text)='') then
          inCL_CFUN:='N'
        else
          inCL_CFUN    := Trim(edtCfun.text);
        if (Trim(edtTPro.text)='') then
          inCL_TPRO:='N'
        else
          inCL_TPRO    := Trim(edtTPro.text);
        inCL_PDC  := Trim(edtPDC.text);
        inCL_LIVR := Trim(edtLivre.text);

        {verificando a existencia do cliente ***}
        codigo:=Trim(edtCodigo.text);
        ClearSql;
        AddParam ('Select CL_CODI,CL_LOJA,CL_DULP,CL_ALTE  ');
        AddParam ('From   CRECLI                           ');
        AddParam ('Where (CL_CODI='+codigo+')              ');
        frm_principal.BarraDicas.caption:='Salvando o cliente...Aguarde!';
        frm_principal.refresh;
        if (not Execute) then
        begin
          inCL_VALI := (frm_principal.x_data_trabalho+frm_principal.x_DIASVALIDADECLI);
          inCL_DTCA := frm_principal.x_data_trabalho;
          inCL_DSPC := inCL_DTCA;
          inCL_QTDC := 0;
          inCL_TIME := frm_principal.x_data_trabalho;
          inCL_LOJA := cdLoja; {loja do primeiro contrato}
          SalvaObservacoes(StrToFloat(Trim(edtCodigo.text)));
          Insert;
          frm_principal.ExibirDica (' Cliente cadastrado com sucesso...',5);
          if (Modo=0) then
          begin
            {******************************** - alteracao: 16/07/2003}
            Incluircliente1.enabled:=true;
            {***********************************}
            pnTipoCad1.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
            pnTipoCad2.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
            pnTipoCad3.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
            CodigoInclusaoCliente:=0;
            with (frm_f8Clientes) do
              ds.dataset.close;
            motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(inCL_CODI);
            if (motivobloqueio='-1') then
            begin
              fichario.activepage:=pagina3;
              Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
              Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
              edtContrato.setfocus;
            end;
          end
          else
          begin
            HabilitaMenuCliente (true,false,false,false,true,false,true,true);
            CodigoInclusaoCliente:=0;
           // Incluircliente1.click;
            with (frm_f8Clientes) do
              ds.dataset.close;
          end;
        end
        else
        begin
          if (Trim(pnQtdc.caption)<>'') then
            inCL_QTDC := strtofloat(Trim(pnQtdc.caption)) + 1
            else
               inCL_QTDC:= 1;
          if (Trim(pnUltc.caption)<>'') then
            inCL_ULTC := strtodate(Trim(pnUltc.caption))
            else
            begin
               pnUltc.caption:= FormatDateTime('DD/MM/YYY',date); // DateToStr(Now);
               inCL_ULTC      := strtodate(Trim(pnUltc.caption));
             end;

          if (inCL_ULTC<>strtodate('01/01/1900')) then
            inCL_VALI := (inCL_ULTC+frm_principal.x_DIASVALIDADECLI);
          if (Trim(pnDSPC.caption)<>'') then
          begin
            if (regspc<>Trim(edtSpc.text)) then
              inCL_DSPC := frm_principal.x_data_trabalho
            else
              inCL_DSPC := strtodate(Trim(pnDSPC.caption));
          end
          else
            inCL_DSPC := frm_principal.x_data_trabalho;
          if (Trim(pnDtca.caption)<>'') then
            inCL_DTCA := strtodate(Trim(pnDtca.caption));
          inCL_TIME := frm_principal.x_data_trabalho;
          inCL_LOJA := result('CL_LOJA');
          inCL_DULP := result('CL_DULP');
          inCL_ALTE := result('CL_ALTE');
          SalvaObservacoes(StrToFloat(Trim(edtCodigo.text)));
          UpdateAll;

          frm_principal.ExibirDica (' Cadastro do cliente alterado com sucesso...',5);
          if (antNome<>inCL_NOME) then
            with (frm_f8Clientes) do
              ds.dataset.close;
          if (Modo=1) then
          begin
            HabilitaMenuCliente (true,false,true,true,true,true,true,true);
            fichario.activepage:=pagina1;
            edtCodigo.setfocus;
          end
          else
          begin
            {******************************** - alteracao: 16/07/2003}
            Incluircliente1.enabled:=true;
            {***********************************}
            motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(inCL_CODI);
            if (motivobloqueio='-1') then
            begin
              fichario.activepage:=pagina3;
              Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
              Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
              edtContrato.setfocus;
            end;
          end;
        end;
        desconect;
        Free;
      end;
      //if (Trim(edit.Text)<>'') then
      if (salvar_geral = '') or (salvar_geral = 'N')
          then
          begin
              fichario.ActivePage:= pagina1;
              edtNome.setfocus;

              frmDialogo.ExibirMensagem ('Dados cadastrais salvos com sucesso!!!'
                ,'Cadastro de cliente',[mbOK]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);

                fichario.ActivePage:= pagina2;
                edtNomeEmp.SetFocus;

            //  lblCodCidadeIBGE.Caption := '00';
             // lblCodUFIBGE.Caption     := '00';
             // LimparEdits(1);
             // fichario.ActivePage:=pagina1;
              //edtCodigo.SetFocus;
           end;
       {
      frmDialogo.ExibirMensagem ('Dados salvos com sucesso!!!'
        ,'Cadastro de cliente',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      lblCodCidadeIBGE.Caption := '00';
      lblCodUFIBGE.Caption     := '00';
      LimparEdits(1);
      fichario.ActivePage:=pagina1;
      edtCodigo.SetFocus;
      }
    end;
  end;

end;

{Botao de salvamento de cliente}
{botao de saida do formulario}
procedure Tfrm_edtCliente.botao_sair2Click(Sender: TObject);
begin
  SAIR1.click;
end;

{Botao de salvamento ***}
procedure Tfrm_edtCliente.btnSalvar1Click(Sender: TObject);
begin
  if (Modo=0) then
    Salvarocontrato1.click
  else
  if (Modo=2) then
    Salvarcontrato1.click;
end;

procedure Tfrm_edtCliente.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

{Opcao de avanco no cadastro ***}
procedure Tfrm_edtCliente.Prosseguecadastro1Click(Sender: TObject);
var
  continua: Boolean;
begin
  if (edtCodigo.tag=0) then
    if (fichario.activepage=pagina1) then
    begin
      fichario.activepage:=pagina2;
      edtNomeEmp.setfocus;
    end
    else
    if (fichario.activepage=pagina2) then
    begin
      if (Modo=0) or (modo=1) then
      begin
        if (trim(edtCodigo.text)<>'') then
        begin
          motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(trim(edtCodigo.text)));
          if (motivobloqueio<>'-1') then
          begin
            frmDialogo.ExibirMensagem (' Cliente bloqueado! Crediário não permitido! '
              ,'Crediário',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua := false;
            fichario.activepage := pagina2;
          end
          else
            continua := true;
        end
        else
          continua := true;
        if (continua) then
        begin
          fichario.activepage:=pagina3;
          edtContrato.setfocus;
        end;
      end
    end
    else
    if (fichario.activepage=pagina3) then
    begin
      fichario.activepage:=pagina5;
      BitBtn3.SetFocus;
    end
    else
    if (fichario.activepage=pagina5) then
    begin
      fichario.ActivePage:=pagina1;
      edtCpf.SetFocus;
    end;
end;

{Opcao de retorno no cadastro ***}
procedure Tfrm_edtCliente.Retornacadastro1Click(Sender: TObject);
var
  continua: Boolean;
begin
  if (edtCodigo.tag=0) then
    if (fichario.activepage=pagina2) then
    begin
      fichario.activepage:=pagina1;
      edtCpf.setfocus;
    end
    else
    if (fichario.activepage=pagina3) then
    begin
      if (Modo=0) or (modo=1) then
      begin
        fichario.activepage:=pagina2;
        edtNomeEmp.setfocus;
      end;
    end
    else
    if (fichario.activepage=pagina1) then
      fichario.ActivePage:=pagina5
    else
    if (fichario.activepage=pagina5) then
      if (Modo=0) or (modo=1)  then
      begin
        if (trim(edtCodigo.text)<>'') then
        begin
          motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(trim(edtCodigo.text)));
          if (motivobloqueio<>'-1') then
          begin
            frmDialogo.ExibirMensagem (' Cliente bloqueado! Crediário não permitido! '
              ,'Crediário',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua := false;
            fichario.activepage := pagina1;
          end
          else
            continua := true;
        end
        else
          continua := true;
        if (continua) then
        begin
          fichario.activepage:=pagina3;
          edtContrato.setfocus;
        end;
      end;
end;

{Evento ONENTER da pagina2}
procedure Tfrm_edtCliente.pagina2Enter(Sender: TObject);
begin
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=true;
    Salvarocontrato1.enabled:=false;
    Gerarcheques1.enabled:=false;
    Lancamentos.Items[0].ShortCut := ShortCut (K_F5,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
    edtNomeEmp.setfocus;
  end;
end;

procedure Tfrm_edtCliente.pagina1Enter(Sender: TObject);
begin
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=true;
    Salvarocontrato1.enabled:=false;
    Gerarcheques1.enabled:=false;
    Lancamentos.Items[0].ShortCut := ShortCut (K_F5,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
    //edtCpf.setfocus;
    if (frm_MenuPrincipal_OpcaoCrediario<>nil) then
    begin
      if (frm_MenuPrincipal_OpcaoCrediario.Modos=1) then
        edtCodigo.SetFocus;
      if (frm_MenuPrincipal_OpcaoCrediario.Modos=2) then
        edtCodigo.SetFocus;
    end;

  end;
end;

procedure Tfrm_edtCliente.pagina3Enter(Sender: TObject);
begin
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=false;
    Salvarocontrato1.enabled:=true;
    Gerarcheques1.enabled:=true;
    Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (K_F5,[]);
    if (edtContrato.canfocus) and (not frm_InfBoletaVenda.fechouInfBoletaVenda) then
      edtContrato.setfocus;
  end;
     //btnEditarBoletas.Enabled := frm_InfBoletaVenda.ativarBotaoDeEdicao;
end;

{Opcao de salvamento de contrato ***}
procedure Tfrm_edtCliente.Salvarocontrato1Click(Sender: TObject);
var
  clCheq: TClassCheque;
  clContrato: TClassContrato;
  clPrestCont,clPrest: TClassPrestContrat;
  clClie: TClassCliente;
  lin: Integer;
  codcli,codigo: String;
  valor1,valor2,total2: Real;
  codloja,banco_anterior,numero: Real;
  contrato,agencia_anterior: String;
  continua: Boolean;
//********************************
  clAux,clAtualiza: TClassAuxiliar;
  codigoCliente,codigoContrato,codigoLoja,codigoPlano: String;
  indBoleta: String;
  valorTotal,valorEntrada,valorFinanciado: Real;
  numBoletas: Real;
//********************************
begin
  {CRITICA DOS DADOS ***}
  codigo := Trim(edtContrato.Text);
  //*************************************
  valorTotal      := StrToFloat(RetiraFormatacaoNumero(Trim(edtValMerc.Text)));
  valorEntrada    := StrToFloat(RetiraFormatacaoNumero(Trim(edtValEntrada.Text)));
  valorFinanciado := StrToFloat(RetiraFormatacaoNumero(Trim(pnTotalDevido.Caption)));
  numBoletas      := StrToFloat(Trim(edtQtdeBoleta.Text));
  //*************************************
  if (Trim(edtValEntrada.Text) <> '') then
    valor2 := StrToFloat(RetiraFormatacaoNumero(Trim(edtValEntrada.Text)))
  else
    valor2 := 0.00;
  if (Trim(edtValMerc.Text) <> '') then
    valor1 := StrToFloat(RetiraFormatacaoNumero(Trim(edtValMerc.Text)))
  else
    valor1 := 0.00;
  if (codigo <> '') then
  begin
    continua := true;
    if (Trim(edtLoja.Text) <> '') then
      codloja:=StrToFloat(Trim(edtLoja.Text))
    else
    begin
      codloja:=cdloja;
      edtLoja.Text:=form_nz(cdLoja,3);
    end;
    if (codloja=0) then
    begin
      frmDialogo.ExibirMensagem ('Loja não definida'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      Mudaralojaedatadocontraot1.click;
      if (cdLoja<>0) then
        Salvarocontrato1.click;
    end
    else
    if (dataContrato=StrToDate('01/01/1900')) then
    begin
      frmDialogo.ExibirMensagem ('Data do contrato não definida!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina3;
      edtDatContrato.SetFocus;
    end
    else
    if (cdCliente=0) then
    begin
      if (Modo=0) then
      begin
        frmDialogo.ExibirMensagem ('Não foi definido o cliente do contrato!'
          ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina1;
        edtCodigo.setfocus;
      end
      else
      if (Modo=2) then
      begin
        frmDialogo.ExibirMensagem ('Não foi definido o cliente do contrato!'
          ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        Mudaralojaedatadocontraot1.click;
        Salvarocontrato1.click;
      end;
    end
    else
    if (Trim(edtPlano.text)='') then
    begin
      frmDialogo.ExibirMensagem ('Plano de pgto. não definido!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtPlano.setfocus;
    end
    else
    if (Trim(edtNumParc.text)='') then
    begin
      frmDialogo.ExibirMensagem ('N. de parcelas não definida!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtNumParc.setfocus;
    end
    else
    if (valor1=0) then
    begin
      frmDialogo.ExibirMensagem ('O valor do contrato não foi definido!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValMerc.setfocus;
    end
    else
    if (valor2>valor1) then
    begin
      frmDialogo.ExibirMensagem ('A entrada não pode ser maior que o valor do contrato!!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtValEntrada.setfocus;
    end
    else
    if (ContratoSendoPago(cdCliente,strtofloat(codigo))) then
    begin
      frmDialogo.ExibirMensagem ('O contrato não pode ser alterado porque seu pagamento já foi iniciado!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtContrato.setfocus;
    end
    else
    if ((grade_lancamentos.rowcount=2) and (Trim(grade_lancamentos.Cells[1,1])='')) then
    begin
      frmDialogo.ExibirMensagem ('As prestações não foram criadas ainda!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtContrato.setfocus;
    end
    else
    if (not LojaCadastrada(codLoja)) then
    begin
      frmDialogo.ExibirMensagem ('Loja não se encontra cadastrada no sistema!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtLoja.setfocus;
    end
    else
    if (not PlanoCadastrado(Trim(edtPlano.text))) then
    begin
      frmDialogo.ExibirMensagem ('Plano de pgto. não se encontra cadastrado no sistema!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtPlano.setfocus;
    end
    else if (not frm_principal.x_cli_sem_foto) and (foto_cliente.Picture.Graphic = nil) then
    begin
      frmDialogo.ExibirMensagem ('Não é possível realizar a venda para clientes sem fotos! Por favor insira a foto do cliente! '
        ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.ActivePage := pagina5;
      exit;
    end
    else if (not frm_principal.x_cli_sem_cep) and (ClienteSemCEP(cdCliente)) then
    begin
      frmDialogo.ExibirMensagem ('Não é possível realizar a venda para clientes sem CEP!',
        'CEP',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      if (edtCep.CanFocus) then
        edtCep.SetFocus;
      exit;
    end
    else if (frm_principal.x_senha_gerente_cliente_zerado) and (InformaLimiteCredito(StrToFloat(IntToStr(cdCliente))) <= 0.00) then
    begin
      if (not LiberaVendaZerado) then
      begin
        frmDialogo.ExibirMensagem ('Usuário não tem permissão de liberar venda para clientes com saldo zerado ou negativo!',
          'Operação não permitida',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
      end
      else
        continua := true;
    end;
    if (frm_principal.x_senha_usuario_crediario) then
    begin
      if (not ConfirmaCadastroCrediario(IntToStr(cdCliente),codigo)) then
      begin
        frmDialogo.ExibirMensagem ('Não é possível realizar a venda sem confirmar o usuário da operação!',
          'Senha de Confirmação',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
      end
      else
        continua := true;
    end;
    if (continua) then
    begin
      //***************************************************
      //CONFIRMA A GRAVAÇÃO DAS INFORMAÇÕES DE MULTIBOLETA
      //***************************************************
      frm_InfBoletaVenda.confirmou := false;
      frm_InfBoletaVenda.jaGravou  := true;
      frm_principal.jaGravou       := true;
      if (numBoletas > 1) then
        frm_principal.multiBoleta := true
      else
        frm_principal.multiBoleta := false;
      //***************************************************

      //*******************************************************************************
      //ATUALIZA O CÓDIGO DO PLANO QUANDO É UM CREDIÁRIO ONDE LANÇARAM A VENDA PRIMEIRO
      //********************INÍCIO*****************************************************
      if (Trim(edtCodigo.Text) <> '') then
        codigoCliente  := Trim(edtCodigo.Text)
      else
        codigoCliente  := Trim(frm_Consulta1.edtCodCli.Text);
      codigoContrato := Trim(edtContrato.Text);
      codigoLoja     := floattostr(frm_principal.x_loja);
      codigoPlano    := Trim(edtPlano.Text);

      clAtualiza := TClassAuxiliar.Create;
      clAtualiza.Conect(DataBaseProdutos,self);
      clAtualiza.ClearSql;
      clAtualiza.AddParam('SELECT *                                                           ');
      clAtualiza.AddParam('FROM CREDIARIOS                                                    ');
      clAtualiza.AddParam('WHERE (CR_CLIE='+codigoCliente+') AND (CR_CONT='+codigoContrato+') ');
      clAtualiza.AddParam('      AND (CR_LOJA='+codigoLoja+') AND (CR_PLAN=0)                 ');
      if (clAtualiza.Execute) then
        atualizaPlano := true
      else
        atualizaPlano := false;
      clAtualiza.Desconect;
      clAtualiza.Free;
             {...............................................................................}
      if (atualizaPlano) then
      begin

        frm_principal.qGeraCampoESTOQUE.DatabaseName := DataBaseProdutos;
        with (frm_principal.qGeraCampoESTOQUE) do
        begin
          sql.Clear;
          sql.Add('UPDATE CREDIARIOS SET CR_PLAN='+codigoPlano+'                      ');
          sql.Add('WHERE (CR_CLIE='+codigoCliente+') AND (CR_CONT='+codigoContrato+') ');
          sql.Add('      AND (CR_LOJA='+codigoLoja+')                                 ');
          execsql;
        end;
      end;
      //********************FIM********************************************************

      //*******************************************************************************
      //SALVA AS INFORMAÇÕES NO CASO DE MAIS DE UMA BOLETA PARA O MESMO CONTRATO
      //********************INÍCIO*****************************************************
      if (frm_principal.multiBoleta) and (not atualizaMultiboleta) then
        with (clAux) do
        begin
          indBoleta := '1';
          while (strtofloat(indBoleta) <= numBoletas) do
          begin
            clAux := TClassAuxiliar.Create;
            Conect (DataBaseProdutos,self);
            ClearSql;
            AddParam('INSERT INTO CREDIARIOS(CR_LOJA,CR_CLIE,CR_CODI,CR_TOTA,CR_VENT,CR_FINA,   ');
            AddParam('                       CR_CPF,CR_NOME,CR_PLAN,CR_CONT,CR_CAIX,CR_VEND)    ');
            AddParam('VALUES(:loja,:cliente,:boleta'+indBoleta+',:valor'+indBoleta+',           ');
            AddParam(':entrada'+indBoleta+',:financiado'+indBoleta+',:cpf,:nome,:plano,         ');
            AddParam(':contrato,:caixa,:venda)                                                  ');
            Consulta.ParamByName('loja').AsFloat     := frm_InfBoletaVenda.codigoLoja;
            Consulta.ParamByName('cliente').AsFloat  := frm_InfBoletaVenda.codigoCliente;
            Consulta.ParamByName('cpf').AsString     := frm_InfBoletaVenda.cpf;
            Consulta.ParamByName('nome').AsString    := frm_InfBoletaVenda.nome;
            Consulta.ParamByName('plano').AsFloat    := frm_InfBoletaVenda.codigoPlano;
            Consulta.ParamByName('contrato').AsFloat := frm_InfBoletaVenda.codigoContrato;
            Consulta.ParamByName('caixa').AsFloat    := 0;
            Consulta.ParamByName('venda').AsFloat    := 0;
            if (indBoleta = '1') then
            begin
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoContrato;
              Consulta.ParamByName('valor'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta1;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada1;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado1;
            end
            else
            if (indBoleta = '2') then
            begin
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoBoleta2;
              Consulta.ParamByName('valor'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta2;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada2;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado2;
            end
            else
            if (indBoleta = '3') then
            begin
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoBoleta3;
              Consulta.ParamByName('valor'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta3;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada3;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado3;
            end;
            Consulta.ExecSQL;
            indBoleta := floattostr(strtofloat(indBoleta) + 1);
          end;
          Desconect;
          Free;
        end;
      //********************FIM********************************************************

      //*******************************************************************************
      //ATUALIZA AS INFORMAÇÕES NO CASO DE MAIS DE UMA BOLETA PARA O MESMO CONTRATO
      //********************INÍCIO*****************************************************
      if (frm_principal.multiBoleta) and (atualizaMultiBoleta) then
        with (clAux) do
        begin
          indBoleta := '1';
          while (strtofloat(indBoleta) <= numBoletas) do
          begin
            clAux := TClassAuxiliar.Create;
            Conect ('ESTOQUE',self);
            ClearSql;
            AddParam('UPDATE CREDIARIOS SET CR_CONT=:contrato,CR_CODI=:boleta'+indBoleta+',                       ');
            AddParam('CR_VENT=:entrada'+indBoleta+',CR_TOTA=:total'+indBoleta+',CR_FINA=:financiado'+indBoleta+', ');
            AddParam('CR_PLAN=:plano                                                                              ');
            AddParam('WHERE (CR_CODI=:boletaAnt'+indBoleta+') AND (CR_CONT=:contratoAnt) AND                      ');
            AddParam('      (CR_CLIE=:cliente) AND (CR_LOJA=:loja) AND (CR_VENT=:entradaAnt'+indBoleta+') AND     ');
            AddParam('      (CR_TOTA=:totalAnt'+indBoleta+') AND (CR_FINA=:financiadoAnt'+indBoleta+') AND        ');
            AddParam('      (CR_PLAN=:planoAnt)                                                                   ');
            Consulta.ParamByName('cliente').AsFloat     := frm_InfBoletaVenda.codigoCliente;
            Consulta.ParamByName('loja').AsFloat        := frm_InfBoletaVenda.codigoLoja;
            Consulta.ParamByName('planoAnt').AsFloat    := frm_InfBoletaVenda.codigoPlanoAnt;
            Consulta.ParamByName('contratoAnt').AsFloat := frm_InfBoletaVenda.codigoContratoAnt;
            Consulta.ParamByName('contrato').AsFloat    := frm_InfBoletaVenda.codigoContrato;
            Consulta.ParamByName('plano').AsFloat       := frm_InfBoletaVenda.codigoPlano;
            if (indBoleta = '1') then
            begin
              //**************NOVOS VALORES**********************************************************************
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat        := frm_InfBoletaVenda.codigoContrato;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat       := frm_InfboletaVenda.valorEntrada1;
              Consulta.ParamByName('total'+indBoleta+'').AsFloat         := frm_InfBoletaVenda.valorBoleta1;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.totalFinanciado1;
              //**************************************************************************************************
              Consulta.ParamByName('boletaAnt'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoContratoAnt;
              Consulta.ParamByName('entradaAnt'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada1Ant;
              Consulta.ParamByName('totalAnt'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta1Ant;
              Consulta.ParamByName('financiadoAnt'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado1Ant;
            end
            else
            if (indboleta = '2') then
            begin
              //**************NOVOS VALORES**********************************************************************
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat        := frm_InfBoletaVenda.codigoBoleta2;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat       := frm_InfboletaVenda.valorEntrada2;
              Consulta.ParamByName('total'+indBoleta+'').AsFloat         := frm_InfBoletaVenda.valorBoleta2;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.totalFinanciado2;
              //**************************************************************************************************
              Consulta.ParamByName('boletaAnt'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoBoleta2Ant;
              Consulta.ParamByName('entradaAnt'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada2Ant;
              Consulta.ParamByName('totalAnt'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta2Ant;
              Consulta.ParamByName('financiadoAnt'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado2Ant;
            end
            else
            if (indBoleta = '3') then
            begin
              //**************NOVOS VALORES**********************************************************************
              Consulta.ParamByName('boleta'+indBoleta+'').AsFloat        := frm_InfBoletaVenda.codigoBoleta3;
              Consulta.ParamByName('entrada'+indBoleta+'').AsFloat       := frm_InfboletaVenda.valorEntrada3;
              Consulta.ParamByName('total'+indBoleta+'').AsFloat         := frm_InfBoletaVenda.valorBoleta3;
              Consulta.ParamByName('financiado'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.totalFinanciado3;
              //**************************************************************************************************
              Consulta.ParamByName('boletaAnt'+indBoleta+'').AsFloat     := frm_InfBoletaVenda.codigoBoleta3Ant;
              Consulta.ParamByName('entradaAnt'+indBoleta+'').AsFloat    := frm_InfBoletaVenda.valorEntrada3Ant;
              Consulta.ParamByName('totalAnt'+indBoleta+'').AsFloat      := frm_InfBoletaVenda.valorBoleta3Ant;
              Consulta.ParamByName('financiadoAnt'+indBoleta+'').AsFloat := frm_InfBoletaVenda.totalFinanciado3Ant;
            end;
            Consulta.ExecSQL;
            indBoleta := floattostr(strtofloat(indBoleta) + 1);
          end;
          Desconect;
          Free;
        end;
      //********************FIM********************************************************

      {****************************************************************************}
      {1- Verificando se o cliente é válido, se está/foi cadastrado}
      {****************************************************************************}
      continua:=true;
      if (Modo=0) then
        with (clClie) do
        begin
          clClie := TClassCliente.Create;
          conect   ('CREDITO',self);
          ClearSql;
          AddParam ('SELECT CL_CODI,CL_LOJA,CL_DULP,CL_ALTE   ');
          AddParam ('FROM CRECLI                              ');
          AddParam ('WHERE (CL_CODI='+inttostr(cdCliente)+')  ');
          frm_principal.BarraDicas.caption:='Salvando o cliente... Aguarde!';
          frm_principal.refresh;
          if (Execute) then
            continua:=true
          else
          begin
            frmDialogo.ExibirMensagem ('O novo cliente não foi salvo!'
              ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            continua:=false;
            fichario.activepage:=pagina1;
            edtCodigo.setfocus;
          end;
          desconect;
          Free;
        end;
      {*******************************************************************}
      if (continua) then
        if (not ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) then
          continua := CriticaLancamentoContrato; //critica aqui somente se o contrato nao existe
      {*******************************************************************}

      {...}
      if (continua) then
      begin
        {2- cadastro do contrato}
        clContrato := TClassContrato.Create;
        with (clContrato) do
        begin
          conect ('CREDITO',self);
          ClearFields;
          if (Trim(edtContrato.text)<>'') then
            inCR_CODI := StrtoFloat(Trim(edtContrato.text));
          if (Trim(edtCodigo.text)<>'') then
            inCR_CLIE := StrtoFloat(Trim(edtCodigo.text));
          if (Trim(edtLoja.text)<>'') then
            inCR_LOJA := StrtoFloat(Trim(edtLoja.text))
          else
            inCR_LOJA := cdLoja;
          if (edtDatContrato.text<>'  /  /    ') then
            inCR_DNOT := strtodate(edtDatContrato.text)
          else
            inCR_DNOT := datacontrato;
          inCR_NOTA    := Trim(edtNotaFiscal.text);
          inCR_SERI    := Trim(edtSerieNota.text);
          inCR_CLIE    := cdCliente;
          if (Trim(edtQtdeBoleta.Text)<>'') then
            inCR_QBOL := Trim(edtQtdeBoleta.Text);
          if (Trim(edtCodAval.text)<>'') then
            inCR_AVAL := StrToFloat(Trim(edtCodAval.text));
          if (Trim(edtPortador.text)<>'') then
            inCR_PORT := StrToFloat(Trim(edtPortador.text));
          if (Trim(pnTotalDevido.caption)<>'') then
            inCR_TOTA    := StrtoFloat(RetiraFormatacaoNumero(Trim(pnTotalDevido.caption)));
          if (Trim(edtValEntrada.text)<>'') then
            inCR_VENT    := StrtoFloat(RetiraFormatacaoNumero(Trim(edtValEntrada.text)));
          if (Trim(edtPlano.text)<>'') then
            inCR_PLAN    := StrtoInt(Trim(edtPlano.text));
          if (Trim(edtFator.text)<>'') then
            inCR_FATO    := StrtoFloat(Trim(edtFator.text));
          if (Trim(edtNumParc.text)<>'') then
            inCR_QPRE    := StrtoInt(Trim(edtNumParc.text));
          lin:=1;
          total2:=0.00;
          while (lin<grade_lancamentos.RowCount) do
          begin
            total2 := total2 +
              StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
            lin := lin + 1;
          end;
          inCR_TOT2 := total2;
          inCR_VDEV := inCR_TOT2;

          {verificando existencia do contrato para o cliente definido ***}
          ClearSql;
          AddParam ('Select CR_CODI,CR_CARN,CR_FICH,CR_BOLE      ');
          AddParam ('From   CRECTABR                             ');
          AddParam ('Where  (CR_CODI='+codigo+') AND             ');
          AddParam ('       (CR_CLIE='+inttostr(cdCliente)+')    ');
          frm_principal.BarraDicas.caption:='Salvando o contrato...Aguarde!';
          frm_principal.refresh;
          if (not Execute) then
          begin
            inCR_PDEV := inCR_QPRE;
            inCR_CARN := '0';
            inCR_FICH := '0';
            inCR_BOLE := '0';
            inCR_TIME := frm_principal.x_data_trabalho;
            Insert;
            if (Modo=2) then
              CodigoInclusaoContrato:=0;
            boInsert:=true;
            RedefinirUltimaCompra (cdCliente);
            RedefinirQtCompra (cdCliente,+1);
          end
          else
          if (not frm_principal.x_alteracao_contrato_consulta) and (frm_principal.x_tipo_loja=0) then
          begin
            frmDialogo.ExibirMensagem (' A alteração do contrato não é permitida neste ponto do sistema! '
              ,'Salvar',[mbOK]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            edtContrato.setfocus;
          end
          else
          begin
            {alterando o contrato}
            inCR_PDEV := (inCR_QPRE - antdifpdev); {...}
            inCR_CARN := result('CR_CARN');
            inCR_FICH := result('CR_FICH');
            inCR_BOLE := result('CR_BOLE');
            inCR_TIME := frm_principal.x_data_trabalho;
            UpdateAll;
            boInsert:=false;
          end;
          auxCliente  := cdCliente;
          auxContrato := strtoint(codigo);
          frm_principal.BarraDicas.caption:='';
          desconect;
          Free;
        end;

        {buscando as prestacoes para, entao, buscar os cheques, caso existam ***}
        {Os cheques serao apagados *** somente na ALTERACAO de contrato}
        if (not boInsert) then
        begin
          clPrest := TClassPrestContrat.Create;
          contrato:=Trim(edtContrato.text);
          with (clPrest) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('SELECT PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO, ');
            AddParam ('       PC_CCGC,PC_BANC,PC_NUME,PC_AGEN ');
            AddParam ('FROM CREPRABR ');
            AddParam ('WHERE (PC_CONT='+contrato+') AND ');
            AddParam ('      (PC_CLIE='+inttostr(cdCliente)+') ');
            AddParam ('ORDER BY PC_NPRE ');
            frm_principal.BarraDicas.caption:='Buscando prestações...';
            frm_principal.refresh;
            if (Execute) then
            begin
              banco_anterior   := clPrest.Result('PC_BANC');
              agencia_anterior := clPrest.Result('PC_AGEN');
              clPrest.first;
              while (not clPrest.eof) do
              begin
                with (DMcontrato.qApagaCheque) do
                begin
                  ParambyName ('ccgc').AsString  := clPrest.Result('PC_CCGC');
                  ParambyName ('banco').AsFloat  := clPrest.Result('PC_BANC');
                  ParambyName ('numero').AsFloat := clPrest.Result('PC_NUME');
                  ExecSql;
                end;
                clPrest.next;
              end;
            end;
          end;
        end;

        {Salvando as prestacoes --}
        clClie := TClassCliente.Create;
        with (clClie) do
        begin
          conect ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE     ');
          AddParam ('From   CRECLI                             ');
          AddParam ('Where (CL_CODI='+inttostr(cdCliente)+')   ');
          frm_principal.BarraDicas.caption:='Buscando cliente...';
          frm_principal.refresh;
          Execute;
        end;
        clPrestCont := TClassPrestContrat.Create;
        with (clPrestCont) do
        begin
          {Apagando as prestacoes criadas anteriormente}
          codcli:=FloatTostr(cdCliente);
          conect ('CREDITO', self);
          ClearSql;
          AddParam ('Delete From CREPRABR                                ');
          AddParam ('Where (PC_CONT='+codigo+') AND (PC_CLIE='+codcli+') ');
          Execute;
          {***************************************************************************}
          ClearSql;
          AddParam ('Delete From MOVIMENTO_CREPRABR                      ');
          AddParam ('Where (PC_CONT='+codigo+') AND (PC_CLIE='+codcli+') ');
          try
            Execute;
          except
          end;
          {***************************************************************************}
          lin:=1;
          while (lin<grade_lancamentos.RowCount) do
          begin
            ClearFields;
            inPC_CONT := StrToFloat (codigo);
            inPC_CLIE := cdCliente;
            inPC_CCGC := clClie.Result('CL_CPF');
            inPC_BANC := banco_anterior;
            inPC_AGEN := agencia_anterior;
            if (Trim(grade_lancamentos.Cells[3,lin])<>'') then
              inPC_NUME := StrToFloat (Trim(grade_lancamentos.Cells[3,lin]));
            inPC_NPRE := lin;
            if (Trim(edtLoja.text)='') then
              inPC_LOJA := cdLoja
            else
              inPC_LOJA := strtofloat(Trim(edtLoja.text));
            if (edtDatContrato.text='  /  /    ') then
              inPC_DCON := DataContrato
            else
              inPC_DCON := strtodate(edtDatContrato.text);
            if (Trim(edtPortador.text)<>'') then
              inPC_PORT := StrToFloat (edtPortador.text);
            if (Trim(edtCodAval.text)<>'') then
              inPC_AVAL := StrToFloat (edtCodAval.text);
            if (Trim(edtPlano.text)<>'') then
              inPC_PLAN := StrToFloat (edtPlano.text);
            inPC_VALO  := StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
            inPC_DVTO  := StrToDate  (Trim(grade_lancamentos.Cells[2,lin]));
            inPC_FATO  := 0;
            //StrToFloat (Trim(edtFator.text));
            inPC_TPRE  := StrToFloat (Trim(edtNumParc.text));
            inPC_VENDA := frm_principal.x_Codigo_Venda + 1;
            inPC_CAIXA := frm_principal.x_terminal;
            inPC_FUNC  := frm_principal.x_caixa_ativo;
            inPC_TIME  := frm_principal.x_data_trabalho;
            inPC_FPGT := 0;
            Insert;
            lin:=lin+1;
          end;
        end;

        {Se houver cheques, estes sao regerados ***}
        {Somente em caso de alteracao----}
        if (not boInsert) then
        begin
          frm_principal.BarraDicas.caption:='Regerando cheques...';
          frm_principal.refresh;
          clPrest.first;
          lin:=1;
          while (not clPrest.eof) do
          begin
            clCheq := TClassCheque.Create;
            with (clCheq) do
            begin
              conect ('CREDITO',self);
              if (Trim(grade_lancamentos.Cells[3,lin])<>'') then
              begin
                ClearFields;
                inCH_CLIE := cdCliente;
                numero    := strtofloat(RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[3,lin])));
                inCH_NUME := numero;
                inCH_BANC := clPrest.Result('PC_BANC');
                inCH_AGEN := clPrest.Result('PC_AGEN');
                inCH_CCGC := clClie.Result('CL_CPF');
                if (Trim(edtLoja.text)<>'') then
                  inCH_LOJA := strtofloat(Trim(edtLoja.text))
                else
                  inCH_LOJA := cdLoja;
                if (edtDatContrato.text='  /  /    ') then
                  inCH_DTCT := DataContrato
                else
                  inCH_DTCT := strtodate(edtDatContrato.text);
                inCH_NOME := clClie.Result('CL_NOME');
                inCH_FONE := clClie.Result('CL_FONE');
                inCH_VALO := StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
                inCH_DVTO := StrToDate  (Trim(grade_lancamentos.Cells[2,lin]));
                if (Trim(edtPortador.text)<>'') then
                  inCH_PORT := StrToFloat(edtPortador.text);
                inCH_TIME := frm_principal.x_data_trabalho;
                Insert;
                desconect;
                Free;
              end;
            end;
            clPrest.next;
            lin:=lin+1;
          end;
          clPrest.desconect;
          clPrest.Free;
        end;
        frm_principal.BarraDicas.caption:='';
        clClie.desconect;
        clClie.Free;
        clPrestCont.desconect;
        clPrestCont.Free;

        {...}
        if (flagConsulta) then
        begin
          if (codigo<>'') then
            frm_consulta1.y_codigo_contrato := strtofloat(codigo)
          else
            frm_consulta1.y_codigo_contrato := 0;
          if (cdCliente<>0) then
            frm_consulta1.y_codigo_cliente := cdCliente
          else
            frm_consulta1.y_codigo_cliente := 0;
        end;

        {Finalizacao do cadastro ***}
        if (Modo=0) then
        begin
                    {No caso de plano de pgto. com cheque pre-datado ***}
          if (not PodeChamarCheques) then
          begin
            PodeChamarCheques:=true;
            if (cdCheq=1) then
            begin
              Application.CreateForm(Tfrm_aux2Contrato, frm_aux2Contrato);
              with (frm_aux2Contrato) do
              begin
                showmodal;
                Free;
              end;
              cdCheq:=0;
              Novocontrato1.click;
            end
            else
            begin
              {Verificando se o plano imprime carnet}
              if (cdCarn=1) then
              begin
                btnImpCarnet.click;
                cdCarn:=0;
              end;
              Novocontrato1.click;
            end;
          end;
        end
        else
        if (Modo=2) then
          if (boInsert) then
          begin
            {No caso de plano de pgto. com cheque pre-datado ***}
            boInsert:=false;
            if (not PodeChamarCheques) then
            begin
              PodeChamarCheques:=true;
              if (cdCheq=1) then
              begin
                HabilitaMenuContrato (true,false,true,true,true,false,true,true);
                Application.CreateForm(Tfrm_aux2Contrato, frm_aux2Contrato);
                with (frm_aux2Contrato) do
                begin
                  showmodal;
                  Free;
                end;
                cdCheq:=0;
                Incluircontrato1.click;
              end
              else
              begin
                                  {Verificando se o plano imprime carnet}
                if (cdCarn=1) then
                begin
                  btnImpCarnet.click;
                  cdCarn:=0;
                end;
                frm_principal.ExibirDica ('Cadastro concluído com sucesso!',5);
                HabilitaMenuContrato (true,false,false,false,true,false,true,true);
                CodigoInclusaoContrato:=0;
                Incluircontrato1.click;
              end;
            end
            else
            begin
                              {Verificando se o plano imprime carnet}
              if (cdCarn=1) then
              begin
                btnImpCarnet.click;
                cdCarn:=0;
              end;

              frm_principal.ExibirDica ('Cadastro concluído com sucesso!',5);
              HabilitaMenuContrato (true,false,false,false,true,false,true,true);
              CodigoInclusaoContrato:=0;
              Incluircontrato1.click;
            end;
          end
          else
          begin
                         {Verificando se o plano imprime carnet}
            if (cdCarn=1) then
              btnImpCarnet.click;

            HabilitaMenuContrato (true,false,true,true,true,false,true,true);
            frm_principal.ExibirDica ('Cadastro alterado com sucesso!',5);
            edtContrato.setfocus;
          end;

                {...}
        if (flagConsulta) then
          frm_edtCliente.close
        else
        begin
          LimparEdits(1);
          edtCodigo.Text:= '';
          edtCpf.SetFocus;
          edtCodigo.SetFocus;
        end;
      end;
      if (strtofloat(Trim(edtQtdeBoleta.Text)) > 1) then
        frm_principal.multiBoleta := true
      else
        frm_principal.multiBoleta := false;
      if (not frm_principal.multiBoleta) and (frm_principal.fechamentoVenda) then
      begin
        frm_FechamentoVenda_Cred.edtTotalContrato.Text   := floattostr(valorTotal);
        frm_FechamentoVenda_Cred.edtValorEntrada.Text    := floattostr(valorEntrada);
        frm_FechamentoVenda_Cred.edtValorFinanciado.Text := floattostr(valorFinanciado);
        FormatarZerosDecimais(frm_FechamentoVenda_Cred.edtValorFinanciado);
      end
      else
      if (frm_principal.multiBoleta) and (atualizaMultiBoleta) then
        if (frm_InfBoletaVenda.codigoBoleta2 <> frm_InfBoletaVenda.codigoBoleta2Ant) or
          (frm_InfBoletaVenda.valorBoleta2Ant <> frm_InfBoletaVenda.valorBoleta2) or
          (frm_InfBoletaVenda.valorEntrada2Ant <> frm_InfBoletaVenda.valorEntrada2) then
          frm_FechamentoVenda_Cred.edtNumBoleta.Text := frm_InfBoletaVenda.edtNumBoleta2.Text;
    end;
  end;
  edtQtdeBoleta.Text       := '1';
  btnEditarBoletas.Enabled := false;
  edtPlano.Text            := '';
  //edtNumParc.Text          := '';
end;

{Opcao de novo contrato}
procedure Tfrm_edtCliente.Novocontrato1Click(Sender: TObject);
begin
  if (frm_principal.x_checkcheckcont) then
    if (frmDialogo.ExibirMensagem ('Deseja realizar consulta financeira?'
      ,'Consulta financeira',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      ConexaoCheckCheck;
  lbUltimo.caption:=' ';
  btnEdtGrade.enabled:=false;
  btnEdtGrade.enabled:=false;
  btnCancelGrade.enabled:=false;
  btnSalvarGrade.enabled:=false;
  cdCliente:=0;
  boInsert:=true;
  PodeChamarCheques:=false;
  regspc:='';
  pnTipoCad1.caption:='';
  pnTipoCad2.caption:='';
  pnTipoCad3.caption:='';
  LimparEdits (1);
  LimparEdits (2);
  LimparEdits (3);
  IniciarGradeLancamentos;
  PodeChamarCheques := false;
  if (CodigoInclusaoCliente=0) then
    CodigoInclusaoCliente := Round(MaxiCod_credito ('CRECLI',frm_principal.barraDicas));
  edtCodigo.text:=form_nz(CodigoInclusaoCliente,6);
  edtCpf.text   :='';
  fichario.activepage:=pagina1;
     {**************************************- alteracao: 16/07/2003}
  Incluircliente1.enabled:=false;
     {***************************************}
  if not frm_principal.clienteaut then
    edtCodigo.setfocus;  
end;

procedure Tfrm_edtCliente.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCodigo;
    showmodal;
  end;
end;

procedure Tfrm_edtCliente.edtCodAvalDblClick(Sender: TObject);
begin
  with (frm_f8Avalistas) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodAval;
    showmodal;
  end;
end;

{Navegacao - Formatacao}
{Controle de mudanca de ficha}
procedure Tfrm_edtCliente.ficharioChange(Sender: TObject);
var
  continua: Boolean;
begin
  if (Modo=0) then
  begin
    if (fichario.activepageindex=2) then
    begin
      if (trim(edtCodigo.text)<>'') then
      begin
        motivobloqueio := ClienteEstaBloqueado_DevolveMotivo(strtofloat(trim(edtCodigo.text)));
        if (motivobloqueio<>'-1') then
        begin
          frmDialogo.ExibirMensagem (' Cliente bloqueado! Crediário não permitido! '
            ,'Crediário',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          continua := false;
          fichario.activepageindex := ultima_pagina_acessada;
        end
        else
          continua := false;
      end
      else
        continua := false;
    end
    else
      continua := true;
    if (continua) then
    begin
      if (fichario.activepage=pagina1) or
        (fichario.activepage=pagina2) then
      begin
        Lancamentos.Items[0].ShortCut := ShortCut (K_F5,[]);
        Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
      end;
      if (fichario.activepage=pagina3) then
      begin
        Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
        Lancamentos.Items[1].ShortCut := ShortCut (K_F5,[]);
      end;
    end;
  end;
  if (Modo=1) then
//        if (fichario.activepage=pagina3) then
//            fichario.activepage:=pagina1;
    if (Modo=2) then
      fichario.activepage:=pagina3//          if (fichario.activepage=pagina1) or (fichario.activepage=pagina2) then
  ;
end;

procedure Tfrm_edtCliente.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtCliente.btnSalvar2Click(Sender: TObject);
begin
  Salvarocliente1.click;
end;

{Opcao de inclusao do cliente ***}
procedure Tfrm_edtCliente.Incluircliente1Click(Sender: TObject);
begin
  if (frm_principal.x_checkcheckcont) then
    if (frmDialogo.ExibirMensagem ('Deseja realizar consulta financeira?'
      ,'Consulta financeira',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      ConexaoCheckCheck;
  HabilitaMenuCliente (false,true,false,true,true,false,true,true);
  if (CodigoInclusaoCliente=0) then
    CodigoInclusaoCliente := Round(MaxiCod_credito ('CRECLI',frm_principal.barraDicas));
  LimparEdits (1);
  LimparEdits (2);
  edtCodigo.text := form_nz (CodigoInclusaoCliente,6);
  edtCpf.text := '';
  fichario.activepage:=pagina1;
  edtCodigo.setfocus;
end;

{Opcao de cancelamento da inclusao do cliente}
procedure Tfrm_edtCliente.Cancelarinclusaocliente1Click(Sender: TObject);
begin
  HabilitaMenuCliente (true,false,false,false,true,false,true,true);
  LimparEdits (1);
  LimparEdits (2);
  edtCpf.text := '';
  edtCodigo.text:='';
  fichario.activepage:=pagina1;
  edtCodigo.setfocus;
end;

{Opcao de exclusao do cliente}
procedure Tfrm_edtCliente.Exclusaodocliente1Click(Sender: TObject);
{var
clClie: TClassCliente;
codigo: string;}
begin
  frmDialogo.ExibirMensagem (' O cliente não pode ser excluído neste ponto do sistema! '
    ,'Exclusão de cliente',[mbOK]
    ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

{Opcao de limpeza do cadastro do cliente}
procedure Tfrm_edtCliente.Limparcadastro1Click(Sender: TObject);
begin
  HabilitaMenuCliente (true,false,false,false,true,false,true,true);
  edtCpf.text := '';
  edtCodigo.text := '';
  fichario.activepage:=pagina1;
  edtCodigo.setfocus;
  LimparEdits (1);
  LimparEdits (2);
end;

{Navegacao-}
procedure Tfrm_edtCliente.HabilitaMenuCliente
  (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
begin
  if (menu1) then
    Incluircliente1.enabled:=true
  else
    Incluircliente1.enabled:=false;
  if (menu2) then
  begin
    Cancelarinclusaocliente1.enabled:=true;
    btnCancelainclusao2.enabled:=true;
  end
  else
  begin
    Cancelarinclusaocliente1.enabled:=false;
    btnCancelainclusao2.enabled:=false;
  end;
  if (menu3) then
    Exclusaodocliente1.enabled:=true
  else
    Exclusaodocliente1.enabled:=false;
  if (menu4) then
    Salvarcliente1.enabled:=true
  else
    Salvarcliente1.enabled:=false;
  if (menu5) then
    Limparcadastro1.enabled:=true
  else
    Limparcadastro1.enabled:=false;
  if (menu6) then
    Imprimirclienteindividual1.enabled:=true
  else
    Imprimirclienteindividual1.enabled:=false;
  if (menu7) then
    Imprimirclientescadastrados1.enabled:=true
  else
    Imprimirclientescadastrados1.enabled:=false;
  if (menu8) then
    Outrosrelatrios1.enabled:=true
  else
    Outrosrelatrios1.enabled:=false;
end;

{Opcao de saida do cliente}
procedure Tfrm_edtCliente.SAIR2Click(Sender: TObject);
begin
  close;
end;

{Opcao de salvamento do cliente ***}
procedure Tfrm_edtCliente.Salvarcliente1Click(Sender: TObject);
begin
  Salvarocliente1.click;
end;

{Opcao de saida do contrato}
procedure Tfrm_edtCliente.SAIR3Click(Sender: TObject);
begin
  SAIR1.click;
end;

{Opcao de inclusao do contrato}
procedure Tfrm_edtCliente.Incluircontrato1Click(Sender: TObject);
var
  antpanel: String;
begin
     {caso um cliente nao tenha sido definido ***}
  if (cdCliente=0) then
  begin
    frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
      ,'Data de nascimento',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    Mudaralojaedatadocontraot1.click;
    edtContrato.setfocus;
  end
  else
  begin
    if (Modo=2) then
      with (DMcontrato.qMaxiCont) do
      begin
        frm_principal.BarraDicas.caption:='Procurando o próximo número de contrato...';
        frm_principal.refresh;
        close;
        parambyname('cliente').asFloat:=cdCliente;
        open;
        CodigoInclusaoContrato:=fieldbyname('MAXIMO').AsInteger+1;
        frm_principal.BarraDicas.caption:='';
      end{procura pelo maximo codigo de contrato cadastrado para o cliente ***}
    else
    if (CodigoInclusaoContrato=0) then
      with (DMcontrato.qMaxiCont) do
      begin
        frm_principal.BarraDicas.caption:='Procurando o próximo número de contrato...';
        frm_principal.refresh;
        close;
        parambyname('cliente').asFloat:=cdCliente;
        open;
        CodigoInclusaoContrato:=fieldbyname('MAXIMO').AsInteger+1;
        frm_principal.BarraDicas.caption:='';
      end{procura pelo maximo codigo de contrato cadastrado para o cliente ***};
    btnEdtGrade.enabled:=false;
    btnCancelGrade.enabled:=false;
    btnSalvarGrade.enabled:=false;
    flagEditCheq:=false;
    btnEdtGrade.enabled:=false;
    btnCancelGrade.enabled:=false;
    btnSalvarGrade.enabled:=false;
    boInsert:=true;
    PodeChamarCheques:=false;
    edtContrato.setfocus;
    HabilitaMenuContrato (false,true,false,true,true,false,true,true);
    IniciarGradeLancamentos;
    antPanel:=pnTipoCad3.caption;
    LimparEdits (3);
    pnTipoCad3.caption := antPanel;
    edtContrato.text := form_nz (CodigoInclusaoContrato,6);
  end;
end;

{Opcao de cancelamento de inclusao do contrato}
procedure Tfrm_edtCliente.Cancelarinclusaocontrato1Click(Sender: TObject);
begin
  btnEdtGrade.enabled:=false;
  HabilitaMenuContrato (true,false,false,false,true,false,true,true);
  LimparEdits (3);
  edtContrato.text:='';
  edtContrato.setfocus;
end;

{Opcao de exclusao do contrato}
procedure Tfrm_edtCliente.Exclusodocontrato1Click(Sender: TObject);
begin
  frmDialogo.ExibirMensagem (' Contrato não pode ser excluído neste ponto do sistema! '
    ,'Data de nascimento',[mbOK]
    ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

{Opcao de salvamento do contrato}
procedure Tfrm_edtCliente.Salvarcontrato1Click(Sender: TObject);
begin
  Salvarocontrato1.click;
end;

{Opcao de limpeza do cadastro do contrato}
procedure Tfrm_edtCliente.Limparcadastro2Click(Sender: TObject);
begin
  antdifpdev := 0;
  btnEdtGrade.enabled:=false;
  btnCancelGrade.enabled:=false;
  btnSalvarGrade.enabled:=false;
  flagEditCheq:=false;
  HabilitaMenuContrato (true,false,false,false,true,false,true,true);
  AntPainel:=pnTipoCad3.caption;
  pnTipoCad3.caption:=AntPainel;
  IniciarGradeLancamentos;
  edtContrato.setfocus;
  LimparEdits (3);
end;

{Navegacao-}
procedure Tfrm_edtCliente.HabilitaMenuContrato
  (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
begin
  if (menu1) then
    Incluircontrato1.enabled:=true
  else
    Incluircontrato1.enabled:=false;
  if (menu2) then
  begin
    Cancelarinclusaocontrato1.enabled:=true;
    btnCancelainclusao1.enabled:=true;
  end
  else
  begin
    Cancelarinclusaocontrato1.enabled:=false;
    btnCancelainclusao1.enabled:=false;
  end;
  if (menu3) then
    Exclusodocontrato1.enabled:=true
  else
    Exclusodocontrato1.enabled:=false;
  if (menu4) then
    Salvarcontrato1.enabled:=true
  else
    Salvarcontrato1.enabled:=false;
  if (menu5) then
    Limparcadastro2.enabled:=true
  else
    Limparcadastro2.enabled:=false;
  if (menu6) then
    Imprimircontratoindividual1.enabled:=true
  else
    Imprimircontratoindividual1.enabled:=false;
  if (menu7) then
    Imprimircontratoscadastrados1.enabled:=true
  else
    Imprimircontratoscadastrados1.enabled:=false;
  if (menu8) then
    Outrosrelatrios2.enabled:=true
  else
    Outrosrelatrios2.enabled:=false;
end;

{Navegacao - IMPORTANTE: Atribuicao do codigo do cliente ao parametro do formulario}
{Navegacao- Criacao dos atalhos em tempo de execucao}
procedure Tfrm_edtCliente.DefinirAtalhos (iModo: Integer);
var
  cont1,cont2: Integer;
begin
     {limpando todos os atalhos}
  cont1:=0;
  while (cont1<=(menu.Items.count-1)) do
  begin
    menu.Items[cont1].ShortCut := ShortCut (NULO,[]);
    cont2:=0;
    while (cont2<=(menu.Items[cont1].count-1)) do
    begin
      menu.Items[cont1].Items[cont2].ShortCut := ShortCut (NULO,[]);
      cont2:=cont2+1;
    end;
    cont1:=cont1+1;
  end;
  if (iModo=0) then
  begin
          {vai depender de qual formulario estar ativo}
    Lancamentos.Items[0].ShortCut := ShortCut (K_F5,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (K_F5,[]);
    Lancamentos.Items[3].ShortCut := ShortCut (Ord('M'),[ssCtrl]);
    Lancamentos.Items[4].ShortCut := ShortCut (K_F3,[]);
    Lancamentos.Items[5].ShortCut := ShortCut (NULO,[]);
    Lancamentos.Items[6].ShortCut := ShortCut (Ord('P'),[ssCtrl]);
    Lancamentos.Items[7].ShortCut := ShortCut (Ord('H'),[ssCtrl]);
    Lancamentos.Items[9].ShortCut := ShortCut (Ord('E'),[ssCtrl]);
    Lancamentos.Items[10].ShortCut := ShortCut (Ord('A'),[ssCtrl]);
    Lancamentos.Items[11].ShortCut := ShortCut (Ord('S'),[ssCtrl]);
    Lancamentos.Items[13].ShortCut := ShortCut (Ord('X'),[ssCtrl]);
    Lancamentos.Items[14].ShortCut := ShortCut (Ord('Z'),[ssCtrl]);
    Lancamentos.Items[15].ShortCut := ShortCut (Ord('L'),[ssCtrl]);
  end;
  if (iModo=1) then
  begin
    Lancamentos.Items [13].ShortCut := ShortCut (Ord('X'),[ssCtrl]);
    Lancamentos.Items [14].ShortCut := ShortCut (Ord('Z'),[ssCtrl]);
    Formulario11.Items[0].ShortCut := ShortCut (K_F3,[]);
    Formulario11.Items[1].ShortCut := ShortCut (Ord('C'),[ssCtrl]);
    Formulario11.Items[2].ShortCut := ShortCut (K_F4,[]);
    Formulario11.Items[3].ShortCut := ShortCut (K_F5,[]);
    Formulario11.Items[4].ShortCut := ShortCut (Ord('L'),[ssCtrl]);
    Formulario11.Items[7].ShortCut := ShortCut (Ord('P'),[ssCtrl]);
    Formulario11.Items[8].ShortCut := ShortCut (Ord('O'),[ssCtrl]);
  end;
  if (iModo=2) then
  begin
    Lancamentos.Items [3].ShortCut := ShortCut (Ord('M'),[ssCtrl]);
    Lancamentos.Items[7].ShortCut := ShortCut (Ord('H'),[ssCtrl]);
      //  Formulario21.Items[0].ShortCut := ShortCut (K_F3,[]);
    Formulario21.Items[1].ShortCut := ShortCut (Ord('C'),[ssCtrl]);
    Formulario21.Items[2].ShortCut := ShortCut (K_F4,[]);
    Formulario21.Items[3].ShortCut := ShortCut (K_F5,[]);
    Formulario21.Items[4].ShortCut := ShortCut (Ord('L'),[ssCtrl]);
    Formulario21.Items[7].ShortCut := ShortCut (Ord('P'),[ssCtrl]);
    Formulario21.Items[8].ShortCut := ShortCut (Ord('O'),[ssCtrl]);
    Formulario21.Items[10].ShortCut := ShortCut (Ord('E'),[ssCtrl]);
    Formulario21.Items[11].ShortCut := ShortCut (Ord('A'),[ssCtrl]);
    Formulario21.Items[12].ShortCut := ShortCut (Ord('S'),[ssCtrl]);
  end;
end;

{Outros relatorios para o cadastro de clientes ***}
procedure Tfrm_edtCliente.Outrosrelatrios1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rl_tite, frm_rl_tite);
  with (frm_rl_tite) do
  begin
    tabela_nm:='CRECLI';
    caption:='Clientes';
    with (frm_rl_tite.cmb_campos.items) do
    begin
      clear;
      add('Codigo             CL_CODI  ;999999                                  ;I');
      add('Nome               CL_NOME  ;cccccccccccccccccccccccccccccccccc      ;T');
      add('Loja               CL_LOJA  ;99                                      ;I');
      add('Sexo               CL_SEXO  ;9                                       ;T');
      add('Bairro             CL_BAIR  ;ccccccccccccccccccccccccccc             ;T');
      add('Cidade             CL_CIDA  ;ccccccccccccccccccccccccccc             ;T');
      add('Estado             CL_ESTA  ;cc                                      ;T');
      add('Data de aniversar. CL_DTNA  ;99/99/9999                              ;D');
      add('Data de cadastro   CL_DTCA  ;99/99/9999                              ;D');
      add('Titulos protest.   CL_TPRO  ;9                                       ;T');
      add('Registro SPC       CL_DSPC  ;9                                       ;T');
      add('Salario            CL_SALA  ;9,999,999.99                            ;N');
      add('Limite de credito  CL_LIMC  ;9,999,999.99                            ;N');
      add('Data movimentação  CL_TIME  ;99/99/9999                              ;D');
    end;
    left := 32;
    top  := 20;
    showmodal;
  end;
end;

{Outros relatorios para o cadastro dos contratos}
procedure Tfrm_edtCliente.Outrosrelatrios2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_rl_tite, frm_rl_tite);
  with (frm_rl_tite) do
  begin
    tabela_nm:='CRECTABR';
    caption:='Contratos';
    with (frm_rl_tite.cmb_campos.items) do
    begin
      clear;
      add('Codigo             CR_CODI  ;999                                     ;I');
      add('Cliente            CR_CLIE  ;999999                                  ;I');
      add('Loja               CR_LOJA  ;999                                     ;I');
      add('Avalista           CR_AVAL  ;999999                                  ;I');
      add('Portador           CR_PORT  ;9999                                    ;I');
      add('Plano de pgto.     CR_PLAN  ;9999                                    ;I');
      add('Qtde. de prest.    CR_QPRE  ;99                                      ;I');
    end;
    left := 32;
    top  := 20;
    showmodal;
  end;
end;

{Impressao dos contratos cadastrados ***}
procedure Tfrm_edtCliente.Imprimircontratoscadastrados1Click(
  Sender: TObject);
begin
     {????}
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnIncluir2Click(Sender: TObject);
begin
  Incluircliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnCancelainclusao2Click(Sender: TObject);
begin
  Cancelarinclusaocliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnExcluir2Click(Sender: TObject);
begin
  Exclusaodocliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnImpIndiv2Click(Sender: TObject);
begin
  Imprimirclienteindividual1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnImprimir2Click(Sender: TObject);
begin
  Imprimirclientescadastrados1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnIncluir1Click(Sender: TObject);
begin
  Incluircontrato1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnCancelainclusao1Click(Sender: TObject);
begin
  Cancelarinclusaocontrato1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente.btnExcluir1Click(Sender: TObject);
begin
  Exclusodocontrato1.click;
end;

{Opcao de impressao dos clientes cadastrados ***}
procedure Tfrm_edtCliente.Imprimirclientescadastrados1Click(
  Sender: TObject);
var
  clClie: TClassCliente;
  totclie: Integer;
  nascimento,cnpj: String;
  indGauge,totGauge: Integer;
begin
     {Criando um acesso a classe}
  Mostra_mensagem ('Preparando relatório...Aguarde!');
  frm_mensagem.painel.visible:=true;
  frm_mensagem.gauge1.progress:=0;
  with (clClie) do
  begin
    clClie := TClassCliente.Create;
    conect   ('CREDITO', self);
    AddParam ('Select CL_CODI,CL_NOME,CL_CPF,CL_LOJA,CL_ENDE,CL_OEXP,CL_FONE, ');
    AddParam ('       CL_SEXO,CL_CIDA,CL_ESTA,CL_DTNA,CL_IDEN,CL_CPF,CL_PDC   ');
    AddParam ('From   CRECLI                                                  ');
    Execute;
  end;

     {Inicio da visualizacao da impressao ***}
  with (frm_mem_print) do
  begin
        {configurando o gerador de relatorios}
    PrepareReport;
    Pagina1.enabled:=true;
    frm_principal.x_col_impressao := 132;
    frm_principal.x_arq_impressao := 'p10.rel';
    frm_principal.x_comando       := '15c';
    frm_principal.x_tam_fonte     := 8;
    Title:= 'CADASTRO DE CLIENTES';

        {cabecalhos}
    totclie := 0;
    clClie.first;
    indGauge:=0;
    totGauge:=clClie.reccount;
    AddLine(form_tc('-',132,'-'));
    AddLine('Codigo|Lj|Nome do Cliente             |PDC |Sit| Endereco                    |  Fone     |Dt.Nasc. | Identidade    |  CPF / CNPJ');
    AddLine(form_tc('-',132,'-'));
    while (not clClie.eof) do
    begin
      cnpj := DevolveCpfFormatado(clClie.result('CL_CPF'));
      cnpj := FormataCNPJ(cnpj);
      if (clClie.Result('CL_DTNA')<>strtodate('01/01/1900')) then
        nascimento := form_data (clClie.Result('CL_DTNA'))
      else
        nascimento := 'EM BRANCO ';
      AddLine (form_nz   (clClie.Result('CL_CODI'),6)  +' '+
        form_nz   (clClie.Result('CL_LOJA'),2)  +' '+
        form_t    (clClie.Result('CL_NOME'),28) +' '+
        form_t    (clClie.Result('CL_PDC'),4)   +'     '+
        form_t    (clClie.Result('CL_ENDE'),29) +' '+
        form_t    (clClie.Result('CL_FONE'),11) +' '+
        nascimento    +' '+
        form_t    (clClie.Result('CL_IDEN'),12) +' '+
        form_t    (cnpj,18));
      totclie := totclie + 1;
      clClie.next;
      indGauge:=indGauge+1;
      frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
      frm_mensagem.refresh;
    end;
    AddLine(form_tc('-',132,'-'));
    AddLine('Total de clientes ---> '+form_nz (totclie,10));
    AddLine('');

        {salto de pagina}
    if (frm_principal.x_salto) then
      AddLine(chr(18)+chr(12))
    else
      AddLine(chr(18));
  end;
  frm_mem_print.windowstate:=wsMaximized;
  esconde_mensagem;
  frm_mem_print.showmodal;
  clClie.desconect;
  clClie.Free;
end;

{Procedimento que preenche os edits do plano ***}
procedure Tfrm_edtCliente.PreencheEditsContrato (classe: TClassContrato);
var
  clClie: TClassCliente;
  clPort: TClassPort;
  clPlano: TClassPlano;
  codplano,codcli,codaval,codport: String;
  nomecli: String;
begin
  with (classe) do
  begin
    edtLoja.text := form_nz(Result('CR_LOJA'),3);
    if (Result('CR_DNOT')<>strtodate('01/01/1900')) then
      edtDatContrato.text := datetostr(Result('CR_DNOT'));
//          edtNotaFiscal.text := Result('CR_NOTA');
//          edtSerieNota.text  := Result  ('CR_SERI');
    if (Result('CR_PORT')<>0) then
      edtPortador.text   := form_nz (Result('CR_PORT'),4)
    else
      edtPortador.text   :='';
    edtQtdeBoleta.Text := Result('CR_QBOL');
    if (strtofloat(Trim(edtQtdeBoleta.Text)) > 1) then
    begin
      btnEditarBoletas.Enabled := true;
      edtValMerc.Enabled := false;
      edtValEntrada.Enabled := false;
    end;
    edtValMerc.text    := form_nc (Result('CR_TOTA')+Result('CR_VENT'),10);
    edtValEntrada.text := form_nc (Result('CR_VENT'),10);
    pnTotalDevido.caption := form_nc(Result('CR_TOTA'),10);
    edtPlano.text      := form_nz (Result('CR_PLAN'),3);
    edtNumParc.text    := form_nz (Result('CR_QPRE'),2);
//          edtFator.text      := form_nc (Result('CR_FATO'),6);
    if (Result('CR_AVAL')<>0) then
      edtCodAval.text    := form_nz (Result('CR_AVAL'),6)
    else
      edtCodAval.text    := '';
    codcli  := IntToStr(Result('CR_CLIE'));
    codaval := Trim(edtCodAval.text);
    if (codcli<>'') or (codaval<>'') then
    begin
      clClie := TClassCliente.Create;
      with (clClie) do
      begin
        conect ('CREDITO',self);
        if (codcli<>'') then
        begin
          ClearSql;
          AddParam ('Select CL_CODI,CL_NOME      ');
          AddParam ('From   CRECLI               ');
          AddParam ('Where (CL_CODI='+codcli+')  ');
          if (not Execute) then
            nomecli :='<cliente nao encontrado>'
          else
            nomecli :=Result('CL_NOME');
        end;
        if (codaval<>'') then
        begin
          ClearSql;
          AddParam ('Select CL_CODI,CL_NOME      ');
          AddParam ('From   CRECLI               ');
          AddParam ('Where (CL_CODI='+codaval+') ');
          if (not Execute) then
            pnAval.caption :='<cliente nao encontrado>'
          else
            pnAval.caption :=Result('CL_NOME');
        end;
        desconect;
        Free;
      end;
    end;
    with (frm_EdtCliente) do
    begin
      cdLoja       := Result('CR_LOJA');
      datacontrato := Result('CR_DNOT');
      cdCliente    := Result('CR_CLIE');
      caption      := frm_principal.x_sistema+' - '+LB_CADASTRO_CONTRAT+
        ' - Loja: '+IntToStr(cdLoja)+ '  - Data: '+DateTostr(datacontrato);
      pnTipoCad3.caption := 'Cliente: '+nomecli;
    end;
    codport := Trim(edtPortador.text);
    if (codport<>'') then
    begin
      clPort := TClassPort.Create;
      with (clPort) do
      begin
        conect ('CREDITO', self);
        clearSql;
        AddParam ('Select PO_CODI,PO_NOME       ');
        AddParam ('From   CREPORT               ');
        AddParam ('Where  (PO_CODI='+codport+') ');
        if (not Execute) then
          pnPortador.caption := '<portador não encontrado>'
        else
          pnPortador.caption := Result('PO_NOME');
        desconect;
        Free;
      end;
    end;
    codplano:=Trim(edtPlano.text);
    if (codplano<>'') then
    begin
      clPlano := TClassPlano.Create;
      with (clPlano) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_TIPO,PL_CHEQ,PL_CARN,PL_LOCA ');
        AddParam ('From CREDPLANO                                 ');
        AddParam ('where (PL_CODI='+codplano+')                   ');
        if (not Execute) then
          pnPlano.caption := '<Plano nao encontrado>'
        else
          pnPlano.caption := Result('PL_TIPO');
        edtPlano.text := form_nz (StrtoFloat(codplano),3);
        if (Result('PL_CHEQ')='0') then
        begin
          cdCheq:=0;
          flagEditCheq := false;
        end
        else
        begin
          cdCheq:=1;
          flagEditCheq  := true;
        end;
        if (Result('PL_CARN')='1') then
        begin
          if (Result('PL_LOCA')='1') then
            cdCarn:=0
          else
            cdCarn:=1;
        end
        else
          cdCarn:=0;
        desconect;
        Free;
      end;
    end;

          {armazenando dados nao exibiveis ***}
    antdifpdev := result('CR_QPRE') - result('CR_PDEV'); {...}
  end;
end;

{Proc. que preenche a grade de prestacoes ***}
function Tfrm_edtCliente.PreencheGradeContrato (cliente,contrato: Real):Boolean;
var
  clPrestCont: TClassPrestContrat;
  totreg,lin: Integer;
  codcli,codigo: String;
begin
  clPrestCont := TClassPrestContrat.Create;
  codcli := FloatToStr(cliente);
  codigo := FloatToStr(contrato);
  if (codigo<>'') and (codcli<>'') then
    with (clPrestCont) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO,PC_NUME, ');
      AddParam ('       PC_BANC,PC_CCGC,PC_AGEN ');
      AddParam ('From   CREPRABR                                         ');
      AddParam ('Where  (PC_CONT='+codigo+') AND (PC_CLIE='+codcli+')    ');
      AddParam ('Order  by PC_NPRE ');
      if (Execute) then
      begin
        totreg := RecCount;
        grade_lancamentos.RowCount:= (totreg+1);
        lin:=1;
        while (lin<=totreg) do
        begin
          grade_lancamentos.Cells[0,lin] := inttostr(lin)+'a.';
          grade_lancamentos.Cells[1,lin] := form_nc(Result('PC_VALO'),13);
          grade_lancamentos.Cells[2,lin] := FormatDateTime('dd/mm/yy',Result('PC_DVTO'));
          if (Result('PC_NUME')<>0) then
            grade_lancamentos.Cells[3,lin] := form_n (Result('PC_NUME'),14)
          else
            grade_lancamentos.Cells[3,lin] := '';
          lin:=lin+1;
          next;
        end;
        PreencheGradeContrato := true;
        if (Result('PC_NUME')<>0) then
        begin
          lbl_cpf.caption := 'CNPJ do cliente: '+form_t(Result('PC_CCGC'),14);
          lbl_banco.caption := 'Banco/Agência: '+Trim(floattostr(Result('PC_BANC'))+'/'+
            Trim(Result('PC_AGEN')));
        end;
      end
      else
        PreencheGradeContrato := false;
      desconect;
      Free;
    end;
end;

{Opcao de impressao individual do contrato ***}
procedure Tfrm_edtCliente.Imprimircontratoindividual1Click(
  Sender: TObject);
var
  clClie: TClassCliente;
  clContrato: TClassContrato;
  clLoja: TClassLoja;
  clPort: TClassPort;
  clPlano: TClassPlano;
  clPrestCont: TClassPrestContrat;
  nomeport,codport,nomeaval,codaval: String;
  nomeloja,codloja,nomecli,codcli,codigo: String;
  status,nomeplano,codplano: String;
  ind: Integer;
begin
     {caso nao seja definido um cliente ***}
  if (cdCliente<>0) then
  begin
    codigo:=Trim(edtContrato.text);
    if (codigo<>'') then
    begin
      Mostra_mensagem ('Buscando informações sobre o contrato...Aguarde!');
      with (clContrato) do
      begin
        clContrato := TClassContrato.Create;
        conect ('CREDITO', self);
        AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_NOTA,CR_SERI,CR_PORT,CR_AVAL,  ');
        AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_DNOT   ');
        AddParam ('From   CRECTABR                                                  ');
        AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+') ');
        Execute;
      end;

           {Pesquisando cliente}
      codcli:=FloatToStr(clContrato.Result('CR_CLIE'));
      if (codcli<>'') then
        with (clClie) do
        begin
          clClie := TClassCliente.Create;
          Conect ('CREDITO',self);
          ClearSql;
          AddParam ('Select CL_CODI,CL_NOME ');
          AddParam ('From   CRECLI ');
          AddParam ('Where  (CL_CODI='+codcli+')');
          if (not Execute) then
            nomecli:='<nao encontrado>'
          else
            nomecli:=Result('CL_NOME');
        end;

           {pesquisando o avalista}
      codaval:=FloatToStr(clContrato.Result('CR_CLIE'));
      if (codaval<>'') then
        with (clClie) do
        begin
          ClearSql;
          AddParam ('Select CL_CODI,CL_NOME ');
          AddParam ('From   CRECLI ');
          AddParam ('Where  (CL_CODI='+codaval+')');
          if (not Execute) then
            nomeaval:='<nao encontrado>'
          else
            nomeaval:=Result('CL_NOME');
          desconect;
          Free;
        end;

           {Pesquisando a loja}
      codloja:=FloatToStr(clContrato.Result('CR_LOJA'));
      if (codloja<>'') then
      begin
        clLoja := TClassLoja.Create;
        with (clLoja) do
        begin
          conect ('CREDITO',self);
          AddParam ('Select LO_CODI,LO_NOME ');
          AddParam ('From CRELOJA ');
          AddParam ('Where (LO_CODI='+codloja+')');
          if (not Execute) then
            nomeloja:='<loja não cadastrada>'
          else
            nomeloja:=Result('LO_NOME');
          desconect;
          Free;
        end;
      end;

           {Pesquisando o portador}
      codport:=FloatToStr(clContrato.Result('CR_PORT'));
      if (codport<>'') then
        with (clPort) do
        begin
          clPort := TClassPort.Create;
          conect ('CREDITO', self);
          clearSql;
          AddParam ('Select PO_CODI,PO_NOME,PO_FONE ');
          AddParam ('From   CREPORT ');
          AddParam ('Where  (PO_CODI='+codport+')');
          if (not Execute) then
            nomeport:='<portador não encontrado>'
          else
            nomeport:=Result('PO_NOME')+'  Fone: '+Result('PO_FONE');
          desconect;
          Free;
        end;

           {pesquisando o plano de pgto.}
      codplano:=FloatToStr(clContrato.Result('CR_PLAN'));
      if (codplano<>'') then
        with (clPlano) do
        begin
          clPlano := TClassPlano.Create;
          conect ('CREDITO', self);
          clearSql;
          AddParam ('Select PL_CODI,PL_TIPO ');
          AddParam ('From   CREDPLANO ');
          AddParam ('Where  (PL_CODI='+codplano+')');
          if (not Execute) then
            nomeplano:='<plano não encontrado>'
          else
            nomeplano:=Result('PL_TIPO');
          desconect;
          Free;
        end;

           {Buscando dados sobre as parcelas - pagas/em aberto ***}
      clPrestCont := TClassPrestContrat.Create;
      with (clPrestCont) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO,PC_STAT ');
        AddParam ('From   CREPRABR ');
        AddParam ('Where  (PC_CONT='+codigo+') ');
        AddParam ('Order  by PC_NPRE ');
        Execute;
      end;
      Mostra_mensagem ('Preparando relatório...Aguarde!');

           {Inicio da visualizacao da impressao ***}
      with (frm_mem_print) do
      begin
              {configurando o gerador de relatorios}
        PrepareReport;
        Pagina1.enabled:=true;
        frm_principal.x_col_impressao := 80;
        frm_principal.x_arq_impressao := 'p10.rel';
        frm_principal.x_comando       := '12c';
        frm_principal.x_tam_fonte     := 12;
        Title:= 'CADASTRO DE CONTRATOS';

        AddLine(form_tc('-',80,'-'));
        AddLine('N. do contrato....: '+form_nz(StrtoFloat(codigo),6));
        AddLine('Nota fiscal.......: '+form_t(clContrato.Result('CR_NOTA'),10)+' -'+form_t(clContrato.Result('CR_SERI'),2));
        AddLine(form_tc('-',80,'-'));
        AddLine('Loja..............: '+form_nz(clContrato.Result('CR_LOJA'),4)+' - '+nomeloja);
        AddLine('Cliente...........: '+form_nz(clContrato.Result('CR_CLIE'),6)+' - '+nomecli);
        AddLine('Avalista..........: '+form_nz(clContrato.Result('CR_AVAL'),6)+' - '+nomeaval);
        AddLine('Portador..........: '+form_nz(clContrato.Result('CR_PORT'),4)+' - '+nomeport);
        AddLine(form_tc('-',80,'-'));
        AddLine('Valor do contrato.: '+form_nc(clContrato.Result('CR_VENT')+clContrato.Result('CR_TOTA'),10));
        AddLine('Valor da entrada..: '+form_nc(clContrato.Result('CR_VENT'),10));
        AddLine('Plano de pgto.....: '+form_nz(clContrato.Result('CR_PLAN'),4)+' - '+nomeplano);
        AddLine('N. de parcelas....: '+form_nz(clContrato.Result('CR_QPRE'),2)
          +'                         Fator de juros....: '+form_nc(clContrato.Result('CR_AVAL'),8));
        AddLine('Total financiado..: '+form_nc(clContrato.Result('CR_TOTA'),10));
        AddLine(form_tc('-',80,'-'));
        AddLine('                           DADOS SOBRE AS PARCELAS ');
        AddLine(form_tc('-',80,'-'));
        AddLine(' Numero da prest.         Valor        Vencimento        Status');
        AddLine(form_tc('-',80,'-'));
        clPrestCont.first;
        ind:=1;
        while (not clPrestCont.eof) do
        begin
          if (clPrestCont.Result('PC_STAT')='0') then
            status:='EM ABERTO'
          else
            status:='QUITADO';
          AddLine (' Prestação '+form_nz   (ind,2)                            +'        '+
            form_nc   (clPrestCont.Result('PC_VALO'),10) +'        '+
            form_data (clPrestCont.Result('PC_DVTO'))    +'        '+
            form_t    (status,10));
          clPrestCont.next;
          ind:=ind+1;
        end;
        AddLine(form_tc('-',80,'-'));
        AddLine('');
        AddLine(chr(18)+chr(12));
      end;
      clContrato.desconect;
      clContrato.Free;
      clPrestCont.desconect;
      clPrestCont.Free;
      frm_mem_print.windowstate:=wsMaximized;
      esconde_mensagem;
      frm_mem_print.showmodal;
      esconde_mensagem;
    end;
  end;
end;

{Navegacao-}
procedure Tfrm_edtCliente.cbEstadoExit(Sender: TObject);
begin
  cbEstado.text := UpperCase(cbEstado.text);
end;

{A tela de cheques so pode ser chamada no caso de Contrato com plano
de pgto. com cheques pre-datados ***}
procedure Tfrm_edtCliente.Gerarcheques1Click(Sender: TObject);
var
  clPlano: TClassPlano;
  codigo,codplan: String;
begin
  codplan := Trim(edtPlano.text);
  codigo  := Trim(edtContrato.text);
  if (codplan<>'') then
  begin
        {CRITICA AOS DADOS}
    if (ContratoSendoPago(cdCliente,strtofloat(codigo))) then
    begin
      frmDialogo.ExibirMensagem ('Se deseja alterar os cheques de contratos já pagos, reabra todo o contrato e tente novamente!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtContrato.setfocus;
    end
    else
    begin
      with (clPlano) do
      begin
        clPlano := TClassPlano.Create;
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PL_CODI,PL_TIPO,PL_CHEQ ');
        AddParam ('From CREDPLANO ');
        AddParam ('where (PL_CODI='+codplan+')');
        if (Execute) then
          if (clPlano.Result('PL_CHEQ')='1') then
          begin
            if (PodeChamarCheques) then
            begin
              Application.CreateForm(Tfrm_aux2Contrato, frm_aux2Contrato);
              with (frm_aux2Contrato) do
              begin
                showmodal;
                Free;
              end;
            end
            else
              frmDialogo.ExibirMensagem ('O contrato ainda não foi salvo!'
                ,'Gerar cheques',[mbOk]
                ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          end
          else
            frmDialogo.ExibirMensagem ('O plano de pagamento não é pago com cheque!'
              ,'Gerar cheques',[mbOk]
              ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        desconect;
        Free;
      end;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('O plano de pagamento ainda não foi definido!'
      ,'Gerar cheques',[mbOk]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_edtCliente.edtCodigoExit(Sender: TObject);
begin
  if (trim(edtCodigo.text)<>'') then
    edtCodigo.tag:=0;
  Salvarocliente1.enabled:=true;
  Salvarocontrato1.enabled:=true;
  Exclusaodocliente1.enabled:=true;
  Exclusaodocliente1.enabled:=true;
  Salvarcliente1.enabled:=true;
  if (Trim(edtCodigo.text)<>'') then
    cdCliente := Strtoint(sem_brancos(Trim(edtCodigo.text)));
end;

{duplo clique no codigo do portador ***}
procedure Tfrm_edtCliente.edtPortadorDblClick(Sender: TObject);
begin
  with (frm_f8Port) do
  begin
    left:=287;
    top :=76;
    edit:=edtPortador;
    btnCadastro.visible:=true;
    showmodal;
  end;
end;

{duplo clique no codigo do plano de pagamento ***}
procedure Tfrm_edtCliente.edtPlanoDblClick(Sender: TObject);
begin
  with (frm_f8Planos) do
  begin
    edit:=edtPlano;
    btnCadastro.visible:=false;
    showmodal;
  end;
end;

{Opção de impressão individual do cadastro do cliente ***}
procedure Tfrm_edtCliente.Imprimirclienteindividual1Click(Sender: TObject);
var
  clClie: TClassCliente;
  cnpj,codigo: String;
begin
     {Criando um acesso a classe}
  codigo:=Trim(edtCodigo.text);
  if (codigo<>'') then
  begin
    Mostra_mensagem ('Buscando informações sobre o cliente...Aguarde!');
    with (clClie) do
    begin
      clClie := TClassCliente.Create;
      conect ('CREDITO', self);
      AddParam ('Select CL_CODI,CL_NOME,CL_ENDE,CL_SEXO,CL_BAIR,CL_CIDA,CL_ESTA, ');
      AddParam ('       CL_CEP,CL_FONE,CL_FAX,CL_CELU,CL_EMAI,CL_DTNA,CL_IDEN, ');
      AddParam ('       CL_OEXP,CL_CPF,CL_ECIV,CL_CONJ,CL_NPAI,CL_NMAE,CL_REF1,CL_REF2, ');
      AddParam ('       CL_TRF1,CL_TRF2,CL_EMPR,CL_CARG,CL_EEMP,CL_FEMP,CL_DADM,CL_CPRO, ');
      AddParam ('       CL_SALA,CL_LIMC,CL_OBSE ');
      AddParam ('From   CRECLI ');
      AddParam ('Where (CL_CODI='+codigo+') ');
      Execute;
    end;
    with (frm_mem_print) do
    begin
      PrepareReport;
      Pagina1.enabled:=true;
      frm_principal.x_empresa := frm_principal.x_empresa;
      AddLine('Data do relatorio: '+form_data(frm_principal.x_data_trabalho));
      AddLine(form_tc('-',80,'-'));
      AddLine('Código do cliente...: '+form_nz(clClie.Result('CL_CODI'),3));
      AddLine('Nome................: '+clClie.Result('CL_NOME'));
      AddLine('Endereço............: '+clClie.Result('CL_ENDE'));
      if (clClie.Result('CL_SEXO')='M') then
        AddLine('Sexo................: MASCULINO')
      else
        AddLine('Sexo................: FEMININO');
      AddLine('Bairro..............: '+clClie.Result('CL_BAIR'));
      AddLine('Cidade..............: '+clClie.Result('CL_CIDA'));
      AddLine('Estado..............: '+clClie.Result('CL_ESTA'));
      AddLine('CEP.................: '+clClie.Result('CL_CEP'));
      AddLine(form_tc('-',80,'-'));
      AddLine('Fone................: '+clClie.Result('CL_FONE'));
      AddLine('Fax.................: '+clClie.Result('CL_FAX'));
      AddLine('Celular.............: '+clClie.Result('CL_CELU'));
      AddLine('Endereço de e-mail..: '+clClie.Result('CL_EMAI'));
      AddLine(form_tc('-',80,'-'));
      AddLine('Data de nascimento..: '+datetostr(clClie.Result('CL_DTNA')));
      AddLine(form_tc('-',80,'-'));
      AddLine('Identidade..........: '+clClie.Result('CL_IDEN'));
      AddLine('Orgão expedidor.....: '+clClie.Result('CL_OEXP'));
      cnpj := DevolveCpfFormatado(clClie.result('CL_CPF'));
      cnpj := FormataCNPJ (cnpj);
      AddLine('C.P.F...............: '+cnpj);
      AddLine('Estado civil........: '+clClie.Result('CL_ECIV'));
      AddLine(form_tc('-',80,'-'));
      AddLine('Conjuge.............: '+clClie.Result('CL_CONJ'));
      AddLine('Nome do Pai.........: '+clClie.Result('CL_NPAI'));
      AddLine('Nome da Mãe.........: '+clClie.Result('CL_NMAE'));
      AddLine(form_tc('-',80,'-'));
      AddLine('Referência 01.......: '+clClie.Result('CL_REF1')+' - '+clClie.Result('CL_TRF1'));
      AddLine('Referência 02.......: '+clClie.Result('CL_REF2')+' - '+clClie.Result('CL_TRF2'));
      AddLine(form_tc('-',80,'-'));
      AddLine('Local de trabalho...: '+clClie.Result('CL_EMPR'));
      AddLine('Cargo ocupado.......: '+clClie.Result('CL_CARG'));
      AddLine('Endereço............: '+clClie.Result('CL_EEMP'));
      AddLine('Fone do emprego.....: '+clClie.Result('CL_FEMP'));
      AddLine('Data de admissão....: '+datetostr(clClie.Result('CL_DADM')));
      AddLine('Carteira profiss....: '+clClie.Result('CL_CPRO'));
      AddLine('Salário.............: '+form_nc(clClie.Result('CL_SALA'),10));
      AddLine(form_tc('-',80,'-'));
      AddLine('Limite de crédito...: '+form_nc(clClie.Result('CL_LIMC'),10));
      AddLine('');
      AddLine('Observação:');
      AddLine(clClie.Result('CL_OBSE'));
    end;
    clClie.desconect;
    frm_mem_print.windowstate:=wsMaximized;
    esconde_mensagem;
    frm_mem_print.showmodal;
    clClie.Free;
  end;
end;

{Botao que abre a edicao na grade ***}
procedure Tfrm_edtCliente.btnEdtGradeClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') and (Trim(edtPlano.text)<>'') then
    if (ContratoSendoPago(cdCliente,strtofloat(Trim(edtContrato.text)))) then
    begin
      frmDialogo.ExibirMensagem ('O contrato não pode ser alterado porque seu pagamento já foi iniciado!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtContrato.setfocus;
    end
    else
    if (flagConsulta) and
      (not frm_principal.x_alteracao_contrato_consulta) and
      (ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) then
    begin
      frmDialogo.ExibirMensagem (' A alteração do contrato não é permitida neste ponto do sistema! '
        ,'Salvar',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtContrato.setfocus;
    end
    else
    begin
      btnEdtGrade.enabled := false;
      btnCancelGrade.enabled := true;
      btnSalvarGrade.enabled := true;
      grade_lancamentos.options := [goFixedVertLine, goFixedHorzLine, goVertLine,
        goHorzLine, goRangeSelect, goEditing];
      grade_lancamentos.setfocus;
      grade_lancamentos.col:=1;
      grade_lancamentos.row:=1;

            {Inibindo todo o formulario para evitar erros ***}
            {So desinibe quando libera a edicao das informacoes}
      PodeFecharForm:=false;
      edtContrato.enabled:=false;
      edtNotaFiscal.enabled:=false;
      edtSerieNota.enabled:=false;
      edtCodAval.enabled:=false;
      edtPortador.enabled:=false;
      edtValMerc.enabled:=false;
      edtValEntrada.enabled:=false;
      edtPlano.enabled:=false;
      edtNumParc.enabled:=false;
      edtFator.enabled:=false;
      edtLoja.enabled:=false;
      edtDatContrato.enabled:=false;
      btnGerarPrestacoes.enabled:=false;
      bitbtnRetornar2.enabled:=false;
      btnIncluir1.enabled:=false;
      btnCancelainclusao1.enabled:=false;
      btnExcluir1.enabled:=false;
      btnSalvar1.enabled:=false;
      btnImpCarnet.enabled:=false;
            //botao_sair2.enabled:=false;
      pnAval.enabled:=false;
      pnPortador.enabled:=false;
      pnPlano.enabled:=false;
      if (Modo=0) then
      begin
        Salvarocliente1.enabled:=false;
        Salvarocontrato1.enabled:=false;
        Mudaralojaedatadocontraot1.enabled:=false;
        Novocontrato1.enabled:=false;
        Gerarprestacoes1.enabled:=false;
        Imprimircarnet1.enabled:=false;
        Gerarcheques1.enabled:=false;
        Prosseguecadastro1.enabled:=false;
        Retornacadastro1.enabled:=false;
        Limpareditspagina11.enabled:=false;
        SAIR1.enabled:=false;
        Formulario21.enabled:=false;
      end;
      if (Modo=2) then
      begin
        flagInc2:=Incluircontrato1.enabled;
        flagCanc2:=Cancelarinclusaocontrato1.enabled;
        flagExc2:=Exclusodocontrato1.enabled;
        flagSalv2:=Salvarcontrato1.enabled;
        flagIndiv2:=Imprimircontratoindividual1.enabled;
        Incluircontrato1.enabled:=false;
        Cancelarinclusaocontrato1.enabled:=false;
        Exclusodocontrato1.enabled:=false;
        Salvarcontrato1.enabled:=false;
        Limparcadastro2.enabled:=false;
        Imprimircontratoindividual1.enabled:=false;
        Imprimircontratoscadastrados1.enabled:=false;
        Outrosrelatrios2.enabled:=false;
        SAIR3.enabled:=false;
        Lancamentos.enabled:=false;
      end;
      if (sender = BtnEdtGrade) and Grade_Lancamentos.CanFocus then
        Grade_Lancamentos.Setfocus;
      Formulario11.enabled:=false;
    end{CRITICA À EDICAO DA GRADE};
end;

{Botao de cancelamento das alteracoes na grade ***}
procedure Tfrm_edtCliente.btnCancelGradeClick(Sender: TObject);
begin
  btnEdtGrade.enabled    := true;
  btnCancelGrade.enabled := false;
  bitbtnConfirmar.enabled := false;
  grade_lancamentos.options := [goFixedVertLine, goFixedHorzLine, goVertLine,
    goHorzLine, goRangeSelect];

     {Desinibindo o formulario enteiro ***}
  edtContrato.enabled:=true;
  edtNotaFiscal.enabled:=true;
  edtSerieNota.enabled:=true;
  edtCodAval.enabled:=true;
  edtPortador.enabled:=true;
  edtValMerc.enabled:=true;
  edtValEntrada.enabled:=true;
  edtPlano.enabled:=true;
  edtNumParc.enabled:=true;
//     edtFator.enabled:=true;
  edtLoja.enabled:=true;
  edtDatContrato.enabled:=true;
  btnGerarPrestacoes.enabled:=true;
  bitbtnRetornar2.enabled:=true;
  btnIncluir1.enabled:=true;
  btnCancelainclusao1.enabled:=true;
  btnExcluir1.enabled:=true;
  btnSalvar1.enabled:=true;
  btnImpCarnet.enabled:=true;
     //botao_sair2.enabled:=true;
  pnAval.enabled:=true;
  pnPortador.enabled:=true;
  pnPlano.enabled:=true;
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=true;
    Salvarocontrato1.enabled:=true;
    Mudaralojaedatadocontraot1.enabled:=true;
    Novocontrato1.enabled:=true;
    Gerarprestacoes1.enabled:=true;
    Imprimircarnet1.enabled:=true;
    Gerarcheques1.enabled:=true;
    Prosseguecadastro1.enabled:=true;
    Retornacadastro1.enabled:=true;
    Limpareditspagina11.enabled:=true;
    SAIR1.enabled:=true;
    Formulario21.enabled:=true;
  end;
  if (Modo=2) then
  begin
    Incluircontrato1.enabled:=flagInc2;
    Cancelarinclusaocontrato1.enabled:=flagCanc2;
    Exclusodocontrato1.enabled:=flagExc2;
    Salvarcontrato1.enabled:=flagSalv2;
    Imprimircontratoindividual1.enabled:=flagIndiv2;
    btnIncluir1.enabled:=flagInc2;
    btnCancelainclusao1.enabled:=flagCanc2;
    btnExcluir1.enabled:=flagExc2;
    btnSalvar1.enabled:=flagSalv2;
    Limparcadastro2.enabled:=true;
    Imprimircontratoscadastrados1.enabled:=true;
    Outrosrelatrios2.enabled:=true;
    SAIR3.enabled:=true;
    Lancamentos.enabled:=true;
  end;
  Formulario11.enabled:=true;

     {preenche novamente a grade com que lá estava ***}
     {As prestacoes podem estar salvas ou nao}
  if (Trim(edtContrato.text)<>'') then
    if (not PreencheGradeContrato (cdCliente,strtoint(Trim(edtContrato.text)))) then
      btnGerarPrestacoes.click;
  PodeFecharForm:=true;
  edtContrato.setfocus;
end;

{Botao de salvamento das alteracoes na grade **** -------------------------}
procedure Tfrm_edtCliente.btnSalvarGradeClick(Sender: TObject);
var
  clCheq: TClassCheque;
  clPrestContrat,clPrest: TClassPrestContrat;
  fator,total2,total,banco_anterior,numero: Real;
  codcli,codigo,contrato: String;
  agencia_anterior: String;
  clClie: TClassCliente;
  data_ultimo_contrato: TDateTime;
  continua: Boolean;
  valor_minimo_entrada: Real;
  valor_entrada,valor_contrato: Real;
  lin: Integer;
  valor_financiado: Real;
  cli_sem_comprar_dias,cli_atras_dias: Integer;
  dataEmissao,dataGrade :TDateTime;
  ind :Integer;
begin
     {CRITICA AOS DADOS--}

     {************************************************************************************************}
     {1a. critica - verificando se o total bate com o valor financiado}
     {Somente se o juros for igual a zero}
     {************************************************************************************************}
  dataEmissao := StrToDate(edtDatContrato.Text);
  for ind := 1 to nunprestacao do
  begin
    try
      dataGrade := StrToDate(Trim(grade_lancamentos.Cells[2,ind]));
    except
      begin
        frmDialogo.ExibirMensagem ('Data de Vencimento Invalida !'
          ,'Contratos',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
      end;
    end;
    if (dataEmissao > dataGrade) then
    begin
        frmDialogo.ExibirMensagem ('Data de vencimento não pode ser inferior a Data de Emissão!'
          ,'Contratos',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
    end;
  end;
  continua:=true;
  if (Trim(edtFator.text)<>'') then
    fator:=0.00
          //strtofloat(RetiraFormatacaoNumero(Trim(edtFator.text)))
  else
    fator:=0.00;
  if (fator=0.00) then
  begin
    lin:=1;
    total:=0.00;
    total2:=strtofloat(RetiraFormatacaoNumero(Trim(pnTotalDevido.caption)));
    while (lin<grade_lancamentos.RowCount) do
    begin
      if (Trim(grade_lancamentos.Cells[1,lin])<>'') then
        total:=total+strtofloat(RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
      lin:=lin+1;
    end;
    if (form_nc(total,10)<>form_nc(total2,10)) then
    begin
              {....}
      if (frmDialogo.ExibirMensagem (' Aparentemente, o total das prestações não está igual ao financiamento! '+
        'Continua mesmo assim?','Edição de valores',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconeerro.bmp',120,300)=mrNo) then
      begin
        continua:=false;
        grade_lancamentos.row:=1;
        grade_lancamentos.col:=1;
        grade_lancamentos.setfocus;
      end;
    end
    else
      continua:=true;
  end;

     {************************************************************************************************}
     {2a. critica - Total de prestacoes de cheques deve ser igual ao do contrato,
         em caso de alteracao pre-matura}
     {************************************************************************************************}
  if (continua) then
    if ((grade_lancamentos.rowcount-1)<>
      NumParcContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) and
      (ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) and
      (cdCheq=1) then
    begin
      continua:=false;
      frmDialogo.ExibirMensagem ('Em contratos de cheque, o total de prestações não pode ser alterado!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      btnCancelGrade.click;
    end;
     {************************************************************************************************}
  if (continua) then
    if (not ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) then
      continua := CriticaLancamentoContrato;//critica aqui somente se o contrato nao existe
     {************************************************************************************************}

     {...}
  if (continua) then
  begin
    {Configuracoes de tela}
    btnEdtGrade.enabled:=true;
    btnCancelGrade.enabled:=false;
    bitbtnConfirmar.enabled:=false;
    grade_lancamentos.options:=[goFixedVertLine, goFixedHorzLine, goVertLine,
      goHorzLine, goRangeSelect];

    {buscando as prestacoes para, entao, buscar os cheques, caso existam ***}
    {Os cheques serao apagados ***}
    banco_anterior   := 0;
    agencia_anterior := '';
    clPrest := TClassPrestContrat.Create;
    contrato:=Trim(edtContrato.text);
    with (clPrest) do
    begin
      conect   ('CREDITO',self);
      ClearSql;
      AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO, ');
      AddParam ('       PC_CCGC,PC_BANC,PC_NUME,PC_AGEN                  ');
      AddParam ('From   CREPRABR                                         ');
      AddParam ('Where  (PC_CONT='+contrato+') AND                       ');
      AddParam ('       (PC_CLIE='+inttostr(cdCliente)+')                ');
      AddParam ('ORDER BY PC_NPRE                                        ');
      frm_principal.BarraDicas.caption:='Buscando prestações...';
      frm_principal.refresh;
      if (Execute) then
      begin
        banco_anterior   := clPrest.Result('PC_BANC');
        agencia_anterior := clPrest.Result('PC_AGEN');
        clPrest.first;
        while (not clPrest.eof) do
        begin
          with (DMcontrato.qApagaCheque) do
          begin
            ParambyName ('ccgc').AsString  := clPrest.Result('PC_CCGC');
            ParambyName ('banco').AsFloat  := clPrest.Result('PC_BANC');
            ParambyName ('numero').AsFloat := clPrest.Result('PC_NUME');
            ExecSql;
          end;
          clPrest.next;
        end;
      end;
    end;

    {Busacando cliente ***}
    with (clClie) do
    begin
      clClie := TClassCliente.Create;
      clClie.conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE   ');
      AddParam ('From   CRECLI                           ');
      AddParam ('Where (CL_CODI='+inttostr(cdCliente)+') ');
      frm_principal.BarraDicas.caption:='Buscando cliente...';
      frm_principal.refresh;
      Execute;
    end;

    {salvando as novas prestacoes ***}
    clPrestContrat := TClassPrestContrat.Create;
    with (clPrestContrat) do
    begin
      {Apagando as prestacoes criadas anteriormente ***}
      codcli:=FloatToStr(cdCliente);
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Delete From CREPRABR                                  ');
      AddParam ('Where (PC_CONT='+contrato+') AND (PC_CLIE='+codcli+') ');
      frm_principal.BarraDicas.caption:='Apagando as prestações...';
      frm_principal.refresh;
      Execute;
      {********************************************************************}
      ClearSql;
      AddParam ('Delete From MOVIMENTO_CREPRABR                        ');
      AddParam ('Where (PC_CONT='+contrato+') AND (PC_CLIE='+codcli+') ');
      frm_principal.BarraDicas.caption:='Apagando as prestações...';
      frm_principal.refresh;
      try
        Execute;
      except
      end;
      {********************************************************************}
      lin:=1;
      while (lin<grade_lancamentos.RowCount) do
      begin
        ClearFields;
        inPC_CONT := StrToFloat (contrato);
        inPC_CLIE := cdCliente;
        inPC_NPRE := lin;
        inPC_CCGC := clClie.Result('CL_CPF');
        inPC_BANC := banco_anterior;
        inPC_AGEN := agencia_anterior;
        if (Trim(grade_lancamentos.Cells[3,lin])<>'') then
          inPC_NUME := StrToFloat (Trim(grade_lancamentos.Cells[3,lin]));
        if (Trim(edtLoja.text)<>'') then
          inPC_LOJA := StrtoFloat(Trim(edtLoja.text))
        else
          inPC_LOJA := cdLoja;
        if (edtDatContrato.text<>'  /  /    ') then
          inPC_DCON := strtodate(edtDatContrato.text)
        else
          inPC_DCON := datacontrato;
        if (Trim(edtPortador.text)<>'') then
          inPC_PORT := StrToFloat (edtPortador.text);
        if (Trim(edtCodAval.text)<>'') then
          inPC_AVAL := StrToFloat (edtCodAval.text);
        if (Trim(edtPlano.text)<>'') then
          inPC_PLAN := StrToFloat (edtPlano.text);
        inPC_VALO := StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
        inPC_DVTO := StrToDate  (Trim(grade_lancamentos.Cells[2,lin]));
        inPC_FATO := 0;
             //StrToFloat (Trim(edtFator.text));
        inPC_TPRE := StrToFloat (Trim(edtNumParc.text));
        inPC_TIME := frm_principal.x_data_trabalho;
        inPC_FPGT := 0;
        Insert;
        lin:=lin+1;
      end;
      desconect;
      Free;
    end;


        {... Regerando cheques}
    frm_principal.BarraDicas.caption:='Gerando cheques...';
    frm_principal.refresh;
    with (clPrest) do
    begin
      first;
      lin:=1;
      while (not eof) do
      begin
        clCheq := TClassCheque.Create;
        with (clCheq) do
        begin
          conect ('CREDITO',self);
          if (Trim(grade_lancamentos.Cells[3,lin])<>'') then
          begin
            ClearFields;
            inCH_CLIE := cdCliente;
            numero    := strtofloat(RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[3,lin])));
            inCH_NUME := numero;
            inCH_BANC := clPrest.Result('PC_BANC');
            inCH_AGEN := clPrest.Result('PC_AGEN');
            inCH_CCGC := clClie.Result('CL_CPF');
            if (Trim(edtLoja.text)<>'') then
              inCH_LOJA := strtofloat(Trim(edtLoja.text))
            else
              inCH_LOJA := cdLoja;
            if (edtDatContrato.text='  /  /    ') then
              inCH_DTCT := DataContrato
            else
              inCH_DTCT := strtodate(edtDatContrato.text);
            inCH_NOME := clClie.Result('CL_NOME');
            inCH_FONE := clClie.Result('CL_FONE');
            inCH_VALO := StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
            inCH_DVTO := StrToDate  (Trim(grade_lancamentos.Cells[2,lin]));
            if (Trim(edtPortador.text)<>'') then
              inCH_PORT := StrToFloat(edtPortador.text);
            inCH_TIME := frm_principal.x_data_trabalho;
            Insert;
            desconect;
            Free;
          end;
        end;
        next;
        lin:=lin+1;
      end;
      desconect;
      Free;
    end;

        {desconectando tudo}
    clClie.desconect;
    clClie.Free;
    frm_principal.BarraDicas.caption:='';
    frm_principal.refresh;

        {Desinibindo o formulario inteiro ***}
    edtContrato.enabled:=true;
    edtNotaFiscal.enabled:=true;
    edtSerieNota.enabled:=true;
    edtCodAval.enabled:=true;
    edtPortador.enabled:=true;
    edtValMerc.enabled:=true;
    edtValEntrada.enabled:=true;
    edtPlano.enabled:=true;
    edtNumParc.enabled:=true;
//        edtFator.enabled:=true;
    edtLoja.enabled:=true;
    edtDatContrato.enabled:=true;
    btnGerarPrestacoes.enabled:=true;
    bitbtnRetornar2.enabled:=true;
    btnIncluir1.enabled:=true;
    btnCancelainclusao1.enabled:=true;
    btnExcluir1.enabled:=true;
    btnSalvar1.enabled:=true;
    btnImpCarnet.enabled:=true;
        //botao_sair2.enabled:=true;
    pnAval.enabled:=true;
    pnPortador.enabled:=true;
    pnPlano.enabled:=true;
    if (Modo=0) then
    begin
      Salvarocliente1.enabled:=true;
      Salvarocontrato1.enabled:=true;
      Mudaralojaedatadocontraot1.enabled:=true;
      Novocontrato1.enabled:=true;
      Gerarprestacoes1.enabled:=true;
      Imprimircarnet1.enabled:=true;
      Gerarcheques1.enabled:=true;
      Prosseguecadastro1.enabled:=true;
      Retornacadastro1.enabled:=true;
      Limpareditspagina11.enabled:=true;
      SAIR1.enabled:=true;
      Formulario21.enabled:=true;
    end;
    if (Modo=2) then
    begin
      Incluircontrato1.enabled:=flagInc2;
      Cancelarinclusaocontrato1.enabled:=flagCanc2;
      Exclusodocontrato1.enabled:=flagExc2;
      Salvarcontrato1.enabled:=flagSalv2;
      Imprimircontratoindividual1.enabled:=flagIndiv2;
      btnIncluir1.enabled:=flagInc2;
      btnCancelainclusao1.enabled:=flagCanc2;
      btnExcluir1.enabled:=flagExc2;
      btnSalvar1.enabled:=flagSalv2;
      Limparcadastro2.enabled:=true;
      Imprimircontratoscadastrados1.enabled:=true;
      Outrosrelatrios2.enabled:=true;
      SAIR3.enabled:=true;
      Lancamentos.enabled:=true;
    end;
    Formulario11.enabled:=true;
    Formulario21.enabled:=true;
    PodeFecharForm:=true;
        {***********************************************************}
    Salvarocontrato1.click;
        {***********************************************************}
  end;
end;

{Formatacao de mascara da grade ***}
procedure Tfrm_edtCliente.grade_lancamentosGetEditMask(Sender: TObject;
  ACol, ARow: Longint; var Value: String);
begin
  if (ACol=1) then
    Value := 'cccccccc;0; ';
  if (ACol=2) then
    Value := '99/99/99;1; ';
  if (ACol=3) then
    Value := '99999999;0; ';
end;

{Ajuda na formatacao dos elementros da grade ***}
procedure Tfrm_edtCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
     {somente no cadastro do contrato---}
  if (fichario.activepage=pagina3) then
    if key='.' then
      key:=',';
end;

{Formatacao da grade ***}
procedure Tfrm_edtCliente.grade_lancamentosDrawCell(Sender: TObject; Col,
  Row: Longint; Rect: TRect; State: TGridDrawState);
var
  text: String;
  limpou: Boolean;
begin
  if (Col=1) and (Row>0) then
  begin
    text   := Trim(grade_lancamentos.Cells[col,row]);
    limpou := false;
    while (Pos(' ',text)<>0) do
    begin
      Delete (text,Pos(' ',text),1);
      limpou:=true;
    end;
    if (limpou) then
      grade_lancamentos.Cells[col,row]:=text;
    if (text='') or (text='0,') or (text='0,0') or
      (text=',00') or (text=',0') or (text='0')
    then
    begin
      text:='00,00';
      grade_lancamentos.Cells[col,row]:=text;
    end
    else
    if Pos(',',text)=0 then
    begin
      text:=text+',00';
      grade_lancamentos.Cells[col,row]:=text;
    end
    else
    if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=1) then
    begin
      text:=text+'0';
      grade_lancamentos.Cells[col,row]:=text;
    end
    else
    if (Length(Copy(text,Pos(',',text)+1,Length(text)-Pos(',',text)))=0) then
    begin
      text:=text+'00';
      grade_lancamentos.Cells[col,row]:=text;
    end
    else
    if (text[1]=',') then
    begin
      text:='00'+text;
      grade_lancamentos.Cells[col,row]:=text;
    end;
  end;
end;

{Formatacao da grade ***---}
procedure Tfrm_edtCliente.grade_lancamentosSetEditText(Sender: TObject;
  ACol, ARow: Longint; const Value: String);
var
  numero: String;
  tam: Integer;
begin
  if (grade_lancamentos.Col=1) then
    if Trim(value)<>'' then
    begin
      numero:=value;
      tam:=Length(value);
      if (numero[tam]='.') then
      begin
        if Pos(',',numero)=0 then
        begin
          if (tam=1) then
          begin
            numero[tam]:=' ';
            grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
          end
          else
          begin
            numero[tam]:=',';
            grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
          end;
        end
        else
        begin
          numero[tam]:=' ';
          grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
        end;
      end
      else
      if (numero[tam]<>'1') and (numero[tam]<>'2') and
        (numero[tam]<>'3') and (numero[tam]<>'4') and
        (numero[tam]<>'5') and (numero[tam]<>'6') and
        (numero[tam]<>'7') and (numero[tam]<>'8') and
        (numero[tam]<>'9') and (numero[tam]<>'0') and
        (numero[tam]<>',')
      then
      begin
        numero[tam]:=' ';
        grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
      end
      else
      if (Pos(',',numero)<>0) then
      begin
        if (Length(Copy(numero,Pos(',',numero)+1,tam-Pos(',',numero)))>2) then
        begin
          numero[tam]:=' ';
          grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
        end
        else
        begin
          if (numero[tam]=',')
            and (Pos(',',numero)<tam) then
          begin
            numero[tam]:=' ';
            grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
          end;
        end;
      end
      else
      if (tam=2) and (numero[tam-1]='0') then
      begin
        numero[tam]:=' ';
        grade_lancamentos.Cells[grade_lancamentos.col,grade_lancamentos.row]:=Trim(numero);
      end;
    end;
end;

procedure Tfrm_edtCliente.edtPortadorEnter(Sender: TObject);
begin
  TEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe portadores cadastrados';
  lbF82.visible:=true;
  lbF8Mens2.visible:=true;
  lbF8Mens2.caption:='exibe portadores cadastrados';
end;

procedure Tfrm_edtCliente.edtPlanoEnter(Sender: TObject);
var
  dif,entrada,valor: Real;
begin
     {CRITICA DE CAMPOS ANTERIORES ***}
  if (Trim(edtValEntrada.text)<>'') then
  begin
    entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
    if (Trim(edtValMerc.text)<>'') then
      valor := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text))
    else
      valor := 0.00;
    dif  := valor - entrada;
    pnTotalDevido.caption:=form_nc (dif,10);
    if (dif<=0) then
    begin
      frmDialogo.ExibirMensagem (' A entrada não pode ser maior que o valor do contrato! '
        ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      fichario.activepage:=pagina3;
      edtValEntrada.setfocus;
      edtValEntrada.SetFocus;
    end;
  end;

     {...}
  TEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe planos cadastrados';
  lbF82.visible:=true;
  lbF8Mens2.visible:=true;
  lbF8Mens2.caption:='exibe planos cadastrados';
end;

procedure Tfrm_edtCliente.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.tag:=1;
  Salvarocliente1.enabled:=false;
  Salvarocontrato1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Salvarcliente1.enabled:=false;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCpfEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtNomeEnter(Sender: TObject);
var
  clAux: TClassCliente;
  critica1,critica2: Boolean;
begin
  TMaskEdit(Sender).selectall;

     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo cpf/cnpj}
  if (not Incluircliente1.enabled) then
  begin
    critica1:=false;
    critica2:=false;
    if (Trim(edtCpf.text)<>'') then
    begin
      clAux := TClassCliente.Create;
      clAux.conect ('CREDITO',self);
      clAux.ClearSql;
      clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME ');
      clAux.AddParam ('From   CRECLI ');
      clAux.AddParam ('Where (CL_CODI='+Trim(edtCodigo.text)+') ');
      if (not clAux.Execute) then
        critica2:=true;
      clAux.ClearSql;
      clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME ');
      clAux.AddParam ('From   CRECLI ');
      clAux.AddParam ('Where (CL_CPF='+chr(39)+Trim(edtCpf.text)+chr(39)+') ');
      if (clAux.Execute) then
        critica1:=true;
      if (critica1) and (critica2) then
      begin
        frmDialogo.ExibirMensagem (' Já existe cliente cadastrado com este CPF/CNPJ: '+
          'Cliente: '+form_nz(clAux.result('CL_CODI'),6)+'/'+form_t(clAux.result('CL_NOME'),40)
          ,'CPF/CNPJ',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        try
          fichario.activepage:=pagina1;
                {*}  edtcpf.setfocus;
        except
        end;
      end;
      clAux.desconect;
      clAux.Free;
    end;
  end;
  Novocontrato1.enabled:=true;
end;

procedure Tfrm_edtCliente.edtNascEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCepEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtEnderecoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtBairroEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCidadeEnter(Sender: TObject);
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
    edtPais.SetFocus;
  end;
end;

procedure Tfrm_edtCliente.cbEstadoEnter(Sender: TObject);
begin
  TComboBox(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtTelefoneEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCelularEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtFaxEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtEmailEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtIdentidadeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtOrgExpedEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.cbEstadoCivilEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtConjugeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtPaiEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtMaeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtNomeEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCargoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtEndEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtAdmissaoEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtTelEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtCartProfEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtSalarioEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtLimCredEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtRef1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtTelRef1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtRef2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtTelRef2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtObsEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtContratoEnter(Sender: TObject);
begin
  Salvarocliente1.enabled:=false;
  Salvarocontrato1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Exclusodocontrato1.enabled:=false;
  Salvarcontrato1.enabled:=false;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtNotaFiscalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtSerieNotaEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtValMercEnter(Sender: TObject);
begin
  if (trim(edtValMerc.text)<>'') then
    valor_do_contrato_renegociacao := strtofloat(RetiraFormatacaoNumero(trim(edtValMerc.text)));
  edtValMerc.readonly := false;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtValEntradaEnter(Sender: TObject);
begin
     {CRITICAS DE CAMPO ANTERIOR ***}
  if (Trim(edtValMerc.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('Total do contrato não pode ficar vazio!'
      ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina3;
    edtValMerc.setfocus;
    edtValMerc.SetFocus;
  end;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtNumParcEnter(Sender: TObject);
begin
     {CRITICA AOS CAMPOS ANTERIORES ***}
  if (Trim(edtPlano.text)='')  or (Trim(edtPlano.text)='0') then
  begin
    frmDialogo.ExibirMensagem (' O código do plano não pode ficar vazio! '
      ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina3;
    edtPlano.setfocus;
  end;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtFatorEnter(Sender: TObject);
var
  parc: Integer;
begin
     {criticando o numero de parcelas}
{     if (Trim(edtNumParc.text)<>'') then
     begin
          parc:=strtoint(Trim(edtNumParc.text));
          if (parc=0) then
          begin
               frmDialogo.ExibirMensagem (' O numero de parcelas não pode ser ZERO! '
                  ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
               fichario.activepage:=pagina3;
               edtNumParc.setfocus;
          end;
     end;
     TMaskEdit(Sender).selectall;}
end;

{Navegacao-}
procedure Tfrm_edtCliente.Editarvalores1Click(Sender: TObject);
begin
  if (btnEdtGrade.enabled) then
    btnEdtGrade.Onclick(Sender);
end;

{navegacao-}
procedure Tfrm_edtCliente.Cancelarediodevalores1Click(Sender: TObject);
begin
  if (btnCancelGrade.enabled) then
    btnCancelGrade.click;
end;

{navegacao-}
procedure Tfrm_edtCliente.Salvarvaloreseditados1Click(Sender: TObject);
begin
  if (bitbtnConfirmar.enabled) then
    bitbtnConfirmar.click;
end;

{navegacao-}
procedure Tfrm_edtCliente.Editarvalores2Click(Sender: TObject);
begin
  Editarvalores1.click;
end;

{navegacao-}
procedure Tfrm_edtCliente.Cancelarediodevalores2Click(Sender: TObject);
begin
  Cancelarediodevalores1.click;
end;

{navegacao-}
procedure Tfrm_edtCliente.Salvarvaloreseditados2Click(Sender: TObject);
begin
  Salvarvaloreseditados1.click;
end;

procedure Tfrm_edtCliente.edtSpcEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
  regspc:=Trim(edtSpc.text);
end;

procedure Tfrm_edtCliente.edtCFunEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtTProEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtSpcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtCfun.setfocus;
  if (key=38) then
    edtLivre.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Registro no SPC. Informa se o cliente está no SPC ou não. Até 01 caractere. ',10);
end;

procedure Tfrm_edtCliente.edtCFunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtTPro.setfocus;
  if (key=38) then
    edtSpc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cheque sem fundo. Informa se o cliente tem cheque sem fundo ou não. ',10);
end;

procedure Tfrm_edtCliente.edtTProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnSalvar2.click;
  if (key=38) then
    edtCfun.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Título protestado. Informa se o cliente tem título protestado ou não. ',10);
end;

{Na criacao do formulario ***}
procedure Tfrm_edtCliente.FormCreate(Sender: TObject);
begin
  ultima_pagina_acessada:=0;
  if (frm_principal.x_tamanho_nome_cliente=0) then
    edtNome.maxlength := 30
  else
  if (frm_principal.x_tamanho_nome_cliente=1) then
    edtNome.maxlength := 40;
  flagEditCheq:=false;
  PreencheComboTipoLogradouro;

end;

{Verificando se pode editar ou nao a coluna de cheques ***}
{Tudo vai depender do plano de pgto. ***}
procedure Tfrm_edtCliente.grade_lancamentosKeyPress(Sender: TObject;
  var Key: Char);
begin
     {Os teste sao feitos somente quano a grade esta em estado de edicao}
  if (not btnEdtGrade.enabled) then
    if (grade_lancamentos.Col=3) then
      if (not flagEditCheq) then
      begin
        frmDialogo.ExibirMensagem ('O plano não permite pagamento por cheque!'
          ,'Cadastro de contrato',[mbOk],
          frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        grade_lancamentos.Cells[grade_lancamentos.Col,grade_lancamentos.Row]:='';
        grade_lancamentos.Col:=2;
      end
      else
      if (not PodeChamarCheques) then
      begin
        frmDialogo.ExibirMensagem ('Os cheques não foram cadastrados ainda!'
          ,'Cadastro de contrato',[mbOk],
          frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        grade_lancamentos.Cells[grade_lancamentos.Col,grade_lancamentos.Row]:='';
        grade_lancamentos.Col:=2;
      end;
end;

procedure Tfrm_edtCliente.Relatriode1Click(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    RelatorioLiquidado (Trim(edtCodigo.text),2)
end;

procedure Tfrm_edtCliente.Posiofinanceiracontratosemaberto1Click(
  Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    RelatorioEmAberto (Trim(edtCodigo.text),2)
end;

procedure Tfrm_edtCliente.Consultadecheques1Click(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    Application.CreateForm(Tfrm_ConsCheq,frm_ConsCheq);
    with (frm_ConsCheq) do
    begin
      show;
      bringtofront;
      pnCabec.enabled:=false;
      edtCodigo.text:=Trim(frm_edtCliente.edtCodigo.text);
      pnCliente.caption:=Trim(edtNome.text);
      btnExecutar.click;
      pnCabec.enabled:=true;
    end;
  end;
end;

procedure Tfrm_edtCliente.btnHistClick(Sender: TObject);
begin
  PopUpMenuHistorico.popup(100,550);
end;

{Botao de impressao de carnet ***}
{Este botao so sera ativado para planos com carnet ***}
procedure Tfrm_edtCliente.btnImpCarnetClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') then
    if (cdCarn=1) then
    begin
      Application.CreateForm(Tfrm_EmisCarnet2, frm_EmisCarnet2);
      with (frm_EmisCarnet2) do
      begin
        caption := frm_principal.x_sistema+' - '+LB_EMIS_CARNET;
        if (cdCliente=0) then
          frm_EmisCarnet2.edtCliente.text:=form_nz(auxCliente,6)
        else
          frm_EmisCarnet2.edtCliente.text:=form_nz(cdCliente,6);
        if (Trim(frm_edtCliente.edtContrato.text)='') then
          frm_EmisCarnet2.edtContrato.text := form_nz(auxContrato,6)
        else
          frm_EmisCarnet2.edtContrato.text := form_nz(strtofloat(frm_edtCliente.edtContrato.text),6);
        edtCliente.enabled  := false;
        edtContrato.enabled := false;
        Modo:=1;
        showmodal;
        Free;
      end;
    end
    else
      frmDialogo.ExibirMensagem ('O carnet não pode ser impresso neste plano!'
        ,'Imprimir carnet',[mbOk]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

{Navegacao na grade -Baseado em <ENTER>}
procedure Tfrm_edtCliente.grade_lancamentosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (grade_lancamentos.col=1) then
    begin
      if (Trim(grade_lancamentos.Cells[grade_lancamentos.Col,grade_lancamentos.Row])<>'') then
      begin
        if (grade_lancamentos.Col<(grade_lancamentos.ColCount-2)) then
          grade_lancamentos.Col:=grade_lancamentos.Col+1
        else
        begin
          grade_lancamentos.Col:=1;
          if (grade_lancamentos.Row<(grade_lancamentos.RowCount-1)) then
            grade_lancamentos.Row:=grade_lancamentos.Row+1
          else
            bitbtnConfirmar.click;
        end;
      end
      else
        grade_lancamentos.Col:=grade_lancamentos.Col+1;
    end
    else
    if (grade_lancamentos.Col<(grade_lancamentos.ColCount-1)) then
    begin
      if (grade_lancamentos.Col=2)
        and (grade_lancamentos.Cells[3,grade_lancamentos.Row]='') then
      begin
        grade_lancamentos.Col:=1;
        if (grade_lancamentos.Row<(grade_lancamentos.RowCount-1)) then
          grade_lancamentos.Row:=grade_lancamentos.Row+1
        else
          bitbtnConfirmar.click;
      end
      else
        grade_lancamentos.Col:=grade_lancamentos.Col+1;
    end
    else
    begin
      grade_lancamentos.Col:=1;
      if (grade_lancamentos.Row<(grade_lancamentos.RowCount-1)) then
        grade_lancamentos.Row:=grade_lancamentos.Row+1
      else
        bitbtnConfirmar.click;
    end;
end;

{Controle de teclas do formulario ***}
procedure Tfrm_edtCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    if (frmDialogo.ExibirMensagem ('Confirma saída do cadastro de clientes e contratos?'
      ,'Cadastro de cliente',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
    begin
      PodeFecharForm:=true;
      close;
    end
    else
    begin
      fichario.ActivePage := pagina1;
      PodeFecharForm := false;
      if (Trim(edtCpf.text)='') then
        edtCodigo.setfocus;
            //edtCpf.SetFocus;
    end;
end;

procedure Tfrm_edtCliente.edtPDCEnter(Sender: TObject);
begin
  edtPDC.selectall;
end;

procedure Tfrm_edtCliente.edtPDCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtLivre.setfocus;
  if (key=38) then
    edtObs.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('  Registro de PDC do cliente: até 04 caracteres ',10);
end;

{navegacao----}
procedure Tfrm_edtCliente.edtSexoEnter(Sender: TObject);
var
  clAuxs: TClassCliente;
  nome,primeironome: String;
  critica1,critica2: Boolean;
begin
     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo}
  critica1:=false;
  critica2:=false;
  if (Trim(edtNome.text)<>'') and (Trim(edtCodigo.text)<>'') and (Trim(edtSexo.Text)='') then
  begin
    clAuxs := TClassCliente.Create;
    clAuxs.conect ('CREDITO',self);
    clAuxs.ClearSql;
    clAuxs.AddParam ('Select CL_CPF,CL_CODI,CL_NOME                ');
    clAuxs.AddParam ('From   CRECLI                                ');
    clAuxs.AddParam ('Where (CL_CODI='+Trim(edtCodigo.text)+')     ');
    if (not clAuxs.Execute) then
      critica2:=true;
    clAuxs.ClearSql;
    clAuxs.AddParam ('Select CL_CPF,CL_CODI,CL_NOME                ');
    clAuxs.AddParam ('From   CRECLI                                ');
    clAuxs.AddParam ('Where (CL_NOME='+chr(39)+Trim(edtNome.text)+chr(39)+') ');
    if (clAuxs.Execute) then
      critica1:=true;
    if (critica1) and (critica2) then
    begin
      frmDialogo.ExibirMensagem (' Já existe cliente cadastrado com este nome: '+
        'Cliente: '+form_nz(clAuxs.result('CL_CODI'),6)+'/'+form_t(clAuxs.result('CL_NOME'),40)
        ,'Nome',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      try
        fichario.activepage:=pagina1;
        edtNome.text;
      except
      end;
    end;
    clAuxs.desconect;
    clAuxs.Free;
  end;

     {sugerindo um sexo ---}
  if (Trim(edtNome.text)<>'') and (Trim(edtSexo.text)='') then
  begin
    nome:=Trim(edtNome.text);
    if (Pos(' ',nome)<>0) then
      PrimeiroNome:=UpperCase(Copy(nome,1,Pos(' ',nome)-1))
    else
      PrimeiroNome:=Trim(nome);
    if (PrimeiroNome[Length(PrimeiroNome)]='A') then
      edtSexo.text:='F'
    else
      edtSexo.text:='M';

          {nomes especiais ----}
    if (PrimeiroNome='JANE') then
      edtSexo.text:='F'
    else
    if (PrimeiroNome='IVETE') then
      edtSexo.text:='F'
    else
    if (PrimeiroNome='TIANE') then
      edtSexo.text:='F'
    else
    if (PrimeiroNome='MARLENE') then
      edtSexo.text:='F';
  end;
  edtSexo.selectall;
end;

procedure Tfrm_edtCliente.edtSexoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNasc.setfocus;
  if (key=38) then
    edtNome.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Sexo do cliente; Até 20 caracteres. ',10);
end;

procedure Tfrm_edtCliente.edtContratoExit(Sender: TObject);
begin
  Salvarocliente1.enabled:=true;
  Salvarocontrato1.enabled:=true;
  Exclusaodocliente1.enabled:=true;
  Exclusodocontrato1.enabled:=true;
  Salvarcontrato1.enabled:=true;
  Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
  Lancamentos.Items[1].ShortCut := ShortCut (K_F5,[]);
end;

{navegacao-}
procedure Tfrm_edtCliente.edtSpcExit(Sender: TObject);
begin
  if (Trim(edtSpc.text)='') then
    edtSpc.text:='N';
end;

{navegacao-}
procedure Tfrm_edtCliente.edtCFunExit(Sender: TObject);
begin
  if (Trim(edtCfun.text)='') then
    edtCfun.text:='N';
end;

{navegacao-}
procedure Tfrm_edtCliente.edtTProExit(Sender: TObject);
begin
  if (Trim(edtTPro.text)='') then
    edtTPro.text:='N';
end;

procedure Tfrm_edtCliente.edtRamalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente.edtRamalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCartProf.setfocus;
  if (key=38) then
    edtTelEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Ramal do Telefone do trabalho do cliente: Digite até 5 digitos numéricos não obrigatórios. ',15);
end;

{navegacao--}
procedure Tfrm_edtCliente.edtLojaEnter(Sender: TObject);
begin
  if (Trim(edtLoja.text)='') then
    edtLoja.text:=form_nz(cdLoja,3);
  TMaskEdit(Sender).selectall;
end;

{navegacao--}
procedure Tfrm_edtCliente.edtDatContratoEnter(Sender: TObject);
begin
  if (edtDatContrato.text='  /  /    ') then
    edtDatContrato.text:=datetostr(datacontrato);
  TMaskEdit(Sender).selectall;
end;

{navegacao--}
procedure Tfrm_edtCliente.edtDatContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
  begin
    edtQtdeBoleta.setfocus;
    datacontrato := StrToDate(edtDatContrato.Text);
  end;
  if (key=38) then
    if (edtLoja.Enabled) then
      edtLoja.setfocus
    else
      edtContrato.SetFocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do contrato:  formato 99/99/9999',10);
end;

{navegacao--}
procedure Tfrm_edtCliente.edtLojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtDatContrato.setfocus;
  if (key=38) then
    edtContrato.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Loja do contrato:  formato 999',10);
end;

{navegacao--}
procedure Tfrm_edtCliente.edtDatContratoExit(Sender: TObject);
begin
  if (not IsDate (edtDatContrato.text) and (edtDatContrato.text<>'  /  /    ')) then
  begin
    frmDialogo.ExibirMensagem (' A data fornecida não é válida! '
      ,'Data do contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    try
      fichario.activepage:=pagina3;
      edtDatContrato.setfocus;
    except
    end;
  end;
end;

{navegacao---}
procedure Tfrm_edtCliente.edtLojaExit(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    edtLoja.text:=form_nz(strtofloat(Trim(edtLoja.text)),3);
end;

{Verifica se o CONTRATO é de plano de cheque ***}
function Tfrm_edtCliente.ContratoEdeCheque (cliente,contrato: Real):Boolean;
var
  clContrato: TClassContrato;
  codcli,codigo: String;
begin
  clContrato := TClassContrato.Create;
  codcli := FloatToStr(cliente);
  codigo := FloatToStr(contrato);
  ContratoEdeCheque := false;
  if (codigo<>'') and (codcli<>'') then
    with (clContrato) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CR_PLAN,PL_CHEQ                                  ');
      AddParam ('From   CRECTABR,CREDPLANO                               ');
      AddParam ('Where  (CR_CODI='+codigo+') AND (CR_CLIE='+codcli+')    ');
      AddParam ('   AND (CR_PLAN=PL_CODI)                                ');
      if (Execute) then
      begin
        if (Result('PL_CHEQ')='1') then
          ContratoEdeCheque := true
        else
          ContratoEdeCheque := false;
      end
      else
        ContratoEdeCheque := false;
      desconect;
      Free;
    end;
end;

{Verifica se o CONTRATO ja iniciou o pagamento ***}
function Tfrm_edtCliente.ContratoSendoPago (cliente,contrato: Real):Boolean;
var
  clContrato: TClassContrato;
  codcli,codigo: String;
begin
  clContrato := TClassContrato.Create;
  codcli := FloatToStr(cliente);
  codigo := FloatToStr(contrato);
  ContratoSendoPago := false;
  if (codigo<>'') and (codcli<>'') then
    with (clContrato) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CR_CODI,CR_CLIE,CR_PDEV,CR_VDEV,CR_QPRE         ');
      AddParam ('From   CRECTABR                                        ');
      AddParam ('Where  (CR_CODI='+codigo+') AND (CR_CLIE='+codcli+')   ');
      if (Execute) then
      begin
        if (Result('CR_PDEV')=Result('CR_QPRE')) then
          ContratoSendoPago := false
        else
          ContratoSendoPago := true;
      end
      else
        ContratoSendoPago := false;
      desconect;
      Free;
    end;
end;

procedure Tfrm_edtCliente.edtNomeChange(Sender: TObject);
begin
  edtSexo.text:='';
end;

{Consulta especifica de credito do cliente ***}
procedure Tfrm_edtCliente.btnConsultaClick(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    Application.CreateForm(Tfrm_Consulta1, frm_Consulta1);
    with (frm_Consulta1) do
    begin
      caption := frm_principal.x_sistema+' - '+LB_POS_FINANC_CONS;
      Modo    := 2;
      codigo  := Trim(edtCodigo.text);
      showmodal;
      Free;
    end;
  end;
end;

{*********************************** - alteracao: 16/07/2003}
procedure Tfrm_edtCliente.edtCpfExit(Sender: TObject);
var
  cpf: String;
  IntegraNfe : Boolean;
begin
  CriticaCNPJ(edtCpf);
  //if (not Incluircliente1.enabled) then
  if (Trim(edtCodigo.Text) <> '') then
    begin
      cpf:=Trim(edtCpf.text);
      if (Length(cpf)<=11) then
      begin
        lblEndereco.caption  :='Endereço';
        lblNome.caption      :='Nome';
        btnDadosComp.visible :=false;
        PreparaGuiaDadosCadastraisParaPessoaFisica;
        Exit;
      end
      else
      IntegraNfe := False;
      if (Trim(edtCpf.Text)='') then  Exit;

         begin
         PreparaGuiaDadosCadastraisParaPessoaJuridica;

         lblEndereco.caption :='Endereço p/ entrega';
         lblNome.caption     :='Razão Social';
         btnDadosComp.visible:=true;

         end;
    end;
       {***********************************}
end;

{Chamada da calculadora *******}
procedure Tfrm_edtCliente.btnCalcClick(Sender: TObject);
var
  result: Integer;
begin
  result := WinExec ('calc.exe',1);
  if (result=0) then
    frmDialogo.ExibirMensagem ('O sistema está sem memória para executar esta operação!',
      'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
  if (result=ERROR_BAD_FORMAT) then
    frmDialogo.ExibirMensagem ('O arquivo .EXE é inválido!',
      'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
  if (result=ERROR_FILE_NOT_FOUND) then
    frmDialogo.ExibirMensagem ('O arquivo especificado não foi encontrado!',
      'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
  if (result=ERROR_PATH_NOT_FOUND) then
    frmDialogo.ExibirMensagem ('O caminho especificado é inválido!',
      'Baixa',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
      250,200);
end;

procedure Tfrm_edtCliente.btnImpPropostaClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') then
  begin
    Application.CreateForm(Tfrm_VersoProposta, frm_VersoProposta);
    Application.CreateForm(Tfrm_PropostaCredito, frm_PropostaCredito);
    with (frm_PropostaCredito) do
    begin
      caption := frm_principal.x_sistema+' - Impressão de proposta de crédito';
      Panel1.visible:=true;
      Panel2.visible:=true;
      listaProposta.visible:=false;
      edtCliente.text  := floattostr(cdCliente);
      frm_PropostaCredito.edtContrato.text :=
        Trim(frm_edtCliente.edtContrato.text);
      Modo:=1;
      showmodal;
      Free;
      frm_VersoProposta.Free;
    end;
  end;
end;

{Funcao que retorna o total de prestacoes "gravadas" no contrato}
function  Tfrm_edtCliente.NumParcContrato (cliente,contrato: Real):Integer;
var
  clContrato: TClassContrato;
  codcli,codigo: String;
begin
  clContrato := TClassContrato.Create;
  codcli := FloatToStr(cliente);
  codigo := FloatToStr(contrato);
  if (codigo<>'') and (codcli<>'') then
  begin
    with (clContrato) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CR_QPRE                                         ');
      AddParam ('From   CRECTABR                                        ');
      AddParam ('Where  (CR_CODI='+codigo+') AND (CR_CLIE='+codcli+')   ');
      if (Execute) then
        NumParcContrato := Result('CR_QPRE')
      else
        NumParcContrato := 0;
      desconect;
      Free;
    end;
  end
  else
    NumParcContrato := 0;
end;

{Funcao que informa se o contrato existe ou nao}
function  Tfrm_edtCliente.ExisteContrato(cliente,contrato: Real):Boolean;
var
  clContrato: TClassContrato;
  codcli,codigo: String;
begin
  clContrato := TClassContrato.Create;
  codcli := FloatToStr(cliente);
  codigo := FloatToStr(contrato);
  if (codigo<>'') and (codcli<>'') then
    with (clContrato) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CR_QPRE                                         ');
      AddParam ('From   CRECTABR                                        ');
      AddParam ('Where  (CR_CODI='+codigo+') AND (CR_CLIE='+codcli+')   ');
      if (Execute) then
        ExisteContrato := true
      else
        ExisteContrato := false;
      desconect;
      Free;
    end;
end;

{Verifica se a loja encontra-se no cadastro ou não ****}
function Tfrm_edtCliente.LojaCadastrada(codLoja: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('Select * From CRELOJA Where (LO_CODI='+floattostr(codloja)+') ');
  if (clAux.Execute) then
    LojaCadastrada:=true
  else
    LojaCadastrada:=false;
  clAux.desconect;
  clAux.Free;
end;

{Verifica se o plano de pgto. encontra-se no cadastro ou não ****}
function Tfrm_edtCliente.PlanoCadastrado(codPlano: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('Select * From CREDPLANO Where (PL_CODI='+codPlano+') ');
  if (clAux.Execute) then
    PlanoCadastrado:=true
  else
    PlanoCadastrado:=false;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_edtCliente.ficharioChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  ultima_pagina_acessada := fichario.activepageindex;
  if (edtCodigo.tag=1) then
    AllowChange:=false
  else
  if (edtCodigo.tag=0) then
    AllowChange:=true;
end;

procedure Tfrm_edtCliente.btnDadosCompClick(Sender: TObject);
begin
     {*************************************  - alteracao: 16/07/2003}
  if (Trim(edtCodigo.text)<>'') then
  begin
    Application.CreateForm(Tfrm_DadosCompCliente, frm_DadosCompCliente);
    frm_DadosCompCliente.y_cliente:=strtofloat(Trim(edtCodigo.text));
    frm_DadosCompCliente.showmodal;
    frm_DadosCompCliente.Free;
    edtPdc.setfocus;
  end;
     {***************************************}
end;

procedure Tfrm_edtCliente.edtCepDblClick(Sender: TObject);
begin
  if (frm_principal.x_pesquisa_cep) then
    ChamandoF8Cep(edtCep);
end;

procedure Tfrm_edtCliente.edtLivreEnter(Sender: TObject);
begin
  edtLivre.selectall;
end;

procedure Tfrm_edtCliente.edtLivreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnSalvar2.click;
  if (key=38) then
    edtObs.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('  Campo livre para cadastro: até 04 caracteres. ',10);


     {if (key=13) or (key=K_BAIXO) then edtSpc.setfocus;
     if (key=38) then edtPdc.setfocus;
     if (key=K_F1) then}
        //frm_principal.ExibirDica ('  Campo livre para cadastro: até 04 caracteres. ',10);
end;

function Tfrm_edtCliente.VerificaSeClienteTemPrestacaoComAtraso(cliente: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT PC_VALO,PC_DVTO        ');
  clAux.AddParam ('FROM CREPRABR                 ');
  clAux.AddParam ('WHERE (PC_CLIE=:cliente) AND  ');
  clAux.AddParam ('      (PC_STAT=:status) AND   ');
  clAux.AddParam ('      (PC_DVTO<:data)         ');
  clAux.consulta.parambyname('cliente').AsFloat := cliente;
  clAux.consulta.parambyname('status').AsString := '0'; //em aberto
  clAux.consulta.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
  if (clAux.Execute) then
    result:=true
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_edtCliente.VerificaSeClientePrimeiraCompra(cliente: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_CODI                ');
  clAux.AddParam ('FROM CRECTABR                 ');
  clAux.AddParam ('WHERE (CR_CLIE=:cliente) AND  ');
  clAux.AddParam ('      (CR_DNOT<:data)         ');
  clAux.consulta.parambyname('cliente').AsFloat := cliente;
  clAux.consulta.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
  if (clAux.Execute) then
    result:=false
  else
  begin
    result:=true;

          //verifica o campo CL_QTDC - qtde. de compras - pois, as compras podem ter sido EXPURGADAS
    clAux.ClearSql;
    clAux.AddParam ('SELECT CL_QTDC             ');
    clAux.AddParam ('FROM CRECLI                ');
    clAux.AddParam ('WHERE (CL_CODI=:cliente)   ');
    clAux.consulta.parambyname('cliente').AsFloat := cliente;
    clAux.Execute;
    if (clAux.result('CL_QTDC')<>0) then
      result := false;
  end;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_edtCliente.PagouPrestacaoUltimoContratoComAtraso(cliente: Real; dias: Integer):Boolean;
var
  clAux: TClassAuxiliar;
  codigo_contrato: Real;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_DNOT,CR_CODI        ');
  clAux.AddParam ('FROM   CRECTABR               ');
  clAux.AddParam ('WHERE (CR_CLIE=:cliente)      ');
  clAux.AddParam ('ORDER BY CR_DNOT,CR_CODI      ');
  clAux.consulta.parambyname('cliente').AsFloat := cliente;
  if (clAux.Execute) then
  begin
    clAux.last;
    codigo_contrato := clAux.result('CR_CODI');

          //verificando prestacoes quitadas do ultimo contrato
    clAux.ClearSql;
    clAux.AddParam ('SELECT (PC_DTPG - PC_DVTO) as DIF    ');
    clAux.AddParam ('FROM   CREPRABR                      ');
    clAux.AddParam ('WHERE (PC_CLIE=:cliente) AND         ');
    clAux.AddParam ('      (PC_CONT=:contrato) AND        ');
    clAux.AddParam ('      (PC_STAT=:status)              ');
    clAux.consulta.parambyname('cliente').AsFloat  := cliente;
    clAux.consulta.parambyname('contrato').AsFloat := codigo_contrato;
    clAux.consulta.parambyname('status').AsString  := '1'; //quitadas
    if (clAux.Execute) then
    begin
      result:=false;
      clAux.first;
      while (not clAux.eof) do
      begin
        if (clAux.result('DIF')>dias) then
        begin
          result:=true;
          break;
        end;
        clAux.next;
      end;
    end
    else
      result:=false;
  end
  else
    result:=false;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_edtCliente.VerificaDataUltimoContrato(cliente: Real):TDateTime;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT CR_DNOT,CR_CODI        ');
  clAux.AddParam ('FROM   CRECTABR               ');
  clAux.AddParam ('WHERE (CR_CLIE=:cliente)      ');
  clAux.AddParam ('ORDER BY CR_DNOT,CR_CODI      ');
  clAux.consulta.parambyname('cliente').AsFloat := cliente;
  if (clAux.Execute) then
  begin
    clAux.last;
    result := clAux.result('CR_DNOT');
  end
  else
    result := strtodate('01/01/1900');
  clAux.desconect;
  clAux.Free;
end;

//Esta funcao é immportantissima na critica de lancamento dos contratos!!!!
function Tfrm_edtCliente.CriticaLancamentoContrato:Boolean;
var
  continua: Boolean;
  qtde_prest_maxima,lin: Integer;
  cli_atras_dias: Integer;
  valor_maximo_permitido: Real;
  valor_contrato: Real;
  TotalPermitido: Real;
  valor_entrada: Real;
  valor_financiado: Real;
  percentual_obrigatorio_entrada: Real;
  valor_minimo_entrada: Real;
  cli_sem_comprar_dias: Integer;
  data_ultimo_contrato: TDateTime;
begin
     {****************************************************************************}
     {2. Verificando a qtde maxima permitido para a qtde de prestacoes}
     {****************************************************************************}
  continua:=true;//comeca sempre criticando
  if (continua) then
  begin
    qtde_prest_maxima := VerificaRestricaoQtdeMaximaPrestacao(strtofloat(edtPlano.text));
    if (qtde_prest_maxima<>0) then
      if (strtoint(edtNumParc.text)>qtde_prest_maxima) then
      begin
        continua := false;
        frmDialogo.ExibirMensagem ('A qtde. de parcelas ultrapassou a qtde. máxima permitida: '+
          trim(form_nz(qtde_prest_maxima,2))+' para este plano!'
          ,'Restrição da política de venda',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtNumParc.setfocus;
      end;
  end;

     {****************************************************************************}
     {3. Verificando o valor maximo permitido para a prestacao neste plano}
     {****************************************************************************}
  if (continua) then
  begin
    valor_maximo_permitido := VerificaRestricaoDeValorMaximoPrestacao(strtofloat(edtPlano.text));
    if (valor_maximo_permitido<>0.00) then
    begin
      lin:=1;
      while (lin<grade_lancamentos.RowCount) do
      begin
        if (Trim(grade_lancamentos.Cells[1,lin])<>'') then
          if (strtofloat(RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])))>valor_maximo_permitido) then
          begin
            continua := false;
            frmDialogo.ExibirMensagem ('O valor da prestação ultrapassou o valor máximo permitido: '+
              trim(form_nc(valor_maximo_permitido,15))+' para este plano!'
              ,'Restrição da política de venda',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
            break;
            if (btnCancelGrade.enabled) then
              btnCancelGrade.click;
          end;
        lin:=lin+1;
      end;
    end;
  end;

     {****************************************************************************}
     {4. Verificando se o limite de credito foi estourado ou nao
     {****************************************************************************}
  if (continua) then
    if (frm_principal.x_critica_limite) then
    begin
      TotalPermitido   := InformaLimiteCredito(cdCliente); //busca o limite de credito
      valor_financiado := strtofloat(RetiraFormatacaoNumero(trim(pnTotalDevido.caption)));
              //if (valor_do_contrato_renegociacao<>-1) then
                  //valor_financiado := valor_financiado - valor_do_contrato_renegociacao;
              //if (valor_financiado<>0.00) then
              //begin
      if (TotalPermitido<=0.00) then {limite negativo, com financiado}
      begin
        continua:=false;
        frmDialogo.ExibirMensagem (' Cliente sem crédito! Compra não permitida!'
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina3;
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtValMerc.setfocus;
      end
      else
      if (valor_financiado>TotalPermitido) then
      begin
        continua:=false;
        frmDialogo.ExibirMensagem (' O total do financiamento não pode exceder o '+
          'limite de crédito de '+form_nc(TotalPermitido,10)+'! '
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        fichario.activepage:=pagina3;
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtValMerc.setfocus;
      end;
              //end;
    end;

     {****************************************************************************}
     {5. Verificando se o cliente tem prestacao vencida
     {****************************************************************************}
  if (continua) then
    if (VerificaRestricaoDeCriticaClienteAtraso(strtofloat(edtPlano.text))) then
      if (VerificaSeClienteTemPrestacaoComAtraso(cdCliente)) then
      begin
        continua := false;
        frmDialogo.ExibirMensagem (' Cliente tem prestação em aberto vencida! Venda não permitida! '
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        fichario.activepage:=pagina3;
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtValMerc.setfocus;
      end;

     {****************************************************************************}
     {6. Verificando o pagamento das prestacoes do ultimo contrato, e obrigando o pagamento da ENTRADA
     {****************************************************************************}
  if (continua) then
  begin
    percentual_obrigatorio_entrada := VerificaRestricaoDePercEntCliAtras(strtofloat(edtPlano.text));
    cli_atras_dias                 := VerificaRestricaoCliAtrasDias(strtofloat(edtPlano.text));
    if (PagouPrestacaoUltimoContratoComAtraso(cdCliente,cli_atras_dias)) then
      if (Trim(edtValEntrada.text)<>'') then
      begin
        valor_entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
        if (Trim(edtValMerc.text)<>'') then
          valor_contrato := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text))
        else
          valor_contrato := 0.00;
        valor_minimo_entrada := strtofloat(RetiraFormatacaoNumero(trim(form_nc2(((percentual_obrigatorio_entrada/100)*valor_contrato),15,2))));
        if (valor_entrada<valor_minimo_entrada) then
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' Cliente pagou prestação do seu último contrato com atraso maior que '+
            inttostr(cli_atras_dias)+' dias!'
            ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
          frmDialogo.ExibirMensagem (' Entrada obrigatória de '+
            trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
            ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
          fichario.activepage:=pagina3;
          if (btnCancelGrade.enabled) then
            btnCancelGrade.click;
          edtValMerc.setfocus;
        end;
      end
      else
      begin
        continua:=false;
        frmDialogo.ExibirMensagem (' Cliente pagou prestação do seu último contrato com atraso maior que '+
          inttostr(cli_atras_dias)+' dias! '
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        frmDialogo.ExibirMensagem (' Entrada obrigatória de '+
          trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        fichario.activepage:=pagina3;
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtValMerc.setfocus;
      end;
  end;

     {****************************************************************************}
     {7. Verificando se o cliente de primeira compra e se deve obrigar ENTRADA
     {****************************************************************************}
  if (continua) then
  begin
    percentual_obrigatorio_entrada := VerificaRestricaoDePercEntCliNovos(strtofloat(edtPlano.text));
    if (VerificaSeClientePrimeiraCompra(cdCliente)) then
      if (Trim(edtValEntrada.text)<>'') then
      begin
        valor_entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
        if (Trim(edtValMerc.text)<>'') then
          valor_contrato := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text))
        else
          valor_contrato := 0.00;
        valor_minimo_entrada := strtofloat(RetiraFormatacaoNumero(trim(form_nc2(((percentual_obrigatorio_entrada/100)*valor_contrato),15,2))));
        if (valor_entrada<valor_minimo_entrada) then
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' Cliente primeira compra! A entrada não pode ser menor que '+
            trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
            ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          fichario.activepage:=pagina3;
          if (btnCancelGrade.enabled) then
            btnCancelGrade.click;
          edtValEntrada.setfocus;
        end;
      end
      else
      begin
        continua:=false;
        frmDialogo.ExibirMensagem (' Cliente primeira compra! Entrada obrigatória de '+
          trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
          ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        fichario.activepage:=pagina3;
        if (btnCancelGrade.enabled) then
          btnCancelGrade.click;
        edtValEntrada.setfocus;
      end;
  end;

     {****************************************************************************}
     {8. Verificando o prazo da ultima compra, a dif. entre HOJE e a data do contrato da ultima compra
     {****************************************************************************}
  if (continua) then
  begin
    percentual_obrigatorio_entrada := VerificaRestricaoDePercEntCliSemComprar(strtofloat(edtPlano.text));
    cli_sem_comprar_dias           := VerificaRestricaoCliSemComprarDias(strtofloat(edtPlano.text));
    data_ultimo_contrato           := VerificaDataUltimoContrato(cdCliente);
    if (data_ultimo_contrato>strtodate('01/01/1900')) then //somente se data nao for nula
      if ((frm_principal.x_data_trabalho - data_ultimo_contrato)>cli_sem_comprar_dias) then
        if (Trim(edtValEntrada.text)<>'') then
        begin
          valor_entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
          if (Trim(edtValMerc.text)<>'') then
            valor_contrato := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text))
          else
            valor_contrato := 0.00;
          valor_minimo_entrada := strtofloat(RetiraFormatacaoNumero(trim(form_nc2(((percentual_obrigatorio_entrada/100)*valor_contrato),15,2))));
          if (valor_entrada<valor_minimo_entrada) then
          begin
            continua:=false;
            frmDialogo.ExibirMensagem (' Cliente comprou pela última vez a mais que '+
              inttostr(cli_sem_comprar_dias)+' dia(s) atrás! '
              ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
            frmDialogo.ExibirMensagem (' Entrada obrigatória de '+
              trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
              ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
            fichario.activepage:=pagina3;
            if (btnCancelGrade.enabled) then
              btnCancelGrade.click;
            edtValEntrada.setfocus;
          end;
        end
        else
        begin
          continua:=false;
          frmDialogo.ExibirMensagem (' Cliente comprou pela última vez a mais que '+
            inttostr(cli_sem_comprar_dias)+' dia(s) atrás! '
            ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
          frmDialogo.ExibirMensagem (' Entrada obrigatória de '+
            trim(form_nc(percentual_obrigatorio_entrada,10))+'% do valor do contrato! '
            ,'Restrição da política de venda',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
          fichario.activepage:=pagina3;
          if (btnCancelGrade.enabled) then
            btnCancelGrade.click;
          edtValEntrada.setfocus;
        end;
  end;
  result := continua;
end;

procedure Tfrm_edtCliente.btnOutrasObservacoesClick(Sender: TObject);
begin
     {*************************************  - alteracao: 27/10/2004}
  if (Trim(edtCodigo.text)<>'') then
  begin
    frm_Aux5Contrato.exibiu := false;
    frm_Aux5Contrato.resultado := 27;
    frm_Aux5Contrato.showmodal;
    edtObs.setfocus;
  end;
     {***************************************}
end;

function  Tfrm_edtCliente.ExisteCliente(cliente: Real):Boolean;
var
  clContrato: TClassContrato;
  codcli: String;
begin
  clContrato := TClassContrato.Create;
  codcli := FloatToStr(cliente);
  if (codcli<>'') then
    with (clContrato) do
    begin
      conect   ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI                ');
      AddParam ('From   CRECLI                 ');
      AddParam ('Where  (CL_CODI='+codcli+')   ');
      if (Execute) then
        ExisteCliente := true
      else
        ExisteCliente := false;
      desconect;
      Free;
    end;
end;

{*************************************  - alteracao: 27/10/2004}
procedure Tfrm_EdtCliente.LimparObservacoes;
begin
  frm_Aux5Contrato.edtObs1.text := '';
  frm_Aux5Contrato.edtObs2.text := '';
  frm_Aux5Contrato.edtObs3.text := '';
  frm_Aux5Contrato.edtObs4.text := '';
  frm_Aux5Contrato.edtObs5.text := '';
end;

{*************************************  - alteracao: 27/10/2004}
procedure Tfrm_EdtCliente.SalvaObservacoes(cliente: Real);
var
  clAux: TClassAuxiliar;
begin
  with (frm_Aux5Contrato) do
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT OB_CLIE FROM CRECLI_OBS    ');
    clAux.AddParam ('WHERE (OB_CLIE=:cliente)          ');
    clAux.consulta.parambyname('cliente').AsFloat := cliente;
    if (clAux.Execute) then
    begin
      if (trim(edtObs1.text)<>'') or
        (trim(edtObs2.text)<>'') or
        (trim(edtObs3.text)<>'') or
        (trim(edtObs4.text)<>'') or
        (trim(edtObs5.text)<>'') then
      begin
        clAux.ClearSql;
        clAux.AddParam ('UPDATE CRECLI_OBS SET    ');
        clAux.AddParam ('       OB_LIN1=:linha1,  ');
        clAux.AddParam ('       OB_LIN2=:linha2,  ');
        clAux.AddParam ('       OB_LIN3=:linha3,  ');
        clAux.AddParam ('       OB_LIN4=:linha4,  ');
        clAux.AddParam ('       OB_LIN5=:linha5,  ');
        clAux.AddParam ('       OB_TIME=:time     ');
        clAux.AddParam ('WHERE (OB_CLIE=:cliente) ');
        clAux.consulta.parambyname('cliente').AsFloat := cliente;
        clAux.consulta.parambyname('linha1').AsString := edtObs1.text;
        clAux.consulta.parambyname('linha2').AsString := edtObs2.text;
        clAux.consulta.parambyname('linha3').AsString := edtObs3.text;
        clAux.consulta.parambyname('linha4').AsString := edtObs4.text;
        clAux.consulta.parambyname('linha5').AsString := edtObs5.text;
        clAux.consulta.parambyname('time').AsDateTime := frm_principal.x_data_trabalho;
        clAux.Execute;
        clAux.ClearSql;
        clAux.AddParam ('DELETE FROM MOVIMENTO_CRECLI_OBS   ');
        clAux.AddParam ('WHERE (OB_CLIE=:cliente)           ');
        clAux.consulta.parambyname('cliente').AsFloat := cliente;
        clAux.Execute;
      end
      else
      begin
        clAux.ClearSql;
        clAux.AddParam ('UPDATE CRECLI_OBS SET    ');
        clAux.AddParam ('       OB_LIN1=:linha1,  ');
        clAux.AddParam ('       OB_LIN2=:linha2,  ');
        clAux.AddParam ('       OB_LIN3=:linha3,  ');
        clAux.AddParam ('       OB_LIN4=:linha4,  ');
        clAux.AddParam ('       OB_LIN5=:linha5,  ');
        clAux.AddParam ('       OB_TIME=:time     ');
        clAux.AddParam ('WHERE (OB_CLIE=:cliente) ');
        clAux.consulta.parambyname('cliente').AsFloat := cliente;
        clAux.consulta.parambyname('linha1').AsString := '.'; //o ponto indica campos limpos
        clAux.consulta.parambyname('linha2').AsString := '';
        clAux.consulta.parambyname('linha3').AsString := '';
        clAux.consulta.parambyname('linha4').AsString := '';
        clAux.consulta.parambyname('linha5').AsString := '';
        clAux.consulta.parambyname('time').AsDateTime := frm_principal.x_data_trabalho;
        clAux.Execute;
      end;
    end
    else
    if (trim(edtObs1.text)<>'') or
      (trim(edtObs2.text)<>'') or
      (trim(edtObs3.text)<>'') or
      (trim(edtObs4.text)<>'') or
      (trim(edtObs5.text)<>'') then
    begin
      clAux.ClearSql;
      clAux.AddParam ('INSERT INTO CRECLI_OBS (OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5,OB_TIME)    ');
      clAux.AddParam ('VALUES (:OB_CLIE,:OB_LIN1,:OB_LIN2,:OB_LIN3,:OB_LIN4,:OB_LIN5,:OB_TIME)             ');
      clAux.consulta.parambyname('OB_CLIE').AsFloat  := cliente;
      clAux.consulta.parambyname('OB_LIN1').AsString := edtObs1.text;
      clAux.consulta.parambyname('OB_LIN2').AsString := edtObs2.text;
      clAux.consulta.parambyname('OB_LIN3').AsString := edtObs3.text;
      clAux.consulta.parambyname('OB_LIN4').AsString := edtObs4.text;
      clAux.consulta.parambyname('OB_LIN5').AsString := edtObs5.text;
      clAux.consulta.parambyname('OB_TIME').AsDateTime  := frm_principal.x_data_trabalho;
      clAux.Execute;
      clAux.ClearSql;
      clAux.AddParam ('DELETE FROM MOVIMENTO_CRECLI_OBS   ');
      clAux.AddParam ('WHERE (OB_CLIE=:cliente)           ');
      clAux.consulta.parambyname('cliente').AsFloat := cliente;
      clAux.Execute;
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

{*************************************  - alteracao: 27/10/2004}
procedure Tfrm_EdtCliente.PreencheObservacoes(cliente: Real);
var
  clAux: TClassAuxiliar;
begin
  with (frm_Aux5Contrato) do
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT OB_CLIE,OB_LIN1,OB_LIN2,OB_LIN3,OB_LIN4,OB_LIN5 ');
    clAux.AddParam ('FROM   CRECLI_OBS                                      ');
    clAux.AddParam ('WHERE (OB_CLIE=:cliente)                               ');
    clAux.consulta.parambyname('cliente').AsFloat := cliente;
    if (clAux.Execute) then
    begin
      if (trim(clAux.result('OB_LIN1'))='.') then //ponto indica linhas em branco
      begin
        edtObs1.text := '';
        edtObs2.text := '';
        edtObs3.text := '';
        edtObs4.text := '';
        edtObs5.text := '';
      end
      else
      begin
        edtObs1.text := clAux.result('OB_LIN1');
        edtObs2.text := clAux.result('OB_LIN2');
        edtObs3.text := clAux.result('OB_LIN3');
        edtObs4.text := clAux.result('OB_LIN4');
        edtObs5.text := clAux.result('OB_LIN5');
      end;
    end
    else
    begin
      edtObs1.text := '';
      edtObs2.text := '';
      edtObs3.text := '';
      edtObs4.text := '';
      edtObs5.text := '';
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_edtCliente.Button1Click(Sender: TObject);
var
  a:Boolean;
begin
  try
    a := false;
    Frm_Principal.codclientecad := Trim(EdtCodigo.Text);
    if frm_MenuPrincipal_OpcaoCrediario = nil then
    begin
      a := true;
      frm_MenuPrincipal_OpcaoCrediario := Tfrm_MenuPrincipal_OpcaoCrediario.Create(Application);
    end;

    frm_MenuPrincipal_OpcaoCrediario.botao6.ONClick(Sender);

    if a then
      frm_MenuPrincipal_OpcaoCrediario.Destroy;
  finally
    Frm_Principal.codclientecad := '';
  end;
end;

procedure Tfrm_edtCliente.BitBtnProsseguirClick(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;


procedure Tfrm_edtCliente.BitBtnProsseguir2Click(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;

procedure Tfrm_edtCliente.BitBtnRetornar2Click(Sender: TObject);
begin
  Retornacadastro1.click;
end;

procedure Tfrm_edtCliente.BitBtnRetornarClick(Sender: TObject);
begin
  Retornacadastro1.click;
end;

procedure Tfrm_edtCliente.BitBtnRetornar1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtCliente.edtSexoChange(Sender: TObject);
var
  cpf: String;
begin
  cpf := Trim(edtCpf.text);
  if (Length(cpf)<=11) then
    if (Trim(edtSexo.text)<>'M') and
      (Trim(edtSexo.text)<>'F') and
      (Trim(edtSexo.text)<>'') then
    begin
      frmDialogo.ExibirMensagem (' O sexo do cliente fornecido não é válido! '
        ,'Sexo',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      try
        edtSexo.text:='';
        edtSexo.setfocus;
      except
      end;
    end;

end;

procedure Tfrm_edtCliente.ficharioDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
{ if Active then
    begin
        Control.Canvas.Font.Color := clWhite;
        Control.Canvas.Brush.Color := clTeal;
    end
    else
    begin
        Control.Canvas.Font.Color := clBlack;
        Control.Canvas.Brush.Color := clBtnFace;
    end;

    Control.Canvas.FillRect( Rect );
    Control.Canvas.TextOut( Rect.Left+5,Rect.Top+4,TTabSheet(fichario.Pages[TabIndex]).Caption ); }
end;


procedure Tfrm_edtCliente.BitBtn3Click(Sender: TObject);
begin
  if (trim(edtCodigo.Text)<>'') then
  begin
    Application.CreateForm(TMain, Main);
    with (Main) do
    begin
      Main.abril := 2;
      showmodal;
      Free;
    end;
  end;
end;

procedure Tfrm_edtCliente.edtQtdeBoletaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((key=K_ENTER) or (key=K_BAIXO)) and (strtofloat(Trim(edtQtdeBoleta.Text)) > 1) then
  begin
    if (contratoComum) then
    begin
      frmDialogo.ExibirMensagem ('O contrato lançado não é multiboleta!','Número de Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      frm_edtCliente.Close;
    end
    else
    if (strtofloat(Trim(edtQtdeBoleta.Text)) >= 2) and (strtofloat(Trim(edtQtdeBoleta.Text)) <= 3) and (not btnEditarBoletas.Enabled) then
    begin
      Application.CreateForm(Tfrm_InfBoletaVenda,frm_InfBoletaVenda);
      frm_InfBoletaVenda.numContrato := Trim(edtContrato.Text);
      frm_InfBoletaVenda.numBoletas  := strtofloat(Trim(edtQtdeBoleta.Text));
      frm_InfBoletaVenda.ShowModal;
      if (frm_InfBoletaVenda.tudoVazio) or (frm_InfBoletaVenda.cancelou) then
      begin
        frm_principal.multiBoleta := false;
        edtQtdeBoleta.SetFocus;
      end
      else
      begin
        edtCodAval.SetFocus;
        frm_principal.multiBoleta := true;
      end;
    end
    else
    if (strtofloat(Trim(edtQtdeBoleta.Text)) > 3) then
    begin
      frmDialogo.ExibirMensagem ('O maior valor aceito é 3!'
        ,'Número de Boletas',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      edtQtdeBoleta.SetFocus;
    end;
  end
  else
  if (key=K_ENTER) or (key=K_BAIXO) and (strtofloat(Trim(edtQtdeBoleta.Text)) = 1) then
  begin
    btnEditarBoletas.Enabled := false;
  {if (not edtValMerc.Enabled) then
  begin
          edtValMerc.Enabled := true;
          edtValMerc.Text    := '';
  end;
  if (not edtValEntrada.Enabled) then
  begin
          edtValEntrada.Enabled := true;
          edtValEntrada.Text    := '';
  end;      }
    edtCodAval.SetFocus;
    frm_principal.multiBoleta := false;
  end
  else
  if (key=K_ENTER) or (key=K_BAIXO) and (strtofloat(Trim(edtQtdeBoleta.Text)) < 1) then
  begin
    edtQtdeBoleta.Text        := '1';
    frm_principal.multiBoleta := false;
    edtCodAval.SetFocus;
  end;
  if (key=K_CIMA) then
    if (edtSerieNota.Enabled) then
      edtSerieNota.SetFocus
    else
      edtDatContrato.SetFocus;
end;

procedure Tfrm_edtCliente.btnEditarBoletasClick(Sender: TObject);
var
  clAux: TClassAuxiliar;
begin
  {clAux := TClassAuxiliar.Create;
  clAux.Conect('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam('SELECT *                      ');
  clAux.AddParam('FROM CRECTABR                 ');
  clAux.AddParam('WHERE (CR_CLIE=:cliente) AND  ');
  clAux.AddParam('      (CR_CODI=:contrato) AND ');
  clAux.AddParam('      (CR_LOJA=:loja)         ');
  if (Trim(frm_Consulta1.edtCodCli.Text) <> '') then
          clAux.consulta.ParamByName('cliente').AsFloat := strtofloat(Trim(frm_Consulta1.edtCodCli.Text))
  else
          clAux.consulta.ParamByName('cliente').AsFloat := strtofloat(Trim(edtCodigo.Text));
  clAux.consulta.ParamByName('contrato').AsFloat        := strtofloat(Trim(edtContrato.Text));
  clAux.consulta.ParamByName('loja').AsFloat            := frm_principal.x_loja;
  if (clAux.Execute) then
      frm_principal.jaGravou := true
  else
      frm_principal.jaGravou := false;
  clAux.Desconect;
  clAux.Free;}
  frm_InfBoletaVenda.ShowModal;
  edtCodAval.SetFocus;
end;

function Tfrm_edtCliente.ConfirmaCadastroCrediario(Cliente,
  Contrato: String): boolean;
begin
  Application.CreateForm(TfrmSenhaConfirmacao,frmSenhaConfirmacao);
  frmSenhaConfirmacao.cliente  := Cliente;
  frmSenhaConfirmacao.contrato := Contrato;
  frmSenhaConfirmacao.ShowModal;
  result := frmSenhaConfirmacao.continua;
  frmSenhaConfirmacao.Free;
end;

function Tfrm_edtCliente.LiberaVendaZerado: boolean;
begin
  frm_senhaSupervisor.showmodal;
  result := frm_senhaSupervisor.y_flag;
end;

function Tfrm_edtCliente.ClienteSemCEP(cliente: Real): Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.Conect('CREDITO',self);
  clAux.ClearSql;
  clAux.AddParam('SELECT CL_CEP FROM CRECLI ');
  clAux.AddParam('WHERE (CL_CODI=:cliente)  ');
  clAux.consulta.ParamByName('cliente').AsFloat := cliente;
  clAux.consulta.Open;
  if (not clAux.consulta.IsEmpty) then
  begin
    if (Trim(clAux.Result('CL_CEP')) = '') then
      Result := true
    else
      Result := false;
  end
  else
    Result := true;
  clAux.Desconect;
  clAux.Free;
end;

procedure Tfrm_edtCliente.edtPaisEnter(Sender: TObject);
begin
  if (Trim(edtPais.Text) = '') then
  begin
    Application.CreateForm(TFrmF8Pais,FrmF8Pais);
    with (Frmf8Pais) do
    begin
      if (UpperCase(edtCidade.Text) = 'EXTERIOR') then
        exterior := true
      else
        exterior := false;
      edit         := edtPais;
      labelCodPais := lblCodPais;
      ShowModal;
      Free;
    end;
  end;
end;

procedure Tfrm_edtCliente.edtPaisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtTelefone.SetFocus;
  if (key = K_CIMA) then
    edtCidade.SetFocus;
  if (key = K_F8) then
  begin
    Application.CreateForm(TFrmF8Pais,FrmF8Pais);
    with (Frmf8Pais) do
    begin
      if (UpperCase(edtCidade.Text) = 'EXTERIOR') then
        exterior := true
      else
        exterior := false;
      edit         := edtPais;
      labelCodPais := lblCodPais;
      ShowModal;
      Free;
    end;
  end;
end;

procedure Tfrm_edtCliente.edtUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtPais.SetFocus;
  if (key = K_CIMA) then
    edtCidade.SetFocus;
end;

procedure Tfrm_edtCliente.edtComplementoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtBairro.setfocus;
  if (key = K_CIMA) then
    edtNumero.SetFocus;
end;

procedure Tfrm_edtCliente.edtNumeroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = K_ENTER) or (key = K_BAIXO) then
    edtComplemento.setfocus;
  if (key = K_CIMA) then
    edtEndereco.SetFocus;
end;

procedure Tfrm_edtCliente.cbbTipoLogradouroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = K_ENTER) then
    edtEndereco.SetFocus;
end;

procedure Tfrm_edtCliente.edtNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['0'..'9',Chr(8)]) then
    Key:= #0;
end;

procedure Tfrm_edtCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in[chr(39)]) then
    Key:= #0;
end;

procedure Tfrm_edtCliente.PreencheComboTipoLogradouro;
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

procedure Tfrm_edtCliente.edtQtdeBoletaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in['1'..'3',Chr(8)]) then
    Key:= #0;
end;

procedure Tfrm_edtCliente.PreparaGuiaDadosCadastraisParaPessoaJuridica;
begin
  edtSexo.color := clBtnFace;
  edtSexo.text  := '';
  edtSexo.readonly := true;

  edtNasc.color := clBtnFace;
  edtNasc.text  := '';
  edtNasc.readonly := true;

  edtOrgExped.color := clBtnFace;
  edtOrgExped.text  := '';
  edtOrgExped.readonly := true;

  cbEstadoCivil.color := clBtnFace;
  cbEstadoCivil.text  := '';
  cbEstadoCivil.items.clear;

  edtConjuge.color := clBtnFace;
  edtConjuge.text  := '';
  edtConjuge.readonly := true;

  edtPai.color := clBtnFace;
  edtPai.text  := '';
  edtPai.readonly := true;

  edtMae.color := clBtnFace;
  edtMae.text  := '';
  edtMae.readonly := true;

  Label13.caption  := 'Insc. Estadual';
  edtIdentidade.editmask := 'ccccccccccccccccccccccccc;1; ';
end;

procedure Tfrm_edtCliente.PreparaGuiaDadosCadastraisParaPessoaFisica;
begin
  edtSexo.color := clWhite;
  edtSexo.text  := '';
  edtSexo.readonly := false;

  edtNasc.color := clWhite;
  edtNasc.text  := '';
  edtNasc.readonly := false;

  edtOrgExped.color := clWhite;
  edtOrgExped.text  := '';
  edtOrgExped.readonly := false;

  cbEstadoCivil.color := clWhite;
  cbEstadoCivil.text  := '';
  cbEstadoCivil.items.clear;
  cbEstadoCivil.items.Add('SOLTEIRO');
  cbEstadoCivil.items.Add('CASADO');
  cbEstadoCivil.items.Add('SEPARADO');
  cbEstadoCivil.items.Add('VIUVO');
  cbEstadoCivil.items.Add('OUTROS...');

  edtConjuge.color := clWhite;
  edtConjuge.text  := '';
  edtConjuge.readonly := false;

  edtPai.color := clWhite;
  edtPai.text  := '';
  edtPai.readonly := false;

  edtMae.color := clWhite;
  edtMae.text  := '';
  edtMae.readonly := false;

  Label13.caption  := 'Identidade';
  edtIdentidade.editmask := '9999999999999999999999999;1; ';
end;

procedure Tfrm_edtCliente.btnSalvarClick(Sender: TObject);
begin
  Salvarocliente1.click;
end;

end.
