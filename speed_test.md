# Testes de performance variando a quantidade de máquinas

O nosso foco foi em realizar dois tipos de testes, um voltado a tolerância a falhas, em que foram adicionados e removidos nós do cluster durante a execução e outro de perfomance, em que foi medido o tempo de execução das tarefas variando a quantidade de máquinas presentes no cluster. Aqui serão descritos três cenários:

- 3 máquinas no cluster realizando tarefas
- 2 máquinas no cluster realizando tarefas
- 1 máquina no cluster realizando tarefas

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
