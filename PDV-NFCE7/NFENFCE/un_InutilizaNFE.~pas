unit un_InutilizaNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DateUtils;

type
  TFrm_InutilizaNFE = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtNSerie: TEdit;
    edtNInicial: TEdit;
    edtNFinal: TEdit;
    lblCNPJ: TLabel;
    lblANO: TLabel;
    MXMotivo2: TMemo;
    rdgMODELO: TRadioGroup;
    btnInutilizar: TButton;
    btnSair: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);

  private
    { Private declarations }
     procedure TRATA_ERROS_NFCE(DescrErro : String) ;
     procedure INUTILIZA_NFCE;

  public
    { Public declarations }
    Cancelamento_Sucesso, cancelado_com_sucesso : Boolean;
    Status, NDOC, NCHNFE, NARQUIVO, NOMESAI, cStat : String;
    lArq,vrAux : TStringList; CNPJ_SEM_CARACTERES : String;

  end;

var
  Frm_InutilizaNFE: TFrm_InutilizaNFE;

implementation

uses auxiliar, AuxiliarNFE, principal, un_CancelaVenda;

{$R *.dfm}

procedure TFrm_InutilizaNFE.btnSairClick(Sender: TObject);
begin
  If Status = 'OK:' then
     Cancelamento_Sucesso := Cancelamento_Sucesso;

  btnInutilizar.Enabled := True;
  Close;
end;

procedure TFrm_InutilizaNFE.FormActivate(Sender: TObject);
var
  clConf : TClassAuxiliar;
begin
//  lblNDOC.Caption := Frm_CancelaVenda.ds1.DataSet.fieldbyname('VE_NOTA').AsString;
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('VENDAS',self);
  clConf.ClearSql;
  clConf.AddParam ('SELECT * FROM CONF');
  clConf.Execute;
  clConf.First;

  lblCNPJ.Caption  := clConf.Result('CNPJ');

  CNPJ_SEM_CARACTERES := stringReplace(lblCNPJ.Caption, '.', '', []);

  CNPJ_SEM_CARACTERES := stringReplace(CNPJ_SEM_CARACTERES, '.', '', []);
  CNPJ_SEM_CARACTERES := stringReplace(CNPJ_SEM_CARACTERES, '-', '', []);
  CNPJ_SEM_CARACTERES := stringReplace(CNPJ_SEM_CARACTERES, '/', '', []);

  lblANO.Caption   := FormatDateTime('yyyy',Now);

  vrAux := TStringList.Create;


end;

procedure TFrm_InutilizaNFE.INUTILIZA_NFCE;
Var
    cLinhaJus : String; lArq : TStringList;
    x : integer;  Erro_cancela : Boolean;
    NOMESAI : String;
    INU_CNPJ, INU_ANO, INU_MOdelo,INU_Serie, INU_Inicial, INU_Final : String;
begin

    if rdgModelo.ItemIndex = 0 then
       INU_MODELO := '55'
    else
       INU_MODELO := '65';

    INU_Serie   := EdtNSerie.Text;
    INU_Inicial := edtNInicial.Text;
    INU_Final   := edtNFinal.Text;
    INU_ANO     := lblANO.Caption;

  lArq := TStringList.Create;
   Erro_cancela := false; cancelado_com_sucesso := False;
     For x := 0 To MXMotivo2.Lines.Count - 1 Do
      begin
        if trim(MXMotivo2.Lines.Strings[x]) <> '' then
           cLinhaJus := cLinhaJus + Trim(MXMotivo2.Lines.Strings[x]) +';';
     end;

      IF Length(cLinhaJus) >= 15 then
         Begin
         Erro_cancela := True;  cancelado_com_sucesso:=True;

       cLinhaJus := 'NFe.InutilizarNFe("'+CNPJ_SEM_CARACTERES+'","'+cLinhaJus+'",'+INU_Ano+','+INU_Modelo+','+INU_Serie+','+INU_Inicial+','+INU_Final+')';

      lArq.Text := cLinhaJus;

      lArq.SaveToFile('C:\MIstralNF\TXT\ENTNFEINUT'+NDOC+'.TXT');

      If Frm_Principal.MISTRAL_MSG = 1 then
           begin ShowMEssage('Gravou o Comando de INUTILIZACAO NFCE'); end;

           NOMESAI := 'C:\MIstralNF\TXT\SAINFEINUT'+NDOC+'.TXT';
      while not FileExists(NOMESAI) do

      Sleep(1000);
      //
      VrAux := ChecaStatusSefaz(NOMESAI, NDOC);
      cStat := VrAux[0];
      if cStat = 'OK:' then
        If Frm_Principal.MISTRAL_MSG = 1 then
           begin
              ShowMEssage('Nota INUTILIZADA Com sucesso');
          //     NCHNFE := VrAux[28];
              cancelado_com_sucesso := true;
           end
      else
          TRATA_ERROS_NFCE('ERRO: NA INUTILIZAÁ√O DA NOTA ') ;

  // Rotina para Testar se foi tudo com Sucesso
   // 33150822892162000114650010000001441964479882
    End  // Para o caso da Justificativa for maior que 15
  Else
     Begin
      ShowMessage ('O Motivo n„o pode ter menos de 15 caracteres ');
      cancelado_com_sucesso := False;
     End;
end;

//
procedure TFrm_InutilizaNFE.TRATA_ERROS_NFCE(DescrErro : String) ;
begin
  ShowMessage('Erro '+DescrErro);

end;


procedure TFrm_InutilizaNFE.btnInutilizarClick(Sender: TObject);
begin
    if rdgModelo.ItemIndex = -1 then
       Begin
         ShowMessage('Voce PRECISA escolher o Tipo da Nota. ');
         MXMOTIVO2.SetFocus;
         Exit;
       End;

    INUTILIZA_NFCE;

   If cancelado_com_sucesso then
      Begin
       Cancelamento_Sucesso := true;

       btnInutilizar.Enabled := false;

      End;

end;

end.
