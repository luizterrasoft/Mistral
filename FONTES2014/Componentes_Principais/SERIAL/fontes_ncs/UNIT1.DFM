�
 TS_PRACAS 07  TPF0	TS_PracasS_PracasLeftZTop� Width�Height� Caption&Script do Relat�rio Cadastro de Pra�as
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterOnClose	FormClosePixelsPerInch`
TextHeight TMemoMemo1Left Top Width�Height� AlignalClient
Font.ColorclBlackFont.Height�	Font.NameCourier New
Font.Style Lines.StringsOPrintFast1.HeaderData.Left2 := 'Pra�as';    // altera dado lado esqerdo linha 2Esquerda 2 do cabecalhoVif PrintFast1.IniciaImpr then                        // comando para iniciar impressaobegin   with TPracas do   begin      First;      while not eof do      beginY         PrintFast1.ImprString('',TPracasCODIGO.value,0,false);   // imprime campo codigoW         PrintFast1.ImprString('',TPracasNOME.value,11,true);     // imprime campo nome         next;
      end;   end;9   PrintFast1.Ejeta;     // ejeta uma folha na impressora9   PrintFast1.FimImpr; // finaliza impressao do relatorioend; 
ParentFontReadOnly	
ScrollBarsssBothTabOrder    