package lottery;

public enum Prize {
	NO("δ�н�",0),
	FIFTH("��Ƚ�",1),
	FOURTH("�ĵȽ�",2),
	THIRD("���Ƚ�",3),
	SECOND("���Ƚ�",4),
	FIRST("һ�Ƚ�",5);
	
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
