package system;

/**
 * Class <code>OrderItem</code> models an item in an order.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.08
 * @see Product
 */

public class OrderItem {
	
	// The quantity of the product in the order. 
	private int quantity = 0;
	
	/*
	** This instance variable represents the one-way association between OrderItem and Product.
	** It contains a reference to a Product object. 
	*/
	private Product product = null;
	
	/**
	 * Constructor that initializes the instance variables <code>product</code> and <code>quantity</code>.
	 * 
	 * @param initialProduct the initial value of product.
	 * @param initialQuantity the initial value of quantity.
	 */
	public OrderItem(Product initialProduct, int initialQuantity) {
		product = initialProduct;
		quantity = initialQuantity;
	}
	
	/**
	 * Get the value of instance variable <code>product</code>.
	 * 
	 * @return the value of instance variable product.
	 */
	public Product getProduct() {
		return product;
	}
	
	/**
	 * Get the value of instance variable <code>quantity</code>.
	 * 
	 * @return the value of instance variable quantity.
	 */
	public int getQuantity() {
		return quantity;
	}
	
	/**
	 * Assign a new value to <code>quantity</code>.
	 * 
	 * @param newQuantity a new value of quantity
	 */
	public void setQuantity(int newQuantity) {
		quantity = newQuantity;
	}
	
	/**
	 * Get the value of the product of <code>quantity</code> and <code>price</code>.
	 * 
	 * @return the product of quantity and price.
	 */
	public double getValue() {
		return quantity * product.getPrice();
	}

	/**
	 * Override the method toString.
	 * Get the string representation of a <code>OrderItem</code> object.
	 * 
	 * @return the string representation of a OrderItem object.
	 */
	public String toString() {
		return quantity + " " + product.getCode() + " " + product.getPrice();
	}
}
