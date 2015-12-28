unit ComboBoxOO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TComboBoxOO = class(TComboBox)
  private
    { Private declarations }
    nome: string; {nome do campo a que representa}
    fieldlength: integer; {tamanho da mascara do edit}
    valor: variant; {armazena o valor do atributo 'text', em seu tipo real}
    campo: string; {armazena o nome do campo o qual esta relacionado, se existir}
    entidade: string; {armazena o nome da tabela no BD o qual esta relacionado, se existir}
    mensagemF1: string; {armazena a mensagem de ajuda que deve ser exibida no F1}

    {**** metodos de formatacao p/ uso interno ****}
    function form_t(s:string; tam:byte):string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure SetValor(valor: variant); {seta o valor do atributo 'text', recebendo qualquer tipo como parametro}
    function  GetValor:variant; {retorna o valor do atributo 'text', em seu tipo real}
    function  GetValorFormatado:string; {retorna o valor do atributo 'text', em seu tipo real - FORMATADO}
    function  VerificaValor:boolean; {verifica se o texto digitado esta na propriedade ITEMS do objeto}
  published
    { Published declarations }
    property zNomeOO: string read nome write nome;
    property zFieldLengthOO: integer read fieldlength write fieldlength;
    property zCampoOO: string read campo write campo;
    property zEntidadeOO: string read entidade write entidade;
    property zMensagemF1: string read mensagemF1 write mensagemF1;
  end;

procedure Register;

implementation

constructor TComboBoxOO.Create(AOwner : TComponent);
begin
     inherited Create(AOwner);
     fieldlength:= 0;
     campo      := '';
     entidade   := '';
     font.style := [fsBold];
     text       := '';
     CharCase   := ecUpperCase;
end;

function TComboBoxOO.form_t(s:string; tam:byte):string;
var
  formato:string;
begin
  formato:=s+'                                            '
  +'                                                                    ';
  formato:=copy(formato, 1, tam);
  form_t:=formato;
end;

procedure TComboBoxOO.SetValor(valor: variant);
begin
     text := form_t(valor,fieldlength)
end;

function TComboBoxOO.GetValor:variant;
begin
     if (Trim(text)<>'') then
         valor:=Trim(text)
     else valor:='';
     result:=valor;
end;

function TComboBoxOO.GetValorFormatado:string;
begin
     if (Trim(text)<>'') then
        valor:=form_t(text,fieldlength)
     else valor:=form_t(' ',fieldlength);
     result:=valor;
end;

function TComboBoxOO.VerificaValor:boolean;
begin
     if (Items.IndexOf(text)=-1) then result:=false
     else result:=true;
end;

procedure Register;
begin
     RegisterComponents('Edicao O.O.', [TComboBoxOO]);
end;

end.
