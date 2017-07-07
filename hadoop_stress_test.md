# Hadoop com arquivos de GB

- Fizemos um teste com o contador usando apenas um arquivo de 1.9 GB de nomes aleatórios, afim de testar o comportamento do hadoop trabalhando com essa ordem de tamanho.

- Vale lembrar que essa etapa foi realizada na configuração comum, usando 1 namenode e 2 datanodes.

- Para tal, foi utilizado o comando abaixo no hadoop fs, para transferir o arquivo do disco rigido do master para o hdfs.

```
$ hadoop fs -put ~/130718954_words.input hdfs://master:9000/input/

```


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
17/07/06 18:20:25 INFO mapreduce.Job:  map 10% reduce 0%
17/07/06 18:20:26 INFO mapreduce.Job:  map 11% reduce 0%
17/07/06 18:20:27 INFO mapreduce.Job:  map 12% reduce 0%
17/07/06 18:20:30 INFO mapreduce.Job:  map 13% reduce 0%
17/07/06 18:20:31 INFO mapreduce.Job:  map 14% reduce 0%
17/07/06 18:20:33 INFO mapreduce.Job:  map 16% reduce 0%
17/07/06 18:20:35 INFO mapreduce.Job:  map 17% reduce 0%
17/07/06 18:20:36 INFO mapreduce.Job:  map 18% reduce 0%
17/07/06 18:20:39 INFO mapreduce.Job:  map 19% reduce 0%
17/07/06 18:20:41 INFO mapreduce.Job:  map 20% reduce 0%
17/07/06 18:20:42 INFO mapreduce.Job:  map 21% reduce 0%
17/07/06 18:20:43 INFO mapreduce.Job:  map 22% reduce 0%
17/07/06 18:20:45 INFO mapreduce.Job:  map 24% reduce 0%
17/07/06 18:20:48 INFO mapreduce.Job:  map 25% reduce 0%
17/07/06 18:20:51 INFO mapreduce.Job:  map 26% reduce 0%
17/07/06 18:20:54 INFO mapreduce.Job:  map 27% reduce 0%
17/07/06 18:20:57 INFO mapreduce.Job:  map 28% reduce 0%
17/07/06 18:21:00 INFO mapreduce.Job:  map 29% reduce 0%
17/07/06 18:21:01 INFO mapreduce.Job:  map 30% reduce 0%
17/07/06 18:21:06 INFO mapreduce.Job:  map 31% reduce 0%
17/07/06 18:21:07 INFO mapreduce.Job:  map 32% reduce 0%
17/07/06 18:21:12 INFO mapreduce.Job:  map 33% reduce 0%
17/07/06 18:21:15 INFO mapreduce.Job:  map 34% reduce 0%
17/07/06 18:21:16 INFO mapreduce.Job:  map 35% reduce 0%
17/07/06 18:21:21 INFO mapreduce.Job:  map 36% reduce 0%
17/07/06 18:21:24 INFO mapreduce.Job:  map 37% reduce 0%
17/07/06 18:21:25 INFO mapreduce.Job:  map 38% reduce 0%
17/07/06 18:21:29 INFO mapreduce.Job:  map 39% reduce 0%
17/07/06 18:21:30 INFO mapreduce.Job:  map 40% reduce 0%
17/07/06 18:21:56 INFO mapreduce.Job:  map 48% reduce 4%
17/07/06 18:22:02 INFO mapreduce.Job:  map 54% reduce 4%
17/07/06 18:22:08 INFO mapreduce.Job:  map 55% reduce 9%
17/07/06 18:22:14 INFO mapreduce.Job:  map 57% reduce 9%
17/07/06 18:22:15 INFO mapreduce.Job:  map 60% reduce 9%
17/07/06 18:22:20 INFO mapreduce.Job:  map 61% reduce 11%
17/07/06 18:22:26 INFO mapreduce.Job:  map 62% reduce 13%
17/07/06 18:22:27 INFO mapreduce.Job:  map 63% reduce 13%
17/07/06 18:22:32 INFO mapreduce.Job:  map 65% reduce 13%
17/07/06 18:22:33 INFO mapreduce.Job:  map 66% reduce 13%
17/07/06 18:22:38 INFO mapreduce.Job:  map 69% reduce 13%
17/07/06 18:22:39 INFO mapreduce.Job:  map 70% reduce 13%
17/07/06 18:22:42 INFO mapreduce.Job:  map 71% reduce 13%
17/07/06 18:22:44 INFO mapreduce.Job:  map 72% reduce 16%
17/07/06 18:22:45 INFO mapreduce.Job:  map 73% reduce 16%
17/07/06 18:22:50 INFO mapreduce.Job:  map 73% reduce 22%
17/07/06 18:22:56 INFO mapreduce.Job:  map 73% reduce 24%
17/07/06 18:23:00 INFO mapreduce.Job:  map 75% reduce 24%
17/07/06 18:23:01 INFO mapreduce.Job:  map 76% reduce 24%
17/07/06 18:23:02 INFO mapreduce.Job:  map 78% reduce 24%
17/07/06 18:23:05 INFO mapreduce.Job:  map 79% reduce 24%
17/07/06 18:23:06 INFO mapreduce.Job:  map 81% reduce 24%
17/07/06 18:23:07 INFO mapreduce.Job:  map 82% reduce 24%
17/07/06 18:23:08 INFO mapreduce.Job:  map 83% reduce 24%
17/07/06 18:23:11 INFO mapreduce.Job:  map 84% reduce 24%
17/07/06 18:23:17 INFO mapreduce.Job:  map 85% reduce 24%
17/07/06 18:23:19 INFO mapreduce.Job:  map 88% reduce 24%
17/07/06 18:23:20 INFO mapreduce.Job:  map 89% reduce 24%
17/07/06 18:23:25 INFO mapreduce.Job:  map 90% reduce 24%
17/07/06 18:23:29 INFO mapreduce.Job:  map 91% reduce 24%
17/07/06 18:23:31 INFO mapreduce.Job:  map 92% reduce 24%
17/07/06 18:23:35 INFO mapreduce.Job:  map 94% reduce 24%
17/07/06 18:23:38 INFO mapreduce.Job:  map 98% reduce 24%
17/07/06 18:23:39 INFO mapreduce.Job:  map 100% reduce 27%
17/07/06 18:23:45 INFO mapreduce.Job:  map 100% reduce 33%
17/07/06 18:23:51 INFO mapreduce.Job:  map 100% reduce 35%
17/07/06 18:23:57 INFO mapreduce.Job:  map 100% reduce 42%
17/07/06 18:24:03 INFO mapreduce.Job:  map 100% reduce 47%
17/07/06 18:24:09 INFO mapreduce.Job:  map 100% reduce 49%
17/07/06 18:24:15 INFO mapreduce.Job:  map 100% reduce 55%
17/07/06 18:24:21 INFO mapreduce.Job:  map 100% reduce 61%
17/07/06 18:24:27 INFO mapreduce.Job:  map 100% reduce 65%
17/07/06 18:24:33 INFO mapreduce.Job:  map 100% reduce 67%
17/07/06 18:24:51 INFO mapreduce.Job:  map 100% reduce 68%
17/07/06 18:25:09 INFO mapreduce.Job:  map 100% reduce 69%
17/07/06 18:25:39 INFO mapreduce.Job:  map 100% reduce 70%
17/07/06 18:26:21 INFO mapreduce.Job:  map 100% reduce 71%
17/07/06 18:27:03 INFO mapreduce.Job:  map 100% reduce 72%
17/07/06 18:27:21 INFO mapreduce.Job:  map 100% reduce 73%
17/07/06 18:27:33 INFO mapreduce.Job:  map 100% reduce 74%
17/07/06 18:27:45 INFO mapreduce.Job:  map 100% reduce 75%
17/07/06 18:27:58 INFO mapreduce.Job:  map 100% reduce 76%
17/07/06 18:28:16 INFO mapreduce.Job:  map 100% reduce 77%
17/07/06 18:29:10 INFO mapreduce.Job:  map 100% reduce 78%
17/07/06 18:29:22 INFO mapreduce.Job:  map 100% reduce 79%
17/07/06 18:29:40 INFO mapreduce.Job:  map 100% reduce 80%
17/07/06 18:29:52 INFO mapreduce.Job:  map 100% reduce 81%
17/07/06 18:30:04 INFO mapreduce.Job:  map 100% reduce 82%
17/07/06 18:30:16 INFO mapreduce.Job:  map 100% reduce 83%
17/07/06 18:30:34 INFO mapreduce.Job:  map 100% reduce 84%
17/07/06 18:30:46 INFO mapreduce.Job:  map 100% reduce 85%
17/07/06 18:31:04 INFO mapreduce.Job:  map 100% reduce 86%
17/07/06 18:31:16 INFO mapreduce.Job:  map 100% reduce 87%
17/07/06 18:31:28 INFO mapreduce.Job:  map 100% reduce 88%
17/07/06 18:31:46 INFO mapreduce.Job:  map 100% reduce 89%
17/07/06 18:31:58 INFO mapreduce.Job:  map 100% reduce 90%
17/07/06 18:32:10 INFO mapreduce.Job:  map 100% reduce 91%
17/07/06 18:32:22 INFO mapreduce.Job:  map 100% reduce 92%
17/07/06 18:32:34 INFO mapreduce.Job:  map 100% reduce 93%
17/07/06 18:32:52 INFO mapreduce.Job:  map 100% reduce 94%
17/07/06 18:33:04 INFO mapreduce.Job:  map 100% reduce 95%
17/07/06 18:33:16 INFO mapreduce.Job:  map 100% reduce 96%
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


- Então desconectado 1 node, foi rodado de novo o job após excluir output com `$ hadoop fs -rmr hdfs://master:9000/output`.

- Para checar os status dos nodes, foi realizado o seguinte comando:


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


- Ao rodar o `wc.jar` sem 1 datanode, obtivemos:


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
17/07/06 18:52:34 INFO mapreduce.Job:  map 10% reduce 0%
17/07/06 18:52:36 INFO mapreduce.Job:  map 12% reduce 0%
17/07/06 18:52:39 INFO mapreduce.Job:  map 14% reduce 0%
17/07/06 18:52:40 INFO mapreduce.Job:  map 15% reduce 0%
17/07/06 18:52:42 INFO mapreduce.Job:  map 16% reduce 0%
17/07/06 18:52:45 INFO mapreduce.Job:  map 17% reduce 0%
17/07/06 18:52:46 INFO mapreduce.Job:  map 18% reduce 0%
17/07/06 18:52:48 INFO mapreduce.Job:  map 20% reduce 0%
17/07/06 18:52:51 INFO mapreduce.Job:  map 22% reduce 0%
17/07/06 18:52:53 INFO mapreduce.Job:  map 23% reduce 0%
17/07/06 18:52:54 INFO mapreduce.Job:  map 24% reduce 0%
17/07/06 18:52:58 INFO mapreduce.Job:  map 25% reduce 0%
17/07/06 18:53:03 INFO mapreduce.Job:  map 26% reduce 0%
17/07/06 18:53:04 INFO mapreduce.Job:  map 27% reduce 0%
17/07/06 18:53:06 INFO mapreduce.Job:  map 28% reduce 0%
17/07/06 18:53:07 INFO mapreduce.Job:  map 29% reduce 0%
17/07/06 18:53:09 INFO mapreduce.Job:  map 31% reduce 0%
17/07/06 18:53:10 INFO mapreduce.Job:  map 32% reduce 0%
17/07/06 18:53:12 INFO mapreduce.Job:  map 34% reduce 0%
17/07/06 18:53:13 INFO mapreduce.Job:  map 35% reduce 0%
17/07/06 18:53:15 INFO mapreduce.Job:  map 37% reduce 0%
17/07/06 18:53:18 INFO mapreduce.Job:  map 38% reduce 0%
17/07/06 18:53:21 INFO mapreduce.Job:  map 40% reduce 0%
17/07/06 18:53:32 INFO mapreduce.Job:  map 42% reduce 0%
17/07/06 18:53:35 INFO mapreduce.Job:  map 43% reduce 13%
17/07/06 18:53:38 INFO mapreduce.Job:  map 44% reduce 13%
17/07/06 18:53:39 INFO mapreduce.Job:  map 45% reduce 13%
17/07/06 18:53:41 INFO mapreduce.Job:  map 49% reduce 13%
17/07/06 18:53:47 INFO mapreduce.Job:  map 51% reduce 13%
17/07/06 18:53:50 INFO mapreduce.Job:  map 52% reduce 13%
17/07/06 18:53:51 INFO mapreduce.Job:  map 53% reduce 13%
17/07/06 18:53:53 INFO mapreduce.Job:  map 55% reduce 13%
17/07/06 18:53:56 INFO mapreduce.Job:  map 56% reduce 13%
17/07/06 18:53:59 INFO mapreduce.Job:  map 59% reduce 13%
17/07/06 18:54:02 INFO mapreduce.Job:  map 60% reduce 13%
17/07/06 18:54:03 INFO mapreduce.Job:  map 61% reduce 13%
17/07/06 18:54:07 INFO mapreduce.Job:  map 62% reduce 13%
17/07/06 18:54:09 INFO mapreduce.Job:  map 63% reduce 13%
17/07/06 18:54:10 INFO mapreduce.Job:  map 64% reduce 13%
17/07/06 18:54:12 INFO mapreduce.Job:  map 64% reduce 16%
17/07/06 18:54:13 INFO mapreduce.Job:  map 66% reduce 16%
17/07/06 18:54:16 INFO mapreduce.Job:  map 67% reduce 16%
17/07/06 18:54:18 INFO mapreduce.Job:  map 68% reduce 16%
17/07/06 18:54:19 INFO mapreduce.Job:  map 72% reduce 16%
17/07/06 18:54:20 INFO mapreduce.Job:  map 73% reduce 16%
17/07/06 18:54:24 INFO mapreduce.Job:  map 73% reduce 24%
17/07/06 18:54:30 INFO mapreduce.Job:  map 75% reduce 24%
17/07/06 18:54:34 INFO mapreduce.Job:  map 76% reduce 24%
17/07/06 18:54:36 INFO mapreduce.Job:  map 78% reduce 24%
17/07/06 18:54:38 INFO mapreduce.Job:  map 80% reduce 24%
17/07/06 18:54:40 INFO mapreduce.Job:  map 81% reduce 24%
17/07/06 18:54:42 INFO mapreduce.Job:  map 83% reduce 24%
17/07/06 18:54:44 INFO mapreduce.Job:  map 84% reduce 24%
17/07/06 18:54:48 INFO mapreduce.Job:  map 86% reduce 24%
17/07/06 18:54:50 INFO mapreduce.Job:  map 87% reduce 24%
17/07/06 18:54:52 INFO mapreduce.Job:  map 88% reduce 24%
17/07/06 18:54:54 INFO mapreduce.Job:  map 89% reduce 24%
17/07/06 18:54:58 INFO mapreduce.Job:  map 90% reduce 24%
17/07/06 18:55:00 INFO mapreduce.Job:  map 91% reduce 24%
17/07/06 18:55:06 INFO mapreduce.Job:  map 93% reduce 24%
17/07/06 18:55:08 INFO mapreduce.Job:  map 94% reduce 24%
17/07/06 18:55:11 INFO mapreduce.Job:  map 95% reduce 24%
17/07/06 18:55:12 INFO mapreduce.Job:  map 99% reduce 24%
17/07/06 18:55:13 INFO mapreduce.Job:  map 100% reduce 24%
17/07/06 18:55:19 INFO mapreduce.Job:  map 100% reduce 34%
17/07/06 18:55:25 INFO mapreduce.Job:  map 100% reduce 37%
17/07/06 18:55:31 INFO mapreduce.Job:  map 100% reduce 44%
17/07/06 18:55:37 INFO mapreduce.Job:  map 100% reduce 49%
17/07/06 18:55:44 INFO mapreduce.Job:  map 100% reduce 51%
17/07/06 18:55:50 INFO mapreduce.Job:  map 100% reduce 58%
17/07/06 18:55:56 INFO mapreduce.Job:  map 100% reduce 63%
17/07/06 18:56:02 INFO mapreduce.Job:  map 100% reduce 66%
17/07/06 18:56:08 INFO mapreduce.Job:  map 100% reduce 67%
17/07/06 18:56:26 INFO mapreduce.Job:  map 100% reduce 68%
17/07/06 18:56:37 INFO mapreduce.Job:  map 100% reduce 69%
17/07/06 18:56:49 INFO mapreduce.Job:  map 100% reduce 70%
17/07/06 18:57:01 INFO mapreduce.Job:  map 100% reduce 71%
17/07/06 18:57:19 INFO mapreduce.Job:  map 100% reduce 72%
17/07/06 18:57:31 INFO mapreduce.Job:  map 100% reduce 73%
17/07/06 18:57:43 INFO mapreduce.Job:  map 100% reduce 74%
17/07/06 18:58:02 INFO mapreduce.Job:  map 100% reduce 75%
17/07/06 18:58:14 INFO mapreduce.Job:  map 100% reduce 76%
17/07/06 18:58:26 INFO mapreduce.Job:  map 100% reduce 77%
17/07/06 18:58:38 INFO mapreduce.Job:  map 100% reduce 78%
17/07/06 18:58:56 INFO mapreduce.Job:  map 100% reduce 79%
17/07/06 18:59:08 INFO mapreduce.Job:  map 100% reduce 80%
17/07/06 18:59:20 INFO mapreduce.Job:  map 100% reduce 81%
17/07/06 18:59:38 INFO mapreduce.Job:  map 100% reduce 82%
17/07/06 18:59:50 INFO mapreduce.Job:  map 100% reduce 83%
17/07/06 19:00:02 INFO mapreduce.Job:  map 100% reduce 84%
17/07/06 19:00:14 INFO mapreduce.Job:  map 100% reduce 85%
17/07/06 19:00:26 INFO mapreduce.Job:  map 100% reduce 86%
17/07/06 19:00:44 INFO mapreduce.Job:  map 100% reduce 87%
17/07/06 19:00:56 INFO mapreduce.Job:  map 100% reduce 88%
17/07/06 19:01:08 INFO mapreduce.Job:  map 100% reduce 89%
17/07/06 19:01:27 INFO mapreduce.Job:  map 100% reduce 90%
17/07/06 19:01:39 INFO mapreduce.Job:  map 100% reduce 91%
17/07/06 19:01:57 INFO mapreduce.Job:  map 100% reduce 92%
17/07/06 19:02:09 INFO mapreduce.Job:  map 100% reduce 93%
17/07/06 19:02:21 INFO mapreduce.Job:  map 100% reduce 94%
17/07/06 19:02:33 INFO mapreduce.Job:  map 100% reduce 95%
17/07/06 19:02:45 INFO mapreduce.Job:  map 100% reduce 96%
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


- Agora com apenas 2 nodes, executamos outra vez o job derrubando um datanode no meio do reduce, afim de testar a redundância e tolerância a falhas:


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
17/07/06 19:10:07 INFO mapreduce.Job:  map 10% reduce 0%
17/07/06 19:10:08 INFO mapreduce.Job:  map 11% reduce 0%
17/07/06 19:10:09 INFO mapreduce.Job:  map 12% reduce 0%
17/07/06 19:10:11 INFO mapreduce.Job:  map 15% reduce 0%
17/07/06 19:10:13 INFO mapreduce.Job:  map 16% reduce 0%
17/07/06 19:10:14 INFO mapreduce.Job:  map 17% reduce 0%
17/07/06 19:10:19 INFO mapreduce.Job:  map 18% reduce 0%
17/07/06 19:10:21 INFO mapreduce.Job:  map 20% reduce 0%
17/07/06 19:10:23 INFO mapreduce.Job:  map 21% reduce 0%
17/07/06 19:10:24 INFO mapreduce.Job:  map 22% reduce 0%
17/07/06 19:10:25 INFO mapreduce.Job:  map 23% reduce 0%
17/07/06 19:10:26 INFO mapreduce.Job:  map 24% reduce 0%
17/07/06 19:10:31 INFO mapreduce.Job:  map 25% reduce 0%
17/07/06 19:10:33 INFO mapreduce.Job:  map 26% reduce 0%
17/07/06 19:10:36 INFO mapreduce.Job:  map 27% reduce 0%
17/07/06 19:10:37 INFO mapreduce.Job:  map 28% reduce 0%
17/07/06 19:10:38 INFO mapreduce.Job:  map 29% reduce 0%
17/07/06 19:10:41 INFO mapreduce.Job:  map 30% reduce 0%
17/07/06 19:10:43 INFO mapreduce.Job:  map 35% reduce 0%
17/07/06 19:10:44 INFO mapreduce.Job:  map 36% reduce 0%
17/07/06 19:10:47 INFO mapreduce.Job:  map 37% reduce 0%
17/07/06 19:10:48 INFO mapreduce.Job:  map 38% reduce 0%
17/07/06 19:10:49 INFO mapreduce.Job:  map 39% reduce 0%
17/07/06 19:10:51 INFO mapreduce.Job:  map 40% reduce 0%
17/07/06 19:11:06 INFO mapreduce.Job:  map 42% reduce 0%
17/07/06 19:11:08 INFO mapreduce.Job:  map 44% reduce 0%
17/07/06 19:11:09 INFO mapreduce.Job:  map 44% reduce 13%
17/07/06 19:11:10 INFO mapreduce.Job:  map 45% reduce 13%
17/07/06 19:11:12 INFO mapreduce.Job:  map 46% reduce 13%
17/07/06 19:11:13 INFO mapreduce.Job:  map 47% reduce 13%
17/07/06 19:11:14 INFO mapreduce.Job:  map 49% reduce 13%
17/07/06 19:11:16 INFO mapreduce.Job:  map 50% reduce 13%
17/07/06 19:11:20 INFO mapreduce.Job:  map 52% reduce 13%
17/07/06 19:11:22 INFO mapreduce.Job:  map 54% reduce 13%
17/07/06 19:11:24 INFO mapreduce.Job:  map 55% reduce 13%
17/07/06 19:11:25 INFO mapreduce.Job:  map 56% reduce 13%
17/07/06 19:11:26 INFO mapreduce.Job:  map 57% reduce 13%
17/07/06 19:11:31 INFO mapreduce.Job:  map 58% reduce 13%
17/07/06 19:11:34 INFO mapreduce.Job:  map 59% reduce 13%
17/07/06 19:11:36 INFO mapreduce.Job:  map 62% reduce 13%
17/07/06 19:11:39 INFO mapreduce.Job:  map 63% reduce 13%
17/07/06 19:11:40 INFO mapreduce.Job:  map 64% reduce 13%
17/07/06 19:11:43 INFO mapreduce.Job:  map 65% reduce 13%
17/07/06 19:11:44 INFO mapreduce.Job:  map 67% reduce 13%
17/07/06 19:11:45 INFO mapreduce.Job:  map 68% reduce 13%
17/07/06 19:11:46 INFO mapreduce.Job:  map 69% reduce 16%
17/07/06 19:11:48 INFO mapreduce.Job:  map 70% reduce 16%
17/07/06 19:11:52 INFO mapreduce.Job:  map 72% reduce 20%
17/07/06 19:11:53 INFO mapreduce.Job:  map 73% reduce 20%
17/07/06 19:11:58 INFO mapreduce.Job:  map 73% reduce 24%
17/07/06 19:12:01 INFO mapreduce.Job:  map 75% reduce 24%
17/07/06 19:12:06 INFO mapreduce.Job:  map 76% reduce 24%
17/07/06 19:12:07 INFO mapreduce.Job:  map 80% reduce 24%
17/07/06 19:12:10 INFO mapreduce.Job:  map 82% reduce 24%
17/07/06 19:12:12 INFO mapreduce.Job:  map 83% reduce 24%
17/07/06 19:12:16 INFO mapreduce.Job:  map 84% reduce 24%
17/07/06 19:12:18 INFO mapreduce.Job:  map 85% reduce 24%
17/07/06 19:12:19 INFO mapreduce.Job:  map 88% reduce 24%
17/07/06 19:12:22 INFO mapreduce.Job:  map 89% reduce 24%
17/07/06 19:12:24 INFO mapreduce.Job:  map 90% reduce 24%
17/07/06 19:12:25 INFO mapreduce.Job:  map 91% reduce 24%
17/07/06 19:12:31 INFO mapreduce.Job:  map 92% reduce 24%
17/07/06 19:12:35 INFO mapreduce.Job:  map 93% reduce 24%
17/07/06 19:12:36 INFO mapreduce.Job:  map 94% reduce 24%
17/07/06 19:12:38 INFO mapreduce.Job:  map 97% reduce 24%
17/07/06 19:12:40 INFO mapreduce.Job:  map 98% reduce 27%
17/07/06 19:12:41 INFO mapreduce.Job:  map 99% reduce 27%
17/07/06 19:12:43 INFO mapreduce.Job:  map 100% reduce 27%
17/07/06 19:12:46 INFO mapreduce.Job:  map 100% reduce 33%
17/07/06 19:12:53 INFO mapreduce.Job:  map 100% reduce 39%
17/07/06 19:12:59 INFO mapreduce.Job:  map 100% reduce 43%
17/07/06 19:13:05 INFO mapreduce.Job:  map 100% reduce 48%
17/07/06 19:13:11 INFO mapreduce.Job:  map 100% reduce 55%
17/07/06 19:13:17 INFO mapreduce.Job:  map 100% reduce 58%
17/07/06 19:13:23 INFO mapreduce.Job:  map 100% reduce 63%
17/07/06 19:13:29 INFO mapreduce.Job:  map 100% reduce 67%
17/07/06 19:13:36 INFO mapreduce.Job:  map 100% reduce 68%
17/07/06 19:13:42 INFO mapreduce.Job:  map 100% reduce 70%
17/07/06 19:13:48 INFO mapreduce.Job:  map 100% reduce 71%
17/07/06 19:13:54 INFO mapreduce.Job:  map 100% reduce 73%
17/07/06 19:14:00 INFO mapreduce.Job:  map 100% reduce 74%
17/07/06 19:14:06 INFO mapreduce.Job:  map 100% reduce 76%
17/07/06 19:14:12 INFO mapreduce.Job:  map 100% reduce 77%
17/07/06 19:14:18 INFO mapreduce.Job:  map 100% reduce 78%
17/07/06 19:14:24 INFO mapreduce.Job:  map 100% reduce 80%
17/07/06 19:14:29 INFO mapreduce.Job:  map 100% reduce 81%
17/07/06 19:14:35 INFO mapreduce.Job:  map 100% reduce 83%
17/07/06 19:14:41 INFO mapreduce.Job:  map 100% reduce 84%
17/07/06 19:14:47 INFO mapreduce.Job:  map 100% reduce 86%
17/07/06 19:14:53 INFO mapreduce.Job:  map 100% reduce 87%
17/07/06 19:14:59 INFO mapreduce.Job:  map 100% reduce 88%
17/07/06 19:15:05 INFO mapreduce.Job:  map 100% reduce 90%
17/07/06 19:15:11 INFO mapreduce.Job:  map 100% reduce 92%
17/07/06 19:15:17 INFO mapreduce.Job:  map 100% reduce 93%
17/07/06 19:15:23 INFO mapreduce.Job:  map 100% reduce 94%
17/07/06 19:15:29 INFO mapreduce.Job:  map 100% reduce 96%
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
