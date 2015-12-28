unit RedDuplicata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, MaskEdit, EditControle, Db, DBTables,FuncoesGlobais,
  Sequencial;

type
  TFrm_RedDuplicata = class(TForm)
    Label9: TLabel;
    Duplicata: TEditControle;
    Label1: TLabel;
    Vencimento: TMaskEditControle;
    btOK: TBitBtn;
    BtCancel: TBitBtn;
    Sequencial1: TSequencial;
    procedure DuplicataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    PagRec:String;
    clientefornecedor:String
    { Public declarations }
  end;

var
  Frm_RedDuplicata: TFrm_RedDuplicata;

implementation

{$R *.DFM}

procedure TFrm_RedDuplicata.DuplicataKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_f2 then
   MontaPesquisa(Twincontrol(Sender),'DUPLICATA','','PagREc  = '''+PagRec+''' and Cliente_Duplicata = '''+ClienteFornecedor+'''',Nil);
end;

end.
