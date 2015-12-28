unit DbEditControle2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls,{DsgnIntf,}dbtables,pesquisa,Buttons,TipoDef,DbEditControle;

type

  TDbEditControle2 = class(TDbEditControle)
  private
    { Private declarations }
    FTeste : Boolean;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

constructor TDbEditControle2.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin
  nHandle := inherited Create(AOwner);
  FTeste := True;
//  FTabela := TDbTabela.Create(Self);

//  If FGeraPesquisa Then
//     FPesquisa  := TPesquisa.Create(nHandle);

//   If FTabela <> nil then
//   FTabela.Adiciona(FCampoTabela,FTipoTab,Self,FChave);

end;

destructor TDbEditControle2.Destroy;
Begin
//   FTabela.Destroy;
//   If FGeraPesquisa Then
//       FPesquisa.Destroy;
   inherited Destroy;
End;


procedure Register;
begin
  //RegisterPropertyEditor(TypeInfo(TPesquisa),Nil,'Pesquisa',TEditorTPesquisa);
  RegisterComponents('Sistema Db', [TDbEditControle2]);
  //RegisterComponents('Sistema', [TPesquisa]);
end;


end.
