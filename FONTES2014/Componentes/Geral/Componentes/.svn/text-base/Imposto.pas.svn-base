unit Imposto;

interface
Uses Classes,Forms,DbTables,Sysutils,TipoDEf;

Type

  TICMS = Record
      UfOrg         :String;
      UfDest        :String;
      EntSai        :String;
      SubstTrib     :boolean;
      Aliquota      :Currency;
      AliqSubstTrib :Currency;
      Isento        :Boolean;
  end;





  TImposto = class(TComponent)
  private
    { Private declarations }
    FOperacao : String ;

    FBancoDeDados : TDataBase;
    FPesquisa : TQuery;

    FVlBase       : Currency;
    FProduto      : String;
    FAlmoxarifado : STring;
    FEmpresa      : String;
    FCliente      : String;
    FVendaConsumo : Boolean;
    FAliqIpi      : Currency;
    FAliqIcms     : Currency;
    FUfPed: String;
    Procedure Ativa;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Property UfPed      : String    read  FUfPed       write FUfPed       ;
    Function GetIcms : Currency;
    Function GetIpi  : Currency;
    Function GetAIcms : Currency;
    Function GetAIpi  : Currency;
    Function GetCFO : String;
    constructor Create(AOwner: TComponent);override;
    destructor destroy ; override;
  published
    { Published declarations }
    property Operacao     : String   read FOperacao        write FOperacao;
    property BancoDeDados : TDataBase read FBancoDeDados   write FBancoDeDados;
    Property VlBase       : Currency  read FVlBase         write FVlBase;
    Property Produto      : String    read  FProduto       write FProduto       ;
    Property Almoxarifado : STring    read  FAlmoxarifado  write FAlmoxarifado  ;
    Property Empresa      : String    read  FEmpresa       write FEmpresa       ;
    Property Cliente      : String    read  FCliente       write FCliente       ;
    Property VendaConsumo : Boolean   read  FVendaConsumo  write FVendaConsumo default False ;
  end;


procedure Register;

Function AliquotaICms(ICms:TICMS):Currency;



Implementation

constructor TImposto.Create(AOwner: TComponent);
begin
    FPEsquisa := TQuery.Create(inherited Create(AOwner));
end;

destructor  TImposto.Destroy ;
Begin
  FPesquisa.Destroy;
  inherited Destroy;
End;

Procedure TImposto.Ativa;
Begin
    FPesquisa.DataBaseName := FBancoDeDados.DataBaseName;
End;

Function TImposto.GetIcms:Currency;
Var FPrecSubst,FVlIcms,ValorIpi : Currency;
    GeraBaseIcms,IpiBaseIcms,FIpi,fsubsttrib,fdev : Boolean;
    UFO,UfD,Cliente : String;
Begin
    Result := 0;
    ValorIPI := 0;
    With FPesquisa Do Begin
              Ativa;
              Sql.Clear;
              Sql.Add('SELECT DEV,ICMS,IPIBASEICMS,IPI,CLIENTE,SUBSTTRIB FROM TIPODEOPERACAO WHERE CODIGO = :CODIGO');
              Params[0].AsString := FOperacao;
              Open;

              If FPesquisa.FieldByName('ICMS').AsString <> 'S' then
                Exit;

              GeraBaseIcms := (FPesquisa.FieldByName('ICMS').AsString = 'S');
              IpiBaseIcms  := (FPesquisa.FieldByName('IPIBASEICMS').AsString = 'S');
              FIpi         := (FPesquisa.FieldByName('IPI').AsString = 'S');
              FSubstTrib   := (FPesquisa.FieldByName('SubstTrib').AsString = 'S');
              FDEV         := (FPesquisa.FieldByName('DEV').AsString = 'S');
              Cliente      := FPesquisa.FieldByName('CLIENTE').AsString;



              Sql.Clear;
              Sql.Add('SELECT ISENTOICMS,VALORICMS_PROD,PRECSUBST FROM PRODUTO WHERE COD_PROD = :CODIGO AND ALMOX_PROD = :ALMOX');
              Params[0].AsString := FProduto;
              Params[1].AsString := FAlmoxarifado;
              Open;

              If FieldByName('ISENTOICMS').AsBoolean then
                 Exit;


              FAliqIcms   := iifs(Not FSubstTrib or (FieldByName('precsubst').AsCurrency <= 0),FieldByName('VALORICMS_PROD').AsCurrency
                                 ,FieldByName('precsubst').AsCurrency);


              If Not((FAliqIcms > 0) and ((Cliente = 'S') or FSubstTrib)) then begin
                  sql.clear;
                  If (Not FSubstTrib and (cliente = 'S')) or
                     (FSubstTrib and (cliente <> 'S'))    then begin
                        If (Cliente <> 'S') Then
                            Sql.Add('SELECT UF_FORN AS UF_FAT FROM AQFORNEC WHERE COD_FORN = :CODIGO')
                        else
                            Sql.Add('SELECT UF_Fat FROM Cliente WHERE COD_CLIENTE = :CODIGO');
                        Params[0].AsString := FCliente;
                        Open;
                  end else begin
                        Sql.Add('SELECT EST_EMP as UF_FAT FROM ARQEMP WHERE  COD_EMP = :CODIGO');
                        Params[0].AsString := FEmpresa;
                        Open;
                  end;

                  UfD := FieldByName('UF_FAT').AsString;

                  Sql.Clear;
                  Sql.Add('SELECT VALOR FROM ICMS WHERE ESTADO = :CODIGO');
                  Params[0].AsString := UFD;
                  Open;
                  FAliqIcms := FieldByName('VALOR').AsCurrency;
              end;


              Result := FaliqIcms/100 * (VlBase + IIfs(IpiBaseIcms and FIPI,GetIPI,0));
    End;

End;

Function TImposto.GetIpi:Currency;
Var FIpi : Boolean;
    FVlIpi : Currency;
Begin
    Result := 0;
    With FPesquisa Do Begin
       Ativa;
       Sql.Clear;
       Sql.Add('SELECT IPI FROM TIPODEOPERACAO WHERE CODIGO = :CODIGO');
       Params[0].AsString := FOperacao;
       Open;
       FIPI := (FPesquisa.FieldByName('IPI').AsString = 'S');

       Sql.Clear;
       Sql.Add('SELECT VALORIPI_PROD FROM PRODUTO WHERE COD_PROD = :CODIGO AND ALMOX_PROD = :ALMOX');
       Params[0].AsString := FProduto;
       Params[1].AsString := FAlmoxarifado;
       Open;
       FAliqIPI := FieldByName('VALORIPI_PROD').AsCurrency;

        If FIpi Then
           FVlIpi := StrToCurr(FormatFloat('0.00',FVlBase * FAliqIPI/100))
        Else
           FVlIpi := 0;

        Result := FVlIpi;
    End;
End;

Function TImposto.GetCFO : String;
Var Value,UFO,UFD,cTipo,Clifor : String;
Begin
    Result := '';
    With FPesquisa Do Begin
       Ativa;
       Sql.Clear;
       Sql.Add('SELECT Cliente,CFO,TIPO FROM TIPODEOPERACAO WHERE CODIGO = :CODIGO');
       Params[0].AsString := FOperacao;
       Open;

       Value  := FieldByName('CFO').AsString;
       cTipo  := FieldByName('TIPO').AsString;
       Clifor := IIfs(FieldByName('Cliente').AsString = 'S','C','F');

       If Value = '' then begin
         Result := '';
         Exit;
       end;

       Sql.Clear;
       Sql.Add('SELECT EST_EMP FROM ARQEMP WHERE  COD_EMP = :CODIGO');
       Params[0].AsString := FEmpresa;
       Open;
       UfO := FieldByName('EST_EMP').AsString;

       Sql.Clear;
       If CliFor = 'C' then
         Sql.Add('SELECT UF_FAT AS UF FROM CLIENTE WHERE COD_CLIENTE = :CODIGO')
       else
         Sql.Add('SELECT UF_FORN AS UF FROM AQFORNEC WHERE COD_fORN = :CODIGO');
       Params[0].AsString := FCliente;
       Open;
       UfD := FieldByName('UF').AsString;

       If UfO = UfD Then Begin
          If cTipo = 'E' Then
             Value := '1'+Value
          Else
             Value := '5'+Value;
       End
       Else Begin
          If cTipo = 'E' Then
             Value := '2'+Value
          Else
             Value := '6'+Value;
       End;
    End;
    Result := Value;
End;


Function TImposto.GetAIpi:Currency;
Begin
   Result := FAliqIpi;
End;


Function TImposto.GetAIcms:Currency;
Begin
  Result := FAliqIcms;
End;


procedure Register;
begin
  RegisterComponents('Sistema', [TImposto]);
end;

Function AliquotaICms(ICms:TICMS):Currency;
Begin
    Result := 0;

    With Icms do begin
      If Isento Then Exit;
      Aliquota  := IIfs(SubstTrib and (AliqSubstTrib > 0),AliqSubstTrib,Aliquota);

      If (Aliquota > 0) and ((EntSai = 'E') or SubstTrib or (UfOrg = UfDest)) then
        result := Aliquota
      else begin
        With TQuery.Create(Application) do
         Try
           DataBaseName := 'BD';
           Sql.Add('Select Valor From ICMS ');
           Sql.Add('Where Estado = '''+IIfs((SubstTrib and (EntSai = 'S')) or
                                            (Not SubstTrib and (EntSai = 'E'))
                                            ,UfOrg,UfDest)+'''');
           Open;                                 
           Result := FieldByNAme('Valor').AsFloat; 
         Finally
           Destroy;
         end;
      end;
    end;   
end;

End.
