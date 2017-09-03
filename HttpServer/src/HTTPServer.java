import java.io.*;
import java.net.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class HTTPServer {
	
	public static void main(String args[]) throws IOException {
		
		
		// 创建一个大小为5的线程池
		ExecutorService executor = Executors.newFixedThreadPool(5);
		
		try {
			ServerSocket  ss = new ServerSocket(8888);
			
			while(true) {
				
				// 运行线程池，接收客户端发送来的进程
				executor.execute(new Runnable() {
					 
					@Override
					public void run() {
						try {
							
							Socket s = ss.accept();
							TaskThread t = new TaskThread(s);
							t.start();
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						} finally {
							
							try {
								ss.close();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				});	
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		};
		
		
	}
}
