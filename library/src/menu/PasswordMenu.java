package menu;

import java.util.Scanner;
import library.Library;
import Type.User;

public class PasswordMenu implements Menu {
	Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		print("请输入用户名或者账号：");
		String i = in.nextLine();
		u = Library.searchU(i);
		
		if (u == null) {
			u = Library.searchU(Integer.valueOf(i));
			if (u == null) {
				print("===对不起！用户不存在！===");
				return u;
			}
		}
		
		print("请输入密码：");
		int t = 0;
		
		while (true) {
			long key = in.nextLong();
			if (u.check(key)) break;
			else if (t < 2) {
				print("对不起！密码错误！请重新输入！");
				t++;
			}
			else {
				print("对不起！您已三次输入错误密码！");
				u = null;
			}
		}
		return u;
	}
	
	public static void print(String s) {
		System.out.println(s);
	}
	
}
