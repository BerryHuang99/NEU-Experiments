package system;

/**
 * Class <code>PlainTextSalesFormatter</code> implements the interface 
 * <code>SalesFormatter</code>. 
 * This class is implemented as a singleton so a new object will not be 
 * created every time the <em>plain-text</em> format is used.
 * 
 * @author BerryWong
 * @version 1.0.0
 * @since 2016.10.17
 * @see SalesFormatter
 */
public class PlainTextSalesFormatter implements SalesFormatter {
	
	private static PlainTextSalesFormatter singletonInstance = null;
	
	/**
	 * Constructor that is declared private so it is inaccessible to other classes. 
	 * A private constructor makes it impossible for any other class to create an 
	 * instance of class <code>PlainTextSalesFormatter</code>. 
	 */
	private PlainTextSalesFormatter() {}
	
	/**
	 * Static method that obtains the single instance of class <code>PlainTextSalesFormatter</code>.
	 * 
	 * @return the single instance of class PlainTextSalesFormatter.
	 */
	static public PlainTextSalesFormatter getSingletonInstance() {
		
		if (singletonInstance == null) {
			synchronized (SalesFormatter.class) {
				if (singletonInstance == null) {
					singletonInstance = new PlainTextSalesFormatter();
				}
			}
		}
		return singletonInstance;
	}

	/**
	 * Produces a string that contains the specified sales information in a plain-text format.
	 * 
	 *  @param sales the specified information's provider.
	 */
	public String formatSales(Sales sales) {
		
		String format = "";
		int number = 0;
		
		for (Order order : sales) {
			format += "------------------------ \n" + "order\t" + ( ++number ) + "\n";
			for (OrderItem item : order) {
				format += "\n" + item.toString();
			}
			format += "\n\n" + "Total = " + order.getTotalCost() + "\n";
		}
		
		return format;
	}

}
