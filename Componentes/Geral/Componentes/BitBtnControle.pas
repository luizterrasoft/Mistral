unit BitBtnControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,Controle,ConstantesAppl,grids,ExtCtrls,funcoesglobais;

type

  TActionButtonType = (tanone,taInserir,taCancela,taImprimir,taGravar,taExcluir);

  TBitBtnControle = class(TBitBtn)
  private
    { Private declarations }
    FPosicao : Word;
    FAcao: TActionButtonType;
    procedure CreateWnd;
    procedure SetAcao(const Value: TActionButtonType);
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
  public
    { Public declarations }
    FCreating,NoClick:Boolean;
    FocoDestino : HWND;
    ControlDestino : TObject;
  published
    { Published declarations }
    procedure Click; override;
    property  Posicao : Word read FPosicao write FPosicao;
    property  Acao    : TActionButtonType read FAcao write SetAcao;
  end;

  Procedure SetaFoco;
  Var
    FFocoDestino : HWND;

procedure Register;

implementation

constructor TBitBtnControle.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Posicao := RetPosicao(AOwner);
  FCreating := false;
end;

Procedure SetaFoco;
Begin
    SetFocus(FFocoDestino);
End;

procedure TBitBtnControle.Click;
Begin
   try
     NoClick := True;
     if (Owner is TCustomForm) and (TcustomForm(Owner).ActiveControl <> Self) then
          if (TcustomForm(Owner).ActiveControl is TCustomEdit) and Assigned(TEdit(TcustomForm(Owner).ActiveControl).OnExit) then
            TEdit(TcustomForm(Owner).ActiveControl).OnExit(TcustomForm(Owner).ActiveControl)
          else if (TcustomForm(Owner).ActiveControl is TCustomComboBox) and Assigned(Tcombobox(TCustomForm(Owner).ActiveControl).OnExit) then
            TComboBox(TcustomForm(Owner).ActiveControl).OnExit(TcustomForm(Owner).ActiveControl)
          else if (TcustomForm(Owner).ActiveControl is TcustomRadioGroup) and (Assigned(TRadioGroup(TCustomForm(Owner).ActiveControl).OnExit)) then
            TRadioGroup(TcustomForm(Owner).ActiveControl).OnExit(TcustomForm(Owner).ActiveControl)
          else if (TcustomForm(Owner).ActiveControl is TcustomGrid) and (Assigned(TStringGrid(TCustomForm(Owner).ActiveControl).OnExit)) then
            TStringGrid(TcustomForm(Owner).ActiveControl).OnExit(TcustomForm(Owner).ActiveControl)
          else if (TcustomForm(Owner).ActiveControl is TCustomListBox) and (Assigned(TListBox(TcustomForm(Owner).ActiveControl).OnExit)) then
            TListBox(TcustomForm(Owner).ActiveControl).OnExit(TcustomForm(Owner).ActiveControl);

     inherited Click;
//     FFocoDestino := FocoDestino;
  //   SetaFoco;
   finally
     NoClick := False;
   end;
End;

procedure TBitBtnControle.CreateWnd;
begin
   inherited CreateWnd;
   if not FCreating then begin
      FCreating := True;
      GetPopupMenu;
   end;
end;


procedure Register;
begin
  RegisterComponents('Sistema', [TBitBtnControle]);
end;

procedure TBitBtnControle.SetAcao(const Value: TActionButtonType);
var
FCaminho:String;
begin
   If (Facao <> Value) and (CaminhoImagemBotoes <> '') then begin
      case value of
       tanone     :glyph.FreeImage;
       tainserir  :FCaminho := CaminhoExtensao(iifs(CaminhoImagemBotoes = '',extractfilepath(application.exename),CaminhoImagemBotoes)+'\'+'Inserir',['bmp']);
       taExcluir  :FCaminho := CaminhoExtensao(iifs(CaminhoImagemBotoes = '',extractfilepath(application.exename),CaminhoImagemBotoes)+'\'+'Excluir',['bmp']);
       taimprimir :FCaminho := CaminhoExtensao(iifs(CaminhoImagemBotoes = '',extractfilepath(application.exename),CaminhoImagemBotoes)+'\'+'Imprimir',['bmp']);
       tacancela  :FCaminho := CaminhoExtensao(iifs(CaminhoImagemBotoes = '',extractfilepath(application.exename),CaminhoImagemBotoes)+'\'+'Cancelar',['bmp']);
       taGravar   :FCaminho := CaminhoExtensao(iifs(CaminhoImagemBotoes = '',extractfilepath(application.exename),CaminhoImagemBotoes)+'\'+'Gravar',['bmp']);
      end;
      If (FCaminho <> '') then
        glyph.LoadFromFile(FCaminho);
   end;
   FAcao := Value;
end;

end.
