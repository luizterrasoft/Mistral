unit un_ExibeCaixas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, Grids, DBGrids, Db, DBTables, StdCtrls, Menus;

type
  Tfrm_ExibeCaixas = class(TForm)
    BotaoSair1: TBotaoSair;
    qCaixas: TQuery;
    ds: TDataSource;
    grade: TDBGrid;
    Panel1: TPanel;
    qCaixasCX_LOJA: TFloatField;
    qCaixasCX_CAIX: TFloatField;
    qCaixasCX_FUNC: TFloatField;
    qCaixasCX_DATA: TDateTimeField;
    qCaixasCX_STAT: TStringField;
    botao1: TPanel;
    botao2: TPanel;
    botao3: TPanel;
    botao5: TPanel;
    qCaixascFUNC: TStringField;
    qCaixascSTAT: TStringField;
    lblData: TLabel;
    lblLojaTerminal: TLabel;
    qCaixasCX_VINI: TFloatField;
    botao4: TPanel;
    MainMenu1: TMainMenu;
    AtalhosInvisiveis1: TMenuItem;
    Ativarcaixa1: TMenuItem;
    Novo1: TMenuItem;
    Excluir1: TMenuItem;
    Suspender1: TMenuItem;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    Ajuda1: TMenuItem;
    botao6: TPanel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label12: TLabel;
    Image2: TImage;
    botao7: TPanel;
    qCaixasCX_ABRE: TStringField;
    qCaixasCX_ENCE: TStringField;
    procedure BotaoSair1Click(Sender: TObject);
    procedure botao1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao1Click(Sender: TObject);
    procedure botao2Click(Sender: TObject);
    procedure botao4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qCaixasCalcFields(DataSet: TDataSet);
    procedure botao3Click(Sender: TObject);
    procedure gradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao4Click(Sender: TObject);
    procedure botao5Click(Sender: TObject);
    procedure qCaixasAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gradeDblClick(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Ativarcaixa1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Suspender1Click(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure botao6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure botao6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure botao7Click(Sender: TObject);
    procedure botao7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    function TemAlgumLancamento(caixa: Real):Boolean;
    procedure ApagaTudo;
    procedure RefrescaTabela;
  end;

var
  frm_ExibeCaixas: Tfrm_ExibeCaixas;

implementation

uses un_ExibeCaixas_NovoCaixa, principal, procura, auxiliar, unDialogo, funcoes1, funcoes2,
  un_senhaSupervisor, un_senhaCaixa, un_FechamentoCaixa, venda,
  un_AjudaComandos, caixa, un_SenhaAdministrador;

{$R *.DFM}

procedure Tfrm_ExibeCaixas.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ExibeCaixas.botao1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao1.color := clWhite;
  botao1.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.ApagaTudo;
begin
  botao1.color := clTeal;
  botao1.font.color := clWhite;
  botao2.color := clTeal;
  botao2.font.color := clWhite;
  botao3.color := clTeal;
  botao3.font.color := clWhite;
  botao4.color := clTeal;
  botao4.font.color := clWhite;
  botao5.color := clTeal;
  botao5.font.color := clWhite;
  botao6.color := clTeal;
  botao6.font.color := clWhite;
  botao7.color := clTeal;
  botao7.font.color := clWhite;
end;

procedure Tfrm_ExibeCaixas.botao2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao2.color := clWhite;
  botao2.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.botao3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao3.color := clWhite;
  botao3.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.botao5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao5.color := clWhite;
  botao5.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.botao1Click(Sender: TObject);
var
  clConf: TClassAuxiliar;
begin
  if (qCaixas.active) then
    if (qCaixas.recordcount<>0) then
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
        frmDialogo.ExibirMensagem ('Caixa j� ENCERRADO!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_SUSPENSO) then
        frmDialogo.ExibirMensagem ('Caixa encontra-se SUSPENSO!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) and
        (qCaixas.fieldbyname('CX_CAIX').AsFloat<>frm_principal.x_terminal) then
        frmDialogo.ExibirMensagem ('Caixa ABERTO em outro terminal n�o pode ser ativado neste terminal!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        frm_senhaCaixa.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;
        frm_senhaCaixa.showmodal;
        if (frm_senhaCaixa.y_flag) then
        begin
          frm_principal.x_caixa_ativo := qCaixas.fieldbyname('CX_FUNC').AsFloat;
                       {********************************************************************************}
          clConf := TClassAuxiliar.Create;
          clConf.conect   ('VENDAS',self);
          clConf.ClearSql;
          clConf.AddParam ('UPDATE CONF SET CAIXAATIVO=:caixaativo ');
          clConf.consulta.parambyname('caixaativo').AsFloat := frm_principal.x_caixa_ativo;
          clConf.Execute;
          clConf.desconect;
          clConf.Free;
                       {********************************************************************************}
          frm_principal.pnCaixaAtiva.caption := ' Caixa: '+form_nz(frm_principal.x_caixa_ativo,6)+'/'+
            form_t(ProcuraNomeVend(frm_principal.x_loja,
            frm_principal.x_caixa_ativo,self),28);
                       {********************************************************************************}
          close;
        end;
      end;
end;

procedure Tfrm_ExibeCaixas.botao2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ExibeCaixas_NovoCaixa, frm_ExibeCaixas_NovoCaixa);
  frm_ExibeCaixas_NovoCaixa.showmodal;
  frm_ExibeCaixas_NovoCaixa.Free;
  RefrescaTabela;
  grade.setfocus;
  qCaixas.first;
end;

procedure Tfrm_ExibeCaixas.botao4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao4.color := clWhite;
  botao4.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.RefrescaTabela;
begin
  qCaixas.close;
  qCaixas.parambyname('loja').AsFloat     := frm_principal.x_loja;
  qCaixas.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
  qCaixas.open;
end;

procedure Tfrm_ExibeCaixas.FormActivate(Sender: TObject);
var
  hR : THandle;
begin
     {*** cara de XP}
  hR := CreateRoundRectRgn(0,0,width,height,10,10);
  SetWindowRgn(Handle,hR,true);

  RefrescaTabela;
  qCaixas.disablecontrols;
  qCaixas.first;
  while (not qCaixas.eof) do
  begin
    if (qCaixas.fieldbyname('CX_FUNC').AsFloat=frm_principal.x_caixa_ativo) then
      break;
          {---->}
    qCaixas.next;
  end;
  qCaixas.enablecontrols;
  lblLojaTerminal.caption := 'Loja: '+form_nz(frm_principal.x_loja,2)+'/'+form_t(ProcuraNomeLoja(frm_principal.x_loja,self),20)+' - '+
    'Terminal: '+floattostr(frm_principal.x_terminal);
  lblData.caption := 'Data: '+form_data(frm_principal.x_data_trabalho);
end;

procedure Tfrm_ExibeCaixas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExibeCaixas.qCaixasCalcFields(DataSet: TDataSet);
begin
  with (qCaixas) do
  begin
    if (fieldbyname('cFUNC').IsNull) then
      fieldbyname('cFUNC').AsString := ProcuraNomeVendCaixa(frm_principal.x_loja,
        fieldbyname('CX_FUNC').AsFloat,self);
    if (fieldbyname('cSTAT').IsNull) then
      if (fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) then
        fieldbyname('cSTAT').AsString := 'ABERTO'
      else
      if (fieldbyname('CX_STAT').AsString=KST_CAIXA_SUSPENSO) then
        fieldbyname('cSTAT').AsString := 'SUSPENSO'
      else
      if (fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
        fieldbyname('cSTAT').AsString := 'ENCERRADO';
  end;
end;

procedure Tfrm_ExibeCaixas.botao3Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  funcant: Real;
begin
  if (qCaixas.active) then
    if (qCaixas.recordcount<>0) then
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
        frmDialogo.ExibirMensagem ('Caixa ENCERRADO n�o pode ser exclu�do!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_SUSPENSO) then
        frmDialogo.ExibirMensagem ('Caixa SUSPENSO n�o pode ser exclu�do!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) and
        (qCaixas.fieldbyname('CX_CAIX').AsFloat<>frm_principal.x_terminal) then
        frmDialogo.ExibirMensagem ('Caixa ABERTO em outro terminal! Imposs�vel sua EXCLUS�O!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (TemAlgumLancamento(qCaixas.fieldbyname('CX_FUNC').AsFloat)) then
      begin
        frmDialogo.ExibirMensagem ('Caixa j� possui lan�amentos! Imposs�vel sua exclus�o!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        grade.setfocus;
      end
      else
      begin
        frm_senhaCaixa.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;
        frm_senhaCaixa.showmodal;
        if (frm_senhaCaixa.y_flag) then
        begin
          qCaixas.disablecontrols;
          qCaixas.next;
          if (not qCaixas.eof) then
          begin
            funcant := qCaixas.fieldbyname('CX_FUNC').AsFloat;
            qCaixas.prior;
          end
          else
            funcant := -1;
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('DELETE FROM CAIXAS             ');
          clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
          clAux.AddParam ('      (CX_CAIX=:terminal) AND  ');
          clAux.AddParam ('      (CX_DATA=:data) AND      ');
          clAux.AddParam ('      (CX_FUNC=:func)          ');
          clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
          clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
          clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
          clAux.consulta.parambyname('func').AsFloat     := qCaixas.fieldbyname('CX_FUNC').AsFloat;
          clAux.Execute; {*}

          if DataBaseProdutos = 'ESTOQUE' then
            try
              claux.consulta.databasename := 'ESTOQUE';
              ClAux.Execute;
            except
            end;



          clAux.desconect;
          clAux.Free;
          RefrescaTabela;
          qCaixas.first;
          if (funcant<>-1) then
            while (qCaixas.fieldbyname('CX_FUNC').AsFloat<>funcant) do
              qCaixas.next
          else
            qCaixas.last;
          qCaixas.enablecontrols;
        end;
      end;
end;

procedure Tfrm_ExibeCaixas.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_DELETE) then
    botao3Click(Sender);
  if (key=K_ENTER) then
    if (botao1.enabled) then
      botao1Click(Sender);
end;

procedure Tfrm_ExibeCaixas.botao4Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookmark;
  pergunta: String;
begin
  if (qCaixas.active) then
    if (qCaixas.recordcount<>0) then
      if (botao4.caption='&Suspender') then //FUNCAO DE 'SUSPENDER'
      begin
        if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
          frmDialogo.ExibirMensagem ('Caixa ENCERRADO n�o pode ser suspenso!'
            ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) and
          (qCaixas.fieldbyname('CX_CAIX').AsFloat<>frm_principal.x_terminal) then
          frmDialogo.ExibirMensagem ('Caixa ABERTO em outro terminal! Imposs�vel sua SUSPENS�O!'
            ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
          frm_senhaCaixa.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;
          frm_senhaCaixa.showmodal;
          if (frm_senhaCaixa.y_flag) then
          begin
            book  := qCaixas.GetBookMark;
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('VENDAS',self);
            clAux.ClearSql;
            clAux.AddParam ('UPDATE CAIXAS                  ');
            clAux.AddParam ('SET    CX_STAT=:status,        ');
            clAux.AddParam ('       CX_SUSP=:hora           ');
            clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
            clAux.AddParam ('      (CX_DATA=:data) AND      ');
            clAux.AddParam ('      (CX_FUNC=:func)          ');
            clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
            clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
            clAux.consulta.parambyname('func').AsFloat     := qCaixas.fieldbyname('CX_FUNC').AsFloat;
            clAux.consulta.parambyname('status').AsString  := KST_CAIXA_SUSPENSO;
            clAux.consulta.parambyname('hora').AsString  := TimeToStr(Time);
            clAux.Execute; {*}
            if DataBaseProdutos = 'ESTOQUE' then
              try
                claux.consulta.databasename := 'ESTOQUE';
                ClAux.Execute;
              except
              end;

            clAux.desconect;
            clAux.Free;
            RefrescaTabela;
            qCaixas.GotoBookMark(book);
            qCaixas.FreeBookMark(book);
            if (frm_principal.x_caixa_ativo=qCaixas.fieldbyname('CX_FUNC').AsFloat) then
            begin
              frm_principal.x_caixa_ativo        := 0;
              frm_principal.pnCaixaAtiva.caption := ' Caixa: INDEFINIDO';
            end;
          end;
        end;
      end
      else
      if (botao4.caption='Rea&Brir') then //FUNCAO DE REABRIR UM CAIXA 'SUSPENSO'
      begin
        frm_senhaCaixa.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;
        frm_senhaCaixa.showmodal;
        if (frm_senhaCaixa.y_flag) then
        begin
          book  := qCaixas.GetBookMark;
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('UPDATE CAIXAS                  ');
          clAux.AddParam ('SET    CX_STAT=:status,        ');
          clAux.AddParam ('       CX_CAIX=:terminal,      ');
          clAux.AddParam ('       CX_RABR=:hora,          ');
          clAux.AddParam ('       CX_ENCE=:ence           ');
          clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
          clAux.AddParam ('      (CX_DATA=:data) AND      ');
          clAux.AddParam ('      (CX_FUNC=:func)          ');
          clAux.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
          clAux.consulta.parambyname('terminal').AsFloat  := frm_principal.x_terminal;
          clAux.consulta.parambyname('data').AsDateTime   := frm_principal.x_data_trabalho;
          clAux.consulta.parambyname('func').AsFloat      := qCaixas.fieldbyname('CX_FUNC').AsFloat;
          clAux.consulta.parambyname('status').AsString   := KST_CAIXA_ABERTO; //ABERTO
          clAux.consulta.parambyname('hora').AsString     := TimeToStr(Time); //ABERTO
          clAux.consulta.parambyname('ence').AsString     := '00:00:00';
          clAux.Execute; {*}
          if DataBaseProdutos = 'ESTOQUE' then
            try
              claux.consulta.databasename := 'ESTOQUE';
              ClAux.Execute;
            except
            end;

          clAux.desconect;
          clAux.Free;
          RefrescaTabela;
          qCaixas.GotoBookMark(book);
          qCaixas.FreeBookMark(book);
        end;
      end
      else
      if (botao4.caption='Rea&Brir!') then //FUNCAO DE REABRIR UM CAIXA 'ENCERRADO'
      begin
//{*}                 frm_senhaAdministrador.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;

        Application.CreateForm(Tfrm_SenhaAdministrador, frm_SenhaAdministrador);
        frm_SenhaAdministrador.showmodal;
        frm_SenhaAdministrador.Free;
        if (frm_SenhaAdministrador.y_flag) then
        begin
          book  := qCaixas.GetBookMark;
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('UPDATE CAIXAS                  ');
          clAux.AddParam ('SET    CX_STAT=:status,        ');
          clAux.AddParam ('       CX_CAIX=:terminal,      ');
          clAux.AddParam ('       CX_RABR=:reabrir,       ');
          clAux.AddParam ('       CX_ENCE=:encerra        ');
          clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
          clAux.AddParam ('      (CX_DATA=:data) AND      ');
          clAux.AddParam ('      (CX_FUNC=:func)          ');
          clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
          clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
          clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
          clAux.consulta.parambyname('func').AsFloat     := qCaixas.fieldbyname('CX_FUNC').AsFloat;
          clAux.consulta.parambyname('status').AsString  := KST_CAIXA_ABERTO; //ABERTO
          clAux.consulta.parambyname('reabrir').AsString  := TimeToStr(Time); 
          clAux.consulta.parambyname('encerra').AsString  := '';
          clAux.Execute; {*}
          if DataBaseProdutos = 'ESTOQUE' then
            try
              claux.consulta.databasename := 'ESTOQUE';
              ClAux.Execute;
            except
            end;

          clAux.desconect;
          clAux.Free;

                        //*********************************************************************
          Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
          frm_FechamentoCaixa.ExclueRegistroEncerramentoDoCaixa (qCaixas.fieldbyname('CX_FUNC').AsFloat); {*}
          if (frm_principal.x_online) then
            frm_FechamentoCaixa.ExclueRegistroEncerramentoDoCaixa_ONLINE (qCaixas.fieldbyname('CX_FUNC').AsFloat); {*}
          frm_FechamentoCaixa.Free;
                        //*********************************************************************

          RefrescaTabela;
          qCaixas.GotoBookMark(book);
          qCaixas.FreeBookMark(book);
        end;
      end;
end;

procedure Tfrm_ExibeCaixas.botao5Click(Sender: TObject);
var
  clAux: TClassAuxiliar;
  book: TBookmark;
  pergunta: String;
begin

  if (qCaixas.active) then
    if (qCaixas.recordcount<>0) then
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
        frmDialogo.ExibirMensagem ('Caixa j� ENCERRADO!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) and
        (qCaixas.fieldbyname('CX_CAIX').AsFloat<>frm_principal.x_terminal) then
        frmDialogo.ExibirMensagem ('Caixa ABERTO em outro terminal! Imposs�vel seu ENCERRAMENTO!'
          ,'Caixa',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      else
      begin
        frm_senhaCaixa.y_func := qCaixas.fieldbyname('CX_FUNC').AsFloat;
        frm_senhaCaixa.showmodal;
        if (frm_senhaCaixa.y_flag) then
        begin
                        {********************************************************}
          Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
          frm_FechamentoCaixa.rdTipo.itemindex            := 1; //OPCAO PARA 'ENCERRAMENTO' DO CAIXA
          frm_FechamentoCaixa.botaoEncerramento.visible   := true; {*}
          frm_FechamentoCaixa.rdTipo.enabled              := false;
          frm_FechamentoCaixa.lbGerenteSupervisor.caption := '';
          frm_FechamentoCaixa.lbCaixa.caption             := 'Caixa: '+trim(qCaixas.fieldbyname('cFUNC').AsString);
          frm_FechamentoCaixa.y_caixa_ativo               := qCaixas.fieldbyname('CX_FUNC').AsFloat;
          frm_FechamentoCaixa.lbltitulo.caption           := '[Encerramento do Caixa]';
          frm_FechamentoCaixa.lbltitulo_sombra.caption    := '[Encerramento do Caixa]';
          frm_FechamentoCaixa.showmodal;
          if (frm_FechamentoCaixa.tecla=13) then  //SOMENTE SE CONFIRMA O 'ENCERRAMENTO'
          begin
                            {********************************************************}
            book  := qCaixas.GetBookMark;
            clAux := TClassAuxiliar.Create;
            clAux.conect   ('VENDAS',self);
            clAux.ClearSql;
            clAux.AddParam ('UPDATE CAIXAS                  ');
            clAux.AddParam ('SET    CX_STAT=:status,        ');
            clAux.AddParam ('       CX_CAIX=:terminal,      ');
            clAux.AddParam ('       CX_ENCE=:hora           ');
            clAux.AddParam ('WHERE (CX_LOJA=:loja) AND      ');
            clAux.AddParam ('      (CX_DATA=:data) AND      ');
            clAux.AddParam ('      (CX_FUNC=:func)          ');
            clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
            clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
            clAux.consulta.parambyname('hora').AsString  := TimeToStr(Time);
            clAux.consulta.parambyname('data').AsDateTime  := frm_principal.x_data_trabalho;
            clAux.consulta.parambyname('func').AsFloat     := qCaixas.fieldbyname('CX_FUNC').AsFloat;
            clAux.consulta.parambyname('status').AsString  := KST_CAIXA_ENCERRADO;
            clAux.Execute; {*}

            if DataBaseProdutos = 'ESTOQUE' then
              try
                claux.consulta.databasename := 'ESTOQUE';
                ClAux.Execute;
              except
              end;

            clAux.desconect;
            clAux.Free;
                            {********************************************************}
            frm_FechamentoCaixa.GravaRegistroEncerramentoDoCaixa; {*}
            if (frm_principal.x_online) then
              frm_FechamentoCaixa.GravaRegistroEncerramentoDoCaixa_ONLINE; {*}
                            {********************************************************}
            RefrescaTabela;
            qCaixas.GotoBookMark(book);
            qCaixas.FreeBookMark(book);
                            {********************************************************}
          end;
          frm_FechamentoCaixa.Free;
        end;
      end;
end;

procedure Tfrm_ExibeCaixas.qCaixasAfterScroll(DataSet: TDataSet);
begin
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) then
  begin
    botao1.enabled:=true;
    botao4.caption:='&Suspender';
    botao4.enabled:=true;
    botao5.enabled:=true;
    botao3.enabled:=true;
    Suspender1.ShortCut:=ShortCut(Word('S'), [ssCtrl]);
  end
  else
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_SUSPENSO) then
  begin
    botao1.enabled:=false;
    botao4.caption:='Rea&Brir';
    botao4.enabled:=true;
    botao5.enabled:=true;
    botao3.enabled:=false;
    Suspender1.ShortCut:=ShortCut(Word('B'), [ssCtrl]);
  end
  else
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
  begin
    botao1.enabled:=false;
    botao4.caption:='Rea&Brir!';
    botao4.enabled:=true;
    botao5.enabled:=false;
    botao3.enabled:=false;
    Suspender1.ShortCut:=ShortCut(Word('B'), [ssCtrl]);
  end;
end;

procedure Tfrm_ExibeCaixas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     {****************************************************************************}
  if (frm_principal.x_caixa_ativo<>0) then
  begin
    if (VerificaSeTemCaixaAbertoHoje(frm_principal.x_caixa_ativo)) then
      frm_principal.pnCaixaAtiva.caption := ' Caixa: '+form_nz(frm_principal.x_caixa_ativo,6)+'/'+
        form_t(ProcuraNomeVend(frm_principal.x_loja,
        frm_principal.x_caixa_ativo,self),28)
    else
      frm_principal.pnCaixaAtiva.caption := ' Caixa: INDEFINIDO';
  end
  else
    frm_principal.pnCaixaAtiva.caption := ' Caixa: INDEFINIDO';
     {****************************************************************************}
end;

procedure Tfrm_ExibeCaixas.gradeDblClick(Sender: TObject);
begin
  if (botao1.enabled) then
    botao1Click(Sender);
end;

procedure Tfrm_ExibeCaixas.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade.focused) then
    grade.Canvas.Font.color:=clWhite
  else
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ABERTO) then
    grade.Canvas.Font.color:=clBlack
  else
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_ENCERRADO) then
    grade.Canvas.Font.color:=clBlue
  else
  if (qCaixas.fieldbyname('CX_STAT').AsString=KST_CAIXA_SUSPENSO) then
    grade.Canvas.Font.color:=clRed;
  grade.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_ExibeCaixas.Ativarcaixa1Click(Sender: TObject);
begin
  if (botao1.enabled) then
    botao1Click(Sender);
end;

procedure Tfrm_ExibeCaixas.Novo1Click(Sender: TObject);
begin
  if (botao2.enabled) then
    botao2Click(Sender);
end;

procedure Tfrm_ExibeCaixas.Excluir1Click(Sender: TObject);
begin
  if (botao3.enabled) then
    botao3Click(Sender);
end;

procedure Tfrm_ExibeCaixas.Suspender1Click(Sender: TObject);
begin
  if (botao4.enabled) then
    botao4Click(Sender);
end;

procedure Tfrm_ExibeCaixas.Encerrar1Click(Sender: TObject);
begin
  if (botao5.enabled) then
    botao5Click(Sender);
end;

procedure Tfrm_ExibeCaixas.Ajuda1Click(Sender: TObject);
begin
  ListaAtalhosF1.clear;
  ListaAtalhosF1.Add('  [F1]       - Ajuda ');
  ListaAtalhosF1.Add('  [CTRL + A] - Ativar caixa');
  ListaAtalhosF1.Add('  [CTRL + N] - Novo caixa');
  ListaAtalhosF1.Add('  [CTRL + E] - Excluir caixa');
  ListaAtalhosF1.Add('  [CTRL + S] - Suspender caixa');
  ListaAtalhosF1.Add('  [CTRL + R] - Encerrar caixa');
  ListaAtalhosF1.Add('  [ESC]      - SAIR');
  Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
  frm_AjudaComandos.showmodal;
  frm_AjudaComandos.Free;
end;

function Tfrm_ExibeCaixas.TemAlgumLancamento(caixa: Real):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   (databasecontas,self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT COUNT(*) as TOTAL FROM LANCAMENTOS_CAIXA   ');
  clAux.AddParam ('WHERE (LC_LOJA=:loja) AND                         ');
  clAux.AddParam ('      (LC_FUNC=:caixa_ativo) AND                  ');
  clAux.AddParam ('      (LC_DATA=:data)                             ');
  clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
  clAux.consulta.parambyname('caixa_ativo').AsFloat := caixa;
  clAux.consulta.parambyname('data').AsDateTime     := frm_principal.x_data_trabalho;
  clAux.Execute;
  if (clAux.result('TOTAL')=0) then
    result := false
  else
    result := true;
  clAux.desconect;
  clAux.Free;

     {....}
  if (not result) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databaseprodutos,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT COUNT(*) as TOTAL FROM VENDAS              ');
    clAux.AddParam ('WHERE (VE_LOJA=:loja) AND                         ');
    clAux.AddParam ('      (VE_FUNC=:caixa_ativo) AND                  ');
    clAux.AddParam ('      (VE_DATA=:data)                             ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    clAux.consulta.parambyname('caixa_ativo').AsFloat := caixa;
    clAux.consulta.parambyname('data').AsDateTime     := frm_principal.x_data_trabalho;
    clAux.Execute;
    if (clAux.result('TOTAL')=0) then
      result := false
    else
      result := true;
    clAux.desconect;
    clAux.Free;
  end;

     {....}
  if (not result) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT COUNT(*) as TOTAL FROM VALES_MERCADORIAS       ');
    clAux.AddParam ('WHERE (VA_LOJA=:loja) AND                             ');
    clAux.AddParam ('      (VA_FUNC=:caixa_ativo) AND                      ');
    clAux.AddParam ('      (VA_DATA=:data)                                 ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    clAux.consulta.parambyname('caixa_ativo').AsFloat := caixa;
    clAux.consulta.parambyname('data').AsDateTime     := frm_principal.x_data_trabalho;
    clAux.Execute;
    if (clAux.result('TOTAL')=0) then
      result := false
    else
      result := true;
    clAux.desconect;
    clAux.Free;
  end;

     {....}
  if (not result) then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecontas,self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT COUNT(*) as TOTAL FROM VALES_EMITIDOS      ');
    clAux.AddParam ('WHERE (VA_LOJA=:loja) AND                         ');
    clAux.AddParam ('      (VA_FUNC=:caixa_ativo) AND                  ');
    clAux.AddParam ('      (VA_DATA=:data)                             ');
    clAux.consulta.parambyname('loja').AsFloat        := frm_principal.x_loja;
    clAux.consulta.parambyname('caixa_ativo').AsFloat := caixa;
    clAux.consulta.parambyname('data').AsDateTime     := frm_principal.x_data_trabalho;
    clAux.Execute;
    if (clAux.result('TOTAL')=0) then
      result := false
    else
      result := true;
    clAux.desconect;
    clAux.Free;
  end;
end;

procedure Tfrm_ExibeCaixas.botao6MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao6.color := clWhite;
  botao6.font.color := clTeal;
end;

procedure Tfrm_ExibeCaixas.botao6Click(Sender: TObject);
begin
  frm_principal.x_caixa_ativo := 0; //caixa indefinido
  close;
end;

procedure Tfrm_ExibeCaixas.FormCreate(Sender: TObject);
begin
  Image2.picture := frm_principal.Image1.picture;
end;

procedure Tfrm_ExibeCaixas.botao7Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_CONF_CAIXA) then
  begin
    frm_senhaCaixa.showmodal;
    if (frm_senhaCaixa.y_flag) then
    begin
      Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
      frm_FechamentoCaixa.rdTipo.itemindex            := 0; //ABRE O FORM DE FECHAMENTO APENAS PARA 'CONFERENCIA'
      frm_FechamentoCaixa.botaoEncerramento.visible   := false; {*}
      frm_FechamentoCaixa.rdTipo.enabled              := false;
      frm_FechamentoCaixa.lbGerenteSupervisor.caption := ''; //sem supervisor
      frm_FechamentoCaixa.lbCaixa.caption             := 'Caixa: '+qCaixas.fieldbyname('cFUNC').AsString;
      frm_FechamentoCaixa.y_caixa_ativo               := qCaixas.fieldbyname('CX_FUNC').AsFloat;
      frm_FechamentoCaixa.lbltitulo.caption           := '[Confer�ncia do Caixa]';
      frm_FechamentoCaixa.lbltitulo_sombra.caption    := '[Confer�ncia do Caixa]';
      frm_FechamentoCaixa.showmodal; //para permitir o DENTRO / FORA
      frm_FechamentoCaixa.Free;
    end;
  end;
end;

procedure Tfrm_ExibeCaixas.botao7MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo;
  botao7.color := clWhite;
  botao7.font.color := clTeal;
end;

end.
