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

      for (String line; (line = br.readLine()) != null;) {
          //System.out.println(line);

          Integer n = words.get(line);
          if (n == null) {
              words.put(line, 1);
              //System.out.println(line + words.get(line));
          } else {
              words.put(line, n + 1);
              //words.computeIfPresent(line, (k, v) -> v + 1);
              //System.out.println(line + words.get(line));
          }
      }

      FileWriter fw = new FileWriter("output.txt");
      BufferedWriter bw = new BufferedWriter(fw);

      for (String key : words.keySet()) {
          //System.out.println(key + ":" + words.get(key));
          bw.write(key + "  " + words.get(key) + "\n");
      }
      bw.close();

  }
}
