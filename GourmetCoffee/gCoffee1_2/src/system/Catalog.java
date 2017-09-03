package system;

import java.util.*;

/**
 * The class <code>Catalog</code> models a product catalog. 
 * This class implements the interface <code>Iterable<Product></code> to being able to 
 * iterate through the products using the for-each loop.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.11
 * @see Product
 */
public class Catalog implements Iterable<Product> {
	
	private ArrayList<Product> products = null;
	
	/**
	 * Creates the collection <code>products</code>, which is initially empty.
	 */
	public Catalog() {
		
		products = new ArrayList<Product>();
	}
	
	/**
	 * Adds the specified product to the collection <code>products</code>. 
	 * 
	 * @param product the specified product.
	 */
	public void addProduct(Product product) {
		
		this.products.add(product);
	}
	
	/**
	 * Get an iterator over the instances in the collection <code>products</code>.
	 * 
	 * @return an iterator over the instances in the collection products.
	 */
	public Iterator<Product> iterator() {
		
		return products.iterator();
	}
	
	/**
	 * 1. Get a reference to the <code>Product</code> instance with the specified code. 
	 * 2. Get null if there are no <code>products</code> in the catalog with the specified code¡£
	 * 
	 * @param code The unique code that identifies the product which you can use to search
	 *        an product in the catalog. 
	 * @return the product which has the code or null if none has the code.
	 */
	public Product getProduct(String code) {
		
		for (Product pro : products) {
			if (pro.getCode().equals( code )) {
				return pro;
			}
		}
		return null;
	}

	/**
	 * Get the number of instances in the collection <code>products</code>. 
	 *
	 * @return the number of instances in the collection products.
	 */
	public int getNumberOfProducts() {
		
		return products.size();
	}
}
