package deti.sd.ex1;

public class UnsafeCounter implements Counter {
    private int value = 0;

    @Override
    public void increment() {
        value++; // This operation is not atomic
    }

    @Override
    public int getValue() {
        return value;
    }

    @Override
    public boolean incrementIfEven() {
        if (value % 2 == 0) {
            value++;
            return true;
        }
        return false;
    }
}
