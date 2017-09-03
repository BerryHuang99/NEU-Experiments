package system;

/**
 * Interface <code>SalesFormatter</code> declares the method 
 * that every "Formatter" class will implement.
 * 
 * @author BerryWong
 * @version 1.0.0
 * @since 2016.10.17
 */
public interface SalesFormatter {

	/**
	 * Produces a string representation of the sales information.
	 * 
	 * @param sales provide the information you want.
	 * @return a string representation of the sales information.
	 */
	public String formatSales(Sales sales);
	
}
