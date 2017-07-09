# Usando hdfs no datanode

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
