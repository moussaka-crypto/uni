import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

public class Deserialisiere {
    public static void main (String [] args) {
        try {
            FileInputStream fis = new FileInputStream("vos.s");
            ObjectInputStream ois = new ObjectInputStream(fis);

            Zeit zeit = (Zeit) ois.readObject();
            System.out.println(zeit);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
