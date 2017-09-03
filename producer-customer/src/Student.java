
public class Student {
	private String name = null;
	private int id = 0;
	
	public Student(String name, int id) {
		this.name  = name;
		this.id = id;
	}
	
	public String toString() {
		return name + "_" + id;
	}
}
