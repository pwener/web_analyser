#  Adding New node

- Primeiramente o node slave foi configurado em /etc/hosts com:

```
192.168.133.149 master
192.168.133.193 localhost vagrant       slave-2
192.168.133.129 slave-1
```
- Logo foi preciso atualizar o hosts em todas as máquinas, mas foi percebido que pela configuração de rede feita, onde os dois slaves estavam no wifi, eles não conseguem se comunicar por conta do firewall do roteador. Então só foi configurado ssh dos slaves com o master.

- Então foi configurado o ssh do slave, copiando a chave do master para o slave, via comando:

```
$ ssh-copy-id ~/.ssh/id_rsa.pub vagrant@slave-2
```

- É preciso ainda atualizar o arquivo `$HADOOP_HOME/etc/hadoop/slaves` com o novo node, para isso basta atualizar a master e dar scp nos nodes:

```
$ scp fsdadmin@master:/usr/hadoop-2.8.0/etc/ .
```

- Após devidamente configurados, deve-se restartar todo o serviço no master:

```
$ sbin/stop-all.sh
...
$ sbin/start-dfs.sh
...
$ sbin/start-yarn.sh
```

- 
