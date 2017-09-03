package system;

/**
 * The class <code>Coffee</code> models a coffee product. 
 * It extends class <code>Product</code>.
 * 
 * @author BerryWong
 * @version 1.0.0 
 * @since 2016.10.08
 * @see Product
 */

public class Coffee extends Product {
	
	// The origin of the coffee. 
	private String origin = null;
	
	// The roast of the coffee. 
	private String roast = null;
	
	// The flavor of the coffee. 
	private String flavor = null;
	
	// The aroma of the coffee. 
	private String aroma = null;
	
	// The acidity of the coffee. 
	private String acidity = null;
	
	// The body of the coffee. 
	private String body = null;
	
	/**
	 * Constructor that initializes the instance variables <code>code</code>, 
	 * <code>description</code>, <code>price</code>, <code>origin</code>,
	 * <code>roast</code>, <code>flavor</code>, <code>aroma</code>, <code>acidity</code>,
	 * and <code>body</code>.
	 * 
	 * @param initialCode the initial value of code.
	 * @param initialDescription the initial value of description.
	 * @param initialPrice the initial value of price.
	 * @param initialOrigin the initial value of origin.
	 * @param initialRoast the initial value of roast.
	 * @param initialFlavor the initial value of flavor.
	 * @param initialAroma the initial value of aroma.
	 * @param initialAcidity the initial value of acidity.
	 * @param initialBody the initial value of body.
	 */
	public Coffee(String initialCode, String initialDescription, double initialPrice,
			      String initialOrigin, String initialRoast, String initialFlavor,
			      String initialAroma, String initialAcidity, String initialBody) {
		super(initialCode, initialDescription, initialPrice);
		origin = initialOrigin;
		roast = initialRoast;
		flavor = initialFlavor;
		aroma = initialAroma;
		acidity = initialAcidity;
		body = initialBody;
	}

	/**
	 * Get the value of instance variable <code>origin</code>.
	 * 
	 * @return the value of instance variable origin.
	 */
	public String getOrigin() {
		return origin;
	}

	/**
	 * Get the value of instance variable <code>roast</code>.
	 * 
	 * @return the value of instance variable roast.
	 */
	public String getRoast() {
		return roast;
	}

	/**
	 * Get the value of instance variable <code>flavor</code>.
	 * 
	 * @return the value of instance variable flavor.
	 */
	public String getFlavor() {
		return flavor;
	}
	
	/**
	 * Get the value of instance variable <code>aroma</code>.
	 * 
	 * @return the value of instance variable aroma.
	 */
	public String getAroma() {
		return aroma;
	}
	
	/**
	 * Get the value of instance variable <code>acidity</code>.
	 * 
	 * @return the value of instance variable acidity.
	 */
	public String getAcidity() {
		return acidity;
	}

	/**
	 * Get the value of instance variable <code>body</code>.
	 * 
	 * @return the value of instance variable body.
	 */
	public String getBody() {
		return body;
	}

	/**
	 * Override the method toString.
	 * Get the string representation of a <code>Coffee</code> object.
	 * 
	 * @return the string representation of a Coffee object.
	 */
	public String toString() {
		return super.toString() + "_" + origin + "_" + roast + "_" + flavor + "_" + aroma + "_" + acidity + "_" + body;
	}

}
