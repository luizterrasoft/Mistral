unit PanelObj;

interface

uses
   Graphics,extctrls,classes,Controls,Forms;

type
  TTipoObj = (TpObjeto,TpTexto);

  TPanelObj = class(TPanel)
  private
    { Private declarations }
    FLinha :Word;
    FColuna : Word;
    FTamanho : Word;
    FTipo   : TTipoObj;
    FObjTxt : String;
    FComp  : Boolean;
    FPosicaoI : Word;
    FPosicaoGrid : Word;
    FMascara     : String;
    Procedure SetTamanho(Value : Word);
  protected
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
  public
    { Public declarations }
  published
    { Published declarations }
    Property Linha : Word read FLinha write FLinha default 0;
    Property Coluna : Word read FColuna write FColuna default 0;
    Property Tamanho : Word read FTamanho write FTamanho default 0;//SetTamanho;
    Property Tipo  : TTipoObj read FTipo write FTipo;
    Property ObjTxt :String read FObjTxt write FObjTxt;
    property Comp : Boolean read FComp write FComp default False;
    property PosicaoI : Word read FPosicaoI write FPosicaoI;
    property PosicaoGrid : Word read FPosicaoGrid write FPosicaoGrid;
    property Mascara : String read FMascara write FMascara;
  end;

procedure Register;

implementation

constructor TPanelObj.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //Color := clWindow;
  Alignment := taLeftJustify;
  //BevelInner := bvNone;
  //BevelOuter:= bvNone;
  //Height    := 21;
  //BorderStyle := bsSingle;
end;


Procedure TPanelObj.SetTamanho(Value : Word);
Begin
    FTamanho := Length(Caption);
End;

procedure Register;
begin
  RegisterComponents('Sistema', [TPanelObj]);
end;

end.
