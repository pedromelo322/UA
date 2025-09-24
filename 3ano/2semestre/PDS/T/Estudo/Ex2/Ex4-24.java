//1. criar interface Storage
public interface Storage {
    byte[] read(File fn);
    boolean write(File fn, byte[] data);
}


//2. UsbStorage e CloudStorage implementam Storage
public class UsbStorage implements Storage {
    // attributes and other methods
    public byte[] read(File fn) { /* read and return data */ }
    public boolean write(File fn, byte[] data) { /* write data in file fn */ }
}
public class CloudStorage implements Storage {
    // attributes and other methods
    public byte[] read(File fn) { /* read and return data */ }
    public boolean write(File fn, byte[] data) { /* write data in file fn */ }
}




//3. mudar os Tipos de Parâmetros de para Storage
public class TransferUtils {
    public static void copyFile(Storage usb, File orig, Storage ssd, File dest) {
        byte[] data = usb.read(orig);
        // work on data e.g. transform, compress, encrypt, etc…
        ssd.write(dest, data);
    }
    // other static functions...
}