package lottery;

import java.util.ArrayList;
import java.util.HashSet;

public class Lottery {
	private static ArrayList<Integer> lottery = new ArrayList<Integer>();
	
	public void setLottery() {
		HashSet<Integer> lo = new HashSet<Integer>();
		
		while (lo.size() < 5) {
			int l = 0;
			l = (int)(28 * Math.random() + 1);
			lo.add(l);
		}
		// 产生五个0——28的无重复的随机数
		for (int k : lo) {
			lottery.add(k);
		}
	}
	
	public void sort() {
		for (int i = 0; i <lottery.size(); i++) {
			for (int j = i + 1; j < lottery.size(); j++) {
				int c = 0;
				if (lottery.get(i).compareTo(lottery.get(j)) >0) {
					c = lottery.get(j);
					lottery.set(j, lottery.get(i));
					lottery.set(i, c);
				}
			}
		}
	}
	
	public void clear() {
		lottery.clear();
	}
	
	public ArrayList<Integer> getLottery() {
		return lottery;
	}

}
