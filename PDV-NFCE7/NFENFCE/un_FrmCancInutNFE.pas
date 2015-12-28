unit un_FrmCancInutNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tfrm_CancInutNFE = class(TForm)
    Panel1: TPanel;
    btnCancelar: TButton;
    btnSair: TButton;
    Label1: TLabel;
    lblNDOC: TLabel;
    Label3: TLabel;
    lblChNFE: TLabel;
    Label5: TLabel;
    MXMOTIVO: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LERDADOS_NFE;
    procedure CANCELA_NFCE;
    procedure TRATA_ERROS_NFCE(DescrErro : String);
    Procedure IMPRIME_DANFE_CANCELADA;

  public
    { Public declarations }
    Cancelamento_Sucesso, cancelado_com_sucesso : Boolean;
    Status, NDOC, NCHNFE, NARQUIVO, NOMESAI, cStat : String;
    lArq,vrAux : TStringList;
  end;

var
  frm_CancInutNFE: Tfrm_CancInutNFE;

implementation

uses principal, AuxiliarNFE, un_CancelaVenda, auxiliar;

{$R *.dfm}

procedure Tfrm_CancInutNFE.FormActivate(Sender: TObject);
begin
 //
  lblNDOC.Caption := Frm_CancelaVenda.ds1.DataSet.fieldbyname('VE_NOTA').AsString;
 LERDADOS_NFE;
 lblChNFE.Caption := NCHNFE;
   NDOC := lblNDOC.Caption;
  vrAux := TStringList.Create;  
end;




procedure Tfrm_CancInutNFE.LERDADOS_NFE;
var
  ClAux2 : TclassAuxiliar;

begin
  clAux2 := TClassAuxiliar.Create;
  clAux2.Conect(DataBaseProdutos,self);
  clAux2.ClearSql;
  clAux2.AddParam('SELECT ID,NFE_CHNFE, nFE_ARQUIVO              ');
  clAux2.AddParam('FROM DADOSNFE ');
  clAux2.AddParam('WHERE (ID=:ID)   ');
  clAux2.consulta.ParamByName('ID').Asinteger  := StrToInt(lblNDOC.Caption);
  if (clAux2.Execute) then
  begin
    NCHNFE   := clAux2.Result('NFE_CHNFE');
    NARQUIVO := clAux2.Result('NFE_ARQUIVO');

  end;
end;


procedure Tfrm_CancInutNFE.btnCancelarClick(Sender: TObject);
begin

    Cancela_NFCE;

   If cancelado_com_sucesso then
      Begin
       Cancelamento_Sucesso := true;

       IMPRIME_DANFE_CANCELADA;
       btnCancelar.Enabled := false;
    
      End;

end;

procedure Tfrm_CancInutNFE.CANCELA_NFCE;
Var
    cLinhaJus : String; lArq : TStringList;
    x : integer;  Erro_cancela : Boolean;
    NOMESAI : String;
begin

  lArq := TStringList.Create;
   Erro_cancela := false; cancelado_com_sucesso := False;
     For x := 0 To MXMotivo.Lines.Count - 1 Do
      begin
        if trim(MXMotivo.Lines.Strings[x]) <> '' then
           cLinhaJus := cLinhaJus + Trim(MXMotivo.Lines.Strings[x]) +';';
     end;

      IF Length(cLinhaJus) >= 15 then
         Begin
         Erro_cancela := True;  cancelado_com_sucesso:=True;
      cLinhaJus := 'NFe.CancelarNFe("'+trim(NCHNFE)+'","'+cLinhaJus+'")';

      lArq.Text := cLinhaJus;

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFECCNFCE'+NDOC+'.TXT');

      If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Gravou o Comando do Cancelamento NFCE'); end;

           NOMESAI := 'C:\MIstralNF\TXT\SAINFECCNFCE'+NDOC+'.TXT';
      while not FileExists(NOMESAI) do

      Sleep(1000);
      //
      VrAux := ChecaStatusSefaz(NOMESAI, NDOC);
      cStat := VrAux[0];
      if cStat = 'OK:' then
        If Frm_Principal.MISTRAL_MSG = 1 then
           begin
              ShowMEssage('Nota CANCELADA Com sucesso');
          //     NCHNFE := VrAux[28];
              cancelado_com_sucesso := true;
           end
      else
          TRATA_ERROS_NFCE('ERRO: ERRO NO CANCELAMENTO DA NOTA ') ;

  // Rotina para Testar se foi tudo com Sucesso
   // 33150822892162000114650010000001441964479882
    End  // Para o caso da Justificativa for maior que 15
  Else
     Begin
      ShowMessage ('O Motivo não pode ter menos de 15 caracteres ');
      cancelado_com_sucesso := False;
     End;
end;

procedure Tfrm_CancInutNFE.IMPRIME_DANFE_CANCELADA;
Var
    sCSTaTusDanfe : String; lArq : TStringList;

begin

  lArq := TStringList.Create;

      lArq.Text := 'NFe.ImprimirDanfe("'+trim(NARQUIVO)+'")';
      

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFECANC'+NDOC+'B.TXT');

      If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Gravou o Arquivo Para o Envio da DanFe'); end;

               NOMESAI := 'C:\MIstralNF\TXT\SAINFECANC'+NDOC+'B.TXT';

      while not FileExists(NOMESAI) do

      Sleep(1000);
      //
      VrAux := ChecaStatusSefaz(NOMESAI, NDOC);
      cStat := VrAux[0];

      if cStat = 'OK:' then
        If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Nota Cancelada Impressa Com sucesso'); end
        else
          TRATA_ERROS_NFCE('ERRO: NOTA NÃO ENVIADA') ;

  // Rotina para Testar se foi tudo com Sucesso

  // Carregar a Imagem do Botão Verde

    begin
      lArq.Text := 'NFe.ImprimirDanfePDF("'+trim(NARQUIVO)+'")';
      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFECANC'+NDOC+'C.TXT');

      If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Gravou o Arquivo Para Gerar o PDF do DANFE'); end;

           NOMESAI := 'C:\MIstralNF\TXT\SAINFECANC'+NDOC+'C.TXT';

      while not FileExists(NOMESAI) do

      Sleep(1000);
      //
      VrAux := ChecaStatusSefaz(NOMESAI, NDOC);
      cStat := VrAux[0];

      if cStat = 'OK:' then
        If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Arquivo PDF Gerado com sucesso'); end
      else
          TRATA_ERROS_NFCE('ERRO: PDF da NOTA NÃO CRIADA !') ;
     end;


 //
end;

//
procedure Tfrm_CancInutNFE.TRATA_ERROS_NFCE(DescrErro : String) ;
begin
  ShowMessage('Erro '+DescrErro);

end;


procedure Tfrm_CancInutNFE.btnSairClick(Sender: TObject);
begin

  If Status = 'OK:' then
     Cancelamento_Sucesso := Cancelamento_Sucesso;

  btnCancelar.Enabled := True;
  Close;
end;



end.
