unit CheckGravacao;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckControle,TipoDef,Gravacao,FuncoesGlobais;

type
  TCheckGravacao = class(TCheckControle)
  private
    OldTextGlobal  : String;
    VarCampoTabela :String;
    VarTipoTabela  : TTipoCampo;
    VarChave       : Boolean;
    VarGravacao    : TGravacao;
    CampoLocal     : TCampoGravacao;
    VarLimpaCampo,VarObrigatorioTabela : Boolean;
    FRecupera: TGravacao;
    FChecked : Boolean;
    procedure SetCampo(const Value: String);
    procedure SetChave(const Value: Boolean);
    procedure SetGravacao(const Value: TGravacao);
    procedure SetTipoTabela(const Value: TTipoCAmpo);
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    procedure SetChecked(const Value: Boolean);
    { Private declarations }
  protected
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    { Protected declarations }
  public
    { Public declarations }
  published
    Procedure Click;Override;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
    Property  TipoCampo   : TTipoCAmpo Read VarTipoTabela Write SetTipoTabela;
    Property  Chave       : Boolean Read VarChave Write SetChave default False;
    Property  Gravacao    : TGravacao Read VarGravacao Write SetGravacao;
    Property  LimpaCampo  : Boolean Read VarLimpaCampo Write VArLimpaCampo default False;
    Property  Checked     : Boolean Read FChecked Write SetChecked Default False;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TCheckGravacao]);
end;

{ TCheckGravacao }


procedure TCheckGravacao.Click;
begin
  inherited Click;

  FChecked := TcheckBox(Self).Checked;


   If FChecked then
    CampoLocal.Valor := VarAsType(ValorChecado,TipoCampoToVariant(VarTipoTabela))
   else
    CampoLocal.Valor := VarAsType(ValorNaoChecado,TipoCampoToVariant(VarTipoTabela));

   VarGravacao.CamposGravacao(CampoLocal);
end;

constructor TCheckGravacao.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   VarTipoTabela := VarString;
   CampoLocal.Objeto       := Self;
   CampoLocal.Procedimento := PassaValorGravacao;
   CampoLocal.Valor        := ValorNaoChecado;
end;

destructor TCheckGravacao.Destroy;
begin
  inherited Destroy;
end;


procedure TCheckGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
begin
      If (VarGravacao.EstadoGravacao = GRInsert)    then begin
         if TCheckGravacao(Sender).LimpaCampo  then
           TCheckGravacao(Sender).Checked := False;
         Exit;
      end;


      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TCheckGravacao(Sender).Checked  := False;
         exit;
      end;

     If VarIsEmpty(Valor) then
        TCheckGravacao(Sender).Checked := False
     else
       TCheckGravacao(Sender).Checked  := (VarAsType(ValorChecado,TipoCampoToVariant(VarTipoTabela)) =  Valor);
end;

procedure TCheckGravacao.SetCampo(const Value: String);
var
OldCampo : string;
begin
     CampoLocal.Campo := Value;
     OldCampo := VarCampoTabela;
     VarCampoTabela := Value;
     If VarGravacao = nil then
       exit;

     VarGravacao.DeletaCampo(OldCampo);

     if value = '' then
      exit;

     VarGravacao.CamposGravacao(CampoLocal);
end;

procedure TCheckGravacao.SetChave(const Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TCheckGravacao.SetChecked(const Value: Boolean);
begin
   TcheckBox(Self).Checked := Value;

   If Value then
    CampoLocal.Valor := VarAsType(ValorChecado,TipoCampoToVariant(VarTipoTabela))
   else
    CampoLocal.Valor := VarAsType(ValorNaoChecado,TipoCampoToVariant(VarTipoTabela));

    If VarGravacao <> Nil then
     VarGravacao.CamposGravacao(CampoLocal);

    FChecked := Value;
end;

procedure TCheckGravacao.SetGravacao(const Value: TGravacao);
begin
      if VarGravacao <> nil then
        VarGravacao.DeletaCampo(VarCampoTabela);

      VarGravacao := Value;

      VarGravacao.DeletaCampo(VarCampoTabela);

      If value = nil then
       exit;

      VarGravacao.CamposGravacao(CampoLocal);
end;

procedure TCheckGravacao.SetTipoTabela(const Value: TTipoCAmpo);
begin
     VartipoTabela :=  Value;
     CampoLocal.Tipo := Value;
end;

end.
