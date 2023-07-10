public class Ausdruecke {
    public static void main (String [] args) {
        int x = 4;
        int y = x + ++x; //Bei x++ wird erst im Nachgang das x erhöht, also y = 8
        System.out.println(y);
        System.out.println(x);
    }
}