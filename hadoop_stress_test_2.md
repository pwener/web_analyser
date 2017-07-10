# Hadoop com cabo de rede

- Uma vez que os testes passados foram feitos com os data nodes conectados via wi-fi, percebeu-se que talvez a conectividade de rede estaria impactando nos experimentos. Para tirar essas dúvidas foram realizados experimentos com um node conectado pelo cabo de rede.

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

real	9m2.565s
user	0m6.636s
sys	0m0.360s

```


- Já desconectando um nó, obtivemos os seguintes resultados:


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
17/07/07 17:26:12 INFO mapreduce.Job:  map 10% reduce 0%
17/07/07 17:26:13 INFO mapreduce.Job:  map 11% reduce 0%
17/07/07 17:26:15 INFO mapreduce.Job:  map 12% reduce 0%
17/07/07 17:26:16 INFO mapreduce.Job:  map 13% reduce 0%
17/07/07 17:26:17 INFO mapreduce.Job:  map 14% reduce 0%
17/07/07 17:26:18 INFO mapreduce.Job:  map 15% reduce 0%
17/07/07 17:26:19 INFO mapreduce.Job:  map 17% reduce 0%
17/07/07 17:26:24 INFO mapreduce.Job:  map 18% reduce 0%
17/07/07 17:26:27 INFO mapreduce.Job:  map 20% reduce 0%
17/07/07 17:26:29 INFO mapreduce.Job:  map 22% reduce 0%
17/07/07 17:26:30 INFO mapreduce.Job:  map 23% reduce 0%
17/07/07 17:26:31 INFO mapreduce.Job:  map 24% reduce 0%
17/07/07 17:26:36 INFO mapreduce.Job:  map 25% reduce 0%
17/07/07 17:26:39 INFO mapreduce.Job:  map 26% reduce 0%
17/07/07 17:26:41 INFO mapreduce.Job:  map 27% reduce 0%
17/07/07 17:26:42 INFO mapreduce.Job:  map 28% reduce 0%
17/07/07 17:26:45 INFO mapreduce.Job:  map 30% reduce 0%
17/07/07 17:26:47 INFO mapreduce.Job:  map 31% reduce 0%
17/07/07 17:26:48 INFO mapreduce.Job:  map 32% reduce 0%
17/07/07 17:26:49 INFO mapreduce.Job:  map 34% reduce 0%
17/07/07 17:26:51 INFO mapreduce.Job:  map 35% reduce 0%
17/07/07 17:26:52 INFO mapreduce.Job:  map 36% reduce 0%
17/07/07 17:26:53 INFO mapreduce.Job:  map 37% reduce 0%
17/07/07 17:26:55 INFO mapreduce.Job:  map 38% reduce 0%
17/07/07 17:26:56 INFO mapreduce.Job:  map 39% reduce 0%
17/07/07 17:26:57 INFO mapreduce.Job:  map 40% reduce 0%
17/07/07 17:27:11 INFO mapreduce.Job:  map 42% reduce 0%
17/07/07 17:27:13 INFO mapreduce.Job:  map 43% reduce 0%
17/07/07 17:27:14 INFO mapreduce.Job:  map 44% reduce 0%
17/07/07 17:27:15 INFO mapreduce.Job:  map 44% reduce 13%
17/07/07 17:27:17 INFO mapreduce.Job:  map 46% reduce 13%
17/07/07 17:27:19 INFO mapreduce.Job:  map 48% reduce 13%
17/07/07 17:27:23 INFO mapreduce.Job:  map 49% reduce 13%
17/07/07 17:27:24 INFO mapreduce.Job:  map 50% reduce 13%
17/07/07 17:27:26 INFO mapreduce.Job:  map 51% reduce 13%
17/07/07 17:27:29 INFO mapreduce.Job:  map 54% reduce 13%
17/07/07 17:27:31 INFO mapreduce.Job:  map 55% reduce 13%
17/07/07 17:27:35 INFO mapreduce.Job:  map 56% reduce 13%
17/07/07 17:27:36 INFO mapreduce.Job:  map 57% reduce 13%
17/07/07 17:27:37 INFO mapreduce.Job:  map 58% reduce 13%
17/07/07 17:27:38 INFO mapreduce.Job:  map 59% reduce 13%
17/07/07 17:27:41 INFO mapreduce.Job:  map 61% reduce 13%
17/07/07 17:27:42 INFO mapreduce.Job:  map 62% reduce 13%
17/07/07 17:27:44 INFO mapreduce.Job:  map 63% reduce 13%
17/07/07 17:27:47 INFO mapreduce.Job:  map 64% reduce 13%
17/07/07 17:27:48 INFO mapreduce.Job:  map 65% reduce 13%
17/07/07 17:27:50 INFO mapreduce.Job:  map 68% reduce 13%
17/07/07 17:27:51 INFO mapreduce.Job:  map 68% reduce 16%
17/07/07 17:27:53 INFO mapreduce.Job:  map 69% reduce 16%
17/07/07 17:27:55 INFO mapreduce.Job:  map 70% reduce 16%
17/07/07 17:27:56 INFO mapreduce.Job:  map 71% reduce 16%
17/07/07 17:27:57 INFO mapreduce.Job:  map 71% reduce 20%
17/07/07 17:28:00 INFO mapreduce.Job:  map 72% reduce 20%
17/07/07 17:28:03 INFO mapreduce.Job:  map 72% reduce 22%
17/07/07 17:28:04 INFO mapreduce.Job:  map 73% reduce 22%
17/07/07 17:28:06 INFO mapreduce.Job:  map 75% reduce 22%
17/07/07 17:28:08 INFO mapreduce.Job:  map 76% reduce 22%
17/07/07 17:28:09 INFO mapreduce.Job:  map 76% reduce 24%
17/07/07 17:28:10 INFO mapreduce.Job:  map 77% reduce 24%
17/07/07 17:28:11 INFO mapreduce.Job:  map 79% reduce 24%
17/07/07 17:28:14 INFO mapreduce.Job:  map 80% reduce 24%
17/07/07 17:28:15 INFO mapreduce.Job:  map 82% reduce 24%
17/07/07 17:28:16 INFO mapreduce.Job:  map 83% reduce 24%
17/07/07 17:28:18 INFO mapreduce.Job:  map 84% reduce 24%
17/07/07 17:28:20 INFO mapreduce.Job:  map 85% reduce 24%
17/07/07 17:28:22 INFO mapreduce.Job:  map 86% reduce 24%
17/07/07 17:28:24 INFO mapreduce.Job:  map 88% reduce 24%
17/07/07 17:28:27 INFO mapreduce.Job:  map 89% reduce 24%
17/07/07 17:28:30 INFO mapreduce.Job:  map 90% reduce 24%
17/07/07 17:28:33 INFO mapreduce.Job:  map 91% reduce 24%
17/07/07 17:28:36 INFO mapreduce.Job:  map 92% reduce 24%
17/07/07 17:28:39 INFO mapreduce.Job:  map 93% reduce 24%
17/07/07 17:28:41 INFO mapreduce.Job:  map 94% reduce 24%
17/07/07 17:28:42 INFO mapreduce.Job:  map 96% reduce 24%
17/07/07 17:28:43 INFO mapreduce.Job:  map 98% reduce 24%
17/07/07 17:28:45 INFO mapreduce.Job:  map 99% reduce 31%
17/07/07 17:28:48 INFO mapreduce.Job:  map 100% reduce 31%
17/07/07 17:28:51 INFO mapreduce.Job:  map 100% reduce 33%
17/07/07 17:28:57 INFO mapreduce.Job:  map 100% reduce 39%
17/07/07 17:29:03 INFO mapreduce.Job:  map 100% reduce 43%
17/07/07 17:29:09 INFO mapreduce.Job:  map 100% reduce 48%
17/07/07 17:29:15 INFO mapreduce.Job:  map 100% reduce 54%
17/07/07 17:29:21 INFO mapreduce.Job:  map 100% reduce 58%
17/07/07 17:29:27 INFO mapreduce.Job:  map 100% reduce 62%
17/07/07 17:29:33 INFO mapreduce.Job:  map 100% reduce 67%
17/07/07 17:29:39 INFO mapreduce.Job:  map 100% reduce 68%
17/07/07 17:29:45 INFO mapreduce.Job:  map 100% reduce 69%
17/07/07 17:29:51 INFO mapreduce.Job:  map 100% reduce 71%
17/07/07 17:29:57 INFO mapreduce.Job:  map 100% reduce 72%
17/07/07 17:30:03 INFO mapreduce.Job:  map 100% reduce 74%
17/07/07 17:30:09 INFO mapreduce.Job:  map 100% reduce 75%
17/07/07 17:30:15 INFO mapreduce.Job:  map 100% reduce 76%
17/07/07 17:30:21 INFO mapreduce.Job:  map 100% reduce 78%
17/07/07 17:30:27 INFO mapreduce.Job:  map 100% reduce 80%
17/07/07 17:30:33 INFO mapreduce.Job:  map 100% reduce 81%
17/07/07 17:30:39 INFO mapreduce.Job:  map 100% reduce 82%
17/07/07 17:30:45 INFO mapreduce.Job:  map 100% reduce 84%
17/07/07 17:30:51 INFO mapreduce.Job:  map 100% reduce 85%
17/07/07 17:30:57 INFO mapreduce.Job:  map 100% reduce 87%
17/07/07 17:31:03 INFO mapreduce.Job:  map 100% reduce 88%
17/07/07 17:31:09 INFO mapreduce.Job:  map 100% reduce 90%
17/07/07 17:31:15 INFO mapreduce.Job:  map 100% reduce 91%
17/07/07 17:31:21 INFO mapreduce.Job:  map 100% reduce 93%
17/07/07 17:31:27 INFO mapreduce.Job:  map 100% reduce 94%
17/07/07 17:31:33 INFO mapreduce.Job:  map 100% reduce 95%
17/07/07 17:31:39 INFO mapreduce.Job:  map 100% reduce 97%
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

real	6m26.887s
user	0m6.208s
sys	0m0.304s
```

- Percebe-se novamente um tempo de execução menor com a queda de um DataNode. Portanto a conectividade não foi o fator que impactou nos experimentos passados.

- Portanto, há duas hipoteses restantes:
	- A redundância passou a não ser feita com apenas 1 Node, acelerando mais o processo de MapReduce.
	- A redudância é um gargalo para 3 datanodes processando a quantidade usada de dados(aproximadamente 2 GB). Quanto maior a massa de dados mais rentável se torna o processamento Hadoop.

- Bem provavelmente as duas estão certas, pois o hadoop foi criado para trabalhar com grandes quantidades de dado em um sistema altamente clusterizado. Logo, quanto mais dados e mais clusters, maior será a diferença testada.

- Por questões de estrutura bem como de quantidade de dados, não foi possível realizar outros testes possíveis.

- Alguns experimentos que revelariam reforçariam nossas hipóteses:

	- Testar com uma ordem de 100 GB de dados.
	- Testar com pelo menos 10 nós com 100 GB de dados.
	- Testar numa mesma infra-estrutura com redundância de nível 3, 4 ou mais, para ver qual gargalo disso.
