# Versão simples do contador de palavra.

## Versão que armazena os resultados em memória

### Contador para arquivos pequenos

Para arquivos contendo pouca palavras, o contador funciona bem, e não apresenta erro algum. Para processar entradas pequenas ele seria mais indicado do que utilizar o Hadoop.

### Processando arquivo grande

Para processar grandes arquivos, esse programa não funciona conforme o esperado. Foi lançada uma excessão de falta de memória ao testarmos um input de 2GB. Dessa forma, percebe-se a necessidade de salvar os dados que estão sendo processados em disco. Portanto, resolvemos utilizar o MongoDB para armazenar os dados. O resultado desse teste será descrito mais abaixo.

A excessão gerada foi a seguinte:

```
Exception in thread "main" java.lang.OutOfMemoryError: Java heap space
	at java.util.Arrays.copyOfRange(Arrays.java:3664)
	at java.lang.String.<init>(String.java:207)
	at java.io.BufferedReader.readLine(BufferedReader.java:356)
	at java.io.BufferedReader.readLine(BufferedReader.java:389)
	at SimpleWordCounter.main(SimpleWordCounter.java:13)
```

### Código em Java

```
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;


class SimpleWordCounter {

  public static void main(String args[]) throws IOException {
      Hashtable<String, Integer> words = new Hashtable<String, Integer>();
      BufferedReader br = new BufferedReader(new FileReader("test.txt"));

      // For each line in the file
      for (String line; (line = br.readLine()) != null;) {

          // Check if word already exists,
          Integer n = words.get(line);
          if (n == null) {
              // If word does not exists, save 1.
              words.put(line, 1);
          } else {
              // If word does not exists, update the value.
              words.put(line, n + 1);
          }
      }

      FileWriter fw = new FileWriter("output.txt");
      BufferedWriter bw = new BufferedWriter(fw);
      // Save each word to file
      for (String key : words.keySet()) {
          bw.write(key + "  " + words.get(key) + "\n");
      }
      bw.close();

  }
}
```

## Versão salvando o conteúdo em disco (MongoDB)

### Contador para arquivos pequenos

Para arquivos contendo pouca palavras, o contador funciona bem, e não apresenta erro algum. Porém é mais lento do que a versão simples que salva todos os resultados em memória.


### Processando arquivo grande

Ele processou os dados durante muito tempo sem gerar erro algum. Quando resolvi medir o tempo de execução pela segunda vez, desisti pois estava demorando muito.
Porém, aparentemente, ele estava funcionando corretamente.
Aos 25 minutos de execução, o banco de dados continha 0.836GB de dados

```
> show dbs;
admin  0.000GB
local  0.000GB
test   0.836GB
```

Aos 30 minutos, passou a ter 0.965GB de dados:

```
> show dbs;
admin  0.000GB
local  0.000GB
test   0.965GB
```

Dessa forma, percebe-se que demoraria mais de uma hora para processar 2GB de dados. Portanto, resolvi interromper o experimento.


### Código em Java

Observação: foi utilizado o seguinte driver para utilizar MongoDB com java:
- mongo-java-driver-2.13.3.jar

```
import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;


public class MongoWordCounter {
	public static void main(String args[]) {

		long startTime = System.currentTimeMillis();

	    try {
	        final MongoClient mongo = new MongoClient( "localhost" , 27017 );

	        final DBCollection col =  mongo.getDB("test").getCollection("testKeywordCounter");
	        // Clean Collection
	        col.drop();


	        BufferedReader br = new BufferedReader(new FileReader("/Users/alexandretk/Desktop/projeto_Final_FSD/130718954_words.input"));
	        //BufferedReader br = new BufferedReader(new FileReader("test.txt"));

	        for (String line; (line = br.readLine()) != null;) {

	        	// Create a new object with (_id = word, value = qnt)
		        BasicDBObject data = new BasicDBObject();
		        data.append("_id", line);
		        data.append("value", 1);

		        // Query the database to check if there is already a record.
		        BasicDBObject whereQuery = new BasicDBObject();
		        whereQuery.put("_id", line);
		        DBObject objectFound = col.findOne(whereQuery);
		        // If there is a record update it's value
		        if(objectFound != null) {
		        	DBObject update = new BasicDBObject(
		        	        "$inc", new BasicDBObject("value", 1)
		        	    );
		        	col.update(objectFound, update);
		        // Else insert to the collection
		        } else {
		        	col.insert(data);
		        }
	        }

	        // Print all entries in the db.
	        DBCursor cursor = col.find();
	        while(cursor.hasNext()) {
	            System.out.println(cursor.next());
	        }

	      }
	      catch (Exception e) {
	        e.printStackTrace();
	      }

	    // Prints the time it took to run.
	    long endTime = System.currentTimeMillis();
	    System.out.println("It took " + (endTime - startTime) + " milliseconds");
	}
}
```


## Conclusão

As duas versões se demostraram ineficientes. Seria necessário paralelizar mais o processamento para que o resultado fosse satisfatório. Para solucionar este problema o Hadoop seria bastante interessante
