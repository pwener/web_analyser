# Setting hadoop nodes

- Foi usado o seguinte tutorial: https://linoxide.com/cluster/setup-hadoop-multi-node-cluster-ubuntu/

```
$ sudo useradd hadoop
$ sudo passwd hadoop
Digite a nova senha UNIX:
Redigite a nova senha UNIX:
passwd: senha atualizada com sucesso

```

- A senha configurada foi `hadoop`!

- Logo, foi configurado o /etc/hosts com os seguintes endereços:

```
192.168.133.65 master
192.168.133.129 slave-1
...
```

- Então foi configurado chave ssh para uso dos outros nós sem autênticação:

```
su hadoop
fsdadmin@HPHost02:~$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/fsdadmin/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/fsdadmin/.ssh/id_rsa.
Your public key has been saved in /home/fsdadmin/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:mg6IeFhPq20/LDgvpTbDeaMIlq7fZpR+rHspsWAnQOE fsdadmin@HPHost02
The key's randomart image is:
+---[RSA 2048]----+
| ..              |
|..               |
|.E               |
|.                |
| .. ..  S        |
|.+=+*. o         |
|==o@+=o.         |
|+o@+@oB          |
|+++%*Xo.         |
+----[SHA256]-----+
fsdadmin@HPHost02:~$ ssh-copy-id -i ~/.ssh/id_rsa.pub fsdadmin@master
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/fsdadmin/.ssh/id_rsa.pub"
The authenticity of host 'master (192.168.133.65)' can't be established.
ECDSA key fingerprint is SHA256:aeQ+/HMZ3+tk7D4zYr786QZu2yHGTg53rFGBPSrmk2I.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
fsdadmin@master's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'fsdadmin@master'"
and check to make sure that only the key(s) you wanted were added.

fsdadmin@HPHost02:~$ ssh-copy-id -i ~/.ssh/id_rsa.pub kuwener@slave-1
...
```

- Depois de configurado ssh em todas as maquinas:

```
fsdadmin@HPHost02:~$ chmod 0600 ~/.ssh/authorized_keys
```

- No master, é preciso configurar alguns arquivos:

```
$ sudo vim etc/hadoop/core-site.xml

<configuration>
   <property>
      <name>fs.default.name</name>
      <value>hdfs://master:9000/</value>
   </property>
   <property>
      <name>dfs.permissions</name>
      <value>false</value>
   </property>
</configuration>


$ sudo vim etc/hadoop/hdfs-site.xml

<configuration>
   <property>
      <name>dfs.data.dir</name>
      <value>/usr/hadoop/hadoop/dfs/name/data</value>
      <final>true</final>
   </property>

   <property>
      <name>dfs.name.dir</name>
      <value>/usr/hadoop/hadoop/dfs/name</value>
      <final>true</final>
   </property>

   <property>
      <name>dfs.replication</name>
      <value>1</value>
   </property>
</configuration>
```

- Ainda dentro do master, copiar a configuração acima para os slaves:

```
$ scp -r etc/hadoop/ kuwener@slave-1:/usr/hadoop-2.8.0/etc/
```

- Outras duas variáveis de ambiente precisam ser setadas no bashrc:

```
export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
export HADOOP_CONF_DIR=${HADOOP_HOME}/hadoop/conf
```

- Para executar o dfs:

```
hadoop-2.8.0/$ sbin/start-dfs.sh
```

- Para executar o yarn:

```
sbin/start-yarn.sh
```

- Para conferir se a configuração funcionou, ao digitar `jps` no master deve aparecer:

```
$ jps
28640 NodeManager
27985 NameNode
28947 Jps
28137 DataNode
28330 SecondaryNameNode
28511 ResourceManager
```

- O mesmo para os slaves:

```
$ jps
20651 DataNode
20987 NodeManager
21133 Jps
```

- Caso tenha trocado o IP de algum dos nós, é preciso renomear em todos tal que o arquivo /etc/hosts esteja consistente.

- Para detectar se o node está executando, você pode usar:

```
$ hadoop fs -df
```

- O resultadoh
