# Como instalar

- Você pode entrar na página do hadoop e escolher a [versão](http://hadoop.apache.org/releases.html).
- Nesse experimento usamos o seguinte [pacote](http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-2.8.0/hadoop-2.8.0.tar.gz)
- Para descompactar o arquivo use: `tar -xvzf hadoop-2.x.tar.gz`
- Onde `x` é a subversão do Hadoop 2.
- O tutorial usado para configuração do ambiente foi uma [página do site oficial](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#Purpose)
- Primeiramente é necessário ter instalado o Java instalado, nesse presente experimento será utilizado a plataforma Java 8, portanto basta escolher qual JVM deseja usar(open-jdk, oracle-jdk, etc). Você pode conferir se o seu ambiente já está devidamente configurado utilizando no seu terminal o seguinte comando:

```
$ echo $JAVA_HOME
/usr/lib/jvm/java-8-oracle`
```

- Se obtiver uma saída parecida, significa que seu ambiente Java já está devidamente configurado, caso contrário siga algum tutorial sobre a instalação do ambiente java e da configuração de suas variáveis de ambiente, necessários para o uso do hadoop. Existem vários desses tutorais, não vamos nos reter a isso.

- Além do java, existem duas dependências de sistema que é preciso configurar, `ssh e rsync`. Numa distro debian:

- `$ sudo apt-get install ssh rsync`

- Primeiramente vamos tentar executar o ambiente em Standalone, modo local não distribuído.

- Para isso vamos mover a pasta descompactada acima para `/usr/`:

- $ sudo mv hadoop-2.8.0/ /usr/

- Agora é preciso editar o bashrc para conseguir executar o Hadoop em qualquer terminal.

- `$ sudo vim ~/.bashrc`

- Você pode usar qualquer editor de texto para isso, uma vez em modo de edição, adicione ao final do arquivo os seguintes comandos:

```
# HADOOP VARIABLES - considering hadoop folder into /usr/
export HADOOP_HOME=/usr/hadoop-2.8.0
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar
```

- Salve o arquivo, digite `bash` no seu terminal para as redefinir as configurações de bash e confira o resultado executando:

- `$ hadoop version`

- Deve aparecer uma tela mostrando a versão do hadoop seguido de outras informações.

- Para uma simples demonstração Standalone, vamos entrar dentro da nossa pasta do Hadoop `/usr/hadoop-2.8.0` e executar os seguintes comandos(Perceba que estamos dentro de `/usr/hadoop-2.8.0`):

```
/usr/hadoop-2.8.0$ cp etc/hadoop/*.xml input/

/usr/hadoop-2.8.0$ hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.0.jar grep input/ output 'dfs[a-z.]+'

```

- Após isso deve aparecer um grande log no seu terminal. Se você executar:

- `$ cat output/*`

- Deverá aparecer:

- `1   dfsadmin`

- É isso, dentro o diretório output terá dois arquivos ainda. Você acaba de executar seu primeiro exemplo no hadoop.
