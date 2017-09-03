import java.util.LinkedList;

/**
 * The class <code>Storage</code> is the storage containing <code>Object</code>s. 
 * It can contain <code>Object</code> using the <code>LinkedList</code> class as the list.
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.20
 * @see Object
 */

public class Storage {
	private final int MAX_SIZE = 5;
	private LinkedList<Object> list = new LinkedList<Object>();
	
	/**
	 * Add an object to the list.
	 * 
	 * @param o the <code>Object</code> added to the list.
	 * @throws InterruptedException
	 */
	public void add(Object o) throws InterruptedException {
		
		synchronized (list) {
			while (list.size() + 1 > MAX_SIZE) {
				System.out.println("Sorry, the storage is full temporarily! Please hold on!");
				list.wait();
			}
			list.add(o);
			System.out.println("Add successfully!");
			list.notifyAll();
		}
	}
	
	/**
	 * Get and delete the last object of the list.
	 * 
	 * @return Object
	 * @throws InterruptedException
	 */
	public Object get() throws InterruptedException {
		
		synchronized (list) {
			while (list.size() == 0) {
				System.out.println("Sorry, the storage is empty temporarily! Please hold on!");
				list.wait();
			}
			Object o = list.getLast();
			list.removeLast();
			list.notifyAll();
			return o;
		}
	}
}
