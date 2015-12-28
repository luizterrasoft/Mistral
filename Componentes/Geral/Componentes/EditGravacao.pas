unit EditGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EditControle,TipoDef,Gravacao,FuncoesGlobais;

type
  TEditGravacao = class(TEditControle)
  private
    OldTextGlobal  : String;
    VarCampoTabela :String;
    VarTipoTabela  : TTipoCampo;
    VarChave       : Boolean;
    VarGravacao    : TGravacao;
    CampoLocal     : TCampoGravacao;
    VarLimpaCampo,VarObrigatorioTabela : Boolean;
    FRecupera: TGravacao;
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    Procedure SetGravacao(Value :TGravacao);
    Procedure SetCampo(Value:String);
    Procedure SetChave(Value:Boolean);
    Procedure SetObrigatorioTabela(Value:Boolean);
    Procedure SetTipoTabela(Value:TTipoCampo);

    { Private declarations }
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
  public
    Alterado : Boolean;
    { Public declarations }
  published
    procedure Change; override;
    procedure DoExit; override;
    procedure DoEnter; override;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
    Property  TipoCampo   : TTipoCAmpo Read VarTipoTabela Write SetTipoTabela;
    Property  Chave       : Boolean Read VarChave Write SetChave default False;
    Property  Gravacao    : TGravacao Read VarGravacao Write SetGravacao;
    Property  LimpaCampo  : Boolean Read VarLimpaCampo Write VArLimpaCampo default False;
    Property  ObrigatorioTabela  : Boolean Read VarObrigatorioTabela Write SetObrigatorioTabela default False;
    Property  RecuperaGravacao  : TGravacao Read FRecupera Write FRecupera;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TEditGravacao]);
end;

{ TEditGravacao }

constructor TEditGravacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  VarTipoTabela := VarString;
  Text          := '';
  CampoLocal.Objeto       := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor        := Unassigned;
end;

destructor TEditGravacao.Destroy;
begin
  inherited Destroy;
end;

procedure TEditGravacao.DoExit;
begin
    Alterado := (OldTextGlobal <> Text);

    if (VarGravacao <> nil) and (VArCAmpoTabela <> '') then
     if varchave then
       VarGravacao.Recupera(Self);

     If (FRecupera <> Nil) and Alterado  then
      FRecupera.Recupera(self);

  inherited DoExit;
end;

procedure TEditGravacao.PassaValorGravacao(Sender: TObject;
 Valor: Variant);
begin
      If (VarGravacao.EstadoGravacao = GRInsert)    then begin
         if TEditGravacao(Sender).LimpaCampo  then
           TEditGravacao(Sender).Clear;
         Exit;
      end;


      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TEditGravacao(Sender).Clear;
         exit;
      end;

      If Not TEditGravacao(Sender).Chave  then
       TEditGravacao(Sender).Clear;

      If VarType(Valor) = $0000 then
        Exit;

      if Vartipotabela =  varstring then
         TEditGravacao(Sender).text := Valor;

      if Vartipotabela = varcurrency then
         TEditGravacao(Sender).text := FormatFloat(Mascara,Valor);

      if Vartipotabela  = varDate then
         TEditGravacao(Sender).text := DatetimetoStr(Valor);

      if Vartipotabela  = varinteger then
         TEditGravacao(Sender).text := IntToStr(Valor);

      if Vartipotabela  = varmemo then
         TEditGravacao(Sender).text := Valor;


{       VarGravacao.AlimentaValores(TEditGravacao(Sender).CampoTabela,
                                   TEditGravacao(Sender).Text,
                                   TEditGravacao(Sender).TipoCampo,
                                   TEditGravacao(Sender).Chave,
                                   TEditGravacao(Sender).Obrigatorio);}
end;

procedure TEditGravacao.SetGravacao(Value: TGravacao);
var
i : integer;
begin
      if VarGravacao <> nil then
        VarGravacao.DeletaCampo(VarCampoTabela);

      VarGravacao := Value;

      VarGravacao.DeletaCampo(VarCampoTabela);

      If value = nil then
       exit;

      VarGravacao.CamposGravacao(CampoLocal);


end;

procedure TEditGravacao.SetCampo(Value: String);
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

procedure TEditGravacao.Change;
begin

    if (Text = '')  then
     CampoLocal.Valor := Unassigned
   else if VarTipoTabela = VarDate then
     CampoLocal.Valor := StrtoDAteTime(Text)
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



    inherited Change;
end;

procedure TEditGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TEditGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

procedure TEditGravacao.SetTipoTabela(Value: TTipoCampo);
begin
     VartipoTabela :=  Value;
     CampoLocal.Tipo := Value;
end;

procedure TEditGravacao.DoEnter;
begin
  OldTextGlobal := Text;
  inherited DoEnter;
end;

end.
