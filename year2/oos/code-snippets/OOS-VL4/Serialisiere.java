import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Serialisiere {
    public static void main (String [] args) {
        try {
            FileOutputStream fos = new FileOutputStream("vos.s");
            ObjectOutputStream os = new ObjectOutputStream(fos);
            Zeit zeit = new Zeit (11, 12);
            os.writeObject(zeit);
            os.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
