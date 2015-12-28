unit PanelInforma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TEstadoPanel = (Lento,Piscando,Parado,UmaUm,Nenhum);

  TPanelInforma = class(TPanel)
  private
    FChange: TNotifyEvent;
    Estado:Array of TEstadoPanel;
    TimerInforma: TTimer;
    FCaptionLento,FCaptionUmaUm : String;
    FTempoPiscando,FTempoLento,IndTempoLento,IndTempoPiscando,IndEstado,IndTempoUmaUm :Word;
    OldCaption : String;
    FTempoParado: Word;
    FIndiceParado: Integer;
    FIndiceLento: Integer;
    FIndiceUmaUm: Integer;
    FIndicePiscando: Integer;
    FItensPisc: TStringList;
    FActive   : Boolean;
    FTempoUmaUm: Word;
    Procedure Timer(Sender:Tobject);
    Procedure SetIndiceLento(Ind:Integer);
    Procedure SetIndicePiscando(Ind:Integer);
    Procedure SetIndiceParado(Ind:Integer);
    Procedure SetIndiceUmaUm(Ind:Integer);
    Procedure SetItensPisc(Lista:TStringList);
    Procedure ProximoEstado;
    procedure SetActive(const Value: Boolean);
    Procedure CreateWnd;override;
    Procedure DeletaEstado(Value:TEstadoPanel);
    Procedure IncluiEstado(Ind:Integer;Value:TEstadoPanel);
    { Private declarations }
  protected
    procedure Change; dynamic;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy ; override;
    { Public declarations }
  published
    Property OnChange :      TNotifyEvent read FChange write FChange;
    Property CaptionLento    : String read FCaptionLento    write FCaptionLento;
    Property CaptionUmaUm    : String read FCaptionUmaUm    write FCaptionUmaUm;
    Property TempoParado     : Word   Read FTempoParado     Write FTempoParado;
    Property TempoPiscando   : Word   Read FTempoPiscando   Write FTempoPiscando;
    Property TempoLento      : Word   Read FTempoLento      Write FTempoLento;
    Property IndiceLento     : Integer   Read FIndiceLento     Write SetindiceLento Default -1;
    Property IndicePiscando     : Integer   Read FIndicePiscando   Write SetIndicePiscando Default -1;
    Property IndiceParado     : Integer   Read FIndiceParado   Write SetIndiceParado Default -1;
    Property IndiceUmaUm     : Integer   Read FIndiceUmaUm     Write SetindiceUmaUm Default -1;
    Property ItensPiscando    : TStringList Read FItensPisc Write SetItensPisc;
    Property TempoUmaUm      : Word   Read FTempoUmaUm      Write FTempoUmaUm;
    Property Active           : Boolean Read Factive Write SetActive Default False;
     { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RodrigoComponentes', [TPanelInforma]);
end;

{ TPanelInforma }

procedure TPanelInforma.Change;
begin
 If Assigned(FChange) then
  Change;
end;

constructor TPanelInforma.Create(AOwner: TComponent);
begin
  inherited Create(Aowner);
  TimerInforma := TTimer.Create(Self);
  FitensPisc   := TStringList.Create;
  TimerInforma.Enabled := False;
  TimerInforma.OnTimer := Timer;
  IndTempoLento := 1;
  IndTempoUmAUm := 1;
end;

procedure TPanelInforma.CreateWnd;
begin
  OldCaption := Caption;
  inherited CreateWnd;
end;

procedure TPanelInforma.DeletaEstado(Value: TEstadoPanel);
var
i,i2:word;
begin
  If LEngth(Estado) = 0 Then
   exit;

   For i:=0 to LEngth(Estado) - 1 do begin
     If Estado[i] = Value then
       Break;
   end;

  If i > LEngth(Estado) - 1 then
   Exit;

  For i2:=i to LEngth(Estado) - 2 Do
    Estado[i2] := Estado[i2 + 1];

  SetLEngth(Estado,Length(Estado) - 1);
end;

destructor TPanelInforma.Destroy;
begin
  FitensPisc.Destroy;
  TimerInforma.Destroy;
  inherited Destroy;
end;

procedure TPanelInforma.IncluiEstado(Ind: Integer; Value: TEstadoPanel);
begin
   If Ind > Length(Estado) - 1 then
     SetLength(Estado,Ind + 1);

   If Ind = -1 then
     Estado[ind] := Nenhum
   else
     Estado[ind] := Value;
end;

procedure TPanelInforma.ProximoEstado;
begin
  If (indestado +  1) <= (Length(Estado)  - 1) then
   IndEstado := IndEstado + 1
  else
   IndEstado := 0;

end;

procedure TPanelInforma.SetActive(const Value: Boolean);
begin
  TimerInforma.Enabled  := Value;
  Factive := Value;
end;

procedure TPanelInforma.SetIndiceLento(Ind: Integer);
begin
  FIndiceLEnto := Ind;
  IncluiEstado(Ind,LEnto);
end;

procedure TPanelInforma.SetIndiceParado(Ind: Integer);
begin
  FIndiceParado := Ind;
  IncluiEstado(Ind,Parado);
end;

procedure TPanelInforma.SetIndicePiscando(Ind: Integer);
begin
  FIndicePiscando := Ind;
  IncluiEstado(Ind,Piscando);
end;

procedure TPanelInforma.SetIndiceUmaUm(Ind: Integer);
begin
  FIndiceUmaUm := Ind;
  IncluiEstado(Ind,UmaUm);
end;

procedure TPanelInforma.SetItensPisc(Lista:TStringList);
begin
  FItensPisc.Assign(lista);
end;

procedure TPanelInforma.Timer(Sender: Tobject);
var
i : integer;
begin
       If Estado[IndEstado] = Lento then begin
          TimerInforma.Interval := FTempoLento;
          Alignment             := taRightJustify;
          If IndtempoLento = 1 then
           Caption  := '';

          If Caption <> CaptionLento then begin
             Caption   :=  Caption + Copy(FCaptionLento,IndTempoLento,1);
             inc(IndTempoLento);
           end
         else begin
            IndTempoLento := 1;
            ProximoEstado;
         end
      end
     else If Estado[IndEstado] = Piscando then begin
         TimerInforma.Interval := FTempoPiscando;
         Alignment             := taCenter;
         If IndTempoPiscando <= FItensPisc.Count - 1 then begin
           Caption := FItensPisc.Strings[indTempoPiscando];
           Inc(IndTempoPiscando);
         end
        else begin
           IndTempoPiscando := 0;
           ProximoEstado;
        end;
      end
     else If Estado[IndEstado] = UmaUm then begin
         TimerInforma.Interval := FTempoUmaUm;
         Alignment             := taCenter;

         If indtempoumaum <= Length(FCAptionUmaUm) then  begin
            Caption  := '';
            For i:=1 to Length(FCaptionUmaUm) do begin
               If i = indtempoumaum then
                CAption :=  Caption + Copy(FCaptionUmaUm,i,1)
               else
                CAption :=  Caption + '  ';
            end;
           Inc(IndTEmpoUmaUm);
          end
         else begin
           CAption := FCAptionUmaUm;
           indtempoumaum := 1;
           ProximoEstado;
         end;
    end else  If Estado[IndEstado] = Parado then begin
      Caption               := OldCaption;
      TimerInforma.Interval := FTempoParado;
      ProximoEstado;
   end else if Estado[indestado] = nenhum then begin
    ProximoEstado;
  end;


  If TForm(Owner).MDIChildCount > 0 then
   SendToBack
  else
   BringToFront;


end;

end.
