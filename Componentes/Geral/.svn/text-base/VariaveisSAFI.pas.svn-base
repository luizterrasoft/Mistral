unit VariaveisSAFI;

interface

type

     TChavesRec       = Record
      Documento       : String;
      DocumentoOrigem : String;
      Origem          : String[3];
      PagRec          : String[1];
      CliForn         : String;
      Empresa         : String;
      Duplicata       : String;
      FPag            : String;
      Caixa           : String;
      ValorEmitido    :Currency;
      ValorPago       :Currency;
      Pagamento       :Tdatetime;
      IndSubst        :Integer;
     end;

    TVetChavesRec = Array of TChavesRec;


    TDocumentosUnidos = Record
      DocumentoOrigem   :string;
      Documento         :String;
      Origem            :String;
      ClienteFornecedor :String;
      Caixa             :String;
    end;

    TVetorDocUnidos = Array of TDocumentosUnidos;

  TDocumentoDetal = Record
    Documento :String;
    Caixa     :String;
    Origem    :String;
    CliForn   :String;
    NomeCliForn   :String;
    Empresa   :String;
    Valor:Currency;
    BaixaParcial : Boolean;
    ValorBaixaParcial : Currency;
    DataBaixaParcial : TDateTime;
    Duplicata   : String;
    CliFornPrincipal   :String;
    DocumentoPrincipal :String;
    OrigemPrincipal    :String;
    CaixaPrincipal     :String;
    IndSubst           :Word;
  end;

  TVetorDocDetal = Array of TDocumentoDetal;

  TOrigem   = (ORC,NTF,PDV,COM,PED,FIN,DEV,TRF,NTS,SES);

 //Orçamento,Nota Fiscais,PDV,Compras,Pedido,Lançamentos no financeiro,Devoluções,Transferencia

 TPagouRec = (Pagamento,Recebimento);


 TInfComplementar = Record
   CCusto       : String;
   Conta        : String;
   Situacao     : String;
   Categoria    : integer;
   SubCategoria : Integer;
 end;



 //NESSA UNIT SOMENTE TIPOS E VARIÁVEIS UTILIZADOS PELO SISTEMA

implementation

end.
