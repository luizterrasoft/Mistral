unit Gravacao;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db,DbTables,TipoDef,FuncoesGlobais;

type

  TProc = Procedure (Sender : TObject;Valor : Variant) of Object;

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
  end;

  TLinhasGravacao = Record
    Linha  :Word;
    Campos : Array of TCampoGravacao;
  end;


  TGravacao = class(TComponent)
  private
    FChavesMaster: TStringList;
    FChavesDetal: TStringList;
    VarBancoDados   : String;
    VarTabela       : String;
    VarObjectSetado : TWinControl;
    FRegMarcado     : Integer;
    FColMarcada     : Integer;
    FMGravacao: TGravacao;
    Procedure AdicionaParametrosQuery(Qry:Tquery;TemWhere:Boolean);
    Procedure SetBancoDados(Value:String);
    procedure SetChavesDetal(Const Value : TStringList);
    procedure SetChavesMaster(Const Value : TStringList);
    procedure SetMGravacao(const Value: TGravacao);
    Procedure AlimentaCamposMasterDetal(CamposMAster,CamposDetal:TStringList);
    { Private declarations }
  protected
    DetalGravacao         : TGravacao;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    Procedure  RetornaValores;
    Procedure DeletaCamposRegistro(Ind:Integer;Campo:String);
    { Protected declarations }
  public
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
    procedure AlimentaValores(Campo:String;ValorCampo:String;Tipo:TTipoCampo;VarChave,Obrigatorio:Boolean);
    Procedure DeletaCampo(Campo:String);
    procedure Gravar;
    Procedure Recupera(Sender : TObject);
    Procedure IncluiObjeto(VarObjeto:TObject);
    Procedure Deleta(Sender : TObject);
    procedure CamposGravacao(CampoObjeto: TCampoGravacao);
    Procedure RegistroGravacao(Ind:Integer;Campo:TCampoGravacao);
    Procedure DeletaRegistro(Ind:Integer);
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
gravacaolocal : TGravacao;
begin
    For i2:=0 to Length(Registros) - 1 do begin
          pesquisa := tquery.create(application);
          pesquisa.databasename := VarBancoDados;
          EstadoGravacao := GRInsert;
          SetLength(CamposLocal,0);

            If FMGravacao <> Nil then begin
                for i:=0 to ChavesMaster.Count - 1 do begin
                   for i3:=0 to Length(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos) - 1 do begin
                     If Not (Uppercase(ChavesMaster[i]) = Uppercase(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos[i3].Campo)) then
                       Continue;

                       setlength(CamposLocal,Length(CAmposLocal) + 1);
                       camposlocal[Length(CAmposLocal) - 1]       := FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos[i3];
                       camposlocal[Length(CAmposLocal) - 1].Campo := ChavesDetal[i];
                  end;
                end;
           end;

           for i:=0 to Length(Registros[i2].Campos) - 1 do Begin
                If (Registros[i2].Campos[i].Obrigatorio) and (VariantVazia(Registros[i2].Campos[i].Valor)) then
                 begin
                   If (Registros[i2].Campos[i].Objeto <> nil) then
                      TWinControl(Registros[i2].Campos[i].Objeto).SetFocus;
                     ShowMessage('Dado OBRIGATÓRIO');
                     SysUtils.Abort;
                  end;

               if not VariantVazia(Registros[i2].Campos[i].Valor) then begin
                  setlength(CamposLocal,Length(CAmposLocal) + 1);
                  camposlocal[Length(CAmposLocal) - 1] := Registros[i2].Campos[i];
               end;
            end;






            //          Campos[i].Procedimento(Campos[i].Objeto,Campos[i].valor);


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
                 If Not((CamposLocal[i].Negativa) and (CamposLocal[i].Tipo = VarCurrency)) then
                   IncluiParametrosVariant(parambyname(CamposLocal[i].campo),CamposLocal[i].Valor)
                else
                   IncluiParametrosVariant(parambyname(CamposLocal[i].campo),-(CamposLocal[i].Valor));


               execsql;
               free;
          end;
      end;


      If DetalGravacao <> Nil then begin
         DetalGravacao.Deleta(Self);
         DetalGravacao.Gravar;
      end;

         GravacaoLocal := Self;
         While GravacaoLocal <> Nil do begin
             for i:=0 to Length(GravacaoLocal.Campos) - 1 do Begin
               If (GravacaoLocal.Campos[i].Objeto <> nil) then
                   GravacaoLocal.Campos[i].Procedimento(GravacaoLocal.Campos[i].Objeto,GravacaoLocal.Campos[i].valor);
             end;
             GravacaoLocal := GravacaoLocal.DetalGravacao;
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
begin
    Pesquisa := TQuery.Create(Application);
    EstadoGravacao := GRRetornando;
    with pesquisa do begin
         DatabaseName := VArBAncoDados;
         sql.clear;
         sql.add('Select ');
         sql.add(campos[0].campo);
         for i:=1 to length(campos) - 1 do
           sql.add(','+campos[i].campo);
         sql.add('From  '+VarTabela);

         If FMGravacao <> Nil then begin
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
                     While Not Eof Do Begin
                            If Not((Campos[i].Negativa) and (Campos[i].Tipo = VarCurrency)) then
                                ValorRetornoGravacao := VariantToField(FieldByName(Campos[i].Campo),Campos[i].Tipo)
                            else
                                ValorRetornoGravacao := -(VariantToField(FieldByName(Campos[i].Campo),Campos[i].Tipo));
                             CampoMarcado := Campos[i].Campo;
                             FregMarcado  := RecNo - 1;
                             Campos[i].Procedimento(Campos[i].Objeto,ValorRetornoGravacao);
                             Pesquisa.Next;
                     end;
               end;
            end
            else begin
                for i:=0 to Length(Campos) - 1 do begin
                   If (Campos[i].Objeto <>  nil) and (Campos[i].Objeto <>  Sender) then
                    Campos[i].Procedimento(Campos[i].Objeto,ValorRetornoGravacao);
                end;
            end;

         FRegMarcado := 0;
         Pesquisa.Destroy;
    end;


   If DetalGravacao <> Nil then
     DetalGravacao.Recupera(Sender);
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

procedure TGravacao.AlimentaValores(Campo:String;ValorCampo:String;Tipo:TTipoCampo;VarChave,Obrigatorio:Boolean);
var
i,i2 : integer;
begin



      if (Campo = '')  then
       exit;

      for i:=0 to length(Campos) - 1 do begin
           if Uppercase(Campos[i].campo) = Uppercase(Campo) then begin
              Campos[i].Valor   :=  ValorCAmpo;
              Campos[i].Chave   :=  VarChave;
              Campos[i].Tipo    :=  Tipo;
              Campos[i].Obrigatorio    :=  Obrigatorio;
              RegistroGravacao(FRegMarcado,Campos[i]);
              exit;
            end;
      end;



      SetLength(Campos,Length(Campos) + 1);
      Campos[Length(Campos) - 1].Campo   :=  Campo;
      Campos[Length(Campos) - 1].Tipo    :=  Tipo;
      Campos[Length(Campos) - 1].Obrigatorio    :=  Obrigatorio;
      Campos[Length(Campos) - 1].Valor   :=  ValorCAmpo;
      Campos[Length(Campos) - 1].Chave   :=  VarChave;
      Campos[Length(Campos) - 1].Todos   :=  True;
      RegistroGravacao(FRegMarcado,Campos[Length(Campos) -1]);
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
           for i2:=0 to Length(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos) - 1 do begin
             If Not (Uppercase(ChavesMaster[i]) = Uppercase(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos[i2].Campo)) then
               Continue;

             if (paramcount = 0) and Not TemWhere then
               sql.add('Where  '+ChavesDetal[i]+' = :'+ChavesDetal[i])
            else
               sql.add('And    '+ChavesDetal[i]+' = :'+ChavesDetal[i]);


            CarregaParametro(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos[i2].Valor,tipocampotovariant(FmGravacao.Registros[FMGravacao.RegistroMarcado].Campos[i2].Tipo),ParamByName(ChavesDetal[i]));
          end;
        end;
   end;

    If Length(Registros) = 0 then
     exit;

    For i:=0 to Length(registros) - 1 do begin
        If  FregMarcado <> Registros[I].Linha then
           continue;

         for i2:=0 to length(Registros[I].Campos) - 1 do begin
            if not Registros[I].Campos[i2].chave then
              continue;

             if (paramcount = 0) and Not TemWhere then
              sql.add('Where  '+Registros[I].CAmpos[i2].Campo+' = :'+Registros[I].CAmpos[i2].Campo)
             else
              sql.add('And    '+Registros[I].CAmpos[i2].Campo+' = :'+Registros[I].CAmpos[i2].Campo);

               CarregaParametro(Registros[I].Campos[i2].Valor,tipocampotovariant(Registros[I].Campos[i2].Tipo),ParamByName(Registros[I].Campos[i2].Campo));
          end;
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

   If Sender as Sender.ClassType = FMGravacao then
    exit;

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
I :Integer;
begin
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
    RegistroGravacao(FRegMarcado,CampoObjeto);
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
    for i:=0 to Length(Registros) - 1 do
     if Registros[I].Linha =  Ind then
      break;

     If I > Length(Registros) - 1 then begin
       setlength(Registros,Length(Registros) + 1);
       I := Length(Registros) - 1;
     end;

     Registros[i].Linha := Ind;

     for i2:=0 to Length(Registros[i].Campos) - 1 do
      if Uppercase(Registros[i].Campos[i2].Campo) = Uppercase(Campo.Campo) then
        break;

     If i2 > Length(Registros[i].Campos) - 1 then begin
      setlength(Registros[i].Campos,Length(Registros[i].Campos) + 1);
      I2 := Length(Registros[i].Campos) - 1;
     end;

     Registros[i].Campos[i2]      := Campo;

      For i:=0 to Length(Campos) -1 do begin
          if Not Campos[i].Todos then
           continue;

          for i2:=0 to Length(Registros[Ind].Campos) - 1 do begin
              If Uppercase(Campos[i].Campo) = Uppercase(Registros[Ind].Campos[i2].Campo) then
               break;
         end;

        If i2 >  Length(Registros[Ind].Campos) then
          setlength(Registros[Ind].Campos,Length(Registros[Ind].Campos) + 1);

        Registros[Ind].Campos[i2] := Campos[i];
     end;
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
begin
  Value.DetalGravacao := Self;
  FMGravacao := Value;
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
       If Ind = Registros[i].Linha then
        Break;

  If I > Length(Registros) - 1 then
   exit;

  For i2:=i to Length(Registros) - 2 do
    Registros[i2] := Registros[i2 + 1];

  SetLength(Registros,Length(Registros) - 1);
end;


end.
