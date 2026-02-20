package deti.sd.ex3;

import java.util.concurrent.BlockingQueue;

public class NetworkProducer implements Runnable {
    private final BlockingQueue<DataPacket> buffer;

    public NetworkProducer(BlockingQueue<DataPacket> buffer) {
        this.buffer = buffer;
    }

    @Override
    public void run() {
        try {
            for (int i = 1; i <= 20; i++) {
                // TODO: Put the packet into the buffer.
                // Note: put() will block if the buffer is full.
                DataPacket packet = new DataPacket(i, "SEQ: " + i);
                buffer.put(packet);
                System.out.println("Producer: Received and queueing " + packet);

                Thread.sleep(100); // Simulate network arrival delay
            }
            // Signal the end of data (Poison Pill pattern)
            buffer.put(new DataPacket(-1, "STOP"));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

