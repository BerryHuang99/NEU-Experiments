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
			print("|         1.新增图书；                                                       |");
			print("|         2.删除图示；                                                       |");
			print("|         3.查看当前图书信息。                                   |");
			print("|        （其他任意键返回）                                           |");
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
