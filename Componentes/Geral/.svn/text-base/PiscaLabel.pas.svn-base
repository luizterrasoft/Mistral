unit PiscaLabel;

interface

uses
  Classes, StdCtrls, ExtCtrls;    { TTimer se declara en ExtCtrls }

type
  TPiscaLabel = class(TLabel)    {TBlinkLabel deriva de TLabel}
  private
    FVelocidad : integer;        {Frecuencia de parpadeo}
    FTimer : TTimer;             {Timer para la frecuencia}
    procedure SetVelocidad(valor : integer);  {Almacena la velocidad}
  protected
    procedure parpadea(Sender : TObject);
  public
    constructor Create(AOwner : TComponent); override;    {Constructor}

    destructor Destroy; override;                         {Destructor}
  published
    property Velocidad : integer read FVelocidad write SetVelocidad default 400;
  end;

procedure Register;

implementation

constructor TPiscaLabel.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);       {Llama al constructor original (heredado)}
  FTimer := TTimer.Create(Self);  {Creamos el timer}

  FVelocidad := 400;              {Frecuencia (velocidad) por defecto}

  FTimer.Enabled:=True;           {Activamos el timer}
  FTimer.OnTimer:=parpadea;       {Asiganamos el método parpadea}
  FTimer.Interval:=FVelocidad;    {Asignamos el intervalo del
 timer = frecuencia parpadeo}
end;

destructor TPiscaLabel.Destroy;
begin
  FTimer.Free;          {Liberamos el timer}
  inherited destroy;    {Llamamos al destructor original (heredado)}
end;

procedure TPiscaLabel.SetVelocidad (valor : integer);
begin
  If FVelocidad <> valor then  {Sólo si el valor introducido es

distinto del almacenado}
  begin
    if valor < 0 then FVelocidad:=0;
    FVelocidad:=Valor;               {Asigna la velocidad}
    if FVelocidad=0 then FTimer.Enabled:=False else FTimer.Enabled:=True;
    {Si Fvelocidad=0 el mensaje debe estar siempre visible}
    FTimer.Interval:=FVelocidad;

    If FVelocidad > 0 Then
       Visible:=True;
  end;
end;

procedure TPiscaLabel.parpadea(Sender : TObject);
begin
  if FTimer.Enabled then Visible := not(Visible);  {Alternativamente
muestra y oculta el mensaje si el timer esta activado}

end;

procedure Register;        {Registro del componente}
begin
  RegisterComponents('Sistema', [TPiscaLabel]);
end;

end.

