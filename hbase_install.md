# HBASE install

```
$ sudo wget http://ftp.unicamp.br/pub/apache/hbase/1.3.1/hbase-1.3.1-bin.tar.gz

$ sudo tar -zxvf hbase-1.3.1-bin.tar.gz
```

- Depois de baixado deve-se atualizar a variável JAVA_HOME no script `conf/hbase-env.sh`.

- Então é necessário colocar a configuração desejada de localização de ficheiros do HBASE:

```
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
/**
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
-->
<configuration>
   //Here you have to set the path where you want HBase to store its files.
   <property>
      <name>hbase.rootdir</name>
      <value>~/hadoop/HBase/HFiles</value>
   </property>
	
   //Here you have to set the path where you want HBase to store its built in zookeeper  files.
   <property>
      <name>hbase.zookeeper.property.dataDir</name>
      <value>~/zookeeper</value>
   </property>
</configuration>
```

- Para iniciar o hbase, basta usar o comando abaixo, deverá aparecer os seguintes resultados:

```
$ sudo ./start-hbase.sh 
[sudo] password for fsdadmin: 
starting master, logging to /usr/local/hbase-1.3.1/bin/../logs/hbase-root-master-HPHost02.out
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=128m; support was removed in 8.0
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=128m; support was removed in 8.0
```


