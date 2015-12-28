unit Gerador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Qrctrls,QuickRpt,
  CheckControle,db,DbTables,Qrprntr;

type

  TFlagItGerador = (FGFiltro,FGDbText,FGExpression);

  TItemGerador = Class(TCollectionItem)
   Private
    FCampo: String;
    FTitulo: String;
    FFlag: TFlagItGerador;
    FExpression: TStringList;
    FSql: TStringList;
    FFiltro: TStringList;
    FMascara: String;
    FTipo: TFieldType;
    FBandTit: TQrCustomBand;
    FBand: TQrCustomBand;
    FTam: Word;
    FPanel: TwinControl;
    FAlignment: TAlignment;
    FDataSet: TDataSet;
    FChecked: Boolean;
    procedure SetExpression(const Value: TStringList);
    procedure SetFiltro(const Value: TStringList);
    procedure SetSql(const Value: TStringList);
    { Private declarations }
   Public
    FCheckControle:TCheckControle;
    procedure Assign(Source: TPersistent); override;
    { Public declarations }
   Published
    Property Campo        : String         read FCampo      Write FCampo;
    Property Mascara      : String         read FMascara    Write FMascara;
    Property Tipo         : TFieldType     read FTipo       Write FTipo;
    Property Titulo       : String         read FTitulo     Write FTitulo;
    Property Flag         : TFlagItGerador read FFlag       Write FFlag;
    Property Alignment    : TAlignment     read FAlignment Write FAlignment;
    Property Expression   : TStringList     read FExpression Write SetExpression;
    Property Filtro       : TStringList     read FFiltro     Write SetFiltro;
    Property Sql          : TStringList     read FSql        Write SetSql;
    Property BandaTitulo  : TQrCustomBand  read FBandTit    Write FBandTit;
    Property Banda        : TQrCustomBand  read FBand       Write FBand;
    Property Tamanho      : Word           read FTam        Write FTam;
    Property Checked      : Boolean        read FChecked    Write FChecked Default False;
    Property Panel        : TwinControl    read FPanel      Write FPanel;
    Property DataSet      : TDataSet       read FDataSet    Write FDataSet;
    { Published declarations }
 end;

 TGerador = Class;

 TItemsGerador = Class (Tcollection)
   Private
    FGerador : TGerador;
    function GetItems(Index: Integer): TItemGerador;
    procedure SetItems(Index: Integer; const Value: TItemGerador);
    { Private declarations }
   Public
    Constructor Create(Gerador:TGerador);
    function GetOwner: TPersistent; override;
    Property Items[Index:Integer] : TItemGerador read GetItems write SetItems ;Default;
    { Public declarations }
   Published
    { Published declarations }
 end;



  TGerador = class(TComponent)
  private
    FItemsGerador: TItemsGerador;
    FQuery: TQuery;
    FQuickRep: TQuickRep;
    FLeft: Word;
    FLeftReport: Word;
    FTop: Word;
    FWidth: Word;
    procedure SetItems(const Value: TItemsGerador);
    { Private declarations }
  protected
    { Protected declarations }
  public
     constructor Create(Aowner: Tcomponent);
     Procedure   CriaControls;
     Procedure   CriaControlsReport;
    { Public declarations }
  published
     Property Items           : TItemsGerador  read FItemsGerador  write SetItems;
     Property Relatorio       : TQuickRep      Read FQuickRep      Write FQuickRep;
     Property Width           : Word           Read FWidth         Write FWidth;
     Property Left            : Word           Read FLeft          Write FLeft;
     Property Top             : Word           Read FTop           Write FTop;
     Property LeftReport      : Word           Read FLeftReport    Write FLeftReport;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Entidades', [TGerador]);
end;

{ TItemGerador }

procedure TItemGerador.Assign(Source: TPersistent);
begin
  if Not (Source is TItemGerador) then begin
    inherited Assign(Source);
    exit;
  end;

  Campo   := TItemGerador(Source).Campo;
  Tipo    := TItemGerador(Source).Tipo;
  Titulo   := TItemGerador(Source).Titulo;
  Mascara  := TItemGerador(Source).Mascara;
end;

procedure TItemGerador.SetExpression(const Value: TStringList);
begin
  If FExpression = nil then
   FExpression := TStringList.Create;
  FExpression.Assign(Value);
end;

procedure TItemGerador.SetFiltro(const Value: TStringList);
begin
  If FFiltro = nil then
   FFiltro := TStringList.Create;
  FFiltro.Assign(Value);
end;

procedure TItemGerador.SetSql(const Value: TStringList);
begin
  If FSql = nil then
   FSql := TStringList.Create;
  FSql.Assign(Value);
end;

{ TItemsGerador }

constructor TItemsGerador.Create(Gerador: TGerador);
begin
  inherited Create(TItemGerador);
  Self.FGerador := Gerador;
end;

function TItemsGerador.GetItems(Index: Integer): TItemGerador;
begin
  Result := TItemGerador(inherited GetItem(Index));
end;

function TItemsGerador.GetOwner: TPersistent;
begin
  result := FGerador;
end;

procedure TItemsGerador.SetItems(Index: Integer;
  const Value: TItemGerador);
begin
  inherited SetItem(Index, Value);
end;

{ TGerador }

constructor TGerador.Create(Aowner: Tcomponent);
begin
  inherited Create(aowner);
  FItemsGerador  := TItemsGerador.Create(Self);
end;

procedure TGerador.CriaControls;
var VLeft,Vtop,i:word;
begin
   VLeft := FLeft;
   VTop  := FTop;
   for i:=0 to FItemsGerador.Count - 1 do begin
     TCheckControle.Create(Owner).Name := 'CheckControle'+IntToStr(Owner.ComponentCount);
     FItemsGerador[i].FCheckControle          := TCheckControle(Owner.FindComponent('CheckControle'+IntToStr(Owner.ComponentCount)));

     With TCheckControle(Owner.FindComponent('CheckControle'+IntToStr(Owner.ComponentCount))) do begin
        if (FItemsGerador[i].Panel <> Nil) then
          Parent := FItemsGerador[i].Panel
        else
          Parent := TWincontrol(Owner);

        If VTop + Height > Parent.Height then begin
          VTop  := Ftop;
          VLeft := FWidth + VLeft + 5;
        end;

        Checked := FItemsGerador[i].Checked;
        Caption := FItemsGerador[i].Titulo;
        Width   := FWidth;
        Top     := Vtop;
        Left    := VLeft;
        Width   := FWidth;

     end;
   end;


end;

procedure TGerador.CriaControlsReport;
var VLeft,Vtop,i:word;
begin
   VLeft := FLeftReport;
   for i:=0 to FItemsGerador.Count - 1 do begin
             If (FItemsGerador[I].Flag = FGFiltro) or Not(FItemsGerador[I].FCheckControle.Checked) then
              continue;

             TQrLabel.Create(FQuickRep.Owner).Name := 'Lb'+IntToStr(FQuickRep.Owner.ComponentCount);
             With TQrLAbel(FQuickRep.Owner.FindComponent('Lb'+IntToStr(FQuickRep.Owner.ComponentCount))) do begin
                  Caption       := FItemsGerador[I].Titulo;
                  Alignment    := FItemsGerador[I].Alignment;
                  AutoSize      := True;
                  ParentFont    := True;
                  Top           := 1;
                  Left          := vleft + 3;
                  Parent        := FItemsGerador[i].BandaTitulo;
                  ParentReport  := FQuickRep;
                  AutoSize      := False;
                  Width         := FItemsGerador[I].Tamanho;
             end;


             If FItemsGerador[I].Flag = FGDbText then begin
                TQrDbText.Create(FQuickRep.Owner).Name := 'QrDb'+IntToStr(FQuickRep.Owner.ComponentCount);
                With TQrDbText(FQuickRep.Owner.FindComponent('QrDb'+IntToStr(FQuickRep.Owner.ComponentCount))) do begin
                    DataSet       := FItemsGerador[I].DataSet;
                    DataField     := FItemsGerador[I].Campo;
                    Mask          := FItemsGerador[I].Mascara;
                end;
             end else If FItemsGerador[I].Flag = FGExpression then begin
                TQrExpr.Create(FQuickRep.Owner).Name := 'QrExpress'+IntToStr(FQuickRep.Owner.ComponentCount);
                With TQrExpr(FQuickRep.Owner.FindComponent('QrExpress'+IntToStr(FQuickRep.Owner.ComponentCount))) do begin
                    Expression    := FItemsGerador[I].Expression.Text;
                    Mask          := FItemsGerador[I].Mascara;
                end;
             end;

             With TQrCustomLAbel(FQuickRep.Owner.Components[FQuickRep.Owner.ComponentCount - 1]) do begin
                  Alignment    := FItemsGerador[I].Alignment;
                  AutoSize      := False;
                  Top           := 1;
                  Left          := vleft + 3;
                  Parent        := FItemsGerador[i].Banda;
                  ParentReport  := FQuickRep;
                  AutoSize      := False;
                  Width         := FItemsGerador[I].Tamanho;
             end;

             VLeft := FItemsGerador[I].Tamanho +  VLeft;
   end;

end;


procedure TGerador.SetItems(const Value: TItemsGerador);
begin
    FItemsGerador.Assign(Value);
end;

end.
