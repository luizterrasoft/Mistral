unit un_ExportarContagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PanelOO, ExtCtrls, StdCtrls, LabelOO, BotaoSair, FileCtrl, CheckBoxOO;

type
  Tfrm_ExportarContagem = class(TForm)
    botao1: TPanel;
    BotaoSair1: TBotaoSair;
    LabelOO2: TLabelOO;
    LabelOO1: TLabelOO;
    Bevel1: TBevel;
    PanelOO1: TPanelOO;
    pnArquivo: TPanelOO;
    chEsvaziar: TCheckBoxOO;
    chAdiciona: TCheckBoxOO;
    procedure FormCreate(Sender: TObject);
    procedure botao1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BotaoSair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ExportarContagem: Tfrm_ExportarContagem;

implementation

{$R *.DFM}

uses principal,funcoes1,funcoes2,procura,auxiliar, unDialogo, unMensagem;

procedure Tfrm_ExportarContagem.FormCreate(Sender: TObject);
begin
  pnArquivo.caption := 'C:\NATIVA\VENDAS\INVENTARIO\INV'+form_nz(frm_principal.x_loja,2)+form_nz(frm_principal.x_terminal,2)+
    FormatDateTime('ddmmyyyy',frm_principal.x_data_trabalho)+'.TXT';
end;

procedure Tfrm_ExportarContagem.botao1Click(Sender: TObject);
var
  arq: textfile;
  indGauge,totGauge: Integer;
  clAux: TClassAuxiliar;
  nomearquivolimpo: String;
  indseqarq: Integer;
begin
  if (trim(pnArquivo.caption)<>'') then
  begin
    frmDialogo.posativ:=1;
    if (frmDialogo.ExibirMensagem ('Confirma exportação do inventário?'
      ,'Exportação de Inventário',[mbYes,mbNo]
      ,frm_principal.x_pathimg+'iconequestion.bmp',250,200)=mrYes) then
      try
        if (not DirectoryExists('C:\NATIVA\VENDAS\INVENTARIO')) then
          CreateDir('C:\NATIVA\VENDAS\INVENTARIO');
                  //************************************************************
        clAux := TClassAuxiliar.Create;
        clAux.conect   ('VENDAS',self);
        clAux.ClearSql;
        clAux.AddParam ('SELECT * FROM LOTE_INVENTARIO                ');
        clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)  ');
        clAux.AddParam ('ORDER BY SEQ                                 ');
        clAux.consulta.parambyname('loja').AsFloat := frm_principal.x_loja;
        clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
        if (not clAux.Execute) then
          frmDialogo.ExibirMensagem ('Não há lançamentos de inventário!'
            ,'Exportação de Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
        else
        begin
                      //******************************************************
          nomearquivolimpo:=trim(pnArquivo.caption);
          indseqarq:=1;
          while (FileExists(nomearquivolimpo)) do
          begin
            nomearquivolimpo:=trim(pnArquivo.caption);
            while (Pos('.',nomearquivolimpo)>0) do
              delete(nomearquivolimpo,Pos('.',nomearquivolimpo),4);
            nomearquivolimpo := nomearquivolimpo + '_' + inttostr(indseqarq) +'.TXT';
            indseqarq        := indseqarq + 1;
          end;
                      //******************************************************
          AssignFile (arq,trim(nomearquivolimpo));
          if (chAdiciona.checked) then
            Append(arq)
          else
            Rewrite(arq);
                      //******************************************************
          clAux.first;
          mostra_mensagem ('Exportando contagem...Aguarde!');
          frm_mensagem.painel.visible:=true;
          frm_mensagem.gauge1.progress:=0;
          indGauge:=0;
          totGauge:=clAux.reccount;
          while (not clAux.eof) do
          begin
            Writeln(arq, form_n    (clAux.result('SEQ'),5)         +';'+
              form_nz   (clAux.result('GRUPO'),2)       +';'+
              form_nz   (clAux.result('SUBGRUPO'),2)    +';'+
              form_nz   (clAux.result('PRODUTO'),4)     +';'+
              form_nz   (clAux.result('COR'),4)         +';'+
              form_t    (clAux.result('TAMANHO'),5)     +';'+
              form_t    (clAux.result('DESCRICAO'),60)  +';'+
              form_t    (clAux.result('UNID'),5)        +';'+
              form_t    (clAux.result('REFINT'),12)     +';'+
              form_t    (clAux.result('REFFAB'),15)     +';'+
              form_nz   (clAux.result('FORN'),6)        +';'+
              form_n    (clAux.result('SALDO'),10)      +';'+
              form_t    (clAux.result('CBARRA'),20)     +';'+
              form_data (clAux.result('DATA'))          +';'+
              form_t    (clAux.result('TIPZ'),1)       +';'+
              form_t    (clAux.Result('TIPZANT'),1));

                           {---->}
            clAux.next;
            indGauge:=indGauge+1;
            frm_mensagem.gauge1.progress:=Round((indGauge/totGauge)*100);
            frm_mensagem.gauge1.refresh;
          end;
                      //************************************************************
          if (chEsvaziar.checked) then
          begin
            clAux.ClearSql;
            clAux.AddParam ('DELETE FROM LOTE_INVENTARIO                  ');
            clAux.AddParam ('WHERE (LOJA=:loja) AND (TERMINAL=:terminal)  ');
            clAux.consulta.parambyname('loja').AsFloat     := frm_principal.x_loja;
            clAux.consulta.parambyname('terminal').AsFloat := frm_principal.x_terminal;
            clAux.Execute; {*}
          end;
                      //************************************************************
          CloseFile  (arq);
          esconde_mensagem;
          frmDialogo.ExibirMensagem ('Lote de inventário gerado com sucesso na pasta selecionada!'
            ,'Exportação de Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
                      //showmessage('Arquivo de exportação gerado: '+#13#10+'> '+nomearquivolimpo);
        end;
        clAux.desconect;
        clAux.Free;
      except
        frmDialogo.ExibirMensagem ('Um ERRO ocorreu na tentativa de exportar o inventário!'
          ,'Exportação de Inventário',[mbOK],frm_principal.x_pathimg+'iconeerro.bmp',250,200)
      end;
  end;
end;

procedure Tfrm_ExportarContagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=K_ESC) then
    close;
end;

procedure Tfrm_ExportarContagem.BotaoSair1Click(Sender: TObject);
begin
  close;
end;

end.
