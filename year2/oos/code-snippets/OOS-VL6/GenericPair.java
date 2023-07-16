public class GenericPair<T,S> {
    private T first;
    private S second;

    GenericPair (T fst, S snd) {
        this.first = fst;
        this.second = snd;
    }
    public T getFirst() {
        return this.first;
    }

    public S getSn() {
        return this.second;
    }
    public static void main (String [] args) {
        GenericPair<String, String> gp = new GenericPair<>("Hello","Generics");
        System.out.println(gp.first);
        System.out.println(gp.second);
    }
}