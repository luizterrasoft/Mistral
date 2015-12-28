unit cadcli2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Grids, Menus, cliente, contratos,
  LLink, MailTo;

type
  Tfrm_edtCliente2 = class(TForm)
    fichario: TPageControl;
    pagina1: TTabSheet;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label9: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
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
    btnProsseguir: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnRetornar: TPanel;
    btnProsseguir2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnSalvar1: TSpeedButton;
    botao_sair2: TPanel;
    btnRetornar2: TPanel;
    edtCodAval: TMaskEdit;
    pnAval: TPanel;
    Mudaralojaedatadocontraot1: TMenuItem;
    Gerarprestacoes1: TMenuItem;
    Salvarocliente1: TMenuItem;
    pnTipoCad1: TPanel;
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
    Label77: TLabel;
    Label76: TLabel;
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
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    pnMensForm00: TPanel;
    Label50: TLabel;
    lbLimpar: TLabel;
    Label51: TLabel;
    Label35: TLabel;
    Label57: TLabel;
    Label79: TLabel;
    Label78: TLabel;
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
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
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
    Label69: TLabel;
    Label37: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    Label60: TLabel;
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
    Label141: TLabel;
    Label142: TLabel;
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
    Label126: TLabel;
    Label127: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    btnEdtGrade: TButton;
    btnCancelGrade: TButton;
    btnSalvarGrade: TButton;
    lbF8mens: TLabel;
    lbF8: TLabel;
    lbF8mens2: TLabel;
    lbF82: TLabel;
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
    Bevel8: TBevel;
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
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    lbUltimo: TLabel;
    Label154: TLabel;
    Label155: TLabel;
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
    btnImpCarnet: TSpeedButton;
    btnImpProposta: TSpeedButton;
    pnEmail: TPanel;
    MailTo1: TMailTo;
    Image1: TImage;
    pnDesatualizado: TPanel;
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
    procedure Mudaralojaedatadocontraot1Click(Sender: TObject);
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
    procedure btnImprimir1Click(Sender: TObject);
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
    procedure edtSexoChange(Sender: TObject);
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
    procedure edtEmailChange(Sender: TObject);
    procedure ficharioChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
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
    PodeChamarCheques: Boolean;
    regspc: String;
    boInsert: Boolean;
    PodeFecharForm: Boolean;
    flagEditCheq: Boolean;
    flagInc2,flagCanc2,flagExc2,flagSalv2,flagIndiv2: Boolean;
    auxCliente,auxContrato: Integer;
    antdifpdev: Real;
    antPainel: String;
    flagConsulta: Boolean;
    function  PreencheGradeContrato (cliente,contrato: Real):Boolean;
    function  ContratoEdeCheque (cliente,contrato: Real):Boolean;
    function  ContratoSendoPago (cliente,contrato: Real):Boolean;
    function  NumParcContrato (cliente,contrato: Real):Integer;
    function  ExisteContrato(cliente,contrato: Real):Boolean;
    function  LojaCadastrada(codLoja: Real):Boolean;
    function  PlanoCadastrado(codPlano: String):Boolean;
    procedure PreencheEditsCliente (classe: TClassCliente; pagina: Integer);
    procedure PreencheEditsContrato (classe: TClassContrato);
    procedure LimparEdits (pagina: Integer);
    procedure IniciarGradeLancamentos;
    procedure HabilitaMenuCliente (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
    procedure HabilitaMenuContrato (menu1,menu2,menu3,menu4,menu5,menu6,menu7,menu8: Boolean);
    procedure DefinirAtalhos (iModo: Integer);
  end;

var
  frm_edtCliente2: Tfrm_edtCliente2;

implementation

uses f8planos, F8Lojas, principal, f8Port, funcoes1,funcoes2 , loja, plano, portador,
  prestacoes, aux1Contrato, unDialogo, f8Clientes, prestcontrato,
  Rl_tite, Mem_prnt, aux2Contrato, cheques, DM4, aux3Contrato, relat,
  unConsCheq, unEmissCarnet2, f8Avalista, un_frmConsulta1, credito,
  procura, unMensagem, aux1Contrato_demo, aux2Contrato_demo, cadcli, auxiliar,
  unVersoPropostaCredito, unPropostaCredito;

{$R *.DFM}

{Esta funcao pode ser usada como padrao em todos os edits no evento OnEnter ****}
{Somente nos casos comuns em que o evento só for usado para redirecionamento ***}
{Clique de botao ***}
procedure Tfrm_edtCliente2.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  clCli: TClassCliente;
  clLoja: TClassLoja;
  codigo: String;
begin
  if (key=13) or (key=40) then
  begin
       {Primeira Busca do cadastro do cliente - PRIMEIRA BUSCA}
    codigo:=Trim(edtCodigo.text);
    if (codigo<>'') then
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
        AddParam ('       CL_DSPC,CL_ALTE,CL_DULP                                  ');
        AddParam ('From   CRECLI                                                   ');
        AddParam ('Where (CL_CODI='+codigo+')                                      ');
        frm_principal.BarraDicas.caption:='Buscando cliente...Aguarde!';
        frm_principal.refresh;
        if (not Execute) then
        begin
          frm_principal.BarraDicas.caption:='';
          if (btnCancelainclusao2.enabled) then
            HabilitaMenuCliente (false,true,false,true,true,false,true,true)
          else
            HabilitaMenuCliente (true,false,false,true,true,false,true,true);
          LimparEdits(1);
          LimparEdits(2);
          edtCpf.text:='';
          modoContrato:=0;
          pnTipoCad1.caption := 'PRIMEIRO CONTRATO';
          pnTipoCad2.caption := 'PRIMEIRO CONTRATO';
          pnTipoCad3.caption := 'PRIMEIRO CONTRATO';

              {preenchendo alguns dados sobre a loja ***}
          if (cdLoja<>0) then
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
          end;

              {proximo focu ***}
          edtContrato.text:='000001';
          lbUltimo.caption:='000000';
          edtCpf.setfocus;
        end
        else
        begin
          frm_principal.BarraDicas.caption:='';
          HabilitaMenuCliente (true,false,true,true,true,true,true,true);
          pnTipoCad1.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          pnTipoCad2.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          pnTipoCad3.caption  := Result('CL_NOME')+' >> RENOVAÇÃO DE CONTRATO';
          modoContrato:=1;
          PreencheEditsCliente (clCli,1);
          PreencheEditsCliente (clCli,2);

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
          if (Modo=0) then
            if (frmDialogo.ExibirMensagem ('Ir direto para o cadastro do contrato?'
              ,'Cadastro do cliente',[mbYes,mbNo],
              frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            begin
              fichario.activepage:=pagina3;
              edtContrato.setfocus;
            end
            else
              edtCpf.setfocus;
          if (Modo=1) then
            edtCpf.setfocus;
        end;
        desconect;
        Free;
        edtCodigo.text := form_nz (StrToFloat(codigo),6);
      end;
  end;
  if (key=K_F8) then
    with (frm_f8Clientes) do
    begin
      edit:=edtCodigo;
      btnCadastro.visible:=false;
      showmodal;
      btnCadastro.visible:=true;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do cliente; Formato: 999999 (Até 06 dígitos) - <F8/Duplo clique> Exibe clientes cadastrados ',10);
end;

procedure Tfrm_edtCliente2.edtNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSexo.setfocus;
  if (key=38) then
    edtCpf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtNascKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCep.setfocus;
  if (key=38) then
    edtSexo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do nascimento do cliente: formato 99/99/9999 ',10);
end;

procedure Tfrm_edtCliente2.edtEnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtBairro.setfocus;
  if (key=38) then
    edtCep.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço do cliente; Informe Rua ou Av., e Numero - Até 50 caracteres. ',15);
end;

procedure Tfrm_edtCliente2.edtBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCidade.setfocus;
  if (key=38) then
    edtEndereco.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Bairro do cliente; Informe o bairro do endereço - Até 30 caracteres. ',15);
end;

procedure Tfrm_edtCliente2.edtCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    cbEstado.setfocus;
  if (key=38) then
    edtBairro.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cidade do cliente; Até 20 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCep.setfocus;
  if (key=38) then
    edtCidade.setfocus;
end;

procedure Tfrm_edtCliente2.edtCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtEndereco.setfocus;
  if (key=38) then
    edtNasc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do cliente: Formato: 99999-999 ',10);
end;

procedure Tfrm_edtCliente2.cbEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    edtTelefone.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Estado onde se situa(mora) o cliente; Até 2 caracteres ou escolha opções clicando na seta. ',15);
end;

procedure Tfrm_edtCliente2.edtTelefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCelular.setfocus;
  if (key=38) then
    cbEstado.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtCelularKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtFax.setfocus;
  if (key=38) then
    edtTelefone.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Celular do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtFaxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtEmail.setfocus;
  if (key=38) then
    edtCelular.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fax do cliente; Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtIdentidade.setfocus;
  if (key=38) then
    edtFax.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço de e-mail do cliente: digite até 30 caracteres. ',15);
end;

procedure Tfrm_edtCliente2.edtIdentidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtOrgExped.setfocus;
  if (key=38) then
    edtEmail.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   RG do cliente: Digite até 25 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtExpedicaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtOrgExped.setfocus;
  if (key=38) then
    edtIdentidade.setfocus;
end;

procedure Tfrm_edtCliente2.edtOrgExpedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    cbEstadoCivil.setfocus;
  if (key=38) then
    edtIdentidade.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Orgão emissor do RG do cliente: Digite até . ',15);
end;

procedure Tfrm_edtCliente2.edtCpfKeyDown(Sender: TObject; var Key: Word;
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
procedure Tfrm_edtCliente2.cbEstadoCivilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) then
    edtConjuge.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Estado civil do cliente: escolha entre as opções disponíveis. ',15);
end;

{Tratamento diferenciado ***}
procedure Tfrm_edtCliente2.edtOutrosKeyDown(Sender: TObject; var Key: Word;
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
procedure Tfrm_edtCliente2.edtConjugeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPai.setfocus;
  if (key=38) then
    cbEstadoCivil.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do conjuge do cliente: até 40 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtPaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtMae.setfocus;
  if (key=38) then
    edtConjuge.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do pai do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtMaeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    btnProsseguirclick(sender);
  if (key=38) then
    edtPai.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome da mãe do cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtRef1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtTelRef1.setfocus;
  if (key=38) then
    edtLimCred.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Referência N. 01: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtRef2KeyDown(Sender: TObject; var Key: Word;
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
procedure Tfrm_edtCliente2.btnProsseguirClick(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;

{Botao de retorno para pagina 1 ***}
procedure Tfrm_edtCliente2.BitBtn2Click(Sender: TObject);
begin
  fichario.activepage:=pagina1;
  edtRef2.setfocus;
end;

{No evento OnChange do objeto combobox, a escolha entre outros é verificada ***}
{Tratamento de data personalizada ***}
procedure Tfrm_edtCliente2.edtNascExit(Sender: TObject);
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
procedure Tfrm_edtCliente2.btnGerarPrestacoesClick(Sender: TObject);
begin
  Gerarprestacoes1.click;
end;

procedure Tfrm_edtCliente2.edtNomeEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCargo.setfocus;
  if (key=38) then
    btnRetornarClick(sender);
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome da empresa onde trabalha o cliente: até 30 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtCargoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtEndEmp.setfocus;
  if (key=38) then
    edtNomeEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Nome do cargo ocupado pelo cliente: até 20 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtEndEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtAdmissaoEmp.setfocus;
  if (key=38) then
    edtCargo.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Endereço de trabalho do cliente; Informe Rua ou Av., e Numero - Até 50 caracteres. ',15);
end;

procedure Tfrm_edtCliente2.edtAdmissaoEmpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtTelEmp.setfocus;
  if (key=38) then
    edtEndEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data de admissão no emprego: formato 99/99/9999. ',15);
end;

procedure Tfrm_edtCliente2.edtTelEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRamal.setfocus;
  if (key=38) then
    edtAdmissaoEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone do trabalho do cliente: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtBairroEmpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCartProf.setfocus;
  if (key=38) then
    edtTelEmp.setfocus;
end;

procedure Tfrm_edtCliente2.edtCartProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSalario.setfocus;
  if (key=38) then
    edtRamal.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. da carteira profissional: Digite até 20 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtSerieCartProfKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSalario.setfocus;
  if (key=38) then
    edtCartProf.setfocus;
end;

procedure Tfrm_edtCliente2.edtSalarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtLimCred.setfocus;
  if (key=38) then
    edtCartProf.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Salário do cliente: formato 99,99. ',15);
end;

procedure Tfrm_edtCliente2.edtLimCredKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRef1.setfocus;
  if (key=38) then
    edtSalario.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Limite de crédito do cliente: formato 99,99. ',15);
end;

procedure Tfrm_edtCliente2.edtTelRef1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtRef2.setfocus;
  if (key=38) then
    edtLimCred.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone da ref. 01: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtTelRef2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtObs.setfocus;
  if (key=38) then
    edtRef2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fone da ref. 02: Digite até 15 digitos numéricos não obrigatórios. ',15);
end;

procedure Tfrm_edtCliente2.edtObsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtPDC.setfocus;
  if (key=38) then
    edtTelRef2.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Observação adicional ao cadastro: até 50 caracteres. ',10);
end;

{Botao 2 de prosseguir no cadastro ***}
procedure Tfrm_edtCliente2.btnProsseguir2Click(Sender: TObject);
begin
  Prosseguecadastro1.click;
end;

{Botao de Retorno a pagina 1}
procedure Tfrm_edtCliente2.btnRetornarClick(Sender: TObject);
begin
  Retornacadastro1.click;
end;

{Botao de Retorno a pagina 2}
procedure Tfrm_edtCliente2.btnRetornar2Click(Sender: TObject);
begin
  Retornacadastro1.click;
end;

procedure Tfrm_edtCliente2.edtContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  clContrato: TClassContrato;
  codigo: String;
begin
  if (key=13) or (key=40) then
  begin
    if (Modo=2) then
      if (cdCliente=0) then
      begin
        frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
          ,'Data de nascimento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        Mudaralojaedatadocontraot1.click;
        edtContrato.setfocus;
      end
      else
      begin
        codigo:=sem_brancos(Trim(edtContrato.text));
        if (codigo<>'') then
        begin
          clContrato := TClassContrato.Create;
          with (clContrato) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA, ');
            AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH, ');
            AddParam ('       CR_TOT2,CR_VDEV,CR_BOLE ');
            AddParam ('From   CRECTABR');
            AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+') ');
            frm_principal.BarraDicas.caption:='Buscando contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
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
            end;
            edtContrato.text := form_nz (StrtoFloat(codigo),6);
            edtLoja.setfocus;
            desconect;
            Free;
          end;
        end;
      end{caso nao seja definido, antes, um cliente ***};
    if (Modo=0) then
      if (cdCliente=0) then
      begin
        frmDialogo.ExibirMensagem (' Um cliente não foi definido ainda! '
          ,'Data de nascimento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina1;
        edtCodigo.setfocus;
      end
      else
      begin
        codigo:=Trim(edtContrato.text);
        if (codigo<>'') then
        begin
          clContrato := TClassContrato.Create;
          with (clContrato) do
          begin
            conect ('CREDITO',self);
            ClearSql;
            AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_SERI,CR_DNOT,CR_AVAL,CR_PORT,CR_NOTA, ');
            AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_CARN,CR_FICH, ');
            AddParam ('       CR_TOT2,CR_VDEV,CR_BOLE  ');
            AddParam ('From   CRECTABR');
            AddParam ('Where (CR_CODI='+codigo+') AND (CR_CLIE='+inttostr(cdCliente)+') ');
            frm_principal.BarraDicas.caption:='Buscando contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
              boInsert:=true;
              PodeChamarCheques:=false;
              frm_principal.BarraDicas.caption:='';
              IniciarGradeLancamentos;
              LimparEdits(3);
              pnTipoCad3.caption:=pnTipoCad2.caption;
              btnEdtGrade.enabled:=false;
              btnCancelGrade.enabled:=false;
              btnSalvarGrade.enabled:=false;
            end
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
            edtLoja.setfocus;
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

procedure Tfrm_edtCliente2.edtDataContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNotaFiscal.setfocus;
  if (key=38) then
    edtContrato.setfocus;
end;

procedure Tfrm_edtCliente2.edtNotaFiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtSerieNota.setfocus;
  if (key=38) then
    edtDatContrato.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Número da nota fiscal:  até 08 dígitos',10);
end;

procedure Tfrm_edtCliente2.edtSerieNotaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCodAval.setfocus;
  if (key=38) then
    edtNotaFiscal.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. de série da nota fiscal: 01 caractere apenas. ',10);
end;

procedure Tfrm_edtCliente2.edtAvalistaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPortador.setfocus;
  if (key=38) then
    edtSerieNota.setfocus;
end;

procedure Tfrm_edtCliente2.edtPortadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtValMerc.setfocus;
  if (key=38) then
    edtCodAval.setfocus;
  if (key=K_F8) then
    with (frm_f8Port) do
    begin
      left:=287;
      top :=76;
      edit:=edtPortador;
      btnCadastro.visible:=true;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do portador: Formato: 9999 (Até 04 dígitos) - <F8/Duplo clique> Exibe portadores cadastrados ',10);
end;

procedure Tfrm_edtCliente2.edtValMercKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtValEntrada.setfocus;
  if (key=38) then
    edtPortador.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor do contrato: Formato: 999,99  ',10);
end;

procedure Tfrm_edtCliente2.edtValEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPlano.setfocus;
  if (key=38) then
    edtValMerc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Valor da entrada: Formato: 999,99  ',10);
end;

procedure Tfrm_edtCliente2.edtPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNumParc.setfocus;
  if (key=38) then
    edtValEntrada.setfocus;
  if (key=K_F8) then
    with (frm_f8Planos) do
    begin
      edit:=edtPlano;
      btnCadastro.visible:=true;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Código do plano: Formato: 999 (Até 03 dígitos) - <F8/Duplo clique> Exibe planos cadastrados  ',10);
end;

procedure Tfrm_edtCliente2.edtNumParcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtFator.setfocus;
  if (key=38) then
    edtPlano.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   N. de parcelas do plano: formato 99 (Até 02 dígitos) ',10);
end;

procedure Tfrm_edtCliente2.edtFatorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    Gerarprestacoes1.click;
  if (key=38) then
    edtNumParc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Fator de juros das prestações: Formato; 9,99. ',10);
end;

procedure Tfrm_edtCliente2.edtPortadorExit(Sender: TObject);
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
procedure Tfrm_edtCliente2.LimparEdits (pagina: Integer);
begin
  if (pagina=1) then
  begin
    edtNome.text        := '';
    edtEndereco.text    := '';
    edtBairro.text      := '';
    edtCidade.text      := '';
    cbEstado.text       := '';
    edtCep.text         := '';
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
    if (pnTipoCad2.visible) then
      pnTipoCad2.caption :='';
    edtSpc.text           := '';
    edtCfun.text          := '';
    edtTPro.text          := '';
    edtPDC.text           := '';
    pnDSPC.caption        := '';
    pnDtca.caption        := '';
    pnUltc.caption        := '';
    pnQtdc.caption        := '';
    pnValidade.caption    := '';
  end
  else
  if (pagina=3) then
  begin
    edtContrato.text      := '';
    edtLoja.text          := '';
    edtDatContrato.text   := '';
    edtNotaFiscal.text    := '';
    edtSerieNota.text     := '';
    edtCodAval.text       := '';
    edtPortador.text      := '';
    pnPortador.caption    := '';
    pnAval.caption        := '';
    pnPlano.caption       := '';
    pnTotalDevido.caption := '';
    edtValMerc.text       := '';
    edtValEntrada.text    := '';
    edtPlano.text         := '';
    pnPlano.caption       := '';
    edtNumParc.text       := '';
    edtFator.text         := '';
    if (pnTipoCad3.visible) then
      pnTipoCad3.caption :='';
    lbl_cpf.caption := 'Cpf/Cgc do cliente: ';
    lbl_banco.caption := 'Banco/Agência: ';
  end;
end;

{Ao sair do edit do plano, exibe no painel, o tipo de plano de pgto ***}
procedure Tfrm_edtCliente2.edtPlanoExit(Sender: TObject);
var
  clAux: TClassContrato;
  clPlano: TClassPlano;
  clPrest: TClassPrestacoes;
  codigo: String;
begin
  codigo:=Trim(edtPlano.text);
  if (codigo<>'') then
  begin
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
            if (Trim(edtNumParc.text)='') then
              edtNumParc.text := form_nz(Result('PR_NPRE'),2);
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
procedure Tfrm_edtCliente2.Limpareditspagina11Click(Sender: TObject);
begin
  if (fichario.activepage=pagina1) then
  begin
    pnTipoCad1.caption:='';
    edtCodigo.text:='';
    edtCpf.text   :='';
    edtCodigo.setfocus;
    LimparEdits(1);
  end;
  if (fichario.activepage=pagina2) then
  begin
    EdtNomeEmp.setfocus;
    LimparEdits(2);
  end;
  if (fichario.activepage=pagina3) then
  begin
    antdifpdev:=0;
    AntPainel:=pnTipoCad3.caption;
    pnTipoCad3.caption:=AntPainel;
    IniciarGradeLancamentos;
    edtContrato.setfocus;
    LimparEdits(3);
  end;
end;

{Duplo clique no botao de sair, fecha o formulario}
{Procedimento que preenche os edits do formulario com as informacoes}
{presentes nos campos da classe cliente do mesmo formulario}
{Para tanto, a classe deve ter sido inicializada ou uma excecao sera gerada ***}
procedure Tfrm_edtCliente2.PreencheEditsCliente (classe: TClassCliente; pagina: Integer);
begin
  if (pagina=1) then
  begin
    edtCodigo.text     := inttostr(classe.Result('CL_CODI'));
    edtCpf.text        := classe.Result('CL_CPF');
    edtNome.text       := classe.Result('CL_NOME');
    antNome            := Trim(edtNome.text);
    edtSexo.text       := classe.Result('CL_SEXO');
    if (classe.Result('CL_DTNA')<>StrToDate('01/01/1900')) then
      edtNasc.text    := DateToStr(classe.Result('CL_DTNA'));
    edtCep.text        := classe.Result('CL_CEP');
    edtEndereco.text   := classe.Result('CL_ENDE');
    edtBairro.text     := classe.Result('CL_BAIR');
    edtCidade.text     := classe.Result('CL_CIDA');
    cbEstado.text      := classe.Result('CL_ESTA');
    edtTelefone.text   := classe.Result('CL_FONE');
    edtCelular.text    := classe.Result('CL_CELU');
    edtFax.text        := classe.Result('CL_FAX');
    edtEmail.text      := classe.Result('CL_EMAI');
    edtIdentidade.text := classe.Result('CL_IDEN');
    edtOrgExped.text   := classe.Result('CL_OEXP');
    try
      if (classe.Result('CL_ECIV')<>'?') then
        cbEstadoCivil.itemindex := classe.Result('CL_ECIV');
    except
      cbEstadoCivil.itemindex := 0;
    end;
    edtConjuge.text    := classe.Result('CL_CONJ');
    edtPai.text        := classe.Result('CL_NPAI');
    edtMae.text        := classe.Result('CL_NMAE');
    if (classe.Result('CL_ALTE')='1') then
      pnDesatualizado.visible:=true
    else
    if (classe.Result('CL_ALTE')='0') then
      pnDesatualizado.visible:=false;
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
    if (classe.Result('CL_DADM')<>StrToDate('01/01/1900')) then
      edtAdmissaoEmp.text := DateToStr(classe.Result('CL_DADM'));
    edtSpc.text      := classe.Result('CL_RSPC');
    edtCfun.text     := classe.Result('CL_CFUN');
    edtTpro.text     := classe.Result('CL_TPRO');
    edtPDC.text      := classe.Result('CL_PDC');
    if (classe.Result('CL_DSPC')<>strtodate('01/01/1900')) then
      pnDSPC.caption := form_data(classe.Result('CL_DSPC'));
    if (classe.Result('CL_DTCA')<>strtodate('01/01/1900')) then
      pnDtca.caption := form_data(classe.Result('CL_DTCA'));
    if (classe.Result('CL_ULTC')<>strtodate('01/01/1900')) then
      pnUltc.caption := form_data(classe.Result('CL_ULTC'));
    pnQtdc.caption := form_t(classe.Result('CL_QTDC'),5);
    pnValidade.caption := form_data(classe.Result('CL_VALI'));
  end;
end;

{inicializando a grade de lancamentos de prestacoes devidas ***}
procedure Tfrm_edtCliente2.IniciarGradeLancamentos;
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
procedure Tfrm_edtCliente2.edtAdmissaoEmpExit(Sender: TObject);
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
procedure Tfrm_edtCliente2.edtSalarioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtSalario);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente2.edtLimCredKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtLimCred);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente2.edtValMercKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtValMerc);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente2.edtValEntradaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FormatarEditNumerico (edtValEntrada);
end;

{Formata a entrada ***}
procedure Tfrm_edtCliente2.edtFatorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormatarEditNumerico (edtFator);
end;

{Formata o resultado, em termos de casas decimais ***}
procedure Tfrm_edtCliente2.edtSalarioExit(Sender: TObject);
var
  limite,valor: Real;
begin
  FormatarZerosDecimais (edtSalario);

     {sugerindo o limite de credito ***}
  if (Trim(edtSalario.text)<>'') then
  begin
    valor  := strtofloat(RetiraFormatacaoNumero(Trim(edtSalario.text)));
    limite := (frm_principal.x_perc_lim_cred*valor)/100;
    edtLimCred.text := form_nc(limite,10); 
  end
  else
    edtLimCred.text:='0,00';
end;

{Formata o resultado, em termos de casas decimais ***}
procedure Tfrm_edtCliente2.edtLimCredExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtLimCred);
end;

{Navegacao-}
procedure Tfrm_edtCliente2.edtValMercExit(Sender: TObject);
begin
  RetiraFormatacaoNumero (edtValMerc.text);
  FormatarZerosDecimais (edtValMerc);
end;

{Navegacao-}
{O valor da entrada deve ser sempre menor que o valor do contrato---}
procedure Tfrm_edtCliente2.edtValEntradaExit(Sender: TObject);
begin
     {... Formatacao}
  RetiraFormatacaoNumero (edtValEntrada.text);
  FormatarZerosDecimais (edtValEntrada);
end;

{Navegacao-}
procedure Tfrm_edtCliente2.edtFatorExit(Sender: TObject);
begin
  FormatarZerosDecimais (edtFator);
end;

{Ativacao do formulario ***}
procedure Tfrm_edtCliente2.FormActivate(Sender: TObject);
begin
  if (Modo=0) then {Config. no LANCAMENTO DE CLIENTES E CONTRATOS}
  begin
    pagina1.tabvisible  := true;
    pagina2.tabvisible  := true;
    pagina3.tabvisible  := true;
    btnProsseguir2.visible := true;
    botao_sair.visible  := false;
    btnRetornar2.visible := true;
    btnIncluir2.visible := false;
    btnCancelainclusao2.visible := false;
    btnExcluir2.visible := false;
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
    edtCodigo.setfocus;
    try
      if (btnSalvar1.Glyph.Empty) then
        btnSalvar1.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_salvar.bmp'));
      if (btnSalvar2.Glyph.Empty) then
        btnSalvar2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_salvar.bmp'));
    except
    end;
    Application.CreateForm (Tfrm_Aux1Contrato_demo, frm_Aux1Contrato_demo);
    if (MostraAuxLoja) then
    begin
      MostraAuxLoja := false;
      frm_aux1Contrato_demo.showmodal;
    end;
    frm_aux1Contrato_demo.Free;
  end;
  if (Modo=1) then {Config. do forumlario para CADASTRO DE CLIENTE}
  begin
    fichario.activepage := pagina1;
    pagina1.tabvisible  := true;
    pagina2.tabvisible  := true;
    pagina3.tabvisible  := false;
    btnProsseguir2.visible := false;
    botao_sair.visible  := true;
    btnIncluir2.visible := true;
    btnCancelainclusao2.visible := true;
    btnExcluir2.visible := true;
    btnSalvar2.visible := true;
    btnImprimir2.visible := true;
    btnImpIndiv2.visible := true;
    pnTipoCad1.visible := false;
    pnTipoCad2.visible := false;
    pnMensForm00.visible := false;
    pnMensForm01.visible := true;
    pnMensForm10.visible := false;
    pnMensForm11.visible := true;
    formulario11.visible := true;
    formulario21.visible := false;
    Lancamentos.visible  := false;
    edtCodigo.setfocus;
    if (btnIncluir2.Glyph.Empty) then
      btnIncluir2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_incluir.bmp'));
    if (btnCancelaInclusao2.Glyph.Empty) then
      btnCancelaInclusao2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_cancelincluir.bmp'));
    if (btnExcluir2.Glyph.Empty) then
      btnExcluir2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_excluir.bmp'));
    if (btnSalvar2.Glyph.Empty) then
      btnSalvar2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_salvar.bmp'));
    if (btnImprimir2.Glyph.Empty) then
      btnImprimir2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_imprimir.bmp'));
    if (btnImpIndiv2.Glyph.Empty) then
      btnImpIndiv2.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_imprimir.bmp'));
  end;
  if (Modo=2) then {Config. do forumlario para CADASTRO DE CONTRATOS}
  begin
    fichario.activepage:=pagina3;
    pagina1.tabvisible  := false;
    pagina2.tabvisible  := false;
    pagina3.tabvisible  := true;
    btnRetornar2.visible := false;
    btnIncluir1.visible := true;
    btnCancelainclusao1.visible := true;
    btnExcluir1.visible := true;
    btnSalvar1.visible := true;
    btnImpCarnet.visible := true;
    pnTipoCad3.visible := false;
    pnMensForm20.visible := false;
    pnMensForm22.visible := true;
    formulario11.visible := false;
    formulario21.visible := true;
    Lancamentos.visible  := false;
    pnTipoCad3.visible := true;
    edtContrato.setfocus;
    if (btnIncluir1.Glyph.Empty) then
      btnIncluir1.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_incluir.bmp'));
    if (btnCancelaInclusao1.Glyph.Empty) then
      btnCancelaInclusao1.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_cancelincluir.bmp'));
    if (btnExcluir1.Glyph.Empty) then
      btnExcluir1.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_excluir.bmp'));
    if (btnSalvar1.Glyph.Empty) then
      btnSalvar1.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_salvar.bmp'));
    if (btnImpCarnet.Glyph.Empty) then
      btnImpCarnet.Glyph.LoadFromFile (Pchar(frm_principal.x_pathimg+'btn_imprimir.bmp'));
  end;
  PodeFecharForm:=true;
  DefinirAtalhos (Modo);
end;

{Buscando o numero da parcela}
procedure Tfrm_edtCliente2.edtNumParcExit(Sender: TObject);
var
  clPrest: TClassPrestacoes;
  numprest,codplan: String;
begin
  clPrest  := TClassPrestacoes.Create;
  codplan  := Trim(edtPlano.text);
  numprest := Trim(edtNumParc.text);
  if (numprest<>'') then
  begin
    if (codplan<>'') then
      with (clPrest) do
      begin
        conect ('CREDITO', self);
        ClearSql;
        AddParam ('Select PR_CODI,PR_NPRE,PR_PERI,PR_FATO                  ');
        AddParam ('From   CREDPREST                                        ');
        AddParam ('Where  (PR_CODI='+codplan+') AND (PR_NPRE='+numprest+') ');
        if (Execute) then
          edtFator.text := form_nc (Result('PR_FATO'),8);
        edtNumParc.text := form_nz (StrtoFloat(numprest),2);
        desconect;
        Free;
      end;
  end
  else
  begin
    frmDialogo.ExibirMensagem ('O número de parcelas não pode ser ZERO!'
      ,'Gerar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtNumParc.setfocus;
  end;
end;

procedure Tfrm_edtCliente2.edtCodAvalEnter(Sender: TObject);
begin
  edtCodAval.selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe avalistas cadastrados';
  lbF82.visible:=true;
  lbF8Mens2.visible:=true;
  lbF8Mens2.caption:='exibe avalistas cadastrados';
end;

procedure Tfrm_edtCliente2.edtCodAvalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtPortador.setfocus;
  if (key=38) then
    edtSerieNota.setfocus;
  if (key=K_F8) then
    with (frm_f8Avalistas) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodAval;
      btnCadastro.visible:=false;
      showmodal;
    end;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Codigo do avalista: Formato: 999999 (Até 06 dígitos) - <F8/Duplo clique> Exibe avalistas cadastrados ',10);
end;

{Evento onExit}
{Evento onexit do codigo do avalista}
procedure Tfrm_edtCliente2.edtCodAvalExit(Sender: TObject);
var
  clClie: TClassCliente;
  codigo: String;
begin
  codigo:=Trim(edtCodAval.text);
  if (codigo<>'') then
  begin
    clClie := TClassCliente.Create;
    with (clClie) do
    begin
      conect ('CREDITO',self);
      ClearSql;
      AddParam ('Select CL_CODI,CL_NOME ');
      AddParam ('From CRECLI ');
      AddParam ('Where (CL_CODI='+codigo+')');
      if (not Execute) then
        pnAval.caption :='<avalista nao encontrado>'
      else
        pnAval.caption :=Result('CL_NOME');
      if (Trim(edtCodAval.text)<>'') then
        edtCodAval.text:=form_nz (StrtoFloat(Trim(edtCodAval.text)),6)
      else
        edtCodAval.text:='';
      desconect;
      Free;
    end;
  end;
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  lbF82.visible:=false;
  lbF8Mens2.visible:=false;
end;

{Navegacao -}
procedure Tfrm_edtCliente2.edtPeriKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
    btnGerarPrestacoes.click;                   
  if (key=38) then
    edtFator.setfocus;
end;

{Opcao de mudanca da loja de cadastro}
procedure Tfrm_edtCliente2.Mudaralojaedatadocontraot1Click(Sender: TObject);
begin
  Application.CreateForm (Tfrm_Aux1Contrato_demo, frm_Aux1Contrato_demo);
  if (not frm_aux1Contrato_demo.showing) then
  begin
    frm_Aux1Contrato_demo.Left:=67;
    frm_Aux1Contrato_demo.Top :=50;
    frm_aux1Contrato_demo.showmodal;
  end;
  frm_aux1Contrato_demo.Free;
end;

{Opcao de geracoes das prestacoes ***}
procedure Tfrm_edtCliente2.Gerarprestacoes1Click(Sender: TObject);
var
  clPrest: TClassPrestacoes;
  dataCont,data: TDateTime;
  cdCheqAnt,inc,res,peri,ind,numparc: Integer;
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
    frmDialogo.ExibirMensagem ('Data do contrato não pode ficar nula!'
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
    if (Trim(edtFator.text)='') then
      edtFator.text:='0,00';
    codplan := Trim(edtPlano.text);
    clPrest := TClassPrestacoes.Create;
    with (clPrest) do
    begin
      conect ('CREDITO',self);
      AddParam ('Select PR_CODI,PR_PERI,PR_NPRE ');
      AddParam ('From   CREDPREST ');
      AddParam ('Where  (PR_CODI='+codplan+')');
      AddParam ('Order by PR_NPRE ');
      Execute;
    end;

          {calculando as parcelas}
    valor   := StrToFloat(RetiraFormatacaoNumero(edtValMerc.text));
    entrada := StrToFloat(RetiraFormatacaoNumero(edtValEntrada.text));
    numparc := StrtoInt(Trim(edtNumParc.text));
    fator   := StrToFloat(RetiraFormatacaoNumero(edtFator.text));
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
          btnEdtGrade.click;
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
          btnEdtGrade.click;
      end;
  end;
end;

{O formulario so tem permissao de fechar caso esta variavel libere ***}
{O formulario so nao esta liberado para fechar quando se estiver editando as
 prestacoes/cheques direto no formulario ***}
procedure Tfrm_edtCliente2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (PodeFecharForm) then
    Action := caFree
  else
    Action := caNone;
end;

{Opcao de salvaento do cliente ***}
procedure Tfrm_edtCliente2.Salvarocliente1Click(Sender: TObject);
var
  clClie: TClassCliente;
  clAux: TClassAuxiliar;
  codigo: String;
begin
   {CRITICA DOS DADOS}
  if (DevolveQtdeClientes>=10) then
  begin
    frmDialogo.ExibirMensagem ('A versão DEMO só permite o cadastro de 10 até clientes...'
      ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Adquira a versão completa do sistema!'
      ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
  end
  else
  if (Trim(edtCodigo.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Codigo não pode ficar vazio!'
      ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina1;
    edtCodigo.setfocus;
  end
  else
  if (Trim(edtNome.text)='') then
  begin
    frmDialogo.ExibirMensagem ('Nome do cliente não pode ficar vazio!'
      ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina1;
    edtNome.setfocus;
  end
  else
  if (frm_principal.x_critica_CNPJ) and (Trim(edtCpf.text)='') then
  begin
    frmDialogo.ExibirMensagem ('CPF/CNPJ do cliente não pode ficar vazio!'
      ,'Salvar cliente',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina1;
    edtCpf.setfocus;
  end
  else
  if (ProcuraNomeClienteCpf(Trim(edtCpf.text),self)<>'<Cliente não cadastrado>') and
    (ProcuraNomeClienteCod(strtofloat(Trim(edtCodigo.text)),self)='<Cliente não cadastrado>') then
  begin
           {Exibindo o nome do cliente com o CPF/CGC cadastrado}
    clAux := TClassAuxiliar.Create;
    clAux.conect ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('Select CL_CPF,CL_CODI,CL_NOME,CL_DULP  ');
    clAux.AddParam ('From   CRECLI                          ');
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
  end
  else
  begin
          {formatacao dos dados}
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
        inCL_DTNA      := strtodate (edtNasc.text);
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
      if (cbEstadoCivil.itemindex<>-1) then
        inCL_ECIV       := inttostr(cbEstadoCivil.itemindex);
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
        inCL_SALA         := StrtoFloat(RetiraFormatacaoNumero(edtSalario.text));
      if (Trim(edtLimCred.text)<>'') then
        inCL_LIMC         := StrtoFloat(RetiraFormatacaoNumero(edtLimCred.text));
      if (edtAdmissaoEmp.text<>'  /  /    ') then
        inCL_DADM         := strtodate (edtAdmissaoEmp.text);
      inCL_OBSE         := Trim(edtObs.text);

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
      inCL_PDC          := Trim(edtPDC.text);

            {verificando a existencia do cliente ***}
      codigo := inttostr(cdCliente);
      ClearSql;
      AddParam ('Select CL_CODI,CL_LOJA,CL_DULP,CL_ALTE  ');
      AddParam ('From   CRECLI                           ');
      AddParam ('Where (CL_CODI='+codigo+')              ');
      frm_principal.BarraDicas.caption:='Salvando o cliente...Aguarde!';
      frm_principal.refresh;
      if (not Execute) then
      begin
        inCL_VALI := (frm_principal.x_data_trabalho+180);
        inCL_DTCA := frm_principal.x_data_trabalho;
        inCL_DSPC := inCL_DTCA;
        inCL_QTDC := 0;
        inCL_TIME := frm_principal.x_data_trabalho;
        inCL_LOJA := cdLoja; {loja do primeiro contrato}
        Insert;

        with (frm_principal) do
          GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
            MODULE_CLIENTE_CONTRATO,'ICLI',strtoint(codigo),'','');
        frm_principal.ExibirDica (' Cliente cadastrado com sucesso...',5);
        if (Modo=0) then
        begin
          pnTipoCad1.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
          pnTipoCad2.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
          pnTipoCad3.caption := Trim(edtNome.text)+' << PRIMEIRO CONTRATO';
          CodigoInclusaoCliente:=0;
          with (frm_f8Clientes) do
            ds.dataset.close;
          fichario.activepage:=pagina3;
          Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
          Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
          edtContrato.setfocus;
        end
        else
        begin
          HabilitaMenuCliente (true,false,false,false,true,false,true,true);
          CodigoInclusaoCliente:=0;
          Incluircliente1.click;
          with (frm_f8Clientes) do
            ds.dataset.close;
        end;
      end
      else
      begin
        if (Trim(pnQtdc.caption)<>'') then
          inCL_QTDC := strtofloat(Trim(pnQtdc.caption));
        if (Trim(pnUltc.caption)<>'') then
          inCL_ULTC := strtodate(Trim(pnUltc.caption));
        if (inCL_ULTC<>strtodate('01/01/1900')) then
          inCL_VALI := (inCL_ULTC+180);
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
        UpdateAll;

        frm_principal.ExibirDica (' Cadastro do cliente alterado com sucesso...',5);
        if (antNome<>inCL_NOME) then
          with (frm_f8Clientes) do
            ds.dataset.close;
        with (frm_principal) do
          GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
            MODULE_CLIENTE_CONTRATO,'ACLI',strtoint(codigo),'','');
        if (Modo=1) then
        begin
          HabilitaMenuCliente (true,false,true,true,true,true,true,true);
          fichario.activepage:=pagina1;
          edtCodigo.setfocus;
        end
        else
        begin
          fichario.activepage:=pagina3;
          Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
          Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
          edtContrato.setfocus;
        end;
      end;
      desconect;
      Free;
    end;
  end;
end;

{Botao de salvamento de cliente}
{botao de saida do formulario}
procedure Tfrm_edtCliente2.botao_sair2Click(Sender: TObject);
begin
  SAIR1.click;
end;

{Botao de salvamento ***}
procedure Tfrm_edtCliente2.btnSalvar1Click(Sender: TObject);
begin
  if (Modo=0) then
    Salvarocontrato1.click
  else
  if (Modo=2) then
    Salvarcontrato1.click;
end;

procedure Tfrm_edtCliente2.botao_sairClick(Sender: TObject);
begin
  SAIR1.click;
end;

{Opcao de avanco no cadastro ***}
procedure Tfrm_edtCliente2.Prosseguecadastro1Click(Sender: TObject);
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
      if (Modo=0) then
      begin
        fichario.activepage:=pagina3;
        edtContrato.setfocus;
      end;
      if (Modo=1) then
      begin
        fichario.activepage:=pagina1;
        edtCpf.setfocus;
      end;
    end
    else
    if (fichario.activepage=pagina3) then
      if (Modo=0) then
      begin
        fichario.activepage:=pagina1;
        edtCpf.setfocus;
      end;
end;

{Opcao de retorno no cadastro ***}
procedure Tfrm_edtCliente2.Retornacadastro1Click(Sender: TObject);
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
      if (Modo=0) then
      begin
        fichario.activepage:=pagina2;
        edtNomeEmp.setfocus;
      end;
    end
    else
    if (fichario.activepage=pagina1) then
    begin
      if (Modo=0) then
      begin
        fichario.activepage:=pagina3;
        edtContrato.setfocus;
      end;
      if (Modo=1) then
      begin
        fichario.activepage:=pagina2;
        edtNomeEmp.setfocus;
      end;
    end;
end;

{Evento ONENTER da pagina2}
procedure Tfrm_edtCliente2.pagina2Enter(Sender: TObject);
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

procedure Tfrm_edtCliente2.pagina1Enter(Sender: TObject);
begin
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=true;
    Salvarocontrato1.enabled:=false;
    Gerarcheques1.enabled:=false;
    Lancamentos.Items[0].ShortCut := ShortCut (K_F5,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (0,[]);
    edtCpf.setfocus;
  end;
end;

procedure Tfrm_edtCliente2.pagina3Enter(Sender: TObject);
begin
  if (Modo=0) then
  begin
    Salvarocliente1.enabled:=false;
    Salvarocontrato1.enabled:=true;
    Gerarcheques1.enabled:=true;
    Lancamentos.Items[0].ShortCut := ShortCut (0,[]);
    Lancamentos.Items[1].ShortCut := ShortCut (K_F5,[]);
    edtContrato.setfocus;
  end;
end;

{Opcao de salvamento de contrato ***}
procedure Tfrm_edtCliente2.Salvarocontrato1Click(Sender: TObject);
var
  clCheq: TClassCheque;
  clContrato: TClassContrato;
  clPrestCont,clPrest: TClassPrestContrat;
  clClie: TClassCliente;
  lin: Integer;
  codcli,codigo: String;
  flagcli: Boolean;
  valor1,valor2,total2: Real;
  codloja,banco_anterior,numero: Real;
  contrato,agencia_anterior: String;
begin
     {CRITICA DOS DADOS ***}
  codigo := Trim(edtContrato.text);
  if (Trim(edtValEntrada.text)<>'') then
    valor2 := strtofloat(RetiraFormatacaoNumero(Trim(edtValEntrada.text)))
  else
    valor2 := 0.00;
  if (Trim(edtValMerc.text)<>'') then
    valor1 := strtofloat(RetiraFormatacaoNumero(Trim(edtValMerc.text)))
  else
    valor1 := 0.00;
  if (codigo<>'') then
  begin
    if (Trim(edtLoja.text)<>'') then
      codloja:=strtofloat(Trim(edtLoja.text))
    else
    begin
      codloja:=cdloja;
      edtLoja.text:=form_nz(cdLoja,3);
    end;
    if ((codloja=0)) then
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
      Mudaralojaedatadocontraot1.click;
      if (cdCliente<>0) then
        Salvarocontrato1.click;
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
    else
      try
           {inicio da transacao ***}
        frm_principal.servidor1.starttransaction;

           {1- Verificando se o cliente é válido, se está/foi cadastrado}
        flagcli:=true;
        if (Modo=0) then
          with (clClie) do
          begin
            clClie := TClassCliente.Create;
            conect   ('CREDITO',self);
            ClearSql;
            AddParam ('Select CL_CODI,CL_LOJA,CL_ALTE,CL_DULP  ');
            AddParam ('From CRECLI                             ');
            AddParam ('Where (CL_CODI='+inttostr(cdCliente)+') ');
            frm_principal.BarraDicas.caption:='Salvando o cliente...Aguarde!';
            frm_principal.refresh;
            if (Execute) then
              flagcli:=true
            else
            begin
              frmDialogo.ExibirMensagem ('O novo cliente não foi salvo!'
                ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
              flagcli:=false;
              fichario.activepage:=pagina1;
              edtCodigo.setfocus;
            end;
            desconect;
            Free;
          end;
        if (flagcli) then
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
            AddParam ('Select CR_CODI ');
            AddParam ('From   CRECTABR');
            AddParam ('Where  (CR_CODI='+codigo+') AND ');
            AddParam ('       (CR_CLIE='+inttostr(cdCliente)+') ');
            frm_principal.BarraDicas.caption:='Salvando o contrato...Aguarde!';
            frm_principal.refresh;
            if (not Execute) then
            begin
              inCR_PDEV := inCR_QPRE;
              inCR_CARN := '0';
              inCR_FICH := '0';
              inCR_BOLE := '0';
              Insert;
              if (Modo=2) then
                CodigoInclusaoContrato:=0;
              with (frm_principal) do
                GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                  MODULE_CLIENTE_CONTRATO,'ICON',strtoint(codigo),'','');
              boInsert:=true;
              RedefinirQtCompra (cdCliente);
            end
            else
            begin
                      {alterando o contrato}
              inCR_PDEV := (inCR_QPRE - antdifpdev); {...}
              inCR_CARN := result('CR_CARN');
              inCR_FICH := result('CR_FICH');
              inCR_BOLE := result('CR_BOLE');
              UpdateAll;
              with (frm_principal) do
                GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                  MODULE_CLIENTE_CONTRATO,'ACON',strtoint(codigo),'','');
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
              AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO, ');
              AddParam ('       PC_CCGC,PC_BANC,PC_NUME,PC_AGEN ');
              AddParam ('From   CREPRABR ');
              AddParam ('Where  (PC_CONT='+contrato+') AND ');
              AddParam ('       (PC_CLIE='+inttostr(cdCliente)+') ');
              AddParam ('Order  by PC_NPRE ');
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
            AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE ');
            AddParam ('From   CRECLI ');
            AddParam ('Where (CL_CODI='+inttostr(cdCliente)+') ');
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
              inPC_VALO := StrToFloat (RetiraFormatacaoNumero(Trim(grade_lancamentos.Cells[1,lin])));
              inPC_DVTO := StrToDate  (Trim(grade_lancamentos.Cells[2,lin]));
              inPC_FATO := StrToFloat (Trim(edtFator.text));
              inPC_TPRE := StrToFloat (Trim(edtNumParc.text));
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
                  if (Trim(edtLoja.text)='') then
                    inCH_LOJA := cdLoja
                  else
                    inCH_LOJA := strtofloat(Trim(edtLoja.text));
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

              {Finalizacao do cadastro ***}
          if (Modo=0) then
          begin
                   {No caso de plano de pgto. com cheque pre-datado ***}
            if (not PodeChamarCheques) then
            begin
              PodeChamarCheques:=true;
              if (cdCheq=1) then
              begin
                Application.CreateForm(Tfrm_Aux2Contrato_demo, frm_Aux2Contrato_demo);
                with (frm_Aux2Contrato_demo) do
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
                  btnImpCarnet.click;
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
                  Application.CreateForm(Tfrm_Aux2Contrato_demo, frm_Aux2Contrato_demo);
                  with (frm_Aux2Contrato_demo) do
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
                    btnImpCarnet.click;
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
            frm_edtCliente.close;
        end;

        frm_principal.servidor1.commit;
           {--- fim da transcao ---}
      except
           {tratamento da excecao gerada}
        frm_principal.servidor1.rollback;
        frmDialogo.ExibirMensagem ('Ocorreu um erro inesperado na tentativa de salvar o contrato!'
          ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      end;
  end;
end;

{Opcao de novo contrato}
procedure Tfrm_edtCliente2.Novocontrato1Click(Sender: TObject);
begin
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
    CodigoInclusaoCliente := Round(MaxiCod2 ('CRECLI',frm_principal.barraDicas));
  edtCodigo.text:=form_nz(CodigoInclusaoCliente,6);
  edtCpf.text   :='';
  fichario.activepage:=pagina1;
  edtCodigo.setfocus;
  edtCodigo.setfocus;
end;

procedure Tfrm_edtCliente2.edtCodigoDblClick(Sender: TObject);
begin
  with (frm_f8Clientes) do
  begin
    edit:=edtCodigo;
    btnCadastro.visible:=false;
    showmodal;
    btnCadastro.visible:=true;
  end;
end;

procedure Tfrm_edtCliente2.edtCodAvalDblClick(Sender: TObject);
begin
  with (frm_f8Avalistas) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodAval;
    btnCadastro.visible:=false;
    showmodal;
  end;
end;

{Navegacao - Formatacao}
{Controle de mudanca de ficha}
procedure Tfrm_edtCliente2.ficharioChange(Sender: TObject);
begin
  if (Modo=0) then
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
  if (Modo=1) then
    if (fichario.activepage=pagina3) then
      fichario.activepage:=pagina1;
  if (Modo=2) then
    if (fichario.activepage=pagina1) or (fichario.activepage=pagina2) then
      fichario.activepage:=pagina3;
end;

procedure Tfrm_edtCliente2.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_edtCliente2.btnSalvar2Click(Sender: TObject);
begin
  Salvarocliente1.click;
end;

{Opcao de inclusao do cliente ***}
procedure Tfrm_edtCliente2.Incluircliente1Click(Sender: TObject);
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CLIENTE_CONTRATO, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
  begin
    HabilitaMenuCliente (false,true,false,true,true,false,true,true);
    if (CodigoInclusaoCliente=0) then
      CodigoInclusaoCliente := Round(MaxiCod2 ('CRECLI',frm_principal.barraDicas));
    LimparEdits (1);
    LimparEdits (2);
    edtCodigo.text := form_nz (CodigoInclusaoCliente,6);
    edtCpf.text := '';
    fichario.activepage:=pagina1;
    edtCodigo.setfocus;
  end;
end;

{Opcao de cancelamento da inclusao do cliente}
procedure Tfrm_edtCliente2.Cancelarinclusaocliente1Click(Sender: TObject);
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
procedure Tfrm_edtCliente2.Exclusaodocliente1Click(Sender: TObject);
{var
clClie: TClassCliente;
codigo: string;}
begin
  frmDialogo.ExibirMensagem (' O cliente não pode ser excluído neste ponto do sistema! '
    ,'Data de nascimento',[mbOK]
    ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);

     {if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CLIENTE_CONTRATO, 'E')) then
        frm_principal.ExibirDica ('Operação não permitida...',5)
     else
     begin
        codigo:=Trim(edtCodigo.text);
        if (codigo<>'') then
        begin
          with (clClie) do
          begin
            if (frmDialogo.ExibirMensagem ('Confirma exclusão do cliente?'
                ,'Exclusão do cliente',[mbYes,mbNo]
                ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
            begin
              clClie := TClassCliente.Create;
              conect ('CREDITO', self);
              ClearSql;
              AddParam ('Delete from CRECLI ');
              AddParam ('Where (CL_CODI='+codigo+')');
              Execute;
              desconect;
              Free;
              with (frm_f8Clientes) do
                   ds.dataset.close;
              HabilitaMenuCliente (true,false,false,false,true,false,true,true);
              LimparEdits (1);
              LimparEdits (2);
              edtCpf.text := '';
              edtCodigo.text:='';
              with (frm_principal) do
                 GravaLog (x_codigousuario,frm_principal.x_data_trabalho,Copy(timetostr(time),1,5),
                           MODULE_CLIENTE_CONTRATO,'ECLI',strtoint(codigo),'','');
              frm_principal.ExibirDica ('Cliente excluído com sucesso!',5);
            end;
            fichario.activepage:=pagina1;
            edtCodigo.setfocus;
          end;
        end;
     end;}
end;

{Opcao de limpeza do cadastro do cliente}
procedure Tfrm_edtCliente2.Limparcadastro1Click(Sender: TObject);
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
procedure Tfrm_edtCliente2.HabilitaMenuCliente
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
procedure Tfrm_edtCliente2.SAIR2Click(Sender: TObject);
begin
  SAIR1.click;
end;

{Opcao de salvamento do cliente ***}
procedure Tfrm_edtCliente2.Salvarcliente1Click(Sender: TObject);
begin
  Salvarocliente1.click;
end;

{Opcao de saida do contrato}
procedure Tfrm_edtCliente2.SAIR3Click(Sender: TObject);
begin
  SAIR1.click;
end;

{Opcao de inclusao do contrato}
procedure Tfrm_edtCliente2.Incluircontrato1Click(Sender: TObject);
var
  antpanel: String;
begin
  if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_CLIENTE_CONTRATO, 'I')) then
    frm_principal.ExibirDica ('Operação não permitida...',5)
  else
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
      end{procura pelo maximo cadastrado para o cliente ***};
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
  end{caso um cliente nao tenha sido definido ***};
end;

{Opcao de cancelamento de inclusao do contrato}
procedure Tfrm_edtCliente2.Cancelarinclusaocontrato1Click(Sender: TObject);
begin
  btnEdtGrade.enabled:=false;
  HabilitaMenuContrato (true,false,false,false,true,false,true,true);
  LimparEdits (3);
  edtContrato.text:='';
  edtContrato.setfocus;
end;

{Opcao de exclusao do contrato}
procedure Tfrm_edtCliente2.Exclusodocontrato1Click(Sender: TObject);
begin
  frmDialogo.ExibirMensagem (' Contrato não pode ser excluído neste ponto do sistema! '
    ,'Data de nascimento',[mbOK]
    ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

{Opcao de salvamento do contrato}
procedure Tfrm_edtCliente2.Salvarcontrato1Click(Sender: TObject);
begin
  Salvarocontrato1.click;
end;

{Opcao de limpeza do cadastro do contrato}
procedure Tfrm_edtCliente2.Limparcadastro2Click(Sender: TObject);
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
procedure Tfrm_edtCliente2.HabilitaMenuContrato
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
procedure Tfrm_edtCliente2.DefinirAtalhos (iModo: Integer);
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
    Formulario21.Items[0].ShortCut := ShortCut (K_F3,[]);
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
procedure Tfrm_edtCliente2.Outrosrelatrios1Click(Sender: TObject);
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
    end;
    left := 32;
    top  := 20;
    showmodal;
  end;
end;

{Outros relatorios para o cadastro dos contratos}
procedure Tfrm_edtCliente2.Outrosrelatrios2Click(Sender: TObject);
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
procedure Tfrm_edtCliente2.Imprimircontratoscadastrados1Click(
  Sender: TObject);
var
  clContrato: TClassContrato;
  totcont: Integer;
begin
     {Criando um acesso a classe}
  Mostra_mensagem ('Buscando contratos...Aguarde!');
  with (clContrato) do
  begin
    clContrato := TClassContrato.Create;
    conect ('CREDITO', self);
    AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_NOTA,CR_SERI,CR_PORT, ');
    AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_DNOT   ');
    AddParam ('From CRECTABR ');
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

        {inicializacoes}
    totcont := 0;
    clContrato.first;

        {cabecalhos}
    AddLine('Data do relatorio: '+form_data(frm_principal.x_data_trabalho));
    AddLine(form_tc('-',80,'-'));
    AddLine('Código Nota/Fiscal     Total       Entrada  Prest  Juros  Plan  Loja Data');
    AddLine(form_tc('-',80,'-'));
    while (not clContrato.eof) do
    begin
      AddLine (form_nz   (clContrato.Result('CR_CODI'),6)+' '+
        form_t    (clContrato.Result('CR_NOTA'),10)+'-'+
        form_t    (clContrato.Result('CR_SERI'),2)+' '+
        form_nc   (clContrato.Result('CR_TOTA'),10)+'  '+
        form_nc   (clContrato.Result('CR_VENT'),10)+'  '+
        form_nz   (clContrato.Result('CR_QPRE'),3)+' '+
        form_nc   (clContrato.Result('CR_FATO'),6)+'   '+
        form_nz   (clContrato.Result('CR_PLAN'),3)+'   '+
        form_nz   (clContrato.Result('CR_LOJA'),3)+'  '+
        form_data (clContrato.Result('CR_DNOT')));
      totcont := totcont + 1;
      clContrato.next;
    end;
    AddLine(form_tc('-',80,'-'));
    AddLine('Total de contratos ---> '+form_nz (totcont,3));
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
  clContrato.desconect;
  clContrato.Free;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnIncluir2Click(Sender: TObject);
begin
  Incluircliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnCancelainclusao2Click(Sender: TObject);
begin
  Cancelarinclusaocliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnExcluir2Click(Sender: TObject);
begin
  Exclusaodocliente1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnImpIndiv2Click(Sender: TObject);
begin
  Imprimirclienteindividual1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnImprimir2Click(Sender: TObject);
begin
  Imprimirclientescadastrados1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnIncluir1Click(Sender: TObject);
begin
  Incluircontrato1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnCancelainclusao1Click(Sender: TObject);
begin
  Cancelarinclusaocontrato1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnExcluir1Click(Sender: TObject);
begin
  Exclusodocontrato1.click;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.btnImprimir1Click(Sender: TObject);
begin
  Imprimircontratoscadastrados1.click;
end;

{Opcao de impressao dos clientes cadastrados ***}
procedure Tfrm_edtCliente2.Imprimirclientescadastrados1Click(
  Sender: TObject);
var
  clClie: TClassCliente;
  totclie: Integer;
  cnpj: String;
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
      AddLine (form_nz   (clClie.Result('CL_CODI'),6)  +' '+
        form_nz   (clClie.Result('CL_LOJA'),2)  +' '+
        form_t    (clClie.Result('CL_NOME'),28) +' '+
        form_t    (clClie.Result('CL_PDC'),4)   +'     '+
        form_t    (clClie.Result('CL_ENDE'),29) +' '+
        form_t    (clClie.Result('CL_FONE'),11) +' '+
        form_data (clClie.Result('CL_DTNA'))    +' '+
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
procedure Tfrm_edtCliente2.PreencheEditsContrato (classe: TClassContrato);
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
    edtNotaFiscal.text := Result('CR_NOTA');
    edtSerieNota.text  := Result  ('CR_SERI');
    if (Result('CR_PORT')<>0) then
      edtPortador.text   := form_nz (Result('CR_PORT'),4)
    else
      edtPortador.text   :='';
    edtValMerc.text    := form_nc (Result('CR_TOTA')+Result('CR_VENT'),10);
    edtValEntrada.text := form_nc (Result('CR_VENT'),10);
    pnTotalDevido.caption := form_nc(Result('CR_TOTA'),10);
    edtPlano.text      := form_nz (Result('CR_PLAN'),3);
    edtNumParc.text    := form_nz (Result('CR_QPRE'),2);
    edtFator.text      := form_nc (Result('CR_FATO'),6);
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
    with (frm_EdtCliente2) do
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
        AddParam ('Select PL_CODI,PL_TIPO,PL_CHEQ,PL_CARN,PL_LOCA  ');
        AddParam ('From CREDPLANO                                  ');
        AddParam ('where (PL_CODI='+codplano+')                    ');
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
function Tfrm_edtCliente2.PreencheGradeContrato (cliente,contrato: Real):Boolean;
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
          lbl_cpf.caption := 'Cpf/Cgc do cliente: '+form_t(Result('PC_CCGC'),14);
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
procedure Tfrm_edtCliente2.Imprimircontratoindividual1Click(
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
        AddParam ('Select CR_CODI,CR_CLIE,CR_LOJA,CR_NOTA,CR_SERI,CR_PORT,CR_AVAL, ');
        AddParam ('       CR_TOTA,CR_VENT,CR_PLAN,CR_QPRE,CR_PDEV,CR_FATO,CR_DNOT ');
        AddParam ('From   CRECTABR ');
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
procedure Tfrm_edtCliente2.cbEstadoExit(Sender: TObject);
begin
  cbEstado.text := UpperCase(cbEstado.text);
end;

{A tela de cheques so pode ser chamada no caso de Contrato com plano
de pgto. com cheques pre-datados ***}
procedure Tfrm_edtCliente2.Gerarcheques1Click(Sender: TObject);
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
              Application.CreateForm(Tfrm_Aux2Contrato_demo, frm_Aux2Contrato_demo);
              with (frm_Aux2Contrato_demo) do
                try
                  frm_principal.servidor1.starttransaction;
                  showmodal;
                  Free;
                  frm_principal.servidor1.commit;
                except
                  frm_principal.servidor1.RollBack;
                  frmDialogo.ExibirMensagem ('Ocorreu um erro inesperado na tentativa de salvar os cheques!'
                    ,'Salvar cheques',[mbOk],'',250,200);
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

procedure Tfrm_edtCliente2.edtCodigoExit(Sender: TObject);
begin
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
procedure Tfrm_edtCliente2.edtPortadorDblClick(Sender: TObject);
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
procedure Tfrm_edtCliente2.edtPlanoDblClick(Sender: TObject);
begin
  with (frm_f8Planos) do
  begin
    edit:=edtPlano;
    btnCadastro.visible:=true;
    showmodal;
  end;
end;

{Opção de impressão individual do cadastro do cliente ***}
procedure Tfrm_edtCliente2.Imprimirclienteindividual1Click(Sender: TObject);
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
procedure Tfrm_edtCliente2.btnEdtGradeClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') then
    if (ContratoSendoPago(cdCliente,strtofloat(Trim(edtContrato.text)))) then
    begin
      frmDialogo.ExibirMensagem ('O contrato não pode ser alterado porque seu pagamento já foi iniciado!'
        ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
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
      btnRetornar2.enabled:=false;
      btnIncluir1.enabled:=false;
      btnCancelainclusao1.enabled:=false;
      btnExcluir1.enabled:=false;
      btnSalvar1.enabled:=false;
      btnImpCarnet.enabled:=false;
      botao_sair2.enabled:=false;
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
      Formulario11.enabled:=false;
    end{CRITICA À EDICAO DA GRADE};
end;

{Botao de cancelamento das alteracoes na grade ***}
procedure Tfrm_edtCliente2.btnCancelGradeClick(Sender: TObject);
begin
  btnEdtGrade.enabled    := true;
  btnCancelGrade.enabled := false;
  btnSalvarGrade.enabled := false;
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
  edtFator.enabled:=true;
  edtLoja.enabled:=true;
  edtDatContrato.enabled:=true;
  btnGerarPrestacoes.enabled:=true;
  btnRetornar2.enabled:=true;
  btnIncluir1.enabled:=true;
  btnCancelainclusao1.enabled:=true;
  btnExcluir1.enabled:=true;
  btnSalvar1.enabled:=true;
  btnImpCarnet.enabled:=true;
  botao_sair2.enabled:=true;
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
procedure Tfrm_edtCliente2.btnSalvarGradeClick(Sender: TObject);
var
  clCheq: TClassCheque;
  clPrestContrat,clPrest: TClassPrestContrat;
  clClie: TClassCliente;
  codcli,codigo,contrato: String;
  fator,total2,total,banco_anterior,numero: Real;
  agencia_anterior: String;
  lin: Integer;
  flagTotal,flagNPrest: Boolean;
begin
     {CRITICA AOS DADOS--}
     {1a. critica - verificando se o total bate com o valor financiado}
     {Somente se o juros for igual a zero}
  if (Trim(edtFator.text)<>'') then
    fator:=strtofloat(RetiraFormatacaoNumero(Trim(edtFator.text)))
  else
    fator:=0.00;
  flagTotal:=true;
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
        flagTotal:=false;
        grade_lancamentos.row:=1;
        grade_lancamentos.col:=1;
        grade_lancamentos.setfocus;
      end;
    end
    else
      flagTotal:=true;
  end;
     {2a. critica - Total de prestacoes de cheques deve ser igual ao do contrato,
       em caso de alteracao pre-matura}
  flagNPrest:=true;
  if ((grade_lancamentos.rowcount-1)<>
    NumParcContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) and
    (ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text)))) then
  begin
    flagNPrest:=false;
    frmDialogo.ExibirMensagem ('Em contratos de cheque, o total de prestações não pode ser alterado!'
      ,'Salvar contrato',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    btnCancelGrade.click;
  end
  else
    flagNPrest:=true;

     {******* --- Salvamento das alteracoes feitas na grade --->}
  if (flagTotal) and (flagNPrest) then
  begin
         {Configuracoes de tela}
    btnEdtGrade.enabled:=true;
    btnCancelGrade.enabled:=false;
    btnSalvarGrade.enabled:=false;
    grade_lancamentos.options:=[goFixedVertLine, goFixedHorzLine, goVertLine,
      goHorzLine, goRangeSelect];

         {Buscando dados do cliente ***}
    try
            {inicio da transacao ***}
      frm_principal.servidor1.starttransaction;

            {buscando as prestacoes para, entao, buscar os cheques, caso existam ***}
            {Os cheques serao apagados ***}
      banco_anterior   := 0;
      agencia_anterior := '';
      clPrest := TClassPrestContrat.Create;
      contrato:=Trim(edtContrato.text);
      with (clPrest) do
      begin
        conect ('CREDITO',self);
        ClearSql;
        AddParam ('Select PC_CLIE,PC_CONT,PC_NPRE,PC_VALO,PC_FATO,PC_DVTO, ');
        AddParam ('       PC_CCGC,PC_BANC,PC_NUME,PC_AGEN ');
        AddParam ('From   CREPRABR ');
        AddParam ('Where  (PC_CONT='+contrato+') AND ');
        AddParam ('       (PC_CLIE='+inttostr(cdCliente)+') ');
        AddParam ('Order  by PC_NPRE ');
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
        AddParam ('Select CL_CODI,CL_CPF,CL_NOME,CL_FONE ');
        AddParam ('From   CRECLI ');
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
        AddParam ('Delete From CREPRABR ');
        AddParam ('Where (PC_CONT='+contrato+') AND (PC_CLIE='+codcli+') ');
        frm_principal.BarraDicas.caption:='Apagando as prestações...';
        frm_principal.refresh;
        Execute;
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
          inPC_FATO := StrToFloat (Trim(edtFator.text));
          inPC_TPRE := StrToFloat (Trim(edtNumParc.text));
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
              if (Trim(edtLoja.text)='') then
                inCH_LOJA := cdLoja
              else
                inCH_LOJA := strtofloat(Trim(edtLoja.text));
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

            {fim da transacao ---***}
      frm_principal.servidor1.commit;

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
      edtFator.enabled:=true;
      edtLoja.enabled:=true;
      edtDatContrato.enabled:=true;
      btnGerarPrestacoes.enabled:=true;
      btnRetornar2.enabled:=true;
      btnIncluir1.enabled:=true;
      btnCancelainclusao1.enabled:=true;
      btnExcluir1.enabled:=true;
      btnSalvar1.enabled:=true;
      btnImpCarnet.enabled:=true;
      botao_sair2.enabled:=true;
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
    except
            {tratamento da excecao gerada}
      frm_principal.servidor1.rollback;
      frmDialogo.ExibirMensagem ('Ocorreu um erro inesperado na tentativa de salvar as prestações!'
        ,'Salvar prestações',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    end;

         {...
         if not ExisteContrato(cdCliente,strtofloat(Trim(edtContrato.text))) then}
    Salvarocontrato1.click;
  end;
end;

{Formatacao de mascara da grade ***}
procedure Tfrm_edtCliente2.grade_lancamentosGetEditMask(Sender: TObject;
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
procedure Tfrm_edtCliente2.FormKeyPress(Sender: TObject; var Key: Char);
begin
     {somente no cadastro do contrato---}
  if (fichario.activepage=pagina3) then
    if key='.' then
      key:=',';
end;

{Formatacao da grade ***}
procedure Tfrm_edtCliente2.grade_lancamentosDrawCell(Sender: TObject; Col,
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
procedure Tfrm_edtCliente2.grade_lancamentosSetEditText(Sender: TObject;
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

procedure Tfrm_edtCliente2.edtPortadorEnter(Sender: TObject);
begin
  TEdit(sender).selectall;
  lbF8.visible:=true;
  lbF8Mens.visible:=true;
  lbF8Mens.caption:='exibe portadores cadastrados';
  lbF82.visible:=true;
  lbF8Mens2.visible:=true;
  lbF8Mens2.caption:='exibe portadores cadastrados';
end;

procedure Tfrm_edtCliente2.edtPlanoEnter(Sender: TObject);
var
  dif,entrada,valor: Real;
  TotalPermitido: Real;
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
    end;

          {...}
    if (frm_principal.x_critica_limite) then
    begin
      TotalPermitido := InformaLimiteCredito(cdCliente);
      if (TotalPermitido<=0.00) then {limite negativo}
      begin
        frmDialogo.ExibirMensagem (' Cliente sem crédito! Compra não permitida!'
          ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        fichario.activepage:=pagina3;
        edtValEntrada.setfocus;
      end
      else
      if (dif>TotalPermitido) then
      begin
        frmDialogo.ExibirMensagem (' O total do financiamento não pode exceder o '+
          'limite de crédito de '+form_nc(TotalPermitido,10)+'! '
          ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',300,100);
        fichario.activepage:=pagina3;
        edtValEntrada.setfocus;
      end;
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

procedure Tfrm_edtCliente2.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.tag:=1;
  Salvarocliente1.enabled:=false;
  Salvarocontrato1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Salvarcliente1.enabled:=false;   
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCpfEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtNomeEnter(Sender: TObject);
var
  clAux: TClassCliente;
  critica1,critica2: Boolean;
begin
  TMaskEdit(Sender).selectall;

     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo}
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
        edtCpf.text;
      except
      end;
    end;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_edtCliente2.edtNascEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCepEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtEnderecoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtBairroEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCidadeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.cbEstadoEnter(Sender: TObject);
begin
  TComboBox(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtTelefoneEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCelularEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtFaxEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtEmailEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtIdentidadeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtOrgExpedEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.cbEstadoCivilEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtConjugeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtPaiEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtMaeEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtNomeEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCargoEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtEndEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtAdmissaoEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtTelEmpEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtCartProfEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtSalarioEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtLimCredEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtRef1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtTelRef1Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtRef2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtTelRef2Enter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtObsEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtContratoEnter(Sender: TObject);
begin
  Salvarocliente1.enabled:=false;
  Salvarocontrato1.enabled:=false;
  Exclusaodocliente1.enabled:=false;
  Exclusodocontrato1.enabled:=false;
  Salvarcontrato1.enabled:=false;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtNotaFiscalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtSerieNotaEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtValMercEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtValEntradaEnter(Sender: TObject);
begin
     {CRITICAS DE CAMPO ANTERIOR ***}
  if (Trim(edtValMerc.text)='0,00') then
  begin
    frmDialogo.ExibirMensagem ('Total do contrato não pode ficar nulo!'
      ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina3;
    edtValMerc.setfocus;
  end;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtNumParcEnter(Sender: TObject);
begin
     {CRITICA AOS CAMPOS ANTERIORES ***}
  if (Trim(edtPlano.text)='')  or (Trim(edtPlano.text)='0') then
  begin
    frmDialogo.ExibirMensagem (' O código do plano não pode ficar nulo! '
      ,'Financiamento',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    fichario.activepage:=pagina3;
    edtPlano.setfocus;
  end;
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtFatorEnter(Sender: TObject);
var
  parc: Integer;
begin
     {criticando o numero de parcelas}   
  if (Trim(edtNumParc.text)<>'') then
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
  TMaskEdit(Sender).selectall;
end;

{Navegacao-}
procedure Tfrm_edtCliente2.Editarvalores1Click(Sender: TObject);
begin
  if (btnEdtGrade.enabled) then
    btnEdtGrade.click;
end;

{navegacao-}
procedure Tfrm_edtCliente2.Cancelarediodevalores1Click(Sender: TObject);
begin
  if (btnCancelGrade.enabled) then
    btnCancelGrade.click;
end;

{navegacao-}
procedure Tfrm_edtCliente2.Salvarvaloreseditados1Click(Sender: TObject);
begin
  if (btnSalvarGrade.enabled) then
    btnSalvarGrade.click;
end;

{navegacao-}
procedure Tfrm_edtCliente2.Editarvalores2Click(Sender: TObject);
begin
  Editarvalores1.click;
end;

{navegacao-}
procedure Tfrm_edtCliente2.Cancelarediodevalores2Click(Sender: TObject);
begin
  Cancelarediodevalores1.click;
end;

{navegacao-}
procedure Tfrm_edtCliente2.Salvarvaloreseditados2Click(Sender: TObject);
begin
  Salvarvaloreseditados1.click;
end;

procedure Tfrm_edtCliente2.edtSpcEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
  regspc:=Trim(edtSpc.text);
end;

procedure Tfrm_edtCliente2.edtCFunEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtTProEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtSpcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtCfun.setfocus;
  if (key=38) then
    edtPDC.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Registro no SPC. Informa se o cliente está no SPC ou não. Até 01 caractere. ',10);
end;

procedure Tfrm_edtCliente2.edtCFunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtTPro.setfocus;
  if (key=38) then
    edtSpc.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Cheque sem fundo. Informa se o cliente tem cheque sem fundo ou não. ',10);
end;

procedure Tfrm_edtCliente2.edtTProKeyDown(Sender: TObject; var Key: Word;
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
procedure Tfrm_edtCliente2.FormCreate(Sender: TObject);
begin
  flagEditCheq:=false;
end;

{Verificando se pode editar ou nao a coluna de cheques ***}
{Tudo vai depender do plano de pgto. ***}
procedure Tfrm_edtCliente2.grade_lancamentosKeyPress(Sender: TObject;
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

procedure Tfrm_edtCliente2.Relatriode1Click(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    RelatorioLiquidado (Trim(edtCodigo.text),2)
end;

procedure Tfrm_edtCliente2.Posiofinanceiracontratosemaberto1Click(
  Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
    RelatorioEmAberto (Trim(edtCodigo.text),2)
end;

procedure Tfrm_edtCliente2.Consultadecheques1Click(Sender: TObject);
begin
  if (Trim(edtCodigo.text)<>'') then
  begin
    Application.CreateForm(Tfrm_ConsCheq,frm_ConsCheq);
    with (frm_ConsCheq) do
    begin
      show;
      bringtofront;
      pnCabec.enabled:=false;
      edtCodigo.text:=Trim(frm_edtCliente2.edtCodigo.text);
      pnCliente.caption:=Trim(edtNome.text);
      btnExecutar.click;
      pnCabec.enabled:=true;
    end;
  end;
end;

procedure Tfrm_edtCliente2.btnHistClick(Sender: TObject);
begin
  PopUpMenuHistorico.popup(100,550);
end;

{Botao de impressao de carnet ***}
{Este botao so sera ativado para planos com carnet ***}
procedure Tfrm_edtCliente2.btnImpCarnetClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') then
    if (cdCarn=1) then
    begin
      Application.CreateForm(Tfrm_EmisCarnet2, frm_EmisCarnet2);
      with (frm_EmisCarnet2) do
      begin
        caption := frm_principal.x_sistema+' - '+LB_EMIS_CARNET;
        if (cdCliente=0) then
          edtCliente.text:=inttostr(auxCliente)
        else
          edtCliente.text:=inttostr(cdCliente);
        if (Trim(edtContrato.text)='') then
          edtContrato.text:=inttostr(auxContrato)
        else
          edtContrato.text:=Trim(edtContrato.text);
        edtCliente.enabled:=false;
        edtContrato.enabled:=false;
        Modo:=1;
        showmodal;
        Free;
      end;
      cdCarn:=0;
    end
    else
      frmDialogo.ExibirMensagem ('O carnet não pode ser impresso para este plano!'
        ,'Imprimir carnet',[mbOk]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

{Navegacao na grade -Baseado em <ENTER>}
procedure Tfrm_edtCliente2.grade_lancamentosKeyDown(Sender: TObject;
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
            btnSalvarGrade.click;
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
          btnSalvarGrade.click;
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
        btnSalvarGrade.click;
    end;
end;

{Controle de teclas do formulario ***}
procedure Tfrm_edtCliente2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    if (frmDialogo.ExibirMensagem ('Confirma saída do formulário de clientes e contratos?'
      ,'Processamento',[mbYes,mbNo],
      frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      close;
end;

procedure Tfrm_edtCliente2.edtPDCEnter(Sender: TObject);
begin
  edtPDC.selectall;
end;

procedure Tfrm_edtCliente2.edtPDCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=K_BAIXO) then
    edtSpc.setfocus;
  if (key=38) then
    edtObs.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('  Registro de PDC do cliente. ',10);
end;

{navegacao----}
procedure Tfrm_edtCliente2.edtSexoEnter(Sender: TObject);
var
  clAux: TClassCliente;
  nome,primeironome: String;
  critica1,critica2: Boolean;
begin
     {critica do CPF/CNPJ *** - Verificando se ja existe alguem com o mesmo}
  critica1:=false;
  critica2:=false;
  if (Trim(edtNome.text)<>'') then
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
    clAux.AddParam ('Where (CL_NOME='+chr(39)+Trim(edtNome.text)+chr(39)+') ');
    if (clAux.Execute) then
      critica1:=true;
    if (critica1) and (critica2) then
    begin
      frmDialogo.ExibirMensagem (' Já existe cliente cadastrado com este nome: '+
        'Cliente: '+form_nz(clAux.result('CL_CODI'),6)+'/'+form_t(clAux.result('CL_NOME'),40)
        ,'Nome',[mbOK]
        ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
      try
        fichario.activepage:=pagina1;
        edtNome.text;
      except
      end;
    end;
    clAux.desconect;
    clAux.Free;
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

procedure Tfrm_edtCliente2.edtSexoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNasc.setfocus;
  if (key=38) then
    edtNome.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Sexo do cliente; Até 20 caracteres. ',10);
end;

procedure Tfrm_edtCliente2.edtSexoChange(Sender: TObject);
begin
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

procedure Tfrm_edtCliente2.edtContratoExit(Sender: TObject);
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
procedure Tfrm_edtCliente2.edtSpcExit(Sender: TObject);
begin
  if (Trim(edtSpc.text)='') then
    edtSpc.text:='N';
end;

{navegacao-}
procedure Tfrm_edtCliente2.edtCFunExit(Sender: TObject);
begin
  if (Trim(edtCfun.text)='') then
    edtCfun.text:='N';
end;

{navegacao-}
procedure Tfrm_edtCliente2.edtTProExit(Sender: TObject);
begin
  if (Trim(edtTPro.text)='') then
    edtTPro.text:='N';
end;

procedure Tfrm_edtCliente2.edtRamalEnter(Sender: TObject);
begin
  TMaskEdit(Sender).selectall;
end;

procedure Tfrm_edtCliente2.edtRamalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtCartProf.setfocus;
  if (key=38) then
    edtTelEmp.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Ramal do Fone do trabalho do cliente: Digite até 5 digitos numéricos não obrigatórios. ',15);
end;

{navegacao--}
procedure Tfrm_edtCliente2.edtLojaEnter(Sender: TObject);
begin
  if (Trim(edtLoja.text)='') then
    edtLoja.text:=form_nz(cdLoja,3);
  TMaskEdit(Sender).selectall;
end;

{navegacao--}
procedure Tfrm_edtCliente2.edtDatContratoEnter(Sender: TObject);
begin
  if (edtDatContrato.text='  /  /    ') then
    edtDatContrato.text:=datetostr(datacontrato);
  TMaskEdit(Sender).selectall;
end;

{navegacao--}
procedure Tfrm_edtCliente2.edtDatContratoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=13) or (key=40) then
    edtNotaFiscal.setfocus;
  if (key=38) then
    edtLoja.setfocus;
  if (key=K_F1) then
    frm_principal.ExibirDica ('   Data do contrato:  formato 99/99/9999',10);
end;

{navegacao--}
procedure Tfrm_edtCliente2.edtLojaKeyDown(Sender: TObject; var Key: Word;
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
procedure Tfrm_edtCliente2.edtDatContratoExit(Sender: TObject);
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
procedure Tfrm_edtCliente2.edtLojaExit(Sender: TObject);
begin
  if (Trim(edtLoja.text)<>'') then
    edtLoja.text:=form_nz(strtofloat(Trim(edtLoja.text)),3);
end;

{Verifica se o CONTRATO é de plano de cheque ***}
function Tfrm_edtCliente2.ContratoEdeCheque (cliente,contrato: Real):Boolean;
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
function Tfrm_edtCliente2.ContratoSendoPago (cliente,contrato: Real):Boolean;
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

procedure Tfrm_edtCliente2.edtNomeChange(Sender: TObject);
begin
  edtSexo.text:='';
end;

{Consulta especifica de credito do cliente ***}
procedure Tfrm_edtCliente2.btnConsultaClick(Sender: TObject);
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

procedure Tfrm_edtCliente2.edtCpfExit(Sender: TObject);
begin
  CriticaCNPJ(edtCpf);
end;

{Chamada da calculadora *******}
procedure Tfrm_edtCliente2.btnCalcClick(Sender: TObject);
var
  result: Integer;
begin
  if (not btnEdtGrade.enabled) then
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
end;

{Funcao que retorna o total de prestacoes "gravadas" no contrato}
function  Tfrm_edtCliente2.NumParcContrato (cliente,contrato: Real):Integer;
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
function  Tfrm_edtCliente2.ExisteContrato(cliente,contrato: Real):Boolean;
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

procedure Tfrm_edtCliente2.btnImpPropostaClick(Sender: TObject);
begin
  if (Trim(edtContrato.text)<>'') then
    if (not OperacaoPermitida(frm_principal.x_codigousuario, MODULE_PROPOSTA_CREDITO, 'U')) then
      frm_principal.ExibirDica ('Acesso não permitido...',5)
    else
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

{Verifica se a loja encontra-se no cadastro ou não ****}
function Tfrm_edtCliente2.LojaCadastrada(codLoja: Real):Boolean;
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
function Tfrm_edtCliente2.PlanoCadastrado(codPlano: String):Boolean;
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

procedure Tfrm_edtCliente2.edtEmailChange(Sender: TObject);
begin
  with (MailTo1) do
    MailAddress := Trim(edtEmail.text);
end;

procedure Tfrm_edtCliente2.ficharioChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (edtCodigo.tag=1) then
    AllowChange:=false
  else
  if (edtCodigo.tag=0) then
    AllowChange:=true;
end;

end.
