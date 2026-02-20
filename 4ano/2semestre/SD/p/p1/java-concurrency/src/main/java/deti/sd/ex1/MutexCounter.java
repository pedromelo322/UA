package deti.sd.ex1;

import java.util.concurrent.locks.ReentrantLock;

public class MutexCounter implements Counter {
    private int value = 0;
    private final ReentrantLock lock = new ReentrantLock();

    @Override
    public void increment() {
        // TODO: Implement using the ReentrantLock
        lock.lock();
        try{
            value++;
        }finally{
            lock.unlock();
        }
    }

    @Override
    public int getValue() {
        // TODO: Implement thread-safe read

        int res;
        lock.lock();
        try{
            res = value;
        }finally{
            lock.unlock();
        }
        
        return res;
    }

    @Override
    public boolean incrementIfEven() {
        // TODO: Implement conditional update using the lock
        boolean res = false;
        lock.lock();
        try{
            if (value % 2 == 0) {
                value++;
                res = true;
            }
        }finally{
            lock.unlock();
        }
        return res;
    }
}
