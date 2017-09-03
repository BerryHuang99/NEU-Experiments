package lottery;

import java.util.ArrayList;
import java.util.Scanner;

import menu.Menu;

public class App {
	private static Lottery lottery = new Lottery();
	private ArrayList<Customer> c = new ArrayList<Customer>();
	private static Scanner in = new Scanner(System.in);
	
	public static void main(String[] args) {
		App app = new App();
		System.out.println("��ӭ����28ѡ5��Ʊϵͳ��");
		
		while (true) {
			Menu.first();
			
			switch (in.nextInt()) {

			case 1 :
				System.out.println("������������Ҫ����ĺ��룡");
				Customer co = new Customer();
				co.setNum();
				app.c.add(co);
				System.out.println("����ɹ���");
				Menu.stop();
				break;
				
			case 2 :
				if (app.c.size() == 0) {
					System.out.println("�Բ���Ŀǰ��δ���˹����Ʊ���޷�������");
					Menu.stop();
					break;
				}
				App.lottery.setLottery();
				App.lottery.sort();
				System.out.println("��ǰ��������Ϊ��" + App.lottery.getLottery() + "\n");
				Menu.stop();
				
				for (Customer k : app.c) {
					k.cash(App.lottery.getLottery());
				}
				
				System.out.println("�ѹ������\t\t�н����");
				for (Customer k : app.c) {
					System.out.println(k.getNum() + "\t" + k.getLevel());
				}
				Menu.stop();				
				lottery.clear();
				app.c.clear();
				break;
				
			default :
				return;
			}
		}
	}

}
