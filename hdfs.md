# Hadoop Distributed File System (HDFS)

O Hadoop é ideal para armazenar grandes quantidades de dados, do porte de terabytes e pentabytes, e usa o HDFS como sistema de armazenamento. O HDFS permite a conexão de nós (computadores pessoais padrão) contidos nos clusters por meio dos quais os arquivos de dados são distribuídos [1].

O HDFS ao lado do MapReduce é a base do Hadoop. Sem ele seria impossível trabalhar com grandes quantidades de dados de forma consistente, devido aos diversos contratempos da computação distribuída, como o mal funcionamento dos nós, rendimento de processamento IO de grandes conjuntos de dados, bem como sincronismos de gravação.

O HDFS é baseado numa arquitetura de Master/Slave, que são chamados por _NameNode_ e _DataNode_ respectivamente. O primeiro é resposável por regular acesso aos arquivos pelos clientes, bem como manter a árvore de diretórios em todo cluster, percebe-se assim como o _NameNode_ é crítico. Em um cluster, pode-se ter as mais diversificadas configurações: único _NameNode_, replicado(por segurança) e até independentes. Até o esquema independente pode haver compartilhamento de _DataNodes_, que será explicado a seguir.

Os _DataNodes_ são os nós que armazenam conjuntos de blocos de arquivos criados para distribuição do sistema, costumam ser blocos de tamanho fixo. Não são críticos, caso caia o _NameNode_ irá reparar a perda balanceando os dados entre os _DataNodes_ restantes. Esses duas partes de Software, _NameNode_ e _DataNode_ estão continuamente conversando para realização de qualquer ação necessária. Um bom artigo que explica melhor as caracteristicas dos dois: [[2]](http://hadoopinrealworld.com/namenode-and-datanode/)

Para configuração de _DataNode_ e _NameNode_ tem-se o arquivo `hdfs-site.xml` onde tem-se uma ampla variedade de configurações [[3]](https://hadoop.apache.org/docs/r2.4.1/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml).

![arquitetura hdfs](images/hdfsarchitecture.gif)

## Vantagens

- Redundância de dados
  - Você pode escolher o nível de redundância e várias configurações acerca disso.
  - Redistribuição de carga de dados dinâmica, se um nó cai, outros assumem como se ele não tivesse existido
- Tolerância a falhas
  - Muito eficiente em lidar com as falhas dos DataNodes de forma automática
- Portabilidade de sistemas
  - Foi possível operar em diferentes versões do SO sem problemas.
- Interface para operar diretamente nesse sistema de arquivos
  - Qualquer nó pode interagir com o HDFS
- Suporte para acompanhamento do ecosistema de dados
  - Interface web para acompanhar o status do cluster
  - Comandos terminal para acompanhar o status do cluster

## Desvantagens

- Falta de transparência quanto ao processamento dos dados.
  - Não parece ser possível acompanhar em tempo real o direcionamento dos dados
- Apesar de poder ter redundância, o NameNode é uma parte crítica, o HDFS depende dele.
  - Segundo [[2]](http://hadoopinrealworld.com/namenode-and-datanode/), o hdfs não pode funcionar sem um NameNode.
- Atraso ou deficiência de alerta no caso de queda dos DataNodes.
  - Quando um DataNode cai, o Hadoop não emite nenhum alerta. Após demasiado tempo ele notifica que o Nó está morto.


## Onde usar?

O HDFS pode ser usado como módulo independente. Uma situação bem típica é o armazenamento de dados em sistemas de grandes volumes de arquivos de mídia como provavelmente é feito no Youtube, Google Drive e Instagram, tal que os arquivos dos usuários estejam sempre disponíveis e integros.

Qualquer aplicação que precise salvar imagens, vídeos ou qualquer tipo arquivo, é recomendado suporte a um sistema de arquivos distribuído, uma vez que os bancos relacionais tem dificuldades em persistir esses dados.

## Usando o HDFS

O HDFS pode ser usado em qualquer instância do hadoop, ou seja, em qualquer _Node_ ativo, por exemplo, é possível usar dentro de um Data Node os comandos do fs, por exemplo:

```
$ hadoop fs -ls /
Found 3 items
drwxr-xr-x   - fsdadmin supergroup          0 2017-07-06 18:12 /input
drwxr-xr-x   - fsdadmin supergroup          0 2017-07-07 15:04 /output_2
drwx------   - fsdadmin supergroup          0 2017-07-05 11:10 /tmp
kuwener@wenerianus:/usr/hadoop-2.8.0$ hadoop fs -mkdir /folder_test
kuwener@wenerianus:/usr/hadoop-2.8.0$ hadoop fs -ls /
Found 4 items
drwxr-xr-x   - kuwener  supergroup          0 2017-07-07 16:17 /folder_test
drwxr-xr-x   - fsdadmin supergroup          0 2017-07-06 18:12 /input
drwxr-xr-x   - fsdadmin supergroup          0 2017-07-07 15:04 /output_2
drwx------   - fsdadmin supergroup          0 2017-07-05 11:10 /tmp
```

Executando o comando `$ hadoop fs` é possivel ver uma série de opções para operar dentro do HDFS.


### Referências

[1] https://www.ibm.com/developerworks/br/library/wa-introhdfs/index.html

[2] http://hadoopinrealworld.com/namenode-and-datanode/
