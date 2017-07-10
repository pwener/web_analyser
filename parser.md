# Parser

### - Para que serve o Parser?

Inicialmente o contexto projeto consistia em analisar o preço de algum ativo, como ações de uma empresa, preços de matérias primas, etc.

Dessa forma, baixariamos do Google o conteúdo de uma série de sites durante um período em que o ativo estava com o preço alto, e, posteriormente, durante o período em que o ativo estava barato. Dessa forma, seriam obtidos dois tipos de arquivos categorizados como "preço_alto.txt" e "preço_baixo.txt". A partir daí utilizariamos o Hadoop em conjunto com técnicas de Machine Learning para avaliar se existe correlação entre as palavras de cada arquivo com o preço daquele ativo.

A partir dessa correlação, talvez fosse possível inserir textos atuais e avaliar se o preço do ativo relacionado àquele texto aparentemente está em um período de alte ou de baixa.


### - O que o parser faz?

Ele funciona como um web crawler com profundidade de busca limitada a 1 (depth of 1). Ele faria um busca no google seguindo o padrão citado abaixo, e baixaria o conteúdo dos sites encontrados por meio dessa pesquisa.

Além disso, ele deprezaria as tags HTML dos sites a fim de gerar um conteúdo válido a ser avaliado posteriormente.

Parâmetros enviados via URL utilizados:

- q= -> termo de busca.
- num= -> número de links por página.
- start= -> qual o número do link em que se inicia a busca.

Exemplo de busca:
```
http://www.google.com/search?q=apple&num=100&start=100
```

### - Problemas encontrados

#### Erro 503

Após rodar o parser algumas vezes o google começou a bloquear nossas buscas gerando um erro 503, possivelmente, estava exibindo um CAPTCHA para verificar se era algum robô que estava realizando a pesquisa.

Resolvemos mostrar na tela o resultado obtido quando o erro 503 ocorria, e o conteúdo consistia basicamente do que está abaixo:

```
Our systems have detected unusual traffic from your computer network.  This page checks to see if it's really you sending the requests, and not a robot.

This page appears when Google automatically detects requests coming from your computer network which appear to be in violation of the Terms of Service.

The block will expire shortly after those requests stop.  In the meantime, solving the above CAPTCHA will let you continue to use our services.

This traffic may have been sent by malicious software, a browser plug-in, or a script that sends automated requests.  If you share your network connection, ask your administrator for help; a different computer using the same IP address may be responsible.  

Sometimes you may be asked to solve the CAPTCHA if you are using advanced terms that robots are known to use, or sending requests very quickly.
```

#### API do Google

Após identificar o problema do erro 503, pensamos em utilizar a API de busca do Google, porém a versão gratuita dela permite que poucas consultas sejam feitas diariamente.
Já a versão paga é bastante cara e o pagamento depende do número de buscas, dessa forma achamos inconveniente baixar sites do Google para utilizar como input do contador de palavras, visto que o volume de dados seria pequeno.
