unit NewEditGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EditControle,TipoDef,NewGravacao,FuncoesGlobais;
                                           
type
  TEdiTNewGravacao = class(TEditControle)
  private
    VarCampoTabela :String;
    VarTipoTabela  : TTipoCampo;
    VarChave       : Boolean;
    VarGravacao    : TNewGravacao;
    CampoLocal     : TCampoGravacao;
    VarLimpaCampo,VarObrigatorioTabela : Boolean;
    Procedure PassaValorGravacao(Sender : TObject;Valor : Variant);
    Procedure SeTNewGravacao(Value :TNewGravacao);
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
    { Public declarations }
  published
    procedure Change; override;
    procedure DoExit; override;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
    Property  TipoCampo   : TTipoCAmpo Read VarTipoTabela Write SetTipoTabela;
    Property  Chave       : Boolean Read VarChave Write SetChave default False;
    Property  Gravacao    : TNewGravacao Read VarGravacao Write SeTNewGravacao;
    Property  LimpaCampo  : Boolean Read VarLimpaCampo Write VArLimpaCampo default False;
    Property  ObrigatorioTabela  : Boolean Read VarObrigatorioTabela Write SetObrigatorioTabela default False;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TEdiTNewGravacao]);
end;

{ TEdiTNewGravacao }

constructor TEdiTNewGravacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  VarTipoTabela := VarString;
  Text          := '';
  CampoLocal.Objeto := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor       := Unassigned;
end;

destructor TEdiTNewGravacao.Destroy;
begin
  inherited Destroy;
end;

procedure TEdiTNewGravacao.DoExit;
begin
   if (VarGravacao <> nil) and (VArCAmpoTabela <> '') then
//     VarGravacao.AlimentaValores(VarCampoTabela,Text,VarTipoTabela,VArChave,Obrigatorio);
    if varchave then
      VarGravacao.Recupera(Self);

  inherited DoExit;
end;

procedure TEdiTNewGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
begin
      If (VarGravacao.EstadoGravacao = GRInsert) then begin
         if TEdiTNewGravacao(Sender).LimpaCampo  then
           TEdiTNewGravacao(Sender).Clear;
         Exit;
      end;


      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TEdiTNewGravacao(Sender).Clear;
         exit;
      end;

      If not TEdiTNewGravacao(Sender).Chave  then
       TEdiTNewGravacao(Sender).Clear;

      If VarType(Valor) = $0000 then
        Exit;

      if Vartipotabela =  varstring then
         TEdiTNewGravacao(Sender).text := Valor;

      if Vartipotabela = varcurrency then
         TEdiTNewGravacao(Sender).text := FormatFloat(Mascara,Valor);

      if Vartipotabela  = varDate then
         TEdiTNewGravacao(Sender).text := DatetimetoStr(Valor);

      if Vartipotabela  = varinteger then
         TEdiTNewGravacao(Sender).text := IntToStr(Valor);

      if Vartipotabela  = varmemo then
         TEdiTNewGravacao(Sender).text := Valor;


{       VarGravacao.AlimentaValores(TEdiTNewGravacao(Sender).CampoTabela,
                                   TEdiTNewGravacao(Sender).Text,
                                   TEdiTNewGravacao(Sender).TipoCampo,
                                   TEdiTNewGravacao(Sender).Chave,
                                   TEdiTNewGravacao(Sender).Obrigatorio);}
end;

procedure TEdiTNewGravacao.SeTNewGravacao(Value: TNewGravacao);
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


{      SetLength(Value.Campos,Length(Value.Campos) + 1);
      Value.Campos[Length(Value.Campos) - 1].Campo   :=  VarCampoTabela;
      Value.Campos[Length(Value.Campos) - 1].Tipo    :=  VarTipoTabela;
      Value.Campos[Length(Value.Campos) - 1].Valor   :=  Text;
      Value.Campos[Length(Value.Campos) - 1].Chave   :=  VarChave;
      Value.Campos[Length(Value.Campos) - 1].Objeto  :=  Self;
      Value.Campos[Length(Value.Campos) - 1].Procedimento :=  PassaValorGravacao;}
end;

procedure TEdiTNewGravacao.SetCampo(Value: String);
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

procedure TEdiTNewGravacao.Change;
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

procedure TEdiTNewGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TEdiTNewGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

procedure TEdiTNewGravacao.SetTipoTabela(Value: TTipoCampo);
begin
     VartipoTabela :=  Value;
     CampoLocal.Tipo := Value;
end;

end.
