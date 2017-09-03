package system;

import java.util.*;

/**
 * The class <code>Sales</code> maintains a list of the orders that have been completed. 
 * This class implements the interface <code>Iterable<Order></code> to being able to iterate
 *  through the orders using the for-each loop.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.11
 * @see Order
 */
public class Sales implements Iterable<Order> {
	
	private ArrayList<Order> orders = null;
	
	/**
	 *  Creates the collection <code>orders</code>, which is initially empty.
	 */
	public Sales() {
		
		orders = new ArrayList<Order>();
	}
	
	/**
	 * Adds the specified order to the collection <code>orders</code>. 
	 * 
	 * @param order the specified order will add to the orders.
	 */
	public void addOrder(Order order) {
		
		orders.add(order);
	}
	
	/**
	 *  Get the number of instances in the collection <code>orders</code>. 
	 * 
	 * @return an iterator over the instances in the collection orders.
	 */
	public int getNumberOfOrders() {
		
		return orders.size();
	}

	/**
	 * Get an iterator over the instances in the collection <code>orders</code>. 
	 * 
	 * @return an iterator over the instances in the collection orders. 
	 */
	public Iterator<Order> iterator() {
		
		return orders.iterator();
	}

}
