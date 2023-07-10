public class MyFirstThread {
    public void run () {
        System.out.println("I am running");
    }
    public static void main (String [] args) {
        MyFirstThread t = new MyFirstThread();
        t.run();
        System.out.println("Main is running!");
    }
}
