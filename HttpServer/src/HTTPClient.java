import java.io.*;
import java.net.*;

public class HTTPClient {
	
	public static void main(String args[]) throws UnknownHostException, IOException {
		
		Socket s = new Socket("127.0.0.1", 8888);
		
		try {
			String filename = null;
			PrintStream writer = new PrintStream(s.getOutputStream());
			
			writer.println("GET" + filename + "HTTP/1.1");
			writer.println("Host:localhost");
			writer.println("connection:keep -alive");
			writer.println();
			writer.flush();
			
		} finally {
			
			s.close();
		}
		
		
	}
}
