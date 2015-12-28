unit Print;

interface

uses
    Classes, SysUtils, Windows;

const
     PRINTER_OK = 0;
     PRINTER_OFF = 1;
     PRINTER_OUT_PAPER = 2;
     PRINTER_UNKNOW = 3;

type
    TPort = (LPT1, LPT2, LPT3, LPT4, LPT5);

    EDirectError = class(Exception);

    TDirect = class(TComponent)
    private
      FTextFile : TextFile;
      fPort: TPort;
      fLineFeed: string;
      fEjectPage: string;
      fBoldOn: string;
      fBoldOff: string;
      fItalicOn: string;
      fItalicOff: string;
      fCondensedOn: string;
      fCondensedOff: string;
      fDoubleStrikeOn: string;
      fDoubleStrikeOff: string;
      fUnderlineOn: string;
      fUnderlineOff: string;
      fReset: string;
      fPageNumber: integer;
      fPrinting: boolean;
      fNum: integer;
      fActualCol: integer;
      fActualLine: integer;
      fUser: string;
      procedure SendCaracters(str: string);
      procedure PrintCaracters(TheChar: char);
      procedure VaiParaColuna(Value : Word);
      procedure VaiParaLinha(Value : Word);
    public
      property PageNumber: integer read fPageNumber;
      property Printing: boolean read fPrinting;
      property ActualLine: integer read fActualLine;
      property ActualCol: integer read fActualCol;
      procedure BeginDoc;
      procedure NewLine;
      procedure EndDoc;
      procedure Line(Caracter: char; Num: integer);
      procedure LineLn(Caracter: char; Num: integer);
      function  SetPrinterOn: integer;
      procedure SetBoldOn;
      procedure SetBoldOff;
      procedure SetItalicOn;
      procedure SetItalicOff;
      procedure SetCondensedOn;
      procedure SetCondensedOff;
      procedure SetDoubleStrikeOn;
      procedure SetDoubleStrikeOff;
      procedure SetUnderlineOn;
      procedure SetUnderLineOff;
      procedure NewPage;
      procedure Lines(Num: integer);
      procedure Printf(const NumCols: array of integer; const Args: array of const; const Align: array of TAlignment);
      procedure PrintfLn(const NumCols: array of integer; const Args: array of const; const Align: array of TAlignment);
      constructor Create(AOwner: TComponent); override;
      procedure SendUser;

      procedure Imprime(Linha,Coluna,Tamanho,Posicao : Integer; Palavra : String;Alinhamento:TAlignment);
      procedure FimImpressao;
    published
      property Port: TPort read fPort write fPort;
      property LineFeed: string read fLineFeed write fLineFeed;
      property EjectPage: string read fEjectPage write fEjectPage;
      property BoldOn: string read fBoldOn write fBoldOn;
      property BoldOff: string read fBoldOff write fBoldOff;
      property ItalicOn: string read fItalicOn write fItalicOn;
      property ItalicOff: string read fItalicOff write fItalicOff;
      property CondensedOn: string read fCondensedOn write fCondensedOn;
      property CondensedOff: string read fCondensedOff write fCondensedOff;
      property DoubleStrikeOn: string read fDoubleStrikeOn write fDoubleStrikeOn;
      property DoubleStrikeOff: string read fDoubleStrikeOff write fDoubleStrikeOff;
      property UnderlineOn: string read fUnderlineOn write fUnderlineOn;
      property UnderlineOff: string read fUnderlineOff write fUnderlineOff;
      property ResetPrinter: string read fReset write fReset;
      property NumCaracters: integer read fNum write fNum;
      property UserCaracter: string read fUser write fUser;
end;

procedure Register;

implementation


procedure Register;
begin
     RegisterComponents('Freeware', [TDirect]);
end;

function TDirect.SetPrinterOn: integer;
var
   k: integer;
   return: integer;
   cPorta : String;
begin
     return := 0;
     k := ord(fPort);
     Case K of
         0 : cPorta := 'LPT1:';
         1 : cPorta := 'LPT2:';
         2 : cPorta := 'LPT3:';
         3 : cPorta := 'LPT4:';
     end;



     AssignFile(FTextFile, cPorta);
     ReWrite(FTextFile);

     Result := return;
end;

constructor TDirect.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     fLineFeed := '#13#10';
     fEjectPage := '#12' ;
     fBoldOn := '#27#69';
     fBoldOff := '#27#70';
     fItalicOn := '#27#52';
     fItalicOff := '#27#53';
     fCondensedOn := '#15';
     fCondensedOff := '#18';
     fDoubleStrikeOn := '#27#87#49';
     fDoubleStrikeOff := '#27#87#48';
     fUnderlineOn := '#27#45#49';
     fUnderlineOff := '#27#45#48';
     fReset := '#27#64';
     fNum := 80;
     fActualCol := 0;
     fActualLine := 0;
end;

procedure TDirect.SendCaracters(str: string);
begin
     if str[1] = '#' then
        write(FTextFile,str)
     else
         raise EDirectError.Create(LoadStr(65008));
end;

procedure TDirect.BeginDoc;
begin
     fPageNumber := 1;
     fPrinting := True;
     fActualCol := 0;
     fActualLine := 0;
end;

procedure TDirect.Line(Caracter: char; Num: integer);
var
   k: integer;
begin
     for k := 1 to Num do
         PrintCaracters(Caracter);
end;

procedure TDirect.LineLn(Caracter: char; Num: integer);
var
   k: integer;
begin
     for k := 1 to Num do
         PrintCaracters(Caracter);
     SendCaracters(fLineFeed);
     fActualCol := 0;
     inc(fActualLine);
end;

procedure TDirect.EndDoc;
begin
     SendCaracters(fEjectPage);
     fPageNumber := 0;
     fPrinting := False;
     fActualCol := 0;
     fActualLine := 0;
end;

procedure TDirect.SetBoldOn;
begin
     SendCaracters(fBoldOn);
end;

procedure TDirect.SetBoldOff;
begin
     SendCaracters(fBoldOff);
end;

procedure TDirect.SetItalicOn;
begin
     SendCaracters(fItalicOn);
end;

procedure TDirect.SetItalicOff;
begin
     SendCaracters(fItalicOff);
end;

procedure TDirect.SetCondensedOn;
begin
     SendCaracters(fCondensedOn);
end;

procedure TDirect.SetCondensedOff;
begin
     SendCaracters(fCondensedOff);
end;

procedure TDirect.SetDoubleStrikeOn;
begin
     SendCaracters(fDoubleStrikeOn);
end;

procedure TDirect.SetDoubleStrikeOff;
begin
     SendCaracters(fDoubleStrikeOff);
end;

procedure TDirect.SetUnderlineOn;
begin
     SendCaracters(UnderlineOn);
end;

procedure TDirect.SetUnderLineOff;
begin
     SendCaracters(UnderlineOff);
end;

procedure TDirect.NewPage;
begin
     SendCaracters(fEjectPage);
     fPageNumber := fPageNumber + 1;
     fActualLine := 0;
     fActualCol := 0;
end;

procedure TDirect.NewLine;
begin
     SendCaracters(fLineFeed);
     FActualCol := 0;
     inc(fActualLine);
end;

procedure TDirect.Lines(Num: integer);
var
   k: integer;
begin
     for k := 1 to Num do
        begin
             SendCaracters(fLineFeed);
             inc(fActualLine);
        end;
     fActualCol := 0;
end;

procedure TDirect.Printf(const NumCols: array of integer; const Args: array of const; const Align: array of TAlignment);
   procedure AlignCol(TheStr: string; Num: integer; One: TAlignment);
   var
      k, Value, Size: integer;
   begin
        Size := length(TheStr);
        if Size < Num then
            begin
                 case one of
                     taCenter:
                         begin
                              Value := (Num - Size) div 2;
                              for k := 1 to Value + 1 do
                                 TheStr := ' ' + TheStr + ' ' ;
                         end;
                     taRightJustify:
                         for k := 1 to Num - Size + 1 do
                             TheStr := ' ' + TheStr;
                     taLeftJustify:
                         for k := 1 to Num - Size + 1 do
                             TheStr := TheStr + ' ' ;
                 end;
                 for k := 1 to Length(TheStr) do
                     PrintCaracters(TheStr[k])
            end
        else
            for k := 1 to Num do
                PrintCaracters(TheStr[k]);
   end;
var
   k: integer;
begin
        fActualCol := 0;
     for k := 0 to high(NumCols) do
         with Args[k] do
            case vType of
               vtInteger:
                   AlignCol(intToStr(vInteger), NumCols[k], Align[k]);
               vtBoolean:
                   if vboolean then
                      AlignCol(loadStr(65015), NumCols[k], Align[k])
                   else
                       AlignCol(loadStr(65016), NumCols[k], Align[k]);
               vtChar:
                   AlignCol(vchar, NumCols[k], Align[k]);
               vtExtended:
                   AlignCol(Format('%m', [vExtended^]), NumCols[k], Align[k]);
               vtString:
                   AlignCol(vString^, NumCols[k], Align[k]);
               vtCurrency:
                   AlignCol(CurrToStr(vCurrency^), NumCols[k], Align[k]);
               vtAnsiString:
                   AlignCol(string(vAnsiString), NumCols[k], Align[k]);
            end;
end;

procedure TDirect.PrintfLn(const NumCols: array of integer; const Args: array of const; const Align: array of TAlignment);
   procedure AlignCol(TheStr: string; Num: integer; One: TAlignment);
   var
      k, Value, Size: integer;
   begin
        Size := length(TheStr);
        if Size < Num then
            begin
                 case one of
                     taCenter:
                         begin
                              Value := (Num - Size) div 2;
                              for k := 1 to Value + 1 do
                                 TheStr := ' ' + TheStr + ' ' ;
                         end;
                     taRightJustify:
                         for k := 1 to Num - Size + 1 do
                             TheStr := ' ' + TheStr;
                     taLeftJustify:
                         for k := 1 to Num - Size + 1 do
                             TheStr := TheStr + ' ' ;
                 end;
                 for k := 1 to Length(TheStr) do
                     PrintCaracters(TheStr[k]);
            end
        else
            for k := 1 to Num do
                PrintCaracters(TheStr[k]);
   end;
var
   k: integer;
begin
     for k := 0 to high(NumCols) do
         with Args[k] do
            case vType of
               vtInteger:
                   AlignCol(intToStr(vInteger), NumCols[k], Align[k]);
               vtBoolean:
                   if vboolean then
                      AlignCol(loadStr(65015), NumCols[k], Align[k])
                   else
                       AlignCol(loadStr(65016), NumCols[k], Align[k]);
               vtChar:
                   AlignCol(vchar, NumCols[k], Align[k]);
               vtExtended:
                   AlignCol(Format('%m', [vExtended^]), NumCols[k], Align[k]);
               vtString:
                   AlignCol(vString^, NumCols[k], Align[k]);
               vtCurrency:
                   AlignCol(CurrToStr(vCurrency^), NumCols[k], Align[k]);
               vtAnsiString:
                   AlignCol(string(vAnsiString), NumCols[k], Align[k]);
            end;
     SendCaracters(fLineFeed);
     fActualCol := 0;
     inc(fActualLine);
end;


procedure TDirect.PrintCaracters(TheChar: char);
begin
     if (TheChar >= #32) and (TheChar <= #127) then Begin
         Write(FTextFile,TheChar);
         inc(fActualCol);
     End;    
end;

procedure TDirect.SendUser;
begin
     SendCaracters(fUser);
end;


procedure TDirect.VaiParaColuna(Value : Word);
Begin
       If fActualCol < Value Then
             Line(' ',1);
End;

procedure TDirect.VaiParaLinha(Value : Word);
Begin
       If fActualLine < Value Then
           NewLine;
End;


procedure TDirect.Imprime(Linha,Coluna,Tamanho,Posicao : Integer; Palavra : String;Alinhamento:TAlignment);
Var cPalavra : String;
    PosicaoI,nTamanho : Word;
Begin

      VaiParaLinha(Linha);
      VaiParaColuna(Coluna);

      PosicaoI := 1;

      If Tamanho > 0 Then
         nTamanho := Tamanho
      Else
         nTamanho := Length(Palavra);

      If Posicao > 0 Then
          PosicaoI := Posicao;

      cPalavra := Copy(Palavra,PosicaoI,Tamanho);

      Printf([nTamanho],[cPalavra],[Alinhamento]);
End;

procedure TDirect.FimImpressao;
Begin
   CloseFile(FTextFile);
End;


end.
