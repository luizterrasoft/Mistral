program EXEMPLO;

uses
  Forms,
  U_RECURSOS in 'U_RECURSOS.pas' {DFM_RECURSOS},
  BRADESCO in 'BRADESCO.pas' {DFM_BRADESCO},
  Etiquetas in 'Etiquetas.pas' {DFM_ETQ},
  U_clientessimples in 'U_clientessimples.pas' {dfm_clientessimples},
  U_clientesquebra in 'U_clientesquebra.pas' {dfm_clientesquebra},
  NOTAFISCAL in 'NOTAFISCAL.pas' {DFM_NOTA};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDFM_RECURSOS, DFM_RECURSOS);
  Application.CreateForm(TDFM_NOTA, DFM_NOTA);
  Application.CreateForm(Tdfm_clientesquebra, dfm_clientesquebra);
  Application.CreateForm(Tdfm_clientessimples, dfm_clientessimples);
  Application.CreateForm(TDFM_ETQ, DFM_ETQ);
  Application.CreateForm(TDFM_BRADESCO, DFM_BRADESCO);
  Application.Run;
end.
