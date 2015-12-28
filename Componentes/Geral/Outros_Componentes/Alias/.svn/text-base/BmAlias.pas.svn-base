(*******************************************************************************
tBmAlias v1.0

Derived from
    tComponent

Properties
    Property Alias   : current alias (for Add, Delete, ...)
    Property Path    : path of current alias
    Property Driver  : driver of current alias

Inherited properties
    all properties from tComponent.

procedures
    Add         : Add an Alias
    Delete      : Delete an Alias
    GetDriver   : Get Driver name
    SetDriver   : Set Driver name
    IsAlias     : true is this Alias exists
    GetAliasLst : Return lias of all aliases

Events
    all events from tComponent.

Based from Valentín Sánchez Izquierdo (CopyRight (c) 1996) component

*******************************************************************************
Author name=BOURMAD Mehdi
Author E-mail=bourmad@multimania.com
Author URL=www.multimania.com/bourmad
*******************************************************************************)

{If you have problems with these lines, remove them and mail me
 which compiler you have. I will correct it for future versions}
{$IFDEF WIN32} {Only for 32 bits compilers}
  {$IFNDEF VER90} {Doesn't works with Delphi 2}
    {$IFNDEF VER100} {Doesn't works with Delphi 3}
      {$ObjExportAll On} {export all objects (for C++Builder 3.0)}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

unit BmAlias;

interface

uses
  WinTypes, WinProcs, Classes, Dialogs, Forms, DsgnIntf, SysUtils,
  DbiTypes, DbiProcs, DbiErrs, DB, DbTables;

type
  tzString   = array[0..255] of char;
  tDrivers   = (drvPARADOX, drvDBASE, drvASCIIDRV, drvNOSUPORTED);
  tDbiString = string[DBIMAXNAMELEN];

  tFctDelAlias = function ( hCfg: hDbiCfg; pszAliasName: PChar ): DBIResult;

  {*********** tAboutMeProperty ************}
  TAboutMeProperty = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
  end;

  {*********** tBmAlias ************}
  TBmAlias = class(TComponent)
  private
  { Private declarations }
    FAbout : TAboutMeProperty;
    fPath: string;              {Alias Path}
    fAlias: string;             {Alias Name}
    fDriver: tDrivers;          {Driver}
    fAliasList: TStringList;    {Aliases List}
    fPathList: TStringList;     {Pathes List}
    IdapiInstance: tHandle;
    dbiDeleteAlias: tFctDelAlias;
    procedure LoadFunctions;
    procedure DisplayInstanceError (anInstance : tHandle);
    function InstanceLoaded : boolean;
  protected
  { Protected declarations }
    procedure GetAliasList;
    function RetCfgFile(CfgPath: pchar): string;
  public
    { Public declarations }
    constructor Create (aOwner: TComponent); override;
    Destructor Destroy; override;
    function Add: DBIresult;
    function Delete: DBIresult;
    function GetDriver: string;
    procedure SetDriver (sNewDriver: string);
    function IsAlias (zsName: string):Boolean;
    procedure GetAliasLst (sList: TStringList);
  published
    { Published declarations }
    property About: TAboutMeProperty read FAbout write FAbout;
    Property Alias : string Read fAlias Write fAlias;
    Property Path : string Read fPath Write fPath;
    Property Driver: tDrivers Read fDriver Write fDriver default drvPARADOX;
  end;

{BDE declaration for DeleteAlias}
{function DeleteAlias( hCfg: hDbiCfg; pszAliasName: PChar ): DBIResult;}

procedure Register;

{$IFNDEF WIN32}
  {$R *.D16}
{$ELSE}
  {$R *.D32}
{$ENDIF}

implementation

{************************* tAboutMeProperty component *************************}
procedure TAboutMeProperty.Edit;
begin
  Application.MessageBox ('tBmAlias component v1.0.'
                         +#13#10'This component is freeware.'
                         +#13#10'© 1999 BOURMAD Mehdi'
                         +#13#10'http://www.multimania.com/bourmad'
                         +#13#10'mailto:bourmad@multimania.com',
                         'About',
                         MB_OK+ MB_ICONINFORMATION);
end;

function TAboutMeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paReadOnly];
end;

function TAboutMeProperty.GetValue: string;
begin
  Result := '(about)';
end;

{************************* TBmAlias component *************************}
procedure TBmAlias.LoadFunctions;
begin
  @dbiDeleteAlias := GetProcAddress(IdapiInstance, 'dbiDeleteAlias');
  if @dbiDeleteAlias = nil
    then ShowMessage ('BmAlias Error' + #13#10 + 'dbiDeleteAlias');
end;

procedure TBmAlias.DisplayInstanceError (anInstance : tHandle);
var
  Buf : array[0..255] of Char;
  Err : integer;
begin
{$IFNDEF WIN32}
  if anInstance <= HINSTANCE_ERROR
  then
    ShowMessage ('BmAlias Error' + #13#10 + IntToStr(anInstance));
{$ELSE}
  if anInstance = 0
  then begin
    Buf := #0;
    Err := GetLastError;
    FormatMessage (FORMAT_MESSAGE_FROM_SYSTEM, nil, Err, 0, Buf, 255, nil);
    ShowMessage ('BmAlias Error' + #13#10 + StrPas(Buf));
  end;
{$ENDIF}
end;

function TBmAlias.InstanceLoaded : boolean;
begin
{$IFNDEF WIN32}
  Result := IdapiInstance>HINSTANCE_ERROR;
{$ELSE}
  Result := IdapiInstance <> 0;
{$ENDIF}
end;

constructor TBmAlias.Create;
{$IFNDEF WIN32}
var
  Buf : array[0..255] of Char;
{$ENDIF}
begin
  inherited Create (aOwner);
  fDriver := drvPARADOX;

  fAliasList:=TStringList.Create;
  fPathList:=TStringList.Create;

  IdapiInstance := 0;
  dbiDeleteAlias := nil;
{$IFNDEF WIN32}
  if not InstanceLoaded
  then begin
    StrPCopy (Buf, 'IDAPI01.DLL');
    IdapiInstance := LoadLibrary (Buf);
    if not InstanceLoaded
    then
      DisplayInstanceError (IdapiInstance)
    else begin
      LoadFunctions;
    end;
  end;
{$ENDIF}
end;

destructor TBmAlias.Destroy;
begin
  fAliasList.Free;
  fPathList.Free;
{$IFNDEF WIN32}
  if InstanceLoaded
    then FreeLibrary (IdapiInstance);
{$ENDIF}    
  inherited Destroy;
end;

{BDE declaration for DeleteAlias}
{function DeleteAlias( hCfg: hDbiCfg; pszAliasName: PChar ): DBIResult;
                    external 'IDAPI01' index 1130;}

function TBmAlias.Delete: DBIResult;
var
  szAlias : tzString;
begin
  StrPCopy(szAlias, fAlias);
{$IFNDEF WIN32}
  try
    Result := dbiDeleteAlias( nil, @szAlias);
  except
    raise exception.create('ERROR: BmAlias: 001');
  end;
{$ELSE}
  Session.DeleteAlias(szAlias);
  Session.SaveConfigFile;
  Result := 0; {Alias deleted}
{$ENDIF}
end;

function TBmAlias.Add: DBIResult;
var
  szAlias,
  szPath,
  szDriver : tzString;
{$IFDEF WIN32}
  LstParams : tStringList;
{$ENDIF}
begin
  StrPCopy( szAlias, fAlias );
  StrPCopy( szPath, 'PATH:' + fPath );
  case fDriver of
    drvPARADOX:  StrPCopy( szDriver, 'PARADOX');
    drvDBASE:    StrPCopy( szDriver, 'DBASE');
    drvASCIIDRV: StrPCopy( szDriver, 'ASCIIDRV');
  end;
{$IFNDEF WIN32}
  try
    Result := DbiAddAlias (nil, @szAlias, @szDriver, @szPath, true);
  except
    raise exception.create('ERROR BmAlias: 002');
  end;
{$ELSE}
  LstParams := tStringList.Create;
  LstParams.Add(Format('%s=%s', [szCFGDBPATH, fPath]));
{  LstParams.Add(Format('%s=%s', [szCFGDBDEFAULTDRIVER, DefaultDriver]));}
  Session.AddAlias(szAlias, szDriver, LstParams);
  Session.SaveConfigFile;
  LstParams.Free;
{$ENDIF}
end;

function TBmAlias.GetDriver: string;
begin
  case fDriver of
    drvPARADOX    : Result := 'PARADOX';
    drvDBASE      : Result := 'DBASE';
    drvASCIIDRV   : Result := 'ASCIIDRV';
    drvNOSUPORTED : Result := 'NOSUPORTED';
  end;
end;

procedure TBmAlias.SetDriver (sNewDriver: string);
begin
  fDriver := drvNOSUPORTED;
  if sNewDriver = 'PARADOX'
    then fDriver := drvPARADOX;
  if sNewDriver = 'DBASE'
    then fDriver := drvDBASE;
  if sNewDriver = 'ASCIIDRV'
    then fDriver := drvASCIIDRV;
end;

procedure  TBmAlias.GetAliasList;
var
  Cursor: HDBICur;
  Name: String;
  Desc: DBDesc;
{$IFDEF WIN32}
  i : integer;
  ParamsList : tStringList;
{$ENDIF}
begin
  try
    fAliasList.BeginUpdate;
    fPathList.BeginUpdate;
    fAliasList.Clear;
    fPathList.Clear;
{$IFNDEF WIN32}
    Check(DbiOpenDatabaseList(Cursor));  {Return an exception if an error occurs}
    try
      while DbiGetNextRecord(Cursor, dbiNOLOCK, @Desc, nil) = 0 do
      begin
        OemToAnsi(Desc.szName, Desc.szName);
        fAliasList.Add(StrPas(Desc.szName));
        OemToAnsi(Desc.szPhyName, Desc.szPhyName);
        fPathList.Add(StrPas(Desc.szPhyName));
      end;
    finally
      DbiCloseCursor(Cursor);
  end;
{$ELSE}
    Session.GetAliasNames (fAliasList);
    ParamsList := tStringList.Create;
    for i := 0 to fAliasList.Count-1 do
    begin
      ParamsList.Clear;
      Session.GetAliasParams (fAliasList.Strings[i], ParamsList);
      fPathList.Add(ParamsList.Values['PATH']);
    end;
    ParamsList.Free;
{$ENDIF}
  finally
    fAliasList.EndUpdate;
    fPathList.EndUpdate;
  end;
end;

function TBmAlias.IsAlias (zsName: string) : Boolean;
var
  i : Integer;
  zsCfg: string;
  psCfg: tzString;
begin
  Result := False;
  GetAliasList;

  fPath:='';
  fALias:='';
  fDriver:=drvNOSUPORTED;

  i := 0;
  while (i<=fAliasList.Count-1) and not Result do
  begin
    if UpperCase(fAliasList.Strings[i]) = UpperCase(zsName)
    then begin
      fAlias := fAliasList.Strings[i];
      fPath  := fPathList.Strings[i];
      zsCfg := '\DATABASES\' + fAliasList.Strings[i] + '\DB INFO\';
      strPCopy (psCfg, zsCfg);
      SetDriver (RetCfgFile(psCfg));
      Result := true;
    end;
    inc(i);
  end;
end;

procedure TBmAlias.GetAliasLst (sList: TStringList);
var
  i: Integer;
begin
  GetAliasList;
  sList.Clear;
  sList.BeginUpdate;
{  for i:=0 to fAliasList.Count - 1 do
    sList.Add(fAliasList.strings[i]);}
  sList.Assign (fAliasList);
  sList.EndUpdate;
end;

{-------------------------------- Driver -------------}
function TBmAlias.RetCfgFile(CfgPath: pCHAR): string;
var
  rslt: DBIResult;        { IDAPI result}
  hList: hDBICur;         { Cursor handle}
  szNode: pCHAR;          { string con nombre del nodo }
  pCfgDes: pCFGDesc;      { Configuration descriptor}
  i: integer;
  BaseSize: integer;      { Actual node size }
begin
  rslt := DbiOpenCfgInfoList (nil, dbiREADONLY, cfgPersistent, CfgPath, hList);
  if (rslt = DBIERR_NONE)
  then begin
    { pillamos memoria }
    GetMem(szNode, 512);
    GetMem(pCfgDes, sizeof(CFGDesc));

    { Inicializamos descriptor con ceros}
    FillChar(pCfgDes^, sizeof(CFGDesc), #0);

    { Pillamos el tercer valor que es el que nos interesa }
    for i := 1 to 3 do
      DbiGetNextRecord(hList, dbiNOLOCK, pCfgDes, nil);

    { Limpiamos variable szNode}
    FillChar(szNode^, 512, #0);
    { Tamaño del nodo }
    BaseSize := StrLen(szNode);

    StrPCopy(@szNode[BaseSize], pCfgDes^.szValue+' ');
    Result := (StrPas(szNode));

    { liberar memoria }
    FreeMem(szNode, 512);
    FreeMem(pCfgDes, sizeof(CFGDesc));

    if (hList <> nil)
    then begin
      DbiCloseCursor(hList);
    end;
  end;
end;

procedure Register;
begin
  RegisterPropertyEditor (TypeInfo(TAboutMeProperty), TBmAlias,
                          'ABOUT', TAboutMeProperty);
  RegisterComponents('BmSuite', [TBmAlias]);
end;

end.
