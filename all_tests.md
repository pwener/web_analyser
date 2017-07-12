# Testes de performance variando a quantidade de máquinas

O nosso foco foi em realizar dois tipos de testes, um voltado a tolerância a falhas, em que foram adicionados e removidos nós do cluster durante a execução e outro de perfomance, em que foi medido o tempo de execução das tarefas variando a quantidade de máquinas presentes no cluster. Aqui serão descritos três cenários:

- 3 máquinas no cluster realizando tarefas
- 2 máquinas no cluster realizando tarefas
- 1 máquina no cluster realizando tarefas

Os arquivos de input utilizados consiste de um arquivo com aproximadamente 2GB contendo palavras aleatórias.

- Vale lembrar que essa etapa foi realizada na configuração comum, usando 1 namenode e 3 datanodes, o qual 1 estava junto ao namenode e os outros dois em máquinas distintas.

- Foi utilizado o comando abaixo no hadoop fs para transferir o arquivo do disco rígido do master para o HDFS.

```
$ hadoop fs -put ~/130718954_words.input hdfs://master:9000/input/
```

## Configuração das Máquinas

- Máquina 1: master e slave
  - Computador do laboratório
  - Core i5
  - 8GB de Ram
  - Ubuntu

- Máquina 2: slave-1
  - Notebook com 4GB de RAM
  - Processador core i5 dual-core
  - Kubuntu
  - 150GB de disco

- Máquina 3: slave-2
  - Máquina Virtual com 4GB de RAM
  - 1 core de um processador quad-core 2.5 GHz Intel Core i7 (Macbook)
  - Ubuntu
  - 40GB de disco

## 3 Máquinas (Máquina 1 + Máquina 2 + Máquina 3)
A replicação testada neste experimento foi nível 2, visto que o foco foi em comparar o impacto do número de máquinas presentes no cluster.

Os resultados obtidos foram os seguintes:

```
real	10m52.373s
user	0m7.120s
sys	0m0.396s
```

Os resultados do log podem ser vistos abaixo:

```
File System Counters
  FILE: Number of bytes read=6698777882
  FILE: Number of bytes written=9488445302
  FILE: Number of read operations=0
  FILE: Number of large read operations=0
  FILE: Number of write operations=0
  HDFS: Number of bytes read=2026116230
  HDFS: Number of bytes written=2238785729
  HDFS: Number of read operations=48
  HDFS: Number of large read operations=0
  HDFS: Number of write operations=2
Job Counters
  Killed map tasks=1
  Launched map tasks=16
  Launched reduce tasks=1
  Rack-local map tasks=16
  Total time spent by all maps in occupied slots (ms)=861142
  Total time spent by all reduces in occupied slots (ms)=571881
  Total time spent by all map tasks (ms)=861142
  Total time spent by all reduce tasks (ms)=571881
  Total vcore-milliseconds taken by all map tasks=861142
  Total vcore-milliseconds taken by all reduce tasks=571881
  Total megabyte-milliseconds taken by all map tasks=881809408
  Total megabyte-milliseconds taken by all reduce tasks=585606144
Map-Reduce Framework
  Map input records=130718954
  Map output records=130718954
  Map output bytes=2548933037
  Map output materialized bytes=2787487486
  Input split bytes=1665
  Combine input records=260799855
  Combine output records=258729171
  Reduce input groups=123904370
  Reduce shuffle bytes=2787487486
  Reduce input records=128648270
  Reduce output records=123904370
  Spilled Records=438509601
  Shuffled Maps =15
  Failed Shuffles=0
  Merged Map outputs=15
  GC time elapsed (ms)=13323
  CPU time spent (ms)=730870
  Physical memory (bytes) snapshot=4528119808
  Virtual memory (bytes) snapshot=30671405056
  Total committed heap usage (bytes)=3296722944
Shuffle Errors
  BAD_ID=0
  CONNECTION=0
  IO_ERROR=0
  WRONG_LENGTH=0
  WRONG_MAP=0
  WRONG_REDUCE=0
File Input Format Counters
  Bytes Read=2026114565
File Output Format Counters
  Bytes Written=2238785729
```

<img src="https://github.com/pwener/web_analyser/blob/master/images/3_nodes_1.png" width="50%" height="50%">

<img src="https://github.com/pwener/web_analyser/blob/master/images/3_nodes_2.png" width="50%" height="50%">


## 2 Máquinas (Máquina 1 + Máquina 3)
A replicação testada neste experimento foi nível 2, assim como no experimento anterior.

- Antes de executar o job novamente foi removida a pasta output com `$ hadoop fs -rmr hdfs://master:9000/output`. Caso a pasta utilizada como output não esteja vazia, ocorre um erro ao executar o Job. Seria possível também renomear esta pasta.


Os resultados obtidos foram os seguintes:

```
real	9m50.207s
user	0m6.860s
sys	0m0.420s
```

Os resultados do log podem ser vistos abaixo:

```
File System Counters
  FILE: Number of bytes read=6698777882
  FILE: Number of bytes written=9488445302
  FILE: Number of read operations=0
  FILE: Number of large read operations=0
  FILE: Number of write operations=0
  HDFS: Number of bytes read=2026116230
  HDFS: Number of bytes written=2238785729
  HDFS: Number of read operations=48
  HDFS: Number of large read operations=0
  HDFS: Number of write operations=2
Job Counters
  Killed map tasks=1
  Launched map tasks=16
  Launched reduce tasks=1
  Rack-local map tasks=16
  Total time spent by all maps in occupied slots (ms)=932729
  Total time spent by all reduces in occupied slots (ms)=487660
  Total time spent by all map tasks (ms)=932729
  Total time spent by all reduce tasks (ms)=487660
  Total vcore-milliseconds taken by all map tasks=932729
  Total vcore-milliseconds taken by all reduce tasks=487660
  Total megabyte-milliseconds taken by all map tasks=955114496
  Total megabyte-milliseconds taken by all reduce tasks=499363840
Map-Reduce Framework
  Map input records=130718954
  Map output records=130718954
  Map output bytes=2548933037
  Map output materialized bytes=2787487486
  Input split bytes=1665
  Combine input records=260799855
  Combine output records=258729171
  Reduce input groups=123904370
  Reduce shuffle bytes=2787487486
  Reduce input records=128648270
  Reduce output records=123904370
  Spilled Records=438509601
  Shuffled Maps =15
  Failed Shuffles=0
  Merged Map outputs=15
  GC time elapsed (ms)=12876
  CPU time spent (ms)=723070
  Physical memory (bytes) snapshot=4520718336
  Virtual memory (bytes) snapshot=30679724032
  Total committed heap usage (bytes)=3280470016
Shuffle Errors
  BAD_ID=0
  CONNECTION=0
  IO_ERROR=0
  WRONG_LENGTH=0
  WRONG_MAP=0
  WRONG_REDUCE=0
File Input Format Counters
  Bytes Read=2026114565
File Output Format Counters
  Bytes Written=2238785729

```
<img src="https://github.com/pwener/web_analyser/blob/master/images/2_nodes_1.png" width="50%" height="50%">

<img src="https://github.com/pwener/web_analyser/blob/master/images/2_nodes_2.png" width="50%" height="50%">


## 2 Máquinas (Máquina 1 + Máquina 2)

Diferentemente do teste anterior, o segundo escravo estava na máquina 2 ao invés da máquina 3 e foi realizado em dias diferentes (após ter reiniciado a máquina 1). É interessante esse teste para confirmar os resultados anteriores.

- Outra vez foi reexecutado o programa, agora sem 1 dos nodes, foi rodado de novo o job após excluir output com `$ hadoop fs -rmr hdfs://master:9000/output`. Isto é necessário porque o programa cria sempre a pasta output vazia.

- Para checar os status dos nodes, é possivel executar o seguinte comando:

```
$ hadoop dfsadmin -report hdfs://master:9000/
DEPRECATED: Use of this script to execute hdfs command is deprecated.
Instead use the hdfs command for it.

Configured Capacity: 555386372096 (517.24 GB)
Present Capacity: 478432574673 (445.58 GB)
DFS Remaining: 470042180642 (437.76 GB)
DFS Used: 8390394031 (7.81 GB)
DFS Used%: 1.75%
Under replicated blocks: 2
Blocks with corrupt replicas: 0
Missing blocks: 0
Missing blocks (with replication factor 1): 0
Pending deletion blocks: 0

-------------------------------------------------
Live datanodes (2):

Name: 192.168.133.129:50010 (slave-1)
Hostname: wenerianus
Decommission Status : Normal
Configured Capacity: 72203280384 (67.24 GB)
DFS Used: 4200034374 (3.91 GB)
Non DFS Used: 15562559418 (14.49 GB)
DFS Remaining: 48244320273 (44.93 GB)
DFS Used%: 5.82%
DFS Remaining%: 66.82%
Configured Cache Capacity: 0 (0 B)
Cache Used: 0 (0 B)
Cache Remaining: 0 (0 B)
Cache Used%: 100.00%
Cache Remaining%: 0.00%
Xceivers: 5
Last contact: Thu Jul 06 19:03:05 BRT 2017


Name: 192.168.133.209:50010 (localhost)
Hostname: ip6-localhost
Decommission Status : Normal
Configured Capacity: 483183091712 (450.00 GB)
DFS Used: 4190359657 (3.90 GB)
Non DFS Used: 31854854039 (29.67 GB)
DFS Remaining: 421797860369 (392.83 GB)
DFS Used%: 0.87%
DFS Remaining%: 87.30%
Configured Cache Capacity: 0 (0 B)
Cache Used: 0 (0 B)
Cache Remaining: 0 (0 B)
Cache Used%: 100.00%
Cache Remaining%: 0.00%
Xceivers: 6
Last contact: Thu Jul 06 19:03:05 BRT 2017


Dead datanodes (1):

Name: 192.168.133.193:50010 (slave-2)
Hostname: vagrant-ubuntu-trusty-64
Decommission Status : Normal
Configured Capacity: 0 (0 B)
DFS Used: 0 (0 B)
Non DFS Used: 4548063495 (4.24 GB)
DFS Remaining: 0 (0 B)
DFS Used%: 100.00%
DFS Remaining%: 0.00%
Configured Cache Capacity: 0 (0 B)
Cache Used: 0 (0 B)
Cache Remaining: 0 (0 B)
Cache Used%: 100.00%
Cache Remaining%: 0.00%
Xceivers: 0
Last contact: Thu Jul 06 18:39:50 BRT 2017
```

- É possível notar que um DataNode está morto, conforme desejado.

- Ao rodar então o `wc.jar` sem 1 datanode, obtivemos:

```
$ hadoop jar wc.jar WordCount hdfs://master:9000/input hdfs://master:9000/output
17/07/06 18:51:34 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
17/07/06 18:51:34 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
17/07/06 18:51:53 INFO hdfs.DataStreamer: Exception in createBlockOutputStream
java.io.IOException: Got error, status=ERROR, status message , ack with firstBadLink as 192.168.133.193:50010
	at org.apache.hadoop.hdfs.protocol.datatransfer.DataTransferProtoUtil.checkBlockOpStatus(DataTransferProtoUtil.java:118)
	at org.apache.hadoop.hdfs.DataStreamer.createBlockOutputStream(DataStreamer.java:1643)
	at org.apache.hadoop.hdfs.DataStreamer.nextBlockOutputStream(DataStreamer.java:1547)
	at org.apache.hadoop.hdfs.DataStreamer.run(DataStreamer.java:658)
17/07/06 18:51:53 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073741885_1061
17/07/06 18:51:53 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/06 18:51:53 INFO input.FileInputFormat: Total input files to process : 1
17/07/06 18:51:56 INFO hdfs.DataStreamer: Exception in createBlockOutputStream
java.io.IOException: Got error, status=ERROR, status message , ack with firstBadLink as 192.168.133.193:50010
	at org.apache.hadoop.hdfs.protocol.datatransfer.DataTransferProtoUtil.checkBlockOpStatus(DataTransferProtoUtil.java:118)
	at org.apache.hadoop.hdfs.DataStreamer.createBlockOutputStream(DataStreamer.java:1643)
	at org.apache.hadoop.hdfs.DataStreamer.nextBlockOutputStream(DataStreamer.java:1547)
	at org.apache.hadoop.hdfs.DataStreamer.run(DataStreamer.java:658)
17/07/06 18:51:56 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073741887_1063
17/07/06 18:51:56 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/06 18:51:59 INFO hdfs.DataStreamer: Exception in createBlockOutputStream
java.io.IOException: Got error, status=ERROR, status message , ack with firstBadLink as 192.168.133.193:50010
	at org.apache.hadoop.hdfs.protocol.datatransfer.DataTransferProtoUtil.checkBlockOpStatus(DataTransferProtoUtil.java:118)
	at org.apache.hadoop.hdfs.DataStreamer.createBlockOutputStream(DataStreamer.java:1643)
	at org.apache.hadoop.hdfs.DataStreamer.nextBlockOutputStream(DataStreamer.java:1547)
	at org.apache.hadoop.hdfs.DataStreamer.run(DataStreamer.java:658)
17/07/06 18:51:59 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073741889_1065
17/07/06 18:51:59 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/06 18:51:59 INFO mapreduce.JobSubmitter: number of splits:15
17/07/06 18:52:02 INFO hdfs.DataStreamer: Exception in createBlockOutputStream
java.io.IOException: Got error, status=ERROR, status message , ack with firstBadLink as 192.168.133.193:50010
	at org.apache.hadoop.hdfs.protocol.datatransfer.DataTransferProtoUtil.checkBlockOpStatus(DataTransferProtoUtil.java:118)
	at org.apache.hadoop.hdfs.DataStreamer.createBlockOutputStream(DataStreamer.java:1643)
	at org.apache.hadoop.hdfs.DataStreamer.nextBlockOutputStream(DataStreamer.java:1547)
	at org.apache.hadoop.hdfs.DataStreamer.run(DataStreamer.java:658)
17/07/06 18:52:02 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073741891_1067
17/07/06 18:52:02 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/06 18:52:02 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499374686704_0002
17/07/06 18:52:03 INFO impl.YarnClientImpl: Submitted application application_1499374686704_0002
17/07/06 18:52:03 INFO mapreduce.Job: The url to track the job: http://HPHost02:8088/proxy/application_1499374686704_0002/
17/07/06 18:52:03 INFO mapreduce.Job: Running job: job_1499374686704_0002
17/07/06 18:52:09 INFO mapreduce.Job: Job job_1499374686704_0002 running in uber mode : false
17/07/06 18:52:09 INFO mapreduce.Job:  map 0% reduce 0%
17/07/06 18:52:26 INFO mapreduce.Job:  map 1% reduce 0%
17/07/06 18:52:28 INFO mapreduce.Job:  map 3% reduce 0%
17/07/06 18:52:30 INFO mapreduce.Job:  map 4% reduce 0%
17/07/06 18:52:32 INFO mapreduce.Job:  map 6% reduce 0%
17/07/06 18:52:33 INFO mapreduce.Job:  map 7% reduce 0%
...
17/07/06 19:03:03 INFO mapreduce.Job:  map 100% reduce 97%
17/07/06 19:03:15 INFO mapreduce.Job:  map 100% reduce 98%
17/07/06 19:03:27 INFO mapreduce.Job:  map 100% reduce 99%
17/07/06 19:03:39 INFO mapreduce.Job:  map 100% reduce 100%
17/07/06 19:03:47 INFO mapreduce.Job: Job job_1499374686704_0002 completed successfully
17/07/06 19:03:47 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=6698777882
		FILE: Number of bytes written=9488445302
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=2026116230
		HDFS: Number of bytes written=2238785729
		HDFS: Number of read operations=48
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters
		Killed map tasks=1
		Launched map tasks=16
		Launched reduce tasks=1
		Rack-local map tasks=16
		Total time spent by all maps in occupied slots (ms)=916813
		Total time spent by all reduces in occupied slots (ms)=627806
		Total time spent by all map tasks (ms)=916813
		Total time spent by all reduce tasks (ms)=627806
		Total vcore-milliseconds taken by all map tasks=916813
		Total vcore-milliseconds taken by all reduce tasks=627806
		Total megabyte-milliseconds taken by all map tasks=938816512
		Total megabyte-milliseconds taken by all reduce tasks=642873344
	Map-Reduce Framework
		Map input records=130718954
		Map output records=130718954
		Map output bytes=2548933037
		Map output materialized bytes=2787487486
		Input split bytes=1665
		Combine input records=260799855
		Combine output records=258729171
		Reduce input groups=123904370
		Reduce shuffle bytes=2787487486
		Reduce input records=128648270
		Reduce output records=123904370
		Spilled Records=438509601
		Shuffled Maps =15
		Failed Shuffles=0
		Merged Map outputs=15
		GC time elapsed (ms)=13411
		CPU time spent (ms)=745140
		Physical memory (bytes) snapshot=4528783360
		Virtual memory (bytes) snapshot=30679724032
		Total committed heap usage (bytes)=3268935680
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters
		Bytes Read=2026114565
	File Output Format Counters
		Bytes Written=2238785729
```

Após executar esse teste foi possível verificar que:
- O tempo de execução foi um pouco melhor do que o teste realizado com o outro escravo, mas a diferença foi pequena.

- Apesar de ter iniciado o programa desde o inicio sem 1 DataNode, conforme mostra o próprio log, o programa executou de forma sucedida, mostrando que a redundância funcionou. Ou seja, os dados haviam sido distribuídos entre os 3 nós, e ao executar o job, as duas máquinas foram suficientes para executar com sucesso o programa.


## 1 Máquina (Máquina 1)
A replicação testada neste experimento foi nível 2, assim como no experimento anterior.

Os resultados obtidos foram os seguintes:

```
real	8m20.021s
user	0m6.544s
sys	0m0.400s
```

Os resultados do log podem ser vistos abaixo:

```
File System Counters
  FILE: Number of bytes read=6698777882
  FILE: Number of bytes written=9488445302
  FILE: Number of read operations=0
  FILE: Number of large read operations=0
  FILE: Number of write operations=0
  HDFS: Number of bytes read=2026116230
  HDFS: Number of bytes written=2238785729
  HDFS: Number of read operations=48
  HDFS: Number of large read operations=0
  HDFS: Number of write operations=2
Job Counters
  Killed map tasks=1
  Launched map tasks=16
  Launched reduce tasks=1
  Rack-local map tasks=16
  Total time spent by all maps in occupied slots (ms)=901282
  Total time spent by all reduces in occupied slots (ms)=349741
  Total time spent by all map tasks (ms)=901282
  Total time spent by all reduce tasks (ms)=349741
  Total vcore-milliseconds taken by all map tasks=901282
  Total vcore-milliseconds taken by all reduce tasks=349741
  Total megabyte-milliseconds taken by all map tasks=922912768
  Total megabyte-milliseconds taken by all reduce tasks=358134784
Map-Reduce Framework
  Map input records=130718954
  Map output records=130718954
  Map output bytes=2548933037
  Map output materialized bytes=2787487486
  Input split bytes=1665
  Combine input records=260799855
  Combine output records=258729171
  Reduce input groups=123904370
  Reduce shuffle bytes=2787487486
  Reduce input records=128648270
  Reduce output records=123904370
  Spilled Records=438509601
  Shuffled Maps =15
  Failed Shuffles=0
  Merged Map outputs=15
  GC time elapsed (ms)=11612
  CPU time spent (ms)=701000
  Physical memory (bytes) snapshot=4484026368
  Virtual memory (bytes) snapshot=30683332608
  Total committed heap usage (bytes)=3220701184
Shuffle Errors
  BAD_ID=0
  CONNECTION=0
  IO_ERROR=0
  WRONG_LENGTH=0
  WRONG_MAP=0
  WRONG_REDUCE=0
File Input Format Counters
  Bytes Read=2026114565
File Output Format Counters
  Bytes Written=2238785729
```

<img src="https://github.com/pwener/web_analyser/blob/master/images/1_node_1.png" width="50%" height="50%">

<img src="https://github.com/pwener/web_analyser/blob/master/images/1_node_2.png" width="50%" height="50%">

OBS: Apesar de o Hadoop indicar que existem 2 nós ativos, observando a imagem 1 é possível perceber que o último contato com esse nó ocorreu antes de ter sido realizado o teste (599s antes).

## Resultado deste cenário de teste

O resultado obtido foi o seguinte:

| Número de Máquinas    | Tempo de Execução |
|----------|-------|
| 3   | 10m52.373s |
| 2    | 9m50.207s |
| 1 | 8m20.021s |

Chegamos, portanto, a um resultado inesperado em que ao aumentar a quantidade de nós, a performance do cluster diminuiu.



# Testes voltados a tolerância a falhas no Hadoop

Foram realizados com o intuito de confirmar os resultados obtidos relacionados a performance e, simultaneamente, verificar como o Hadoop lida com a desconexão de nós.


## Execução em 2 Slaves com desconexão no decorrer do processo

- Outra vez com apenas 2 DataNodes, executamos outra vez o job derrubando um DataNode no meio do reduce, afim de testar a redundância e tolerância a falhas:

```
$ hadoop jar wc.jar WordCount hdfs://master:9000/input hdfs://master:9000/output
17/07/06 19:09:34 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
17/07/06 19:09:34 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
17/07/06 19:09:35 INFO input.FileInputFormat: Total input files to process : 1
17/07/06 19:09:35 INFO mapreduce.JobSubmitter: number of splits:15
17/07/06 19:09:35 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499374686704_0003
17/07/06 19:09:35 INFO impl.YarnClientImpl: Submitted application application_1499374686704_0003
17/07/06 19:09:35 INFO mapreduce.Job: The url to track the job: http://HPHost02:8088/proxy/application_1499374686704_0003/
17/07/06 19:09:35 INFO mapreduce.Job: Running job: job_1499374686704_0003
17/07/06 19:09:41 INFO mapreduce.Job: Job job_1499374686704_0003 running in uber mode : false
17/07/06 19:09:41 INFO mapreduce.Job:  map 0% reduce 0%
17/07/06 19:09:59 INFO mapreduce.Job:  map 2% reduce 0%
17/07/06 19:10:01 INFO mapreduce.Job:  map 3% reduce 0%
17/07/06 19:10:03 INFO mapreduce.Job:  map 5% reduce 0%
17/07/06 19:10:05 INFO mapreduce.Job:  map 7% reduce 0%
....
17/07/06 19:15:35 INFO mapreduce.Job:  map 100% reduce 97%
17/07/06 19:15:41 INFO mapreduce.Job:  map 100% reduce 99%
17/07/06 19:15:49 INFO mapreduce.Job:  map 100% reduce 100%
17/07/06 19:15:59 INFO mapreduce.Job: Job job_1499374686704_0003 completed successfully
17/07/06 19:15:59 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=6698777882
		FILE: Number of bytes written=9488445302
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=2026116230
		HDFS: Number of bytes written=2238785729
		HDFS: Number of read operations=48
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters
		Killed map tasks=1
		Launched map tasks=16
		Launched reduce tasks=1
		Rack-local map tasks=16
		Total time spent by all maps in occupied slots (ms)=897757
		Total time spent by all reduces in occupied slots (ms)=298911
		Total time spent by all map tasks (ms)=897757
		Total time spent by all reduce tasks (ms)=298911
		Total vcore-milliseconds taken by all map tasks=897757
		Total vcore-milliseconds taken by all reduce tasks=298911
		Total megabyte-milliseconds taken by all map tasks=919303168
		Total megabyte-milliseconds taken by all reduce tasks=306084864
	Map-Reduce Framework
		Map input records=130718954
		Map output records=130718954
		Map output bytes=2548933037
		Map output materialized bytes=2787487486
		Input split bytes=1665
		Combine input records=260799855
		Combine output records=258729171
		Reduce input groups=123904370
		Reduce shuffle bytes=2787487486
		Reduce input records=128648270
		Reduce output records=123904370
		Spilled Records=438509601
		Shuffled Maps =15
		Failed Shuffles=0
		Merged Map outputs=15
		GC time elapsed (ms)=11911
		CPU time spent (ms)=687010
		Physical memory (bytes) snapshot=4446457856
		Virtual memory (bytes) snapshot=30679662592
		Total committed heap usage (bytes)=3232759808
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters
		Bytes Read=2026114565
	File Output Format Counters
		Bytes Written=2238785729

```

- A tarefa foi executada com sucesso, a tolerância a falhas e a redundância foram atestadas.

- Foi possível ver que com 1 DataNode caindo no meio do mapreduce(foi desconectado o slave-1 em mais ou menos 60% do progresso) e o tempo de execução nas tarefas de map e reduce cairam. Isso não era esperado.

- Algumas possíveis explicações para isso:
	- A conexão Wi-fi utilizada estava sendo gargalo para comunicação master-slaves.
	- A redundância passou a não ser feita com apenas 1 Node, acelerando mais o processo de MapReduce.
	- A redudância é um gargalo para 3 datanodes processando a quantidade usada de dados(aproximadamente 2 GB). Quanto maior a massa de dados mais rentável se torna o processamento Hadoop.

- Afim de tentar esclarecer algumas dessas hipóteses mais experimentos foram realizados.



# Testes Hadoop com cabo de rede - Validando experimento

## Utilizando duas máquinas

- Uma vez que os testes passados foram feitos com os data nodes conectados via wi-fi, percebeu-se que talvez a conectividade de rede estaria impactando nos experimentos. Para tirar essas dúvidas foram realizados experimentos com dois nodes conectados pelo cabo de rede.

- A execução com um master e um cabo de rede teve os seguintes resultados:

```
17/07/07 17:02:11 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073742071_1248
17/07/07 17:02:11 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/07 17:02:11 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499457518771_0001
17/07/07 17:02:11 INFO impl.YarnClientImpl: Submitted application application_1499457518771_0001
17/07/07 17:02:11 INFO mapreduce.Job: The url to track the job: http://HPHost02:8088/proxy/application_1499457518771_0001/
17/07/07 17:02:11 INFO mapreduce.Job: Running job: job_1499457518771_0001
17/07/07 17:02:17 INFO mapreduce.Job: Job job_1499457518771_0001 running in uber mode : false
17/07/07 17:02:17 INFO mapreduce.Job:  map 0% reduce 0%
17/07/07 17:02:34 INFO mapreduce.Job:  map 1% reduce 0%
17/07/07 17:02:36 INFO mapreduce.Job:  map 3% reduce 0%
17/07/07 17:02:40 INFO mapreduce.Job:  map 6% reduce 0%
17/07/07 17:02:43 INFO mapreduce.Job:  map 7% reduce 0%
17/07/07 17:02:44 INFO mapreduce.Job:  map 10% reduce 0%
...
17/07/07 17:10:49 INFO mapreduce.Job:  map 100% reduce 97%
17/07/07 17:10:55 INFO mapreduce.Job:  map 100% reduce 98%
17/07/07 17:11:01 INFO mapreduce.Job:  map 100% reduce 99%
17/07/07 17:11:07 INFO mapreduce.Job:  map 100% reduce 100%
17/07/07 17:11:10 INFO mapreduce.Job: Job job_1499457518771_0001 completed successfully
17/07/07 17:11:10 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=6698777882
		FILE: Number of bytes written=9488445302
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=2026116230
		HDFS: Number of bytes written=2238785729
		HDFS: Number of read operations=48
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters
		Killed map tasks=2
		Launched map tasks=17
		Launched reduce tasks=1
		Rack-local map tasks=17
		Total time spent by all maps in occupied slots (ms)=990826
		Total time spent by all reduces in occupied slots (ms)=460028
		Total time spent by all map tasks (ms)=990826
		Total time spent by all reduce tasks (ms)=460028
		Total vcore-milliseconds taken by all map tasks=990826
		Total vcore-milliseconds taken by all reduce tasks=460028
		Total megabyte-milliseconds taken by all map tasks=1014605824
		Total megabyte-milliseconds taken by all reduce tasks=471068672
	Map-Reduce Framework
		Map input records=130718954
		Map output records=130718954
		Map output bytes=2548933037
		Map output materialized bytes=2787487486
		Input split bytes=1665
		Combine input records=260799855
		Combine output records=258729171
		Reduce input groups=123904370
		Reduce shuffle bytes=2787487486
		Reduce input records=128648270
		Reduce output records=123904370
		Spilled Records=438509601
		Shuffled Maps =15
		Failed Shuffles=0
		Merged Map outputs=15
		GC time elapsed (ms)=13514
		CPU time spent (ms)=705660
		Physical memory (bytes) snapshot=4549906432
		Virtual memory (bytes) snapshot=30695657472
		Total committed heap usage (bytes)=3287810048
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters
		Bytes Read=2026114565
	File Output Format Counters
		Bytes Written=2238785729
```

## Utilizando duas máquinas e desconectando um nó

Desconectando um nó durante a fase de map, obtivemos os seguintes resultados:

```
$ time hadoop jar wc.jar WordCount hdfs://master:9000/input hdfs://master:9000/output
17/07/07 17:25:40 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
17/07/07 17:25:40 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
17/07/07 17:25:40 INFO input.FileInputFormat: Total input files to process : 1
17/07/07 17:25:41 INFO mapreduce.JobSubmitter: number of splits:15
17/07/07 17:25:41 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499457518771_0003
17/07/07 17:25:41 INFO impl.YarnClientImpl: Submitted application application_1499457518771_0003
17/07/07 17:25:41 INFO mapreduce.Job: The url to track the job: http://HPHost02:8088/proxy/application_1499457518771_0003/
17/07/07 17:25:41 INFO mapreduce.Job: Running job: job_1499457518771_0003
17/07/07 17:25:46 INFO mapreduce.Job: Job job_1499457518771_0003 running in uber mode : false
17/07/07 17:25:46 INFO mapreduce.Job:  map 0% reduce 0%
17/07/07 17:26:04 INFO mapreduce.Job:  map 1% reduce 0%
17/07/07 17:26:05 INFO mapreduce.Job:  map 3% reduce 0%
17/07/07 17:26:09 INFO mapreduce.Job:  map 4% reduce 0%
17/07/07 17:26:10 INFO mapreduce.Job:  map 6% reduce 0%
17/07/07 17:26:11 INFO mapreduce.Job:  map 7% reduce 0%
...
17/07/07 17:31:46 INFO mapreduce.Job:  map 100% reduce 98%
17/07/07 17:31:52 INFO mapreduce.Job:  map 100% reduce 99%
17/07/07 17:31:54 INFO mapreduce.Job:  map 100% reduce 100%
17/07/07 17:32:05 INFO mapreduce.Job: Job job_1499457518771_0003 completed successfully
17/07/07 17:32:05 INFO mapreduce.Job: Counters: 50
	File System Counters
		FILE: Number of bytes read=6698777882
		FILE: Number of bytes written=9488445302
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=2026116230
		HDFS: Number of bytes written=2238785729
		HDFS: Number of read operations=48
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters
		Killed map tasks=1
		Launched map tasks=16
		Launched reduce tasks=1
		Rack-local map tasks=16
		Total time spent by all maps in occupied slots (ms)=895788
		Total time spent by all reduces in occupied slots (ms)=296822
		Total time spent by all map tasks (ms)=895788
		Total time spent by all reduce tasks (ms)=296822
		Total vcore-milliseconds taken by all map tasks=895788
		Total vcore-milliseconds taken by all reduce tasks=296822
		Total megabyte-milliseconds taken by all map tasks=917286912
		Total megabyte-milliseconds taken by all reduce tasks=303945728
	Map-Reduce Framework
		Map input records=130718954
		Map output records=130718954
		Map output bytes=2548933037
		Map output materialized bytes=2787487486
		Input split bytes=1665
		Combine input records=260799855
		Combine output records=258729171
		Reduce input groups=123904370
		Reduce shuffle bytes=2787487486
		Reduce input records=128648270
		Reduce output records=123904370
		Spilled Records=438509601
		Shuffled Maps =15
		Failed Shuffles=0
		Merged Map outputs=15
		GC time elapsed (ms)=11834
		CPU time spent (ms)=687830
		Physical memory (bytes) snapshot=4460859392
		Virtual memory (bytes) snapshot=30680518656
		Total committed heap usage (bytes)=3253731328
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters
		Bytes Read=2026114565
	File Output Format Counters
		Bytes Written=2238785729
```

## Conclusão desses cenários de teste

- Percebe-se novamente um tempo de execução menor com a queda de um DataNode. Portanto a conectividade não foi o fator que impactou nos experimentos passados.

- Portanto, há duas hipóteses restantes:
	- A redundância passou a não ser feita com apenas 1 Node, acelerando mais o processo de MapReduce.
	- A redudância é um gargalo para 3 datanodes processando a quantidade usada de dados(aproximadamente 2 GB). Ou seja, quanto maior a massa de dados mais rentável se torna o processamento Hadoop.

- Bem provavelmente as duas estão certas, pois o Hadoop foi criado para trabalhar com grandes quantidades de dado em um sistema altamente clusterizado. Logo, quanto mais dados, maior será a diferença testada, e mais eficiente será o esquema de clusters.

- Apesar da piora em desempenho, pode-se afirmar que a replicação dos dados é um mecanismo de tolerância a falhas importante utilizado pelo framework.

- Por questões de estrutura bem como de quantidade de dados, não foi possível realizar outros testes possíveis.

- Alguns experimentos que revelariam reforçariam nossas hipóteses:

	- Testar com uma ordem de 100 GB de dados.
	- Testar com pelo menos 10 nós com 100 GB de dados.
	- Testar numa mesma infra-estrutura com redundância de nível 3, 4 ou mais, para ver qual gargalo disso.
	- Testar com blocos de dados menores e maiores e monitorar como isso impacta no desempenho.
