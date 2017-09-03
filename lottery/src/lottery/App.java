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
		System.out.println("欢迎进入28选5彩票系统！");
		
		while (true) {
			Menu.first();
			
			switch (in.nextInt()) {

			case 1 :
				System.out.println("请依次输入您要购买的号码！");
				Customer co = new Customer();
				co.setNum();
				app.c.add(co);
				System.out.println("购买成功！");
				Menu.stop();
				break;
				
			case 2 :
				if (app.c.size() == 0) {
					System.out.println("对不起！目前尚未有人购买彩票，无法开奖！");
					Menu.stop();
					break;
				}
				App.lottery.setLottery();
				App.lottery.sort();
				System.out.println("当前开奖号码为：" + App.lottery.getLottery() + "\n");
				Menu.stop();
				
				for (Customer k : app.c) {
					k.cash(App.lottery.getLottery());
				}
				
				System.out.println("已购买号码\t\t中奖情况");
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
