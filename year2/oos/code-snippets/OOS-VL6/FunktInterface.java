public class FunktInterface {
    interface BiFunction {
    double apply (double x, double y);
    }

    public static void main (String [] args) {
        BiFunction add = (x,y) -> x+y;
        BiFunction max = (x,y) -> {
            if (x>=y) return x;
            else return y;
        };
        System.out.println((add.apply(1,4)));
        System.out.println((max.apply(6,5)));
    }
}
