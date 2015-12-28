program Laboratorio;

uses
  Forms,
  TesteF8 in 'TesteF8.pas' {Form1},
  DM1 in '..\Datamodules\DM1.pas' {DMF8: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMF8, DMF8);
  Application.Run;
end.
