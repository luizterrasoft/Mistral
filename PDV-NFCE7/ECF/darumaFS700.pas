unit darumaFS700;

interface

uses Dialogs, SysUtils, principal;

procedure Daruma_Analisa_Retorno();
function DARUMAFS700_LeituraX: Integer;
{function DARUMAFS700_ReducaoZ: Integer;
function DARUMAFS700_LeituraMemoriaFiscalData: Integer;
function DARUMAFS700_LeituraMemoriaFiscalReducao: Integer;
function DARUMAFS700_LeituraMemoriaSerialData: Integer;
function DARUMAFS700_LeituraMemoriaSerialReducao: Integer;
function DARUMAFS700_RelatorioGerencial: Integer;}

implementation

// Métodos para Recebimentos e Relatórios
function Daruma_FI_LeituraX: Integer; stdcall; external 'Daruma32.dll' ;
function Daruma_FI_ReducaoZ( Data: String; Hora: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalData( Data_Inicial: String; Data_Final: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialData( Data_Inicial: String; Data_Final: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_LeituraMemoriaFiscalSerialReducao( Reducao_Inicial: String; Reducao_Final: String ): Integer; stdcall; external 'Daruma32.dll';
function Daruma_FI_RelatorioGerencial( Texto_Livre: String ): Integer; stdcall; external 'Daruma32.dll';

var
  Daruma_iACK: Integer;
  Daruma_iST1: Integer;
  Daruma_iST2: Integer;
  Retorno    : Integer;
  ERRO_DARUMAFS700_GERAL: array[-31..0] of String;

procedure Daruma_Analisa_Retorno();
begin
  Daruma_iACK := 0;
  Daruma_iST1 := 0;
  Daruma_iST2 := 0;

end;

function DARUMAFS700_LeituraX: Integer;
begin
  Retorno := Daruma_FI_LeituraX();
  Daruma_Analisa_Retorno();
end;

end.
 