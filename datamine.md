# Parser(Datamining)

- Ao criar o parser encontrou-se o problema de que alguns links exigem certificação para acesso, caso contrário retornam 403:

```
irb(main):061:0> test = open('https://dilma.com.br', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
OpenURI::HTTPError: 403 Forbidden
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:358:in `open_http'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:736:in `buffer_open'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:211:in `block in open_loop'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:209:in `catch'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:209:in `open_loop'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:150:in `open_uri'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:716:in `open'
	from /home/kuwener/.rbenv/versions/2.2.3/lib/ruby/2.2.0/open-uri.rb:34:in `open'
	from (irb):61
	from /home/kuwener/.rbenv/versions/2.2.3/bin/irb:11:in `<main>'
```

- Isso existe por um fato muito simples: Evitar ataque de nuker.

- Então foi desenvolvido o script o qual dentre as urls encontradas, ele tenta adentrar todos, exibindo o seguinte log:

```
$ ruby parser.rb Dilma
Found 12 urls
http://JC%20Online has fails
http://Di%C3%A1rio%20de%20Pernambuco has fails
http://Estad%C3%A3o has fails
https://www.brasil247.com/.../Dilma-deve-sair-candidata-em-2018.htm has fails
http://brasil.elpais.com/brasil/2017/06/27/.../1498593857_443254.html has fails
http://www.correio24horas.com.br/.../dilma-sera-candidata-nas-eleicoes-de-2018-%20diz-colunista/?... has fails
```

- Para 12 urls encontradas, 6 não foram scaneadas, alguns motivos para isso podem ser:
	- Google abrevia algumas urls, pois seu mecanismo de busca um evento javascript para entrar nas páginas.
	- Link é falso, o script pegou alguma parte de texto e interpretou como link.

- Para os resultados encontrados, temos:

```
$ ls output/ -lah
total 368K
drwxrwxr-x 2 kuwener kuwener 4,0K Jul  2 22:53 .
drwxrwxr-x 3 kuwener kuwener 4,0K Jul  2 18:28 ..
-rw-rw-r-- 1 kuwener kuwener 6,4K Jul  2 22:53 file1
-rw-rw-r-- 1 kuwener kuwener 175K Jul  2 22:53 file2
-rw-rw-r-- 1 kuwener kuwener  28K Jul  2 22:53 file3
-rw-rw-r-- 1 kuwener kuwener 108K Jul  2 22:53 file4
-rw-rw-r-- 1 kuwener kuwener  18K Jul  2 22:53 file5
-rw-rw-r-- 1 kuwener kuwener  19K Jul  2 22:53 file6
```
