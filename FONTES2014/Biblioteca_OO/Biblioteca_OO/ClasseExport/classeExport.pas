{** Esta classe se encarrega de realizar a exportacao/importacao de registros das tabelas *******************}
unit classeExport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables, classetxt, classetxt2, auxiliar, gauges, extctrls, funcoes1,
  funcoes2,funcoesglobais;

{-- Definicao da classe de acesso a arquivos TXT --}
type
  TClassExport = class(TObject)
  private
     ltEstTab: TStringList;
     teveJuncao: boolean;
  public
     procedure Inicializa; {*}
     procedure Finaliza; {*}
     procedure EstTabClear; {*}
     procedure EstTabAdd(linha: string); {*}
     procedure ExportaTabela
              (database,nometabela,nomearquivo: string;
               nomecampofiltro,tipocampofiltro,filtro: string;
               memo: TMemo; gauge: TGauge; usagauge: boolean; separador: string; painelmensagem: TPanel; sequencial: integer;flayout:integer=0;titulo:String='');
     Function  ImportaTabela(database,nometabela,nomearquivo,labelarquivo: string;
               nomecampofiltro,tipocampofiltro: string; memo1: TMemo; gauge: TGauge; usagauge: boolean; TipoImporta: string;flayout:integer=0;fexcimp:boolean=false):TClassTXT2;
     procedure MontaSelectTabelas (database,nometabela: string; clAux: TClassAuxiliar);
     procedure MontaComandoInsertNaTabela         (nometabela: string; clAux: TClassAuxiliar);
     procedure MontaComandoUpdateNaTabela         (nometabela: string; clAux: TClassAuxiliar;
               nomecampofiltro: string; tipocampofiltro: string; filtro: string);
     procedure MontaClausulaWhereDoSelect(clAux: TClassAuxiliar;
               nomecampofiltro: string; tipocampofiltro: string; filtro: string);
     procedure InsereCamposNoRegistroDaTabela     (clAux: TClassAuxiliar; clArq: TClassTXT2);
     procedure MontaEstruturaTabelaImportacao(database,nometabela: string; clArq: TClassTXT2);
     procedure MontaEstruturaTabelaExportacao(database,nometabela: string);
     procedure LimpaTabela(database,nometabela: string);
  end;

implementation

procedure TClassExport.Inicializa;
begin
     ltEstTab := TStringList.Create;
end;

procedure TClassExport.Finaliza;
begin
     ltEstTab.Free;
end;

procedure TClassExport.EstTabClear; {*}
begin
     ltEstTab.Clear;
end;

procedure TClassExport.EstTabAdd(linha: string); {*}
begin
     ltEstTab.Add(TrocaPalavra(Linha,#9,' '));
end;

procedure TClassExport.ExportaTabela(database,nometabela,nomearquivo: string;
    nomecampofiltro: string; tipocampofiltro: string; filtro: string;
    memo: TMemo; gauge: TGauge; usagauge: boolean; separador: string; painelmensagem: TPanel;
    sequencial: integer;flayout:integer=0;titulo:String='');
var
  arq: textfile;
  clAux: TClassAuxiliar;
  total_registros: integer;
  nomecampo,tipocampo: string;
  lc_nomecampofiltro,lc_tipocampofiltro: string;
  lc_filtro,lc_filtro1,lc_filtro2: string;
  tamanhocampo: integer;
  fnome,sString,linha: string;
  i,ToTGauge,ind: integer;
begin
     {***** Conteudo ***********}
     MontaEstruturaTabelaExportacao(DataBase,nometabela);
     AssignFile(arq,nomearquivo);
     Rewrite(arq);
     clAux := TClassAuxiliar.Create;
     clAux.Conect(database,nil);
     clAux.ClearSql;
     {*************************************************************************}
     teveJuncao:=false;
     MontaSelectTabelas(database,nometabela,clAux);
     {*************************************************************************}
     if (trim(nomecampofiltro)<>'') then //somente se tiver parametros
     begin
         if (teveJuncao) then
            clAux.AddParam (' AND    ')
         else if (trim(nomecampofiltro)<>'') then
            clAux.AddParam (' WHERE  ');
         nomecampofiltro:=nomecampofiltro+',';
         tipocampofiltro:=tipocampofiltro+',';
         filtro:=filtro+',';
         while (trim(nomecampofiltro)<>',') do
         begin
             lc_nomecampofiltro := Copy(nomecampofiltro,1,Pos(',',nomecampofiltro)-1);
             delete(nomecampofiltro,1,Pos(',',nomecampofiltro));
             lc_tipocampofiltro := Copy(tipocampofiltro,1,Pos(',',tipocampofiltro)-1);
             delete(tipocampofiltro,1,Pos(',',tipocampofiltro));
             lc_filtro          := Copy(filtro,1,Pos(',',filtro)-1)+',';
             lc_filtro1         := Copy(lc_filtro,1,Pos(':',lc_filtro)-1);
             delete(lc_filtro,1,Pos(':',lc_filtro));
             lc_filtro2         := Copy(lc_filtro,1,Pos(',',lc_filtro)-1);
             delete(filtro,1,Pos(',',filtro));

             if pos('-',lc_nomecampofiltro) = 0 then begin
               clAux.AddParam ('      ('+lc_nomecampofiltro+'>=:'+lc_nomecampofiltro+'1) AND ');
               clAux.AddParam ('      ('+lc_nomecampofiltro+'<=:'+lc_nomecampofiltro+'2)     ');
             end else begin
               fnome              := copy(lc_nomecampofiltro,pos('-',lc_nomecampofiltro) + 1,length(lc_nomecampofiltro))+'-';
               lc_nomecampofiltro := copy(lc_nomecampofiltro,1,pos('-',lc_nomecampofiltro) - 1);
               clAux.AddParam (' ( ');
               claux.addParam (' ( '+lc_nomecampofiltro+' >=:'+lc_nomecampofiltro+'1 AND '+lc_nomecampofiltro+' <=:'+lc_nomecampofiltro+'2 )');
               while pos('-',fnome) > 0 do begin
                  claux.addParam (' OR ( '+copy(fnome,1,pos('-',fnome) - 1)+' >=:'+lc_nomecampofiltro+'1 AND '+copy(fnome,1,pos('-',fnome) - 1)+' <=:'+lc_nomecampofiltro+'2 )');
                  fnome := copy(fnome,pos('-',fnome) + 1,length(FNome));
               end;
                clAux.AddParam (' ) ');
             end;
             if (lc_tipocampofiltro='d') then
             begin
                  clAux.consulta.parambyname(lc_nomecampofiltro+'1').AsDateTime := strtodate(lc_filtro1);
                  clAux.consulta.parambyname(lc_nomecampofiltro+'2').AsDateTime := strtodate(lc_filtro2);
             end
             else if (lc_tipocampofiltro='f') then
             begin
                  clAux.consulta.parambyname(lc_nomecampofiltro+'1').AsFloat := strtofloat(lc_filtro1);
                  clAux.consulta.parambyname(lc_nomecampofiltro+'2').AsFloat := strtofloat(lc_filtro2);
             end
             else if (lc_tipocampofiltro='c') then
             begin
                  clAux.consulta.parambyname(lc_nomecampofiltro+'1').AsString := lc_filtro1;
                  clAux.consulta.parambyname(lc_nomecampofiltro+'2').AsString := lc_filtro2;
             end
             else if (lc_tipocampofiltro='i') then
             begin
                  clAux.consulta.parambyname(lc_nomecampofiltro+'1').AsInteger := strtoint(lc_filtro1);
                  clAux.consulta.parambyname(lc_nomecampofiltro+'2').AsInteger := strtoint(lc_filtro2);
             end;
             if (trim(nomecampofiltro)<>'') then
                  clAux.AddParam(' AND ')
             else nomecampofiltro := ',';
         end;
     end;
     {*************************************************************************}
     painelMensagem.caption:='Buscando '+nometabela+'...Aguarde!';
     painelMensagem.refresh;
     clAux.Execute;

     if ltEstTab.count = 0 then
       for i:=0 to claux.consulta.fieldcount - 1 do begin
             EstTabAdd(uppercase(claux.consulta.fields[i].fieldname));
             case TipoDataType(claux.consulta.fields[i].datatype) of
              dtcharacter:ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' VARCHAR('+inttostr(claux.consulta.fields[i].datasize)+')';
              dtInteiro  :ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' INTEGER 15';
              dtnumero   :ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' DOUBLE PRECISION n15';
              dtdata     :ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' TIMESTAMP ';
             end;
       end;



     painelMensagem.caption:='Copiando registros de '+nometabela+'...Aguarde!';
     painelMensagem.refresh;
     total_registros:=0;
     if (usagauge) then
     begin
          gauge.visible:=true;
          gauge.progress:=0;totGauge:=clAux.reccount;
     end;
     while (not clAux.eof) do
     begin
          linha:='';
          ind:=0;
          while (ind<ltEstTab.count) do
          begin
              nomecampo := trim(Copy(ltEstTab[ind],1,pos(' ',ltEstTab[ind])));
              tipocampo := trim(Copy(ltEstTab[ind],pos(' ',ltEstTab[ind]),length(ltEstTab[ind])));
              if (Pos('VARCHAR',tipocampo)>0) then
              begin
                   tamanhocampo := strtoint(Copy(tipocampo,9,Length(tipocampo)-9));
                   sString      := trim(clAux.Result(nomecampo));
                   while (Pos(';',sString)>0) do
                         delete(sString,Pos(';',sString),1);
                   linha := linha + form_t(sString,tamanhocampo);
              end
              else if (Pos('DOUBLE PRECISION',tipocampo)>0) then
              begin
                   if (Pos('z',tipocampo)>0) then
                   begin
                        tamanhocampo := strtoint(Copy(tipocampo,Pos('z',tipocampo)+1,length(tipocampo)-Pos('z',tipocampo)));
                        linha := linha + form_nz(clAux.Result(nomecampo),tamanhocampo)
                   end
                   else if (Pos('n',tipocampo)>0) then
                   begin
                        tamanhocampo := strtoint(Copy(tipocampo,Pos('n',tipocampo)+1,length(tipocampo)-Pos('n',tipocampo)));
                        linha := linha + form_nc(clAux.Result(nomecampo),tamanhocampo);
                   end;
              end
              else if (Pos('INTEGER',tipocampo)>0) or
                      (Pos('SMALLINT',tipocampo)>0) then
              begin
                   tamanhocampo := strtoint(Copy(tipocampo,Pos(' ',tipocampo)+1,length(tipocampo)-Pos(' ',tipocampo)));
                   linha := linha + form_n(clAux.Result(nomecampo),tamanhocampo)
              end
              else if (Pos('DATETIME',tipocampo)>0) then
                   linha := linha + formatdatetime('dd/mm/yyyy hh:nn:ss',clAux.Result(nomecampo))
              else if (Pos('TIMESTAMP',tipocampo)>0)then
                   linha := linha + form_data(clAux.Result(nomecampo));
              ind:=ind+1;
              linha := linha + ';';
          end;
          WriteLn   (arq,linha);
          clAux.next;
          Application.ProcessMessages;
          total_registros:=total_registros+1;
          if (usagauge) then
               gauge.progress:=Round((total_registros/TotGauge)*100);

     end;
     gauge.visible:=false;
     clAux.desconect;
     clAux.Free;
     CloseFile  (arq);

     if titulo <> '' Then
      NomeTabela := Titulo;

     if flayout = 0 then
       memo.lines.Add('  '+inttostr(sequencial)+'. '+form_tc2(nometabela,23,'.')+': '+form_n(total_registros,10)+' registro(s) copiado(s). ')
     else
       memo.lines.Add(' '+form_nz(sequencial,2)+'. '+padr(Nometabela,18,'.')+':'+form_n(total_registros,11) +'   Arquivo.: '+nomearquivo);

     painelMensagem.caption:='';
     painelMensagem.refresh;
     memo.Refresh;
end;

procedure TClassExport.InsereCamposNoRegistroDaTabela(clAux: TClassAuxiliar; clArq: TClassTXT2);
var
  nomecampo: string;
  ind: integer;
  campo: TStructTXT2;
begin
  ind := 0;
  while (ind < ltEstTab.count) do // -1 pelo o ID que é auto_increment do banco
  begin
    nomecampo := trim(Copy(ltEstTab[ind],1,pos(' ',ltEstTab[ind])));
    if (nomecampo = 'ID') then
    begin
      ind := ind + 1;
      Continue;
    end;
    campo     := clArq.FieldInfo(nomecampo);
    if (campo.tipo = ftString) then
      clAux.consulta.parambyname(nomecampo).AsString   := clArq.FieldByName(nomecampo)
    else
    if (campo.tipo = ftFloat) then
      clAux.consulta.parambyname(nomecampo).AsFloat    := clArq.FieldByName(nomecampo)
    else
    if (campo.tipo = ftInteger) then
      clAux.consulta.parambyname(nomecampo).AsInteger  := clArq.FieldByName(nomecampo)
    else
    if (campo.tipo = ftDateTime) then
      clAux.consulta.parambyname(nomecampo).AsDateTime := clArq.FieldByName(nomecampo);
    ind := ind + 1;
    Application.ProcessMessages;
  end;
  clAux.Execute;
end;

procedure TClassExport.MontaComandoInsertNaTabela(nometabela: string; clAux: TClassAuxiliar);
var
linha,nomecampo: string;
ind: integer;
campo: TStructTXT2;
begin
     clAux.ClearSql;
     clAux.AddParam ('INSERT INTO '+nometabela+' (');
     linha := '';
     nomecampo := trim(Copy(ltEstTab[0],1,pos(' ',ltEstTab[0])));
     linha := nomecampo;
     ind:=1;
     while (ind<ltEstTab.count) do   // -1 pelo o ID que é auto_increment do banco
     begin
          nomecampo := trim(Copy(ltEstTab[ind],1,pos(' ',ltEstTab[ind])));
          if (nomecampo = 'ID') then
          begin
            ind := ind + 1;
            Continue;
          end;
          linha := linha + ','+ nomecampo;
          ind:=ind+1;
     end;
     clAux.AddParam (linha);
     clAux.AddParam (')VALUES(');
     linha := '';
     nomecampo := trim(Copy(ltEstTab[0],1,pos(' ',ltEstTab[0])));
     linha := ':'+nomecampo;
     ind:=1;
     while (ind<ltEstTab.count) do   // -1 pelo o ID que é auto_increment do banco
     begin
          nomecampo := trim(Copy(ltEstTab[ind],1,pos(' ',ltEstTab[ind])));
          if (nomecampo = 'ID') then
          begin
            ind := ind + 1;
            Continue;
          end;
          linha := linha + ',:'+ nomecampo;
          ind:=ind+1;
     end;
     clAux.AddParam (linha);
     clAux.AddParam (')');
end;

procedure TClassExport.MontaSelectTabelas (database,nometabela: string; clAux: TClassAuxiliar);
begin
     {**** PARA APLICACAO 'ESTOQUE' *****}
     if (database='ESTOQUE') then
     begin
          clAux.AddParam ('SELECT *                   ');
          clAux.AddParam ('FROM '+nometabela+'        ');
     end

     {**** PARA APLICACAO 'CREDITO' *****}
     else if (database='CREDITO') then
     begin
          clAux.AddParam ('SELECT *                   ');
          clAux.AddParam ('FROM '+nometabela+'        ');
     end

     {**** PARA APLICACAO 'CONTASPAGAR' *****}
     else if (database='CONTASPAGAR') then
     begin
       if (nomeTabela = 'CONTAS') then
       begin
         clAux.AddParam ('SELECT *                      ');
         clAux.AddParam ('FROM '+nometabela              );
         clAux.AddParam ('WHERE CO_ESTOQ='+QuotedStr('T'));
       end
       else
       begin
          clAux.AddParam ('SELECT *         ');
          clAux.AddParam ('FROM '+nometabela );
       end;
     end

     {**** PARA APLICACAO 'VENDAS' *****}
     else if (database='VENDAS') then
     begin
         if (nometabela='ITENS_VENDAS') then
         begin
              clAux.AddParam ('SELECT *                                                             ');
              clAux.AddParam ('FROM ITENS_VENDAS,VENDAS                                             ');
              clAux.AddParam ('WHERE (IV_CAIX=VE_CAIX) AND (IV_LOJA=VE_LOJA) AND (IV_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='ITENS_ATENDIMENTOS') then
         begin
              clAux.AddParam ('SELECT *                                                             ');
              clAux.AddParam ('FROM ITENS_ATENDIMENTOS,ATENDIMENTOS                                 ');
              clAux.AddParam ('WHERE (IA_CAIX=AT_CAIX) AND (IA_LOJA=AT_LOJA) AND (IA_VEND=AT_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='VENDAS_FORMA_PAGAMENTO') then
         begin
              clAux.AddParam ('SELECT *                                                             ');
              clAux.AddParam ('FROM VENDAS_FORMA_PAGAMENTO,VENDAS                                   ');
              clAux.AddParam ('WHERE (VF_CAIX=VE_CAIX) AND (VF_LOJA=VE_LOJA) AND (VF_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='VENDAS_ATENDIMENTO') then
         begin
              clAux.AddParam ('SELECT *                                                             ');
              clAux.AddParam ('FROM VENDAS_ATENDIMENTO,VENDAS                                       ');
              clAux.AddParam ('WHERE (VA_CAIX=VE_CAIX) AND (VA_LOJA=VE_LOJA) AND (VA_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='VENDAS_EXCESSO') then
         begin
              clAux.AddParam ('SELECT e.*                                                           ');
              clAux.AddParam ('FROM VENDAS_EXCESSO e,VENDAS v                                       ');
              clAux.AddParam ('WHERE (e.VE_CAIX=v.VE_CAIX) AND (e.VE_LOJA=v.VE_LOJA) AND (e.VE_VEND=v.VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='CARTOES') then
         begin
              clAux.AddParam ('SELECT *                                                             ');
              clAux.AddParam ('FROM CARTOES,VENDAS                                                  ');
              clAux.AddParam ('WHERE (CA_CAIX=VE_CAIX) AND (CA_LOJA=VE_LOJA) AND (CA_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='CARTOES_PARCELAS') then
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM CARTOES_PARCELAS,VENDAS                                         ');
              clAux.AddParam ('WHERE (PC_CAIX=VE_CAIX) AND (PC_LOJA=VE_LOJA) AND (PC_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='CHEQUES') then
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM CHEQUES,VENDAS                                                  ');
              clAux.AddParam ('WHERE (CH_CAIX=VE_CAIX) AND (CH_LOJA=VE_LOJA) AND (CH_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='CREDIARIOS') then
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM CREDIARIOS,VENDAS                                               ');
              clAux.AddParam ('WHERE (CR_CAIX=VE_CAIX) AND (CR_LOJA=VE_LOJA) AND (CR_VEND=VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='VALES_RECEBIDOS') then
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM VALES_RECEBIDOS tab1,VENDAS tab2                                               ');
              clAux.AddParam ('WHERE (tab1.VE_CAIX=tab2.VE_CAIX) AND (tab1.VE_LOJA=tab2.VE_LOJA) AND (tab1.VE_VEND=tab2.VE_CODI)  ');
              teveJuncao:=true;
         end
         else if (nometabela='ITENS_VALES_MERCADORIAS') then
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM ITENS_VALES_MERCADORIAS,VALES_MERCADORIAS                                             ');
              clAux.AddParam ('WHERE (IV_CAIX=VA_CAIX) AND (IV_LOJA=VA_LOJA) AND (IV_NUME=VA_NUME)  ');
              teveJuncao:=true;
         end
         else
         begin
              clAux.AddParam ('SELECT *                         ');
              clAux.AddParam ('FROM '+nometabela+'        ');
         end;
     end;
     {******************************************************************}
end;

procedure TClassExport.MontaEstruturaTabelaExportacao(database,nometabela: string);
begin
  {**** PARA APLICACAO 'ESTOQUE' *****}
  EstTabClear;
  if (database = 'ESTOQUE') then
  begin
    if (nometabela = 'PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('PR_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PR_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PR_CODI DOUBLE PRECISION z4');
      EstTabAdd('PR_FORN DOUBLE PRECISION z6');
      EstTabAdd('PR_DESC VARCHAR(60)');
      EstTabAdd('PR_UNID VARCHAR(5)');
      EstTabAdd('PR_DMIN DOUBLE PRECISION n6');
      EstTabAdd('PR_DMAX DOUBLE PRECISION n6');
      EstTabAdd('PR_TTAM DOUBLE PRECISION z2');
      EstTabAdd('PR_TUNI VARCHAR(1)');
      EstTabAdd('PR_CUNI VARCHAR(1)');
      EstTabAdd('PR_REFI VARCHAR(12)');
      EstTabAdd('PR_QTMI INTEGER 5');
      EstTabAdd('PR_REFF VARCHAR(15)');
      EstTabAdd('PR_ULC1 TIMESTAMP');
      EstTabAdd('PR_ULC2 TIMESTAMP');
      EstTabAdd('PR_DCAD TIMESTAMP');
      EstTabAdd('PR_LINH DOUBLE PRECISION z4');
      EstTabAdd('PR_COLE DOUBLE PRECISION z4');
      EstTabAdd('PR_PAR1 SMALLINT 1');
      EstTabAdd('PR_PAR2 SMALLINT 1');
      EstTabAdd('PR_MAT1 VARCHAR(15)');
      EstTabAdd('PR_MAT2 VARCHAR(15)');
      EstTabAdd('PR_MAT3 VARCHAR(15)');
      EstTabAdd('PR_MODE DOUBLE PRECISION z4');
      EstTabAdd('PR_NCM  VARCHAR(12)');
      EstTabAdd('PR_MVA  DOUBLE PRECISION n10');
      EstTabAdd('PR_TIPO SMALLINT 1');
      EstTabAdd('PR_ORIG SMALLINT 1');
    end
    else if (nometabela = 'ESTOQUE') then
    begin
      EstTabClear;
      EstTabAdd('ES_GRUP DOUBLE PRECISION z2');
      EstTabAdd('ES_SUBG DOUBLE PRECISION z2');
      EstTabAdd('ES_PROD DOUBLE PRECISION z4');
      EstTabAdd('ES_CORE DOUBLE PRECISION z4');
      EstTabAdd('ES_TAMA VARCHAR(5)');
      EstTabAdd('ES_REFF VARCHAR(15)');
      EstTabAdd('ES_DESC VARCHAR(80)');
      EstTabAdd('ES_CBAR VARCHAR(14)');
      EstTabAdd('ES_ULC1 TIMESTAMP');
      EstTabAdd('ES_ULC2 TIMESTAMP');
      EstTabAdd('ES_OTAM SMALLINT 3');
      EstTabAdd('ES_PVE1 DOUBLE PRECISION n10');
      EstTabAdd('ES_PVE2 DOUBLE PRECISION n10');
      EstTabAdd('ES_PCU1 DOUBLE PRECISION n10');
      EstTabAdd('ES_PCU2 DOUBLE PRECISION n10');
      EstTabAdd('ES_UPC1 DOUBLE PRECISION n10');
      EstTabAdd('ES_UPC2 DOUBLE PRECISION n10');
      EstTabAdd('ES_UPA1 DOUBLE PRECISION n10');
      EstTabAdd('ES_UPA2 DOUBLE PRECISION n10');
      EstTabAdd('ES_CEAN VARCHAR(30)');
    end
    else if (nometabela = 'ESTOQUE_LOJA') then
    begin
      EstTabClear;
      EstTabAdd('EL_LOJA DOUBLE PRECISION z3');
      EstTabAdd('EL_GRUP DOUBLE PRECISION z2');
      EstTabAdd('EL_SUBG DOUBLE PRECISION z2');
      EstTabAdd('EL_PROD DOUBLE PRECISION z4');
      EstTabAdd('EL_CORE DOUBLE PRECISION z4');
      EstTabAdd('EL_TAMA VARCHAR(5)');
      EstTabAdd('EL_OTAM SMALLINT 3');
      EstTabAdd('EL_ULC1 TIMESTAMP');
      EstTabAdd('EL_ULC2 TIMESTAMP');
      EstTabAdd('EL_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('EL_TIME DATETIME');
      EstTabAdd('EL_UVEN DATETIME');
      EstTabAdd('EL_UTRF DATETIME');
      EstTabAdd('EL_UVLM DATETIME');
    end
    else if (nometabela = 'CORES') then
    begin
      EstTabClear;
      EstTabAdd('CR_ABRV VARCHAR(5)');
      EstTabAdd('CR_DESC VARCHAR(30)');
      EstTabAdd('CR_CODI DOUBLE PRECISION z4');
      EstTabAdd('CR_SORT VARCHAR(1)');
      EstTabAdd('CR_ATIV VARCHAR(1)');
    end
    else if (nometabela = 'GRUPOS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('GR_CODI DOUBLE PRECISION z2');
      EstTabAdd('GR_DESC VARCHAR(20)');
      EstTabAdd('GR_CUNI VARCHAR(1)');
      EstTabAdd('GR_TUNI VARCHAR(1)');
      EstTabAdd('GR_DMIN DOUBLE PRECISION n6');
      EstTabAdd('GR_DMAX DOUBLE PRECISION n6');
      EstTabAdd('GR_MARG DOUBLE PRECISION n6');
      EstTabAdd('GR_REFI VARCHAR(12)');
    end
    else if (nometabela = 'SUBGRUPOS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('SG_CODI	DOUBLE PRECISION z2');
      EstTabAdd('SG_DESC	VARCHAR(20)');
      EstTabAdd('SG_UNID	VARCHAR(5)');
      EstTabAdd('SG_REFI	VARCHAR(10)');
      EstTabAdd('SG_CUNI	VARCHAR(1)');
      EstTabAdd('SG_TUNI	VARCHAR(1)');
      EstTabAdd('SG_DMIN	DOUBLE PRECISION n6');
      EstTabAdd('SG_DMAX	DOUBLE PRECISION n6');
      EstTabAdd('SG_MARG	DOUBLE PRECISION n6');
      EstTabAdd('SG_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('SG_MAT1	VARCHAR(15)');
      EstTabAdd('SG_MAT2	VARCHAR(15)');
      EstTabAdd('SG_MAT3	VARCHAR(15)');
      EstTabAdd('SG_TTAM	DOUBLE PRECISION z2');
      EstTabAdd('SG_PAR1	SMALLINT 1');
      EstTabAdd('SG_PAR2	SMALLINT 1');
      EstTabAdd('SG_PAR3	SMALLINT 1');
      EstTabAdd('SG_PAR4	SMALLINT 1');
      EstTabAdd('SG_PA21	SMALLINT 1');
      EstTabAdd('SG_PA22	SMALLINT 1');
      EstTabAdd('SG_COLE	DOUBLE PRECISION z4');
      EstTabAdd('SG_LINH	DOUBLE PRECISION z4');
      EstTabAdd('SG_NCM   VARCHAR(12)');
      EstTabAdd('SG_MVA   DOUBLE PRECISION n10');
      EstTabAdd('SG_TIPO  SMALLINT 1');
      EstTabAdd('SG_ORIG  SMALLINT 1');
    end
    else if (nometabela = 'TAMANHOS') then
    begin
      EstTabClear;
      EstTabAdd('TM_CODI	DOUBLE PRECISION z2');
      EstTabAdd('TM_DESC	VARCHAR(30)');
      EstTabAdd('TM_SEQB	INTEGER 5');
    end
    else if (nometabela = 'TAMANHOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('TF_CODI	DOUBLE PRECISION z2');
      EstTabAdd('TF_TAMA	VARCHAR(5)');
      EstTabAdd('TF_SEQ  INTEGER 5');
      EstTabAdd('TF_ORDE	SMALLINT 5');
    end
    else if (nometabela = 'PRODUTOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('PF_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('PF_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('PF_PROD	DOUBLE PRECISION z4');
      EstTabAdd('PF_TAMA	VARCHAR(5)');
      EstTabAdd('PF_SEQ  INTEGER 5');
      EstTabAdd('PF_ORDE	SMALLINT 5');
    end
    else if (nometabela = 'SUBGRUPOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('SF_TAMA	VARCHAR(5)');
      EstTabAdd('SF_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('SF_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('SF_SEQ  INTEGER 5');
      EstTabAdd('SF_ORDE	SMALLINT 5');
    end
    else if (nometabela = 'COLECOES') then
    begin
      EstTabClear;
      EstTabAdd('CO_CODI	DOUBLE PRECISION z4');
      EstTabAdd('CO_DESC	VARCHAR(40)');
    end
    else if (nometabela = 'MATERIAIS') then
    begin
      EstTabClear;
      EstTabAdd('MA_CODI	DOUBLE PRECISION z4');
      EstTabAdd('MA_DESC	VARCHAR(40)');
    end
    else if (nometabela = 'MODELOS') then
    begin
      EstTabClear;
      EstTabAdd('MD_CODI	DOUBLE PRECISION z5');
      EstTabAdd('MD_DESC	VARCHAR(40)');
    end
    else if (nometabela = 'LINHAS') then
    begin
      EstTabClear;
      EstTabAdd('LI_CODI	DOUBLE PRECISION z4');
      EstTabAdd('LI_DESC	VARCHAR(40)');
    end
    else if (nometabela = 'ADMINISTRADORAS') then
    begin
      EstTabClear;
      EstTabAdd('AM_CODI DOUBLE PRECISION z2');
      EstTabAdd('AM_DESC VARCHAR(40)');
      EstTabAdd('AM_ABRV VARCHAR(10)');
      EstTabAdd('AM_TDES DOUBLE PRECISION n10');
      EstTabAdd('AM_PDES DOUBLE PRECISION n6');
      EstTabAdd('AM_BANC DOUBLE PRECISION z3');
      EstTabAdd('AM_CONT VARCHAR(15)');
      EstTabAdd('AM_AGEN VARCHAR(21)');
      EstTabAdd('AM_QTDE SMALLINT 3');
      EstTabAdd('AM_PARM DOUBLE PRECISION n10');
      EstTabAdd('AM_PARC VARCHAR(1)');
      EstTabAdd('AM_TIPO SMALLINT 1');
      EstTabAdd('AM_CODT DOUBLE PRECISION z2');
    end
    else if (nometabela = 'ADMINISTRADORAS_LOJAS') then
    begin
      EstTabClear;
      EstTabAdd('AL_CADM DOUBLE PRECISION z2');
      EstTabAdd('AL_LOJA DOUBLE PRECISION z2');
      EstTabAdd('AL_TAXA DOUBLE PRECISION n6');
      EstTabAdd('AL_DIAS INTEGER 5');
    end
    else if (nometabela = 'ITENS_TABELAS_PRECOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('IP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_REAJ DOUBLE PRECISION n10');
      EstTabAdd('IP_POR1 DOUBLE PRECISION n10');
      EstTabAdd('IP_POR2 DOUBLE PRECISION n10');
      EstTabAdd('IP_OTAM INTEGER 5');
      EstTabAdd('IP_REA1 DOUBLE PRECISION n10');
      EstTabAdd('IP_REA2 DOUBLE PRECISION n10');
    end
    else if (nometabela = 'ITENS_TABELAS_PRECOS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_TIME TIMESTAMP');
      EstTabAdd('IP_TIPZ VARCHAR(1)');
      EstTabAdd('IP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela = 'PRECOS_PROMOCIONAIS') then
    begin
      EstTabClear;
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_OTAM INTEGER 5');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('PP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('PP_TIME TIMESTAMP');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_CONCR DOUBLE PRECISION n10');
    end
    else if (nometabela = 'PRECOS_PROMOCIONAIS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_TIPZ VARCHAR(1)');
      EstTabAdd('PP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela = 'VENDEDORES') then
    begin
      EstTabClear;
      EstTabAdd('VD_CODI DOUBLE PRECISION z6');
      EstTabAdd('VD_NOME VARCHAR(40)');
      EstTabAdd('VD_CARG VARCHAR(30)');
      EstTabAdd('VD_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VD_APEL VARCHAR(20)');
      EstTabAdd('VD_SENH VARCHAR(20)');
      EstTabAdd('VD_COMA DOUBLE PRECISION n10');
      EstTabAdd('VD_COMP DOUBLE PRECISION n10');
      EstTabAdd('VD_STAT VARCHAR(1)');
    end
    else if (nometabela = 'ALIQUOTAS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('AP_GRUP   DOUBLE PRECISION z2');
      EstTabAdd('AP_SUBG   DOUBLE PRECISION z2');
      EstTabAdd('AP_PROD   DOUBLE PRECISION z4');
      EstTabAdd('AP_ESTA   VARCHAR(2)');
      EstTabAdd('AP_ICMS   DOUBLE PRECISION n10');
      EstTabAdd('AP_ISUB   DOUBLE PRECISION n10');
      EstTabAdd('AP_ISENTO VARCHAR(5)');
    end
    else if (nometabela = 'CONFIG_CODIGO_BARRAS') then
    begin
      EstTabClear;
      EstTabAdd('CAMPO   SMALLINT 2');
      EstTabAdd('ESPACO  SMALLINT 2');
    end
    else if (nometabela='MTV_ATDOS') then
    begin
      EstTabClear;
      EstTabAdd('MA_CODI DOUBLE PRECISION z3');
      EstTabAdd('MA_DESC VARCHAR(40)');
    end;
  end
  {**** PARA APLICACAO 'CREDITO' *****}
  else if (database='CREDITO') then
  begin
    if (nometabela='CRELOJA') then
    begin
      EstTabClear;
      EstTabAdd('LO_CODI DOUBLE PRECISION z2');
      EstTabAdd('LO_NOME VARCHAR(40)');
      EstTabAdd('LO_FF8E VARCHAR(1)');
      EstTabAdd('LO_ESTA VARCHAR(2)');
    end
    else if (nometabela='USERS') then
    begin
      EstTabClear;
      EstTabAdd('USCODE     DOUBLE PRECISION z4');
      EstTabAdd('USALIAS    VARCHAR(10)');
      EstTabAdd('USNAME     VARCHAR(40)');
      EstTabAdd('USPASSWORD VARCHAR(6)');
      EstTabAdd('USTYPE     VARCHAR(1)');
      EstTabAdd('USDCAD     TIMESTAMP');
      EstTabAdd('USSESSION  DOUBLE PRECISION z3');
      EstTabAdd('USGRUPO    DOUBLE PRECISION z2');
    end;
  end
  {**** PARA APLICACAO 'VENDAS' *****}
  else if (database='VENDAS') then
  begin
    if (nometabela='VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CODI DOUBLE PRECISION z9');
      EstTabAdd('VE_DATA TIMESTAMP');
      EstTabAdd('VE_OPER DOUBLE PRECISION z6');
      EstTabAdd('VE_CLIE DOUBLE PRECISION z6');
      EstTabAdd('VE_CONT DOUBLE PRECISION z6');
      EstTabAdd('VE_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VE_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VE_STAT VARCHAR(1)');
      EstTabAdd('VE_TIPZ VARCHAR(1)');
      EstTabAdd('VE_CUPO DOUBLE PRECISION z6');
      EstTabAdd('VE_VEND DOUBLE PRECISION z6');
      EstTabAdd('VE_ALIQ DOUBLE PRECISION n10');
      EstTabAdd('VE_ICMS DOUBLE PRECISION n10');
      EstTabAdd('VE_FONE VARCHAR(15)');
      EstTabAdd('VE_NOME VARCHAR(40)');
      EstTabAdd('VE_CPF  VARCHAR(14)');
      EstTabAdd('VE_SERI VARCHAR(1)');
      EstTabAdd('VE_NOTA VARCHAR(10)');
      EstTabAdd('VE_DESC DOUBLE PRECISION n10');
      EstTabAdd('VE_PDES DOUBLE PRECISION n6');
      EstTabAdd('VE_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('VE_QTD2 DOUBLE PRECISION n10');
      EstTabAdd('VE_ONLI VARCHAR(1)');
      EstTabAdd('VE_ENVI VARCHAR(1)');
      EstTabAdd('VE_ECF  SMALLINT 2');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_COMI DOUBLE PRECISION n10');
      EstTabAdd('VE_HORA VARCHAR(5)');
      EstTabAdd('VE_ACRE DOUBLE PRECISION n10');
      EstTabAdd('VE_PACR DOUBLE PRECISION n10');
      EstTabAdd('VE_NUMERO_NFE VARCHAR(9)');
      EstTabAdd('VE_PROTOCOLO_NFE VARCHAR(15)');
      EstTabAdd('VE_DATA_NFE TIMESTAMP');
      EstTabAdd('VE_HORA_NFE VARCHAR(8)');
      EstTabAdd('VE_CHAVE_NFE VARCHAR(32)');
    end
    else if (nometabela='VENDAS_EXCESSO') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_VEND DOUBLE PRECISION z9');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
    end
    else if (nometabela='ITENS_VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_VEND DOUBLE PRECISION z9');
      EstTabAdd('IV_TIPZ VARCHAR(1)');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_OTAM SMALLINT 5');
      EstTabAdd('IV_MODO SMALLINT 1');
      EstTabAdd('IV_SEQ  SMALLINT 5');
      EstTabAdd('IV_VEDE DOUBLE PRECISION z6');
      EstTabAdd('IV_DATA TIMESTAMP');
      EstTabAdd('IV_UPCU DOUBLE PRECISION n10');
      EstTabAdd('IV_PCUS DOUBLE PRECISION n10');
      EstTabAdd('IV_PAQU DOUBLE PRECISION n10');
      EstTabAdd('IV_HORA DATETIME');
      EstTabAdd('IV_STAT VARCHAR(1)');
      EstTabAdd('IV_DESC DOUBLE PRECISION n10');
      EstTabAdd('IV_PDES DOUBLE PRECISION n10');
      EstTabAdd('IV_ACRE DOUBLE PRECISION n10');
      EstTabAdd('IV_PACR DOUBLE PRECISION n10');
    end
    else if (nometabela='VENDAS_FORMA_PAGAMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VF_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VF_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VF_VEND DOUBLE PRECISION z9');
      EstTabAdd('VF_ORDE SMALLINT 5');
      EstTabAdd('VF_FPGT DOUBLE PRECISION z2');
      EstTabAdd('VF_VALO DOUBLE PRECISION n10');
      EstTabAdd('VF_TROC DOUBLE PRECISION n10');
    end
    else if (nometabela='VENDAS_ATENDIMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_VEND DOUBLE PRECISION z9');
      EstTabAdd('VA_VEDE DOUBLE PRECISION z6');
      EstTabAdd('VA_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VA_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VA_COMI DOUBLE PRECISION n10');
    end
    else if (nometabela='CARTOES') then
    begin
      EstTabClear;
      EstTabAdd('CA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CA_VEND DOUBLE PRECISION z9');
      EstTabAdd('CA_ORDE SMALLINT 5');
      EstTabAdd('CA_CADM DOUBLE PRECISION z2');
      EstTabAdd('CA_NUME VARCHAR(50)');
      EstTabAdd('CA_TPAR SMALLINT 2');
    end
    else if (nometabela='CARTOES_PARCELAS') then
    begin
      EstTabClear;
      EstTabAdd('PC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('PC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PC_VEND DOUBLE PRECISION z9');
      EstTabAdd('PC_ORDE SMALLINT 5');
      EstTabAdd('PC_NPAR SMALLINT 2');
      EstTabAdd('PC_VALO DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTA DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTJ DOUBLE PRECISION n10');
      EstTabAdd('PC_STAT VARCHAR(1)');
      EstTabAdd('PC_PERJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VALJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VENC TIMESTAMP');
      EstTabAdd('PC_DEBI TIMESTAMP');
      EstTabAdd('PC_DBAI TIMESTAMP');
      EstTabAdd('PC_DIAS SMALLINT 2');
      EstTabAdd('PC_PERC DOUBLE PRECISION n10');
    end
    else if (nometabela='CHEQUES') then
    begin
      EstTabClear;
      EstTabAdd('CH_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CH_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CH_VEND DOUBLE PRECISION z9');
      EstTabAdd('CH_BANC INTEGER 3');
      EstTabAdd('CH_NBAN VARCHAR(40)');
      EstTabAdd('CH_AGEN VARCHAR(10)');
      EstTabAdd('CH_CONT VARCHAR(20)');
      EstTabAdd('CH_NUME DOUBLE PRECISION z10');
      EstTabAdd('CH_ORDE SMALLINT 5');
      EstTabAdd('CH_FLAG VARCHAR(1)');
      EstTabAdd('CH_CPF  VARCHAR(14)');
      EstTabAdd('CH_NOME VARCHAR(40)');
      EstTabAdd('CH_FONE VARCHAR(15)');
      EstTabAdd('CH_VENC TIMESTAMP');
      EstTabAdd('CH_DTPG TIMESTAMP');
      EstTabAdd('CH_STAT VARCHAR(1)');
      EstTabAdd('CH_ALIN VARCHAR(5)');
      EstTabAdd('CH_VALO DOUBLE PRECISION n10');
      EstTabAdd('CH_VAPG DOUBLE PRECISION n10');
    end
    else if (nometabela='CREDIARIOS') then
    begin
      EstTabClear;
      EstTabAdd('CR_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CR_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CR_VEND DOUBLE PRECISION z8');
      EstTabAdd('CR_ORDE SMALLINT 5');
      EstTabAdd('CR_CLIE DOUBLE PRECISION z6');
      EstTabAdd('CR_CODI DOUBLE PRECISION z6');
      EstTabAdd('CR_TOTA DOUBLE PRECISION n10');
      EstTabAdd('CR_VENT DOUBLE PRECISION n10');
      EstTabAdd('CR_FINA DOUBLE PRECISION n10');
      EstTabAdd('CR_RECE DOUBLE PRECISION n10');
      EstTabAdd('CR_CPF  VARCHAR(14)');
      EstTabAdd('CR_NOME VARCHAR(40)');
      EstTabAdd('CR_EORD SMALLINT 2');
      EstTabAdd('CR_PLAN DOUBLE PRECISION z2');
      EstTabAdd('CR_CONT DOUBLE PRECISION z6');
    end
    else if (nometabela='VALES_RECEBIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_VEND DOUBLE PRECISION z8');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_NUME VARCHAR(10)');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
      EstTabAdd('VE_TIPO VARCHAR(1)');
      EstTabAdd('VE_ORDE INTEGER 5');
    end
    else if (nometabela='LANCAMENTOS_CAIXA') then
    begin
      EstTabClear;
      EstTabAdd('LC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('LC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('LC_DATA TIMESTAMP');
      EstTabAdd('LC_FUNC DOUBLE PRECISION z6');
      EstTabAdd('LC_SEQ  DOUBLE PRECISION z10');
      EstTabAdd('LC_VALO DOUBLE PRECISION n10');
      EstTabAdd('LC_NATU VARCHAR(1)');
      EstTabAdd('LC_DESC VARCHAR(60)');
      EstTabAdd('LC_TIPZ VARCHAR(1)');
      EstTabAdd('LC_CONT DOUBLE PRECISION z10');
      EstTabAdd('LC_TIPO DOUBLE PRECISION z2');
    end
    else if (nometabela='VALES_EMITIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_NUME VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_TIPO VARCHAR(1)');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_NUME DOUBLE PRECISION z10');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_NDOC VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_EMPR DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='ITENS_VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_NUME DOUBLE PRECISION z10');
      EstTabAdd('IV_FUNC DOUBLE PRECISION z6');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_OTAM INTEGER 5');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_PDES DOUBLE PRECISION n10');
      EstTabAdd('IV_DESC DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      esttabadd('IV_HORA DATETIME');
    end
    else if (nometabela='ATENDIMENTOS') then
    begin
      EstTabClear;
      EstTabAdd('AT_CAIX DOUBLE PRECISION z7');
      EstTabAdd('AT_LOJA DOUBLE PRECISION z2');
      EstTabAdd('AT_CODI DOUBLE PRECISION z9');
      EstTabAdd('AT_FUNC DOUBLE PRECISION z6');
      EstTabAdd('AT_DATA TIMESTAMP');
      EstTabAdd('AT_OPER DOUBLE PRECISION z4');
      EstTabAdd('AT_TOTA DOUBLE PRECISION n10');
      EstTabAdd('AT_QTDE DOUBLE PRECISION n10');
      EstTabAdd('AT_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('AT_QTD2 DOUBLE PRECISION n10');
      EstTabAdd('AT_VEND DOUBLE PRECISION z6');
      EstTabAdd('AT_NOME VARCHAR(40)');
      EstTabAdd('AT_ONLI VARCHAR(1)');
      EstTabAdd('AT_ENVI VARCHAR(1)');
      EstTabAdd('AT_STAT VARCHAR(1)');
      EstTabAdd('AT_MOTI DOUBLE PRECISION z3');
    end
    else if (nometabela='ITENS_ATENDIMENTOS') then
    begin
      EstTabClear;
      EstTabAdd('IA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IA_VEND DOUBLE PRECISION z9');
      EstTabAdd('IA_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IA_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IA_PROD DOUBLE PRECISION z4');
      EstTabAdd('IA_TAMA VARCHAR(5)');
      EstTabAdd('IA_CORE DOUBLE PRECISION z4');
      EstTabAdd('IA_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IA_TOTA DOUBLE PRECISION n10');
      EstTabAdd('IA_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IA_OTAM SMALLINT 5');
      EstTabAdd('IA_MODO SMALLINT 1');
      EstTabAdd('IA_SEQ  SMALLINT 5');
    end;
  end
  {**** PARA APLICACAO 'CONTASPAGAR' *****}
  else if (database='CONTASPAGAR') then
  begin
    if (nometabela='FORNECEDORES') then
    begin
      EstTabClear;
      EstTabAdd('FO_CODI DOUBLE PRECISION z6');
      EstTabAdd('FO_RAZA VARCHAR(40)');
      EstTabAdd('FO_NFAN VARCHAR(30)');
    end
    else if (nometabela='BANCOS') then
    begin
      EstTabClear;
      EstTabAdd('BA_CODI DOUBLE PRECISION z3');
      EstTabAdd('BA_NOME VARCHAR(40)');
      EstTabAdd('BA_SITE VARCHAR(80)');
    end
    else if (nometabela='CONTAS') then
    begin
      EstTabClear;
      EstTabAdd('CO_CODI DOUBLE PRECISION z10');
      EstTabAdd('CO_DESC VARCHAR(30)');
      EstTabAdd('CO_HIST VARCHAR(50)');
      EstTabAdd('CO_NATU VARCHAR(1)');
      EstTabAdd('CO_GRUP DOUBLE PRECISION z4');
      EstTabAdd('CO_ESTOQ VARCHAR(1)');
    end
    else if (nometabela='GRUPOS_CONTAS') then
    begin
      EstTabClear;
      EstTabAdd('GR_CODI DOUBLE PRECISION z4');
      EstTabAdd('GR_DESC VARCHAR(30)');
      EstTabAdd('GR_NATU VARCHAR(1)');
    end
    else if (nometabela='LANCAMENTOS_CAIXA') then
    begin
      EstTabClear;
      EstTabAdd('LC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('LC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('LC_DATA TIMESTAMP');
      EstTabAdd('LC_FUNC DOUBLE PRECISION z6');
      EstTabAdd('LC_SEQ  DOUBLE PRECISION z10');
      EstTabAdd('LC_VALO DOUBLE PRECISION n10');
      EstTabAdd('LC_NATU VARCHAR(1)');
      EstTabAdd('LC_DESC VARCHAR(60)');
      EstTabAdd('LC_TIPZ VARCHAR(1)');
      EstTabAdd('LC_CONT DOUBLE PRECISION z10');
      EstTabAdd('LC_TIPO DOUBLE PRECISION z2');
    end
    else if (nometabela='VALES_EMITIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_NUME VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_TIPO VARCHAR(1)');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end;
  end;
end;

procedure TClassExport.MontaEstruturaTabelaImportacao(database,nometabela: string; clArq: TClassTXT2);
var
  nomecampo,tipocampo: string;
  i,ind: integer;
  claux:TClassAuxiliar;
begin
  EstTabClear;
  {**** PARA APLICACAO 'ESTOQUE' *****}
  if (database='ESTOQUE') then
  begin
    if (nometabela='PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('PR_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('PR_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('PR_CODI	DOUBLE PRECISION z4');
      EstTabAdd('PR_FORN	DOUBLE PRECISION z6');
      EstTabAdd('PR_DESC	VARCHAR(60)');
      EstTabAdd('PR_UNID	VARCHAR(5)');
      EstTabAdd('PR_DMIN	DOUBLE PRECISION n6');
      EstTabAdd('PR_DMAX	DOUBLE PRECISION n6');
      EstTabAdd('PR_TTAM	DOUBLE PRECISION z2');
      EstTabAdd('PR_TUNI	VARCHAR(1)');
      EstTabAdd('PR_CUNI	VARCHAR(1)');
      EstTabAdd('PR_REFI	VARCHAR(12)');
      EstTabAdd('PR_QTMI	INTEGER 5');
      EstTabAdd('PR_REFF	VARCHAR(15)');
      EstTabAdd('PR_ULC1	TIMESTAMP');
      EstTabAdd('PR_ULC2	TIMESTAMP');
      EstTabAdd('PR_DCAD	TIMESTAMP');
      EstTabAdd('PR_LINH	DOUBLE PRECISION z4');
      EstTabAdd('PR_COLE	DOUBLE PRECISION z4');
      EstTabAdd('PR_PAR1	SMALLINT 1');
      EstTabAdd('PR_PAR2	SMALLINT 1');
      EstTabAdd('PR_MAT1	VARCHAR(15)');
      EstTabAdd('PR_MAT2	VARCHAR(15)');
      EstTabAdd('PR_MAT3	VARCHAR(15)');
      EstTabAdd('PR_MODE	DOUBLE PRECISION z4');
      EstTabAdd('PR_NCM   VARCHAR(12)');
      EstTabAdd('PR_MVA   DOUBLE PRECISION n10');
      EstTabAdd('PR_TIPO  SMALLINT 1');
      EstTabAdd('PR_ORIG  SMALLINT 1');
    end
    else if (nometabela='ESTOQUE') then
    begin
      EstTabClear;
      EstTabAdd('ES_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('ES_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('ES_PROD	DOUBLE PRECISION z4');
      EstTabAdd('ES_CORE	DOUBLE PRECISION z4');
      EstTabAdd('ES_TAMA	VARCHAR(5)');
      EstTabAdd('ES_REFF	VARCHAR(15)');
      EstTabAdd('ES_DESC	VARCHAR(80)');
      EstTabAdd('ES_CBAR	VARCHAR(14)');
      EstTabAdd('ES_ULC1	TIMESTAMP');
      EstTabAdd('ES_ULC2	TIMESTAMP');
      EstTabAdd('ES_OTAM	SMALLINT 3');
      EstTabAdd('ES_PVE1	DOUBLE PRECISION n10');
      EstTabAdd('ES_PVE2	DOUBLE PRECISION n10');
      EstTabAdd('ES_PCU1	DOUBLE PRECISION n10');
      EstTabAdd('ES_PCU2	DOUBLE PRECISION n10');
      EstTabAdd('ES_UPC1	DOUBLE PRECISION n10');
      EstTabAdd('ES_UPC2	DOUBLE PRECISION n10');
      EstTabAdd('ES_UPA1	DOUBLE PRECISION n10');
      EstTabAdd('ES_UPA2	DOUBLE PRECISION n10');
      EstTabAdd('ES_CEAN VARCHAR(30)');
      EstTabAdd('ES_IAT VARCHAR(1)');
      EstTabAdd('ES_IPPT VARCHAR(1)');
      EstTabAdd('ES_SITR VARCHAR(1)');
      EstTabAdd('ES_ALIQ DOUBLE PRECISION n10');
    end
    else if (nometabela='ESTOQUE_LOJA') then
    begin
      EstTabClear;
      EstTabAdd('EL_LOJA	DOUBLE PRECISION z3');
      EstTabAdd('EL_GRUP DOUBLE PRECISION z2');
      EstTabAdd('EL_SUBG DOUBLE PRECISION z2');
      EstTabAdd('EL_PROD	DOUBLE PRECISION z4');
      EstTabAdd('EL_CORE	DOUBLE PRECISION z4');
      EstTabAdd('EL_TAMA	VARCHAR(5)');
      EstTabAdd('EL_OTAM	SMALLINT 3');
      EstTabAdd('EL_ULC1	TIMESTAMP');
      EstTabAdd('EL_ULC2	TIMESTAMP');
      EstTabAdd('EL_QTD1	DOUBLE PRECISION n10');
      EstTabAdd('EL_TIME DATETIME');
      EstTabAdd('EL_UVEN DATETIME');
      EstTabAdd('EL_UTRF	DATETIME');
      EstTabAdd('EL_UVLM	DATETIME');
      EstTabAdd('EL_IAT VARCHAR(1)');
      EstTabAdd('EL_IPPT VARCHAR(1)');
      EstTabAdd('EL_SITR VARCHAR(1)');
      EstTabAdd('EL_ALIQ DOUBLE PRECISION n10');
    end
    else if (nometabela='CORES') then
    begin
      EstTabClear;
      EstTabAdd('CR_ABRV	VARCHAR(5)');
      EstTabAdd('CR_DESC	VARCHAR(30)');
      EstTabAdd('CR_CODI	DOUBLE PRECISION z4');
      EstTabAdd('CR_SORT	VARCHAR(1)');
      EstTabAdd('CR_ATIV VARCHAR(1)');
    end
    else if (nometabela='GRUPOS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('GR_CODI	DOUBLE PRECISION z2');
      EstTabAdd('GR_DESC	VARCHAR(20)');
      EstTabAdd('GR_CUNI	VARCHAR(1)');
      EstTabAdd('GR_TUNI	VARCHAR(1)');
      EstTabAdd('GR_DMIN	DOUBLE PRECISION n6');
      EstTabAdd('GR_DMAX	DOUBLE PRECISION n6');
      EstTabAdd('GR_MARG	DOUBLE PRECISION n6');
      EstTabAdd('GR_REFI	VARCHAR(12)');
    end
    else if (nometabela='SUBGRUPOS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('SG_CODI	DOUBLE PRECISION z2');
      EstTabAdd('SG_DESC	VARCHAR(20)');
      EstTabAdd('SG_UNID	VARCHAR(5)');
      EstTabAdd('SG_REFI	VARCHAR(10)');
      EstTabAdd('SG_CUNI	VARCHAR(1)');
      EstTabAdd('SG_TUNI	VARCHAR(1)');
      EstTabAdd('SG_DMIN	DOUBLE PRECISION n6');
      EstTabAdd('SG_DMAX	DOUBLE PRECISION n6');
      EstTabAdd('SG_MARG	DOUBLE PRECISION n6');
      EstTabAdd('SG_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('SG_MAT1	VARCHAR(15)');
      EstTabAdd('SG_MAT2	VARCHAR(15)');
      EstTabAdd('SG_MAT3	VARCHAR(15)');
      EstTabAdd('SG_TTAM	DOUBLE PRECISION z2');
      EstTabAdd('SG_PAR1	SMALLINT 1');
      EstTabAdd('SG_PAR2	SMALLINT 1');
      EstTabAdd('SG_PAR3	SMALLINT 1');
      EstTabAdd('SG_PAR4	SMALLINT 1');
      EstTabAdd('SG_PA21	SMALLINT 1');
      EstTabAdd('SG_PA22	SMALLINT 1');
      EstTabAdd('SG_COLE	DOUBLE PRECISION z4');
      EstTabAdd('SG_LINH	DOUBLE PRECISION z4');
      EstTabAdd('SG_NCM   VARCHAR(12)');
      EstTabAdd('SG_MVA   DOUBLE PRECISION n10');
      EstTabAdd('SG_TIPO  SMALLINT 1');
      EstTabAdd('SG_ORIG  SMALLINT 1');
    end
    else if (nometabela='TAMANHOS') then
    begin
      EstTabClear;
      EstTabAdd('TM_CODI	DOUBLE PRECISION z2');
      EstTabAdd('TM_DESC	VARCHAR(30)');
      EstTabAdd('TM_SEQB	INTEGER 5');
    end
    else if (nometabela='TAMANHOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('TF_CODI	DOUBLE PRECISION z2');
      EstTabAdd('TF_TAMA	VARCHAR(5)');
      EstTabAdd('TF_SEQ  INTEGER 5');
      EstTabAdd('TF_ORDE	SMALLINT 5');
    end
    else if (nometabela='PRODUTOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('PF_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('PF_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('PF_PROD	DOUBLE PRECISION z4');
      EstTabAdd('PF_TAMA	VARCHAR(5)');
      EstTabAdd('PF_SEQ  INTEGER 5');
      EstTabAdd('PF_ORDE	SMALLINT 5');
    end
    else if (nometabela='SUBGRUPOS_FAIXAS') then
    begin
      EstTabClear;
      EstTabAdd('SF_TAMA	VARCHAR(5)');
      EstTabAdd('SF_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('SF_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('SF_SEQ  INTEGER 5');
      EstTabAdd('SF_ORDE	SMALLINT 5');
    end
    else if (nometabela='COLECOES') then
    begin
      EstTabClear;
      EstTabAdd('CO_CODI	DOUBLE PRECISION z4');
      EstTabAdd('CO_DESC	VARCHAR(40)');
    end
    else if (nometabela='MATERIAIS') then
    begin
      EstTabClear;
      EstTabAdd('MA_CODI	DOUBLE PRECISION z4');
      EstTabAdd('MA_DESC	VARCHAR(40)');
    end
    else if (nometabela='MODELOS') then
    begin
      EstTabClear;
      EstTabAdd('MD_CODI	DOUBLE PRECISION z5');
      EstTabAdd('MD_DESC	VARCHAR(40)');
    end
    else if (nometabela='LINHAS') then
    begin
      EstTabClear;
      EstTabAdd('LI_CODI	DOUBLE PRECISION z4');
      EstTabAdd('LI_DESC	VARCHAR(40)');
    end
    else if (nometabela='ADMINISTRADORAS') then
    begin
      EstTabClear;
      EstTabAdd('AM_CODI DOUBLE PRECISION z2');
      EstTabAdd('AM_DESC VARCHAR(40)');
      EstTabAdd('AM_ABRV VARCHAR(10)');
      EstTabAdd('AM_TDES DOUBLE PRECISION n10');
      EstTabAdd('AM_PDES DOUBLE PRECISION n6');
      EstTabAdd('AM_BANC DOUBLE PRECISION z3');
      EstTabAdd('AM_CONT VARCHAR(15)');
      EstTabAdd('AM_AGEN VARCHAR(21)');
      EstTabAdd('AM_QTDE SMALLINT 3');
      EstTabAdd('AM_PARM DOUBLE PRECISION n10');
      EstTabAdd('AM_PARC VARCHAR(1)');
      EstTabAdd('AM_TIPO SMALLINT 1');
      EstTabAdd('AM_CODT DOUBLE PRECISION z2');
    end
    else if (nometabela='ADMINISTRADORAS_LOJAS') then
    begin
      EstTabClear;
      EstTabAdd('AL_CADM DOUBLE PRECISION z2');
      EstTabAdd('AL_LOJA DOUBLE PRECISION z2');
      EstTabAdd('AL_TAXA DOUBLE PRECISION n6');
      EstTabAdd('AL_DIAS INTEGER 5');
    end
    else if (nometabela='ITENS_TABELAS_PRECOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('IP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_REAJ DOUBLE PRECISION n10');
      EstTabAdd('IP_POR1 DOUBLE PRECISION n10');
      EstTabAdd('IP_POR2 DOUBLE PRECISION n10');
      EstTabAdd('IP_OTAM INTEGER 5');
      EstTabAdd('IP_REA1 DOUBLE PRECISION n10');
      EstTabAdd('IP_REA2 DOUBLE PRECISION n10');
    end
    else if (nometabela='ITENS_TABELAS_PRECOS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_TIME TIMESTAMP');
      EstTabAdd('IP_TIPZ VARCHAR(1)');
      EstTabAdd('IP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela='PRECOS_PROMOCIONAIS') then
    begin
      EstTabClear;
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_OTAM INTEGER 5');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('PP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('PP_TIME TIMESTAMP');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_CONCR DOUBLE PRECISION n10');
    end
    else if (nometabela='PRECOS_PROMOCIONAIS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_TIPZ VARCHAR(1)');
      EstTabAdd('PP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela='VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CODI DOUBLE PRECISION z9');
      EstTabAdd('VE_DATA TIMESTAMP');
      EstTabAdd('VE_OPER DOUBLE PRECISION z6');
      EstTabAdd('VE_CLIE DOUBLE PRECISION z6');
      EstTabAdd('VE_CONT DOUBLE PRECISION z6');
      EstTabAdd('VE_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VE_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VE_STAT VARCHAR(1)');
      EstTabAdd('VE_TIPZ VARCHAR(1)');
      EstTabAdd('VE_CUPO DOUBLE PRECISION z6');
      EstTabAdd('VE_VEND DOUBLE PRECISION z4');
      EstTabAdd('VE_ALIQ DOUBLE PRECISION n10');
      EstTabAdd('VE_ICMS DOUBLE PRECISION n10');
      EstTabAdd('VE_FONE VARCHAR(15)');
      EstTabAdd('VE_NOME VARCHAR(40)');
      EstTabAdd('VE_CPF  VARCHAR(14)');
      EstTabAdd('VE_SERI VARCHAR(1)');
      EstTabAdd('VE_NOTA VARCHAR(10)');
      EstTabAdd('VE_DESC DOUBLE PRECISION n10');
      EstTabAdd('VE_PDES DOUBLE PRECISION n6');
      EstTabAdd('VE_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('VE_QTD2 DOUBLE PRECISION n10');
      EstTabAdd('VE_ONLI VARCHAR(1)');
      EstTabAdd('VE_ENVI VARCHAR(1)');
      EstTabAdd('VE_ECF  SMALLINT 2');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_COMI DOUBLE PRECISION n10');
      EstTabAdd('VE_HORA VARCHAR(5)');
    end
    else if (nometabela='VENDAS_EXCESSO') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_VEND DOUBLE PRECISION z9');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
    end
    else if (nometabela='ITENS_VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_VEND DOUBLE PRECISION z9');
      EstTabAdd('IV_TIPZ VARCHAR(1)');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_OTAM SMALLINT 5');
      EstTabAdd('IV_MODO SMALLINT 1');
      EstTabAdd('IV_SEQ  SMALLINT 5');
      EstTabAdd('IV_VEDE DOUBLE PRECISION z6');
      EstTabAdd('IV_DATA TIMESTAMP');
      EstTabAdd('IV_UPCU DOUBLE PRECISION n10');
      EstTabAdd('IV_PCUS DOUBLE PRECISION n10');
      EstTabAdd('IV_PAQU DOUBLE PRECISION n10');
      esttabadd('IV_HORA DATETIME');
    end
    else if (nometabela='VENDAS_FORMA_PAGAMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VF_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VF_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VF_VEND DOUBLE PRECISION z9');
      EstTabAdd('VF_ORDE SMALLINT 5');
      EstTabAdd('VF_FPGT DOUBLE PRECISION z2');
      EstTabAdd('VF_VALO DOUBLE PRECISION n10');
      EstTabAdd('VF_TROC DOUBLE PRECISION n10');
    end
    else if (nometabela='VENDAS_ATENDIMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_VEND DOUBLE PRECISION z9');
      EstTabAdd('VA_VEDE DOUBLE PRECISION z6');
      EstTabAdd('VA_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VA_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VA_COMI DOUBLE PRECISION n10');
    end
    else if (nometabela='CARTOES') then
    begin
      EstTabClear;
      EstTabAdd('CA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CA_VEND DOUBLE PRECISION z9');
      EstTabAdd('CA_ORDE SMALLINT 5');
      EstTabAdd('CA_CADM DOUBLE PRECISION z2');
      EstTabAdd('CA_NUME VARCHAR(50)');
      EstTabAdd('CA_TPAR SMALLINT 2');
    end
    else if (nometabela='CARTOES_PARCELAS') then
    begin
      EstTabClear;
      EstTabAdd('PC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('PC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PC_VEND DOUBLE PRECISION z9');
      EstTabAdd('PC_ORDE SMALLINT 5');
      EstTabAdd('PC_NPAR SMALLINT 2');
      EstTabAdd('PC_VALO DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTA DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTJ DOUBLE PRECISION n10');
      EstTabAdd('PC_STAT VARCHAR(1)');
      EstTabAdd('PC_PERJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VALJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VENC TIMESTAMP');
      EstTabAdd('PC_DEBI TIMESTAMP');
      EstTabAdd('PC_DBAI TIMESTAMP');
      EstTabAdd('PC_DIAS SMALLINT 2');
      EstTabAdd('PC_PERC DOUBLE PRECISION n10');
    end
    else if (nometabela='CHEQUES') then
    begin
      EstTabClear;
      EstTabAdd('CH_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CH_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CH_VEND DOUBLE PRECISION z9');
      EstTabAdd('CH_BANC INTEGER 3');
      EstTabAdd('CH_NBAN VARCHAR(40)');
      EstTabAdd('CH_AGEN VARCHAR(10)');
      EstTabAdd('CH_CONT VARCHAR(20)');
      EstTabAdd('CH_NUME DOUBLE PRECISION z10');
      EstTabAdd('CH_ORDE SMALLINT 5');
      EstTabAdd('CH_FLAG VARCHAR(1)');
      EstTabAdd('CH_CPF  VARCHAR(14)');
      EstTabAdd('CH_NOME VARCHAR(40)');
      EstTabAdd('CH_FONE VARCHAR(15)');
      EstTabAdd('CH_VENC TIMESTAMP');
      EstTabAdd('CH_DTPG TIMESTAMP');
      EstTabAdd('CH_STAT VARCHAR(1)');
      EstTabAdd('CH_ALIN VARCHAR(5)');
      EstTabAdd('CH_VALO DOUBLE PRECISION n10');
      EstTabAdd('CH_VAPG DOUBLE PRECISION n10');
    end
    else if (nometabela='CREDIARIOS') then
    begin
      EstTabClear;
      EstTabAdd('CR_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CR_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CR_VEND DOUBLE PRECISION z8');
      EstTabAdd('CR_ORDE SMALLINT 5');
      EstTabAdd('CR_CLIE DOUBLE PRECISION z6');
      EstTabAdd('CR_CODI DOUBLE PRECISION z6');
      EstTabAdd('CR_TOTA DOUBLE PRECISION n10');
      EstTabAdd('CR_VENT DOUBLE PRECISION n10');
      EstTabAdd('CR_FINA DOUBLE PRECISION n10');
      EstTabAdd('CR_RECE DOUBLE PRECISION n10');
      EstTabAdd('CR_CPF  VARCHAR(14)');
      EstTabAdd('CR_NOME VARCHAR(40)');
      EstTabAdd('CR_EORD SMALLINT 2');
      EstTabAdd('CR_PLAN DOUBLE PRECISION z2');
    end
    else if (nometabela='VALES_RECEBIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_VEND DOUBLE PRECISION z8');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_NUME VARCHAR(10)');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
      EstTabAdd('VE_TIPO VARCHAR(1)');
      EstTabAdd('VE_ORDE INTEGER 5');
    end
    else if (nometabela='LANCAMENTOS_CAIXA') then
    begin
      EstTabAdd('LC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('LC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('LC_DATA TIMESTAMP');
      EstTabAdd('LC_FUNC DOUBLE PRECISION z6');
      EstTabAdd('LC_SEQ  DOUBLE PRECISION z10');
      EstTabAdd('LC_VALO DOUBLE PRECISION n10');
      EstTabAdd('LC_NATU VARCHAR(1)');
      EstTabAdd('LC_DESC VARCHAR(60)');
      EstTabAdd('LC_TIPZ VARCHAR(1)');
      EstTabAdd('LC_CONT DOUBLE PRECISION z10');
      EstTabAdd('LC_TIPO DOUBLE PRECISION z2');
    end
    else if (nometabela='VALES_EMITIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_NUME VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_TIPO VARCHAR(1)');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_NUME DOUBLE PRECISION z10');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_NDOC VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_EMPR DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='ITENS_VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_NUME DOUBLE PRECISION z10');
      EstTabAdd('IV_FUNC DOUBLE PRECISION z6');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_OTAM INTEGER 5');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_PDES DOUBLE PRECISION n10');
      EstTabAdd('IV_DESC DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      esttabadd('IV_HORA DATETIME');
    end
    else if (nometabela='ATENDIMENTOS') then
    begin
      EstTabClear;
      EstTabAdd('AT_CAIX DOUBLE PRECISION z7');
      EstTabAdd('AT_LOJA DOUBLE PRECISION z2');
      EstTabAdd('AT_CODI DOUBLE PRECISION z9');
      EstTabAdd('AT_FUNC DOUBLE PRECISION z6');
      EstTabAdd('AT_DATA TIMESTAMP');
      EstTabAdd('AT_OPER DOUBLE PRECISION z4');
      EstTabAdd('AT_TOTA DOUBLE PRECISION n10');
      EstTabAdd('AT_QTDE DOUBLE PRECISION n10');
      EstTabAdd('AT_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('AT_QTD2 DOUBLE PRECISION n10');
      EstTabAdd('AT_VEND DOUBLE PRECISION z6');
      EstTabAdd('AT_NOME VARCHAR(40)');
      EstTabAdd('AT_ONLI VARCHAR(1)');
      EstTabAdd('AT_ENVI VARCHAR(1)');
      EstTabAdd('AT_STAT VARCHAR(1)');
      EstTabAdd('AT_MOTI DOUBLE PRECISION z3');
    end
    else if (nometabela='ITENS_ATENDIMENTOS') then
    begin
      EstTabClear;
      EstTabAdd('IA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IA_VEND DOUBLE PRECISION z9');
      EstTabAdd('IA_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IA_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IA_PROD DOUBLE PRECISION z4');
      EstTabAdd('IA_TAMA VARCHAR(5)');
      EstTabAdd('IA_CORE DOUBLE PRECISION z4');
      EstTabAdd('IA_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IA_TOTA DOUBLE PRECISION n10');
      EstTabAdd('IA_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IA_OTAM SMALLINT 5');
      EstTabAdd('IA_MODO SMALLINT 1');
      EstTabAdd('IA_SEQ  SMALLINT 5');
    end
    else if (nometabela='MTV_ATDOS') then
    begin
      EstTabClear;
      EstTabAdd('MA_CODI DOUBLE PRECISION z3');
      EstTabAdd('MA_DESC VARCHAR(40)');
    end;
  end
  {**** PARA APLICACAO 'VENDAS' *****}
  else if (database='VENDAS') then
  begin
    if (nometabela='VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CODI DOUBLE PRECISION z9');
      EstTabAdd('VE_DATA TIMESTAMP');
      EstTabAdd('VE_OPER DOUBLE PRECISION z6');
      EstTabAdd('VE_CLIE DOUBLE PRECISION z6');
      EstTabAdd('VE_CONT DOUBLE PRECISION z6');
      EstTabAdd('VE_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VE_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VE_STAT VARCHAR(1)');
      EstTabAdd('VE_TIPZ VARCHAR(1)');
      EstTabAdd('VE_CUPO DOUBLE PRECISION z6');
      EstTabAdd('VE_VEND DOUBLE PRECISION z4');
      EstTabAdd('VE_ALIQ DOUBLE PRECISION n10');
      EstTabAdd('VE_ICMS DOUBLE PRECISION n10');
      EstTabAdd('VE_FONE VARCHAR(15)');
      EstTabAdd('VE_NOME VARCHAR(40)');
      EstTabAdd('VE_CPF  VARCHAR(14)');
      EstTabAdd('VE_SERI VARCHAR(1)');
      EstTabAdd('VE_NOTA VARCHAR(10)');
      EstTabAdd('VE_DESC DOUBLE PRECISION n10');
      EstTabAdd('VE_PDES DOUBLE PRECISION n6');
      EstTabAdd('VE_QTD1 DOUBLE PRECISION n10');
      EstTabAdd('VE_QTD2 DOUBLE PRECISION n10');
      EstTabAdd('VE_ONLI VARCHAR(1)');
      EstTabAdd('VE_ENVI VARCHAR(1)');
      EstTabAdd('VE_ECF  SMALLINT 2');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_COMI DOUBLE PRECISION n10');
      EstTabAdd('VE_HORA VARCHAR(5)');
      EstTabAdd('VE_ACRE FLOAT');
      EstTabAdd('VE_PACR FLOAT');
    end
    else if (nometabela='VENDAS_EXCESSO') then
    begin
      EstTabClear;
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_VEND DOUBLE PRECISION z9');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
    end
    else if (nometabela='ITENS_VENDAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_VEND DOUBLE PRECISION z9');
      EstTabAdd('IV_TIPZ VARCHAR(1)');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_OTAM SMALLINT 5');
      EstTabAdd('IV_MODO SMALLINT 1');
      EstTabAdd('IV_SEQ  SMALLINT 5');
      EstTabAdd('IV_VEDE DOUBLE PRECISION z6');
      EstTabAdd('IV_DATA TIMESTAMP');
      EstTabAdd('IV_UPCU DOUBLE PRECISION n10');
      EstTabAdd('IV_PCUS DOUBLE PRECISION n10');
      EstTabAdd('IV_PAQU DOUBLE PRECISION n10');
      EstTabAdd('IV_HORA DATETIME');
      EstTabAdd('IV_DESC FLOAT');
      EstTabAdd('IV_PDES FLOAT');
      EstTabAdd('IV_ACRE FLOAT');
      EstTabAdd('IV_PACR FLOAT');
    end
    else if (nometabela='VENDAS_FORMA_PAGAMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VF_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VF_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VF_VEND DOUBLE PRECISION z9');
      EstTabAdd('VF_ORDE SMALLINT 5');
      EstTabAdd('VF_FPGT DOUBLE PRECISION z2');
      EstTabAdd('VF_VALO DOUBLE PRECISION n10');
      EstTabAdd('VF_TROC DOUBLE PRECISION n10');
    end
    else if (nometabela='VENDAS_ATENDIMENTO') then
    begin
      EstTabClear;
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_VEND DOUBLE PRECISION z9');
      EstTabAdd('VA_VEDE DOUBLE PRECISION z6');
      EstTabAdd('VA_TOTA DOUBLE PRECISION n10');
      EstTabAdd('VA_QTDE DOUBLE PRECISION n10');
      EstTabAdd('VA_COMI DOUBLE PRECISION n10');
    end
    else if (nometabela='CARTOES') then
    begin
      EstTabClear;
      EstTabAdd('CA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CA_VEND DOUBLE PRECISION z9');
      EstTabAdd('CA_ORDE SMALLINT 5');
      EstTabAdd('CA_CADM DOUBLE PRECISION z2');
      EstTabAdd('CA_NUME VARCHAR(50)');
      EstTabAdd('CA_TPAR SMALLINT 2');
    end
    else if (nometabela='CARTOES_PARCELAS') then
    begin
      EstTabClear;
      EstTabAdd('PC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('PC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PC_VEND DOUBLE PRECISION z9');
      EstTabAdd('PC_ORDE SMALLINT 5');
      EstTabAdd('PC_NPAR SMALLINT 2');
      EstTabAdd('PC_VALO DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTA DOUBLE PRECISION n10');
      EstTabAdd('PC_TOTJ DOUBLE PRECISION n10');
      EstTabAdd('PC_STAT VARCHAR(1)');
      EstTabAdd('PC_PERJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VALJ DOUBLE PRECISION n10');
      EstTabAdd('PC_VENC TIMESTAMP');
      EstTabAdd('PC_DEBI TIMESTAMP');
      EstTabAdd('PC_DBAI TIMESTAMP');
      EstTabAdd('PC_DIAS SMALLINT 2');
      EstTabAdd('PC_PERC DOUBLE PRECISION n10');
    end
    else if (nometabela='CHEQUES') then
    begin
      EstTabClear;
      EstTabAdd('CH_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CH_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CH_VEND DOUBLE PRECISION z9');
      EstTabAdd('CH_BANC INTEGER 3');
      EstTabAdd('CH_NBAN VARCHAR(40)');
      EstTabAdd('CH_AGEN VARCHAR(10)');
      EstTabAdd('CH_CONT VARCHAR(20)');
      EstTabAdd('CH_NUME DOUBLE PRECISION z10');
      EstTabAdd('CH_ORDE SMALLINT 5');
      EstTabAdd('CH_FLAG VARCHAR(1)');
      EstTabAdd('CH_CPF  VARCHAR(14)');
      EstTabAdd('CH_NOME VARCHAR(40)');
      EstTabAdd('CH_FONE VARCHAR(15)');
      EstTabAdd('CH_VENC TIMESTAMP');
      EstTabAdd('CH_DTPG TIMESTAMP');
      EstTabAdd('CH_STAT VARCHAR(1)');
      EstTabAdd('CH_ALIN VARCHAR(5)');
      EstTabAdd('CH_VALO DOUBLE PRECISION n10');
      EstTabAdd('CH_VAPG DOUBLE PRECISION n10');
    end
    else if (nometabela='CREDIARIOS') then
    begin
      EstTabClear;
      EstTabAdd('CR_CAIX DOUBLE PRECISION z7');
      EstTabAdd('CR_LOJA DOUBLE PRECISION z2');
      EstTabAdd('CR_VEND DOUBLE PRECISION z8');
      EstTabAdd('CR_ORDE SMALLINT 5');
      EstTabAdd('CR_CLIE DOUBLE PRECISION z6');
      EstTabAdd('CR_CODI DOUBLE PRECISION z6');
      EstTabAdd('CR_TOTA DOUBLE PRECISION n10');
      EstTabAdd('CR_VENT DOUBLE PRECISION n10');
      EstTabAdd('CR_FINA DOUBLE PRECISION n10');
      EstTabAdd('CR_RECE DOUBLE PRECISION n10');
      EstTabAdd('CR_CPF  VARCHAR(14)');
      EstTabAdd('CR_NOME VARCHAR(40)');
      EstTabAdd('CR_EORD SMALLINT 2');
      EstTabAdd('CR_PLAN DOUBLE PRECISION z2');
      EstTabAdd('CR_CONT FLOAT');
    end
    else if (nometabela='VALES_RECEBIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VE_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VE_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VE_VEND DOUBLE PRECISION z8');
      EstTabAdd('VE_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VE_NUME VARCHAR(10)');
      EstTabAdd('VE_VALO DOUBLE PRECISION n10');
      EstTabAdd('VE_TIPO VARCHAR(1)');
      EstTabAdd('VE_ORDE INTEGER 5');
    end
    else if (nometabela='LANCAMENTOS_CAIXA') then
    begin
      EstTabAdd('LC_LOJA DOUBLE PRECISION z2');
      EstTabAdd('LC_CAIX DOUBLE PRECISION z7');
      EstTabAdd('LC_DATA TIMESTAMP');
      EstTabAdd('LC_FUNC DOUBLE PRECISION z6');
      EstTabAdd('LC_SEQ  DOUBLE PRECISION z10');
      EstTabAdd('LC_VALO DOUBLE PRECISION n10');
      EstTabAdd('LC_NATU VARCHAR(1)');
      EstTabAdd('LC_DESC VARCHAR(60)');
      EstTabAdd('LC_TIPZ VARCHAR(1)');
      EstTabAdd('LC_CONT DOUBLE PRECISION z10');
      EstTabAdd('LC_TIPO DOUBLE PRECISION z2');
    end
    else if (nometabela='VALES_EMITIDOS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_NUME VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_TIPO VARCHAR(1)');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('VA_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VA_CAIX DOUBLE PRECISION z7');
      EstTabAdd('VA_NUME DOUBLE PRECISION z10');
      EstTabAdd('VA_FUNC DOUBLE PRECISION z6');
      EstTabAdd('VA_NDOC VARCHAR(20)');
      EstTabAdd('VA_VALO DOUBLE PRECISION n10');
      EstTabAdd('VA_EMPR DOUBLE PRECISION z6');
      EstTabAdd('VA_DATA TIMESTAMP');
      EstTabAdd('VA_TIPZ VARCHAR(1)');
    end
    else if (nometabela='ITENS_VALES_MERCADORIAS') then
    begin
      EstTabClear;
      EstTabAdd('IV_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IV_CAIX DOUBLE PRECISION z7');
      EstTabAdd('IV_NUME DOUBLE PRECISION z10');
      EstTabAdd('IV_FUNC DOUBLE PRECISION z6');
      EstTabAdd('IV_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IV_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IV_PROD DOUBLE PRECISION z4');
      EstTabAdd('IV_CORE DOUBLE PRECISION z4');
      EstTabAdd('IV_OTAM INTEGER 5');
      EstTabAdd('IV_TAMA VARCHAR(5)');
      EstTabAdd('IV_PVEN DOUBLE PRECISION n10');
      EstTabAdd('IV_QTDE DOUBLE PRECISION n10');
      EstTabAdd('IV_PDES DOUBLE PRECISION n10');
      EstTabAdd('IV_DESC DOUBLE PRECISION n10');
      EstTabAdd('IV_TOTA DOUBLE PRECISION n10');
      esttabadd('IV_HORA DATETIME');
    end
    else if (nometabela='PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('PR_GRUP	DOUBLE PRECISION z2');
      EstTabAdd('PR_SUBG	DOUBLE PRECISION z2');
      EstTabAdd('PR_CODI	DOUBLE PRECISION z4');
      EstTabAdd('PR_FORN	DOUBLE PRECISION z6');
      EstTabAdd('PR_DESC	VARCHAR(60)');
      EstTabAdd('PR_UNID	VARCHAR(5)');
      EstTabAdd('PR_DMIN	DOUBLE PRECISION n6');
      EstTabAdd('PR_DMAX	DOUBLE PRECISION n6');
      EstTabAdd('PR_TTAM	DOUBLE PRECISION z2');
      EstTabAdd('PR_TUNI	VARCHAR(1)');
      EstTabAdd('PR_CUNI	VARCHAR(1)');
      EstTabAdd('PR_REFI	VARCHAR(12)');
      EstTabAdd('PR_QTMI	INTEGER 5');
      EstTabAdd('PR_REFF	VARCHAR(15)');
      EstTabAdd('PR_ULC1	TIMESTAMP');
      EstTabAdd('PR_ULC2	TIMESTAMP');
      EstTabAdd('PR_DCAD	TIMESTAMP');
      EstTabAdd('PR_LINH	DOUBLE PRECISION z4');
      EstTabAdd('PR_COLE	DOUBLE PRECISION z4');
      EstTabAdd('PR_PAR1	SMALLINT 1');
      EstTabAdd('PR_PAR2	SMALLINT 1');
      EstTabAdd('PR_MAT1	VARCHAR(15)');
      EstTabAdd('PR_MAT2	VARCHAR(15)');
      EstTabAdd('PR_MAT3	VARCHAR(15)');
      EstTabAdd('PR_MODE	DOUBLE PRECISION z4');
      EstTabAdd('PR_NCM  VARCHAR(12)');
      EstTabAdd('PR_MVA  DOUBLE PRECISION n10');
      EstTabAdd('PR_TIPO SMALLINT 1');
      EstTabAdd('PR_ORIG SMALLINT 1');
    end
    else if (nometabela='ESTOQUE') then
    begin
       EstTabClear;
       EstTabAdd('ES_GRUP	DOUBLE PRECISION z2');
       EstTabAdd('ES_SUBG	DOUBLE PRECISION z2');
       EstTabAdd('ES_PROD	DOUBLE PRECISION z4');
       EstTabAdd('ES_CORE	DOUBLE PRECISION z4');
       EstTabAdd('ES_TAMA	VARCHAR(5)');
       EstTabAdd('ES_REFF	VARCHAR(15)');
       EstTabAdd('ES_DESC	VARCHAR(80)');
       EstTabAdd('ES_CBAR	VARCHAR(14)');
       EstTabAdd('ES_ULC1	TIMESTAMP');
       EstTabAdd('ES_ULC2	TIMESTAMP');
       EstTabAdd('ES_OTAM	SMALLINT 3');
       EstTabAdd('ES_PVE1	DOUBLE PRECISION n10');
       EstTabAdd('ES_PVE2	DOUBLE PRECISION n10');
       EstTabAdd('ES_PCU1	DOUBLE PRECISION n10');
       EstTabAdd('ES_PCU2	DOUBLE PRECISION n10');
       EstTabAdd('ES_UPC1	DOUBLE PRECISION n10');
       EstTabAdd('ES_UPC2	DOUBLE PRECISION n10');
       EstTabAdd('ES_UPA1	DOUBLE PRECISION n10');
       EstTabAdd('ES_UPA2	DOUBLE PRECISION n10');
       EstTabAdd('ES_CEAN VARCHAR(30)');
       EstTabAdd('ES_IAT VARCHAR(1)');
       EstTabAdd('ES_IPPT VARCHAR(1)');
       EstTabAdd('ES_SITR VARCHAR(1)');
       EstTabAdd('ES_ALIQ DOUBLE PRECISION n10');
    end
    else if (nometabela='ESTOQUE_LOJA') then
    begin
       EstTabClear;
       EstTabAdd('EL_LOJA	DOUBLE PRECISION z3');
       EstTabAdd('EL_GRUP DOUBLE PRECISION z2');
       EstTabAdd('EL_SUBG DOUBLE PRECISION z2');
       EstTabAdd('EL_PROD	DOUBLE PRECISION z4');
       EstTabAdd('EL_CORE	DOUBLE PRECISION z4');
       EstTabAdd('EL_TAMA	VARCHAR(5)');
       EstTabAdd('EL_OTAM	SMALLINT 3');
       EstTabAdd('EL_ULC1	TIMESTAMP');
       EstTabAdd('EL_ULC2	TIMESTAMP');
       EstTabAdd('EL_QTD1	DOUBLE PRECISION n10');
       EstTabAdd('EL_TIME DATETIME');
       EstTabAdd('EL_UVEN DATETIME');
       EstTabAdd('EL_UTRF	DATETIME');
       EstTabAdd('EL_UVLM	DATETIME');
       EstTabAdd('EL_IAT VARCHAR(1)');
       EstTabAdd('EL_IPPT VARCHAR(1)');
       EstTabAdd('EL_SITR VARCHAR(1)');
       EstTabAdd('EL_ALIQ DOUBLE PRECISION n10');
    end
    else if (nometabela='CORES') then
    begin
       EstTabClear;
       EstTabAdd('CR_ABRV	VARCHAR(5)');
       EstTabAdd('CR_DESC	VARCHAR(30)');
       EstTabAdd('CR_CODI	DOUBLE PRECISION z4');
       EstTabAdd('CR_SORT	VARCHAR(1)');
       EstTabAdd('CR_ATIV VARCHAR(1)');
    end
    else if (nometabela='GRUPOS_PRODUTOS') then
    begin
       EstTabClear;
       EstTabAdd('GR_CODI	DOUBLE PRECISION z2');
       EstTabAdd('GR_DESC	VARCHAR(20)');
       EstTabAdd('GR_CUNI	VARCHAR(1)');
       EstTabAdd('GR_TUNI	VARCHAR(1)');
       EstTabAdd('GR_DMIN	DOUBLE PRECISION n6');
       EstTabAdd('GR_DMAX	DOUBLE PRECISION n6');
       EstTabAdd('GR_MARG	DOUBLE PRECISION n6');
       EstTabAdd('GR_REFI	VARCHAR(12)');
    end
    else if (nometabela='SUBGRUPOS_PRODUTOS') then
    begin
       EstTabClear;
       EstTabAdd('SG_CODI	DOUBLE PRECISION z2');
       EstTabAdd('SG_DESC	VARCHAR(20)');
       EstTabAdd('SG_UNID	VARCHAR(5)');
       EstTabAdd('SG_REFI	VARCHAR(10)');
       EstTabAdd('SG_CUNI	VARCHAR(1)');
       EstTabAdd('SG_TUNI	VARCHAR(1)');
       EstTabAdd('SG_DMIN	DOUBLE PRECISION n6');
       EstTabAdd('SG_DMAX	DOUBLE PRECISION n6');
       EstTabAdd('SG_MARG	DOUBLE PRECISION n6');
       EstTabAdd('SG_GRUP	DOUBLE PRECISION z2');
       EstTabAdd('SG_MAT1	VARCHAR(15)');
       EstTabAdd('SG_MAT2	VARCHAR(15)');
       EstTabAdd('SG_MAT3	VARCHAR(15)');
       EstTabAdd('SG_TTAM	DOUBLE PRECISION z2');
       EstTabAdd('SG_PAR1	SMALLINT 1');
       EstTabAdd('SG_PAR2	SMALLINT 1');
       EstTabAdd('SG_PAR3	SMALLINT 1');
       EstTabAdd('SG_PAR4	SMALLINT 1');
       EstTabAdd('SG_PA21	SMALLINT 1');
       EstTabAdd('SG_PA22	SMALLINT 1');
       EstTabAdd('SG_COLE	DOUBLE PRECISION z4');
       EstTabAdd('SG_LINH	DOUBLE PRECISION z4');
       EstTabAdd('SG_NCM  VARCHAR(12)');
       EstTabAdd('SG_MVA  DOUBLE PRECISION n10');
       EstTabAdd('SG_TIPO SMALLINT 1');
       EstTabAdd('SG_ORIG SMALLINT 1');
    end
    else if (nometabela='TAMANHOS') then
    begin
       EstTabClear;
       EstTabAdd('TM_CODI	DOUBLE PRECISION z2');
       EstTabAdd('TM_DESC	VARCHAR(30)');
       EstTabAdd('TM_SEQB	INTEGER 5');
    end
    else if (nometabela='TAMANHOS_FAIXAS') then
    begin
       EstTabClear;
       EstTabAdd('TF_CODI	DOUBLE PRECISION z2');
       EstTabAdd('TF_TAMA	VARCHAR(5)');
       EstTabAdd('TF_SEQ  INTEGER 5');
       EstTabAdd('TF_ORDE	SMALLINT 5');
    end
    else if (nometabela='PRODUTOS_FAIXAS') then
    begin
       EstTabClear;
       EstTabAdd('PF_GRUP	DOUBLE PRECISION z2');
       EstTabAdd('PF_SUBG	DOUBLE PRECISION z2');
       EstTabAdd('PF_PROD	DOUBLE PRECISION z4');
       EstTabAdd('PF_TAMA	VARCHAR(5)');
       EstTabAdd('PF_SEQ  INTEGER 5');
       EstTabAdd('PF_ORDE	SMALLINT 5');
    end
    else if (nometabela='SUBGRUPOS_FAIXAS') then
    begin
       EstTabClear;
       EstTabAdd('SF_TAMA	VARCHAR(5)');
       EstTabAdd('SF_GRUP	DOUBLE PRECISION z2');
       EstTabAdd('SF_SUBG	DOUBLE PRECISION z2');
       EstTabAdd('SF_SEQ  INTEGER 5');
       EstTabAdd('SF_ORDE	SMALLINT 5');
    end
    else if (nometabela='COLECOES') then
    begin
       EstTabClear;
       EstTabAdd('CO_CODI	DOUBLE PRECISION z4');
       EstTabAdd('CO_DESC	VARCHAR(40)');
    end
    else if (nometabela='MATERIAIS') then
    begin
       EstTabClear;
       EstTabAdd('MA_CODI	DOUBLE PRECISION z4');
       EstTabAdd('MA_DESC	VARCHAR(40)');
    end
    else if (nometabela='MODELOS') then
    begin
       EstTabClear;
       EstTabAdd('MD_CODI	DOUBLE PRECISION z5');
       EstTabAdd('MD_DESC	VARCHAR(40)');
    end
    else if (nometabela='LINHAS') then
    begin
       EstTabClear;
       EstTabAdd('LI_CODI	DOUBLE PRECISION z4');
       EstTabAdd('LI_DESC	VARCHAR(40)');
    end
    else if (nometabela='ADMINISTRADORAS') then
    begin
      EstTabClear;
      EstTabAdd('AM_CODI DOUBLE PRECISION z2');
      EstTabAdd('AM_DESC VARCHAR(40)');
      EstTabAdd('AM_ABRV VARCHAR(10)');
      EstTabAdd('AM_TDES DOUBLE PRECISION n10');
      EstTabAdd('AM_PDES DOUBLE PRECISION n6');
      EstTabAdd('AM_BANC DOUBLE PRECISION z3');
      EstTabAdd('AM_CONT VARCHAR(15)');
      EstTabAdd('AM_AGEN VARCHAR(21)');
      EstTabAdd('AM_QTDE SMALLINT 3');
      EstTabAdd('AM_PARM DOUBLE PRECISION n10');
      EstTabAdd('AM_PARC VARCHAR(1)');
      EstTabAdd('AM_TIPO SMALLINT 1');
      EstTabAdd('AM_CODT DOUBLE PRECISION z2');
    end
    else if (nometabela='ADMINISTRADORAS_LOJAS') then
    begin
      EstTabClear;
      EstTabAdd('AL_CADM DOUBLE PRECISION z2');
      EstTabAdd('AL_LOJA DOUBLE PRECISION z2');
      EstTabAdd('AL_TAXA DOUBLE PRECISION n6');
      EstTabAdd('AL_DIAS INTEGER 5');
    end
    else if (nometabela='ITENS_TABELAS_PRECOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('IP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_REAJ DOUBLE PRECISION n10');
      EstTabAdd('IP_POR1 DOUBLE PRECISION n10');
      EstTabAdd('IP_POR2 DOUBLE PRECISION n10');
      EstTabAdd('IP_OTAM INTEGER 5');
      EstTabAdd('IP_REA1 DOUBLE PRECISION n10');
      EstTabAdd('IP_REA2 DOUBLE PRECISION n10');
    end
    else if (nometabela='ITENS_TABELAS_PRECOS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('IP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('IP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('IP_PROD DOUBLE PRECISION z4');
      EstTabAdd('IP_CORE DOUBLE PRECISION z4');
      EstTabAdd('IP_TAMA VARCHAR(5)');
      EstTabAdd('IP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('IP_TABE DOUBLE PRECISION z6');
      EstTabAdd('IP_TIME TIMESTAMP');
      EstTabAdd('IP_TIPZ VARCHAR(1)');
      EstTabAdd('IP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela='PRECOS_PROMOCIONAIS') then
    begin
      EstTabClear;
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_OTAM INTEGER 5');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_PRE1 DOUBLE PRECISION n10');
      EstTabAdd('PP_PRE2 DOUBLE PRECISION n10');
      EstTabAdd('PP_TIME TIMESTAMP');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_CONCR DOUBLE PRECISION n10');
    end
    else if (nometabela='PRECOS_PROMOCIONAIS_EXCLUIDOS') then
    begin
      EstTabClear;
      EstTabAdd('PP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('PP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('PP_PROD DOUBLE PRECISION z4');
      EstTabAdd('PP_CORE DOUBLE PRECISION z4');
      EstTabAdd('PP_TAMA VARCHAR(5)');
      EstTabAdd('PP_LOJA DOUBLE PRECISION z2');
      EstTabAdd('PP_DAT1 TIMESTAMP');
      EstTabAdd('PP_DAT2 TIMESTAMP');
      EstTabAdd('PP_TIPZ VARCHAR(1)');
      EstTabAdd('PP_PREC DOUBLE PRECISION n13');
    end
    else if (nometabela='CRELOJA') then
    begin
      EstTabClear;
      EstTabAdd('LO_CODI DOUBLE PRECISION z2');
      EstTabAdd('LO_NOME VARCHAR(40)');
      EstTabAdd('LO_FF8E VARCHAR(1)');
      EstTabAdd('LO_ESTA VARCHAR(2)');
    end
    else if (nometabela='USERS') then
    begin
      EstTabClear;
      EstTabAdd('USCODE     DOUBLE PRECISION z4');
      EstTabAdd('USALIAS    VARCHAR(10)');
      EstTabAdd('USNAME     VARCHAR(40)');
      EstTabAdd('USPASSWORD VARCHAR(6)');
      EstTabAdd('USTYPE     VARCHAR(1)');
      EstTabAdd('USDCAD     TIMESTAMP');
      EstTabAdd('USSESSION  DOUBLE PRECISION z3');
      EstTabAdd('USGRUPO    DOUBLE PRECISION z2');
    end
    else if (nometabela='VENDEDORES') then
    begin
      EstTabClear;
      EstTabAdd('VD_CODI DOUBLE PRECISION z6');
      EstTabAdd('VD_NOME VARCHAR(40)');
      EstTabAdd('VD_CARG VARCHAR(30)');
      EstTabAdd('VD_LOJA DOUBLE PRECISION z2');
      EstTabAdd('VD_APEL VARCHAR(20)');
      EstTabAdd('VD_SENH VARCHAR(20)');
      EstTabAdd('VD_COMA DOUBLE PRECISION n10');
      EstTabAdd('VD_COMP DOUBLE PRECISION n10');
      EstTabAdd('VD_STAT VARCHAR(1)');
    end
    else if (nometabela='FORNECEDORES') then
    begin
      EstTabClear;
      EstTabAdd('FO_CODI DOUBLE PRECISION z6');
      EstTabAdd('FO_RAZA VARCHAR(40)');
      EstTabAdd('FO_NFAN VARCHAR(30)');
    end
    else if (nometabela='BANCOS') then
    begin
      EstTabClear;
      EstTabAdd('BA_CODI DOUBLE PRECISION z3');
      EstTabAdd('BA_NOME VARCHAR(40)');
      EstTabAdd('BA_SITE VARCHAR(80)');
    end
    else if (nometabela='CONTAS') then
    begin
      EstTabClear;
      EstTabAdd('CO_CODI DOUBLE PRECISION z10');
      EstTabAdd('CO_DESC VARCHAR(30)');
      EstTabAdd('CO_HIST VARCHAR(50)');
      EstTabAdd('CO_NATU VARCHAR(1)');
      EstTabAdd('CO_GRUP DOUBLE PRECISION z4');
      EstTabAdd('CO_ESTOQ VARCHAR(1)');
    end
    else if (nometabela='GRUPOS_CONTAS') then
    begin
      EstTabClear;
      EstTabAdd('GR_CODI DOUBLE PRECISION z4');
      EstTabAdd('GR_DESC VARCHAR(30)');
      EstTabAdd('GR_NATU VARCHAR(1)');
    end
    else if (nometabela='ALIQUOTAS_PRODUTOS') then
    begin
      EstTabClear;
      EstTabAdd('AP_GRUP DOUBLE PRECISION z2');
      EstTabAdd('AP_SUBG DOUBLE PRECISION z2');
      EstTabAdd('AP_PROD DOUBLE PRECISION z4');
      EstTabAdd('AP_ESTA VARCHAR(2)');
      EstTabAdd('AP_ICMS DOUBLE PRECISION n10');
      EstTabAdd('AP_ISUB DOUBLE PRECISION n10');
      EstTabAdd('AP_ISENTO VARCHAR(5)');
    end
    else if (nometabela='CONFIG_CODIGO_BARRAS') then
    begin
      EstTabClear;
      EstTabAdd('CAMPO   SMALLINT 2');
      EstTabAdd('ESPACO	 SMALLINT 2');
    end
    else if (nometabela='MTV_ATDOS') then
    begin
      EstTabClear;
      EstTabAdd('MA_CODI DOUBLE PRECISION z3');
      EstTabAdd('MA_DESC VARCHAR(40)');
    end;
  end;
  {******************************************************************}
  if ltEstTab.count = 0 then
  begin
    try
      clAux := TClassAuxiliar.Create;
      clAux.Conect(database,nil);
      clAux.ClearSql;
      clAux.AddParam('Select * from '+NomeTabela+' Where ''a'' = ''b''');
      clAux.Execute;
      for i := 0 to clAux.consulta.FieldCount - 1 do
      begin
        EstTabAdd(uppercase(clAux.consulta.Fields[i].FieldName));
        case TipoDataType(clAux.consulta.fields[i].datatype) of
          dtcharacter: ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' VARCHAR('+IntToStr(clAux.consulta.fields[i].datasize)+')';
          dtInteiro  : ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' INTEGER 15';
          dtnumero   : ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' DOUBLE PRECISION n15';
          dtdata     : ltEstTab[ltEstTab.count - 1] := ltEstTab[ltEstTab.count - 1]+ ' TIMESTAMP ';
        end;
      end;
    finally
      clAux.Desconect;
      clAux.Destroy;
    end;
  end;

  ind := 0;
  while (ind < ltEstTab.count) do
  begin
    nomecampo := trim(Copy(ltEstTab[ind],1,Pos(' ',ltEstTab[ind])));
    tipocampo := trim(Copy(ltEstTab[ind],Pos(' ',ltEstTab[ind]),length(ltEstTab[ind])));
    if (Pos('VARCHAR',tipocampo) > 0) then
      clArq.aStructArq[ind+1].tipo := ftString
    else
    if (Pos('DOUBLE PRECISION',tipocampo) > 0) then
      clArq.aStructArq[ind+1].tipo := ftFloat
    else
    if (Pos('INTEGER',tipocampo) > 0) or (Pos('SMALLINT',tipocampo) > 0) then
      clArq.aStructArq[ind+1].tipo := ftInteger
    else
    if (Pos('TIMESTAMP',tipocampo) > 0) or (Pos('DATETIME',tipocampo) > 0) then
      clArq.aStructArq[ind+1].tipo := ftDateTime;
    clArq.aStructArq[ind+1].nomecampo := nomecampo;
    clArq.aStructArq[ind+1].pos       := ind+1;
    clArq.aStructArq[ind+1].sep       := ';';
    ind := ind + 1;
  end;
end;

procedure TClassExport.MontaComandoUpdateNaTabela(nometabela: string; clAux: TClassAuxiliar;
       nomecampofiltro: string; tipocampofiltro: string; filtro: string);
var
linha,nomecampo: string;
ind: integer;
campo: TStructTXT2;
lc_nomecampofiltro,lc_tipocampofiltro,lc_filtro: string;
begin
     clAux.ClearSql;
     clAux.AddParam ('UPDATE '+nometabela+' SET ');
     nomecampo := trim(Copy(ltEstTab[0],1,pos(' ',ltEstTab[0])));
     linha := nomecampo+'=:'+nomecampo;
     ind:=1;
     while (ind<ltEstTab.count) do // -1 do ID pq é auto_increment do banco
     begin
          nomecampo := trim(Copy(ltEstTab[ind],1,pos(' ',ltEstTab[ind])));
          if (nomecampo = 'ID') then
          begin
            ind := ind + 1;
            Continue;
          end;
          linha := linha + ','+ nomecampo+'=:'+nomecampo;
          ind:=ind+1;
     end;
     clAux.AddParam (linha);
     clAux.AddParam (' WHERE  ');
     nomecampofiltro:=nomecampofiltro+',';
     tipocampofiltro:=tipocampofiltro+',';
     filtro:=filtro+',';
     while (trim(nomecampofiltro)<>',') do
     begin
         lc_nomecampofiltro := Copy(nomecampofiltro,1,Pos(',',nomecampofiltro)-1);
         delete(nomecampofiltro,1,Pos(',',nomecampofiltro));
         lc_tipocampofiltro := Copy(tipocampofiltro,1,Pos(',',tipocampofiltro)-1);
         delete(tipocampofiltro,1,Pos(',',tipocampofiltro));
         lc_filtro := Copy(filtro,1,Pos(',',filtro)-1);
         delete(filtro,1,Pos(',',filtro));
         clAux.AddParam ('      ('+lc_nomecampofiltro+'=:'+lc_nomecampofiltro+') ');
         if (lc_tipocampofiltro='d') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsDateTime := strtodate(lc_filtro)
         else if (lc_tipocampofiltro='f') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsFloat := strtofloat(lc_filtro)
         else if (lc_tipocampofiltro='c') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsString := lc_filtro
         else if (lc_tipocampofiltro='i') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsInteger := strtoint(lc_filtro);
         if (trim(nomecampofiltro)<>'') then
              clAux.AddParam(' AND ')
         else nomecampofiltro := ',';
     end;
end;

Function TClassExport.ImportaTabela(database,nometabela,nomearquivo,labelarquivo: string;
                      nomecampofiltro,tipocampofiltro: string; memo1: TMemo; gauge: TGauge; usagauge: boolean; TipoImporta: string;flayout:integer=0;fexcimp:boolean=false):TClassTXT2;
var
  nomecampofiltro_aux,tipocampofiltro_aux: string;
  lc_nomecampofiltro,lc_tipocampofiltro: string;
  valorcampofiltro_aux: string;
  clAux,clAux1: TClassAuxiliar;
  clTxt: TClassTXT2;
  continua: boolean;
  total_novos,indfiltros: integer;
  indGauge,totGauge: integer;
begin
      result := Nil;
     //LIMPA A TABELA, EM CASO DE EXPORTACAO TOTAL
     if (tipoImporta='T') and not fexcimp then
      LimpaTabela(database,nometabela);

     nomecampofiltro_aux := nomecampofiltro;
     tipocampofiltro_aux := tipocampofiltro;
     clTxt := TClassTXT2.Create;
     try
        clTxt.Open   (nomearquivo,1);
        continua:=true;
     except
        memo1.lines.Add (' '+form_tc2(labelarquivo,17,'.')+': Arquivo '+nomearquivo+' não encontrado');
        memo1.refresh;
        continua:=false;
     end;
     if (continua) then
     begin
         MontaEstruturaTabelaImportacao (database,nometabela,clTxt);
         if (usagauge) then
             gauge.visible:=true;
         indGauge:=0;totGauge:=clTxt.RecordCount;
         clAux := TClassAuxiliar.Create;
         clAux.conect   (database,nil);
         total_novos := 0;
         while (not clTxt.Feof) do
         begin
             clTxt.Next; {*}
             {*******************************************************************}
             {capturando os valores de chave primaria e preenchendo um vetor}
             indfiltros:=1;
             nomecampofiltro:=nomecampofiltro_aux+',';
             tipocampofiltro:=tipocampofiltro_aux+',';
             valorcampofiltro_aux:='';
             while (trim(nomecampofiltro)<>',') do
             begin
                 lc_nomecampofiltro := Copy(nomecampofiltro,1,Pos(',',nomecampofiltro)-1);
                 delete(nomecampofiltro,1,Pos(',',nomecampofiltro));
                 lc_tipocampofiltro := Copy(tipocampofiltro,1,Pos(',',tipocampofiltro)-1);
                 delete(tipocampofiltro,1,Pos(',',tipocampofiltro));
                 if (lc_tipocampofiltro='c') then
                     valorcampofiltro_aux := valorcampofiltro_aux + ',' + trim(clTxt.FieldByName(lc_nomecampofiltro))
                 else if (lc_tipocampofiltro='f') then
                      valorcampofiltro_aux := valorcampofiltro_aux + ',' + floattostr(clTxt.FieldByName(lc_nomecampofiltro))
                 else if (lc_tipocampofiltro='d') then
                      valorcampofiltro_aux := valorcampofiltro_aux + ',' + datetostr(clTxt.FieldByName(lc_nomecampofiltro))
                 else if (lc_tipocampofiltro='i') then
                      valorcampofiltro_aux := valorcampofiltro_aux + ',' + inttostr(clTxt.FieldByName(lc_nomecampofiltro));
                 indfiltros:=indfiltros+1;
                 if (trim(nomecampofiltro)<>'') then
                      clAux.AddParam(' AND ')
                 else nomecampofiltro := ',';
             end;
             if (trim(valorcampofiltro_aux)<>'') then //apagando a primaira ','
                 delete(valorcampofiltro_aux,1,1);
             {*******************************************************************}
             if (tipoImporta='P') or fexcimp then //IMPORTACAO 'PARCIAL'
             begin
                 clAux1 := TClassAuxiliar.Create;
                 clAux1.conect   (database,nil);
                 clAux1.ClearSql;
                 clAux1.AddParam ('SELECT * FROM '+nometabela+' ');
                 MontaClausulaWhereDoSelect(clAux1,nomecampofiltro_aux,tipocampofiltro_aux,valorcampofiltro_aux);
                 if (not clAux1.Execute) then
                 begin
                      MontaComandoInsertNaTabela(nometabela,clAux);
                      InsereCamposNoRegistroDaTabela(clAux,clTxt);
                      total_novos := total_novos + 1;
                 end
                 else
                 begin
                      if (nometabela<>'VENDAS') and
                         (nometabela<>'VENDAS_EXCESSO') and
                         (nometabela<>'VENDAS_FORMA_PAGAMENTO') and
                         (nometabela<>'VENDAS_ATENDIMENTO') and
                         (nometabela<>'ITENS_VENDAS') and
                         (nometabela<>'CARTOES') and
                         (nometabela<>'CARTOES_PARCELAS') and
                         (nometabela<>'CREDIARIOS') and
                         (nometabela<>'CHEQUES') and
                         (nometabela<>'VALES_RECEBIDOS') and
                         (nometabela<>'LANCAMENTOS_CAIXA') and
                         (nometabela<>'VALES_EMITIDOS') and
                         (nometabela<>'HISTORICO_PRECOS') and
                         (nometabela<>'TRANSF_LOJA') then
                      begin
                          MontaComandoUpdateNaTabela(nometabela,clAux,
                                nomecampofiltro_aux,tipocampofiltro_aux,valorcampofiltro_aux);
                          InsereCamposNoRegistroDaTabela(clAux,clTxt);
                      end;
                 end;
                 clAux1.desconect;
                 clAux1.Free;
             end
             else if (tipoImporta='T') then //IMPORTACAO 'TOTAL'
             begin
               MontaComandoInsertNaTabela(nometabela,clAux);
               InsereCamposNoRegistroDaTabela(clAux,clTxt);
               total_novos := total_novos + 1;
             end;

             {prox. registro------>}
             indGauge:=indGauge+1;
             if (usagauge) then
                  gauge.progress:=Round((indGauge/totGauge)*100);
         end;
         clTxt.Close;
         if (usagauge) then
            gauge.visible:=false;
         clAux.desconect;
         clAux.Free;
         if flayout = 0 then
           memo1.lines.Add (' '+form_tc2(labelarquivo,17,'.')+': OK - Total de registros..: '+form_n(indGauge,5)+
                            ' Incluídos...: '+form_n(total_novos,5))
         else
           memo1.lines.Add (' '+form_tc2(labelarquivo,17,'.')+': OK - Total..: '+form_n(indGauge,10)+
                            ' Registros alterados..: '+form_n(indGauge - total_novos,10));


         memo1.refresh;
     end;
     if flayout <> 0 then
       result := clTxt
     else
       clTxt.Free;
end;

procedure TClassExport.MontaClausulaWhereDoSelect(clAux: TClassAuxiliar;
               nomecampofiltro: string; tipocampofiltro: string; filtro: string);
var
lc_nomecampofiltro,lc_tipocampofiltro,lc_filtro: string;
begin
     clAux.AddParam (' WHERE  ');
     nomecampofiltro:=nomecampofiltro+',';
     tipocampofiltro:=tipocampofiltro+',';
     filtro:=filtro+',';
     while (trim(nomecampofiltro)<>',') do
     begin
         lc_nomecampofiltro := Copy(nomecampofiltro,1,Pos(',',nomecampofiltro)-1);
         delete(nomecampofiltro,1,Pos(',',nomecampofiltro));
         lc_tipocampofiltro := Copy(tipocampofiltro,1,Pos(',',tipocampofiltro)-1);
         delete(tipocampofiltro,1,Pos(',',tipocampofiltro));
         lc_filtro := Copy(filtro,1,Pos(',',filtro)-1);
         delete(filtro,1,Pos(',',filtro));
         clAux.AddParam ('      ('+lc_nomecampofiltro+'=:'+lc_nomecampofiltro+') ');
         if (lc_tipocampofiltro='d') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsDateTime := strtodate(lc_filtro)
         else if (lc_tipocampofiltro='f') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsFloat := strtofloat(lc_filtro)
         else if (lc_tipocampofiltro='c') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsString := lc_filtro
         else if (lc_tipocampofiltro='i') then
              clAux.consulta.parambyname(lc_nomecampofiltro).AsInteger := strtoint(lc_filtro);
         if (trim(nomecampofiltro)<>'') then
              clAux.AddParam(' AND ')
         else nomecampofiltro := ',';
     end;
end;

procedure TClassExport.LimpaTabela(database,nometabela: string);
var
clAux: TClassAuxiliar;
begin
     clAux := TClassAuxiliar.Create;
     clAux.conect   (database,nil);
     clAux.ClearSql;
     clAux.AddParam ('DELETE FROM '+nometabela);
     clAux.Execute;
     clAux.desconect;
     clAux.Free;
end;

end.
