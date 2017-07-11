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

import java.util.List;
import java.util.Set;


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
