package menu;

import java.util.Scanner;
import library.Library;
import Type.User;

public class PasswordMenu implements Menu {
	Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		print("�������û��������˺ţ�");
		String i = in.nextLine();
		u = Library.searchU(i);
		
		if (u == null) {
			u = Library.searchU(Integer.valueOf(i));
			if (u == null) {
				print("===�Բ����û������ڣ�===");
				return u;
			}
		}
		
		print("���������룺");
		int t = 0;
		
		while (true) {
			long key = in.nextLong();
			if (u.check(key)) break;
			else if (t < 2) {
				print("�Բ�������������������룡");
				t++;
			}
			else {
				print("�Բ���������������������룡");
				u = null;
			}
		}
		return u;
	}
	
	public static void print(String s) {
		System.out.println(s);
	}
	
}
