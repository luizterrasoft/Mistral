program CarregaDarumaRSA;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Carrega RSA';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
