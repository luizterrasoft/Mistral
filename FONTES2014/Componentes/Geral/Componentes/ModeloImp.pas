unit ModeloImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Modelo,Db,DbTAbles;

type

 TItemModelo = Class (TCollectionItem)
   Private
    FStrech: Boolean;
    FAlias: String;
    FCampo: String;
    FTitulo: String;
    FTabela: String;
    FTipo: TFieldType;
    { Private declarations }
   Public
    procedure Assign(Source: TPersistent); override;
    { Public declarations }
   Published
    Property Strech     : Boolean read FStrech Write FStrech default False;
    Property Campo      : String read FCampo Write FCampo;
    Property Alias      : String read FAlias Write FAlias;
    Property Titulo     : String read FTitulo Write FTitulo;
    Property Tabela     : String read FTabela Write FTabela;
    Property Tipo       : TFieldType read FTipo Write FTipo;
    { Published declarations }
 end;

 TmodeloImp = Class;

 TItemsModelo = Class(Tcollection)
   Private
    FModelo : TModeloImp;
    function GetModelo(Index: Integer): TItemModelo;
    procedure SetModelo(Index: Integer; const Value: TItemModelo);
    { Private declarations }
   Public
    Constructor Create(Modelo:TModeloImp);
    function GetOwner: TPersistent; override;
    Property Modelos[Index:Integer] : TItemModelo read GetModelo write SetModelo ;Default;
    { Public declarations }
   Published
    { Published declarations }
 end;

  TModeloImp = Class(TComponent)
   Private
    FTipo: String;
    FCodigo: String;
    FTabela: String;
    FItemsModelo:TItemsModelo;
    procedure SetModelos(const Value: TItemsModelo);
     { Private declarations }

   public
//    Procedure   Cadastro;
     { Public declarations }
   Protected
     Constructor Create(AOwner: Tcomponent);
     Destructor  Destroy;
     { Protected declarations }
   Published
    Property Codigo    : String read FCodigo Write FCodigo;
    Property Tipo      : String read FTipo Write FTipo;
    Property Items     : TItemsModelo read FItemsModelo Write SetModelos;
    Property Tabela    : String read FTabela Write Ftabela;
     { Published declarations }
  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Entidades', [TModeloImp]);
end;


{procedure TmodeloImp.Cadastro;
var i:integer;
begin
    Frm_Modelos := TFrm_Modelos.Create(Application);
    With Frm_Modelos do begin
      For i:=0 to Self.Items.Count - 1 do begin
        GridCampos.Cells[0,I] := Self.Items[I].Titulo;

        If I <> Self.Items.Count - 1 then
         GridCampos.RowCount := GridCampos.RowCount + 1;
      end;
    end;
end;}


constructor TmodeloImp.Create(AOwner: Tcomponent);
begin
    inherited Create(AOwner);
    Self.FItemsModelo := TItemsModelo.Create(Self);
end;

destructor TmodeloImp.Destroy;
begin
    FItemsModelo.Destroy;
    inherited Destroy;
end;


procedure TmodeloImp.SetModelos(const Value: TItemsModelo);
begin
  FItemsModelo.Assign(Value);
end;

  { TItemModelo }
procedure TItemModelo.Assign(Source: TPersistent);
begin
  if Not (Source is TItemModelo) then begin
    inherited Assign(Source);
    exit;
  end;

   Tipo := TItemModelo(Source).Tipo;
   Tabela := TItemModelo(Source).Tabela;
   Strech := TItemModelo(Source).Strech;
   Alias := TItemModelo(Source).Alias;
   Campo := TItemModelo(Source).Campo;
   Titulo := TItemModelo(Source).Titulo;

end;

{ TItemsModelo }

constructor TItemsModelo.Create(Modelo: TModeloImp);
begin
  inherited Create(TItemModelo);
  Self.FModelo  := Modelo;
end;


function TItemsModelo.GetModelo(Index: Integer): TItemModelo;
begin
  Result := TItemModelo(inherited GetItem(Index));
end;

function TItemsModelo.GetOwner: TPersistent;
begin
   Result := Self.FModelo;
end;


procedure TItemsModelo.SetModelo(Index: Integer; const Value: TItemModelo);
begin
  inherited SetItem(Index, Value);
end;


end.
