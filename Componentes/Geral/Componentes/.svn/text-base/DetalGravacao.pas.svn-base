unit DetalGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gravacao,TipoDef,FuncoesGlobais;

type
  TLinhasGravacao = Record
    Linha  :Word;
    Campos : Array of TCampoGravacao;
  end;

  TDetalGravacao = class(TGravacao)
  private
   FMGravacao: TGravacao;
   Registros: Array of TLinhasGravacao;
   FRegMarcado : Integer;
   Chaves   : Array of TCampoGravacao;
   FChavesMaster: TStringList;
   FChavesDetal: TStringList;
   FTabela : String;
   procedure SetChavesDetal(Const Value : TStringList);
   procedure SetChavesMaster(Const Value : TStringList);
   procedure SetTabela(Const Value : String);

    { Private declarations }
  protected
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    Procedure  RetornaValores;
    { Protected declarations }
  public
   procedure CamposGravacao(CampoObjeto: TCampoGravacao);Overload;
   procedure Gravar;Overload;
   Procedure Deleta;Overload;
   Procedure Recupera(Sender : TObject);Overload;
   Procedure AlimentaValores(Campo:String;ValorCampo:String;Tipo:TTipoCampo;VarChave,Obrigatorio:Boolean);Overload;
   Property  RegistroMarcado : Integer Read FRegMarcado Write FRegMarcado Default 0;
    { Public declarations }
  published
   Property MasterGravacao:TGravacao Read FMGravacao Write FMGravacao;
   Property ChavesMaster    : TStringList Read FChavesMaster Write SetChavesMaster;
   Property ChavesDetal      : TStringList Read FChavesDetal Write SetChavesDetal;
   Property Tabela         : String  Read FTabela Write SetTabela;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoGravacao', [TDetalGravacao]);
end;

{ TDetalGravacao }

procedure TDetalGravacao.AlimentaValores(Campo, ValorCampo: String;
  Tipo: TTipoCampo; VarChave, Obrigatorio: Boolean);
var
i,i2 : integer;
begin
   For i:=0 to Length(Chaves) - 1 do
     If Chaves[i2].campo = Campo then
       break;


    If i > Length(Chaves) - 1 then
      setlength(Chaves,Length(Chaves) + 1);


    Chaves[i].Campo       := Chaves;
    Chaves[i].Valor       := ValorCampo;
    Chaves[i].Tipo        := Tipo;
    Chaves[i].Chave       := VarChave;
    Chaves[i].Obrigatorio := Obrigatorio;



  For i:=0 to Length(Registros) - 1 do begin
    for i2:=0 to Length(Registros[i].Campos) - 1 do
      If Registros[i].Campos[i2] = Campo then
       break;

      If i2 > Length(Registros[i].Campos) - 1 then
       setlength(Registros[i].Campos,Length(Registros[i].Campos) + 1);

       Registros[i].Campos[i2].Campo       := Chaves;
       Registros[i].Campos[i2].Valor       := ValorCampo;
       Registros[i].Campos[i2].Tipo        := Tipo;
       Registros[i].Campos[i2].Chave       := VarChave;
       Registros[i].Campos[i2].Obrigatorio := Obrigatorio;
  end;

 inherited AlimentaValores(Campo,ValorCampo,Tipo,VarChave,Obrigatorio);
end;



procedure TDetalGravacao.CamposGravacao(CampoObjeto: TCampoGravacao);
var
i,i2 : integer;
begin

    If RegMarcado > Length(Registros[i]) - 1 then
      setlength(Registros[i],Length(Registros[i]) + 1);

    for i:=0 to Length(Registros[FRegMarcado].Campos) - 1 do
     if Uppercase(Registros[FRegMarcado].Campos[FRegMarcado].Campo) = Uppercase(Value.Campo) then
      break;


     If i > Length(Registros[FRegMarcado].Campos) - 1 then
      setlength(Registros[FRegMarcado].Campos,Length(Registros[FRegMarcado].Campos) + 1);

     Registros[FRegMarcado].Campos[i]      := Value;

      For i:=0 to Length(Chaves) -1 do begin
          for i2:=0 to Length(Registro[FRegMarcado].Campo) - 1 do begin
              If Chaves[i].Campo = Registros[FRegMarcado].Campos[i2].Campo then
                break;

              If i2 >  Length(Registros[FRegMarcado].Campos) do
               setlength(Registros[FRegMarcado].Campos[i2],Length(Registros[FRegMarcado].Campos[i2]) + 1);


              Registros[FRegMarcado].Campos[i2] := Chaves[i];
         end;
     end;



end;


constructor TDetalGravacao.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  FChavesDetal  := TStringList.Create;
  FChavesMaster := TStringList.Create;
end;

procedure TDetalGravacao.Deleta;
begin
  inherited Deleta;
end;

destructor TDetalGravacao.Destroy;
begin
  FChavesDetal.destroy;
  FChavesMaster.destroy;
  inherited Destroy;
end;

procedure TDetalGravacao.Gravar;
var
i : integer;
begin
  For i:=0 to Length(Registros) - 1 do begin
     Campos :=  Registro[i].Campos;
     inherited Gravar;
end;

procedure TDetalGravacao.Recupera(Sender: TObject);
var
i,i2,i3 : integer;
begin

   For i:=0 to FChavesMaster.Count - 1 do begin
          for i2:=0 to Length(Chaves.Campo) - 1 do begin
              If Uppercase(FChavesDetal[i]) = UpperCase(Chaves.Campo) then
                break;

              If i2 >  Length(Chaves) - 1 then
                setlength(Chaves[i2],Length(Chaves[i2]) + 1));

              If FMGravacao is TDetalGravacao then begin
                   for i3:=0 to Length(TDetalGravacao(FMGravacao.Registros[RegistroMarcado].Campos)) - 1 do begin
                     if UpperCase(TDetalGravacao(FMGravacao.Registros[RegistroMarcado].Campos)) = Uppercase(FChavesMaster[i]) then
                        Chaves[i2] := FMGravacao.Registros[RegistroMarcado].Campos[i2];
                    end;
                end
              else begin
                    for i3:=0 to Length(FMGravacao.Campos) - 1 do begin
                       if UpperCase(FMGravacao.Campos[i3]) = Uppercase(Chaves.Campos[i2]) then
                          Chaves[i2] := FMGravacao.Campos[i2];
                    end;
               end;
            end;
         end;
   end;

  Campos := Chaves;
  inherited Recupera(Sender);
end;


procedure TDetalGravacao.RetornaValores;
var i:integer;
begin
   With PesquisaGravacao do begin
    for i:=0 to Length(Registros) - 1 do begin
       FRegMarcado := I;
       While Not Eof Do Begin
             If Campos[i].Objeto = nil then
             continue;

            if campos[i].tipo = varstring then
               Campos[i].Procedimento(Campos[i].Objeto,FieldByName(Campos[i].Campo).AsString);

            if campos[i].tipo = varcurrency then
               Campos[i].Procedimento(Campos[i].Objeto,FieldByName(Campos[i].Campo).AsFloat);

            if Campos[i].tipo = varDate then
               Campos[i].Procedimento(Campos[i].Objeto,FieldByName(Campos[i].Campo).AsDateTime);

            if Campos[i].tipo = varinteger then
               Campos[i].Procedimento(Campos[i].Objeto,FieldByName(Campos[i].Campo).AsInteger);

            if Campos[i].tipo = varmemo then
               Campos[i].Procedimento(Campos[i].Objeto,FieldByName(Campos[i].Campo).AsString);
      end;
   end;
end;

procedure TDetalGravacao.SetChavesDetal(const Value: TStringList);
begin
  FChavesDetal.Assign(Value);
end;

procedure TDetalGravacao.SetChavesMaster(const Value: TStringList);
begin
  FChavesMaster.Assign(Value);
end;

procedure TDetalGravacao.SetTabela(Const VAlue : String);
begin
  FTabela := Value;
  if FMGravacao <> Nil then FMGravacao.TabelaDetalhe := Value;
end;


end.
