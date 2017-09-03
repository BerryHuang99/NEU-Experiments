import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

/**
 * The class <code>FileCatalogLoader</code> implements interface <code>CatalogLoader</code>. 
 * It is used to obtain a product catalog from a file. 
 * 
 * @author BerryWong
 * @version 1.0.0
 * @since 2016.10.20
 * @see CatalogLoader
 * @see Catalog
 *
 */
public class FileCatalogLoader implements CatalogLoader {

	private BufferedReader reader = null;

	/**
	 * This method reads a line of coffee-accessory data.
	 * Return a <code>Product</code> object that encapsulates the accessory data. 
	 * 
	 * @param line a line of coffee-accessory data.
	 * @return a Product object that encapsulates the accessory data. 
	 * @throws DataFormatException If it does not have the expected number of 
	 *         tokens or the token that should contain a double does not, throw
	 *         a {@link DataFormatException} that contains the line of malformed data. 
	 */
	private Product readProduct(String line) throws DataFormatException {
		
		StringTokenizer st = new StringTokenizer(line, "_", false);
		if (st.nextToken().equals("Product") && st.countTokens() == 3) {
			try {
				return new Product(st.nextToken(), st.nextToken(), Double.parseDouble(st.nextToken()));
			}
			catch (NumberFormatException nfe) {
				throw new DataFormatException(line);
			}
		}
		else {
			throw new DataFormatException(line);
		}
	}

	/**
	 * This method reads a line of coffee data.
	 * Return a <code>Coffee</code> object that encapsulates the coffee data. 
	 * 
	 * @param line a line of coffee data.
	 * @return a Coffee object that encapsulates the coffee data.
	 * @throws DataFormatException If it does not have the expected number of 
	 *         tokens or the token that should contain a double does not, throw 
	 *         a {@link DataFormatException} that contains the line of malformed data.
	 */
	private Coffee readCoffee(String line) throws DataFormatException {
		
		StringTokenizer st = new StringTokenizer(line, "_", false);
		if (st.nextToken().equals("Coffee") && st.countTokens() == 9) {
			try{
				return new Coffee(st.nextToken(), st.nextToken(), Double.parseDouble(st.nextToken()),
						          st.nextToken(), st.nextToken(), st.nextToken(), st.nextToken(), 
						          st.nextToken(), st.nextToken());
			}
			catch (NumberFormatException nfe) {
				throw new DataFormatException(line);
			}
		}
		else {
			throw new DataFormatException(line);
		}
	}
	
	/**
	 * This method reads a line of coffee-brewer data.
	 * Return a <code>CoffeeBrewer</code> object that encapsulates the brewer data. 
	 * 
	 * @param line a line of coffee-brewer data.
	 * @return a CoffeeBrewer object that encapsulates the brewer data. 
	 * @throws DataFormatException If the line has errors, that is, if it does not 
	 *         have the expected number of tokens or the tokens that should contain 
	 *         a number do not, throw a {@link DataFormatException} that contains 
	 *         the line of malformed data. 
	 */
	private CoffeeBrewer readCoffeeBrewer(String line) throws DataFormatException {
		
		StringTokenizer st = new StringTokenizer(line, "_", false);
		if (st.nextToken().equals("Brewer") && st.countTokens() == 6) {
			try{
				return new CoffeeBrewer(st.nextToken(), st.nextToken(), Double.parseDouble(st.nextToken()), 
						                st.nextToken(), st.nextToken(), Integer.parseInt(st.nextToken()));
			}
			catch (NumberFormatException nfe) {
				throw new DataFormatException(line);
			}
		}
		throw new DataFormatException(line);
	}

	/**
	 * This method loads the information in the specified file into a product 
	 * catalog and returns the catalog. 
	 * 
	 * @param fileName The path of the specified file
	 * @return the catalog that contain the information loaded in the specified file.
	 * @throws FileNotFoundException If the specified file does not exist, throw
	 *         a {@link FileNotFoundException}.
	 * @throws IOException If there is an error reading the information in the specified 
	 *         file, throw a {@link IOException}.
	 * @throws DataFormatException  If a line in the file has errors, throw a
	 *         {@link DataFormatException} that contain the line of malformed data.
	 */
	public Catalog loadCatalog(String fileName) 
			throws FileNotFoundException, IOException, DataFormatException {
		
		Catalog catalog = new Catalog();
		File file = new File(fileName);
		
		if (file.exists()) {
				reader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
				String information = null;
			
			try {
				information = reader.readLine();
			}
			catch (Exception e) {
				throw new IOException();
			}
			while (information != null) {
				if (information.startsWith("Product")) {
					catalog.addProduct(readProduct(information));
				} else if (information.startsWith("Coffee")) {
					catalog.addProduct(readCoffee(information));
				} else if (information.startsWith("Brewer")) {
					catalog.addProduct(readCoffeeBrewer(information));
				} else{
					throw new DataFormatException(information);
				}
				try {
					information = reader.readLine();
				}
				catch (Exception e) {
					throw new IOException(fileName);
				}
			}
				reader.close();
				return catalog;
				
		} else { 
			throw new FileNotFoundException();
		}
	}
	
}
