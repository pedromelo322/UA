package deti.sd.ex3;

import java.util.concurrent.BlockingQueue;

public class DataProcessor implements Runnable {
    private final BlockingQueue<DataPacket> buffer;

    public DataProcessor(BlockingQueue<DataPacket> buffer) {
        this.buffer = buffer;
    }

    @Override
    public void run() {
        try {
            while (true) {
                // TODO: Take a packet from the buffer.
                // Note: take() will block if the buffer is empty.
                DataPacket packet = buffer.take();

                if (packet != null && packet.getSequenceNumber() == -1) break;

                System.out.println("Consumer: Processing " + packet);
                Thread.sleep(300); // Simulate heavy processing (slower than producer)
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
