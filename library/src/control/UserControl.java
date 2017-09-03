package control;

import java.util.Scanner;

import library.Library;
import Type.User;

public class UserControl implements Control{
	private static Scanner in = new Scanner(System.in);

	@Override
	public void delete() {
		print("请输入用户名或者账号：");
		String b = in.nextLine();
		
		if (!Library.deleteU(b)) {
			if (!Library.deleteU(Integer.valueOf(b))) {
				print("对不起！未找到相关用户！");
				return;
			}
		}
		print("图书删除成功!");
		
	}

	@Override
	public void set() {
		print("请输入用户名:");
		String name = in.nextLine();
		print("请输入账号：");
		long id = in.nextLong();
		print("请输入密码：");
		long password = in.nextLong();
		User u = new User(name, id, password);
		Library.add(u);
		
	}

	@Override
	public void print(String s) {
		System.out.println(s);
		
	}

	@Override
	public void list() {
		print("用户名\t\t账号");
		for (User u : Library.gerUsers()) {
			print(u.getName() + "\t\t" + u.getId());
		}
	}

}
