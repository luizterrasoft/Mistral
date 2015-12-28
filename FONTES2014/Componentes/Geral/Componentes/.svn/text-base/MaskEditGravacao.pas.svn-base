unit MaskEditGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, MaskEdit,Gravacao,TipoDef,FuncoesGlobais;

type
  TMaskEditGravacao = class(TMaskEditControle)
  private
    CampoLocal     :TCampoGravacao;
    VarCampoTabela :String;
    VarTipoTabela  : TTipoCampo;
    VarChave       : Boolean;
    VarGravacao    : TGravacao;
    VarLimpaCampo,VarObrigatorioTabela : Boolean;
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    Procedure SetGravacao(Value :TGravacao);
    Procedure SetCampo(Value :String);
    Procedure SetChave(Value:Boolean);
    Procedure SetObrigatorioTabela(Value:Boolean);
    Procedure SetTipoTabela(Value:TTipoCampo);
    { Private declarations }
  protected
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    { Protected declarations }
  public
    { Public declarations }
  published
    Procedure Change;Override;
    procedure DoExit; override;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
    Property  TipoCampo   : TTipoCAmpo Read VarTipoTabela Write SetTipoTabela;
    Property  Chave       : Boolean Read VarChave Write VarChave default False;
    Property  Gravacao    : TGravacao Read VarGravacao Write SetGravacao;
    Property  LimpaCampo  : Boolean Read VarLimpaCampo Write VarLimpaCampo default False;
    Property  ObrigatorioTabela  : Boolean Read VarObrigatorioTabela Write SetObrigatorioTabela default False;

    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TMaskEditGravacao]);
end;

{ TMaskEditGravacao }

procedure TMaskEditGravacao.Change;
begin
///MaskGetFldSeparator(const EditMask: string)
    inherited Change;

    if (Text = '') or (EditEmBranco)  then
     CampoLocal.Valor := Unassigned
   else if VarTipoTabela = VarDate then begin
     if MascaraCompleta(EditMask,Text) then
       CampoLocal.Valor := StrtoDAteTime(Text)
     else
       CampoLocal.Valor := Unassigned;
    end
   else if VarTipoTabela = VarString then
     CampoLocal.Valor := Text
   else if VarTipoTabela = VarInteger then
     CampoLocal.Valor := StrtoInt(Text)
   else if VarTipoTabela = VarCurrency then
     CampoLocal.Valor := StrtoFloatN(Text);

   if VariantVazia(CampoLocal.Valor) then
     CampoLocal.Valor := Unassigned;

   if (VarGravacao <> nil) then
     VarGravacao.CamposGravacao(CampoLocal);

//    if varchave then
//      VarGravacao.Recupera;

end;


constructor TMaskEditGravacao.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  VarTipoTabela := VarString;
  CampoLocal.Objeto := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor        := Unassigned;
end;

destructor TMaskEditGravacao.Destroy;
begin
  inherited Destroy;
end;

procedure TMaskEditGravacao.DoExit;
begin
{   if (VarGravacao <> nil) and (VArCAmpoTabela <> '') then begin
     VarGravacao.AlimentaValores(VarCampoTabela,Text,VarTipoTabela,VArChave,Obrigatorio);}

    if (VarGravacao <> nil) and (varchave) then
       VarGravacao.Recupera(Self);

  inherited DoExit;
end;

procedure TMaskEditGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
begin
      If (VarGravacao.EstadoGravacao = GRInsert)    then begin
         if TMaskEditGravacao(Sender).LimpaCampo  then
           TMaskEditGravacao(Sender).Clear;
         Exit;
      end;

      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TMaskEditGravacao(Sender).Clear;
         exit;
      end;

     If not TMaskEditGravacao(Sender).Chave  then
        TMaskEditGravacao(Sender).Clear;

      If VarType(Valor) = $0000 then
        Exit;
        
      if Vartipotabela =  varstring then
         TMaskEditGravacao(Sender).text := Valor;

      if Vartipotabela  = varDate then
         TMaskEditGravacao(Sender).text := DatetimetoStr(Valor);

      if Vartipotabela  = varinteger then
         TMaskEditGravacao(Sender).text := IntToStr(Valor);

      if Vartipotabela  = varmemo then
         TMaskEditGravacao(Sender).text := Valor;


{     IF not TMaskEditGravacao(Sender).EditEmBranco Then
       VarGravacao.AlimentaValores(TMaskEditGravacao(Sender).CampoTabela,
                                   TMaskEditGravacao(Sender).Text,
                                   TMaskEditGravacao(Sender).TipoCampo,
                                   TMaskEditGravacao(Sender).Chave,
                                   TMaskEditGravacao(Sender).Obrigatorio)
     else
       VarGravacao.AlimentaValores(TMaskEditGravacao(Sender).CampoTabela,
                                   '',
                                   TMaskEditGravacao(Sender).TipoCampo,
                                   TMaskEditGravacao(Sender).Chave,
                                   TMaskEditGravacao(Sender).Obrigatorio)}

end;

procedure TMaskEditGravacao.SetCampo(Value: String);
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

procedure TMaskEditGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TMaskEditGravacao.SetGravacao(Value: TGravacao);
var
i : integer;
begin
      if VarGravacao <> nil then
        VarGravacao.DeletaCampo(VarCampoTabela);

      VarGravacao := Value;

      VarGravacao.DeletaCampo(VarCampoTabela);

      If value = nil then
       exit;

//     CampoLocal.Valor := Text;
     VarGravacao.CamposGravacao(CampoLocal);
end;


procedure TMaskEditGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

procedure TMaskEditGravacao.SetTipoTabela(Value: TTipoCampo);
begin
   VartipoTabela :=  Value;
   CampoLocal.Tipo := Value;
end;

end.
