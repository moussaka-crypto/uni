public class Start extends Thread {

    public void run() {
        System.out.println("I am running");
        while (true);
    }

    public static void main (String [] args) {
        (new Start()).start();
        (new Start()).start();
        (new Start()).start();
        System.out.println("Main is running!");
    }
}