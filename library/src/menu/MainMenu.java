package menu;

import Type.User;
import library.Library;

public class MainMenu implements Menu{

	@Override
	public User handle(User u) {
		while (true) {
			print("-----------欢迎进入图书管理系统------------");
			if (u.equal(Library.searchU("manager"))){
				print(" _________________________________________");
				print("|                                         |");
				print("|         1.图书信息管理；                                             |");
				print("|         2.借书人信息管理；                                        |");
				print("|        （其他任意键退出）                                           |");
				print("|_________________________________________|");
				ManagerMenu manager = new ManagerMenu();
				manager.handle(u);
			}
			
			else {
				print(" _________________________________________");
				print("|                                         |");
				print("|         1.借书；                                                                 |");
				print("|         2.还书；                                                                 |");
				print("|         3.密码修改；                                                       |");
				print("|         4.查询个人信用 。                                            |");
				print("|        （其他任意键退出）                                           |");
				print("|_________________________________________|");
				UserMenu user = new UserMenu();
				user.handle(u);
			}
		}
	}
	
	public static void print(String s) {
		System.out.println(s);
	}
}
