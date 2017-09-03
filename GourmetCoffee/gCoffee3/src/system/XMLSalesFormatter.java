package system;

/**
 * Class <code>XMLSalesFormatter</code> implements the interface <code>SalesFormatter</code>. 
 * This class is implemented as a singleton so a new object will not be created every 
 * time the <em>XML</em> format is used.
 * 
 * @author BerryWong
 * @version 1.0.0
 * @since 2016.10.17
 * @see SalesFormatter
 */
public class XMLSalesFormatter implements SalesFormatter{
	
	private static XMLSalesFormatter singletonInstance = null;
	
	/**
	 * Constructor that is declared private so it is inaccessible to other classes. 
	 * A private constructor makes it impossible for any other class to create an 
	 * instance of class <code>XMLSalesFormatter</code>. 
	 */
	private XMLSalesFormatter() {}
	
	/**
	 * Static method that obtains the single instance of class <code>XMLSalesFormatter</code>.
	 * 
	 * @return the single instance of class XMLSalesFormatter.
	 */
	static public XMLSalesFormatter getSingletonInstance() {
		
		if (singletonInstance == null) {
			synchronized (SalesFormatter.class) {
				if (singletonInstance == null) {
					singletonInstance = new XMLSalesFormatter();
				}
			}
		}
		return singletonInstance;
	}

	/**
	 * Produces a string that contains the specified sales information in an <em>XML</em> format. 
	 * 
	 * @param sales the specified information's provider.
	 */
	public String formatSales(Sales sales) {
		
		String format = null;
		
		format = "<Sales>\n";
		for (Order order : sales) {
			format += "\t<Order total=\"" + order.getTotalCost() + "\">\n";
			for (OrderItem item : order) {
				format += "\t\tOrderItem quantity=\"" + item.getQuantity() 
					      + "\" price=\"" + item.getProduct().getPrice() 
					      + "\">" + item.getProduct().getCode() + "<\\OrderItem>\n";
			}
			format += "\t<\\Order>\n";
		}
		
		return format += "<\\Sales>";
	}
	
	

}
