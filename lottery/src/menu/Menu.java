package menu;

public class Menu {
	public static void first(){
		table("1.�����Ʊ��\n2.������\n������������˳�����");
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
