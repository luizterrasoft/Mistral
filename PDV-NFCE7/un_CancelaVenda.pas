unit un_CancelaVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  un_Auxformulario1, Menus, Mask, StdCtrls, ExtCtrls, Grids, DBGrids,
  Buttons, Db, DBTables, LabelOO, DBCtrls;

type
  Tfrm_CancelaVenda = class(Tfrm_Auxformulario1)
    Panel1: TPanel;
    grade1: TDBGrid;
    ds1: TDataSource;
    Panel2: TPanel;
    pnLocal1: TPanel;
    Label1: TLabel;
    edtVend: TMaskEdit;
    Label54: TLabel;
    Bevel8: TBevel;
    Label56: TLabel;
    Label55: TLabel;
    lbtipz: TLabel;
    Label7: TLabel;
    edtLoja3: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    botao2: TPanel;
    Label8: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Label20: TLabel;
    Label21: TLabel;
    Botao4: TPanel;
    pnLocal2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtLoja2: TMaskEdit;
    botao3: TPanel;
    edtTerminal: TMaskEdit;
    edtDocumento: TMaskEdit;
    Label6: TLabel;
    Panel5: TPanel;
    DBText1: TDBText;
    procedure edtVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmaskeditformulario1Exit(Sender: TObject);
    procedure edtmaskeditformulario1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Limparformulrio1Click(Sender: TObject);
    procedure edtmaskeditformulario1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grade1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grade1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLoja3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Botao4Click(Sender: TObject);
    procedure edtTerminalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botao3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo: Integer; {0-> CANCELAMENTO DE VENDA, 1-> TROCA DE VENDEDOR DA VENDA}
    tabela1: TQuery;
    tabela2: TQuery;
    tabela3: TQuery;
    n_ordem_f7: Integer;
    tipz: String;
    ativou: Boolean;
    procedure MudaFocoConsulta;
  end;

var
  frm_CancelaVenda: Tfrm_CancelaVenda;

implementation

{$R *.DFM}

uses principal, funcoes1,funcoes2, procura, DM5, un_VerDadosPgto, auxiliar,
  unDialogo, DM4, Venda, F8Lojas, DM6, un_ALERTA, un_senhaSupervisor,
  un_BotoesECF, un_TrocaVendedorNaVenda, un_FrmCancInutNFE;

procedure Tfrm_CancelaVenda.edtVendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao2Click(Sender);
  if (key=K_F8) then
    ChamandoF8Vend(frm_principal.x_loja,edtVend);
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_CancelaVenda.edtmaskeditformulario1Exit(Sender: TObject);
var
  loja,codigo: String;
begin
  inherited;
  {************************}
  lbF8.visible:=false;
  lbF8Mens.visible:=false;
  codigo := Trim(TMaskEdit(sender).text);
  if (codigo<>'') then
    if (TMaskEdit(sender).tag=0) then //VENDEDOR
    begin
      loja:=trim(edtLoja3.text);
      TMaskEdit(sender).text := form_nz(strtofloat(codigo),6);
    end
    else
    if (TMaskEdit(sender).tag=1) then
      TMaskEdit(sender).text := form_nz(strtofloat(codigo),2);
end;

procedure Tfrm_CancelaVenda.edtmaskeditformulario1DblClick(
  Sender: TObject);
begin
  inherited;
  {************************}
  if (TMaskEdit(sender).tag=0) then
  begin
    if (TMaskEdit(sender).name='edtVend') then
      ChamandoF8Vend(frm_principal.x_loja,edtVend);
  end
  else
  if (TMaskEdit(sender).tag=1) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=TMaskEdit(sender);
      showmodal;
    end;
end;

procedure Tfrm_CancelaVenda.FormCreate(Sender: TObject);
begin
  tipz := '1';
  lbtipz.caption:='Sr.: '+tipz;
  tabela1 := DMVendas.qVendas;
  tabela2 := DMVendas.qFormas;
  tabela3 := DMVendas.qItensVenda;
  ds1.dataset := tabela1;
end;

procedure Tfrm_CancelaVenda.FormActivate(Sender: TObject);
begin
  if (not ativou) then
  begin
    height := 600;
    if (Modo=0) then //CANCELAMENTO
    begin
      Label12.caption := '[Cancelamento de Venda - Vendas do Dia: '+form_data(frm_principal.x_data_trabalho)+']';
      Label8.caption  := '[Cancelamento de Venda - Vendas do Dia: '+form_data(frm_principal.x_data_trabalho)+']';

      Botao4.caption  := 'Cancelar Venda selecionada - CTRL+DEL';

      Label21.caption := '-> Cancela venda';

      n_ordem_f7 := 1;
      pnLocal1.visible:=true;
    end
    else
    if (Modo=1) then //TROCA NA VENDA
    begin
      Label12.caption := '[Troca de Vendedor - Vendas do Dia: '+form_data(frm_principal.x_data_trabalho)+']';
      Label8.caption  := '[Troca de Vendedor - Vendas do Dia: '+form_data(frm_principal.x_data_trabalho)+']';

      Botao4.caption  := 'Trocar vendedor - CTRL+DEL';

      Label21.caption := '-> troca vendedor';

      n_ordem_f7 := 1;
      pnLocal1.visible:=true;
    end;
    ativou:=true;
  end;
  grade1.cursor:=crDefault;
  if (pnLocal1.visible) then
    edtVend.setfocus
  else
  if (pnLocal2.visible) then
    edtTerminal.setfocus;
end;

procedure Tfrm_CancelaVenda.Limparformulrio1Click(Sender: TObject);
begin
  edtVend.text       := '';
  edtTerminal.text   := '';
  edtDocumento.text  := '';
  ds1.dataset.close;
  if (pnLocal1.visible) then
    edtVend.setfocus
  else
  if (pnLocal2.visible) then
    edtTerminal.setfocus;
end;

procedure Tfrm_CancelaVenda.MudaFocoConsulta;
begin
  pnLocal1.visible:=false;
  pnLocal2.visible:=false;
  n_ordem_f7:=n_ordem_f7+1;
  if (n_ordem_f7=3) then
    n_ordem_f7:=1;
  if (n_ordem_f7=1) then
  begin
    pnLocal1.visible:=true;
    edtVend.setfocus;
  end
  else
  if (n_ordem_f7=2) then
  begin
    pnLocal2.visible:=true;
    edtTerminal.setfocus;
  end;
end;

procedure Tfrm_CancelaVenda.edtmaskeditformulario1Enter(Sender: TObject);
begin
  inherited;
     {******************}
  if (TMaskEdit(sender).tag=1) then
  begin
    lbF8.visible:=true;
    lbF8Mens.caption:='exibe lojas cadastradas';
    lbF8Mens.visible:=true;
  end
  else
  if (TMaskEdit(sender).tag=0) then
  begin
    lbF8.visible:=true;
    lbF8Mens.caption:='Exibir vendedores cadastrados';
    lbF8Mens.visible:=true;
  end;
end;

procedure Tfrm_CancelaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
     {*****************************************8}
  if (shift=[ssShift, ssAlt]) then
    if (key=K_INSERT) then
    begin
      if (tipz='1') then
      begin
        tipz:='2';
        lbtipz.visible:=true;
      end
      else
      if (tipz='2') then
      begin
        tipz:='3';
        lbtipz.visible:=true;
      end
      else
      begin
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.: '+tipz;
      if (ds1.dataset.active) then
        if (pnLocal1.visible) then
          botao2Click(Sender)
        else
        if (pnLocal2.visible) then
          botao3Click(Sender);
    end;
end;

procedure Tfrm_CancelaVenda.grade1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (state=[gdSelected]) and (grade1.focused) then
    grade1.Canvas.Font.color:=clWhite
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='0') then {venda SEM pagamento}
    grade1.Canvas.Font.color:=clBlue
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='1') then {venda COM pagamento}
    grade1.Canvas.Font.color:=clNavy
  else
  if (tabela1.fieldbyname('VE_STAT').AsString='2') then {venda CANCELADA}
    grade1.Canvas.Font.color:=clRed;
  grade1.DefaultDrawDataCell(Rect,Column.Field,State);
end;

procedure Tfrm_CancelaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tabela1.close;
  tabela2.close;
  tabela3.close;
end;

procedure Tfrm_CancelaVenda.grade1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_F2) then
    if (pnLocal1.visible) then
      edtVend.setfocus
    else
    if (pnLocal2.visible) then
      edtTerminal.setfocus;
  if (key=K_DELETE) and (Shift=[ssCtrl]) then
    N1.click;
end;

procedure Tfrm_CancelaVenda.edtLoja3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtVend.setfocus;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_CIMA) then
  ;
  if (key=K_F8) then
    with (frm_f8Lojas) do
    begin
      left:=287;
      top :=76;
      edit:=TMaskEdit(sender);
      showmodal;
    end;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_CancelaVenda.botao2Click(Sender: TObject);
var
  data,codigo: String;
begin
  codigo := Trim(edtVend.text);
  tabela1.close;
  tabela1.sql.clear;
  tabela1.sql.Add ('SELECT VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,VE_QTDE,                ');
  tabela1.sql.Add ('       VE_TOTA,VE_TIPZ,VE_STAT,VE_DESC,VE_PDES,                ');
  tabela1.sql.Add ('       VE_VEND,VE_NOTA,VE_QTD1,VE_QTD2,VE_ONLI,                ');
  tabela1.sql.Add ('       VE_ENVI,VE_CUPO,VE_ECF,VE_FUNC,VE_HORA                  ');
  tabela1.sql.Add ('FROM VENDAS                                                    ');
  tabela1.sql.Add ('WHERE (VE_DATA=:data) AND                                      ');
  tabela1.sql.Add ('      (VE_LOJA=:loja)                                          ');
  if (codigo<>'') then
    tabela1.sql.Add (' AND (VE_VEND='+codigo+')                                   ');
  if (frm_principal.x_caixa_ativo<>0) then
    tabela1.sql.Add (' AND (VE_FUNC='+floattostr(frm_principal.x_caixa_ativo)+')  ');
  if (tipz='1') or (tipz='2') then
    tabela1.sql.Add('  AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                     ');
  tabela1.sql.Add ('ORDER BY VE_DATA,VE_CAIX,VE_LOJA,VE_CODI                       ');
  tabela1.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
  tabela1.parambyname('loja').AsFloat    := frm_principal.x_loja;
  tabela1.open;
  tabela1.last;
  grade1.setfocus;
end;

procedure Tfrm_CancelaVenda.N1Click(Sender: TObject);
var
  clAux,clAux2,clAux3,clAux4,clAux5: TClassAuxiliar;
  codigo_loja,codigo_caixa: Real;
  ponto: TBookmark;
  codigo_venda: Real;
  mensagemadicional: String;
  continua: Boolean;
  novovendedor: Real;
  vendedoranterior: Real;
  terminalAnt: Real;
  codigoAnt: Real;
//*************
  loja,venda,caixa: Real;
  codigo_cliente,codigo_contrato: Real;
  cancelouMulti: Boolean;
  doc1,doc2,doc3: Real;
  cliente,contrato,qtdeBoleta: Real;
  notaCancelando: Real;
//*************
begin
  codigo_loja    := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
  codigo_caixa   := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
  codigo_venda   := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
  notaCancelando := ds1.DataSet.fieldbyname('VE_NOTA').AsFloat;


  if (Modo=0) then //CANCELAMENTO
  begin
    if (ds1.dataset.fieldbyname('VE_STAT').AsString='0') or
      (ds1.dataset.fieldbyname('VE_STAT').AsString='1') then
    begin
            {CRITICA}
      if (not frm_principal.x_permitir_cancelar_venda_com_cupom) then
      begin
        if (ds1.dataset.fieldbyname('VE_CUPO').AsFloat<>0) then //VENDA COM CUPOM 'C'
        begin
                     {*******************************************************************************}
          frm_ALERTA.Memo1.lines.clear;
          frm_ALERTA.Memo1.lines.Add('ATEN��O: O cancelamento desta venda somente    ');
          frm_ALERTA.Memo1.lines.Add('         pode ser efetuada pelos COMANDOS ECF! ');
          frm_ALERTA.Memo1.lines.Add('         (e somente a venda do �ltimo cupom)   ');
          frm_ALERTA.showmodal;
                     {*******************************************************************************}
          continua := false;
        end
        else
          continua := true;
      end
      else
        continua := true;

            {...}
      if (continua) then
      begin

        clAux := TClassAuxiliar.Create;
        clAux.conect   ('VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('INSERT INTO AUDITORIA_TROCA_VENDEDOR(AV_LOJA,AV_CAIX,AV_VEND,AV_FUNC,AV_VENA,AV_NVEN,AV_TIPZ,AV_DATA) ');
        clAux.AddParam ('VALUES (:AV_LOJA,:AV_CAIX,:AV_VEND,:AV_FUNC,:AV_VENA,:AV_NVEN,:AV_TIPZ,:AV_DATA) ');
        clAux.consulta.parambyname('AV_LOJA').AsFloat    := frm_principal.x_loja;
        clAux.consulta.parambyname('AV_CAIX').AsFloat    := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('AV_VEND').AsFloat    := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.consulta.parambyname('AV_FUNC').AsFloat    := frm_principal.x_caixa_ativo;
        clAux.consulta.parambyname('AV_TIPZ').AsString   := ds1.dataset.fieldbyname('VE_TIPZ').AsString;
        clAux.consulta.parambyname('AV_DATA').AsDateTime := frm_principal.x_data_trabalho;
        clAux.consulta.parambyname('AV_VENA').AsFloat    := vendedoranterior;
        clAux.consulta.parambyname('AV_NVEN').AsFloat    := novovendedor; {*}
        clAux.Execute; {*}
        if databaseprodutos = 'ESTOQUE' then
          try
            claux.consulta.databasename := 'ESTOQUE';
            claux.Execute;
          except
          end;

        clAux.desconect;
        clAux.Free;

        if (frmDialogo.ExibirMensagem ('Confirma cancelamento da venda? '+mensagemadicional
          ,'Vendas',[mbYes,mbNo],frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
        begin
                     //*** 03-02-2010 *** Rodrigo Cordeiro **************************
                     //*** Consulta o c�digo do cliente e o seu contrato ************
                     //*** OBS: Criado para a situa��o de multiboleta ***************
          clAux2 := TClassAuxiliar.Create;
          clAux2.Conect(DataBaseProdutos,self);
          clAux2.ClearSql;
          clAux2.AddParam('SELECT CR_CLIE,CR_CONT      ');
          clAux2.AddParam('FROM CREDIARIOS             ');
          clAux2.AddParam('WHERE (CR_LOJA=:loja) AND   ');
          clAux2.AddParam('      (CR_CAIX=:caixa) AND  ');
          clAux2.AddParam('      (CR_VEND=:venda)      ');
          clAux2.consulta.ParamByName('loja').AsFloat  := codigo_loja;
          clAux2.consulta.ParamByName('caixa').AsFloat := codigo_caixa;
          clAux2.consulta.ParamByName('venda').AsFloat := codigo_venda;
          if (clAux2.Execute) then
          begin
            cliente  := clAux2.Result('CR_CLIE');
            contrato := clAux2.Result('CR_CONT');
          end;
                     //Efetuando o cancelamento
                     {*******************************************************************************}
                     //************************************************************
          clAux2.Desconect;
          clAux2.Conect(DataBaseProdutos,self);
          clAux2.ClearSql;
          clAux2.AddParam('SELECT *                      ');
          clAux2.AddParam('FROM CREDIARIOS               ');
          clAux2.AddParam('WHERE (CR_LOJA=:loja) AND     ');
          clAux2.AddParam('      (CR_CLIE=:cliente) AND  ');
          clAux2.AddParam('      (CR_CONT=:contrato)     ');
          clAux2.AddParam('ORDER BY CR_VEND              ');
          clAux2.consulta.ParamByName('loja').AsFloat     := codigo_loja;
          clAux2.consulta.ParamByName('cliente').AsFloat  := cliente;
          clAux2.consulta.ParamByName('contrato').AsFloat := contrato;
          if (clAux2.Execute) then
          begin
            if (clAux2.Result('CR_VEND') = 0) then
              clAux2.Next;
            if (clAux2.Result('CR_VEND') = 0) then
              clAux2.Next
            else
            if (not Excluicrediario(codigo_loja,clAux2.Result('CR_CAIX'),clAux2.Result('CR_VEND'))) then
              exit;
            clAux2.First;
            doc3 := 0;
            if (clAux2.RecCount > 1) then
            begin
              if (codigo_venda = clAux2.Result('CR_VEND')) then
              begin
                clAux2.Next;
                doc2 := clAux2.Result('CR_CODI');
              end
              else
              if (clAux2.Result('CR_VEND') <> 0) then
                doc2 := clAux2.Result('CR_CODI');
              clAux2.Next;
              if (not clAux2.Eof) and (codigo_venda <> clAux2.Result('CR_VEND')) and (clAux2.Result('CR_VEND') <> 0) then
                doc3 := clAux2.Result('CR_CODI')
              else
              begin
                clAux2.Next;
                if (not clAux2.Eof) and (clAux2.Result('CR_VEND') <> 0) then
                  doc3 := clAux2.Result('CR_CODI');
              end;
              clAux2.First;
              while (not clAux2.Eof) do
              begin
                if (clAux2.Result('CR_VEND') <> 0) then
                begin
                  loja  := clAux2.Result('CR_LOJA');
                  venda := clAux2.Result('CR_VEND');
                  caixa := clAux2.Result('CR_CAIX');
                  CancelaVenda(loja,caixa,venda);
                end;
                clAux2.Next;
              end;
              cancelouMulti := true;
            end
            else
              cancelouMulti := false;
                           //***********************************
            clAux2.First;
            clAux3 := TClassAuxiliar.Create;
            clAux3.Conect(DataBaseProdutos,self);
            clAux3.ClearSql;
            clAux3.AddParam('DELETE FROM CREDIARIOS       ');
            clAux3.AddParam('WHERE (CR_LOJA=:loja) AND    ');
            clAux3.AddParam('      (CR_CLIE=:cliente) AND ');
            clAux3.AddParam('      (CR_CONT=:contrato)    ');
            clAux3.consulta.ParamByName('loja').AsFloat     := codigo_loja;
            clAux3.consulta.ParamByName('cliente').AsFloat  := clAux2.Result('CR_CLIE');
            clAux3.consulta.ParamByName('contrato').AsFloat := clAux2.Result('CR_CONT');
            clAux3.Execute;
            clAux3.Desconect;
            clAux3.Free;
          end;
          clAux2.Desconect;
          clAux2.Free;
                     //************************************************************
          ds1.dataset.disablecontrols;
          codigo_loja  := ds1.dataset.fieldbyname('VE_LOJA').AsFloat;
          codigo_caixa := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
          codigo_venda := ds1.dataset.fieldbyname('VE_CODI').AsFloat;

          frm_CancInutNFE.ShowModal;
          If frm_CancInutNFE.Cancelamento_Sucesso then
             Begin
                frm_principal.barraDicas.caption:='Cancelando venda!';
                frm_principal.barraDicas.refresh;
                if (not cancelouMulti) then
                  CancelaVenda(codigo_loja,codigo_caixa,codigo_venda);
            end;
          frm_principal.barraDicas.caption:='';
          frm_principal.barraDicas.refresh;
          ponto := ds1.dataset.GetBookmark;
          ds1.dataset.close;
          ds1.dataset.open;
          ds1.dataset.GotoBookmark(ponto);
          ds1.dataset.enablecontrols;
          ds1.dataset.FreeBookmark(ponto);
                     {*******************************************************************************}
          if (cancelouMulti) then
            if (doc3 <> 0) then
              frmDialogo.ExibirMensagem ('Tamb�m foram canceladas as vendas '+floattostr(doc2)+' e '+floattostr(doc3)+' pois pertencem a um contrato multiboleta!',
                'Cancelamento de Venda',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
                250,200)
            else
              frmDialogo.ExibirMensagem ('Tamb�m foi cancelada a venda '+floattostr(doc2)+' pois pertence a um contrato multiboleta!',
                'Cancelamento de Venda',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp',
                250,200);
        end;
      end;
    end;
  end
  else
  if (Modo=1) then //TROCA DE VENDEDOR
    if (ds1.dataset.fieldbyname('VE_VEND').AsFloat=0) then
      ExibeCritica ('Venda possui mais de um vendedor relacionado!','Troca de vendedor',nil)
    else
    if (ds1.dataset.fieldbyname('VE_FUNC').AsFloat<>frm_principal.x_caixa_ativo) then
      ExibeCritica ('A Venda selecionada n�o foi lan�ada pelo OPERADOR DE CAIXA ativo no momento!','Troca de vendedor',nil)
    else
    begin
      Application.CreateForm(Tfrm_TrocaVendedorNaVenda, frm_TrocaVendedorNaVenda);
      frm_TrocaVendedorNaVenda.tecla:=27;
      frm_TrocaVendedorNaVenda.pnVend.caption := form_nz(ds1.dataset.fieldbyname('VE_VEND').AsFloat,6)+'/'+
        ProcuraNomeVend(frm_principal.x_loja,ds1.dataset.fieldbyname('VE_VEND').AsFloat,self);
      frm_TrocaVendedorNaVenda.showmodal;
      if (frm_TrocaVendedorNaVenda.tecla=13) then
      begin
        ds1.dataset.next;
        if (not ds1.dataset.eof) then
        begin
          terminalAnt := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
          codigoAnt   := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
          ds1.dataset.prior;
        end
        else
        begin
          terminalAnt := -1;
          codigoAnt   := -1;
        end;

        novovendedor     := strtofloat(trim(frm_TrocaVendedorNaVenda.edtNovoVendedor.text));
        vendedoranterior := ds1.dataset.fieldbyname('VE_VEND').AsFloat;

                 //*****************************************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('INSERT INTO AUDITORIA_TROCA_VENDEDOR(AV_LOJA,AV_CAIX,AV_VEND,AV_FUNC,AV_VENA,AV_NVEN,AV_TIPZ,AV_DATA) ');
        clAux.AddParam ('VALUES (:AV_LOJA,:AV_CAIX,:AV_VEND,:AV_FUNC,:AV_VENA,:AV_NVEN,:AV_TIPZ,:AV_DATA) ');
        clAux.consulta.parambyname('AV_LOJA').AsFloat    := frm_principal.x_loja;
        clAux.consulta.parambyname('AV_CAIX').AsFloat    := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('AV_VEND').AsFloat    := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.consulta.parambyname('AV_FUNC').AsFloat    := frm_principal.x_caixa_ativo;
        clAux.consulta.parambyname('AV_TIPZ').AsString   := ds1.dataset.fieldbyname('VE_TIPZ').AsString;
        clAux.consulta.parambyname('AV_DATA').AsDateTime := frm_principal.x_data_trabalho;
        clAux.consulta.parambyname('AV_VENA').AsFloat    := vendedoranterior;
        clAux.consulta.parambyname('AV_NVEN').AsFloat    := novovendedor; {*}
        clAux.Execute; {*}

        if databaseprodutos = 'ESTOQUE' then
          try
            claux.consulta.databasename := 'ESTOQUE';
            claux.Execute;
          except
          end;
        clAux.desconect;
        clAux.Free;

                 //*****************************************************************
                 //so muda aqui se tiver apenas um VENDEDOR
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE VENDAS                                                                 ');
        clAux.AddParam ('SET    VE_VEND=:novovendedor                                                  ');
        clAux.AddParam ('WHERE (VE_LOJA=:loja) AND (VE_CAIX=:terminal) AND (VE_CODI=:numerovenda)      ');
        clAux.consulta.parambyname('loja').AsFloat         := frm_principal.x_loja;
        clAux.consulta.parambyname('terminal').AsFloat     := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('numerovenda').AsFloat  := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.consulta.parambyname('novovendedor').AsFloat := novovendedor;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

                 //*****************************************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE VENDAS_ATENDIMENTO                                                     ');
        clAux.AddParam ('SET    VA_VEDE=:novovendedor                                                  ');
        clAux.AddParam ('WHERE (VA_LOJA=:loja) AND (VA_CAIX=:terminal) AND (VA_VEND=:numerovenda) AND  ');
        clAux.AddParam ('      (VA_VEDE=:vendedoranterior)                                             ');
        clAux.consulta.parambyname('loja').AsFloat             := frm_principal.x_loja;
        clAux.consulta.parambyname('terminal').AsFloat         := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('numerovenda').AsFloat      := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.consulta.parambyname('novovendedor').AsFloat     := novovendedor;
        clAux.consulta.parambyname('vendedoranterior').AsFloat := vendedoranterior;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

                 //*****************************************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   (databaseprodutos,self);
        clAux.ClearSql;
        clAux.AddParam ('UPDATE ITENS_VENDAS                                                           ');
        clAux.AddParam ('SET    IV_VEDE=:novovendedor                                                  ');
        clAux.AddParam ('WHERE (IV_LOJA=:loja) AND (IV_CAIX=:terminal) AND (IV_VEND=:numerovenda) AND  ');
        clAux.AddParam ('      (IV_VEDE=:vendedoranterior)                                             ');
        clAux.consulta.parambyname('loja').AsFloat             := frm_principal.x_loja;
        clAux.consulta.parambyname('terminal').AsFloat         := ds1.dataset.fieldbyname('VE_CAIX').AsFloat;
        clAux.consulta.parambyname('numerovenda').AsFloat      := ds1.dataset.fieldbyname('VE_CODI').AsFloat;
        clAux.consulta.parambyname('novovendedor').AsFloat     := novovendedor;
        clAux.consulta.parambyname('vendedoranterior').AsFloat := vendedoranterior;
        clAux.Execute; {*}
        clAux.desconect;
        clAux.Free;

                 {...}
        ds1.dataset.close;
        ds1.dataset.open;
        ds1.dataset.first;
        if (terminalAnt<>-1) and (codigoAnt<>-1) then
          while (not ds1.dataset.eof) do
          begin
            if (terminalAnt = ds1.dataset.fieldbyname('VE_CAIX').AsFloat) and
              (codigoAnt   = ds1.dataset.fieldbyname('VE_CODI').AsFloat) then
              break;
            ds1.dataset.next;
          end;
      end;
      frm_TrocaVendedorNaVenda.Free;
    end//CRITICAS
  ;
end;

procedure Tfrm_CancelaVenda.Botao4Click(Sender: TObject);
begin
  N1.click;
end;

procedure Tfrm_CancelaVenda.edtTerminalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) or (key=K_BAIXO) then
    edtDocumento.setfocus;
  if (key=K_CIMA) then
  ;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_CancelaVenda.edtDocumentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key=K_ENTER) then
    botao3Click(Sender);
  if (key=K_CIMA) then
    edtTerminal.setfocus;
  if (key=K_F7) then
    MudaFocoConsulta;
  if (key=K_F2) then
    grade1.setfocus;
end;

procedure Tfrm_CancelaVenda.botao3Click(Sender: TObject);
var
  terminal,documento: String;
begin
  terminal  := Trim(edtTerminal.text);
  documento := Trim(edtDocumento.text);
  tabela1.close;
  tabela1.sql.clear;
  tabela1.sql.Add ('SELECT VE_CAIX,VE_LOJA,VE_CODI,VE_DATA,VE_QTDE,                ');
  tabela1.sql.Add ('       VE_TOTA,VE_TIPZ,VE_STAT,VE_DESC,VE_PDES,                ');
  tabela1.sql.Add ('       VE_VEND,VE_NOTA,VE_QTD1,VE_QTD2,VE_ONLI,                ');
  tabela1.sql.Add ('       VE_ENVI,VE_CUPO,VE_ECF,VE_FUNC,VE_HORA                  ');
  tabela1.sql.Add ('FROM VENDAS                                                    ');
  tabela1.sql.Add ('WHERE (VE_DATA=:data) AND                                      ');
  tabela1.sql.Add ('      (VE_LOJA=:loja)                                          ');
  if (terminal<>'') then
    tabela1.sql.Add (' AND (VE_CAIX='+terminal+')                                 ');
  if (documento<>'') then
    tabela1.sql.Add (' AND (VE_NOTA='+chr(39)+documento+chr(39)+')                ');
  if (frm_principal.x_caixa_ativo<>0) then
    tabela1.sql.Add (' AND (VE_FUNC='+floattostr(frm_principal.x_caixa_ativo)+')  ');
  if (tipz='1') or (tipz='2') then
    tabela1.sql.Add('  AND (VE_TIPZ='+chr(39)+tipz+chr(39)+')                     ');
  tabela1.sql.Add ('ORDER BY VE_DATA,VE_CAIX,VE_LOJA,VE_CODI                       ');
  tabela1.parambyname('data').AsDateTime := frm_principal.x_data_trabalho;
  tabela1.parambyname('loja').AsFloat    := frm_principal.x_loja;
  tabela1.open;
  tabela1.last;
  grade1.setfocus;
end;

end.
