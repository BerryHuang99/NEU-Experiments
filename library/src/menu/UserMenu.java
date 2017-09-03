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
				print("对不起！因为信用问题，您无法借书！");
				return u;
			}
			print("请输入书名或者编码");
			String s = in.nextLine();
			Book book = Library.searchB(s);
			if (book == null){
				book = Library.searchB(Integer.valueOf(s));
				if (book == null) {
					print("对不起！未找到相关图书！");
					return u;
				}
			}
			
			if (book.getLend()) {
				print("对不起！此书已外借！");
				return u;
			}
			book.change();
			book.setLendDate();
			u.borrow(book);
			print("您已借书成功！");
			return u;
			
		case 2 :
			print("请输入书名或者编码");
			String s1 = in.nextLine();
			Book book1 = u.searchB(s1);
			if (book1 == null) {
				book1 = u.searchB(Integer.valueOf(s1));
				if (book1 == null) {
					print("抱歉，您没有借过此书！");
					return u;
				}
			}
			
			u.returnBook(book1);
			print("您已还书成功！");
			return u;
			
		case 3 :
			print("请输入新密码：");
			long password = in.nextLong();
			u.changePassword(password);
			print("密码修改成功！");
			
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
