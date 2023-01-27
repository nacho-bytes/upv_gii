// CSD Mar 2013 Juansa Sendra

public class LimitedTable extends RegularTable { //max 4 in dinning-room
    public LimitedTable(StateManager state) {super(state);}

    private int numPhilo = 0;

    public synchronized void enter(int id) throws InterruptedException {
        while (numPhilo == 4) { wait(); }
        state.enter(id); numPhilo++;
    }
    public synchronized void exit(int id)  {
        state.exit(id); numPhilo--;
        notifyAll();
    }
}
