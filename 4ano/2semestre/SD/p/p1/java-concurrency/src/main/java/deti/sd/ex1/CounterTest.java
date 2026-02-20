package deti.sd.ex1;

import java.util.ArrayList;
import java.util.List;

public class CounterTest {
    private static final int NUM_THREADS = 10;
    private static final int INCREMENTS_PER_THREAD = 10000;

    public static void testCounter(Counter counter) throws InterruptedException {
        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < NUM_THREADS; i++) {
            Thread t = new Thread(() -> {
                for (int j = 0; j < INCREMENTS_PER_THREAD; j++) {
                    counter.increment();
                }
            });
            threads.add(t);
            t.start();
        }

        for (Thread t : threads) {
            t.join();
        }

        int expected = NUM_THREADS * INCREMENTS_PER_THREAD;
        System.out.println(counter.getClass().getSimpleName() +
                           " result: " + counter.getValue() +
                           " (Expected: " + expected + ")");
    }

    public static void main(String[] args) throws InterruptedException {
        System.out.println("Starting Concurrency Tests...");
        testCounter(new UnsafeCounter());
        testCounter(new MutexCounter());
        testCounter(new AtomicCounter());
    }
}
