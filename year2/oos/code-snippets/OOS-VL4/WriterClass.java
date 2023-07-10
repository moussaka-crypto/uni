import java.io.FileOutputStream;
import java.io.IOException;

public class WriterClass {
    public static void main (String [] args) throws IOException {
        String fileName = "Java.txt";
        try {
            FileOutputStream fos = new FileOutputStream(fileName);
            String text = "Today is a beautiful day.";
            byte[]myBytes = text.getBytes();
            fos.write(myBytes);
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }
}
