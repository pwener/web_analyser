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
