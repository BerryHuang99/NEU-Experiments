package system;

import java.util.*;

/**
 * The class <code>Order</code> maintains a list of order items. 
 * This class implements the interface <code>Iterable<OrderItem></code> to being 
 * able to iterate through the items using the for-each loop.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.11
 * @see OrderItem
 */
public class Order implements Iterable<OrderItem>{
	
	private ArrayList<OrderItem> items = null;
	
	/**
	 * The class <code>Order</code> maintains a list of order items. 
	 * This class implements the interface <code>Iterable<OrderItem></code> to being able to 
	 * iterate through the items using the for-each loop.
	 */
	public Order() {
		
		items = new ArrayList<OrderItem>();
	}
	
	/**
	 * Adds the specified order item to the collection <code>items</code>. 
	 * 
	 * @param orderItem the specified order item to the collection items. 
	 */
	public void addItem(OrderItem orderItem) {
		
		items.add(orderItem);
	}
	
	/**
	 * Removes the specified order item from the collection <code>items</code>. 
	 * 
	 * @param orderItem the specified order item from the collection items.
	 */
	public void removeItem(OrderItem orderItem) {
		
		items.remove(orderItem);
	}
	
	/**
	 * Get an iterator over the instances in the collection <code>items</code>. 
	 * 
	 * @return an iterator over the instances in the collection items. 
	 */
	public Iterator<OrderItem> iterator() {
		
		return items.iterator();
	}
	
	/**
	 * 1. Get a reference to the <code>OrderItem</code> instance with the specified product. 
	 * 2. Get null if there are no <code>items</code> in the order with the specified product. 
	 * 
	 * @param	product the specified product of the <code>OderItem<code> you want to get.
	 * @return	a reference to the OrderItem instance with the specified product.
	 * @return  null if there are no items in the order with the specified product.
	 */
	public OrderItem getItem(Product product) {
		
		for (OrderItem item : this.items) {
			if (item.getProduct().equals( product )) {
				return item;
			}
		}
		return null;
	}
	
	/**
	 *  Get the number of instances in the collection items. 
	 *  
	 * @return  the number of instances in the collection items. 
	 */
	public int getNumberOfItems() {
		
		return items.size();
	}
	
	/**
	 *  Get the total cost of the order.
	 *   
	 * @return	 the total cost of the order. 
	 */
	public double getTotalCost() {
		
		double cost = 0;
		for (OrderItem item : this.items) {
			cost = cost + item.getValue();
		}
		return cost;
	}

}
