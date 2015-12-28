unit DbEditControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,extctrls,{DsgnIntf,}dbtables,pesquisa,Buttons,TipoDef,Db,DbTabela;

type

  TTipoEdit = (tpCaracter,tpNumero,tpData,tpDecimal);

  TDbEditControle = class(TEdit)
  private
    { Private declarations }
    FButtonAjuda : TBitBtn;
    FNextPos : TWinControl;
    FPosicao : Word;
    FObrigatorio : Boolean;
    FPesquisa : TPesquisa;
    FGeraPesquisa : Boolean;
    FAlignment : TAlignment;
    FObjGrava : TWinControl;
    FObjAltera : TWinControl;
    FEncontrou : Boolean;
    FTipo   : TTipoEdit;
    FMascara : String;

    {Campos relacionados a integracao com a tabela do banco de dados}
    
    FCampoTabela   :String;
    FTipoTab       : TTipoCampo;
    FChave         : Boolean;
    FTabela        : TDbTabela;
    FAtivado       : Boolean;

    {Campos relacionados a integracao com a tabela do banco de dados}

    Procedure SetAlignment(Value : TAlignment);
    Procedure AddParams(Var Value : TQuery ;ValueToAssign : String;Posicao: Word);
  protected
    { Protected declarations }
    Procedure CreateParams(Var Params : TCreateParams ); override;
  public
    { Public declarations }
    FDoExit : Boolean;    
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    procedure CreateWnd; override;
  published
    { Published declarations }
    procedure DoExit; override;
    procedure DoEnter; override;
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    procedure KeyPress(var Key: Char); override;
    property ButtonAjuda : TBitBtn read FButtonAjuda write FButtonAjuda;
    property Obrigatorio : Boolean read FObrigatorio write FObrigatorio;
    property Posicao : Word read FPosicao write FPosicao;
    property GeraPesquisa : Boolean Read FGeraPesquisa Write FGeraPesquisa default False;
    Property Pesquisa  : TPesquisa Read FPesquisa Write FPesquisa;
    Property NextPos : TWinControl Read FNextPos Write FNextPos;
    Property ObjGrava : TWinControl read FObjGrava write FObjGrava;
    Property ObjAltera : TWinControl read FObjAltera write FObjAltera;
    Property Encontrou : Boolean Read FEncontrou write FEncontrou;
    Property Tipo  : TTipoEdit read FTipo write FTipo default tpCaracter;
    Property Mascara : String read FMascara write FMascara;
    property  Alignment   : TAlignment read FAlignment write SetAlignment default taLeftJustify;

    Property CampoTabela   : String     read FCampoTabela write FCampoTabela ;
    Property TipoTab       : TTipoCampo read FTipoTab     write FTipoTab     ;
    Property Chave         : Boolean    read FChave       write FChave       ;
    Property Tabela        : TDbTabela  read FTabela      write FTabela      ;

  end;

procedure Register;

implementation

constructor TDbEditControle.Create(AOwner: TComponent);
Var nHandle : TComponent;
begin
  nHandle := inherited Create(AOwner);
  FAtivado := False;
//  FTabela := TDbTabela.Create(Self);

//  If FGeraPesquisa Then
//     FPesquisa  := TPesquisa.Create(nHandle);

  FDoExit := True;

//   If FTabela <> nil then
//   FTabela.Adiciona(FCampoTabela,FTipoTab,Self,FChave);

end;

procedure TDbEditControle.CreateWnd;
Begin
    inherited CreateWnd;

     If Not FAtivado Then
     If FTabela <> nil then Begin
          FTabela.Ativa;
          FTabela.Adiciona(FCampoTabela,FTipoTab,Self,FChave);
          Fativado := True;
     End;
End;

destructor TDbEditControle.Destroy;
Begin
//   FTabela.Destroy;
//   If FGeraPesquisa Then
//       FPesquisa.Destroy;
   inherited Destroy;
End;

procedure TDbEditControle.DoExit;
Var Pesquisa : TQuery;
    Loop : Word;
    Texto : String;
begin
   If FDoExit And (TForm(Owner).ActiveControl.TabOrder <= TabOrder) Then
    begin
       inherited DoExit;
       Exit;
    end;

   If FButtonAjuda <> Nil Then

   If FButtonAjuda.Focused Then Exit;

   If FObrigatorio And (Text = '') Then Begin
       Application.MessageBox(PChar('Dado Obrigatório'), PChar(Application.Title), mb_Ok + mb_IconInformation);
       SetFocus;
       Exit;
   End;

   If FTipo in [tpNumero,tpDecimal] Then Begin

         If (Text = '') And (FTipo = tpDecimal) Then Text := '0';
         Texto := Text;
         While Pos(ThousandSeparator,Texto) > 0 Do Delete(Texto,Pos(ThousandSeparator,Texto),1);
         If Text <> '' Then
             Text := FormatFloat(FMascara,StrToCurr(Texto));
   End;


   If GeraPesquisa And (FPesquisa.DataBase.DataBaseName <> '') Then Begin
        If Text <> '' Then Begin
              Pesquisa := TQuery.Create(Application);
              Pesquisa.DataBaseName := FPesquisa.DataBase.DataBaseName;
              Pesquisa.Sql := FPesquisa.Sql;
              For Loop := 0 To Pesquisa.ParamCount - 1 Do Begin
                   If Loop = 0 Then
                       AddParams(Pesquisa,FPesquisa.Filtro1.Text,Loop)
                   Else If Loop = 1 Then
                       AddParams(Pesquisa,FPesquisa.Filtro2.Text,Loop)
                   Else If Loop = 2 Then
                        AddParams(Pesquisa,FPesquisa.Filtro3.Text,Loop)
                   Else If Loop = 3 Then
                       AddParams(Pesquisa,FPesquisa.Filtro4.Text,Loop);
              End;

              Pesquisa.Open;

              If Pesquisa.Eof And (FObrigatorio Or (Text <> ''))Then Begin
                 Application.MessageBox(PChar('Dado não encontrado'), PChar(Application.Title), mb_Ok + mb_IconInformation);
                 SetFocus;
                 Pesquisa.Destroy;
                 Exit;
              End
              Else
                 If FPesquisa.Descricao <> Nil Then
                     FPesquisa.Descricao.Caption := Pesquisa.FieldByName(FPesquisa.Campo).AsString;

              Pesquisa.Destroy;
        End
        Else If FPesquisa.Descricao <> Nil Then  FPesquisa.Descricao.Caption := '';
   End;

   inherited DoExit;
end;

procedure TDbEditControle.DoEnter;
begin
     inherited DoEnter;
end;

Procedure TDbEditControle.KeyDown(var Key:Word;Shift:TShiftSTate);
Begin
     inherited KeyDown(Key,Shift);
    Case Key of
      VK_Return,Vk_Down :If (FNextPos <> Nil) Or (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
                                             if (FObjGrava <> Nil) Or (FObjAltera <> Nil) Then Begin
                                                         If FEncontrou Then
                                                            TWinControl(FObjAltera).SetFocus
                                                         Else
                                                            TWinControl(FObjGrava).SetFocus;
                                                         FDoExit := False;
                                                         DoExit;
                                                         FDoExit := True;
                                                         Exit;
                                                    End;
                                                   TWinControl(FNextPos).SetFocus;
                                                End;
      //Vk_Up : Perform(Wm_NextDlgCtl,1,0);
    End;
End;

//constructor TPesquisa.Create(AOwner: TComponent);
//begin
//  inherited Create(AOwner);
//  FSql   := TStringList.Create;
//  FDataBase := TDataBase.Create(Self);
//end;

//destructor  TPesquisa.Destroy ;
//Begin
//   FSql.Destroy;
//   FDataBase.Destroy;
//  inherited Destroy;
//End;

//Function TEditorTPesquisa.GetAttributes : TPropertyAttributes;
//Begin
//   Result := [paSubProperties,paMultiSelect,paAutoUpDate];
//End;

//Procedure TEditorTPesquisa.Edit;
//Begin
//   Designer.Modified;
//End;

Procedure TDbEditControle.CreateParams(Var Params : TCreateParams );
Const
    Alignmento : Array[TAlignment] of Word = (ES_LEFT,ES_RIGHT,ES_CENTER);
Begin
    inherited;
    Params.Style := Params.Style or Alignmento[FAlignment];
End;

Procedure TDbEditControle.SetAlignment(Value : TAlignment);
Begin
   If FAlignment <> Value Then Begin
       FAlignment := Value;
       RecreateWND;
   End;
End;

procedure TDbEditControle.KeyPress(var Key: Char);
Begin
    If Key = #13 Then Begin
           Key := #0;
           Exit;
    End
    Else Begin
        If (FTipo = tpNumero) And Not (Key in ['0'..'9',DecimalSeparator,#8]) Then
             Key := #0;
    End;

    inherited;
End;

Procedure TDbEditControle.AddParams(Var Value : TQuery ;ValueToAssign : String;Posicao: Word);
Begin
    If FTipo  = tpCaracter Then
        Value.Params[Posicao].AsString := ValueToAssign
    Else If FTipo = tpData Then
        Value.Params[Posicao].AsDateTime := StrToDateTime(ValueToAssign)
    Else If FTipo = tpNumero Then
        Value.Params[Posicao].AsInteger := StrToInt(ValueToAssign);
End;

procedure Register;
begin
  //RegisterPropertyEditor(TypeInfo(TPesquisa),Nil,'Pesquisa',TEditorTPesquisa);
  RegisterComponents('Sistema Db', [TDbEditControle]);
  //RegisterComponents('Sistema', [TPesquisa]);
end;


end.
