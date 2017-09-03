package library;

import java.util.ArrayList;
import Type.*;
import menu.*
;

public class Library {
	private static ArrayList<Book> books = new ArrayList<Book>();
	private static ArrayList<User> users = new ArrayList<User>();
	private static User manager = new User("manager", 1, 123456);

	public static void main(String[] args) {
		mock();
		PasswordMenu passwordmenu = new PasswordMenu();
		User u = null;
		u = passwordmenu.handle(u);
		if (u == null) return;
		MainMenu mainmenu = new MainMenu();
		u = mainmenu.handle(u);
		if (u == null) return;
		
	}
	
	public static void mock(){
		users.add(manager);
		User u = new User("BerryWong",20155108,123456);
		users.add(u);
		users.add(manager);
		Book b = new Book("Java编程思想", 1);
		books.add(b);
		b = new Book("C和指针", 2);
		books.add(b);
	}
	
	public static User searchU(long i) {
		for (User u : users) {
			if (u.getId() == i) return u;
		}
		return null;
	}
	
	public static User searchU(String name) {
		for (User u : users) {
			if ( u.getName().equals(name)) return u;
		}
		return null;
	}
	
	public static Book searchB(long id) {
		for (Book b : books){
			if (b.getId() == id) return b;
		}
		return null;
	}
	
	public static Book searchB(String name){
		for (Book b : books){
			if (b.getName().equals(name)) return b;
		}
		return null;
	}
	
	public static void add(Book b){
		books.add(b);
	}
	
	public static void add(User u) {
		users.add(u);
	}
	
	public static boolean deleteB(long id){
		for (int i = 0; i < books.size(); i++) {			
			if (books.get(i).getId() == id) {
				books.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public static boolean deleteB(String name) {
		for (int i = 0; i < books.size(); i++) {
			if (books.get(i).getName().equals(name)) {
				books.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public static boolean deleteU(long id) {
		for (int i = 0; i < users.size(); i++) {
			if ( users.get(i).getId() == id) {
				users.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public static boolean deleteU(String name) {
		for (int i = 0; i < users.size(); i++) {
			if ( users.get(i).getName().equals(name)) {
				users.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public static ArrayList<Book> getBooks () {
		return books;
	}
	
	public static ArrayList<User> gerUsers () {
		return users;
	}

}
