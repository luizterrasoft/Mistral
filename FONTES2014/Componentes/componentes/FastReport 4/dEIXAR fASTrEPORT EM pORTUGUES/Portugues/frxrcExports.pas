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

unit frxrcExports;

interface

implementation

uses frxRes;

const resXML =
'<?xml version="1.1" encoding="utf-8"?><Resources CodePage="1252"><StrRes Name="8000" Text="Exportar para Excel"/><StrRes Name="8001" Text="Estilos"/><' + 
'StrRes Name="8002" Text="Figuras"/><StrRes Name="8003" Text="Mesclar células"/><StrRes Name="8004" Text="Exportação rápida"/><StrRes Name="8005" T' + 
'ext="WYSIWYG"/><StrRes Name="8006" Text="Como texto"/><StrRes Name="8007" Text="Fundo"/><StrRes Name="8008" Text="Abrir o Excel depois de exportar"/><' + 
'StrRes Name="8009" Text="Arquivo do Excel  {*.xls)|*.xls"/><StrRes Name="8010" Text=".xls"/><StrRes Name="8100" Text="Exportar para Excel (XML)"/><Str' + 
'Res Name="8101" Text="Estilos"/><StrRes Name="8102" Text="WYSIWYG"/><StrRes Name="8103" Text="Fundo"/><StrRes Name="8104" Text="Abrir o Excel depois d' + 
'e exportar"/><StrRes Name="8105" Text="Arquivo XML do Excel (*.xls)|*.xls"/><StrRes Name="8106" Text=".xls"/><StrRes Name="8200" Text="Exportar para t' + 
'abela HTML"/><StrRes Name="8201" Text="Abrir depois de exportar"/><StrRes Name="8202" Text="Estilos"/><StrRes Name="8203" Text="Figura"/><StrRes Name=' + 
'"8204" Text="Todas em uma pasta"/><StrRes Name="8205" Text="Largura fixa"/><StrRes Name="8206" Text="Navegador de páginas"/><StrRes Name="8207" Text=' + 
'"Multi-página"/><StrRes Name="8208" Text="Navegador Mozilla"/><StrRes Name="8209" Text="Fundo"/><StrRes Name="8210" Text="Arquivo HTML (*.html)|*.htm' + 
'l"/><StrRes Name="8211" Text=".html"/><StrRes Name="8300" Text="Exportar para Texto (impressora matricial)"/><StrRes Name="8301" Text="Visualizar liga' + 
'do/desligado"/><StrRes Name="8302" Text=" Propriedades de Exportação"/><StrRes Name="8303" Text="Quebras de página"/><StrRes Name="8304" Text="Pág' + 
'ina de código OEM"/><StrRes Name="8305" Text="Linhas vazias"/><StrRes Name="8306" Text="Espaços no início"/><StrRes Name="8307" Text="Páginas:"/><' + 
'StrRes Name="8308" Text="Informe números e/ou intervalo de páginas separados por vírgulas. Ex.: 1,3,5-12"/><StrRes Name="8309" Text="Escalonamento"' + 
'/><StrRes Name="8310" Text="Escala X"/><StrRes Name="8311" Text="Escala Y"/><StrRes Name="8312" Text="Bordas"/><StrRes Name="8313" Text="Nenhuma"/><St' + 
'rRes Name="8314" Text="Simples"/><StrRes Name="8315" Text="Gráfica"/><StrRes Name="8316" Text="Somente com página de código OEM"/><StrRes Name="831' + 
'7" Text="Imprimir depois de exportar"/><StrRes Name="8318" Text="Salvar configurações"/><StrRes Name="8319" Text="Visualizar"/><StrRes Name="8320" T' + 
'ext="Largura:"/><StrRes Name="8321" Text="Altura:"/><StrRes Name="8322" Text="Página"/><StrRes Name="8323" Text="Mais Zoom"/><StrRes Name="8324" Text' + 
'="Menos Zoom"/><StrRes Name="8325" Text="Arquivo de texto (impressora matricial)(*.prn)|*.prn"/><StrRes Name="8326" Text=".prn"/><StrRes Name="8400" T' + 
'ext="Imprimir"/><StrRes Name="8401" Text="Impressora"/><StrRes Name="8402" Text="Nome"/><StrRes Name="8403" Text="Configuração..."/><StrRes Name="84' + 
'04" Text="Cópias"/><StrRes Name="8405" Text="Número de cópias"/><StrRes Name="8406" Text="Configuração inicial da impressora"/><StrRes Name="8407' + 
'" Text="Tipo de impressora"/><StrRes Name="8408" Text=".fpi"/><StrRes Name="8409" Text="Modelo inicial da impressora (*.fpi)|*.fpi"/><StrRes Name="841' + 
'0" Text=".fpi"/><StrRes Name="8411" Text="Modelo inicial da impressora (*.fpi)|*.fpi"/><StrRes Name="8500" Text="Exportar para RTF"/><StrRes Name="850' + 
'1" Text="Figuras"/><StrRes Name="8502" Text="WYSIWYG"/><StrRes Name="8503" Text="Abrir depois de exportar"/><StrRes Name="8504" Text="Arquivo RTF (*.r' + 
'tf)|*.rtf"/><StrRes Name="8505" Text=".rtf"/><StrRes Name="8600" Text="Configurações de Exportação"/><StrRes Name="8601" Text="Configurações da ' + 
'Imagem"/><StrRes Name="8602" Text="Qualidade JPEG"/><StrRes Name="8603" Text="Resolução (dpi)"/><StrRes Name="8604" Text="Arquivos separados"/><StrR' + 
'es Name="8605" Text="Reduzir página"/><StrRes Name="8606" Text="Monocromático"/><StrRes Name="8700" Text="Exportar para PDF"/><StrRes Name="8701" Te' + 
'xt="Compactado"/><StrRes Name="8702" Text="Fontes embutidas"/><StrRes Name="8703" Text="Impressão otimizada"/><StrRes Name="8704" Text="Indice"/><Str' + 
'Res Name="8705" Text="Fundo"/><StrRes Name="8706" Text="Abrir depois de exportar"/><StrRes Name="8707" Text="Arquivo PDF Adobe (*.pdf)|*.pdf"/><StrRes' + 
' Name="8708" Text=".pdf"/><StrRes Name="RTFexport" Text="Arquivo RTF"/><StrRes Name="BMPexport" Text="Imagem BMP"/><StrRes Name="JPEGexport" Text="Ima' + 
'gem JPEG"/><StrRes Name="TIFFexport" Text="Imagem TIFF"/><StrRes Name="TextExport" Text="Texto (impressora matricial)"/><StrRes Name="XlsOLEexport" Te' + 
'xt="Tabela Excel (OLE)"/><StrRes Name="HTMLexport" Text="Arquivo HTML"/><StrRes Name="XlsXMLexport" Text="Tabela Excel (XML)"/><StrRes Name="PDFexport' + 
'" Text="Arquivo PDF"/><StrRes Name="ProgressWait" Text="Por favor, aguarde"/><StrRes Name="ProgressRows" Text="Definindo linhas"/><StrRes Name="Progre' + 
'ssColumns" Text="Definindo colunas"/><StrRes Name="ProgressStyles" Text="Definindo estilos"/><StrRes Name="ProgressObjects" Text="Exportando objetos"/' + 
'><StrRes Name="TIFFexportFilter" Text="Imagem TIFF (*.tif)|*.tif"/><StrRes Name="BMPexportFilter" Text="Imagem BMP (*.bmp)|*.bmp"/><StrRes Name="JPEGe' + 
'xportFilter" Text="Imagem JPEG (*.jpg)|*.jpg"/><StrRes Name="HTMLNavFirst" Text="Início"/><StrRes Name="HTMLNavPrev" Text="Anterior"/><StrRes Name="H' + 
'TMLNavNext" Text="Seguinte"/><StrRes Name="HTMLNavLast" Text="Fim"/><StrRes Name="HTMLNavRefresh" Text="Atualizar"/><StrRes Name="HTMLNavPrint" Text="' + 
'Imprimir"/><StrRes Name="HTMLNavTotal" Text="Páginas"/><StrRes Name="8800" Text="Exportar para Texto"/><StrRes Name="8801" Text="Arquivos texto (*.tx' + 
't)|*.txt"/><StrRes Name="8802" Text=".txt"/><StrRes Name="SimpleTextExport" Text="Arquivo Texto"/><StrRes Name="8850" Text="Exportar para CSV"/><StrRe' + 
's Name="8851" Text="Arquivo CSV (*.csv)|*.csv"/><StrRes Name="8852" Text=".csv"/><StrRes Name="8853" Text="Separador"/><StrRes Name="CSVExport" Text="' + 
'Arquivo CSV"/><StrRes Name="8900" Text="Exportar para E-mail"/><StrRes Name="8901" Text="E-mail"/><StrRes Name="8902" Text="Conta"/><StrRes Name="8903' + 
'" Text="Conexão"/><StrRes Name="8904" Text="Destinatário"/><StrRes Name="8905" Text="Anexo"/><StrRes Name="8906" Text="Formato"/><StrRes Name="8907"' + 
' Text="Endereço de email"/><StrRes Name="8908" Text="Nome"/><StrRes Name="8909" Text="Servidor"/><StrRes Name="8910" Text="Login"/><StrRes Name="8911' + 
'" Text="Emitente"/><StrRes Name="8912" Text="Mensagem"/><StrRes Name="8913" Text="Texto"/><StrRes Name="8914" Text="Organização"/><StrRes Name="8915' + 
'" Text="Senha"/><StrRes Name="8916" Text="Porta"/><StrRes Name="8917" Text="Lembrar propriedades"/><StrRes Name="8918" Text="Campos requeridos não es' + 
'tão preenchidos"/><StrRes Name="8919" Text="Configurações de exportação avançadas"/><StrRes Name="8920" Text="Assinatura"/><StrRes Name="8921" T' + 
'ext="Criar"/><StrRes Name="8922" Text="Assunto"/><StrRes Name="8923" Text="Atenciosamente"/><StrRes Name="8924" Text="Enviar mensagem para"/><StrRes N' + 
'ame="EmailExport" Text="E-mail"/><StrRes Name="FastReportFile" Text="Arquivo FastReport"/><StrRes Name="GifexportFilter" Text="Arquivo GIF (*.gif)|*.g' + 
'if"/><StrRes Name="GIFexport" Text="Imagem GIF"/><StrRes Name="8950" Text="Contínuo"/><StrRes Name="8951" Text="Cabeçalho/Rodapé da página"/><StrR' + 
'es Name="8952" Text="Texto"/><StrRes Name="8953" Text="Cabeçalho/Rodapé"/><StrRes Name="8954" Text="Nenhum"/><StrRes Name="ODSExportFilter" Text="Ab' + 
're documento arquivo Spreadsheet (*.ods)|*.ods"/><StrRes Name="ODSExport" Text="Abre documento Spreadsheet"/><StrRes Name="ODTExportFilter" Text="Abre' + 
' documento arquivo texto (*.odt)|*.odt"/><StrRes Name="ODTExport" Text="Abre documento texto"/><StrRes Name="8960" Text=".ods"/><StrRes Name="8961" Te' + 
'xt=".odt"/><StrRes Name="8962" Text="Segurança"/><StrRes Name="8963" Text="Opções de segurança"/><StrRes Name="8964" Text="Proprietário senha"/><' + 
'StrRes Name="8965" Text="Usuário senha"/><StrRes Name="8966" Text="Imprimir o documento"/><StrRes Name="8967" Text="Modificar o documento"/><StrRes N' + 
'ame="8968" Text="Copiar texto e gráficos"/><StrRes Name="8969" Text="Adicionar ou modificar anotações de texto"/><StrRes Name="8970" Text="PDF Segu' + 
'rança"/><StrRes Name="8971" Text="Informações do documento"/><StrRes Name="8972" Text="Informações"/><StrRes Name="8973" Text="Título"/><StrRes ' + 
'Name="8974" Text="Autor"/><StrRes Name="8975" Text="Assunto"/><StrRes Name="8976" Text="Palavras chave"/><StrRes Name="8977" Text="Criador"/><StrRes N' + 
'ame="8978" Text="Produtor"/><StrRes Name="8979" Text="Autenticação"/><StrRes Name="8980" Text="Permissões"/><StrRes Name="8981" Text="Visualizador"' + 
'/><StrRes Name="8982" Text="Preferências do visualizador"/><StrRes Name="8983" Text="Esconder barra de ferramentas"/><StrRes Name="8984" Text="Escond' + 
'er barra de menu"/><StrRes Name="8985" Text="Esconder interface do usuário"/><StrRes Name="8986" Text="Ajustar janela"/><StrRes Name="8987" Text="Cen' + 
'tralizar janela"/><StrRes Name="8988" Text="Escala de impressão"/><StrRes Name="8989" Text="Confirmao de leitura"/><StrRes Name="9101" Text="Export t' + 
'o DBF"/><StrRes Name="9102" Text="dBase (DBF) export"/><StrRes Name="9103" Text=".dbf"/><StrRes Name="9104" Text="Failed to load the file"/><StrRes Na' + 
'me="9105" Text="Failure"/><StrRes Name="9106" Text="Field names"/><StrRes Name="9107" Text="Automatically"/><StrRes Name="9108" Text="Manually"/><StrR' + 
'es Name="9109" Text="Load from file"/><StrRes Name="9110" Text="Text files (*.txt)|*.txt|All files|*.*"/><StrRes Name="9111" Text="DBF files (*.dbf)|*' + 
'.dbf|All files|*.*"/></Resources>' + 
' ';

initialization
  frxResources.AddXML(resXML);

end.