package menu;

import java.util.Scanner;

import Type.User;
import control.BookControl;

public class BookManageMenu implements Menu{
	private Scanner in = new Scanner(System.in);

	@Override
	public User handle(User u) {
		while (true) {
			print(" _________________________________________");
			print("|                                         |");
			print("|         1.����ͼ�飻                                                       |");
			print("|         2.ɾ��ͼʾ��                                                       |");
			print("|         3.�鿴��ǰͼ����Ϣ��                                   |");
			print("|        ��������������أ�                                           |");
			print("|_________________________________________|");			
			BookControl x = new BookControl();
			
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
	
public void print(String s){
	System.out.println(s);
}

}
