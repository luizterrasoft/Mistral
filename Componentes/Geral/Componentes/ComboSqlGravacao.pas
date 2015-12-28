unit ComboSqlGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComboSql,TipoDef,Gravacao,FuncoesGlobais;

type
  TComboSqlGravacao = class(TComboSql)
  private
    CampoLocal      :TCampoGravacao;
    VarChave        :Boolean;
    VarTipoCampo    :TTipoCampo;
    VarGravacao     :TGravacao;
    VarCampoTabela: String;
    VArLimpaCampo,VArObrigatorioTabela : Boolean;
    Procedure       PassaValorGravacao(Sender : TObject;Valor : Variant);
    Procedure       SetGravacao(VAlue : TGravacao);
    Procedure       SetCampo(Value : String);
    Procedure       SetChave(Value:Boolean);
    Procedure       SetObrigatorioTabela(Value:Boolean);
    Procedure       SetTipoCampo(VAlue:TTipoCampo); 
    { Private declarations }
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
  public
    { Public declarations }
  published
    Procedure Change;Override;
    Procedure Doexit;Override;
//    Property  TipoCampo   : TTipoCampo  Read VarTipoCAmpo Write SetTipoCAmpo;
    Property  CampoTabela : String Read VarCampoTabela Write SetCampo;
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
  RegisterComponents('RodrigoGravacao', [TComboSqlGravacao]);
end;

{ TComboSqlGravacao }

constructor TComboSqlGravacao.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  CampoLocal.Objeto := Self;
  CampoLocal.Procedimento := PassaValorGravacao;
  CampoLocal.Valor        := Unassigned;
end;

destructor TComboSqlGravacao.Destroy;
begin
  inherited Destroy;
end;

procedure TComboSqlGravacao.Doexit;
var
ObjetoLocal :TComboSql;
begin
   if (VarGravacao <> nil) and (varchave) then
     VarGravacao.Recupera(Self);


  inherited DoExit;
end;

procedure TComboSqlGravacao.PassaValorGravacao(Sender: TObject;
  Valor: Variant);
var
i : integer;
objetolocal :TComboSql;
begin
        If (VarGravacao.EstadoGravacao = GRInsert)    then begin
           if TComboSqlGravacao(Sender).LimpaCampo  then
             TComboSqlGravacao(Sender).Clear;

            Change;
            exit;
      end;

      if (VarGravacao.EstadoGravacao = GRDelete) then begin
         TComboSqlGravacao(Sender).Clear;
         Change;
         exit;
      end;

  If not TComboSqlGravacao(Sender).Chave  then
   TComboSqlGravacao(Sender).Itemindex := -1;

  If VarType(Valor) = $0000 then begin
     Change;
     Exit;
  end;

  If (Retorno = RcText)  then
   begin
      if TipoCampo =  varstring then
        TComboSqlGravacao(Sender).text := Valor;

      if TipoCampo = varcurrency then
         TComboSqlGravacao(Sender).text := FormatFloat('#,##0.00',Valor);

      if TipoCampo  = varDate then
         TComboSqlGravacao(Sender).text := DatetimetoStr(Valor);

      if TipoCampo  = varinteger then
         TComboSqlGravacao(Sender).text := InttoStr(Valor);

      if TipoCampo  = varmemo then
         TComboSqlGravacao(Sender).text := Valor;
   end
  else
         TComboSqlGravacao(Sender).ValorChave(Valor);

   Change;
end;

procedure TComboSqlGravacao.SetGravacao(VAlue : TGravacao);
var
i,i2 :integer;
objetolocal : TComboSql;
campoobjetolocal:TCampoGravacao;
begin
       VarGravacao := Value;

       VarGravacao.DeletaCampo(VarCampoTabela);

       If value = nil then
        exit;

      if (DetalCombo <> nil)  then
       exit;

     CampoLocal.Tipo         :=  TipoCAmpo;
//     CampoLocal.Valor := Text;
     VarGravacao.CamposGravacao(CampoLocal);

{      objetolocal := DetalCombo;
      while objetolocal <> nil do begin
         if objetolocal is TComboSqlGravacao then begin
                for i:=0 to Length(Value.Campos) - 1 do begin
                  if Value.campos[i].objeto = objetolocal then begin
                      VAlue.Deletacampo(TComboSqlGravacao(ObjetoLocal).CampoTabela);

                      CampoObjetoLocal.Campo        :=  TComboSqlGravacao(ObjetoLocal).CampoTabela;
                      CampoObjetoLocal.Tipo         :=  ObjetoLocal.TipoCAmpo;
                      CampoObjetoLocal.Valor        :=  Unassigned;
                      CampoObjetoLocal.Chave        :=  TComboSqlGravacao(ObjetoLocal).Chave;
                      CampoObjetoLocal.Objeto       :=  ObjetoLocal;
                      CampoObjetoLocal.Procedimento :=  TComboSqlGravacao(ObjetoLocal).PassaValorGravacao;
                      VarGravacao.CamposGravacao(CampoObjetoLocal);
                   end;
                end;
          end;
          ObjetoLocal := ObjetoLocal.DetalCombo;
      end;}


end;


procedure TComboSqlGravacao.SetCampo(Value: String);
var
objetolocal : TComboSql;
i,i2: integer;
OldCampo : string;
CampoObjetoLocal:Tcampogravacao;
begin

     CampoLocal.Campo := Value;

     OldCampo := VarCampoTabela;

     VarCampoTabela := Value;

     If VarGravacao = nil then
        exit;

     VarGravacao.DeletaCampoObjeto(OldCampo,Self);


      if value = '' then
        exit;

//      VarGravacao.DeletaCampoObjeto(VarCampoTabela,Self);

      if (DetalCombo <> nil)  then
       exit;

     CampoLocal.Tipo         :=  TipoCAmpo;
     VarGravacao.CamposGravacao(CampoLocal);
{      objetolocal := DetalCombo;
      while objetolocal <> nil do begin
         if objetolocal is TComboSqlGravacao then begin
                      VarGravacao.DeletaCampoObjeto(TComboSqlGravacao(ObjetoLocal).CampoTabela,TComboSqlGravacao(ObjetoLocal));

                      CampoObjetoLocal.Campo        :=  TComboSqlGravacao(ObjetoLocal).CampoTabela;
                      CampoObjetoLocal.Tipo         :=  ObjetoLocal.TipoCAmpo;
                      CampoObjetoLocal.Valor        :=  Unassigned;
                      CampoObjetoLocal.Chave        :=  TComboSqlGravacao(ObjetoLocal).Chave;
                      CampoObjetoLocal.Objeto       :=  ObjetoLocal;
                      CampoObjetoLocal.Procedimento :=  TComboSqlGravacao(ObjetoLocal).PassaValorGravacao;
                      VarGravacao.CamposGravacao(CampoObjetoLocal);
          end;
          ObjetoLocal := ObjetoLocal.DetalCombo;
      end;}

end;



procedure TComboSqlGravacao.Change;
begin
     if (Text = '')  or (ItemIndex = -1)  then
     CampoLocal.Valor := Unassigned
   else if TipoCampo = VarDate then
     CampoLocal.Valor := StrtoDAteTime(ValorRetorno)
   else if TipoCampo = VarString then
     CampoLocal.Valor := ValorRetorno
   else if TipoCampo = VarInteger then
      CampoLocal.Valor := StrtoInt(ValorRetorno)
   else if TipoCampo = VarCurrency then
     CampoLocal.Valor := StrtoFloatN(ValorRetorno);

   if VariantVazia(CampoLocal.Valor) then
     CampoLocal.Valor := Unassigned;

   if (VarGravacao <> nil) then
     VarGravacao.CamposGravacao(CampoLocal);

  inherited Change;
end;

procedure TComboSqlGravacao.SetChave(Value: Boolean);
begin
   VarChave := Value;
   CampoLocal.Chave := Value;
end;

procedure TComboSqlGravacao.SetObrigatorioTabela(Value: Boolean);
begin
   VarObrigatorioTabela := Value;
   CampoLocal.Obrigatorio := Value;
end;

{       VarGravacao := Value;

       VarGravacao.DeletaCampo(VarCampoTabela);

       If value = nil then
        exit;
//       if (DetalCombo <> nil)  then
  //      exit;

       If VarCAmpoTabela = '' then
        exit;


      SetLength(Value.Campos,Length(Value.Campos) + 1);
      Value.Campos[Length(Value.Campos) - 1].Campo   :=  VarCampoTabela;
      Value.Campos[Length(Value.Campos) - 1].Tipo    :=  VarTipoCampo;
      Value.Campos[Length(Value.Campos) - 1].Valor   :=  Text;
      Value.Campos[Length(Value.Campos) - 1].Chave   :=  VarChave;
      Value.Campos[Length(Value.Campos) - 1].Objeto  :=  Self;
      Value.Campos[Length(Value.Campos) - 1].Procedimento :=  PassaValorGravacao;


      objetolocal := DetalCombo;
      while objetolocal <> nil do begin
         if objetolocal is TComboSqlGravacao then begin
                for i:=0 to Length(Value.Campos) - 1 do begin
                  if Value.campos[i].objeto = objetolocal then begin
                      VAlue.Deletacampo(TComboSqlGravacao(ObjetoLocal).CampoTabela);

                      SetLength(Value.Campos,Length(Value.Campos) + 1);
                      Value.Campos[Length(Value.Campos) - 1].Campo   :=  TComboSqlGravacao(ObjetoLocal).CampoTabela;
                      Value.Campos[Length(Value.Campos) - 1].Tipo    :=  ObjetoLocal.TipoCAmpo;
                      Value.Campos[Length(Value.Campos) - 1].Valor   :=  ObjetoLocal.Text;
                      Value.Campos[Length(Value.Campos) - 1].Chave   :=  TComboSqlGravacao(ObjetoLocal).Chave;
                      Value.Campos[Length(Value.Campos) - 1].Objeto  :=  ObjetoLocal;
                      Value.Campos[Length(Value.Campos) - 1].Procedimento :=  TComboSqlGravacao(ObjetoLocal).PassaValorGravacao;
                   end;
                end;
          end;
          ObjetoLocal := ObjetoLocal.DetalCombo;
      end;}

procedure TComboSqlGravacao.SetTipoCampo(VAlue: TTipoCampo);
begin
   VarTipoCampo    := Value;
   CampoLocal.Tipo := Value;
end;

end.
