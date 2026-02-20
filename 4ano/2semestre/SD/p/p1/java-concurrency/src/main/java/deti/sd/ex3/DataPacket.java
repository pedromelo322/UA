package deti.sd.ex3;

public class DataPacket {
    private final int sequenceNumber;
    private final String payload;

    public DataPacket(int sequenceNumber, String payload) {
        this.sequenceNumber = sequenceNumber;
        this.payload = payload;
    }

    public int getSequenceNumber() {
        return sequenceNumber;
    }

    @Override
    public String toString() {
        return "Packet #" + sequenceNumber + " [" + payload + "]";
    }
}
