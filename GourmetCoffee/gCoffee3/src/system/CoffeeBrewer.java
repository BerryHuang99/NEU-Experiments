package system;

/**
 * Class <code>CoffeeBrewer</code> models a coffee brewer. 
 * It extends class <code>Product</code>.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.08
 * @see Product
 */

public class CoffeeBrewer extends Product {
	
	// The model of the coffee brewer.
	private String model = null;
	
	// The water supply (Pour-over or Automatic). 
	private String waterSupply = null;
	
	// The capacity of the coffee brewer.
	private int numberOfCups = 0;
	
	/**
	 * Constructor that initializes the instance variables <code>code</code>, 
	 * <code>description</code>, <code>price</code>, <code>model</code>, 
	 * <code>waterSupply</code>, and <code>numberOfCups</code>.
	 * 
	 * @param initialCode the initial value of code.
	 * @param initialDescription the initial value of description.
	 * @param initialPrice the initial value of price.
	 * @param initialModel the initial value of model.
	 * @param initialWaterSupply the initial value of waterSupply.
	 * @param initialNumberOfCups the initial value of numberOfCups.
	 */
	public CoffeeBrewer(String initialCode, String initialDescription, 
						double initialPrice, String initialModel, 
						String initialWaterSupply, int initialNumberOfCups) {
		super(initialCode, initialDescription, initialPrice);
		model = initialModel;
		waterSupply = initialWaterSupply;
		numberOfCups = initialNumberOfCups;		
	}

	/**
	 * Get the value of instance variable <code>model</code>.
	 * 
	 * @return the value of instance variable model.
	 */
	public String getModel() {
		return model;
	}

	/**
	 * Get the value of instance variable <code>waterSupply</code>.
	 * 
	 * @return the value of instance variable waterSupply.
	 */
	public String getWaterSupply() {
		return waterSupply;
	}

	/**
	 * Get the value of instance variable <code>numberOfCups</code>.
	 * 
	 * @return the value of instance variable numberOfCups.
	 */
	public int getNumberOfCups() {
		return numberOfCups;
	}

	/**
	 * Override the method toString.
	 * Get the string representation of a <code>CoffeeBrewer</code> object.
	 * 
	 * @return the string representation of a CoffeeBrewer object.
	 */
	public String toString() {
		return super.toString() + "_" + model + "_" + waterSupply + "_" + numberOfCups;
	}
	
}
