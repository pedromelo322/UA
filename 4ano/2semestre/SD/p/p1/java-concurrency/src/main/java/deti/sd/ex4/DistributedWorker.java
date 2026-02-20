package deti.sd.ex4;

import java.util.concurrent.CountDownLatch;
import java.util.Random;

public class DistributedWorker implements Runnable {
    private final int workerId;
    private final CountDownLatch latch;
    private final Random random = new Random();

    public DistributedWorker(int workerId, CountDownLatch latch) {
        this.workerId = workerId;
        this.latch = latch;
    }

    @Override
    public void run() {
        try {
            System.out.println("Worker " + workerId + ": Initializing local resources...");
            // Simulate variable initialization time
            Thread.sleep(random.nextInt(2000) + 500);

            System.out.println("Worker " + workerId + ": Status READY.");

            // TODO: Signal to the latch that this worker has finished initialization
            latch.countDown();

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
