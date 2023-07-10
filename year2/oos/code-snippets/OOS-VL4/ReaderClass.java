import java.io.*;

public class ReaderClass {
    public static void main (String [] args ) {
        String fileName = "Java.txt";
        try {
            BufferedReader br = new BufferedReader(new FileReader(new File(fileName)));
            String line = "";
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }
            br.close();
        } catch (FileNotFoundException e) {
            System.out.println("File does not exist: " + e.getStackTrace());
        } catch (IOException e) {
            System.out.println("An IO Exception occured while reading the file: " + e.getStackTrace());
        }
    }
}
