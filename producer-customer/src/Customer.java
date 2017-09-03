
/**
 * The class <code>Customer</code> is the customer extending <code>Thread</code>. 
 * It can get the last object <code>Student</code> from the <code>Storage</code>.
 * And delete this object from the <code>Storage</code>.
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.20
 * @see Student
 * @see Storage
 */

public class Customer extends Thread{
	private Storage storage = null;
	
	Customer(Storage storage) {
		this.storage = storage;
	}
	
	public void run() {
		Student student;
		try {
			student = (Student)storage.get();
			System.out.println("The last student is " + student.toString());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
