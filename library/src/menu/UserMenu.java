package menu;

import java.util.Scanner;

import Type.User;
import Type.Book;
import library.Library;

public class UserMenu implements Menu{
	private Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		switch (in.nextInt()){
		case 1 :
			if (!u.getCredit()) {
				print("�Բ�����Ϊ�������⣬���޷����飡");
				return u;
			}
			print("�������������߱���");
			String s = in.nextLine();
			Book book = Library.searchB(s);
			if (book == null){
				book = Library.searchB(Integer.valueOf(s));
				if (book == null) {
					print("�Բ���δ�ҵ����ͼ�飡");
					return u;
				}
			}
			
			if (book.getLend()) {
				print("�Բ��𣡴�������裡");
				return u;
			}
			book.change();
			book.setLendDate();
			u.borrow(book);
			print("���ѽ���ɹ���");
			return u;
			
		case 2 :
			print("�������������߱���");
			String s1 = in.nextLine();
			Book book1 = u.searchB(s1);
			if (book1 == null) {
				book1 = u.searchB(Integer.valueOf(s1));
				if (book1 == null) {
					print("��Ǹ����û�н�����飡");
					return u;
				}
			}
			
			u.returnBook(book1);
			print("���ѻ���ɹ���");
			return u;
			
		case 3 :
			print("�����������룺");
			long password = in.nextLong();
			u.changePassword(password);
			print("�����޸ĳɹ���");
			
		case 4 :
			System.out.println(u.getCredit());
			return u;
			
		default :
			u = null;
			return u;
		}
	}
	
	public  static void print(String s) {
		System.out.println(s);
	}
}
