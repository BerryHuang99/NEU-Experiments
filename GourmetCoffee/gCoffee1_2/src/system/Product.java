package system;

/**
 * The class <code> Product </code> models a generic product in the store.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.08
 */

public class Product {
	
	// The unique code that identifies the product 
	private String code = null;
	
	// A short description of the product 
	private String description = null;
	
	// The price of the product 
	private double price = 0;
	
	/**
	 * Constructor that initializes the instance variables <code>code</code>,
	 * <code>description</code>, and <code>price</code>.
	 * 
	 * @param initialCode the initial value of code.
	 * @param initialDescription the initial value of description.
	 * @param initialPrice the initial value of price.
	 */
	public Product(String initialCode, String initialDescription, double initialPrice) {
		code = initialCode;
		description = initialDescription;
		price = initialPrice;
	}

	/**
	 * Get the value of instance variable <code>code</code>
	 * 
	 * @return the value of instance variable code.
	 */
	public String getCode() {
		return code;
	}
	
	/**
	 * Get the value of instance variable <code>description</code>.
	 * 
	 * @return the value of instance variable description.
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * Get the value of instance variable <code>price</code>.
	 * 
	 * @return the value of instance variable price.
	 */
	public double getPrice() {
		return price;
	}
	
	/**
	 * Override the method equals.
	 * To determine whether the two classes are both <code>Product</code> objects
	 * as well as the values of their <code>code</code> are equal.
	 */
	public boolean equals(Object obj) {
		if (obj instanceof Product) {
			Product pro = ( Product ) obj;
			if (pro.getCode().equals( code )) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Override the method toString.
	 * Get the string representation of a <code>Product</code> object.
	 * 
	 * @return the string representation of a Product object.
	 */
	public String toString() {
		return code + "_" + description + "_" + price;
	}
}
