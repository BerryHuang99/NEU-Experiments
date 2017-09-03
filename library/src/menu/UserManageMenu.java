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
			print("|         1.�����û���                                                       |");
			print("|         2.ɾ���û���                                                       |");
			print("|         3.�鿴��ǰ�����û���Ϣ��                         |");
			print("|        ��������������أ�                                           |");
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
