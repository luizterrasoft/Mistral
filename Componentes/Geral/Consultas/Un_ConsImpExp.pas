unit Un_ConsImpExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, DBGridControle, StdCtrls, Buttons,
  ExtCtrls, PanelControle, EditControle, Mask, MaskEdit,funcoesglobais;

type
  TFrm_Cons_ImpExp = class(TForm)
    Panel1: TPanel;
    Inicio1: TMaskEditControle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    fim1: TMaskEditControle;
    Label4: TLabel;
    Fim2: TMaskEditControle;
    iNICIO2: TMaskEditControle;
    Label5: TLabel;
    Data1: TMaskEditControle;
    Label6: TLabel;
    Data2: TMaskEditControle;
    Label7: TLabel;
    Loja: TEditControle;
    PanelControle1: TPanelControle;
    RdTipo: TRadioGroup;
    DBGridControle1: TDBGridControle;
    DBGridControle2: TDBGridControle;
    Query1: TQuery;
    Query2: TQuery;
    Ds1: TDataSource;
    DataSource2: TDataSource;
    Panel4: TPanel;
    botao_sair: TPanel;
    btn_procurar: TBitBtn;
    procedure btn_procurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RdTipoClick(Sender: TObject);
    procedure LojaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridControle1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
   FCred:Boolean;
    { Public declarations }
  end;

var
  Frm_Cons_ImpExp: TFrm_Cons_ImpExp;

implementation

uses principal;

{$R *.dfm}

procedure TFrm_Cons_ImpExp.btn_procurarClick(Sender: TObject);
begin
   With Query2 do begin
    parambyname('Tipo').AsString := IIfs(RdTipo.ItemIndex = 1,'I','E');
    parambyname('Loja').AsFloat  := frm_principal.x_frente_loja;
   end;

   With Query1 do begin
    sql.clear;
    sql.add('SELECT Distinct '+IIfs(FCRED and  (RdTipo.ItemIndex = 1),'IX_LOJADEST as Lj,IX_DATAEXP as DataExp,IX_HORAEXP as HoraExp,','')+'IX_DATA as DataImp,IX_INICIO as Inicio,IX_FIM as Fim, IX_USUARIO as Usuario,IX_ERRO as Erro');
    sql.add('FROM  Imp_exp');
    sql.add('Where Ix_ImpExp  =:Tipo');
    sql.add('and   Ix_LojaOrg =:Loja');
    parambyname('Tipo').AsString := IIfs(RdTipo.ItemIndex = 1,'I','E');
    parambyname('Loja').AsFloat  := frm_principal.x_frente_loja;

    IF NOT INICIO1.EDITEMBRANCO Then begin
      sql.add('and   Ix_Inicio >=:Ini1');
      parambyname('Ini1').AsDateTime := StrtodateN(Inicio1.Text);
    end;

    IF NOT INICIO2.EDITEMBRANCO Then begin
      sql.add('and   Ix_Inicio <=:Ini2');
      parambyname('Ini2').AsDateTime := StrtodateN(Inicio2.Text);
    end;

    IF NOT Data1.EDITEMBRANCO Then begin
      sql.add('and   Ix_Data >=:Ini1');
      parambyname('Ini1').AsDateTime := StrtodateN(Data1.Text+' 00:00');
    end;

    IF NOT Data2.EDITEMBRANCO Then begin
      sql.add('and   Ix_Data <=:Ini2');
      parambyname('Ini2').AsDateTime := StrtodateN(data2.Text+' 23:59');
    end;

    IF NOT Fim1.EDITEMBRANCO Then begin
      sql.add('and   Ix_Fim >=:Ini1');
      parambyname('Ini1').AsDateTime := StrtodateN(Fim1.Text);
    end;

    IF NOT Fim2.EDITEMBRANCO Then begin
      sql.add('and   Ix_Fim <=:Ini2');
      parambyname('Ini2').AsDateTime := StrtodateN(Fim2.Text);
    end;

    IF Loja.text <> '' Then begin
      sql.add('and   Ix_LojaDest =:Loja1');
      parambyname('Loja1').AsFloat := StrtoFloatN(Loja.Text);
    end;
    Query2.Close;
    Sql.Add('Order By DataImp Desc');
    Open;

{    With FieldByName('LojaDest') do begin
     DisplayLabel := 'Lj Destino';
     DisplayWidth := 10;
    end;}
    If findField('Lj') <> Nil Then
    begin
      With  FieldByName('Lj') do
        DisplayWidth := 3;
       With TDateTimeField(FieldByName('DataExp')) do begin
        DisplayWidth := 10;
        DisplayFormat := 'dd/mm/yyyy';
       end;
       With FieldByName('HoraExp') do begin
        DisplayWidth := 8;
       end;
    end;
    With TDateTimeField(FieldByName('DataImp')) do begin
     DisplayWidth := 18;
     DisplayFormat := 'dd/mm/yyyy hh:mm';
    end;

    With TDateTimeField(FieldByName('Inicio')) do begin
     DisplayWidth := 10;
     DisplayFormat := 'dd/mm/yyyy';
    end;

    With TDateTimeField(FieldByName('Fim')) do begin
     DisplayWidth := 10;
     DisplayFormat := 'dd/mm/yyyy';
    end;

    With FieldByName('Usuario') do begin
     DisplayWidth := 32;
    end;

    With FieldByName('Erro') do begin
     Displaylabel := 'Status';
     DisplayWidth := 12;
    end;

   end;
end;

procedure TFrm_Cons_ImpExp.FormCreate(Sender: TObject);
begin
  DBGridControle2.DbGridPrinc := DBGridControle1;
  Fcred := false;
end;

procedure TFrm_Cons_ImpExp.RdTipoClick(Sender: TObject);
begin
  btn_procurar.OnClick(Sender);
end;

procedure TFrm_Cons_ImpExp.LojaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_return then
    btn_procurar.onclick(sender);
end;

procedure TFrm_Cons_ImpExp.DBGridControle1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if (state=[gdSelected]) and (DbGridControle1.focused) then
        DbGridControle1.Canvas.Font.color:=clWhite
     else
     begin
       if (query1.fieldbyname('Erro').AsString='Com Erro') then
          DbGridControle1.Canvas.Font.color:=clRed
       else DbGridControle1.Canvas.Font.color:=clBlue;
     end;
     DbGridControle1.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure TFrm_Cons_ImpExp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then close;
  if (shift = [ssCtrl]) and (key = 68) then Data1.SetFocus;
end;

procedure TFrm_Cons_ImpExp.botao_sairClick(Sender: TObject);
begin
   close;
end;

end.

