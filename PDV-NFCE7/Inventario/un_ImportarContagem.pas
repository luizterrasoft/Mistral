unit un_ImportarContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, BotaoSair, PanelOO, StdCtrls, LabelOO, Buttons;

type
  Tfrm_ImportarContagem = class(TForm)
    BotaoSair1: TBotaoSair;
    LabelOO1: TLabelOO;
    OpenDialog1: TOpenDialog;
    btnProcurarWord: TSpeedButton;
    botao1: TPanel;
    Bevel1: TBevel;
    lbtipz: TLabel;
    chLimpar: TCheckBox;
    LabelOO2: TLabelOO;
    PanelOO1: TPanelOO;
    pnArquivo: TPanelOO;
    procedure BotaoSair1Click(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure btnProcurarWordClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipz: String;
    function InformaProximaSequenciaLote:Integer;
  end;

var
  frm_ImportarContagem: Tfrm_ImportarContagem;

implementation

uses unMensagem, un_inventario1, principal, auxiliar, funcoes1, funcoes2, venda,
  unDialogo;

{$R *.DFM}

procedure Tfrm_ImportarContagem.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_ImportarContagem.botao1Click(Sender: TObject);
var
  arq: textfile;
  clAux,clAux2,clAux3: TClassAuxiliar;
  linha,codigo_barras: String;
  quantidade: Real;
  quantidade_ja_existente: Real;
  indGauge,totGauge,totallinha: Integer;
  sequencia: Integer;
begin
  if (trim(pnArquivo.caption)<>'') then
    if (not FileExists(trim(pnArquivo.caption))) then
      frmDialogo.ExibirMensagem ('Arquivo não existe! Selecione outro arquivo...'
        ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
    else
    begin
      frmDialogo.posativ:=1;
      if (frmDialogo.ExibirMensagem ('Confirmar importação?'
        ,'Inventário',[mbYes,mbNo]
        ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      begin
                  //***************************************************
        if (chLimpar.checked) then
        begin
          clAux := TClassAuxiliar.Create;
          clAux.conect   ('VENDAS',self);
          clAux.ClearSql;
          clAux.AddParam ('DELETE FROM LOTE_INVENTARIO                  ');
          clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)  ');
          clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
          clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
          clAux.Execute; {*}
          clAux.desconect;
          clAux.Free;
        end;
                  //***************************************************

        try
          AssignFile (arq,trim(pnArquivo.caption));
          mostra_mensagem ('Importando contagem...Aguarde!');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;
          totallinha:=0;
          Reset      (arq);
          while (not Eof(arq)) do
          begin
            ReadLn(arq,linha);
            totallinha:=totallinha+1;
          end;
          Reset      (arq);
          indGauge:=0;
          totGauge:=totallinha;
          while (not Eof(arq)) do
          begin
            ReadLn(arq,linha);

                          //******************************************************
            codigo_barras := Copy(linha,1,Pos(';',linha)-1);
            delete(linha,1,Pos(';',linha));
            quantidade    := strtofloat(trim(linha));

                          //******************************************************
            clAux := TClassAuxiliar.Create;
            clAux.conect    (databaseprodutos,self);
            clAux.ClearSql;
            clAux.AddParam  ('SELECT ES_GRUP,ES_SUBG,ES_PROD,ES_CORE,ES_TAMA,        ');
            clAux.AddParam  ('       PR_DESC,PR_REFI,PR_FORN,PR_REFF,PR_UNID         ');
            clAux.AddParam  ('FROM   ESTOQUE,PRODUTOS                                ');
            clAux.AddParam  ('WHERE (ES_CBAR='+chr(39)+codigo_barras+chr(39)+') AND  ');
            clAux.AddParam  ('      (ES_GRUP=PR_GRUP) AND (ES_SUBG=PR_SUBG) AND (ES_PROD=PR_CODI) ');
            if (not clAux.Execute) then
            begin
              sequencia := InformaProximaSequenciaLote; {*}

                              //se produto nao existe - se CODIGO DE BARRAS NAO FOR ENCONTRADO
                              //*******************************************************************************
              clAux3 := TClassAuxiliar.Create;
              clAux3.conect   ('VENDAS',self);
              clAux3.ClearSql;
              clAux3.AddParam ('INSERT INTO LOTE_INVENTARIO(LOJA,TERMINAL,GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO,SALDO,TIPZ,DATA,SEQ,CBARRA,DESCRICAO,REFINT,FORN,REFFAB,UNID)  ');
              clAux3.AddParam ('VALUES (:LOJA,:TERMINAL,:GRUPO,:SUBGRUPO,:PRODUTO,:COR,:TAMANHO,:SALDO,:TIPZ,:DATA,:SEQ,:CBARRA,:DESCRICAO,:REFINT,:FORN,:REFFAB,:UNID)     ');
              clAux3.consulta.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
              clAux3.consulta.parambyname('TERMINAL').AsFloat   := frm_principal.x_terminal;
              clAux3.consulta.parambyname('GRUPO').AsFloat      := -1;
              clAux3.consulta.parambyname('SUBGRUPO').AsFloat   := -1;
              clAux3.consulta.parambyname('PRODUTO').AsFloat    := -1;
              clAux3.consulta.parambyname('COR').AsFloat        := -1;
              clAux3.consulta.parambyname('TAMANHO').AsString   := '-1';
              clAux3.consulta.parambyname('TIPZ').AsString      := tipz;
              clAux3.consulta.parambyname('DATA').AsDateTime    := frm_principal.x_data_trabalho;
              clAux3.consulta.parambyname('CBARRA').AsString    := codigo_barras;
              clAux3.consulta.parambyname('SEQ').AsInteger      := sequencia;
              clAux3.consulta.parambyname('SALDO').AsFloat      := quantidade;
              clAux3.consulta.parambyname('DESCRICAO').AsString := '?';
              clAux3.consulta.parambyname('REFINT').AsString    := '?';
              clAux3.consulta.parambyname('REFFAB').AsString    := '?';
              clAux3.consulta.parambyname('FORN').AsFloat       := -1;
              clAux3.consulta.parambyname('UNID').AsString      := '?';
              clAux3.Execute;
              clAux3.desconect;
              clAux3.Free;
                              //*******************************************************************************
            end
            else
            begin
              esconde_mensagem;
                              {********************************************************************************************}

              clAux2 := TClassAuxiliar.Create;
              clAux2.conect   ('VENDAS',self);
              clAux2.ClearSql;
              clAux2.AddParam ('SELECT DATA FROM LOTE_INVENTARIO                 ');
              clAux2.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal) AND  ');
              clAux2.AddParam ('      (CBARRA=:cbarra) AND                       ');
              clAux2.AddParam ('      (TIPZ=:tipz)                               ');
              clAux2.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
              clAux2.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
              clAux2.consulta.parambyname('cbarra').AsString  := codigo_barras;
              clAux2.consulta.parambyname('tipz').AsString    := tipz;
              if (clAux2.Execute) then
              begin
                                  //sempre ADICIONA ao saldo ja existente
                quantidade_ja_existente := clAux2.result('SALDO') + quantidade;

                                  //*******************************************************************************
                clAux3 := TClassAuxiliar.Create;
                clAux3.conect   ('VENDAS',self);
                clAux3.ClearSql;
                clAux3.AddParam ('UPDATE LOTE_INVENTARIO                            ');
                clAux3.AddParam ('SET    SALDO=:novosaldo                           ');
                clAux3.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal) AND   ');
                clAux3.AddParam ('      (CBARRA=:cbarra)                            ');
                clAux3.consulta.parambyname('loja').AsFloat      := frm_principal.x_loja;
                clAux3.consulta.parambyname('terminal').AsFloat  := frm_principal.x_terminal;
                clAux3.consulta.parambyname('cbarra').AsString   := codigo_barras;
                clAux3.consulta.parambyname('novosaldo').AsFloat := quantidade_ja_existente;
                clAux3.Execute;
                clAux3.desconect;
                clAux3.Free;
                                  //*******************************************************************************
              end
              else
              begin
                sequencia := InformaProximaSequenciaLote; {*}
                                  //*******************************************************************************
                clAux3 := TClassAuxiliar.Create;
                clAux3.conect   ('VENDAS',self);
                clAux3.ClearSql;
                clAux3.AddParam ('INSERT INTO LOTE_INVENTARIO(LOJA,TERMINAL,GRUPO,SUBGRUPO,PRODUTO,COR,TAMANHO,SALDO,TIPZ,DATA,SEQ,CBARRA,DESCRICAO,REFINT,FORN,REFFAB,UNID)  ');
                clAux3.AddParam ('VALUES (:LOJA,:TERMINAL,:GRUPO,:SUBGRUPO,:PRODUTO,:COR,:TAMANHO,:SALDO,:TIPZ,:DATA,:SEQ,:CBARRA,:DESCRICAO,:REFINT,:FORN,:REFFAB,:UNID)     ');
                clAux3.consulta.parambyname('LOJA').AsFloat       := frm_principal.x_loja;
                clAux3.consulta.parambyname('TERMINAL').AsFloat   := frm_principal.x_terminal;
                clAux3.consulta.parambyname('GRUPO').AsFloat      := clAux.result('ES_GRUP');
                clAux3.consulta.parambyname('SUBGRUPO').AsFloat   := clAux.result('ES_SUBG');
                clAux3.consulta.parambyname('PRODUTO').AsFloat    := clAux.result('ES_PROD');
                clAux3.consulta.parambyname('COR').AsFloat        := clAux.result('ES_CORE');
                clAux3.consulta.parambyname('TAMANHO').AsString   := clAux.result('ES_TAMA');
                clAux3.consulta.parambyname('TIPZ').AsString      := tipz;
                clAux3.consulta.parambyname('DATA').AsDateTime    := frm_principal.x_data_trabalho;
                clAux3.consulta.parambyname('CBARRA').AsString    := codigo_barras;
                clAux3.consulta.parambyname('SEQ').AsInteger      := sequencia;
                clAux3.consulta.parambyname('SALDO').AsFloat      := quantidade;
                clAux3.consulta.parambyname('DESCRICAO').AsString := clAux.result('PR_DESC');
                clAux3.consulta.parambyname('REFINT').AsString    := clAux.result('PR_REFI');
                clAux3.consulta.parambyname('REFFAB').AsString    := clAux.result('PR_REFF');
                clAux3.consulta.parambyname('FORN').AsFloat       := clAux.result('PR_FORN');
                clAux3.consulta.parambyname('UNID').AsString      := clAux.result('PR_UNID');
                clAux3.Execute;
                clAux3.desconect;
                clAux3.Free;
                                  //*******************************************************************************
              end;
            end;
            clAux.desconect;
            clAux.Free;
                          //******************************************************

            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
          esconde_mensagem;
          CloseFile  (arq);
          frmDialogo.ExibirMensagem ('Arquivo importado com sucesso!'
            ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        except
          frmDialogo.ExibirMensagem ('Um ERRO ocorreu na tentativa de importar o arquivo!'
            ,'Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        end;
      end;
    end;
end;

procedure Tfrm_ImportarContagem.btnProcurarWordClick(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
    pnArquivo.caption := OpenDialog1.FileName;
end;

procedure Tfrm_ImportarContagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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
        tipz:='1';
        lbtipz.visible:=false;
      end;
      lbtipz.caption:='Sr.:'+tipz;
    end;
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ImportarContagem.FormCreate(Sender: TObject);
begin
  tipz:='1';
  lbtipz.visible:=false;
  lbtipz.caption:='Sr.1';
end;

function Tfrm_ImportarContagem.InformaProximaSequenciaLote:Integer;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT MAX(SEQ) as MAX_SEQ FROM LOTE_INVENTARIO   ');
  clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)       ');
  clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
  clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
  clAux.Execute;
  result := clAux.result('MAX_SEQ')+1;
  clAux.desconect;
  clAux.Free;
end;

end.
