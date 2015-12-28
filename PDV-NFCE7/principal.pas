unit principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, Db, DBTables, Menus, inifiles,
  FileCtrl, jpeg, ExtDlgs, ColorPanelOO, LabelOO, Cep, AppEvnts, CupomFiscal,
  funcoesglobais, grids, dbgrids, Serial, UrlMon;

type
  Tfrm_principal = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    imagemEmpresa: TImage;
    pnSit: TPanel;
    pnData: TPanel;
    pnDia: TPanel;
    pnCaixa: TPanel;
    pnLoja: TPanel;
    pnECF: TPanel;
    Image2: TImage;
    pnHora: TPanel;
    lblNomeTela: TLabel;
    Image1: TImage;
    botao_sair: TPanel;
    Label1: TLabel;
    servidor_contaspagar: TDatabase;
    servidor_estoque: TDatabase;
    servidor_vendas: TDatabase;
    servidor_credito: TDatabase;
    timerClock: TTimer;
    qGeraCampoVENDAS: TQuery;
    qInsertLog: TQuery;
    lblStatus: TLabel;
    barraDicas: TPanel;
    edtOpcao: TEdit;
    Panel1: TPanel;
    pnCaixaAtiva: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pMenuPrincipal_1: TPanel;
    botao16: TPanel;
    botao15: TPanel;
    botao14: TPanel;
    botao13: TPanel;
    botao12: TPanel;
    botao11: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    botao18: TPanel;
    botao17: TPanel;
    lblSeq: TLabelOO;
    qGeraCampoCREDIARIO: TQuery;
    botaoCMC: TImage;
    lblCMC1: TLabelOO;
    lblCMC2: TLabelOO;
    papel_de_parede: TImage;
    imgMistral: TImage;
    lblversao: TLabelOO;
    Label4: TLabel;
    ApplicationEvents1: TApplicationEvents;
    qGeraCampoESTOQUE: TQuery;
    pMenuPrincipal_2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    botao21: TPanel;
    botao22: TPanel;
    botao23: TPanel;
    botao24: TPanel;
    botao25: TPanel;
    Label7: TLabel;
    QueryConcr: TQuery;
    QueryConcrConcorrente: TStringField;
    QueryConcrPreo: TFloatField;
    QueryConcrPercPrecVend: TStringField;
    QueryConcrPercPrecPro: TStringField;
    QueryProm: TQuery;
    QueryPromReferencia: TStringField;
    QueryPromDescricao: TStringField;
    QueryPromEmissao: TDateTimeField;
    QueryPromVencimento: TDateTimeField;
    QueryPromDias: TIntegerField;
    QueryPromes_pve1: TFloatField;
    QueryPromip_pre1: TFloatField;
    QueryPromVl_Promocional: TFloatField;
    QueryPromValorvenda: TFloatField;
    QueryPromPercVenda: TFloatField;
    QueryPrompp_grup: TFloatField;
    QueryPrompp_subg: TFloatField;
    QueryPrompp_prod: TFloatField;
    QueryPromPP_Concr: TFloatField;
    QueryPromNPesq: TStringField;
    PortaSerial: TSerialPort;
    imgSindilojas: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerClockTimer(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure botao_sairClick(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure botao11Click(Sender: TObject);
    procedure botao11MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao12MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao13MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao14MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao15MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao16MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao13Click(Sender: TObject);
    procedure botao16Click(Sender: TObject);
    procedure botao18Click(Sender: TObject);
    procedure botao17Click(Sender: TObject);
    procedure botao17MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao18MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao14Click(Sender: TObject);
    procedure botao12Click(Sender: TObject);
    procedure botao15Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblStatusDblClick(Sender: TObject);
    procedure imgMistralClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure botao21MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao22MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao23MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao24MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao21Click(Sender: TObject);
    procedure botao25MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure botao25Click(Sender: TObject);
    procedure botao22Click(Sender: TObject);
    procedure botao23Click(Sender: TObject);
    procedure botao24Click(Sender: TObject);
    procedure QueryPromCalcFields(DataSet: TDataSet);
    procedure QueryConcrCalcFields(DataSet: TDataSet);
    procedure Label4Click(Sender: TObject);
    procedure imgSindilojasClick(Sender: TObject);
    procedure VerificaProtecaoDoSistema;
    procedure bloquear_sistema_mistral;
  private
    procedure FGridPromDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure LeIniCred;
    procedure SetConfigLocalCred;
    { Private declarations }
  public
    clienteaut:Boolean;
    exibiu: Boolean;
    create: Boolean;
    arqdtef: String;
    Tem_Debito : string;

    //**********************************
    multiBoleta: Boolean;
    jaGravou: Boolean;
    fechamentoVenda: Boolean;
    //**********************************

    x_data_versao_sistema: TDateTime;
    x_Fecha_caixa: Boolean;
    x_senha_admin: String;
    x_estado: String; {sigla da UF de venda}
    x_loja: Real;  {codigo da loja o qual pertence o caixa}
    x_terminal: Real; {codigo do caixa o qual pertence o caixa}
    x_vendedor: Real; {codigo do vendedor que realizou a venda - o vendedor É UM VENDEDOR, em outro cadastro}
    x_venda: Real; {codigo da venda}
    x_trava_estoque: Boolean; {define o modo demo ou nao}
    x_fechar: Boolean;
    x_sistema: String; {nome do sistema}
    x_abrev_sistema: String; {abreviatura do sistema}
    x_banco_de_dados: Integer; {0-> INTERBASE; 1-> SQL SERVER - Banco VENDAS, ESTOQUE e CONTAS}
    x_banco_de_dados_crediario: Integer; {0-> INTERBASE; 1-> SQL SERVER - Banco CREDIARIO}
    x_banco_de_dados_contas: Integer; {0-> INTERBASE; 1-> SQL SERVER - Banco CONTAS A PAGAR}
    x_formato_data: Integer; {0-> dd/mm/yyyy; 1-> mm/dd/yyyy; dif. na conf. - VENDAS, ESTOQUE e CONTAS}
    x_formato_data_crediario: Integer; {0-> dd/mm/yyyy; 1-> mm/dd/yyyy; dif. na conf. - CREDIARIO}
    x_formato_data_local: Integer; {0-> dd/mm/yyyy; 1-> mm/dd/yyyy; dif. na conf. - VENDAS, ESTOQUE e CONTAS}
    x_formato_data_local_crediario: Integer; {0-> dd/mm/yyyy; 1-> mm/dd/yyyy; dif. na conf. - CREDIARIO}
    x_forma_leitura_cbarra_venda: Integer; {forma de leitura padrao do modo venda, para codigo de barras}
    x_exibe_alerta_offline: Boolean;
    x_forma_leitura_cbarra_troca: Integer; {forma de leitura padrao do modo troca, para codigo de barras}
    x_forma_leitura_cbarra_devolucao: Integer; {forma de leitura padrao do modo devolucao, para codigo de barras}
    x_path_fotos_clientes: String;

    x_endereco,x_cnpj,x_bairro,x_cidade,x_uf,x_cep,x_telefone,x_fax,x_insc: String;
    x_tempo_gaveta_venda: Integer; {tempo da gaveta}
    x_empresa: String; {nome da empresa que utiliza o sistema}
    x_email: String; {email da empresa que utiliza o sistema}
    x_codigo_empresa: Integer; {codigo de protecao do nome da empresa}
    x_opmenu:  Integer; {codigo da opcao de navegacao no menu}
    x_pathimg: String; {caminho dos bitmaps}
    x_pathlocal: String; {caminho local do sistema}
    x_codigomodulo: Integer; {codigo do modulo atualmente ativo}
    x_col_impressao: Integer; {80,132 - maximo n. de colunas de impressao}
    x_modo_impressao: Integer; {0-> modo texto; 1-> modo grafico; 2-> nativatexto}
    x_salto: Boolean; {o sistema salta um pagina ao final da impressao}
    x_modelo_impressao_geral: Integer; {0-> impressora matricial 1-> impressora jato de tinta}
    x_tam_fonte: Integer; {tamamho da fonte em modo grafico}
    x_tipo_fonte: String; {nome da fonte em modo grafico}
    x_arq_impressao: String; {nome do arquivo de impressao usado pelo NATIVATEXTO - *.REL}
    x_impressora: Integer; {nome da impressora: 0,1,2,3,4,5,6,7,8}
    x_comando: String; {guarda o comando a ser enviado para o NATIVATEXTO}
    x_critica_cnpj: Boolean;  {variavel que informa se o CNPJ deve ser criticado ou nao}
    x_nivel_permissao: Integer; {0-> controle a nivel de usuario, 1-> controle a nivel de grupo}
    x_data_trabalho: TDateTime;
    x_modelo_gaveta: Integer;  {* comandos embutidos no sistema}
    x_codigo_venda: Real; {* armazena a sequencia de codigo de venda}
    x_ecf: Real; {* armazena o codigo sequencial da ECF instalada}
    x_nota_fiscal: Real; {* armazena a sequencia de nota fiscal MANUAL -DENTRO}
    x_cupom_fiscal: Real; {* armazena a sequencia de cupom fiscal - PARA O CASO DE NAO SER POSSIVEL PEGAR DA IMPRESSORA}
    x_codigo_vale_mercadoria: Real; {* armazena a sequencia do vale mercadoria}
    x_romaneio: Real; {* armazena a sequencia do romaneio MANUAL -FORA}
    x_imagem_logomarca: String; {* endereco da imagem da logomarca}
    x_usuario_logado_no_banco: String; {nome do usuario logado no banco}
    x_situacao_mensagem: String;
    x_path_arquivos_vendas_destino: String; {pasta onde se localizarao os arquivos de vendas exportados}
    x_path_arquivos_produtos_origem: String; {pasta onde se localizarao os arquivo de produtos a serem importados}
    x_path_integracao_nfe          : String; //
    x_ecf_habilita_modo_fiscal: Boolean; {habilita o modo fiscal ou nao do PDV}
    x_ecf_habilita_TEF: Boolean; {habilita TEF ou nao do PDV}
    x_ecf_modo_venda: Integer; {determina se o sistema envia paralelamente à venda comandos ECF}
    x_ecf_modelo_impressora: Integer; {define o modelo da impressora}
    x_ecf_porta_comunicacao: String; {define a porta de comunicacao da impressora}
    x_ecf_max_tam_descricao_item_cupom: Integer; {tamanho maximo da descricao do produto a ser impresso}
    x_ecf_busca_proximo_COO: Boolean; {define se o sistema busca ou nao o COO na impressora fiscal}
    x_ecf_imprime_cupom_nao_fiscal_vinculado: Boolean; {flag que indica se sera impresso cupom nao-fiscal vinculado à forma de pagamento do ultimo cupom fiscal}
    x_ecf_codigo_de_barras_no_cupom: Integer; {configura o codigo de barras para ser impresso no CUPOM - INTERNO / EAN13}
    x_online: Boolean; {define se o programa esta trabalhando ON-LINE / OFF-LINE}
    x_Internet_ok: Boolean; {define se a Internet esta ON-LINE / OFF-LINE}
    x_forma_de_leitura_codigo_barras: Integer; {0-> pede a qtde. e substitue o valor la/1-> nao pede e incrementa a qtde.}
    x_adiciona_dv_codigo_barras: Boolean; {define se o codigo de barras dos itens possui ou nao o DV adicionado}
    x_caixa_ativo: Real; {armazena o codigo do caixa ativo}
    x_ativar_alerta_sequencial_venda: Boolean; {determina se a mudanca no numero de venda ativara ALERTA ou nao, caso o valor config. seja menor q a ultima venda registrada}
    x_permitir_cancelar_venda_com_cupom: Boolean; {flag que indica se pode ser cancelado venda por cupom}
    x_prevalecer_EAN13: Boolean; {fica prevalecendo o EAN13 no lancamento da venda}
    x_exibe_progresso_movimento: Boolean; {define se a barra de progresso das imp/exp de movimento é ativada}
    x_exploja_allcli :Boolean;{define se os clientes sem movimento tb irao ser exportados}
    x_tipo_funcionamento_sistema: Integer; {0- sistema funciona como ILHA, 1- sistema funciona como CAIXA}
    x_usa_reffab_slip: Boolean; {imprime a referência do fabricante no lugar da referência do produto no slip de atendimento}
    x_cli_sem_foto: Boolean; { permite cadastrar ou lançar contrato de cliente sem foto cadastrada}
    x_cli_sem_cep: Boolean; { permite cadastrar cliente sem CEP }
    x_senha_usuario_crediario: boolean; {solicita a senha do usuário para confirmar o cadastro do contrato no crediário}
    x_senha_gerente_cliente_zerado: boolean; {solicita a senha do gerente para liberar a venda para clientes com saldo zero}
    x_bloqueia_venda_valor: boolean; {Define se realiza bloqueio de vendas com valor máximo definido}
    x_valor_bloqueio_venda: Real;    {Valor máximo que uma venda pode ter para ser concluída}
    x_exibe_fornecedor_consulta: boolean; {Define se será exibido o fornecedor dos produtos nas consultas das lojas}
    x_exibe_preco_custo :boolean;{exibe preco custo}
    x_imprime_vendedor_cupom: boolean; {Define se será impresso nos cupons fiscais as informações do vendedor}
    {********************************************************************************************}

   {********************************************************************************************}
    {configuracoes gerais de produtos - no ESTOQUE.INI ***}
    {********************************************************************************************}
    x_ordem_codigo: Integer;
    x_ordem_refinterna: Integer;
    x_ordem_reffabric: Integer;
    x_ordem_cbarra: Integer;
    x_ordem_prod_cor_tam: Integer;
    x_ordem_cbarra_ean13: Integer;
    x_origem_cbarra: Integer;
    x_tipo_pvenda: Integer;
    x_margem_contrib: Real;
    x_desconto_venda_min: Real;
    x_desconto_venda_max: Real;
    x_linha: String;
    x_colecao: String;
    x_mat1: String;
    x_mat2: String;
    x_mat3: String;
    n_data: TDateTime;

    {********************************************************************************************}
    {variaveis usadas para chamar o CREDIARIO - CRED.INI ***}
    {********************************************************************************************}
    x_F8_cliente: Integer; {Determina qual a forma de consulta ao cliente clicando em F8}
                           {0-> consulta com endereco, 1-> consulta com CNPJ e Identidade}
    x_qualquer_endereco_carnet: Boolean; {diz se o endereco de cobranca é qualquer loja}
    x_endereco_carnet: String; {armaz. o endereco de pagamento dos carnets}
    x_obs1_carnet: String; {armaz. a observacao 01 do carnet}
    x_obs2_carnet: String; {armaz. a observacao 02 do carnet}
    x_flag_carnet_juros: Boolean; {flag. da pergunta "imprime juros no carnet"}
    x_dias_reabSPC: Integer; {dias de atraso para o relatorio de reabilitacao do SPC}
    x_pode_valor_dif_pago: Boolean; {flag que informa se o valor pago informado na baixa pode ser diferente}
    x_pode_loja_valor_menor: Boolean;
    x_tipo_loja: Integer; {0-> lojas, 1-> matriz(pulbicador de dados)}
                          {informacao importante para import.export. de movimento}
    x_tipo_imp_carnet: Integer; {0-> Generica/Somente texto; 1-> Impressora matricial qualquer}
    x_perc_lim_cred: Integer; {Percentagem aplicada sobre salario para obter lim. credito}
    x_critica_limite: Boolean; {Determina se os campos de limite serao criticados}
    x_trava_cliente: Boolean; {flag - false-> nao trava cliente; true-> trava cliente}
    x_arquivo_proposta: String; {arquivo que contem o texto da proposta}
    x_tipo_intervalo_atraso: Integer; {qual o tipo de intervalo usado pelo relat. de clientes em atraso}
    x_email_publicador: String; {email da loja publicadora de movimento}
    x_tipo_exportacao: Integer; {0-> email, 1-> ftp}
    x_ftp_host: String; {endereco de ftp - Ex.: ftp.hpg.com.br}
    x_ftp_userid: String; {user..: do ftp}
    x_ftp_password: String; {senha..: do ftp}
    x_ftp_diretorio_inicial: String; {diretorio inicial no servidor de FTP:}
    x_rodape_aviso: String; {texto de rodape do aviso de cobranca - modelo matricial}
    x_ordem_diario_receb1: Integer; {ordem da listagem de diario de recebimento}
    x_ordem_diario_emissao1: Integer; {ordem da listagem de diario de emissao de contratos}
    x_ordem_diario_prest1: Integer; {ordem da listagem de diario de prestacoes a vencer}
    x_video_entrada_width: Integer; {resolucao do video entrada- pixels para comprimento}
    x_video_entrada_height: Integer; {resolucao do video entrada- pixels para altura}
    x_video_entrada_color: Integer; {resolucao do video entrada- resolucao de cores}
    x_video_saida_width: Integer; {resolucao do video saida- pixels para comprimento}
    x_video_saida_height: Integer; {resolucao do video saida- pixels para altura}
    x_video_saida_color: Integer; {resolucao do video saida- resolucao de cores}
    x_modificar_video: Boolean; {informa se o video sera configurado na exec. do sistema}
    x_alteracao_contrato_consulta: Boolean; {informa se permite ou nao alt. de contrato peloa consulta}
    x_senha_ger_alt_cons: Boolean; {informa se permite ou nao alt. de contrato peloa consulta}
    x_tamanho_nome_cliente: Integer; {tamanho do campo do nome do cliente}
    x_pathsystem: String; {caminho do CREDIARIO}
    x_frente_loja: Real; {codigo da loja do frente de loja}
    x_frente_loja1: Integer; {codigo da loja do frente de loja}
    x_etiquetas_colunas: Integer;
    x_etiquetas_texto: Integer;
    x_etiquetas_espaco: Integer;
    x_arquivo_winword: String; {caminho do arquivo executavel do MsWord}
    x_submenu_ativo: Boolean;
    x_bloqueio_cartao: Boolean; {informa se a empresa esta trabalhando com esquema de cartão de crédito}
    x_requisitar_forma_pgto: Boolean; {requisitar forma de pgto.}
    x_permitir_alterar_data_baixa : Boolean;
    x_permite_renegociacao_pela_consulta: Boolean; {permitir renegociacao pela consulta}
    x_pesquisa_cep: Boolean; {informa se sera utilizada a pesquisa de CEP}

    x_buscaaltomatica_cliente : Boolean; {Busca que contem e não contem}
    x_filtroquecontem_cliente : Boolean;

    x_imprimir_proposta: Boolean;
    x_alteracao_salario_limite_consulta: Boolean; {informa se permite ou nao alt. de salario/limite de credito do cliente pela consulta}
    x_bloqueia_alteracao_salario_compra: Boolean; {bloqueia a alteração do salário do cliente após a primeira compra efetuada}
    x_alteracao_limite_credito: Boolean; {informa se permite ou nao alt. de salario/limite de credito do cliente pela consulta}
    x_alteracao_observacao_consulta: Boolean; {informa se permite ou nao alt. do campo observacao do cliente pela consulta}
    x_qtde_autenticacao: Integer; {informa a qtde. de vezes que imprimira a autenticacao}
    x_qtde_comprovante_pagamento: Integer; {informa o número de comprovantes a serem impressos}
    x_autenticacao_baixa: Boolean; {informa se na baixa de prestacao - na consulta - haverá autenticação ou nao}
    x_comprovante_pagamento: Boolean; {informa se quer que imprima um comprovante do pagamento das prestações do carnê}
    x_preenche_com_valor_corrigido:Boolean;

    x_pode_loja_dif_pago: Integer; {flag que informa se o codigo da loja informado na baixa pode ser dif. do informado no frente de loja}
    x_ReqDigv:Integer;
    x_pode_valor_loja_menor: Integer;

    x_salto_nativa:Boolean;

    x_checkcheckconscli: Boolean; {Consulta Check Check na consulta financeira}
    x_checkcheckcont: Boolean; {Consulta Check Check nos movimentos de contratos}
    x_checkcheckProvedor:String; {Provedor do checkcheck}
    x_checkcheckPorta:Integer; {Porta do checkcheck}
    x_checkcheckServidor:String; {Servidor do checkcheck}
    x_checkcheckProtocolo:String;{Protocolo do checkcheck}


    x_modelo_impressao_carnet: Integer; {0-> impressora matricial 1-> impressora jato de tinta}
    x_margem_esquerda_carnet_jt: Integer; {margem esquerda da impressao do carnet - JT}
    x_margem_superior_carnet_jt: Integer; {margem superior da impressao do carnet - JT}
    x_carnet_imprime_entrada: Boolean; {informa se havera impressao da entrada nos carnets}
    x_qtde_linhas_entre_SLIPS_TRANSFERENCIA: Integer; {qtde. de linhas entre os SLIPs da transferencia}
    x_slip_na_tela_TRANSFERENCIA: Boolean; {determina se o SLIP sera impresso na TELA ou nao}
    x_slip_na_tela_COMPROVANTE: Boolean; {determina se o SLIP será impresso na TELA ou não}
    x_solicitar_senha_TRANSFERENCIA: Boolean;
    x_solicitar_senha_TROCA_DEVOLUCAO: Boolean;
    x_solicitar_senha_DESCONTO: Boolean;
    x_solicitar_senha_DESCONTO_VALE: Boolean;
    x_solicitar_senha_CONF_CAIXA: Boolean;
    x_solicitar_senha_RECEB_CHEQ_DEV: Boolean;
    x_solicitar_senha_INVENTARIO: Boolean;
    x_solicitar_senha_MOVIMENTO: Boolean;
    x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS: Boolean;
    x_solicitar_senha_LISTAGENS_VENDAS: Boolean;
    x_solicitar_senha_CONSULTA_VENDA: Boolean;
    x_solicitar_senha_ALTERACAO_PRECO_VENDA: Boolean;
    x_solicitar_senha_SAIDA_LANCAMENTO_VENDA: Boolean;
    x_solicitar_senha_CADASTRO_CLIENTE: Boolean;
    x_memoria_solicitacao_dias_a_vencer_promocao: Integer;
    x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho: Boolean;
    x_iniprom:Boolean;
    x_comissao_vales_emitidos: Boolean;
    x_comissao_vales_recebidos: Boolean;
    x_comissao_vales_mercadoria: Boolean;
    x_exibir_itens : Boolean;
    x_faixaini1,x_faixaini2,x_faixaini3 : Real;
    x_faixafim1,x_faixafim2,x_faixafim3 : Real;
    x_desc1,x_desc2,x_desc3 : Real;
    x_tipofaixa : String;
    x_usarfaixa: Boolean;
    x_exibe_devolucao: Boolean;
    x_exibe_troca: Boolean;
    x_descontar_devolucao: Boolean;
    x_solicitar_senha_OPCOES_Atdo: Boolean;
    x_solicitar_senha_TROCA_DEVOLUCAO_Atdo: Boolean;
    x_solicitar_senha_TRANSFERENCIAS_Atdo: Boolean;
    x_solicitar_senha_LISTAGENS_Atdo: Boolean;
    x_solicitar_senha_DESCONTO_Atdo: Boolean;
    x_solicitar_senha_Saldo        : Boolean;
    x_AltPrecoAtend                :Boolean;
    {********************************************************************************************}

    //*******************************************************************************************
    x_ConsEstoqOutras :Boolean;
    x_ConsEstoqLoja   :Boolean;
    x_ConsEstoqQtd    :Boolean;
    x_ConsEstoqPrc    :Boolean;

    x_atendimento: Real; {codigo do atendimento local}
    x_codigo_atendimento: Real; {codigo do atendimento}
    x_codigo_atendimento_suspenso: Real; {codigo do atendimento 'suspenso'}
    x_qtde_linhas_entre_SLIPS_ATENDIMENTO: Integer; {qtde. de linhas entre os SLIPs do atendimento}
    x_slip_na_tela_ATENDIMENTO: Boolean; {determina se o SLIP sera impresso na TELA ou nao}
    x_Orcamento_Atendimento: Boolean;
    x_codigousuario: Integer; {codigo do usuario/operador = x_codigo_operador}
    x_ativar_alerta_sequencial_atdo: Boolean; {flag que indica se o ultimo atendimento sera verificado}
    {********************************************************************************************}
    x_promocoesquevence:Boolean;
    codclientecad:String;
    x_DIASVALIDADECLI:Real;{dias de validade para o cliente}
    x_ImpItemECF:Boolean;
    x_ImpSangECF:String;
    // relacionamentos do sistema com o Ecf(feito inicialmente para DataRegis,mas pode ser implementado p/ qq uma)
    x_formaspagamentoecf,x_aliquotasecf:String;
    x_tempointervecf:Real;

    x_excimp:Boolean;
    x_AtuaCompCli:Integer;

    x_validade_vales: String;
    x_prazo_vendas: String;
    x_soma_valefunc_total_venda : Boolean;
    x_onlinevpn: Boolean;
    x_buscaaltomatica: Boolean;
    x_ultimo_numro_controle_cartao_tef: Pchar;
    x_ultimo_numro_controle_debito_tef: Pchar;
    x_HabilitaValidacoes : Boolean;

    x_habilita_integracao_nfe,x_gera_registro_nfe_todas_vendas, vendaManual : Boolean;
    modoFiscal : String;

    {********************************************************************************************}
    {configuracoes gerais da NFE e NFCE  ***}
    {********************************************************************************************}

     x_modelo_NF, Tipo_Nota    : String;
     x_Habilita_Modo_NFE : Boolean;

     x_NFCE_NCM    : array[1..20] of String;
     x_NFCE_DESCR  : array[1..20] of String;
     x_NFCE_E_UNIDDE : array[1..20] of String;

    // Variaveis do arquivo VENDASNFE.INI
    AMB_TP, AMB_ONLINE, MISTRAL_MSG,MOD_NFE, MOD_NFCE : integer;
    CSC_ID_TESTE,CSC_TOKEN_TESTE, CSC_ID_PRODUCAO, CSC_TOKEN_PRODUCAO : STRING;

    procedure consultapromocoesavencer;
    procedure LeituraConfigLocal_Caixa; {*}
    procedure LeituraConfigLocal_Atdo; {*}
    procedure LeituraDosSequenciais; {*}
    procedure LeituraTipoFuncionamento; {*}
    procedure LeituraConfigGeral(Ferro:Boolean=false); {*}
    procedure SetConfigLocalDEFAULT; {*}
    procedure GravaConfigLocal_Caixa; {*}
    procedure GravaConfigLocal_Atdo; {*}
    procedure GravaConfigLocal;

    //....
    procedure VerificaSeguranca(empresa: String);
    procedure MudaResolucaoVideo(width,height,color: Integer);
    procedure AcertaBancoDeDadosVENDAS;
    procedure AjustaBancoDeDadosVENDAS;
    procedure AjustaBancoDeDadosCREDIARIO;
    procedure AjustaBancoDeDadosESTOQUE;
    procedure ExibirDica(mens: String; tempo: Integer);
    procedure ChamandoExportaRetaguarda;
    procedure ChamandoImportaRetaguarda;
    procedure ChamandoImpressoras;
    procedure GravaLog (usuario: Real; data: TDateTime; hora: String;
      modulo: Real; operacao: String; codigoentidade: Real;
      infoant, infopos: String);
    function CriaCampo(nometabela,nomecampo,nometipo: String):Boolean;
    function ExisteCampoLocal(nomecampo,nometabela: String):Boolean;
    procedure AcendoBotao (sender: TPanel; flag: Boolean);
    procedure ApagaTudo_1;
    procedure ApagaTudo_2;
    function NecessitaAtualizarBancoDeDadosVENDAS:Boolean;
    function NecessitaAtualizarBancoDeDadosCREDIARIO:Boolean;
    //CREDIARIO
    procedure ChamandoClienteContrato (iModo: Integer; flag: Boolean);
    procedure ChamandoLancReceb2 (cliente,loja_contrato,numero_contrato: Real);
    procedure ChamandoPropostaCredito;
    procedure ChamandoPosFinancCons;
    procedure ChamandoLancReceb2OffLine;
    procedure ChamandoExportaTrigger_Crediario;
    procedure ChamandoImportaTrigger_Crediario;
    function fuf:String;
    procedure ChamandoAtualizarBancoDeDados(Fconf:Boolean=false);
    function SetScreenResolution(Width, Height: Integer): Longint;

    //NFCE
    procedure LERPARAMETROSNFE;
  end;

{** Definicao da classe de campos usado pelo formulario}
type
  TRegistroCampo = record
    nome: String; {contem o nome do campo}
    labelcampo: String; {contem o label do campo, para relatorios}
    tamanho: Integer; {contem o tamanho do campo}
    tipo: String; {contem o tipo do campo: c,d,i,m,...}
  {*** - para impressao}
    flagImprime: Boolean; {flag que indica se o campo vai para relatorio}
    tamanhoimpressao: Integer; {contem o tamanho do campo nas listagens padrões}
  end;

var
  frm_principal: Tfrm_principal;
  flagSenha: Boolean;
  Memocontrol: Integer;
  DATA_NULA: TDateTime;
  vSeqMaxiCod: TStringList;
  flagOpcao: Boolean;
  key_codigo,key_reffab,key_refint: Integer;
  ModoResolucaoVideo: DEVMODE;
  clCep: TClassCep;
  ltEstTab: TStringList;
  aListaRenegocia: TStringList;
  flagDevolvePrecoItem: Integer;
  ListaAtalhosF1: TStringList;

//CONFIGURA OS 'ALIASES' AOS BDS
  databaseprodutos,databasecredito,databasecontas, databasevendas: String;

{para chamar o CREDIARIO ***}
  CodigoCanceladoLoja:  Integer;
  CodigoCanceladoPort:  Integer;
  CodigoCanceladoPlano: Integer;
  CodigoCanceladoGrupo: Integer;
  CodigoCanceladoSessao: Integer;
  CodigoCanceladoContrato: Integer;
  CodigoCanceladoCliente: Integer;
  CodigoCanceladoUsuario: Integer;
  CodigoCanceladoCheque: Integer;
  CodigoCanceladoTexto: Integer;
  CodigoCanceladoGrupoPerm: Integer;

const
  {LABEL de nomes das rotinas disponiveis no sistema ***** - Configuração}
  LB_CADASTRO_CLIENTE  = 'Cadastro de clientes';
  LB_CADASTRO_CONTRAT  = 'Cadastro de contratos';
  LB_LANC_CLIE_CONT    = 'Lançamento de clientes/contratos';
  LB_EMIS_CARNET       = 'Emissão de Carnet de Pagamento';
  LB_POS_FINANC_CONS   = 'Posição Financeira do Cliente';
  LB_LANC_RECEB        = 'Lançamento de Recebimentos';

  {Modulos}
  MODULE_CLIENTE_CONTRATO  = 5;
  MODULE_EMIS_CARNET       = 35;
  MODULE_PROPOSTA_CREDITO  = 63;
  MODULE_LANC_RECEB        = 9;
  MODULE_REABRE_DOCUMENTO  = 38;
  MODULE_REG_MAN_CONT_SPC  = 67;
  MODULE_REAB_MAN_CONT_SPC = 70;
  MODULE_POS_FINANC_CONS   = 44;
  MODULE_LANC_RECEB2       = 73;

  {Tipos de acessos de arquivos}
  KTA_ESCRITA = 0;
  KTA_LEITURA = 1;

  {Situacoes de Caixa}
  KST_CAIXA_ABERTO    = '1';
  KST_CAIXA_SUSPENSO  = '2';
  KST_CAIXA_ENCERRADO = '3';

  {teclas de funcao *** - configuracao}
  NULO     = 0;
  K_F1     = 112;
  K_F2     = 113;
  K_F3     = 114;
  K_F4     = 115;
  K_F5     = 116;
  K_F6     = 117;
  K_F7     = 118;
  K_F8     = 119;
  K_F9     = 120;
  K_F10    = 121;
  K_F11    = 122;
  K_F12    = 123;
  K_ENTER  = 13;
  K_ESC    = 27;
  K_ESQ    = 37;
  K_BAIXO  = 40;
  K_CIMA   = 38;
  K_DIR    = 39;
  K_INSERT = 45;
  K_DELETE = 46;
  K_HOME   = 36;
  K_END    = 35;
  K_PGUP   = 33;
  K_PGDOWN = 34;
  K_BACK   = 8;

  {Bancos disponiveis}
  KDB_INTERBASE  = 0;
  KDB_SQL_SERVER = 1;

  {formatos de datas}
  KFD_DIA_MES_ANO  = 0;
  KFD_MES_DIA_ANO  = 1;
  KFD_NAO_DEFINIDO = 2;

  {fixar codigo das formas de pagamento possiveis - passível de mudanças!!!}
  KFPGT_DINHEIRO  = 1; //Dinheiro
  KFPGT_CHEQUE    = 2; //cheque a vista
  KFPGT_DEBITO    = 3; //Débito Automático
  KFPGT_CARTAO    = 4; //Cartão de Crédito
  KFPGT_CREDITO   = 5; //Crediário
  KFPGT_VALES     = 6; //recebido
  KFPGT_VALES_EMI = 7; //emitido - NO CASO DA VENDA DAR 'NEGATIVA'
  KFPGT_VALE_MERC = 8; //vale mercadoria para funcionario

  {modo de funcionamento do ECF}
  KMODOVENDA_ECF_PARALELO   = 0;
  KMODOVENDA_ECF_FECHAMENTO = 1;

  {modelo de impressora ECF}
  KMODELO_ECF_BEMATECH     = 0;
  KMODELO_ECF_URANO        = 1;
  KMODELO_ECF_URANO_1EFC   = 2;
  KMODELO_ECF_DATAREGIS    = 3;
  KMODELO_ECF_DARUMAFS345  = 4;

  {modos de trabalho com a consulta de venda}
  K_MODO_CONSULTA_VENDA_NORMAL  = 0;
  K_MODO_CONSULTA_VENDA_SELECAO = 1;

  {opcoes de impressao do codigo de barras no CUPOM}
  K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO = 0;
  K_CUPOM_ITEM_IMPRIME_EAN13 = 1;

implementation

uses funcoes1, funcoes2, procura, venda, f8SubGrupos, produtos, auxiliar,
  unDialogo, DM2, f8Vend, un_ConsultaProdutos, un_ExcVenda,
  unImpressoras, cadcli, un_frmConsulta1, unVersoPropostaCredito,
  unPropostaCredito, unLancReceb2, unProbIniciar, un_exibesituacao,
  un_MudarSituacao, un_fecharsessao, un_sangria, un_funcoesGaveta,
  un_funcoesImpressora, un_senhaSupervisor, un_exibeSessao, un_MudarLoja,
  un_MudarOp, unSenha, un_AjudaComandos, un_BotoesOpcoes,
  un_FechamentoVenda, unSobre, un_configLocal, un_ExportaRetaguarda,
  un_ImportaRetaguarda, un_BotoesMovimento, un_BotoesECF, DM1, un_ALERTA,
  DM6, un_ResumoConexoes, un_LancaVenda, un_ExibeCaixas, un_MenuPrincipal,
  un_MenuPrincipal_Opcao1, un_MenuPrincipal_OpcaoCrediario,
  unLancReceb2OffLine, un_MenuPrincipal_OpcaoCaixa, un_FechamentoCaixa,
  un_Exportacao_Trigger, un_Importacao_Trigger, aux5Contrato,
  un_BotoesTransf, unAtualizaBd, un_F8Linhas, un_FechamentoVenda_Cred,
  un_BotoesConfig, un_Mapa, un_BotoesConfig_Atdo, un_LancaAtendimento,
  unSenha_Atdo, un_BotoesOpcoes_Atdo, un_botoesListagensAtdo,
  un_SenhaAdministrador, mainf, unAlertaProtecao, un_AlertaGeral;

{$R *.DFM}

procedure Tfrm_principal.FormActivate(Sender: TObject);
begin
  {****************************************************************************}
  LERPARAMETROSNFE;

//
  multiBoleta     := false;
  jaGravou        := false;
  fechamentoVenda := false;
  x_Fecha_caixa   := true;

  if (not exibiu) then
  begin
    frmDialogo.posativ:=1;

    {****************************************************************************}
    LeituraDosSequenciais; {*}

    //***********************************************************************************
    pnSit.caption      := ' Situação: NORMAL';
    pnLoja.caption     := ' Loja: '+form_nz(x_loja,2)+'/'+form_t(ProcuraNomeLoja(x_loja,self),15);
    if (x_loja=0) then
      pnLoja.color:=clRed
    else
      pnLoja.color:=clTeal;
    pnCaixa.caption    := ' Nº Terminal: '+form_nz(x_terminal,2);
    if (x_terminal=0) then
      pnCaixa.color:=clRed
    else
      pnCaixa.color:=clTeal;
    if (x_tipo_funcionamento_sistema=1) then //CAIXA
      if (frm_principal.x_ecf_habilita_modo_fiscal) then
      begin
        if (x_ecf=0) then
          pnEcf.color := clRed
        else
          pnEcf.color := clTeal;
        pnEcf.caption := ' ECF: '+form_nz(x_ecf,2);
      end
      else
      begin
        pnEcf.color   := clTeal;
        pnEcf.caption := '';
      end;

    {****************************************************************************}
    if (x_tipo_funcionamento_sistema=0) then //ILHA
    begin
      pnECF.color              := clBlack;
      pnECF.caption            := '';
      lblNomeTela.caption      := 'Atendimentos';
      pnCaixaAtiva.caption     := ' - Ilha de Atendimento -';
      pnCaixaAtiva.width       := 442;
      pnCaixaAtiva.Alignment   := taCenter;
      lblCMC1.visible          := false;
      lblCMC2.visible          := false;
      botaoCMC.visible         := false;
    end
    else
    if (x_tipo_funcionamento_sistema=1) then //CAIXA
    begin
      lblNomeTela.caption      := 'Caixa';
      pnCaixaAtiva.caption     := ' Caixa: INDEFINIDO';
      pnCaixaAtiva.width       := 294;
      pnCaixaAtiva.Alignment   := taLeftJustify;
      lblCMC1.visible          := true;
      lblCMC2.visible          := true;
      botaoCMC.visible         := true;
    end;

    {****************************************************************************}
    if (flagSenha) then
    begin
      frmSenha.caption  := 'Acesso ao sistema';
      frmSenha.flagData := true;
     // frmSenha.showmodal;
     //  frmSenha.Free;
      flagSenha:=false;
    end;

    {****************************************************************************}
    if (x_tipo_funcionamento_sistema=0) then //ILHA
    begin
      pMenuPrincipal_1.visible := false;
      pMenuPrincipal_2.visible := true;
      pMenuPrincipal_2.Left := 232;
      pMenuPrincipal_2.Top := 88;
    end
    else
    if (x_tipo_funcionamento_sistema=1) then //CAIXA
    begin
      pMenuPrincipal_1.visible := true;
      pMenuPrincipal_2.visible := false;
    end;
         
    {****************************************************************************}
    AjustaBancoDeDadosVENDAS;
    AcertaBancoDeDadosVENDAS;
    {****************************************************************************}
    LeituraConfigGeral; {*}

    //VERIFICA EMPRESA CONTATADA
      VerificaSeguranca(x_empresa);

    //PRAZO DE VALIDADE DO SISTEMA
    //************************************************************************************
      VerificaProtecaoDoSistema; {* - PROTECAO AO PAGAMENTO DO ALUGUEL}
    //************************************************************************************


    if (not x_online) then
      if (x_exibe_alerta_offline) then
      begin
        frm_ALERTA.Memo1.lines.clear;
        frm_ALERTA.Memo1.lines.Add('                                        ATENÇÃO: O sistema está OFF-LINE ');
        frm_ALERTA.Memo1.lines.Add('');
        frm_ALERTA.Memo1.lines.Add(' - Informações sobre PREÇOS e PRODUTOS podem estar desatualizados');
        frm_ALERTA.Memo1.lines.Add(' - Verifique a última atualização recebida');
        frm_ALERTA.Memo1.lines.Add(' - Qualquer informação gravada deverá ser enviada para administração');
        frm_ALERTA.Memo1.lines.Add(' - Qualquer dúvida entrar em contato com a administração');
        frm_ALERTA.showmodal;
        frm_ALERTA.Free;
        frm_senhaSupervisor.showmodal;
        if (not frm_senhaSupervisor.y_flag) then
          Application.Terminate;
      end;

    x_formato_data_local := DeterminaFormatoAceitavelDeData_VENDAS;
    if (databasecredito='CREDITO') then
      x_formato_data_local_crediario := DeterminaFormatoAceitavelDeData_CREDITO;
    VerificaSeguranca(x_empresa);

    {****************************************************************************}
    pnData.caption     := ' Data: '+form_data(frm_principal.x_data_trabalho);
    pnDia.caption      := ' Dia: '+UpperCase(FormatDateTime('dddd',frm_principal.x_data_trabalho));

    {********************************************************************************}
    if (x_tipo_funcionamento_sistema=1) then //CAIXA
    begin
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
      if (frm_principal.pnCaixaAtiva.caption=' Caixa: INDEFINIDO') then
        Panel4Click(Sender);
    end;

    consultapromocoesavencer;

    {...}
    exibiu := true;
    {****************************************************************************}

  end;
end;

procedure Tfrm_principal.FormCreate(Sender: TObject);
var
  hSem: THandle;
  hWndMe: HWnd;
  AppTitle: String;
  DevMode : TDevMode;
begin
  clienteaut := false;
  colorgridcons     := 'clBlack';
  colorfontgridcons := 'ClWindow';
  colorFormGridCons := ColortoString(self.color);
  colorFormFontGridCons := 'ClWindow';

  exibiu                 := true;
  create                 := false;
  x_senha_admin          := 'A1B2C3'; //ATENCAO: esta senha ativa funcoes especiais e é alterada periodicamente
  clCep                  := TClassCep.Create;
  ListaAtalhosF1         := TStringList.Create;
  frm_principal.x_fechar := false;

     {*** Verificando a existencia das pastas locais ****************************}
  CriaPastaNoVendasLocal('MOVIMENTO');
  CriaPastaNoVendasLocal('FOTO');

  if (not ExisteCampoLocal('SEQ','TEMP_TRANSF.DBF')) or (not ExisteCampoLocal('CBARRA1','TEMP_TRANSF.DBF'))then
    DeleteFile ('C:\NATIVA\VENDAS\TEMP_TRANSF.DBF');
  ChecaExistenciaArquivo_TEMP_TRANSF;
  ChecaExistenciaArquivo_TEMP_SAIDAS;
  ChecaExistenciaArquivo_SEQVENDAS;
  ChecaExistenciaArquivo_TIPOFUNCVENDAS;

     {*** Verificando a existencia das pastas locais ****************************}
  if (not DirectoryExists('C:\NATIVA')) then
    CreateDir('C:\NATIVA');
  if (not DirectoryExists('C:\NATIVA\ATENDIMENTOS')) then
    CreateDir('C:\NATIVA\ATENDIMENTOS');
  if (not DirectoryExists('C:\NATIVA\ATENDIMENTOS\MOVIMENTO')) then
    CreateDir('C:\NATIVA\ATENDIMENTOS\MOVIMENTO');
  ChecaExistenciaArquivo_SEQATDO;


  if (not DirectoryExists('C:\NATIVA\CREDITO')) then
    CreateDir('C:\NATIVA\CREDITO');
  if (not DirectoryExists('C:\NATIVA\CREDITO\MOVIMENTO')) then
    CreateDir('C:\NATIVA\CREDITO\MOVIMENTO');



     //**************************************************************************
  LeituraTipoFuncionamento; {*}
  SetConfigLocalDEFAULT; {*}
  if (x_tipo_funcionamento_sistema=0) then
    LeituraConfigLocal_Atdo
  else
  if (x_tipo_funcionamento_sistema=1) then
    LeituraConfigLocal_Caixa; {*}

     {Verifica se a aplicação já está em uso ************************************}
  AppTitle := Application.Title;
  hSem := CreateSemaphore(nil, 0, 1, Pchar(AppTitle));
  if ((hSem <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS)) then
  begin
    CloseHandle(hSem);
    frm_principal.x_fechar:=true;
  end
  else
  begin
    frm_principal.x_fechar:=false;

         {CRITICA 1) - Conectando com o banco de dados}
         {1. crediario - tabela de usuarios/grupos}
    databasecredito := 'CREDITO';
    try
      frm_principal.servidor_credito.Connected:=false;
      frm_principal.servidor_credito.params.clear;
      frm_principal.servidor_credito.params.Add('USER NAME=sa');
      frm_principal.servidor_credito.params.Add('PASSWORD=');
      frm_principal.servidor_credito.Connected:=false;
      frm_principal.servidor_credito.Connected:=true;
    except
      try
        frm_principal.servidor_credito.Connected:=false;
        frm_principal.servidor_credito.params.clear;
        frm_principal.servidor_credito.params.Add('USER NAME=SYSDBA');
        frm_principal.servidor_credito.params.Add('PASSWORD=masterkey');
        frm_principal.servidor_credito.Connected:=false;
        frm_principal.servidor_credito.Connected:=true;
      except
        databasecredito := 'VENDAS';
      end;
    end;

         {2. contas a pagar - fornecedores/representantes/etc...}
    databasecontas := 'CONTASPAGAR';
    try
      frm_principal.servidor_contaspagar.Connected:=false;
      frm_principal.servidor_contaspagar.params.clear;
      frm_principal.servidor_contaspagar.params.Add('USER NAME=sa');
      frm_principal.servidor_contaspagar.params.Add('PASSWORD=');
      frm_principal.servidor_contaspagar.Connected:=false;
      frm_principal.servidor_contaspagar.Connected:=true;
    except
      try
        frm_principal.servidor_contaspagar.Connected:=false;
        frm_principal.servidor_contaspagar.params.clear;
        frm_principal.servidor_contaspagar.params.Add('USER NAME=SYSDBA');
        frm_principal.servidor_contaspagar.params.Add('PASSWORD=masterkey');
        frm_principal.servidor_contaspagar.Connected:=false;
        frm_principal.servidor_contaspagar.Connected:=true;
      except
        databasecontas := 'VENDAS';
      end;
    end;

         {3. Estoque}
    databaseprodutos := 'ESTOQUE';
    try
      frm_principal.servidor_estoque.Connected:=false;
      frm_principal.servidor_estoque.params.clear;
      frm_principal.servidor_estoque.params.Add('USER NAME=sa');
      frm_principal.servidor_estoque.params.Add('PASSWORD=');
      frm_principal.servidor_estoque.Connected:=false;
      frm_principal.servidor_estoque.Connected:=true;
      x_usuario_logado_no_banco := 'sa';
    except
      try
        frm_principal.servidor_estoque.Connected:=false;
        frm_principal.servidor_estoque.params.clear;
        frm_principal.servidor_estoque.params.Add('USER NAME=SYSDBA');
        frm_principal.servidor_estoque.params.Add('PASSWORD=masterkey');
        frm_principal.servidor_estoque.Connected:=false;
        frm_principal.servidor_estoque.Connected:=true;
        x_usuario_logado_no_banco := 'SYSDBA';
      except
        databaseprodutos := 'VENDAS';
      end;
    end;

         {4. caixa - Vendas e etc..}
         databasevendas := 'VENDAS';
    try
      frm_principal.servidor_vendas.Connected:=false;
      frm_principal.servidor_vendas.params.clear;
      frm_principal.servidor_vendas.params.Add('USER NAME=sa');
      frm_principal.servidor_vendas.params.Add('PASSWORD=');
      frm_principal.servidor_vendas.Connected:=false;
      frm_principal.servidor_vendas.Connected:=true;
    except
      try
        frm_principal.servidor_vendas.Connected:=false;
        frm_principal.servidor_vendas.params.clear;
        frm_principal.servidor_vendas.params.Add('USER NAME=SYSDBA');
        frm_principal.servidor_vendas.params.Add('PASSWORD=masterkey');
        frm_principal.servidor_vendas.Connected:=false;
        frm_principal.servidor_vendas.Connected:=true;
      except
        on E: Exception do
        begin
          Application.CreateForm(Tfrm_ProbIniciar, frm_ProbIniciar);
          frm_ProbIniciar.Memo1.lines.clear;
          frm_ProbIniciar.Memo1.lines.add('BANCO DE DADOS..: VENDAS');
          frm_ProbIniciar.Memo1.lines.add('ALIAS...........: VENDAS');
          frm_ProbIniciar.Memo1.lines.add('ERRO............: '+E.Message);
          frm_ProbIniciar.showmodal;
          frm_principal.x_fechar:=true;
        end;
      end;
    end;

         {*********** Definindo o database de consultas F8 ****************}
    Application.CreateForm(TDMCaixa, DMCaixa);
    with (DMCaixa) do
    begin
      qInsereItemVenda_real.databasename       := databaseprodutos;
      qInsereItemAtendimento_real.databasename := databaseprodutos;
    end;
    Application.CreateForm(TDMVendas, DMVendas);
    with (DMVendas) do
    begin
      qVendas.databasename     := databaseprodutos;
      qFormas.databasename     := databaseprodutos;
      qItensVenda.databasename := databaseprodutos;
    end;
    Application.CreateForm(TDMF8, DMF8);
    with (DMF8) do
    begin
      qAdmF8.databasename             := databaseprodutos;
      qConsultaProdutos2.databasename := databaseprodutos;
      qCoresF8.databasename           := databaseprodutos;
      qCoresProdutosF8.databasename   := databaseprodutos;
      qFaixasF8.databasename          := databaseprodutos;
      qGruposProdutosF8.databasename  := databaseprodutos;
      qProdutos2F8.databasename       := databaseprodutos;
      qSubGruposF8.databasename       := databaseprodutos;
      qVendF8.databasename            := databaseprodutos;
      qCaixaF8.databasename           := databaseprodutos;
      qFormaPgtoF8.databasename       := databaseprodutos;
      qFormaPgtoF82.databasename      := databaseprodutos;

              {...}
      qClientesF8.databasename        := databasecredito;
      qLojaF8.databasename            := databasecredito;
      qPlanoF8.databasename           := databasecredito;
      qUsersF8.databasename           := databasecredito;
      qPortF8.databasename            := databasecredito;

              {...}
      qBancosF8.databasename          := databasecontas;
      qFornF8.databasename            := databasecontas;
      qContasF8.databasename          := databasecontas;
    end;
         {*****************************************************************}

    if (not frm_principal.x_fechar) then
    begin
      try {se der erro aqui é porque as CONFIGURACOES REGIONAIS DE FORMATACAO DE DATA DO WINDOWS ESTAO ERRADAS}
        DATA_NULA            := strtodate('01/01/1900');
      except
        showmessage('Erro nas "Configurações Regionais" do Windows! Configure o formato de data para DD/MM/YYYY, com a "/" como separador!');
        Application.Terminate;
      end;
             {*****************************************************************************}
      x_data_versao_sistema := strtodate('23/02/2007');
//             lblversao.caption     := 'Versão: '+form_data(x_data_versao_sistema);
      lblVersao
        .caption := 'Versão: '+formatdatetime('dd/mm/yyyy',funcoesglobais.FileLastModified(Application.exename));

             {****************************************************************************}
      if (x_modificar_video) then

//                  SetScreenResolution(x_video_entrada_width,
//                                      x_video_entrada_height);
        MudaResolucaoVideo(x_video_entrada_width,
          x_video_entrada_height,
          x_video_entrada_color);
             {****************************************************************************}
      try
        imagemEmpresa.picture.loadfromfile(x_imagem_logomarca);
      except
      end;

             {* Configurando a INTERFACE INICIAL}
      frm_principal.windowstate := wsMaximized;
      frm_principal.left        :=0;
      frm_principal.top         :=0;
      frm_principal.width       := 810;
      frm_principal.height      := 610;

      flagSenha        := true;

             {****************************************************************************}
      if (databaseprodutos='ESTOQUE') then
        x_online:=true
      else
      if (databaseprodutos='VENDAS') then
        x_online:=false;

             {*****************************************************************}
      ConfiguraStatusPDV;

      exibiu := false;
      create := true;
    end;
  end;
     {****************************************************************************}
end;

procedure Tfrm_principal.timerClockTimer(Sender: TObject);
begin
  pnHora.caption := FormatDateTime('hh:nn:ss',time);
  n_data := date;
end;

procedure Tfrm_principal.ExibirDica(mens: String; tempo: Integer);
begin
     {BarraDicas.caption  := mens;}
end;

procedure Tfrm_principal.Image3DblClick(Sender: TObject);
begin

end;

{//Ajusta alguns campos ou       tabelas dentro do banco de dados VENDAS!!!!}
procedure TFrm_principal.AjustaBancoDeDadosVENDAS;
var
  clConf,clAtualizaVersao,clPAF: TClassAuxiliar;
  Atualiza,Atualizacao,flagatualiza: Boolean;
  qry:tquery;
  FBanco:Integer;
begin
  {**********************************************************************************}
  clConf := TClassAuxiliar.Create;
  clConf.conect   ('VENDAS',self);
  clConf.ClearSql;
  clConf.AddParam ('SELECT * FROM CONF');
  clConf.Execute;
  clConf.First;
  x_banco_de_dados  := clConf.Result('BANCO_DE_DADOS');
  clConf.desconect;
  clConf.Free;

  {...}
  flagatualiza := NecessitaAtualizarBancoDeDadosVENDAS;
  if (flagatualiza) then
  begin
   {**********************************************************************************}
    Application.CreateForm(Tfrm_AtualizaBd, frm_AtualizaBd);
    frm_AtualizaBd.show;
    frm_AtualizaBd.refresh;
    frm_AtualizaBd.pnAtualizaBd.refresh;
    frm_AtualizaBd.Label1.refresh;

   {**********************************************************************************}
    CriaCampo('CONF','ADICIONA_DV_CODIGO_BARRAS','VARCHAR(1)');
    CriaCampo('CONF','USA_REFFAB_SLIP','VARCHAR(1)');
    CriaCampo('CONF','CLI_SEM_FOTO','VARCHAR(1)');
    CriaCampo('CONF','CLI_SEM_CEP','VARCHAR(1)');
    CriaCampo('CONF','SENHA_CONFIRMA_VENDA','VARCHAR(1)');
    CriaCampo('CONF','SENHA_GERENTE_LIBERA_SALDO_ZERO','VARCHAR(1)');
    CriaCampo('CORES','CR_ATIV','VARCHAR(1)');

    qGeraCampoVENDAS.SQL.Clear;
    qGeraCampoVENDAS.SQL.Add('UPDATE CONF SET CLI_SEM_FOTO=:CODIGO WHERE CLI_SEM_FOTO IS NULL ');
    qGeraCampoVENDAS.ParamByName('CODIGO').AsString := '1';
    qGeraCampoVENDAS.ExecSQL;

    qGeraCampoVENDAS.SQL.Clear;
    qGeraCampoVENDAS.SQL.Add('UPDATE CONF SET CLI_SEM_CEP=:CODIGO WHERE CLI_SEM_CEP IS NULL ');
    qGeraCampoVENDAS.ParamByName('CODIGO').AsString := '1';
    qGeraCampoVENDAS.ExecSQL;

    qGeraCampoVENDAS.SQL.Clear;
    qGeraCampoVENDAS.SQL.Add('UPDATE CONF SET SENHA_CONFIRMA_VENDA=:CODIGO WHERE SENHA_CONFIRMA_VENDA IS NULL ');
    qGeraCampoVENDAS.ParamByName('CODIGO').AsString := '0';
    qGeraCampoVENDAS.ExecSQL;

    qGeraCampoVENDAS.SQL.Clear;
    qGeraCampoVENDAS.SQL.Add('UPDATE CONF SET SENHA_GERENTE_LIBERA_SALDO_ZERO=:CODIGO WHERE SENHA_GERENTE_LIBERA_SALDO_ZERO IS NULL ');
    qGeraCampoVENDAS.ParamByName('CODIGO').AsString := '0';
    qGeraCampoVENDAS.ExecSQL;

    CriaCampoBd('CREDITO','CONF','SENHA_CONFIRMA_VENDA','VARCHAR(1)');
    CriaCampoBd('CREDITO','CONF','CLI_SEM_FOTO','VARCHAR(1)');
    CriaCampoBd('CREDITO','CONF','CLI_SEM_CEP','VARCHAR(1)');
    CriaCampoBd('CREDITO','CONF','SENHA_GERENTE_LIBERA_SALDO_ZERO','VARCHAR(1)');

    qGeraCampoCREDIARIO.SQL.Clear;
    qGeraCampoCREDIARIO.SQL.Add('UPDATE CONF SET SENHA_CONFIRMA_VENDA=:CODIGO WHERE SENHA_CONFIRMA_VENDA IS NULL ');
    qGeraCampoCREDIARIO.ParamByName('CODIGO').AsString := '0';
    qGeraCampoCREDIARIO.ExecSQL;

    qGeraCampoCREDIARIO.SQL.Clear;
    qGeraCampoCREDIARIO.SQL.Add('UPDATE CONF SET CLI_SEM_FOTO=:CODIGO WHERE CLI_SEM_FOTO IS NULL ');
    qGeraCampoCREDIARIO.ParamByName('CODIGO').AsString := '1';
    qGeraCampoCREDIARIO.ExecSQL;

    qGeraCampoCREDIARIO.SQL.Clear;
    qGeraCampoCREDIARIO.SQL.Add('UPDATE CONF SET CLI_SEM_CEP=:CODIGO WHERE CLI_SEM_CEP IS NULL ');
    qGeraCampoCREDIARIO.ParamByName('CODIGO').AsString := '1';
    qGeraCampoCREDIARIO.ExecSQL;

    qGeraCampoCREDIARIO.SQL.Clear;
    qGeraCampoCREDIARIO.SQL.Add('UPDATE CONF SET SENHA_GERENTE_LIBERA_SALDO_ZERO=:CODIGO WHERE SENHA_GERENTE_LIBERA_SALDO_ZERO IS NULL ');
    qGeraCampoCREDIARIO.ParamByName('CODIGO').AsString := '0';
    qGeraCampoCREDIARIO.ExecSQL;

   {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('DELETE FROM FORMAS_PAGAMENTO');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_DINHEIRO)+','+chr(39)+'DINHEIRO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_CREDITO)+','+chr(39)+'CREDIARIO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_CARTAO)+','+chr(39)+'CARTAO DE CREDITO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_DEBITO)+','+chr(39)+'DEBITO AUTOMATICO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_CHEQUE)+','+chr(39)+'CHEQUE A VISTA'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_VALES)+','+chr(39)+'VALE RECEBIDO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_VALES_EMI)+','+chr(39)+'VALE EMITIDO'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
      clear;
      Add('INSERT INTO FORMAS_PAGAMENTO(FO_CODI,FO_DESC) ');
      Add('VALUES ('+inttostr(KFPGT_VALE_MERC)+','+chr(39)+'VALE MERCADORIA'+chr(39)+')');
      qGeraCampoVENDAS.ExecSql;
    end;
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CONFIG_CODIGO_BARRAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CONFIG_CODIGO_BARRAS');
      Add('(');
      Add('  CAMPO SMALLINT, ESPACO SMALLINT');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    CriaCampo('VENDEDORES','VD_STAT','VARCHAR(1)');
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VENDEDORES')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VENDEDORES');
      Add('(');
      Add('  VD_CODI	DOUBLE PRECISION,');
      Add('  VD_NOME	VARCHAR(40),');
      Add('  VD_CARG	VARCHAR(30),');
      Add('  VD_LOJA	DOUBLE PRECISION,');
      Add('  VD_APEL	VARCHAR(20),');
      Add('  VD_SENH	VARCHAR(20),');
      Add('  VD_COMA	DOUBLE PRECISION,');
      Add('  VD_COMP	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('ALTER TABLE VENDEDORES ');
      Add('ADD VD_COMA DOUBLE PRECISION ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE VENDEDORES ');
      Add('ADD VD_COMP DOUBLE PRECISION ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF ');
      Add('ADD CAIXAATIVO DOUBLE PRECISION');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE VENDAS ');
      Add('ADD VE_FUNC DOUBLE PRECISION');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE VENDAS_LOCAL ');
      Add('ADD VE_FUNC DOUBLE PRECISION');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_RECEBIDOS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_RECEBIDOS');
      Add('(');
      Add('  VE_LOJA	DOUBLE PRECISION,');
      Add('  VE_CAIX	DOUBLE PRECISION,');
      Add('  VE_VEND	DOUBLE PRECISION,');
      Add('  VE_FUNC	DOUBLE PRECISION,');
      Add('  VE_NUME	VARCHAR(10),');
      Add('  VE_VALO	DOUBLE PRECISION,');
      Add('  VE_TIPO	VARCHAR(1),');
      Add('  VE_ORDE	INTEGER,');
      Add('  VE_CNPJ	VARCHAR(14),');
      Add('  VE_ECLI	VARCHAR(30),');
      Add('  VE_TELE	VARCHAR(11)');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_RECEBIDOS_LOCAL')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_RECEBIDOS_LOCAL');
      Add('(');
      Add('  VE_LOJA	DOUBLE PRECISION,');
      Add('  VE_CAIX	DOUBLE PRECISION,');
      Add('  VE_VEND	DOUBLE PRECISION,');
      Add('  VE_FUNC	DOUBLE PRECISION,');
      Add('  VE_NUME	VARCHAR(10),');
      Add('  VE_VALO	DOUBLE PRECISION,');
      Add('  VE_TIPO	VARCHAR(1),');
      Add('  VE_ORDE	INTEGER');
      Add('  VE_CNPJ	VARCHAR(14),');
      Add('  VE_ECLI	VARCHAR(30),');
      Add('  VE_TELE	VARCHAR(11)');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CONTAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CONTAS');
      Add('(');
      Add('  CO_CODI	DOUBLE PRECISION,');
      Add('  CO_DESC	VARCHAR(30),');
      Add('  CO_HIST	VARCHAR(50),');
      Add('  CO_NATU	VARCHAR(1),');
      Add('  CO_GRUP	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE GRUPOS_CONTAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].GRUPOS_CONTAS');
      Add('(');
      Add('  GR_CODI	DOUBLE PRECISION,');
      Add('  GR_DESC	VARCHAR(30),');
      Add('  GR_NATU	VARCHAR(1)');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CREPRABR')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CREPRABR');
      Add('(');
      Add('  PC_NPRE	DOUBLE PRECISION,');
      Add('  PC_VALO	DOUBLE PRECISION,');
      Add('  PC_FATO	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('  PC_DCON	TIMESTAMP,');
        Add('  PC_DVTO	TIMESTAMP,');
        Add('  PC_DTPG	TIMESTAMP,');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('  PC_DCON	DATETIME,');
        Add('  PC_DVTO	DATETIME,');
        Add('  PC_DTPG	DATETIME,');
      end;
      Add('  PC_LOJA	DOUBLE PRECISION,');
      Add('  PC_PORT	DOUBLE PRECISION,');
      Add('  PC_AVAL	DOUBLE PRECISION,');
      Add('  PC_PLAN	DOUBLE PRECISION,');
      Add('  PC_LJPG	DOUBLE PRECISION,');
      Add('  PC_VPAG	DOUBLE PRECISION,');
      Add('  PC_SALD	DOUBLE PRECISION,');
      Add('  PC_STAT	VARCHAR(1),');
      Add('  PC_CONT	DOUBLE PRECISION,');
      Add('  PC_CLIE	DOUBLE PRECISION,');
      Add('  PC_CHEQ	DOUBLE PRECISION,');
      Add('  PC_TPRE	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  PC_DTRA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  PC_DTRA	DATETIME,');
      Add('  PC_CCGC	VARCHAR(14),');
      Add('  PC_BANC	DOUBLE PRECISION,');
      Add('  PC_AGEN	VARCHAR(10),');
      Add('  PC_NUME	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  PC_TIME	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  PC_TIME	DATETIME,');
      Add('  PC_FPGT	DOUBLE PRECISION,');
      Add('  PC_CAIX	DOUBLE PRECISION,');
      Add('  PC_FUNC	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CONF ADD LO_MULT DOUBLE PRECISION ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CONF ADD LO_MORA DOUBLE PRECISION ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CONF ADD LO_DMUL INTEGER ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CONF ADD LO_DMOR INTEGER ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('SELECT CX_CODI FROM CAIXAS');
      try
        qGeraCampoVENDAS.open;
        clear;
        Add('DROP TABLE CAIXAS');
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CAIXAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CAIXAS');
      Add('(');
      Add('  CX_LOJA	DOUBLE PRECISION,');
      Add('  CX_CAIX	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  CX_DATA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  CX_DATA	DATETIME,');
      Add('  CX_FUNC	DOUBLE PRECISION,');
      Add('  CX_STAT	VARCHAR(1),');
      Add('  CX_VINI	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('ALTER TABLE CAIXAS ');
      Add('ADD CX_VIN2 DOUBLE PRECISION');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         //SUBIR NIVEL DE PRECO
    CriaCampo('ESTOQUE','ES_PVE1','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_PVE2','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_PCU1','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_PCU2','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_UPC1','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_UPC2','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_UPA1','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_UPA2','DOUBLE PRECISION');
    CriaCampo('ESTOQUE','ES_CEAN','VARCHAR(30)');
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
              {*********************************************************}
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_EMITIDOS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_EMITIDOS');
      Add('(');
      Add('  VA_LOJA	DOUBLE PRECISION,');
      Add('  VA_CAIX	DOUBLE PRECISION,');
      Add('  VA_FUNC	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  VA_DATA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  VA_DATA	DATETIME,');
      Add('  VA_NUME	VARCHAR(20),');
      Add('  VA_VALO	DOUBLE PRECISION,');
      Add('  VA_TIPO	VARCHAR(1),');
      Add('  VA_TIPZ	VARCHAR(1)');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
              {*********************************************************}
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE LANCAMENTOS_CAIXA')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].LANCAMENTOS_CAIXA');
      Add('(');
      Add('  LC_LOJA DOUBLE PRECISION,');
      Add('  LC_CAIX DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  LC_DATA TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  LC_DATA	DATETIME,');
      Add('  LC_FUNC DOUBLE PRECISION,');
      Add('  LC_SEQ	 DOUBLE PRECISION,');
      Add('  LC_VALO DOUBLE PRECISION,');
      Add('  LC_NATU VARCHAR(1),');
      Add('  LC_DESC VARCHAR(60),');
      Add('  LC_TIPZ VARCHAR(1),');
      Add('  LC_CONT DOUBLE PRECISION,');
      Add('  LC_TIPO DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
              {*********************************************************}
    end;
    CriaCampo('LANCAMENTOS_CAIXA','LC_TIPO','DOUBLE PRECISION');
    CriaCampo('CONF','CUPOM_FISCAL','DOUBLE PRECISION');
    CriaCampo('CONF','ULTIMO_VALE_MERCADORIA','DOUBLE PRECISION');
    CriaCampo('CONF','EMAIL','VARCHAR(80)');
    CriaCampo('CONF','PERM_CANC_VENDA_CUPOM','VARCHAR(1)');
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_MERCADORIAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_MERCADORIAS');
      Add('(');
      Add('VA_LOJA	DOUBLE PRECISION,');
      Add('VA_CAIX	DOUBLE PRECISION,');
      Add('VA_NUME	DOUBLE PRECISION,');
      Add('VA_FUNC	DOUBLE PRECISION,');
      Add('VA_NDOC	VARCHAR(20),');
      Add('VA_VALO	DOUBLE PRECISION,');
      Add('VA_EMPR	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('VA_DATA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('VA_DATA	DATETIME,');
      Add('VA_TIPZ  VARCHAR(1)');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ITENS_VALES_MERCADORIAS')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ITENS_VALES_MERCADORIAS');
      Add('(');
      Add('  IV_LOJA	DOUBLE PRECISION,');
      Add('  IV_CAIX	DOUBLE PRECISION,');
      Add('  IV_NUME	DOUBLE PRECISION,');
      Add('  IV_FUNC	DOUBLE PRECISION,');
      Add('  IV_GRUP	DOUBLE PRECISION,');
      Add('  IV_SUBG	DOUBLE PRECISION,');
      Add('  IV_PROD	DOUBLE PRECISION,');
      Add('  IV_CORE	DOUBLE PRECISION,');
      Add('  IV_OTAM	INTEGER,');
      Add('  IV_TAMA	VARCHAR(5),');
      Add('  IV_PVEN	DOUBLE PRECISION,');
      Add('  IV_QTDE	DOUBLE PRECISION,');
      Add('  IV_PDES	DOUBLE PRECISION,');
      Add('  IV_DESC	DOUBLE PRECISION,');
      Add('  IV_TOTA	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CRELOJA')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CRELOJA');
      Add('(');
      Add('  LO_CODI	DOUBLE PRECISION, ');
      Add('  LO_NOME         VARCHAR(40), ');
      Add('  LO_FF8E    VARCHAR(1)        ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      Add('CREATE INDEX CRELOJA_PRIM');
      Add('ON CRELOJA(LO_CODI)');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('VALES_MERCADORIAS','VA_TIPZ','VARCHAR(1)');
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE AUDITORIA_TROCA_VENDEDOR')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].AUDITORIA_TROCA_VENDEDOR');
      Add('(');
      Add('  AV_LOJA	DOUBLE PRECISION,');
      Add('  AV_CAIX        DOUBLE PRECISION,');
      Add('  AV_VEND        DOUBLE PRECISION,');
      Add('  AV_FUNC        DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('AV_DATA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('AV_DATA	DATETIME,');
      Add('  AV_VENA        DOUBLE PRECISION,');
      Add('  AV_NVEN        DOUBLE PRECISION,');
      Add('  AV_TIPZ        VARCHAR(1)       ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE TRANSF_LOJA')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].TRANSF_LOJA');
      Add('(');
      Add('  TR_LOJ1	DOUBLE PRECISION,');
      Add('  TR_NUME	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  TR_DATA	TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  TR_DATA    DATETIME,');
      Add('  TR_LOJ2	DOUBLE PRECISION,');
      Add('  TR_STAT	VARCHAR(1),');
      Add('  TR_ENVI	VARCHAR(1),');
      Add('  TR_ONLI	VARCHAR(1),');
      Add('  TR_TIPZ	VARCHAR(1)');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ITENS_TRANSF_LOJA')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ITENS_TRANSF_LOJA');
      Add('(');
      Add('  IT_LOJ1	DOUBLE PRECISION,');
      Add('  IT_TRAN	DOUBLE PRECISION,');
      Add('  IT_TIPZ	VARCHAR(1),');
      Add('  IT_GRUP	DOUBLE PRECISION,');
      Add('  IT_SUBG	DOUBLE PRECISION,');
      Add('  IT_PROD	DOUBLE PRECISION,');
      Add('  IT_CORE	DOUBLE PRECISION,');
      Add('  IT_OTAM	INTEGER,');
      Add('  IT_TAMA	VARCHAR(5),');
      Add('  IT_QTDE	DOUBLE PRECISION,');
      Add('  IT_MOV1	DOUBLE PRECISION,');
      Add('  IT_MOV2	DOUBLE PRECISION,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('  IT_DIGI	TIMESTAMP,');
        Add('  IT_EMBA	TIMESTAMP,');
        Add('  IT_CHEG	TIMESTAMP,');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('  IT_DIGI	DATETIME,');
        Add('  IT_EMBA	DATETIME,');
        Add('  IT_CHEG	DATETIME,');
      end;
      Add('  IT_STAT	VARCHAR(1),');
      Add('  IT_QTDS	DOUBLE PRECISION');
      Add(');');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE LOTE_INVENTARIO')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].LOTE_INVENTARIO');
      Add('(');
      Add('  LOJA DOUBLE PRECISION,');
      Add('  TERMINAL INTEGER,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('  DATA TIMESTAMP,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('  DATA DATETIME,');
      Add('  GRUPO DOUBLE PRECISION,');
      Add('  SUBGRUPO DOUBLE PRECISION,');
      Add('  PRODUTO DOUBLE PRECISION,');
      Add('  COR DOUBLE PRECISION,');
      Add('  TAMANHO VARCHAR(5),');
      Add('  SALDO DOUBLE PRECISION,');
      Add('  TIPZ VARCHAR(1),');
      Add('  SEQ INTEGER,');
      Add('  CBARRA VARCHAR(20),');
      Add('  DESCRICAO VARCHAR(60),');
      Add('  REFINT VARCHAR(12),');
      Add('  FORN DOUBLE PRECISION,');
      Add('  REFFAB VARCHAR(15),');
      Add('  UNID VARCHAR(5)');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE MTV_ATDOS (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].MTV_ATDOS (');
      Add('MA_CODI double precision, ');
      Add('MA_DESC varchar(40) ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ATENDIMENTOS (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ATENDIMENTOS (');
      Add('AT_CAIX double precision,');
      Add('AT_LOJA double precision,');
      Add('AT_CODI double precision,');
      Add('AT_FUNC double precision,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('AT_DATA timestamp,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('AT_DATA datetime,');
      Add('AT_OPER double precision,');
      Add('AT_TOTA double precision,');
      Add('AT_QTDE float,');
      Add('AT_QTD1 float,');
      Add('AT_QTD2 float,');
      Add('AT_VEND double precision,');
      Add('AT_NOME varchar (40),');
      Add('AT_ONLI varchar (1),');
      Add('AT_ENVI varchar (1),');
      Add('AT_STAT varchar (1),');
      Add('AT_VEN2 double precision,');
      Add('AT_CAI2 double precision');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ATDO_LOCAL (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ATDO_LOCAL (');
      Add('AT_CAIX double precision,');
      Add('AT_LOJA double precision,');
      Add('AT_CODI double precision,');
      Add('AT_FUNC double precision,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('AT_DATA timestamp,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('AT_DATA datetime,');
      Add('AT_OPER double precision,');
      Add('AT_TOTA double precision,');
      Add('AT_QTDE float,');
      Add('AT_QTD1 float,');
      Add('AT_QTD2 float,');
      Add('AT_VEND double precision,');
      Add('AT_NOME varchar (40),');
      Add('AT_ONLI varchar (1),');
      Add('AT_ENVI varchar (1),');
      Add('AT_STAT varchar (1),');
      Add('AT_VEN2 double precision,');
      Add('AT_CAI2 double precision');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ITENS_ATENDIMENTOS (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ITENS_ATENDIMENTOS (');
      Add('IA_LOJA double precision, ');
      Add('IA_CAIX double precision, ');
      Add('IA_VEND double precision, ');
      Add('IA_GRUP double precision, ');
      Add('IA_SUBG double precision, ');
      Add('IA_PROD double precision, ');
      Add('IA_TAMA varchar(5), ');
      Add('IA_CORE double precision, ');
      Add('IA_QTDE double precision, ');
      Add('IA_TOTA double precision, ');
      Add('IA_PVEN double precision, ');
      Add('IA_OTAM smallint , ');
      Add('IA_MODO smallint , ');
      Add('IA_SEQ smallint ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ITENS_ATDO_LOCAL(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ITENS_ATDO_LOCAL(');
      Add('IA_LOJA double precision, ');
      Add('IA_CAIX double precision, ');
      Add('IA_VEND double precision, ');
      Add('IA_GRUP double precision, ');
      Add('IA_SUBG double precision, ');
      Add('IA_PROD double precision, ');
      Add('IA_TAMA varchar(5), ');
      Add('IA_CORE double precision, ');
      Add('IA_QTDE double precision, ');
      Add('IA_TOTA double precision, ');
      Add('IA_PVEN double precision, ');
      Add('IA_OTAM smallint , ');
      Add('IA_MODO smallint , ');
      Add('IA_SEQ smallint ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE MTV_ATDOS (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].MTV_ATDOS (');
      Add('MA_CODI double precision, ');
      Add('MA_DESC varchar(40) ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('CONF','ORDEM_CODIGO','SMALLINT');
    CriaCampo('CONF','ORDEM_REFINTERNA','SMALLINT');
    CriaCampo('CONF','ORDEM_REFFABRIC','SMALLINT');
    CriaCampo('CONF','ORDEM_CBARRA','SMALLINT');
    CriaCampo('CONF','ORDEM_PROD_COR_TAM','SMALLINT');
         {*********************************************************}
    CriaCampo('ITENS_TRANSF_LOJA','IT_QTAE','DOUBLE PRECISION');
    CriaCampo('ITENS_TRANSF_LOJA','IT_QTAS','DOUBLE PRECISION');
    CriaCampo('ITENS_TRANSF_LOJA','IT_MOV3','DOUBLE PRECISION');
    CriaCampo('ITENS_TRANSF_LOJA','IT_MOV4','DOUBLE PRECISION');
    CriaCampo('ITENS_TRANSF_LOJA','IT_ACER','VARCHAR(1)');
         {*********************************************************}
    CriaCampo('ATENDIMENTOS','AT_MOTI','DOUBLE PRECISION');
         {*********************************************************}
    CriaCampo('CARTOES_PARCELAS','PC_ORDE','SMALLINT');
    CriaCampo('CARTOES_PARCELAS_LOCAL','PC_ORDE','SMALLINT');
         {*********************************************************}
         //valor comissionavel
    CriaCampo('VENDAS','VE_COMI','DOUBLE PRECISION');
    CriaCampo('VENDAS_LOCAL','VE_COMI','DOUBLE PRECISION');
         {*********************************************************}
    if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      CriaCampo('ITENS_VENDAS','IV_DATA','TIMESTAMP')
    else
    if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      CriaCampo('ITENS_VENDAS','IV_DATA','DATETIME');
    CriaCampo('ITENS_VENDAS','IV_VEDE','DOUBLE PRECISION');
    if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      CriaCampo('ITENS_VENDAS_LOCAL','IV_DATA','TIMESTAMP')
    else
    if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      CriaCampo('ITENS_VENDAS_LOCAL','IV_DATA','DATETIME');
    CriaCampo('ITENS_VENDAS_LOCAL','IV_VEDE','DOUBLE PRECISION');
         {*********************************************************} //para fins de MARKUP
    CriaCampo('ITENS_VENDAS','IV_UPCU','DOUBLE PRECISION');
    CriaCampo('ITENS_VENDAS','IV_PAQU','DOUBLE PRECISION');
    CriaCampo('ITENS_VENDAS','IV_PCUS','DOUBLE PRECISION');
    CriaCampo('ITENS_VENDAS_LOCAL','IV_UPCU','DOUBLE PRECISION');
    CriaCampo('ITENS_VENDAS_LOCAL','IV_PAQU','DOUBLE PRECISION');
    CriaCampo('ITENS_VENDAS_LOCAL','IV_PCUS','DOUBLE PRECISION');
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VENDAS_ATENDIMENTO(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VENDAS_ATENDIMENTO(');
      Add('VA_LOJA double precision, ');
      Add('VA_CAIX double precision, ');
      Add('VA_VEND double precision, ');
      Add('VA_VEDE double precision, ');
      Add('VA_QTDE double precision, ');
      Add('VA_TOTA double precision, ');
      Add('VA_COMI double precision  ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('CRELOJA','LO_FF8E','VARCHAR(1)');
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('UPDATE CRELOJA                                               ');
      Add('SET LO_FF8E='+chr(39)+'1'+chr(39)+' WHERE LO_FF8E IS NULL    ');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('ATENDIMENTOS','AT_DESC','DOUBLE PRECISION');
    CriaCampo('ATDO_LOCAL','AT_DESC','DOUBLE PRECISION');
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('UPDATE ATENDIMENTOS SET AT_DESC=0.00 WHERE AT_DESC IS NULL');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    CriaCampo('ITENS_TRANSF_LOJA','IT_SEQ','INTEGER');
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('UPDATE ITENS_TRANSF_LOJA SET IT_SEQ=1 WHERE IT_SEQ IS NULL');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ATENDIMENTOS_EXCESSO(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ATENDIMENTOS_EXCESSO(');
      Add('AE_LOJA double precision, ');
      Add('AE_CAIX double precision, ');
      Add('AE_VEND double precision, ');
      Add('AE_VALO double precision  ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VENDAS_EXCESSO(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VENDAS_EXCESSO(');
      Add('VE_LOJA double precision, ');
      Add('VE_CAIX double precision, ');
      Add('VE_VEND double precision, ');
      Add('VE_VALO double precision  ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('CREDIARIOS','CR_EORD','INTEGER');
    CriaCampo('CREDIARIOS_LOCAL','CR_EORD','INTEGER');
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      Add('UPDATE CREDIARIOS SET CR_EORD=0 WHERE CR_EORD IS NULL');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CHEQUES_DEVOLVIDOS_RECEBIDOS(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CHEQUES_DEVOLVIDOS_RECEBIDOS(');
      Add('VALOR  DOUBLE PRECISION, ');
      Add('CPF    VARCHAR(14), ');
      Add('BANCO  DOUBLE PRECISION, ');
      Add('NUMERO DOUBLE PRECISION, ');
      Add('CAIXA  DOUBLE PRECISION, ');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('DATA   TIMESTAMP ')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('DATA   DATETIME ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE MODELOS(')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].MODELOS(');
      Add(' MD_CODI double precision, ');
      Add(' MD_DESC varchar(40)  ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('ALTER TABLE CHEQUES                     ');
        Add('ALTER COLUMN CH_NBAN VARCHAR(40)        ');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('ALTER TABLE CHEQUES                     ');
        Add('ALTER CH_NBAN TYPE VARCHAR(40)          ');
      end;
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('ALTER TABLE CHEQUES_LOCAL               ');
        Add('ALTER COLUMN CH_NBAN VARCHAR(40)        ');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('ALTER TABLE CHEQUES_LOCAL               ');
        Add('ALTER CH_NBAN TYPE VARCHAR(40)          ');
      end;
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
    begin
      CriaCampo('CHEQUES','CH_VENC','DATETIME');
      CriaCampo('CHEQUES','CH_DTPG','DATETIME');
      CriaCampo('CHEQUES_LOCAL','CH_VENC','DATETIME');
      CriaCampo('CHEQUES_LOCAL','CH_DTPG','DATETIME');
    end
    else
    if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
    begin
      CriaCampo('CHEQUES','CH_VENC','TIMESTAMP');
      CriaCampo('CHEQUES','CH_DTPG','TIMESTAMP');
      CriaCampo('CHEQUES_LOCAL','CH_VENC','TIMESTAMP');
      CriaCampo('CHEQUES_LOCAL','CH_DTPG','TIMESTAMP');
    end;
    CriaCampo('CHEQUES','CH_STAT','VARCHAR(1)');
    CriaCampo('CHEQUES','CH_ALIN','VARCHAR(5)');
    CriaCampo('CHEQUES_LOCAL','CH_STAT','VARCHAR(1)');
    CriaCampo('CHEQUES_LOCAL','CH_ALIN','VARCHAR(5)');
    CriaCampo('CHEQUES','CH_VALO','DOUBLE PRECISION');
    CriaCampo('CHEQUES','CH_VAPG','DOUBLE PRECISION');
    CriaCampo('CHEQUES_LOCAL','CH_VALO','DOUBLE PRECISION');
    CriaCampo('CHEQUES_LOCAL','CH_VAPG','DOUBLE PRECISION');
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('CREATE TABLE [dbo].CAIXAS_ENCERRAMENTO');
        Add('(');
        Add('        FC_LOJA DOUBLE PRECISION NOT NULL ,');
        Add('        FC_CAIX DOUBLE PRECISION NOT NULL ,');
        Add('        FC_FUNC DOUBLE PRECISION NOT NULL ,');
        Add('        FC_DATA DATETIME NOT NULL ,        ');
        Add('        FC_QATD DOUBLE PRECISION NULL ,    ');
        Add('        FC_TATD DOUBLE PRECISION NULL ,    ');
        Add('        FC_TROC1 DOUBLE PRECISION NULL ,  ');
        Add('        FC_DINH1 DOUBLE PRECISION NULL , ');
        Add('        FC_CCRE1 DOUBLE PRECISION NULL , ');
        Add('        FC_CDEB1 DOUBLE PRECISION NULL , ');
        Add('        FC_CHEQ1 DOUBLE PRECISION NULL , ');
        Add('        FC_CRED1 DOUBLE PRECISION NULL ,');
        Add('        FC_TROV1 DOUBLE PRECISION NULL ,');
        Add('        FC_VALR1 DOUBLE PRECISION NULL ,');
        Add('        FC_TOTA1 DOUBLE PRECISION NULL ,');
        Add('        FC_TROC2 DOUBLE PRECISION NULL ,');
        Add('        FC_DINH2 DOUBLE PRECISION NULL ,');
        Add('        FC_CCRE2 DOUBLE PRECISION NULL ,');
        Add('        FC_CDEB2 DOUBLE PRECISION NULL ,');
        Add('        FC_CHEQ2 DOUBLE PRECISION NULL ,');
        Add('        FC_CRED2 DOUBLE PRECISION NULL ,');
        Add('        FC_TROV2 DOUBLE PRECISION NULL ,');
        Add('        FC_VALR2 DOUBLE PRECISION NULL ,');
        Add('        FC_TOTA2 DOUBLE PRECISION NULL ,');
        Add('        CONSTRAINT prim_CAIXA_ENCERRAMENTO PRIMARY KEY CLUSTERED');
        Add('        (');
        Add('                FC_LOJA,');
        Add('                FC_CAIX,');
        Add('                FC_FUNC,');
        Add('                FC_DATA');
        Add('        )');
        Add(')');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('CREATE TABLE CAIXAS_ENCERRAMENTO');
        Add('(');
        Add('        FC_LOJA DOUBLE PRECISION NOT NULL ,  ');
        Add('        FC_CAIX DOUBLE PRECISION NOT NULL ,  ');
        Add('        FC_FUNC DOUBLE PRECISION NOT NULL ,  ');
        Add('        FC_DATA TIMESTAMP NOT NULL ,         ');
        Add('        FC_QATD DOUBLE PRECISION ,  ');
        Add('        FC_TATD DOUBLE PRECISION ,  ');
        Add('        FC_TROC1 DOUBLE PRECISION , ');
        Add('        FC_DINH1 DOUBLE PRECISION , ');
        Add('        FC_CCRE1 DOUBLE PRECISION , ');
        Add('        FC_CDEB1 DOUBLE PRECISION , ');
        Add('        FC_CHEQ1 DOUBLE PRECISION , ');
        Add('        FC_CRED1 DOUBLE PRECISION , ');
        Add('        FC_TROV1 DOUBLE PRECISION , ');
        Add('        FC_VALR1 DOUBLE PRECISION , ');
        Add('        FC_TOTA1 DOUBLE PRECISION , ');
        Add('        FC_TROC2 DOUBLE PRECISION , ');
        Add('        FC_DINH2 DOUBLE PRECISION , ');
        Add('        FC_CCRE2 DOUBLE PRECISION , ');
        Add('        FC_CDEB2 DOUBLE PRECISION , ');
        Add('        FC_CHEQ2 DOUBLE PRECISION , ');
        Add('        FC_CRED2 DOUBLE PRECISION , ');
        Add('        FC_TROV2 DOUBLE PRECISION , ');
        Add('        FC_VALR2 DOUBLE PRECISION,  ');
        Add('        FC_TOTA2 DOUBLE PRECISION   ');
        Add(')');
      end;
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add('CREATE TABLE [dbo].SANGRIA_REPROVISAO ');
        Add('(');
        Add('  LOJA DOUBLE PRECISION NOT NULL, ');
        Add('  TERMINAL DOUBLE PRECISION  NOT NULL, ');
        Add('  DATA DATETIME  NOT NULL, ');
        Add('  FUNC DOUBLE PRECISION  NOT NULL, ');
        Add('  VALOR DOUBLE PRECISION  NOT NULL, ');
        Add('  MOTIVO VARCHAR(40), ');
        Add('  TIPO SMALLINT, ');
        Add('  HORA VARCHAR(15) ');
        Add(')');
      end
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add('CREATE TABLE SANGRIA_REPROVISAO ');
        Add('(');
        Add('  LOJA DOUBLE PRECISION, ');
        Add('  TERMINAL DOUBLE PRECISION, ');
        Add('  DATA TIMESTAMP, ');
        Add('  FUNC DOUBLE PRECISION, ');
        Add('  VALOR DOUBLE PRECISION, ');
        Add('  MOTIVO VARCHAR(40), ');
        Add('  TIPO SMALLINT, ');
        Add('  HORA VARCHAR(15) ');
        Add(')');
      end;
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    CriaCampo('ITENS_VENDAS','IV_QTDR','DOUBLE PRECISION');
         {*********************************************************}


    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_MERC_LOCAL ')
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_MERC_LOCAL ');
      Add('(');
      Add('  VM_LOJA DOUBLE PRECISION NOT NULL, ');
      Add('  VM_CAIX DOUBLE PRECISION  NOT NULL, ');
      Add('  VM_VEND DOUBLE PRECISION  NOT NULL, ');
      Add('  VM_ORDE SMALLINT NOT NULL, ');
      Add('  VM_VALO DOUBLE PRECISION , ');
      Add('  VM_CFUN DOUBLE PRECISION , ');
      Add('  VM_NPAR SMALLINT, ');
      Add('  VM_NUME VARCHAR(20) ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {*********************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].VALES_MERC ')
      else
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE VALES_MERC ');
      Add('(');
      Add('  VM_LOJA DOUBLE PRECISION NOT NULL, ');
      Add('  VM_CAIX DOUBLE PRECISION  NOT NULL, ');
      Add('  VM_VEND DOUBLE PRECISION  NOT NULL, ');
      Add('  VM_ORDE SMALLINT NOT NULL, ');
      Add('  VM_VALO DOUBLE PRECISION , ');
      Add('  VM_CFUN DOUBLE PRECISION , ');
      Add('  VM_NPAR SMALLINT, ');
      Add('  VM_NUME VARCHAR(20) ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}

    with (qGeraCampoVENDAS) do
    begin
      sql.clear;
      Sql.Add('CREATE TABLE ESTOQUE_LOJA (');
      Sql.Add('EL_GRUP Float');
      Sql.Add(',EL_SUBG Float');
      Sql.Add(',EL_PROD Float ');
      Sql.Add(',EL_CORE Float ');
      Sql.Add(',EL_TAMA VarChar(5) ');
      Sql.Add(',EL_LOJA Float ');
      Sql.Add(',EL_PVE1 Float ');
      Sql.Add(',EL_PVE2 Float ');
      Sql.Add(',EL_PCU1 Float ');
      Sql.Add(',EL_PCU2 Float ');
      Sql.Add(',EL_QTD1 Float ');
      Sql.Add(',EL_QTD2 Float ');
      Sql.Add(',EL_UPC1 Float ');
      Sql.Add(',EL_UPC2 Float ');
      Sql.Add(',EL_ULC1 '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      Sql.Add(',EL_ULC2 '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      Sql.Add(',EL_OTAM Integer');
      Sql.Add(',EL_UPA1 Float ');
      Sql.Add(',EL_UPA2 Float ');
      Sql.Add(',EL_TIME '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      Sql.Add(',EL_UVEN '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      Sql.Add(',EL_UTRF '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      Sql.Add(',EL_UVLM '+IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP'));
      sql.add(')');
      try
        execsql
      except
      end;

      if CriaCampoBd('VENDAS','ESTOQUE_LOJA','EL_TIME',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ESTOQUE_LOJA SET EL_TIME = ''1-JAN-1900'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ESTOQUE_LOJA','EL_UVEN',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ESTOQUE_LOJA SET EL_UVEN = ''1-JAN-1900'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ESTOQUE_LOJA','EL_UTRF',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ESTOQUE_LOJA SET EL_UTRF = ''1-JAN-1900'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ESTOQUE_LOJA','EL_UVLM',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ESTOQUE_LOJA SET EL_UVLM = ''1-JAN-1900'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ITENS_VENDAS','IV_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ITENS_VENDAS SET IV_HORA = IV_DATA+'' 00:00:00'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ITENS_TRANSF_LOJA','IT_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ITENS_TRANSF_LOJA SET IT_HORA = IT_DIGI+'' 00:00:00'' ');
        try
          execsql
        except
        end;
      end;

      if CriaCampoBd('VENDAS','ITENS_VALES_MERCADORIAS','IV_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
      begin
        sql.clear;
        sql.add('UPDATE ITENS_VALES_MERCADORIAS SET IV_HORA = (SELECT MAX(VA_DATA) FROM VALES_MERCADORIAS');
        sql.add('                                              WHERE  ITENS_VALES_MERCADORIAS.IV_LOJA = VA_LOJA');
        sql.add('                                              AND    ITENS_VALES_MERCADORIAS.IV_CAIX = VA_CAIX');
        sql.add('                                              AND    ITENS_VALES_MERCADORIAS.IV_NUME = VA_NUME');
        sql.add('                                              and    ITENS_VALES_MERCADORIAS.IV_FUNC = VA_FUNC)+'' 00:00:00'' ');
        try
          execsql
        except
        end;
      end;
    end;

         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ATENDIMENTOS_SUSP (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ATENDIMENTOS_SUSP (');
      Add('AT_CAIX double precision,');
      Add('AT_LOJA double precision,');
      Add('AT_CODI double precision,');
      Add('AT_FUNC double precision,');
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('AT_DATA timestamp,')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('AT_DATA datetime,');
      Add('AT_OPER double precision,');
      Add('AT_TOTA double precision,');
      Add('AT_QTDE float,');
      Add('AT_QTD1 float,');
      Add('AT_QTD2 float,');
      Add('AT_VEND double precision,');
      Add('AT_NOME varchar (40),');
      Add('AT_ONLI varchar (1),');
      Add('AT_ENVI varchar (1),');
      Add('AT_STAT varchar (1),');
      Add('AT_VEN2 double precision,');
      Add('AT_CAI2 double precision,');
      Add('AT_MOTI double precision,');
      Add('AT_DESC double precision ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
         {**********************************************************************************}
    with (qGeraCampoVENDAS.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE ITENS_ATENDIMENTOS_SUSP (')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].ITENS_ATENDIMENTOS_SUSP (');
      Add('IA_LOJA double precision, ');
      Add('IA_CAIX double precision, ');
      Add('IA_VEND double precision, ');
      Add('IA_GRUP double precision, ');
      Add('IA_SUBG double precision, ');
      Add('IA_PROD double precision, ');
      Add('IA_TAMA varchar(5), ');
      Add('IA_CORE double precision, ');
      Add('IA_QTDE double precision, ');
      Add('IA_TOTA double precision, ');
      Add('IA_PVEN double precision, ');
      Add('IA_OTAM smallint , ');
      Add('IA_MODO smallint , ');
      Add('IA_SEQ smallint ');
      Add(')');
      try
        qGeraCampoVENDAS.ExecSql;
      except
      end;
    end;
    with qgeraCampoVendas.SQL do
    begin
      clear;
      add('ALTER TABLE sangria_reprovisao ADD bancoch int default 0');
      try
        qgeraCampoVendas.execsql;
      except
      end;

      clear;
      add('ALTER TABLE sangria_reprovisao ADD agech Varchar(10) default '''' ' );
      try
        qgeraCampoVendas.execsql;
      except
      end;

      clear;
      add('ALTER TABLE sangria_reprovisao ADD Numch Float default 0');
      try
        qgeraCampoVendas.execsql;
      except
      end;

      atualizacao := true;
      clear;
      add('ALTER TABLE sangria_reprovisao ADD Cheque Varchar(1)');
      try
        qgeraCampoVendas.execsql;
      except
        atualizacao := false;
      end;

      clear;
      add('ALTER TABLE sangria_reprovisao ADD ContaCh Varchar(25) default 0');
      try
        qgeraCampoVendas.execsql;
      except
      end;

      if atualizacao then
      begin
        clear;
        add('UPDATE    SANGRIA_REPROVISAO SET   cheque = '''' ');
        try
          qgeraCampoVendas.execsql;
        except
        end;
      end;

      Atualizacao := true;
      clear;
      add('ALTER TABLE cheques ADD ch_sangria varchar(1) Default '''' ');
      try
        qgeracampovendas.execsql;
      except
        Atualizacao := false;
      end;

      if Atualizacao then
      begin
        clear;
        add('UPDATE CHEQUES SET  ch_sangria = '''' ');
        try
          qgeraCampovendas.execsql;
        except
        end;

        clear;
        add('UPDATE Sangria_Reprovisao Set BancoCh = 0,ContaCh = 0,AgeCh = '''' ');
        try
          qgeraCampovendas.execsql;
        except
        end;
      end;

      clear;
      add('ALTER TABLE Formas_Pagamento ADD FO_Gaveta Varchar(1) default '''' ');
      try
        qgeraCampoVendas.execsql;
      except
      end;

      clear;
      add('UPDATE Formas_Pagamento SET Fo_Gaveta = '''' ');
      add('Where Fo_Gaveta is null');
      try
        qgeraCampoVendas.execsql;
      except
      end;

      if databasecontas='CONTASPAGAR' then
      begin
        qGeraCampoVENDAS.databasename := 'CONTASPAGAR';
        CriaCampo('LANCAMENTOS','LA_DOC','VARCHAR(250)');
        CriaCampo('LANCAMENTOS_CONTA_CAIXA','LA_DOC','VARCHAR(250)');


        qgeracampovendas.sql.clear;
        qgeracampovendas.sql.Add('alter table LANCAMENTOS_CONTA_CAIXA alter column la_tipo varchar(50)');
        try
          qgeraCampoVendas.execsql;
        except
        end;

        qgeracampovendas.sql.clear;
        qgeracampovendas.sql.Add('alter table LANCAMENTOS alter column la_tipo varchar(50)');
        try
          qgeraCampoVendas.execsql;
        except
        end;


        qGeraCampovENDAS.sql.clear;
        qGeraCampovENDAS.sql.add('ALTER TABLE LANCAMENTOS ALTER COLUMN LA_DESC VARCHAR(100)');
        try
          qGeraCampovENDAS.EXECSQL
        except
        end;

        qGeraCampovENDAS.sql.clear;
        qGeraCampovENDAS.sql.add('ALTER TABLE LANCAMENTOS_CONTA_CAIXA ALTER COLUMN LA_DESC VARCHAR(100)');
        try
          qGeraCampovENDAS.EXECSQL
        except
        end;


        qGeraCampoVENDAS.databasename := 'VENDAS';
      end;

      CriaCampo('SANGRIA_REPROVISAO','ENV','VARCHAR(1) default ''0'' ');

      clear;
      add('UPDATE SANGRIA_REPROVISAO SET ENV = ''0'' ');
      add('Where ENV is null');
      try
        qgeraCampoVendas.execsql;
      except
      end;


      Atualiza := false;
      clear;
      Add('CREATE TABLE MTV_SANG ');
      Add('(');
      Add('  CODIGO DOUBLE PRECISION NOT NULL, ');
      Add('  DESCRICAO VARCHAR(50)  NOT NULL, ');
      Add('  CONTA VARCHAR(25) ');
      Add(')');
      try
        qgeracampoVendas.ExecSql;
        Atualiza := true;
      except
      end;

      if Atualiza then
      begin
        clear;
        Add('INSERT INTO MTV_SANG (codigo,descricao,conta) Values(:Codigo,:Descricao,:Conta)');
        qgeracampoVendas.parambyname('Codigo').AsFloat     := 1;
        qgeracampoVendas.parambyname('Descricao').AsString := 'TRANSFERENCIA DE UM CAIXA PARA OUTRO';
        qgeracampoVendas.parambyname('Conta').AsString     := 'Pergunta';
        try
          qgeracampoVendas.ExecSql;
        except
        end;

        qgeracampoVendas.parambyname('Codigo').AsFloat     := 2;
        qgeracampoVendas.parambyname('Descricao').AsString := 'REMESSA / RECEBIMENTO ESCRITÓRIO';
        try
          qgeracampoVendas.ExecSql;
        except
        end;

        qgeracampoVendas.parambyname('Codigo').AsFloat     := 3;
        qgeracampoVendas.parambyname('Descricao').AsString := 'OUTROS';
        try
          qgeracampoVendas.ExecSql;
        except
        end;
      end;

      CriaCampo('PESQUISA_PRECOS','PS_CODI','FLOAT');
      CriaCampo('PESQUISA_PRECOS','PS_DESC','VARCHAR(60)');
      CriaCampo ('PRECOS_PROMOCIONAIS','PP_CONCR','FLOAT');

      CriaCampoBd('VENDAS','SANGRIA_REPROVISAO','TIPZ','VARCHAR(1)');
      clear;
      Add('UPDATE SANGRIA_REPROVISAO SET TIPZ = ''1'' ');
      Add('WHERE TIPZ IS NULL ');
      try
        QgeraCampoVendas.ExecSql;
      except
      end;


      CriaCampo ('CRELOJA','LO_ESTA','VarChar(2) Default ''RJ'' ');


      CriaCampo('Aliquotas_Produtos','AP_Isento','Varchar(5) Default ''NAO'' ');
      CriaCampo('Aliquotas_Produtos','AP_Time',IIFS(x_banco_de_dados=KDB_INTERBASE,'TimeStamp','DateTime'));

      CriaCampo ('CHEQUES_DEVOLVIDOS_RECEBIDOS','LOJA','Float');

      with QGeracampoVendas do
      begin
        sql.clear;
        sql.Add('UPDATE CRELOJA                                                ');
        sql.Add('SET LO_ESTA='+chr(39)+'RJ'+chr(39)+' WHERE LO_ESTA IS NULL    ');
        try
          ExecSql;
        except
        end;

        Sql.clear;
        Sql.Add('CREATE INDEX CONF03_10_06 ON CONF (EMPRESA)');
        try
          Execsql;
          Atualiza:= true;
        except
          Atualiza:= false;
        end;

        if Atualiza then
        begin
          sql.clear;
          sql.add('UPDATE ALIQUOTAS_PRODUTOS SET AP_ISENTO = ''SIM'',AP_GRUP = 0,AP_SUBG = 0,AP_PROD = 0,AP_TIME = '''+DataBancoDados(X_data_trabalho)+''' ');
          sql.add('WHERE AP_GRUP = 1 AND AP_SUBG = 1 AND AP_PROD = 1');
          try
            execsql;
          except
          end;
        end;
      end;

      with (qGeraCampoVENDAS.sql) do
      begin
        clear;
        Add('CREATE TABLE LANCAMENTOS_CAIXA_EXC');
        Add('(');
        Add('  LC_LOJA	DOUBLE PRECISION,');
        Add('  LC_CAIX        DOUBLE PRECISION,');
        Add('  LC_FUNC        DOUBLE PRECISION,');
        if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        begin
          Add('LC_DATA	TIMESTAMP,');
          Add('LC_Time	TIMESTAMP,');
        end
        else
        if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        begin
          Add('LC_DATA	DATETIME,');
          Add('LC_TIME	DATETIME,');
        end;
        Add('  LC_SEQ        DOUBLE PRECISION');
        Add(')');
        try
          qGeraCampoVENDAS.ExecSql;
        except
        end;
      end;



      if databasecredito='CREDITO' then
      begin
        qGeraCampoVENDAS.databasename := 'CREDITO';


        clear;
        Add('CREATE TABLE CRECTABR_Exclui (Cr_Clie  Double Precision ,Cr_Codi  Double Precision ,Cr_Time  '+iifs(x_banco_de_dados=KDB_SQL_SERVER,'DateTime','TimeStamp')+')');
        try
          qGeraCampoVendas.ExecSql;
        except
        end;

        CriaCampo ('CRECTABR_Exclui','CR_DTEXCLUI',iifs(x_banco_de_dados=KDB_SQL_SERVER,'DateTime','TimeStamp'));

        CriaCampo ('CREPRABR','PC_CAIXA','Double Precision');
        CriaCampo ('CREPRABR','PC_VENDA','Double Precision');




        with qGeraCampoVENDAS do
        begin
          sql.clear;
          sql.add('Select BANCO_DE_DADOS from conf');
          try
            open;
          except
          end;
          fbanco := FieldBYName('BANCO_DE_DADOS').AsInteger;

          sql.clear;
          sql.add('Create Table Imp_Exp');
          sql.add(' (  ');
          sql.add('  Ix_ImpExp VarChar(1),');
          sql.add('  Ix_LojaOrg Float,');
          sql.add('  Ix_LojaDest Float,');
          sql.add('  Ix_Data '+IIfs(FBanco = 1,'DateTime','TimeStamp')+',');
          sql.add('  Ix_Inicio '+IIfs(FBanco = 1,'DateTime','TimeStamp')+',');
          sql.add('  Ix_Fim '+IIfs(FBanco  = 1,'DateTime','TimeStamp')+',');
          sql.add('  Ix_Tabela Varchar(100),');
          sql.add('  Ix_Usuario Varchar(50),');
          sql.add('  Ix_Parcial Varchar(50),');
          sql.add('  Ix_Reg Float,');
          sql.add('  Ix_RegNew Float,');
          sql.add('  Ix_Erro  Varchar(20)');
          sql.add('  )');
          try
            qGeraCampoVendas.ExecSql;
          except
          end;
        end;


        qGeraCampoVENDAS.databasename := 'VENDAS';
      end;

      CriaCampoBd('CREDITO','CREPRABR','PC_FUNC','FLOAT');
      CriaCampoBd('CREDITO','CONF','REQDIGV','VARCHAR(1)');
      CriaCampoBd('CREDITO','CONF','PODE_VALOR_MENOR','VARCHAR(1)');
      CriaCampoBd('CREDITO','CONF','BLOQUEIA_APOS_COMPRA','VARCHAR(1)');

      AjustaBancoDeDadosCrediario;
      if x_online then
        AjustaBancoDeDadosEstoque;

             //***********************INICIO CRIA CAMPO CONTRATO****************************************************
      if (not x_online) then
        with (qGeraCampoVendas.SQL) do
        begin
          with TQuery.Create(Application) do
            try
              DataBaseName := 'VENDAS';
              Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
              try
                execsql
              except
                CriaCampo('CREDIARIOS','CR_CONT','FLOAT');
              end;
            finally
              destroy;
            end;

          clear;
          Add('UPDATE CREDIARIOS SET CR_CONT = CR_CODI  ');
          Add('WHERE CR_CONT is NULL                    ');
          try
            qGeraCampoVendas.ExecSQL;
          except
          end;
        end
      else
        with (qGeraCampoEstoque.SQL) do
        begin
          with TQuery.Create(Application) do
            try
              DataBaseName := 'ESTOQUE';
              Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
              try
                execsql
              except
                CriaCampo('CREDIARIOS','CR_CONT','FLOAT');
              end;
            finally
              destroy;
            end;

          clear;
          Add('UPDATE CREDIARIOS SET CR_CONT = CR_CODI  ');
          Add('WHERE CR_CONT is NULL                    ');
          try
            qGeraCampoEstoque.ExecSQL;
          except
          end;
        end;
             //***********************FIM CRIA CAMPO CONTRATO*******************************************************

      if databaseprodutos='ESTOQUE' then
      begin
        CriaCampoBd('ESTOQUE','SANGRIA_REPROVISAO','TIPZ','VARCHAR(1)');
        qGeraCampoVENDAS.databasename := 'ESTOQUE';
        with qGeraCampoVENDAS do
        begin
          if CriaCampoBd('ESTOQUE','ESTOQUE_LOJA','EL_TIME',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ESTOQUE_LOJA SET EL_TIME = ''1-JAN-1900'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ESTOQUE_LOJA','EL_UVEN',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ESTOQUE_LOJA SET EL_UVEN = ''1-JAN-1900'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ESTOQUE_LOJA','EL_UTRF',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ESTOQUE_LOJA SET EL_UTRF = ''1-JAN-1900'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ESTOQUE_LOJA','EL_UVLM',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ESTOQUE_LOJA SET EL_UVLM = ''1-JAN-1900'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ITENS_VENDAS','IV_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ITENS_VENDAS SET IV_HORA = IV_DATA+'' 00:01:00'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ITENS_TRANSF_LOJA','IT_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ITENS_TRANSF_LOJA SET IT_HORA = IT_DIGI+'' 00:01:00'' ');
            try
              execsql
            except
            end;
          end;

          if CriaCampoBd('ESTOQUE','ITENS_VALES_MERCADORIAS','IV_HORA',IIfs(frm_principal.x_banco_de_dados=KDB_SQL_SERVER,'DATETIME','TIMESTAMP')) then
          begin
            sql.clear;
            sql.add('UPDATE ITENS_VALES_MERCADORIAS SET IV_HORA = (SELECT MAX(VA_DATA) FROM VALES_MERCADORIAS');
            sql.add('                                              WHERE  ITENS_VALES_MERCADORIAS.IV_LOJA = VA_LOJA');
            sql.add('                                              AND    ITENS_VALES_MERCADORIAS.IV_CAIX = VA_CAIX');
            sql.add('                                              AND    ITENS_VALES_MERCADORIAS.IV_NUME = VA_NUME');
            sql.add('                                              and    ITENS_VALES_MERCADORIAS.IV_FUNC = VA_FUNC)+'' 00:01:00'' ');
            try
              execsql
            except
            end;
          end;

          sql.clear;
          sql.clear;
          Sql.Add('CREATE TABLE CAIXAS (');
          sql.add('CX_LOJA float  ,');
          sql.add('CX_CAIX float  ,');
          if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
            sql.add('CX_DATA timestamp  ,')
          else
            sql.add('CX_DATA datetime  ,');
          Sql.Add('CX_FUNC float  ,');
          Sql.Add('CX_STAT varchar(1) ,');
          Sql.Add('CX_VINI float  ,');
          Sql.Add('CX_VIN2 float');
          Sql.Add('  ) ');
          try
            ExecSql;
          except
          end;

          sql.clear;
          Sql.Add('CREATE TABLE CHEQUES_DEVOLVIDOS_RECEBIDOS (');
          Sql.Add('VALOR float  ,');
          Sql.Add('CPF varchar(14) ,');
          Sql.Add('BANCO float  ,');
          Sql.Add('NUMERO float  ,');
          Sql.Add('CAIXA float  ,');
          if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
            sql.add('DATA timestamp,  ')
          else
            sql.add('DATA datetime,  ');
          Sql.Add('LOJA float  ');
          Sql.Add(')');
          try
            ExecSql;
          except
          end;

          sql.clear;
          Sql.Add('CREATE TABLE AUDITORIA_TROCA_VENDEDOR (');
          Sql.Add('AV_LOJA float  ,');
          Sql.Add('AV_CAIX float  ,');
          Sql.Add('AV_VEND float  ,');
          Sql.Add('AV_FUNC float  ,');
          Sql.Add('AV_DATA datetime  ,');
          Sql.Add('AV_VENA float  ,');
          Sql.Add('AV_NVEN float  ,');
          Sql.Add('AV_TIPZ varchar(1)');
          Sql.Add(')');
          try
            ExecSql;
          except
          end;

          sql.clear;
          Sql.Add('UPDATE SANGRIA_REPROVISAO SET TIPZ = ''1'' ');
          Sql.Add('WHERE TIPZ IS NULL ');
          try
            ExecSql;
          except
          end;

        end;

        qGeraCampoVENDAS.databasename := 'VENDAS';
      end;

      qGeraCampoVENDAS.databasename := 'CONTASPAGAR';
      with qGeraCampoVENDAS do
      begin
        CriaCampoBd('CONTASPAGAR','CONTAS','CO_ESTOQ','VARCHAR(1) DEFAULT ''T'' ');
        sql.clear;
        sql.add('Update contas set co_estoq = ''T'' where co_estoq is null');
        try
          execsql;
        except
        end;

        qGeraCampoVENDAS.databasename := 'VENDAS';
        CriaCampoBd('VENDAS','CONTAS','CO_ESTOQ','VARCHAR(1) DEFAULT ''T'' ');
        sql.clear;
        sql.add('Update contas set co_estoq = ''T'' where co_estoq is null');
        try
          execsql;
        except
        end;
      end;



{            atualiza := false;
            if databasecredito = 'CREDITO' then
              try
                  clear;
                  Add('Alter table creprabr add atualiza varchar(1)');
                  qGeraCampoVendas.ExecSql;
                  atualiza := true;
              except
                  //
              end;

            if atualiza then begin
              clear;
              Add ('UPDATE CREPRABR SET PC_FPGT =:Forma ');
              Add ('WHERE (PC_CLIE=:cliente) AND              ');
              Add ('      (PC_CONT=:contrato) AND             ');
              Add ('      (PC_NPRE=:prestacao)                ');

              qry := tquery.create(application);
              qry.databasename := databasecredito;
              qry.sql.add('Select * from  CREPRABR');
              try
                qry.open;
                while not qry.eof do begin
                    qGeraCampoVENDAS.parambyname('cliente').AsFloat    := Qry.fieldbyname('PC_Clie').AsFloat;
                    qGeraCampoVENDAS.parambyname('contrato').AsFloat   := Qry.fieldbyname('PC_Cont').AsFloat;
                    qGeraCampoVENDAS.parambyname('prestacao').AsFloat  := Qry.fieldbyname('PC_NPRE').AsFloat;
                    qGeraCampoVENDAS.parambyname('Forma').AsFloat      := Qry.fieldbyname('PC_FPGT').AsFloat;
                    qGeraCampoVENDAS.execsql;
                    qry.next;
                end;
              except
                //
              end;
              qry.destroy;
            end;}

    end;

    //*** Campos criados para armazenar valor de possíveis descontos ou acréscimos em itens da venda ****
    clPAF := TClassAuxiliar.Create;
    clPAF.Conect('VENDAS',self);
    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT IV_DESC,IV_PDES,IV_ACRE,IV_PACR ');
      clPAF.AddParam('FROM ITENS_VENDAS                      ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','ITENS_VENDAS','IV_DESC','FLOAT');           //Valor Desconto do item
      CriaCampoBd('VENDAS','ITENS_VENDAS','IV_PDES','FLOAT');           //Porcentagem do Desconto do item
      CriaCampoBd('VENDAS','ITENS_VENDAS','IV_ACRE','FLOAT');           //Valor Acréscimo do item
      CriaCampoBd('VENDAS','ITENS_VENDAS','IV_PACR','FLOAT');           //Porcentagem do Acréscimo do item
    end;

    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT IV_DESC,IV_PDES,IV_ACRE,IV_PACR ');
      clPAF.AddParam('FROM ITENS_VENDAS_LOCAL                ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_DESC','FLOAT');
      CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_PDES','FLOAT');
      CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_ACRE','FLOAT');
      CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_PACR','FLOAT');
    end;
    //****************************************************************************************************

    //*** Novos campos da tabela de venda para armazenar valores de acréscimos em venda ******************
    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT VE_ACRE,VE_PACR ');
      clPAF.AddParam('FROM VENDAS            ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','VENDAS','VE_ACRE','FLOAT');                 //Valor Acréscimo da venda
      CriaCampoBd('VENDAS','VENDAS','VE_PACR','FLOAT');                 //Porcentagem Acréscimo da venda
    end;

    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT VE_ACRE,VE_PACR ');
      clPAF.AddParam('FROM VENDAS_LOCAL      ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','VENDAS_LOCAL','VE_ACRE','FLOAT');
      CriaCampoBd('VENDAS','VENDAS_LOCAL','VE_PACR','FLOAT');
    end;
    //****************************************************************************************************
    //*** Novos campos para indicar se o item foi cancelado ou não ***************************************
    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT IV_STAT    ');
      clPAF.AddParam('FROM ITENS_VENDAS ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','ITENS_VENDAS','IV_STAT','VARCHAR(1)');
      clPAF.ClearSql;
      clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_STAT=:stat WHERE IV_STAT IS NULL');
      clPAF.consulta.ParamByName('stat').AsString := '1';
      clPAF.Execute;
    end;

    try
      clPAF.ClearSql;
      clPAF.AddParam('SELECT IV_STAT          ');
      clPAF.AddParam('FROM ITENS_VENDAS_LOCAL ');
      clPAF.Execute;
    except
      CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_STAT','VARCHAR(1)');
      clPAF.ClearSql;
      clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_STAT=:stat WHERE IV_STAT IS NULL');
      clPAF.consulta.ParamByName('stat').AsString := '1';
      clPAF.Execute;
    end;
    //****************************************************************************************************
    clPAF.ClearSql;
    clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_DESC=:desc,IV_PDES=:pdes ');
    clPAF.AddParam('WHERE IV_DESC IS NULL AND IV_PDES IS NULL           ');
    clPAF.consulta.ParamByName('desc').AsFloat := 0.00;
    clPAF.consulta.ParamByName('pdes').AsFloat := 0.00;
    clPAF.Execute;

    clPAF.ClearSql;
    clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_ACRE=:acre,IV_PACR=:pacr ');
    clPAF.AddParam('WHERE IV_ACRE IS NULL AND IV_PACR IS NULL           ');
    clPAF.consulta.ParamByName('acre').AsFloat := 0.00;
    clPAF.consulta.ParamByName('pacr').AsFloat := 0.00;
    clPAF.Execute;

    clPAF.ClearSql;
    clPAF.AddParam('UPDATE VENDAS SET VE_ACRE=:acre,VE_PACR=:pacr ');
    clPAF.AddParam('WHERE VE_ACRE IS NULL AND VE_PACR IS NULL     ');
    clPAF.consulta.ParamByName('acre').AsFloat := 0.00;
    clPAF.consulta.ParamByName('pacr').AsFloat := 0.00;
    clPAF.Execute;

    clPAF.Desconect;
    clPAF.Free;

    with (qGeraCampoVendas.SQL) do
    begin
      clear;
      Add('UPDATE CORES SET CR_ATIV='+QuotedStr('1'));
      Add('WHERE CR_ATIV is NULL                   ');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;
    end;

    CriaCampo('CONF','BLOQUEIA_VENDA_VALOR','VARCHAR(1)');
    CriaCampo('CONF','VALOR_BLOQUEIO_VENDA','FLOAT');
    CriaCampo('CONF','EXIBE_FORNECEDOR_CONSULTA','VARCHAR(1)');
    CriaCampo('CONF','EXIBE_PRECO_CUSTO','VARCHAR(1)');

    with (qGeraCampoVendas.SQL) do
    begin
      Clear;
      Add('UPDATE CONF SET BLOQUEIA_VENDA_VALOR='+QuotedStr('0'));
      Add('WHERE BLOQUEIA_VENDA_VALOR IS NULL');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;

      Clear;
      Add('UPDATE CONF SET VALOR_BLOQUEIO_VENDA=0');
      Add('WHERE VALOR_BLOQUEIO_VENDA IS NULL');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;

      Clear;
      Add('UPDATE CONF SET EXIBE_FORNECEDOR_CONSULTA='+QuotedStr('0'));
      Add('WHERE EXIBE_FORNECEDOR_CONSULTA IS NULL');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;

      Clear;
      Add('UPDATE CONF SET EXIBE_PRECO_CUSTO='+QuotedStr('0'));
      Add('WHERE EXIBE_PRECO_CUSTO IS NULL');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;
    end;

    if (databaseprodutos = 'ESTOQUE') and (x_online) then
    begin
      CriaCampoBD('ESTOQUE','CONF','BLOQUEIA_VENDA_VALOR','VARCHAR(1)');
      CriaCampoBD('ESTOQUE','CONF','VALOR_BLOQUEIO_VENDA','FLOAT');
      CriaCampoBD('ESTOQUE','CONF','EXIBE_FORNECEDOR_CONSULTA','VARCHAR(1)');
      CriaCampoBD('ESTOQUE','CONF','EXIBE_PRECO_CUSTO','VARCHAR(1)');

      with (qGeraCampoESTOQUE.SQL) do
      begin
        Clear;
        Add('UPDATE CONF SET BLOQUEIA_VENDA_VALOR='+QuotedStr('0'));
        Add('WHERE BLOQUEIA_VENDA_VALOR IS NULL');
        try
          qGeraCampoESTOQUE.ExecSQL;
        except
        end;

        Clear;
        Add('UPDATE CONF SET VALOR_BLOQUEIO_VENDA=0');
        Add('WHERE VALOR_BLOQUEIO_VENDA IS NULL');
        try
          qGeraCampoESTOQUE.ExecSQL;
        except
        end;

        Clear;
        Add('UPDATE CONF SET EXIBE_FORNECEDOR_CONSULTA='+QuotedStr('0'));
        Add('WHERE EXIBE_FORNECEDOR_CONSULTA IS NULL');
        try
          qGeraCampoVendas.ExecSQL;
        except
        end;

        Clear;
        Add('UPDATE CONF SET EXIBE_PRECO_CUSTO='+QuotedStr('0'));
        Add('WHERE EXIBE_PRECO_CUSTO IS NULL');
        try
          qGeraCampoVendas.ExecSQL;
        except
        end;
      end;
    end;

    CriaCampo('CONF','IMPRIME_VENDEDOR_CUPOM','VARCHAR(1)');

    with (qGeraCampoVendas.SQL) do
    begin
      clear;
      Add('UPDATE CONF SET IMPRIME_VENDEDOR_CUPOM='+QuotedStr('0'));
      Add('WHERE IMPRIME_VENDEDOR_CUPOM is NULL                  ');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;
    end;
    
    {//Marcando para q nao atualize da proxima vez q o sistema for executado}
    {*********************************************************}
    clAtualizaVersao := TClassAuxiliar.Create;
    clAtualizaVersao.conect   ('VENDAS',self);
    clAtualizaVersao.ClearSql;
    clAtualizaVersao.AddParam ('UPDATE CONF SET VERSAO_SISTEMA=:versao_sistema ');
    clAtualizaVersao.consulta.parambyname('versao_sistema').AsDateTime := x_data_versao_sistema;
    clAtualizaVersao.Execute;
    clAtualizaVersao.desconect;
    clAtualizaVersao.Free;

    frm_AtualizaBd.hide;
    {*********************************************************}
  end;
end;

procedure TFrm_principal.AjustaBancoDeDadosCREDIARIO;
var
  flagatualiza: Boolean;
begin
     {...}
//     flagatualiza := NecessitaAtualizarBancoDeDadosCREDIARIO;
  flagatualiza := true;
  if (flagatualiza) then
  begin
         {**********************************************************************************}
{         Application.CreateForm(Tfrm_AtualizaBd, frm_AtualizaBd);
         frm_AtualizaBd.show;
         frm_AtualizaBd.refresh;
         frm_AtualizaBd.pnAtualizaBd.refresh;
         frm_AtualizaBd.Label1.refresh;}

         {*****************************************************}
    with (qGeraCampoCREDIARIO.sql) do
    begin
      clear;
      if (frm_principal.x_banco_de_dados=KDB_INTERBASE) then
        Add('CREATE TABLE CLIENTES_BLOQUEADOS ')
      else
      if (frm_principal.x_banco_de_dados=KDB_SQL_SERVER) then
        Add('CREATE TABLE [dbo].CLIENTES_BLOQUEADOS ');
      Add('(');
      Add('  CLIENTE DOUBLE PRECISION, ');
      Add('  STATUS VARCHAR(1),        ');
      if (x_banco_de_dados=KDB_SQL_SERVER) then
      begin
        Add(' DATABLOQ DATETIME, ');
        Add(' DATADESBLOQ DATETIME, ');
      end
      else
      if (x_banco_de_dados=KDB_INTERBASE) then
      begin
        Add(' DATABLOQ TIMESTAMP, ');
        Add(' DATADESBLOQ TIMESTAMP, ');
      end;
      Add(' MOTIVO VARCHAR(80) ');
      Add(')');
      try
        qGeraCampoCREDIARIO.ExecSql;
      except
      end;


      with (qGeraCampoCrediario.sql) do
      begin
        clear;
        Add ('Alter table CREFPGT add FP_TIPO VARCHAR(15)');
        try
          qGeraCampoCrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CREFPGT SET FP_TIPO = '''' WHERE FP_TIPO IS NULL');
        try
          qGeraCampoCrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CREFPGT SET FP_TIPO = ''DINHEIRO'' ');
        Add('WHERE FP_DESC LIKE ''%DINHEIRO%'' AND FP_TIPO = '''' ');
        try
          qGeraCampoCrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CREFPGT SET FP_TIPO = ''CHEQUE'' ');
        Add('WHERE FP_DESC LIKE ''%CHEQUE%'' AND FP_TIPO = '''' ');
        try
          qGeraCampoCrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CREFPGT SET FP_TIPO = ''CREDITO'' ');
        Add('WHERE FP_DESC LIKE ''%CRED%'' AND FP_TIPO = '''' ');
        try
          qGeraCampoCrediario.ExecSql;
        except
        end;
      end;


      with (qGeraCampocrediario.sql) do
      begin
        clear;
        Add('ALTER TABLE CONF ADD ReqDigv VARCHAR(1) ');
        try
          qGeraCampocrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CONF SET ReqDigv = ''1'' ');
        Add('WHERE ReqDigv is null  ');
        try
          qGeraCampocrediario.ExecSql;
        except
        end;

        clear;
        Add('UPDATE CONF SET pode_loja_dif_pago = ''1'' ');
        Add('WHERE pode_loja_dif_pago is null  ');
        try
          qGeraCampocrediario.ExecSql;
        except
        end;

        clear;
        Add('ALTER TABLE CONF ADD PODE_VALOR_MENOR VARCHAR(1) ');
        try
          qGeraCampocrediario.ExecSQL;
        except
        end;

        clear;
        Add('UPDATE CONF SET PODE_VALOR_MENOR = ''1'' ');
        Add('WHERE PODE_VALOR_MENOR is null           ');
        try
          qGeraCampocrediario.ExecSQL;
        except
        end;

        clear;
        Add('ALTER TABLE CONF ADD BLOQUEIA_APOS_COMPRA VARCHAR(1) ');
        try
          qGeraCampoCrediario.ExecSQL;
        except
        end;

        clear;
        Add('UPDATE CONF SET BLOQUEIA_APOS_COMPRA = ''0'' ');
        Add('WHERE BLOQUEIA_APOS_COMPRA is null           ');
        try
          qGeraCampocrediario.ExecSQL;
        except
        end;

      end;

      with QGeraCampocrediario do
      begin
        sql.clear;
        sql.add('ALTER TABLE CONF ADD DIASVALIDADECLI Double Precision ');
        try
          qGeraCampocrediario.ExecSql;
        except
        end;
      end;

      with QGeraCampocrediario do
      begin
        sql.clear;
        sql.add('Update Conf Set DIASVALIDADECLI = 180 Where DIASVALIDADECLI is null');
        try
          qGeraCampocrediario.ExecSql;
        except
        end;
      end;
    end;
    if (servidor_credito.Connected) then
      with (qGeraCampoCrediario.SQL) do
      begin
        with TQuery.Create(Application) do
          try
            DataBaseName := 'CREDITO';
            Sql.Add('SELECT CR_QBOL FROM CRECTABR');
            try
              execsql
            except
              CriaCampoBd ('CREDITO','CRECTABR','CR_QBOL','VARCHAR(1)');
            end;
          finally
            destroy;
          end;

        clear;
        Add('UPDATE CRECTABR SET CR_QBOL = ''1'' ');
        Add('WHERE CR_QBOL is NULL               ');
        try
          qGeraCampoCrediario.ExecSQL;
        except
        end;

      end;
         {*****************************************************}

//         frm_AtualizaBd.hide;
         {*********************************************************}
  end;
end;

{//Ajusta alguns campos ou       tabelas dentro do banco de dados VENDAS!!!!}
procedure TFrm_principal.AcertaBancoDeDadosVendas;
var
  clAux,clPAF: TClassAuxiliar;
begin
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select TIPZANT from LOTE_INVENTARIO');
    try
      open;
    except
      CriaCampo('LOTE_INVENTARIO','TIPZANT','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select VALES_EMITIDO from CONF');
    try
      open;
    except
      CriaCampo('CONF','VALES_EMITIDO','VARCHAR(1)');
      CriaCampo('CONF','VALES_RECEBIDO','VARCHAR(1)');
      CriaCampo('CONF','VALES_MERCADORIA','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select EXIBIR_ITENS from CONF');
    try
      open;
    except
      CriaCampo('CONF','EXIBIR_ITENS','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select FAIXAINI1 from CONF');
    try
      open;
    except
      CriaCampo('CONF','FAIXAINI1','FLOAT');
      CriaCampo('CONF','FAIXAINI2','FLOAT');
      CriaCampo('CONF','FAIXAINI3','FLOAT');
      CriaCampo('CONF','FAIXAFIM1','FLOAT');
      CriaCampo('CONF','FAIXAFIM2','FLOAT');
      CriaCampo('CONF','FAIXAFIM3','FLOAT');
      CriaCampo('CONF','DESC1','FLOAT');
      CriaCampo('CONF','DESC2','FLOAT');
      CriaCampo('CONF','DESC3','FLOAT');
      CriaCampo('CONF','TIPOFAIXA','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select USARFAIXA from CONF');
    try
      open;
    except
      CriaCampo('CONF','USARFAIXA','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select VE_CNPJ from VALES_RECEBIDOS');
    try
      open;
    except
      CriaCampo('VALES_RECEBIDOS','VE_CNPJ','VARCHAR(14)');
      CriaCampo('VALES_RECEBIDOS','VE_ECLI','VARCHAR(30)');
      CriaCampo('VALES_RECEBIDOS','VE_TELE','VARCHAR(11)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select VE_CNPJ from VALES_RECEBIDOS_LOCAL');
    try
      open;
    except
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_CNPJ','VARCHAR(14)');
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_ECLI','VARCHAR(30)');
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_TELE','VARCHAR(11)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select VE_CNPJ from VALES_RECEBIDOS_LOCAL');
    try
      open;
    except
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_CNPJ','VARCHAR(14)');
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_ECLI','VARCHAR(30)');
      CriaCampo('VALES_RECEBIDOS_LOCAL','VE_TELE','VARCHAR(11)');
    end;
  end;
  if (x_online) then
  begin
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE MOVIMENTO                ');
      Add('ADD MO_CLIE VARCHAR(40)              ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CAIXAS                ');
      Add('ADD CX_ABRE VARCHAR(8)            ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CAIXAS                ');
      Add('ADD CX_SUSP VARCHAR(8)            ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
      clear;
      Add('ALTER TABLE CAIXAS                ');
      Add('ADD CX_ENCE VARCHAR(8)            ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD VALIDADE_VALES VARCHAR(03)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD PRAZO_VENDAS VARCHAR(03)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD SOMA_VALEFUNC_TOTAL_VENDA VARCHAR(01)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD EXIBIR_DEVOLUCAO VARCHAR(01)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD EXIBIR_TROCA VARCHAR(01)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
    with (qGeraCampoESTOQUE.sql) do
    begin
      clear;
      Add('ALTER TABLE CONF                  ');
      Add('ADD DESCONTAR_DEVOLUCAO VARCHAR(01)    ');
      try
        qGeraCampoESTOQUE.ExecSql;
      except
      end;
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE imp_exp                ');
    Add('ADD ix_dataexp DATETIME            ');
    Add('ADD ix_horaexp VARCHAR(10)         ');
    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE CREPRABR                ');
    Add('ADD PC_HORA VARCHAR(8)              ');
    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE CONFIG_RESTRICOES_VENDA                ');
    Add('ADD MAXIMO_CRED INTEGER                            ');
    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE CONFIG_RESTRICOES_VENDA                ');
    Add('ADD MINIMO_VALOR FLOAT                             ');
    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select SENHA_GER_ALT_CONS from CONF');
    try
      open;
    except
      CriaCampo('CONF','SENHA_GER_ALT_CONS','VARCHAR(1)');
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE CONF                   ');
    Add('ADD SENHA_GER_ALT_CONS VARCHAR(1)  ');
    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select VALIDADE_VALES from CONF');
    try
      open;
    except
      CriaCampo('CONF','VALIDADE_VALES','VARCHAR(3)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select PRAZO_VENDAS from CONF');
    try
      open;
    except
      CriaCampo('CONF','PRAZO_VENDAS','VARCHAR(3)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select SOMA_VALEFUNC_TOTAL_VENDA from CONF');
    try
      open;
    except
      CriaCampo('CONF','SOMA_VALEFUNC_TOTAL_VENDA','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select PC_HORA from CREPRABR');
    try
      open;
    except
      CriaCampo('CREPRABR','PC_HORA','VARCHAR(8)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select CX_ABRE from CAIXAS');
    try
      open;
    except
      CriaCampo('CAIXAS','CX_ABRE','VARCHAR(8)');
      CriaCampo('CAIXAS','CX_SUSP','VARCHAR(8)');
      CriaCampo('CAIXAS','CX_ENCE','VARCHAR(8)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select EXIBIR_DEVOLUCAO from CONF');
    try
      open;
    except
      CriaCampo('CONF','EXIBIR_DEVOLUCAO','VARCHAR(1)');
      CriaCampo('CONF','EXIBIR_TROCA','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select DESCONTAR_DEVOLUCAO from CONF');
    try
      open;
    except
      CriaCampo('CONF','DESCONTAR_DEVOLUCAO','VARCHAR(1)');
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select CX_RABR from CAIXAS');
    try
      open;
    except
      CriaCampo('CAIXAS','CX_RABR','VARCHAR(8)');
    end;
  end;
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE CONF                   ');
    Add('ADD EXIBIR_DEVOLUCAO VARCHAR(1)    ');
    Add('ADD EXIBIR_TROCA VARCHAR(1)        ');
    Add('ADD DESCONTAR_DEVOLUCAO VARCHAR(1) ');
    try
      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE CAIXAS                ');
    Add('ADD CX_RABR VARCHAR(8)            ');
    try
      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;
          //3. - VERIFICACAO:"EXISTE O HISTORICO_PRECOS?"
  qGeraCampoVENDAS.Close;
  qGeraCampoVENDAS.SQL.Clear;
  qGeraCampoVENDAS.SQL.Add('SELECT GRUPO FROM HISTORICO_PRECOS');
  try
    qGeraCampoVENDAS.Open;
  except
             //4. - ACAO: "CRIA-SE O HISTORICO_PRECOS!"
    qGeraCampoVENDAS.SQL.Clear;
    qGeraCampoVENDAS.SQL.Add ('CREATE TABLE HISTORICO_PRECOS (GRUPO FLOAT,  ');
    qGeraCampoVENDAS.SQL.Add ('SUBGRUPO FLOAT,PRODUTO FLOAT,COR FLOAT,      ');
    qGeraCampoVENDAS.SQL.Add ('TAMANHO VARCHAR(5),ORDEMTAM INT,LOJA FLOAT,  ');
    qGeraCampoVENDAS.SQL.Add ('PRECO FLOAT,NOVOPRECO FLOAT,TIPZ VARCHAR(1), ');
    qGeraCampoVENDAS.SQL.Add ('TIPO VARCHAR(1),DATA DATETIME,HORA INT,      ');
    qGeraCampoVENDAS.SQL.Add ('OBS VARCHAR(60),USUARIO FLOAT)               ');
    qGeraCampoVENDAS.ExecSQL;
  end;
          //5. - VERIFICACAO:"EXISTE O VE_HORA NA TABLEA VENDAS"
  qGeraCampoVENDAS.Close;
  qGeraCampoVENDAS.SQL.Clear;
  qGeraCampoVENDAS.SQL.Add('SELECT VE_HORA FROM VENDAS');
  try
    qGeraCampoVENDAS.Open;
  except
             //4. - ACAO: "CRIA-SE O VE_HORA NA TABELA VENDAS!"
    CriaCampo('VENDAS','VE_HORA','VARCHAR(15)');
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select ALT_LIM_CRED from CONF');
    try
      open;
    except
      CriaCampo('CONF','ALT_LIM_CRED','VARCHAR(1)');
    end;
  end;
  with (qGeraCampoCREDIARIO.sql) do
  begin
    clear;
    Add('ALTER TABLE CONF                   ');
    Add('ADD ALT_LIM_CRED VARCHAR(01)       ');

    try
      qGeraCampoCREDIARIO.ExecSql;
    except
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select CR_PLAN from CREDIARIOS');
    try
      open;
    except
      CriaCampo('CREDIARIOS','CR_PLAN','FLOAT');
      CriaCampo('CREDIARIOS_LOCAL','CR_PLAN','FLOAT');
    end;
  end;
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE CREDIARIOS                   ');
    Add('ADD CR_PLAN FLOAT    ');
    try
      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;
  with qGeraCampoVENDAS do
  begin
    sql.clear;
    sql.add('Select AM_CODT from ADMINISTRADORAS');
    try
      open;
    except
      CriaCampo('ADMINISTRADORAS','AM_CODT','FLOAT');
    end;
  end;
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE ADMINISTRADORAS                   ');
    Add('ADD AM_CODT FLOAT    ');
    try

      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;
  if (servidor_credito.Connected) then
    with (qGeraCampoCrediario.SQL) do
    begin
      with TQuery.Create(Application) do
        try
          DataBaseName := 'CREDITO';
          Sql.Add('SELECT CR_QBOL FROM CRECTABR');
          try
            execsql
          except
            CriaCampoBd ('CREDITO','CRECTABR','CR_QBOL','VARCHAR(1)');
          end;
        finally
          destroy;
        end;

      clear;
      Add('UPDATE CRECTABR SET CR_QBOL = ''1'' ');
      Add('WHERE CR_QBOL is NULL               ');
      try
        qGeraCampoCrediario.ExecSQL;
      except
      end;

    end;
  //*** Rodrigo Cordeiro *** 10/08/2009 *** Cria o campo código do contrato na tabela Crediarios *******
  if (not x_online) then
    with (qGeraCampoVendas.SQL) do
    begin
      with TQuery.Create(Application) do
        try
          DataBaseName := 'VENDAS';
          Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
          try
            execsql
          except
            CriaCampo('CREDIARIOS','CR_CONT','FLOAT');
          end;
        finally
          destroy;
        end;

      clear;
      Add('UPDATE CREDIARIOS SET CR_CONT = CR_CODI  ');
      Add('WHERE CR_CONT is NULL                    ');
      try
        qGeraCampoVendas.ExecSQL;
      except
      end;
    end
  else
    with (qGeraCampoEstoque.SQL) do
    begin
      with TQuery.Create(Application) do
        try
          DataBaseName := 'ESTOQUE';
          Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
          try
            execsql
          except
            CriaCampoBd('ESTOQUE','CREDIARIOS','CR_CONT','FLOAT');
          end;
        finally
          destroy;
        end;

      clear;
      Add('UPDATE CREDIARIOS SET CR_CONT = CR_CODI  ');
      Add('WHERE CR_CONT is NULL                    ');
      try
        qGeraCampoEstoque.ExecSQL;
      except
      end;
    end;
    //****************************************************************************************************

  //*** Campos criados para armazenar valor de possíveis descontos ou acréscimos em itens da venda ****
  clPAF := TClassAuxiliar.Create;
  clPAF.Conect('VENDAS',self);
  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT IV_DESC,IV_PDES,IV_ACRE,IV_PACR ');
    clPAF.AddParam('FROM ITENS_VENDAS                      ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','ITENS_VENDAS','IV_DESC','FLOAT');           //Valor Desconto do item
    CriaCampoBd('VENDAS','ITENS_VENDAS','IV_PDES','FLOAT');           //Porcentagem do Desconto do item
    CriaCampoBd('VENDAS','ITENS_VENDAS','IV_ACRE','FLOAT');           //Valor Acréscimo do item
    CriaCampoBd('VENDAS','ITENS_VENDAS','IV_PACR','FLOAT');           //Porcentagem do Acréscimo do item
  end;

  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT IV_DESC,IV_PDES,IV_ACRE,IV_PACR ');
    clPAF.AddParam('FROM ITENS_VENDAS_LOCAL                ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_DESC','FLOAT');
    CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_PDES','FLOAT');
    CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_ACRE','FLOAT');
    CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_PACR','FLOAT');
  end;
  //****************************************************************************************************

  //*** Novos campos da tabela de venda para armazenar valores de acréscimos em venda ******************
  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT VE_ACRE,VE_PACR ');
    clPAF.AddParam('FROM VENDAS            ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','VENDAS','VE_ACRE','FLOAT');                 //Valor Acréscimo da venda
    CriaCampoBd('VENDAS','VENDAS','VE_PACR','FLOAT');                 //Porcentagem Acréscimo da venda
  end;

  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT VE_ACRE,VE_PACR ');
    clPAF.AddParam('FROM VENDAS_LOCAL      ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','VENDAS_LOCAL','VE_ACRE','FLOAT');
    CriaCampoBd('VENDAS','VENDAS_LOCAL','VE_PACR','FLOAT');
  end;
  //****************************************************************************************************

  //*** Novos campos para indicar se o item foi cancelado ou não ***************************************
  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT IV_STAT    ');
    clPAF.AddParam('FROM ITENS_VENDAS ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','ITENS_VENDAS','IV_STAT','VARCHAR(1)');
    clPAF.ClearSql;
    clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_STAT=:stat WHERE IV_STAT IS NULL');
    clPAF.consulta.ParamByName('stat').AsString := '1';
    clPAF.Execute;
  end;

  try
    clPAF.ClearSql;
    clPAF.AddParam('SELECT IV_STAT          ');
    clPAF.AddParam('FROM ITENS_VENDAS_LOCAL ');
    clPAF.Execute;
  except
    CriaCampoBd('VENDAS','ITENS_VENDAS_LOCAL','IV_STAT','VARCHAR(1)');
    clPAF.ClearSql;
    clPAF.AddParam('UPDATE ITENS_VENDAS SET IV_STAT=:stat WHERE IV_STAT IS NULL');
    clPAF.consulta.ParamByName('stat').AsString := '1';
    clPAF.Execute;
  end;
  clPAF.Desconect;
  clPAF.Free;
  //****************************************************************************************************
  
  CriaCampo('CONF','USA_REFFAB_SLIP','VARCHAR(1)');
  CriaCampo('CORES','CR_ATIV','VARCHAR(1)');       
  CriaCampo('CONF','BLOQUEIA_VENDA_VALOR','VARCHAR(1)');
  CriaCampo('CONF','VALOR_BLOQUEIO_VENDA','FLOAT');

  with (qGeraCampoVendas.SQL) do
  begin
    Clear;
    Add('UPDATE CONF SET BLOQUEIA_VENDA_VALOR='+QuotedStr('0'));
    Add('WHERE BLOQUEIA_VENDA_VALOR IS NULL');
    try
      qGeraCampoVendas.ExecSQL;
    except
    end;

    Clear;
    Add('UPDATE CONF SET VALOR_BLOQUEIO_VENDA=0');
    Add('WHERE VALOR_BLOQUEIO_VENDA IS NULL');
    try
      qGeraCampoVendas.ExecSQL;
    except
    end;
  end;

  if (databaseprodutos = 'ESTOQUE') then
  begin
    CriaCampoBD('ESTOQUE','CONF','BLOQUEIA_VENDA_VALOR','VARCHAR(1)');
    CriaCampoBD('ESTOQUE','CONF','VALOR_BLOQUEIO_VENDA','FLOAT');

    with (qGeraCampoESTOQUE.SQL) do
    begin
      Clear;
      Add('UPDATE CONF SET BLOQUEIA_VENDA_VALOR='+QuotedStr('0'));
      Add('WHERE BLOQUEIA_VENDA_VALOR IS NULL');
      try
        qGeraCampoESTOQUE.ExecSQL;
      except
      end;

      Clear;
      Add('UPDATE CONF SET VALOR_BLOQUEIO_VENDA=0');
      Add('WHERE VALOR_BLOQUEIO_VENDA IS NULL');
      try
        qGeraCampoESTOQUE.ExecSQL;
      except
      end;
    end;
  end;

  CriaCampo('CONF','IMPRIME_VENDEDOR_CUPOM','VARCHAR(1)');

  with (qGeraCampoVendas.SQL) do
  begin
    clear;
    Add('UPDATE CONF SET IMPRIME_VENDEDOR_CUPOM='+QuotedStr('0'));
    Add('WHERE IMPRIME_VENDEDOR_CUPOM is NULL                  ');
    try
      qGeraCampoVendas.ExecSQL;
    except
    end;
  end;
end;

procedure TFrm_principal.AjustaBancoDeDadosESTOQUE;
var
  flagatualiza: Boolean;
begin
     {**********************************************************************************}
{     Application.CreateForm(Tfrm_AtualizaBd, frm_AtualizaBd);
     frm_AtualizaBd.show;
     frm_AtualizaBd.refresh;
     frm_AtualizaBd.pnAtualizaBd.refresh;
     frm_AtualizaBd.Label1.refresh;}

     {*****************************************************}
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE MOVIMENTO                ');
    Add('ADD MO_QTDR DOUBLE PRECISION         ');


    try
      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;
     {*****************************************************}
  with (qGeraCampoESTOQUE.sql) do
  begin
    clear;
    Add('ALTER TABLE ITENS_VENDAS             ');
    Add('ADD IV_QTDR DOUBLE PRECISION         ');

    try
      qGeraCampoESTOQUE.ExecSql;
    except
    end;
  end;

  with qgeracAMPOEstoque.sql do
  begin
    flagatualiza := true;
    clear;
    add('ALTER TABLE cheques ADD ch_sangria varchar(1) Default '''' ');
    try
      qgeracAMPOEstoque.execsql;
    except
      flagatualiza := false;
    end;

    if FlagAtualiza then
    begin
      clear;
      add('UPDATE CHEQUES SET  ch_sangria = '''' ');
      try
        qgeraCampoEstoque.execsql;
      except
      end;
    end;
  end;
     //***********************INICIO CRIA CAMPO CONTRATO****************************************************
  if (not x_online) then
    with (qGeraCampoVendas.SQL) do
      with TQuery.Create(Application) do
        try
          DataBaseName := 'VENDAS';
          Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
          try
            execsql
          except
            CriaCampo('CREDIARIOS','CR_CONT','FLOAT');
          end;
        finally
          destroy;
        end
  else
    with (qGeraCampoEstoque.SQL) do
      with TQuery.Create(Application) do
        try
          DataBaseName := 'ESTOQUE';
          Sql.Add('SELECT CR_CONT FROM CREDIARIOS');
          try
            execsql
          except
            CriaCampo('CREDIARIOS','CR_CONT','FLOAT');
          end;
        finally
          destroy;
        end;
     //***********************FIM CRIA CAMPO CONTRATO*******************************************************

     {*****************************************************}

//     frm_AtualizaBd.hide;
     {*********************************************************}
end;

{*** Rotina que le a configuracao locao do terminal no arquivo ESTOQUE.INI}
procedure TFrm_principal.LeituraConfigLocal_Caixa;
var
  VendasIni,EstoqIni,CredIni: TIniFile;
begin
     {Procura pelo arquivo ESTOQ.INI --> Protecao,inicializacao.}
  if (FileExists('c:\nativa\estoque.ini')) then
  begin
    EstoqIni := TIniFile.Create ('c:\nativa\estoque.ini');
    with (EstoqIni) do
    begin
      x_origem_cbarra      := ReadInteger ('produtos','origem_cbarra', x_origem_cbarra);
      x_tipo_pvenda        := ReadInteger ('produtos','pvenda',          x_tipo_pvenda);
      x_margem_contrib     := ReadFloat   ('produtos','margem',         x_margem_contrib);
      x_desconto_venda_min := ReadFloat   ('produtos','descmin',    x_desconto_venda_min);
      x_desconto_venda_max := ReadFloat   ('produtos','descmax',    x_desconto_venda_max);
      x_linha              := ReadString  ('produtos','linha',     x_linha);
      x_colecao            := ReadString  ('produtos','colecao',   x_colecao);
      x_mat1               := ReadString  ('produtos','mat1',      x_mat1);
      x_mat2               := ReadString  ('produtos','mat2',      x_mat2);
      x_mat3               := ReadString  ('produtos','mat3',      x_mat3);
    end;
    EstoqIni.Free;
  end;

  {Procura pelo arquivo VENDAS.INI}
  if (FileExists('c:\nativa\vendas.ini')) then
  begin
    VendasIni := TIniFile.Create ('c:\nativa\vendas.ini');
    with (VendasIni) do
    begin
      x_pathimg                        := ReadString  ('config','imagem',        x_pathimg);
      x_imagem_logomarca               := ReadString  ('config','imagemLogo', x_imagem_logomarca);
      x_modificar_video                := ReadBool    ('config','MudaVideo',   x_modificar_video);

      x_impressora                     := ReadInteger ('printer','impressora', x_impressora);
      x_salto                          := ReadBool    ('printer','salto',    x_salto);
      x_arquivo_winword                := ReadString  ('printer','MsWord', x_arquivo_winword);
      x_modelo_impressao_geral         := ReadInteger ('printer','modeloImpressaoGeral',x_modelo_impressao_geral);

      x_etiquetas_colunas              := ReadInteger ('etiquetas','colunas', x_etiquetas_colunas);
      x_etiquetas_texto                := ReadInteger ('etiquetas','texto',   x_etiquetas_texto);
      x_etiquetas_espaco               := ReadInteger ('etiquetas','espaco',  x_etiquetas_espaco);

      x_email_publicador               := ReadString  ('exportacao','EmailPub',      x_email_publicador);
      x_tipo_exportacao                := ReadInteger ('exportacao','tipoExp',      x_tipo_exportacao);
      x_ftp_host                       := ReadString('exportacao','ftpHost',       x_ftp_host);
      x_ftp_userid                     := ReadString('exportacao','userHost',      x_ftp_userid);
      x_ftp_password                   := ReadString('exportacao','passwordHost',  x_ftp_password);
      x_ftp_diretorio_inicial          := ReadString('exportacao','dirInitial', x_ftp_diretorio_inicial);
      x_path_arquivos_vendas_destino   := ReadString('exportacao','vendasDestino', x_path_arquivos_vendas_destino);
      x_path_arquivos_produtos_origem  := ReadString('exportacao','produtosOrigem', x_path_arquivos_produtos_origem);
      x_exibe_progresso_movimento      := ReadBool  ('exportacao','ExibeProgresso',x_exibe_progresso_movimento);
      x_exploja_allcli                 := ReadBool  ('exportacao','Exploja_allcli',x_exploja_allcli);
      x_ExcIMp                         := ReadBool  ('exportacao','ExcImp',x_ExcImp);

      x_video_entrada_width            := ReadInteger('videoEntrada','width', x_video_entrada_width);
      x_video_entrada_height           := ReadInteger('videoEntrada','height', x_video_entrada_height);
      x_video_entrada_color            := ReadInteger('videoEntrada','color', x_video_entrada_color);

      x_video_saida_width              := ReadInteger('videoSaida','width', x_video_saida_width);
      x_video_saida_height             := ReadInteger('videoSaida','height', x_video_saida_height);
      x_video_saida_color              := ReadInteger('videoSaida','color', x_video_saida_color);

      x_ecf_habilita_modo_fiscal               := ReadBool ('ECF','modoFiscal', x_ecf_habilita_modo_fiscal);
      if x_ecf_habilita_modo_fiscal = false then
         x_Habilita_Modo_NFE := true;

      x_ecf_habilita_TEF                       := ReadBool ('ECF','modoTEF', x_ecf_habilita_TEF);
      x_ecf_modo_venda                         := ReadInteger('ECF','modoVenda', x_ecf_modo_venda);
      x_ecf_modelo_impressora                  := ReadInteger('ECF','modeloImpressora', x_ecf_modelo_impressora);
      x_ecf_porta_comunicacao                  := ReadString  ('ECF','portaCOM',x_ecf_porta_comunicacao);
      x_ecf_busca_proximo_COO                  := ReadBool ('ECF','buscaCOO', x_ecf_busca_proximo_COO);
      x_ecf_imprime_cupom_nao_fiscal_vinculado := ReadBool ('ECF','NaoFiscalVinculado',x_ecf_imprime_cupom_nao_fiscal_vinculado);
      x_ecf_codigo_de_barras_no_cupom          := ReadInteger('ECF','CBarrasNoCupom', x_ecf_codigo_de_barras_no_cupom);
      x_ImpItemECf                             := ReadBool('ECF','ImpItemECF', x_ImpItemECf);
      x_ImpSangECf                             := ReadString('ECF','ImpSangECF', x_ImpSangECf);
      x_formaspagamentoecf                     := ReadString('ECF','FormasPagamentoEcf', x_FormasPagamentoEcf);
      x_Aliquotasecf                           := ReadString('ECF','AliquotasEcf', x_AliquotasEcf);
      x_tempointervecf                         := StrtoFloatN(ReadString('ECF','TempoIntervEcf', x_AliquotasEcf));


      x_forma_leitura_cbarra_venda             := ReadInteger('LeituraCBarraVenda','ModoVenda', x_forma_leitura_cbarra_venda);
      x_forma_leitura_cbarra_troca             := ReadInteger('LeituraCBarraVenda','ModoTroca', x_forma_leitura_cbarra_troca);
      x_forma_leitura_cbarra_devolucao         := ReadInteger('LeituraCBarraVenda','ModoDevolucao', x_forma_leitura_cbarra_devolucao);
      x_prevalecer_EAN13                       := ReadBool('LeituraCBarraVenda','PrevalecerEAN13', x_prevalecer_EAN13);
      x_exibe_alerta_offline                       := ReadBool('ExibeAlerta','ExibeAlertaOff', x_exibe_alerta_offline);

      x_tempo_gaveta_venda                     := ReadInteger('Gaveta','TempoGavetaVenda', x_tempo_gaveta_venda);
      label7.visible                           := x_tempo_gaveta_venda = 1;

      x_qtde_linhas_entre_SLIPS_TRANSFERENCIA       := ReadInteger ('SLIP','QtdeLinhasEntre_TRANSFERENCIA', x_qtde_linhas_entre_SLIPS_TRANSFERENCIA);
      x_slip_na_tela_TRANSFERENCIA                  := ReadBool ('SLIP','NaTela_TRANSFERENCIA', x_slip_na_tela_TRANSFERENCIA);
      x_slip_na_tela_COMPROVANTE                    := ReadBool ('SLIP','NaTela_COMPROVANTE', x_slip_na_tela_COMPROVANTE);
      x_comprovante_pagamento                       := ReadBool ('cobranca','Comprovante', x_comprovante_pagamento);
      x_qtde_comprovante_pagamento                  := ReadInteger ('cobranca','QtdeComprovantes', x_qtde_comprovante_pagamento);

      x_memoria_solicitacao_dias_a_vencer_promocao                := ReadInteger ('MemoriaSolicitacao','DiasAVencerPromocao', x_memoria_solicitacao_dias_a_vencer_promocao);
      x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho := ReadBool ('MemoriaSolicitacao','PromocaoAVencerExibirCorTamanho', x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho);
      x_iniprom                                                   := ReadBool ('MemoriaSolicitacao','IniProm', x_iniprom);
//               x_comissao_vales_emitidos                                   := ReadBool ('ComissoesVales', 'Vale_emitidos', x_comissao_vales_emitidos);
//              x_comissao_vales_recebidos                                  := ReadBool ('ComissoesVales','Vale_Recebidos', x_comissao_vales_recebidos);
//               x_comissao_vales_mercadoria                                 := ReadBool ('ComissoesVales','Vale_Mercadorias', x_comissao_vales_mercadoria);
//               x_exibir_itens                                              := ReadBool ('ComissoesVales','exibir_itens', x_comissao_vales_mercadoria);

//               x_desconto_venda                                            := ReadBool ('DescontoVenda','Desconto_Venda', x_desconto_venda);
      x_solicitar_senha_TRANSFERENCIA               := ReadBool ('Senha','TRANSFERENCIA', x_solicitar_senha_TRANSFERENCIA);
      x_solicitar_senha_TROCA_DEVOLUCAO             := ReadBool ('Senha','TROCA_DEVOLUCAO', x_solicitar_senha_TROCA_DEVOLUCAO);
      x_solicitar_senha_DESCONTO                    := ReadBool ('Senha','DESCONTO', x_solicitar_senha_DESCONTO);
      x_solicitar_senha_DESCONTO_VALE               := ReadBool ('Senha','DESCONTO_VALE', x_solicitar_senha_DESCONTO_VALE);
      x_solicitar_senha_CONF_CAIXA                  := ReadBool ('Senha','CONF_CAIXA', x_solicitar_senha_CONF_CAIXA);
      x_solicitar_senha_RECEB_CHEQ_DEV              := ReadBool ('Senha','RECEB_CHEQ_DEV', x_solicitar_senha_RECEB_CHEQ_DEV);
      x_solicitar_senha_INVENTARIO                  := ReadBool ('Senha','INVENTARIO', x_solicitar_senha_INVENTARIO);
      x_solicitar_senha_MOVIMENTO                   := ReadBool ('Senha','MOVIMENTO', x_solicitar_senha_MOVIMENTO);
      x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS := ReadBool ('Senha','OUTRAS_FUNCOES_ATENDIMENTOS', x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS);
      x_solicitar_senha_LISTAGENS_VENDAS            := ReadBool ('Senha','LISTAGENS_VENDAS', x_solicitar_senha_LISTAGENS_VENDAS);
      x_solicitar_senha_CONSULTA_VENDA              := ReadBool ('Senha','CONSULTA_VENDA', x_solicitar_senha_CONSULTA_VENDA);
      x_solicitar_senha_ALTERACAO_PRECO_VENDA       := ReadBool ('Senha','ALTERACAO_PRECO_VENDA', x_solicitar_senha_ALTERACAO_PRECO_VENDA);
      x_solicitar_senha_SAIDA_LANCAMENTO_VENDA      := ReadBool ('Senha','SAIDA_LANCAMENTO_VENDA', x_solicitar_senha_SAIDA_LANCAMENTO_VENDA);
      x_solicitar_senha_Saldo                       := ReadBool ('Senha','SALDO', x_solicitar_senha_Saldo);
      x_solicitar_senha_CADASTRO_CLIENTE            := ReadBool ('Senha','CADASTRO_CLIENTE', x_solicitar_senha_CADASTRO_CLIENTE);

      x_ConsEstoqOutras := ReadBool ('ConsEstoq','ConsEstoqOutras', x_ConsEstoqOutras);
      x_ConsEstoqLoja   := ReadBool ('ConsEstoq','ConsEstoqLoja', x_ConsEstoqLoja);
      x_ConsEstoqQtd    := ReadBool ('ConsEstoq','ConsEstoqQtde', x_ConsEstoqQtd);
      x_ConsEstoqPrc    := ReadBool ('ConsEstoq','ConsEstoqPrc', x_ConsEstoqPrc);

      x_CheckCheckConsCli := ReadBool('CheckCheck','CheckCheckConsCli', x_CheckCheckConsCli);
      x_CheckCheckCont    := ReadBool('CheckCheck','CheckCheckCont', x_CheckCheckCont);
      x_HabilitaValidacoes:= ReadBool('Ch','ChHabilitaValidacoes',x_HabilitaValidacoes);
      x_prazo_vendas      := ReadString('PrazoConsVendas','PRAZOVENDAS', x_prazo_vendas);
      x_onlinevpn    := ReadBool ('OnlineVPN','ONLINEVPN', x_onlinevpn);
      x_buscaaltomatica    := ReadBool ('BuscaAltomatica','BUSCAALTOMATICA', x_buscaaltomatica);


    end;
    VendasIni.Free;
  end;

  LeIniCred;
end;

procedure Tfrm_principal.LeIniCred;
var
  CredIni:TIniFile;
begin
  SetConfigLocalCred;
     {Procura pelo arquivo CRED.INI}
  if (FileExists('c:\nativa\cred.ini')) then
  begin
    CredIni := TIniFile.Create ('c:\nativa\cred.ini');
    with (CredIni) do
    begin
               // Vendas Antigo
      x_arquivo_proposta          := ReadString('config','arqproposta', x_arquivo_proposta);
      x_path_fotos_clientes       := ReadString('config','fotocliente', x_path_fotos_clientes);
      x_pesquisa_cep              := ReadBool ('config','pesquisaCep',  x_pesquisa_cep);

      x_buscaaltomatica_cliente   := ReadBool ('BuscaAltomatica_Cliente','BUSCAALTOMATICA_CLIENTE', x_buscaaltomatica_cliente);
      x_filtroquecontem_cliente   := ReadBool     ('Filtroquecontem_cliente','FILTROQUECONTEM_CLIENTE',          x_filtroquecontem_cliente);

      x_imprimir_proposta         := ReadBool ('config','imprimirproposta',  x_imprimir_proposta);
      x_frente_loja1              := ReadInteger('config','loja',       x_frente_loja1);
      x_frente_loja               := ReadFloat('config','loja',       x_frente_loja);

      x_modelo_impressao_carnet   := ReadInteger('carnet','modeloImpressao',x_modelo_impressao_carnet);
      x_margem_esquerda_carnet_jt := ReadInteger('carnet','MargEsqJt',x_margem_esquerda_carnet_jt);
      x_margem_superior_carnet_jt := ReadInteger('carnet','MargSupJt',x_margem_superior_carnet_jt);
      x_qualquer_endereco_carnet  := ReadBool('carnet','qualquer_end',    x_qualquer_endereco_carnet);
      x_endereco_carnet           := ReadString('carnet','endereco',               x_endereco_carnet);
      x_obs1_carnet               := ReadString('carnet','obs1',                       x_obs1_carnet);
      x_obs2_carnet               := ReadString('carnet','obs2',                       x_obs2_carnet);
      x_tipo_imp_carnet           := ReadInteger('carnet','tipo_imp',              x_tipo_imp_carnet);
      x_flag_carnet_juros         := ReadBool('carnet','impJuros',               x_flag_carnet_juros);
      x_carnet_imprime_entrada    := ReadBool('carnet','Entrada',           x_carnet_imprime_entrada);

      x_autenticacao_baixa        := ReadBool('cobranca','Autenticacao',        x_autenticacao_baixa);
      x_qtde_autenticacao         := ReadInteger('cobranca','QtdeAut',          x_qtde_autenticacao);
               //x_comprovante_pagamento     := ReadBool('cobranca','Comprovante',         x_comprovante_pagamento);
               //x_qtde_comprovante_pagamento:= ReadInteger('cobranca','QtdeComprovantes',      x_qtde_comprovante_pagamento);

      x_CheckCheckProvedor := ReadString    ('CheckCheck','CheckCheckProvedor', x_CheckCheckProvedor);
      x_CheckCheckPorta    := ReadInteger   ('CheckCheck','CheckCheckPorta', x_CheckCheckPorta);
      x_CheckCheckServidor := ReadString    ('CheckCheck','CheckCheckServidor', x_CheckCheckServidor);
      x_CheckCheckProtocolo := ReadString    ('CheckCheck','CheckCheckProtocolo', x_CheckCheckProtocolo);

//               x_CheckCheckConsCli     := ReadBool('CheckCheck','CheckCheckConsCli', x_CheckCheckConsCli);
//               x_CheckCheckCont        := ReadBool('CheckCheck','CheckCheckCont', x_CheckCheckCont);

    end;
    CredIni.Free;
  end;
end;

procedure TFrm_Principal.SetConfigLocalCred;
begin

  x_arquivo_proposta       := 'C:\NATIVA\CREDITO\PROPOSTA.TXT';
  x_pesquisa_cep           := false;

  x_modelo_impressao_carnet:=0;
  x_margem_esquerda_carnet_jt := 9;
  x_margem_superior_carnet_jt := 8;
  x_qualquer_endereco_carnet := true;
  x_endereco_carnet        := '';
  x_obs1_carnet            := 'QUEM TEM CREDITO EM DIA';
  x_obs2_carnet            := 'TEM CREDITO SEMPRE';
  x_tipo_imp_carnet        := 1;
  x_flag_carnet_juros      := false;
  x_carnet_imprime_entrada := false;

  x_autenticacao_baixa     := false;
  x_qtde_autenticacao      := 1;
     //x_comprovante_pagamento  := false;
     //x_qtde_comprovante_pagamento := 2;


//     x_CheckCheckConsCli       := False;
//     x_CheckCheckCont          := False;

  x_CheckCheckProvedor      := 'automacao.checkcheck.com.br';
  x_CheckCheckPorta         :=  8734;
  x_CheckCheckServidor      := 'INTERNET';
  x_CheckCheckProtocolo     := 'SPCB - INTERNET';
end;


{*** Realiza a leitura dos sequenciais de venda}
procedure Tfrm_principal.LeituraDosSequenciais;
var
  clSeq: TClassAuxiliar;
begin
  if (x_tipo_funcionamento_sistema=0) then //ILHA
  begin
          //********************************************************************************
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('SELECT * FROM SEQATDO.DBF');
    clSeq.Execute;
    clSeq.First;
    x_loja                        := clSeq.Result('CODIGO_LOJA');
    x_terminal                    := clSeq.Result('CODIGO_TERMINAL');
    x_codigo_atendimento          := clSeq.Result('ULTIMO_ATDO');
    try
      x_codigo_atendimento_suspenso := clSeq.Result('ULTIMO_ATDO_SUSP');
    except
      x_codigo_atendimento_suspenso := 0;
      DeleteFile('C:\NATIVA\SEQATDO.DBF');
      ChecaExistenciaArquivo_SEQATDO;
    end;
    clSeq.desconect;
    clSeq.Free;
          //********************************************************************************
  end
  else
  if (x_tipo_funcionamento_sistema=1) then //CAIXA
  begin
    //********************************************************************************
    clSeq := TClassAuxiliar.Create;
    clSeq.conect   ('C:\NATIVA',self);
    clSeq.ClearSql;
    clSeq.AddParam ('SELECT * FROM SEQVENDAS.DBF');
    clSeq.Execute;
    clSeq.First;
    x_codigo_venda           := clSeq.Result('ULTIMA_VENDA');
    x_codigo_vale_mercadoria := clSeq.Result('ULTIMO_VALE_MERCADORIA');
    x_ecf                    := clSeq.Result('CODIGO_ECF');
    x_loja                   := clSeq.Result('CODIGO_LOJA');
    x_terminal               := clSeq.Result('CODIGO_TERMINAL');
    x_nota_fiscal            := clSeq.Result('NOTA_FISCAL');
    x_cupom_fiscal           := clSeq.Result('CUPOM_FISCAL');
    x_romaneio               := clSeq.Result('ROMANEIO');
    clSeq.desconect;
    clSeq.Free;
    //********************************************************************************
  end;
end;

procedure Tfrm_principal.LeituraTipoFuncionamento; {*}
var
  clFunc: TClassAuxiliar;
begin
     {Lendo o arquivo CONF DO VENDAS *****************************************************************}
  clFunc := TClassAuxiliar.Create;
  clFunc.conect   ('C:\NATIVA',self);
  clFunc.ClearSql;
  clFunc.AddParam ('SELECT * FROM TIPOFUNCVENDAS.DBF');
  clFunc.Execute;
  clFunc.First;
  x_tipo_funcionamento_sistema := clFunc.Result('TIPO');
  clFunc.desconect;
  clFunc.Free;
end;

procedure TFrm_principal.LeituraConfigGeral(Ferro:Boolean=false);
var
  clConf: TClassAuxiliar;
begin
  try
    clConf := TClassAuxiliar.Create;
    clConf.conect   ('VENDAS',self);
    clConf.ClearSql;
    clConf.AddParam ('SELECT * FROM CONF');
    clConf.Execute;
    clConf.First;
    x_empresa           := clConf.Result('EMPRESA');
    x_endereco          := clConf.Result('ENDERECO');
    x_bairro            := clConf.Result('BAIRRO');
    x_cidade            := clConf.Result('CIDADE');
    x_uf                := clConf.Result('UF');
    x_cep               := clConf.Result('CEP');
    x_cnpj              := clConf.Result('CNPJ');
    x_telefone          := clConf.Result('TELEFONE');
    x_fax               := clConf.Result('FAX');
    x_insc              := clConf.Result('INSC');
    x_email             := clConf.Result('EMAIL');
    x_codigo_empresa    := clConf.Result('SECURITY');
    x_banco_de_dados    := clConf.Result('BANCO_DE_DADOS');
    x_formato_data      := clConf.Result('FORMATO_DATA');
    x_nivel_permissao   := clConf.Result('NIVEL_PERMISSAO');
    if (clConf.Result('ADICIONA_DV_CODIGO_BARRAS')='0') then
      x_adiciona_dv_codigo_barras := false
    else
    if (clConf.Result('ADICIONA_DV_CODIGO_BARRAS')='1') then
      x_adiciona_dv_codigo_barras := true;
    if (clConf.Result('PERM_CANC_VENDA_CUPOM')='0')then
      x_permitir_cancelar_venda_com_cupom := false
    else
    if (clConf.Result('PERM_CANC_VENDA_CUPOM')='1')then
      x_permitir_cancelar_venda_com_cupom := true;
    if (clConf.Result('VALES_EMITIDO')='0') then
      x_comissao_vales_emitidos := false
    else
    if (clConf.Result('VALES_EMITIDO')='1') then
      x_comissao_vales_emitidos := true;

    if (clConf.Result('VALES_RECEBIDO')='0') then
      x_comissao_vales_recebidos := false
    else
    if (clConf.Result('VALES_RECEBIDO')='1') then
      x_comissao_vales_recebidos := true;

    if (clConf.Result('VALES_MERCADORIA')='0') then
      x_comissao_vales_mercadoria := false
    else
    if (clConf.Result('VALES_MERCADORIA')='1') then
      x_comissao_vales_mercadoria := true;

    if (clConf.Result('EXIBIR_ITENS')='0') then
      x_exibir_itens := false
    else
    if (clConf.Result('EXIBIR_ITENS')='1') then
      x_exibir_itens := true;

    if (clConf.Result('SOMA_VALEFUNC_TOTAL_VENDA')='0') then
      x_soma_valefunc_total_venda := false
    else
    if (clConf.Result('SOMA_VALEFUNC_TOTAL_VENDA')='1') then
      x_soma_valefunc_total_venda := true;

    if (clConf.Result('EXIBIR_DEVOLUCAO')='0') then
      x_exibe_devolucao := false
    else
    if (clConf.Result('EXIBIR_DEVOLUCAO')='1') then
      x_exibe_devolucao := true;

    if (clConf.Result('EXIBIR_TROCA')='0') then
      x_exibe_troca := false
    else
    if (clConf.Result('EXIBIR_TROCA')='1') then
      x_exibe_troca := true;

    if (clConf.Result('DESCONTAR_DEVOLUCAO')='0') then
      x_descontar_devolucao := false
    else
    if (clConf.Result('DESCONTAR_DEVOLUCAO')='1') then
      x_descontar_devolucao := true;

    x_faixaini1 := clConf.Result('FAIXAINI1');
    x_faixaini2 := clConf.Result('FAIXAINI2');
    x_faixaini3 := clConf.Result('FAIXAINI3');
    x_faixafim1 := clConf.Result('FAIXAFIM1');
    x_faixafim2 := clConf.Result('FAIXAFIM2');
    x_faixafim3 := clConf.Result('FAIXAFIM3');
    x_desc1 := clConf.Result('DESC1');
    x_desc2 := clConf.Result('DESC2');
    x_desc3 := clConf.Result('DESC3');
    x_tipofaixa := clConf.Result('TIPOFAIXA');
    if (clConf.Result('USARFAIXA')='1') then
      x_usarfaixa := true
    else
    if (clConf.Result('USARFAIXA')='0') then
      x_usarfaixa := false;
    x_validade_vales := clConf.Result('VALIDADE_VALES');
//     x_prazo_vendas := clConf.Result('PRAZO_VENDAS');
    x_ordem_codigo := clConf.Result('ORDEM_CODIGO');
    x_ordem_refinterna := clConf.Result('ORDEM_REFINTERNA');
    x_ordem_reffabric := clConf.Result('ORDEM_REFFABRIC');
    x_ordem_cbarra := clConf.Result('ORDEM_CBARRA');
    x_ordem_prod_cor_tam := clConf.Result('ORDEM_PROD_COR_TAM');
    x_ordem_cbarra_ean13 := 3; {* - é sempre o ultimo}

    if (clConf.Result('USA_REFFAB_SLIP') = '0') then
      x_usa_reffab_slip := false
    else
      x_usa_reffab_slip := true;

    if (clConf.Result('BLOQUEIA_VENDA_VALOR') = '1') then
      x_bloqueia_venda_valor := true
    else if (clConf.Result('BLOQUEIA_VENDA_VALOR') = '0') then
      x_bloqueia_venda_valor := false;
    x_valor_bloqueio_venda := clConf.Result('VALOR_BLOQUEIO_VENDA');

    if (clConf.Result('EXIBE_FORNECEDOR_CONSULTA') = '1') then
      x_exibe_fornecedor_consulta := true
    else if (clConf.Result('EXIBE_FORNECEDOR_CONSULTA') = '0') then
      x_exibe_fornecedor_consulta := false;

    if (clConf.Result('IMPRIME_VENDEDOR_CUPOM') = '0') then
      x_imprime_vendedor_cupom := false
    else
      x_imprime_vendedor_cupom := true;

    if (clConf.Result('EXIBE_PRECO_CUSTO') = '1') then
      x_exibe_preco_custo := true
    else if (clConf.Result('EXIBE_PRECO_CUSTO') = '0') then
      x_exibe_preco_custo := false;


    clConf.desconect;
    clConf.Free;

     {Lendo o arquivo CONF DO ESTOQUE *****************************************************************}
    if (databaseprodutos='ESTOQUE') then
    begin
      clConf := TClassAuxiliar.Create;
      clConf.conect   ('ESTOQUE',self);
      clConf.ClearSql;
      clConf.AddParam ('SELECT ADICIONA_DV_CODIGO_BARRAS,   ');
      clConf.AddParam ('       ORDEM_CODIGO,                ');
      clConf.AddParam ('       ORDEM_REFINTERNA,            ');
      clConf.AddParam ('       ORDEM_REFFABRIC,             ');
      clConf.AddParam ('       ORDEM_CBARRA,                ');
      clConf.AddParam ('       ORDEM_PROD_COR_TAM,          ');
      clConf.AddParam ('       PERM_CANC_VENDA_CUPOM,       ');
      clConf.AddParam ('       VALES_EMITIDO,               ');
      clConf.AddParam ('       VALES_RECEBIDO,              ');
      clConf.AddParam ('       VALES_MERCADORIA,            ');
      clConf.AddParam ('       EXIBIR_ITENS,                ');
      clConf.AddParam ('       FAIXAINI1,                   ');
      clConf.AddParam ('       FAIXAINI2,                   ');
      clConf.AddParam ('       FAIXAINI3,                   ');
      clConf.AddParam ('       FAIXAFIM1,                   ');
      clConf.AddParam ('       FAIXAFIM2,                   ');
      clConf.AddParam ('       FAIXAFIM3,                   ');
      clConf.AddParam ('       DESC1,                       ');
      clConf.AddParam ('       DESC2,                       ');
      clConf.AddParam ('       DESC3,                       ');
      clConf.AddParam ('       TIPOFAIXA,                   ');
      clConf.AddParam ('       USARFAIXA,                   ');
      clConf.AddParam ('       VALIDADE_VALES,              ');
      clConf.AddParam ('       PRAZO_VENDAS,                ');
      clConf.AddParam ('       SOMA_VALEFUNC_TOTAL_VENDA,   ');
      clConf.AddParam ('       EXIBIR_DEVOLUCAO,            ');
      clConf.AddParam ('       EXIBIR_TROCA,                ');
      clConf.AddParam ('       DESCONTAR_DEVOLUCAO,         ');
      clConf.AddParam ('       USA_REFFAB_SLIP,             ');
      clConf.AddParam ('       BLOQUEIA_VENDA_VALOR,        ');
      clConf.AddParam ('       VALOR_BLOQUEIO_VENDA,        ');
      clConf.AddParam ('       EXIBE_FORNECEDOR_CONSULTA,   ');
      clConf.AddParam ('       IMPRIME_VENDEDOR_CUPOM,      ');
      clConf.AddParam ('       EXIBE_PRECO_CUSTO            ');
      clConf.AddParam ('FROM CONF                           ');
      clConf.Execute;
      clConf.First;
      if (clConf.Result('ADICIONA_DV_CODIGO_BARRAS')='0') then
        x_adiciona_dv_codigo_barras := false
      else
      if (clConf.Result('ADICIONA_DV_CODIGO_BARRAS')='1') then
        x_adiciona_dv_codigo_barras := true;
      if (clConf.Result('PERM_CANC_VENDA_CUPOM')='0')then
        x_permitir_cancelar_venda_com_cupom := false
      else
      if (clConf.Result('PERM_CANC_VENDA_CUPOM')='1')then
        x_permitir_cancelar_venda_com_cupom := true;


      if (clConf.Result('VALES_EMITIDO')='0') then
        x_comissao_vales_emitidos := false
      else
      if (clConf.Result('VALES_EMITIDO')='1') then
        x_comissao_vales_emitidos := true;

      if (clConf.Result('VALES_RECEBIDO')='0') then
        x_comissao_vales_recebidos := false
      else
      if (clConf.Result('VALES_RECEBIDO')='1') then
        x_comissao_vales_recebidos := true;

      if (clConf.Result('VALES_MERCADORIA')='0') then
        x_comissao_vales_mercadoria := false
      else
      if (clConf.Result('VALES_MERCADORIA')='1') then
        x_comissao_vales_mercadoria := true;

      if (clConf.Result('SOMA_VALEFUNC_TOTAL_VENDA')='0') then
        x_soma_valefunc_total_venda := false
      else
      if (clConf.Result('SOMA_VALEFUNC_TOTAL_VENDA')='1') then
        x_soma_valefunc_total_venda := true;

      if (clConf.Result('EXIBIR_ITENS')='0') then
        x_exibir_itens := false
      else
      if (clConf.Result('EXIBIR_ITENS')='1') then
        x_exibir_itens := true;

      if (clConf.Result('EXIBIR_DEVOLUCAO')='0') then
        x_exibe_devolucao := false
      else
      if (clConf.Result('EXIBIR_DEVOLUCAO')='1') then
        x_exibe_devolucao := true;

      if (clConf.Result('EXIBIR_TROCA')='0') then
        x_exibe_troca := false
      else
      if (clConf.Result('EXIBIR_TROCA')='1') then
        x_exibe_troca := true;

      if (clConf.Result('DESCONTAR_DEVOLUCAO')='0') then
        x_descontar_devolucao := false
      else
      if (clConf.Result('DESCONTAR_DEVOLUCAO')='1') then
        x_descontar_devolucao := true;

      x_faixaini1 := clConf.Result('FAIXAINI1');
      x_faixaini2 := clConf.Result('FAIXAINI2');
      x_faixaini3 := clConf.Result('FAIXAINI3');
      x_faixafim1 := clConf.Result('FAIXAFIM1');
      x_faixafim2 := clConf.Result('FAIXAFIM2');
      x_faixafim3 := clConf.Result('FAIXAFIM3');
      x_desc1 := clConf.Result('DESC1');
      x_desc2 := clConf.Result('DESC2');
      x_desc3 := clConf.Result('DESC3');
      x_tipofaixa := clConf.Result('TIPOFAIXA');
      if (clConf.Result('USARFAIXA')='0') then
        x_usarfaixa := false
      else
      if (clConf.Result('USARFAIXA')='1') then
        x_usarfaixa := true;
      x_ordem_codigo := clConf.Result('ORDEM_CODIGO');
      x_ordem_refinterna := clConf.Result('ORDEM_REFINTERNA');
      x_ordem_reffabric := clConf.Result('ORDEM_REFFABRIC');
      x_ordem_cbarra := clConf.Result('ORDEM_CBARRA');
      x_ordem_prod_cor_tam := clConf.Result('ORDEM_PROD_COR_TAM');
      x_ordem_cbarra_ean13 := 3; {* - é sempre o ultimo}
      x_validade_vales := clConf.Result('VALIDADE_VALES');
//          x_prazo_vendas := clConf.Result('PRAZO_VENDAS');

      if (clConf.Result('USA_REFFAB_SLIP') = '0') then
        x_usa_reffab_slip := false
      else
        x_usa_reffab_slip := true;
      if (clConf.Result('BLOQUEIA_VENDA_VALOR') = '1') then
        x_bloqueia_venda_valor := true
      else if (clConf.Result('BLOQUEIA_VENDA_VALOR') = '0') then
        x_bloqueia_venda_valor := false;
      x_valor_bloqueio_venda := clConf.Result('VALOR_BLOQUEIO_VENDA');

      if (clConf.Result('EXIBE_FORNECEDOR_CONSULTA') = '1') then
        x_exibe_fornecedor_consulta := true
      else if (clConf.Result('EXIBE_FORNECEDOR_CONSULTA') = '0') then
        x_exibe_fornecedor_consulta := false;

      if (clConf.Result('IMPRIME_VENDEDOR_CUPOM') = '0') then
        x_imprime_vendedor_cupom := false
      else
        x_imprime_vendedor_cupom := true;

      if (clConf.Result('EXIBE_PRECO_CUSTO') = '1') then
        x_exibe_preco_custo := true
      else if (clConf.Result('EXIBE_PRECO_CUSTO') = '0') then
        x_exibe_preco_custo := false;

      clConf.desconect;
      clConf.Free;
    end;

     //...
    if (x_ordem_codigo=0) then
      x_ordem_codigo := 1;
    if (x_ordem_refinterna=0) then
      x_ordem_refinterna := 2;
    if (x_ordem_reffabric=0) then
      x_ordem_reffabric := 3;
    if (x_ordem_cbarra=0) then
      x_ordem_cbarra := 1;
    if (x_ordem_prod_cor_tam=0) then
      x_ordem_prod_cor_tam:=2;
    x_ordem_cbarra_ean13 := 3; {* - é sempre o ultimo}

     {Lendo o arquivo CONF do CREDIARIO *************************************************************}
    if (databasecredito='CREDITO') then
    begin
      clConf := TClassAuxiliar.Create;
      clConf.conect   (databasecredito,self);
      clConf.ClearSql;
      clConf.AddParam ('SELECT * FROM CONF');
      clConf.Execute;
      clConf.First;
      x_banco_de_dados_crediario := clConf.Result('BANCO_DE_DADOS'); {*}
      x_formato_data_crediario   := clConf.Result('FORMATO_DATA'); {*}
      if (clConf.Result('BLOQUEIO_CARTAO')='0') then
        x_bloqueio_cartao := false
      else
      if (clConf.Result('BLOQUEIO_CARTAO')='1') then
        x_bloqueio_cartao := true;
      if (clConf.Result('REQ_FORMA_PGTO')='0') then
        x_requisitar_forma_pgto := false
      else
      if (clConf.Result('REQ_FORMA_PGTO')='1') then
        x_requisitar_forma_pgto := true;
      if (clConf.Result('PERM_RENEG_CONSULTA')='0') then
        x_permite_renegociacao_pela_consulta := false
      else
      if (clConf.Result('PERM_RENEG_CONSULTA')='1') then
        x_permite_renegociacao_pela_consulta := true;

      x_pode_loja_dif_pago := StrtoIntN(clConf.Result('PODE_LOJA_DIF_PAGO'));
      x_ReqDigv            := StrtoIntN(clConf.Result('ReqDigv'));
      x_pode_valor_loja_menor   := StrtoIntN(clConf.Result('PODE_VALOR_MENOR'));

      if (clConf.Result('CRITICA_LIMITE')='0') then
        x_critica_limite := false
      else
      if (clConf.Result('CRITICA_LIMITE')='1') then
        x_critica_limite := true;
      if (clConf.Result('ALT_CONT_CONS')='0') then
        x_alteracao_contrato_consulta := false
      else
      if (clConf.Result('ALT_CONT_CONS')='1') then
        x_alteracao_contrato_consulta := true;
      if (clConf.Result('SENHA_GER_ALT_CONS')='0') then
        x_senha_ger_alt_cons := false
      else
      if (clConf.Result('SENHA_GER_ALT_CONS')='1') then
        x_senha_ger_alt_cons := true;
      if (clConf.Result('ALT_SAL_LIM_CONS')='0') then
        x_alteracao_salario_limite_consulta := false
      else
      if (clConf.Result('ALT_SAL_LIM_CONS')='1') then
        x_alteracao_salario_limite_consulta := true;
      if (clConf.Result('ALT_LIM_CRED')='0') then
        x_alteracao_limite_credito := false
      else
      if (clConf.Result('ALT_LIM_CRED')='1') then
        x_alteracao_limite_credito := true;
      if (clConf.Result('ALT_OBS_CONS')='0') then
        x_alteracao_observacao_consulta := false
      else
      if (clConf.Result('ALT_OBS_CONS')='1') then
        x_alteracao_observacao_consulta := true;
      if (clConf.Result('PODE_VALOR_DIF_PAGO')='0') then
        x_pode_valor_dif_pago := false
      else
      if (clConf.Result('PODE_VALOR_DIF_PAGO')='1') then
        x_pode_valor_dif_pago := true;
          //**************************************************************************************
      if (clConf.Result('PODE_VALOR_MENOR')='0') then
        x_pode_loja_valor_menor := false
      else
      if (clConf.Result('PODE_VALOR_MENOR')='1') then
        x_pode_loja_valor_menor := true;
      if (clConf.Result('BLOQUEIA_APOS_COMPRA')='0') then
        x_bloqueia_alteracao_salario_compra := false
      else
      if (clConf.Result('BLOQUEIA_APOS_COMPRA')='1') then
        x_bloqueia_alteracao_salario_compra := true;
          //**************************************************************************************
      if (clConf.Result('PREENCHE_COM_VALOR_CORRIGIDO')='0') then
        x_preenche_com_valor_corrigido := false
      else
      if (clConf.Result('PREENCHE_COM_VALOR_CORRIGIDO')='1') then
        x_preenche_com_valor_corrigido := true;
      if (clConf.Result('CRITICA_CNPJ')='0') then
        x_critica_cnpj := false
      else
      if (clConf.Result('CRITICA_CNPJ')='1') then
        x_critica_cnpj := true;
      x_tamanho_nome_cliente := clConf.Result('TAM_NOME_CLIENTE');
      x_F8_cliente := clConf.Result('F8_CLIENTE');
      x_perc_lim_cred := clConf.Result('PERC_LIM_CRED');

      if (clConf.Result('CLI_SEM_FOTO') = '0') then
        x_cli_sem_foto := false
      else if (clConf.Result('CLI_SEM_FOTO') = '1') then
        x_cli_sem_foto := true;

      if (clConf.Result('CLI_SEM_CEP') = '0') then
        x_cli_sem_cep := false
      else if (clConf.Result('CLI_SEM_CEP') = '1') then
        x_cli_sem_cep := true;

      if (clConf.Result('SENHA_CONFIRMA_VENDA') = '0') then
        x_senha_usuario_crediario := false
      else if (clConf.Result('SENHA_CONFIRMA_VENDA') = '1') then
        x_senha_usuario_crediario := true;

      if (clConf.Result('SENHA_GERENTE_LIBERA_SALDO_ZERO') = '0') then
        x_senha_gerente_cliente_zerado := false
      else if (clConf.Result('SENHA_GERENTE_LIBERA_SALDO_ZERO') = '1') then
        x_senha_gerente_cliente_zerado := true;

      clConf.Desconect;
      clConf.Free;
    end;

     {Lendo o arquivo CONF do CONTAS A PAGAR *************************************************************}
    if (databasecontas='CONTASPAGAR') then
    begin
      clConf := TClassAuxiliar.Create;
      clConf.conect   (databasecontas,self);
      clConf.ClearSql;
      clConf.AddParam ('SELECT * FROM CONF');
      clConf.Execute;
      clConf.First;
      x_banco_de_dados_contas := clConf.Result('BANCO_DE_DADOS'); {*}
      clConf.desconect;
      clConf.Free;
    end;
  except
    if not ferro then
    begin
      clConf.desconect;
      clConf.Free;
      ChamandoAtualizarBancoDeDados(true);
      LeituraConfigGeral(true);
    end
    else
      raise;
  end;
end;

procedure TFrm_principal.SetConfigLocalDEFAULT;
begin
  DATA_NULA                           := strtodate('01/01/1900');
  x_data_trabalho                     := date;  
  x_sistema                           := 'Frente de Loja - Vendas';
  x_abrev_sistema                     := 'Vendas';
  x_pathimg                           := 'C:\ARQUIVOS DE PROGRAMAS\NATIVA\IMAGENS\';
  x_pathsystem                        := trim(ExtractFilePath( Application.ExeName));
  x_pathsystem                        := Copy(x_pathsystem,1,Length(x_pathsystem)-1);
  x_pathlocal                         := 'C:\NATIVA\VENDAS';
  x_modo_impressao                    := 0;
  x_tam_fonte                         := 10;
  x_tipo_fonte                        := 'Courier';
  x_salto                             := true;
  x_impressora                        := 3; {Impressora Epson}
  x_submenu_ativo                     := true;
//     x_critica_cnpj                      := true;
  x_alteracao_contrato_consulta       := true;
  x_codigomodulo                      := 0;
  x_estado                            := x_uf;
  x_codigo_venda                      := 0;
  x_codigo_vale_mercadoria            := 0;
  x_ecf                               := 0;
  x_modelo_gaveta                     := 1;  {gaveta PADRAO}
  x_imagem_logomarca                  := x_pathsystem+'\LOGOCLIE.BMP';
  x_path_arquivos_vendas_destino      := 'C:\NATIVA\VENDAS\MOVIMENTO';
  x_path_arquivos_produtos_origem     := 'C:\NATIVA\VENDAS\MOVIMENTO';
  x_adiciona_dv_codigo_barras         := false;
  x_permitir_cancelar_venda_com_cupom := false;
  x_caixa_ativo                       := 0;
  x_ativar_alerta_sequencial_venda    := true;
  x_forma_leitura_cbarra_venda        := 1; //direta
  x_tempo_gaveta_venda                := 0; //direta
  x_forma_leitura_cbarra_troca        := 1; //direta
  x_forma_leitura_cbarra_devolucao    := 1; //direta
  x_qtde_linhas_entre_SLIPS_TRANSFERENCIA := 5;
  x_slip_na_tela_TRANSFERENCIA        := true;
  x_slip_na_tela_COMPROVANTE          := false;
  x_prevalecer_EAN13                  := false;
  x_exibe_progresso_movimento         := false; //sem barra
  x_exploja_allcli                    := true;
  x_memoria_solicitacao_dias_a_vencer_promocao := 0;
  x_iniprom                           := false;
//     x_comissao_vales_emitidos           := true;
//     x_comissao_vales_recebidos          := true;
//     x_comissao_vales_mercadoria         := true;
//     x_desconto_venda                    := false;
  x_excimp                            := false;

  x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho := false;
  x_arquivo_winword                   := ' C:\Arquivos de programas\Microsoft Office\Office10\Winword.exe';

     //config. de senhas
  x_solicitar_senha_TRANSFERENCIA     := true;
  x_solicitar_senha_TROCA_DEVOLUCAO   := true;
  x_solicitar_senha_DESCONTO          := true;
  x_solicitar_senha_DESCONTO_VALE     := true;
  x_solicitar_senha_CONF_CAIXA        := true;
  x_solicitar_senha_RECEB_CHEQ_DEV    := true;
  x_solicitar_senha_INVENTARIO        := true;
  x_solicitar_senha_MOVIMENTO         := true;
  x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS := true;
  x_solicitar_senha_LISTAGENS_VENDAS  := true;
  x_solicitar_senha_CONSULTA_VENDA    := true;
  x_solicitar_senha_ALTERACAO_PRECO_VENDA  := true;
  x_solicitar_senha_SAIDA_LANCAMENTO_VENDA := false; //unico que inicia desativado

  x_AltPrecoAtend                        := true;
  x_solicitar_senha_OPCOES_Atdo          := true;
  x_solicitar_senha_TROCA_DEVOLUCAO_Atdo := true;
  x_solicitar_senha_TRANSFERENCIAS_Atdo  := true;
  x_solicitar_senha_LISTAGENS_Atdo       := true;
  x_solicitar_senha_DESCONTO_Atdo        := true;
  x_solicitar_Senha_saldo                := true;
  x_solicitar_Senha_CADASTRO_CLIENTE     := true;

  x_ConsEstoqOutras := false;
  x_ConsEstoqLoja   := false;
  x_ConsEstoqQtd    := false;
  x_ConsEstoqPrc    := false;


     {conf. do CREDIARIO}
  x_tamanho_nome_cliente          := 30;
  x_alteracao_contrato_consulta   := false;
  x_senha_ger_alt_cons            := false;
  x_perc_lim_cred                 := 30;
  x_qtde_autenticacao             := 1;
     //x_qtde_comprovante_pagamento    := 2;
  x_pesquisa_cep                  := false;
  x_requisitar_forma_pgto         := false;
  x_permite_renegociacao_pela_consulta := false;
  x_bloqueio_cartao               := false;
  x_autenticacao_baixa            := false;
  x_comprovante_pagamento         := false;
  x_critica_limite                := false;
  x_pode_loja_dif_pago            := 0;
  x_alteracao_salario_limite_consulta := false;
  x_bloqueia_alteracao_salario_compra := false;
  x_alteracao_observacao_consulta := false;
  x_pode_valor_dif_pago           := true;
  x_arquivo_proposta              := 'C:\NATIVA\CREDITO\PROPOSTA.TXT';

     {conf. do ESTOQUE}
  x_ordem_codigo        := 1;
  x_ordem_refinterna    := 2;
  x_ordem_reffabric     := 3;
  x_ordem_cbarra        := 1;
  x_ordem_prod_cor_tam  := 2;
  x_ordem_cbarra_ean13  := 3; {* - é sempre o ultimo}
  x_origem_cbarra       := 0;
  x_tipo_pvenda         := 0;
  x_margem_contrib      := 20;
  x_desconto_venda_min  := 10;
  x_desconto_venda_max  := 20;
  x_linha               := '';
  x_colecao             := '';
  x_mat1                := '';
  x_mat2                := '';
  x_mat3                := '';

  {***************************************************************}
  {... - configuracao da ECF, }
  {***************************************************************}
  x_ecf_habilita_modo_fiscal         := false;
  x_ecf_habilita_TEF         := false;
  x_ecf_modo_venda                   := 0;
  x_ecf_modelo_impressora            := 1;
  x_ecf_porta_comunicacao            := 'COM2';
  x_ecf_max_tam_descricao_item_cupom := 20; {//bom para URANO-EFC}
  x_ecf_busca_proximo_COO            := false;
  x_ecf_imprime_cupom_nao_fiscal_vinculado := false;
  x_ecf_codigo_de_barras_no_cupom    := K_CUPOM_ITEM_IMPRIME_CBARRASINTERNO;
  x_ImpItemECf                       := false;
  x_ImpSangECf                       := 'Não';
  x_formaspagamentoecf               := '';
  x_Aliquotasecf                     := '';
  x_tempointervecf                   := 0;
  x_ultimo_numro_controle_cartao_tef := '';
  x_ultimo_numro_controle_debito_tef := '';

  x_forma_de_leitura_codigo_barras   := 1; {//DEFAULT - passa direto pela qtde.}

  {***************************************************************}
  {... - codigos importantes para funcionamento, armazenado no SEQVENDAS.DBF - nao pode perder de forma alguma esses valores}
  {***************************************************************}
  x_loja                := 0; //loja comeca sem definicao, leitura no CONF
  x_terminal            := 0; //caixa comeca sem definicao, leitura no CONF
  x_nota_fiscal         := 0;
  x_cupom_fiscal        := 0;
  x_romaneio            := 0;
  x_venda               := -1; {- venda local, buffer de preenchimento -}

  {***************************************************************}
  x_codigo_atendimento            := 0;
  x_codigo_atendimento_suspenso   := 0;
  x_atendimento                   := -1; {- venda local, buffer de preenchimento -}
  x_ativar_alerta_sequencial_atdo := true;
  x_codigousuario                 := 0; //operador comeca sem definicao, leitura no CONF
  x_prazo_vendas := '01/01/2000';
end;

{*** Rotina que verifica a seguranca}
procedure TFrm_principal.VerificaSeguranca(empresa: String);
var
  codigo_empresa_codificado: Integer;
begin
  codigo_empresa_codificado := CodificarEmpresa(empresa);
  if (codigo_empresa_codificado=-1) then
  begin
    showmessage('Erro: SISTEMA AINDA NÃO AUTENTICADO!');
    Application.Terminate;
  end
  else
  if (x_codigo_empresa<>codigo_empresa_codificado) then
  begin
    showmessage('Erro: NOME DA EMPRESA é inválido!');
    Application.Terminate;
  end;
end;

{*** Rotina que realiza a mudanca da resolucao de video}
procedure TFrm_principal.MudaResolucaoVideo(width,height,color: Integer);
var
  i: Longint;
begin
  EnumDisplaySettings (nil,0,ModoResolucaoVideo);
  ModoResolucaoVideo.dmPelsWidth  := width;
  ModoResolucaoVideo.dmPelsHeight := height;
  ModoResolucaoVideo.dmBitsPerPel := color;
  ModoResolucaoVideo.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  i:=ChangeDisplaySettings (ModoResolucaoVideo,0);
  if (i=DISP_CHANGE_RESTART) then
    showmessage('O computador deve ser reiniciado para que as alterações de vídeo sejam completadas')
  else
  if (i=DISP_CHANGE_BADFLAGS) or (i=DISP_CHANGE_FAILED) or
    (i=DISP_CHANGE_BADMODE)  or (i=DISP_CHANGE_NOTUPDATED) then
    frmDialogo.ExibirMensagem ('Configuração de vídeo definido não  suportado pelo sistema'
      ,'Configurações de Vídeo',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);

end;

procedure TFrm_principal.ChamandoExportaRetaguarda;
begin
  Application.CreateForm(Tfrm_ExportaRetaguarda, frm_ExportaRetaguarda);
  with (frm_ExportaRetaguarda) do
  begin
    lblLocal.caption := frm_principal.x_path_arquivos_vendas_destino; {*}
    y_pathlocal      := frm_principal.x_path_arquivos_vendas_destino; {*}
    showmodal;
    Free;
  end;
end;

procedure TFrm_principal.ChamandoImportaRetaguarda;
begin
  Application.CreateForm(Tfrm_ImportaRetaguarda, frm_ImportaRetaguarda);
  with (frm_ImportaRetaguarda) do
  begin
    edtLocal.text            := frm_principal.x_path_arquivos_produtos_origem; {*}
    ListaDiretorio.directory := frm_principal.x_path_arquivos_produtos_origem; {*}
    showmodal;
    frm_principal.x_path_arquivos_produtos_origem := y_pathlocal; {*}
    Free;
  end;
end;

//***************************************************************************************************
//ATENCAO: ESTA ROTINA É CHAMADA EM VARIOS PONTOS DO SISTEMA, PARA GRAVAR VARIAVEIS 'x_' QUE NAO SAO
//REFERENCIADAS NA TELA DE CONFIGURACAO LOCAL DO SISTEMA
//***************************************************************************************************
procedure TFrm_principal.GravaConfigLocal_Caixa;
var
  VendasIni: TIniFile;
begin
  if (not DirectoryExists('C:\NATIVA')) then
    CreateDir('C:\NATIVA');
  VendasIni := TIniFile.Create('c:\nativa\vendas.ini');
  with (VendasIni) do
  begin
    WriteString  ('config','imagem',                x_pathimg);
    WriteString  ('config','imagemLogo', x_imagem_logomarca);
    WriteBool    ('config','MudaVideo',             x_modificar_video);

    WriteInteger ('printer','impressora',           x_impressora);
    WriteBool    ('printer','salto',                x_salto);
    WriteString  ('printer','MsWord',               x_arquivo_winword);
    WriteInteger ('printer','modeloImpressaoGeral', x_modelo_impressao_geral);

    WriteInteger ('etiquetas','colunas',            x_etiquetas_colunas);
    WriteInteger ('etiquetas','texto',              x_etiquetas_texto);
    WriteInteger ('etiquetas','espaco',             x_etiquetas_espaco);

    WriteString  ('exportacao','EmailPub',          x_email_publicador);
    WriteInteger ('exportacao','tipoExp',           x_tipo_exportacao);
    WriteString  ('exportacao','ftpHost',           x_ftp_host);
    WriteString  ('exportacao','userHost',          x_ftp_userid);
    WriteString  ('exportacao','passwordHost',      x_ftp_password);
    WriteString  ('exportacao','dirInitial',        x_ftp_diretorio_inicial);
    WriteString  ('exportacao','vendasDestino',     x_path_arquivos_vendas_destino);
    WriteString  ('exportacao','produtosOrigem',    x_path_arquivos_produtos_origem);
    WriteBool    ('exportacao','ExibeProgresso',    x_exibe_progresso_movimento);
    WriteBool    ('exportacao','Exploja_allcli',    x_exploja_allcli);
    WriteBool    ('exportacao','ExcImp'        ,    x_ExcImp);

    WriteInteger ('videoEntrada','width',           x_video_entrada_width);
    WriteInteger ('videoEntrada','height',          x_video_entrada_height);
    WriteInteger ('videoEntrada','color',           x_video_entrada_color);

    WriteInteger ('videoSaida','width',             x_video_saida_width);
    WriteInteger ('videoSaida','height',            x_video_saida_height);
    WriteInteger ('videoSaida','color',             x_video_saida_color);

    WriteBool    ('ECF','modoFiscal',               x_ecf_habilita_modo_fiscal);
    WriteBool    ('ECF','modoTEF',                  x_ecf_habilita_TEF);
    WriteInteger ('ECF','modoVenda',                x_ecf_modo_venda);
    WriteInteger ('ECF','modeloImpressora',         x_ecf_modelo_impressora);
    WriteString  ('ECF','portaCOM',                 x_ecf_porta_comunicacao);
    WriteBool    ('ECF','buscaCOO',                 x_ecf_busca_proximo_COO);
    WriteBool    ('ECF','NaoFiscalVinculado',       x_ecf_imprime_cupom_nao_fiscal_vinculado);
    WriteInteger ('ECF','CBarrasNoCupom',           x_ecf_codigo_de_barras_no_cupom);
    WriteBool    ('ECF','ImpItemEcf',               x_ImpItemEcf);
    WriteString  ('ECF','ImpSangEcf',               x_ImpSangEcf);


    WriteString  ('ECF','formaspagamentoecf',       x_formaspagamentoecf);
    WriteString  ('ECF','Aliquotasecf',             x_Aliquotasecf);
    WriteString  ('ECF','TempoIntervecf',           FloatToStr(x_TempoIntervecf));


    WriteInteger ('LeituraCBarraVenda','ModoVenda',       x_forma_leitura_cbarra_venda);
    WriteInteger ('LeituraCBarraVenda','ModoTroca',       x_forma_leitura_cbarra_troca);
    WriteInteger ('LeituraCBarraVenda','ModoDevolucao',   x_forma_leitura_cbarra_devolucao);
    WriteBool    ('LeituraCBarraVenda','PrevalecerEAN13', x_prevalecer_EAN13);
    WriteBool    ('ExibeAlerta','ExibeAlertaOff', x_exibe_alerta_offline);

    WriteInteger ('Gaveta','TempoGavetaVenda',x_tempo_gaveta_venda);

    WriteInteger ('SLIP','QtdeLinhasEntre_TRANSFERENCIA', x_qtde_linhas_entre_SLIPS_TRANSFERENCIA);
    WriteBool    ('SLIP','NaTela_TRANSFERENCIA',          x_slip_na_tela_TRANSFERENCIA);
    WriteBool    ('SLIP','NaTela_COMPROVANTE',            x_slip_na_tela_COMPROVANTE);

    WriteBool    ('cobranca','Comprovante',                 x_comprovante_pagamento);
    WriteInteger ('cobranca','QtdeComprovantes',       x_qtde_comprovante_pagamento);

    WriteInteger ('MemoriaSolicitacao','DiasAVencerPromocao',             x_memoria_solicitacao_dias_a_vencer_promocao);
    WriteBool    ('MemoriaSolicitacao','PromocaoAVencerExibirCorTamanho', x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho);
    WriteBool    ('MemoriaSolicitacao','IniProm', x_IniProm);
    WriteBool    ('ComissoesVales', 'Vale_emitidos',x_comissao_vales_emitidos);
    WriteBool    ('ComissoesVales', 'Vale_recebidos',x_comissao_vales_recebidos);
    WriteBool    ('ComissoesVales', 'Vale_mercadorias',x_comissao_vales_mercadoria);
    WriteBool    ('ComissoesVales', 'Exibir_itens',x_exibir_itens);

//          WriteBool    ('DescontoVenda', 'Desconto_venda',x_desconto_venda);
    WriteBool    ('Senha','TRANSFERENCIA',                x_solicitar_senha_TRANSFERENCIA);
    WriteBool    ('Senha','TROCA_DEVOLUCAO',              x_solicitar_senha_TROCA_DEVOLUCAO);
    WriteBool    ('Senha','DESCONTO',                     x_solicitar_senha_DESCONTO);
    WriteBool    ('Senha','DESCONTO_VALE',                x_solicitar_senha_DESCONTO_VALE);
    WriteBool    ('Senha','CONF_CAIXA',                   x_solicitar_senha_CONF_CAIXA);
    WriteBool    ('Senha','RECEB_CHEQ_DEV',               x_solicitar_senha_RECEB_CHEQ_DEV);
    WriteBool    ('Senha','INVENTARIO',                   x_solicitar_senha_INVENTARIO);
    WriteBool    ('Senha','MOVIMENTO',                    x_solicitar_senha_MOVIMENTO);
    WriteBool    ('Senha','OUTRAS_FUNCOES_ATENDIMENTOS',  x_solicitar_senha_OUTRAS_FUNCOES_ATENDIMENTOS);
    WriteBool    ('Senha','LISTAGENS_VENDAS',             x_solicitar_senha_LISTAGENS_VENDAS);
    WriteBool    ('Senha','CONSULTA_VENDA',               x_solicitar_senha_CONSULTA_VENDA);
    WriteBool    ('Senha','ALTERACAO_PRECO_VENDA',        x_solicitar_senha_ALTERACAO_PRECO_VENDA);
    WriteBool    ('Senha','SAIDA_LANCAMENTO_VENDA',       x_solicitar_senha_SAIDA_LANCAMENTO_VENDA);
    WriteBool    ('Senha','SALDO'                 ,       x_solicitar_senha_Saldo);
    WriteBool    ('Senha','CADASTRO_CLIENTE',             x_solicitar_senha_CADASTRO_CLIENTE);

    WriteBool    ('ConsEstoq','ConsEstoqOutras', x_ConsEstoqOutras);
    WriteBool    ('ConsEstoq','ConsEstoqLoja', x_ConsEstoqLoja);
    WriteBool    ('ConsEstoq','ConsEstoqQtde', x_ConsEstoqQtd);
    WriteBool    ('ConsEstoq','ConsEstoqPrc', x_ConsEstoqPrc);
    WriteBool    ('CheckCheck','CheckCheckConsCli', x_CheckCheckConsCli);
    WriteBool    ('CheckCheck','CheckCheckCont', x_CheckCheckCont);
    WriteBool    ('ch','chHabilitaValidacoes', x_HabilitaValidacoes);
    WriteBool    ('OnlineVPN','ONLINEVPN', x_onlinevpn);
    WriteBool    ('Buscaaltomatica','BUSCAALTOMATICA', x_buscaaltomatica);

    WriteString  ('PrazoConsVendas','PRAZOVENDAS', x_prazo_vendas);

  end;
  VendasIni.UpdateFile;
  VendasIni.Free;
end;
//***************************************************************************************************

{Formulario de configuracao de impressoras ***}
procedure Tfrm_principal.ChamandoImpressoras;
begin
  Application.CreateForm(Tfrm_Impressoras, frm_Impressoras);
  with (frm_Impressoras) do
  begin
    showmodal;
    Free;
  end;
end;

{Gravacao do arquivo de LOG do sistema --- Sem AUDITORIAS ***}
procedure Tfrm_principal.GravaLog (usuario: Real; data: TDateTime; hora: String;
  modulo: Real; operacao: String; codigoentidade: Real;
  infoant, infopos: String);
begin
  with (qInsertLog) do
  begin
    parambyname('USUARIO').AsFloat        := usuario;
    parambyname('DATA').AsDateTime        := data;
    parambyname('HORA').AsString          := hora;
    parambyname('MODULO').AsFloat         := modulo;
    parambyname('OPERACAO').AsString      := operacao;
    parambyname('CODIGOENTIDADE').AsFloat := codigoentidade;
    parambyname('INFOANT').AsString       := infoant;
    parambyname('INFOPOS').AsString       := infopos;
    ExecSql;
  end;
end;

function Tfrm_principal.CriaCampo(nometabela,nomecampo,nometipo: String):Boolean;
begin
  // modificacoes por Rodrigo Cordeiro - otimização da funcao para melhora de desempenho
  screen.Cursor:=crHourGlass;
  qGeraCampoVENDAS.SQL.Clear;
  qGeraCampoVENDAS.SQL.Add('IF NOT EXISTS (SELECT * FROM information_schema.columns');
  qGeraCampoVENDAS.SQL.Add('WHERE TABLE_NAME = '+QuotedStr(nometabela)+' AND COLUMN_NAME = '+QuotedStr(nomecampo)+')');
  qGeraCampoVENDAS.SQL.Add('  ALTER TABLE '+nometabela+' ADD '+nomecampo+' '+nometipo );
  try
    qGeraCampoVENDAS.ExecSQL;
  except on E:Exception do
    begin
      screen.Cursor:=crDefault;
      ShowMessage(e.ClassName+' '+e.Message);
    end;
  end;
  screen.Cursor:=crDefault;

  {result := false;
  with (qGeraCampoVENDAS.sql) do
  begin
    clear;
    Add('ALTER TABLE '+nometabela+'      ');
    Add('ADD '+nomecampo+' '+nometipo+'  ');
    try
      qGeraCampoVENDAS.ExecSql;
      result := true;
    except
    end;
  end;}
end;

function Tfrm_principal.SetScreenResolution(Width, Height: Integer): Longint;
var
  DeviceMode: TDeviceMode;
begin
  with DeviceMode do
  begin
    dmSize := SizeOf(TDeviceMode);
    dmPelsWidth := Width;
    dmPelsHeight := Height;
    dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
  end;
  Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure Tfrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
var
  DevMode : TDevMode;
begin
     {****************************************************************************}
  servidor_credito.Connected     := false;
  servidor_contaspagar.Connected := false;
  servidor_estoque.Connected     := false;
  servidor_vendas.Connected      := false;
     {********************************************************************}
  if (exibiu) and (create) then {*}
    if (frm_principal.x_tipo_funcionamento_sistema=0) then
      frm_principal.GravaConfigLocal_Atdo
    else
    if (frm_principal.x_tipo_funcionamento_sistema=1) then
      frm_principal.GravaConfigLocal_Caixa;
     {****************************************************************************}
  if (x_modificar_video) then
  begin
//         SetScreenResolution(x_video_saida_width,x_video_saida_height);
{         MudaResolucaoVideo(x_video_saida_width,
                            x_video_saida_height,
                            x_video_saida_color); }
    EnumDisplaySettings(nil,x_video_saida_width+x_video_saida_height+x_video_saida_color,Devmode);
    ChangeDisplaySettings(DevMode,0);
  end;
     {****************************************************************************}
end;

{Chamando formulario de clientes/contratos *****}
procedure Tfrm_principal.ChamandoClienteContrato (iModo: Integer; flag: Boolean);
var
  vkey:Word;
begin
  Application.CreateForm(Tfrm_Aux5Contrato, frm_Aux5Contrato);   
  Application.CreateForm (Tfrm_EdtCliente, frm_EdtCliente);
  with (frm_EdtCliente) do
  begin
    fichario.activepage := pagina1;
    edtCodigo.text      := '';
    LimparEdits(1);
    LimparEdits(2);
    LimparEdits(3);
    IniciarGradeLancamentos;
    dataContrato  := StrToDate('01/01/1900');
    cdLoja        := 0;
    cdCliente     := 0;
    frm_edtCliente.edtValMerc.readonly := false; {*}
    frm_edtCliente.edtValEntrada.readonly := false; {*}
    if (iModo=0) then
    begin
      CodigoInclusaoCliente := CodigoCanceladoCliente;
      caption := x_sistema+' - ' + LB_LANC_CLIE_CONT;
    end
    else
    if (iModo=1) then
    begin
      CodigoInclusaoCliente := CodigoCanceladoCliente;
      caption := x_sistema+' - ' + LB_CADASTRO_CLIENTE;
    end
    else
    if (iModo=2) then
    begin
      CodigoInclusaoContrato := CodigoCanceladoContrato;
      caption := x_sistema+' - ' + LB_CADASTRO_CONTRAT;
    end
    else
    if (iModo=3) then {chamando pela consulta}
    begin
          {pre-configurando formulario... - parametros do formulario>>>}
      frm_edtCliente.cdCliente := strtoint(frm_Consulta1.codigo);
      frm_edtCliente.datacontrato := frm_principal.x_data_trabalho;
      frm_edtCliente.cdLoja := frm_Consulta1.loja;
      frm_edtCliente.pnTipoCad3.caption := 'Cliente: '+
        ProcuraNomeClienteCod(frm_edtCliente.cdCliente,self);
      frm_edtCliente.caption := frm_principal.x_sistema+' - '+LB_CADASTRO_CONTRAT+
        ' - Loja: '+ProcuraNomeLoja(frm_edtCliente.cdLoja,self)+
        '  - Data: '+datetostr(frm_edtCliente.datacontrato);
      btnConsulta.visible:=false;
      iModo:=2;
      CodigoInclusaoContrato := CodigoCanceladoContrato;
      frm_edtCliente.edtValMerc.readonly    := true;
      frm_edtCliente.edtValMerc.text        := frm_Consulta1.total_contrato_caixa; {*}
      frm_edtCliente.edtValEntrada.readonly := true;
      frm_edtCliente.edtValEntrada.text     := frm_Consulta1.total_entrada_caixa;  {*}

    end
    else
    if (iModo=4) then {chamando pela consulta do CAIXA}
    begin
          {pre-configurando formulario... - parametros do formulario>>>}
      frm_edtCliente.datacontrato := frm_principal.x_data_trabalho;
      frm_edtCliente.cdLoja := frm_Consulta1.loja;
      frm_edtCliente.caption := frm_principal.x_sistema+' - '+LB_LANC_CLIE_CONT+
        ' - Loja: '+ProcuraNomeLoja(frm_edtCliente.cdLoja,self)+
        '  - Data: '+datetostr(frm_edtCliente.datacontrato);
      btnConsulta.visible:=false;
      iModo:=4;
      CodigoInclusaoCliente := CodigoCanceladoCliente;
      if (frm_Consulta1.codigo<>'') then
        frm_edtCliente.cdCliente := strtoint(frm_Consulta1.codigo);
      frm_edtCliente.edtCodigo.text := frm_Consulta1.codigo;
      frm_edtCliente.edtValMerc.readonly    := true;
      frm_edtCliente.edtValMerc.text        := frm_Consulta1.total_contrato_caixa; {*}
      frm_edtCliente.edtValEntrada.readonly := true;
      frm_edtCliente.edtValEntrada.text     := frm_Consulta1.total_entrada_caixa;  {*}
    end;

    MostraAuxLoja := true;
    cdCheq        := 0;
    Modo          := iModo;
    frm_edtCliente.flagConsulta := flag;
    frm_edtCliente.valor_do_contrato_renegociacao := 0; //-1 somente para renegociacao
    if clienteaut then
      with Tquery.create(Application) do
        try
          vkey := 13; 
          databasename := 'CREDITO';
          Sql.Add('Select cl_codi from crecli where cl_cpf = '''+Trim(Frm_Consulta1.edtcpf.Text)+''' ');
          if (trim(frm_Consulta1.edtcpf.Text) <> '') and (trim(frm_Consulta1.edtcodcli.Text) = '') then
          begin
            open;
            frm_Consulta1.edtCodCli.Text := FieldByName('Cl_Codi').AsString;
          end;
          if (trim(frm_Consulta1.edtCodCli.Text) = '') then
            frm_edtCliente.Novocontrato1.OnClick(frm_principal);
        finally
          destroy; 
        end;
          
    try
      showmodal;
    finally
      clienteaut := false;
    end;
         
    if (iModo=0) then
      CodigoCanceladoCliente := CodigoInclusaoCliente
    else
    if (iModo=1) then
      CodigoCanceladoCliente := CodigoInclusaoCliente
    else
    if (iModo=2) then
      CodigoCanceladoSessao := CodigoInclusaoContrato;
    Free;
    frm_Aux5Contrato.Free;
  end;
end;

procedure Tfrm_principal.ChamandoLancReceb2 (cliente,loja_contrato,numero_contrato: Real);
begin
  Application.CreateForm(Tfrm_LancReceb2, frm_LancReceb2);
  with (frm_LancReceb2) do
  begin
    caption := frm_principal.x_sistema+' - '+LB_LANC_RECEB;
    LimparEdits;
      {******************************************************}
    y_cliente         := cliente;
    y_loja_contrato   := loja_contrato;
    y_numero_contrato := numero_contrato;
      {******************************************************}
    showmodal;
    Free;
  end;
end;

procedure Tfrm_principal.ChamandoPropostaCredito;
begin
  Application.CreateForm(Tfrm_VersoProposta, frm_VersoProposta);
  Application.CreateForm(Tfrm_PropostaCredito, frm_PropostaCredito);
  with (frm_PropostaCredito) do
  begin
    caption := frm_principal.x_sistema+' - Impressão de proposta de crédito';
    Panel1.visible:=true;
    Panel2.visible:=true;
    listaProposta.visible:=false;
    Modo:=0;
    showmodal;
    Free;
    frm_VersoProposta.Free;
  end;
end;

procedure Tfrm_principal.AcendoBotao (sender: TPanel; flag: Boolean);
begin
  if (flag) then
  begin
    sender.color := clBlue;
    sender.font.color := clWhite;
    sender.bevelinner := bvRaised;
    sender.bevelouter := bvRaised;
  end
  else
  begin
    sender.color := clTeal;
    sender.font.color := clWhite;
    sender.bevelinner := bvLowered;
    sender.bevelouter := bvRaised;
  end;
end;

procedure Tfrm_principal.ChamandoPosFinancCons;
begin
  Application.CreateForm(Tfrm_Consulta1, frm_Consulta1);
  with (frm_Consulta1) do
  begin
    caption := frm_principal.x_sistema+' - '+LB_POS_FINANC_CONS;
    Modo    := 3;
    frm_principal.x_frente_loja := frm_principal.x_loja;
    //******************************************************************************************
    total_entrada_caixa  := trim(form_nc(frm_FechamentoVenda_Cred.SugereValorEntradaDoCrediarioDaVenda,15));
    total_contrato_caixa := trim(form_nc(
      strtofloat(RetiraFormatacaoNumero(trim(frm_FechamentoVenda.edtValor.text))) +
      strtofloat(RetiraFormatacaoNumero(trim(total_entrada_caixa)))
      ,15));
    //******************************************************************************************
    showmodal;
    Free;
  end;

end;


procedure Tfrm_principal.botao_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_principal.Panel4Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ExibeCaixas, frm_ExibeCaixas);
  frm_ExibeCaixas.showmodal;
  frm_ExibeCaixas.Free;
end;

procedure Tfrm_principal.botao11Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MenuPrincipal_Opcao1, frm_MenuPrincipal_Opcao1);
  frm_MenuPrincipal_Opcao1.showmodal;
  frm_MenuPrincipal_Opcao1.Free;
end;

procedure Tfrm_principal.ApagaTudo_1;
begin
  botao11.color := clTeal;
  botao11.font.color := clWhite;
  botao12.color := clTeal;
  botao12.font.color := clWhite;
  botao13.color := clTeal;
  botao13.font.color := clWhite;
  botao14.color := clTeal;
  botao14.font.color := clWhite;
  botao15.color := clTeal;
  botao15.font.color := clWhite;
  botao16.color := clTeal;
  botao16.font.color := clWhite;
  botao17.color := clTeal;
  botao17.font.color := clWhite;
  botao18.color := clTeal;
  botao18.font.color := clWhite;
end;

procedure Tfrm_principal.ApagaTudo_2;
begin
  botao21.color := clTeal;
  botao21.font.color := clWhite;
  botao22.color := clTeal;
  botao22.font.color := clWhite;
  botao23.color := clTeal;
  botao23.font.color := clWhite;
  botao24.color := clTeal;
  botao24.font.color := clWhite;
  botao25.color := clTeal;
  botao25.font.color := clWhite;
end;

procedure Tfrm_principal.botao11MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao11.color := clWhite;
  botao11.font.color := clTeal;
end;

procedure Tfrm_principal.botao12MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao12.color := clWhite;
  botao12.font.color := clTeal;
end;

procedure Tfrm_principal.botao13MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao13.color := clWhite;
  botao13.font.color := clTeal;
end;

procedure Tfrm_principal.botao14MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao14.color := clWhite;
  botao14.font.color := clTeal;
end;

procedure Tfrm_principal.botao15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao15.color := clWhite;
  botao15.font.color := clTeal;
end;

procedure Tfrm_principal.botao16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao16.color := clWhite;
  botao16.font.color := clTeal;
end;

procedure Tfrm_principal.botao13Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_TRANSFERENCIA) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesTransf, frm_BotoesTransf);
      frm_BotoesTransf.showmodal;
      frm_BotoesTransf.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_BotoesTransf, frm_BotoesTransf);
    frm_BotoesTransf.showmodal;
    frm_BotoesTransf.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_principal.botao16Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_BotoesOpcoes,frm_BotoesOpcoes);
  frm_BotoesOpcoes.showmodal;
  frm_BotoesOpcoes.Free;
  frm_senhaSupervisor.y_flag:=false;
end;

procedure Tfrm_principal.botao18Click(Sender: TObject);
begin
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_BotoesConfig, frm_BotoesConfig);
    frm_BotoesConfig.showmodal;
    frm_BotoesConfig.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_principal.botao17Click(Sender: TObject);
begin
  if (frm_principal.x_ecf_habilita_modo_fiscal) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesECF, frm_BotoesECF);
      frm_BotoesECF.showmodal;
      frm_BotoesECF.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Modo fiscal não habilitado!'
      ,'Comandos ECF',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_principal.botao17MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao17.color := clWhite;
  botao17.font.color := clTeal;
end;

procedure Tfrm_principal.botao18MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_1;
  botao18.color := clWhite;
  botao18.font.color := clTeal;
end;

procedure Tfrm_principal.botao14Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MenuPrincipal_OpcaoCrediario, frm_MenuPrincipal_OpcaoCrediario);
  frm_MenuPrincipal_OpcaoCrediario.showmodal;
  frm_MenuPrincipal_OpcaoCrediario.Free;
end;

procedure Tfrm_principal.ChamandoLancReceb2OffLine;
begin
  Application.CreateForm(Tfrm_LancReceb2OffLine, frm_LancReceb2OffLine);
  with (frm_LancReceb2OffLine) do
  begin
    caption := frm_principal.x_sistema+' - '+LB_LANC_RECEB;
    LimparEdits;
    showmodal;
    Free;
  end;
end;


procedure Tfrm_principal.botao12Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_MenuPrincipal_OpcaoCaixa, frm_MenuPrincipal_OpcaoCaixa);
  frm_MenuPrincipal_OpcaoCaixa.showmodal;
  frm_MenuPrincipal_OpcaoCaixa.Free;
end;

procedure Tfrm_principal.botao15Click(Sender: TObject);
begin
  if (frm_principal.pnCaixaAtiva.caption<>' Caixa: INDEFINIDO') then
  begin
    if (frm_principal.x_solicitar_senha_CONF_CAIXA) then
    begin
      frm_senhaSupervisor.showmodal;
      if (frm_senhaSupervisor.y_flag) then
      begin
        Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
        frm_FechamentoCaixa.rdTipo.itemindex            := 0; //ABRE O FORM DE FECHAMENTO APENAS PARA 'CONFERENCIA'
        frm_FechamentoCaixa.botaoEncerramento.visible   := false; {*}
        frm_FechamentoCaixa.rdTipo.enabled              := false;
        frm_FechamentoCaixa.lbGerenteSupervisor.caption := ''; //sem supervisor
        frm_FechamentoCaixa.lbCaixa.caption             := trim(UpperCase(pnCaixaAtiva.caption));
        frm_FechamentoCaixa.y_caixa_ativo               := frm_principal.x_caixa_ativo;
        frm_FechamentoCaixa.lbltitulo.caption           := '[Conferência de Caixa]';
        frm_FechamentoCaixa.lbltitulo_sombra.caption    := '[Conferência de Caixa]';
        frm_FechamentoCaixa.showmodal; //para permitir o DENTRO / FORA
        frm_FechamentoCaixa.Free;
      end
    end
    else
    begin
      Application.CreateForm(Tfrm_FechamentoCaixa, frm_FechamentoCaixa);
      frm_FechamentoCaixa.rdTipo.itemindex            := 0; //ABRE O FORM DE FECHAMENTO APENAS PARA 'CONFERENCIA'
      frm_FechamentoCaixa.botaoEncerramento.visible   := false; {*}
      frm_FechamentoCaixa.rdTipo.enabled              := false;
      frm_FechamentoCaixa.lbGerenteSupervisor.caption := ''; //sem supervisor
      frm_FechamentoCaixa.lbCaixa.caption             := trim(UpperCase(pnCaixaAtiva.caption));
      frm_FechamentoCaixa.y_caixa_ativo               := frm_principal.x_caixa_ativo;
      frm_FechamentoCaixa.lbltitulo.caption           := '[Conferência de Caixa]';
      frm_FechamentoCaixa.lbltitulo_sombra.caption    := '[Conferência de Caixa]';
      frm_FechamentoCaixa.showmodal; //para permitir o DENTRO / FORA
      frm_FechamentoCaixa.Free;
    end;
  end
  else
    frmDialogo.ExibirMensagem ('Não foi definido um CAIXA ativo ainda!'
      ,'Vendas',[mbOK]
      ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
end;

procedure Tfrm_principal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (x_tipo_funcionamento_sistema=0) then //ILHA
  begin
    if (key=K_F1) then
    begin
      ListaAtalhosF1.clear;
      ListaAtalhosF1.Add('  [F1] - Ajuda ');
      ListaAtalhosF1.Add('  [1]  - Atendimentos');
      ListaAtalhosF1.Add('  [2]  - Opções');
      ListaAtalhosF1.Add('  [3]  - Transferências');
      ListaAtalhosF1.Add('  [4]  - Listagens');
      ListaAtalhosF1.Add('  [5]  - Configurações Locais');
      ListaAtalhosF1.Add('  [Ctrl + G]  - Abrir Gaveta');
      Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
      frm_AjudaComandos.showmodal;
      frm_AjudaComandos.Free;
    end;
    if (key=13) then
      if (botao11.color=clWhite) then
        botao21Click(Sender)
      else
      if (botao12.color=clWhite) then
        botao22Click(Sender)
      else
      if (botao13.color=clWhite) then
        botao23Click(Sender)
      else
      if (botao14.color=clWhite) then
        botao24Click(Sender)
      else
      if (botao15.color=clWhite) then
        botao25Click(Sender);
    if (key=97) or (key=Ord('1')) then
      botao21Click(Sender)
    else
    if (key=98) or (key=Ord('2')) then
      botao22Click(Sender)
    else
    if (key=99) or (key=Ord('3')) then
      botao23Click(Sender)
    else
    if (key=100) or (key=Ord('4')) then
      botao24Click(Sender)
    else
    if (key=101) or (key=Ord('5')) then
      botao25Click(Sender);
  end
  else
  if (x_tipo_funcionamento_sistema=1) then //CAIXA
  begin
    if label7.visible and (SHIFT = [ssctrl]) and (key = 71) then
      AbreGaveta(true);

    if (key=K_F1) then
    begin
      ListaAtalhosF1.clear;
      ListaAtalhosF1.Add('  [F1] - Ajuda ');
      ListaAtalhosF1.Add('  [1]  - Atendimentos');
      ListaAtalhosF1.Add('  [2]  - Caixa');
      ListaAtalhosF1.Add('  [3]  - Transferências');
      ListaAtalhosF1.Add('  [4]  - Crediário');
      ListaAtalhosF1.Add('  [5]  - Fechamento p/ conferência');
      ListaAtalhosF1.Add('  [6]  - Outras funções');
      ListaAtalhosF1.Add('  [7]  - Comandos ECF');
      ListaAtalhosF1.Add('  [8]  - Configuração local do sistema');
      ListaAtalhosF1.Add('  [8]  - Configuração local do sistema');
      if label7.visible then
        ListaAtalhosF1.Add('  [Alt + G]  - Abrir Gaveta');
      Application.CreateForm(Tfrm_AjudaComandos, frm_AjudaComandos);
      frm_AjudaComandos.showmodal;
      frm_AjudaComandos.Free;
    end;
    if (key=13) then
      if (botao11.color=clWhite) then
        botao11Click(Sender)
      else
      if (botao12.color=clWhite) then
        botao12Click(Sender)
      else
      if (botao13.color=clWhite) then
        botao13Click(Sender)
      else
      if (botao14.color=clWhite) then
        botao14Click(Sender)
      else
      if (botao15.color=clWhite) then
        botao15Click(Sender)
      else
      if (botao16.color=clWhite) then
        botao16Click(Sender)
      else
      if (botao17.color=clWhite) then
        botao17Click(Sender)
      else
      if (botao18.color=clWhite) then
        botao18Click(Sender);
    if (key=97) or (key=Ord('1')) then
      botao11Click(Sender)
    else
    if (key=98) or (key=Ord('2')) then
      botao12Click(Sender)
    else
    if (key=99) or (key=Ord('3')) then
      botao13Click(Sender)
    else
    if (key=100) or (key=Ord('4')) then
      botao14Click(Sender)
    else
    if (key=101) or (key=Ord('5')) then
      botao15Click(Sender)
    else
    if (key=102) or (key=Ord('6')) then
      botao16Click(Sender)
    else
    if (key=103) or (key=Ord('7')) then
      botao17Click(Sender)
    else
    if (key=104) or (key=Ord('8')) then
      botao18Click(Sender);
  end;
end;

procedure Tfrm_principal.lblStatusDblClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_ResumoConexoes, frm_ResumoConexoes);
  frm_ResumoConexoes.showmodal;
  frm_ResumoConexoes.Free;
end;

procedure Tfrm_principal.ChamandoExportaTrigger_Crediario;
begin
  Application.CreateForm(Tfrm_ExportaTrigger, frm_ExportaTrigger);
  try
    frm_ExportaTrigger.qTeste.open;
    with (frm_ExportaTrigger) do
    begin
      caption := frm_principal.x_sistema+' - Exportação de movimento do Crediário ';
          {*******************************************************************************************}
      frm_principal.x_frente_loja := frm_principal.x_loja; //loja do frente de loja é a loja do CAIXA
      frm_principal.x_tipo_loja   := 0; //sempre filial
          {*******************************************************************************************}
          //as configuracoes de FTP (host,user,senha) ele pega do proprio 'CAIXA'
          {*******************************************************************************************}
      showmodal;
      Free;
    end;
    edtOpcao.text:='';
  except
    frmDialogo.ExibirMensagem ('Pacote de importação/exportação não instalado!'
      ,'Exportação',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frm_ExportaTrigger.Free;
  end;
end;

procedure Tfrm_principal.ChamandoImportaTrigger_Crediario;
begin
  Application.CreateForm(Tfrm_ImportaTrigger, frm_ImportaTrigger);
  try
    frm_ImportaTrigger.qTeste.open;
    with (frm_ImportaTrigger) do
    begin
      caption := frm_principal.x_sistema+' - Importação de movimento do Crediário';
          {*******************************************************************************************}
      frm_principal.x_frente_loja := frm_principal.x_loja; //loja do frente de loja é a loja do CAIXA
      frm_principal.x_tipo_loja   := 0; //sempre filial
          {*******************************************************************************************}
          //as configuracoes de FTP (host,user,senha) ele pega do proprio 'CAIXA'
          {*******************************************************************************************}
      showmodal;
      Free;
    end;
    edtOpcao.text:='';
  except
    frmDialogo.ExibirMensagem ('Pacote de importação/exportação não instalado!'
      ,'Exportação',[mbOk],
      frm_principal.x_pathimg+'iconeerro.bmp',250,200);
    frm_ExportaTrigger.Free;
  end;
end;

function Tfrm_principal.NecessitaAtualizarBancoDeDadosVENDAS:Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect   ('VENDAS',self);
  clAux.ClearSql;
  clAux.AddParam ('SELECT VERSAO_SISTEMA FROM CONF ');
  try
    clAux.consulta.Open;
    if (clAux.result('VERSAO_SISTEMA')<x_data_versao_sistema) then
      result := true {*}
    else
      result := false;
  except
    if (x_banco_de_dados=KDB_INTERBASE) then
      CriaCampo('CONF','VERSAO_SISTEMA','TIMESTAMP')
    else
    if (x_banco_de_dados=KDB_SQL_SERVER) then
      CriaCampo('CONF','VERSAO_SISTEMA','DATETIME');
    result := true; {*}
  end;
  clAux.desconect;
  clAux.Free;
end;

function Tfrm_principal.NecessitaAtualizarBancoDeDadosCREDIARIO:Boolean;
var
  clAux: TClassAuxiliar;
begin
  if (databasecredito='CREDITO') then
  begin
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('CREDITO',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT VERSAO_SISTEMA FROM CONF ');
    try
      clAux.consulta.Open;
      if (clAux.result('VERSAO_SISTEMA')<x_data_versao_sistema) then
        result := true {*}
      else
        result := false;
    except
      if (x_banco_de_dados=KDB_INTERBASE) then
        CriaCampo('CONF','VERSAO_SISTEMA','TIMESTAMP')
      else
      if (x_banco_de_dados=KDB_SQL_SERVER) then
        CriaCampo('CONF','VERSAO_SISTEMA','DATETIME');
      result := true; {*}
    end;
    clAux.desconect;
    clAux.Free;
  end
  else
    result := false;
end;

function Tfrm_principal.ExisteCampoLocal(nomecampo,nometabela: String):Boolean;
var
  clAux: TClassAuxiliar;
begin
  clAux := TClassAuxiliar.Create;
  clAux.conect ('C:\NATIVA\VENDAS',self);
  with (clAux.consulta.sql) do
  begin
    clear;
    Add('SELECT '+nomecampo+' ');
    Add('FROM '+nometabela+'  ');
    try
      clAux.consulta.Open;
      result := true;
    except
      result := false;
    end;
  end;
  clAux.desconect;
  clAux.Free;
end;

procedure Tfrm_principal.imgMistralClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSobre, frmSobre);
  frmSobre.showmodal;
  frmSobre.Free;
end;

procedure Tfrm_principal.Label7Click(Sender: TObject);
begin
  abregaveta(true);
end;

procedure Tfrm_principal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  arq: textfile;

  dc : hdc;
  cv : TCanvas;
  aux : TBitmap;
  FJPeg:TJpegImage;

begin
{     Application.MessageBox (Pchar('Descrição do erro: "'+E.Message+'"'),
                             'Monitoração de erros',
                             MB_OK);}
  try
    try
      FJpeg := TJPEGImage.Create;

      aux := TBitmap.Create;
      aux.Height := Screen.Height;
      aux.Width := Screen.Width;

      dc := GetDC(0);
      cv := TCanvas.Create;
      cv.Handle := dc;

      aux.Canvas.CopyRect(Rect(0,0,Screen.Width,Screen.Height),cv,
        Rect(0,0,Screen.Width,Screen.Height));
      cv.Destroy;
      ReleaseDC(0,dc);

      FJpeg.Assign(aux);
      FJpeg.Compress;

      if FileExists(ExtractFilePath(Application.ExeName)+'ERRO'+copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName)) - 4)+'.jpg') then
        SysUtils.deletefile((Application.ExeName)+'ERRO'+copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName)) - 4)+'.jpg');
      FJPeg.Savetofile(ExtractFilePath(Application.ExeName)+'ERRO'+copy(ExtractFileName(Application.ExeName),1,Length(ExtractFileName(Application.ExeName)) - 4)+'.jpg');
    finally
      FJpeg.Destroy;
      Aux.Destroy;
    end;  
  except
           //
  end;

  Application.CreateForm(Tfrm_ProbIniciar, frm_ProbIniciar);
  try
    frm_ProbIniciar.label2.visible := false;
    frm_ProbIniciar.label3.visible := false;
    frm_ProbIniciar.Memo1.lines.clear;
    frm_ProbIniciar.Memo1.lines.add('CLASSE '+E.ClassName);
    frm_ProbIniciar.Memo1.lines.add('ERRO   '+E.Message);
    frm_ProbIniciar.showmodal;
  finally
    frm_ProbIniciar.destroy;
  end;

  AssignFile             (arq,'c:\nativa\erroVENDAS.txt');
  if (FileExists('c:\nativa\erroVENDAS.txt')) then
    Append(arq)
  else
    Rewrite(arq);
  Writeln (arq,'Erro: '+datetostr(date)+': '+timetostr(time)+': '+E.Message);
  frm_principal.barradicas.caption:='';
  CloseFile(arq);
end;

procedure Tfrm_principal.botao21MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_2;
  botao21.color := clWhite;
  botao21.font.color := clTeal;
end;

procedure Tfrm_principal.botao22MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_2;
  botao22.color := clWhite;
  botao22.font.color := clTeal;
end;

procedure Tfrm_principal.botao23MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_2;
  botao23.color := clWhite;
  botao23.font.color := clTeal;
end;

procedure Tfrm_principal.botao24MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_2;
  botao24.color := clWhite;
  botao24.font.color := clTeal;
end;

procedure Tfrm_principal.botao21Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSenha_Atdo,frmSenha_Atdo);
  frmSenha_Atdo.caption :='Atendimento';
  frmSenha_Atdo.showmodal;
  if (frmSenha_Atdo.flagEntra) then
  begin
    Application.CreateForm(Tfrm_LancaAtendimento, frm_LancaAtendimento);
    frm_LancaAtendimento.showmodal;
    frm_LancaAtendimento.Free;
  end;
  frmSenha_Atdo.Free;
end;

procedure Tfrm_principal.botao25MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ApagaTudo_2;
  botao25.color := clWhite;
  botao25.font.color := clTeal;
end;

procedure Tfrm_principal.botao25Click(Sender: TObject);
begin
  frm_senhaSupervisor.showmodal;
  if (frm_senhaSupervisor.y_flag) then
  begin
    Application.CreateForm(Tfrm_BotoesConfig_Atdo, frm_BotoesConfig_Atdo);
    frm_BotoesConfig_Atdo.showmodal;
    frm_BotoesConfig_Atdo.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_principal.botao22Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_OPCOES_Atdo) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesOpcoes_Atdo, frm_BotoesOpcoes_Atdo);
      frm_BotoesOpcoes_Atdo.showmodal;
      frm_BotoesOpcoes_Atdo.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_BotoesOpcoes_Atdo, frm_BotoesOpcoes_Atdo);
    frm_BotoesOpcoes_Atdo.showmodal;
    frm_BotoesOpcoes_Atdo.Free;
    frm_senhaSupervisor.y_flag:=false
  end;
end;

procedure Tfrm_principal.botao23Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_TRANSFERENCIAS_Atdo) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_BotoesTransf, frm_BotoesTransf);
      frm_BotoesTransf.showmodal;
      frm_BotoesTransf.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_BotoesTransf, frm_BotoesTransf);
    frm_BotoesTransf.showmodal;
    frm_BotoesTransf.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

procedure Tfrm_principal.botao24Click(Sender: TObject);
begin
  if (frm_principal.x_solicitar_senha_LISTAGENS_Atdo) then
  begin
    frm_senhaSupervisor.showmodal;
    if (frm_senhaSupervisor.y_flag) then
    begin
      Application.CreateForm(Tfrm_botoesListagensAtdo, frm_botoesListagensAtdo);
      frm_botoesListagensAtdo.showmodal;
      frm_botoesListagensAtdo.Free;
      frm_senhaSupervisor.y_flag:=false;
    end;
  end
  else
  begin
    Application.CreateForm(Tfrm_botoesListagensAtdo, frm_botoesListagensAtdo);
    frm_botoesListagensAtdo.showmodal;
    frm_botoesListagensAtdo.Free;
    frm_senhaSupervisor.y_flag:=false;
  end;
end;

{*** Rotina que le a configuracao locao do terminal no arquivo ESTOQUE.INI}
procedure Tfrm_principal.LeituraConfigLocal_Atdo;
var
  VendasIni,EstoqIni: TIniFile;
begin
     {Procura pelo arquivo ESTOQ.INI --> Protecao,inicializacao.}
  if (FileExists('c:\nativa\ESTOQUE.ini')) then
  begin
    EstoqIni := TIniFile.Create ('c:\nativa\ESTOQUE.ini');
    with (EstoqIni) do
    begin
      x_origem_cbarra      := ReadInteger ('produtos','origem_cbarra', x_origem_cbarra);
      x_tipo_pvenda        := ReadInteger ('produtos','pvenda',          x_tipo_pvenda);
      x_margem_contrib     := ReadFloat   ('produtos','margem',         x_margem_contrib);
      x_desconto_venda_min := ReadFloat   ('produtos','descmin',    x_desconto_venda_min);
      x_desconto_venda_max := ReadFloat   ('produtos','descmax',    x_desconto_venda_max);
      x_linha              := ReadString  ('produtos','linha',     x_linha);
      x_colecao            := ReadString  ('produtos','colecao',   x_colecao);
      x_mat1               := ReadString  ('produtos','mat1',      x_mat1);
      x_mat2               := ReadString  ('produtos','mat2',      x_mat2);
      x_mat3               := ReadString  ('produtos','mat3',      x_mat3);
    end;
    EstoqIni.Free;
  end;

     {Procura pelo arquivo CAIXA.INI}
  if (FileExists('c:\nativa\ATENDIMENTO.ini')) then
  begin
    VendasIni := TIniFile.Create ('c:\nativa\ATENDIMENTO.ini');
    with (VendasIni) do
    begin
      x_pathimg                             := ReadString  ('config','imagem',        x_pathimg);
      x_imagem_logomarca                    := ReadString  ('config','imagemLogo', x_imagem_logomarca);
      x_modificar_video                     := ReadBool    ('config','MudaVideo',   x_modificar_video);

      x_impressora                          := ReadInteger('printer','impressora', x_impressora);
      x_salto                               := ReadBool('printer','salto',    x_salto);
      x_arquivo_winword                     := ReadString('printer','MsWord', x_arquivo_winword);
      x_modelo_impressao_geral              := ReadInteger('printer','modeloImpressaoGeral',x_modelo_impressao_geral);

      x_etiquetas_colunas                   := ReadInteger('etiquetas','colunas', x_etiquetas_colunas);
      x_etiquetas_texto                     := ReadInteger('etiquetas','texto',   x_etiquetas_texto);
      x_etiquetas_espaco                    := ReadInteger('etiquetas','espaco',  x_etiquetas_espaco);

      x_path_arquivos_vendas_destino        := ReadString('exportacao','vendasDestino', x_path_arquivos_vendas_destino);
      x_path_arquivos_produtos_origem       := ReadString('exportacao','produtosOrigem', x_path_arquivos_produtos_origem);

      x_video_entrada_width                 := ReadInteger('videoEntrada','width', x_video_entrada_width);
      x_video_entrada_height                := ReadInteger('videoEntrada','height', x_video_entrada_height);
      x_video_entrada_color                 := ReadInteger('videoEntrada','color', x_video_entrada_color);

      x_video_saida_width                   := ReadInteger('videoSaida','width', x_video_saida_width);
      x_video_saida_height                  := ReadInteger('videoSaida','height', x_video_saida_height);
      x_video_saida_color                   := ReadInteger('videoSaida','color', x_video_saida_color);

      x_ecf_habilita_modo_fiscal            := ReadBool ('ECF','modoFiscal', x_ecf_habilita_modo_fiscal);
      x_ecf_habilita_TEF                    := ReadBool ('ECF','modoTEF', x_ecf_habilita_TEF);
      x_ecf_modo_venda                      := ReadInteger('ECF','modoVenda', x_ecf_modo_venda);
      x_ecf_modelo_impressora               := ReadInteger('ECF','modeloImpressora', x_ecf_modelo_impressora);
      x_ecf_porta_comunicacao               := ReadString  ('ECF','portaCOM',x_ecf_porta_comunicacao);
      x_ecf_busca_proximo_COO               := ReadBool ('ECF','buscaCOO', x_ecf_busca_proximo_COO);

      x_forma_leitura_cbarra_venda          := ReadInteger('LeituraCBarraVenda','ModoVenda', x_forma_leitura_cbarra_venda);
      x_forma_leitura_cbarra_troca          := ReadInteger('LeituraCBarraVenda','ModoTroca', x_forma_leitura_cbarra_troca);
      x_forma_leitura_cbarra_devolucao      := ReadInteger('LeituraCBarraVenda','ModoDevolucao', x_forma_leitura_cbarra_devolucao);
      x_prevalecer_EAN13                    := ReadBool('LeituraCBarraVenda','PrevalecerEAN13', x_prevalecer_EAN13);
      x_exibe_alerta_offline                := ReadBool('ExibeAlerta','ExibeAlertaOff', x_exibe_alerta_offline);


      x_qtde_linhas_entre_SLIPS_ATENDIMENTO := ReadInteger('SLIP','QtdeLinhasEntre_ATENDIMENTO', x_qtde_linhas_entre_SLIPS_ATENDIMENTO);
      x_slip_na_tela_ATENDIMENTO            := ReadBool ('SLIP','NaTela_ATENDIMENTO', x_slip_na_tela_ATENDIMENTO);
      x_Orcamento_Atendimento               := ReadBool ('ORCA','NaTela_ATENDIMENTO', x_Orcamento_Atendimento);      
      x_comprovante_pagamento               := ReadBool ('cobranca','Comprovante', x_comprovante_pagamento);
      x_qtde_comprovante_pagamento          := ReadInteger ('cobranca','QtdeComprovantes', x_qtde_comprovante_pagamento);

      x_AltPrecoAtend                       := ReadBool ('Senha','ALTPRECOATEND',x_AltPrecoAtend);
      x_solicitar_senha_OPCOES_Atdo         := ReadBool ('Senha','OPCOES_ATDO', x_solicitar_senha_OPCOES_Atdo);
      x_solicitar_senha_TROCA_DEVOLUCAO_Atdo:= ReadBool ('Senha','TROCA_DEVOLUCAO', x_solicitar_senha_TROCA_DEVOLUCAO_Atdo); 
      x_solicitar_senha_TRANSFERENCIAS_Atdo := ReadBool ('Senha','TRANSFERENCIAS_ATDO', x_solicitar_senha_TRANSFERENCIAS_Atdo);
      x_solicitar_senha_LISTAGENS_Atdo      := ReadBool ('Senha','LISTAGENS_ATDO', x_solicitar_senha_LISTAGENS_Atdo);
      x_solicitar_senha_DESCONTO_Atdo       := ReadBool ('Senha','DESCONTO_ATDO', x_solicitar_senha_DESCONTO_Atdo);
    end;
    VendasIni.Free;
  end;
end;

{Procedimento de gravacao das configuracoes ***}
procedure Tfrm_principal.GravaConfigLocal_Atdo;
var
  VendasIni: TIniFile;
begin
  if (not DirectoryExists('C:\NATIVA')) then
    CreateDir('C:\NATIVA');
  VendasIni := TIniFile.Create('c:\nativa\ATENDIMENTO.ini');
  with (VendasIni) do
  begin
    WriteString  ('config','imagem',      x_pathimg);
    WriteString  ('config','imagemLogo',  x_imagem_logomarca);
    WriteBool    ('config','MudaVideo',   x_modificar_video);

    WriteInteger ('printer','impressora', x_impressora);
    WriteBool    ('printer','salto',    x_salto);
    WriteString  ('printer','MsWord', x_arquivo_winword);
    WriteInteger ('printer','modeloImpressaoGeral',x_modelo_impressao_geral);

    WriteInteger ('etiquetas','colunas', x_etiquetas_colunas);
    WriteInteger ('etiquetas','texto',   x_etiquetas_texto);
    WriteInteger ('etiquetas','espaco',  x_etiquetas_espaco);

    WriteString  ('exportacao','vendasDestino', x_path_arquivos_vendas_destino);
    WriteString  ('exportacao','produtosOrigem', x_path_arquivos_produtos_origem);

    WriteInteger ('videoEntrada','width', x_video_entrada_width);
    WriteInteger ('videoEntrada','height', x_video_entrada_height);
    WriteInteger ('videoEntrada','color', x_video_entrada_color);

    WriteInteger ('videoSaida','width', x_video_saida_width);
    WriteInteger ('videoSaida','height', x_video_saida_height);
    WriteInteger ('videoSaida','color', x_video_saida_color);

    WriteBool    ('ECF','modoFiscal', x_ecf_habilita_modo_fiscal);
    WriteBool    ('ECF','modoTEF', x_ecf_habilita_TEF);
    WriteInteger ('ECF','modoVenda', x_ecf_modo_venda);
    WriteInteger ('ECF','modeloImpressora', x_ecf_modelo_impressora);
    WriteString  ('ECF','portaCOM',x_ecf_porta_comunicacao);
    WriteBool    ('ECF','buscaCOO',x_ecf_busca_proximo_COO);

    WriteInteger ('LeituraCBarraVenda','ModoVenda', x_forma_leitura_cbarra_venda);
    WriteInteger ('LeituraCBarraVenda','ModoTroca', x_forma_leitura_cbarra_troca);
    WriteInteger ('LeituraCBarraVenda','ModoDevolucao', x_forma_leitura_cbarra_devolucao);
    WriteBool    ('LeituraCBarraVenda','PrevalecerEAN13', x_prevalecer_EAN13);


    WriteInteger ('SLIP','QtdeLinhasEntre_ATENDIMENTO', x_qtde_linhas_entre_SLIPS_ATENDIMENTO);
    WriteBool    ('SLIP','NaTela_ATENDIMENTO', x_slip_na_tela_ATENDIMENTO);
    WriteBool    ('ORCA','NaTela_ATENDIMENTO', x_Orcamento_Atendimento);    
    WriteBool    ('cobranca','Comprovante', x_comprovante_pagamento);
    WriteInteger ('cobranca','QtdeComprovantes', x_qtde_comprovante_pagamento);

    WriteBool    ('Senha','OPCOES_ATDO',                  x_solicitar_senha_OPCOES_Atdo);
    WriteBool    ('Senha','TROCA_DEVOLUCAO',              x_solicitar_senha_TROCA_DEVOLUCAO_Atdo);
    WriteBool    ('Senha','TRANSFERENCIAS_ATDO',          x_solicitar_senha_TRANSFERENCIAS_Atdo);
    WriteBool    ('Senha','LISTAGENS_ATDO',               x_solicitar_senha_LISTAGENS_Atdo);
    WriteBool    ('Senha','DESCONTO_ATDO',                x_solicitar_senha_DESCONTO_Atdo);
    WriteBool    ('Senha','ALTPRECOATEND',                x_AltPrecoAtend);
  end;
  VendasIni.UpdateFile;
  VendasIni.Free;
end;

procedure tfrm_principal.consultapromocoesavencer;
var
  Campo:Tfield;
  FCampo:Tfield;
  FParams:TStringList;
begin

  if not x_iniprom and
    (frm_botoesListagensAtdo = nil) then
    exit;

  try
    colorgridcons     := 'ClInfoBk';
    colorfontgridcons := 'ClNavy';

    QueryProm.DataBaseName  := databaseprodutos;
    QueryConcr.DataBaseName := databaseprodutos;
    with (QueryConcr) do
    begin
      sql.clear;
      Sql.add('SELECT Ps_Empr as Concorrente,Ps_Data as Data,Ps_Prec as Preco');
      sql.add('FROM PESQUISA_PRECOS P  ');
      Sql.add('WHERE (PS_CODI=:Pp_Concr) AND  ');
      Sql.add('      (PS_Grup=:Pp_Grup) AND  ');
      Sql.add('      (PS_SUBG=:Pp_Subg) AND  ');
      Sql.add('      (PS_PROD=:PP_Prod) AND   ');
  {     Sql.add('      (PS_DAT1=:Emissao) AND     ');
       Sql.add('      (PS_DAT2=:Vencimento) AND        ');}
      Sql.Add('      ((PS_Loja  ='+floattostr(x_loja)+') Or (Ps_Loja = 0 And ');
      Sql.Add('                            Not Exists(Select Ps_Loja From Pesquisa_Precos');
      Sql.Add('                            Where Ps_Codi = P.Ps_Codi And Ps_Loja = '+floattostr(x_loja)+'     And Upper(Ps_Empr) = Upper(P.Ps_Empr)');
      Sql.Add('                            aND   Ps_Grup = p.ps_grup and Ps_Subg = p.ps_subg and  Ps_Prod = P.Ps_Prod ');
      Sql.Add('                            )))');
    end;

    with QueryProm do
    begin
      sql.clear;
      sql.add('Select ');
      if x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho then
      begin
        sql.add(' Pr_Refi as Referencia,Es_Desc as Descricao');
        sql.add(' ,pp_grup,pp_subg,pp_prod');
        sql.add(',PP_Dat1 as Emissao,PP_dat2 as Vencimento');
        sql.add(' ,Cast(PP_dat2 - '''+DataBancodados(x_data_trabalho)+''' as Integer) + 1 as Dias');
        sql.add(' ,es_pve1,ip_pre1,PP_Pre1 as Vl_Promocional,pp_concr');
        sql.add(' From Precos_Promocionais PP');
        sql.add(' Left Join Itens_Tabelas_Precos Ip on (PP_Loja = Ip_Loja and PP_Grup = Ip_Grup and PP_SubG = Ip_SubG and PP_Prod = Ip_Prod and PP_Core = Ip_Core and  PP_Tama = Ip_Tama)');
      end
      else
      begin
        sql.add(' Pr_Refi as Referencia,Pr_Desc as Descricao,Max(PP_Dat1) as Emissao,Max(PP_dat2) as Vencimento');
        sql.add(' ,max(pp_grup) as Pp_grup,max(pp_subg) as pp_subg,max(pp_prod) as pp_prod');
        sql.add(' ,Cast(Max(PP_dat2) - '''+DataBancodados(x_data_trabalho)+''' as Integer) + 1 as Dias');
        sql.add(' ,Max(es_pve1) as Es_Pve1,CAST(0 AS DOUBLE PRECISION) as ip_pre1,Max(PP_Pre1) as Vl_Promocional,pp_concr');
        sql.add(' From Precos_Promocionais PP');
      end;
      sql.add(' Left Join Produtos on (PP_Grup = Pr_Grup and PP_SubG = Pr_SubG and PP_Prod = Pr_Codi)');
      sql.add(' Left Join Estoque E on (PP_Grup = Es_Grup and PP_SubG = Es_SubG and PP_Prod = Es_Prod and PP_Core = Es_Core and  PP_Tama = Es_Tama)');
      sql.add(' Where PP_Loja   =  '+floattostr(x_loja));
      sql.add(' And   PP_Dat1 <= '''+DataBancodados(x_data_trabalho)+'''' );
      sql.add(' And   PP_DAT2 >= '''+FormataDataVendas(frm_principal.x_data_trabalho)+'''');
      sql.add(' And   PP_Dat2 - '''+DataBancodados(x_data_trabalho)+''' <= '+inttostr(iifs(x_memoria_solicitacao_dias_a_vencer_promocao < 0,0,x_memoria_solicitacao_dias_a_vencer_promocao)));
      sql.add(' And   Es_Pve1 <> 0');
      if not x_memoria_solicitacao_promocoes_a_vencer_exibir_cor_tamanho then
        sql.add(' Group By Pr_Refi,Pr_Desc,PP_Dat1,PP_dat2,pp_concr');

      sql.add('Order By 4,2');
      open;
      if eof  then
      begin
        if frm_botoesListagensAtdo <> nil then
          frmDialogo.ExibirMensagem ('Não foram encontrados produtos      em promoção na loja!'
            ,'Vendas',[mbOK]
            ,frm_principal.x_pathimg+'iconeerro.bmp',250,200);
        exit;
      end;

      FGridCons(QueryProm,'Consulta Rápida de Produtos em Promoção no Estoque da Loja',false,-1,false,true,'Referencia,Descricao,pp_concr,Concorrente,Vencimento,emissao,dias',FGridPromDrawColumnCell,false);
      FGridCons(QueryConcr,'Preços Referentes a Concorrência',false,1,true);
    end;
  finally
    colorgridcons     := 'clBlack';
    colorfontgridcons := 'ClWindow';
  end;



//  if (frm_botoesListagensAtdo = nil) then

end;

procedure Tfrm_principal.QueryPromCalcFields(DataSet: TDataSet);
begin
  if QueryProm.fieldbyname('pp_concr').asfloat <= 0 then
    QueryProm.fieldbyname('NPesq').asstring := 'S/N'
  else
    QueryProm.fieldbyname('NPesq').asstring := formatfloat('00000000',QueryProm.fieldbyname('pp_concr').asfloat);


  if QueryProm.fieldbyname('ip_pre1').asfloat > 0 then
    QueryProm.fieldbyname('valorvenda').asfloat := QueryProm.fieldbyname('ip_pre1').asfloat
  else
    QueryProm.fieldbyname('valorvenda').asfloat := QueryProm.fieldbyname('es_pve1').asfloat;

  if QueryProm.fieldbyname('valorvenda').asfloat > 0 then
    QueryProm.fieldbyname('percvenda').asfloat := (1 - QueryProm.fieldbyname('Vl_Promocional').asfloat/QueryProm.fieldbyname('valorvenda').asfloat) * 100
end;

procedure Tfrm_principal.QueryConcrCalcFields(DataSet: TDataSet);
begin
  if not QueryProm.Active then
    exit;

  if (QueryProm.fieldbyname('ValorVenda').asfloat > 0) then
  begin
    QueryConcr.fieldbyname('percprecvend').asfloat := (QueryConcr.fieldbyname('Preco').asfloat - QueryProm.fieldbyname('ValorVenda').asfloat)/QueryProm.fieldbyname('ValorVenda').asfloat * 100;
    QueryConcr.fieldbyname('percprecvend').asstring := iifs(QueryConcr.fieldbyname('percprecvend').asfloat < 0,'(-) ','(+) ')+
      formatfloat('0.00',Abs(QueryConcr.fieldbyname('percprecvend').asfloat));
  end;

  if QueryProm.fieldbyname('Vl_Promocional').asfloat > 0 then
  begin
    QueryConcr.fieldbyname('percprecpro').asfloat := (QueryConcr.fieldbyname('Preco').asfloat - QueryProm.fieldbyname('Vl_Promocional').asfloat)/QueryProm.fieldbyname('Vl_Promocional').asfloat * 100;
    QueryConcr.fieldbyname('percprecpro').asstring := iifs(QueryConcr.fieldbyname('percprecpro').asfloat < 0,'(-) ','(+) ')+
      formatfloat('0.00',Abs(QueryConcr.fieldbyname('percprecpro').asfloat));
  end;
end;

procedure Tfrm_principal.Label4Click(Sender: TObject);
var
  i:Word;
  SR: TSearchRec;
  Count:Word;
  FArq:String;
begin
  frm_mapa := TFrm_Mapa.Create(Application);
  FArq := funcoesglobais.CaminhoExtensao(ExtractFilePath(Application.ExeName)+'Mapa.',['.jpeg','.jpg','.bmp','.gif']);
  if FArq <> '' then
    frm_mapa.Image1.Picture.LoadFromFile(FArq);
  frm_mapa.ScrollBox1.VertScrollBar.Range := frm_mapa.Image1.Height + 50;
  frm_mapa.ShowModal;
end;

function Tfrm_principal.fuf: String;
var
  claux:TClassAuxiliar;
begin
  try
    result := '';
    clAux := TClassAuxiliar.Create;
    clAux.conect   (databasecredito,frm_principal);
    clAux.ClearSql;
    clAux.AddParam ('SELECT * FROM CRELOJA     ');
    clAux.AddParam ('WHERE (LO_CODI=:codigo)    ');
    clAux.consulta.parambyname('codigo').AsFloat   := x_loja;
    clAux.Execute;

    if claux.result('LO_ESTA') <> '' then
      result := claux.result('LO_ESTA')
    else
      result := x_uf;
  finally
    if result = '' then
      Result := 'RJ';
    clAux.desconect;
    clAux.Free;
  end;
end;


procedure Tfrm_principal.FGridPromDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (queryprom.fieldbyname('Vencimento').AsDateTime <=  x_data_trabalho) then
  begin
    if (gdSelected in state) and (TForm(TDbGrid(Sender).Owner).activecontrol = TDbGrid(Sender)) then
      TDbGrid(Sender).Canvas.Font.Color := ClWindow
    else
      TDbGrid(Sender).Canvas.Font.Color := clRed;
//    TDbGrid(Sender).DefaultDrawColumnCell(Rect,Datacol,Column,State);
  end
  else
  if queryprom.fieldbyname('Emissao').AsDateTime >  x_data_trabalho then
    TDbGrid(Sender).Canvas.Font.Color := clBlack;


  TDbGrid(Sender).DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;

procedure Tfrm_principal.GravaConfigLocal;
begin
//
end;

procedure Tfrm_principal.ChamandoAtualizarBancoDeDados(Fconf:Boolean=false);
var
  clAtualizaVersao : TClassAuxiliar;
begin
  if Fconf or MensConf ('Confirma atualização do banco de dados?') then
  begin
         //*******************************************************************************8
    clAtualizaVersao := TClassAuxiliar.Create;
    clAtualizaVersao.conect   ('VENDAS',self);
    clAtualizaVersao.ClearSql;
    clAtualizaVersao.AddParam ('UPDATE CONF SET VERSAO_SISTEMA=:versao_sistema ');
    clAtualizaVersao.consulta.parambyname('versao_sistema').AsDateTime := strtodate('01/01/1900');
    clAtualizaVersao.Execute;
    clAtualizaVersao.desconect;
    clAtualizaVersao.Free;

         //*******************************************************************************8
    frm_principal.AjustaBancoDeDadosVendas;
  end;
end;

procedure Tfrm_principal.imgSindilojasClick(Sender: TObject);
begin
  HlinkNavigateString(nil, 'http://www.sindilojas-rio.com.br');
end;

procedure Tfrm_principal.VerificaProtecaoDoSistema;
var
  clAux,clAux2: TClassAuxiliar;
  flagVerificaProtecao: Boolean;
  data_cobranca: TDateTime;
  data_hoje: TDateTime;
  posicao,dia_cobranca: Integer;
  i,Year,Month,Day: Word;
  Month_aux,Year_aux: Word;
  codigo,chave_secreta: String;
  chave_calculada: String;
  continua: Boolean;
  tentativas: Integer;
  difdia: Real;
begin
  flagVerificaProtecao := false; {*} // o DEFAULT é desatualizado

  //VerificaSeguranca(x_empresa);

  //1. - VERIFICACAO: "ANALISE DO CLIENTE. PROTEGE OU NAO?"
  if (Pos('KIK',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('SILHUETA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('CALCADOS & CIA',UpperCase(frm_principal.x_empresa))>0) or
          (Pos('CALÇADOS & CIA',UpperCase(frm_principal.x_empresa))>0) or
          (Pos('GILTEX',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := true {*}
   // flagVerificaProtecao := false {*}
  else if (Pos('TEREZINHA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('EMPRESA TESTE',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := true {*}
  else if (Pos('GIZA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('GUTH',UpperCase(frm_principal.x_empresa))>0)
          or
          (Pos('GUTH MODAS',UpperCase(frm_principal.x_empresa))>0)
          then
    flagVerificaProtecao := false
  else if (Pos('THAFELIE',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('DANTAS',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false {*}
  else if (Pos('AGM',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('VARADERO MODAS LTDA',UpperCase(frm_principal.x_empresa))>0) or
          (Pos('VARADERO MODAS LTDA.',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := true {*}
  else if (Pos('CALÇADOS MODELO',UpperCase(frm_principal.x_empresa))>0) or
          (Pos('CALCADOS MODELO',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('GILEADE',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('MAROMBA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if ((Pos('ACUPUNTURA',UpperCase(frm_principal.x_empresa))>0)) or ((Pos('ACUPUNTURA CENTER',UpperCase(frm_principal.x_empresa))>0)) then
    flagVerificaProtecao := false
  else if (Pos('SHOWA COSMETICOS',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('MARINA MORENA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('CASA OLIVEIRA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('VOX POPULI',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('BEEFITING',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('KEEP CAR',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('TRIJOB',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('GILSON MARTINS',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('PETIT BALLET',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('QUALI OTICA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('BIA CALCADOS',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('GENTE PEQUENA',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('ANDRE SCALERCIO',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if (Pos('AGITO DOS PES',UpperCase(frm_principal.x_empresa))>0) then
    flagVerificaProtecao := false
  else if ( (Pos('G&L',UpperCase(frm_principal.x_empresa))>0) ) or ((Pos('GEL',UpperCase(frm_principal.x_empresa))>0)) then
    flagVerificaProtecao := False;

  if (flagVerificaProtecao) then
  begin
    //VERIFICA SE O SISTEMA ESTA DEFINITIVAMENTE 'BLOQUEADO'
    clAux := TClassAuxiliar.Create;
    clAux.conect   ('VENDAS',self);
    clAux.ClearSql;
    clAux.AddParam ('SELECT COD FROM VENDAS_PROT');
    try
      //continua := true;
      clAux.Execute;
      continua := false;
      showmessage ('Sistema bloqueado por ultrapassar nº de tentativas ao informar a chave de desbloqueio!');
      showmessage ('Entre em contato com o suporte para proceder com o desbloqueio!');
      clAux.desconect;
      clAux.Free;
      Application.Terminate;
    except
      continua := true;
    end;

    if (continua) then
    begin
      //SIM
      //2. - VERIFICACAO:"QUAL O DIA X DO CLIENTE?"
      if (Pos('KIK',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('SILHUETA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('CALCADOS & CIA',UpperCase(frm_principal.x_empresa))>0) or
              (Pos('CALÇADOS & CIA',UpperCase(frm_principal.x_empresa))>0) or
              (Pos('GILTEX',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 15 {*}
      else if (Pos('TEREZINHA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('EMPRESA TESTE',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0 {*}
      else if (Pos('GIZA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('GUTH',UpperCase(frm_principal.x_empresa))>0)
               or
              (Pos('GUTH MODAS',UpperCase(frm_principal.x_empresa))>0)
              then
        dia_cobranca := 0
      else if (Pos('THAFELIE',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('DANTAS',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0 {*}
      else if (Pos('AGM',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('VARADERO MODAS LTDA',UpperCase(frm_principal.x_empresa))>0) or
              (Pos('VARADERO MODAS LTDA.',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 10 {*}
      else if (Pos('CALÇADOS MODELO',UpperCase(frm_principal.x_empresa))>0) or
              (Pos('CALCADOS MODELO',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('GILEADE',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('MAROMBA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if ((Pos('ACUPUNTURA',UpperCase(frm_principal.x_empresa))>0)) or ((Pos('ACUPUNTURA CENTER',UpperCase(frm_principal.x_empresa))>0)) then
        dia_cobranca := 0
      else if (Pos('SHOWA COSMETICOS',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('MARINA MORENA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('CASA OLIVEIRA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('BEEFITING',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('VOX POPULI',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('KEEP CAR',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('TRIJOB',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('GILSON MARTINS',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0 //5
      else if (Pos('PETIT BALLET',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0 //10
      else if (Pos('QUALI OTICA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('BIA CALCADOS',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('GENTE PEQUENA',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if (Pos('ANDRE SCALERCIO',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0 //5
      else if (Pos('AGITO DOS PES',UpperCase(frm_principal.x_empresa))>0) then
        dia_cobranca := 0
      else if ( (Pos('G&L',UpperCase(frm_principal.x_empresa))>0) ) or ((Pos('GEL',UpperCase(frm_principal.x_empresa))>0)) then
        dia_cobranca := 0;


      //3. - VERIFICACAO:"EXISTE O ARQPROT?"
      clAux := TClassAuxiliar.Create;
      clAux.conect   ('VENDAS',self);
      clAux.ClearSql;
      clAux.AddParam ('SELECT MES FROM ARQ_PROT');
      try
        clAux.Execute;
      except
        //4. - ACAO: "CRIA-SE O ARQPROT!"
        clAux.ClearSql;
        clAux.AddParam ('CREATE TABLE ARQ_PROT (MES INTEGER,ANO INTEGER,CODIGO VARCHAR(8),CHAVESECRETA VARCHAR(100),TRIES SMALLINT) ');
        clAux.Execute;
      end;

      //5. - VERIFICACAO:"HOJE É ANTES OU DEPOIS DE X?"
      //data_hoje     := VerificaDataDeTrabalho; {* - criterio pela data do ultimo CAIXA ENCERRADO}
      data_hoje       := frm_principal.x_data_trabalho; //por enquanto, vai ficar a data de trabalho 'mesmo'
      DecodeDate (data_hoje,Year,Month,Day);
      data_cobranca   := strtodate(form_nz(dia_cobranca,2)+'/'+form_nz(Month,2)+'/'+form_nz(Year,4));

      {...}
      if (data_hoje<=data_cobranca) then
      begin
        //ANTES DE X
        if (Month>=2) then
          Month := Month - 1
        else
        begin
          Month := 12;
          Year  := Year - 1;
        end;
      end
      else
      begin
        //DEPOIS DE X
        //É o mes corrente!
        Month := Month;
        Year  := Year;
      end;

      difdia := data_hoje - data_cobranca; {*}

      //6. - VERIFICACAO:"EXISTE REGISTRO EM ARQ_PROT PARA O MES DE AUTENTICACAO?"
      clAux.ClearSql;
      clAux.AddParam ('SELECT CODIGO,CHAVESECRETA,TRIES ');
      clAux.AddParam ('FROM   ARQ_PROT                  ');
      clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)  ');
      clAux.consulta.parambyname('MES').AsInteger := Month;
      clAux.consulta.parambyname('ANO').AsInteger := Year;
      if (not clAux.Execute) then
      begin
        if (difdia<=0) or //para MES ANTERIOR
           (difdia>5) then //para o MES CORRENTE
        begin
          //9. - ACAO:"GRAVANDO O REGISTRO DE AUTENTICACAO NO ARQ_PROT"
          clAux.ClearSql;
          clAux.AddParam ('INSERT INTO ARQ_PROT (MES,ANO,CODIGO,CHAVESECRETA,TRIES) ');
          clAux.AddParam ('VALUES (:MES,:ANO,:CODIGO,:CHAVESECRETA,:TRIES)          ');
          clAux.consulta.parambyname('MES').AsInteger         := Month;
          clAux.consulta.parambyname('ANO').AsInteger         := Year;
          clAux.consulta.parambyname('CODIGO').AsString       := '00000101';
          clAux.consulta.parambyname('CHAVESECRETA').AsString := '?';
          clAux.consulta.parambyname('TRIES').AsInteger       := 0;
          clAux.Execute;

          {...}
          Application.CreateForm(Tfrm_AlertaProtecao, frm_AlertaProtecao);
          frm_AlertaProtecao.lblLicenca.caption := UpperCase(nome_mes(Month))+' / '+form_nz(Year,4);
          frm_AlertaProtecao.lblCodigo.caption  := codigo;
          //pausa para manha
          frm_AlertaProtecao.lblaviso1.Caption  := '';

          frm_AlertaProtecao.showmodal;
          if (frm_AlertaProtecao.tecla=13) then
          begin
            //chave informada pelo USUARIO
            chave_secreta := trim(frm_AlertaProtecao.edtChave1.text);

            posicao := 5;
            codigo  := ConverteDecimalBinario(posicao);
            chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));
            chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));

            //7. - VERIFICACAO:"SE ACERTOU O CODIGO DE SEGURANCA?"
            if (chave_secreta=chave_calculada) then
            begin
              //12. - SISTEMA LIBERADO --
              clAux.ClearSql;
              clAux.AddParam ('UPDATE ARQ_PROT                   ');
              clAux.AddParam ('SET    CHAVESECRETA=:CHAVESECRETA ');
              clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)   ');
              clAux.consulta.parambyname('MES').AsInteger         := Month;
              clAux.consulta.parambyname('ANO').AsInteger         := Year;
              clAux.consulta.parambyname('CHAVESECRETA').AsString := chave_secreta;
              clAux.Execute;
            end
            else
            begin
              //1a. tentativa errada ---
              clAux.ClearSql;
              clAux.AddParam ('UPDATE ARQ_PROT                 ');
              clAux.AddParam ('SET    TRIES=:TRIES             ');
              clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO) ');
              clAux.consulta.parambyname('MES').AsInteger   := Month;
              clAux.consulta.parambyname('ANO').AsInteger   := Year;
              clAux.consulta.parambyname('TRIES').AsInteger := 1;
              clAux.Execute;

              //NAO
              //ACAO: "AVISO DE SAIDA DO SISTEMA"
              showmessage ('Chave de desbloqueio incorreta! O sistema será abortado!');

              clAux.desconect;
              clAux.Free;
              Application.Terminate;
            end;
          end
          else
          if (frm_AlertaProtecao.tecla=27) then
          begin
              if Tem_Debito = 'S'
              then bloquear_sistema_mistral;
            showmessage ('O sistema será abortado!');
            clAux.desconect;
            clAux.Free;
            Application.Terminate;
          end;
          frm_AlertaProtecao.Free;
        end
        else
        if (difdia>0) and (difdia<=5) and (dia_cobranca > 0) then //PARA O MES CORRENTE, E ANTES DA DATA DE EXPIRACAO
        begin
          //SOMENTE TELA DE AVISO
          frm_AlertaGeral.Memo1.lines.Clear;
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('      O DIREITO DE USO DESTE SISTEMA ');
          frm_AlertaGeral.Memo1.lines.Add ('      VAI EXPIRAR EM '+form_data(data_cobranca+5)+'.');
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('      FAVOR ENTRAR EM CONTATO COM O EMAIL');
          frm_AlertaGeral.Memo1.lines.Add ('      financeiro@mistralsistemas.com.br ');
          frm_AlertaGeral.Memo1.lines.Add ('      PARA OBTER A CHAVE DE LIBERAÇÃO. ');
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('   ');
          frm_AlertaGeral.Memo1.lines.Add ('      OBRIGADO.');
          frm_AlertaGeral.ShowModal;
        end;
      end
      else
      begin
        //SIM
        chave_secreta   := clAux.result('CHAVESECRETA'); // + '?';

        {...}
        if (Trim(chave_secreta)='?') then //ja foi exibido o ALERTA pelo menos UMA VEZ
        begin
          tentativas := clAux.result('TRIES'); //TENTATIVAS ATE O MOMENTO
          if (tentativas=8) then //ATINGIU O LIMITE PERMITIDO
          begin
            //CRIANDO O ARQUIVO DE 'BLOQUEIO'
            clAux.ClearSql;
            clAux.AddParam ('CREATE TABLE VENDAS_PROT (COD SMALLINT) ');
            clAux.Execute;

            showmessage ('Sistema bloqueado por ultrapassar nº de tentativas ao informar a chave de desbloqueio!');
            showmessage ('Entre em contato com o suporte para proceder com o desbloqueio!');
            clAux.Desconect;
            clAux.Free;
            Application.Terminate;
          end
          else
          begin
            {...}
            Application.CreateForm(Tfrm_AlertaProtecao, frm_AlertaProtecao);
            frm_AlertaProtecao.lblLicenca.caption := UpperCase(nome_mes(Month))+' / '+form_nz(Year,4);
            frm_AlertaProtecao.lblCodigo.caption  := codigo;
            frm_AlertaProtecao.ShowModal;
            if (frm_AlertaProtecao.tecla=13) then
            begin
              //chave informada pelo USUARIO
              chave_secreta := trim(frm_AlertaProtecao.edtChave1.text);

              posicao := 5;
              codigo  := ConverteDecimalBinario(posicao);
              chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));
              chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));

              //7. - VERIFICACAO:"SE ACERTOU O CODIGO DE SEGURANCA?"
              if (chave_secreta=chave_calculada) then
              begin
                //12. - SISTEMA LIBERADO --
                clAux.ClearSql;
                clAux.AddParam ('UPDATE ARQ_PROT                    ');
                clAux.AddParam ('SET    CHAVESECRETA=:CHAVESECRETA, ');
                clAux.AddParam ('       TRIES=:TRIES                ');
                clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)    ');
                clAux.consulta.parambyname('MES').AsInteger         := Month;
                clAux.consulta.parambyname('ANO').AsInteger         := Year;
                clAux.consulta.parambyname('CHAVESECRETA').AsString := chave_secreta;
                clAux.consulta.parambyname('TRIES').AsInteger       := tentativas + 1;
                clAux.Execute;
              end
              else
              begin
                //1a. tentativa errada ---
                clAux.ClearSql;
                clAux.AddParam ('UPDATE ARQ_PROT                 ');
                clAux.AddParam ('SET    TRIES=:TRIES             ');
                clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO) ');
                clAux.consulta.parambyname('MES').AsInteger   := Month;
                clAux.consulta.parambyname('ANO').AsInteger   := Year;
                clAux.consulta.parambyname('TRIES').AsInteger := tentativas + 1;
                clAux.Execute;

                //NAO
                //ACAO: "AVISO DE SAIDA DO SISTEMA"
                showmessage ('Chave de desbloqueio incorreta! O sistema será encerrado!');
                clAux.desconect;
                clAux.Free;
                Application.Terminate;
              end;
            end
            else
            if (frm_AlertaProtecao.tecla=27) then
            begin
              if Tem_Debito = 'S'
              then bloquear_sistema_mistral;
              showmessage ('O sistema será encerrado!');
              clAux.desconect;
              clAux.Free;
              Application.Terminate;
            end;
            frm_AlertaProtecao.Free;
          end;
        end
        else
        begin
          //11. - VERIFICACAO:"O REGISTRO É AUTENTICO?" - DETECCAO DE CORRUPCAO
          codigo := clAux.result('CODIGO');
          if (trim(codigo)='') then
          begin
            //NAO
            clAux.ClearSql;
            clAux.AddParam ('UPDATE ARQ_PROT                   ');
            clAux.AddParam ('SET    CODIGO=:CODIGO,            ');
            clAux.AddParam ('       CHAVESECRETA=:CHAVESECRETA ');
            clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)   ');
            clAux.consulta.parambyname('MES').AsInteger         := Month;
            clAux.consulta.parambyname('ANO').AsInteger         := Year;
            clAux.consulta.parambyname('CHAVESECRETA').AsString := '?';
            clAux.consulta.parambyname('CODIGO').AsString       := '00000101';
            clAux.Execute;

            //14. - VOLTA-SE PARA O INICIO EM '1.' - RECURSIVIDADE
            VerificaProtecaoDoSistema; {chamada recursiva}
          end
          else
          begin
            try
              posicao  := ConverteBinarioDecimal(codigo);
              continua := true;
            except
              continua := false;

              clAux.ClearSql;
              clAux.AddParam ('UPDATE ARQ_PROT                   ');
              clAux.AddParam ('SET    CODIGO=:CODIGO,            ');
              clAux.AddParam ('       CHAVESECRETA=:CHAVESECRETA ');
              clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)   ');
              clAux.consulta.parambyname('MES').AsInteger          := Month;
              clAux.consulta.parambyname('ANO').AsInteger          := Year;
              clAux.consulta.parambyname('CHAVESECRETA').AsString  := '?';
              clAux.consulta.parambyname('CODIGO').AsString        := '00000101';
              clAux.Execute;

              //14. - VOLTA-SE PARA O INICIO EM '1.' - RECURSIVIDADE
              VerificaProtecaoDoSistema; {chamada recursiva}
            end;
            if (continua) then
            begin
              chave_calculada := trim(CalculaChaveSecreta (posicao,frm_principal.x_empresa,Month,Year,false));

              //para verificar chave corrente
             //  ShowMessage('LICENSA: ' + chave_calculada);

              if (chave_secreta=chave_calculada) then
                //SIM- chave é autentica
                //12. - SISTEMA LIBERADO --
              else
              begin
                //NAO
                clAux.ClearSql;
                clAux.AddParam ('UPDATE ARQ_PROT                   ');
                clAux.AddParam ('SET    CODIGO=:CODIGO,            ');
                clAux.AddParam ('       CHAVESECRETA=:CHAVESECRETA ');
                clAux.AddParam ('WHERE (MES=:MES) AND (ANO=:ANO)   ');
                clAux.consulta.parambyname('MES').AsInteger          := Month;
                clAux.consulta.parambyname('ANO').AsInteger          := Year;
                clAux.consulta.parambyname('CHAVESECRETA').AsString  := '?';
                clAux.consulta.parambyname('CODIGO').AsString        := '00000101';
                clAux.Execute;

                //14. - VOLTA-SE PARA O INICIO EM '1.' - RECURSIVIDADE
                VerificaProtecaoDoSistema; {chamada recursiva}
              end;
            end;
          end;
        end;
      end;
      clAux.Desconect;
      clAux.Free;
    end;
  end;
end;

procedure Tfrm_principal.bloquear_sistema_mistral;
var
  clAux10: TClassAuxiliar;
begin
    clAux10 := TClassAuxiliar.Create;
    clAux10.conect   ('VENDAS',self);
    clAux10.ClearSql;
    clAux10.AddParam('UPDATE CONF SET EMPRESA=:FLAG');
    clAux10.AddParam('WHERE EMPRESA IS NULL');
    clAux10.consulta.ParamByName('FLAG').AsString := '';
    clAux10.Execute;
    clAux10.desconect;
    clAux10.Free;

    Application.CreateForm(Tfrm_ALERTA,frm_ALERTA);
    frm_ALERTA.Memo1.lines.clear;
    frm_ALERTA.Memo1.lines.Add('                                       ');
    frm_ALERTA.Memo1.lines.Add('          SISTEMA BLOQUEADO!           ');
    frm_ALERTA.Memo1.lines.Add('                                       ');
    frm_ALERTA.Memo1.Font.Size:= 25;
    frm_ALERTA.showmodal;
    frm_ALERTA.Free;

   //frmDialogo.ExibirMensagem ('Sistema bloqueado!',
  //      'Mistral Sistemas',[mbOk],frm_principal.x_pathimg+'iconeerro.bmp', 250,200);
    Application.Terminate;
end;

procedure Tfrm_principal.LERPARAMETROSNFE;
var
    ArqIni : TIniFile;
 Begin
  Try
    ArqIni := TIniFile.Create('C:\MistralNF\VendasNFE.Ini');
  Except
  on E:Exception do
      begin
        MessageDlg('Erro ao conectar!'#13'Erro: ' + e.Message, mtError, [mbOK], 0);
        Abort;
      end;
  end;

    // ENVIO
    AMB_TP     := ArqINI.ReadInteger('CONFIGURACOES','TPAMB',AMB_TP);
    MISTRAL_MSG := ArqIni.ReadInteger('CONFIGURACOES','MISTRAL_MSG',MISTRAL_MSG);
    AMB_ONLINE  := ArqIni.ReadInteger ('CONFIGURACOES','ONLINE',AMB_ONLINE);     

    MOD_NFE:= ArqIni.ReadInteger('CONFIGURACOES','MOD_NFE',MOD_NFE);
    MOD_NFCE:= ArqIni.ReadInteger('CONFIGURACOES','MOD_NFCE',MOD_NFCE);

    CSC_ID_TESTE:= ArqIni.ReadString('CSCTESTE','CSC_ID_TESTE',CSC_ID_TESTE);
    CSC_TOKEN_TESTE:= ArqIni.ReadString('CSCTESTE','CSC_TOKEN_TESTE',CSC_TOKEN_TESTE);

    CSC_ID_PRODUCAO:= ArqIni.ReadString('CSCPRODUCAO','CSC_ID_PRODUCAO',CSC_ID_PRODUCAO);
    CSC_TOKEN_PRODUCAO:= ArqIni.ReadString('CSCPRODUCAO','CSC_TOKEN_PRODUCAO',CSC_TOKEN_PRODUCAO);

    ArqINI.Free;

end;

end.
