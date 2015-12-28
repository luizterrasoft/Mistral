unit Gravacao;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db,DbTables,TipoDef,FuncoesGlobais,Variants;

type

  TProc = Procedure (Sender : TObject;Valor : Variant) of Object;

  TEventGrav = Procedure (Sender : TObject) of Object;

  TEstadoGravacao = (GRInsert,GRDelete,GRRetornando);

  TCampoGravacao = Record
    Campo   : String;
    Valor   : Variant;
    Tipo    : TTipoCampo;
    Chave   : Boolean;
    Obrigatorio : Boolean;
    Objeto  : TObject;
    Procedimento : TProc;
    MasterCampo:String;
    DetalCampo : String;
    Todos        : Boolean;
    Coluna       : Integer;
    Negativa     : Boolean;
    Recupera     : Boolean;
    Registro     : Integer;
  end;

  TCamposGravacao = Array of TCampoGravacao;

  TLinhasGravacao = Record
    Linha  :Word;
    Campos : TCamposGravacao;
  end;


  TGravacao = class(TComponent)
  private
    FPosRetorno  : TEventGrav;
    FChavesMaster: TStringList;
    FChavesDetal: TStringList;
    VarBancoDados   : String;
    VarTabela       : String;
    VarObjectSetado : TWinControl;
    FRegMarcado     : Integer;
    FColMarcada     : Integer;
    FMGravacao: TGravacao;
    FNaoZeraRegistros: Boolean;
    FBeforeRetorno: TEventGrav;
    Procedure AdicionaParametrosQuery(Qry:Tquery;TemWhere:Boolean);
    Procedure SetBancoDados(Value:String);
    procedure SetChavesDetal(Const Value : TStringList);
    procedure SetChavesMaster(Const Value : TStringList);
    procedure SetMGravacao(const Value: TGravacao);
    Procedure AlimentaCamposMasterDetal(CamposMAster,CamposDetal:TStringList);
    { Private declarations }
  protected
    DetalGravacao         : Array of TGravacao;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    Procedure  RetornaValores;
    Procedure DeletaCamposRegistro(Ind:Integer;Campo:String);
    { Protected declarations }
  public
    MasterRecupera : Boolean;
    RegistroSelecionado : Array of TCampoGravacao;
    PrimeiroRegistro : Boolean;
    Editando       : Boolean;
    QtdeRegistros  : Integer;
    EstadoGravacao : TEstadoGravacao;
    campos         : array of TCampoGravacao;
    VetorObjeto    : Array of TObject;
    ValorRetornoGravacao : Variant;
    Registros: Array of TLinhasGravacao;
    ObjetoRetornoGravacao : Tobject;
    CampoMarcado          : String;
    procedure AdicionaObjetos(Campo:String;ValorCampo:String;Tipo:TTipoCampo;Chave:Boolean;Objeto:Tobject;
                              Procedimento:TProc);
    procedure AlimentaValores(Campo:String;ValorCampo:Variant;Tipo:TTipoCampo;VarChave,Obrigatorio:Boolean);
    Procedure DeletaCampo(Campo:String);
    procedure Gravar;
    Procedure Recupera(Sender : TObject);
    Procedure IncluiObjeto(VarObjeto:TObject);
    Procedure Deleta(Sender : TObject);
    procedure CamposGravacao(CampoObjeto: TCampoGravacao);
    Procedure RegistroGravacao(Ind:Integer;Campo:TCampoGravacao);
    Procedure DeletaRegistro(Ind:Integer);
    Procedure DeletaCampoObjeto(Campo:String;Objeto:TObject);
    Procedure Alimentaregistros(CamposReg: TCamposGravacao);
    Property  RegistroMarcado : Integer Read FRegMarcado Write FRegMarcado Default 0;
    Property  ColunaMarcada   : Integer Read FColMarcada Write FColMarcada Default 0;
    { Public declarations }
  published
    property BancodeDados    : String Read VarBancoDados Write SetBancoDados;
    property Foco            : TWinControl Read VarObjectSetado Write VarObjectSetado;
    property Tabela          : String read VarTabela     Write VarTabela;
    Property MasterGravacao:TGravacao Read FMGravacao Write SetMGravacao;
    Property ChavesMaster    : TStringList Read FChavesMaster Write SetChavesMaster;
    Property ChavesDetal      : TStringList Read FChavesDetal Write SetChavesDetal;
    Property PosRetorno         : TEventGrav  Read FPosRetorno Write FPosRetorno;
    Property BeforeRetorno      : TEventGrav  Read FBeforeRetorno Write FBeforeRetorno;
    Property NaoZeraRegistros  : Boolean  Read FNaoZeraRegistros Write FNaoZeraRegistros Default False;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TGravacao]);
end;

{ TGravacao }

procedure TGravacao.Gravar;
var
pesquisa : tquery;
i,i2,i3  : integer;
camposLocal : Array of TCampoGravacao;
qtdparametros : integer;
gravacaolocal,DetalGravacaolocal : TGravacao;
begin
      For i2:=0 to Length(Registros) - 1 do begin
           pesquisa := tquery.create(application);
          pesquisa.databasename := VarBancoDados;
          EstadoGravacao := GRInsert;
          SetLength(CamposLocal,0);

            If FMGravacao <> Nil then begin
                for i:=0 to ChavesMaster.Count - 1 do begin
                   for i3:=0 to Length(FmGravacao.Campos) - 1 do begin
                     If Not (Uppercase(ChavesMaster[i]) = Uppercase(FmGravacao.Campos[i3].Campo)) then
                       Continue;

                       setlength(CamposLocal,Length(CAmposLocal) + 1);
                       camposlocal[Length(CAmposLocal) - 1]       := FmGravacao.Campos[i3];
                       camposlocal[Length(CAmposLocal) - 1].Campo := ChavesDetal[i];
                  end;
                end;
           end;

           for i:=0 to Length(Registros[i2].Campos) - 1 do Begin
                If (Registros[i2].Campos[i].Obrigatorio) and (VariantVazia(Registros[i2].Campos[i].Valor)) then
                 begin
                   If (Registros[i2].Campos[i].Objeto <> nil) then
                      TWinControl(Registros[i2].Campos[i].Objeto).SetFocus;
                     ShowMessage('Dado Obrigatório');
                     SysUtils.Abort;
                  end;

               if not VariantVazia(Registros[i2].Campos[i].Valor) then begin
                  setlength(CamposLocal,Length(CAmposLocal) + 1);
                  camposlocal[Length(CAmposLocal) - 1] := Registros[i2].Campos[i];
               end;
            end;





          with pesquisa do begin
               sql.clear;
               sql.add('Select  '+CamposLocal[0].Campo);
               sql.add('From  '+VarTabela);
               AdicionaParametrosQuery(Pesquisa,False);
               open;
                 If (Eof) or (FMGravacao <> Nil) Then begin
                     sql.clear;
                     sql.add('Insert Into  '+VarTabela);
                     sql.add('(  ');
                     sql.add(CamposLocal[0].Campo);
                      for i:=1 to length(CamposLocal) - 1 do
                        sql.add(', '+CamposLocal[i].Campo);
                     sql.add(' )');
                     sql.add('Values ( ');
                     sql.add(':'+CamposLocal[0].Campo);
                      for i:=1 to length(CamposLocal) - 1 do
                        sql.add(',:'+CamposLocal[i].Campo);
                     sql.add(' )');
                  end
                else
                 begin
                     sql.clear;
                     sql.add('Update  '+VarTabela+'  Set ');
                     qtdparametros := 0;
                        for i:=0 to length(CamposLocal) - 1 do begin
                          If  CamposLocal[i].Chave then
                            continue;

                            if paramcount = 0 then
                               sql.add(CamposLocal[i].Campo+' = :'+CamposLocal[i].Campo)
                            else
                               sql.add(', '+CamposLocal[i].Campo+' = :'+CamposLocal[i].Campo);

                            inc(qtdparametros);
                        end;

                        for i:=0 to length(CamposLocal) - 1 do begin
                          If not CamposLocal[i].Chave then
                           continue;

                             if paramcount = qtdparametros then Begin
                                 sql.add(' Where   '+CamposLocal[i].Campo+' = :'+CamposLocal[i].Campo);
                                 qtdparametros := 0;
                              end
                             else
                               sql.add(' And   '+CamposLocal[i].Campo+' = :'+CamposLocal[i].Campo);


                            inc(qtdparametros);
                        end;

                 end;

                               
                for i:=0 to length(CamposLocal) - 1 do
                   IncluiParametrosVariant(parambyname(CamposLocal[i].campo),CamposLocal[i].Valor);


               execsql;
               free;
          end;
      end;


      For i:=0 to Length(DetalGravacao)  - 1 do begin
         DetalGravacao[i].Deleta(Self);
         DetalGravacao[i].Gravar;
      end;

      for i:=0 to Length(Campos) - 1 do Begin
         If (Campos[i].Objeto <> nil) then
             Campos[i].Procedimento(Campos[i].Objeto,Campos[i].valor);
      end;


      If VarObjectSetado <> nil then
        TWinControl(VarObjectSetado).SetFocus;


end;



procedure TGravacao.AdicionaObjetos(Campo:String;ValorCampo:String;Tipo:TTipoCampo;Chave:Boolean;Objeto:Tobject;
                                    Procedimento:TProc);
var
i : integer;
CamposGravacao : TCampoGravacao;
begin

{      if Campo = '' then
       exit;


      for i:=0 to Length(Campos) - 1 do begin
        if Uppercase(Campos[i].campo) = Uppercase(CamposGravacao.Campo) then begin
           Campos[i]   := CamposGravacao;
           exit;
        end;
      end;
      SetLength(Campos,Length(Campos) + 1);
      Campos[Length(Campos) - 1].Campo  :=  Campo ;
      Campos[Length(Campos) - 1].Valor  :=  VAlorCAmpo  ;
      Campos[Length(Campos) - 1].Tipo   :=  Tipo  ;
      Campos[Length(Campos) - 1].Chave  :=  Chave;
      Campos[Length(Campos) - 1].Objeto :=  Objeto;
      Campos[Length(Campos) - 1].Procedimento := Procedimento;}
end;


procedure TGravacao.Recupera(Sender : TObject);
var
i,i2 : integer;
VarPonteiro : TProc;
temwhere : boolean;
Pesquisa : Tquery;
OldRegMarcado : Integer;
begin
   if Assigned(FBeforeRetorno) then
      FBeforeRetorno(Self);

    PrimeiroRegistro := False;
    Pesquisa := TQuery.Create(Application);
    EstadoGravacao := GRRetornando;
    with pesquisa do begin
         DatabaseName := VArBAncoDados;
         sql.clear;
         sql.add('Select ');
         sql.add(VarTabela+'.'+campos[0].campo);
         for i:=1 to length(campos) - 1 do
           sql.add(','+VarTabela+'.'+campos[i].campo);
         sql.add('From  '+VarTabela);

         If FMGravacao <> Nil then begin

           if Not FNaoZeraRegistros then
             SetLength(Registros,0);

            sql.add(','+FmGravacao.Tabela);
            for i:=0 to ChavesMaster.Count - 1 do begin
                   if Not temWhere then begin
                      TemWhere := True;
                      Sql.Add(' Where   ');
                   end
                  else
                     Sql.Add(' And   ');

                  Sql.add(FmGravacao.Tabela+'.'+ChavesMaster[i]+' = '+VarTabela+'.'+ChavesDetal[i]);
            end;
        end;

         AdicionaParametrosQuery(Pesquisa,TemWhere);
         open;
         QtdeRegistros := RecordCount;

         PrimeiroRegistro := true;
         editando := not eof;
         first;

         i:=0;
         ValorRetornoGravacao := Unassigned;
         if not eof then begin
             For i:=0 to Length(Campos) - 1 do begin
                    FColMarcada    := Campos[i].Coluna;
                    If (Campos[i].Objeto =  nil)  then
                      continue;
                     first;
                     FregMarcado := -1;
                     While Not Eof Do Begin
                             ValorRetornoGravacao :=   VariantToField(FieldByName(Campos[i].Campo),Campos[i].Tipo);
                             CampoMarcado        := Campos[i].Campo;

{                             if RecNo > 0 then
                                FregMarcado         := RecNo - 1
                             else
                                FregMarcado         := RecNo + 1;}
                             FRegMarcado := FRegMarcado + 1;
                             SetLength(RegistroSelecionado,0);
                             for i2:=0 to FieldDefs.Count - 1 do begin
                               SetLength(RegistroSelecionado,Length(RegistroSelecionado) + 1);
                               RegistroSelecionado[Length(RegistroSelecionado) - 1].Campo := FieldDefs.Items[I2].Name;
                               RegistroSelecionado[Length(RegistroSelecionado) - 1].Valor := FieldToVariant(FieldByName(FieldDefs.Items[I2].Name));
                               RegistroSelecionado[Length(RegistroSelecionado) - 1].Tipo  := DataTypeToTTipoCampo(FieldByName(FieldDefs.Items[I2].Name).DataType);
                             end;


                             Campos[i].Procedimento(Campos[i].Objeto,ValorRetornoGravacao);

                             If PrimeiroRegistro then PrimeiroRegistro := False;

                             Pesquisa.Next;
                     end;
               end;
            end
            else begin
                for i:=0 to Length(Campos) - 1 do begin
                   If (Campos[i].Objeto <>  nil) and (Campos[i].Objeto <>  Sender) then begin
                    Campos[i].Procedimento(Campos[i].Objeto,ValorRetornoGravacao);
                    If PrimeiroRegistro then PrimeiroRegistro := False;
                   end;
                end;
            end;

         FRegMarcado := 0;
         Pesquisa.Destroy;
    end;

   if Assigned(FPosRetorno) then
      FPosRetorno(Self);

   for i:=0 to Length(DetalGravacao) - 1 do begin
      DetalGravacao[i].masterrecupera := True;
      DetalGravacao[i].Recupera(Sender);
      DetalGravacao[i].masterrecupera := False;
    end;

end;

procedure TGravacao.IncluiObjeto(VarObjeto: TObject);
var
i : integer;
begin
{   for i:=0 to Length(VetorObjeto) - 1 do begin
     If VarObjeto = VetorObjeto[i] then
      exit;
   end;


   setlength(VetorObjeto,Length(vetorobjeto) + 1);
   Campos[Length(Campos) - 1].Campo   :=  Campo;
   Campos[Length(Campos) - 1].Tipo    :=  Tipo;
   Campos[Length(Campos) - 1].Valor   :=  ValorCAmpo;
   Campos[Length(Campos) - 1].Chave   :=  VarChave;}

end;

procedure TGravacao.AlimentaValores(Campo:String;ValorCampo:VAriant;Tipo:TTipoCampo;VarChave,Obrigatorio:Boolean);
var
i,i2,i3 : integer;
begin



      if (Campo = '')  then
       exit;

      for i:=0 to length(Campos) - 1 do begin
           if Uppercase(Campos[i].campo) = Uppercase(Campo) then begin
              break;
            end;
      end;

      if (I > length(Campos) - 1) or (Length(Campos) = 0) then begin
        SetLength(Campos,Length(Campos) + 1);
        I := Length(Campos) - 1;
      end;

      Campos[I].Campo   :=  Campo;
      Campos[I].Tipo    :=  Tipo;
      Campos[I].Obrigatorio    :=  Obrigatorio;
      Campos[I].Valor   :=  ValorCAmpo;
      Campos[I].Chave   :=  VarChave;
      Campos[I].Todos   := True;
      For i2:=0 to Length(Registros) - 1 do begin
        For i3:=0 to Length(Registros[I2].Campos) - 1 do
          If Uppercase(Campo) = Uppercase(Registros[I2].Campos[i3].campo) then
            break;

          If (I3 > Length(Registros[I2].Campos) - 1) or (Length(Registros[I2].Campos) = 0) then begin
             setlength(Registros[I2].Campos,Length(Registros[I2].Campos) + 1);
             I3 := Length(Registros[I2].Campos) - 1;
          end;

          Registros[I2].Campos[i3] := Campos[i];
      end;



end;
constructor TGravacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetLength(Campos,0);
  editando := false;
  FChavesDetal  := TStringList.Create;
  FChavesMaster := TStringList.Create;
end;

destructor TGravacao.Destroy;
begin
  FChavesDetal.destroy;
  FChavesMaster.destroy;
  inherited Destroy;
end;

procedure TGravacao.AdicionaParametrosQuery(Qry:Tquery;TemWhere:Boolean);
var
i,i2,i3 : integer;
begin
  with qry do begin

    If FMGravacao <> Nil then begin
        for i:=0 to ChavesMaster.Count - 1 do begin
           for i2:=0 to Length(FmGravacao.Campos) - 1 do begin
             If Not (Uppercase(ChavesMaster[i]) = Uppercase(FmGravacao.Campos[i2].Campo)) then
               Continue;

             if (paramcount = 0) and Not TemWhere then
               sql.add('Where  '+VarTabela+'.'+ChavesDetal[i]+' = :'+ChavesDetal[i])
            else
               sql.add('And    '+VarTabela+'.'+ChavesDetal[i]+' = :'+ChavesDetal[i]);


            CarregaParametro(FmGravacao.Campos[i2].Valor,tipocampotovariant(FmGravacao.Campos[i2].Tipo),ParamByName(ChavesDetal[i]));
          end;
        end;
   end;

{   If Length(Registros) > 0 then begin
            For i:=0 to Length(registros) - 1 do begin
              If  Registro[FregMarcado] then
                 continue;

              for i2:=0 to length(Registros[I].Campos) - 1 do begin
                  if not Registros[I].Campos[i2].chave then
                    continue;

                   if (paramcount = 0) and Not TemWhere then
                    sql.add('Where  '+VarTabela+'.'+Registros[I].CAmpos[i2].Campo+' = :'+Registros[I].CAmpos[i2].Campo)
                   else
                    sql.add('And    '+VarTabela+'.'+Registros[I].CAmpos[i2].Campo+' = :'+Registros[I].CAmpos[i2].Campo);

                     CarregaParametro(Registros[I].Campos[i2].Valor,tipocampotovariant(Registros[I].Campos[i2].Tipo),ParamByName(Registros[I].Campos[i2].Campo));
                end;
          end;
     end
   else begin}
         For i:=0 to Length(Campos) - 1 do begin
                    if (not Campos[I].chave) or ((FMGravacao <> Nil) and Not(Campos[i].Todos)) then
                      continue;

                     if (paramcount = 0) and Not TemWhere then
                      sql.add('Where  '+VarTabela+'.'+Campos[I].Campo+' = :'+Campos[I].Campo)
                     else
                      sql.add('And    '+VarTabela+'.'+Campos[I].Campo+' = :'+Campos[I].Campo);

                       CarregaParametro(Campos[I].Valor,tipocampotovariant(Campos[I].Tipo),ParamByName(Campos[I].Campo));
         end;

  end;
end;

procedure TGravacao.Deleta(Sender : TObject);
var
pesquisa : Tquery;
i : integer;
begin
    EstadoGravacao := GRDelete;
    pesquisa := tquery.create(application);
    pesquisa.databasename := varbancodados;
    with pesquisa do begin
         sql.clear;
         sql.add('Delete ');
         sql.add('From  '+VarTabela);
         AdicionaParametrosQuery(Pesquisa,False);
         execsql;
         free;
    end;

   If (Sender as Sender.ClassType = FMGravacao)  then
    exit;


   for i:=0 to Length(DetalGravacao) - 1 do 
      DetalGravacao[i].Deleta(DetalGravacao[i]);

    for i:=0 to Length(Campos) - 1 do
     if Campos[i].Objeto <> nil then
      Campos[i].Procedimento(Campos[i].Objeto,Campos[i].valor);


    If VarObjectSetado <> nil then
     TWinControl(VarObjectSetado).SetFocus;


end;

procedure TGravacao.DeletaCampo(Campo: String);
var
i,i2:integer;
begin
     DeletaCamposRegistro(0,Campo);

      for i:=0 to length(Campos) - 1 do begin
        if Uppercase(Campos[i].campo) = Uppercase(Campo) then begin
          for i2:=i to length(Campos) - 2  do begin
            campos[i2] :=  campos[i2 + 1];
          end;
            SetLength(campos,Length(campos) - 1);
            exit;
        end;
      end;
end;

procedure TGravacao.CamposGravacao(CampoObjeto: TCampoGravacao);
var
I,I2 :Integer;
begin
    if Length(Registros) = 0 then
      SetLength(Registros,1);

     for i:=0 to length(Campos) - 1 do begin
       if (campoobjeto.objeto = campos[i].objeto) and (campoobjeto.Campo = campos[i].Campo) then
         break;
     end;

    if i > length(Campos) - 1 then
     begin
       setlength(Campos,length(Campos) + 1);
       i := length(Campos) - 1;
     end;

    Campos[i] := CampoObjeto;
    Campos[i].Todos   :=  False;

    for i2:=0 to Length(Registros[0].Campos) - 1 do
     If (Uppercase(Registros[0].Campos[i2].Campo)) = (Uppercase(CampoObjeto.Campo)) then
       break;

    If (I2 > Length(Registros[0].Campos) - 1) or (Length(Registros[0].Campos) = 0) then begin
       setlength(Registros[0].Campos,Length(Registros[0].Campos) + 1);
       i2 := Length(Registros[0].Campos) - 1;
    end;

   Registros[0].Campos[i2] := Campos[i];



    //    RegistroGravacao(CampoObjeto.Registro,CampoObjeto);
end;


procedure TGravacao.RetornaValores;
begin
end;

procedure TGravacao.SetBancoDados(Value: String);
begin
   VarBAncoDados := Value;
end;

procedure TGravacao.RegistroGravacao(Ind: Integer; Campo: TCampoGravacao);
var
i,i2,i3 : integer;
begin
{    for i:=0 to Length(Registros) - 1 do
     if Registros[I].Linha =  Ind then
      break;

     If I > Length(Registros) - 1 then begin
       setlength(Registros,Length(Registros) + 1);
       I := Length(Registros) - 1;
     end;}
{ If Ind > Length(Registros) - 1 then begin
       For i:=0 to  Length(Registros) - 1 do begin
            if I = Ind then
             continue;

            For i2:=0 to Length(Registros[i].campos) - 1 do
              If (Uppercase(Registros[i].campos[i2].Campo) =  Uppercase(Campo.campo)) and  Registros[i].campos[i2].chave
               and (Campo.Valor <>  Registros[i].campos[i2].Valor) then
                    break;

            If I2 > Length(Registros[i].campos) then
             break;
      end;

     if (I > Length(Registros) - 1) or (Length(Registros) = 0) then
       setlength(Registros,Length(Registros) + 1)
     else
       Ind := I;
  end;


     I := Ind;

     for i2:=0 to Length(Registros[i].Campos) - 1 do
      if Uppercase(Registros[i].Campos[i2].Campo) = Uppercase(Campo.Campo) then
        break;

     If i2 > Length(Registros[i].Campos) - 1 then begin
      setlength(Registros[i].Campos,Length(Registros[i].Campos) + 1);
      I2 := Length(Registros[i].Campos) - 1;
     end;

     Registros[i].Campos[i2]      := Campo;

      For i2:=0 to Length(Campos) -1 do begin
          if Not Campos[i2].Todos then
           continue;

          for i3:=0 to Length(Registros[I].Campos) - 1 do begin
              If Uppercase(Campos[i2].Campo) = Uppercase(Registros[I].Campos[i3].Campo) then
               break;
         end;

        If i3 >  Length(Registros[I].Campos) - 1 then
          setlength(Registros[I].Campos,Length(Registros[I].Campos) + 1);

        Registros[I].Campos[i3] := Campos[i2];
     end;}
end;

procedure TGravacao.SetChavesDetal(const Value: TStringList);
begin
  FChavesDetal.Assign(Value);
end;

procedure TGravacao.SetChavesMaster(const Value: TStringList);
var i:integer;
begin
  FChavesMaster.Assign(Value);
end;

procedure TGravacao.SetMGravacao(const Value: TGravacao);
var i,i2 : integer;
begin
  FMGravacao := Value;

  For i:=0 to Length(Value.DetalGravacao) - 1 do begin
   If Value.DetalGravacao[i] = Self then
    Break;
  end;

  If I > Length(Value.DetalGravacao) - 1 then begin
    If Value = Nil then begin
      For I2:=I to Length(Value.DetalGravacao) - 2 do
       Value.DetalGravacao[i2] := Value.DetalGravacao[i2 + 1];

       SetLength(Value.DetalGravacao,Length(Value.DetalGravacao) - 1);
       exit;
     end
    else begin
      SetLength(Value.DetalGravacao,Length(Value.DetalGravacao) + 1);
      I := Length(Value.DetalGravacao) - 1;
    end;
  end;

  Value.DetalGravacao[I] := Self;
end;

procedure TGravacao.AlimentaCamposMasterDetal(CamposMAster,
  CamposDetal: TStringList);
var i,i2 : integer;
begin
end;

procedure TGravacao.DeletaCamposRegistro(Ind: Integer;Campo:String);
var i,i2,i3 : integer;
begin
   For i:=Ind to Length(Registros) - 1 do begin
       For i2:=0 to Length(Registros[i].Campos) - 1 do begin
         If Uppercase(Registros[i].Campos[i2].CAmpo) = Uppercase(Campo) then
          Break;
       end;

      If i2 > Length(Registros[i].Campos) - 1 then
       continue;

      For i3:=i2 to Length(Registros[i].Campos) - 2 do
        Registros[i].Campos[i3] := Registros[i].Campos[i3 + 1];

       SetLength(Registros[i].Campos,Length(Registros[i].Campos) - 1);
       DeletaCamposRegistro(Ind + 1,Campo);
    end;
end;

procedure TGravacao.DeletaRegistro(Ind: Integer);
Var i,i2:Integer;
begin
   For i:=0 to Length(Registros) - 1 do
       If Ind = I then
        Break;

  If I > Length(Registros) - 1 then
   exit;

  For i2:=i to Length(Registros) - 2 do begin
    Registros[i2] := Registros[i2 + 1];
//    Registros[i2].Linha := Registros[i2].Linha - 1;
  end;

  SetLength(Registros,Length(Registros) - 1);
end;


procedure TGravacao.DeletaCampoObjeto(Campo: String; Objeto: TObject);
var
i,i2 : integer;
begin
   For i:=0 to Length(Campos) - 1 do
     If (Uppercase(Campo) = Uppercase(Campos[i].Campo)) and (Objeto = Campos[i].Objeto) then
      break;


   if I <= Length(Campos) - 1 then begin

     for i2:=I to Length(CAmpos) - 2 do
       Campos[I2] := Campos[I2 + 1];

     setLength(Campos,Length(Campos) - 1);
   end;




end;

procedure TGravacao.Alimentaregistros(CamposReg: TCamposGravacao);
var i,i2,i3 : integer;
    varValor : VAriant;
begin
    For i:=0 to Length(Campos) - 1 do begin
       If Campos[i].Todos then begin
        for i2:=0 to Length(CamposReg) - 1 do
          If Uppercase(Campos[i].Campo) = Uppercase(CamposReg[i2].Campo) then
            Break;

          If I2 <=  Length(CamposReg) - 1 then
            Continue;

          SetLength(CamposReg,Length(CamposReg) + 1);
          CamposReg[Length(CamposReg) - 1] := Campos[i];
       end;
    end;


     for i:=0 to length(Registros) - 1 do begin
        for i2:=0 to length(Registros[i].campos) - 1 do begin
           for i3:=0 to Length(CamposReg) - 1 do
             if (Uppercase(CamposReg[i3].Campo) =  Uppercase(Registros[i].campos[i2].Campo)) and (CamposReg[i3].Chave) Then
               break;

            If (I3 <= Length(CamposReg) - 1) and  (VartoStr(Registros[i].campos[i2].Valor) <> VartoStr(CamposReg[i3].Valor)) then
              Break;
        end;

        If I2 > Length(Registros[i].campos) - 1 Then
         Break;
     end;

     If  (Length(Registros) = 0)  or (I > Length(Registros) - 1) then begin
       SetLEngth(Registros,Length(Registros) + 1);
       I := Length(Registros) - 1;
     end;

     Registros[i].campos := camposReg;


end;

end.
