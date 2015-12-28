unit NovasExpressoes;

interface

uses Classes,Forms,QrExpr,SysUtils,Windows,QR3Const;

Type

  //Float e Inteiro
  TQREvStrtoFloat = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvStrtoInt = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvAbs = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvMod = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvSoNumero = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvChr = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;


  //data
  TQREvFormataData = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvIncData = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvDiferencaDias = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvDataDia = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvHoraDia = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  //Outras
  TQREvModulo10 = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvModulo11 = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  //Strings
  TQrEvTamStr = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvPosStr = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

  TQREvStringOfChar = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;


  TQREvTiraCharEsp = class(TQREvElementFunction)
  public
    function Calculate : TQREvResult; override;
  end;

implementation

Uses {GbCobranca,}FuncoesGlobais;

{ TQREvStrtoFloat }

function TQREvStrtoFloat.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['STRTOFLOAT']);
    exit;
  end;

  Result.Kind      := resDouble;
  Result.dblResult := StrtoFloatN(Argument(0).strResult);
end;

{ TQREvStrtoInt }

function TQREvStrtoInt.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['STRTOINT']);
    exit;
  end;

  Result.Kind      := resInt;
  Result.IntResult := StrtoIntN(Argument(0).strResult);
end;

{ TQREvMod }

function TQREvMod.Calculate: TQREvResult;
var
I,I2:Integer;
begin
  if Not((ArgList.Count = 2) and (Argument(0).Kind in [ResDouble,ResInt]) and (Argument(1).Kind in [ResInt,resdouble])) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['MOD']);
    exit;
  end;

  If Argument(0).Kind = ResDouble Then
   i := Round(Argument(0).dblResult)
  else
   i:=  Round(Argument(0).IntResult);

  If Argument(1).Kind = ResDouble Then
   i2 := Round(Argument(1).dblResult)
  else
   i2:=  Round(Argument(1).IntResult);



  Result.Kind      := resInt;
  If i2 = 0  Then
    Result.IntResult := 0
  else
    Result.IntResult := i mod i2;
end;

{ TQREvSoNumero }

function TQREvSoNumero.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['SONUMERO']);
    exit;
  end;

  Result.Kind      := resDouble;
  Result.DblResult := StrtoFloatN(SoNumero(Argument(0).strResult));
end;


{ TQREvFormataData }

function TQREvFormataData.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 2) and (Argument(0).Kind = ResString) and (Argument(1).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['FORMATADATA']);
    exit;
  end;
  TRY
    StrtoDaten(Argument(0).strResult);
  except
    Result.Kind      := resError;
    Result.StrResult := 'DATA INV. '+Argument(0).StrResult;
    exit;
  end;

  Result.Kind      := ResString;
  Result.strResult := FormatDateTime(Argument(1).StrResult,StrtoDateN(Argument(0).StrResult));
end;

{ TQREvIncData }

function TQREvIncData.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 3) and (Argument(0).Kind = ResString) and (Argument(1).Kind = RESInt) and (Argument(2).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['INCDATA']);
    exit;
  end;

  TRY
    StrToDaten(Argument(0).StrResult);
  except
    Result.Kind      := resError;
    Result.StrResult := 'DATA INV. '+Argument(0).StrResult;
    exit;
  end;

  Result.Kind      := ResString;
  If UpperCase(Argument(2).StrResult) = 'D' then
    Result.strResult := dateToStr(StrtodateN(Argument(0).StrResult) + Argument(1).IntResult)
  else If UpperCase(Argument(2).StrResult) = 'M' then
    Result.strResult := datetoStr(IncMonth(StrtodateN(Argument(0).StrResult),Argument(1).IntResult))
  else If UpperCase(Argument(2).StrResult) = 'A' then
    Result.strResult := datetoStr(IncMonth(StrtoDateN(Argument(0).StrResult),Argument(1).IntResult * 12));
end;

{ TQREvDiferencaDias }

function TQREvDiferencaDias.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 2) and (Argument(0).Kind = ResString) and (Argument(1).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['DIFERENCADIAS']);
    exit;
  end;

  TRY
    StrToDaten(Argument(0).StrResult);
  except
    Result.Kind      := resError;
    Result.StrResult := 'DATA 0 INV. '+Argument(0).StrResult;
    exit;
  end;

  TRY
    StrToDaten(Argument(1).Strresult);
  except
    Result.Kind      := resError;
    Result.StrResult := 'DATA 1 INV. '+Argument(1).StrResult;
    exit;
  end;

  Result.Kind         := ResInt;
  Result.IntResult    := Round(StrtoDateN(Argument(1).strResult) - StrtoDateN(Argument(0).strResult));
end;

{ TQREvModulo10 }

function TQREvModulo10.Calculate: TQREvResult;
var VBase:Integer;
begin
  if Not((ArgList.Count <= 2) and  (Argument(0).Kind = ResString) and ((ArgList.Count = 1) or (Argument(1).Kind = ResInt))) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['MODULO10']);
    exit;
  end;

  If ArgList.Count = 2 Then
    VBase            := Argument(1).IntResult
  else
    VBase            := 9;

  Result.Kind      := ResString;
//  Result.strResult := gbCobranca.Modulo10(Argument(0).strResult);
end;

{ TQREvModulo11 }

function TQREvModulo11.Calculate: TQREvResult;
var VBase:Integer;
begin
  if Not((ArgList.Count <= 2) and  (Argument(0).Kind = ResString) and ((ArgList.Count = 1) or (Argument(1).Kind = ResInt))) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['MODULO11']);
    exit;
  end;

  If ArgList.Count = 2 Then
    VBase            := Argument(1).IntResult
  else
    VBase            := 9;

  Result.Kind      := ResString;
 // Result.strResult := gbCobranca.Modulo11(Argument(0).strResult,VBase);
end;

{ TQREvHoraDia }

function TQREvHoraDia.Calculate: TQREvResult;
begin
  Result.Kind      := ResString;
  Result.strResult := TimeToStr(Time());
end;

{ TQREvDataDia }

function TQREvDataDia.Calculate: TQREvResult;
begin
  Result.Kind      := ResString;
  Result.strResult := DateToStr(Date());
end;

{ TQrEvTamStr }

function TQrEvTamStr.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['TAMSTR']);
    exit;
  end;
  Result.Kind      := ResInt;
  Result.IntResult := Length(Argument(0).strResult);
end;

{ TQREvPosStr }

function TQREvPosStr.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 2) and (Argument(0).Kind = ResString) and (Argument(1).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['POSSTR']);
    exit;
  end;

  Result.Kind      := ResInt;
  Result.IntResult := Pos(Argument(0).strResult,Argument(1).strResult);
end;

{ TQREvStringOfChar }

function TQREvStringOfChar.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 2) and (Argument(0).Kind = ResString) and (Argument(1).Kind = ResInt)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['STRINGOFCHAR']);
    exit;
  end;

  Result.Kind      := ResString;
  Result.StrResult := MultiplicaString(Argument(0).strResult,Argument(1).IntResult);
end;

{ TQREvTiraCharEsp }

function TQREvTiraCharEsp.Calculate: TQREvResult;
var i:integer;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResString)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['TIRACHARESP']);
    exit;
  end;
  
   Result.Kind      := resString;
   Result.StrResult := '';
   for i:=1 to Length(TiraAcento(Argument(0).StrResult)) Do
    If Not(Upcase(TiraAcento(Argument(0).StrResult)[i]) IN ['A'..'Z']) and
       Not(Upcase(TiraAcento(Argument(0).StrResult)[i]) IN  ['0'..'9']) Then
        Result.StrResult := Result.StrResult+' '
    else
        Result.StrResult := Result.StrResult+TiraAcento(Argument(0).StrResult[i])
end;

{ TQREvAbs }

function TQREvAbs.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind in [ResDouble,ResInt])) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['ABS']);
    exit;
  end;

  Result.Kind      := resDouble;
  if Argument(0).Kind = resdouble then
   Result.dblResult := Abs(Argument(0).dblResult)
  else
   Result.intResult := Abs(Argument(0).intResult);
end;

{ TQREvChr }

function TQREvChr.Calculate: TQREvResult;
begin
  if Not((ArgList.Count = 1) and (Argument(0).Kind = ResInt)) Then begin
    Result.Kind      := resError;
    Result.StrResult := Format(SqrExpWrongArguments, ['CHR']);
    exit;
  end;

  Result.Kind      := resString;
  Result.StrResult := Chr(Argument(0).intResult);
end;

initialization
  RegisterQRFunction(TQREvStrtoFloat,'StrtoFloat','StrtoFloat(<X>)|Transforma uma String num Numero Flutuante', SqrQuSoft, '7S');
  RegisterQRFunction(TQREvStrtoInt,'StrToInt','StrtoInt(<X>)|Transforma uma String num Numero Inteiro', SqrQuSoft, '7S');
  RegisterQRFunction(TQREvABS,'ABS','ABS(<X>)|Resulta o Valor Absoluto do numero', SqrQuSoft, '1N');
  RegisterQRFunction(TQREvMod,'Mod','Mod(<X>,<Y>)|Retorna o resto de Uma Divisão', SqrQuSoft, '2NN');
  RegisterQRFunction(TQREvSoNumero,'SoNumero','SoNumero(<X>)|Retorna os Numeros de Uma String', SqrQuSoft, '7S');
  RegisterQRFunction(TQREvChr,'Chr','Chr(<X>)|Retorna o chr', SqrQuSoft, '1N');
  RegisterQRFunction(TQREvFormataData,'FormataData','FormataData(<X>,<Y>)|Retorna uma Data formatada', SqrQuSoft, '7SS');
  RegisterQRFunction(TQREvIncData,'IncData','IncData(<X>,<Y>)|Retorna a Soma de uma data,mes ou ano', SqrQuSoft, '7SS');
  RegisterQRFunction(TQREvDiferencaDias,'DiferencaDias','DiferencaDias(<X>,<Y>)|Retorna a Diferença de Duas Datas', SqrQuSoft, '7SS');
  RegisterQRFunction(TQREvModulo10,'Modulo10','Modulo10(<X>)|Retorna o Calculo do Modulo 10 de um numero', SqrQuSoft, '7S');
  RegisterQRFunction(TQREvModulo11,'Modulo11','Modulo11(<X>)|Retorna o Calculo do Modulo 11 de um numero', SqrQuSoft, '7S');
  RegisterQRFunction(TQREvTamStr,'TamStr','TamStr(<X>)|Retorna o Tamanho de uma String',SqrQuSoft, '7S');
  RegisterQRFunction(TQREvPosStr,'PosStr','PosStr(<X>,<Y>)|Retorna a posição de uma substring em uma String',SqrQuSoft,'7SS');
  RegisterQRFunction(TQREvDataDia,'DataDia','DataDia|Retorna a Data do Sistema',SqrQuSoft, '');
  RegisterQRFunction(TQREvHoraDia,'HoraDia','HoraDia|Retorna a Hora do Sistema',SqrQuSoft, '');
  RegisterQRFunction(TQREvStringOfChar,'StringOfChar','StringOfChar(<X>,<Y>)|Duplica uma string na qtde informada',SqrQuSoft,'7SS');
  RegisterQRFunction(TQREvTiraCharEsp,'TiraCharEsp','TiraCharEsp(<X>)|Tira characteres especiais da string',SqrQuSoft,'7S');
  QRGlobalEnvironment.AddFunction('EMPRESASIST','EMPRESASIST');
  QRGlobalEnvironment.AddFunction('USUARIOSIST','USUARIOSIST');
end.
