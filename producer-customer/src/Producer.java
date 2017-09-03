
/**
 * The class <code>Producer</code> is the producer extending <code>Thread</code>. 
 * It can add the object <code>Student</code> into the Storage.
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.20
 * @see Student
 * @see Storage
 */

public class Producer extends Thread {
	private Storage storage = null;
	private Student student = null;
	
	Producer(Storage storage, Student student) {
		this.storage = storage;
		this.student = student;
	}
	
	public void run() {
		
		try {
			storage.add(student);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
