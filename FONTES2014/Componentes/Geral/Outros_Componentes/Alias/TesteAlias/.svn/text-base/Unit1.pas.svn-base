unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Dbtables,DbiProcs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TForm1.fDbiAddAlias2(AliasName, AliasPath: string);
Var  Retorno : DBIResult;
begin
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
  Retorno := DbiAddAlias(nil, PChar(AliasName), 'INTRBASE', PChar(AliasPath), True);
  Check(Retorno);

  If Retorno = DBIERR_INVALIDPARAM  Then ShowMessage('Invalido alias criado')
  Else
  If Retorno = DBIERR_NONE Then //ShowMessage('Alias criado com sucesso')
  Else
  If Retorno = DBIERR_NAMENOTUNIQUE Then ShowMessage('Alias já existe')
  Else
  If Retorno = DBIERR_OBJNOTFOUND Then ShowMessage('Parametros foram passados com erro')
  Else
  If Retorno = DBIERR_UNKNOWNDRIVER Then ShowMessage('Driver não instalado');

  Session.SaveConfigFile;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   Check(dbiInit(nil));

    fDbiAddAlias2('Precision','SERVER NAME:c:\safiwin\basedados\precision.gdb;' +
            'USER NAME:SYSDBA;' +
            'SQLQRYMODE:LOCAL');

    Self.Close;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
      Visible := False;
end;

end.
