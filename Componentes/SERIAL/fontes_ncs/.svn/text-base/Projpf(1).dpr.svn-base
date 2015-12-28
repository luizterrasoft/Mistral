program ProjPF;

uses
  Forms,
  PF1 in 'PF1.pas' {DemoPF},
  Unit1 in 'Unit1.pas' {S_Pracas},
  Unit2 in 'Unit2.pas' {S_CliSint},
  Unit3 in 'Unit3.pas' {S_CliAnal},
  Unit4 in 'Unit4.pas' {S_VendasCli},
  Unit5 in 'Unit5.pas' {S_EtiqCli},
  Unit6 in 'Unit6.pas' {S_VendasProd},
  Unit7 in 'Unit7.pas' {S_VendCliRep},
  Unit8 in 'Unit8.pas' {S_VendProdRep};

{$R *.RES}

begin
  Application.Initialize;
  Application.HelpFile := 'PFHelp.chm';
  Application.CreateForm(TDemoPF, DemoPF);
  Application.CreateForm(TS_VendCliRep, S_VendCliRep);
  Application.CreateForm(TS_VendProdRep, S_VendProdRep);
  Application.Run;
end.
