program CupomFiscal;

uses
  Forms,
  uFatur1 in 'uFatur1.pas' {FormCupomFiscal},
  dmCF in 'dmCF.pas' {dmCupom: TDataModule},
  uConsumidor in 'uConsumidor.pas' {DadosConsumidorForm},
  uFatur5 in 'uFatur5.pas' {FormTotais},
  uFatur6 in 'uFatur6.pas' {FormAliquotas};

{$R *.RES}

begin

  Application.Initialize;
  Application.Tag := 0;
  Application.Title := 'Teste de uso do componente';
  Application.CreateForm(TFormCupomFiscal, FormCupomFiscal);
  Application.CreateForm(TdmCupom, dmCupom);
  Application.CreateForm(TDadosConsumidorForm, DadosConsumidorForm);
  Application.CreateForm(TFormAliquotas, FormAliquotas);
  Application.Tag := 1;
  Application.CreateForm(TFormCupomFiscal, FormCupomFiscal);
  Application.Run;
end.

