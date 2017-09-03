package control;

import java.util.Scanner;
import library.Library;
import Type.Book;

public class BookControl implements Control{
	private static Scanner in = new Scanner(System.in);

	@Override
	public void delete(){
		print("������ͼ�������߱�ţ�");
		String b = in.nextLine();
		
		if (!Library.deleteB(b)) {
			if (!Library.deleteB(Integer.valueOf(b))) {
				print("�Բ���δ�ҵ����ͼ�飡");
				return;
			}
		}
		print("ͼ��ɾ���ɹ�!");
	}
	
	@Override
	public void set() {
		print("����������:");
		String name = in.nextLine();
		print("�������ţ�");
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
		print("����\t\t���");
		for (Book b : Library.getBooks()) {
			b.print();
		}
	}
}
