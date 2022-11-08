# Analise Exploratória de Dados de uma Superstore Utilizando Serviços de BigData na AWS
Repositório criado para realizar o desafio de projeto "Análise Exploratória de Dados Utilizando Serviços de BigData na AWS"

### Serviços utilizados nessa atividade prática
 - Amazon S3
 - Amazon Glue
 - Amazon Athena
 - Amazon QuickSight

### Etapas para desenvolvimento

### Criando o bucket no Amazon S3

- Amazon S3 Console -> Buckets -> Create bucket -> Bucket name "athena-database-superstore" -> Create bucket
- Create folder (Criar uma pasta chamada ```/output``` e outra com o nome superstore (nome do conjunto de dados). Este nome irá definir o nome da tabela criada no Glue)
- Upload dos arquivos de dados localizados na pasta ```/data```

#### Criando o Glue Crawler

- Amazon Glue Console -> Crawlers -> Add Crawler
- Crawler name -> SuperstoreDBCrawler
- Source type [Data Stores] -> Crawl all folders
- Data store [S3] -> Include path [s3://athena-database-superstore/superstore]
- Add another data store -> No
- Create IAM Role -> superstore
- Frequency -> Run on demand
- Database -> superstore
- Group behavior for s3 data -> select option [Create a single schema for each S3 path]
- Finish
- Select crawler SuperstoreDBCrawler -> Run Crawler
- Databases -> Tables -> Visualizar dados das tabelas criadas

### Criando a aplicação no Amazon Athena

- Query editor -> Settings -> Manage settings -> Query result location and encryption -> Browse S3 -> athena-database-superstore -> superstore -> Save
- Editor -> Selecionar Database -> criar queries (exemplos na pasta ```/queries```)
- Executar queries
- Salvar queries -> Executar novamente -> Verificar no bucket criado no S3 (athena-database-superstore)
- Queries desenvolvidas:
  - query_agrupar_por_estado
  - query_media_lucro_por_regiao
  - query_selecionar_distinct_sub_categoria
  - query_selecionar_estados
  - query_selecionar_sub_categorias
  - query_soma_vendas
  - query_soma_vendas_por_categoria
  - query_soma_vendas_por_sub_categoria

#### Criando uma nova tabela

- Generate table DDL
- Copiar a query gerada
- Selecionar o DB e criar a nova tabela em uma nova query -> superstorenew com a exclusão das colunas: ship mode, postal code, country

### Visualizando os dados no Amazon QuickSight

- Datasets -> New dataset -> Athena -> Name Superstore-> Validate connection -> Create datasource
- Select superstore-> select table superstore -> Select -> Directly query your data -> Visualize
- Manage QuickSight -> Security & permissions -> região US-EAST (N. Virginia) -> Manage -> Select s3 buckets -> select athena-database-superstore -> finish -> save 
- Criação de visualização em gráfico de soma do lucro por categoria de produto e região:

![Grafico-Lucro](https://github.com/isabela-rossetti/analise_exploratoria_superstore_bigdata_aws/blob/main/Grafico-Lucro.png)

- Criação de visualização em mapa contendo o lucro por região:

![Grafico-Mapa](https://github.com/isabela-rossetti/analise_exploratoria_superstore_bigdata_aws/blob/main/Grafico-Mapa.png)
