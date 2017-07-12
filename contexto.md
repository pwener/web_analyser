# Contexto

## Contexto inicial

O contexto pensado inicialmente para o projeto foi em elaborar um parser para baixar páginas do google e obter dados relativos a períodos em que o preço de um ativo está alto ou baixo, por exemplo, de ações de empresas. Dessa forma, manualmente verificaríamos qual foi um período de alta e baixaríamos o conteúdo de páginas indexadas no google referente a esse período e faríamos a mesma coisa para um período de baixa.
Como resultado, obteríamos 2 inputs, um de alta e outro de baixa. Estes inputs seriam processados pelo contador de palavras do Hadoop, que por sua vez armazenaria as palavras mais comuns (por exemplo, as top-1000 palavras) no HBASE.
Então criaríamos um classificador, utilizando um modelo de Bag-of-Words em conjunto com Naive-Bayes para classificar em preço alto ou baixo de futuros inputs.

## Visão geral do projeto.

O projeto como um todo poderia ser visto como um conjunto de 4 módulos:

- Parser: Utilizado para a obtenção dos dados.
- Hadoop: Utilizado para contar o número de ocorrências de cada palavras.
- HBASE: Utilizado para armazenar as palavras que mais ocorrem no tipo de
- Classificador: Utiliza as palavras armazenadas no HBASE para classificar o preço de um novo ativo.


## O que foi feito

Devido aos problemas com o parser que serão discutidos a seguir, resolvemos fazer um simples contador de palavras.
