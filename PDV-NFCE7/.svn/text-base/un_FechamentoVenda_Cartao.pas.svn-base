unit un_FechamentoVenda_Cartao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, StdCtrls, Mask, Grids;

type
  Tfrm_FechamentoVenda_Cartao = class(TForm)
    MainMenu1: TMainMenu;
    Principal1: TMenuItem;
    SAIR1: TMenuItem;
    N1: TMenuItem;
    Limparformulrio1: TMenuItem;
    Image2: TImage;
    Label2: TLabel;
    Label12: TLabel;
    Confirmardados1: TMenuItem;
    botao1: TPanel;
    botaoSair: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    edtCodAdm: TMaskEdit;
    pnAdm: TPanel;
    Label11: TLabel;
    edtCartao: TMaskEdit;
    Bevel4: TBevel;
    grade1: TStringGrid;
    grade2: TStringGrid;
    Label1: TLabel;
    edtParcela: TMaskEdit;
    pnValorMinimo: TPanel;
    pnQtde: TPanel;
    pnTotalFinanciado: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    pnData: TPanel;
    Label8: TLabel;
    RGTipoPag: TRadioGroup;
    procedure SAIR1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure botaoSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Confirmardados1Click(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAdmDblClick(Sender: TObject);
    procedure edtCodAdmEnter(Sender: TObject);
    procedure edtCodAdmExit(Sender: TObject);
    procedure edtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCartaoEnter(Sender: TObject);
    procedure edtCartaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade1Enter(Sender: TObject);
    procedure grade2Enter(Sender: TObject);
    procedure edtParcelaEnter(Sender: TObject);
    procedure edtParcelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtParcelaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    y_total_financiado: Real;
    y_data_compra: TDateTime;
    y_valor_parcela: Real;
    y_permite_parcelamento: Boolean;
    y_qtde_parcelas: Integer;
    y_parcela_minima: Real;
    y_percentual_administradora: Real;
    y_incremento_dias: Integer;
    y_qtde_minima: Integer;
    y_sequencia_ordem: Integer;
    jaChamou: Boolean;
    tecla: Integer;
    procedure LimparEdits;
    procedure FocusControle(controle: TWinControl; direcao: Boolean);
    procedure LimparGradePrestacoes;
    procedure MontarParcelas;
    function TotalParcelasDifFinanciado:Boolean;
    function IsAdmCreditoAut(codigo: Real):Boolean;
  end;

var
  frm_FechamentoVenda_Cartao: Tfrm_FechamentoVenda_Cartao;

implementation

uses f8Bancos, auxiliar, funcoes1, funcoes2, procura, principal, un_F8Adm,
  unDialogo, credito;

{$R *.DFM}

procedure Tfrm_FechamentoVenda_Cartao.SAIR1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cartao.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);
  if (not JaChamou) then
  begin
    pnTotalFinanciado.caption:=form_nc(y_total_financiado,8);
    pnData.caption:=form_data(y_data_compra);
    Limparformulrio1.click;
    JaChamou:=true;
  end;
  edtCodAdm.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.FocusControle(controle: TWinControl; direcao: Boolean);
var
  Lista: TList;
  proxcontrole: TWinControl;
  ind: Integer;
begin
  Lista:=TList.Create;
  GetTabOrderList(Lista);
  ind:=TWinControl(controle).TabOrder;
  if (direcao) then
  begin
    if (ind<Lista.count) then
      proxcontrole:=Lista.items[ind+1]
    else
      proxcontrole:= Lista.items[0];
  end
  else
  if (ind>0) then
    proxcontrole:=Lista.items[ind-1]
  else
    proxcontrole:=Lista.items[Lista.count-1];
  proxcontrole.setfocus;
  Lista.Free;
end;

procedure Tfrm_FechamentoVenda_Cartao.botao1Click(Sender: TObject);
begin
  Confirmardados1.click;
end;

procedure Tfrm_FechamentoVenda_Cartao.botaoSairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_FechamentoVenda_Cartao.FormCreate(Sender: TObject);
begin
     {**************************************************}
  y_total_financiado := 0.00;
  y_data_compra      := strtodate('01/01/1900');
  y_valor_parcela    := 0.00;
  y_qtde_parcelas    := 0;
  y_permite_parcelamento := false;
  y_parcela_minima   := 0.00;
  y_qtde_minima      := 0;
  y_percentual_administradora := 0.00;
  y_incremento_dias  := 0;
     {**************************************************}
  tecla:=27;
  jaChamou:=false;
  grade1.Cells[0,0] := 'Pc';
  grade2.Cells[0,0] := 'Pc';
  grade1.Cells[1,0] := 'Venc.';
  grade2.Cells[1,0] := 'Venc.';
  grade1.Cells[2,0] := 'Valor $';
  grade2.Cells[2,0] := 'Valor $';
  grade1.Cells[3,0] := ' ';
  grade2.Cells[3,0] := ' ';
end;

procedure Tfrm_FechamentoVenda_Cartao.Confirmardados1Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  incremento: Real;
  vencimento: TDateTime;
  valor: Real;
  ind,parcela: Integer;
begin
  if (trim(edtCodAdm.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O código da Administradora não pode ficar vazio!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (strtofloat(trim(edtCodAdm.text))=0) then
  begin
    frmDialogo.ExibirMensagem ('O código da Administradora não pode ficar NULO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (trim(pnAdm.caption)='') then
  begin
    frmDialogo.ExibirMensagem ('A Administradora não se encontra cadastrada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (trim(edtCartao.text)='') then
  begin
    frmDialogo.ExibirMensagem ('O N. do Cartão de Crédito não pode ficar vazio!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  if (not IsAdmCreditoAut(strtofloat(trim(edtCodAdm.text)))) then
  begin
    frmDialogo.ExibirMensagem ('A Administradora não é de CRÉDITO!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCodAdm.setfocus;
  end
  else
  if (trim(edtParcela.text)='') then
  begin
    frmDialogo.ExibirMensagem ('A qtde. de parcelas deve ser informada!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtParcela.setfocus;
  end
  else
  if (y_qtde_minima<>0.00) and
    (strtoint(trim(edtParcela.text))<y_qtde_minima) then
  begin
    frmDialogo.ExibirMensagem ('A qtde. de parcelas informada é menor que a mínima permitida!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtParcela.text:='';
    edtParcela.setfocus;
  end
  else
  if (y_parcela_minima<>0.00) and
    (y_valor_parcela<y_parcela_minima) then
  begin
    frmDialogo.ExibirMensagem ('O valor das parcelas é menor que o mínimo exigido!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtParcela.setfocus;
  end
  else
  if (TotalParcelasDifFinanciado) then
    frmDialogo.ExibirMensagem ('O total das parcelas diverge do total financiado!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200)
  else
  if (Pos(';',trim(edtCartao.text))>0) then
  begin
    frmDialogo.ExibirMensagem ('O caracter PONTO E VIRGULA não pode acompanhar o número do cartão de crédito!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frmDialogo.ExibirMensagem ('Retire este caracter!'
      ,'Venda',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    edtCartao.setfocus;
  end
  else
  begin
         {***********************************************************}
    clAux := TClassAuxiliar.create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('DELETE FROM CARTOES_PARCELAS_LOCAL ');
    clAux.AddParam ('WHERE (PC_ORDE=:ordem)             ');
    clAux.consulta.parambyname('ordem').AsInteger := y_sequencia_ordem;
         {***********************************************************}
    clAux.Execute; {*}
    ind := 1;
    parcela := 1;
    incremento := y_incremento_dias;
    while (ind<=6) and
      (parcela<=y_qtde_parcelas) do
    begin
      if (trim(grade1.Cells[0,ind])<>'') then
      begin
                  {****************************************************************************}
        parcela    := strtoint(trim(grade1.Cells[0,ind]));
        vencimento := strtodate(trim(grade1.Cells[1,ind]));
        valor      := strtofloat(RetiraFormatacaoNumero(trim(grade1.Cells[2,ind])));
                  {****************************************************************************}
        clAux.ClearSql;
        clAux.AddParam ('INSERT INTO CARTOES_PARCELAS_LOCAL                                                                                                                    ');
        clAux.AddParam ('(PC_LOJA,PC_CAIX,PC_VEND,PC_ORDE,PC_NPAR,PC_VALO,PC_TOTA,PC_TOTJ,PC_STAT,PC_PERJ,PC_VALJ,PC_VENC,PC_DEBI,PC_DBAI,PC_DIAS,PC_PERC)                     ');
        clAux.AddParam ('VALUES                                                                                                                                                ');
        clAux.AddParam ('(:PC_LOJA,:PC_CAIX,:PC_VEND,:PC_ORDE,:PC_NPAR,:PC_VALO,:PC_TOTA,:PC_TOTJ,:PC_STAT,:PC_PERJ,:PC_VALJ,:PC_VENC,:PC_DEBI,:PC_DBAI,:PC_DIAS,:PC_PERC)     ');
        clAux.consulta.parambyname('PC_LOJA').AsFloat    := frm_principal.x_loja;
        clAux.consulta.parambyname('PC_CAIX').AsFloat    := frm_principal.x_terminal;
        clAux.consulta.parambyname('PC_VEND').AsFloat    := frm_principal.x_venda;
        clAux.consulta.parambyname('PC_ORDE').AsInteger  := y_sequencia_ordem;
        clAux.consulta.parambyname('PC_NPAR').AsInteger  := parcela;
        clAux.consulta.parambyname('PC_VALO').AsFloat    := valor;
        clAux.consulta.parambyname('PC_TOTA').AsFloat    := y_total_financiado;
        clAux.consulta.parambyname('PC_TOTJ').AsFloat    := y_total_financiado;
        clAux.consulta.parambyname('PC_STAT').AsString   := '0'; //em aberto
        clAux.consulta.parambyname('PC_PERJ').AsFloat    := 0.00;
        clAux.consulta.parambyname('PC_VALJ').AsFloat    := 0.00;
        clAux.consulta.parambyname('PC_VENC').AsDateTime := vencimento;
        clAux.consulta.parambyname('PC_DEBI').AsDateTime := vencimento + (incremento);
        clAux.consulta.parambyname('PC_DIAS').AsInteger  := y_incremento_dias;
        clAux.consulta.parambyname('PC_PERC').AsFloat    := y_percentual_administradora;
        clAux.consulta.parambyname('PC_DBAI').AsDateTime := strtodate('01/01/1900');
                  {****************************************************************************}
        clAux.Execute;
      end;
      ind:=ind+1;
      parcela:=parcela+1;
//              incremento:=30;
    end;
    if (parcela<=y_qtde_parcelas) then
    begin
      ind := 1;
//             incremento:=30;
      while (ind<=6) and
        (parcela<=y_qtde_parcelas) do
      begin
        if (trim(grade2.Cells[0,ind])<>'') then
        begin
                      {****************************************************************************}
          parcela    := strtoint(trim(grade2.Cells[0,ind]));
          vencimento := strtodate(trim(grade2.Cells[1,ind]));
          valor      := strtofloat(RetiraFormatacaoNumero(trim(grade2.Cells[2,ind])));
                      {****************************************************************************}
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO CARTOES_PARCELAS_LOCAL                                                                                                                  ');
          clAux.AddParam ('(PC_LOJA,PC_CAIX,PC_VEND,PC_ORDE,PC_NPAR,PC_VALO,PC_TOTA,PC_TOTJ,PC_STAT,PC_PERJ,PC_VALJ,PC_VENC,PC_DEBI,PC_DBAI,PC_DIAS,PC_PERC)                   ');
          clAux.AddParam ('VALUES                                                                                                                                              ');
          clAux.AddParam ('(:PC_LOJA,:PC_CAIX,:PC_VEND,:PC_ORDE,:PC_NPAR,:PC_VALO,:PC_TOTA,:PC_TOTJ,:PC_STAT,:PC_PERJ,:PC_VALJ,:PC_VENC,:PC_DEBI,:PC_DBAI,:PC_DIAS,:PC_PERC)   ');
          clAux.consulta.parambyname('PC_LOJA').AsFloat    := frm_principal.x_loja;
          clAux.consulta.parambyname('PC_CAIX').AsFloat    := frm_principal.x_terminal;
          clAux.consulta.parambyname('PC_VEND').AsFloat    := frm_principal.x_venda;
          clAux.consulta.parambyname('PC_ORDE').AsInteger  := y_sequencia_ordem;
          clAux.consulta.parambyname('PC_NPAR').AsInteger  := parcela;
          clAux.consulta.parambyname('PC_VALO').AsFloat    := valor;
          clAux.consulta.parambyname('PC_TOTA').AsFloat    := y_total_financiado;
          clAux.consulta.parambyname('PC_TOTJ').AsFloat    := y_total_financiado;
          clAux.consulta.parambyname('PC_STAT').AsString   := '0'; //em aberto
          clAux.consulta.parambyname('PC_PERJ').AsFloat    := 0.00;
          clAux.consulta.parambyname('PC_VALJ').AsFloat    := 0.00;
          clAux.consulta.parambyname('PC_VENC').AsDateTime := vencimento;
          clAux.consulta.parambyname('PC_DEBI').AsDateTime := vencimento + (incremento);
          clAux.consulta.parambyname('PC_DIAS').AsInteger  := y_incremento_dias;
          clAux.consulta.parambyname('PC_PERC').AsFloat    := y_percentual_administradora;
          clAux.consulta.parambyname('PC_DBAI').AsDateTime := strtodate('01/01/1900');
                      {****************************************************************************}
          clAux.Execute;
        end;
        ind:=ind+1;
        parcela:=parcela+1;
      end;
    end;
    clAux.desconect;
    clAux.Free;
         {***********************************************************}
    tecla:=13;
    close;
  end;
end;

procedure Tfrm_FechamentoVenda_Cartao.Limparformulrio1Click(
  Sender: TObject);
begin
  y_qtde_minima               := 0;
  y_parcela_minima            := 0.00;
  y_permite_parcelamento      := false;
  y_percentual_administradora := 0.00;
  y_incremento_dias           := 0;
  if (not frm_principal.x_ecf_habilita_TEF) then
  begin
    LimparEdits;
    LimparGradePrestacoes;
  end;   
  edtCodAdm.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.LimparEdits;
var
  Lista: TList;
  ind: Integer;
begin
  Lista:=TList.Create;
  frm_FechamentoVenda_Cartao.GetTabOrderList(Lista);
  ind:=0;
  while (ind<Lista.count) do
  begin
    if (TWinControl(Lista.items[ind]) is TMaskedit) then
      TMaskEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TEdit) then
      TEdit(Lista.items[ind]).text:='';
    if (TWinControl(Lista.items[ind]) is TCombobox) then
      TCombobox(Lista.items[ind]).text:='';
    ind:=ind+1;
  end;
  botaoSair.caption:='SAIR';
end;

procedure Tfrm_FechamentoVenda_Cartao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=27) then
    botaoSairClick(Sender);
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCodAdmDblClick(Sender: TObject);
begin
  with (frm_f8Adm) do
  begin
    left:=287;
    top :=76;
    edit:=edtCodAdm;
    loja:=frm_principal.x_loja;
    tipo:=1; //credito
    RefrescaTabela;
    label2.caption:='Administradoras de Cartão de Crédito';
    label12.caption:='Administradoras de Cartão de Crédito';
    showmodal;
  end;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCodAdmEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCodAdmExit(Sender: TObject);
var
  clAux: TClassAuxiliar;
  codigo: String;
begin
  y_qtde_minima      := 0;
  y_parcela_minima   := 0.00;   
  codigo := Trim(edtCodAdm.text);
  if (codigo<>'') then
  begin
    if (strtofloat(codigo)=0) then
      edtCodAdm.setfocus
    else
    begin
      clAux := TClassAuxiliar.Create;
      clAux.conect   (databaseprodutos,self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT AM_DESC,AM_CODI,AM_QTDE,AM_PARM,AM_PDES,           ');
      clAux.AddParam ('       AM_TDES,AM_PARC,AL_LOJA,AL_TAXA,AL_DIAS            ');
      clAux.AddParam ('FROM   ADMINISTRADORAS,ADMINISTRADORAS_LOJAS              ');
      clAux.AddParam ('WHERE (AM_CODI='+codigo+') AND (AM_CODI=AL_CADM) AND      ');
      clAux.AddParam ('      (AL_LOJA='+floattostr(frm_principal.x_loja)+') AND  ');
      clAux.AddParam ('      (AM_TIPO=1)                                         '); //credito
      if (clAux.Execute) then
      begin
        pnAdm.caption     := clAux.result('AM_DESC');
        edtCodAdm.text    := form_nz(strtofloat(codigo),3);
        if (clAux.result('AM_PARC')='0') then
          y_permite_parcelamento := false
        else
        if (clAux.result('AM_PARC')='1') then
          y_permite_parcelamento := true;
        y_qtde_minima     := clAux.Result('AM_QTDE');
        y_parcela_minima  := clAux.Result('AM_PARM');
        y_percentual_administradora := clAux.Result('AL_TAXA'); {*}
        y_incremento_dias := clAux.Result('AL_DIAS'); {*}
      end
      else
      begin
        pnAdm.caption     := '';
        y_permite_parcelamento := false;
      end;
              {**************************************************************************}
      if (y_parcela_minima<>0.00) then
        pnValorMinimo.caption  := ' Valor mínimo parc: '+trim(form_nc(y_parcela_minima,10))
      else
        pnValorMinimo.caption  := ' Valor mínimo parc: -';
      if (y_qtde_minima<>0.00) then
        pnQtde.caption         := ' Qtde. mín. parcelas: '+form_nz(y_qtde_minima,2)
      else
        pnQtde.caption         := ' Qtde. mín. parcelas: -';
              {**************************************************************************}
      clAux.desconect;
      clAux.Free;
    end;
  end
  else
  begin
    pnAdm.caption     := '';
    y_permite_parcelamento := false;
  end;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtCartao.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Adm) do
    begin
      left:=287;
      top :=76;
      edit:=edtCodAdm;
      loja:=frm_principal.x_loja;
      tipo:=1; //credito
      RefrescaTabela;
      label2.caption:='Administradoras de Cartão de Crédito';
      label12.caption:='Administradoras de Cartão de Crédito';
      showmodal;
    end;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCartaoEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtCartaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtParcela.setfocus;
  if (key=K_CIMA) then
    edtCodAdm.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.grade1Enter(Sender: TObject);
begin
  edtParcela.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.grade2Enter(Sender: TObject);
begin
  edtParcela.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtParcelaEnter(Sender: TObject);
begin
  TMaskEdit(sender).selectall;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtParcelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    if (trim(edtParcela.text)<>'') then
      MontarParcelas;
  if (key=K_CIMA) then
    edtCartao.setfocus;
end;

procedure Tfrm_FechamentoVenda_Cartao.MontarParcelas;
var
  data: TDateTime;
  parcela,ind: Integer;
  y_total_multiplicado,dif: Real;
  Year,Month,Day: Word;
begin
     {*************************************************************************}
  y_qtde_parcelas := strtoint(trim(edtParcela.text));
  y_valor_parcela := y_total_financiado/y_qtde_parcelas;
  y_valor_parcela := strtofloat(RetiraFormatacaoNumero(trim(form_nc(y_valor_parcela,10))));
  y_total_multiplicado := y_valor_parcela*y_qtde_parcelas;
  dif := strtofloat(RetiraFormatacaoNumero(trim(floattostr(y_total_financiado)))) -
    strtofloat(RetiraFormatacaoNumero(trim(floattostr(y_total_multiplicado))));
  if (dif<0.00) then
  begin
    y_valor_parcela := y_valor_parcela - 0.01;
    y_total_multiplicado := y_valor_parcela*y_qtde_parcelas;
    dif := y_total_financiado - y_total_multiplicado;
  end;
     {*************************************************************************}
  LimparGradePrestacoes;
     {*************************************************************************}
  DecodeDate(y_data_compra,Year,Month,Day);
  data            := RetornaData(y_data_compra,day,1); //incremento de 01 mês
  ind             := 1;
  parcela         := 1;
  while (ind<=6) and
    (parcela<=y_qtde_parcelas) do
  begin
    grade1.Cells[0,ind] := ' '+form_nz    (ind,2);
    grade1.Cells[1,ind] := '  '+form_data  (data);
    if (ind=1) then
      grade1.Cells[2,ind] := form_nc    (y_valor_parcela+dif,17)
    else
      grade1.Cells[2,ind] := form_nc    (y_valor_parcela,17);
    grade1.Cells[3,ind] := '';
    data                := RetornaData(data,day,1);
    ind:=ind+1;
    parcela:=parcela+1;
  end;
  if (parcela<=y_qtde_parcelas) then
  begin
    ind             := 1;
    while (ind<=6) and
      (parcela<=y_qtde_parcelas) do
    begin
      grade2.Cells[0,ind] := ' '+form_nz   (ind+6,2);
      grade2.Cells[1,ind] := '  '+form_data (data);
      grade2.Cells[2,ind] := form_nc   (y_valor_parcela,17);
      grade2.Cells[3,ind] := '';
      data                := RetornaData(data,day,1);
      ind:=ind+1;
      parcela:=parcela+1;
    end;
  end;
end;

function Tfrm_FechamentoVenda_Cartao.TotalParcelasDifFinanciado:Boolean;
var
  ind,parcela: Integer;
  valor,total: Real;
begin
  ind := 1;
  parcela := 1;
  total := 0.00;
  while (ind<=6) and
    (parcela<=y_qtde_parcelas) do
  begin
    if (trim(grade1.Cells[0,ind])<>'') then
      valor := strtofloat(RetiraFormatacaoNumero(trim(grade1.Cells[2,ind])));
    total := total + valor;
    ind:=ind+1;
    parcela:=parcela+1;
  end;
  if (parcela<=y_qtde_parcelas) then
  begin
    ind := 1;
    while (ind<=6) and
      (parcela<=y_qtde_parcelas) do
    begin
      if (trim(grade2.Cells[0,ind])<>'') then
        valor := strtofloat(RetiraFormatacaoNumero(trim(grade2.Cells[2,ind])));
      total := total + valor;
      ind:=ind+1;
      parcela:=parcela+1;
    end;
  end;
  if (trim(form_nc(total,15))<>trim(form_nc(y_total_financiado,15))) then
    result := true
  else
    result := false;
end;

procedure Tfrm_FechamentoVenda_Cartao.LimparGradePrestacoes;
var
  ind: Integer;
begin
  ind := 1;
  while (ind<=6) do
  begin
    grade1.Cells[0,ind] := '';
    grade1.Cells[1,ind] := '';
    grade1.Cells[2,ind] := '';
    grade1.Cells[3,ind] := '';
    ind:=ind+1;
  end;
  ind := 1;
  while (ind<=6) do
  begin
    grade2.Cells[0,ind] := '';
    grade2.Cells[1,ind] := '';
    grade2.Cells[2,ind] := '';
    grade2.Cells[3,ind] := '';
    ind:=ind+1;
  end;
end;

procedure Tfrm_FechamentoVenda_Cartao.edtParcelaChange(Sender: TObject);
begin
  if (trim(edtCodAdm.text)<>'') and (trim(pnAdm.caption)<>'') then //CRITICA antes da CRITICA
    if (trim(edtParcela.text)<>'') then
      if (strtoint(trim(edtParcela.text))>12) then
      begin
        frmDialogo.ExibirMensagem ('A qtde. máxima de parcelas é 12!'
          ,'Venda',[mbOK]
          ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        edtParcela.text:='';
        edtParcela.setfocus;
      end
      else
      if (not y_permite_parcelamento) then
        if (strtoint(trim(edtParcela.text))>1) then
        begin
          frmDialogo.ExibirMensagem ('A Administradora não permite parcelamento!'
            ,'Venda',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
          edtParcela.text:='';
          edtParcela.setfocus;
        end;
end;

function Tfrm_FechamentoVenda_Cartao.IsAdmCreditoAut(codigo: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  with (clAux) do
  begin
    Conect   (databaseprodutos,self);
    AddParam ('Select AM_CODI,AM_DESC                      ');
    AddParam ('From   ADMINISTRADORAS                      ');
    AddParam ('Where (AM_CODI='+floattostr(codigo)+') AND  ');
    AddParam ('      (AM_TIPO='+inttostr(1)+')             '); //debito
    if (not Execute) then
      IsAdmCreditoAut := false
    else
      IsAdmCreditoAut := true;
    desconect;
    Free;
  end;
end;

end.
