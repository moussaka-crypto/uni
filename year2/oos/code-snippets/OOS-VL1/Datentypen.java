public class Datentypen {
    public static void main (String [] args) {
        long x = 5;
        int y = 3;
        x = y;
        // y = x (Compilerfehler, da der Cast in dieser Reihenfolge nicht erlaubt ist)
    }
}