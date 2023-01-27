import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;
/**
 * general monitor, one condition per cell based Terrain
 * 
 * @author CSD Juansa Sendra
 * @version 2021
 */
public class Terrain2 implements Terrain {
    Viewer v;
    Condition[][] ocupada;
    ReentrantLock lock;

    public Terrain2 (int t, int ants, int movs) {
        v = new Viewer(t,ants,movs,"2.- one condition per cell");
        lock = new ReentrantLock();
        ocupada = new Condition[t][t];

        for (int i = 0; i < t; i++) {
            for (int j = 0; j < t; j++) {
                ocupada[i][j] = lock.newCondition();
            }
        }

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
            Pos act = v.getPos(a);
            v.bye(a);
            ocupada[act.x][act.y].signalAll();
        }
        finally { lock.unlock(); }
    }

    public void move (int a) throws InterruptedException {
        lock.lock();
        try {
            v.turn(a); Pos dest=v.dest(a); Pos act = v.getPos(a);
            while (v.occupied(dest)) {
                try { ocupada[dest.x][dest.y].await(); }
                catch (InterruptedException e) {}
            }
            v.go(a);
            ocupada[act.x][act.y].signalAll();
        }
        finally { lock.unlock(); }
    }
}
