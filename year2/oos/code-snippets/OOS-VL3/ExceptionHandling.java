public class ExceptionHandling {
    public void main (String [] args) {
        int eins = 1;
        int zwei = 2;
        int ergebnis = getSum(eins,zwei);
    }

    /**
     * Gibt die Summe zweier Summanden zurück
     * @param a erster Summand
     * @param b zweiter Summand
     * @return Summe zweier Integerwerte
     */
    public int getSum(int a, int b) {
        return a+b;
    }
}
