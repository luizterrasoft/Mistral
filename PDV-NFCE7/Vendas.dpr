program Vendas;

{%ToDo 'Vendas.todo'}

uses
  Forms,
  un_LancaVenda in 'un_LancaVenda.pas' {frm_LancaVenda},
  funcoes1 in 'funcoes1.pas',
  Funcoes2 in 'funcoes2.pas',
  unMensagem in 'unMensagem.pas' {frm_mensagem},
  procura in 'procura.pas',
  loja in 'classes\loja.pas',
  venda in 'venda.pas',
  auxiliar in 'classes\auxiliar.pas',
  f8GruposProdutos in 'GruposProdutos\f8GruposProdutos.pas' {frm_F8GruposProdutos},
  f8SubGrupos in 'GruposProdutos\f8SubGrupos.pas' {frm_F8SubGrupos},
  DM1 in 'Datamodules\DM1.pas' {DMF8: TDataModule},
  grupos_produtos in 'classes\grupos_produtos.pas',
  f8Produtos2 in 'Produtos\f8Produtos2.pas' {frm_F8Produtos2},
  produtos in 'classes\produtos.pas',
  un_F8Faixas in 'Tamanhos\un_F8Faixas.pas' {frm_F8Faixas},
  cores in 'classes\cores.pas',
  unDialogo in 'unDialogo.pas' {frmDialogo},
  DM2 in 'Datamodules\DM2.pas' {DMCaixa: TDataModule},
  un_EscolheFormaPgto in 'un_EscolheFormaPgto.pas' {frm_EscolheFormaPgto},
  vendedores in 'CLASSES\vendedores.pas',
  un_ConsultaProdutos in 'Produtos\un_ConsultaProdutos.pas' {frm_ConsultaProduto},
  f8Forn in 'Forn\f8Forn.pas' {frm_F8Forn},
  un_ExcVenda in 'un_ExcVenda.pas' {frm_ExcVenda},
  un_F8CFOP in 'NFENFCE\un_F8CFOP.pas' {frm_F8CFOP},
  un_F8Sit in 'Produtos\un_F8Sit.pas' {frm_F8Sit},
  f8Clientes in 'Cliente\f8Clientes.pas' {frm_f8Clientes},
  aux2Contrato in 'Cliente\aux2Contrato.pas' {frm_aux2Contrato},
  aux3Contrato in 'Cliente\aux3Contrato.pas' {frm_Aux3Contrato},
  aux4Contrato in 'Cliente\aux4Contrato.pas' {frm_Aux4Contrato},
  aux4Contrato_demo in 'Cliente\aux4Contrato_demo.pas' {frm_Aux4Contrato_demo},
  cadcli in 'Cliente\CADCLI.PAS' {frm_edtCliente},
  f8Avalista in 'Cliente\f8Avalista.pas' {frm_f8Avalistas},
  aux1Contrato in 'Cliente\aux1Contrato.pas' {frm_aux1Contrato},
  cheques in 'CLASSES\CHEQUES.PAS',
  cliente in 'CLASSES\CLIENTE.PAS',
  contratos in 'CLASSES\contratos.pas',
  f8planos in 'Cliente\F8PLANOS.PAS' {frm_f8Planos},
  F8Lojas in 'Cliente\F8Lojas.pas' {frm_F8Lojas},
  f8Port in 'Cliente\f8Port.pas' {frm_f8Port},
  prestcontrato in 'CLASSES\prestcontrato.pas',
  prestacoes in 'CLASSES\prestacoes.pas',
  Rl_tite in 'Cliente\Rl_tite.pas' {frm_rl_tite},
  mem_prnt in 'Cliente\MEM_PRNT.PAS' {frm_mem_print},
  DM4 in 'Datamodules\DM4.PAS' {DMcontrato: TDataModule},
  unEmissCarnet2 in 'Cliente\unEmissCarnet2.pas' {frm_EmisCarnet2},
  unConsCheq in 'Cliente\unConsCheq.pas' {frm_ConsCheq},
  unImpressoras in 'Cliente\unImpressoras.pas' {frm_impressoras},
  credito in 'Cliente\CREDITO.PAS',
  plano in 'CLASSES\PLANO.PAS',
  un_frmConsulta1 in 'Cliente\un_frmConsulta1.pas' {frm_Consulta1},
  chequesdev in 'CLASSES\chequesdev.pas',
  chequespg in 'CLASSES\chequespg.pas',
  chequesdvpg in 'CLASSES\chequesdvpg.pas',
  unPropostaCredito in 'Cliente\unPropostaCredito.pas' {frm_PropostaCredito},
  unVersoPropostaCredito in 'Cliente\unVersoPropostaCredito.pas' {frm_VersoProposta},
  Cf_tbl in 'Cliente\CF_TBL.PAS',
  relat in 'Cliente\RELAT.PAS',
  portador in 'CLASSES\PORTADOR.PAS',
  DM3 in 'Datamodules\DM3.PAS' {DMperm: TDataModule},
  unPosFinanc in 'Cliente\unPosFinanc.pas' {frm_PosFinanc},
  unLancReceb2OffLine in 'Cliente\unLancReceb2OffLine.pas' {frm_LancReceb2OffLine},
  DM5 in 'Datamodules\DM5.PAS' {DMAtualizReceb: TDataModule},
  prestcontratolote in 'CLASSES\prestcontratolote.pas',
  unAux1LancReceb in 'Cliente\unAux1LancReceb.pas' {frm_Aux1LancReceb},
  unLancReceb in 'Cliente\unLancReceb.pas' {frm_LancReceb},
  unReabreDocumento in 'Cliente\unReabreDocumento.pas' {frm_ReabreDocumento},
  DM7 in 'Datamodules\DM7.PAS' {DMBaixAutCheq: TDataModule},
  unRegManContSpc in 'Cliente\unRegManContSpc.pas' {frm_RegManContSPC},
  DM9 in 'Datamodules\DM9.PAS' {DMRegAutSpc: TDataModule},
  unReabManContSpc in 'Cliente\unReabManContSpc.pas' {frm_ReabManContSPC},
  un_VerDadosPgto in 'un_VerDadosPgto.pas' {frm_VerDadosPgto},
  unProbIniciar in 'unProbIniciar.pas' {frm_ProbIniciar},
  un_abresessao in 'un_abresessao.pas' {frm_AbreSessao},
  un_MudarSituacao in 'un_MudarSituacao.pas' {frm_MudarSituacao},
  un_fecharsessao in 'un_fecharsessao.pas' {frm_FecharSessao},
  un_funcoesGaveta in 'un_funcoesGaveta.pas' {frm_funcoesGaveta},
  un_funcoesImpressora in 'un_funcoesImpressora.pas' {frm_funcoesImpressora},
  un_F8Adm in 'Administradoras\un_F8Adm.pas' {frm_F8Adm},
  un_senhaCaixa in 'Caixa\un_senhaCaixa.pas' {frm_senhaCaixa},
  un_MudarSeqVenda in 'un_MudarSeqVenda.pas' {frm_MudarSeqVenda},
  un_MudarLoja in 'un_MudarLoja.pas' {frm_MudarLoja},
  f8Users in 'f8Users.pas' {frm_f8Users},
  unSenha in 'unSenha.pas' {frmSenha},
  unEntrada in 'unEntrada.pas' {frm_entrada},
  un_F8FormaPgto2 in 'Formas\un_F8FormaPgto2.pas' {frm_F8FormaPgto2},
  f8Bancos in 'Bancos\f8Bancos.pas' {frm_F8Bancos},
  DM16 in 'Datamodules\DM16.pas' {DMmaxicod: TDataModule},
  un_DadosCompCliente in 'Cliente\un_DadosCompCliente.pas',
  un_Auxformulario1 in 'CLASSES\un_Auxformulario1.pas' {frm_Auxformulario1},
  itensestoque in 'CLASSES\itensestoque.pas',
  itensestoqueloja in 'CLASSES\itensestoqueloja.pas',
  un_BotoesOpcoes in 'un_BotoesOpcoes.pas' {frm_BotoesOpcoes},
  un_FechamentoVenda in 'un_FechamentoVenda.pas' {frm_FechamentoVenda},
  un_FechamentoVenda_Cred in 'un_FechamentoVenda_Cred.pas' {frm_FechamentoVenda_Cred},
  un_FechamentoVenda_Cheque in 'un_FechamentoVenda_Cheque.pas' {frm_FechamentoVenda_Cheque},
  un_FechamentoVenda_Cartao in 'un_FechamentoVenda_Cartao.pas' {frm_FechamentoVenda_Cartao},
  un_SinteseVendasPorDia in 'un_SinteseVendasPorDia.pas' {frm_SinteseVendasPorDia},
  un_AjudaComandos in 'un_AjudaComandos.pas' {frm_AjudaComandos},
  unSobre in 'unSobre.pas' {frmSobre},
  un_configLocal in 'un_configLocal.pas' {frm_ConfigLocal},
  cep in '..\Biblioteca_OO\CEP\cep.pas',
  f8Cep in '..\Biblioteca_OO\CEP\f8Cep.pas' {frm_f8Cep},
  un_exibecep in '..\Biblioteca_OO\CEP\un_exibecep.pas' {frm_ExibeCep},
  un_Indexar in 'un_Indexar.pas' {frm_Indexar},
  un_ExportaRetaguarda in 'Movimento\un_ExportaRetaguarda.pas' {frm_ExportaRetaguarda},
  un_ImportaRetaguarda in 'Movimento\un_ImportaRetaguarda.pas' {frm_ImportaRetaguarda},
  un_BotoesECF in 'ECF\un_BotoesECF.pas' {frm_BotoesECF},
  classetxt in '..\Biblioteca_OO\ClasseTxt\classetxt.pas',
  classetxt2 in '..\Biblioteca_OO\ClasseTxt\classetxt2.pas',
  classeExport in '..\Biblioteca_OO\ClasseExport\classeExport.pas',
  Urano1efc in 'ECF\Urano1efc.pas',
  un_BotoesTransf in 'Transferencias\un_BotoesTransf.pas' {frm_BotoesTransf},
  DM8 in 'Datamodules\DM8.pas' {DMEstoque: TDataModule},
  Bematech in 'ECF\Bematech.pas',
  un_DadosAutenticacao in 'un_DadosAutenticacao.pas' {frm_DadosAutenticacao},
  un_ALERTA in 'un_ALERTA.pas' {frm_ALERTA},
  un_BotoesOpcoes_SubMenuVendas in 'un_BotoesOpcoes_SubMenuVendas.pas' {frm_BotoesOpcoes_SubMenuVendas},
  un_SumarioVendas in 'un_SumarioVendas.pas' {frm_SumarioVendas},
  un_ListaVendasAtendimento in 'un_ListaVendasAtendimento.pas' {frm_ListaVendasAtendimento},
  un_MudarTerminal in 'un_MudarTerminal.pas' {frm_MudarTerminal},
  un_MudarECF in 'un_MudarEcf.pas' {frm_MudarECF},
  un_F8CoresProdutos in 'Cores\un_F8CoresProdutos.pas' {frm_F8CoresProdutos},
  un_CancelaVenda in 'un_CancelaVenda.pas' {frm_CancelaVenda},
  DM6 in 'ConsultaVendas\DM6.pas' {DMVendas: TDataModule},
  un_frmConsulta1_Observacao in 'Cliente\un_frmConsulta1_Observacao.pas' {frm_Consulta1_Observacao},
  un_Renegocia in 'Cobranca\un_Renegocia.pas' {frm_Renegocia},
  un_Autentica in 'Cobranca\un_Autentica.pas' {frm_Autentica},
  un_BotoesECF_LeituraMF in 'ECF\un_BotoesECF_LeituraMF.pas' {frm_BotoesECF_LeituraMF},
  un_FechamentoVenda_Vales in 'un_FechamentoVenda_Vales.pas' {frm_FechamentoVenda_Vales},
  un_ResumoConexoes in 'un_ResumoConexoes.pas' {frm_ResumoConexoes},
  un_Exportacao_FTP in '..\Biblioteca_OO\FTP\un_Exportacao_FTP.pas' {frm_ExportaFTP},
  un_Importacao_FTP in '..\Biblioteca_OO\FTP\un_Importacao_FTP.pas' {frm_ImportaFTP},
  darumaFS345 in 'ECF\darumaFS345.pas',
  principal in 'principal.pas' {frm_principal},
  un_ExibeCaixas in 'Caixa\un_ExibeCaixas.pas' {frm_ExibeCaixas},
  un_ExibeCaixas_NovoCaixa in 'Caixa\un_ExibeCaixas_NovoCaixa.pas' {frm_ExibeCaixas_NovoCaixa},
  un_MenuPrincipal_OpcaoCrediario in 'un_MenuPrincipal_OpcaoCrediario.pas' {frm_MenuPrincipal_OpcaoCrediario},
  un_MenuPrincipal_OpcaoCaixa in 'un_MenuPrincipal_OpcaoCaixa.pas' {frm_MenuPrincipal_OpcaoCaixa},
  unDiarEmiCont in 'RelatoriosCrediario\unDiarEmiCont.pas' {frm_DiarEmiCont},
  unDiarPrestAVenc in 'RelatoriosCrediario\unDiarPrestAVenc.pas' {frm_DiarPrestAVenc},
  unPrestRecCli in 'RelatoriosCrediario\unPrestRecCli.pas' {frm_PrestRecCli},
  unDiarioReceb in 'RelatoriosCrediario\unDiarioReceb.pas' {frm_DiarioRecebe},
  unLancReceb2 in 'Cliente\unLancReceb2.pas' {frm_LancReceb2},
  DM15 in 'Datamodules\DM15.PAS' {DMRelatorios: TDataModule},
  un_CaixaLancamentos in 'Caixa\un_CaixaLancamentos.pas' {frm_CaixaLancamentos},
  f8Contas in 'Caixa\f8Contas.pas' {frm_F8Contas},
  un_CaixaLancamentos_F8TipoValor in 'Caixa\un_CaixaLancamentos_F8TipoValor.pas' {frm_CaixaLancamentos_F8TipoValor},
  un_MenuPrincipal_Opcao1 in 'un_MenuPrincipal_Opcao1.pas' {frm_MenuPrincipal_Opcao1},
  un_FechamentoVenda_Adm in 'un_FechamentoVenda_Adm.pas' {frm_FechamentoVenda_Adm},
  dataregis in 'ECF\dataregis.pas',
  un_VendaDeVales in 'un_VendaDeVales.pas' {frm_VendaDeVales},
  un_LancaVenda_InformeVendedor in 'un_LancaVenda_InformeVendedor.pas' {frm_LancaVenda_InformeVendedor},
  un_CaixaLancamentos_Contas in 'Caixa\un_CaixaLancamentos_Contas.pas' {frm_CaixaLancamentos_Contas},
  f8Vend in 'Vendedores\f8Vend.pas' {frm_F8Vend},
  un_ConsultaVenda in 'ConsultaVendas\un_ConsultaVenda.pas' {frm_ConsultaVenda},
  un_Transf_Entrada_Online_Lancamento in 'Transferencias\un_Transf_Entrada_Online_Lancamento.pas' {frm_Transf_Entrada_Online_Lancamento},
  un_ValeMercadoriaFunc_Vale in 'un_ValeMercadoriaFunc_Vale.pas' {frm_ValeMercadoriaFunc_Vale},
  un_BotoesECF_OpcoesLeituraX in 'ECF\un_BotoesECF_OpcoesLeituraX.pas' {frm_BotoesECF_OpcoesLeituraX},
  un_CarnetJatoDeTinta in 'Cliente\un_CarnetJatoDeTinta.pas' {frm_CarnetJatoDeTinta},
  un_CarnetJatoDeTinta2 in 'Cliente\un_CarnetJatoDeTinta2.pas' {frm_CarnetJatoDeTinta2},
  un_Exportacao_Trigger in 'MovimentoCred\un_Exportacao_Trigger.pas' {frm_ExportaTrigger},
  un_Importacao_Trigger in 'MovimentoCred\un_Importacao_Trigger.pas' {frm_ImportaTrigger},
  un_Importacao_FTP_Crediario in 'MovimentoCred\un_Importacao_FTP_Crediario.pas' {frm_ImportaFTP_Crediario},
  aux5Contrato in 'Cliente\aux5Contrato.pas' {frm_Aux5Contrato},
  Urano in 'ECF\Urano.pas',
  un_LancaVenda_AlteraPreco in 'un_LancaVenda_AlteraPreco.pas' {frm_LancaVenda_AlteraPreco},
  un_TrocaVendedorNaVenda in 'un_TrocaVendedorNaVenda.pas' {frm_TrocaVendedorNaVenda},
  un_SuspensaoAtendimento in 'Atendimentos_\un_SuspensaoAtendimento.pas' {frm_SuspensaoAtendimento},
  un_F8MtvSuspensAtdo in 'Atendimentos\un_F8MtvSuspensAtdo.pas',
  un_F8formulario1 in 'CLASSES\un_F8formulario1.pas' {frm_F8formulario1},
  un_CancelaAtendimento in 'Atendimentos\un_CancelaAtendimento.pas' {frm_CancelaAtendimento},
  un_Auxformulario2 in 'CLASSES\un_Auxformulario2.pas' {frm_Auxformulario2},
  un_BotoesManut in 'un_BotoesManut.pas' {frm_BotoesManut},
  un_ValeMercadoriaFunc in 'un_ValeMercadoriaFunc.pas' {frm_ValeMercadoriaFunc},
  un_Transf_Lancamento_Salvar in 'Transferencias\un_Transf_Lancamento_Salvar.pas' {frm_Transf_Lancamento_Salvar},
  un_Transf_Consulta in 'Transferencias\un_Transf_Consulta.pas' {frm_Transf_Consulta},
  un_Transf_MudaSituacao in 'Transferencias\un_Transf_MudaSituacao.pas' {frm_Transf_MudaSituacao},
  un_BotoesMovimento in 'Movimento\un_BotoesMovimento.pas' {frm_BotoesMovimento},
  un_ListaItensEstoque in 'Inventario\un_ListaItensEstoque.pas' {frm_ListaItensEstoque},
  un_inventario1 in 'Inventario\un_inventario1.pas' {frm_inventario1},
  un_ImportarContagem in 'Inventario\un_ImportarContagem.pas' {frm_ImportarContagem},
  un_ExportarContagem in 'Inventario\un_ExportarContagem.pas' {frm_ExportarContagem},
  unAtualizaBd in 'unAtualizaBd.pas' {frm_AtualizaBd},
  un_BotoesInventario in 'Inventario\un_BotoesInventario.pas' {frm_BotoesInventario},
  un_Transf_Entrada_Online in 'Transferencias\un_Transf_Entrada_Online.pas' {frm_Transf_Entrada_Online},
  un_Transf_Lancamento in 'Transferencias\un_Transf_Lancamento.pas' {frm_Transf_Lancamento},
  un_ListaMaisVend2 in 'un_ListaMaisVend2.pas' {frm_ListaMaisVend2},
  un_ListaMaisVend2_Relatorio in 'un_ListaMaisVend2_Relatorio.pas' {frm_ListaMaisVend2_Relatorio},
  un_F8Linhas in 'Linhas\un_F8Linhas.pas' {frm_F8Linhas},
  un_F8Colecoes in 'Colecoes\un_F8Colecoes.pas' {frm_F8Colecoes},
  un_botoesListagensAtdo in 'un_botoesListagensAtdo.pas' {frm_botoesListagensAtdo},
  un_botoesOutrasFuncoes in 'un_botoesOutrasFuncoes.pas' {frm_botoesOutrasFuncoes},
  un_TrocaVendedorNaVenda_EscolhaVendedor in 'un_TrocaVendedorNaVenda_EscolhaVendedor.pas' {frm_TrocaVendedorNaVenda_EscolhaVendedor},
  un_ConsultaVenda_Vendedores in 'ConsultaVendas\un_ConsultaVenda_Vendedores.pas' {frm_ConsultaVenda_Vendedores},
  un_ListaVendas in 'un_ListaVendas.pas' {frm_ListaVendas},
  un_ListaAtendimentos in 'un_ListaAtendimentos.pas' {frm_ListaAtendimentos},
  un_Transf_Acerto_Alteracao in 'Transferencias\un_Transf_Acerto_Alteracao.pas' {frm_Transf_Acerto_Alteracao},
  un_F8FormaPgto3 in 'Cobranca\un_F8FormaPgto3.pas' {frm_F8FormaPgto3},
  un_F8FormaPgto in 'Formas\un_F8FormaPgto.pas' {frm_F8FormaPgto},
  un_CaixaLancamentos_Consulta in 'Caixa\un_CaixaLancamentos_Consulta.pas' {frm_CaixaLancamentos_Consulta},
  un_principal_imagens in 'un_principal_imagens.pas' {frm_principal_imagens},
  unRecCheqDev in 'Cobranca\unRecCheqDev.pas' {frm_RecCheqDev},
  unRelRecCheqDev in 'Cobranca\unRelRecCheqDev.pas' {frm_RelRecCheqDev},
  DM10 in 'Datamodules\DM10.PAS' {DMRecCheqDev: TDataModule},
  un_VisaoPrecosPraticados in 'Produtos\un_VisaoPrecosPraticados.pas' {frm_VisaoPrecosPraticados},
  un_PromocoesAVencer in 'Produtos\un_PromocoesAVencer.pas' {frm_PromocoesAVencer},
  un_configSenhas_Atdo in 'un_configSenhas_Atdo.pas' {frm_configSenhas_Atdo},
  caixa in 'caixa.pas',
  DM20 in 'Datamodules\DM20.pas' {DMLancamentos: TDataModule},
  un_AuxFormularioVendas in 'CLASSES\un_AuxFormularioVendas.pas' {frm_AuxFormularioVendas},
  unSangria in 'Caixa\unSangria.pas' {frmSangria},
  unSangria_Sumario in 'Caixa\unSangria_Sumario.pas' {frmSangria_Sumario},
  unSangria_Motivos in 'Caixa\unSangria_Motivos.pas' {frmSangria_Motivos},
  un_BotoesConfig in 'un_BotoesConfig.pas' {frm_BotoesConfig},
  un_Mapa in 'un_Mapa.pas' {frm_Mapa},
  cupomfiscal in 'ECF\cupomfiscal.pas',
  un_BotoesECF_Aliquotas in 'ECF\un_BotoesECF_Aliquotas.pas' {frm_BotoesECF_Aliquotas},
  un_BotoesConfig_Atdo in 'Atendimentos_\un_BotoesConfig_Atdo.pas' {frm_BotoesConfig_Atdo},
  un_ConfigLocal_Atdo in 'Atendimentos_\un_ConfigLocal_Atdo.pas' {frm_ConfigLocal_Atdo},
  un_MudarSeqAtdo in 'Atendimentos_\un_MudarSeqAtdo.pas' {frm_MudarSeqAtdo},
  un_ExcAtendimento in 'Atendimentos_\un_ExcAtendimento.pas' {frm_ExcAtendimento},
  un_ConfirmaAtendimento in 'Atendimentos_\un_ConfirmaAtendimento.pas' {frm_ConfirmaAtendimento},
  un_LancaAtdo_InformeVendedor in 'Atendimentos_\un_LancaAtdo_InformeVendedor.pas' {frm_LancaAtdo_InformeVendedor},
  un_ConsultaCodigoDeBarras in 'Atendimentos_\un_ConsultaCodigoDeBarras.pas' {frm_ConsultaCodigoDeBarras},
  unSenha_Atdo in 'Atendimentos_\unSenha_Atdo.pas' {frmSenha_Atdo},
  un_LancaAtendimento in 'Atendimentos_\un_LancaAtendimento.pas' {frm_LancaAtendimento},
  un_BotoesOpcoes_Atdo in 'Atendimentos_\un_BotoesOpcoes_Atdo.pas' {frm_BotoesOpcoes_Atdo},
  un_AjudaComandos_Atdo in 'Atendimentos_\un_AjudaComandos_Atdo.pas' {frm_AjudaComandos_Atdo},
  un_SumarioAtdos in 'Atendimentos_\un_SumarioAtdos.pas' {frm_SumarioAtdos},
  un_ConsultaAtendimento in 'Atendimentos_\un_ConsultaAtendimento.pas' {frm_ConsultaAtendimento},
  un_ConfigFuncionamentoDoSistema in 'un_ConfigFuncionamentoDoSistema.pas' {frm_ConfigFuncionamentoDoSistema},
  un_BuscaAtendimento in 'Atendimentos\un_BuscaAtendimento.pas' {frm_BuscaAtendimento},
  un_BotoesOpcoes_Atdo_Suspensao in 'Atendimentos_\un_BotoesOpcoes_Atdo_Suspensao.pas' {frm_BotoesOpcoes_Atdo_Suspensao},
  un_configSenhas in 'un_configSenhas.pas' {frm_configSenhas},
  un_FechamentoVenda_ValeMerc in 'un_FechamentoVenda_ValeMerc.pas' {frm_FechamentoVenda_ValeMerc},
  un_ReabrirAtendimentoSuspenso in 'Atendimentos_\un_ReabrirAtendimentoSuspenso.pas' {frm_ReabrirAtendimentoSuspenso},
  un_ExibeNumeroAtendimento in 'Atendimentos_\un_ExibeNumeroAtendimento.pas' {frm_ExibeNumeroAtendimento},
  GridCons in '..\Geral\GridCons.pas' {Frm_GridCons},
  Un_ConsImpExp in '..\Geral\Consultas\Un_ConsImpExp.pas' {Form1},
  Un_FechamentoCaixa in 'Caixa\Un_FechamentoCaixa.pas' {Frm_FechamentoCaixa},
  Un_MenuPrincipal_OpcaoListaCrediario in 'Un_MenuPrincipal_OpcaoListaCrediario.pas' {frm_MenuPrincipal_OpcaoListaCrediario},
  unConfigLocal2 in '..\Cred5\credito\unConfigLocal2.pas' {frm_ConfigLocal2},
  un_SenhaAdmin in '..\Cred5\credito\un_SenhaAdmin.pas' {frm_SenhaAdmin},
  un_ConfigCobranca in '..\Cred5\credito\un_ConfigCobranca.pas' {frm_ConfigCobranca},
  Un_ConsProdutosEstoque in 'Produtos\Un_ConsProdutosEstoque.pas' {Frm_ConsProdutosEstoque},
  un_senhaSupervisor in 'un_senhaSupervisor.pas' {frm_senhaSupervisor},
  un_SenhaAdministrador in 'un_SenhaAdministrador.pas' {frm_SenhaAdministrador},
  AbreCupomMFD in 'ECF\AbreCupomMFD.pas' {frm_AbreCupomMFD},
  mainf in 'Captura Foto\mainf.pas' {Main},
  dlgaufz in 'Captura Foto\dlgaufz.pas' {DlgVPara},
  DlgTreiber in 'Captura Foto\DlgTreiber.pas' {DlgEinstell},
  aboutx in 'Captura Foto\aboutx.pas' {AboutDlg},
  un_VerProdutos in 'un_VerProdutos.pas' {frm_VerProdutos},
  uDPOSDLL in 'DTEF\uDPOSDLL.pas',
  un_Opcoes_2via in 'un_Opcoes_2via.pas' {frm_Opcoes_2via},
  un_Emissao_Comprovante in 'un_Emissao_Comprovante.pas' {frm_Emissao_Comprovante},
  un_InfBoletaVenda in 'un_InfBoletaVenda.pas' {frm_InfBoletaVenda},
  unPooling in 'CLASSES\unPooling.pas',
  USenhaConfirmacao in 'Cliente\USenhaConfirmacao.pas' {frmSenhaConfirmacao},
  un_RelOrcamento in 'un_RelOrcamento.pas' {frm_RelOrcamento},
  Uf8Comprador in 'Uf8Comprador.pas' {frm_f8Comprador},
  f8Cidade in 'Cliente\f8Cidade.pas' {FrmF8Cidade},
  f8Pais in 'Cliente\f8Pais.pas' {FrmF8Pais},
  unAlertaProtecao in 'unAlertaProtecao.pas' {frm_AlertaProtecao},
  un_AlertaGeral in 'un_AlertaGeral.pas' {frm_AlertaGeral},
  UIdentificaCliente in 'ECF\UIdentificaCliente.pas' {frm_IdentificaCliente},
  un_FrmInfoAdicionais in 'NFENFCE\un_FrmInfoAdicionais.pas' {Frm_InfoAdicionais},
  un_TrataNFENFCE in 'NFENFCE\un_TrataNFENFCE.pas' {frm_TrataNFENFCE},
  AuxiliarNFE in 'NFENFCE\AuxiliarNFE.pas',
  un_FrmCancInutNFE in 'NFENFCE\un_FrmCancInutNFE.pas' {frm_CancInutNFE},
  un_InutilizaNFE in 'NFENFCE\un_InutilizaNFE.pas' {Frm_InutilizaNFE},
  DM30 in 'Datamodules\DM30.pas' {DMNFE: TDataModule},
  un_F8Cores in 'Cores\un_F8Cores.pas' {frm_F8Cores},
  URetornoNfe_AtualizaVenda in 'Nfe\URetornoNfe_AtualizaVenda.pas',
  UVendaNfe in 'Nfe\UVendaNfe.pas',
  URetornoNfe in 'Nfe\URetornoNfe.pas',
  URetornoNfe_CancelaVenda in 'Nfe\URetornoNfe_CancelaVenda.pas';

{$R *.RES}

var
  ind,tot: Integer;

begin
  Application.Initialize;
  Application.Title := 'Vendas';
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(Tfrm_principal_imagens, frm_principal_imagens);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TDlgVPara, DlgVPara);
  Application.CreateForm(TDlgEinstell, DlgEinstell);
  Application.CreateForm(TAboutDlg, AboutDlg);
  Application.CreateForm(Tfrm_VerProdutos, frm_VerProdutos);
  Application.CreateForm(Tfrm_InfBoletaVenda, frm_InfBoletaVenda);
  Application.CreateForm(TFrmF8Cidade, FrmF8Cidade);
  Application.CreateForm(TFrmF8Pais, FrmF8Pais);
  Application.CreateForm(Tfrm_AlertaProtecao, frm_AlertaProtecao);
  Application.CreateForm(Tfrm_AlertaGeral, frm_AlertaGeral);
  Application.CreateForm(Tfrm_IdentificaCliente, frm_IdentificaCliente);
  Application.CreateForm(TFrm_InfoAdicionais, Frm_InfoAdicionais);
  Application.CreateForm(Tfrm_TrataNFENFCE, frm_TrataNFENFCE);
  Application.CreateForm(Tfrm_CancInutNFE, frm_CancInutNFE);
  Application.CreateForm(TFrm_InutilizaNFE, Frm_InutilizaNFE);
  Application.CreateForm(TDMNFE, DMNFE);
  Application.CreateForm(Tfrm_F8Cores, frm_F8Cores);
  if (frm_principal.x_fechar) then
    Application.Terminate
  else
  begin
    Application.CreateForm(Tfrm_entrada, frm_entrada);
    ind:=1;
    tot:=47;
    frm_entrada.gauge1.visible:=false;
    frm_entrada.show;
    frm_entrada.refresh;
    frm_entrada.Label2.caption:='Carregando os m�dulos do programa...';
    frm_entrada.Label2.refresh;
    frm_entrada.gauge1.progress:=0;
    frm_entrada.gauge1.visible:=true;

        {1) Arquivos mais usados}
    Application.CreateForm(Tfrm_mensagem, frm_mensagem);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TfrmDialogo, frmDialogo);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_rl_tite, frm_rl_tite);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_mem_print, frm_mem_print);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_impressoras, frm_impressoras);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_ProbIniciar, frm_ProbIniciar);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TfrmSenha, frmSenha);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_senhaSupervisor, frm_senhaSupervisor);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_ALERTA, frm_ALERTA);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_senhaCaixa, frm_senhaCaixa);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_Auxformulario2, frm_Auxformulario2);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_AuxFormularioVendas, frm_AuxFormularioVendas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;

        {2) Forms. de F8}
    Application.CreateForm(Tfrm_F8GruposProdutos, frm_F8GruposProdutos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8SubGrupos, frm_F8SubGrupos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Produtos2, frm_F8Produtos2);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Faixas, frm_F8Faixas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8FormaPgto, frm_F8FormaPgto);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Vend, frm_F8Vend);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Forn, frm_F8Forn);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Cores, frm_F8Cores);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8CoresProdutos, frm_F8CoresProdutos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Adm, frm_F8Adm);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Clientes, frm_f8Clientes);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Avalistas, frm_f8Avalistas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Planos, frm_f8Planos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Lojas, frm_F8Lojas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Port, frm_f8Port);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Users, frm_f8Users);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Sit, frm_F8Sit);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Bancos, frm_F8Bancos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_f8Cep, frm_f8Cep);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Contas, frm_F8Contas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8FormaPgto2, frm_F8FormaPgto2);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8formulario1, frm_F8formulario1);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8MtvSuspensAtdo, frm_F8MtvSuspensAtdo);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Linhas, frm_F8Linhas);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8Colecoes, frm_F8Colecoes);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(Tfrm_F8FormaPgto3, frm_F8FormaPgto3);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;

    Application.CreateForm(Tfrm_F8CFOP, frm_F8CFOP);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;

        {3) Datamodules}
    Application.CreateForm(TDMcontrato, DMcontrato);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMperm, DMperm);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMAtualizReceb, DMAtualizReceb);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMBaixAutCheq, DMBaixAutCheq);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMRegAutSpc, DMRegAutSpc);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMmaxicod, DMmaxicod);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMRelatorios, DMRelatorios);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMRecCheqDev, DMRecCheqDev);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    Application.CreateForm(TDMLancamentos, DMLancamentos);
    frm_entrada.gauge1.progress:=Round((ind/tot)*100);
    ind:=ind+1;
    frm_entrada.gauge1.progress:=100;

        {...}
    frm_entrada.close;
    Application.Run;
  end;
end.
