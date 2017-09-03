
/**
 * The class <code>Test</code> models how to solve a producer & customer problem. 
 * 
 * @author BerryHuang
 * @version 1.0.0 
 * @since 2017.6.20
 * @see Producer
 * @see Customer
 * @see Student
 * @see Storage
 */

public class Test {

	public static void main(String[] args) {
		
		Storage storage = new Storage();
		
		 new Producer(storage, new Student("name1", 1001)).start();;
		 new Producer(storage, new Student("name2", 1002)).start();
		 new Producer(storage, new Student("name3", 1003)).start();
		 
		 new Customer(storage).start();
		 new Customer(storage).start();
		 new Customer(storage).start();
		 
		 new Customer(storage).start();
		 
		 new Producer(storage, new Student("name4", 1004)).start();
		 
		 new Producer(storage, new Student("name5", 1005)).start();
		 new Producer(storage, new Student("name6", 1006)).start();
		 new Producer(storage, new Student("name7", 1007)).start();
		 new Producer(storage, new Student("name8", 1008)).start();
		 new Producer(storage, new Student("name9", 1009)).start();
		 new Producer(storage, new Student("name10", 1010)).start();
		 
		 new Customer(storage).start();
	}

}
