# Executando um Contador de Palavras

- A partir do [tutorial](https://hadoop.apache.org/docs/r2.8.0/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0) do site oficial hadoop.apache, criamos o exemplo do contador de palavras.

- Para compilar o .java use:

- `bin/hadoop com.sun.tools.javac.Main WordCount.java`

- Entre com dois textos na pasta input, em dois arquivos separados e rode o seguinte comando:

```
$ hadoop fs -ls ~/workspaces/hadoop/web_analyser/wordcount/input/
Found 2 items
-rw-rw-r--   1 kuwener kuwener       5398 2017-06-27 01:10 /home/kuwener/workspaces/hadoop/web_analyser/wordcount/input/file01
-rw-rw-r--   1 kuwener kuwener       6392 2017-06-27 01:09 /home/kuwener/workspaces/hadoop/web_analyser/wordcount/input/file02
```

- O que acabou de ser feito? Basicamente foi executado o comando `ls` dentro do filesystem do hadoop. É o que o comando `fs` faz!

- Para ver alguns comandos do hadoop basta digitar no seu terminal `hadoop`.

- Agora podemos executar nosso jar usando:

```
$ hadoop jar wc.jar WordCount ./input ./output
```

- O caracter '.' é convertido para o diretório atual, se tudo ocorreu bem você deve receber uma longa mensagem, similar a essa:

```
17/06/27 01:15:20 INFO mapreduce.Job: Job job_local2134868558_0001 completed successfully
17/06/27 01:15:20 INFO mapreduce.Job: Counters: 30
	File System Counters
		FILE: Number of bytes read=69741
		FILE: Number of bytes written=1035046
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
	Map-Reduce Framework
		Map input records=236
		Map output records=2081
		Map output bytes=20105
		Map output materialized bytes=14431
		Input split bytes=274
		Combine input records=2081
		Combine output records=1086
		Reduce input groups=979
		Reduce shuffle bytes=14431
		Reduce input records=1086
		Reduce output records=979
		Spilled Records=2172
		Shuffled Maps =2
		Failed Shuffles=0
		Merged Map outputs=2
		GC time elapsed (ms)=10
		Total committed heap usage (bytes)=860356608
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters
		Bytes Read=11790
	File Output Format Counters
		Bytes Written=9429
```

- Você pode ver o resultado da execução em:

- `$ hadoop fs -cat ./output/part-r-00000`.

- Bem, basicamente conseguimos rodar um exemplo bem simples onde se tem 2 entradas e uma inferência de resultado. Ótimo exemplo para entender Map-Reduce no Hadoop.
