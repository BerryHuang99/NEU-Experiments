package menu;

import Type.User;
import library.Library;

public class MainMenu implements Menu{

	@Override
	public User handle(User u) {
		while (true) {
			print("-----------��ӭ����ͼ�����ϵͳ------------");
			if (u.equal(Library.searchU("manager"))){
				print(" _________________________________________");
				print("|                                         |");
				print("|         1.ͼ����Ϣ����                                             |");
				print("|         2.��������Ϣ����                                        |");
				print("|        ������������˳���                                           |");
				print("|_________________________________________|");
				ManagerMenu manager = new ManagerMenu();
				manager.handle(u);
			}
			
			else {
				print(" _________________________________________");
				print("|                                         |");
				print("|         1.���飻                                                                 |");
				print("|         2.���飻                                                                 |");
				print("|         3.�����޸ģ�                                                       |");
				print("|         4.��ѯ�������� ��                                            |");
				print("|        ������������˳���                                           |");
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
