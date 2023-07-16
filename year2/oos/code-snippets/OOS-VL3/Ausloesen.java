public class Ausloesen {
    public void nurPositiv(int zahl) throws NegativerParameterException {
        if (zahl <= 0) {
            throw new NegativerParameterException("Parameter nicht positiv!");
        }
    }

    public static void main (String[] args) {
        Ausloesen ausloesen = new Ausloesen();
        ausloesen.nurPositiv(0);
    }

    public class NegativerParameterException extends ArithmeticException {
        NegativerParameterException (String ausgabe) {
            super(ausgabe);
        }
    }
}