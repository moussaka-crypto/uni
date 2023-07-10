public class Main {
    public static void main(String[] args) {

          // Aufgabe 2
        boolean a = true, b = true;
        a = true || ( (b = false) == true );
        System.out.println("ODER mit SCE:");
        System.out.println("a: " + a);
        System.out.println("b: " + b); // 2. Teil nicht ausgefuehrt

        a = true | ( (b = false) == true );
        System.out.println("ODER ohne SCE:");
        System.out.println("a: " + a);
        System.out.println("b: " + b); // 2. Teil ausgefuehrt
    }
}