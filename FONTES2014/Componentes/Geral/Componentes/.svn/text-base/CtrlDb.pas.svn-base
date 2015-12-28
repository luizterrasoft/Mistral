unit CtrlDb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs
  ,FuncoesGlobais,Db,DbTables,variants;
type

  TMasterDetailList = Class(TCollection)
  Private
      FMaster : TMasterDetailList;
     { Private declarations }
  protected
      FDetail : TList;
      procedure SetMaster(const Value: TMasterDetailList);Virtual;
      procedure SetDetail(const Value: TMasterDetailList);Virtual;
     { Protected declarations }
  Public
      Constructor Create(ItemClass:TCollectionItemClass);
      Procedure   Clear;
      function    Add :TCollectionItem;
      function    Insert(Index: Integer):TCollectionItem;
      Procedure   Delete(Index: Integer);
      Property    Master : TMasterDetailList read FMaster write SetMaster;
      Property    Detail : TMasterDetailList write SetDetail;
      destructor Destroy; override;
     { Public declarations }
  end;

  TListDados = Class;

  TDadoDb = Class(TCollectionItem)
  Private
    FSize:Integer;
    FName:String;
    FNameComp:String;
    FTipo:TFieldType;
    FMascara:String;
    FValor:String;
    FVLDefault:String;
    FChave:Boolean;
    FNotNull:Boolean;
    FValores:Array of Variant;
    Fposicao:LongInt;
    procedure SetTipo(const Value: TFieldType);
    function AsStringList: TStringList;
    function GetBoolean: Boolean;
    function GetCurrency: Currency;
    function GetDateTime: TDateTime;
    function GetFloat: Double;
    function GetInteger: Integer;
    function GetString: String;
    function GetValor: Variant;
    function GetVariant(VTipo: TFieldType): Variant;
    procedure SetBoolean(const Value: Boolean);
    procedure SetCurrency(const Value: Currency);
    procedure SetDateTime(const Value: TDateTime);
    procedure SetFloat(const Value: Double);
    procedure SetInteger(const Value: Integer);
    procedure SetString(const Value: String);
    procedure SetValor(const Value: Variant);
    procedure SetVariant(VTipo: TFieldType; const Value: Variant);
    { Private declarations }
  Public
     constructor Create(Collection: TCollection);Override;
     procedure   Assign(Source: TPersistent); override;
     Property    Valor:Variant read GetValor Write SetValor;
     Property    FString:String read GetString Write SetString;
     Property    FInteger:Integer read GetInteger Write SetInteger;
     Property    FCurrency:Currency read GetCurrency Write SetCurrency;
     Property    FFloat:Double read GetFloat Write SetFloat;
     Property    FDateTime:TDateTime read GetDateTime Write SetDateTime;
     Property    FBoolean:Boolean read GetBoolean Write SetBoolean;
     Property    FVariant[Tipo:TFieldType]:Variant read GetVariant Write SetVariant;
    { Public declarations }
  published
     Property    Name:String read FName Write FName;
     Property    NameComp:String read FNameComp Write FNameComp;
     Property    Tipo:TFieldType read FTipo Write SetTipo;
     Property    Size:Integer read FSize Write FSize;
     Property    Mascara:String read FMascara Write FMascara;
     Property    VLDefault:String read FVLDefault Write FVLDefault;
     Property    Chave:Boolean read FChave Write FChave;
     Property    NotNull:Boolean read FNotNull Write FNotNull;
    { Published declarations }
  end;

  TTabRegistros = Class;

  TListDados = Class(TMasterDetailList)
  Private
      FOwner:TComponent;
      function  GetItems(Index: Integer): TDadoDb;
      procedure SetItems(Index: Integer; const Value: TDadoDb);
      { Private declarations }
  Public
      Tabela:TTabRegistros;
      Constructor Create(Aowner:TComponent);
      function    GetOwner: TPersistent; override;
      function    FindFullName(Nome: String): TDadoDb;
      function    FindNome(Nome: String): TDadoDb;
      Property    Items[Index:Integer] : TDadoDb read GetItems write SetItems ;Default;
      { Public declarations }
  end;

  TRegistro = Class(TCollectionItem)
  Private
    FValor: Variant;
  public
    Property Valor:Variant read FValor Write FValor;
  end;

  TRegistros = Class(TMasterDetailList)
  private
    function GetItems(Index: Integer): TRegistro;
    procedure SetItems(Index: Integer; const Value: TRegistro);
  protected
    FListDados:TListDados;
    FTabRegistros:TTabRegistros;
  public
    Constructor Create(var ACampos:TListDados);
    Property    Items[Index:Integer] : TRegistro read GetItems write SetItems ;Default;
  end;

  TTabRegistro = Class(TCollectionItem)
  Private
    FRegistros:TRegistros;
    procedure SetRegistros(const Value: TRegistros);
  public
    Constructor Create(Collection:Tcollection);Override;
    Property  Registros:TRegistros read FRegistros write SetRegistros;
  end;

  TTabRegistros = Class(TCollection)
  Private
    FPosicao: Integer;
    Flist:Tlist;
    function GetItems(Index: Integer): TTabRegistro;
    procedure SetPosicao(const Value: LongInt);
    function GetFindValue(VIndex: Integer; Field: TDadoDb): Variant;
    procedure SetFindValue(VIndex: Integer; Field: TDadoDb;
      const Value: Variant);
    procedure SetItems(Index: Integer; const Value: TTabRegistro);
    function GetOwner: TPersistent;
    procedure Clear;
    procedure Delete(Index: Integer);
    function GetPosicao: LongInt;
  public
    FListDados:TListDados;
    Constructor Create(var ACampos:TListDados);
    function    KeyValues(Nome:Array of String;VValue:array of Variant):TRegistros;
    function    KeyValue(Nome: String; VValue: Variant): TRegistros;
    Property    FindValue[Index:Integer;Field:TDadoDb]:Variant read GetFindValue write SetFindValue;
    Property    Posicao:LongInt Read FPosicao Write SetPosicao;
    Property    Items[Index:Integer] : TTabRegistro read GetItems write SetItems ;Default;
  end;


  TDadosDb = Class(TComponent)
  Private
      FDataSet:TDataSet;
      FOwner:TPersistent;
      FOldAfterOpen:TDataSetNotifyEvent;
      FDatSet: TDataSet;
      FCampos: TListDados;
      FRegistros:TTabRegistros;
      procedure SetCampos(const Value: TListDados);
      procedure SetRegistros(const Value: TTabRegistros);

      Procedure FAfterOpen(VDataSet: TDataSet);

      procedure SetDataSet(const Value: TDataSet);

      function  GetRegistro:TRegistros;
      procedure SetRegistro(const Value: TRegistros);

      function GetPosicao: LongInt;
      procedure SetPosicao(const Value: LongInt);
      { Private declarations }
  Public
      Constructor Create(Owner:TComponent);Override;
      Destructor  Destroy ;Override;


      Function    Insert:Tregistros;
      Function    InsertPosition(Ind:LongInt):Tregistros;
      Procedure   Delete;
      Procedure   DeletePosition(Ind:LongInt);
      Procedure   Clear;

      function    FindNome(Nome:String):TDadoDb;
      function    KeyValue(Nome:String;Value:Variant): TRegistros;
      function    KeyValues(Nome:Array of String;Value:Array of Variant): TRegistros;

      Function    QtdeRegistros:LongInt;
      procedure   RefreshDataSet;

      Property    Registro:TRegistros read GetRegistro write SetRegistro;
      Property    Registros:TTabRegistros read FRegistros write SetRegistros;
      Property    Campos:TListDados read FCampos Write SetCampos;
      Property    DataSet:TDataSet  read FDatSet Write SetDataSet;
      Property    Posicao:LongInt Read GetPosicao Write SetPosicao;
      { Public declarations }
  end;

function DataTypeToVarType(FDatatype:TFieldType):Integer;
implementation


{ TDadoDb }

procedure TDadoDb.Assign(Source: TPersistent);
begin
  If (Source is TField) then begin
     Name := TField(Source).FieldName;
     Tipo := TField(Source).DataType;
     Size := TField(Source).Size;
  end else If (Source is TDadoDb) then begin
     Name     := TDadoDb(Source).Name;
     NameComp := TDadoDb(Source).NameComp;
     Tipo     := TDadoDb(Source).Tipo;
     Size     := TDadoDb(Source).Size;
  end;
end;


constructor TDadoDb.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  Fsize     := 0;
  Ftipo     := ftUnknown;
end;


procedure TDadoDb.SetTipo(const Value: TFieldType);
begin
  If FTipo <> Value then
    Fsize := 0;
  FTipo := Value;
end;

function TDadoDb.AsStringList: TStringList;
begin
  Result := TStringList.Create;
end;

function TDadoDb.GetBoolean: Boolean;
begin
  If Not VarIsNull(GetVariant(FtBoolean)) then
    Result := (GetVariant(FtBoolean)) or (GetVariant(FtString) = 'T')
  else
    Result := False;
end;

function TDadoDb.GetCurrency: Currency;
begin
  If Not VarIsNull(GetVariant(FtBCD)) then
    Result := GetVariant(FtBCD)
  else
    Result := 0;
end;

function TDadoDb.GetDateTime: TDateTime;
begin
  If Not VarIsNull(GetVariant(FtDateTime)) then
    Result := GetVariant(FtDateTime)
  else
    Result := 0;
end;

function TDadoDb.GetFloat: Double;
begin
  If Not VarIsNull(GetVariant(FtFloat)) then
    Result := GetVariant(FtFloat)
  else
    Result := 0;
end;

function TDadoDb.GetInteger: Integer;
begin
  If Not VarIsNull(GetVariant(FtInteger)) then
    Result := GetVariant(FtInteger)
  else
    Result := 0;
end;

function TDadoDb.GetString: String;
begin
  If Not VarIsNull(GetVariant(FtString)) then
    Result := GetVariant(FtString)
  else
    Result := '';
end;

procedure TDadoDb.SetBoolean(const Value: Boolean);
begin
  SetVariant(FtBoolean,Value);
end;

procedure TDadoDb.SetCurrency(const Value: Currency);
begin
  SetVariant(FtCurrency,Value);
end;

procedure TDadoDb.SetDateTime(const Value: TDateTime);
begin
  SetVariant(FtDateTime,Value);
end;

procedure TDadoDb.SetFloat(const Value: Double);
begin
  SetVariant(FtFloat,Value);
end;

procedure TDadoDb.SetInteger(const Value: Integer);
begin
  SetVariant(FtInteger,Value);
end;

procedure TDadoDb.SetString(const Value: String);
begin
  SetVariant(FtString,Value);
end;

function TDadoDb.GetValor: Variant;
begin
   Result := GetVariant(Ftipo);
end;

function TDadoDb.GetVariant(VTipo: TFieldType): Variant;
begin
   If (Collection <> Nil) and (Collection Is TListDados) and
      (TListDados(Collection).Tabela <> Nil) then
        If Not VarIsNull(TListDados(Collection).Tabela.FindValue[TListDados(Collection).Tabela.Posicao,Self]) then
           Result :=  VarAsType(TListDados(Collection).Tabela.FindValue[TListDados(Collection).Tabela.Posicao,Self]
                      ,DataTypetoVarType(VTipo))
        else begin
           If FVlDefault <> '' then
              Result := VarAsType(FVlDefault,DataTypetoVarType(VTipo))
           else If FNotNull then begin
             If Vtipo = FtString then
               Result := ''
             else
               Result := 0; 
           end else 
              result := Null;
        end;
end;

procedure TDadoDb.SetVariant(VTipo: TFieldType; const Value: Variant);
begin
   If (Collection <> Nil) and (Collection Is TListDados) and
      (TListDados(Collection).Tabela <> Nil) then
         If Not VarisNull(Value) then
            TListDados(Collection).Tabela.FindValue[TListDados(Collection).Tabela.Posicao,Self]
            := VarAsType(Value,DataTypetoVarType(VTipo))
         else
            TListDados(Collection).Tabela.FindValue[TListDados(Collection).Tabela.Posicao,Self]
            := Null;
end;

procedure TDadoDb.SetValor(const Value: Variant);
begin
   SetVariant(Ftipo,Value);
end;

{ TDadosDb }


procedure TDadosDb.FAfterOpen(VDataSet: TDataSet);
begin
  Try
    RefreshDataSet;
  finally
    VDataSet.First;
    If Assigned(FOldAfterOPen) then
      FOldAfterOPen(VDataSet);
  end;
end;




procedure TDadosDb.SetDataSet(const Value: TDataSet);
begin
  If FDataSet <> Nil then
   FDataSet.AfterOpen := FOldAfterOpen;

  If Value <> Nil then Begin
    FOldAfterOpen     := Value.AfterOpen;
    Value.AfterOpen   := FAfterOpen;
  end;

   FDataSet   := Value;
end;



constructor TDadosDb.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FCampos    := TListDados.Create(Self);
  FRegistros := TTabRegistros.Create(FCampos);
end;

destructor TDadosDb.Destroy;
begin
  FCampos.Destroy;
  FRegistros.Destroy;
  inherited Destroy;
end;

function TDadosDb.FindNome(Nome: String): TDadoDb;
var i:word;
begin
   Result := FCampos.FindNome(Nome);
end;

function TDadosDb.QtdeRegistros: LongInt;
begin
  Result := FRegistros.Count;
end;


procedure TDadosDb.SetCampos(const Value: TListDados);
begin
  FCampos.Assign(Value);
end;



procedure TDadosDb.SetRegistros(const Value: TTabRegistros);
begin
  FRegistros.Assign(Value);
end;


procedure TDadosDb.Clear;
begin
  FRegistros.Clear;
end;

procedure TDadosDb.DeletePosition(Ind: Integer);
begin
  FRegistros.Delete(Ind);
end;

procedure TDadosDb.Delete;
begin
  FRegistros.Delete(Posicao);
end;

function TDadosDb.GetPosicao: LongInt;
begin
  Result := FRegistros.Posicao;
end;

function TDadosDb.InsertPosition(Ind: Integer): Tregistros;
begin
  Result := TRegistros(FRegistros.Insert(Ind));
end;

function TDadosDb.Insert: Tregistros;
begin
  Result := TRegistros(FRegistros.Add);
end;

function TDadosDb.KeyValue(Nome: String; Value: Variant): TRegistros;
begin
  Result := FRegistros.KeyValue(Nome,Value);
end;

function TDadosDb.KeyValues(Nome: array of String;
  Value: array of Variant): TRegistros;
begin
  Result := FRegistros.KeyValues(Nome,Value);
end;

procedure TDadosDb.RefreshDataSet;
var i,i2:iNTEGER;
begin
  Try
   FRegistros.Clear;
   If Not FDataSet.Active Then
    FDataSet.Open;
   Campos.Clear;
   For i:=0 to FDataSet.Fields.count - 1 do begin
      Campos.Add;
      Campos[Campos.Count - 1].Assign(FDataSet.Fields[i]);
   end;
   If FDataSet.Eof then
     exit;

   FDataSet.First;
   Insert;
   While Not FDataSet.Eof do begin
       Posicao := QtdeRegistros - 1;
       For i:=0 to FDataSet.Fields.count - 1 do
         Campos[I].Valor := FDataSet.Fields[i].Value;
       FDataSet.Next;
       If Not FDataSet.Eof then  
         Insert;
   end;
  finally
    Posicao := 0;
    FDataSet.First;
  end;
end;

procedure TDadosDb.SetPosicao(const Value: LongInt);
begin
  FRegistros.Posicao := Value;
end;


function TDadosDb.GetRegistro: TRegistros;
begin
  Result := FRegistros[Posicao].Registros;
end;


procedure TDadosDb.SetRegistro(const Value: TRegistros);
begin
  FRegistros[Posicao].Registros.Assign(Value); 
end;

{ TListDados }


constructor TListDados.Create(Aowner:TComponent);
begin
  inherited Create(TDadoDb);
  FOwner  := Aowner;
  FDetail := TList.Create;
end;


function TListDados.FindFullName(Nome: String): TDadoDb;
var i:Integer;
begin
   Result := Nil;
   for i:=0 to Count - 1 do
    If AnsiCompareText(Nome,Items[i].NameComp) = 0 then begin
      Result := Items[i];
      Exit;
    end;
end;

function TListDados.FindNome(Nome: String): TDadoDb;
var i:Integer;
begin
   Result := Nil;
   for i:=0 to Count - 1 do
    If AnsiCompareText(Nome,Items[i].Name) = 0 then begin
      Result := Items[i];
      Exit;
    end;
end;

function TListDados.GetItems(Index: Integer): TDadoDb;
begin
 Result := TDadoDb(inherited GetItem(Index));
end;

function TListDados.GetOwner: TPersistent;
begin
   Result := FOwner;
end;


procedure TListDados.SetItems(Index: Integer; const Value: TDadoDb);
var i:Integer;
begin
  inherited SetItem(Index, Value);
end;

{ TRegistros }

constructor TRegistros.Create(var ACampos:TListDados);
begin
  inherited Create(TRegistro);
  Master     := ACampos;
  FListdados := ACampos;
  Add;
end;


function TRegistros.GetItems(Index: Integer): TRegistro;
begin
 Result := TRegistro(inherited GetItem(Index));
end;


procedure TRegistros.SetItems(Index: Integer; const Value: TRegistro);
begin
  inherited SetItem(Index, Value);
end;

{ TTabRegistros }

constructor TTabRegistros.Create(Var ACampos:TListDados);
begin
   inherited create(TTabRegistro);
   ACampos.Tabela := Self;
   FListDados     := ACampos;
   Posicao        := -1;
end;


function TTabRegistros.GetFindValue(VIndex: Integer;
  Field: TDadoDb): Variant;
var i:Integer;
begin
  if (VIndex >= 0) and (VIndex < count) and (Items[VIndex] <> Nil) then
    result := Items[VIndex].Registros[Field.Index].Valor;
end;

function TTabRegistros.GetItems(Index: Integer): TTabRegistro;
begin
 Result := TTabRegistro(inherited GetItem(Index));
end;

function TTabRegistros.GetOwner: TPersistent;
begin
  result := FListDados.GetOwner;
end;

function TTabRegistros.KeyValue(Nome: String; VValue: Variant): TRegistros;
begin
  Result := KeyValues([Nome],[VValue]);
end;

function TTabRegistros.KeyValues(Nome:Array of String;
VValue:array of Variant):TRegistros;
var
i,i2:iNTEGER;
Fvalue,Fvalue2:String;
begin
    Result := Nil;

    If Count > 0 then
      for i:=0 to Count - 1 do begin
           for i2:=0 to Length(Nome) - 1 do begin
             Fvalue  := VartoStr(FindValue[I,FListDados.FindNome(Nome[i2])]);
             FValue2 := VartoStr(VValue[i2]);
             If FValue <> VValue[i2] then
               break;
           end;    

           If I2 > Length(Nome) - 1 then begin
             Result := Items[i].Registros;
             Exit;
           end;
      end;
end;

procedure TTabRegistros.SetFindValue(VIndex: Integer; Field: TDadoDb;
  const Value: Variant);
begin
  if (VIndex >= 0) and (VIndex < count) and (Items[VIndex] <> Nil) then
    Items[VIndex].Registros[Field.Index].Valor := Value;
end;


procedure TTabRegistros.SetPosicao(const Value: LongInt);
begin
  FPosicao := IIfs(Value > count - 1,count - 1,Value);
end;

procedure TTabRegistros.Clear;
var i:Integer;
begin
  inherited clear;
end;

procedure TTabRegistros.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;



procedure TTabRegistros.SetItems(Index: Integer; const Value: TTabRegistro);
begin
  inherited SetItem(Index,Value);
end;


function TTabRegistros.GetPosicao: LongInt;
begin
end;

{ TMasterDetailList }

function TMasterDetailList.Add: TCollectionItem;
var i:Integer;
begin
  Result := inherited Add;

  If FDetail.Count > 0 then
   for i:=0 to FDetail.Count - 1 do
     TCollection(FDetail[i]).Add;
end;

procedure TMasterDetailList.Clear;
var i:Integer;
begin
  inherited Clear;
  If FDetail.Count > 0 then
   for i:=0 to FDetail.Count - 1 do
     TCollection(FDetail[i]).Clear;
end;

constructor TMasterDetailList.Create(ItemClass:TCollectionItemClass);
begin
  inherited Create(ItemClass);
  FDetail := TList.Create;
end;

Procedure TMasterDetailList.Delete(Index: Integer);
var i:Integer;
begin
  If FDetail.Count > 0 then
   for i:=0 to FDetail.Count - 1 do
     TCollection(FDetail[i]).Delete(Index);
  inherited Delete(Index);
end;

destructor TMasterDetailList.Destroy;
begin
  FDetail.Destroy;
  inherited Destroy;
end;

function TMasterDetailList.Insert(Index: Integer): TCollectionItem;
var i:Integer;
begin
  Result := inherited Insert(Index);

  inherited Insert(Index);
  If FDetail.Count > 0 then
   for i:=0 to FDetail.Count - 1 do
     TCollection(FDetail[i]).Insert(Index);

end;

procedure TMasterDetailList.SetDetail(const Value: TMasterDetailList);
begin
    If FDetail.IndexOf(Value) = -1 then
      FDetail.Add(Value);
end;

procedure TMasterDetailList.SetMaster(const Value: TMasterDetailList);
var
I:iNTEGER;
begin
  If (FMaster <> Nil) and (FMaster.FDetail.IndexOf(Self) > -1) then
      FMaster.FDetail.Delete(FMaster.FDetail.IndexOf(Self));

  If Value <> Nil then begin
       If Value <> FMaster then begin
          clear;
          If Value.count > 0 then
            for i:=0 to Value.count - 1 do begin
              add;
              If Items[i].ClassType = Value.Items[i].Classtype then
                Items[i].Assign(Value.Items[i]);
            end;
       end;

      If FDetail.Count > 0 then
       for i:=0 to FDetail.Count - 1 do
         TMasterDetailList(FDetail[i]).Master := Value;

      Value.Detail := Self;
 end;

  FMaster := Value;
end;

{ TTabRegistro }

constructor TTabRegistro.Create(Collection: Tcollection);
begin
  inherited Create(Collection);
  FRegistros := TRegistros.Create(TTabRegistros(Collection).FListDados);
end;

procedure TTabRegistro.SetRegistros(const Value: TRegistros);
begin
  FRegistros.Assign(Value);
end;

function DataTypeToVarType(FDatatype:TFieldType):Integer;
begin
  case FDataType of
     ftSmallInt               : Result := System.varSmallint;
     ftInteger                : Result := System.varInteger;
     ftBCD                    : Result := System.varCurrency;
     ftFloat                  : Result := System.varSingle;
     ftTime,ftDate,ftDateTime : Result := System.varDate;
     ftBoolean                : Result := System.varBoolean;
     ftString,FtMemo,FtBlob   : Result := System.varString;
  else
     Result := VarUnknown;
  end;
end;

end.
