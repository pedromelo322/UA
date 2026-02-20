package deti.sd.ex1;

import java.util.concurrent.atomic.AtomicInteger;

public class AtomicCounter implements Counter {
    private final AtomicInteger value = new AtomicInteger(0);

    @Override
    public void increment() {
        // TODO: Use AtomicInteger methods to increment
        value.incrementAndGet();
    }

    @Override
    public int getValue() {
        // TODO: Retrieve the atomic value
        return value.get();
    }

    @Override
    public boolean incrementIfEven() {
        // TODO: Use compareAndSet in a loop for a lock-free update
        
        int val;
        boolean res;

        do{
            val = value.get();
            if (val % 2 != 0){
                return false;
            }
            res = value.compareAndSet(val, val++);
            
        }while(!res);

        return res;
    }
}
