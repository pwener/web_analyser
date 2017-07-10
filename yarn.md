# YARN (Yet Another Resource Negotiator)

## Contexto

YARN Surgiu como uma solução para grande parte dos problemas presentes no Hadoop 1.0. Dessa forma, neste relatório será descrito resumidamente como funcionava a primeira versão do Hadoop, assim como os problemas relativos a essa versão e como o YARN os solucionou.

### Entendendo Hadoop 1 (Resumidamente)

O HDFS, ou a parte do Hadoop responsável por armazenar dados, mudou pouco da primeira para a segunda versão do Hadoop. A Maior mudança foi com relação a parte do Hadoop relacionada a processamento de dados, e este será o foco desta tópico do relatório.

A imagem abaixo será utilizada para auxiliar na explicação do funcionamento do Hadoop.

<img src="https://github.com/pwener/web_analyser/blob/master/images/YARN_1.png" width="50%" height="50%">

Após escrever nosso código seguindo o padrão MapReduce, ele será executado pelo Hadoop na seguinte ordem:

- 1) Primeiramente, o programa MapReduce é submetido ao Job Tracker.
  - O Job Tracker verifica se o programa contém as informações necessárias para ser executado pelo framework. Caso positivo ele verifica qual conjunto de dados (dataset) o programa utilizará, isto é informado pelo usuário.
  - É interessante citar que independentemente de qual local do cluster submetermos o programa, ele irá para o Job Tracker.
  - Além disso, ao submetermos um programa MapReduce para o cluster este passa a ser chamado de Job.

- 2) O Job Tracker verifica, por meio do NameNode, em quais DataNodes o conjunto de dados a ser processado está.

- 3) Após identificar os DataNodes onde estão o dataset, o Job Tracker copia o programa do MapReduce para estes nós.

- 4) A fim de executar o programa, o Job Tracker realiza um chamado para cada um dos Task Trackers, que estão em cada um dos DataNodes, e os passa uma tarefa.

- Os Job Trackers também monitoram o ciclo de vida dos Tasks Trackers.

- Além de tudo, eles coletam o resultados dos Task Trackers e retornam o resultado para o cliente.


### Alguns Problemas com Hadoop 1

Após descrever o funcionamento do Hadoop 1, é possível perceber alguns problemas com esta arquitetura. Estes problemas arquiteturais serão detalhados nos tópicos abaixo.

#### Job Tracker sobrecarregado

Como o Job Tracker fica centralizado em somente uma máquina, ele fica muito sobrecarregado quando está sendo utilizado em clusters muito grandes.

Suponha um cenário em que estão rodando 4.000 Jobs em um cluster e cada um desses possui 10 Tasks. Isso significa que um único Job Tracker, rodando em uma máquina, seria responsável por monitorar 40.000 Task Trackers, coletar os resultados deles e submetendo novos Jobs.

Percebe-se, portanto, que isso é um gargalo nessa arquitetura e é por isso que  o Hadoop 1 é limitado a cerca de 4000 nós por cluster.

#### Possível utilizar somente Map-Reduce

Um outro problema, ou limitação do Hadoop está relacionado ao fato desse framework funcionar somente com MapReduce, não havendo outras alternativas.

Além disso, inicialmente, tudo deveria ser escrito em Java. Para contornar esta última limitação, foram criadas ferramentas como o Hive que permite com que scripts para a manipulação dos dados sejam escritos usando linguagem SQL, facilitando, portanto, o trabalhos de administradores de Banco de Dados. Porém, esses scripts são traduzidos em código MapReduce para que possam rodar no Cluster.

Percebe-se, portanto, que mesmo novas ferramentas sendo criadas para o ecossistema Hadoop, este continua limitado ao paradigma MapReduce.

#### Controle sobre Recursos das Máquinas

Outro aspecto negativo está relacionado ao fato do Job Tracker não possuir nenhum controle sobre os recursos da máquina dos DataNodes.
Sem este conhecimento, algumas máquinas pode ser subutilizadas e outras sobreutilizadas.

Suponhamos um cenário em que temos 2 máquinas, uma com 4GB e outra com 8GB de RAM e que rodarão um total de 12 mappers, cada utilizando 1GB. Caso cada DataNode possua 6 "Input Splits", a máquina com 4GB rodará 4 Mappers e terá 2 esperando para serem executados, enquanto a máquina com 8GB rodará os 6 e terá 2GB sobrando.

Percebe-se, portanto, que não há muito planejamento para o escalonamento dos Jobs. Também não há o monitoramento de recursos.

## Hadoop 2 + YARN

A "parte" do Hadoop 2 responsável por processamento é chamado de YARN (Yet Another Resource Negotiator). Portanto, pode-se dizer que o framework responsável pelo armazenamento de dados do hadoop é o HDFS, já o framework responsável pelo processamento desses dados é o YARN.

### Funcionamento

O papel de Job Tracker e Task Tracker é substituído por outros 3 Daemons no Hadoop 2:

- Resource Manager.
- Node Manager.
- Application Master.

<img src="https://github.com/pwener/web_analyser/blob/master/images/YARN_2.png" width="50%" height="50%">

De forma resumida, o funcionamento do Hadoop 2.0 ocorre da seguinte forma:

- 1) Quando for submetido um novo Job para o Hadoop, o Resource Manager o aceita e contacta algum dos Node Managers e o informa que um novo Job deverá ser processado.

- 2) O Node Manager cria um Daemon chamado Application Master na máquina em que se encontra.
  - É interessante citar que o Número de Application Masters será sempre igual ao número de Jobs rodando no cluster.

- 3) O Daemon Application master é responsável por executar o Job relacionado a ele. Ele verifica se este Job é pequeno (Uber), se for ele executa na mesma máquina. Caso contrário, ele pede para o Resource Manager para localizar outros nós com recursos disponíveis. O resource Manager, obviamente, leva em conta a localização dos dados ao disponibilizar recursos.

- 4) De acordo com a resposta do Resource Manager, o Application Master contacta os Node Managers e pede para que eles criem um Container. Esse container também é chamado de Yarn Child, e é onde as tasks serão executadas.

- 5) Através do HDFS, os containers obtém os recursos necessários para executar a tarefa e então o programa é executados.

- 6) Ao finalizar a tarefa, o Yarn Child avisa o App Master que por sua vez envia o resultado para o Cliente.


#### Resource Manager

O Resource Manager tem basicamente duas responsabilidades:

- Scheduler
- Application Manager

Scheduler está relacionado somente ao escalonamento dos Jobs. Enquanto o Application Manager é responsável pelo monitoramento e controles das aplicações. O Resource Manager, também contém informações globais relacionado ao estados de cada um dos nós e informação sobre seus  recursos. Estas informações são enviadas pelos Node Managers.

##### Tipos de Scheduling

Um problema erro comum  ao configurar um cluster Hadoop é não analisar qual o tipo de escalonamento ideal. Muitas vezes são executados Jobs muito demorados no cluster e estes impedem a execução de outros mais importantes e rápidos, isso é comum quando é utilizado um escalonador do tipo FIFO.
Existem vários outros tipos de escalonadores, os mais utilizados para o Hadoop são:

- Fair Scheduler
- Capacity Scheduler



#### Node Manager

O Node Manager está presente em todos nós escravos e eles são responsáveis por criar e gerenciar containers. Além disso, informam o Resource manager sobre o estado dos recursos na máquina.

#### Application Master

O Application master é o responsável por executar o Job, é ele quem monitora cada uma das tasks sendo realizadas nos diferentes nós. Após a execução do Job esse processo é finalizado.

Como existe um Application Master para cada job que está sendo executado, a introdução do Application Master foi bem interessante, pois resolveu o gargalo relacionado ao Job Tracker que existia na arquitetura anterior, isso permite uma maior escalabilidade.


#### Yarn Child / Container

O Yarn Child é responsável por executar as tasks. Além disso, ele atualiza o application master com informações, como o progresso da execução da task.


### Características

Algumas características importantes trazidas pelo YARN ao Hadoop são:

#### Alternativas ao MapReduce

Com o Surgimento do YARN, o Hadoop não está mais limitado ao MapReduce e pode utilizar diversas outros framework.

Alguns exemplos são:

- Spark: Diferentemente do MapReduce, os dados são armazenados em Memória RAM, isso faz com que o processamento dos dados seja bem mais rápido.

- Storm: Framework interessante para aplicações que demandam processamento em tempo-real. Ele processa os dados assim que entram no sistema, ou seja, é um "Stream processing system".

Dentre outros.

#### Maior escalabilidade

Conforme citado anteriormente, ao resolver o gargalo associado ao Job Tracker, o YARN melhorou bastante a escalabilidade do framework Hadoop.

#### Melhor controle dos recursos do Cluster

Conforme citado anteriormente, o controle de recursos do cluster melhorou significativamente.


#### Containers

Possibilitam uma melhor utilização de memória do cluster e podem rodar tasks genéricas, diferentemente do Hadoop 1, em que as únicas tasks possíveis de serem executadas eram Map e Reduce.
