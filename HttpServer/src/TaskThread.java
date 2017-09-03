import java.io.*;
import java.net.*;

public class TaskThread extends Thread {
	
	private Socket s;
	
	public TaskThread(Socket s) {
		this.s = s;
	}
	
	public void run() {
		
		BufferedReader reader = null;
		PrintWriter writer = null;
		String firstLineOfRequest;
		FileInputStream in = null;
		
		try {
			
			reader = new BufferedReader(new InputStreamReader(s.getInputStream()));
			
			firstLineOfRequest = reader.readLine();
			
			String uri = firstLineOfRequest.split(" ")[1];
			
			writer = new PrintWriter(s.getOutputStream());
			
			writer.println("HTTP/1.1 200 OK");
			
			if (uri.endsWith(".html")) {
				
				writer.println("Content-Type:text/html");
			} else if (uri.endsWith("jpg")) {
				
				writer.println("Content-Type:text/html");
			} else {
				
				writer.println("Content-Type：application/octet-stream");
			}
			
			in = new FileInputStream("c:/workspace" + uri);
			
			//发送响应头
			writer.println("Content-Length:" + in.available());//返回内容字节数
			writer.println();//根据HTTP协议，空行将结束信息
			
			writer.flush();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}