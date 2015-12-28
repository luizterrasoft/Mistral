unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DbiProcs, StdCtrls,DbTables;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure fDbiAddAlias2(AliasName, AliasPath: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
fDbiAddAlias2('PrecisionNew', {'PATH:frobosrv:d:/interbas;' +}
            'SERVER NAME:c:/interbas/slim.gdb;' +
            'USER NAME:SYSDBA;' +
            'SQLQRYMODE:SERVER');

//fDbiAddAlias2('RemoteAlias', 'PATH:frobosrv:d:/interbas;' +
//            'SERVER NAME:frobosrv:d:/interbas/slim.gdb;' +
//            'USER NAME:test;' +
//            'SQLQRYMODE:SERVER;' +
//            'SQLPASSTHRU MODE:SHARED NOAUTOCOMMIT');

End;


//Note: The last parameter in the string does not have a semicolon ( ; ) at the end.

procedure TForm1.fDbiAddAlias2(AliasName, AliasPath: string);
Var  Retorno : DBIResult;
begin
  Check(dbiInit(nil));
  Try
     Retorno := DbiDeleteAlias(nil, PChar(AliasName));
     Check(Retorno);
  Except
      //
  End;

  //If Retorno = DBIERR_INVALIDPARAM  Then ShowMessage('Null alias name.')
  //Else
  //If Retorno = DBIERR_NONE Then ShowMessage('The alias was deleted successfully.')
  //Else
  //If Retorno = DBIERR_OBJNOTFOUND Then ShowMessage('No alias was found matching pszAliasName.');


  //Retorno := DbiAddAlias(nil, PChar(AliasName), 'INTRBASE', PChar(AliasPath), True);
  Retorno := DbiAddAlias(nil, PChar(AliasName), 'INTRBASE', PChar(''), True);
  Check(Retorno);

  If Retorno = DBIERR_INVALIDPARAM  Then ShowMessage('Null or invalid alias name. Invalid characters include a colon (":") and backslash ("\"). szASCII, szDBASE, and szPARADOX are entered as a STANDARD alias with the respective default driver.')
  Else
  If Retorno = DBIERR_NONE Then ShowMessage('The alias was added successfully.')
  Else
  If Retorno = DBIERR_NAMENOTUNIQUE Then ShowMessage('Another alias with the same name already exists (applicable only when bPersistent is TRUE).')
  Else
  If Retorno = DBIERR_OBJNOTFOUND Then ShowMessage('One (or more) of the optional parameters passed in through pszParams was not found as a valid type in the driver section of the configuration file.')
  Else
  If Retorno = DBIERR_UNKNOWNDRIVER Then ShowMessage('No driver name found in configuration file matching pszDriverType.');


  //ShowMessage('Alias foi criado com sucesso');
end;

end.
