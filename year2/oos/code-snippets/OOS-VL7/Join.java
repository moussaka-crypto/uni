public class Join implements Runnable {
    private static int count = 0;
    private int n = count++;
    private static Thread[] task = new Thread[3];
    public void run() {
        try {
            if (n>0) {
                task[n - 1].join();
                System.out.println("Thread-" +n+" joined Thread" + (n - 1));
            }
        } catch (InterruptedException e) {
            System.err.println(e.toString());
        }
    }

    public static void main (String[] args) {
        for (int i=0; i<3; i++)
            task[i] = new Thread(new Join());
        for (int i=0; i<3; i++)
            task[i].start();
    }
}
