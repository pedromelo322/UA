package deti.sd.ex1;

public interface Counter {
    /**
     * Increments the counter by 1.
     */
    void increment();

    /**
     * Returns the current value of the counter.
     */
    int getValue();

    /**
     * Updates the counter only if the current value is even.
     * @return true if updated, false otherwise.
     */
    boolean incrementIfEven();
}
