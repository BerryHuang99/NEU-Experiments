package menu;

public class Menu {
	public static void first(){
		table("1.购买彩票；\n2.开奖。\n（其它任意键退出！）");
	}
	
	public static void stop(){
		try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
	}
	
	private static void table(String menu){
		System.out.println("************************");
		System.out.println(menu);
		System.out.println("************************");
	}
}
