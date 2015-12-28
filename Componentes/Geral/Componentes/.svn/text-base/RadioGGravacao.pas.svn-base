unit RadioGGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RadioGControle,TipoDef,Gravacao,FuncoesGlobais;

type
  TNotifyEvent = Procedure (Sender : TObject) of Object;

  TRadioGGravacao = class(TRadioGControle)
  private
    VarChange: TNotifyEvent;
    VarCampoTabela :String;
    VarTipoTabela  : TTipoCampo;
    VarChave       : Boolean;
    VarGravacao    : TGravacao;
    CampoLocal     : TCampoGravacao;
    VarLimpaCampo,VarObrigatorioTabela : Boolean;
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    Procedure SetGravacao(Value :TGravacao);
    Procedure SetCampo(Value:String);
    Procedure SetChave(Value:Boolean);
    Procedure SetObrigatorioTabela(Value:Boolean);
    Procedure SetTipoTabela(Value:TTipoCampo);
    { Private declarations }
  protected
    procedure Change; dynamic;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    { Protected declarations }
  public
    { Public declarations }
  published
    Property OnChange : TNotifyEvent read VarChange write VarChange;
    procedure DoExit; override;
    Procedure Click;Override;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
    Property  TipoCampo   : TTipoCAmpo Read VarTipoTabela Write SetTipoTabela;
    Property  Chave       : Boolean Read VarChave Write SetChave default False;
    Property  Gravacao    : TGravacao Read VarGravacao Write SetGravacao;
    Property  LimpaCampo  : Boolean Read VarLimpaCampo Write VArLimpaCampo default False;
    Property  ObrigatorioTabela  : Boolean Read VarObrigatorioTabela Write SetObrigatorioTabela default False;
    { Published declarations }
  end;

procedure Register;


implementation
procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TRadioGGravacao]);
end;


{ TRadioGGravacao }

procedure TRadioGGravacao.Change;
begin
{    if (ItemIndex = -1)  then
    CampoLocal.Valor := Unassigned
   else if VarTipoTabela = VarString then begin
     if Retorno = RGItemIndex then
      CampoLocal.Valor := IntToStr(RetornaValor)
     else
      CampoLocal.Valor := RetornaValor;
    end
   else if VarTipoTabela = VarInteger then begin
     if Retorno = RGItemIndex then
      CampoLocal.Valor := RetornaValor
     else
      CampoLocal.Valor := StrToInt(RetornaValor);
   end;

   if VariantVazia(CampoLocal.Valor) then
     CampoLocal.Valor := Unassigned;

   if (VarGravacao <> nil) then
     VarGravacao.CamposGravacao(CampoLocal);}

  if not (Assigned(VarChange)) then exit;
    VarChange(Self);
end;

procedure TRadioGGravacao.Click;
begin
    if (ItemIndex = -1)  then
    CampoLocal.Valor := Unassigned
   else if VarTipoTabela = VarString then begin
     if Retorno = RGItemIndex then
      CampoLocal.Valor := IntToStr(RetornaValor)
     else
      CampoLocal.Valor := RetornaValor;
    end
   else if VarTipoTabela = VarInteger then begin
     if Retorno = RGItemIndex then
      CampoLocal.Valor := RetornaValor
     else
      CampoLocal.Valor := StrToInt(RetornaValor);
   end;

   if VariantVazia(CampoLocal.Valor) then
     CampoLocal.Valor := Unassigned;

   if (VarGravacao <> nil) then
     VarGravacao.CamposGravacao(CampoLocal);

  inherited Click;
end;

constructor TRadioGGravacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CampoLocal.Objeto := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor        := Unassigned;
end;

destructor TRadioGGravacao.Destroy;
begin
  inherited Destroy;
end;


procedure TRadioGGravacao.DoExit;
begin
   if (VarGravacao <> nil) and (VArCAmpoTabela <> '') then
     if varchave then
        VarGravacao.Recupera(Self);

  inherited DoExit;
end;

procedure TRadioGGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
begin
       If (VarGravacao.EstadoGravacao = GRInsert)    then begin
         if TRadioGGravacao(Sender).LimpaCampo  then
           TRadioGGravacao(Sender).ItemIndex := -1;
         Exit;
      end;


      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TRadioGGravacao(Sender).ItemIndex := -1;
         exit;
      end;

      If not TRadioGGravacao(Sender).Chave  then
        TRadioGGravacao(Sender).ItemIndex := -1;

      If VarType(Valor) = $0000 then
        Exit;

       If Retorno = RGValores then begin
          if Vartipotabela =  varstring then
             TRadioGGravacao(Sender).RecebeValor(Valor);
          if Vartipotabela  = varinteger then
            TRadioGGravacao(Sender).RecebeValor(Valor);
       end
      else
             TRadioGGravacao(Sender).RecebeValor(Valor);

end;

procedure TRadioGGravacao.SetCampo(Value: String);
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

procedure TRadioGGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TRadioGGravacao.SetGravacao(Value: TGravacao);
begin
      if VarGravacao <> nil then
        VarGravacao.DeletaCampo(VarCampoTabela);

      VarGravacao := Value;

      VarGravacao.DeletaCampo(VarCampoTabela);

      If value = nil then
       exit;

     VarGravacao.CamposGravacao(CampoLocal);
end;

procedure TRadioGGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

procedure TRadioGGravacao.SetTipoTabela(Value: TTipoCampo);
begin
     VartipoTabela :=  Value;
     CampoLocal.Tipo := Value;
end;


end.
