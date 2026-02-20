package deti.sd.ex2;

public class HeavyTask implements Runnable {
    private final int taskId;

    public HeavyTask(int taskId) {
        this.taskId = taskId;
    }

    @Override
    public void run() {
        try {
            System.out.println("Task " + taskId + " is being processed by " +
                               Thread.currentThread().getName());
            // Simulate work (e.g., cryptographic operations or DB lookup)
            Thread.sleep(500);
            System.out.println("Task " + taskId + " completed.");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
