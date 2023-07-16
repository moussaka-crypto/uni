public class LambdaAlsParameter {
    interface Predicate {boolean test (int x);};

    public static boolean forAll (int []a, Predicate p) {
        for (int x: a) {
            if (! p.test(x)) {
                return false;
            }
        }
        return true;
    }

    public static void main (String [] args) {
        Predicate isPositive = x -> x >= 0;
        Predicate isNegative = x -> x < 0;

        int [] a = {-3,-5,-6,-7,-2};
        System.out.println(forAll(a,isNegative));
    }
}
