# Testes no Hadoop


- Fizemos um teste com o contador usando apenas um arquivo de 1.9 GB de nomes aleatórios, afim de testar o comportamento do hadoop trabalhando com essa ordem de tamanho.

- Vale lembrar que essa etapa foi realizada na configuração comum, usando 1 namenode e 3 datanodes, o qual 1 estava junto ao namenode e os outros dois em máquinas distintas.

- Para tal, foi utilizado o comando abaixo no hadoop fs, para transferir o arquivo do disco rígido do master para o HDFS.

```
$ hadoop fs -put ~/130718954_words.input hdfs://master:9000/input/
```

- O comando mostra uma série de logs, o qual é possível visualizar erros ou se a operação foi bem sucedida.

- Depois da cópia para o hdfs, o WordCount foi executado:

- Observação: O log de todas execuções foi cortado na parte de MapReduce onde mostra a porcentagem da tarefa, afim de reduzir a quantidade de linhas descritas no relatório.

```
$ hadoop jar wc.jar WordCount hdfs://master:9000/input hdfs://master:9000/output
17/07/06 18:19:47 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
17/07/06 18:19:48 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
17/07/06 18:19:48 INFO input.FileInputFormat: Total input files to process : 1
17/07/06 18:19:51 INFO hdfs.DataStreamer: Exception in createBlockOutputStream
java.io.IOException: Got error, status=ERROR, status message , ack with firstBadLink as 192.168.133.193:50010
	at org.apache.hadoop.hdfs.protocol.datatransfer.DataTransferProtoUtil.checkBlockOpStatus(DataTransferProtoUtil.java:118)
	at org.apache.hadoop.hdfs.DataStreamer.createBlockOutputStream(DataStreamer.java:1643)
	at org.apache.hadoop.hdfs.DataStreamer.nextBlockOutputStream(DataStreamer.java:1547)
	at org.apache.hadoop.hdfs.DataStreamer.run(DataStreamer.java:658)
17/07/06 18:19:51 WARN hdfs.DataStreamer: Abandoning BP-55179728-127.0.0.1-1499196379193:blk_1073741858_1034
17/07/06 18:19:51 WARN hdfs.DataStreamer: Excluding datanode DatanodeInfoWithStorage[192.168.133.193:50010,DS-3f4cc3da-e758-46fd-aafd-0a753d12865c,DISK]
17/07/06 18:19:51 INFO mapreduce.JobSubmitter: number of splits:15
17/07/06 18:19:51 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1499374686704_0001
17/07/06 18:19:52 INFO impl.YarnClientImpl: Submitted application application_1499374686704_0001
17/07/06 18:19:52 INFO mapreduce.Job: The url to track the job: http://HPHost02:8088/proxy/application_1499374686704_0001/
17/07/06 18:19:52 INFO mapreduce.Job: Running job: job_1499374686704_0001
17/07/06 18:19:59 INFO mapreduce.Job: Job job_1499374686704_0001 running in uber mode : false
17/07/06 18:19:59 INFO mapreduce.Job:  map 0% reduce 0%
17/07/06 18:20:17 INFO mapreduce.Job:  map 1% reduce 0%
17/07/06 18:20:18 INFO mapreduce.Job:  map 3% reduce 0%
17/07/06 18:20:21 INFO mapreduce.Job:  map 4% reduce 0%
17/07/06 18:20:23 INFO mapreduce.Job:  map 6% reduce 0%
17/07/06 18:20:24 INFO mapreduce.Job:  map 8% reduce 0%
...
17/07/06 18:33:34 INFO mapreduce.Job:  map 100% reduce 97%
17/07/06 18:33:46 INFO mapreduce.Job:  map 100% reduce 98%
17/07/06 18:34:04 INFO mapreduce.Job:  map 100% reduce 99%
17/07/06 18:34:16 INFO mapreduce.Job:  map 100% reduce 100%
17/07/06 18:34:23 INFO mapreduce.Job: Job job_1499374686704_0001 completed successfully
17/07/06 18:34:24 INFO mapreduce.Job: Counters: 50
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
		Total time spent by all maps in occupied slots (ms)=1099789
		Total time spent by all reduces in occupied slots (ms)=769374
		Total time spent by all map tasks (ms)=1099789
		Total time spent by all reduce tasks (ms)=769374
		Total vcore-milliseconds taken by all map tasks=1099789
		Total vcore-milliseconds taken by all reduce tasks=769374
		Total megabyte-milliseconds taken by all map tasks=1126183936
		Total megabyte-milliseconds taken by all reduce tasks=787838976
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
		GC time elapsed (ms)=13454
		CPU time spent (ms)=756920
		Physical memory (bytes) snapshot=4443439104
		Virtual memory (bytes) snapshot=30708047872
		Total committed heap usage (bytes)=3250061312
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


- Então desconectado 1 node, foi rodado de novo o job após excluir output com `$ hadoop fs -rmr hdfs://master:9000/output`. Isto é necessário porque o programa cria sempre a pasta output vazia.

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


- Agora com apenas 2 nodes, executamos outra vez o job derrubando um DataNode no meio do reduce, afim de testar a redundância e tolerância a falhas:


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
