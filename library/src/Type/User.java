package Type;

import java.util.ArrayList;

import Passwords.Passwords;

public class User extends Type {
	private Passwords password;
	private ArrayList<Book> borrow = new ArrayList<Book>();
	private boolean credit = true;
	
	public User(String name, long id, long password){
		super(name, id);
		this.password = new Passwords(password);
	}
	
	public void borrow(Book book){
		book.change();
		borrow.add(book);
	}
	
	public void returnBook(Book book){
		book.change();
		borrow.remove(book);
	}
	
	public void changePassword(long password){
		this.password.change(password);
	}
	
	public boolean check(long key){
		return password.check(key);
	}
	
	public Book searchB(String name){
		for (Book b : borrow) {
			if (b.getName().equals(name)) return b;
		}
		return null;
	}
	
	public Book searchB(long id){
		for (Book b : borrow){
			if (b.getId() == id) return b;
		}
		return null;
	}
	
	public boolean getCredit() {
		return credit;
	}
	
	public void change() {
		credit = !credit;
	}
}
