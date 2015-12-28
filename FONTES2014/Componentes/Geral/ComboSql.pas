unit ComboSql;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DbTables,Db,TipoDef,FuncoesGlobais,ComCtrls,ConstantesAppl,Variants;

type

  TTipoRetornoCombo = (RCText,RcValorRetorno,RcValores);

  TCampoCombo = Record
   Campo : String;
   VAlor : Variant;
   Tipo  : TTipoCampo;
  end;

  TComboSql = class(TComboBox)
  private
    VarValores   :TStringList;
    ItemAnterior : Integer;
    VetorCAmpoDetal :Array of String;
    VarRetorno      :TTipoRetornoCombo;
    VarBanco        :String;
    VarTabela       :String;
    VarCampo        :String;
    VarCAmpoRetorno :string;
    VarCampoTabela  :String;
    VetorCampo      :Array of Variant;
    FNextPos        :TWinControl;
    VarTipoCampo    :TTipoCampo;
    VArCAmpoDetal   :String;
    VarObrigatorio  :Boolean;
    VarMasterCombo  :TComboSql;
    FIncluiValores: Boolean;
    FValueIni: String;
    FITEMINDEXIni: Integer;
    FEnter: Boolean;
    FDescCampo: String;
    FDistinct: Boolean;
    FOldParentHint,FOldShowHint:Boolean;
    FTextHint:String;
    Procedure       RetornaText;
    Procedure       RetornaMasterCombo(Value :TComboSql);
    Procedure       SetVetorCAmpoDetal(VAlue :String);
    Procedure       SetMasterCombo(Value:TComboSql);
    Procedure       SetValores(Value:TStringList);
    procedure       SetITEMINDEXIni(const Value: Integer);
    procedure       CMExit(var Message: TCMExit); message CM_EXIT;
    { Private declarations }
  protected
    { Protected declarations }
  public
    DesativaTecl    :boolean;
    OldText         :String;
    OldItemindex    :Integer;
    OldValue        :Variant;
    VetorChaves     :Array of TCampoCombo;
    DetalCombo      :TComboSql;
    IndiceIni       : Integer;
    OldFocus        : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure DoEnter;override;
    procedure DoExit;override;
    Procedure IncluiChaves(Campo:String;VAlor:VAriant;Tipo:TTipoCAmpo);
    Procedure ExcluiChaves(Campo:String);
    Procedure ValorChave(VAlor:VAriant);
    Function  ValorRetorno : Variant;
    Function  FoiAlterado:Boolean;
    Procedure Change;Override;
    Property  ValueIni : String read FValueIni write FValueIni;
    Property  ITEMINDEXIni : Integer read FITEMINDEXIni write SetITEMINDEXIni;
    { Public declarations }
  published
    Procedure KeyDown(var Key:Word;Shift:TShiftSTate); override;
    Property  BancodeDados   : String Read VarBanco  Write VarBanco;
    Property  NextPos : TWinControl Read FNextPos Write FNextPos;
    Property  Tabela         : String Read VarTabela Write VarTabela;
    Property  CampoItens     : String Read VarCampo  Write VarCampo;
    Property  Obrigatorio    : Boolean Read VarObrigatorio  Write VarObrigatorio Default False;
    Property  CampoRetorno   : String Read VarCampoRetorno  Write VarCampoRetorno;
    Property  TipoCampo      : TTipoCampo Read VarTipoCAmpo Write VarTipoCAmpo;
    Property  Retorno        : TTipoRetornoCombo Read VarRetorno Write VarRetorno;
    Property  MasterCombo    : TComboSql Read VarMasterCombo Write SetMasterCombo;
    Property  CAmpoDetalhe   : String    Read VarCampoDetal   Write SetVetorCAmpoDetal;
    Property  Valores        : TStringList Read VarVAlores Write SetValores;
    Property  IncluiValores  : Boolean Read FIncluiValores Write FIncluiValores;
    property Enter : Boolean Read FEnter Write FEnter default False;
    property Distinct : Boolean Read FDistinct Write FDistinct default False;
    Property DescCampo : String read FDescCampo write FDescCampo;
   { Published declarations }
  end;

procedure Register;

implementation


{ TComboSql }

destructor TComboSql.Destroy;
begin
  if varvalores <> nil then
   varvalores.destroy;

  inherited Destroy;
end;

procedure TComboSql.DoEnter;
var
Pesquisa    :Tquery;
I,I2        :Integer;
ObjetoLocal :Tcombosql;
IndexOld    :Variant;
begin
  
   FOldShowHint   := ShowHint;
   FOldParentHint := ParentShowHint;
   FTextHint      := Hint;

   ShowHint       := True;
   ParentShowHint := False;

   OldItemIndex := Itemindex;
   OldValue     := ValorRetorno;
   OldText      := Text;


   If ShowHint and (ConstantesAppl.StatusPanelHintAppl <> Nil) Then
     StatusPanelHintAppl.Text := Hint;

   if (VarCAmpoRetorno = '') or (vartabela = '') then Begin
      inherited DoEnter;
      exit;
   end;

   IndexOld := Unassigned;
   itemanterior := itemindex;
//   If (ItemIndex <> -1) and (Length(VetorCampo) > 0)   then
   //  IndexOld := VetorCampo[ItemIndex];
   IndexOld := ValorRetorno;

   if VarMAsterCombo <> nil then
     begin
       I := 0;
       ObjetoLocal := VarMasterCombo;
       While (ObjetoLocal <> nil) and (I <> Length(VetorCampoDetal)) do begin


          if objetolocal.itemindex = -1 then begin
            inherited DoEnter;
            exit;
          end;

          for i2:=0 to Length(VetorChaves) - 1 do
            If UpperCase(VetorChaves[i2].Campo) = UpperCase(VetorCampoDetal[i]) then begin
               If ObjetoLocal.ValorRetorno <> VetorChaves[i2].Valor then
                 VarClear(IndexOld);
               Break;
            end;



          IncluiChaves(VetorCampoDetal[i],ObjetoLocal.VAlorRetorno,ObjetoLocal.TipoCampo);
          inc(i);
          ObjetoLocal := ObjetoLocal.MasterCombo;
       end;

       retornatext;
       ItemIndex := -1;
       Text      := '';
       if vartype(IndexOld) <> $0000 then
        for i:=0 to Length(vetorcampo) - 1 do
          If VetorCampo[i] = IndexOld then begin
             ItemIndex := i;
             break;
          end;

//       itemindex := itemanterior;
       inherited DoEnter;
       Exit;
     end;

   Pesquisa := Tquery.create(application);
   pesquisa.databasename := VarBanco;

   with pesquisa do begin
         sql.clear;
         sql.add('Select  '+IIfs(FDistinct,'Distinct ','')+VarCampoRetorno+','+VarCampo);
         sql.add('From  '+VarTabela);
         If Length(VetorChaves) > 0 then
            For i:= 0 to Length(VetorChaves) - 1 do begin
              Sql.add(IIfs(I > 0,' And ',' Where '));
              sql.add(VetorChaves[I].Campo+' =:Parametro'+IntToStr(ParamCount));
              CarregaParametro(VetorChaves[I].Valor,tipocampotovariant(VetorChaves[I].Tipo),Params[ParamCount - 1]);
            end;

         sql.add('Order By 2');
         open;

         If Not FIncluiValores then begin
             Items.Clear;
             SetLength(VetorCampo,RecordCount);
             i := 0;
         end else begin
             While Items.Count > Valores.Count do
              Items.Delete(Items.Count - 1);
             SetLength(VetorCampo,RecordCount + Valores.Count);
             For i:=0 to Valores.Count - 1 do
               vetorcampo[i] := VarAsType(Valores[I],tipocampotovariant(VarTipoCAmpo));
             i := Valores.Count;
         end;


         first;
         while not eof do begin
            if Fields[0].DataType = FtString then
              vetorcampo[i] := Fields[0].AsString
            else if Fields[0].DataType = FtInteger then
              vetorcampo[i] := Fields[0].AsInteger;


            Items.add(Fields[1].AsString);

            inc(i);
            pesquisa.next;
         end;
        free;
   end;


   if vartype(IndexOld) <> $0000 then begin
         If FincluiValores and (Valores.IndexOf(VarToStr(IndexOld)) > -1) then
           ItemIndex := Valores.IndexOf(VarToStr(IndexOld))
         else iF Length(vetorcampo) > 0 THEN begin
              for i:=0 to Length(vetorcampo) - 1 do
                If VetorCampo[i] = IndexOld then begin
                   ItemIndex := i;
                   break;
              end;
         end;
   end;

   inherited DoEnter;
end;

constructor TComboSql.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   VarValores := TStringList.Create;
   VarTipoCampo  := VarString;
   FITEMINDEXIni := -1; 
   OldFocus := False;
   DesativaTecl := False;
end;


function TComboSql.ValorRetorno: Variant;
begin
    If (VarRetorno = RcValorRetorno)  then begin
     if  (ItemIndex > -1) and (Length(VetorCampo) > 0)  then
       result := VetorCampo[ItemIndex]
     else begin
       If (VarTipoCampo = VarString) or (VarTipoCampo = VarMemo) then
        result := ''
       else if (VarTipoCampo in [VarDate,VarCurrency,VarDouble,VarInteger]) then
        result := 0
       else if (VarTipoCampo = varBoolean) then
        result := False;

     end;
     exit;
   end;


   If (VarRetorno = RcValores) and (ItemIndex > -1) then begin
      result :=   varvalores.strings[itemindex];
      exit;
   end;







   result := Text;
//   Change;
end;

procedure Register;
begin
  RegisterComponents('Sistema',[TComboSql]);
end;
procedure TComboSql.KeyDown(var Key: Word; Shift: TShiftSTate);
var
FList : TList;
FWinControl,Fparent,Fparent2 : TWinControl;
FPageControl : TPageControl;
FIndPage,I   : Integer;
F:Boolean;
FForm:TCustomForm;
begin

   if ((key = Vk_Return) or ((Key in [Vk_Right,Vk_Left]) and (Style = csDropDownList))) and Not DroppedDown then begin
     FParent2 := Self.Parent;

     while (fparent2 <> Nil) and Not(FParent2 is TCustomForm) do begin
        fform    := TCustomForm(FParent2.Owner);
        FParent2 := FParent2.Parent;
     end;

     if (FParent2 is TCustomForm) then
       FForm := TCustomForm(Fparent2)
     else if fparent2 <> Nil then
       FForm := TCustomForm(Fparent2.Owner)
     else
       FForm := TCustomForm(Self.Owner);
   end;

   If not DesativaTecl Then begin
      If Not DroppedDown and (Key = Vk_Right) and (Style = csDropDownList) Then begin
       Fform.perform(Wm_NextDlgCtl,0,0);
       Key := 0;
      end;

      If Not DroppedDown and (((Key = Vk_Left) and (Style = csDropDownList)) or
                             ((Key = Vk_UP)  and (Style = csDropDown))) Then begin
       FForm.perform(Wm_NextDlgCtl,-1,0);
       key := 0;
      end;
   end;

   if (key in [VK_Back,Vk_Delete]) and (Style = csDropDownList) then begin
        itemindex := -1;
        If Assigned(OnChange) then
          OnChange(Self);
   end;

   if (key in [VK_Return]) and Not DroppedDown then
    if FNextPos <> nil then begin
        If (FNextPos is TPageControl) then begin
             FWinControl := SelectNextFocus(FNextPos,1,FNextPos);
             If (FwinControl <> Nil) and (FWincontrol <> Self) then begin
                 FWinControl.SetFocus;
                 Exit;
             end;
        end;
        TWinControl(FNextPos).SetFocus;
    end else if fenter and (Owner is TcustomForm)  then begin
             F := False;
             FParent := Parent;
             While (FParent <> Nil) and (FParent <> FForm) and Not(FParent is TTabSheet) do
              FParent := FParent.Parent;




             If (FParent is TTabSheet)  then begin
               FList := TList.Create;
               FParent.GetTabOrderList(FList);
               I := Flist.Count;

               if Flist.IndexOf(Self) + 1 <= Flist.Count - 1 then
                  for i:=Flist.IndexOf(Self) + 1 to Flist.Count - 1 do
                       If  (TWinControl(FList[I]).CanFocus)
                       and (TWinControl(FList[I]).TabStop)
                       and (TWinControl(FList[I]).DockClientCount = 0)  then
                         Break;


               If I = Flist.Count then begin
                  FPageControl := TPageControl(FParent.Parent);
                  FindPage     := IIFS(TPageControl(FParent.Parent).ActivePageIndex = TPageControl(FParent.Parent).PageCount - 1
                                  ,0,TPageControl(FParent.Parent).ActivePageIndex + 1);

                  while (FPageControl.pages[findpage].ControlCount = 0)
                        or Not FPageControl.pages[findpage].Enabled
                        or Not FPageControl.pages[findpage].TabVisible do begin
                    If (FIndPage = Ttabsheet(FParent).PageIndex) then
                      break;
                    FIndPage := FindPage + 1;
                  end;

                  If (FIndPage <> Ttabsheet(FParent).PageIndex) then begin
                      FPageControl.Pages[FIndPage].GetTabOrderList(FList);
                      for i:=0 to Flist.Count - 1 do
                           If  (TWinControl(FList[I]).CanFocus)
                           and (TWinControl(FList[I]).TabStop)
                           and (TWinControl(FList[I]).DockClientCount = 0)  then begin
                              FPageControl.ActivePageIndex := findpage;
                              f := true;
                              Break;
                           end;
                  end;

               end;
               Flist.Destroy;
             end;
             
             If Not F then begin
                 FWinControl := SelectNextFocus(Self,1,FForm);
                 If (FWinControl is TPageControl) then begin
                     While (FWincontrol is TPageControl) do
                       FWinControl := SelectNextFocus(FWincontrol,1,Fform);

                     If (FWinControl <> Self) and (FWinControl <> Nil) then begin
                         HabilitaTabSheets(FWinControl,FForm);
                         FWinControl.SetFocus;
                     end;  
                 end else
                   Fform.perform(Wm_NextDlgCtl,0,0);
             end;
    end;

    inherited KeyDown(Key,Shift);
end;





procedure TComboSql.RetornaText;
var
Pesquisa   : Tquery;
i : Word;
begin
    If (VarRetorno <> RcValorRetorno)  then
     exit;


   Pesquisa := Tquery.create(application);
   pesquisa.databasename := VarBanco;
   with pesquisa do begin
         sql.clear;
         sql.add('Select '+IIfs(FDistinct,'Distinct ','')+VarCampoRetorno+','+VarCampo);
         sql.add('From  '+VarTabela);
         for i:=0 to Length(VetorChaves) - 1 do begin
              If i = 0 then
              sql.add('Where   ')
             else
              sql.add('And   ');

            If (VetorChaves[i].Tipo = VarInteger) and
               (VarType(VetorChaves[i].Valor) = $0100) and
               (VetorChaves[i].Valor = '')        then
             begin
               Sql.add(VetorChaves[i].Campo+' is null');
               continue;
             end;


            Sql.add(VetorChaves[i].Campo+'  = :Parametro'+IntToStr(I));
            if VetorChaves[i].Tipo = VarString then
               ParamByName('Parametro'+IntToStr(I)).AsString := VetorChaves[i].Valor
            else if VetorChaves[i].Tipo = VarInteger then
              ParamByName('Parametro'+IntToStr(I)).AsInteger := StrtoInt(VetorChaves[i].Valor);
           end;

         sql.add('Order By 2');
         open;
         If Not FIncluiValores then begin
             Items.Clear;
             SetLength(VetorCampo,RecordCount);
             i := 0;
         end else begin
             While Items.Count > Valores.Count do
              Items.Delete(Items.Count - 1);
             SetLength(VetorCampo,RecordCount + Valores.Count);
             For i:=0 to Valores.Count - 1 do
               vetorcampo[i] := VarAsType(Valores[I],tipocampotovariant(VarTipoCAmpo));
             ItemIndex :=  Valores.IndexOf(VarToStr(VetorChaves[Length(VetorChaves) - 1].Valor));
             If itemindex > -1 then begin
               Pesquisa.Free;
               Exit;
             end;
             i := Valores.Count;
         end;

         first;

         if eof then
          exit;

         while not eof do begin
            if Fields[0].DataType = FtString then
              vetorcampo[i] := Fields[0].AsString
            else if Fields[0].DataType = FtInteger then
              vetorcampo[i] := Fields[0].AsInteger;

            Items.add(Fields[1].AsString);
            inc(i);
            pesquisa.next;
         end;



        free;
   end;

   If FIncluivalores then
    ItemIndex := Valores.Count
   else
    ItemIndex := 0;
end;


procedure TComboSql.IncluiChaves(Campo: String; VAlor: VAriant;
  Tipo: TTipoCampo);
var
i: integer;
begin
    for i:=0 to Length(VetorChaves) - 1 do begin
       if Uppercase(VetorChaves[i].Campo) = Uppercase(Campo) then begin
         VetorChaves[i].Valor := Valor;
         VetorChaves[i].Tipo  := Tipo;
         exit;
       end;
    end;

       setlength(VetorChaves,Length(VetorChaves) + 1);
       VetorChaves[Length(VetorChaves) - 1].Campo := Campo;
       VetorChaves[Length(VetorChaves) - 1].Valor := Valor;
       VetorChaves[Length(VetorChaves) - 1].Tipo  := Tipo;
end;



procedure TComboSql.RetornaMasterCombo(Value: TComboSql);
begin
end;

procedure TComboSql.SetVetorCAmpoDetal(VAlue: String);
var
i,i2,qtdecaracter : word;
palavra           : string;
begin
  VarCampoDetal := Value;

  QtdeCaracter := 0;
  SetLength(VetorCampoDetal,0);
  if value = '' then 
    exit;

    
  for i:=1  to Length(Value)  do begin
    if Copy(Value,i,1) = ';' then begin
      SetLength(VetorCampoDetal,Length(VetorCampoDetal) + 1);
      VetorCampoDetal[Length(VetorCampoDetal) - 1] := palavra;
      Palavra := '';
    end
   else
      palavra := palavra + Copy(Value,i,1);
  end;

   SetLength(VetorCampoDetal,Length(VetorCampoDetal) + 1);
   VetorCampoDetal[Length(VetorCampoDetal) - 1] := palavra;
end;

procedure TComboSql.ValorChave(VAlor: VAriant);
var
i,I2 : integer;
objetolocal :TComboSql;
begin
       I := 0;
       objetolocal := VarMasterCombo;
       while objetolocal <> nil do begin
           If ObjetoLocal.ItemIndex < 0 then
            exit;

           IncluiChaves(VetorCampoDetal[i],ObjetoLocal.VAlorRetorno,ObjetoLocal.TipoCampo);
           inc(i);
           ObjetoLocal := ObjetoLocal.MasterCombo;
       end;

        Itemindex := -1;

{        If (VarRetorno = RcValores) or (FIncluiValores) then
         begin
            for i2:=0 to VarValores.Count - 1 do
              if Valor = varvalores.strings[i2] then begin
                itemindex := i2;
                Break;
              end;
              If (VarRetorno = RcValores) then
                 exit
              else If (I2 <> VarValores.Count)  then begin
                 SetLength(vetorcampo,1);
                 vetorcampo[0] := VarAsType(varvalores.strings[itemindex],tipocampotovariant(VarTipoCAmpo));
              end;
         end;}

        If (VarRetorno = RcText) then begin
           ItemIndex := Items.IndexOf(VarToStr(Valor));
           exit;
        end;

        If (VarRetorno = RcValores) then
         begin
            for i2:=0 to VarValores.Count - 1 do
              if Valor = varvalores.strings[i2] then begin
                itemindex := i2;
                Break;
              end;
             If I2 > VarValores.Count - 1 then 
                itemindex := -1;
             exit;
         end;

        setlength(VetorChaves,Length(VetorChaves) + 1);
        VetorChaves[Length(VetorChaves) - 1].Campo := VarCAmpoRetorno;
        VetorChaves[Length(VetorChaves) - 1].Valor := Valor;
        VetorChaves[Length(VetorChaves) - 1].Tipo  := VArTipoCAmpo;
        RetornaText;
        inc(i);                                       
        SetLength(VetorChaves,Length(VetorChaves) - i);
end;

procedure TComboSql.SetMasterCombo(Value: TComboSql);
begin
     VarMasterCombo   := Value;
     if value = nil  then
      exit;
     Value.DetalCombo := Self;
end;


procedure TComboSql.DoExit;
var
objetolocal :TComboSql;
begin
   Try
      objetolocal := DetalCombo;
      If  (Itemindex = -1) or (ItemAnterior <> Itemindex) then begin
            while objetolocal <> nil do begin
              TComboSql(ObjetoLocal).Items.Clear;
              ObjetoLocal := ObjetoLocal.DetalCombo;
            end;
      end;

      If (Itemindex = -1) and (VarRetorno = RcValorRetorno) and (Text <> '') and (Style = CsDropDownList) then
       begin
        SetFocus;
        Raise Exception.Create('Dado não Cadastrado');
        exit;
       end;

       If (VarObrigatorio) and (Text = '') then
        begin
         MessageDlg('Dado Obrigatório',MtCustom,[MbOk],0);
         SetFocus;
         SysUtils.Abort;
       end;

       inherited DoExit;
   finally
        OldFocus       := False;
        ShowHint       := FOldShowHint;
        ParentShowHint := FOldParentHint;
        Hint           := FTextHint;
        If (StatusPanelHintAppl <> Nil) and (Application <> Nil) Then
         StatusPanelHintAppl.Text := Application.Hint;
   end;
end;

procedure TComboSql.SetValores(Value: TStringList);
begin
    varvalores.Assign(Value);
end;

function TComboSql.FoiAlterado: Boolean;
begin
 if VarRetorno = RcText then BEGIN
     If Style = CsDropDown Then
        Result := OldText <> Text
     else
        Result := OldItemIndex <> Itemindex
 end else begin
     If VarType(OldVAlue) = VarType(ValorRetorno) then
       Result := OldValue    <> ValorRetorno
     else
       Result := True;
 end;
end;


procedure TComboSql.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);

{  If IndiceIni = -1 then
    Indiceini := ItemIndex;

  If ValueIni = '' then
    Valueini := Text;}
end;


procedure TComboSql.SetITEMINDEXIni(const Value: Integer);
begin
  FITEMINDEXIni := Value;
  If ItemIndex = -1 then
   ItemIndex := Value;
end;


procedure TComboSql.CMExit(var Message: TCMExit);
begin
   OldFocus := True;
   inherited;
end;

procedure TComboSql.ExcluiChaves(Campo: String);
var i,i2:word;
begin
   If Length(VetorChaves) = 0 then
    exit;

   for i:=0 to Length(VetorChaves) - 1 do
    If UpperCase(VetorChaves[i].Campo) = UpperCase(Campo) then
      break;

  If I > Length(VetorChaves) then
    exit;

  If Length(VetorChaves)  > 1 then
    For i2:=I to Length(VetorChaves) - 2 do
     VetorChaves[i] := VetorChaves[i + 1];

  SetLength(VetorChaves,Length(VetorChaves) - 1);
end;


procedure TComboSql.Change;
begin
   inherited Change;
   Hint := Text;
   If StatusPanelHintAppl <> Nil Then
    StatusPanelHintAppl.Text := Hint;
end;



end.
