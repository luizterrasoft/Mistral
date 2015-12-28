unit Sequencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db,DbTables,FuncoesGlobais,variants;


type

  TCampoSequencial = Class(TCollectionItem)
   Private
    FCampo: String;
    FValor: String;
    FTipo: TFieldType;
    FObjeto: TControl;
    { Private declarations }
   Public
    procedure Assign(Source: TPersistent); override;
    Function  ValorObjeto:Variant;
    { Public declarations }
   Published
    Property Campo      : String read FCampo Write FCampo;
    Property Valor      : String read FValor Write FValor;
    Property Objeto     : TControl read FObjeto Write FObjeto;
    Property Tipo       : TFieldType read FTipo Write FTipo;
    { Published declarations }
 end;

 TSequencial = Class;

 TCamposSequencial = Class (Tcollection)
   Private
    FSequencial : TSequencial;
    function GetCampos(Index: Integer): TCampoSequencial;
    procedure SetCampos(Index: Integer; const Value: TCampoSequencial);
    { Private declarations }
   Public
    Constructor Create(Sequencial:TSequencial);
    function GetOwner: TPersistent; override;
    Property Campos[Index:Integer] : TCampoSequencial read GetCampos write SetCampos ;Default;
    { Public declarations }
   Published
    { Published declarations }
 end;

  TSequencial = class(TComponent)
  private
    Pesquisa:Tquery;
    FCampoSequencial: string;
    FCamposSequencial: TCamposSequencial;
    FObjeto: TWinControl;
    FTabela: string;
    FBancoDados: String;
    FTipoSeq: TFieldType;
    FAlteracao: Boolean;
    FFormataTam,FFormata: Boolean;
    FDataBase: TDataBase;
    FObjetoTam: TWinControl;
    FNomeTabela: string;
    procedure SetCamposSeq(const Value: TCamposSequencial);
    procedure SetBancoDados(const Value: Tdatabase);
    Procedure Parametros;
    { Private declarations }
  protected
    { Protected declarations }
  public
    FTamanho,FTamanhoSeq:Word;
    OldSeq:String;
    Constructor Create(AOwner: TComponent);Override;
    Destructor  Destroy ;Override;
    Procedure   CancelaSequencial;
    Procedure   GeraSequencial;
    Procedure   DeletaSequencial;
    Function    RetornaSequencial:String;
    Property    Alteracao       : Boolean     read FAlteracao     write FAlteracao default false;
    { Public declarations }
  published
     Property BancoDados      : String            read FBancoDados     write FBancoDados;
     Property DataBase        : TDataBase         read FDataBase       Write FDataBase;
     Property Tabela          : string            read FTabela     write FTabela;
     Property NomeTabela      : string            read FNomeTabela     write FNomeTabela;
     Property CampoSequencial : string            read FCampoSequencial write FCampoSequencial;
     Property Campos          : TCamposSequencial read FCamposSequencial write SetCamposSeq;
     Property Objeto          : TWinControl       read FObjeto    write FObjeto;
     Property TipoSeq         : TFieldType read FTipoSeq Write FTipoSeq;
     Property Formata         : Boolean read FFormata Write FFormata;
     Property ObjetoTamanho   : TWinControl       read FObjetoTam  write FObjetoTam;
     Property FormataTam       : Boolean read FFormataTam Write FFormataTam;
     { Published declarations }
  end;

procedure Register;
implementation

procedure Register;
begin
  RegisterComponents('Sistema', [TSequencial]);
end;

{ TSequencial }


procedure TSequencial.CancelaSequencial;
begin
  If FAlteracao then
   exit;

  With Pesquisa do begin
      If FDataBase <> Nil then
        DataBaseName := FDataBase.DataBaseName
      else
        DataBaseName := FBancoDados;
      sql.clear;
      sql.add('Update Sequenciais set ');
      sql.add('ValorSequencial = :ValorSequencial');
      parambyname('ValorSequencial').AsInteger := StrtoIntN(OldSeq);
      Parametros;
      sql.add('And ValorSequencial > :ValorSequencial');
      execsql;
  end;
end;

constructor TSequencial.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCamposSequencial := TCamposSequencial.Create(Self);
  Pesquisa := Tquery.Create(Self);
  FTamanho := 0;
end;

procedure TSequencial.DeletaSequencial;
begin
  With Pesquisa do begin
    If FDataBase <> Nil then
      DataBaseName := FDataBase.DataBaseName
    else
      DataBaseName := FBancoDados;
    sql.clear;
    sql.add('Delete From Sequenciais  ');
    Parametros;
    ExecSql;
 end;
end;

destructor TSequencial.Destroy;
begin
  Pesquisa.Destroy;
  FCamposSequencial.Destroy;
  inherited Destroy;
end;

procedure TSequencial.GeraSequencial;
var i:integer;
    varseq:string;
    Pesquisa2:TQuery;
begin
  With Pesquisa do begin
    If FDataBase <> Nil then
      DataBaseName := FDataBase.DataBaseName
    else
      DataBaseName := FBancoDados;

    OldSeq := '';

    If Not FAlteracao then begin
        VarSeq := RetornaSequencial;
        OldSeq := VarSeq;
    end;

    sql.clear;
    sql.add('Update Sequenciais set ');
    sql.add('ValorSequencial = :ValorSequencial');

    If FAlteracao then begin
        sql.add(',Tamanho         = :Tamanho');
        If (GetValueObject(FObjeto) = '') then
           parambyname('ValorSequencial').AsInteger := 0
        else
           parambyname('ValorSequencial').AsInteger := StrToInt(GetValueObject(FObjeto));

        If (FObjetoTam <> Nil) Then
          parambyname('Tamanho').AsInteger := StrtoIntN(GetValueObject(FObjetoTam))
        else
          parambyname('Tamanho').AsInteger := Ftamanho;
    end else begin
        Pesquisa2 := Tquery.Create(application);
        with Pesquisa2 do begin
              Try
                  DataBaseName := Pesquisa.DataBaseName;
                  sql.add('Select '+FCampoSequencial+' from '+IIfs(FnomeTabela <> '',FNomeTabela,FTabela));
                  For i:=0 to FCamposSequencial.Count - 1 do begin
                     sql.add(IIfs(I = 0,' Where ',' And ')+FCamposSequencial[i].Campo+' = :Parametro'+InttoStr(I));
//                     ParamByName(FCamposSequencial[i].Campo).DataType := FCamposSequencial[i].Tipo;
                     ParamByName('Parametro'+InttoStr(I)).AsString    := IIfs(FCamposSequencial[i].Objeto <> Nil,GetValueObject(FCamposSequencial[i].Objeto),FCamposSequencial[i].Valor);
                  end;
                  sql.add(IIfs(FCamposSequencial.Count = 0,' Where ',' And ')+FCampoSequencial+' = :'+FCampoSequencial);
                  ParamByName(FCampoSequencial).DataType := TipoSeq;
                  VarSeq := IntToStr(StrtoIntN(VarSeq) + 1);
                  If FFormata then
                    VarSeq := format('%'+IntToStr(FTamanhoSeq)+'.'+IntToStr(FTamanhoSeq)+'d',[StrToInt(VarSeq)]);
                  ParamByName(FCampoSequencial).Value    := VarSeq;
                  Open;
                  While Not Eof do begin
                     close;
                     VarSeq := IntToStr(StrtoIntN(VarSeq) + 1);
                     If FFormata then
                       VarSeq := format('%'+IntToStr(FTamanhoSeq)+'.'+IntToStr(FTamanhoSeq)+'d',[StrToInt(VarSeq)]);
                     ParamByName(FCampoSequencial).Value    := VarSeq;
                     Open;
                  end;
               Finally
                  Pesquisa2.Destroy;
               end;
        end;
        Pesquisa.parambyname('ValorSequencial').AsInteger := StrtoInt(VarSeq);
    end;

    Parametros;
    execsql;

    If (RowsAffected = 0) and (Not(Falteracao) or (GetValueObject(FObjeto) <> '')) then begin
       sql.clear;
       sql.add('Insert Into Sequenciais ');
       sql.add('( Tabela,CampoSequencial,ValorCampo,ValorSequencial,Tamanho )');
       sql.add('Values ( :Tabela,:CampoSequencial,:ValorCampo,:ValorSequencial,:Tamanho )');
       Params[0].AsString := FTabela;
       Params[1].AsString := FCampoSequencial;
       Params[2].AsString := '';
       If FCamposSequencial.Count > 0 then
          For i:=0 to FCamposSequencial.Count - 1 do begin
              Params[2].AsString     := Params[2].AsString+IIfs(Params[2].AsString <> '','.','')+iiFS(FCamposSequencial[i].Objeto <> Nil,GetValueObject(FCamposSequencial[i].Objeto),FCamposSequencial[i].Valor);;
           end;

       if not falteracao then
           Params[3].AsInteger := IIfs(VarSeq = '',1,StrtoIntN(VarSeq))
       else
           Params[3].AsInteger := StrtoInt(GetValueObject(FObjeto));
       VarSeq := Params[3].AsString;

       If Not FAlteracao then
           Params[4].AsInteger  := 0
       else If (FObjetoTam <> Nil) Then
           Params[4].AsInteger := StrtoInt(GetValueObject(FObjetoTam))
       else
           Params[4].AsInteger := Ftamanho;

       execSql;
    end;


    if not falteracao then
      If not FFormata then
        SetValueObject(FObjeto,VarSeq)
     else
        SetValueObject(FObjeto,format('%'+IntToStr(FTamanhoSeq)+'.'+IntToStr(FTamanhoSeq)+'d',[StrToInt(VarSeq)]));

//     VarSeq := RetornaSequencial;
//     MessageDlg('Sequencial Gerado '+#13+VarSeq,mtinformation,[mbok],0);
//     SetValueObject(FObjeto,VarSeq);
  end;
end;

procedure TSequencial.Parametros;
var i: integer;
begin
{  With Pesquisa do begin
    sql.add('Where  Upper(Tabela) =:Tabela');
    sql.add('And    Upper(CampoSequencial) =:CampoSeq');
    ParamByName('Tabela').AsString   := Uppercase(FTabela);
    ParamByName('CampoSeq').AsString := UppercAse(FCampoSequencial);
    sql.add('And (');
    For i:=0 to FCamposSequencial.Count - 1 do begin
      sql.add('(Upper(CampoTabela) =:CampoTabela'+IntToStr(i)+' And  Upper(ValorCampo)=:ValorCampo'+IntToStr(i)+')');
      ParamByName('CampoTabela'+IntToStr(i)).AsString :=UpperCase(FCamposSequencial[i].Campo);
      VariantToParams(ParamByName('ValorCampo'+IntToStr(I)),UpperCase(FCamposSequencial[i].ValorObjeto));
        if I <> FCamposSequencial.Count - 1 then
          sql.add(' or ');
    end;
    sql.add(' ) ');
  end;}

  With Pesquisa do begin
      sql.add('Where  Upper(Sequenciais.Tabela) =:Tabela');
      sql.add('And    Upper(Sequenciais.CampoSequencial) =:CampoSeq');
      ParamByName('Tabela').AsString   := Uppercase(FTabela);
      ParamByName('CampoSeq').AsString := UppercAse(FCampoSequencial);
      iF FCamposSequencial.Count > 0 Then begin
         sql.add('And    Upper(Sequenciais.ValorCampo) =:ValorCampo');
         For i:=0 to FCamposSequencial.Count - 1 do
           ParamByName('ValorCampo').AsString := ParamByName('ValorCampo').AsString+IIfs(ParamByName('ValorCampo').AsString <> '','.','')+iiFS(FCamposSequencial[i].Objeto <> Nil,GetValueObject(FCamposSequencial[i].Objeto),FCamposSequencial[i].Valor);
      end;
  end;

end;

Function TSequencial.RetornaSequencial:String;
begin

  With Pesquisa do begin
    If FDataBase <> Nil then
      DataBaseName := FDataBase.DataBaseName
    else
      DataBaseName := FBancoDados;

    sql.clear;
    sql.add('Select Tamanho,ValorSequencial,'+FCampoSequencial);
    sql.add(' From Sequenciais ');
    sql.add(' Left Join  '+IIfs(FnomeTabela <> '',FNomeTabela,FTabela)+' on (''a'' = ''b'')');
    Parametros;
    Open;
    If FormataTam then
     FFormata := Not fieldByname('Tamanho').IsNull and (fieldByname('Tamanho').AsInteger <> 0);

    If FieldByName('Tamanho').AsInteger < 0 then
       FTamanhoSeq := fieldByname(FCampoSequencial).Size
    else
       FTamanhoSeq := fieldByname('Tamanho').AsInteger;

    FTamanho := fieldByname('Tamanho').AsInteger;

    If FObjetoTam <> Nil then
      SetValueObject(FObjetoTam,fieldByname('Tamanho').AsString);

{    If ParamCount = 2 then begin
       result := '';
       Exit;
    end;}



    If not FFormata then
       Result := FieldByName('ValorSequencial').AsString
    Else
       Result := format('%'+IntToStr(FTamanhoSeq)+'.'+IntToStr(FTamanhoSeq)+'d',[FieldByName('ValorSequencial').AsInteger]);

  end;




end;

procedure TSequencial.SetBancoDados(const Value: Tdatabase);
begin
{  FBancoDados := Value;
  if Value <> nil then
    Pesquisa.DataBaseName := FBancoDados.DataBaseNAme;}
end;

procedure TSequencial.SetCamposSeq(const Value: TCamposSequencial);
begin
  FCamposSequencial.Assign(Value);
end;

{ TCampoSequencial }

procedure TCampoSequencial.Assign(Source: TPersistent);
begin
  if Not (Source is TCampoSequencial) then begin
    inherited Assign(Source);
    exit;
  end;

  Campo   := TCampoSequencial(Source).Campo;
  Tipo    := TCampoSequencial(Source).Tipo;
  Valor   := TCampoSequencial(Source).Valor;
  Objeto  := TCampoSequencial(Source).Objeto;
end;

function TCampoSequencial.ValorObjeto: Variant;
begin
 If FObjeto <> Nil then
  result :=  VarAstype(GetValueObject(FObjeto),DataTypeToVarType(Ftipo))
 else result :=  VarAstype(FValor,DataTypeToVarType(Ftipo))




end;

{ TCamposSequencial }

constructor TCamposSequencial.Create(Sequencial: TSequencial);
begin
  inherited Create(TCampoSequencial);
  FSequencial := Sequencial;
end;

function TCamposSequencial.GetCampos(Index: Integer): TCampoSequencial;
begin
  Result := TCampoSequencial(inherited GetItem(Index));
end;

function TCamposSequencial.GetOwner: TPersistent;
begin
  result := FSequencial;
end;

procedure TCamposSequencial.SetCampos(Index: Integer;
  const Value: TCampoSequencial);
begin
  inherited SetItem(Index, Value);
end;
end.
