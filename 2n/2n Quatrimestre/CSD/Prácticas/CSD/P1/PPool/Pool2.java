// CSD feb 2015 Juansa Sendra

public class Pool2 extends Pool{ //max kids/instructor
    private int kids = 0;
    private int instructors = 0;
    private int maxKids;

    public void init(int ki, int cap) {
        maxKids = ki;
    }

    public synchronized void kidSwims() throws InterruptedException {
        while (instructors == 0 || kids + 1 > maxKids * instructors) {
            log.waitingToSwim();
            wait();
        }
        log.swimming();
        kids++;
    }

    public synchronized void kidRests() {
        log.resting();
        kids--;
        notifyAll();
    }

    public synchronized void instructorSwims() {
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
        //notifyAll();
    }
}
