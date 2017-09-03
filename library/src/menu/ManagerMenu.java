package menu;

import java.util.Scanner;

import Type.User;

public class ManagerMenu implements Menu{
	Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		switch (in.nextInt()) {
		case 1 :
			BookManageMenu x = new BookManageMenu();
			return x.handle(u);
		case 2:
			UserManageMenu x1 = new UserManageMenu();
			return x1.handle(u);
		default :
			u = null;
			return u;
		}
	}

}
