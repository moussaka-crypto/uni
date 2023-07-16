public class Adding {
    public static void main (String[] args) {
        int x = getInt("1. Zahl:\t");
        int y = getInt("2. Zahl:\t");
        System.out.println("Summe:\t\t" + (x + y));
    }

    public static int getInt(String str) {
        String s;
        while (true) {
            try {
                s = "123";
                // s = "abc";
                return Integer.parseInt(s);
            } catch (NumberFormatException e) {
                System.out.println("Falsche Eingabe! ... ");
            }
        }
    }
}
