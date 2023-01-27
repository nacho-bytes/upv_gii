import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;
/**
 * general monitor, 1 general condition based Terrain
 * 
 * @author CSD Juansa Sendra
 * @version 2021
 */
public class Terrain1 implements Terrain {
    Viewer v;
    Condition ocupada;
    ReentrantLock lock;

    public Terrain1 (int t, int ants, int movs) {
        v = new Viewer(t,ants,movs,"1.- 1 general condition");
        lock = new ReentrantLock();
        ocupada = lock.newCondition();

        for (int i=0; i<ants; i++) new Ant(i,this,movs).start();
    }

    public void hi (int a) {
        lock.lock();
        try { v.hi(a); }
        finally { lock.unlock(); }
    }

    public void bye (int a) {
        lock.lock();
        try {
            v.bye(a);
            ocupada.signalAll();
        }
        finally { lock.unlock(); }
    }

    public void move (int a) throws InterruptedException {
        lock.lock();
        try {
            v.turn(a); Pos dest=v.dest(a);
            while (v.occupied(dest)) {
                try { ocupada.await(); }
                catch (InterruptedException e) {}
            }
            v.go(a); ocupada.signalAll();
        }
        finally { lock.unlock(); }
    }
}