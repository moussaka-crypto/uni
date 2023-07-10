import java.util.ArrayList;
import java.util.List;

public class SimpleGenerics {
    public static void main (String[] args) {
        List meineListe = new ArrayList();
        meineListe.add(42);
        String s = (String) meineListe.get(0);

        List<String> meineListe2 = new ArrayList<>();
        meineListe2.add("Hello");
        String s2 = meineListe2.get(0);
    }
}
