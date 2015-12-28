{ TtsqUnZip delphi freeware component
  Copyright (c) 2003, Siqing Tang
  Email: tsq@softhome.net

This component decompress an archive generated by a PKZIP-compatible compressors
such as winzip or PKZIP. It uses Info-zip's implementations.

The component uses unzip32.dll, which is also included along and can be
downloaded from info-zip's http://www.info-zip.org. For the licence regarding
using of unzip32.dll, read the accompanying file 'LICENCE'.

This component(TtsqUnZip) is distributed under the terms of the MPL 1.1.
In short, there is no WARRANTY of any kind, you use it at your risk. You can
use this component for any purpose, including commercial one. For details,
read the accompanying files 'MPL-1.1.txt' and 'copyright'.

Theodoros Bebekis<bebekis@otenet.gr> made a wonderful translation(unzip32.pas)
of unzip32.dll(v5.4). I updated unzip32.pas to make it work with unzip32.dll v5.5.
My TtsqUnzip component is based on the unzip32.pas. Many thanks to
Theodoros Bebekis.

The main advantage of this component is that it decompresses files very fast(
should be at the same speed level as winzip since both this component and winzip
use the same C core code). It is also very stable as Info-zip's implementations
are stable as far as I know. However, there is also a disadvanage: it requires
that unzip32.dll be distributed along with an application.

To get started, read TtsqUnZip_HowTo.htm

For the latest information of the component, please visit my webpage at 
http://free.hostdepartment.com/j/johntang/.

Any bug or feedback please send to:
 Siqing Tang <tsq@softhome.net>
 New Zealand
 September 2003

version 1.0 --- 2 September 2003.
}

unit tsqUnZip;

interface

uses
  Windows, Messages, SysUtils, Classes, UnZip32;

type
  //dll routines. Shifted from UnZip32.pas.
  { decs.h }
  TWizNoPrinting  = procedure(Flag: Integer); stdcall;
  TWizValidate    = function(Archive: PChar;  AllCodes: Integer): Integer; stdcall;
  TWizInit        = function(var pG; var UserFunc: TUnzipUserFunctions): Bool; stdcall;
  TWizSetOpts     = function(var pG; var Options: TDCL): Bool; stdcall;
  TWizUnzip       = function(var pG; ifnc: Integer; ifnv: PPChar; xfnc: Integer;
      xfnv: PPChar): Integer; stdcall;
  TWizSingleEntryUnzip  = function(ifnc: Integer; ifnv: PPChar; xfnc: Integer;
      xfnv: PPChar; var Options: TDCL;
      var UserFunc: TUnzipUserFunctions): Integer; stdcall;
  TWizUnzipToMemory = function(Zip: PChar;  FileName: PChar;
      var UserFunctions: TUnzipUserFunctions;
      var RetStr: TUzpBuffer): Integer; stdcall;
  TWizGrep = function(Archive: PChar; FileName: PChar; Pattern: PChar;
      Cmd: Integer; SkipBin: Integer;
      var UserFunctions: TUnzipUserFunctions): Integer; stdcall;

  { unzip.h }
  TUzpFreeMemBuffer = procedure(var RetStr: TUzpBuffer); stdcall;
  TUzpVersion = function(): PUzpVer; stdcall;
  TUzpVersion2 = procedure(var Version: TUzpVer2); stdcall;

  TUnzipFlagOption = (
      {ExtractOnlyNewer}  ufoExtractOnlyNewer,
      {SpaceToUnderscore} ufoSpaceToUnderscore,
      {PromptToOverwrite} ufoPromptToOverwrite,
      {nCFlag}            ufoWriteToStdout,
      {nTFlag}            ufoTestZipFile,
      {nVFlag}            ufoExtractOrList,
      {nfFlag}            ufoFreshenExisting,
      {nZFlag}            ufoDisplayComment,
      {nOFlag}            ufoOverwriteFiles,
      {nAFlag}            ufoCR_TO_CRLF,
      {nZIFlag}           ufoZipInfoVerbose,
      {C_flag}            ufoCaseInsensitive);

  TUnzipFlagOptions = set of TUnzipFlagOption;

  //Second Leleve callback functions
  TUnzipPrint = procedure(Buffer: PChar; Size: ULONG; var PResult: Integer) of object;
  TUnzipPassword = procedure(P: PChar; N: Integer; M, Name: PChar; var PResult: Integer) of object;
  TUnzipService = procedure(CurFile: PChar; Size: ULONG; var PResult: Integer) of object;
  TUnzipSound = procedure of object;
  TUnzipReplace = procedure(FileName: PChar; var PResult: Integer) of object;
  TUnzipMessage = procedure (UnCompSize : ULONG;
                           CompSize   : ULONG;
                           Factor     : UINT;
                           Month      : UINT;
                           Day        : UINT;
                           Year       : UINT;
                           Hour       : UINT;
                           Minute     : UINT;
                           C          : Char;
                           FileName   : PChar;
                           MethBuf    : PChar;
                           CRC        : ULONG;
                           Crypt      : Char) of object;

  // ndFlag actually allows 3 options which control (sub)directory recreation during extraction
  TDirCreationOption = (
    {0} dcoJunkPaths    , {junk paths from filenames, ie, all files put in one directory, no-sub directories created}
    {1} dcoSafePath,      {"safe" usage of paths in filenames (skip "../" components)}
    {2} dcoUnsafePath);   {allow also unsafe path components (directory traversal)}

  TUnzipQuietLevel = (
      {0} uqlAllMessages, {all messages}
      {1} uqlFewMessages, {few messages}
      {2} uqlNoMessages   {no  messages}
      );
type

  TUnzipOptions = class; //forward declaration.

  //TtsqUnZip component
  TtsqUnZip = class(TComponent)
  private
    { Private declarations }
    FUnzipOptions: TUnzipOptions; //make these two
    FZipFileName: string;         //out of options.
    FDirToExtractTo: string;

    //Events
    FOnUnzipPrint: TUnzipPrint;
    FOnUnzipPassword: TUnzipPassword;
    FOnUnzipService: TUnzipService;
//  FOnUnzipSound: TUnzipSound; //not supported
    FOnUnzipReplace: TUnzipReplace;
    FOnUnzipMessage: TUnzipMessage;

    function GetUnZip32DLLVersion: string;
    procedure SetUnZip32DLLVersion(const PVersion: string);

    function GetVersion: string;
    procedure SetVersion(const PVersion: string);
  protected
    { Protected declarations }
    procedure UnzipInit(var PZipUserFuncRec: TUnzipUserFunctions); dynamic;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Integer; virtual;
    function GetUnzipOptions: TDCL; dynamic;
  published
    { Published declarations }
    //Unzip options

    property UnZipOptions: TUnZipOptions read FUnzipOptions write FUnzipOptions;
    property ZipFileName: string read FZipFileName write FZipFileName;
    property DirToExtractTo: string read FDirToExtractTo write FDirToExtractTo;

    property Unzip32DLLVersion: string read GetUnzip32DLLVersion write SetUnzip32DLLVersion stored false;
    property Version: string read GetVersion write SetVersion stored False;

    //event properties
    property OnUnzipPrint: TUnzipPrint read FOnUnzipPrint write FOnUnzipPrint;
    property OnUnzipPassword: TUnzipPassword read FOnUnzipPassword write FOnUnzipPassword;
    property OnUnzipService: TUnzipService read FOnUnzipService write FOnUnzipService;
//  property OnUnzipSound: TUnzipSound read FOnUnzipSound write FOnUnzipSound; not supported
    property OnUnzipReplace: TUnzipReplace read FOnUnzipReplace write FOnUnzipReplace;
    property OnUnzipMessage: TUnzipMessage read FOnUnzipMessage write FOnUnzipMessage;
  end;

  TUnzipOptions = class(TPersistent)
  private
    FDirCreationOption: TDirCreationOption;
    FQuietLevel: TUnzipQuietLevel; //0: all messages; 1 = few messages, 2 = no messages
    FPrivilege: Integer;  //1 => restore Acl's, 2 => Use privileges
    FUnzipFlagOptions: TUnzipFlagOptions;
  public
    constructor Create;
  published
    property DirCreationOption: TDirCreationOption read FDirCreationOption write FDirCreationOption default dcoSafePath;
    property QuietLevel: TUnzipQuietLevel read FQuietLevel write FQuietLevel default uqlAllMessages;
    property Privilege: Integer read FPrivilege write FPrivilege;
    property UnzipFlagOptions: TUnzipFlagOptions read FUnzipFlagOptions write FUnzipFlagOptions;
  end;

procedure LoadUnZip32DLL(const PUnZip32DLLFileName: string = UNZIP_DLL);
procedure UnLoadUnZip32DLL(PForceUnload: Boolean = False);

procedure WizNoPrinting(Flag: Integer);
function WizValidate(Archive: PChar;  AllCodes: Integer): Integer;
function WizInit(var pG; var UserFunc: TUnzipUserFunctions): Boolean;
function WizSetOpts(var pG; var Options: TDCL): Boolean;
function WizUnzip(var pG; ifnc: Integer; ifnv: PPChar; xfnc: Integer;
    xfnv: PPChar): Integer;
function WizSingleEntryUnzip(ifnc: Integer; ifnv: PPChar; xfnc: Integer;
    xfnv: PPChar; var Options: TDCL;
    var UserFunc: TUnzipUserFunctions): Integer;
function WizUnzipToMemory(Zip: PChar;  FileName: PChar;
      var UserFunctions: TUnzipUserFunctions;
      var RetStr: TUzpBuffer): Integer;
function WizGrep(Archive: PChar; FileName: PChar; Pattern: PChar;
      Cmd: Integer; SkipBin: Integer;
      var UserFunctions: TUnzipUserFunctions): Integer;

{ unzip.h }
procedure UzpFreeMemBuffer(var RetStr: TUzpBuffer);
function UzpVersion: PUzpVer;
procedure UzpVersion2(var Version: TUzpVer2);

//helper functions
function GetUnZipVersion(PFull: Boolean): string;

procedure Register;

implementation

var
  //.dll Function pointers
  MdllWizNoPrinting: TWizNoPrinting = nil;
  MdllWizValidate: TWizValidate = nil;
  MdllWizInit: TWizInit = nil;
  MdllWizSetOpts: TWizSetOpts = nil;
  MdllWizUnzip: TWizUnzip = nil;
  MdllWizSingleEntryUnzip: TWizSingleEntryUnzip = nil;
  MdllWizUnzipToMemory: TWizUnzipToMemory = nil;
  MdllWizGrep: TWizGrep = nil;
  MdllUzpFreeMemBuffer: TUzpFreeMemBuffer = nil;
  MdllUzpVersion: TUzpVersion = nil;
  MdllUzpVersion2: TUzpVersion2 = nil;

  //object method points to TtsqUnzip events.
  MObjUnzipPrint: TUnzipPrint = nil;
  MObjUnzipPassword: TUnzipPassword = nil;
  MObjUnzipService: TUnzipService = nil;
  MObjUnzipSound: TUnzipSound = nil;
  MObjUnzipReplace: TUnzipReplace = nil;
  MObjUnzipMessage: TUnzipMessage = nil;

  //Instance numer of loaded zip32.dll
  MInstanceNumOfUnZip32DllLoaded: Integer = 0;

  MUnZip32DLLHandle: THandle = 0;

const
  CTtsqUnZipVersion = '1.0';

procedure LoadUnZip32DLL(const PUnZip32DLLFileName: string = UNZIP_DLL);

  function LoadDllFunction(const PFunctionName, PDLLName: string): FARPROC;
  begin
    Result := GetProcAddress(MUnZip32DLLHandle, PChar(PFunctionName));
    if not Assigned(Result) then begin
      raise Exception.Create('Failed to load function "' + PFunctionName
          + '" from ' + PDLLName);
    end;
  end;

var
  LVersionFromDll: string;
begin
  if MUnZip32DLLHandle = 0 then begin
    //Note: Even though zip32.dll can be in a system searching path,
    //      I prefer to place the .dll in the direcotory where an application resides,
    //      this avoids problems with .dll version conficts.
    IsExpectedUnzipDllVersion;    

    MUnZip32DLLHandle := LoadLibrary(PChar(PUnZip32DLLFileName));
    if MUnZip32DLLHandle = 0 then raise
        Exception.Create('Can''t load ' + PUnZip32DLLFileName);

    @MdllWizNoPrinting        := LoadDllFunction('Wiz_NoPrinting', PUnZip32DLLFileName);
    @MdllWizValidate          := LoadDllFunction('Wiz_Validate', PUnZip32DLLFileName);
    @MdllWizInit              := LoadDllFunction('Wiz_Init', PUnZip32DLLFileName);
    @MdllWizSetOpts           := LoadDllFunction('Wiz_SetOpts', PUnZip32DLLFileName);
    @MdllWizUnzip             := LoadDllFunction('Wiz_Unzip', PUnZip32DLLFileName);
    @MdllWizSingleEntryUnzip  := LoadDllFunction('Wiz_SingleEntryUnzip', PUnZip32DLLFileName);
    @MdllWizUnzipToMemory     := LoadDllFunction('Wiz_UnzipToMemory', PUnZip32DLLFileName);
    @MdllWizGrep              := LoadDllFunction('Wiz_Grep', PUnZip32DLLFileName);
    @MdllUzpFreeMemBuffer     := LoadDllFunction('UzpFreeMemBuffer', PUnZip32DLLFileName);
    @MdllUzpVersion           := LoadDllFunction('UzpVersion', PUnZip32DLLFileName);
    @MdllUzpVersion2          := LoadDllFunction('UzpVersion2', PUnZip32DLLFileName);

    LVersionFromDll := GetUnZipVersion(False {short format: x.y});

    if UnZIP_DLL_VERSION {our Delphi constrant} <> LVersionFromDll then begin
      raise Exception.Create('The version of Delphi translation from C headers doesn''t match that of ' + PUnZip32DLLFileName + '.'
        + #13#10 + 'The version of Delphi translation from C headers is ' + UNZIP_DLL_VERSION + ', whereas '
        + #13#10 + 'The version of ' + PUNZip32DLLFileName + ' is ' + LVersionFromDll + '.');
    end;
    MInstanceNumOfUnzip32DllLoaded := 1;
  end
  else begin
    //already loaded. do not load again but increase reference count by 1
    Inc(MInstanceNumOfUnzip32DllLoaded);
  end;
end;

procedure UnLoadUnzip32DLL(PForceUnload: Boolean);
begin
  if (MUnzip32DLLHandle <> 0) then begin
    if PForceUnload then begin
      FreeLibrary(MUnzip32DLLHandle);
      MUnzip32DLLHandle := 0;
      MInstanceNumOfUnzip32DllLoaded := 0;
    end
    else begin
      if MInstanceNumOfUnzip32DllLoaded <= 1 then begin
        FreeLibrary(MUnzip32DLLHandle);
        MUnzip32DLLHandle := 0;
        MInstanceNumOfUnzip32DllLoaded := 0;
      end
      else begin
        //do not actually unload; reduce reference count by 1
        Dec(MInstanceNumOfUnzip32DllLoaded);
      end;
    end;
  end;
end;

procedure WizNoPrinting(Flag: Integer);
begin
   MdllWizNoPrinting(Flag);
end;

function WizValidate(Archive: PChar;  AllCodes: Integer): Integer;
begin
  Result := MdllWizValidate(Archive, AllCodes);
end;

function WizInit(var pG; var UserFunc: TUnzipUserFunctions): Boolean;
begin
  Result := MdllWizInit(pG, UserFunc);
end;

function WizSetOpts(var pG; var Options: TDCL): Boolean;
begin
  Result := MdllWizSetOpts(pG, Options);
end;

function WizUnzip(var pG; ifnc: Integer; ifnv: PPChar; xfnc: Integer;
    xfnv: PPChar): Integer;
begin
  Result := MdllWizUnzip(pG, ifnc, ifnv, xfnc, xfnv);
end;

function WizSingleEntryUnzip(ifnc: Integer; ifnv: PPChar; xfnc: Integer;
    xfnv: PPChar; var Options: TDCL;
    var UserFunc: TUnzipUserFunctions): Integer;
begin
  Result := MdllWizSingleEntryUnzip(ifnc, ifnv, xfnc, xfnv, Options, UserFunc);
end;

function WizUnzipToMemory(Zip: PChar;  FileName: PChar;
      var UserFunctions: TUnzipUserFunctions;
      var RetStr: TUzpBuffer): Integer;
begin
  Result := MdllWizUnzipToMemory(Zip, FileName, UserFunctions, RetStr);
end;

function WizGrep(Archive: PChar; FileName: PChar; Pattern: PChar;
      Cmd: Integer; SkipBin: Integer;
      var UserFunctions: TUnzipUserFunctions): Integer;
begin
  Result := MdllWizGrep(Archive, FileName, Pattern, Cmd, SkipBin, UserFunctions);
end;

{ unzip.h }
procedure UzpFreeMemBuffer(var RetStr: TUzpBuffer);
begin
  MdllUzpFreeMemBuffer(RetStr);
end;

function UzpVersion: PUzpVer;
begin
  Result := MdllUzpVersion;
end;

procedure UzpVersion2(var Version: TUzpVer2);
begin
  MdllUzpVersion2(Version);
end;

function GetUnZipVersion(PFull: Boolean): string;
var
  LUnZipVersion: TUzpVer2;
  LBetaLevel, LDate, LZlibVersion: string;
begin
  UzpVersion2(LUnZipVersion);
  with LUnZipVersion.UnZip do begin
    Result := IntToStr(Major) + '.' + IntToStr(Minor);
    if PatchLevel <> 0 then Result := Result + IntToStr(PatchLevel);
  end;
  if PFull then begin
    with LUnZipVersion do begin
      LBetaLevel := BetaLevel;
      LDate := Date;
      LZlibVersion := ZLib_Version;
    end;
    if LBetaLevel <> '' then Result := Result + ', ' + LBetaLevel;
    if LDate <> '' then Result := Result + ', ' + LDate;
    if LZlibVersion <> '' then Result := Result + ', ' + LZlibVersion;
  end;
end;

//
// Start of Module-scope callback functions(must be declared as 'stdcall')
//
function UnzipDllPrintCallBack(Buffer: PChar; Size: ULONG): integer; stdcall;
begin
  Result := Size;
  if Assigned(MObjUnzipPrint) then MObjUnzipPrint(Buffer, Size, Result);
end;

procedure UnzipDllSoundCallBack; stdcall;
begin
  if Assigned(MObjUnzipSound) then MObjUnzipSound;
end;

function UnzipDllPasswordCallBack(P: PChar; N: Integer; M, Name: PChar): integer; stdcall;
begin
  Result := 1;
  if Assigned(MObjUnzipPassword) then MObjUnzipPassword(P, N, M, Name, Result);
end;

function UnzipDllServiceCallBack(CurFile: PChar; Size: ULONG): integer; stdcall;
begin
  Result := 0;
  if Assigned(MObjUnzipService) then MObjUnzipService(CurFile, Size, Result);
end;

function UnzipDllReplaceCallBack(FileName: PChar): integer; stdcall;
begin
  Result := 1;
  if Assigned(MObjUnzipReplace) then MObjUnzipReplace(FileName, Result);
end;

procedure UnzipDllMessageCallBack(UnCompSize : ULONG;
                     CompSize   : ULONG;
                     Factor     : UINT;
                     Month      : UINT;
                     Day        : UINT;
                     Year       : UINT;
                     Hour       : UINT;
                     Minute     : UINT;
                     C          : Char;
                     FileName   : PChar;
                     MethBuf    : PChar;
                     CRC        : ULONG;
                     Crypt      : Char); stdcall;
begin
  if Assigned(MObjUnzipMessage) then MObjUnzipMessage(UnCompSize, CompSize,
      Factor, Month, Day, Year, Hour, Minute, C, FileName, MethBuf, CRC, Crypt);
end;

procedure SetUnzipObjectFunctions(
    PObjUnzipPrint: TUnzipPrint;
    PObjUnzipPassword: TUnzipPassword;
    PObjUnzipService: TUnzipService;
    PObjUnzipSound: TUnzipSound;
    PObjUnzipReplace: TUnzipReplace;
    PObjUnzipMessage: TUnzipMessage);
begin
  MObjUnzipPrint    := PObjUnzipPrint;
  MObjUnzipPassword := PObjUnzipPassword;
  MObjUnzipService  := PObjUnzipService;
  MObjUnzipSound    := PObjUnzipSound;
  MObjUnzipReplace  := PObjUnzipReplace;
  MObjUnzipMessage  := PObjUnzipMessage;
end;

procedure SetUnzipCallbackFunctions(var PUserFunctions: TUnzipUserFunctions;
    PObjUnzipPrint: TUnzipPrint;
    PObjUnzipPassword: TUnzipPassword;
    PObjUnzipService: TUnzipService;
    PObjUnzipSound: TUnzipSound;
    PObjUnzipReplace: TUnzipReplace;
    PObjUnzipMessage: TUnzipMessage);
begin
  { What we do here is to set up two-level callback functions.
    The functions in the first level are
      UnzipDllPrintCallBack
      UnzipDllSoundCallBack
      UnzipDllPasswordCallBack
      UnzipDllServiceCallBack
      UnzipDllReplaceCallBack
      UnzipDllMessageCallBack
    These functions will be called back when we unzip a .zip file.
    When each of these functions gets called, it then will call its
    corresponding object procedure(second level), which basically
    is an event handler of an instance of the TtsqUnzip component.
    We might show the process message, display how compressing
    progress and etc, depending the situation.
  }
  with PUserFunctions do begin
    @Print                  := @UnzipDllPrintCallBack;
    @Sound                  := @UnzipDllSoundCallBack;
    @Replace                := @UnZipDllReplaceCallBack;
    @Password               := @UnZipDllPasswordCallBack;
    @SendApplicationMessage := @UnZipDllMessageCallBack;
    @ServCallBk             := @UnZipDllServiceCallBack;
  end;

  SetUnzipObjectFunctions(
    PObjUnzipPrint,
    PObjUnzipPassword,
    PObjUnzipService,
    PObjUnzipSound,
    PObjUnzipReplace,
    PObjUnzipMessage);
end;
//
// End of Module-scope callback functions
//

procedure Register;
begin
  RegisterComponents('tsq', [TtsqUnZip]);
end;

{ TUnzipOptions }

constructor TUnzipOptions.Create;
begin
  FDirCreationOption := dcoSafePath;
  FQuietLevel := uqlAllMessages;
end;

{ TtsqUnZip }

constructor TtsqUnZip.Create(AOwner: TComponent);
begin
  inherited;
  LoadUnZip32DLL;
  FUnzipOptions := TUnzipOptions.Create;
end;

destructor TtsqUnZip.Destroy;
begin
  FUnzipOptions.Free;
  UnLoadUnZip32DLL(False);
  inherited;
end;

function TtsqUnZip.GetUnzip32DLLVersion: string;
begin
  Result := 'v' + GetUnZipVersion(True);
end;

procedure TtsqUnZip.SetUnZip32DLLVersion(const PVersion: string);
begin
  //does nothing. Do not put code here.
end;

function TtsqUnZip.GetVersion: string;
begin
  Result := CTtsqUnZipVersion;
end;

procedure TtsqUnZip.SetVersion(const PVersion: string);
begin
  //does nothing. Do not put code here.
end;

procedure TtsqUnZip.UnzipInit(var PZipUserFuncRec: TUnzipUserFunctions);
begin
  // Set Callback functions and and associate them with our event handler.
  SetUnzipCallbackFunctions(PZipUserFuncRec,
      FOnUnzipPrint,
      FOnUnzipPassword,
      FOnUnzipService,
      nil {FOnUnzipSound: not supported},
      FOnUnzipReplace,
      FOnUnzipMessage);
end;

function TtsqUnZip.GetUnzipOptions: TDCL;
begin
  FillChar(Result, SizeOf(TDCL), 0);
  with Result do begin
    ExtractOnlyNewer  := Integer(ufoExtractOnlyNewer in FUnzipOptions.UnzipFlagOptions);
    SpaceToUnderscore := Integer(ufoSpaceToUnderscore in FUnzipOptions.UnzipFlagOptions);
    PromptToOverwrite := Integer(ufoPromptToOverwrite in FUnzipOptions.UnzipFlagOptions);
    nCFlag            := Integer(ufoWriteToStdout in FUnzipOptions.UnzipFlagOptions);
    nTFlag            := Integer(ufoTestZipFile in FUnzipOptions.UnzipFlagOptions);
    nVFlag            := Integer(ufoExtractOrList in FUnzipOptions.UnzipFlagOptions);
    nfFlag            := Integer(ufoFreshenExisting in FUnzipOptions.UnzipFlagOptions);
    nZFlag            := Integer(ufoDisplayComment in FUnzipOptions.UnzipFlagOptions);

    //directory recreation options: 0/1/2
    nDFlag            := Integer(FUnzipOptions.DirCreationOption);

    nOFlag            := Integer(ufoOverwriteFiles in FUnzipOptions.UnzipFlagOptions);
    nAFlag            := Integer(ufoCR_TO_CRLF in FUnzipOptions.UnzipFlagOptions);
    nZIFlag           := Integer(ufoZipInfoVerbose in FUnzipOptions.UnzipFlagOptions);
    C_flag            := Integer(ufoCaseInsensitive in FUnzipOptions.UnzipFlagOptions);

    fQuiet            := Integer(FUnzipOptions.QuietLevel);
    fPrivilege        := FUnzipOptions.Privilege;

    lpszExtractDir    := PChar(FDirToExtractTo);
    lpszZipFN         := PChar(FZipFileName);
  end;
end;

function TtsqUnZip.Execute: Integer;
var
  LUserFunctions: TUnzipUserFunctions;
  LDCL: TDCL;
begin
  //Check required parameters
  if FZipFileName = '' then begin
    raise Exception.Create('Zipfilename not specified.');
  end;
  if FDirToExtractTo = '' then begin
    raise Exception.Create('DirToExtractTo not specified.');
  end;

  UnzipInit(LUserFunctions);
  LDCL := GetUnzipOptions;

  Result := WizSingleEntryUnzip(
      0,                 { number of file names being passed }
      nil,               { file names to be unarchived }
      0,                 { number of "file names to be excluded from processing" being  passed }
      nil,               { file names to be excluded from the unarchiving process }
      LDCL,              { pointer to a structure with the flags for setting the  various options }
      LUserFunctions);   { pointer to a structure that contains pointers to user functions }
end;

initialization
//

finalization
  UnLoadUnZip32DLL(True {force to unload unzip32.dll});


end.
