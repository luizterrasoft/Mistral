unit upgrades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ComCtrls, Printers, DbTables, Db;

procedure Upgrade1_30062005;

implementation

procedure Upgrade1_30062005;
var
  clAux,clAux2,clAux3: TClassAuxiliar;
  total_comissionavel: Real;
  total_nao_comissionavel: Real;
begin
     //... Analisando todas as vendas contidas no banco
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VE_LOJA,VE_CAIX,VE_CODI,VE_TOTA,VE_COMI   ');
  clAux.AddParam ('FROM VENDAS                                      ');
  clAux.Execute;
  clAux.first;
  while (not clAux.eof) do
  begin
         //***********************************************************************
         // 1. PREENCHENDO A TABELA 'VENDAS_ATENDIMENTO'
         //***********************************************************************
    clAux2 := TClassAuxiliar.Create;
    clAux2.conect   ('VENDAS',self);
    clAux2.ClearSql;
    clAux2.AddParam ('SELECT IV_VEDE,                                      ');
    clAux2.AddParam ('       SUM(IV_QTDE) as TOTAL_QTDE,                   ');
    clAux2.AddParam ('       SUM(IV_TOTA) as TOTAL_VENDA                   ');
    clAux2.AddParam ('FROM   ITENS_VENDAS                                  ');
    clAux2.AddParam ('WHERE (IV_LOJA=:loja) AND                            ');
    clAux2.AddParam ('      (IV_CAIX=:terminal) AND                        ');
    clAux2.AddParam ('      (IV_VEND=:venda) AND                           ');
    clAux2.AddParam ('      (IV_TOTA>0.00)                                 ');
    clAux2.AddParam ('GROUP BY IV_VEDE                                     ');
    clAux2.consulta.parambyname('loja').AsFloat     := clAux.result('IV_LOJA');
    clAux2.consulta.parambyname('terminal').AsFloat := clAux.result('IV_CAIX');
    clAux2.consulta.parambyname('venda').AsFloat    := clAux.result('IV_VEND');
    clAux2.Execute;

         {...}
    clAux2.first;
    while (not clAux2.eof) do
    begin
      clAux3 := TClassAuxiliar.Create;
      clAux3.conect   ('VENDAS',self);
      clAux3.ClearSql;
      clAux3.AddParam ('SELECT VA_VEDE                                       ');
      clAux3.AddParam ('FROM   VENDAS_ATENDIMENTO                            ');
      clAux3.AddParam ('WHERE (VA_LOJA=:loja) AND                            ');
      clAux3.AddParam ('      (VA_CAIX=:terminal) AND                        ');
      clAux3.AddParam ('      (VA_VEND=:venda) AND                           ');
      clAux3.AddParam ('      (VA_VEDE)                                      ');
      clAux3.consulta.parambyname('loja').AsFloat     := clAux.result('IV_LOJA');
      clAux3.consulta.parambyname('terminal').AsFloat := clAux.result('IV_CAIX');
      clAux3.consulta.parambyname('venda').AsFloat    := clAux.result('IV_VEND');
      clAux3.consulta.parambyname('venda').AsFloat    := clAux2.result('IV_VEDE'); //vendedor
      if (not clAux3.Execute) then
      begin
        clAux3.ClearSql;
        clAux3.AddParam ('INSERT INTO VENDAS_ATENDIMENTO (VA_LOJA,VA_CAIX,VA_VEND,VA_VEDE,VA_QTDE,VA_TOTA,VA_COMI)  ');
        clAux3.AddParam ('VALUES (:VA_LOJA,:VA_CAIX,:VA_VEND,:VA_VEDE,:VA_QTDE,:VA_TOTA,:VA_COMI)                   ');
        clAux3.consulta.parambyname('VA_LOJA').AsFloat := clAux.result('IV_LOJA');
        clAux3.consulta.parambyname('VA_CAIX').AsFloat := clAux.result('IV_CAIX');
        clAux3.consulta.parambyname('VA_VEND').AsFloat := clAux.result('IV_VEND');
        clAux3.consulta.parambyname('VA_VEDE').AsFloat := clAux2.result('IV_VEDE'); //vendedor
        clAux3.consulta.parambyname('VA_QTDE').AsFloat := clAux2.result('TOTAL_QTDE');
        clAux3.consulta.parambyname('VA_COMI').AsFloat := (y_percentual_comissionavel)*clAux2.result('TOTAL_VENDA');
        clAux3.consulta.parambyname('VA_TOTA').AsFloat := clAux2.result('TOTAL_VENDA');
        clAux3.Execute; {*}
      end;
      clAux3.desconect;
      clAux3.Free;

              {--->}
      clAux.next;
    end;
    clAux2.desconect;
    clAux2.Free;

         //***********************************************************************
         // 2. PREENCHENDO O CAMPO 'VE_COMI'
         //***********************************************************************
    if (clAux.result('VE_COMI')=0.00) then
    begin
      clAux2 := TClassAuxiliar.Create;
      clAux2.conect   ('VENDAS',self);
      clAux2.ClearSql;
      clAux2.AddParam ('SELECT VF_FPGT,VF_VALO                               ');
      clAux2.AddParam ('FROM   VENDAS_FORMA_PAGAMENTO                        ');
      clAux2.AddParam ('WHERE (VF_LOJA=:loja) AND                            ');
      clAux2.AddParam ('      (VF_CAIX=:terminal) AND                        ');
      clAux2.AddParam ('      (VF_VEND=:venda)                               ');
      clAux2.consulta.parambyname('loja').AsFloat     := clAux.result('IV_LOJA');
      clAux2.consulta.parambyname('terminal').AsFloat := clAux.result('IV_CAIX');
      clAux2.consulta.parambyname('venda').AsFloat    := clAux.result('IV_VEND');
      clAux2.Execute;
      clAux2.first;
      total_comissionavel     := 0.00;
      total_nao_comissionavel := 0.00;
      while (not clAux2.eof) do
      begin
        if (clAux2.result('VF_FPGT')=KFPGT_DINHEIRO) or
          (clAux2.result('VF_FPGT')=KFPGT_CHEQUE)   or
          (clAux2.result('VF_FPGT')=KFPGT_DEBITO)   or
          (clAux2.result('VF_FPGT')=KFPGT_CARTAO)   or
          (clAux2.result('VF_FPGT')=KFPGT_CREDITO)  then
          total_comissionavel := total_comissionavel + clAux2.result('VF_VALO')
        else
          total_nao_comissionavel := total_nao_comissionavel + clAux2.result('VF_VALO');

                  {--->}
        clAux2.next;
      end;
      clAux2.desconect;
      clAux2.Free;

             {...}
      clAux3 := TClassAuxiliar.Create;
      clAux3.conect   ('VENDAS',self);
      clAux3.ClearSql;
      clAux3.AddParam ('UPDATE VENDAS SET VE_COMI=:valor                     ');
      clAux3.AddParam ('WHERE (VE_LOJA=:loja) AND                            ');
      clAux3.AddParam ('      (VE_CAIX=:terminal) AND                        ');
      clAux3.AddParam ('      (VE_VEND=:venda)                               ');
      clAux3.consulta.parambyname('loja').AsFloat     := clAux.result('IV_LOJA');
      clAux3.consulta.parambyname('terminal').AsFloat := clAux.result('IV_CAIX');
      clAux3.consulta.parambyname('venda').AsFloat    := clAux.result('IV_VEND');
      clAux3.consulta.parambyname('valor').AsFloat    := total_comissionavel;
      clAux3.Execute; {*}
      clAux3.desconect;
      clAux3.Free;
    end;

         {---> proxima venda do cadastro}
    clAux.next;
  end;
  clAux.desconect;
  clAux.Free;
end;

end.
