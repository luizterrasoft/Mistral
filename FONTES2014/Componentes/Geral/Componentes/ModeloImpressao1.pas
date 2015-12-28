unit ModeloImpressao1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Db,DbTables,Modelo,TipoDef;
type

  TItemModImp = Class(TCollectionItem)
   Private
    FCampo: String;
    FTipo: TFieldType;
    FStrech: Boolean;
    FAlias: String;
    FTitulo: String;
    FValor : String;
    { Private declarations }
   Public
    procedure Assign(Source: TPersistent); override;
    { Public declarations }
   Published
    Property Campo      : String read FCampo      Write FCampo;
    Property Tipo       : TFieldType read FTipo   Write FTipo;
    Property Strech     : Boolean   read FStrech Write FStrech;
    Property Alias      : String read FAlias Write FAlias;
    Property Titulo     : String read FTitulo Write FTitulo;
    Property Valor     : String read FValor Write FValor;
    { Published declarations }
 end;

 TmodeloImpressao = Class;

 TItemsModImp = Class (Tcollection)
   Private
    FModImp : TModeloImpressao;
    function GetItems(Index: Integer): TItemModImp;
    procedure SetItems(Index: Integer; const Value: TItemModImp);
    { Private declarations }
   Public
    Constructor Create(ModeloImpressao:TModeloImpressao);
    function GetOwner: TPersistent; override;
    Property Items[Index:Integer] : TItemModImp read GetItems write SetItems ;Default;
    { Public declarations }
   Published
    { Published declarations }
 end;


  TModeloImpressao = class(TComponent)
  private
    FItems:TitemsModImp;
    FTipo: String;
    procedure SetItems(const Value: TItemsModImp);
    { Private declarations }
  protected
    { Protected declarations }
  public
    Constructor Create(AOwner:TComponent);Override;
    Destructor  Destroy ;Override;
    Procedure   Cadastro;
    { Public declarations }
  published
     Property Items   : TItemsModImp read FItems write SetItems;
     Property Tipo    : String       read FTipo  write FTipo;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Entidades', [TModeloImpressao]);
end;

{ TCampoSequencial }

procedure TItemModImp.Assign(Source: TPersistent);
begin
  if Not (Source is TItemModImp) then begin
    inherited Assign(Source);
    exit;
  end;

   Tipo := TItemModImp(Source).Tipo;
   Strech := TItemModImp(Source).Strech;
   Alias := TItemModImp(Source).Alias;
   Campo := TItemModImp(Source).Campo;
   Titulo := TItemModImp(Source).Titulo;
   Valor := TItemModImp(Source).Valor;

end;


{ TItemsModImp }

constructor TItemsModImp.Create(ModeloImpressao:TModeloImpressao);
begin
  inherited Create(TItemModimp);
  FModImp := ModeloImpressao;
end;

function TItemsModImp.GetItems(Index: Integer): TItemModImp;
begin
  Result := TItemModImp(inherited GetItem(Index));
end;

function TItemsModImp.GetOwner: TPersistent;
begin
   Result := FModImp;
end;

procedure TItemsModImp.SetItems(Index: Integer; const Value: TItemModImp);
begin
  inherited SetItem(Index, Value);
end;

{ TModeloImpressao }

procedure TModeloImpressao.Cadastro;
var i:integer;
begin
    Frm_Modelos := TFrm_Modelos.Create(Application);
    With Frm_Modelos do begin
      Frm_Modelos.Tipo := Self.FTipo;
      For i:=0 to Self.Items.Count - 1 do begin
        GridCampos.Cells[0,I + 1] := Self.Items[I].Titulo;
        GridCampos.Cells[1,I + 1] := Self.Items[I].Campo;
        GridCampos.Cells[2,I + 1] := IIfs(Self.Items[I].strech,'S','N');
        GridCampos.Cells[3,I + 1] := Self.Items[I].Valor;

        If I <> Self.Items.Count - 1 then
         GridCampos.RowCount := GridCampos.RowCount + 1;
      end;
    end;
end;

constructor TModeloImpressao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Fitems := TitemsModImp.Create(Self);
end;

destructor TModeloImpressao.Destroy;
begin
  Fitems.Destroy;
  inherited Destroy;
end;

procedure TModeloImpressao.SetItems(const Value: TItemsModImp);
begin
  FItems.Assign(Value);
end;

end.
