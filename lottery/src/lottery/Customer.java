package lottery;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.TreeSet;

public class Customer {
	private TreeSet<Integer> num = new TreeSet<Integer>();
	private String level;
	private Scanner in = new Scanner(System.in);
	
	public void setNum() {
		int i = 0;
		
		while (num.size() < 5) {
			i = in.nextInt();
			if (!check(i)) {
				System.out.println("对不起，您输入的号码超出规定范围或者与之前输入号码重复！请重新输入！");
				continue;
			}
			num.add(i);
		}
	}
	
	public boolean check(int i) {
		if (i > 28 || i < 0) return false;
		for ( int k : num){
			if (i == k) return false;
		}
		return true;
	}

	public void cash(ArrayList<Integer> lottery) {
		int index = 0;
		for (int i : num) {
			for (int k : lottery) {
				if (i == k) {
					index++;
					break;
				}
			}
		}
		level = Prize.getLevel(index);
	}
	
	public ArrayList<Integer> getNum() {
		ArrayList<Integer> i = new ArrayList<Integer>();
		for (int k : num){
			i.add(k);
		}
		return i;
	}
	
	public String getLevel() {
		return level;
	}
	
}
