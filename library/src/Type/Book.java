package Type;

import java.util.Date;;

public class Book extends Type {
	private String lenddate;
	private boolean lend = false;
	
	public Book(String name, long id) {
		super(name, id);
	}
	
	public void setLendDate(){
		Date d = new Date();
		d.getTime();
		lenddate =  d.toString();
	}
	
	public String getLendDat(){
		return lenddate;
	}
	
	public void change(){
		lend = !lend;
	}
	
	public boolean getLend(){
		return lend;
	}
	
	public void print(){
		System.out.println(getName() + "\t\t" + getId());
	}
}
