unit MemoControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls,MemoLocaliza,funcoesglobais,menus,forms,dialogs;

type
  TMemoControle = class(TMemo)
  private
   NewPop:TPopupMenu;
   fmemolocaliza:TFrm_memolocaliza;
   FNHotKey: Boolean;
    { Private declarations }
  protected
   Function  GetPopupMenu:TPopupMenu;Override;
   Procedure FPopupCliCk(Sender:TObject);
    { Protected declarations }
  public
    Procedure Localiza(VVis:Boolean=True);
    Procedure Trocar(VVis:Boolean=True);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AbreArquivo;
    procedure SalvaArquivo;
    procedure BlocoNotas;

    { Public declarations }
  published
    Property NHotKey:Boolean read FNHotKey Write FNHotKey;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Sistema', [TMemoControle]);
end;

{ TMemoControle }

procedure TMemoControle.AbreArquivo;
begin
  with TOpenDialog.create(Self) do
   try
    Filter      := 'Arquivo Texto(*.Txt)|*.Txt';
    DefaultExt  := '*.Txt';
    If Execute then
     Lines.LoadFromFile(FileName);
   finally
    destroy;
   end;
end;

procedure TMemoControle.BlocoNotas;
begin
//
end;

procedure TMemoControle.FPopupCliCk(Sender: TObject);
var
FKeyDown:TKeyEvent;
fkey:word;
begin


    Try
    finally
       keybd_event(VK_down, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
       keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;


   If Pos('BLOCO',ValidaCharacteres(['A'..'Z'],UpperCase(TMenuItem(Sender).Caption),true)) > 0 then
    BlocoNotas
   else If Pos('ABRIR',ValidaCharacteres(['A'..'Z'],UpperCase(TMenuItem(Sender).Caption),true)) > 0 then
    AbreArquivo
   else If Pos('SALVAR',ValidaCharacteres(['A'..'Z'],UpperCase(TMenuItem(Sender).Caption),true)) > 0 then
    SalvaArquivo
   else If Pos('Localiza',TMenuItem(Sender).Caption) > 0 then
    Localiza
   else If Pos('Substituir',TMenuItem(Sender).Caption) > 0 then
    Trocar
   else If Pos('Ctrl + T',TMenuItem(Sender).Caption) > 0 then
    SelectAll
   else If Pos('Apaga Tudo',ValidaCharacteres(['&'],TMenuItem(Sender).Caption,False)) > 0 then
    Clear
   else begin
     FKeyDown := TForm(Owner).OnKeyDown;
     TForm(Owner).OnKeyDown := Nil;
     try
       keybd_event(VK_CONTROL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
       try
          If Pos('Copia',TMenuItem(Sender).Caption) > 0 then
            FKey := 67
          else If Pos('Ctrl + V',TMenuItem(Sender).Caption) > 0 then
            FKey := 86
          else If Pos('Recorta',TMenuItem(Sender).Caption) > 0 then
            FKey := 88
          else If Pos('Desfaz',TMenuItem(Sender).Caption) > 0 then
            FKey := 90;

           keybd_event(Fkey, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
           keybd_event(Fkey, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
       finally
         keybd_event(VK_CONTROL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
       end;
     finally
       TForm(Owner).OnKeyDown := FKeyDown;
     end;
   end;
end;

function TMemoControle.GetPopupMenu: TPopupMenu;
var
i:integer;
FpopupMenu:TpopupMenu;
begin
   if NewPop = Nil Then
    NewPop := TPopupMenu.Create(Self);
//   inherited GetPopupMenu;

   NewPop.Items.Clear;
   With NewPop do begin
     FpopupMenu := PopMenuParent(Self,True);
     if Fpopupmenu <> Nil Then begin
       For i:=0 to FPopupMenu.Items.Count - 1 do begin
         Items.Add(TMenuItem.Create(NewPop));
         Items[Items.Count - 1].Caption := FPopupMenu.Items[i].Caption;
         Items[Items.Count - 1].OnClick := FPopupMenu.Items[i].OnClick;
       end;
       Items.Add(TMenuItem.Create(NewPop));
       Items[Items.Count - 1].Caption := '-';
     end;  
     
     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Localiza<Ctrl + F>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Substituir<Ctrl + H>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := '-';

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Copia<Ctrl + C>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Cola<Ctrl + V>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Recorta<Ctrl + X>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := '-';

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Selecionar Tudo<Ctrl + T>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Apaga Tudo';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Desfazer<Ctrl + Z>';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := '-';

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Abrir Arquivo';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Salvar Arquivo';
     Items[Items.Count - 1].OnClick := Fpopupclick;

     Items.Add(TMenuItem.Create(NewPop));
     Items[Items.Count - 1].Caption := 'Bloco Notas';
     Items[Items.Count - 1].OnClick := Fpopupclick;

   end;
   Result := NewPop;
end;

procedure TMemoControle.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if not fnhotkey then begin
    if (key = vk_f3) and (fmemolocaliza <> Nil) then
     Localiza(False);

    if (key = vk_f4) and (fmemolocaliza <> Nil) then
     Trocar(False);

    If (ssctrl in Shift) Then
     if key = 70 Then
      Localiza
     else if key = 85 then
      trocar
     else if key = 84 then
      selectall;

//   if shift = [ssctrl] then
  end;


  inherited KeyDown(Key,Shift);

end;

procedure TMemoControle.Localiza(VVis:Boolean=True);
begin
   if fmemolocaliza = Nil Then
    fmemolocaliza := Tfrm_memolocaliza.create(Self);
   With fmemolocaliza do begin
     Panel2.Visible := False;
     BitBtnControle2.visible := false;
     BitBtnControle1.visible := false;
     ActiveControl := Palavra;
     Palavra.selectAll;
     if VVis and (showmodal <> mrok) then
      exit;

     if Pos(UpperCase(Palavra.text),UpperCase(Copy(Text,SelStart + SelLength + 1,Length(Text)))) = 0 Then
      exit;

     SelStart  := SelStart + SelLength + Pos(UpperCase(Palavra.text),UpperCase(Copy(Text,SelStart + SelLength + 1,Length(Text)))) - 1;
     SelLength := Length(Palavra.Text);
   end;
end;

procedure TMemoControle.SalvaArquivo;
begin
  with TSaveDialog.create(Self) do
   try
    Filter      := 'Arquivo Texto(*.Txt)|*.Txt';
    DefaultExt  := '*.Txt';
    If Execute then begin
       If FileExists(FileName) Then
         DeleteFile(FileName);
       Lines.SavetoFile(FileName);
    end;
   finally
    destroy;
   end;
end;

procedure TMemoControle.Trocar(VVis:Boolean=True);
var
i:integer;
Ftexto:string;
oldpos,vl,oldl,olds:integer;
f:word;
begin
   if fmemolocaliza = Nil Then
    fmemolocaliza := Tfrm_memolocaliza.create(Self);
   With fmemolocaliza do begin
     Panel2.Visible := True;
     BitBtnControle2.visible := True;
     BitBtnControle1.visible := True;
     ActiveControl := Palavra;
     Palavra.selectAll;
     if VVis and (showmodal <> mrok) then
      exit;

     Vl := IIfs(SelLength = 0,Length(Text),SelLength);
     Ftexto := Copy(Text,SelStart,VL);

     if Pos(UpperCase(Palavra.text),UpperCase(Ftexto)) = 0 Then
      exit;

     oldl := SelLength;
     olds := SelStart;

     if FRet = 1 Then
      FTexto := TrocaUnPalavra(FTexto,Palavra.Text,PalavraSubst.Text)
     else if FRet = 0 Then
      FTexto := TrocaPalavra(FTexto,Palavra.text,PalavraSubst.text)
     else if fret = 2 then begin
       i := 0;
       
       While Pos(UpperCase(Palavra.Text),UppercAse(Copy(Ftexto,round(iifs(I = 0,1,I + length(PalavraSubst.Text))),Length(Ftexto)))) > 0 do begin
          MensTodos('Deseja Substiur '+Palavra.text+' Por '+PalavraSubst.text,F);
          oldpos := iifs(I = 0,0,I + length(PalavraSubst.Text) - 1) + Pos(UpperCase(Palavra.Text),UppercAse(Copy(Ftexto,round(iifs(I = 0,1,I + length(PalavraSubst.Text))),Length(Ftexto))));
          if F = idYes then
            Ftexto := TrocaUnPalavra(Ftexto,Palavra.text,PalavraSubst.text,iifs(I = 0,0,I + length(Palavra.text)))
          else if F = mrall then
            Ftexto := TrocaPalavra(Ftexto,Palavra.text,PalavraSubst.text,iifs(I = 0,0,I + length(Palavra.text)));

          Self.SelLength := Length(Palavra.Text);
          Self.SelStart  := OldS + Pos(UpperCase(Palavra.Text),UppercAse(Ftexto));
          Text := copy(text,1,OldS - 1)+Ftexto+iifs(OldL = 0,'',copy(text,OldS + OldL + 1,Length(Text)));
          Self.Refresh;
          I := OldPos;
          if f in [mrall,mrcancel] then
           break;
       end;
       Exit;
     end;
     Text := copy(text,1,OldS - 1)+Ftexto+iifs(OldL = 0,'',copy(text,OldS + OldL + 1,Length(Text)));
   end;
end;

end.
