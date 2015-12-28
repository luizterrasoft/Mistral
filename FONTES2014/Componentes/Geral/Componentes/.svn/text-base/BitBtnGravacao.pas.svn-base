unit BitBtnGravacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,Gravacao;

type

  TNotifyEvent = Procedure (Sender : TObject) of Object;

  TBitBtnGravacao = class(TBitBtn)
  private
    VarEstadoGravacao : TEstadoGravacao;
    VarGravacao       : TGravacao;
    VarPosClick       : TNotifyEvent;
    Procedure SetEstadoGravacao(Value : TEstadoGravacao);
    { Private declarations }
  protected
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    { Protected declarations }
  public
    { Public declarations }
  published
    Procedure  Click;Override;
    property Estado  : TestadoGravacao Read VarEstadoGravacao Write SetEstadoGravacao;
    property Gravacao : TGravacao read varGravacao write vargravacao;
    Property OnPosClick : TNotifyEvent read varposclick write varposclick;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoComponentes', [TBitBtnGravacao]);
end;

{ TBitBtnGravacao }

procedure TBitBtnGravacao.Click;
begin
   inherited Click;

  If VarGravacao = NiL Then
   exit;

  if VarEstadoGravacao = GRInsert then
   If MessageDlg('Confirma Inclusão ou Alteração do dados',mtConfirmation,[mbyes,mbno],0) = mryes Then
     VarGravacao.Gravar;

  if VarEstadoGravacao = GRDelete then begin
     If MessageDlg('Confirma Exclusão',mtConfirmation,[mbyes,mbno],0) = mryes Then
       VarGravacao.Deleta(VarGravacao);
  end;


  if VarEstadoGravacao = GRRetornando then
     VarGravacao.Recupera(TForm(OWner));

   if Assigned(VarPosClick) then
      VarPosClick(Self);
end;

constructor TBitBtnGravacao.Create(AOwner: TComponent);
begin
    inherited Create(Aowner);


end;

destructor TBitBtnGravacao.Destroy;
begin
   inherited Destroy;
end;

procedure TBitBtnGravacao.SetEstadoGravacao(Value: TEstadoGravacao);
begin
//  if Value = GRInsert then
   //if FileExists(ExtractFilePath(Application.ExeName)+'Grava.Bmp') then
   //   Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Grava.Bmp');

 // if Value = GRDelete then
   //if FileExists(ExtractFilePath(Application.ExeName)+'Exclui.Bmp') then
   //   Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'Exclui.Bmp');

    varestadogravacao := value;
end;

end.
