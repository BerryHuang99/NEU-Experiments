

/**
 * This exception is thrown when malformed data is detected while
 * a file being parsed.
 *
 * @author BerryWong
 * @version 1.0.0
 * @since 2016.10.20
 */
public class DataFormatException extends Exception  {

	/**
	 * Constructs a <code>DataFormatException</code> with no detail
	 * message.
	 */
	public DataFormatException() {

	}

	/**
	 * Constructs a <code>DataFormatException</code> with the
	 * specified detail message.
	 *
	 * @param message  the malformed data
	 */
	public DataFormatException(String message) {

		super(message);
	}
}
