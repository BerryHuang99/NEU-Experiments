package control;

import java.util.Scanner;

import library.Library;
import Type.User;

public class UserControl implements Control{
	private static Scanner in = new Scanner(System.in);

	@Override
	public void delete() {
		print("�������û��������˺ţ�");
		String b = in.nextLine();
		
		if (!Library.deleteU(b)) {
			if (!Library.deleteU(Integer.valueOf(b))) {
				print("�Բ���δ�ҵ�����û���");
				return;
			}
		}
		print("ͼ��ɾ���ɹ�!");
		
	}

	@Override
	public void set() {
		print("�������û���:");
		String name = in.nextLine();
		print("�������˺ţ�");
		long id = in.nextLong();
		print("���������룺");
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
		print("�û���\t\t�˺�");
		for (User u : Library.gerUsers()) {
			print(u.getName() + "\t\t" + u.getId());
		}
	}

}
