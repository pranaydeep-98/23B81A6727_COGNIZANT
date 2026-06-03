class MessageThread extends Thread {
    private String message;

    MessageThread(String message) {
        this.message = message;
    }

    public void run() {
        for (int i = 1; i <= 5; i++) {
            System.out.println(message);
        }
    }
}

public class ThreadCreation {
    public static void main(String[] args) {
        MessageThread t1 = new MessageThread("Hello from Thread 1");
        MessageThread t2 = new MessageThread("Hello from Thread 2");

        t1.start();
        t2.start();
    }
}
/*
Hello from Thread 1
Hello from Thread 1
Hello from Thread 1
Hello from Thread 2
Hello from Thread 2
Hello from Thread 2
Hello from Thread 2
Hello from Thread 2
Hello from Thread 1
Hello from Thread 1
 */