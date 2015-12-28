unit unDialogo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls;

type
  TfrmDialogo = class(TForm)
    linha1: TLabel;
    imIcone: TImage;
    pnSim: TPanel;
    pnNao: TPanel;
    btnSim: TSpeedButton;
    btnNao: TSpeedButton;
    linha2: TLabel;
    linha3: TLabel;
    Bevel1: TBevel;
    pnCancelar: TPanel;
    btnCancelar: TSpeedButton;
    pnOk: TPanel;
    btnOk: TSpeedButton;
    pnAbortar: TPanel;
    btnAbortar: TSpeedButton;
    pnTentar: TPanel;
    btnTentar: TSpeedButton;
    pnAjuda: TPanel;
    btnAjuda: TSpeedButton;
    PanelNulo: TPanel;
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAbortarClick(Sender: TObject);
    procedure btnTentarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnSimClick(Sender: TObject);
    procedure pnNaoClick(Sender: TObject);
    procedure pnAjudaClick(Sender: TObject);
    procedure pnCancelarClick(Sender: TObject);
    procedure pnOkClick(Sender: TObject);
    procedure pnAbortarClick(Sender: TObject);
    procedure pnTentarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    maxPos,posAtiv: Integer;
    aPanels: array[1..7] of TPanel;
    function ExibirMensagem (mensagem,caption: String; buttom: TMsgDlgButtons;
      icone: String; col,lin: Integer):Word;
  end;

var
  frmDialogo: TfrmDialogo;

implementation

uses principal;

{$R *.DFM}

{Metodo de exibicao da mensagem ***}
function TfrmDialogo.ExibirMensagem (mensagem,caption: String;
  buttom: TMsgDlgButtons; icone: String;col,lin: Integer):Word;
var
  linha: String;
  nbt,totbt,tam,i,j: Integer;
begin
     {zerando vetor de paneis **}
  i:=1;
  while (i<=7) do
  begin
    aPanels[i]:=PanelNulo;
    i:=i+1;
  end;
  pnSim.color      := clNavy;
  pnNao.color      := clNavy;
  pnAjuda.color    := clNavy;
  pnCancelar.color := clNavy;
  pnOk.color       := clNavy;
  pnAbortar.color  := clNavy;
  pnTentar.color   := clNavy;

     {posicionando mensagem **--}
  linha1.caption:='';
  linha2.caption:='';
  linha3.caption:='';
  i:=1;
  linha:='';
  while (i<=Length(mensagem)+1) do
  begin
    if (linha1.caption='') then
      tam:=32
    else
    if (linha2.caption='') then
      tam:=30
    else
    if (linha3.caption='') then
      tam:=20;
    if ((mensagem[i]=' ')
      and (Length(linha)>=tam)) or (i=Length(mensagem)+1)
    then
    begin
      if (linha1.caption='') then
        linha1.caption:=linha
      else
      if (linha2.caption='') then
        linha2.caption:=linha
      else
      if (linha3.caption='') then
        linha3.caption:=linha;
      linha:='';
    end
    else
      linha:=linha+mensagem[i];
    i:=i+1;
  end;
  if (icone<>'') then
    try
      imIcone.visible:=true;
      imIcone.Picture.LoadFromFile (icone);
    except
      imIcone.visible:=false;
    end;

     {Posicionando e ativando botoes **--}
  pnSim.top       := 152;
  pnNao.top       := 152;
  pnAjuda.top     := 152;
  pnCancelar.top  := 152;
  pnOk.top        := 152;
  pnAbortar.top   := 152;
  pnTentar.top    := 152;
  pnSim.left      := 0;
  pnNao.left      := 0;
  pnAjuda.left    := 0;
  pnCancelar.left := 0;
  pnOk.left       := 0;
  pnAbortar.left  := 0;
  pnTentar.left   := 0; 
  nbt:=1;
  totbt:=0;
  while (nbt<=7) do
  begin
    if (nbt=1) then
      if (mbYes in buttom) then
      begin
        pnSim.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=2) then
      if (mbNo in buttom) then
      begin
        pnNao.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=3) then
      if (mbHelp in buttom) then
      begin
        pnAjuda.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=4) then
      if (mbCancel in buttom) then
      begin
        pnCancelar.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=5) then
      if (mbOk in buttom) then
      begin
        pnOk.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=6) then
      if (mbAbort in buttom) then
      begin
        pnAbortar.top:=96;
        totbt:=totbt+1;
      end;
    if (nbt=7) then
      if (mbRetry in buttom) then
      begin
        pnTentar.top:=96;
        totbt:=totbt+1;
      end;
    nbt:=nbt+1;
  end;

     {para exibicao de 01 botao}
  if (totbt=1) then
  begin
    frmDialogo.width:=350;
    Bevel1.width:=frmDialogo.width-14;
    nbt:=1;
    while (nbt<=totbt) do
    begin
      if (nbt=1) then
        if (pnSim.top=96) and (pnSim.left<>104) then
        begin
          pnSim.left:=124;
          pnSim.color:=clYellow;
        end
        else
        if (pnNao.top=96) and (pnNao.left<>104) then
        begin
          pnNao.left:=124;
          pnNao.color:=clYellow;
        end
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>104) then
        begin
          pnAjuda.left:=124;
          pnAjuda.color:=clYellow;
        end
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>104) then
        begin
          pnCancelar.left:=124;
          pnCancelar.color:=clYellow;
        end
        else
        if (pnOk.top=96) and (pnOk.left<>104) then
        begin
          pnOk.left:=124;
          pnOk.color:=clYellow;
        end
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>104) then
        begin
          pnAbortar.left:=124;
          pnAbortar.color:=clYellow;
        end;
      nbt:=nbt+1;
    end;
  end;

     {para exibicao de 02 botoes}
  if (totbt=2) then
  begin
    frmDialogo.width:=345;
    Bevel1.width:=frmDialogo.width-14;
    nbt:=1;
    while (nbt<=totbt) do
    begin
      if (nbt=1) then
        if (pnSim.top=96) and (pnSim.left<>64) then
        begin
          pnSim.left:=64;
          pnSim.color:=clYellow;
        end
        else
        if (pnNao.top=96) and (pnNao.left<>64) then
        begin
          pnNao.left:=64;
          pnNao.color:=clYellow;
        end
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>64) then
        begin
          pnAjuda.left:=64;
          pnAjuda.color:=clYellow;
        end
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>64) then
        begin
          pnCancelar.left:=64;
          pnCancelar.color:=clYellow;
        end
        else
        if (pnOk.top=96) and (pnOk.left<>64) then
        begin
          pnOk.left:=64;
          pnOk.color:=clYellow;
        end
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>64) then
        begin
          pnAbortar.left:=64;
          pnAbortar.color:=clYellow;
        end;
      if (nbt=2) then
        if (pnSim.top=96) and (pnSim.left<>158)
          and (pnSim.left<>64) then
          pnSim.left:=158
        else
        if (pnNao.top=96) and (pnNao.left<>158)
          and (pnNao.left<>64) then
          pnNao.left:=158
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>158)
          and (pnAjuda.left<>64) then
          pnAjuda.left:=158
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>158)
          and (pnCancelar.left<>64) then
          pnCancelar.left:=158
        else
        if (pnOk.top=96) and (pnOk.left<>158)
          and (pnOk.left<>64) then
          pnOk.left:=158
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>158)
          and (pnAbortar.left<>64) then
          pnAbortar.left:=158;
      nbt:=nbt+1;
    end;
  end;

     {para exibicao de 03 botoes}
  if (totbt=3) then
  begin
    frmDialogo.width:=418;
    Bevel1.width:=frmDialogo.width-14;
    nbt:=1;
    while (nbt<=totbt) do
    begin
      if (nbt=1) then
        if (pnSim.top=96) and (pnSim.left<>40) then
        begin
          pnSim.left:=40;
          pnSim.color:=clYellow;
        end
        else
        if (pnNao.top=96) and (pnNao.left<>40) then
        begin
          pnNao.left:=40;
          pnNao.color:=clYellow;
        end
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>40) then
        begin
          pnAjuda.left:=40;
          pnAjuda.color:=clYellow;
        end
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>40) then
        begin
          pnCancelar.left:=40;
          pnCancelar.color:=clYellow;
        end
        else
        if (pnOk.top=96) and (pnOk.left<>40) then
        begin
          pnOk.left:=40;
          pnOk.color:=clYellow;
        end
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>40) then
        begin
          pnAbortar.left:=40;
          pnAbortar.color:=clYellow;
        end;
      if (nbt=2) then
        if (pnSim.top=96) and (pnSim.left<>144)
          and (pnSim.left<>40) then
          pnSim.left:=144
        else
        if (pnNao.top=96) and (pnNao.left<>144)
          and (pnNao.left<>40) then
          pnNao.left:=144
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>144)
          and (pnAjuda.left<>40) then
          pnAjuda.left:=144
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>144)
          and (pnCancelar.left<>40) then
          pnCancelar.left:=144
        else
        if (pnOk.top=96) and (pnOk.left<>144)
          and (pnOk.left<>40) then
          pnOk.left:=144
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>144)
          and (pnAbortar.left<>40) then
          pnAbortar.left:=144;
      if (nbt=3) then
        if (pnSim.top=96) and (pnSim.left<>144)
          and (pnSim.left<>40) and (pnSim.left<>248) then
          pnSim.left:=248
        else
        if (pnNao.top=96) and (pnNao.left<>144)
          and (pnNao.left<>40) and (pnNao.left<>248) then
          pnNao.left:=248
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>144)
          and (pnAjuda.left<>40) and (pnAjuda.left<>248) then
          pnAjuda.left:=248
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>144)
          and (pnCancelar.left<>40) and (pnCancelar.left<>248) then
          pnCancelar.left:=248
        else
        if (pnOk.top=96) and (pnOk.left<>144)
          and (pnOk.left<>40) and (pnOk.left<>248) then
          pnOk.left:=248
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>144)
          and (pnAbortar.left<>40) and (pnAbortar.left<>248) then
          pnAbortar.left:=248;
      nbt:=nbt+1;
    end;
  end;

     {para exibicao de 04 botoes}
  if (totbt=4) then
  begin
    frmDialogo.width:=520;
    Bevel1.width:=frmDialogo.width-14;
    nbt:=1;
    while (nbt<=totbt) do
    begin
      if (nbt=1) then
        if (pnSim.top=96) and (pnSim.left<>40) then
        begin
          pnSim.left:=40;
          pnSim.color:=clYellow;
        end
        else
        if (pnNao.top=96) and (pnNao.left<>40) then
        begin
          pnNao.left:=40;
          pnNao.color:=clYellow;
        end
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>40) then
        begin
          pnAjuda.left:=40;
          pnAjuda.color:=clYellow;
        end
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>40) then
        begin
          pnCancelar.left:=40;
          pnCancelar.color:=clYellow;
        end
        else
        if (pnOk.top=96) and (pnOk.left<>40) then
        begin
          pnOk.left:=40;
          pnOk.color:=clYellow;
        end
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>40) then
        begin
          pnAbortar.left:=40;
          pnAbortar.color:=clYellow;
        end;
      if (nbt=2) then
        if (pnSim.top=96) and (pnSim.left<>144)
          and (pnSim.left<>40) then
          pnSim.left:=144
        else
        if (pnNao.top=96) and (pnNao.left<>144)
          and (pnNao.left<>40) then
          pnNao.left:=144
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>144)
          and (pnAjuda.left<>40) then
          pnAjuda.left:=144
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>144)
          and (pnCancelar.left<>40) then
          pnCancelar.left:=144
        else
        if (pnOk.top=96) and (pnOk.left<>144)
          and (pnOk.left<>40) then
          pnOk.left:=144
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>144)
          and (pnAbortar.left<>40) then
          pnAbortar.left:=144;
      if (nbt=3) then
        if (pnSim.top=96) and (pnSim.left<>144)
          and (pnSim.left<>40) and (pnSim.left<>248) then
          pnSim.left:=248
        else
        if (pnNao.top=96) and (pnNao.left<>144)
          and (pnNao.left<>40) and (pnNao.left<>248) then
          pnNao.left:=248
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>144)
          and (pnAjuda.left<>40) and (pnAjuda.left<>248) then
          pnAjuda.left:=248
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>144)
          and (pnCancelar.left<>40) and (pnCancelar.left<>248) then
          pnCancelar.left:=248
        else
        if (pnOk.top=96) and (pnOk.left<>144)
          and (pnOk.left<>40) and (pnOk.left<>248) then
          pnOk.left:=248
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>144)
          and (pnAbortar.left<>40) and (pnAbortar.left<>248) then
          pnAbortar.left:=248;
      if (nbt=4) then
        if (pnSim.top=96) and (pnSim.left<>144)
          and (pnSim.left<>40) and (pnSim.left<>248)
          and (pnSim.left<>353) then
          pnSim.left:=353
        else
        if (pnNao.top=96) and (pnNao.left<>144)
          and (pnNao.left<>40) and (pnNao.left<>248)
          and (pnNao.left<>353) then
          pnNao.left:=353
        else
        if (pnAjuda.top=96) and (pnAjuda.left<>144)
          and (pnAjuda.left<>40) and (pnAjuda.left<>248)
          and (pnAjuda.left<>353) then
          pnAjuda.left:=353
        else
        if (pnCancelar.top=96) and (pnCancelar.left<>144)
          and (pnCancelar.left<>40) and (pnCancelar.left<>248)
          and (pnCancelar.left<>353) then
          pnCancelar.left:=353
        else
        if (pnOk.top=96) and (pnOk.left<>144)
          and (pnOk.left<>40) and (pnOk.left<>248)
          and (pnOk.left<>353) then
          pnOk.left:=353
        else
        if (pnAbortar.top=96) and (pnAbortar.left<>144)
          and (pnAbortar.left<>40) and (pnAbortar.left<>248)
          and (pnAbortar.left<>353) then
          pnAbortar.left:=353;
      nbt:=nbt+1;
    end;
  end;

     {Restante das configuracoes do formulario}
  frmDialogo.caption         := caption;
  frmDialogo.ModalResult     := 0;
  frmDialogo.left            := col;
  frmDialogo.top             := lin;

     {Preenchendo vetor de paineis ativos **}
  j:=1;
  i:=1;
  while (j<=7) do
  begin
    if (j=1) then
      if (pnSim.Top=96) then
      begin
        aPanels[i]:=pnSim;
        i:=i+1;
      end;
    if (j=2) then
      if (pnNao.Top=96) then
      begin
        aPanels[i]:=pnNao;
        i:=i+1;
      end;
    if (j=3) then
      if (pnAjuda.Top=96) then
      begin
        aPanels[i]:=pnAjuda;
        i:=i+1;
      end;
    if (j=4) then
      if (pnCancelar.Top=96) then
      begin
        aPanels[i]:=pnCancelar;
        i:=i+1;
      end;
    if (j=5) then
      if (pnOk.Top=96) then
      begin
        aPanels[i]:=pnOk;
        i:=i+1;
      end;
    if (j=6) then
      if (pnAbortar.Top=96) then
      begin
        aPanels[i]:=pnAbortar;
        i:=i+1;
      end;
    if (j=7) then
      if (pnTentar.Top=96) then
      begin
        aPanels[i]:=pnTentar;
        i:=i+1;
      end;
    j:=j+1;
  end;
  maxPos  := i-1;
  posAtiv := 1;
  ExibirMensagem := frmDialogo.showmodal;
end;

{Botao de SIM}
procedure TfrmDialogo.btnSimClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrYes;
end;

{Botao de NAO}
procedure TfrmDialogo.btnNaoClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrNo;
end;                      

{Botao de CANCELAR}
procedure TfrmDialogo.btnCancelarClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrCancel;
end;

{Botao de OK}
procedure TfrmDialogo.btnOkClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrOk;
end;

{Botao de ABORT}
procedure TfrmDialogo.btnAbortarClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrAbort;
end;

{Botao de RETRY}
procedure TfrmDialogo.btnTentarClick(Sender: TObject);
begin
  frmDialogo.modalresult    := mrRetry;
end;

{Navegacao-}
procedure TfrmDialogo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_BAIXO) or (key=K_DIR) then
  begin
    pnSim.color      := clNavy;
    pnNao.color      := clNavy;
    pnAjuda.color    := clNavy;
    pnCancelar.color := clNavy;
    pnOk.color       := clNavy;
    pnAbortar.color  := clNavy;
    pnTentar.color   := clNavy;
    if (posAtiv<maxPos) then
      posAtiv := posAtiv + 1
    else
      posAtiv := 1;
    aPanels[posAtiv].color := clYellow;
  end;
  if (key=K_CIMA) or (key=K_ESQ) then
  begin
    pnSim.color      := clNavy;
    pnNao.color      := clNavy;
    pnAjuda.color    := clNavy;
    pnCancelar.color := clNavy;
    pnOk.color       := clNavy;
    pnAbortar.color  := clNavy;
    pnTentar.color   := clNavy;
    if (posAtiv>1) then
      posAtiv := posAtiv - 1
    else
      posAtiv := maxPos;
    aPanels[posAtiv].color := clYellow;
  end;
  if (key=K_ENTER) then
  begin
    if (aPanels[posAtiv]=pnSim) then
      btnSim.click;
    if (aPanels[posAtiv]=pnNao) then
      btnNao.click;
    if (aPanels[posAtiv]=pnAjuda) then
      btnAjuda.click;
    if (aPanels[posAtiv]=pnCancelar) then
      btnCancelar.click;
    if (aPanels[posAtiv]=pnOk) then
      btnOk.click;
    if (aPanels[posAtiv]=pnAbortar) then
      btnAbortar.click;
    if (aPanels[posAtiv]=pnTentar) then
      btnTentar.click;
  end;
end;

procedure TfrmDialogo.pnSimClick(Sender: TObject);
begin
  btnSim.click;
end;

procedure TfrmDialogo.pnNaoClick(Sender: TObject);
begin
  btnNao.click;
end;

procedure TfrmDialogo.pnAjudaClick(Sender: TObject);
begin
  btnAjuda.click;
end;

procedure TfrmDialogo.pnCancelarClick(Sender: TObject);
begin
  btnCancelar.click;
end;

procedure TfrmDialogo.pnOkClick(Sender: TObject);
begin
  btnOk.click;
end;

procedure TfrmDialogo.pnAbortarClick(Sender: TObject);
begin
  btnAbortar.click;
end;

procedure TfrmDialogo.pnTentarClick(Sender: TObject);
begin
  btnTentar.click;
end;

end.
