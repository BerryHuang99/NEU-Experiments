package Passwords;

public class Passwords {
	private long password = 0;
	
	public Passwords(long password) {
		this.password = password;
	}
	
	public void change(long password) {
		this.password = password;
	}
	
	public boolean check(long key) {
		if (key == password) return true;
		else return false;
	}
}
