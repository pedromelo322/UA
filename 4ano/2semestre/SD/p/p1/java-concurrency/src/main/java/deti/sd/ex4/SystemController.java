package deti.sd.ex4;

import java.util.concurrent.CountDownLatch;

public class SystemController {
    private static final int NUM_WORKERS = 4;

    public static void main(String[] args) {
        // TODO: Initialize a CountDownLatch with a count equal to the number of workers
        CountDownLatch latch = new CountDownLatch(NUM_WORKERS);

        System.out.println("Controller: Waiting for " + NUM_WORKERS + " workers to initialize...");

        for (int i = 1; i <= NUM_WORKERS; i++) {
            new Thread(new DistributedWorker(i, latch)).start();
        }

        try {
            // TODO: Block the controller thread until the latch count reaches zero
            // throw new InterruptedException(); // <- remove

            long val;
            do{

                val = latch.getCount();
                System.out.println((NUM_WORKERS - val) + " Workers Ready");

            }while(val != 0);

        }finally{
            System.out.println("Controller: All workers ready. STARTING DISTRIBUTED SYSTEM.");
        }

        
    }
}
