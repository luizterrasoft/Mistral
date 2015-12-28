unit SetupGraf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CheckControle, RadioGControle, EditControle,
  ComboSql, ComCtrls,QuickRpt, QRPrntr,Printers,FuncoesgLobais,Registry;

type

  TRecImpGraf = Record
    Papel:TQrpaperSize;
    FonteName:String;
    FonteTam:Integer;
    Altura:Double;
    Largura:Double;
    MargemInf:Double;
    MargemSup:Double;
    MargemEsq:Double;
    Margemdir:Double;
    LSup:Boolean;
    LInf:Boolean;
    LDir:Boolean;
    LEsq:Boolean;
  end;


  TFrm_SetupGraf = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label47: TLabel;
    Label46: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Impressora: TComboSql;
    Papel: TComboSql;
    PgIni: TEditControle;
    PgFim: TEditControle;
    Copias: TEditControle;
    RgSelImp: TRadioGControle;
    CkLEsq: TCheckControle;
    Fonte: TComboSql;
    CkLInf: TCheckControle;
    CkLSup: TCheckControle;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TamFont: TEditControle;
    Label8: TLabel;
    MSup: TEditControle;
    Label10: TLabel;
    MInf: TEditControle;
    Label11: TLabel;
    Mesq: TEditControle;
    CkLDir: TCheckControle;
    Label9: TLabel;
    MDir: TEditControle;
    BitBtn3: TBitBtn;
    CkPadrao: TCheckControle;
    Matricial: TCheckControle;
    procedure BitBtn3Click(Sender: TObject);
    procedure ImpressoraExit(Sender: TObject);
  private
    { Private declarations }
  public
   FQrRep:TQuickRep;
    { Public declarations }
  end;

var
  Frm_SetupGraf: TFrm_SetupGraf;
  NewPrinterIndex:Integer;
  ImpMatricial:Boolean=False;
const
  PaperSizeStr : Array[0..27] of String = (
                  'Default',
                  'Letter',
                  'LetterSmall',
                  'Tabloid',
                  'Ledger',
                  'Legal',
                  'Statement',
                  'Executive',
                  'A3',
                  'A4',
                  'A4Small',
                  'A5',
                  'B4',
                  'B5',
                  'Folio',
                  'Quarto',
                  'qr10X14',
                  'qr11X17',
                  'Note',
                  'Env9',
                  'Env10',
                  'Env11',
                  'Env12',
                  'Env14',
                  'CSheet',
                  'DSheet',
                  'ESheet',
                  'Custom');


Function FSetupGraf(Var FQrRep:TQuickRep;Fexit:Boolean=False):Boolean;
Function StrtoPaperSize(FValue:String):TQRPaperSize;
Function PaperSizetoStr(FValue:TQRPaperSize):String;
Function ReadRegImpGraf(Chave:String;var FQrRep:TQuickRep):Boolean;
Function WriteRegImpGraf(Chave:String;FQrRep:TQuickRep):Boolean;


implementation

{$R *.DFM}

Function FSetupGraf(Var FQrRep:TQuickRep;Fexit:Boolean=False):Boolean;
Var
i:iNTEGER;
FrmSetupGraf:TFrm_SetupGraf;
Freg:Tregistry;
begin
         Try
                FrmSetupGraf := TFrm_SetupGraf.Create(Application);
                FrmSetupGraf.Caption := 'Setup de Impressão '+FQrRep.ReportTitle;
                FrmSetupGraf.FQrRep := FQrRep;
                FrmSetupGraf.Impressora.Items.Clear;

                FrmSetupGraf.Impressora.Items.Text := Printer.Printers.Text;
                Freg := TRegistry.create;
                try
                    If FReg.OpenKey('\NativaSoft\Impressao\ImpGraf\',false) and (FrmSetupGraf.Impressora.Items.IndexOf(FReg.ReadString('')) > -1) then begin
                       FrmSetupGraf.Impressora.ItemIndex  := FrmSetupGraf.Impressora.Items.IndexOf(FReg.ReadString(''));
                       Fexit := true;
                    end else
                       FrmSetupGraf.Impressora.ItemIndex   := Printer.PrinterIndex;

                finally
                  freg.closekey;
                  freg.destroy;
                end;

                FrmSetupGraf.Fonte.Items.Text      := Screen.Fonts.Text;
                FrmSetupGraf.Fonte.ItemIndex       := FrmSetupGraf.Fonte.Items.IndexOf(FQrRep.Font.Name);

                for i:=0 to length(PaperSizeStr) - 1 do
                 FrmSetupGraf.Papel.Items.Add(PaperSizeStr[i]);

                If (FrmSetupGraf.Impressora.Text <> '') and (FrmSetupGraf.Impressora.ItemIndex = -1) then
                 FQrRep.PrinterSettings.PrinterIndex :=  0;


                If Not FExit Then begin
                    FrmSetupGraf.Papel.ItemIndex      := FrmSetupGraf.Papel.Items.IndexOf(PaperSizetoStr(FQrRep.Page.PaperSize));
                    FrmSetupGraf.Copias.Text          := FloatToStr(IIfs(FQrRep.PrinterSettings.Copies = 0,1,FQrRep.PrinterSettings.Copies));
                    FrmSetupGraf.MSup.Text            := FloatToStr(FQrRep.Page.TopMargin);
                    FrmSetupGraf.MInf.Text            := FloatToStr(FQrRep.Page.BottomMargin);
                    FrmSetupGraf.MEsq.Text            := FloatToStr(FQrRep.Page.LeftMargin);
                    FrmSetupGraf.MDir.Text            := FloatToStr(FQrRep.Page.RightMargin);

                    FrmSetupGraf.CkLSup.Checked       := FQrRep.Frame.DrawTop;
                    FrmSetupGraf.CkLInf.Checked       := FQrRep.Frame.DrawBottom;
                    FrmSetupGraf.CkLEsq.Checked       := FQrRep.Frame.DrawLeft;
                    FrmSetupGraf.CkLDir.Checked       := FQrRep.Frame.DrawRight;

                    FrmSetupGraf.Fonte.Text           := FQrRep.Font.Name;
                    FrmSetupGraf.TamFont.Text         := FloatToStr(FQrRep.Font.Size);
                end else
                    FrmSetupGraf.Impressora.OnExit(Nil);

                if FQrRep.QrPrinter <> Nil Then
                  FrmSetupGraf.PgFim.Text           := FloatToStr(FQrRep.QrPrinter.Pagecount);

                Result  := FrmSetupGraf.ShowModal  = MrOK;



                If Not Result then
                 exit;

                FQrRep.PrinterSettings.PrinterIndex :=  FrmSetupGraf.Impressora.ItemIndex;
                Printer.PrinterIndex := FQrRep.PrinterSettings.PrinterIndex;
                ImpMatricial                        :=  FrmSetupGraf.Matricial.Checked;
                FQrRep.PrinterSettings.Copies       :=  StrToIntN(FrmSetupGraf.Copias.Text);
                FQrRep.Page.PaperSize               :=  StrtoPaperSize(FrmSetupGraf.Papel.Text);

                FQrRep.Page.TopMargin             := StrToFloatN(FrmSetupGraf.MSup.Text);
                FQrRep.Page.BottomMargin          := StrToFloatN(FrmSetupGraf.MInf.Text);
                FQrRep.Page.LeftMargin            := StrToFloatN(FrmSetupGraf.MEsq.Text);
                FQrRep.Page.RightMargin           := StrToFloatN(FrmSetupGraf.MDir.Text);


                FQrRep.Frame.DrawTop              := FrmSetupGraf.CkLSup.Checked;
                FQrRep.Frame.DrawBottom           := FrmSetupGraf.CkLInf.Checked;
                FQrRep.Frame.DrawLeft             := FrmSetupGraf.CkLEsq.Checked;
                FQrRep.Frame.DrawRight            := FrmSetupGraf.CkLDir.Checked;

                FQrRep.Font.Name                  := FrmSetupGraf.Fonte.Text;
                FQrRep.Font.Size                  := StrToIntN(FrmSetupGraf.TamFont.Text);

                If FrmSetupGraf.RgSelImp.ItemIndex = 0 Then
                 FQrRep.PrinterSettings.FirstPage  := 0
                else begin
                 FQrRep.PrinterSettings.FirstPage  := StrtoIntN(FrmSetupGraf.PgIni.Text);
                 FQrRep.PrinterSettings.LastPage   := StrtoIntN(FrmSetupGraf.PgFim.Text);
                end;
        finally
               FrmSetupGraf.Destroy;
        end;






end;

Function StrtoPaperSize(FValue:String):TQRPaperSize;
begin
     If Fvalue =  'Default' Then
      result := Default
     Else If Fvalue =  'Letter' Then
      result := Letter
     Else If Fvalue =  'LetterSmall' Then
      result := LetterSmall
     Else If Fvalue =  'Tabloid' Then
      result := Tabloid
     Else If Fvalue =  'Ledger' Then
      result := Ledger
     Else If Fvalue =  'Legal' Then
      result := Legal
     Else If Fvalue =  'Statement' Then
      result := Statement
     Else If Fvalue =  'Executive' Then
      result := Executive
     Else If Fvalue =  'A3' Then
      result := A3
     Else If Fvalue =  'A4' Then
      result := A4
     Else If Fvalue =  'A4Small' Then
      result := A4Small
     Else If Fvalue =  'A5' Then
      result := A5
     Else If Fvalue =  'B4' Then
      result := B4
     Else If Fvalue =  'B5' Then
      result := B5
     Else If Fvalue =  'Folio' Then
      result := Folio
     Else If Fvalue =  'Quarto' Then
      result := Quarto
     Else If Fvalue =  'qr10X14' Then
      result := qr10X14
     Else If Fvalue =  'qr11X17' Then
      result := qr11X17
     Else If Fvalue =  'Note' Then
      result := Note
     Else If Fvalue =  'Env9' Then
      result := Env9
     Else If Fvalue =  'Env10' Then
      result := Env10
     Else If Fvalue =  'Env11' Then
      result := Env11
     Else If Fvalue =  'Env12' Then
      result := Env12
     Else If Fvalue =  'Env14' Then
      result := Env14
     Else If Fvalue =  'CSheet' Then
      result := CSheet
     Else If Fvalue =  'DSheet' Then
      result := DSheet
     Else If Fvalue =  'ESheet' Then
      result := ESheet
     Else If Fvalue =  'Custom' Then
      result := Custom;
end;

Function PaperSizetoStr(FValue:TQRPaperSize):String;
begin
     If Fvalue =  Default Then
      result := 'Default'
     Else If Fvalue =  Letter Then
      result := 'Letter'
     Else If Fvalue =  LetterSmall Then
      result := 'LetterSmall'
     Else If Fvalue =  Tabloid Then
      result := 'Tabloid'
     Else If Fvalue =  Ledger Then
      result := 'Ledger'
     Else If Fvalue =  Legal Then
      result := 'Legal'
     Else If Fvalue =  Statement Then
      result := 'Statement'
     Else If Fvalue =  Executive Then
      result := 'Executive'
     Else If Fvalue =  A3 Then
      result := 'A3'
     Else If Fvalue =  A4 Then
      result := 'A4'
     Else If Fvalue =  A4Small Then
      result := 'A4Small'
     Else If Fvalue =  A5 Then
      result := 'A5'
     Else If Fvalue =  B4 Then
      result := 'B4'
     Else If Fvalue =  B5 Then
      result := 'B5'
     Else If Fvalue =  Folio Then
      result := 'Folio'
     Else If Fvalue =  Quarto Then
      result := 'Quarto'
     Else If Fvalue =  qr10X14 Then
      result := 'qr10X14'
     Else If Fvalue =  qr11X17 Then
      result := 'qr11X17'
     Else If Fvalue =  Note Then
      result := 'Note'
     Else If Fvalue =  Env9 Then
      result := 'Env9'
     Else If Fvalue =  Env10 Then
      result := 'Env10'
     Else If Fvalue =  Env11 Then
      result := 'Env11'
     Else If Fvalue =  Env12 Then
      result := 'Env12'
     Else If Fvalue =  Env14 Then
      result := 'Env14'
     Else If Fvalue =  CSheet Then
      result := 'CSheet'
     Else If Fvalue =  DSheet Then
      result := 'DSheet'
     Else If Fvalue =  ESheet Then
      result := 'ESheet'
     Else If Fvalue =  Custom Then
      result := 'Custom';
end;

Function ReadRegImpGraf(Chave:String;var FQrRep:TQuickRep):Boolean;
var SetupImp:TRecImpGraf;
    FReg:TRegistry;
    I : iNTEGER;
begin
   ImpMatricial := False;
   FReg := TRegistry.Create;
   Try
      FReg.RootKey := HKEY_CURRENT_USER;
      Result := False;
      If Not FReg.KeyExists('\NativaSoft\Impressao\ImpGraf\'+Chave+'\')  then
       exit;
       
      FReg.OPenKey('\NativaSoft\Impressao\ImpGraf\'+Chave+'\',False);
      With FQrRep do
        try
          ImpMatricial := FReg.ReadString('Matricial') = 'T'; 
          Font.Name := FReg.ReadString('FonteName');
          FReg.ReadBinaryData('Dados',SetupImp,SizeOf(SetupImp));
          Font.Size       :=  SetupImp.FonteTam;
          Page.PaperSize  :=  SetupImp.Papel;
          Page.Length     :=  SetupImp.Altura;
          Page.Width      :=  SetupImp.Largura;
          Page.TopMargin  :=  SetupImp.MargemSup;
          Page.BottomMargin :=  SetupImp.MargemInf;
          Page.LeftMargin  :=  SetupImp.MargemEsq;
          Page.RightMargin  :=  SetupImp.MargemDir;
          Frame.DrawTop     := SetupImp.LSup;
          Frame.DrawBottom  := SetupImp.Linf;
          Frame.DrawLeft    := SetupImp.LEsq;
          Frame.DrawRight   := SetupImp.LDir;
          result := true;

        except
          //
        end;
   finally
      FReg.CloseKey;
      FReg.Free;
   end;
end;

Function WriteRegImpGraf(Chave:String;FQrRep:TQuickRep):Boolean;
var SetupImp:TRecImpGraf;
    Reg:TRegistry;
    I : iNTEGER;
begin
  Reg := TRegistry.Create;
  Try
      Reg.RootKey := HKEY_CURRENT_USER;
      Result := False;
      If Not Reg.OpenKey('\NativaSoft\Impressao\ImpGraf\'+Chave+'\',True) then
       exit;
       
      With FQrRep do
        try
          Reg.WriteString('FonteName',Font.Name);
          SetupImp.FonteTam  :=  Font.Size;
          SetupImp.Papel   := Page.PaperSize;
          SetupImp.Altura  := Page.Length;
          SetupImp.Largura := Page.Width;
          SetupImp.MargemSup := Page.TopMargin;
          SetupImp.MargemInf := Page.BottomMargin;
          SetupImp.MargemEsq := Page.LeftMargin;
          SetupImp.MargemDir := Page.RightMargin;
          SetupImp.LSup      := Frame.DrawTop;
          SetupImp.Linf      := Frame.DrawBottom ;
          SetupImp.LEsq      := Frame.DrawLeft;
          SetupImp.LDir      := Frame.DrawRight;
          Reg.WriteBinaryData('Dados',SetupImp, SizeOf(SetupImp));
          result := true;
        except
          //
        end;
    finally
      Reg.CloseKey;
      Reg.Destroy;
    end;
end;


procedure TFrm_SetupGraf.BitBtn3Click(Sender: TObject);
var SetupImp:TRecImpGraf;
    Reg:TRegistry;
    I : iNTEGER;
begin
  Reg := TRegistry.Create;
  Try
      Screen.Cursor:= CrHourGlass;
      Reg.RootKey := HKEY_CURRENT_USER;
      try
       if Reg.OpenKey('\NativaSoft\Impressao\ImpGraf\',false) then
          Reg.WriteString('',IIfs(CkPadrao.Checked,UpperCase(Impressora.Text),''));
      except
        //
      end;
      reg.closekey;



      If Not Reg.OpenKey('\NativaSoft\Impressao\ImpGraf\'+Impressora.Text+'\',True) then
       exit;

      With FQrRep do
        try
          Reg.WriteString('FonteName',Fonte.Text);
          Reg.WriteString('Matricial',Iifs(Matricial.Checked,'T','F'));
          SetupImp.FonteTam  :=  StrtoIntN(TamFont.Text);
          SetupImp.Papel     :=  StrtoPaperSize(Papel.Text);
          SetupImp.MargemSup :=  StrtoFLOatN(MSup.Text);
          SetupImp.MargemInf :=  StrtoFLOatN(MInf.Text);
          SetupImp.MargemEsq :=  StrtoFLOatN(MEsq.Text);
          SetupImp.MargemDir :=  StrtoFLOatN(MDir.Text);
          SetupImp.LSup      :=  CkLSup.Checked;
          SetupImp.Linf      :=  CkLInf.Checked;
          SetupImp.LEsq      :=  CkLEsq.Checked;;
          SetupImp.LDir      :=  CkLDir.Checked;
          Reg.WriteBinaryData('Dados',SetupImp, SizeOf(SetupImp));
        except
          //
        end;
  finally
      Reg.CloseKey;
      Reg.Destroy;
      Screen.Cursor:= crDefault;
  end;
end;

procedure TFrm_SetupGraf.ImpressoraExit(Sender: TObject);
var SetupImp:TRecImpGraf;
    Reg:TRegistry;
    I : iNTEGER;
begin
   If Impressora.OldFocus and Not Impressora.FoiAlterado Then
    exit;

   Try
        Reg := TRegistry.Create;
        Reg.RootKey := HKEY_CURRENT_USER;
        if Reg.OpenKey('\NativaSoft\Impressao\ImpGraf\',false) then
          CkPadrao.Checked  := UpperCase(Reg.ReadString('')) = UpperCase(Impressora.Text);
        reg.closekey;

        If Not Reg.OpenKey('\NativaSoft\Impressao\ImpGraf\'+Impressora.Text+'\',False) then begin
            Papel.ItemIndex      := Papel.Items.IndexOf(PaperSizetoStr(FQrRep.Page.PaperSize));
            Copias.Text          := FloatToStr(IIfs(FQrRep.PrinterSettings.Copies = 0,1,FQrRep.PrinterSettings.Copies));
            MSup.Text            := FloatToStr(FQrRep.Page.TopMargin);
            MInf.Text            := FloatToStr(FQrRep.Page.BottomMargin);
            MEsq.Text            := FloatToStr(FQrRep.Page.LeftMargin);
            MDir.Text            := FloatToStr(FQrRep.Page.RightMargin);

            CkLSup.Checked       := FQrRep.Frame.DrawTop;
            CkLInf.Checked       := FQrRep.Frame.DrawBottom;
            CkLEsq.Checked       := FQrRep.Frame.DrawLeft;
            CkLDir.Checked       := FQrRep.Frame.DrawRight;


            Fonte.Text           := FQrRep.Font.Name;
            TamFont.Text         := FloatToStr(FQrRep.Font.Size);
            exit;
        end;

        try
          Fonte.ITemIndex      :=  Fonte.Items.IndexOF(Reg.ReadString('FonteName'));
          Matricial.Checked    :=  Reg.ReadString('Matricial') = 'T';
          Reg.ReadBinaryData('Dados',SetupImp,SizeOf(SetupImp));
          TamFont.Text       :=  IntToStr(SetupImp.FonteTam);
          Papel.ItemIndex    :=  Papel.Items.IndexOF(PaperSizetoStr(SetupImp.Papel));
          MSup.Text          :=  FormatFloat('#,##0.00',(SetupImp.margemsup));
          MInf.Text          :=  FormatFloat('#,##0.00',(SetupImp.margemInf));
          MEsq.Text          :=  FormatFloat('#,##0.00',(SetupImp.margemEsq));
          MDir.Text          :=  FormatFloat('#,##0.00',(SetupImp.margemDir));

          CkLSup.Checked     := SetupImp.LSup;
          CkLInf.Checked     := SetupImp.Linf;
          CkLEsq.Checked     := SetupImp.LEsq;
          CkLDir.Checked     := SetupImp.LDir;
        except
          //
        end;

   finally
      Reg.CloseKey;
      Reg.Destroy;
   end;

end;

end.
