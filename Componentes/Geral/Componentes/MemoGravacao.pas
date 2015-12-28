unit MemoGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,TipoDef,Gravacao,FuncoesGlobais;

type
  TMemoGravacao = class(TMemo)
   private
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
  RegisterComponents('RodrigoGravacao', [TMemoGravacao]);
end;

{ TMemoGravacao }

procedure TMemoGravacao.Change;
begin
    if (Text = '')  then
     CampoLocal.Valor := Unassigned
   else if VarTipoTabela = VarDate then
     CampoLocal.Valor := StrtoDAteTime(Text)
   else if (VarTipoTabela = VarString) or (VarTipoTabela = VarMemo) then
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

constructor TMemoGravacao.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  VarTipoTabela := VarString;
  Text          := '';
  CampoLocal.Objeto := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor       := Unassigned;
end;

destructor TMemoGravacao.Destroy;
begin
  inherited Destroy;

end;

procedure TMemoGravacao.DoEnter;
begin
  inherited DoEnter;

end;

procedure TMemoGravacao.DoExit;
begin
  inherited DoExit;

end;

procedure TMemoGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
begin
      If (VarGravacao.EstadoGravacao = GRInsert)    then begin
         if TMemoGravacao(Sender).LimpaCampo  then
           TMemoGravacao(Sender).Clear;
         Exit;
      end;


      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TMemoGravacao(Sender).Clear;
         exit;
      end;

      If Not TMemoGravacao(Sender).Chave  then
       TMemoGravacao(Sender).Clear;

      If VarType(Valor) = $0000 then
        Exit;

      if Vartipotabela =  varstring then
         TMemoGravacao(Sender).text := Valor;


      if Vartipotabela  = varDate then
         TMemoGravacao(Sender).text := DatetimetoStr(Valor);

      if Vartipotabela  = varinteger then
         TMemoGravacao(Sender).text := IntToStr(Valor);

      if Vartipotabela  = varmemo then
         TMemoGravacao(Sender).text := Valor;

end;

procedure TMemoGravacao.SetCampo(Value: String);
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

procedure TMemoGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TMemoGravacao.SetGravacao(Value: TGravacao);
begin
      if VarGravacao <> nil then
        VarGravacao.DeletaCampo(VarCampoTabela);

      VarGravacao := Value;

      VarGravacao.DeletaCampo(VarCampoTabela);

      If value = nil then
       exit;

     VarGravacao.CamposGravacao(CampoLocal);
end;

procedure TMemoGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

procedure TMemoGravacao.SetTipoTabela(Value: TTipoCampo);
begin
     VartipoTabela :=  Value;
     CampoLocal.Tipo := Value;
end;

end.
