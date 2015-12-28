program EXEMPLO;

uses
  Forms,
  UMENU in 'UMENU.pas' {Form1},
  BRADESCO in 'BRADESCO.pas' {DFM_BRADESCO};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDFM_BRADESCO, DFM_BRADESCO);
  Application.Run;
end.
