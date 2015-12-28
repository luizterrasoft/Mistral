unit CHECKCOMLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 08/11/2005 11:32:23 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\devjoao\CheckCOM\ReleaseMinDependency\CheckCOM.dll (1)
// LIBID: {AA888299-EF63-46D8-A461-50CA255CD2EC}
// LCID: 0
// Helpfile: 
// HelpString: CheckCOM 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TChkApplication) : Server D:\devjoao\CheckCOM\RELEAS~2\CheckCOM.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
//$VARPROPSETTER OFF
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CHECKCOMLibMajorVersion = 1;
  CHECKCOMLibMinorVersion = 0;

  LIBID_CHECKCOMLib: TGUID = '{AA888299-EF63-46D8-A461-50CA255CD2EC}';

  IID_IChkResponse: TGUID = '{C7845225-CFAF-423F-986D-E063FE82C43D}';
  CLASS_ChkResponse: TGUID = '{B8213C49-A6E6-4718-BD46-E5B2988FF475}';
  IID_IChkRequest: TGUID = '{A104D1EF-A652-4D26-B11E-F448902EF644}';
  CLASS_ChkRequest: TGUID = '{DF5E0C61-1E36-4B09-9411-A4FE1F5EBC0D}';
  IID_IChkRequestCheckFast: TGUID = '{D503DF57-236E-4805-A288-B155BBBFAB16}';
  CLASS_ChkRequestCheckFast: TGUID = '{D1D066AD-6931-49C7-84AA-9F88225AE5B3}';
  IID_IChkRequestCheckFastMais: TGUID = '{16E960BD-72FA-45A0-8571-6BAF1004F24D}';
  CLASS_ChkRequestCheckFastMais: TGUID = '{EB038C8A-23ED-4A64-BFD5-0FCEA257683E}';
  IID_IChkRequestCheckCheck: TGUID = '{2179974C-F9E3-48EB-9AF6-D0C49B2C0FEB}';
  CLASS_ChkRequestCheckCheck: TGUID = '{1E5EA6FD-43F4-48EA-8731-8300FE90EB94}';
  IID_IChkRequestCheckCadastro: TGUID = '{7C2F9D04-4A21-42AF-9825-2F742D9CF70C}';
  CLASS_ChkRequestCheckCadastro: TGUID = '{D5C6EB42-7598-4B67-9B26-226F441838A0}';
  IID_IChkRequestCheckPlus: TGUID = '{52409C36-F708-41D1-9E6E-399870C4738E}';
  CLASS_ChkRequestCheckPlus: TGUID = '{C87E5D01-94C8-4CFD-949E-9E4DBDCB2F87}';
  IID_IChkRequestCheckMaster: TGUID = '{CB82F780-15B9-4F57-A2EA-8302BE9F87A2}';
  CLASS_ChkRequestCheckMaster: TGUID = '{CAF002CD-3FCD-44D3-8BAB-BD7DE3257C15}';
  IID_IChkRequestCheckGold: TGUID = '{6627DBFA-C68B-41BB-B433-0E8C9947A8CD}';
  CLASS_ChkRequestCheckGold: TGUID = '{B2F7C568-C4E4-4C03-A3B9-B8F45B4376D2}';
  IID_IChkRequestLogin: TGUID = '{C94A32D6-08B2-4B57-B5BF-2BD07BAF71E4}';
  CLASS_ChkRequestLogin: TGUID = '{616AFF94-BA6C-4C33-A217-8D8B874010EA}';
  DIID__IChkServerEvents: TGUID = '{EA6C4BDC-F9A3-4EBD-8201-8D52935E7D6C}';
  IID_IChkServer: TGUID = '{0E7102D7-BF98-4BEA-A154-F2110A770AAB}';
  CLASS_ChkServer: TGUID = '{D831720B-E6FD-49A8-A7E5-B9CEF9F70350}';
  IID_IChkServerTCPIP: TGUID = '{19F3C64F-3623-4391-8575-75276F0FA66A}';
  CLASS_ChkServerTCPIP: TGUID = '{40098AC5-A078-4939-8D0A-9352583C7036}';
  IID_IChkServerPAC: TGUID = '{BBF4318C-0DC8-4BAD-ADB9-5F6FB1CD94C7}';
  CLASS_ChkServerPAC: TGUID = '{62382CD1-8BBF-4820-B654-1FDEFA01B4AC}';
  IID_IChkModem: TGUID = '{9ED9C234-E6ED-4436-82EE-CE26977EDAF1}';
  IID_IChkApplication: TGUID = '{E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}';
  CLASS_ChkApplication: TGUID = '{F28908A6-58BC-4F21-9436-23303444F704}';
  CLASS_ChkModem: TGUID = '{0C18D1A7-EAC6-4E0E-888D-EAF779E73064}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum _enChkProtocolo
type
  _enChkProtocolo = TOleEnum;
const
  P_SPCB = $00000000;
  P_ISO8583 = $00000001;
  P_ISO8583_X = $00000002;
  P_XML = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IChkResponse = interface;
  IChkResponseDisp = dispinterface;
  IChkRequest = interface;
  IChkRequestDisp = dispinterface;
  IChkRequestCheckFast = interface;
  IChkRequestCheckFastDisp = dispinterface;
  IChkRequestCheckFastMais = interface;
  IChkRequestCheckFastMaisDisp = dispinterface;
  IChkRequestCheckCheck = interface;
  IChkRequestCheckCheckDisp = dispinterface;
  IChkRequestCheckCadastro = interface;
  IChkRequestCheckCadastroDisp = dispinterface;
  IChkRequestCheckPlus = interface;
  IChkRequestCheckPlusDisp = dispinterface;
  IChkRequestCheckMaster = interface;
  IChkRequestCheckMasterDisp = dispinterface;
  IChkRequestCheckGold = interface;
  IChkRequestCheckGoldDisp = dispinterface;
  IChkRequestLogin = interface;
  IChkRequestLoginDisp = dispinterface;
  _IChkServerEvents = dispinterface;
  IChkServer = interface;
  IChkServerDisp = dispinterface;
  IChkServerTCPIP = interface;
  IChkServerTCPIPDisp = dispinterface;
  IChkServerPAC = interface;
  IChkServerPACDisp = dispinterface;
  IChkModem = interface;
  IChkModemDisp = dispinterface;
  IChkApplication = interface;
  IChkApplicationDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ChkResponse = IChkResponse;
  ChkRequest = IChkRequest;
  ChkRequestCheckFast = IChkRequestCheckFast;
  ChkRequestCheckFastMais = IChkRequestCheckFastMais;
  ChkRequestCheckCheck = IChkRequestCheckCheck;
  ChkRequestCheckCadastro = IChkRequestCheckCadastro;
  ChkRequestCheckPlus = IChkRequestCheckPlus;
  ChkRequestCheckMaster = IChkRequestCheckMaster;
  ChkRequestCheckGold = IChkRequestCheckGold;
  ChkRequestLogin = IChkRequestLogin;
  ChkServer = IChkServer;
  ChkServerTCPIP = IChkServerTCPIP;
  ChkServerPAC = IChkServerPAC;
  ChkApplication = IChkApplication;
  ChkModem = IChkModem;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWideString1 = ^WideString; {*}
  PUserType1 = ^_stChkDadosTransacao; {*}

  _stChkDadosTransacao = packed record
    tcProtocolo: _enChkProtocolo;
    szCodigo: array[0..6] of Shortint;
    szSenha: array[0..4] of Shortint;
    szSerial: array[0..6] of Shortint;
    szMeioAcesso: array[0..2] of Shortint;
    szEmail: array[0..50] of Shortint;
    szHistorico: array[0..1] of Shortint;
    szDetalhe: array[0..2] of Shortint;
    szBytesExtras: array[0..20] of Shortint;
  end;


// *********************************************************************//
// Interface: IChkResponse
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C7845225-CFAF-423F-986D-E063FE82C43D}
// *********************************************************************//
  IChkResponse = interface(IDispatch)
    ['{C7845225-CFAF-423F-986D-E063FE82C43D}']
    function Get_Buffer: WideString; safecall;
    function Get_BufferSize: Integer; safecall;
    property Buffer: WideString read Get_Buffer;
    property BufferSize: Integer read Get_BufferSize;
  end;

// *********************************************************************//
// DispIntf:  IChkResponseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C7845225-CFAF-423F-986D-E063FE82C43D}
// *********************************************************************//
  IChkResponseDisp = dispinterface
    ['{C7845225-CFAF-423F-986D-E063FE82C43D}']
    property Buffer: WideString readonly dispid 1;
    property BufferSize: Integer readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IChkRequest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A104D1EF-A652-4D26-B11E-F448902EF644}
// *********************************************************************//
  IChkRequest = interface(IDispatch)
    ['{A104D1EF-A652-4D26-B11E-F448902EF644}']
    function Get_IdTransacao: Smallint; safecall;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: _stChkDadosTransacao); safecall;
    property IdTransacao: Smallint read Get_IdTransacao;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A104D1EF-A652-4D26-B11E-F448902EF644}
// *********************************************************************//
  IChkRequestDisp = dispinterface
    ['{A104D1EF-A652-4D26-B11E-F448902EF644}']
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckFast
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D503DF57-236E-4805-A288-B155BBBFAB16}
// *********************************************************************//
  IChkRequestCheckFast = interface(IChkRequest)
    ['{D503DF57-236E-4805-A288-B155BBBFAB16}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckFastDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D503DF57-236E-4805-A288-B155BBBFAB16}
// *********************************************************************//
  IChkRequestCheckFastDisp = dispinterface
    ['{D503DF57-236E-4805-A288-B155BBBFAB16}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckFastMais
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {16E960BD-72FA-45A0-8571-6BAF1004F24D}
// *********************************************************************//
  IChkRequestCheckFastMais = interface(IChkRequest)
    ['{16E960BD-72FA-45A0-8571-6BAF1004F24D}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckFastMaisDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {16E960BD-72FA-45A0-8571-6BAF1004F24D}
// *********************************************************************//
  IChkRequestCheckFastMaisDisp = dispinterface
    ['{16E960BD-72FA-45A0-8571-6BAF1004F24D}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property DDD1: WideString dispid 13;
    property DDD2: WideString dispid 14;
    property Telefone1: WideString dispid 15;
    property Telefone2: WideString dispid 16;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckCheck
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2179974C-F9E3-48EB-9AF6-D0C49B2C0FEB}
// *********************************************************************//
  IChkRequestCheckCheck = interface(IChkRequest)
    ['{2179974C-F9E3-48EB-9AF6-D0C49B2C0FEB}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckCheckDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2179974C-F9E3-48EB-9AF6-D0C49B2C0FEB}
// *********************************************************************//
  IChkRequestCheckCheckDisp = dispinterface
    ['{2179974C-F9E3-48EB-9AF6-D0C49B2C0FEB}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property DDD1: WideString dispid 13;
    property DDD2: WideString dispid 14;
    property Telefone1: WideString dispid 15;
    property Telefone2: WideString dispid 16;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckCadastro
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7C2F9D04-4A21-42AF-9825-2F742D9CF70C}
// *********************************************************************//
  IChkRequestCheckCadastro = interface(IChkRequest)
    ['{7C2F9D04-4A21-42AF-9825-2F742D9CF70C}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_DDD3: WideString; safecall;
    procedure Set_DDD3(const pVal: WideString); safecall;
    function Get_DDD4: WideString; safecall;
    procedure Set_DDD4(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    function Get_Telefone3: WideString; safecall;
    procedure Set_Telefone3(const pVal: WideString); safecall;
    function Get_Telefone4: WideString; safecall;
    procedure Set_Telefone4(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property DDD3: WideString read Get_DDD3 write Set_DDD3;
    property DDD4: WideString read Get_DDD4 write Set_DDD4;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
    property Telefone3: WideString read Get_Telefone3 write Set_Telefone3;
    property Telefone4: WideString read Get_Telefone4 write Set_Telefone4;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckCadastroDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7C2F9D04-4A21-42AF-9825-2F742D9CF70C}
// *********************************************************************//
  IChkRequestCheckCadastroDisp = dispinterface
    ['{7C2F9D04-4A21-42AF-9825-2F742D9CF70C}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property DDD1: WideString dispid 12;
    property DDD2: WideString dispid 13;
    property DDD3: WideString dispid 14;
    property DDD4: WideString dispid 15;
    property Telefone1: WideString dispid 16;
    property Telefone2: WideString dispid 17;
    property Telefone3: WideString dispid 18;
    property Telefone4: WideString dispid 19;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckPlus
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {52409C36-F708-41D1-9E6E-399870C4738E}
// *********************************************************************//
  IChkRequestCheckPlus = interface(IChkRequest)
    ['{52409C36-F708-41D1-9E6E-399870C4738E}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    function Get_Banco: WideString; safecall;
    procedure Set_Banco(const pVal: WideString); safecall;
    function Get_Agencia: WideString; safecall;
    procedure Set_Agencia(const pVal: WideString); safecall;
    function Get_Conta: WideString; safecall;
    procedure Set_Conta(const pVal: WideString); safecall;
    function Get_ChequeInicial: WideString; safecall;
    procedure Set_ChequeInicial(const pVal: WideString); safecall;
    function Get_ChequeFinal: WideString; safecall;
    procedure Set_ChequeFinal(const pVal: WideString); safecall;
    function Get_Cmc7: WideString; safecall;
    procedure Set_Cmc7(const pVal: WideString); safecall;
    function Get_QuantidadeCmc7: Smallint; safecall;
    procedure Set_QuantidadeCmc7(pVal: Smallint); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
    property Banco: WideString read Get_Banco write Set_Banco;
    property Agencia: WideString read Get_Agencia write Set_Agencia;
    property Conta: WideString read Get_Conta write Set_Conta;
    property ChequeInicial: WideString read Get_ChequeInicial write Set_ChequeInicial;
    property ChequeFinal: WideString read Get_ChequeFinal write Set_ChequeFinal;
    property Cmc7: WideString read Get_Cmc7 write Set_Cmc7;
    property QuantidadeCmc7: Smallint read Get_QuantidadeCmc7 write Set_QuantidadeCmc7;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckPlusDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {52409C36-F708-41D1-9E6E-399870C4738E}
// *********************************************************************//
  IChkRequestCheckPlusDisp = dispinterface
    ['{52409C36-F708-41D1-9E6E-399870C4738E}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property Banco: WideString dispid 13;
    property Agencia: WideString dispid 14;
    property Conta: WideString dispid 15;
    property ChequeInicial: WideString dispid 16;
    property ChequeFinal: WideString dispid 17;
    property Cmc7: WideString dispid 18;
    property QuantidadeCmc7: Smallint dispid 19;
    property DDD1: WideString dispid 20;
    property DDD2: WideString dispid 21;
    property Telefone1: WideString dispid 22;
    property Telefone2: WideString dispid 23;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckMaster
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB82F780-15B9-4F57-A2EA-8302BE9F87A2}
// *********************************************************************//
  IChkRequestCheckMaster = interface(IChkRequest)
    ['{CB82F780-15B9-4F57-A2EA-8302BE9F87A2}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    function Get_Banco: WideString; safecall;
    procedure Set_Banco(const pVal: WideString); safecall;
    function Get_Agencia: WideString; safecall;
    procedure Set_Agencia(const pVal: WideString); safecall;
    function Get_Conta: WideString; safecall;
    procedure Set_Conta(const pVal: WideString); safecall;
    function Get_ChequeInicial: WideString; safecall;
    procedure Set_ChequeInicial(const pVal: WideString); safecall;
    function Get_ChequeFinal: WideString; safecall;
    procedure Set_ChequeFinal(const pVal: WideString); safecall;
    function Get_Cmc7: WideString; safecall;
    procedure Set_Cmc7(const pVal: WideString); safecall;
    function Get_QuantidadeCmc7: Smallint; safecall;
    procedure Set_QuantidadeCmc7(pVal: Smallint); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
    property Banco: WideString read Get_Banco write Set_Banco;
    property Agencia: WideString read Get_Agencia write Set_Agencia;
    property Conta: WideString read Get_Conta write Set_Conta;
    property ChequeInicial: WideString read Get_ChequeInicial write Set_ChequeInicial;
    property ChequeFinal: WideString read Get_ChequeFinal write Set_ChequeFinal;
    property Cmc7: WideString read Get_Cmc7 write Set_Cmc7;
    property QuantidadeCmc7: Smallint read Get_QuantidadeCmc7 write Set_QuantidadeCmc7;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckMasterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CB82F780-15B9-4F57-A2EA-8302BE9F87A2}
// *********************************************************************//
  IChkRequestCheckMasterDisp = dispinterface
    ['{CB82F780-15B9-4F57-A2EA-8302BE9F87A2}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property Banco: WideString dispid 13;
    property Agencia: WideString dispid 14;
    property Conta: WideString dispid 15;
    property ChequeInicial: WideString dispid 16;
    property ChequeFinal: WideString dispid 17;
    property Cmc7: WideString dispid 18;
    property QuantidadeCmc7: Smallint dispid 19;
    property DDD1: WideString dispid 20;
    property DDD2: WideString dispid 21;
    property Telefone1: WideString dispid 22;
    property Telefone2: WideString dispid 23;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestCheckGold
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6627DBFA-C68B-41BB-B433-0E8C9947A8CD}
// *********************************************************************//
  IChkRequestCheckGold = interface(IChkRequest)
    ['{6627DBFA-C68B-41BB-B433-0E8C9947A8CD}']
    function Get_CPFCNPJ: WideString; safecall;
    procedure Set_CPFCNPJ(const pVal: WideString); safecall;
    function Get_TipoPessoa: WideString; safecall;
    procedure Set_TipoPessoa(const pVal: WideString); safecall;
    function Get_Valor: WideString; safecall;
    procedure Set_Valor(const pVal: WideString); safecall;
    function Get_Banco: WideString; safecall;
    procedure Set_Banco(const pVal: WideString); safecall;
    function Get_Agencia: WideString; safecall;
    procedure Set_Agencia(const pVal: WideString); safecall;
    function Get_Conta: WideString; safecall;
    procedure Set_Conta(const pVal: WideString); safecall;
    function Get_ChequeInicial: WideString; safecall;
    procedure Set_ChequeInicial(const pVal: WideString); safecall;
    function Get_ChequeFinal: WideString; safecall;
    procedure Set_ChequeFinal(const pVal: WideString); safecall;
    function Get_Cmc7: WideString; safecall;
    procedure Set_Cmc7(const pVal: WideString); safecall;
    function Get_QuantidadeCmc7: Smallint; safecall;
    procedure Set_QuantidadeCmc7(pVal: Smallint); safecall;
    function Get_DDD1: WideString; safecall;
    procedure Set_DDD1(const pVal: WideString); safecall;
    function Get_DDD2: WideString; safecall;
    procedure Set_DDD2(const pVal: WideString); safecall;
    function Get_Telefone1: WideString; safecall;
    procedure Set_Telefone1(const pVal: WideString); safecall;
    function Get_Telefone2: WideString; safecall;
    procedure Set_Telefone2(const pVal: WideString); safecall;
    property CPFCNPJ: WideString read Get_CPFCNPJ write Set_CPFCNPJ;
    property TipoPessoa: WideString read Get_TipoPessoa write Set_TipoPessoa;
    property Valor: WideString read Get_Valor write Set_Valor;
    property Banco: WideString read Get_Banco write Set_Banco;
    property Agencia: WideString read Get_Agencia write Set_Agencia;
    property Conta: WideString read Get_Conta write Set_Conta;
    property ChequeInicial: WideString read Get_ChequeInicial write Set_ChequeInicial;
    property ChequeFinal: WideString read Get_ChequeFinal write Set_ChequeFinal;
    property Cmc7: WideString read Get_Cmc7 write Set_Cmc7;
    property QuantidadeCmc7: Smallint read Get_QuantidadeCmc7 write Set_QuantidadeCmc7;
    property DDD1: WideString read Get_DDD1 write Set_DDD1;
    property DDD2: WideString read Get_DDD2 write Set_DDD2;
    property Telefone1: WideString read Get_Telefone1 write Set_Telefone1;
    property Telefone2: WideString read Get_Telefone2 write Set_Telefone2;
  end;

// *********************************************************************//
// DispIntf:  IChkRequestCheckGoldDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {6627DBFA-C68B-41BB-B433-0E8C9947A8CD}
// *********************************************************************//
  IChkRequestCheckGoldDisp = dispinterface
    ['{6627DBFA-C68B-41BB-B433-0E8C9947A8CD}']
    property CPFCNPJ: WideString dispid 10;
    property TipoPessoa: WideString dispid 11;
    property Valor: WideString dispid 12;
    property Banco: WideString dispid 13;
    property Agencia: WideString dispid 14;
    property Conta: WideString dispid 15;
    property ChequeInicial: WideString dispid 16;
    property ChequeFinal: WideString dispid 17;
    property Cmc7: WideString dispid 18;
    property QuantidadeCmc7: Smallint dispid 19;
    property DDD1: WideString dispid 20;
    property DDD2: WideString dispid 21;
    property Telefone1: WideString dispid 22;
    property Telefone2: WideString dispid 23;
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// Interface: IChkRequestLogin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C94A32D6-08B2-4B57-B5BF-2BD07BAF71E4}
// *********************************************************************//
  IChkRequestLogin = interface(IChkRequest)
    ['{C94A32D6-08B2-4B57-B5BF-2BD07BAF71E4}']
  end;

// *********************************************************************//
// DispIntf:  IChkRequestLoginDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C94A32D6-08B2-4B57-B5BF-2BD07BAF71E4}
// *********************************************************************//
  IChkRequestLoginDisp = dispinterface
    ['{C94A32D6-08B2-4B57-B5BF-2BD07BAF71E4}']
    property IdTransacao: Smallint readonly dispid 3;
    procedure BuildTransactionPack(var bsPack: WideString; 
                                   var tcDadosTransacao: {??_stChkDadosTransacao}OleVariant); dispid 4;
  end;

// *********************************************************************//
// DispIntf:  _IChkServerEvents
// Flags:     (4096) Dispatchable
// GUID:      {EA6C4BDC-F9A3-4EBD-8201-8D52935E7D6C}
// *********************************************************************//
  _IChkServerEvents = dispinterface
    ['{EA6C4BDC-F9A3-4EBD-8201-8D52935E7D6C}']
    procedure EstadoConexao(const sEstado: WideString); dispid 3;
  end;

// *********************************************************************//
// Interface: IChkServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E7102D7-BF98-4BEA-A154-F2110A770AAB}
// *********************************************************************//
  IChkServer = interface(IDispatch)
    ['{0E7102D7-BF98-4BEA-A154-F2110A770AAB}']
    function Get_CodigoCliente: WideString; safecall;
    procedure Set_CodigoCliente(const pVal: WideString); safecall;
    function Get_SenhaCliente: WideString; safecall;
    procedure Set_SenhaCliente(const pVal: WideString); safecall;
    function Get_EmailCliente: WideString; safecall;
    procedure Set_EmailCliente(const pVal: WideString); safecall;
    function Get_SerialCliente: WideString; safecall;
    procedure Set_SerialCliente(const pVal: WideString); safecall;
    function Get_Historico: Smallint; safecall;
    procedure Set_Historico(pVal: Smallint); safecall;
    function Get_Detalhe: WideString; safecall;
    procedure Set_Detalhe(const pVal: WideString); safecall;
    function CreateRequest(stIdTransacao: Smallint): IChkRequest; safecall;
    function CreateResponse: IChkResponse; safecall;
    function Transaction: Integer; safecall;
    function Get_TipoServidor: Smallint; safecall;
    function Get_MeioAcesso: WideString; safecall;
    procedure Set_MeioAcesso(const pVal: WideString); safecall;
    function Connect: Integer; safecall;
    procedure Disconnect; safecall;
    function Get_NivelRetornoEstado: Smallint; safecall;
    procedure Set_NivelRetornoEstado(pVal: Smallint); safecall;
    function Get_BytesExtras: WideString; safecall;
    procedure Set_BytesExtras(const pVal: WideString); safecall;
    property CodigoCliente: WideString read Get_CodigoCliente write Set_CodigoCliente;
    property SenhaCliente: WideString read Get_SenhaCliente write Set_SenhaCliente;
    property EmailCliente: WideString read Get_EmailCliente write Set_EmailCliente;
    property SerialCliente: WideString read Get_SerialCliente write Set_SerialCliente;
    property Historico: Smallint read Get_Historico write Set_Historico;
    property Detalhe: WideString read Get_Detalhe write Set_Detalhe;
    property TipoServidor: Smallint read Get_TipoServidor;
    property MeioAcesso: WideString read Get_MeioAcesso write Set_MeioAcesso;
    property NivelRetornoEstado: Smallint read Get_NivelRetornoEstado write Set_NivelRetornoEstado;
    property BytesExtras: WideString read Get_BytesExtras write Set_BytesExtras;
  end;

// *********************************************************************//
// DispIntf:  IChkServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E7102D7-BF98-4BEA-A154-F2110A770AAB}
// *********************************************************************//
  IChkServerDisp = dispinterface
    ['{0E7102D7-BF98-4BEA-A154-F2110A770AAB}']
    property CodigoCliente: WideString dispid 10;
    property SenhaCliente: WideString dispid 11;
    property EmailCliente: WideString dispid 13;
    property SerialCliente: WideString dispid 14;
    property Historico: Smallint dispid 15;
    property Detalhe: WideString dispid 16;
    function CreateRequest(stIdTransacao: Smallint): IChkRequest; dispid 17;
    function CreateResponse: IChkResponse; dispid 18;
    function Transaction: Integer; dispid 19;
    property TipoServidor: Smallint readonly dispid 20;
    property MeioAcesso: WideString dispid 21;
    function Connect: Integer; dispid 22;
    procedure Disconnect; dispid 23;
    property NivelRetornoEstado: Smallint dispid 24;
    property BytesExtras: WideString dispid 25;
  end;

// *********************************************************************//
// Interface: IChkServerTCPIP
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19F3C64F-3623-4391-8575-75276F0FA66A}
// *********************************************************************//
  IChkServerTCPIP = interface(IChkServer)
    ['{19F3C64F-3623-4391-8575-75276F0FA66A}']
    function Get_ProvedorTCPIP: WideString; safecall;
    procedure Set_ProvedorTCPIP(const pVal: WideString); safecall;
    function Get_PortaTCPIP: WideString; safecall;
    procedure Set_PortaTCPIP(const pVal: WideString); safecall;
    function Get_Criptografia: Smallint; safecall;
    procedure Set_Criptografia(pVal: Smallint); safecall;
    property ProvedorTCPIP: WideString read Get_ProvedorTCPIP write Set_ProvedorTCPIP;
    property PortaTCPIP: WideString read Get_PortaTCPIP write Set_PortaTCPIP;
    property Criptografia: Smallint read Get_Criptografia write Set_Criptografia;
  end;

// *********************************************************************//
// DispIntf:  IChkServerTCPIPDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19F3C64F-3623-4391-8575-75276F0FA66A}
// *********************************************************************//
  IChkServerTCPIPDisp = dispinterface
    ['{19F3C64F-3623-4391-8575-75276F0FA66A}']
    property ProvedorTCPIP: WideString dispid 1;
    property PortaTCPIP: WideString dispid 2;
    property Criptografia: Smallint dispid 3;
    property CodigoCliente: WideString dispid 10;
    property SenhaCliente: WideString dispid 11;
    property EmailCliente: WideString dispid 13;
    property SerialCliente: WideString dispid 14;
    property Historico: Smallint dispid 15;
    property Detalhe: WideString dispid 16;
    function CreateRequest(stIdTransacao: Smallint): IChkRequest; dispid 17;
    function CreateResponse: IChkResponse; dispid 18;
    function Transaction: Integer; dispid 19;
    property TipoServidor: Smallint readonly dispid 20;
    property MeioAcesso: WideString dispid 21;
    function Connect: Integer; dispid 22;
    procedure Disconnect; dispid 23;
    property NivelRetornoEstado: Smallint dispid 24;
    property BytesExtras: WideString dispid 25;
  end;

// *********************************************************************//
// Interface: IChkServerPAC
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BBF4318C-0DC8-4BAD-ADB9-5F6FB1CD94C7}
// *********************************************************************//
  IChkServerPAC = interface(IChkServer)
    ['{BBF4318C-0DC8-4BAD-ADB9-5F6FB1CD94C7}']
    function Get_ProvedorPAC: WideString; safecall;
    procedure Set_ProvedorPAC(const pVal: WideString); safecall;
    function Get_NiuPAC: WideString; safecall;
    procedure Set_NiuPAC(const pVal: WideString); safecall;
    function Get_SenhaPAC: WideString; safecall;
    procedure Set_SenhaPAC(const pVal: WideString); safecall;
    function DetectModem(stTipoPorta: Smallint; stPorta: Smallint): IChkModem; safecall;
    function Get_TelefonePAC: WideString; safecall;
    procedure Set_TelefonePAC(const pVal: WideString); safecall;
    function Get_Modem: IChkModem; safecall;
    procedure Set_Modem(const pChkModem: IChkModem); safecall;
    property ProvedorPAC: WideString read Get_ProvedorPAC write Set_ProvedorPAC;
    property NiuPAC: WideString read Get_NiuPAC write Set_NiuPAC;
    property SenhaPAC: WideString read Get_SenhaPAC write Set_SenhaPAC;
    property TelefonePAC: WideString read Get_TelefonePAC write Set_TelefonePAC;
    property Modem: IChkModem read Get_Modem write Set_Modem;
  end;

// *********************************************************************//
// DispIntf:  IChkServerPACDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BBF4318C-0DC8-4BAD-ADB9-5F6FB1CD94C7}
// *********************************************************************//
  IChkServerPACDisp = dispinterface
    ['{BBF4318C-0DC8-4BAD-ADB9-5F6FB1CD94C7}']
    property ProvedorPAC: WideString dispid 1;
    property NiuPAC: WideString dispid 2;
    property SenhaPAC: WideString dispid 3;
    function DetectModem(stTipoPorta: Smallint; stPorta: Smallint): IChkModem; dispid 4;
    property TelefonePAC: WideString dispid 5;
    property Modem: IChkModem dispid 6;
    property CodigoCliente: WideString dispid 10;
    property SenhaCliente: WideString dispid 11;
    property EmailCliente: WideString dispid 13;
    property SerialCliente: WideString dispid 14;
    property Historico: Smallint dispid 15;
    property Detalhe: WideString dispid 16;
    function CreateRequest(stIdTransacao: Smallint): IChkRequest; dispid 17;
    function CreateResponse: IChkResponse; dispid 18;
    function Transaction: Integer; dispid 19;
    property TipoServidor: Smallint readonly dispid 20;
    property MeioAcesso: WideString dispid 21;
    function Connect: Integer; dispid 22;
    procedure Disconnect; dispid 23;
    property NivelRetornoEstado: Smallint dispid 24;
    property BytesExtras: WideString dispid 25;
  end;

// *********************************************************************//
// Interface: IChkModem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9ED9C234-E6ED-4436-82EE-CE26977EDAF1}
// *********************************************************************//
  IChkModem = interface(IDispatch)
    ['{9ED9C234-E6ED-4436-82EE-CE26977EDAF1}']
    function Get_ByteSize: Smallint; safecall;
    procedure Set_ByteSize(pVal: Smallint); safecall;
    function Get_Parity: Smallint; safecall;
    procedure Set_Parity(pVal: Smallint); safecall;
    function Get_Dialed: Smallint; safecall;
    procedure Set_Dialed(pVal: Smallint); safecall;
    function Get_Pulse: Smallint; safecall;
    procedure Set_Pulse(pVal: Smallint); safecall;
    function Get_StopBits: Smallint; safecall;
    procedure Set_StopBits(pVal: Smallint); safecall;
    function Get_Port: Smallint; safecall;
    procedure Set_Port(pVal: Smallint); safecall;
    function Get_Speed: Integer; safecall;
    procedure Set_Speed(pVal: Integer); safecall;
    function Get_ModemConfig: Integer; safecall;
    procedure Set_ModemConfig(pVal: Integer); safecall;
    function Get_InitModemString: WideString; safecall;
    procedure Set_InitModemString(const pVal: WideString); safecall;
    function Get_ResetModemString: WideString; safecall;
    procedure Set_ResetModemString(const pVal: WideString); safecall;
    function Get_ModemName: WideString; safecall;
    procedure Set_ModemName(const pVal: WideString); safecall;
    function Get_PortType: Smallint; safecall;
    procedure Set_PortType(pVal: Smallint); safecall;
    property ByteSize: Smallint read Get_ByteSize write Set_ByteSize;
    property Parity: Smallint read Get_Parity write Set_Parity;
    property Dialed: Smallint read Get_Dialed write Set_Dialed;
    property Pulse: Smallint read Get_Pulse write Set_Pulse;
    property StopBits: Smallint read Get_StopBits write Set_StopBits;
    property Port: Smallint read Get_Port write Set_Port;
    property Speed: Integer read Get_Speed write Set_Speed;
    property ModemConfig: Integer read Get_ModemConfig write Set_ModemConfig;
    property InitModemString: WideString read Get_InitModemString write Set_InitModemString;
    property ResetModemString: WideString read Get_ResetModemString write Set_ResetModemString;
    property ModemName: WideString read Get_ModemName write Set_ModemName;
    property PortType: Smallint read Get_PortType write Set_PortType;
  end;

// *********************************************************************//
// DispIntf:  IChkModemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9ED9C234-E6ED-4436-82EE-CE26977EDAF1}
// *********************************************************************//
  IChkModemDisp = dispinterface
    ['{9ED9C234-E6ED-4436-82EE-CE26977EDAF1}']
    property ByteSize: Smallint dispid 1;
    property Parity: Smallint dispid 2;
    property Dialed: Smallint dispid 3;
    property Pulse: Smallint dispid 4;
    property StopBits: Smallint dispid 5;
    property Port: Smallint dispid 6;
    property Speed: Integer dispid 7;
    property ModemConfig: Integer dispid 8;
    property InitModemString: WideString dispid 9;
    property ResetModemString: WideString dispid 10;
    property ModemName: WideString dispid 11;
    property PortType: Smallint dispid 12;
  end;

// *********************************************************************//
// Interface: IChkApplication
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}
// *********************************************************************//
  IChkApplication = interface(IDispatch)
    ['{E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}']
    function CreateServer(stTipoServidor: Smallint; stProtocolo: Smallint): IChkServer; safecall;
    function Get_ElementoServidor(stIndiceElem: Smallint): IChkServer; safecall;
    property ElementoServidor[stIndiceElem: Smallint]: IChkServer read Get_ElementoServidor;
  end;

// *********************************************************************//
// DispIntf:  IChkApplicationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}
// *********************************************************************//
  IChkApplicationDisp = dispinterface
    ['{E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}']
    function CreateServer(stTipoServidor: Smallint; stProtocolo: Smallint): IChkServer; dispid 1;
    property ElementoServidor[stIndiceElem: Smallint]: IChkServer readonly dispid 2;
  end;

// *********************************************************************//
// The Class CoChkResponse provides a Create and CreateRemote method to          
// create instances of the default interface IChkResponse exposed by              
// the CoClass ChkResponse. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkResponse = class
    class function Create: IChkResponse;
    class function CreateRemote(const MachineName: string): IChkResponse;
  end;

// *********************************************************************//
// The Class CoChkRequest provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequest exposed by              
// the CoClass ChkRequest. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequest = class
    class function Create: IChkRequest;
    class function CreateRemote(const MachineName: string): IChkRequest;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckFast provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckFast exposed by              
// the CoClass ChkRequestCheckFast. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckFast = class
    class function Create: IChkRequestCheckFast;
    class function CreateRemote(const MachineName: string): IChkRequestCheckFast;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckFastMais provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckFastMais exposed by              
// the CoClass ChkRequestCheckFastMais. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckFastMais = class
    class function Create: IChkRequestCheckFastMais;
    class function CreateRemote(const MachineName: string): IChkRequestCheckFastMais;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckCheck provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckCheck exposed by              
// the CoClass ChkRequestCheckCheck. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckCheck = class
    class function Create: IChkRequestCheckCheck;
    class function CreateRemote(const MachineName: string): IChkRequestCheckCheck;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckCadastro provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckCadastro exposed by              
// the CoClass ChkRequestCheckCadastro. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckCadastro = class
    class function Create: IChkRequestCheckCadastro;
    class function CreateRemote(const MachineName: string): IChkRequestCheckCadastro;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckPlus provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckPlus exposed by              
// the CoClass ChkRequestCheckPlus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckPlus = class
    class function Create: IChkRequestCheckPlus;
    class function CreateRemote(const MachineName: string): IChkRequestCheckPlus;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckMaster provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckMaster exposed by              
// the CoClass ChkRequestCheckMaster. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckMaster = class
    class function Create: IChkRequestCheckMaster;
    class function CreateRemote(const MachineName: string): IChkRequestCheckMaster;
  end;

// *********************************************************************//
// The Class CoChkRequestCheckGold provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestCheckGold exposed by              
// the CoClass ChkRequestCheckGold. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestCheckGold = class
    class function Create: IChkRequestCheckGold;
    class function CreateRemote(const MachineName: string): IChkRequestCheckGold;
  end;

// *********************************************************************//
// The Class CoChkRequestLogin provides a Create and CreateRemote method to          
// create instances of the default interface IChkRequestLogin exposed by              
// the CoClass ChkRequestLogin. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkRequestLogin = class
    class function Create: IChkRequestLogin;
    class function CreateRemote(const MachineName: string): IChkRequestLogin;
  end;

// *********************************************************************//
// The Class CoChkServer provides a Create and CreateRemote method to          
// create instances of the default interface IChkServer exposed by              
// the CoClass ChkServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkServer = class
    class function Create: IChkServer;
    class function CreateRemote(const MachineName: string): IChkServer;
  end;

// *********************************************************************//
// The Class CoChkServerTCPIP provides a Create and CreateRemote method to          
// create instances of the default interface IChkServerTCPIP exposed by              
// the CoClass ChkServerTCPIP. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkServerTCPIP = class
    class function Create: IChkServerTCPIP;
    class function CreateRemote(const MachineName: string): IChkServerTCPIP;
  end;

// *********************************************************************//
// The Class CoChkServerPAC provides a Create and CreateRemote method to          
// create instances of the default interface IChkServerPAC exposed by              
// the CoClass ChkServerPAC. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkServerPAC = class
    class function Create: IChkServerPAC;
    class function CreateRemote(const MachineName: string): IChkServerPAC;
  end;

// *********************************************************************//
// The Class CoChkApplication provides a Create and CreateRemote method to          
// create instances of the default interface IChkApplication exposed by              
// the CoClass ChkApplication. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkApplication = class
    class function Create: IChkApplication;
    class function CreateRemote(const MachineName: string): IChkApplication;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TChkApplication
// Help String      : ChkApplication Class
// Default Interface: IChkApplication
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TChkApplicationProperties= class;
{$ENDIF}
  TChkApplication = class(TOleServer)
  private
    FIntf:        IChkApplication;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TChkApplicationProperties;
    function      GetServerProperties: TChkApplicationProperties;
{$ENDIF}
    function      GetDefaultInterface: IChkApplication;
  protected
    procedure InitServerData; override;
    function Get_ElementoServidor(stIndiceElem: Smallint): IChkServer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IChkApplication);
    procedure Disconnect; override;
    function CreateServer(stTipoServidor: Smallint; stProtocolo: Smallint): IChkServer;
    property DefaultInterface: IChkApplication read GetDefaultInterface;
    property ElementoServidor[stIndiceElem: Smallint]: IChkServer read Get_ElementoServidor;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TChkApplicationProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TChkApplication
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TChkApplicationProperties = class(TPersistent)
  private
    FServer:    TChkApplication;
    function    GetDefaultInterface: IChkApplication;
    constructor Create(AServer: TChkApplication);
  protected
    function Get_ElementoServidor(stIndiceElem: Smallint): IChkServer;
  public
    property DefaultInterface: IChkApplication read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoChkModem provides a Create and CreateRemote method to          
// create instances of the default interface IChkModem exposed by              
// the CoClass ChkModem. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChkModem = class
    class function Create: IChkModem;
    class function CreateRemote(const MachineName: string): IChkModem;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoChkResponse.Create: IChkResponse;
begin
  Result := CreateComObject(CLASS_ChkResponse) as IChkResponse;
end;

class function CoChkResponse.CreateRemote(const MachineName: string): IChkResponse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkResponse) as IChkResponse;
end;

class function CoChkRequest.Create: IChkRequest;
begin
  Result := CreateComObject(CLASS_ChkRequest) as IChkRequest;
end;

class function CoChkRequest.CreateRemote(const MachineName: string): IChkRequest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequest) as IChkRequest;
end;

class function CoChkRequestCheckFast.Create: IChkRequestCheckFast;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckFast) as IChkRequestCheckFast;
end;

class function CoChkRequestCheckFast.CreateRemote(const MachineName: string): IChkRequestCheckFast;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckFast) as IChkRequestCheckFast;
end;

class function CoChkRequestCheckFastMais.Create: IChkRequestCheckFastMais;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckFastMais) as IChkRequestCheckFastMais;
end;

class function CoChkRequestCheckFastMais.CreateRemote(const MachineName: string): IChkRequestCheckFastMais;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckFastMais) as IChkRequestCheckFastMais;
end;

class function CoChkRequestCheckCheck.Create: IChkRequestCheckCheck;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckCheck) as IChkRequestCheckCheck;
end;

class function CoChkRequestCheckCheck.CreateRemote(const MachineName: string): IChkRequestCheckCheck;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckCheck) as IChkRequestCheckCheck;
end;

class function CoChkRequestCheckCadastro.Create: IChkRequestCheckCadastro;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckCadastro) as IChkRequestCheckCadastro;
end;

class function CoChkRequestCheckCadastro.CreateRemote(const MachineName: string): IChkRequestCheckCadastro;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckCadastro) as IChkRequestCheckCadastro;
end;

class function CoChkRequestCheckPlus.Create: IChkRequestCheckPlus;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckPlus) as IChkRequestCheckPlus;
end;

class function CoChkRequestCheckPlus.CreateRemote(const MachineName: string): IChkRequestCheckPlus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckPlus) as IChkRequestCheckPlus;
end;

class function CoChkRequestCheckMaster.Create: IChkRequestCheckMaster;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckMaster) as IChkRequestCheckMaster;
end;

class function CoChkRequestCheckMaster.CreateRemote(const MachineName: string): IChkRequestCheckMaster;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckMaster) as IChkRequestCheckMaster;
end;

class function CoChkRequestCheckGold.Create: IChkRequestCheckGold;
begin
  Result := CreateComObject(CLASS_ChkRequestCheckGold) as IChkRequestCheckGold;
end;

class function CoChkRequestCheckGold.CreateRemote(const MachineName: string): IChkRequestCheckGold;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestCheckGold) as IChkRequestCheckGold;
end;

class function CoChkRequestLogin.Create: IChkRequestLogin;
begin
  Result := CreateComObject(CLASS_ChkRequestLogin) as IChkRequestLogin;
end;

class function CoChkRequestLogin.CreateRemote(const MachineName: string): IChkRequestLogin;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkRequestLogin) as IChkRequestLogin;
end;

class function CoChkServer.Create: IChkServer;
begin
  Result := CreateComObject(CLASS_ChkServer) as IChkServer;
end;

class function CoChkServer.CreateRemote(const MachineName: string): IChkServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkServer) as IChkServer;
end;

class function CoChkServerTCPIP.Create: IChkServerTCPIP;
begin
  Result := CreateComObject(CLASS_ChkServerTCPIP) as IChkServerTCPIP;
end;

class function CoChkServerTCPIP.CreateRemote(const MachineName: string): IChkServerTCPIP;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkServerTCPIP) as IChkServerTCPIP;
end;

class function CoChkServerPAC.Create: IChkServerPAC;
begin
  Result := CreateComObject(CLASS_ChkServerPAC) as IChkServerPAC;
end;

class function CoChkServerPAC.CreateRemote(const MachineName: string): IChkServerPAC;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkServerPAC) as IChkServerPAC;
end;

class function CoChkApplication.Create: IChkApplication;
begin
  Result := CreateComObject(CLASS_ChkApplication) as IChkApplication;
end;

class function CoChkApplication.CreateRemote(const MachineName: string): IChkApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkApplication) as IChkApplication;
end;

procedure TChkApplication.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F28908A6-58BC-4F21-9436-23303444F704}';
    IntfIID:   '{E4F4A4C5-2A46-40A0-9A8C-88566DC894CC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TChkApplication.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IChkApplication;
  end;
end;

procedure TChkApplication.ConnectTo(svrIntf: IChkApplication);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TChkApplication.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TChkApplication.GetDefaultInterface: IChkApplication;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TChkApplication.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TChkApplicationProperties.Create(Self);
{$ENDIF}
end;

destructor TChkApplication.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TChkApplication.GetServerProperties: TChkApplicationProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TChkApplication.Get_ElementoServidor(stIndiceElem: Smallint): IChkServer;
begin
    Result := DefaultInterface.ElementoServidor[stIndiceElem];
end;

function TChkApplication.CreateServer(stTipoServidor: Smallint; stProtocolo: Smallint): IChkServer;
begin
  Result := DefaultInterface.CreateServer(stTipoServidor, stProtocolo);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TChkApplicationProperties.Create(AServer: TChkApplication);
begin
  inherited Create;
  FServer := AServer;
end;

function TChkApplicationProperties.GetDefaultInterface: IChkApplication;
begin
  Result := FServer.DefaultInterface;
end;

function TChkApplicationProperties.Get_ElementoServidor(stIndiceElem: Smallint): IChkServer;
begin
    Result := DefaultInterface.ElementoServidor[stIndiceElem];
end;

{$ENDIF}

class function CoChkModem.Create: IChkModem;
begin
  Result := CreateComObject(CLASS_ChkModem) as IChkModem;
end;

class function CoChkModem.CreateRemote(const MachineName: string): IChkModem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChkModem) as IChkModem;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TChkApplication]);
end;

end.
