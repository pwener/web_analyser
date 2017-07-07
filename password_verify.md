# Password

- Com o comando `head -n 5 *.txt` vemos se todos arquivos estão no mesmo padrão, percebemos que alguns não estavam, para simplificar o experimento apenas removemos esses arquivos da amostragem.


- Ao final tinhamos os seguintes conjuntos de dados:


```
$ ls -lh *.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 3,5K Jul  6 16:48 500-worst-passwords.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 3,1M Jul  6 16:48 cain.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 1,4K Jul  6 16:48 conficker.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 6,4K Jul  6 16:48 elitehacker.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 3,9M Jul  6 16:48 english.txt
-rw-rw-r-- 1 fsdadmin fsdadmin  71K Jul  6 16:48 faithwriters.txt
-rw-rw-r-- 1 fsdadmin fsdadmin  86K Jul  6 16:48 hotmail.txt
-rw-rw-r-- 1 fsdadmin fsdadmin  22K Jul  6 16:48 john.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 348K Jul  6 16:48 myspace.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 1,6M Jul  6 16:48 phpbb.txt
-rw-rw-r-- 1 fsdadmin fsdadmin  45M Jul  6 16:48 porno.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 134M Jul  6 16:48 rockyou.txt
-rw-rw-r-- 1 fsdadmin fsdadmin 2,8K Jul  6 16:49 twitter-banned.txt

```
