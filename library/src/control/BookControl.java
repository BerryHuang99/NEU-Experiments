package control;

import java.util.Scanner;
import library.Library;
import Type.Book;

public class BookControl implements Control{
	private static Scanner in = new Scanner(System.in);

	@Override
	public void delete(){
		print("请输入图书名或者编号：");
		String b = in.nextLine();
		
		if (!Library.deleteB(b)) {
			if (!Library.deleteB(Integer.valueOf(b))) {
				print("对不起！未找到相关图书！");
				return;
			}
		}
		print("图书删除成功!");
	}
	
	@Override
	public void set() {
		print("请输入书名:");
		String name = in.nextLine();
		print("请输入编号：");
		long id = in.nextLong();
		Book b = new Book(name, id);
		Library.add(b);
	}
	
	@Override
	public void print(String s){
		System.out.println(s);
	}

	@Override
	public void list() {
		print("书名\t\t编号");
		for (Book b : Library.getBooks()) {
			b.print();
		}
	}
}
