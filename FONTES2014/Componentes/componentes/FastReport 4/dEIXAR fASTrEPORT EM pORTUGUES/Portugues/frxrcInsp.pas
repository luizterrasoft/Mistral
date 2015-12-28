{******************************************}
{                                          }
{             FastReport v4.0              }
{          Language resource file          }
{                                          }
{         Copyright (c) 1998-2008          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxrcInsp;

interface

implementation

uses frxRes;

const resXML =
'<?xml version="1.1" encoding="utf-8"?><Resources CodePage="1252"><StrRes Name="propActive" Text="Especifica se o Dataset está aberto ou não"/><StrRe' + 
's Name="propActive.TfrxHighlight" Text="Especifica se o destaque está ativo"/><StrRes Name="propAliasName" Text="O nome do alias BDE"/><StrRes Name="' + 
'propAlign" Text="Determina o alinhamento do objeto em relação à banda ou página"/><StrRes Name="propAlignment" Text="O alinhamento do texto do obj' + 
'eto"/><StrRes Name="propAllowAllUp" Text="Especifica se todos os speed buttons no grupo podem ser desmarcados ao mesmo tempo"/><StrRes Name="propAllow' + 
'Edit" Text="Determina se o usuário pode editar as páginas do relatório preparado"/><StrRes Name="propAllowExpressions" Text="Determina se o objeto ' + 
'de texto pode conter expressões dentro do texto"/><StrRes Name="propAllowGrayed" Text="Permite o estado nulo dos checkboxes"/><StrRes Name="propAllow' + 
'HTMLTags" Text="Determina se o objeto de texto pode conter tags HTML no seu conteúdo"/><StrRes Name="propAllowSplit" Text="Determina se a banda pode ' + 
'dividir seu conteúdo entre páginas"/><StrRes Name="propAuthor" Text="O autor do relatório "/><StrRes Name="propAutoSize.TfrxPictureView" Text="Dete' + 
'rmina se a figura deve definir seu tamanho automaticamente"/><StrRes Name="propAutoWidth" Text="Determina se o objeto de texto deve definir sua largur' + 
'a automaticamente"/><StrRes Name="propBackPicture" Text="A figura de fundo da página"/><StrRes Name="propBarType" Text="O tipo do código de barras "' + 
'/><StrRes Name="propBevelInner" Text="O tipo de relevo interno"/><StrRes Name="propBevelOuter" Text="O tipo de relevo externo"/><StrRes Name="propBeve' + 
'lWidth" Text="A largura do relevo"/><StrRes Name="propBorder" Text="Determina se a borda externa deve ser mostrada ou não"/><StrRes Name="propBorderS' + 
'tyle" Text="O estilo da janela"/><StrRes Name="propBottomMargin" Text="O tamanho da margem inferior da página"/><StrRes Name="propBrushStyle" Text="O' + 
' estilo do pincel usado para o fundo do objeto"/><StrRes Name="propCalcCheckSum" Text="Determina se o código de barras deve calcular o dígito verifi' + 
'cador automaticamente"/><StrRes Name="propCancel" Text="Determina se o botão deve ser ativado quando a tecla Esc for pressionada "/><StrRes Name="pro' + 
'pCaption" Text="O rótulo do controle "/><StrRes Name="propCellFields" Text="Nomes dos campos do BD representam as células do cruzamento "/><StrRes N' + 
'ame="propCellLevels" Text="Número de níveis de células "/><StrRes Name="propCenter" Text="Determina se a imagem deve ser centralizada dentro do con' + 
'trole "/><StrRes Name="propCharset" Text="O conjunto de caracteres da fonte "/><StrRes Name="propCharSpacing" Text="Quantidade de pixels entre dois ca' + 
'racteres "/><StrRes Name="propCheckColor" Text="A cor da marca "/><StrRes Name="propChecked" Text="Determina se o controle está marcado "/><StrRes Na' + 
'me="propCheckStyle" Text="O estilo da marca "/><StrRes Name="propChild" Text="Banda filha conectada a esta banda "/><StrRes Name="propClipped" Text="D' + 
'etermina quando o texto deve ser aparado dentro dos limites dos objetos"/><StrRes Name="propCollate" Text="Configuração padrão de agrupamento "/><S' + 
'trRes Name="propColor.TFont" Text="A cor do texto "/><StrRes Name="propColor" Text="A cor do objeto"/><StrRes Name="propColor.TfrxFrame" Text="A cor d' + 
'a borda "/><StrRes Name="propColor.TfrxHighlight" Text="Determina a cor do objeto se o destaque (highlight) está ativo "/><StrRes Name="propColumnFie' + 
'lds" Text="Nomes dos campos do BD representando as colunas do cruzamento "/><StrRes Name="propColumnGap" Text="O espaço entre colunas da banda "/><St' + 
'rRes Name="propColumnLevels" Text="Número de níveis de colunas "/><StrRes Name="propColumns" Text="Número de colunas na banda "/><StrRes Name="prop' + 
'ColumnWidth" Text="A largura da coluna da banda"/><StrRes Name="propCondition" Text="A condição de agrupamento. O grupo irá quebrar se o valor dest' + 
'a expressão mudar "/><StrRes Name="propCondition.TfrxHighlight" Text="String de expressão. Se esta expressão for Verdadeira, o destaque será ativa' + 
'do. "/><StrRes Name="propConnected" Text="Indica se a conexão com o banco de dados está ativa"/><StrRes Name="propConvertNulls" Text="Determina se v' + 
'alores nulos do BD serão convertidos para 0, Falso ou string vazia "/><StrRes Name="propCopies" Text="O número padrão de cópias "/><StrRes Name="p' + 
'ropCursor" Text="O cursor do objeto "/><StrRes Name="propDatabaseName" Text="O nome do banco de dados "/><StrRes Name="propDataField" Text="Especifica' + 
' o campo do qual o objeto obtém seus dados "/><StrRes Name="propDataSet" Text="Liga o objeto ao dataset que contém o campo que ele representa "/><St' + 
'rRes Name="propDate" Text="O valor de data do controle "/><StrRes Name="propDateFormat" Text="Especifica o formato em que a data é apresentada "/><St' + 
'rRes Name="propDecimalSeparator" Text="O separador decimal "/><StrRes Name="propDefault" Text="Determina se o botão é o botão padrão "/><StrRes Na' + 
'me="propDefHeight" Text="Altura padrão da linha "/><StrRes Name="propDescription.TfrxReportOptions" Text="A descrição do relatório"/><StrRes Name=' + 
'"propDescription" Text="A descrição do relatório"/><StrRes Name="propDiagonal" Text="Indica que a linha é diagonal "/><StrRes Name="propDisplayFor' + 
'mat" Text="O formato do valor exibido "/><StrRes Name="propDoublePass" Text="Determina se o mecanismo do relatório deve realizar um segundo passo "/>' + 
'<StrRes Name="propDown" Text="Determina se o speed button está pressionado ou não "/><StrRes Name="propDownThenAcross" Text="Determina como uma tabe' + 
'la cruzada grande será dividida entre páginas "/><StrRes Name="propDriverName" Text="O nome do driver BDE"/><StrRes Name="propDropShadow" Text="Dete' + 
'rmina se o objeto possui sombra "/><StrRes Name="propDuplex" Text="Especifica o modo duplex para a página "/><StrRes Name="propEditMask" Text="Especi' + 
'fica a máscara que representa que texto é válido para o controle Edit com máscara "/><StrRes Name="propEnabled" Text="Determina se o controle est�' + 
'� habilitado "/><StrRes Name="propEngineOptions" Text="As opções do mecanismo do relatório "/><StrRes Name="propExpression" Text="O valor desta exp' + 
'ressão será exibido no objeto "/><StrRes Name="propExpressionDelimiters" Text="Os caracteres que serão usados para delimitar as expressões contida' + 
's no texto"/><StrRes Name="propFieldAliases" Text="Os apelidos dos campos do dataset "/><StrRes Name="propFilter" Text="A condição de filtragem para' + 
' o dataset "/><StrRes Name="propFiltered" Text="Determina se o dataset deve filtrar os registros usando a condição na propriedade Filter "/><StrRes ' + 
'Name="propFlowTo" Text="O objeto de texto que mostrará o texto que não couber no objeto "/><StrRes Name="propFont" Text="Os atributos da fonte do ob' + 
'jeto "/><StrRes Name="propFooterAfterEach" Text="Determina se a banda de rodapé deverá ser mostrada após cada linha de dados "/><StrRes Name="propF' + 
'ormatStr" Text="A string de formatação "/><StrRes Name="propFrame" Text="Os atributos da borda do objeto"/><StrRes Name="propGapX" Text="A endentaç' + 
'ão esquerda do texto "/><StrRes Name="propGapY" Text="A endentação superior do texto "/><StrRes Name="propGlyph" Text="A imagem do controle "/><Str' + 
'Res Name="propGroupIndex" Text="Permite aos speed buttons funcionar juntos como um grupo "/><StrRes Name="propHAlign" Text="O alinhamento horizontal d' + 
'o texto"/><StrRes Name="propHeight" Text="A altura do objeto "/><StrRes Name="propHideZeros" Text="Determina se o objeto de texto esconderá os valore' + 
's zerados"/><StrRes Name="propHighlight" Text="Os atributos do destaque condicional "/><StrRes Name="propIndexName" Text="O nome do índice "/><StrRes' + 
' Name="propInitString" Text="String de inicialização da impressora para relatórios matriciais "/><StrRes Name="propItems" Text="Itens de lista do o' + 
'bjeto "/><StrRes Name="propKeepAspectRatio" Text="Manter o tamanho proporcional da imagem "/><StrRes Name="propKeepChild" Text="Determina se a banda s' + 
'erá impressa junto de sua banda filha "/><StrRes Name="propKeepFooter" Text="Determina se a banda será impressa junto de seu rodapé "/><StrRes Name' + 
'="propKeepHeader" Text="Determina se a banda será impressa junto com seu cabeçalho "/><StrRes Name="propKeepTogether" Text="Determina se a banda ser' + 
'á impressa junto de todas suas sub-bandas "/><StrRes Name="propKind.TfrxFormat" Text="O tipo de formatação "/><StrRes Name="propKind" Text="O tipo ' + 
'de botão"/><StrRes Name="propLargeDesignHeight" Text="Determina se a página possuirá altura extensa no modo de desenho "/><StrRes Name="propLayout"' + 
' Text="O leiaute do glyph do botão "/><StrRes Name="propLeft" Text="A coordenada esquerda do objeto "/><StrRes Name="propLeftMargin" Text="O tamanho ' + 
'da margem esquerda da página"/><StrRes Name="propLines" Text="O texto do objeto "/><StrRes Name="propLineSpacing" Text="A quantidade de pixels entre ' + 
'duas linhas de texto "/><StrRes Name="propLoginPrompt" Text="Determina se o diálogo de login deverá ser mostrado "/><StrRes Name="propMargin" Text="' + 
'Determina o número de pixels entre a borda da imagem e a borda do botão "/><StrRes Name="propMaster" Text="O dataset mestre "/><StrRes Name="propMas' + 
'terFields" Text="Os campos ligados por relação mestre-detalhe "/><StrRes Name="propMaxLength" Text="Tamanho máximo do texto"/><StrRes Name="propMax' + 
'Width" Text="Largura máxima da coluna "/><StrRes Name="propMemo" Text="O texto do objeto"/><StrRes Name="propMinWidth" Text="Largura mínima da colun' + 
'a "/><StrRes Name="propMirrorMargins" Text="Espelha as margens nas páginas pares "/><StrRes Name="propModalResult" Text="Determina se e como o botão' + 
' fecha seu formulário modal "/><StrRes Name="propName.TFont" Text="O nome da fonte "/><StrRes Name="propName.TfrxReportOptions" Text="O nome do relat' + 
'ório "/><StrRes Name="propName" Text="O nome do objeto "/><StrRes Name="propNumGlyphs" Text="Indica o número de imagens no gráfico especificado na ' + 
'propriedade Glyph "/><StrRes Name="propOpenDataSource" Text="Determina se a fonte de dados deve ser aberta automaticamente ou não "/><StrRes Name="pr' + 
'opOrientation" Text="A orientação da página "/><StrRes Name="propOutlineText" Text="O texto que será mostrado no controle de resumo da visualizaç' + 
'ão "/><StrRes Name="propOutlineVisible" Text="A visibilidade do controle de resumo da visualização "/><StrRes Name="propOutlineWidth" Text="A largu' + 
'ra do controle de resumo da visualização "/><StrRes Name="propPageNumbers.TfrxPrintOptions" Text="O número das páginas a serem impressas."/><StrRe' + 
's Name="propPaperHeight" Text="A altura da página "/><StrRes Name="propPaperWidth" Text="A largura da página "/><StrRes Name="propParagraphGap" Text' + 
'="A endentação da primeira linha do parágrafo "/><StrRes Name="propParams.TfrxBDEDatabase" Text="Os parâmetros da conexão "/><StrRes Name="propPa' + 
'rams" Text="Os parâmetros da query "/><StrRes Name="propParentFont" Text="Determina se o objeto usará a fonte de seu objeto pai "/><StrRes Name="pro' + 
'pPassword" Text="A senha do relatório"/><StrRes Name="propPasswordChar" Text="Indica o caractere, se algum, a ser mostrado no lugar dos caracteres re' + 
'ais digitados no controle "/><StrRes Name="propPicture" Text="A figura "/><StrRes Name="propPicture.TfrxReportOptions" Text="A figura descritiva do re' + 
'latório "/><StrRes Name="propPosition" Text="A posição inicial da janela "/><StrRes Name="propPreviewOptions" Text="As opções de visualização d' + 
'o relatório "/><StrRes Name="propPrintable" Text="Se o objeto será impresso. Objetos com Printable=False serão visualizados, mas não impressos"/><' + 
'StrRes Name="propPrintChildIfInvisible" Text="Determina se a banda filha será impressa caso sua banda pai seja invisível "/><StrRes Name="propPrinte' + 
'r" Text="O nome da impressora que será selecionada quando este relatório for aberto ou executado "/><StrRes Name="propPrintIfDetailEmpty" Text="Dete' + 
'rmina se a banda de dados será impressa caso sua sub-banda esteja vazia "/><StrRes Name="propPrintIfEmpty" Text="Determina se a página será impress' + 
'a caso todos os seus datasets estejam vazios "/><StrRes Name="propPrintOnFirstPage" Text="Determina se a banda será impressa na primeira página "/><' + 
'StrRes Name="propPrintOnLastPage" Text="Determina se a banda será impressa na última página "/><StrRes Name="propPrintOnParent" Text="Determina se ' + 
'o sub-relatório será impresso em sua banda pai "/><StrRes Name="propPrintOnPreviousPage" Text="Determina se a página pode ser gerada no espaço liv' + 
're da página gerada anteriormente "/><StrRes Name="propPrintOptions" Text="Opções de impressão do relatório"/><StrRes Name="propPrintPages" Text=' + 
'"Determina a impressão de todas as páginas, somente as ímpares ou somente as pares "/><StrRes Name="propRangeBegin" Text="Determina o ponto inicial' + 
' de navegação no dataset "/><StrRes Name="propRangeEnd" Text="Determina o ponto final de navegação no dataset "/><StrRes Name="propRangeEndCount" ' + 
'Text="Determina o número de registros no dataset se RangeEnd for reCount"/><StrRes Name="propReadOnly" Text="Determina se o objeto de texto é soment' + 
'e leitura "/><StrRes Name="propRepeatHeaders" Text="Determina se os cabeçalhos de coluna e linha serão reimpressos em uma nova página "/><StrRes Na' + 
'me="propReportOptions" Text="As opções do relatório"/><StrRes Name="propReprintOnNewPage" Text="Determina se a banda será reimpressa em uma nova p' + 
'ágina "/><StrRes Name="propRestrictions" Text="Conjunto de sinais de restrição "/><StrRes Name="propRightMargin" Text="O tamanho da margem direita ' + 
'da página "/><StrRes Name="propRotation.TfrxBarCodeView" Text="A orientação do código de barras "/><StrRes Name="propRotation" Text="A rotação d' + 
'o texto "/><StrRes Name="propRowCount" Text="Número de registros virtuais na banda de dados "/><StrRes Name="propRowFields" Text="Nomes dos campos de' + 
' BD representando as linhas de cruzamento "/><StrRes Name="propRowLevels" Text="Número de níveis de linhas "/><StrRes Name="propRTLReading" Text="De' + 
'termina se o objeto de texto mostrará seu conteúdo no sentido da direita para a esquerda "/><StrRes Name="propSessionName" Text="O nome da sessão B' + 
'DE"/><StrRes Name="propShadowColor" Text="A cor da sombra "/><StrRes Name="propShadowWidth" Text="A largura da sombra "/><StrRes Name="propShape" Text' + 
'="O tipo de forma "/><StrRes Name="propShiftMode" Text="O comportamento de deslocamento do objeto "/><StrRes Name="propShowColumnHeader" Text="Determi' + 
'na se o cruzamento mostrará os cabeçalhos das colunas"/><StrRes Name="propShowColumnTotal" Text="Determina se o cruzamento mostrará o total geral d' + 
'a coluna "/><StrRes Name="propShowRowHeader" Text="Determina se o cruzamento mostrará os cabeçalhos das linhas "/><StrRes Name="propShowRowTotal" Te' + 
'xt="Determina se o cruzamento mostrará o total geral da linha "/><StrRes Name="propShowDialog" Text="Determina se o diálogo de impressão será most' + 
'rado na janela de visualização "/><StrRes Name="propShowText" Text="Determina se o objeto código de barras mostrará texto em formato legível "/><' + 
'StrRes Name="propSize" Text="O tamanho da fonte "/><StrRes Name="propSorted" Text="Determina se os itens estão ordenados ou não"/><StrRes Name="prop' + 
'Spacing" Text="Determina o número de pixels entre a imagem e o texto"/><StrRes Name="propSQL" Text="A declaração SQL "/><StrRes Name="propStartNewP' + 
'age" Text="Inicia uma nova página antes de imprimir a banda "/><StrRes Name="propStretch" Text="Estica a figura para caber nos limites do objeto "/><' + 
'StrRes Name="propStretched" Text="Determina se o objeto pode ser esticado "/><StrRes Name="propStretchMode" Text="Modo para esticar o objeto "/><StrRe' + 
's Name="propStyle.TFont" Text="O estilo da fonte "/><StrRes Name="propStyle" Text="O estilo do controle "/><StrRes Name="propStyle.TfrxFrame" Text="O ' + 
'estilo da borda do objeto "/><StrRes Name="propSuppressRepeated" Text="Suprime valores repetidos "/><StrRes Name="propTableName" Text="O nome da tabel' + 
'a de dados "/><StrRes Name="propTag" Text="O número de marca do objeto "/><StrRes Name="propTagStr" Text="A string de marca do objeto "/><StrRes Name' + 
'="propText" Text="O texto do objeto"/><StrRes Name="propTitleBeforeHeader" Text="Determina se o título do relatório deve ser mostrado antes do cabe�' + 
'�alho da página"/><StrRes Name="propTop" Text="A coordenada superior do objeto "/><StrRes Name="propTopMargin" Text="O tamanho da margem superior da ' + 
'página "/><StrRes Name="propTyp" Text="O tipo da borda "/><StrRes Name="propUnderlines" Text="Determina se o objeto de texto mostrará linhas de grad' + 
'e após cada linha de texto "/><StrRes Name="propURL" Text="O URL do objeto "/><StrRes Name="propUserName" Text="Nome do usuário do objeto de dados. ' + 
'Este nome será mostrado na árvore de dados "/><StrRes Name="propVAlign" Text="O alinhamento vertical do texto"/><StrRes Name="propVersionBuild" Text' + 
'="Informação de versão, compilação "/><StrRes Name="propVersionMajor" Text="Informação de versão, versão maior "/><StrRes Name="propVersionMi' + 
'nor" Text="Informação de versão, versão menor "/><StrRes Name="propVersionRelease" Text="Informação de versão, liberação "/><StrRes Name="pro' + 
'pVisible" Text="Visibilidade do objeto"/><StrRes Name="propWidth" Text="Largura do objeto "/><StrRes Name="propWidth.TfrxFrame" Text="A largura da bor' + 
'da "/><StrRes Name="propWindowState" Text="Estado inicial da janela "/><StrRes Name="propWordBreak" Text="Quebrar palavras em russo "/><StrRes Name="p' + 
'ropWordWrap" Text="Determina se o objeto de texto insere retornos de carro suaves para que o texto quebre na margem direita "/><StrRes Name="propZoom.' + 
'TfrxBarCodeView" Text="Zooms para o código de barras "/><StrRes Name="propConnectionName" Text="Nome da conexão à base de dados usada no relatório' + 
' "/><StrRes Name="propCurve" Text="Curvatura das bordas do objeto roundrectangle "/><StrRes Name="propDrillDown" Text="Determina se o grupo lançado p' + 
'ara baixo (drill-down) "/><StrRes Name="propFontStyle" Text="Estilo da fonte matricial"/><StrRes Name="propHideIfSingleDataRecord" Text="Esconda o rod' + 
'apé se um grupo tiver somente um registro de dados "/><StrRes Name="propOutlineExpand" Text="Determina se expande o relatório para fora da linha ou ' + 
'não "/><StrRes Name="propPlainCells" Text="Determina se imprime as diversas células lado a lado ou empilhado"/><StrRes Name="propPrintMode" Text="Mo' + 
'dalidade de impressão: normal, imprime uma página grande repartida em pequenas páginas, ou diversas páginas pequenas em uma grande "/><StrRes Name' + 
'="propPrintOnSheet" Text="Tamanho do papel para impressão do relatório. Usado se PrintMode não for pmDefault "/><StrRes Name="propResetPageNumbers"' + 
' Text="Restaura número/total de páginas quando imprimir o grupo. Se for usada a opção StartNewPage setada para true "/><StrRes Name="propReverse" ' + 
'Text="Determina se imprime páginas na ordem invertida"/><StrRes Name="propShowFooterIfDrillDown" Text="Determina se mostra o rodapé do grupo quando ' + 
'o grupo for lançado para baixo (drill-down) "/><StrRes Name="propSizeMode" Text="Exibe modo do objeto OLE "/><StrRes Name="propVersion" Text="Versão' + 
' do FastReport "/><StrRes Name="propWideBarRatio" Text="Relativo a largura das barras do objeto barcode "/><StrRes Name="propWysiwyg" Text="Determina ' + 
'se usa o canvas da impressora para formatar o texto objeto richtext. A impressora deverá estar instalada e pronta. "/><StrRes Name="propArrowEnd" Tex' + 
't="Determina se extrai a seta da extremidade da linha "/><StrRes Name="propArrowLength" Text="Comprimento da seta "/><StrRes Name="propArrowSolid" Tex' + 
't="Determina se extrai uma seta com linha sólida "/><StrRes Name="propArrowStart" Text="Determina se extrai uma seta no início da linha"/><StrRes Na' + 
'me="propArrowWidth" Text="Largura da seta "/><StrRes Name="propCloseDataSource" Text="Determina se fecha o dataset quando o relatório é finalizado "' + 
'/><StrRes Name="propDatabase" Text="Conexão à Base de Dados "/><StrRes Name="propIndexFieldNames" Text="Nomes de indice dos campos "/><StrRes Name="' + 
'propCommandTimeOut" Text="Quantidade de tempo necessário para executar a query "/><StrRes Name="propExpandDrillDown" Text="Determina se expande todos' + 
' os elementos drill-down no início do relatório"/><StrRes Name="propWysiwyg.TfrxMemoView" Text="Determina se mostra o texto no modo WYSIWYG "/><StrR' + 
'es Name="propLeftLine" Text="Linha esquerda de um quadro "/><StrRes Name="propTopLine" Text="Linha superior de um quadro "/><StrRes Name="propRightLin' + 
'e" Text="Linha direita de um quadro "/><StrRes Name="propBottomLine" Text="Linha inferior de um quadro"/><StrRes Name="propColor.TfrxFrameLine" Text="' + 
'A cor da linha do quadro "/><StrRes Name="propStyle.TfrxFrameLine" Text="O estilo da linha do quadro"/><StrRes Name="propWidth.TfrxFrameLine" Text="A ' + 
'largura da linha do quadro "/><StrRes Name="propFileLink" Text="Expressão ou nome do arquivo que contém uma imagem "/><StrRes Name="propEndlessWidth' + 
'" Text="Modalidade de página Endless. Se true, a largura da página crescerá dependendo do número de registros de dados nela "/><StrRes Name="propE' + 
'ndlessHeight" Text="Modalidade de página Endless. Se true, o tamanho da página crescerá dependendo do número de registros de dados nela "/><StrRes' + 
' Name="propAddHeight" Text="Adiciona uma quantidade de espaço especificada à altura da célula "/><StrRes Name="propAddWidth" Text="Adiciona uma qua' + 
'ntidade de espaço especificada à largura da célula "/><StrRes Name="propAllowDuplicates" Text="Determina se a célula pode aceitar string com valor' + 
'es duplicados "/><StrRes Name="propJoinEqualCells" Text="Determina se o crosstab deve juntar as células com valores iguais "/><StrRes Name="propNextC' + 
'ross" Text="Ponteiro para o próximo crosstab que será mostrado lado a lado "/><StrRes Name="propNextCrossGap" Text="Abertura entre o lado a lado do ' + 
'crosstab "/><StrRes Name="propShowCorner" Text="Determina se o crosstab deve indicar os elementos de canto esquerdo superior "/><StrRes Name="propSupp' + 
'ressNullRecords" Text="Determina se o crosstab reprime registros com todos os valores nulos "/><StrRes Name="propShowTitle" Text="Determina se o cross' + 
'tab exibe o título"/><StrRes Name="propAutoSize" Text="Determina se o crosstab carrega o tamanho automaticamente"/><StrRes Name="propShowHint" Text="' + 
'Determines if object should show hint when move cursor on it"/><StrRes Name="propHint" Text="Hint text"/><StrRes Name="propPaperSize" Text="PaperSize"' + 
'/><StrRes Name="propPageCount" Text="Count of pages"/><StrRes Name="propBackPictureVisible" Text="Determines if the page should display a background p' + 
'icture"/><StrRes Name="propBackPicturePrintable" Text="Determines if the page should print a background picture"/><StrRes Name="propHightQuality" Text' + 
'="Show picture in high quality"/><StrRes Name="propLockType" Text="Specifies the lock type to use when opening a dataset"/><StrRes Name="propIgnoreDup' + 
'Params" Text="Ignore duplicate parameters in ParamEditor"/><StrRes Name="propTransparent" Text="Determinates if the picture can be transparent"/><StrR' + 
'es Name="propTransparentColor" Text="Transparent color"/><StrRes Name="propIgnoreNulls" Text="Allow to ingnore Nulls values in Chart"/><StrRes Name="p' + 
'ropShowClildIfDrillDown" Text="Determinates if child band shown if group is drilldown"/></Resources>' + 
' ';

initialization
  frxResources.AddXML(resXML);

end.
