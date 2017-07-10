# Versão simples do contador de palavra.

### Contador para arquivos pequenos

Para arquivos contendo pouca palavras, o contador funciona bem, e não apresenta erro algum. Para processar entradas pequenas ele seria mais indicado do que utilizar o Hadoop.

### Processando arquivo grande

Para processar grandes arquivos, esse programa não funciona conforme o esperado. Foi lançada uma excessão de falta de memória ao testarmos um input de 2GB. Dessa forma, percebe-se a necessidade de algo mais complexo e robusto como o Hadoop.

A excessão gerada foi a seguinte:

```
Exception in thread "main" java.lang.OutOfMemoryError: Java heap space
	at java.util.Arrays.copyOfRange(Arrays.java:3664)
	at java.lang.String.<init>(String.java:207)
	at java.io.BufferedReader.readLine(BufferedReader.java:356)
	at java.io.BufferedReader.readLine(BufferedReader.java:389)
	at SimpleWordCounter.main(SimpleWordCounter.java:13)
```
