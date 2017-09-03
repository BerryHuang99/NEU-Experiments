package lottery;

public enum Prize {
	NO("未中奖",0),
	FIFTH("五等奖",1),
	FOURTH("四等奖",2),
	THIRD("三等奖",3),
	SECOND("二等奖",4),
	FIRST("一等奖",5);
	
	private String level;
	private int index;
	
	private Prize(String level, int index) {
		this.level = level;
		this.index = index;
	}
	
	public static String getLevel(int index) {
		for (Prize p : Prize.values()) {
			if (p.getIndex() == index) {
				return p.level;
			}
		}
		return null;
	}
	
	public int getIndex(){
		return index;
	}
	
}
