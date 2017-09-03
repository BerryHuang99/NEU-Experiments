package menu;

import java.util.Scanner;

import Type.User;
import control.UserControl;

public  class UserManageMenu implements Menu{
	private Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		while (true) {
			print(" _________________________________________");
			print("|                                         |");
			print("|         1.新增用户；                                                       |");
			print("|         2.删除用户；                                                       |");
			print("|         3.查看当前所有用户信息。                         |");
			print("|        （其他任意键返回）                                           |");
			print("|_________________________________________|");
			UserControl x = new UserControl();
			
			switch (in.nextInt()) {
			case 1 :
				x.set();
				break;
			case 2 :
				x.delete();
				break;
			case 3 :
				x.list();
				break;
			default :
				return u;
			}
		}
	}
	
	public static void print(String s) {
		System.out.println(s);
	}

}
