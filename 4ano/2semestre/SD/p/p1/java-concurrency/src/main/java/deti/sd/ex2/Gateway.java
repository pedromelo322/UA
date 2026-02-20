package deti.sd.ex2;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class Gateway {
    private static final int THREAD_POOL_SIZE = 5;
    private static final int TOTAL_TASKS = 50;

    public static void main(String[] args) {
        // TODO: Initialize a Fixed Thread Pool using Executors
        ExecutorService executor = Executors.newFixedThreadPool(THREAD_POOL_SIZE);

        System.out.println("Gateway: Dispatching " + TOTAL_TASKS + " tasks...");

        for (int i = 0; i < TOTAL_TASKS; i++) {
            // TODO: Submit a new HeavyTask to the executor
            executor.submit(new HeavyTask(i));
            
        }

        // TODO: Initiate a graceful shutdown
        // The executor should stop accepting new tasks but finish existing ones
        executor.shutdown();

        try {
            // TODO: Wait for all tasks to complete (e.g., wait up to 1 minute)
            // Use awaitTermination to block the main thread until work is done
            //throw new InterruptedException(); // <- remove

            executor.awaitTermination(60, TimeUnit.SECONDS);

        } catch (InterruptedException e) {
            System.err.println("Gateway shutdown interrupted.");
        }

        System.out.println("Gateway: All tasks finished. Shutting down.");
    }
}
