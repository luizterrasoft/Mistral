unit CondPag;

interface
Uses Classes,Forms,DbTables,Registro,TipoDef,SysUtils;

Type

  TTipoCond = record
       Documento : String;
       Data      : TDateTime;
       Valor     : Currency;
  End;

  TTipoCondA = Array of TTipoCond;

  TCondPag = class(TComponent)
  private
    { Private declarations }
    FCodigo    : String ;
    FDescricao : String;
    FParcelas  : Word;
    FAjusta    : Boolean;
    FPrazoI    : Word;
    FVariacao  : Word;
    FDiaFixo   : Word;
    FLimite    : Word;
    FEncFin,FAVista : Currency;
    FPagAVista : Boolean;
    FFormaDePAg: String;
    FDocumento : String;
    FLimite_Cred : Boolean;

    FDataBase : TDataBase;
    FRegistro1 : TRegistro;
    FAtivado  : Boolean;
    FParcela: Word;
    FVariaMes: Boolean;
    FMora: Currency;
    FMoraMes: Currency;
    FDescontoPerc: Currency;
    FDescontoValor: Currency;
    FMultaPerc: Currency;
    FMultaValor: Currency;
    FRecebimentos: Boolean;
    FPagamentos: Boolean;
    FParcAberta: Boolean;
    Procedure SetValue;
    Procedure GetValue;
    Function SetData(Value : TDateTime):TDateTime;
  protected
    { Protected declarations }
    Function IIFs(Value1:Boolean;Value2,Value3:Variant) : Variant;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor destroy ; override;
    Procedure GravaReg;
    Procedure Recupera;
    Procedure Exclui;
    Procedure Ativa;
    Function GetData(Value : TDateTime;Valor:Currency) : TTipoCondA;
    Function GetAVista(Value:Currency):Currency;
    property Parcela     : Word    read FParcela   write FParcela Default 1;
    property VariaPorMes: Boolean     read FVariaMes  write FVariaMes Default False;
  published
    { Published declarations }
    property Codigo     : String    read FCodigo      write FCodigo     ;
    property Descricao  : String    read FDescricao   write FDescricao  ;
    property Parcelas   : Word      Read FParcelas    write FParcelas   ;
    property Ajusta     : Boolean   read FAjusta      write FAjusta     default False;
    property PrazoI     : Word      read FPrazoI      write FPrazoI     ;
    property Variacao   : Word      read FVariacao    write FVariacao   ;
    property DiaFixo    : Word      read FDiaFixo     write FDiaFixo    ;
    property Limite     : Word      read FLimite      write FLimite     ;
    property EncFin     : Currency  read FEncFin      write FEncFin     ;
    property AVista     : Currency  read FAvista      write FAvista     ;
    property Mora       : Currency  read FMora      write FMora     ;
    property MoraMes       : Currency  read FMoraMes      write FMoraMes     ;
    property DescontoPerc     : Currency  read FDescontoPerc      write FDescontoPerc     ;
    property DescontoValor     : Currency  read FDescontoValor      write FDescontoValor     ;
    property MultaPerc     : Currency  read FMultaPerc      write FMultaPerc     ;
    property MultaValor     : Currency  read FMultaValor      write FMultaValor     ;
    property Documento  : String    read FDocumento   write FDocumento  ;
    property PagAVista : Boolean    read FPagAVista   write FPagAVista ;
    property FormaDePAg: String     read FFormaDePAg  write FFormaDePAg ;
    property BancoDeDados: TDataBase read FDataBase   write FDataBase  ;
    property Limite_Cred  : Boolean    read FLimite_Cred   write FLimite_Cred Default True ;
    property Pagamentos   : Boolean    read FPagamentos   write FPagamentos;
    property Recebimentos : Boolean    read FRecebimentos   write FRecebimentos;
    property ParcAberta : Boolean    read FParcAberta   write FParcAberta;
  end;

procedure Register;

Implementation

constructor TCondPag.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    FRegistro1 := TRegistro.Create;
    FRegistro1.Ativar;
    FRegistro1.Tabela := 'CONDPAG';
    FAtivado   := False;
end;

destructor  TCondPag.Destroy ;
Begin
  FRegistro1.Destroy;
  inherited Destroy;
End;

Procedure TCondPag.GravaReg;
Begin
        SetValue;
        FRegistro1.Grava;
End;

Procedure TCondPag.Recupera;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Recupera;
    GetValue;
End;

Function TCondPag.IIFs(Value1 : Boolean;Value2,Value3:Variant) : Variant;
Begin
    If Value1 Then Result := Value2 Else Result := Value3;
End;

Procedure TCondPag.Exclui;
Begin
    FRegistro1.AddValue('CODIGO'     ,FCodigo);
    FRegistro1.Exclui;
End;

Procedure TCondPag.SetValue;
Begin
        FRegistro1.AddValue('CODIGO'   ,FCodigo     );
        FRegistro1.AddValue('DESCRICAO',FDescricao  );
        FRegistro1.AddValue('PARC'     ,FParcelas   );
        FRegistro1.AddValue('AJUSTA'   ,IIfs(FAjusta,'S','N') );
        FRegistro1.AddValue('PRAZOI'   ,FPrazoI     );
        FRegistro1.AddValue('VARIACAO' ,FVariacao   );
        FRegistro1.AddValue('DIAFIXO'  ,FDiaFixo    );
        FRegistro1.AddValue('LIMITE'   ,FLimite     );
        FRegistro1.AddValue('ENCFIN'   ,FEncFin     );
        FRegistro1.AddValue('DESCONTOPERC'   ,FDESCONTOPERC     );
        FRegistro1.AddValue('DESCONTOVALOR'   ,FDESCONTOVALOR     );
        FRegistro1.AddValue('MULTAPERC'   ,FMULTAPERC     );
        FRegistro1.AddValue('MULTA'   ,FMULTAVALOR     );
        FRegistro1.AddValue('MORA'   ,FMORA     );
        FRegistro1.AddValue('MORAMES'   ,FMoraMes     );
        FRegistro1.AddValue('AVISTA'   ,FAVista     );
        FRegistro1.AddValue('VARIAMES'   ,Iifs(FVariaMes,'S','N')     );
        FRegistro1.AddValue('PAGAVISTA' ,Iifs(FPagAVista,'S','N')  );
        FRegistro1.AddValue('LIMITE_CRED' ,Iifs(FLimite_Cred,'S','N')  );
        FRegistro1.AddValue('FORMADEPAG',FFormaDePag);
        FRegistro1.AddValue('PARCABERTA' ,Iifs(FParcAberta,'T','N')  );
        FRegistro1.AddValue('RECEBIMENTO' ,Iifs(FRecebimentos,'T','N')  );
        FRegistro1.AddValue('PAGAMENTO',Iifs(FPagamentos,'T','N'));

End;


Procedure TCondPag.GetValue;
Begin
     FCodigo    :=  FRegistro1.GetValue('CODIGO'    );
     FDescricao :=  FRegistro1.GetValue('DESCRICAO' );
     FParcelas  :=  FRegistro1.GetValue('PARC'      );
     FAjusta    :=  IIfs(FRegistro1.GetValue('AJUSTA'    )='S',True,False);
     FPrazoI    :=  FRegistro1.GetValue('PRAZOI'    );
     FVariacao  :=  FRegistro1.GetValue('VARIACAO'  );
     FDiaFixo   :=  FRegistro1.GetValue('DIAFIXO'   );
     FLimite    :=  FRegistro1.GetValue('LIMITE');
     FMORA    :=  FRegistro1.GetValue('MORA'    );
     FMoraMes    :=  FRegistro1.GetValue('MORAMES'    );
     FDESCONTOVALOR    :=  FRegistro1.GetValue('DESCONTOVALOR');
     FDescontoPerc    :=  FRegistro1.GetValue('DESCONTOPERC');
     FMultaVALOR    :=  FRegistro1.GetValue('MULTA');
     FMultaPerc    :=  FRegistro1.GetValue('MULTAPERC');
     FEncFin    :=  FRegistro1.GetValue('ENCFIN'    );
     FAvista    :=  FRegistro1.GetValue('AVISTA'    );
     FVARIAMES    :=  Iifs(FRegistro1.GetValue('VARIAMES' )='S',True,False);;
     FPagAVista :=  Iifs(FRegistro1.GetValue('PAGAVISTA' )='S',True,False);
     FLimite_Cred :=  Iifs(FRegistro1.GetValue('LIMITE_CRED' )='S',True,False);
     FPARCABERTA :=  Iifs(FRegistro1.GetValue('PARCABERTA' )='T',True,False);
     FRECEBIMENTOS :=  Iifs(FRegistro1.GetValue('RECEBIMENTO' )='T',True,False);
     FPAGAMENTOS :=  Iifs(FRegistro1.GetValue('PAGAMENTO' )='T',True,False);
     FFormaDePAg:=  FRegistro1.GetValue('FORMADEPAG');
End;


Procedure TCondPag.Ativa;
Begin
    If FAtivado Then Exit;

    FRegistro1.BancoDeDados := FDataBase;
    FRegistro1.AddChave('CODIGO',varString);

    FRegistro1.Add('DESCRICAO',VarString);
    FRegistro1.Add('PARC'     ,VarInteger);
    FRegistro1.Add('AJUSTA'   ,VarString);
    FRegistro1.Add('PRAZOI'   ,VarInteger);
    FRegistro1.Add('VARIACAO' ,VarInteger);
    FRegistro1.Add('DIAFIXO'  ,VarInteger);
    FRegistro1.Add('LIMITE'   ,VarInteger);
    FRegistro1.Add('ENCFIN'   ,VarCurrency);
    FRegistro1.Add('DESCONTOPERC'   ,VarCurrency);
    FRegistro1.Add('MORA'   ,VarCurrency);
    FRegistro1.Add('MORAMES'   ,VarCurrency);
    FRegistro1.Add('DESCONTOVALOR'   ,VarCurrency);
    FRegistro1.Add('MULTAPERC'   ,VarCurrency);
    FRegistro1.Add('MULTA'   ,VarCurrency);
    FRegistro1.Add('AVISTA'   ,VarCurrency);
    FRegistro1.Add('VARIAMES'   ,VarString);

    FRegistro1.Add('PAGAVISTA'   ,VarString);
    FRegistro1.Add('LIMITE_CRED' ,VarString);
    FRegistro1.Add('FORMADEPAG'   ,VarString);
    FRegistro1.Add('PARCABERTA'   ,VarString);
    FRegistro1.Add('PAGAMENTO'   ,VarString);
    FRegistro1.Add('RECEBIMENTO'   ,VarString);


    FAtivado := True;
End;

Function TCondPag.GetData(Value : TDateTime;Valor:Currency) :TTipoCondA;
Var Retorno : TTipoCondA;
    Data    : TDateTime;
    ValorRat,ValorDif,ValorSoma : Currency;
    Loop,Ano,Mes,Dia : Word;
    Letra1,Letra2 : String;
Begin
     SetLength(Retorno,FParcelas);
     If FEncFin <> 0 then
       Valor := (1 + FParcelas * (EncFin/100)) * Valor;

     ValorRat := StrToCurr(FormatFloat('0.00',Valor / FParcelas));
     ValorSoma := ValorRat * FParcelas;
     ValorDif  := Valor - ValorSoma;

     Data := Value;

     Data := Data + FPrazoI;
     DecodeDate(Data,Ano,Mes,Dia);

     If FDiaFixo = 0 Then
         //Data := Data + FVariacao
     Else Begin
         If Dia + FLimite > FDiaFixo Then Begin
               If Mes = 12 Then Begin
                     Mes := 1;
                     Ano := Ano + 1;
               End
               Else
                  Mes := Mes + 1;
         End;
         Data := EnCodeDate(Ano,Mes,FDiaFixo);
     End;

     Value := Data;

     For Loop := 1 To FParcelas Do Begin
         Letra1  := Chr(65 + ((Loop-1) Mod 26) );
         Letra2  := Chr(((Loop-1) div 26 )* 65);
         Retorno[Loop-1].Documento := FDocumento + Letra1 + IIfs(Letra2<>#0,Letra2,'');

         If FAjusta Then
             Data := SetData(Data);

         If Loop = FParcelas Then
            ValorRat := ValorRat + ValorDif;

         if FVariames then begin
            Retorno[Loop-1].Valor := ValorRat;
            Data := IncMonth(Value,Loop - 1);
            If FAjusta Then
             Data := SetData(Data);
            Retorno[Loop-1].Data  := Data;
            continue;
         end;



         If FDiaFixo = 0 Then Begin
            Retorno[Loop-1].Data  := Data;
            Retorno[Loop-1].Valor := ValorRat;
            Data := Data + FVariacao
         End
         Else Begin

            Retorno[Loop-1].Data  := Data;
            Retorno[Loop-1].Valor := ValorRat;

            DecodeDate(Data,Ano,Mes,Dia);
            If Mes = 12 Then Begin
                 Mes := 1;
                 Ano := Ano + 1;
            End
            Else
                 Mes := Mes + 1;
            Data := EnCodeDate(Ano,Mes,FDiaFixo);
         End;
     End;
     Result := Retorno;
End;

Function TCondPag.SetData(Value : TDateTime):TDateTime;
Var DiaSemana : String;
Begin
     DiaSemana := FormatDateTime('ddd',Value);

     If DiaSemana = ShortDayNames[1] Then
           Value := Value + 1
     Else If DiaSemana = ShortDayNames[2] Then
           Value := Value + 2;
     Result := Value;
End;

procedure Register;
begin
  RegisterComponents('Entidades', [TCondPag]);
end;

function TCondPag.GetAVista(Value: Currency): Currency;
begin
   if FAVista = 0 then
    Result := 0
   else
    Result := Value * (FAVista/100);
end;

End.
