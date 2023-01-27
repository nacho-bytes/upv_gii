// CSD feb 2015 Juansa Sendra

public class Pool3 extends Pool{ //max capacity
    private int kids = 0;
    private int instructors = 0;
    private int maxKids, maxSwimmers;

    public void init(int ki, int cap) {
        maxKids = ki;
        maxSwimmers = cap;
    }

    public synchronized void kidSwims() throws InterruptedException {
        while (instructors == 0 || kids + 1 > maxKids * instructors 
            || kids + instructors + 1 > maxSwimmers) {
            log.waitingToSwim();
            wait();
        }
        log.swimming();
        kids++;
        notifyAll();
    }

    public synchronized void kidRests() {
        log.resting();
        kids--;
        notifyAll();
    }

    public synchronized void instructorSwims() throws InterruptedException {
        while (kids + instructors + 1 > maxSwimmers) {
            log.waitingToSwim();
            wait();
        }
        log.swimming();
        instructors++;
        notifyAll();
    }

    public synchronized void instructorRests() throws InterruptedException {
        while (kids > 0 && instructors == 1 || kids > maxKids * (instructors - 1)) {
            log.waitingToRest();
            wait();
        }
        instructors--;
        log.resting();
        notifyAll();
    }
}
